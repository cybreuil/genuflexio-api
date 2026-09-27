BEGIN;

INSERT INTO saint_images (
    saint_id,
    image_id,
    sort_order,
    is_primary,
    subject_role
)
SELECT
    s.id,
    i.id,
    x.sort_order,
    x.is_primary,
    x.subject_role
FROM saints s
JOIN (
	VALUES


-- Blessed Gonçalo de Amarante
-- ('saint-mary', '/saints/saint-mary_tiepolo.webp', 1, TRUE, 'subject'),
('blessed-goncalo-de-amarante', '/saints/pt/blessed-goncalo-de-amarante_andre.webp', 1, TRUE, 'subject'),
('blessed-goncalo-de-amarante', '/saints/pt/blessed-goncalo-de-amarante.webp', 2, FALSE, 'subject'),

-- Saint John de Brito
('saint-john-de-brito', '/saints/pt/saint-john-de-brito.webp', 1, TRUE, 'subject'),
('saint-john-de-brito', '/saints/pt/saint-john-de-brito_martyr.webp', 2, FALSE, 'subject'),

-- Saint Theotonius
('saint-theotonius', '/saints/pt/saint-theotonius_goncalves.webp', 1, TRUE, 'subject'),
('saint-theotonius', '/saints/pt/saint-theotonius_goncalves_2.webp', 2, FALSE, 'subject'),

-- Saint Jacinta Marto
('saint-jacinta-marto', '/saints/pt/saint-jacinta-marto.webp', 1, TRUE, 'subject'),
('saint-jacinta-marto', '/saints/pt/saint-jacinta-marto-&-lucia-santos.webp', 2, FALSE, 'subject'),
('saint-jacinta-marto', '/saints/pt/saint-francisco-&-jacinta-marto.webp', 3, FALSE, 'subject'),

-- Saint Francisco Marto
('saint-francisco-marto', '/saints/pt/saint-francisco-marto.webp', 1, TRUE, 'subject'),
('saint-francisco-marto', '/saints/pt/saint-francisco-&-jacinta-marto.webp', 2, FALSE, 'subject'),

-- Blessed Joan of Portugal
('blessed-joan-of-portugal', '/saints/pt/blessed-joan-of-portugal_goncalves.webp', 1, TRUE, 'subject'),
('blessed-joan-of-portugal', '/saints/pt/blessed-joan-of-portugal.webp', 2, FALSE, 'subject'),

-- Blessed Sancha of Portugal
('blessed-sancha-of-portugal', '/saints/pt/blessed-sancha-of-portugal_holanda.webp', 1, TRUE, 'subject'),
('blessed-sancha-of-portugal', '/saints/pt/blessed-sancha-of-portugal.webp', 2, FALSE, 'subject'),

-- Blessed Mafalda of Portugal
('blessed-mafalda-of-portugal', '/saints/pt/blessed-mafalda-of-portugal.webp', 1, TRUE, 'subject'),
('blessed-mafalda-of-portugal', '/saints/pt/blessed-mafalda-of-portugal_odazzi.webp', 2, FALSE, 'subject'),
('blessed-mafalda-of-portugal', '/saints/pt/blessed-mafalda-of-portugal_holanda.webp', 3, FALSE, 'subject'),

-- Blessed Theresa of Portugal
('blessed-theresa-of-portugal', '/saints/pt/blessed-theresa-of-portugal_holanda.webp', 1, TRUE, 'subject'),

-- Blessed Inácio de Azevedo
('blessed-inacio-de-azevedo', '/saints/pt/blessed-inacio-de-azevedo.webp', 1, TRUE, 'subject'),
('blessed-inacio-de-azevedo', '/saints/pt/blessed-inacio-de-azevedo_2.webp', 2, FALSE, 'subject'),
('blessed-inacio-de-azevedo', '/saints/pt/blessed-inacio-de-azevedo_3.webp', 3, FALSE, 'subject'),

-- Blessed Bartholomew of the Martyrs
('blessed-bartholomew-of-the-martyrs', '/saints/pt/blessed-bartholomew-of-the-martyrs_andre.webp', 1, TRUE, 'subject'),
('blessed-bartholomew-of-the-martyrs', '/saints/pt/blessed-bartholomew-of-the-martyrs.webp', 2, FALSE, 'subject'),
('blessed-bartholomew-of-the-martyrs', '/saints/pt/blessed-bartholomew-of-the-martyrs_2.webp', 3, FALSE, 'subject'),

-- Saint Beatrice of Silva
('saint-beatrice-of-silva', '/saints/pt/saint-beatrice-of-silva.webp', 1, TRUE, 'subject'),
('saint-beatrice-of-silva', '/saints/pt/saint-beatrice-of-silva_2.webp', 2, FALSE, 'subject'),
('saint-beatrice-of-silva', '/saints/pt/saint-beatrice-of-silva_3.webp', 3, FALSE, 'subject'),

-- Blessed Gonçalo de Lagos
('blessed-goncalo-de-lagos', '/saints/pt/blessed-goncalo-de-lagos.webp', 1, TRUE, 'subject'),

-- Saint Nuno of Saint Mary
('saint-nuno-of-saint-mary', '/saints/pt/saint-nuno-of-saint-mary.webp', 1, TRUE, 'subject'),
('saint-nuno-of-saint-mary', '/saints/pt/saint-nuno-of-saint-mary_2.webp', 2, FALSE, 'subject'),

-- Saint Martin of Dume
('saint-martin-of-dume', '/saints/pt/saint-martin-of-dume.webp', 1, TRUE, 'subject'),
('saint-martin-of-dume', '/saints/pt/saint-martin-of-dume_2.webp', 2, FALSE, 'subject'),
('saint-martin-of-dume', '/saints/pt/saint-martin-of-dume_3.webp', 3, FALSE, 'subject'),

-- Saint Gerald of Braga
('saint-gerald-of-braga', '/saints/pt/saint-gerald-of-braga.webp', 1, TRUE, 'subject'),
('saint-gerald-of-braga', '/saints/pt/saint-gerald-of-braga_2.webp', 2, FALSE, 'subject')

) AS x (saint_slug, image_url, sort_order, is_primary, subject_role)
ON s.slug = x.saint_slug
JOIN images i ON i.image_url = x.image_url
ON CONFLICT (saint_id, image_id) DO NOTHING;

COMMIT;
