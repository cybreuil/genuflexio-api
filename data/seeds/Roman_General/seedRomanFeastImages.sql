BEGIN;

-- =========================================================
-- Roman feast cover images (ROMAN_GENERAL)
-- =========================================================
-- Cover illustration for feasts that have no saint (Easter, Christmas…).
-- When a feast has a saint, the front falls back on the saint's image,
-- so only feasts listed here need a cover.
--
-- Convention: image_url served from /public, stored as /feasts/...
--
-- HOW TO FILL A LINE
--   Part 1 : replace the TODO fields (title, type, creator, date, century, repository…)
--   Part 2 : nothing to do, the image_url must simply match Part 1
--   Then uncomment both lines.
--
-- Feasts sharing an image (octave days, Sundays of a season) point to the
-- same image_url in Part 2; the image is inserted only once in Part 1.
-- =========================================================


-- =============================================================
-- PART 1 : IMAGES (unique artworks)
-- =============================================================

INSERT INTO images (
  image_url,
  title,
  image_type,
  alt_text,
  creator,
  date_label,
  century,
  repository,
  credit,
  license,
  source_url
) VALUES

-- =========================
-- Fixed feasts of the Lord
-- =========================
('/feasts/holy-name-of-jesus.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/epiphany.webp',                'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/baptism-of-the-lord.webp',     'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/presentation-of-the-lord.webp','TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/annunciation.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/transfiguration.webp',         'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/exaltation-of-the-cross.webp', 'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Christmas time
-- =========================
-- ('/feasts/christmas-vigil.webp',         'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/nativity.webp',                'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/holy-family.webp',             'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/christmas-octave.webp',        'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Advent (one shared image for the 4 Sundays + Dec 24)
-- =========================
-- ('/feasts/advent.webp',                  'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Lent
-- =========================
-- ('/feasts/ash-wednesday.webp',           'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/lent.webp',                    'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Holy Week / Triduum
-- =========================
-- ('/feasts/palm-sunday.webp',             'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/holy-week.webp',               'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/good-friday.webp',             'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/holy-saturday.webp',           'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/easter-vigil.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Easter time
-- =========================
-- ('/feasts/resurrection.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/easter-octave.webp',           'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/divine-mercy.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/good-shepherd.webp',           'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/easter-season.webp',           'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/ascension.webp',               'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/pentecost.webp',               'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Movable solemnities after Pentecost
-- =========================
-- ('/feasts/holy-trinity.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/corpus-christi.webp',          'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/sacred-heart.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/christ-the-king.webp',         'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Marian feasts
-- =========================
-- ('/feasts/mary-mother-of-god.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-lourdes.webp',     'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-fatima.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/visitation.webp',              'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-mount-carmel.webp','TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/assumption.webp',              'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/queenship-of-mary.webp',       'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/nativity-of-mary.webp',        'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/holy-name-of-mary.webp',       'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-sorrows.webp',     'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-the-rosary.webp',  'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/presentation-of-mary.webp',    'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/immaculate-conception.webp',   'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-loreto.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-guadalupe.webp',   'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/mary-mother-of-the-church.webp','TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/immaculate-heart-of-mary.webp','TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Dedications
-- =========================
-- ('/feasts/saint-mary-major.webp',        'TODO title', 'photograph', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/lateran-basilica.webp',        'TODO title', 'photograph', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/basilicas-peter-and-paul.webp','TODO title', 'photograph', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Other
-- =========================
-- ('/feasts/guardian-angels.webp',         'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/all-souls.webp',               'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- Placeholder so the VALUES list is never empty. Delete once a real image is added.
('/feasts/__placeholder__.webp', '__placeholder__', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

ON CONFLICT (image_url) DO NOTHING;


-- =============================================================
-- PART 2 : FEAST -> COVER IMAGE
-- =============================================================

UPDATE feasts f
SET cover_image_id = i.id
FROM (
    VALUES
    -- (feast_slug, image_url)

    -- Fixed feasts of the Lord
    -- ('the-most-holy-name-of-jesus',       '/feasts/holy-name-of-jesus.webp'),
    -- ('the-epiphany-of-the-lord',          '/feasts/epiphany.webp'),
    -- ('the-baptism-of-the-lord',           '/feasts/baptism-of-the-lord.webp'),
    -- ('the-presentation-of-the-lord',      '/feasts/presentation-of-the-lord.webp'),
    -- ('the-annunciation-of-the-lord',      '/feasts/annunciation.webp'),
    -- ('the-transfiguration-of-the-lord',   '/feasts/transfiguration.webp'),
    -- ('the-exaltation-of-the-holy-cross',  '/feasts/exaltation-of-the-cross.webp'),

    -- Christmas time
    -- ('christmas-vigil',                          '/feasts/christmas-vigil.webp'),
    -- ('nativity-of-the-lord',                     '/feasts/nativity.webp'),
    -- ('the-holy-family-of-jesus-mary-and-joseph', '/feasts/holy-family.webp'),
    -- ('sixth-day-in-the-octave-of-christmas',     '/feasts/christmas-octave.webp'),

    -- Advent
    -- ('first-sunday-of-advent',   '/feasts/advent.webp'),
    -- ('second-sunday-of-advent',  '/feasts/advent.webp'),
    -- ('third-sunday-of-advent',   '/feasts/advent.webp'),
    -- ('fourth-sunday-of-advent',  '/feasts/advent.webp'),
    -- ('december-24-advent-feria', '/feasts/advent.webp'),

    -- Lent
    -- ('ash-wednesday',                '/feasts/ash-wednesday.webp'),
    -- ('thursday-after-ash-wednesday', '/feasts/lent.webp'),
    -- ('friday-after-ash-wednesday',   '/feasts/lent.webp'),
    -- ('saturday-after-ash-wednesday', '/feasts/lent.webp'),
    -- ('first-sunday-of-lent',         '/feasts/lent.webp'),
    -- ('second-sunday-of-lent',        '/feasts/lent.webp'),
    -- ('third-sunday-of-lent',         '/feasts/lent.webp'),
    -- ('fourth-sunday-of-lent',        '/feasts/lent.webp'),
    -- ('fifth-sunday-of-lent',         '/feasts/lent.webp'),

    -- Holy Week / Triduum
    -- ('palm-sunday-of-the-passion-of-the-lord', '/feasts/palm-sunday.webp'),
    -- ('monday-of-holy-week',                    '/feasts/holy-week.webp'),
    -- ('tuesday-of-holy-week',                   '/feasts/holy-week.webp'),
    -- ('wednesday-of-holy-week',                 '/feasts/holy-week.webp'),
    -- ('friday-of-the-passion-of-the-lord',      '/feasts/good-friday.webp'),
    -- ('holy-saturday',                          '/feasts/holy-saturday.webp'),
    -- ('easter-vigil-in-the-holy-night',         '/feasts/easter-vigil.webp'),

    -- Easter time
    -- ('easter-sunday-of-the-resurrection-of-the-lord', '/feasts/resurrection.webp'),
    -- ('monday-in-the-octave-of-easter',                '/feasts/easter-octave.webp'),
    -- ('tuesday-in-the-octave-of-easter',               '/feasts/easter-octave.webp'),
    -- ('wednesday-in-the-octave-of-easter',             '/feasts/easter-octave.webp'),
    -- ('thursday-in-the-octave-of-easter',              '/feasts/easter-octave.webp'),
    -- ('friday-in-the-octave-of-easter',                '/feasts/easter-octave.webp'),
    -- ('saturday-in-the-octave-of-easter',              '/feasts/easter-octave.webp'),
    -- ('second-sunday-of-easter-divine-mercy-sunday',   '/feasts/divine-mercy.webp'),
    -- ('third-sunday-of-easter',                        '/feasts/easter-season.webp'),
    -- ('fourth-sunday-of-easter',                       '/feasts/good-shepherd.webp'),
    -- ('fifth-sunday-of-easter',                        '/feasts/easter-season.webp'),
    -- ('sixth-sunday-of-easter',                        '/feasts/easter-season.webp'),
    -- ('seventh-sunday-of-easter',                      '/feasts/easter-season.webp'),
    -- ('the-ascension-of-the-lord',                     '/feasts/ascension.webp'),
    -- ('pentecost-sunday',                              '/feasts/pentecost.webp'),

    -- Movable solemnities after Pentecost
    -- ('the-most-holy-trinity',                     '/feasts/holy-trinity.webp'),
    -- ('the-most-holy-body-and-blood-of-christ',    '/feasts/corpus-christi.webp'),
    -- ('the-most-sacred-heart-of-jesus',            '/feasts/sacred-heart.webp'),
    -- ('our-lord-jesus-christ-king-of-the-universe','/feasts/christ-the-king.webp'),

    -- Marian feasts
    -- ('solemnity-of-mary-the-holy-mother-of-god',          '/feasts/mary-mother-of-god.webp'),
    -- ('our-lady-of-lourdes',                                '/feasts/our-lady-of-lourdes.webp'),
    -- ('our-lady-of-fatima',                                 '/feasts/our-lady-of-fatima.webp'),
    -- ('the-visitation-of-the-blessed-virgin-mary',          '/feasts/visitation.webp'),
    -- ('our-lady-of-mount-carmel',                           '/feasts/our-lady-of-mount-carmel.webp'),
    -- ('the-assumption-of-the-blessed-virgin-mary',          '/feasts/assumption.webp'),
    -- ('the-queenship-of-the-blessed-virgin-mary',           '/feasts/queenship-of-mary.webp'),
    -- ('the-nativity-of-the-blessed-virgin-mary',            '/feasts/nativity-of-mary.webp'),
    -- ('the-most-holy-name-of-mary',                         '/feasts/holy-name-of-mary.webp'),
    -- ('our-lady-of-sorrows',                                '/feasts/our-lady-of-sorrows.webp'),
    -- ('our-lady-of-the-rosary',                             '/feasts/our-lady-of-the-rosary.webp'),
    -- ('the-presentation-of-the-blessed-virgin-mary',        '/feasts/presentation-of-mary.webp'),
    -- ('the-immaculate-conception-of-the-blessed-virgin-mary','/feasts/immaculate-conception.webp'),
    -- ('our-lady-of-loreto',                                 '/feasts/our-lady-of-loreto.webp'),
    -- ('our-lady-of-guadalupe',                              '/feasts/our-lady-of-guadalupe.webp'),
    -- ('blessed-virgin-mary-mother-of-the-church',           '/feasts/mary-mother-of-the-church.webp'),
    -- ('the-immaculate-heart-of-the-blessed-virgin-mary',    '/feasts/immaculate-heart-of-mary.webp'),

    -- Dedications
    -- ('the-dedication-of-the-basilica-of-saint-mary-major',               '/feasts/saint-mary-major.webp'),
    -- ('the-dedication-of-the-lateran-basilica',                           '/feasts/lateran-basilica.webp'),
    -- ('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles','/feasts/basilicas-peter-and-paul.webp'),

    -- Other
    -- ('the-holy-guardian-angels',                     '/feasts/guardian-angels.webp'),
    -- ('the-commemoration-of-all-the-faithful-departed','/feasts/all-souls.webp'),

    -- Placeholder so the VALUES list is never empty; matches no feast.
    ('__placeholder__', '__placeholder__')
) AS x(feast_slug, image_url)
JOIN images i ON i.image_url = x.image_url
WHERE f.slug = x.feast_slug;

-- Remove the placeholder image so it never shows up in the gallery
DELETE FROM images WHERE image_url = '/feasts/__placeholder__.webp';

COMMIT;
