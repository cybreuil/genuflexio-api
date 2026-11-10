BEGIN;

-- =============================================================
-- Only Our Lady of La Salette feast cover image (ROMAN_FRANCE)
-- =============================================================

UPDATE feasts f
SET cover_image_id = i.id
FROM (
    VALUES

    ('the-five-wounds-of-christ', '/images/feasts/the-five-wounds-of-christ.webp'),
    ('guardian-angel-of-portugal', '/images/feasts/angel-guardian.webp')

) AS x(feast_slug, image_url)
JOIN images i ON i.image_url = x.image_url
WHERE f.slug = x.feast_slug;


COMMIT;
