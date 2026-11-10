
-- =========================
-- French Calendar – Saint Images
-- =========================

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

-- Saint Genevieve (JAN 3)
('saint-genevieve', '/images/saints/fr/saint-genevieve.webp', 1, TRUE, 'subject'),
('saint-genevieve', '/images/saints/fr/saint-genevieve_le-brun.webp', 2, FALSE, 'subject'),
('saint-genevieve', '/images/saints/fr/saint-genevieve_gustafson.webp', 3, FALSE, 'subject'),
('saint-genevieve', '/images/saints/fr/saint-genevieve_laurens.webp', 4, FALSE, 'subject'),
('saint-genevieve', '/images/saints/fr/saint-genevieve_delauney.webp', 5, FALSE, 'subject'),

-- Saint Remigius (JAN 15)
('saint-remigius', '/images/saints/fr/saint-remigius.webp', 1, TRUE, 'subject'),
('saint-remigius', '/images/saints/fr/saint-remigius_clovis.webp', 2, FALSE, 'subject'),
('saint-remigius', '/images/saints/fr/saint-remigius_wine.webp', 3, FALSE, 'subject'),

-- Saint Bernadette Soubirous (FEB 18)
('saint-bernadette-soubirous', '/images/saints/fr/saint-bernadette-soubirous.webp', 1, TRUE, 'subject'),
('saint-bernadette-soubirous', '/images/saints/fr/saint-bernadette-soubirous_2.webp', 2, FALSE, 'subject'),
('saint-bernadette-soubirous', '/images/saints/fr/saint-bernadette-soubirous_3.webp', 3, FALSE, 'subject'),

-- Saint Ivo of Kermartin (MAY 19)
('saint-ivo-of-kermartin', '/images/saints/fr/saint-ivo-of-kermartin_weyden.webp', 1, TRUE, 'subject'),
('saint-ivo-of-kermartin', '/images/saints/fr/saint-ivo-of-kermartin_jordaens.webp', 2, FALSE, 'subject'),
('saint-ivo-of-kermartin', '/images/saints/fr/saint-ivo-of-kermartin_empoli.webp', 3, FALSE, 'subject'),

-- Saint Joan of Arc (MAY 30)
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_thirion.webp', 1, TRUE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_lenepveu.webp', 2, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_lenepveu_2.webp', 3, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_lenepveu_3.webp', 4, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_lenepveu_4.webp', 5, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_lynch.webp', 6, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_millais.webp', 7, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_scherrer.webp', 8, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_stilke.webp', 9, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_stilke_2.webp', 10, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_benouville.webp', 11, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_hillingford.webp', 12, FALSE, 'subject'),
('saint-joan-of-arc', '/images/saints/fr/saint-joan-of-arc_gasparo.webp', 13, FALSE, 'subject'),

-- Saint Pothinus (JUN 2)
('saint-pothinus', '/images/saints/fr/saint-pothinus.webp', 1, TRUE, 'subject'),
('saint-pothinus', '/images/saints/fr/saint-pothinus_stained-glass.webp', 2, FALSE, 'subject'),

-- Saint Blandina (JUN 2)
('saint-blandina', '/images/saints/fr/saint-blandina_bayard.webp', 1, TRUE, 'subject'),
('saint-blandina', '/images/saints/fr/saint-blandina_guillemet.webp', 2, FALSE, 'subject'),
('saint-blandina', '/images/saints/fr/saint-blandina_stained-glass.webp', 3, FALSE, 'subject'),

-- Saint Clotilde (JUN 4)
('saint-clotilde', '/images/saints/fr/saint-clotilde.webp', 1, TRUE, 'subject'),
('saint-clotilde', '/images/saints/fr/saint-clotilde_loo.webp', 2, FALSE, 'subject'),
('saint-clotilde', '/images/saints/fr/saint-clotilde_deveria.webp', 3, FALSE, 'subject'),

-- Saint Caesarius of Arles (AUG 27)
('saint-caesarius-of-arles', '/images/saints/fr/saint-caesarius-of-arles_icon.webp', 1, TRUE, 'subject')

) AS x(
   saint_slug,
   image_url,
   sort_order,
   is_primary,
   subject_role
)
ON s.slug = x.saint_slug
JOIN images i
   ON i.image_url = x.image_url
ON CONFLICT (saint_id, image_id) DO NOTHING;

COMMIT;
