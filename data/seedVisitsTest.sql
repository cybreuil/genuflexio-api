BEGIN;

-- =========================================================
-- TEST DATA : visits
-- =========================================================
-- Generates ~90 days of realistic-looking visits to check the admin
-- analytics dashboard (GET /visits, GET /visits/stats).
--
-- NOT part of db-reset.sh. Run manually:
--   psql "$DATABASE_URL" -f data/seedVisitsTest.sql
--
-- Re-runnable: wipes the table first.
-- =========================================================

TRUNCATE visits RESTART IDENTITY;

-- Random but reproducible
SELECT setseed(0.42);

WITH
pool_ips AS (
    -- 120 distinct "visitors"
    SELECT n, format('%s.%s.%s.%s', 80 + (n % 100), (n * 7) % 256, (n * 13) % 256, (n * 17) % 256) AS ip
    FROM generate_series(1, 120) n
),
pool_countries AS (
    SELECT * FROM (VALUES
        ('FR', 'France',         0.45),
        ('BE', 'Belgium',        0.10),
        ('CH', 'Switzerland',    0.08),
        ('CA', 'Canada',         0.08),
        ('US', 'United States',  0.07),
        ('ES', 'Spain',          0.06),
        ('PT', 'Portugal',       0.05),
        ('PL', 'Poland',         0.04),
        ('IT', 'Italy',          0.04),
        ('GB', 'United Kingdom', 0.03)
    ) AS c(code, name, weight)
),
pool_paths AS (
    SELECT * FROM (VALUES
        ('/',                          0.40),
        ('/celebration/2026-10-15',    0.10),
        ('/celebration/2026-11-01',    0.10),
        ('/celebration/2026-11-02',    0.08),
        ('/saints',                    0.08),
        ('/saints/saint-mary',         0.06),
        ('/saints/saint-joseph',       0.05),
        ('/saints/saint-therese-of-lisieux', 0.05),
        ('/about',                     0.04),
        ('/calendars',                 0.04)
    ) AS p(path, weight)
),
pool_referrers AS (
    SELECT * FROM (VALUES
        (NULL::text,                        0.55),
        ('https://www.google.com/',         0.25),
        ('https://duckduckgo.com/',         0.05),
        ('https://www.bing.com/',           0.04),
        ('https://t.co/',                   0.04),
        ('https://www.facebook.com/',       0.04),
        ('https://fr.wikipedia.org/',       0.03)
    ) AS r(referrer, weight)
),
pool_ua AS (
    -- (device, browser, os, user_agent, weight)
    SELECT * FROM (VALUES
        ('desktop', 'Chrome',  'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36', 0.28),
        ('desktop', 'Firefox', 'Linux',   'Mozilla/5.0 (X11; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0', 0.08),
        ('desktop', 'Safari',  'macOS',   'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15', 0.10),
        ('desktop', 'Edge',    'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36 Edg/130.0', 0.06),
        ('mobile',  'Safari',  'iOS',     'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1', 0.24),
        ('mobile',  'Chrome',  'Android', 'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Mobile Safari/537.36', 0.16),
        ('mobile',  'Samsung Internet', 'Android', 'Mozilla/5.0 (Linux; Android 14; SM-S918B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/26.0 Chrome/122.0 Mobile Safari/537.36', 0.03),
        ('tablet',  'Safari',  'iOS',     'Mozilla/5.0 (iPad; CPU OS 17_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1', 0.04),
        ('unknown', NULL,      NULL,      NULL, 0.01)
    ) AS u(device, browser, os, user_agent, weight)
),
pool_languages AS (
    SELECT * FROM (VALUES ('fr', 0.70), ('en', 0.15), ('es', 0.06), ('pt', 0.04), ('pl', 0.03), ('la', 0.02)) AS l(code, weight)
),
-- Weighted pick helper: cumulative weight per pool
w_countries  AS (SELECT *, SUM(weight) OVER (ORDER BY weight DESC, code) AS cum FROM pool_countries),
w_paths      AS (SELECT *, SUM(weight) OVER (ORDER BY weight DESC, path) AS cum FROM pool_paths),
w_referrers  AS (SELECT *, SUM(weight) OVER (ORDER BY weight DESC, referrer NULLS FIRST) AS cum FROM pool_referrers),
w_ua         AS (SELECT *, SUM(weight) OVER (ORDER BY weight DESC, device, browser) AS cum FROM pool_ua),
w_languages  AS (SELECT *, SUM(weight) OVER (ORDER BY weight DESC, code) AS cum FROM pool_languages),

