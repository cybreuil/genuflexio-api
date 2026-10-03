BEGIN;

-- =========================================================
-- Roman FRANCE saints images
-- =========================================================
-- Convention:
-- - image_url served from /public (store as /saints/fr/...)
-- - images table: one row per unique artwork
-- - saint_images: junction table allowing one image to be linked to multiple saints
-- =========================================================

-- By Feast date

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

-- Saint Genevieve (JAN 3)
('/saints/fr/saint-genevieve_le-brun.webp', 'Saint Genevieve', 'painting', 'Saint Genevieve Painting', 'Élisabeth Vigée Le Brun', '1821', 19, 'Musée du domaine royal de Marly', NULL, 'Public Domain', NULL),
('/saints/fr/saint-genevieve.webp', 'Saint Genevieve', 'painting', 'Saint Genevieve Painting', NULL, '1615-1620', 17, 'Musée Carnavalet', NULL, 'Public Domain', NULL),
('/saints/fr/saint-genevieve_gustafson.webp', 'Saint Genevieve', 'painting', 'Saint Genevieve Painting', 'Scott Gustafson', '21th Century', 21, NULL, NULL, 'Public Domain', NULL),
('/saints/fr/saint-genevieve_laurens.webp', 'The Death of Saint Genevieve', 'painting', 'The Death of Saint Genevieve Painting', 'Jean-Paul Laurens', '1877-1880', 19, 'Panthéon (Paris)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-genevieve_delauney.webp', 'Saint Genevieve Calming the Parisians on the Approach of Attila', 'painting', 'Saint Genevieve Calming the Parisians on the Approach of Attila Painting', 'Jules-Élie Delaunay', '19th century', 19, NULL, NULL, 'Public Domain', NULL),

