BEGIN;

-- =============================================================
-- Only Our Lady of La Salette feast cover image (ROMAN_FRANCE)
-- =============================================================

UPDATE feasts f
SET cover_image_id = i.id
FROM (
    VALUES

    ('our-lady-of-mercy', '/feasts/our-lady-of-mercy.webp'),
	('our-lady-of-the-pillar', '/feasts/our-lady-of-the-pillar.webp'),
	('jesus-christ-the-eternal-high-priest', '/feasts/jesus-christ-the-eternal-high-priest.webp')
) AS x(feast_slug, image_url)
JOIN images i ON i.image_url = x.image_url
WHERE f.slug = x.feast_slug;


COMMIT;