-- One row per visit. Volume ramps up over the last 90 days, with a weekend bump
-- and more traffic around Nov 1-2 (All Saints / All Souls).
days AS (
    SELECT d::date AS day,
           -- base grows from ~8/day to ~30/day over the range
           (8 + 22 * (89 - (CURRENT_DATE - d::date))::numeric / 89)
           * CASE WHEN EXTRACT(ISODOW FROM d) IN (6, 7) THEN 1.4 ELSE 1.0 END
           * CASE WHEN to_char(d, 'MM-DD') IN ('11-01', '11-02') THEN 2.5 ELSE 1.0 END
           AS expected
    FROM generate_series(CURRENT_DATE - 89, CURRENT_DATE, '1 day') d
),
visits_raw AS (
    SELECT
        day,
        -- Poisson-ish count around `expected`
        generate_series(1, GREATEST(1, round(expected * (0.6 + random() * 0.8))::int)) AS k
    FROM days
),
visits_rand AS (
    SELECT
        day,
        random() AS r_ip,
        random() AS r_country,
        random() AS r_path,
        random() AS r_ref,
        random() AS r_ua,
        random() AS r_lang,
        random() AS r_time,
        random() AS r_theme
    FROM visits_raw
),
visits_built AS (
    SELECT
        -- spread within the day, slightly biased toward evening
        (day + (interval '1 hour' * (6 + power(r_time, 0.7) * 17)) + (interval '1 minute' * floor(random() * 60)))::timestamptz AS visited_at,
        -- heavy-tailed IP pick: a few visitors come back often
        (SELECT ip FROM pool_ips WHERE n = 1 + floor(power(r_ip, 2) * 120)::int) AS ip,
        (SELECT code FROM w_countries WHERE cum >= r_country ORDER BY cum LIMIT 1) AS country_code,
        (SELECT name FROM w_countries WHERE cum >= r_country ORDER BY cum LIMIT 1) AS country_name,
        (SELECT device     FROM w_ua WHERE cum >= r_ua ORDER BY cum LIMIT 1) AS device,
        (SELECT browser    FROM w_ua WHERE cum >= r_ua ORDER BY cum LIMIT 1) AS browser,
        (SELECT os         FROM w_ua WHERE cum >= r_ua ORDER BY cum LIMIT 1) AS os,
        (SELECT user_agent FROM w_ua WHERE cum >= r_ua ORDER BY cum LIMIT 1) AS user_agent,
        (SELECT path     FROM w_paths     WHERE cum >= r_path ORDER BY cum LIMIT 1) AS path,
        (SELECT referrer FROM w_referrers WHERE cum >= r_ref  ORDER BY cum LIMIT 1) AS referrer,
        (SELECT code     FROM w_languages WHERE cum >= r_lang ORDER BY cum LIMIT 1) AS language,
        CASE WHEN r_theme < 0.65 THEN 'light' ELSE 'dark' END AS theme
    FROM visits_rand
),
visits_enriched AS (
    SELECT
        vb.*,
        CASE country_code
            WHEN 'FR' THEN 'Europe/Paris'
            WHEN 'BE' THEN 'Europe/Brussels'
            WHEN 'CH' THEN 'Europe/Zurich'
            WHEN 'CA' THEN 'America/Montreal'
            WHEN 'US' THEN 'America/New_York'
            WHEN 'ES' THEN 'Europe/Madrid'
            WHEN 'PT' THEN 'Europe/Lisbon'
            WHEN 'PL' THEN 'Europe/Warsaw'
            WHEN 'IT' THEN 'Europe/Rome'
            WHEN 'GB' THEN 'Europe/London'
        END AS timezone,
        CASE device
            WHEN 'mobile'  THEN 390
            WHEN 'tablet'  THEN 820
            WHEN 'desktop' THEN 1440
            ELSE NULL
        END AS screen_width,
        CASE country_code
            WHEN 'FR' THEN (ARRAY['Paris', 'Lyon', 'Marseille', 'Toulouse', 'Nantes', 'Bordeaux', NULL])[1 + floor(random() * 7)::int]
            WHEN 'BE' THEN (ARRAY['Brussels', 'Liège', 'Namur', NULL])[1 + floor(random() * 4)::int]
            WHEN 'CA' THEN (ARRAY['Montréal', 'Québec', NULL])[1 + floor(random() * 3)::int]
            WHEN 'US' THEN (ARRAY['New York', 'Chicago', 'Boston', NULL])[1 + floor(random() * 4)::int]
            ELSE NULL
        END AS city,
        -- first time this IP shows up in the generated data
        ROW_NUMBER() OVER (PARTITION BY ip ORDER BY visited_at) = 1 AS is_new_visitor
    FROM visits_built vb
)
INSERT INTO visits (
    visited_at, ip, country_code, country_name, city,
    device, browser, os, user_agent,
    path, referrer, language, timezone, screen_width, theme,
    is_new_visitor
)
SELECT
    visited_at, ip, country_code, country_name, city,
    device, browser, os, user_agent,
    path, referrer, language, timezone, screen_width, theme,
    is_new_visitor
FROM visits_enriched
WHERE visited_at <= now()
ORDER BY visited_at;

-- Quick sanity check
SELECT
    COUNT(*)                                        AS total_visits,
    COUNT(DISTINCT ip)                              AS unique_visitors,
    COUNT(*) FILTER (WHERE visited_at::date = CURRENT_DATE) AS today,
    COUNT(*) FILTER (WHERE is_new_visitor)          AS new_visitors,
    MIN(visited_at)::date                           AS first_day,
    MAX(visited_at)::date                           AS last_day
FROM visits;

COMMIT;