-- Saint Remigius (JAN 15)
('/saints/fr/saint-remigius_clovis.webp', 'The Baptism of Clovis by Saint Remigius', 'painting', 'The Baptism of Clovis by Saint Remigius Painting', 'Master of Saint Giles', '1500', 16, 'National Gallery of Art', NULL, 'Public Domain', NULL),
('/saints/fr/saint-remigius_wine.webp', 'Saint Remigius Replenishing the Barrel of Wine', 'painting', 'Saint Remigius Replenishing the Barrel of Wine Painting', NULL, '1500-1505', 16, 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),
('/saints/fr/saint-remigius.webp', 'Saint Remigius', 'painting', 'Saint Remigius Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Bernadette Soubirous (FEB 18)
('/saints/fr/saint-bernadette-soubirous.webp', 'Saint Bernadette Soubirous', 'painting', 'Saint Bernadette Soubirous Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/fr/saint-bernadette-soubirous_2.webp', 'Saint Bernadette Soubirous', 'photograph', 'Saint Bernadette Soubirous Photograph', NULL, 1858, 19, NULL, NULL, 'Public Domain', NULL),
('/saints/fr/saint-bernadette-soubirous_3.webp', 'Saint Bernadette Soubirous', 'photograph', 'Saint Bernadette Soubirous Photograph', NULL, 1861, 19, NULL, NULL, 'Public Domain', NULL),

-- Saint Ivo of Kermartin (MAY 19)
('/saints/fr/saint-ivo-of-kermartin_weyden.webp', 'Saint Ivo of Kermartin', 'painting', 'Saint Ivo of Kermartin Painting', 'Rogier van der Weyden', '1450', 15, 'National Gallery', NULL, 'Public Domain', NULL),
('/saints/fr/saint-ivo-of-kermartin_jordaens.webp', 'Saint Ivo of Kermartin', 'painting', 'Saint Ivo of Kermartin Painting', 'Jacob Jordaens', '1645', 17, 'Royal Museum of Fine Arts Antwerp', NULL, 'Public Domain', NULL),
('/saints/fr/saint-ivo-of-kermartin_empoli.webp', 'Saint Ivo of Kermartin', 'painting', 'Saint Ivo of Kermartin Painting', 'Jacopo da Empoli', '17th Century', 17, 'Palazzo Pitti', NULL, 'Public Domain', NULL),

-- Saint Joan of Arc (MAY 30)
('/saints/fr/saint-joan-of-arc_thirion.webp', 'Saint Joan of Arc Listening to her Voices', 'painting', 'Saint Joan of Arc Listening to her Voices Painting', 'Eugène Thirion', '1876', 19, 'Église Notre-Dame de Chatou', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_lenepveu.webp', 'Saint Joan of Arc at the Stake', 'painting', 'Saint Joan of Arc at the Stake Painting', 'Jules-Eugène Lenepveu', '1886-1890', 19, 'Panthéon (Paris)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_lenepveu_2.webp', 'Saint Joan of Arc at the Siege of Orleans', 'painting', 'Saint Joan of Arc at the Siege of Orleans Painting', 'Jules-Eugène Lenepveu', '1886-1890', 19, 'Panthéon (Paris)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_lenepveu_3.webp', 'Saint Joan of Arc at the Coronation of Charles VII', 'painting', 'Saint Joan of Arc at the Coronation of Charles VII Painting', 'Jules-Eugène Lenepveu', '1886-1890', 19, 'Panthéon (Paris)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_lenepveu_4.webp', 'Saint Joan of Arc Shepherdess', 'painting', 'Saint Joan of Arc Shepherdess Painting', 'Jules-Eugène Lenepveu', '1886-1890', 19, 'Panthéon (Paris)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_lynch.webp', 'Saint Joan of Arc', 'painting', 'Saint Joan of Arc Painting', 'Albert Lynch', '1901', 20, 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_millais.webp', 'Saint Joan of Arc', 'painting', 'Saint Joan of Arc Painting', 'John Everett Millais', '1865', 19, 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_scherrer.webp', 'Saint Joan of Arc Enters Orleans', 'painting', 'Saint Joan of Arc Enters Orleans Painting', 'Jean-Jacques Scherrer', '1887', 19, 'Musée des Beaux-Arts d''Orléans', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_stilke.webp', 'Appearance of Saints Catherine and Michael to Saint Joan of Arc', 'painting', 'Appearance of Saints Catherine and Michael to Saint Joan of Arc Painting', 'Hermann Anton Stilke', '1843', 19, 'Hermitage Museum', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_stilke_2.webp', 'Saint Joan of Arc Death at the Stake', 'painting', 'Saint Joan of Arc Death at the Stake Painting', 'Hermann Anton Stilke', '1843', 19, 'Hermitage Museum', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_benouville.webp', 'Saint Joan of Arc Listening to her Voices', 'painting', 'Saint Joan of Arc Listening to her Voices Painting', 'François Léon Benouville', '1859', 19, 'Musée des Beaux-Arts de Rouen', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/fr/saint-joan-of-arc_hillingford.webp', 'Saint Joan of Arc', 'painting', 'Saint Joan of Arc Painting', 'Robert Alexander Hillingford', '19th Century', 19, 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/fr/saint-joan-of-arc_gasparo.webp', 'Saint Joan of Arc', 'painting', 'Saint Joan of Arc Painting', 'Giovanni Gasparo', '2018', 21, NULL, NULL, 'Public Domain', NULL),

-- Saint Pothinus (JUN 2)
('/saints/fr/saint-pothinus_stained-glass.webp', 'Saint Pothinus', 'stained glass', 'Saint Pothinus Stained Glass', 'Lucien Bégule', '1901', 20, 'Saint Irenaeus Church (Lyon)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-pothinus.webp', 'The Martyrdom of Saint Pothinus', 'painting', 'The Martyrdom of Saint Pothinus Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Blandina (JUN 2)
('/saints/fr/saint-blandina_stained-glass.webp', 'Saint Blandina', 'stained glass', 'Saint Blandina Stained Glass', 'Lucien Bégule', '1901', 20, 'Saint Irenaeus Church (Lyon)', NULL, 'Public Domain', NULL),
('/saints/fr/saint-blandina_bayard.webp', 'The Martyrdom of Saint Blandina', 'painting', 'The Martyrdom of Saint Blandina Painting', 'Émile-Antoine Bayard', '19th Century', 19, NULL, NULL, 'Public Domain', NULL),
('/saints/fr/saint-blandina_guillemet.webp', 'The Martyrdom of Saint Blandina', 'painting', 'The Martyrdom of Saint Blandina Painting', 'Pierre-Désiré Guillemet', '1862', 19, NULL, NULL, 'Public Domain', NULL),

-- Saint Clotilde (JUN 4)
('/saints/fr/saint-clotilde_loo.webp', 'Saint Clotilde Praying at the Foot of Saint Martin''s Tomb', 'painting', 'Saint Clotilde Praying at the Foot of Saint Martin''s Tomb Painting', 'Charles André van Loo', '1753', 18, 'Musée des Beaux-Arts de Brest', NULL, 'Public Domain', NULL),
('/saints/fr/saint-clotilde.webp', 'Saint Clotilde converting King Clovis', 'painting', 'Saint Clotilde converting King Clovis Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/fr/saint-clotilde_deveria.webp', 'The Glorification of Saint Clotilde', 'painting', 'The Glorification of Saint Clotilde Painting', 'Achille Devéria', '19th Century', 19, 'Church of Saint-Roch (Paris)', NULL, 'Public Domain', NULL),

-- Saint Caesarius of Arles (AUG 27)
('/saints/fr/saint-caesarius-of-arles_icon.webp', 'Saint Caesarius of Arles', 'icon', 'Saint Caesarius of Arles Icon', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL);
--WIP



COMMIT;
