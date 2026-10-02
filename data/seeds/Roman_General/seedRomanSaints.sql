BEGIN;

-- ==============
-- IMPORTANT SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-mary', 'Saint Mary (Blessed Virgin Mary)',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='NAZARETH'),
  NULL,
  (SELECT id FROM places WHERE code='NAZARETH')
  ),
(
  'saint-joseph', 'Saint Joseph',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL,
  NULL,
  (SELECT id FROM places WHERE code='NAZARETH')
),
(
  'saint-john-the-baptist', 'Saint John the Baptist',
  NULL, NULL, NULL, TRUE,
  30, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='JUDAEA'),
  (SELECT id FROM places WHERE code='MACHAERUS'),
  (SELECT id FROM places WHERE code='JUDAEA')
)
ON CONFLICT (slug) DO NOTHING;

-- EN (expanded)
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
(
  'saint-mary',
  'Saint Mary (Blessed Virgin Mary)',
  NULL,
  NULL,
  '1st century'
),
(
  'saint-joseph',
  'Saint Joseph',
  NULL,
  NULL,
  '1st century'
),
(
  'saint-john-the-baptist',
  'Saint John the Baptist',
  NULL,
  NULL,
  '1st century'
)
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- FR (expanded)
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
(
  'saint-mary',
  'Sainte Marie (Bienheureuse Vierge Marie)',
  NULL,
  NULL,
  'Ier siècle'
),
(
  'saint-joseph',
  'Saint Joseph',
  NULL,
  NULL,
  'Ier siècle'
),
(
  'saint-john-the-baptist',
  'Saint Jean-Baptiste',
  NULL,
  NULL,
  'Ier siècle'
)
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- LA (expanded)
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
(
  'saint-mary',
  'Sancta Maria (Beata Virgo Maria)',
  NULL,
  NULL,
  'saec. I'
),
(
  'saint-joseph',
  'Sanctus Ioseph',
  NULL,
  NULL,
  'saec. I'
),
(
  'saint-john-the-baptist',
  'Sanctus Ioannes Baptista',
  NULL,
  NULL,
  'saec. I'
)
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;


-- ==============
-- JANUARY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-basil-the-great', 'Saint Basil the Great',
  330, NULL, NULL, TRUE,
  379, 1, 1, TRUE,
  4,
  (SELECT id FROM places WHERE code='CAESAREA_CAPPADOCIAE'),
  (SELECT id FROM places WHERE code='CAESAREA_CAPPADOCIAE'),
  (SELECT id FROM places WHERE code='CAESAREA_CAPPADOCIAE')
),
(
  'saint-gregory-nazianzen', 'Saint Gregory Nazianzen',
  329, NULL, NULL, TRUE,
  390, 1, 25, TRUE,
  4,
  (SELECT id FROM places WHERE code='ARIANZUS'),
  (SELECT id FROM places WHERE code='ARIANZUS'),
  (SELECT id FROM places WHERE code='ARIANZUS')
),
(
  'saint-raymond-of-penyafort', 'Saint Raymond of Penyafort',
  1175, NULL, NULL, TRUE,
  1275, 1, 6, FALSE,
  13,
  (SELECT id FROM places WHERE code='PENYAFORT'),
  (SELECT id FROM places WHERE code='BARCELONA'),
  (SELECT id FROM places WHERE code='BARCELONA')
),
(
  'saint-hilary-of-poitiers', 'Saint Hilary of Poitiers',
  310, NULL, NULL, TRUE,
  367, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='POITIERS'),
  (SELECT id FROM places WHERE code='POITIERS'),
  (SELECT id FROM places WHERE code='POITIERS')
),
(
  'saint-anthony-abbot', 'Saint Anthony, Abbot',
  251, 1, 12, TRUE,
  356, 1, 17, TRUE,
  4,
  (SELECT id FROM places WHERE code='HERAKLEOPOLIS_MAGNA'),
  (SELECT id FROM places WHERE code='MOUNT_COLZIM'),
  (SELECT id FROM places WHERE code='MOUNT_COLZIM')
),
(
  'saint-fabian-pope', 'Saint Fabian, Pope',
  178, NULL, NULL, TRUE,
  250, 1, 20, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-sebastian', 'Saint Sebastian',
  256, NULL, NULL, TRUE,
  288, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-agnes-of-rome', 'Saint Agnes of Rome',
  291, NULL, NULL, TRUE,
  304, 1, 21, TRUE,
  4,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-vincent-of-saragossa', 'Saint Vincent of Saragossa',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='HUESCA'),
  (SELECT id FROM places WHERE code='VALENCIA'),
  (SELECT id FROM places WHERE code='SARAGOSSA')
),
(
  'saint-francis-de-sales', 'Saint Francis de Sales',
  1567, 8, 22, FALSE,
  1622, 12, 28, FALSE,
  17,
  (SELECT id FROM places WHERE code='THORENS_GLIERES'),
  (SELECT id FROM places WHERE code='LYON'),
  (SELECT id FROM places WHERE code='ANNECY')
),
(
  'saint-paul-apostle', 'Saint Paul, Apostle',
  5, NULL, NULL, TRUE,
  65, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='TARSUS'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-timothy-of-ephesus', 'Saint Timothy of Ephesus',
  NULL, NULL, NULL, TRUE,
  97, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='LYSTRA'),
  (SELECT id FROM places WHERE code='EPHESUS'),
  (SELECT id FROM places WHERE code='EPHESUS')
),
(
  'saint-titus-of-crete', 'Saint Titus of Crete',
  NULL, NULL, NULL, TRUE,
  96, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='CRETE'),
  (SELECT id FROM places WHERE code='CRETE'),
  (SELECT id FROM places WHERE code='CRETE')
),
(
  'saint-angela-merici', 'Saint Angela Merici',
  1474, 3, 21, TRUE,
  1540, 1, 27, FALSE,
  16,
  (SELECT id FROM places WHERE code='DESENZANO_DEL_GARDA'),
  (SELECT id FROM places WHERE code='BRESCIA'),
  (SELECT id FROM places WHERE code='BRESCIA')
),
(
  'saint-thomas-aquinas', 'Saint Thomas Aquinas',
  1225, NULL, NULL, TRUE,
  1274, 3, 7, FALSE,
  13,
  (SELECT id FROM places WHERE code='ROCCASECCA'),
  (SELECT id FROM places WHERE code='FOSSANOVA_ABBEY'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-john-bosco', 'Saint John Bosco',
  1815, 8, 16, FALSE,
  1888, 1, 31, FALSE,
  19,
  (SELECT id FROM places WHERE code='BECCHI_CASTELNUOVO_DON_BOSCO'),
  (SELECT id FROM places WHERE code='TURIN'),
  (SELECT id FROM places WHERE code='TURIN')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-basil-the-great', 'Saint Basil the Great', NULL, NULL, 'c. 330–379'),
('saint-gregory-nazianzen', 'Saint Gregory Nazianzen', NULL, NULL, 'c. 329–390'),
('saint-raymond-of-penyafort', 'Saint Raymond of Penyafort', NULL, NULL, '1175–1275'),
('saint-hilary-of-poitiers', 'Saint Hilary of Poitiers', NULL, NULL, 'c. 310–367'),
('saint-anthony-abbot', 'Saint Anthony, Abbot', NULL, NULL, 'c. 251–356'),
('saint-fabian-pope', 'Saint Fabian, Pope', NULL, NULL, '† 250'),
('saint-sebastian', 'Saint Sebastian', NULL, NULL, '3rd century'),
('saint-agnes-of-rome', 'Saint Agnes of Rome', NULL, NULL, '† c. 304'),
('saint-vincent-of-saragossa', 'Saint Vincent of Saragossa', NULL, NULL, '† c. 304'),
('saint-francis-de-sales', 'Saint Francis de Sales', NULL, NULL, '1567–1622'),
('saint-paul-apostle', 'Saint Paul the Apostle', NULL, NULL, '1st century'),
('saint-timothy-of-ephesus', 'Saint Timothy of Ephesus', NULL, NULL, '1st century'),
('saint-titus-of-crete', 'Saint Titus of Crete', NULL, NULL, '1st century'),
('saint-angela-merici', 'Saint Angela Merici', NULL, NULL, '1474–1540'),
('saint-thomas-aquinas', 'Saint Thomas Aquinas', NULL, NULL, '1225–1274'),
('saint-john-bosco', 'Saint John Bosco', NULL, NULL, '1815–1888')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-basil-the-great', 'Saint Basile le Grand', NULL, NULL, 'v. 330–379'),
('saint-gregory-nazianzen', 'Saint Grégoire de Nazianze', NULL, NULL, 'v. 329–390'),
('saint-raymond-of-penyafort', 'Saint Raymond de Penyafort', NULL, NULL, '1175–1275'),
('saint-hilary-of-poitiers', 'Saint Hilaire de Poitiers', NULL, NULL, 'v. 310–367'),
('saint-anthony-abbot', 'Saint Antoine, abbé', NULL, NULL, 'v. 251–356'),
('saint-fabian-pope', 'Saint Fabien, pape', NULL, NULL, '† 250'),
('saint-sebastian', 'Saint Sébastien', NULL, NULL, 'IIIe siècle'),
('saint-agnes-of-rome', 'Sainte Agnès de Rome', NULL, NULL, '† v. 304'),
('saint-vincent-of-saragossa', 'Saint Vincent de Saragosse', NULL, NULL, '† v. 304'),
('saint-francis-de-sales', 'Saint François de Sales', NULL, NULL, '1567–1622'),
('saint-paul-apostle', 'Saint Paul apôtre', NULL, NULL, 'Ier siècle'),
('saint-timothy-of-ephesus', 'Saint Timothée d’Éphèse', NULL, NULL, 'Ier siècle'),
('saint-titus-of-crete', 'Saint Tite de Crète', NULL, NULL, 'Ier siècle'),
('saint-angela-merici', 'Sainte Angèle Merici', NULL, NULL, '1474–1540'),
('saint-thomas-aquinas', 'Saint Thomas d’Aquin', NULL, NULL, '1225–1274'),
('saint-john-bosco', 'Saint Jean Bosco', NULL, NULL, '1815–1888')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-basil-the-great', 'Sanctus Basilius Magnus', NULL, NULL, 'c. 330–379'),
('saint-gregory-nazianzen', 'Sanctus Gregorius Nazianzenus', NULL, NULL, 'c. 329–390'),
('saint-raymond-of-penyafort', 'Sanctus Raymundus de Penyafort', NULL, NULL, '1175–1275'),
('saint-hilary-of-poitiers', 'Sanctus Hilarius Pictaviensis', NULL, NULL, 'c. 310–367'),
('saint-anthony-abbot', 'Sanctus Antonius Abbas', NULL, NULL, 'c. 251–356'),
('saint-fabian-pope', 'Sanctus Fabianus Papa', NULL, NULL, '† 250'),
('saint-sebastian', 'Sanctus Sebastianus', NULL, NULL, 'saec. III'),
('saint-agnes-of-rome', 'Sancta Agnes Romana', NULL, NULL, '† c. 304'),
('saint-vincent-of-saragossa', 'Sanctus Vincentius Caesaraugustanus', NULL, NULL, '† c. 304'),
('saint-francis-de-sales', 'Sanctus Franciscus Salesius', NULL, NULL, '1567–1622'),
('saint-paul-apostle', 'Sanctus Paulus Apostolus', NULL, NULL, 'saec. I'),
('saint-timothy-of-ephesus', 'Sanctus Timotheus Ephesius', NULL, NULL, 'saec. I'),
('saint-titus-of-crete', 'Sanctus Titus Cretensis', NULL, NULL, 'saec. I'),
('saint-angela-merici', 'Sancta Angela Merici', NULL, NULL, '1474–1540'),
('saint-thomas-aquinas', 'Sanctus Thomas Aquinas', NULL, NULL, '1225–1274'),
('saint-john-bosco', 'Sanctus Ioannes Bosco', NULL, NULL, '1815–1888')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- FEBRUARY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-blaise', 'Saint Blaise',
  NULL, NULL, NULL, TRUE,
  316, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='SIVAS'),
  (SELECT id FROM places WHERE code='SIVAS')
),
(
  'saint-ansgar', 'Saint Ansgar',
  801, 9, 8, FALSE,
  865, 2, 3, FALSE,
  9,
  NULL,
  (SELECT id FROM places WHERE code='BREMEN'),
  NULL
),
(
  'saint-agatha', 'Saint Agatha',
  NULL, NULL, NULL, TRUE,
  251, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='CATANIA'),
  (SELECT id FROM places WHERE code='CATANIA'),
  (SELECT id FROM places WHERE code='CATANIA')
),
(
  'saint-paul-miki', 'Saint Paul Miki',
  1564, NULL, NULL, TRUE,
  1597, 2, 5, FALSE,
  16,
  (SELECT id FROM places WHERE code='OSAKA'),
  (SELECT id FROM places WHERE code='NAGASAKI'),
  (SELECT id FROM places WHERE code='JAPAN')
),
(
  'saint-jerome-emiliani', 'Saint Jerome Emiliani',
  1486, NULL, NULL, TRUE,
  1537, 2, 8, FALSE,
  16,
  (SELECT id FROM places WHERE code='VENICE'),
  (SELECT id FROM places WHERE code='SOMASCA'),
  (SELECT id FROM places WHERE code='SOMASCA')
),
(
  'saint-josephine-bakhita', 'Saint Josephine Bakhita',
  1869, NULL, NULL, TRUE,
  1947, 2, 8, FALSE,
  20,
  (SELECT id FROM places WHERE code='NYALA'),
  (SELECT id FROM places WHERE code='SCHIO'),
  (SELECT id FROM places WHERE code='SCHIO')
),
(
  'saint-scholastica', 'Saint Scholastica',
  480, NULL, NULL, TRUE,
  547, 2, 10, TRUE,
  6,
  (SELECT id FROM places WHERE code='NURSIA'),
  (SELECT id FROM places WHERE code='MONTECASSINO'),
  (SELECT id FROM places WHERE code='MONTECASSINO')
),
(
  'saint-cyril', 'Saint Cyril',
  826, NULL, NULL, TRUE,
  869, 2, 14, FALSE,
  9,
  (SELECT id FROM places WHERE code='THESSALONICA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='NITRA')
),
(
  'saint-methodius', 'Saint Methodius',
  815, NULL, NULL, TRUE,
  885, 4, 6, FALSE,
  9,
  (SELECT id FROM places WHERE code='THESSALONICA'),
  (SELECT id FROM places WHERE code='STARE_MESTO'),
  (SELECT id FROM places WHERE code='NITRA')
),
(
  'saint-peter-damian', 'Saint Peter Damian',
  1007, NULL, NULL, TRUE,
  1072, 2, 22, TRUE,
  11,
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='FAENZA'),
  (SELECT id FROM places WHERE code='FONTE_AVELLANA')
),
(
  'saint-polycarp', 'Saint Polycarp',
  69, NULL, NULL, TRUE,
  155, NULL, NULL, TRUE,
  2,
  NULL,
  (SELECT id FROM places WHERE code='SMYRNA'),
  (SELECT id FROM places WHERE code='SMYRNA')
),
(
  'saint-gregory-of-narek', 'Saint Gregory of Narek',
  951, NULL, NULL, TRUE,
  1003, NULL, NULL, TRUE,
  10,
  NULL,
  (SELECT id FROM places WHERE code='NAREK'),
  (SELECT id FROM places WHERE code='NAREK')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-blaise', 'Saint Blaise', NULL, NULL, '4th century'),
('saint-ansgar', 'Saint Ansgar', NULL, NULL, '801–865'),
('saint-agatha', 'Saint Agatha', NULL, NULL, '3rd century'),
('saint-paul-miki', 'Saint Paul Miki', NULL, NULL, '1564–1597'),
('saint-jerome-emiliani', 'Saint Jerome Emiliani', NULL, NULL, '1486–1537'),
('saint-josephine-bakhita', 'Saint Josephine Bakhita', NULL, NULL, 'c. 1869–1947'),
('saint-scholastica', 'Saint Scholastica', NULL, NULL, 'c. 480–543'),
('saint-cyril', 'Saint Cyril', NULL, NULL, 'c. 826–869'),
('saint-methodius', 'Saint Methodius', NULL, NULL, 'c. 815–885'),
('saint-peter-damian', 'Saint Peter Damian', NULL, NULL, 'c. 1007–1072'),
('saint-polycarp', 'Saint Polycarp', NULL, NULL, 'c. 69–155'),
('saint-gregory-of-narek', 'Saint Gregory of Narek', NULL, NULL, 'c. 951–1003')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-blaise', 'Saint Blaise', NULL, NULL, 'IVe siècle'),
('saint-ansgar', 'Saint Anschaire', NULL, NULL, '801–865'),
('saint-agatha', 'Sainte Agathe', NULL, NULL, 'IIIe siècle'),
('saint-paul-miki', 'Saint Paul Miki', NULL, NULL, '1564–1597'),
('saint-jerome-emiliani', 'Saint Jérôme Emilien', NULL, NULL, '1486–1537'),
('saint-josephine-bakhita', 'Sainte Joséphine Bakhita', NULL, NULL, 'v. 1869–1947'),
('saint-scholastica', 'Sainte Scholastique', NULL, NULL, 'v. 480–543'),
('saint-cyril', 'Saint Cyrille', NULL, NULL, 'v. 826–869'),
('saint-methodius', 'Saint Méthode', NULL, NULL, 'v. 815–885'),
('saint-peter-damian', 'Saint Pierre Damien', NULL, NULL, 'v. 1007–1072'),
('saint-polycarp', 'Saint Polycarpe', NULL, NULL, 'v. 69–155'),
('saint-gregory-of-narek', 'Saint Grégoire de Narek', NULL, NULL, 'v. 951–1003')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-blaise', 'Sanctus Blasius', NULL, NULL, 'saec. IV'),
('saint-ansgar', 'Sanctus Ansgarius', NULL, NULL, '801–865'),
('saint-agatha', 'Sancta Agatha', NULL, NULL, 'saec. III'),
('saint-paul-miki', 'Sanctus Paulus Miki', NULL, NULL, '1564–1597'),
('saint-jerome-emiliani', 'Sanctus Hieronymus Aemilianus', NULL, NULL, '1486–1537'),
('saint-josephine-bakhita', 'Sancta Iosephina Bakhita', NULL, NULL, 'c. 1869–1947'),
('saint-scholastica', 'Sancta Scholastica', NULL, NULL, 'c. 480–543'),
('saint-cyril', 'Sanctus Cyrillus', NULL, NULL, 'c. 826–869'),
('saint-methodius', 'Sanctus Methodius', NULL, NULL, 'c. 815–885'),
('saint-peter-damian', 'Sanctus Petrus Damiani', NULL, NULL, 'c. 1007–1072'),
('saint-polycarp', 'Sanctus Polycarpus', NULL, NULL, 'c. 69–155'),
('saint-gregory-of-narek', 'Sanctus Gregorius Narekensis', NULL, NULL, 'c. 951–1003')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- MARCH SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-casimir', 'Saint Casimir',
  1458, 10, 3, FALSE,
  1484, 3, 4, FALSE,
  15,
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='GRODNO'),
  (SELECT id FROM places WHERE code='VILNIUS')
),
(
  'saint-perpetua', 'Saint Perpetua',
  182, NULL, NULL, TRUE,
  203, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE')
),
(
  'saint-felicity', 'Saint Felicity',
  182, NULL, NULL, TRUE,
  203, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE')
),
(
  'saint-john-of-god', 'Saint John of God',
  1495, 3, 8, TRUE,
  1550, 3, 8, FALSE,
  16,
  (SELECT id FROM places WHERE code='MONTEMOR_O_NOVO'),
  (SELECT id FROM places WHERE code='GRANADA'),
  (SELECT id FROM places WHERE code='GRANADA')
),
(
  'saint-frances-of-rome', 'Saint Frances of Rome',
  1384, NULL, NULL, TRUE,
  1440, 3, 9, FALSE,
  15,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-patrick', 'Saint Patrick',
  385, NULL, NULL, TRUE,
  460, NULL, NULL, TRUE,
  5,
  NULL,
  (SELECT id FROM places WHERE code='DOWNPATRICK'),
  (SELECT id FROM places WHERE code='IRELAND')
),
(
  'saint-cyril-of-jerusalem', 'Saint Cyril of Jerusalem',
  313, NULL, NULL, TRUE,
  386, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
-- (
--   'saint-joseph-spouse-of-mary', 'Saint Joseph, Spouse of Mary',
--   NULL, NULL, NULL, TRUE,
--   NULL, NULL, NULL, TRUE,
--   1,
--   NULL, NULL,
--   (SELECT id FROM places WHERE code='NAZARETH')
-- ),
(
  'saint-turibius-of-mogrovejo', 'Saint Turibius of Mogrovejo',
  1538, 11, 16, FALSE,
  1606, 3, 23, FALSE,
  17,
  (SELECT id FROM places WHERE code='MAYORGA'),
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='ZANA')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-casimir', 'Saint Casimir', NULL, NULL, '1458–1484'),
('saint-perpetua', 'Saint Perpetua', NULL, NULL, '† 203'),
('saint-felicity', 'Saint Felicity', NULL, NULL, '† 203'),
('saint-john-of-god', 'Saint John of God', NULL, NULL, '1495–1550'),
('saint-frances-of-rome', 'Saint Frances of Rome', NULL, NULL, '1384–1440'),
('saint-patrick', 'Saint Patrick', NULL, NULL, 'c. 385–461'),
('saint-cyril-of-jerusalem', 'Saint Cyril of Jerusalem', NULL, NULL, 'c. 315–386'),
-- ('saint-joseph-spouse-of-mary', 'Saint Joseph, Spouse of Mary', NULL, NULL, '1st century'),
('saint-turibius-of-mogrovejo', 'Saint Turibius of Mogrovejo', NULL, NULL, '1538–1606')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-casimir', 'Saint Casimir', NULL, NULL, '1458–1484'),
('saint-perpetua', 'Sainte Perpétue', NULL, NULL, '† 203'),
('saint-felicity', 'Sainte Félicité', NULL, NULL, '† 203'),
('saint-john-of-god', 'Saint Jean de Dieu', NULL, NULL, '1495–1550'),
('saint-frances-of-rome', 'Sainte Françoise de Rome', NULL, NULL, '1384–1440'),
('saint-patrick', 'Saint Patrick', NULL, NULL, 'v. 385–461'),
('saint-cyril-of-jerusalem', 'Saint Cyrille de Jérusalem', NULL, NULL, 'v. 315–386'),
-- ('saint-joseph-spouse-of-mary', 'Saint Joseph, époux de Marie', NULL, NULL, 'Ier siècle'),
('saint-turibius-of-mogrovejo', 'Saint Turibe de Mogrovejo', NULL, NULL, '1538–1606')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-casimir', 'Sanctus Casimirus', NULL, NULL, '1458–1484'),
('saint-perpetua', 'Sancta Perpetua', NULL, NULL, '† 203'),
('saint-felicity', 'Sancta Felicitas', NULL, NULL, '† 203'),
('saint-john-of-god', 'Sanctus Ioannes a Deo', NULL, NULL, '1495–1550'),
('saint-frances-of-rome', 'Sancta Francisca Romana', NULL, NULL, '1384–1440'),
('saint-patrick', 'Sanctus Patricius', NULL, NULL, 'c. 385–461'),
('saint-cyril-of-jerusalem', 'Sanctus Cyrillus Hierosolymitanus', NULL, NULL, 'c. 315–386'),
-- ('saint-joseph-spouse-of-mary', 'Sanctus Ioseph, Sponsus Mariae', NULL, NULL, 'saec. I'),
('saint-turibius-of-mogrovejo', 'Sanctus Turibius de Mogrovejo', NULL, NULL, '1538–1606')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- APRIL SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-francis-of-paola', 'Saint Francis of Paola',
  1416, 3, 27, FALSE,
  1507, 4, 2, FALSE,
  16,
  (SELECT id FROM places WHERE code='PAOLA'),
  (SELECT id FROM places WHERE code='PLESSIS_LEZ_TOURS'),
  (SELECT id FROM places WHERE code='PAOLA')
),
(
  'saint-isidore', 'Saint Isidore',
  560, NULL, NULL, TRUE,
  636, 4, 4, FALSE,
  7,
  (SELECT id FROM places WHERE code='CARTAGENA'),
  (SELECT id FROM places WHERE code='SEVILLE'),
  (SELECT id FROM places WHERE code='SEVILLE')
),
(
  'saint-vincent-ferrer', 'Saint Vincent Ferrer',
  1350, 1, 23, FALSE,
  1419, 4, 5, FALSE,
  15,
  (SELECT id FROM places WHERE code='VALENCIA'),
  (SELECT id FROM places WHERE code='VANNES'),
  NULL
),
(
  'saint-john-baptist-de-la-salle', 'Saint John Baptist de La Salle',
  1651, 4, 30, FALSE,
  1719, 4, 7, FALSE,
  18,
  (SELECT id FROM places WHERE code='REIMS'),
  (SELECT id FROM places WHERE code='ROUEN'),
  (SELECT id FROM places WHERE code='REIMS')
),
(
  'saint-stanislaus', 'Saint Stanislaus',
  1030, 7, 26, TRUE,
  1079, 4, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='SZCZEPANOW'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-martin-i', 'Saint Martin I',
  600, NULL, NULL, TRUE,
  655, 9, 16, TRUE,
  7,
  (SELECT id FROM places WHERE code='TODI'),
  (SELECT id FROM places WHERE code='CHERSON'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-anselm', 'Saint Anselm',
  1033, NULL, NULL, TRUE,
  1109, 4, 21, FALSE,
  12,
  (SELECT id FROM places WHERE code='AOSTA'),
  (SELECT id FROM places WHERE code='CANTERBURY'),
  (SELECT id FROM places WHERE code='CANTERBURY')
),
(
  'saint-george', 'Saint George',
  275, NULL, NULL, TRUE,
  303, 4, 23, FALSE,
  4,
  (SELECT id FROM places WHERE code='KAYSERI'),
  (SELECT id FROM places WHERE code='IZMIT'),
  (SELECT id FROM places WHERE code='IZMIT')
),
(
  'saint-adalbert', 'Saint Adalbert',
  956, NULL, NULL, TRUE,
  997, 4, 23, FALSE,
  10,
  (SELECT id FROM places WHERE code='LIBICE_NAD_CIDLINOU'),
  (SELECT id FROM places WHERE code='ELBLAG'),
  (SELECT id FROM places WHERE code='PRAGUE')
),
(
  'saint-fidelis-of-sigmaringen', 'Saint Fidelis of Sigmaringen',
  1578, 10, 1, TRUE,
  1622, 4, 24, FALSE,
  17,
  (SELECT id FROM places WHERE code='SIGMARINGEN'),
  (SELECT id FROM places WHERE code='SEEWIS_IM_PRATTIGAU'),
  (SELECT id FROM places WHERE code='CHUR')
),
(
  'saint-mark-evangelist', 'Saint Mark the Evangelist',
  12, NULL, NULL, TRUE,
  68, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-peter-chanel', 'Saint Peter Chanel',
  1803, 7, 12, FALSE,
  1841, 4, 28, FALSE,
  19,
  (SELECT id FROM places WHERE code='CUET'),
  (SELECT id FROM places WHERE code='FUTUNA'),
  (SELECT id FROM places WHERE code='FUTUNA')
),
(
  'saint-louis-grignion-de-montfort', 'Saint Louis Grignion de Montfort',
  1673, 1, 31, FALSE,
  1716, 4, 28, FALSE,
  18,
  (SELECT id FROM places WHERE code='MONTFORT_SUR_MEU'),
  (SELECT id FROM places WHERE code='SAINT_LAURENT_SUR_SEVRE'),
  (SELECT id FROM places WHERE code='BRITTANY')
),
(
  'saint-catherine-of-siena', 'Saint Catherine of Siena',
  1347, 3, 25, FALSE,
  1380, 4, 29, FALSE,
  14,
  (SELECT id FROM places WHERE code='SIENA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='SIENA')
),
(
  'saint-pius-v', 'Saint Pius V',
  1504, 1, 17, FALSE,
  1572, 5, 1, FALSE,
  16,
  (SELECT id FROM places WHERE code='BOSCO_MARENGO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-of-paola', 'Saint Francis of Paola', NULL, NULL, '1416–1507'),
('saint-isidore', 'Saint Isidore of Seville', NULL, NULL, 'c. 560–636'),
('saint-vincent-ferrer', 'Saint Vincent Ferrer', NULL, NULL, '1350–1419'),
('saint-john-baptist-de-la-salle', 'Saint John Baptist de La Salle', NULL, NULL, '1651–1719'),
('saint-stanislaus', 'Saint Stanislaus of Szczepanów', NULL, NULL, '1030–1079'),
('saint-martin-i', 'Saint Martin I', NULL, NULL, '† 655'),
('saint-anselm', 'Saint Anselm of Canterbury', NULL, NULL, '1033–1109'),
('saint-george', 'Saint George', NULL, NULL, '† c. 303'),
('saint-adalbert', 'Saint Adalbert of Prague', NULL, NULL, 'c. 956–997'),
('saint-fidelis-of-sigmaringen', 'Saint Fidelis of Sigmaringen', NULL, NULL, '1578–1622'),
('saint-mark-evangelist', 'Saint Mark the Evangelist', NULL, NULL, '† c. 68'),
('saint-peter-chanel', 'Saint Peter Chanel', NULL, NULL, '1803–1841'),
('saint-louis-grignion-de-montfort', 'Saint Louis Grignion de Montfort', NULL, NULL, '1673–1716'),
('saint-catherine-of-siena', 'Saint Catherine of Siena', NULL, NULL, '1347–1380'),
('saint-pius-v', 'Saint Pius V', NULL, NULL, '1504–1572')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-of-paola', 'Saint François de Paule', NULL, NULL, '1416–1507'),
('saint-isidore', 'Saint Isidore de Séville', NULL, NULL, 'v. 560–636'),
('saint-vincent-ferrer', 'Saint Vincent Ferrier', NULL, NULL, '1350–1419'),
('saint-john-baptist-de-la-salle', 'Saint Jean-Baptiste de La Salle', NULL, NULL, '1651–1719'),
('saint-stanislaus', 'Saint Stanislas de Szczepanów', NULL, NULL, '1030–1079'),
('saint-martin-i', 'Saint Martin Ier', NULL, NULL, '† 655'),
('saint-anselm', 'Saint Anselme de Cantorbéry', NULL, NULL, '1033–1109'),
('saint-george', 'Saint Georges', NULL, NULL, '† v. 303'),
('saint-adalbert', 'Saint Adalbert de Prague', NULL, NULL, 'v. 956–997'),
('saint-fidelis-of-sigmaringen', 'Saint Fidèle de Sigmaringen', NULL, NULL, '1578–1622'),
('saint-mark-evangelist', 'Saint Marc, évangéliste', NULL, NULL, '† v. 68'),
('saint-peter-chanel', 'Saint Pierre Chanel', NULL, NULL, '1803–1841'),
('saint-louis-grignion-de-montfort', 'Saint Louis-Marie Grignion de Montfort', NULL, NULL, '1673–1716'),
('saint-catherine-of-siena', 'Sainte Catherine de Sienne', NULL, NULL, '1347–1380'),
('saint-pius-v', 'Saint Pie V', NULL, NULL, '1504–1572')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-of-paola', 'Sanctus Franciscus de Paula', NULL, NULL, '1416–1507'),
('saint-isidore', 'Sanctus Isidorus Hispalensis', NULL, NULL, 'c. 560–636'),
('saint-vincent-ferrer', 'Sanctus Vincentius Ferrerius', NULL, NULL, '1350–1419'),
('saint-john-baptist-de-la-salle', 'Sanctus Ioannes Baptista de La Salle', NULL, NULL, '1651–1719'),
('saint-stanislaus', 'Sanctus Stanislaus Szczepanowski', NULL, NULL, '1030–1079'),
('saint-martin-i', 'Sanctus Martinus I', NULL, NULL, '† 655'),
('saint-anselm', 'Sanctus Anselmus Cantuariensis', NULL, NULL, '1033–1109'),
('saint-george', 'Sanctus Georgius', NULL, NULL, '† c. 303'),
('saint-adalbert', 'Sanctus Adalbertus Pragensis', NULL, NULL, 'c. 956–997'),
('saint-fidelis-of-sigmaringen', 'Sanctus Fidelis Sigmaringensis', NULL, NULL, '1578–1622'),
('saint-mark-evangelist', 'Sanctus Marcus Evangelista', NULL, NULL, '† c. 68'),
('saint-peter-chanel', 'Sanctus Petrus Chanel', NULL, NULL, '1803–1841'),
('saint-louis-grignion-de-montfort', 'Sanctus Ludovicus Mariae Grignion de Montfort', NULL, NULL, '1673–1716'),
('saint-catherine-of-siena', 'Sancta Catharina Senensis', NULL, NULL, '1347–1380'),
('saint-pius-v', 'Sanctus Pius V', NULL, NULL, '1504–1572')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- MAY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
-- (
--   'saint-joseph-the-worker', 'Saint Joseph the Worker',
--   NULL, NULL, NULL, TRUE,
--   NULL, 5, 1, TRUE,
--   1,
--   NULL,
--   NULL,
--   (SELECT id FROM places WHERE code='NAZARETH')
-- ),
(
  'saint-athanasius', 'Saint Athanasius',
  296, NULL, NULL, TRUE,
  373, 5, 2, TRUE,
  4,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-philip-apostle', 'Saint Philip, Apostle',
  NULL, NULL, NULL, TRUE,
  63, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='HIERAPOLIS'),
  (SELECT id FROM places WHERE code='HIERAPOLIS')
),
(
  'saint-james-the-less-apostle', 'Saint James the Less, Apostle',
  NULL, NULL, NULL, TRUE,
  62, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-john-of-avila', 'Saint John of Ávila',
  1499, 1, 6, FALSE,
  1569, 5, 10, FALSE,
  16,
  (SELECT id FROM places WHERE code='ALMODOVAR_DEL_CAMPO'),
  (SELECT id FROM places WHERE code='MONTILLA'),
  (SELECT id FROM places WHERE code='CORDOUE')
),
(
  'saint-nereus', 'Saint Nereus',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-achilleus', 'Saint Achilleus',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-pancras', 'Saint Pancras',
  289, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='SYNNADA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-matthias-apostle', 'Saint Matthias, Apostle',
  NULL, NULL, NULL, TRUE,
  64, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-john-i', 'Saint John I',
  470, NULL, NULL, TRUE,
  526, 5, 18, TRUE,
  6,
  (SELECT id FROM places WHERE code='TUSCANY'),
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-bernardine-of-siena', 'Saint Bernardine of Siena',
  1380, 9, 8, FALSE,
  1444, 5, 20, FALSE,
  14,
  (SELECT id FROM places WHERE code='MASSA_MARITTIMA'),
  (SELECT id FROM places WHERE code='AQUILA'),
  (SELECT id FROM places WHERE code='SIENA')
),
(
  'saint-christopher-magallanes', 'Saint Christopher Magallanes',
  1869, 7, 30, FALSE,
  1927, 5, 25, FALSE,
  19,
  (SELECT id FROM places WHERE code='TOTATICHE'),
  (SELECT id FROM places WHERE code='COLOTLAN'),
  (SELECT id FROM places WHERE code='JALISCO')
),
(
  'saint-rita-of-cascia', 'Saint Rita of Cascia',
  1381, NULL, NULL, TRUE,
  1457, 5, 22, FALSE,
  15,
  (SELECT id FROM places WHERE code='ROCCAPORENA'),
  (SELECT id FROM places WHERE code='CASCIA'),
  (SELECT id FROM places WHERE code='CASCIA')
),
(
  'saint-bede-the-venerable', 'Saint Bede the Venerable',
  672, NULL, NULL, TRUE,
  735, 5, 26, TRUE,
  8,
  (SELECT id FROM places WHERE code='NORTHUMBRIA'),
  (SELECT id FROM places WHERE code='JARROW'),
  (SELECT id FROM places WHERE code='JARROW')
),
(
  'saint-gregory-vii', 'Saint Gregory VII',
  1015, NULL, NULL, TRUE,
  1085, 5, 25, FALSE,
  11,
  (SELECT id FROM places WHERE code='SOVANA'),
  (SELECT id FROM places WHERE code='SALERNO'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-mary-magdalene-de-pazzi', 'Saint Mary Magdalene de’ Pazzi',
  1566, 4, 2, FALSE,
  1607, 5, 25, FALSE,
  16,
  (SELECT id FROM places WHERE code='FLORENCE'),
  (SELECT id FROM places WHERE code='FLORENCE'),
  (SELECT id FROM places WHERE code='FLORENCE')
),
(
  'saint-philip-neri', 'Saint Philip Neri',
  1515, 7, 21, FALSE,
  1595, 5, 26, FALSE,
  16,
  (SELECT id FROM places WHERE code='FLORENCE'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-augustine-of-canterbury', 'Saint Augustine of Canterbury',
  NULL, NULL, NULL, TRUE,
  604, NULL, NULL, TRUE,
  7,
  NULL,
  (SELECT id FROM places WHERE code='CANTERBURY'),
  (SELECT id FROM places WHERE code='CANTERBURY')
),
(
  'saint-paul-vi', 'Saint Paul VI',
  1897, 9, 26, FALSE,
  1978, 8, 6, FALSE,
  20,
  (SELECT id FROM places WHERE code='CONCESIO'),
  (SELECT id FROM places WHERE code='CASTEL_GANDOLFO'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
-- ('saint-joseph-the-worker', 'Saint Joseph the Worker', NULL, NULL, '1st century'),
('saint-athanasius', 'Saint Athanasius', NULL, NULL, 'c. 296–373'),
('saint-philip-apostle', 'Saint Philip, Apostle', NULL, NULL, '1st century'),
('saint-james-the-less-apostle', 'Saint James the Less, Apostle', NULL, NULL, '1st century'),
('saint-john-of-avila', 'Saint John of Ávila', NULL, NULL, '1500–1569'),
('saint-nereus', 'Saint Nereus', NULL, NULL, 'c. 304'),
('saint-achilleus', 'Saint Achilleus', NULL, NULL, 'c. 304'),
('saint-pancras', 'Saint Pancras', NULL, NULL, '1st century'),
('saint-matthias-apostle', 'Saint Matthias, Apostle', NULL, NULL, '1st century'),
('saint-john-i', 'Saint John I', NULL, NULL, '† 526'),
('saint-bernardine-of-siena', 'Saint Bernardine of Siena', NULL, NULL, '1380–1444'),
('saint-christopher-magallanes', 'Saint Christopher Magallanes', NULL, NULL, '1869–1927'),
('saint-rita-of-cascia', 'Saint Rita of Cascia', NULL, NULL, '1381–1457'),
('saint-bede-the-venerable', 'Saint Bede the Venerable', NULL, NULL, 'c. 672–735'),
('saint-gregory-vii', 'Saint Gregory VII', NULL, NULL, '1015–1085'),
('saint-mary-magdalene-de-pazzi', 'Saint Mary Magdalene de'' Pazzi', NULL, NULL, '1566–1607'),
('saint-philip-neri', 'Saint Philip Neri', NULL, NULL, '1515–1595'),
('saint-augustine-of-canterbury', 'Saint Augustine of Canterbury', NULL, NULL, '† 604'),
('saint-paul-vi', 'Saint Paul VI', NULL, NULL, '1897–1978')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
-- ('saint-joseph-the-worker', 'Saint Joseph travailleur', NULL, NULL, 'Ier siècle'),
('saint-athanasius', 'Saint Athanase d''Alexandrie', NULL, NULL, 'v. 296–373'),
('saint-philip-apostle', 'Saint Philippe, apôtre', NULL, NULL, 'Ier siècle'),
('saint-james-the-less-apostle', 'Saint Jacques le Mineur, apôtre', NULL, NULL, 'Ier siècle'),
('saint-john-of-avila', 'Saint Jean d''Ávila', NULL, NULL, '1500–1569'),
('saint-nereus', 'Saint Nérée', NULL, NULL, 'v. 304'),
('saint-achilleus', 'Saint Achillée', NULL, NULL, 'v. 304'),
('saint-pancras', 'Saint Pancrace', NULL, NULL, 'Ier siècle'),
('saint-matthias-apostle', 'Saint Matthias, apôtre', NULL, NULL, 'Ier siècle'),
('saint-john-i', 'Saint Jean I', NULL, NULL, '† 526'),
('saint-bernardine-of-siena', 'Saint Bernardin de Sienne', NULL, NULL, '1380–1444'),
('saint-christopher-magallanes', 'Saint Christopher Magallanes', NULL, NULL, '1869–1927'),
('saint-rita-of-cascia', 'Sainte Rita de Cascia', NULL, NULL, '1381–1457'),
('saint-bede-the-venerable', 'Saint Bède le Vénérable', NULL, NULL, 'v. 672–735'),
('saint-gregory-vii', 'Saint Grégoire VII', NULL, NULL, '1015–1085'),
('saint-mary-magdalene-de-pazzi', 'Sainte Marie-Madeleine de Pazzi', NULL, NULL, '1566–1607'),
('saint-philip-neri', 'Saint Philippe Néri', NULL, NULL, '1515–1595'),
('saint-augustine-of-canterbury', 'Saint Augustin de Cantorbéry', NULL, NULL, '† 604'),
('saint-paul-vi', 'Saint Paul VI', NULL, NULL, '1897–1978')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
-- ('saint-joseph-the-worker', 'Sanctus Iosephus Opifex', NULL, NULL, 'saec. I'),
('saint-athanasius', 'Sanctus Athanasius', NULL, NULL, 'c. 296–373'),
('saint-philip-apostle', 'Sanctus Philippus, Apostolus', NULL, NULL, 'saec. I'),
('saint-james-the-less-apostle', 'Sanctus Iacobus Minor, Apostolus', NULL, NULL, 'saec. I'),
('saint-john-of-avila', 'Sanctus Ioannes Abilaeus', NULL, NULL, '1500–1569'),
('saint-nereus', 'Sanctus Nereus', NULL, NULL, 'c. 304'),
('saint-achilleus', 'Sanctus Achilleus', NULL, NULL, 'c. 304'),
('saint-pancras', 'Sanctus Pancratius', NULL, NULL, 'saec. I'),
('saint-matthias-apostle', 'Sanctus Matthias, Apostolus', NULL, NULL, 'saec. I'),
('saint-john-i', 'Sanctus Ioannes I', NULL, NULL, '† 526'),
('saint-bernardine-of-siena', 'Sanctus Bernardinus Senensis', NULL, NULL, '1380–1444'),
('saint-christopher-magallanes', 'Sanctus Christophorus Magallanes', NULL, NULL, '1869–1927'),
('saint-rita-of-cascia', 'Sancta Rita Casciensis', NULL, NULL, '1381–1457'),
('saint-bede-the-venerable', 'Sanctus Beda Venerabilis', NULL, NULL, 'c. 672–735'),
('saint-gregory-vii', 'Sanctus Gregorius VII', NULL, NULL, '1015–1085'),
('saint-mary-magdalene-de-pazzi', 'Sancta Maria Magdalena de Pazzi', NULL, NULL, '1566–1607'),
('saint-philip-neri', 'Sanctus Philippus Neri', NULL, NULL, '1515–1595'),
('saint-augustine-of-canterbury', 'Sanctus Augustinus Cantuariensis', NULL, NULL, '† 604'),
('saint-paul-vi', 'Sanctus Paulus VI', NULL, NULL, '1897–1978')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- JUNE SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-justin-martyr', 'Saint Justin Martyr',
  90, NULL, NULL, TRUE,
  165, NULL, NULL, TRUE,
  2,
  (SELECT id FROM places WHERE code='NABLUS'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-marcellinus', 'Saint Marcellinus',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-peter-exorcist', 'Saint Peter (Exorcist)',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-charles-lwanga', 'Saints Charles Lwanga and Companions',
  1860, 1, 1, FALSE,
  1886, 6, 3, FALSE,
  19,
  (SELECT id FROM places WHERE code='BUGANDA'),
  (SELECT id FROM places WHERE code='NAMUGONGO'),
  (SELECT id FROM places WHERE code='BUGANDA')
),
(
  'saint-boniface', 'Saint Boniface',
  675, NULL, NULL, TRUE,
  754, 6, 5, FALSE,
  8,
  (SELECT id FROM places WHERE code='CREDITON'),
  (SELECT id FROM places WHERE code='DOKKUM'),
  (SELECT id FROM places WHERE code='MAINZ')
),
(
  'saint-norbert', 'Saint Norbert',
  1080, NULL, NULL, TRUE,
  1134, 6, 6, FALSE,
  12,
  (SELECT id FROM places WHERE code='XANTEN'),
  (SELECT id FROM places WHERE code='MAGDEBURG'),
  (SELECT id FROM places WHERE code='PREMONTRE')
),
(
  'saint-ephrem', 'Saint Ephrem the Syrian',
  306, NULL, NULL, TRUE,
  373, 6, 9, TRUE,
  4,
  (SELECT id FROM places WHERE code='NISIBIS'),
  (SELECT id FROM places WHERE code='EDESSA'),
  (SELECT id FROM places WHERE code='EDESSA')
),
(
  'saint-barnabas-apostle', 'Saint Barnabas, Apostle',
  NULL, NULL, NULL, TRUE,
  61, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='SALAMIS_CYPRUS'),
  (SELECT id FROM places WHERE code='SALAMIS_CYPRUS'),
  (SELECT id FROM places WHERE code='CYPRUS')
),
(
  'saint-anthony-of-padua', 'Saint Anthony of Padua',
  1195, NULL, NULL, TRUE,
  1231, 6, 13, FALSE,
  13,
  (SELECT id FROM places WHERE code='LISBON'),
  (SELECT id FROM places WHERE code='PADUA'),
  (SELECT id FROM places WHERE code='PADUA')
),
(
  'saint-romuald', 'Saint Romuald',
  951, NULL, NULL, TRUE,
  1027, 6, 19, FALSE,
  10,
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='VAL_DI_CASTRO'),
  (SELECT id FROM places WHERE code='CAMALDOLI')
),
(
  'saint-aloysius-gonzaga', 'Saint Aloysius Gonzaga',
  1568, 3, 9, FALSE,
  1591, 6, 21, FALSE,
  16,
  (SELECT id FROM places WHERE code='CASTIGLIONE_DELLA_STIVIERE'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-paulinus-of-nola', 'Saint Paulinus of Nola',
  354, NULL, NULL, TRUE,
  431, 6, 22, TRUE,
  5,
  (SELECT id FROM places WHERE code='BORDEAUX'),
  (SELECT id FROM places WHERE code='NOLA'),
  (SELECT id FROM places WHERE code='NOLA')
),
(
  'saint-john-fisher', 'Saint John Fisher',
  1469, 10, 19, TRUE,
  1535, 6, 22, FALSE,
  16,
  (SELECT id FROM places WHERE code='BEVERLEY'),
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='ROCHESTER')
),
(
  'saint-thomas-more', 'Saint Thomas More',
  1478, 2, 7, FALSE,
  1535, 7, 6, FALSE,
  16,
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='LONDON')
),
(
  'saint-peter-apostle', 'Saint Peter, Apostle',
  NULL, NULL, NULL, TRUE,
  64, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-cyril-of-alexandria', 'Saint Cyril of Alexandria',
  376, NULL, NULL, TRUE,
  444, 6, 27, FALSE,
  5,
  NULL,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-irenaeus', 'Saint Irenaeus',
  122, NULL, NULL, TRUE,
  200, NULL, NULL, TRUE,
  2,
  (SELECT id FROM places WHERE code='SMYRNA'),
  (SELECT id FROM places WHERE code='LYON'),
  (SELECT id FROM places WHERE code='LYON')
)
-- (
--   'first-martyrs-of-holy-roman-church', 'First Martyrs of the Holy Roman Church',
--   NULL, NULL, NULL, TRUE,
--   NULL, 6, 30, TRUE,
--   1,
--   NULL,
--   (SELECT id FROM places WHERE code='ROME'),
--   (SELECT id FROM places WHERE code='ROME')
-- )
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-justin-martyr', 'Saint Justin Martyr', NULL, NULL, '† 165'),
('saint-marcellinus', 'Saint Marcellinus', NULL, NULL, '† 304'),
('saint-peter-exorcist', 'Saint Peter (Exorcist)', NULL, NULL, '† 304'),
('saint-charles-lwanga', 'Saint Charles Lwanga', NULL, NULL, '1860–1886'),
('saint-boniface', 'Saint Boniface', NULL, NULL, 'c. 675–754'),
('saint-norbert', 'Saint Norbert', NULL, NULL, '1080–1134'),
('saint-ephrem', 'Saint Ephrem the Syrian', NULL, NULL, 'c. 306–373'),
('saint-barnabas-apostle', 'Saint Barnabas, Apostle', NULL, NULL, '1st century'),
('saint-anthony-of-padua', 'Saint Anthony of Padua', NULL, NULL, '1195–1231'),
('saint-romuald', 'Saint Romuald', NULL, NULL, '951–1027'),
('saint-aloysius-gonzaga', 'Saint Aloysius Gonzaga', NULL, NULL, '1568–1591'),
('saint-paulinus-of-nola', 'Saint Paulinus of Nola', NULL, NULL, '354–431'),
('saint-john-fisher', 'Saint John Fisher', NULL, NULL, '1469–1535'),
('saint-thomas-more', 'Saint Thomas More', NULL, NULL, '1478–1535'),
('saint-peter-apostle', 'Saint Peter, Apostle', NULL, NULL, '1st century'),
('saint-cyril-of-alexandria', 'Saint Cyril of Alexandria', NULL, NULL, 'c. 376–444'),
('saint-irenaeus', 'Saint Irenaeus', NULL, NULL, 'c. 130–202')
-- ('first-martyrs-of-holy-roman-church', 'First Martyrs of the Holy Roman Church', NULL, NULL, '1st century')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-justin-martyr', 'Saint Justin Martyr', NULL, NULL, '† 165'),
('saint-marcellinus', 'Saint Marcellin', NULL, NULL, '† 304'),
('saint-peter-exorcist', 'Saint Pierre (exorciste)', NULL, NULL, '† 304'),
('saint-charles-lwanga', 'Saint Charles Lwanga', NULL, NULL, '1860–1886'),
('saint-boniface', 'Saint Boniface', NULL, NULL, 'v. 675–754'),
('saint-norbert', 'Saint Norbert', NULL, NULL, '1080–1134'),
('saint-ephrem', 'Saint Éphrem le Syrien', NULL, NULL, 'v. 306–373'),
('saint-barnabas-apostle', 'Saint Barnabas, apôtre', NULL, NULL, 'Ier siècle'),
('saint-anthony-of-padua', 'Saint Antoine de Padoue', NULL, NULL, '1195–1231'),
('saint-romuald', 'Saint Romuald', NULL, NULL, '951–1027'),
('saint-aloysius-gonzaga', 'Saint Aloysius Gonzaga', NULL, NULL, '1568–1591'),
('saint-paulinus-of-nola', 'Saint Paulin de Nole', NULL, NULL, '354–431'),
('saint-john-fisher', 'Saint John Fisher', NULL, NULL, '1469–1535'),
('saint-thomas-more', 'Saint Thomas More', NULL, NULL, '1478–1535'),
('saint-peter-apostle', 'Saint Pierre, apôtre', NULL, NULL, 'Ier siècle'),
('saint-cyril-of-alexandria', 'Saint Cyrille d''Alexandrie', NULL, NULL, 'v. 376–444'),
('saint-irenaeus', 'Saint Irénée', NULL, NULL, 'v. 130–202')
-- ('first-martyrs-of-holy-roman-church', 'Premiers martyrs de la Sainte Église romaine', NULL, NULL, 'Ier siècle')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-justin-martyr', 'Sanctus Justinus Martyr', NULL, NULL, '† 165'),
('saint-marcellinus', 'Sanctus Marcellinus', NULL, NULL, '† 304'),
('saint-peter-exorcist', 'Sanctus Petrus Exorcista', NULL, NULL, '† 304'),
('saint-charles-lwanga', 'Sanctus Carolus Lwanga', NULL, NULL, '1860–1886'),
('saint-boniface', 'Sanctus Bonifatius', NULL, NULL, 'c. 675–754'),
('saint-norbert', 'Sanctus Norbertus', NULL, NULL, '1080–1134'),
('saint-ephrem', 'Sanctus Ephraem Syrius', NULL, NULL, 'c. 306–373'),
('saint-barnabas-apostle', 'Sanctus Barnabas, Apostolus', NULL, NULL, 'saec. I'),
('saint-anthony-of-padua', 'Sanctus Antonius Patavinus', NULL, NULL, '1195–1231'),
('saint-romuald', 'Sanctus Romualdus', NULL, NULL, '951–1027'),
('saint-aloysius-gonzaga', 'Sanctus Aloysius Gonzaga', NULL, NULL, '1568–1591'),
('saint-paulinus-of-nola', 'Sanctus Paulinus Nola', NULL, NULL, '354–431'),
('saint-john-fisher', 'Sanctus Ioannes Fisher', NULL, NULL, '1469–1535'),
('saint-thomas-more', 'Sanctus Thomas More', NULL, NULL, '1478–1535'),
('saint-peter-apostle', 'Sanctus Petrus, Apostolus', NULL, NULL, 'saec. I'),
('saint-cyril-of-alexandria', 'Sanctus Cyrillus Alexandrinus', NULL, NULL, 'c. 376–444'),
('saint-irenaeus', 'Sanctus Irenaeus', NULL, NULL, 'c. 130–202')
-- ('first-martyrs-of-holy-roman-church', 'Primi Martyrum Sanctae Ecclesiae Romanae', NULL, NULL, 'saec. I')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- JULY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-thomas-apostle', 'Saint Thomas, Apostle',
  NULL, NULL, NULL, TRUE,
  72, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='MYLAPORE'),
  (SELECT id FROM places WHERE code='MYLAPORE')
),
(
  'saint-elizabeth-of-portugal', 'Saint Elizabeth of Portugal',
  1271, 1, 4, FALSE,
  1336, 7, 4, FALSE,
  14,
  (SELECT id FROM places WHERE code='SARAGOSSA'),
  (SELECT id FROM places WHERE code='ESTREMOZ'),
  (SELECT id FROM places WHERE code='LISBON')
),
(
  'saint-anthony-zaccaria', 'Saint Anthony Zaccaria',
  1502, NULL, NULL, TRUE,
  1539, 7, 5, FALSE,
  16,
  (SELECT id FROM places WHERE code='CREMONA'),
  (SELECT id FROM places WHERE code='CREMONA'),
  (SELECT id FROM places WHERE code='MILAN')
),
(
  'saint-maria-goretti', 'Saint Maria Goretti',
  1890, 10, 16, FALSE,
  1902, 7, 6, FALSE,
  20,
  (SELECT id FROM places WHERE code='CORINALDO'),
  (SELECT id FROM places WHERE code='NETTUNO'),
  (SELECT id FROM places WHERE code='LE_FERRIERE')
),
(
  'saint-augustine-zhao-rong', 'Saint Augustine Zhao Rong and Companions',
  1746, NULL, NULL, TRUE,
  1815, 1, 27, TRUE,
  19,
  (SELECT id FROM places WHERE code='WUCHUAN_GZ'),
  (SELECT id FROM places WHERE code='CHENGDU'),
  (SELECT id FROM places WHERE code='CHINA')
),
(
  'saint-benedict', 'Saint Benedict, Abbot',
  480, 3, 2, TRUE,
  547, 3, 21, FALSE,
  6,
  (SELECT id FROM places WHERE code='NORCIA'),
  (SELECT id FROM places WHERE code='MONTECASSINO'),
  (SELECT id FROM places WHERE code='MONTECASSINO')
),
(
  'saint-henry', 'Saint Henry',
  973, 5, 6, TRUE,
  1024, 7, 13, FALSE,
  11,
  (SELECT id FROM places WHERE code='BAD_ABBACH'),
  (SELECT id FROM places WHERE code='GOTTINGEN'),
  (SELECT id FROM places WHERE code='HOLY_ROMAN_EMPIRE')
),
(
  'saint-camillus-de-lellis', 'Saint Camillus de Lellis',
  1550, 5, 25, TRUE,
  1614, 7, 14, FALSE,
  17,
  (SELECT id FROM places WHERE code='BUCCHIANICO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-bonaventure', 'Saint Bonaventure',
  1217, NULL, NULL, TRUE,
  1274, 7, 15, FALSE,
  13,
  (SELECT id FROM places WHERE code='BAGNOREGIO'),
  (SELECT id FROM places WHERE code='LYON'),
  (SELECT id FROM places WHERE code='PARIS')
),
-- (
--   'our-lady-of-mount-carmel', 'Our Lady of Mount Carmel',
--   NULL, NULL, NULL, TRUE,
--   NULL, 7, 16, TRUE,
--   NULL,
--   NULL, NULL,
--   (SELECT id FROM places WHERE code='MOUNT_CARMEL')
-- ),
(
  'saint-apollinaris', 'Saint Apollinaris',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  2,
  NULL,
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='RAVENNA')
),
(
  'saint-lawrence-of-brindisi', 'Saint Lawrence of Brindisi',
  1559, 7, 22, TRUE,
  1619, 7, 22, FALSE,
  16,
  (SELECT id FROM places WHERE code='BRINDISI'),
  (SELECT id FROM places WHERE code='LISBON'),
  (SELECT id FROM places WHERE code='ITALY')
),
(
  'saint-mary-magdalene', 'Saint Mary Magdalene',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='MAGDALA'),
  (SELECT id FROM places WHERE code='SAINTE_BEAUME'),
  (SELECT id FROM places WHERE code='GALILEE')
),
(
  'saint-bridget', 'Saint Bridget',
  1303, NULL, NULL, TRUE,
  1373, 7, 23, FALSE,
  14,
  (SELECT id FROM places WHERE code='UPPLAND'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-sharbel-makhluf', 'Saint Sharbel Makhluf',
  1828, 5, 8, FALSE,
  1898, 12, 24, FALSE,
  19,
  (SELECT id FROM places WHERE code='BEKAAKAFRA'),
  (SELECT id FROM places WHERE code='ANNAYA_MONASTERY'),
  (SELECT id FROM places WHERE code='ANNAYA_MONASTERY')
),
(
  'saint-james-apostle', 'Saint James, Apostle',
  NULL, NULL, NULL, TRUE,
  44, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='GALILEE')
),
(
  'saint-joachim', 'Saint Joachim',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL, (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-anne', 'Saint Anne',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL, (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-martha-of-bethany', 'Saint Martha of Bethany',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL,
  (SELECT id FROM places WHERE code='BETHANY')
),
(
  'saint-mary-of-bethany', 'Saint Mary of Bethany',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL,
  (SELECT id FROM places WHERE code='BETHANY')
),
(
  'saint-lazarus-of-bethany', 'Saint Lazarus of Bethany',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL,
  (SELECT id FROM places WHERE code='BETHANY')
),
(
  'saint-peter-chrysologus', 'Saint Peter Chrysologus',
  406, NULL, NULL, TRUE,
  450, 7, 31, TRUE,
  5,
  (SELECT id FROM places WHERE code='IMOLA'),
  (SELECT id FROM places WHERE code='IMOLA'),
  (SELECT id FROM places WHERE code='RAVENNA')
),
(
  'saint-ignatius-of-loyola', 'Saint Ignatius of Loyola',
  1491, 10, 23, TRUE,
  1556, 7, 31, FALSE,
  16,
  (SELECT id FROM places WHERE code='LOYOLA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-thomas-apostle', 'Saint Thomas, Apostle', NULL, NULL, '1st century'),
('saint-elizabeth-of-portugal', 'Saint Elizabeth of Portugal', NULL, NULL, '† 1336'),
('saint-anthony-zaccaria', 'Saint Anthony Zaccaria', NULL, NULL, '1502–1539'),
('saint-maria-goretti', 'Saint Maria Goretti', NULL, NULL, '1890–1902'),
('saint-augustine-zhao-rong', 'Saint Augustine Zhao Rong and Companions', NULL, NULL, '1746–1815'),
('saint-benedict', 'Saint Benedict, Abbot', NULL, NULL, 'c. 480–547'),
('saint-henry', 'Saint Henry', NULL, NULL, '973–1024'),
('saint-camillus-de-lellis', 'Saint Camillus de Lellis', NULL, NULL, '1550–1614'),
('saint-bonaventure', 'Saint Bonaventure', NULL, NULL, '1217–1274'),
-- ('our-lady-of-mount-carmel', 'Our Lady of Mount Carmel', NULL, NULL, ''),
('saint-apollinaris', 'Saint Apollinaris', NULL, NULL, '1st century'),
('saint-lawrence-of-brindisi', 'Saint Lawrence of Brindisi', NULL, NULL, '1559–1619'),
('saint-mary-magdalene', 'Saint Mary Magdalene', NULL, NULL, '1st century'),
('saint-bridget', 'Saint Bridget of Sweden', NULL, NULL, '1303–1373'),
('saint-sharbel-makhluf', 'Saint Sharbel Makhluf', NULL, NULL, '1828–1898'),
('saint-james-apostle', 'Saint James the Greater', NULL, NULL, '1st century'),
(
  'saint-joachim',
  'Saint Joachim',
  NULL,
  NULL,
  '1st century'
),
(
  'saint-anne',
  'Saint Anne',
  NULL,
  NULL,
  '1st century'
),
('saint-martha-of-bethany', 'Saint Martha of Bethany', NULL, NULL, '1st century'),
('saint-mary-of-bethany', 'Saint Mary of Bethany', NULL, NULL, '1st century'),
('saint-lazarus-of-bethany', 'Saint Lazarus of Bethany', NULL, NULL, '1st century'),
('saint-peter-chrysologus', 'Saint Peter Chrysologus', NULL, NULL, '406–450'),
('saint-ignatius-of-loyola', 'Saint Ignatius of Loyola', NULL, NULL, '1491–1556')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-thomas-apostle', 'Saint Thomas, apôtre', NULL, NULL, 'Ier siècle'),
('saint-elizabeth-of-portugal', 'Sainte Élisabeth du Portugal', NULL, NULL, '† 1336'),
('saint-anthony-zaccaria', 'Saint Antoine Zaccaria', NULL, NULL, '1502–1539'),
('saint-maria-goretti', 'Sainte Maria Goretti', NULL, NULL, '1890–1902'),
('saint-augustine-zhao-rong', 'Saint Augustin Zhao Rong et compagnons', NULL, NULL, '1746–1815'),
('saint-benedict', 'Saint Benoît, abbé', NULL, NULL, 'v. 480–547'),
('saint-henry', 'Saint Henri', NULL, NULL, '973–1024'),
('saint-camillus-de-lellis', 'Saint Camille de Lellis', NULL, NULL, '1550–1614'),
('saint-bonaventure', 'Saint Bonaventure', NULL, NULL, '1217–1274'),
-- ('our-lady-of-mount-carmel', 'Notre-Dame du Mont-Carmel', NULL, NULL, ''),
('saint-apollinaris', 'Saint Apollinaire', NULL, NULL, 'Ier siècle'),
('saint-lawrence-of-brindisi', 'Saint Laurent de Brindes', NULL, NULL, '1559–1619'),
('saint-mary-magdalene', 'Sainte Marie-Madeleine', NULL, NULL, 'Ier siècle'),
('saint-bridget', 'Sainte Brigitte de Suède', NULL, NULL, '1303–1373'),
('saint-sharbel-makhluf', 'Saint Charbel Makhlouf', NULL, NULL, '1828–1898'),
('saint-james-apostle', 'Saint Jacques le Majeur', NULL, NULL, 'Ier siècle'),
(
  'saint-joachim',
  'Saint Joachim',
  NULL,
  NULL,
  'Ier siècle'
),
(
  'saint-anne',
  'Sainte Anne',
  NULL,
  NULL,
  'Ier siècle'
),
('saint-martha-of-bethany', 'Sainte Marthe de Béthanie', NULL, NULL, 'Ier siècle'),
('saint-mary-of-bethany', 'Sainte Marie de Béthanie', NULL, NULL, 'Ier siècle'),
('saint-lazarus-of-bethany', 'Saint Lazare de Béthanie', NULL, NULL, 'Ier siècle'),
('saint-peter-chrysologus', 'Saint Pierre Chrysologue', NULL, NULL, '406–450'),
('saint-ignatius-of-loyola', 'Saint Ignace de Loyola', NULL, NULL, '1491–1556')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-thomas-apostle', 'Sanctus Thomas Apostolus', NULL, NULL, 'saec. I'),
('saint-elizabeth-of-portugal', 'Sancta Elisabeth Lusitaniae', NULL, NULL, '† 1336'),
('saint-anthony-zaccaria', 'Sanctus Antonius Zaccaria', NULL, NULL, '1502–1539'),
('saint-maria-goretti', 'Sancta Maria Goretti', NULL, NULL, '1890–1902'),
('saint-augustine-zhao-rong', 'Sanctus Augustinus Zhao Rong et Socii', NULL, NULL, '1746–1815'),
('saint-benedict', 'Sanctus Benedictus Abbas', NULL, NULL, 'c. 480–547'),
('saint-henry', 'Sanctus Henricus', NULL, NULL, '973–1024'),
('saint-camillus-de-lellis', 'Sanctus Camillus de Lellis', NULL, NULL, '1550–1614'),
('saint-bonaventure', 'Sanctus Bonaventura', NULL, NULL, '1217–1274'),
-- ('our-lady-of-mount-carmel', 'Beata Maria Virgo de Monte Carmelo', NULL, NULL, ''),
('saint-apollinaris', 'Sanctus Apollinaris', NULL, NULL, 'saec. I'),
('saint-lawrence-of-brindisi', 'Sanctus Laurentius Brundisii', NULL, NULL, '1559–1619'),
('saint-mary-magdalene', 'Sancta Maria Magdalena', NULL, NULL, 'saec. I'),
('saint-bridget', 'Sancta Brigitta Suecica', NULL, NULL, '1303–1373'),
('saint-sharbel-makhluf', 'Sanctus Sharbel Makhluf', NULL, NULL, '1828–1898'),
('saint-james-apostle', 'Sanctus Jacobus Maior', NULL, NULL, 'saec. I'),
(
  'saint-joachim',
  'Sanctus Ioachim',
  NULL,
  NULL,
  'saec. I'
),
(
  'saint-anne',
  'Sancta Anna',
  NULL,
  NULL,
  'saec. I'
),
('saint-martha-of-bethany', 'Sancta Martha Bethaniae', NULL, NULL, 'saec. I'),
('saint-mary-of-bethany', 'Sancta Maria Bethaniae', NULL, NULL, 'saec. I'),
('saint-lazarus-of-bethany', 'Sanctus Lazarus Bethaniae', NULL, NULL, 'saec. I'),
('saint-peter-chrysologus', 'Sanctus Petrus Chrysologus', NULL, NULL, '406–450'),
('saint-ignatius-of-loyola', 'Sanctus Ignatius Loyola', NULL, NULL, '1491–1556')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- AUGUST SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-alphonsus-liguori', 'Saint Alphonsus Liguori',
  1696, 9, 27, FALSE,
  1787, 8, 1, FALSE,
  18,
  (SELECT id FROM places WHERE code='NAPLES'),
  (SELECT id FROM places WHERE code='PAGANI'),
  (SELECT id FROM places WHERE code='NAPLES')
),
(
  'saint-eusebius-of-vercelli', 'Saint Eusebius of Vercelli',
  283, 3, 2, TRUE,
  371, 8, 1, TRUE,
  4,
  (SELECT id FROM places WHERE code='SARDINIA'),
  (SELECT id FROM places WHERE code='VERCELLI'),
  (SELECT id FROM places WHERE code='VERCELLI')
),
(
  'saint-peter-julian-eymard', 'Saint Peter Julian Eymard',
  1811, 2, 4, FALSE,
  1868, 8, 1, FALSE,
  19,
  (SELECT id FROM places WHERE code='LA_MURE'),
  (SELECT id FROM places WHERE code='LA_MURE'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-john-vianney', 'Saint John Vianney',
  1786, 5, 8, FALSE,
  1859, 8, 4, FALSE,
  19,
  (SELECT id FROM places WHERE code='DARDILLY'),
  (SELECT id FROM places WHERE code='ARS'),
  (SELECT id FROM places WHERE code='ARS')
),
-- (
--   'dedication-basilica-santa-maria-maggiore', 'Dedication of the Basilica of Saint Mary Major',
--   NULL, NULL, NULL, TRUE,
--   NULL, 8, 5, TRUE,
--   NULL,
--   NULL, NULL, (SELECT id FROM places WHERE code='ROME')
-- ),
-- (
--   'transfiguration-of-the-lord', 'The Transfiguration of the Lord',
--   NULL, NULL, NULL, TRUE,
--   NULL, 8, 6, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-sixtus-ii-and-companions', 'Saint Sixtus II and Companions',
  195, NULL, NULL, TRUE,
  258, 8, 6, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-cajetan', 'Saint Cajetan',
  1480, 10, NULL, TRUE,
  1547, 8, 7, FALSE,
  16,
  (SELECT id FROM places WHERE code='VICENZA'),
  (SELECT id FROM places WHERE code='NAPLES'),
  (SELECT id FROM places WHERE code='NAPLES')
),
(
  'saint-dominic', 'Saint Dominic',
  1170, NULL, NULL, TRUE,
  1221, 8, 6, FALSE,
  13,
  (SELECT id FROM places WHERE code='CALERUEGA'),
  (SELECT id FROM places WHERE code='BOLOGNA'),
  (SELECT id FROM places WHERE code='TOULOUSE')
),
(
  'saint-teresa-benedicta-of-the-cross', 'Saint Teresa Benedicta of the Cross (Edith Stein)',
  1891, 10, 12, FALSE,
  1942, 8, 9, FALSE,
  20,
  (SELECT id FROM places WHERE code='WROCLAW'),
  (SELECT id FROM places WHERE code='AUSCHWITZ'),
  (SELECT id FROM places WHERE code='COLOGNE')
),
(
  'saint-lawrence', 'Saint Lawrence, Deacon and Martyr',
  225, NULL, NULL, TRUE,
  258, 8, 10, TRUE,
  3,
  (SELECT id FROM places WHERE code='HUESCA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-clare', 'Saint Clare',
  1194, 7, 16, TRUE,
  1253, 8, 11, FALSE,
  13,
  (SELECT id FROM places WHERE code='ASSISI'),
  (SELECT id FROM places WHERE code='SAN_DAMIANO_ASSISI'),
  (SELECT id FROM places WHERE code='SAN_DAMIANO_ASSISI')
),
(
  'saint-jane-frances-de-chantal', 'Saint Jane Frances de Chantal',
  1572, 1, 23, FALSE,
  1641, 12, 13, FALSE,
  16,
  (SELECT id FROM places WHERE code='DIJON'),
  (SELECT id FROM places WHERE code='MOULINS'),
  (SELECT id FROM places WHERE code='ANNECY')
),
(
  'saint-pontian', 'Saint Pontian',
  NULL, NULL, NULL, TRUE,
  235, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='SARDINIA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-hippolytus-of-rome', 'Saint Hippolytus of Rome',
  170, NULL, NULL, TRUE,
  235, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='SARDINIA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-maximus-the-confessor', 'Saint Maximus the Confessor',
  580, NULL, NULL, TRUE,
  662, 8, 13, TRUE,
  7,
  (SELECT id FROM places WHERE code='CONSTANTINOPLE'),
  (SELECT id FROM places WHERE code='KHIRSA_MONASTERY'),
  (SELECT id FROM places WHERE code='CONSTANTINOPLE')
),
(
  'saint-maximilian-kolbe', 'Saint Maximilian Kolbe',
  1894, 1, 8, FALSE,
  1941, 8, 14, FALSE,
  20,
  (SELECT id FROM places WHERE code='ZDUNSKA_WOLA'),
  (SELECT id FROM places WHERE code='AUSCHWITZ'),
  (SELECT id FROM places WHERE code='NIEPOKALANOW')
),
(
  'saint-stephen-of-hungary', 'Saint Stephen of Hungary',
  975, NULL, NULL, TRUE,
  1038, 8, 15, FALSE,
  11,
  (SELECT id FROM places WHERE code='ESZTERGOM'),
  (SELECT id FROM places WHERE code='SZEKESFEHERVAR'),
  (SELECT id FROM places WHERE code='ESZTERGOM')
),
(
  'saint-john-eudes', 'Saint John Eudes',
  1601, 11, 14, FALSE,
  1680, 8, 19, FALSE,
  17,
  (SELECT id FROM places WHERE code='RI_ORNE'),
  (SELECT id FROM places WHERE code='CAEN'),
  (SELECT id FROM places WHERE code='CAEN')
),
(
  'saint-bernard', 'Saint Bernard (of Clairvaux)',
  1090, NULL, NULL, TRUE,
  1153, 8, 20, FALSE,
  12,
  (SELECT id FROM places WHERE code='FONTAINE_LES_DIJON'),
  (SELECT id FROM places WHERE code='CLAIRVAUX'),
  (SELECT id FROM places WHERE code='CLAIRVAUX')
),
(
  'saint-pius-x', 'Saint Pius X',
  1835, 6, 2, FALSE,
  1914, 8, 20, FALSE,
  20,
  (SELECT id FROM places WHERE code='RIESE_PIO_X'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-rose-of-lima', 'Saint Rose of Lima',
  1586, 4, 30, FALSE,
  1617, 8, 24, FALSE,
  17,
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA')
),
(
  'saint-bartholomew-apostle', 'Saint Bartholomew, Apostle',
  NULL, NULL, NULL, TRUE,
  70, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='ARMENIA'),
  (SELECT id FROM places WHERE code='ARMENIA')
),
(
  'saint-louis', 'Saint Louis (King of France)',
  1214, 4, 25, FALSE,
  1270, 8, 25, FALSE,
  13,
  (SELECT id FROM places WHERE code='POISSY'),
  (SELECT id FROM places WHERE code='TUNIS'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-joseph-calasanz', 'Saint Joseph Calasanz',
  1557, 9, 11, FALSE,
  1648, 8, 25, FALSE,
  16,
  (SELECT id FROM places WHERE code='PERALTA_DE_LA_SAL'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-monica', 'Saint Monica',
  332, NULL, NULL, TRUE,
  387, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='TAGASTE'),
  (SELECT id FROM places WHERE code='OSTIA'),
  (SELECT id FROM places WHERE code='OSTIA')
),
(
  'saint-augustine-of-hippo', 'Saint Augustine of Hippo',
  354, 11, 13, FALSE,
  430, 8, 28, FALSE,
  5,
  (SELECT id FROM places WHERE code='TAGASTE'),
  (SELECT id FROM places WHERE code='HIPPO_REGIUS'),
  (SELECT id FROM places WHERE code='HIPPO_REGIUS')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-alphonsus-liguori', 'Saint Alphonsus Liguori', NULL, NULL, '1696–1787'),
('saint-eusebius-of-vercelli', 'Saint Eusebius of Vercelli', NULL, NULL, '† 371'),
('saint-peter-julian-eymard', 'Saint Peter Julian Eymard', NULL, NULL, '1811–1868'),
('saint-john-vianney', 'Saint John Vianney', NULL, NULL, '1786–1859'),
-- ('dedication-basilica-santa-maria-maggiore', 'Dedication of the Basilica of Saint Mary Major', NULL, NULL, ''),
-- ('transfiguration-of-the-lord', 'The Transfiguration of the Lord', NULL, NULL, ''),
('saint-sixtus-ii-and-companions', 'Saint Sixtus II and Companions', NULL, NULL, '† 258'),
('saint-cajetan', 'Saint Cajetan', NULL, NULL, '1480–1547'),
('saint-dominic', 'Saint Dominic', NULL, NULL, '1170–1221'),
('saint-teresa-benedicta-of-the-cross', 'Saint Teresa Benedicta of the Cross (Edith Stein)', NULL, NULL, '1891–1942'),
('saint-lawrence', 'Saint Lawrence, Deacon and Martyr', NULL, NULL, '† 258'),
('saint-clare', 'Saint Clare', NULL, NULL, '1194–1253'),
('saint-jane-frances-de-chantal', 'Saint Jane Frances de Chantal', NULL, NULL, '1572–1641'),
('saint-pontian', 'Saint Pontian', NULL, NULL, '† 235'),
('saint-hippolytus-of-rome', 'Saint Hippolytus of Rome', NULL, NULL, '† 235'),
('saint-maximus-the-confessor', 'Saint Maximus the Confessor', NULL, NULL, 'c. 580–662'),
('saint-maximilian-kolbe', 'Saint Maximilian Kolbe', NULL, NULL, '1894–1941'),
('saint-stephen-of-hungary', 'Saint Stephen of Hungary', NULL, NULL, '975–1038'),
('saint-john-eudes', 'Saint John Eudes', NULL, NULL, '1601–1680'),
('saint-bernard', 'Saint Bernard of Clairvaux', NULL, NULL, '1090–1153'),
('saint-pius-x', 'Saint Pius X', NULL, NULL, '1835–1914'),
('saint-rose-of-lima', 'Saint Rose of Lima', NULL, NULL, '1586–1617'),
('saint-bartholomew-apostle', 'Saint Bartholomew, Apostle', NULL, NULL, '1st century'),
('saint-louis', 'Saint Louis (King of France)', NULL, NULL, '1214–1270'),
('saint-joseph-calasanz', 'Saint Joseph Calasanz', NULL, NULL, '1557–1648'),
('saint-monica', 'Saint Monica', NULL, NULL, 'c. 332–387'),
('saint-augustine-of-hippo', 'Saint Augustine of Hippo', NULL, NULL, '354–430')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-alphonsus-liguori', 'Saint Alphonse de Liguori', NULL, NULL, '1696–1787'),
('saint-eusebius-of-vercelli', 'Saint Eusèbe de Vérceil', NULL, NULL, '† 371'),
('saint-peter-julian-eymard', 'Saint Pierre-Julien Eymard', NULL, NULL, '1811–1868'),
('saint-john-vianney', 'Saint Jean-Marie Vianney', NULL, NULL, '1786–1859'),
-- ('dedication-basilica-santa-maria-maggiore', 'Dédicace de la Basilique Sainte-Marie-Majeure', NULL, NULL, ''),
-- ('transfiguration-of-the-lord', 'Transfiguration du Seigneur', NULL, NULL, ''),
('saint-sixtus-ii-and-companions', 'Saint Sixte II et compagnons', NULL, NULL, '† 258'),
('saint-cajetan', 'Saint Gaëtan (Cajetan)', NULL, NULL, '1480–1547'),
('saint-dominic', 'Saint Dominique', NULL, NULL, '1170–1221'),
('saint-teresa-benedicta-of-the-cross', 'Sainte Thérèse-Bénédicte de la Croix (Edith Stein)', NULL, NULL, '1891–1942'),
('saint-lawrence', 'Saint Laurent', NULL, NULL, '† 258'),
('saint-clare', 'Sainte Claire d''Assise', NULL, NULL, '1194–1253'),
('saint-jane-frances-de-chantal', 'Sainte Jeanne-Françoise de Chantal', NULL, NULL, '1572–1641'),
('saint-pontian', 'Saint Pontien', NULL, NULL, '† 235'),
('saint-hippolytus-of-rome', 'Saint Hippolyte de Rome', NULL, NULL, '† 235'),
('saint-maximus-the-confessor', 'Saint Maxime le Confesseur', NULL, NULL, 'v. 580–662'),
('saint-maximilian-kolbe', 'Saint Maximilien Kolbe', NULL, NULL, '1894–1941'),
('saint-stephen-of-hungary', 'Saint Étienne de Hongrie', NULL, NULL, '975–1038'),
('saint-john-eudes', 'Saint Jean Eudes', NULL, NULL, '1601–1680'),
('saint-bernard', 'Saint Bernard de Clairvaux', NULL, NULL, '1090–1153'),
('saint-pius-x', 'Saint Pie X', NULL, NULL, '1835–1914'),
('saint-rose-of-lima', 'Sainte Rose de Lima', NULL, NULL, '1586–1617'),
('saint-bartholomew-apostle', 'Saint Barthélemy, apôtre', NULL, NULL, 'Ier siècle'),
('saint-louis', 'Saint Louis (roi de France)', NULL, NULL, '1214–1270'),
('saint-joseph-calasanz', 'Saint Joseph Calasanz', NULL, NULL, '1557–1648'),
('saint-monica', 'Sainte Monique', NULL, NULL, 'v. 332–387'),
('saint-augustine-of-hippo', 'Saint Augustin d''Hippo', NULL, NULL, '354–430')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-alphonsus-liguori', 'Sanctus Alphonsus Liguori', NULL, NULL, '1696–1787'),
('saint-eusebius-of-vercelli', 'Sanctus Eusebius Vercellensis', NULL, NULL, '† 371'),
('saint-peter-julian-eymard', 'Sanctus Petrus Iulianus Eymard', NULL, NULL, '1811–1868'),
('saint-john-vianney', 'Sanctus Ioannes Maria Vianney', NULL, NULL, '1786–1859'),
-- ('dedication-basilica-santa-maria-maggiore', 'Dedicatio Basilicae Sanctae Mariae Majoris', NULL, NULL, ''),
-- ('transfiguration-of-the-lord', 'Transfiguratio Domini', NULL, NULL, ''),
('saint-sixtus-ii-and-companions', 'Sanctus Sixtus II et Socii', NULL, NULL, '† 258'),
('saint-cajetan', 'Sanctus Cajetanus', NULL, NULL, '1480–1547'),
('saint-dominic', 'Sanctus Dominicus', NULL, NULL, '1170–1221'),
('saint-teresa-benedicta-of-the-cross', 'Sancta Teresia Benedicta a Cruce (Edith Stein)', NULL, NULL, '1891–1942'),
('saint-lawrence', 'Sanctus Laurentius', NULL, NULL, '† 258'),
('saint-clare', 'Sancta Clara Assisiensis', NULL, NULL, '1194–1253'),
('saint-jane-frances-de-chantal', 'Sancta Ioanna-Francesca de Chantal', NULL, NULL, '1572–1641'),
('saint-pontian', 'Sanctus Pontianus', NULL, NULL, '† 235'),
('saint-hippolytus-of-rome', 'Sanctus Hippolytus Romanus', NULL, NULL, '† 235'),
('saint-maximus-the-confessor', 'Sanctus Maximus Confessor', NULL, NULL, 'c. 580–662'),
('saint-maximilian-kolbe', 'Sanctus Maximilianus Kolbe', NULL, NULL, '1894–1941'),
('saint-stephen-of-hungary', 'Sanctus Stephanus Hungariae', NULL, NULL, '975–1038'),
('saint-john-eudes', 'Sanctus Ioannes Eudes', NULL, NULL, '1601–1680'),
('saint-bernard', 'Sanctus Bernardus Claravallensis', NULL, NULL, '1090–1153'),
('saint-pius-x', 'Sanctus Pius X', NULL, NULL, '1835–1914'),
('saint-rose-of-lima', 'Sancta Rosa Limae', NULL, NULL, '1586–1617'),
('saint-bartholomew-apostle', 'Sanctus Bartholomaeus, Apostolus', NULL, NULL, 'saec. I'),
('saint-louis', 'Sanctus Ludovicus Franciae', NULL, NULL, '1214–1270'),
('saint-joseph-calasanz', 'Sanctus Iosephus Calasanctius', NULL, NULL, '1557–1648'),
('saint-monica', 'Sancta Monica', NULL, NULL, 'c. 332–387'),
('saint-augustine-of-hippo', 'Sanctus Augustinus Hipponensis', NULL, NULL, '354–430')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- SEPTEMBER SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-gregory-the-great', 'Saint Gregory the Great',
  540, NULL, NULL, TRUE,
  604, 3, 12, FALSE,
  7,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-teresa-of-calcutta', 'Saint Teresa of Calcutta',
  1910, 8, 26, FALSE,
  1997, 9, 5, FALSE,
  20,
  (SELECT id FROM places WHERE code='SKOPJE'),
  (SELECT id FROM places WHERE code='CALCUTTA'),
  (SELECT id FROM places WHERE code='CALCUTTA')
),
(
  'saint-peter-claver', 'Saint Peter Claver',
  1580, 6, 26, TRUE,
  1654, 9, 8, FALSE,
  17,
  (SELECT id FROM places WHERE code='VERDU'),
  (SELECT id FROM places WHERE code='CARTAGENA_COLOMBIA'),
  (SELECT id FROM places WHERE code='CARTAGENA_COLOMBIA')
),
-- (
--   'most-holy-name-of-mary', 'The Most Holy Name of Mary',
--   NULL, NULL, NULL, TRUE,
--   NULL, 9, 12, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-john-chrysostom', 'Saint John Chrysostom',
  347, NULL, NULL, TRUE,
  407, 9, 14, FALSE,
  5,
  (SELECT id FROM places WHERE code='ANTIOCH'),
  (SELECT id FROM places WHERE code='COMANA_PONTICA'),
  (SELECT id FROM places WHERE code='CONSTANTINOPLE')
),
-- (
--   'our-lady-of-sorrows', 'Our Lady of Sorrows',
--   NULL, NULL, NULL, TRUE,
--   NULL, 9, 15, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-cornelius', 'Saint Cornelius',
  180, NULL, NULL, TRUE,
  253, 6, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='CIVITAVECCHIA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-cyprian', 'Saint Cyprian',
  200, NULL, NULL, TRUE,
  258, 9, 14, TRUE,
  3,
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE')
),
(
  'saint-robert-bellarmine', 'Saint Robert Bellarmine',
  1542, 10, 4, FALSE,
  1621, 9, 17, FALSE,
  17,
  (SELECT id FROM places WHERE code='MONTEPULCIANO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-hildegard-of-bingen', 'Saint Hildegard of Bingen',
  1098, NULL, NULL, TRUE,
  1179, 9, 17, FALSE,
  12,
  (SELECT id FROM places WHERE code='BERMERSHEIM_VOR_DER_HOEHE'),
  (SELECT id FROM places WHERE code='BINGEN'),
  (SELECT id FROM places WHERE code='BINGEN')
),
(
  'saint-januarius', 'Saint Januarius',
  232, 4, 21, TRUE,
  305, 9, 19, TRUE,
  4,
  (SELECT id FROM places WHERE code='BENEVENTO'),  -- birthplace (traditional)
  (SELECT id FROM places WHERE code='POZZUOLI'),   -- place_of_death (martyred at/near Pozzuoli)
  (SELECT id FROM places WHERE code='NAPLES')     -- place_of_activity (bishop / patron of Naples)

),
(
  'saint-andrew-kim-tae-gon', 'Saint Andrew Kim Tae-gon',
  1821, 8, 21, FALSE,
  1846, 9, 16, FALSE,
  19,
  (SELECT id FROM places WHERE code='SOLMOE'),
  (SELECT id FROM places WHERE code='SEOUL'),
  (SELECT id FROM places WHERE code='KOREA')
),
(
  'saint-paul-chong-ha-sang', 'Saint Paul Chong Ha-sang',
  1795, NULL, NULL, TRUE,
  1839, 9, 22, FALSE,
  19,
  (SELECT id FROM places WHERE code='MAJAE_KOREA'),
  (SELECT id FROM places WHERE code='SEOUL'),
  (SELECT id FROM places WHERE code='KOREA')
),
(
  'saint-matthew', 'Saint Matthew, Apostle and Evangelist',
  NULL, NULL, NULL, TRUE,
  71, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),   -- birthplace (regional)
  (SELECT id FROM places WHERE code='HIERAPOLIS'),-- place_of_death (tradition)
  (SELECT id FROM places WHERE code='BETHSAIDA') -- place_of_activity (Capernaum area)

),
(
  'saint-pius-of-pietrelcina', 'Saint Pius of Pietrelcina',
  1887, 5, 25, FALSE,
  1968, 9, 23, FALSE,
  20,
  (SELECT id FROM places WHERE code='PIETRELCINA'),
  (SELECT id FROM places WHERE code='SAN_GIOVANNI_ROTONDO'),
  (SELECT id FROM places WHERE code='SAN_GIOVANNI_ROTONDO')
),
(
  'saint-cosmas', 'Saint Cosmas',
  NULL, NULL, NULL, TRUE,
  300, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='ARABIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA')
),
(
  'saint-damian', 'Saint Damian',
  NULL, NULL, NULL, TRUE,
  300, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='ARABIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA')
),
(
  'saint-vincent-de-paul', 'Saint Vincent de Paul',
  1581, 4, 24, FALSE,
  1660, 9, 27, FALSE,
  17,
  (SELECT id FROM places WHERE code='SAINT_VINCENT_DE_PAUL'),
  (SELECT id FROM places WHERE code='PARIS'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-wenceslaus', 'Saint Wenceslaus',
  907, NULL, NULL, TRUE,
  935, 9, 28, TRUE,
  10,
  (SELECT id FROM places WHERE code='STOCHOV'),
  (SELECT id FROM places WHERE code='STARA_BOLESLAV'),
  (SELECT id FROM places WHERE code='PRAGUE')
),
(
  'saint-lawrence-ruiz', 'Saint Lawrence Ruiz', --and Companions
  1594, 11, 28, TRUE,
  1637, 9, 29, FALSE,
  17,
  (SELECT id FROM places WHERE code='BINONDO'),
  (SELECT id FROM places WHERE code='NAGASAKI'),
  (SELECT id FROM places WHERE code='MANILA')
),
-- (
--   'saints-michael-gabriel-and-raphael', 'Saints Michael, Gabriel and Raphael, Archangels',
--   NULL, NULL, NULL, TRUE,
--   NULL, 9, 29, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-jerome', 'Saint Jerome',
  347, NULL, NULL, TRUE,
  420, 9, 30, TRUE,
  5,
  (SELECT id FROM places WHERE code='STRIDON'),
  (SELECT id FROM places WHERE code='BETHLEHEM'),
  (SELECT id FROM places WHERE code='BETHLEHEM')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-gregory-the-great', 'Saint Gregory the Great', NULL, NULL, 'c. 540–604'),
('saint-teresa-of-calcutta', 'Saint Teresa of Calcutta', NULL, NULL, '1910–1997'),
('saint-peter-claver', 'Saint Peter Claver', NULL, NULL, '1581–1654'),
('saint-john-chrysostom', 'Saint John Chrysostom', NULL, NULL, 'c. 347–407'),
('saint-cornelius', 'Saint Cornelius', NULL, NULL, '† 253'),
('saint-cyprian', 'Saint Cyprian', NULL, NULL, 'c. 200–258'),
('saint-robert-bellarmine', 'Saint Robert Bellarmine', NULL, NULL, '1542–1621'),
('saint-hildegard-of-bingen', 'Saint Hildegard of Bingen', NULL, NULL, '1098–1179'),
('saint-januarius', 'Saint Januarius', NULL, NULL, '4th century'),
('saint-andrew-kim-tae-gon', 'Saint Andrew Kim Tae-gon', NULL, NULL, '1821–1846'),
('saint-paul-chong-ha-sang', 'Saint Paul Chong Ha-sang', NULL, NULL, '1794–1839'),
('saint-matthew', 'Saint Matthew, Apostle and Evangelist', NULL, NULL, '1st century'),
('saint-pius-of-pietrelcina', 'Saint Pius of Pietrelcina', NULL, NULL, '1887–1968'),
('saint-cosmas', 'Saint Cosmas', NULL, NULL, '3rd century'),
('saint-damian', 'Saint Damian', NULL, NULL, '3rd century'),
('saint-vincent-de-paul', 'Saint Vincent de Paul', NULL, NULL, '1581–1660'),
('saint-wenceslaus', 'Saint Wenceslaus', NULL, NULL, 'c. 907–935'),
('saint-lawrence-ruiz', 'Saint Lawrence Ruiz', NULL, NULL, 'c. 1600–1637'),
-- ('saints-michael-gabriel-and-raphael', 'Saints Michael, Gabriel and Raphael, Archangels', NULL, NULL, ''),
('saint-jerome', 'Saint Jerome', NULL, NULL, 'c. 347–420')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-gregory-the-great', 'Saint Grégoire le Grand', NULL, NULL, 'v. 540–604'),
('saint-teresa-of-calcutta', 'Sainte Teresa de Calcutta', NULL, NULL, '1910–1997'),
('saint-peter-claver', 'Saint Pierre Claver', NULL, NULL, '1581–1654'),
('saint-john-chrysostom', 'Saint Jean Chrysostome', NULL, NULL, 'v. 347–407'),
('saint-cornelius', 'Saint Corneille', NULL, NULL, '† 253'),
('saint-cyprian', 'Saint Cyprien', NULL, NULL, 'v. 200–258'),
('saint-robert-bellarmine', 'Saint Robert Bellarmin', NULL, NULL, '1542–1621'),
('saint-hildegard-of-bingen', 'Sainte Hildegarde de Bingen', NULL, NULL, '1098–1179'),
('saint-januarius', 'Saint Janvier', NULL, NULL, 'IVe siècle'),
('saint-andrew-kim-tae-gon', 'Saint André Kim Tae-gon', NULL, NULL, '1821–1846'),
('saint-paul-chong-ha-sang', 'Saint Paul Chong Ha-sang', NULL, NULL, '1794–1839'),
('saint-matthew', 'Saint Matthieu, apôtre et évangéliste', NULL, NULL, 'Ier siècle'),
('saint-pius-of-pietrelcina', 'Saint Pio de Pietrelcina', NULL, NULL, '1887–1968'),
('saint-cosmas', 'Saint Côme', NULL, NULL, 'IIIe siècle'),
('saint-damian', 'Saint Damien', NULL, NULL, 'IIIe siècle'),
('saint-vincent-de-paul', 'Saint Vincent de Paul', NULL, NULL, '1581–1660'),
('saint-wenceslaus', 'Saint Venceslas', NULL, NULL, 'v. 907–935'),
('saint-lawrence-ruiz', 'Saint Laurent Ruiz', NULL, NULL, 'v. 1600–1637'),
-- ('saints-michael-gabriel-and-raphael', 'Saints Michel, Gabriel et Raphaël, archanges', NULL, NULL, ''),
('saint-jerome', 'Saint Jérôme', NULL, NULL, 'v. 347–420')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-gregory-the-great', 'Sanctus Gregorius Magnus', NULL, NULL, 'c. 540–604'),
('saint-teresa-of-calcutta', 'Sancta Teresa a Calcutta', NULL, NULL, '1910–1997'),
('saint-peter-claver', 'Sanctus Petrus Claverius', NULL, NULL, '1581–1654'),
('saint-john-chrysostom', 'Sanctus Ioannes Chrysostomus', NULL, NULL, 'c. 347–407'),
('saint-cornelius', 'Sanctus Cornelius', NULL, NULL, '† 253'),
('saint-cyprian', 'Sanctus Cyprianus', NULL, NULL, 'c. 200–258'),
('saint-robert-bellarmine', 'Sanctus Robertus Bellarminus', NULL, NULL, '1542–1621'),
('saint-hildegard-of-bingen', 'Sancta Hildegardis Bingensis', NULL, NULL, '1098–1179'),
('saint-januarius', 'Sanctus Ianuarius', NULL, NULL, 'saec. IV'),
('saint-andrew-kim-tae-gon', 'Sanctus Andreas Kim Tae-gon', NULL, NULL, '1821–1846'),
('saint-paul-chong-ha-sang', 'Sanctus Paulus Chong Ha-sang', NULL, NULL, '1794–1839'),
('saint-matthew', 'Sanctus Matthaeus, apostolus et evangelista', NULL, NULL, 'saec. I'),
('saint-pius-of-pietrelcina', 'Sanctus Pius a Pietrelcina', NULL, NULL, '1887–1968'),
('saint-cosmas', 'Sanctus Cosmas', NULL, NULL, 'saec. III'),
('saint-damian', 'Sanctus Damianus', NULL, NULL, 'saec. III'),
('saint-vincent-de-paul', 'Sanctus Vincentius a Paulo', NULL, NULL, '1581–1660'),
('saint-wenceslaus', 'Sanctus Venceslaus', NULL, NULL, 'c. 907–935'),
('saint-lawrence-ruiz', 'Sanctus Laurentius Ruiz', NULL, NULL, 'c. 1600–1637'),
-- ('saints-michael-gabriel-and-raphael', 'Sancti Michael, Gabriel et Raphaël, Archangeli', NULL, NULL, ''),
('saint-jerome', 'Sanctus Hieronymus', NULL, NULL, 'c. 347–420')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- OCTOBER SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-therese-of-the-child-jesus', 'Saint Thérèse of the Child Jesus, Virgin and Doctor of the Church',
  1873, 1, 2, FALSE,
  1897, 9, 30, FALSE,
  19,
  (SELECT id FROM places WHERE code='ALENCON'),
  (SELECT id FROM places WHERE code='LISIEUX'),
  (SELECT id FROM places WHERE code='LISIEUX')
),
-- (
--   'holy-guardian-angels', 'The Holy Guardian Angels',
--   NULL, NULL, NULL, TRUE,
--   NULL, 10, 2, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-francis-of-assisi', 'Saint Francis of Assisi',
  1182, NULL, NULL, TRUE,
  1226, 10, 3, FALSE,
  13,
  (SELECT id FROM places WHERE code='ASSISI'),
  (SELECT id FROM places WHERE code='ASSISI'),
  (SELECT id FROM places WHERE code='ASSISI')
),
(
  'saint-faustina-kowalska', 'Saint Faustina Kowalska',
  1905, 8, 25, FALSE,
  1938, 10, 5, FALSE,
  20,
  (SELECT id FROM places WHERE code='GLOGOWIEC'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-bruno', 'Saint Bruno',
  1030, NULL, NULL, TRUE,
  1101, 10, 6, FALSE,
  12,
  (SELECT id FROM places WHERE code='COLOGNE'),           -- place_of_birth
  (SELECT id FROM places WHERE code='SERRA_SAN_BRUNO'),   -- place_of_death
  (SELECT id FROM places WHERE code='GRANDE_CHARTREUSE')  -- place_of_activity (founder of the Carthusian order)

),
-- (
--   'our-lady-of-the-rosary', 'Our Lady of the Rosary',
--   NULL, NULL, NULL, TRUE,
--   NULL, 10, 7, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-denis', 'Saint Denis, Bishop', -- and Companions, Martyrs
  NULL, NULL, NULL, TRUE,
  250, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='MONTMARTRE'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-john-leonardi', 'Saint John Leonardi',
  1541, NULL, NULL, FALSE,
  1609, 10, 9, FALSE,
  17,
  (SELECT id FROM places WHERE code='DIECIMO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='LUCCA')
),
(
  'saint-john-henry-newman', 'Saint John Henry Newman',
  1801, 2, 21, FALSE,
  1890, 8, 11, FALSE,
  19,
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='BIRMINGHAM'),
  (SELECT id FROM places WHERE code='OXFORD')
),
(
  'saint-john-xxiii', 'Saint John XXIII',
  1881, 11, 25, FALSE,
  1963, 6, 3, FALSE,
  20,
  (SELECT id FROM places WHERE code='SOTTO_IL_MONTE_GIOVANNI_XXIII'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-callistus-i', 'Saint Callistus I, Pope and Martyr',
  155, NULL, NULL, TRUE,
  222, 10, 14, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-teresa-of-jesus', 'Saint Teresa of Jesus (Teresa of Ávila), Virgin and Doctor of the Church',
  1515, 3, 28, FALSE,
  1582, 10, 4, FALSE,
  16,
  (SELECT id FROM places WHERE code='AVILA'),
  (SELECT id FROM places WHERE code='ALBA_DE_TORMES'),
  (SELECT id FROM places WHERE code='AVILA')
),
(
  'saint-hedwig', 'Saint Hedwig',
  1174, NULL, NULL, TRUE,
  1243, 10, 15, FALSE,
  13,
  (SELECT id FROM places WHERE code='ANDECHS'),
  (SELECT id FROM places WHERE code='TRZEBNICA'),
  (SELECT id FROM places WHERE code='WROCLAW')

),
(
  'saint-margaret-mary-alacoque', 'Saint Margaret Mary Alacoque',
  1647, 7, 22, FALSE,
  1690, 10, 17, FALSE,
  17,
  (SELECT id FROM places WHERE code='VEROSVRES'),
  (SELECT id FROM places WHERE code='PARAY-LE-MONIAL'),
  (SELECT id FROM places WHERE code='PARAY-LE-MONIAL')
),
(
  'saint-ignatius-of-antioch', 'Saint Ignatius of Antioch, Bishop and Martyr',
  33, NULL, NULL, TRUE,
  110, NULL, NULL, TRUE,
  2,
  (SELECT id FROM places WHERE code='ANTIOCH'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ANTIOCH')
),
(
  'saint-luke', 'Saint Luke, Evangelist',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='ANTIOCH'),
  NULL,
  (SELECT id FROM places WHERE code='ANTIOCH')
),
(
  'saint-john-de-brebeuf', 'Saints John de Brébeuf', -- Isaac Jogues, and Companions, Martyrs
  1593, 3, 25, FALSE,
  1649, 3, 16, TRUE,
  17,
  (SELECT id FROM places WHERE code='CONDE_SUR_VIRE'),
  (SELECT id FROM places WHERE code='MIDLAND'),
  (SELECT id FROM places WHERE code='MIDLAND')
),
(
  'saint-paul-of-the-cross', 'Saint Paul of the Cross',
  1694, 1, 3, FALSE,
  1775, 10, 18, FALSE,
  18,
  (SELECT id FROM places WHERE code='OVADA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='MONTE_ARGENTARIO')
),
(
  'saint-john-paul-ii', 'Saint John Paul II',
  1920, 5, 18, FALSE,
  2005, 4, 2, FALSE,
  21,
  (SELECT id FROM places WHERE code='WADOWICE'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
  -- krakovie ?
),
(
  'saint-john-of-capistrano', 'Saint John of Capistrano',
  1386, 6, 24, TRUE,
  1456, 10, 23, FALSE,
  15,
  (SELECT id FROM places WHERE code='CAPESTRANO'),
  (SELECT id FROM places WHERE code='ILOK'),
  (SELECT id FROM places WHERE code='BELGRADE')
),
(
  'saint-anthony-mary-claret', 'Saint Anthony Mary Claret, Bishop',
  1807, 12, 23, FALSE,
  1870, 10, 24, FALSE,
  19,
  (SELECT id FROM places WHERE code='SALLENT'),
  (SELECT id FROM places WHERE code='FONTFROIDE'),
  (SELECT id FROM places WHERE code='VIC')
),
(
  'saint-simon-apostle', 'Saint Simon, Apostle',
  5, NULL, NULL, TRUE,
  65, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='CANA'),
  (SELECT id FROM places WHERE code='PERSIA'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-jude-apostle', 'Saint Jude, Apostle',
  10, NULL, NULL, TRUE,
  65, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='PERSIA'),
  (SELECT id FROM places WHERE code='JERUSALEM')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-therese-of-the-child-jesus', 'Saint Thérèse of the Child Jesus, Virgin and Doctor of the Church', NULL, NULL, '1873–1897'),
-- ('holy-guardian-angels', 'The Holy Guardian Angels', NULL, NULL, ''),
('saint-francis-of-assisi', 'Saint Francis of Assisi', NULL, NULL, '1182–1226'),
('saint-faustina-kowalska', 'Saint Faustina Kowalska', NULL, NULL, '1905–1938'),
('saint-bruno', 'Saint Bruno', NULL, NULL, 'c. 1030–1101'),
('saint-denis', 'Saint Denis, Bishop', NULL, NULL, '3rd century'),
('saint-john-leonardi', 'Saint John Leonardi', NULL, NULL, '1541–1609'),
('saint-john-henry-newman', 'Saint John Henry Newman', NULL, NULL, '1801–1890'),
('saint-john-xxiii', 'Saint John XXIII', NULL, NULL, '1881–1963'),
('saint-callistus-i', 'Saint Callistus I, Pope and Martyr', NULL, NULL, '3rd century'),
('saint-teresa-of-jesus', 'Saint Teresa of Jesus (Teresa of Ávila), Virgin and Doctor of the Church', NULL, NULL, '1515–1582'),
('saint-hedwig', 'Saint Hedwig', NULL, NULL, 'c. 1174–1243'),
('saint-margaret-mary-alacoque', 'Saint Margaret Mary Alacoque', NULL, NULL, '1647–1690'),
('saint-ignatius-of-antioch', 'Saint Ignatius of Antioch, Bishop and Martyr', NULL, NULL, '2nd century'),
('saint-luke', 'Saint Luke, Evangelist', NULL, NULL, '1st century'),
('saint-john-de-brebeuf', 'Saint John de Brébeuf', NULL, NULL, ''),
('saint-paul-of-the-cross', 'Saint Paul of the Cross', NULL, NULL, '1694–1775'),
('saint-john-paul-ii', 'Saint John Paul II', NULL, NULL, '1920–2005'),
('saint-john-of-capistrano', 'Saint John of Capistrano', NULL, NULL, '1386–1456'),
('saint-anthony-mary-claret', 'Saint Anthony Mary Claret, Bishop', NULL, NULL, '1807–1870'),
('saint-simon-apostle', 'Saint Simon, Apostle', NULL, NULL, '1st century'),
('saint-jude-apostle', 'Saint Jude, Apostle', NULL, NULL, '1st century')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-therese-of-the-child-jesus', 'Sainte Thérèse de l''Enfant-Jésus, vierge et docteur de l''Église', NULL, NULL, '1873–1897'),
-- ('holy-guardian-angels', 'Les Saints Anges Gardiens', NULL, NULL, ''),
('saint-francis-of-assisi', 'Saint François d''Assise', NULL, NULL, '1182–1226'),
('saint-faustina-kowalska', 'Sainte Faustine Kowalska', NULL, NULL, '1905–1938'),
('saint-bruno', 'Saint Bruno', NULL, NULL, 'c. 1030–1101'),
('saint-denis', 'Saint Denis, évêque', NULL, NULL, 'IIIe siècle'),
('saint-john-leonardi', 'Saint Jean Leonardi', NULL, NULL, '1541–1609'),
('saint-john-henry-newman', 'Saint John Henry Newman', NULL, NULL, '1801–1890'),
('saint-john-xxiii', 'Saint Jean XXIII', NULL, NULL, '1881–1963'),
('saint-callistus-i', 'Saint Callixte I', NULL, NULL, 'IIIe siècle'),
('saint-teresa-of-jesus', 'Sainte Thérèse d''Avila (Thérèse de Jésus), vierge et docteur de l''Église', NULL, NULL, '1515–1582'),
('saint-hedwig', 'Sainte Hedwige', NULL, NULL, 'v. 1174–1243'),
('saint-margaret-mary-alacoque', 'Sainte Marguerite-Marie Alacoque', NULL, NULL, '1647–1690'),
('saint-ignatius-of-antioch', 'Saint Ignace d''Antioche, évêque et martyr', NULL, NULL, 'IIe siècle'),
('saint-luke', 'Saint Luc, évangéliste', NULL, NULL, 'Ier siècle'),
('saint-john-de-brebeuf', 'Saint Jean de Brébeuf', NULL, NULL, ''),
('saint-paul-of-the-cross', 'Saint Paul de la Croix', NULL, NULL, '1694–1775'),
('saint-john-paul-ii', 'Saint Jean-Paul II', NULL, NULL, '1920–2005'),
('saint-john-of-capistrano', 'Saint Jean de Capistran', NULL, NULL, '1386–1456'),
('saint-anthony-mary-claret', 'Saint Antoine-Marie Claret', NULL, NULL, '1807–1870'),
('saint-simon-apostle', 'Saint Simon, apôtre', NULL, NULL, 'Ier siècle'),
('saint-jude-apostle', 'Saint Jude, apôtre', NULL, NULL, 'Ier siècle')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-therese-of-the-child-jesus', 'Sancta Theresia a Iesu Infante, Virgo et Doctor Ecclesiae', NULL, NULL, '1873–1897'),
-- ('holy-guardian-angels', 'Sancti Angeli Custodes', NULL, NULL, ''),
('saint-francis-of-assisi', 'Sanctus Franciscus Assisiensis', NULL, NULL, '1182–1226'),
('saint-faustina-kowalska', 'Sancta Faustina Kowalska', NULL, NULL, '1905–1938'),
('saint-bruno', 'Sanctus Bruno', NULL, NULL, 'c. 1030–1101'),
('saint-denis', 'Sanctus Dionysius Episcopus', NULL, NULL, 'saec. III'),
('saint-john-leonardi', 'Sanctus Ioannes Leonardi', NULL, NULL, '1541–1609'),
('saint-john-henry-newman', 'Sanctus Ioannes Henricus Newman', NULL, NULL, '1801–1890'),
('saint-john-xxiii', 'Sanctus Ioannes XXIII', NULL, NULL, '1881–1963'),
('saint-callistus-i', 'Sanctus Callistus I', NULL, NULL, 'saec. III'),
('saint-teresa-of-jesus', 'Sancta Teresia a Iesu (Teresa Abulensis), Virgo et Doctor Ecclesiae', NULL, NULL, '1515–1582'),
('saint-hedwig', 'Sancta Hedvigis', NULL, NULL, 'c. 1174–1243'),
('saint-margaret-mary-alacoque', 'Sancta Margarita Maria Alacoque', NULL, NULL, '1647–1690'),
('saint-ignatius-of-antioch', 'Sanctus Ignatius Antiochenus, Episcopus et Martyr', NULL, NULL, 'saec. II'),
('saint-luke', 'Sanctus Lucas, Evangelista', NULL, NULL, 'saec. I'),
('saint-john-de-brebeuf', 'Sanctus Ioannes de Brébeuf', NULL, NULL, ''),
('saint-paul-of-the-cross', 'Sanctus Paulus a Cruce', NULL, NULL, '1694–1775'),
('saint-john-paul-ii', 'Sanctus Ioannes Paulus II', NULL, NULL, '1920–2005'),
('saint-john-of-capistrano', 'Sanctus Ioannes Capistranus', NULL, NULL, '1386–1456'),
('saint-anthony-mary-claret', 'Sanctus Antonius Maria Claret', NULL, NULL, '1807–1870'),
('saint-simon-apostle', 'Sanctus Simon, Apostolus', NULL, NULL, 'saec. I'),
('saint-jude-apostle', 'Sanctus Iudas, Apostolus', NULL, NULL, 'saec. I')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- NOVEMBER SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-martin-de-porres', 'Saint Martin de Porres',
  1579, 12, 9, FALSE,
  1639, 11, 3, FALSE,
  17,
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA')
),
(
  'saint-charles-borromeo', 'Saint Charles Borromeo',
  1538, 10, 2, FALSE,
  1584, 11, 3, FALSE,
  16,
  (SELECT id FROM places WHERE code='ARONA'),
  (SELECT id FROM places WHERE code='MILAN'),
  (SELECT id FROM places WHERE code='MILAN')
),
(
  'saint-leo-the-great', 'Saint Leo the Great',
  391, NULL, NULL, TRUE,
  461, 11, 10, TRUE,
  5,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-martin-of-tours', 'Saint Martin of Tours',
  316, NULL, NULL, TRUE,
  397, 11, 8, TRUE,
  4,
  (SELECT id FROM places WHERE code='SZOMBATHELY'),
  (SELECT id FROM places WHERE code='CANDES_SAINT_MARTIN'),
  (SELECT id FROM places WHERE code='TOURS')
),
(
  'saint-josaphat', 'Saint Josaphat, Bishop and Martyr',
  1580, NULL, NULL, TRUE,
  1623, 11, 12, TRUE,
  17,
  (SELECT id FROM places WHERE code='VOLODYMYR'),
  (SELECT id FROM places WHERE code='VITEBSK'),
  (SELECT id FROM places WHERE code='SZOMBATHELY')
),
(
  'saint-albert-the-great', 'Saint Albert the Great',
  1200, NULL, NULL, TRUE,
  1280, 11, 15, TRUE,
  13,
  (SELECT id FROM places WHERE code='LAUINGEN'),
  (SELECT id FROM places WHERE code='COLOGNE'),
  (SELECT id FROM places WHERE code='COLOGNE')
),
(
  'saint-margaret-of-scotland', 'Saint Margaret of Scotland',
  1045, NULL, NULL, TRUE,
  1093, 11, 16, TRUE,
  11,
  (SELECT id FROM places WHERE code='MECSEKNADASD'),
  (SELECT id FROM places WHERE code='EDINBURGH_CASTLE'),
  (SELECT id FROM places WHERE code='DUNFERMLINE')
),
(
  'saint-gertrude', 'Saint Gertrude',
  1256, 1, 6, TRUE,
  1301, 11, 17, TRUE,
  14,
  (SELECT id FROM places WHERE code='THURINGIA'),
  (SELECT id FROM places WHERE code='HELFTA'),
  (SELECT id FROM places WHERE code='HELFTA')
),
(
  'saint-elizabeth-of-hungary', 'Saint Elizabeth of Hungary',
  1207, 7, 7, TRUE,
  1231, 11, 17, FALSE,
  13,
  (SELECT id FROM places WHERE code='SAROSPATAK'),
  (SELECT id FROM places WHERE code='MARBURG'),
  (SELECT id FROM places WHERE code='MARBURG')
),
(
  'saint-cecilia', 'Saint Cecilia, Virgin and Martyr',
  NULL, NULL, NULL, TRUE,
  230, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-clement-i', 'Saint Clement I, Pope and Martyr',
  NULL, NULL, NULL, TRUE,
  98, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='CHERSON'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-columban', 'Saint Columban, Abbot',
  543, NULL, NULL, TRUE,
  615, 11, 23, TRUE,
  7,
  (SELECT id FROM places WHERE code='MYSHALL'),
  (SELECT id FROM places WHERE code='BOBBIO'),
  (SELECT id FROM places WHERE code='LUXEUIL')
),
(
  'saint-andrew-dung-lac', 'Saints Andrew Dung-Lac, Priest', --and Companions, Martyrs
  1795, NULL, NULL, TRUE,
  1839, 12, 21, TRUE,
  19,
  (SELECT id FROM places WHERE code='BAC_NINH'),
  (SELECT id FROM places WHERE code='HANOI'),
  (SELECT id FROM places WHERE code='HANOI')
),
(
  'saint-catherine-of-alexandria', 'Saint Catherine of Alexandria',
  287, NULL, NULL, TRUE,
  305, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-andrew-apostle', 'Saint Andrew, Apostle',
  NULL, NULL, NULL, TRUE,
  60, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='PATRAS'),
  (SELECT id FROM places WHERE code='CAPERNAUM')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-martin-de-porres', 'Saint Martin de Porres', NULL, NULL, '1579–1639'),
('saint-charles-borromeo', 'Saint Charles Borromeo', NULL, NULL, '1538–1584'),
('saint-leo-the-great', 'Saint Leo the Great', NULL, NULL, 'c. 400–461'),
('saint-martin-of-tours', 'Saint Martin of Tours', NULL, NULL, 'c. 316–397'),
('saint-josaphat', 'Saint Josaphat, Bishop and Martyr', NULL, NULL, '1580–1623'),
('saint-albert-the-great', 'Saint Albert the Great', NULL, NULL, 'c. 1200–1280'),
('saint-margaret-of-scotland', 'Saint Margaret of Scotland', NULL, NULL, 'c. 1045–1093'),
('saint-gertrude', 'Saint Gertrude', NULL, NULL, ''),
('saint-elizabeth-of-hungary', 'Saint Elizabeth of Hungary', NULL, NULL, '1207–1231'),
('saint-cecilia', 'Saint Cecilia, Virgin and Martyr', NULL, NULL, ''),
('saint-clement-i', 'Saint Clement I, Pope and Martyr', NULL, NULL, '1st century'),
('saint-columban', 'Saint Columban, Abbot', NULL, NULL, 'd. 615'),
('saint-andrew-dung-lac', 'Saint Andrew Dũng‑Lạc', NULL, NULL, ''),
('saint-catherine-of-alexandria', 'Saint Catherine of Alexandria', NULL, NULL, ''),
('saint-andrew-apostle', 'Saint Andrew, Apostle', NULL, NULL, '1st century')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-martin-de-porres', 'Saint Martin de Porres', NULL, NULL, '1579–1639'),
('saint-charles-borromeo', 'Saint Charles Borromée', NULL, NULL, '1538–1584'),
('saint-leo-the-great', 'Saint Léon le Grand', NULL, NULL, 'v. 400–461'),
('saint-martin-of-tours', 'Saint Martin de Tours', NULL, NULL, 'v. 316–397'),
('saint-josaphat', 'Saint Josaphat, évêque et martyr', NULL, NULL, '1580–1623'),
('saint-albert-the-great', 'Saint Albert le Grand', NULL, NULL, 'v. 1200–1280'),
('saint-margaret-of-scotland', 'Sainte Marguerite d''Écosse', NULL, NULL, 'v. 1045–1093'),
('saint-gertrude', 'Sainte Gertrude', NULL, NULL, ''),
('saint-elizabeth-of-hungary', 'Sainte Élisabeth de Hongrie', NULL, NULL, '1207–1231'),
('saint-cecilia', 'Sainte Cécile, vierge et martyre', NULL, NULL, ''),
('saint-clement-i', 'Saint Clément I', NULL, NULL, 'Ier siècle'),
('saint-columban', 'Saint Colomban', NULL, NULL, 'm. 615'),
('saint-andrew-dung-lac', 'Saint André Dũng‑Lạc', NULL, NULL, ''),
('saint-catherine-of-alexandria', 'Sainte Catherine d''Alexandrie', NULL, NULL, ''),
('saint-andrew-apostle', 'Saint André, apôtre', NULL, NULL, 'Ier siècle')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-martin-de-porres', 'Sanctus Martinus de Porres', NULL, NULL, '1579–1639'),
('saint-charles-borromeo', 'Sanctus Carolus Borromaeus', NULL, NULL, '1538–1584'),
('saint-leo-the-great', 'Sanctus Leo Magnus', NULL, NULL, 'c. 400–461'),
('saint-martin-of-tours', 'Sanctus Martinus Turonensis', NULL, NULL, 'c. 316–397'),
('saint-josaphat', 'Sanctus Iosaphat, Episcopus et Martyr', NULL, NULL, '1580–1623'),
('saint-albert-the-great', 'Sanctus Albertus Magnus', NULL, NULL, 'c. 1200–1280'),
('saint-margaret-of-scotland', 'Sancta Margarita Scotiae', NULL, NULL, 'c. 1045–1093'),
('saint-gertrude', 'Sancta Gertrudis', NULL, NULL, ''),
('saint-elizabeth-of-hungary', 'Sancta Elisabeth Hungariae', NULL, NULL, '1207–1231'),
('saint-cecilia', 'Sancta Caecilia, Virgo et Martyr', NULL, NULL, ''),
('saint-clement-i', 'Sanctus Clemens I', NULL, NULL, 'saec. I'),
('saint-columban', 'Sanctus Columbanus', NULL, NULL, 'ob. 615'),
('saint-andrew-dung-lac', 'Sanctus Andreas Dung‑Lac', NULL, NULL, ''),
('saint-catherine-of-alexandria', 'Sancta Catharina Alexandrina', NULL, NULL, ''),
('saint-andrew-apostle', 'Sanctus Andreas, Apostolus', NULL, NULL, 'saec. I')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- DECEMBER SAINTS (sans dédicaces ni vocables marials)
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-francis-xavier', 'Saint Francis Xavier',
  1506, 4, 7, FALSE,
  1552, 12, 3, FALSE,
  16,
  (SELECT id FROM places WHERE code='XAVIER'),
  (SELECT id FROM places WHERE code='SHANGCHUAN_ISLAND'),
  (SELECT id FROM places WHERE code='GOA')
),
(
  'saint-john-damascene', 'Saint John Damascene',
  675, NULL, NULL, TRUE,
  749, 12, 4, TRUE,
  8,
  (SELECT id FROM places WHERE code='DAMASCUS'),
  (SELECT id FROM places WHERE code='MAR_SABA'),
  (SELECT id FROM places WHERE code='MAR_SABA')
),
(
  'saint-nicholas', 'Saint Nicholas, Bishop',
  270, 3, 15, TRUE,
  343, 12, 6, TRUE,
  4,
  (SELECT id FROM places WHERE code='PATARA'),
  (SELECT id FROM places WHERE code='MYRA'),
  (SELECT id FROM places WHERE code='MYRA')
),
(
  'saint-ambrose', 'Saint Ambrose',
  339, NULL, NULL, TRUE,
  397, 4, 4, FALSE,
  4,
  (SELECT id FROM places WHERE code='AUGUSTA_TREVERORUM'),
  (SELECT id FROM places WHERE code='MILAN'),
  (SELECT id FROM places WHERE code='MILAN')
),
(
  'saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin',
  1474, NULL, NULL, TRUE,
  1548, 5, 30, FALSE,
  16,
  (SELECT id FROM places WHERE code='CUAUHTITLAN'),
  (SELECT id FROM places WHERE code='MEXICO_CITY'),
  (SELECT id FROM places WHERE code='GUADALUPE_MX')

),
(
  'saint-damasus-i', 'Saint Damasus I, Pope',
  305, NULL, NULL, TRUE,
  384, 12, 11, TRUE,
  4,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-lucy', 'Saint Lucy, Virgin and Martyr',
  283, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='SIRACUSA'),
  (SELECT id FROM places WHERE code='SIRACUSA'),
  (SELECT id FROM places WHERE code='SIRACUSA')
),
(
  'saint-john-of-the-cross', 'Saint John of the Cross',
  1542, 6, 24, FALSE,
  1591, 12, 14, FALSE,
  16,
  (SELECT id FROM places WHERE code='FONTIVEROS'),
  (SELECT id FROM places WHERE code='UBEDA'),
  (SELECT id FROM places WHERE code='AVILA')
),
(
  'saint-peter-canisius', 'Saint Peter Canisius',
  1521, 5, 8, FALSE,
  1597, 12, 21, FALSE,
  16,
  (SELECT id FROM places WHERE code='NIJMEGEN'),
  (SELECT id FROM places WHERE code='FREIBURG_IM_BREISGAU'),
  (SELECT id FROM places WHERE code='VIENNA')
),
(
  'saint-john-of-kanty', 'Saint John of Kanty',
  1390, 6, 23, TRUE,
  1473, 12, 24, FALSE,
  15,
  (SELECT id FROM places WHERE code='KETY'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-stephen-martyr', 'Saint Stephen, the First Martyr',
  5, NULL, NULL, TRUE,
  34, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-john', 'Saint John, Apostle and Evangelist',
  6, NULL, NULL, TRUE,
  100, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='EPHESUS'),
  (SELECT id FROM places WHERE code='EPHESUS')
),
(
  'holy-innocents', 'The Holy Innocents, Martyrs',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHLEHEM'),
  (SELECT id FROM places WHERE code='BETHLEHEM'),
  (SELECT id FROM places WHERE code='BETHLEHEM')
),
(
  'saint-thomas-becket', 'Saint Thomas Becket',
  1118, 12, 21, TRUE,
  1170, 12, 29, FALSE,
  12,
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='CANTERBURY'),
  (SELECT id FROM places WHERE code='CANTERBURY')
),
(
  'saint-sylvester-i', 'Saint Sylvester I',
  NULL, NULL, NULL, TRUE,
  335, 12, 31, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-xavier', 'Saint Francis Xavier', NULL, NULL, '1506–1552'),
('saint-john-damascene', 'Saint John Damascene', NULL, NULL, 'c. 675–749'),
('saint-nicholas', 'Saint Nicholas, Bishop', NULL, NULL, 'c. 270–343'),
('saint-ambrose', 'Saint Ambrose', NULL, NULL, 'c. 340–397'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin', NULL, NULL, 'c. 1474–1548'),
('saint-damasus-i', 'Saint Damasus I, Pope', NULL, NULL, 'c. 305–384'),
('saint-lucy', 'Saint Lucy, Virgin and Martyr', NULL, NULL, 'd. 304'),
('saint-john-of-the-cross', 'Saint John of the Cross', NULL, NULL, '1542–1591'),
('saint-peter-canisius', 'Saint Peter Canisius', NULL, NULL, '1521–1597'),
('saint-john-of-kanty', 'Saint John of Kanty', NULL, NULL, 'c. 1390–1473'),
('saint-stephen-martyr', 'Saint Stephen, the First Martyr', NULL, NULL, '1st century'),
('saint-john', 'Saint John, Apostle and Evangelist', NULL, NULL, '1st century'),
('holy-innocents', 'The Holy Innocents, Martyrs', NULL, NULL, ''),
('saint-thomas-becket', 'Saint Thomas Becket', NULL, NULL, 'c. 1118–1170'),
('saint-sylvester-i', 'Saint Sylvester I', NULL, NULL, 'd. 335')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-xavier', 'Saint François Xavier', NULL, NULL, '1506–1552'),
('saint-john-damascene', 'Saint Jean Damascène', NULL, NULL, 'v. 675–749'),
('saint-nicholas', 'Saint Nicolas, évêque', NULL, NULL, 'v. 270–343'),
('saint-ambrose', 'Saint Ambroise', NULL, NULL, 'v. 340–397'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin', NULL, NULL, 'v. 1474–1548'),
('saint-damasus-i', 'Saint Damase I', NULL, NULL, 'v. 305–384'),
('saint-lucy', 'Sainte Lucie, vierge et martyre', NULL, NULL, 'm. 304'),
('saint-john-of-the-cross', 'Saint Jean de la Croix', NULL, NULL, '1542–1591'),
('saint-peter-canisius', 'Saint Pierre Canisius', NULL, NULL, '1521–1597'),
('saint-john-of-kanty', 'Saint Jean de Kenty', NULL, NULL, 'v. 1390–1473'),
('saint-stephen-martyr', 'Saint Étienne, premier martyr', NULL, NULL, 'Ier siècle'),
('saint-john', 'Saint Jean, apôtre et évangéliste', NULL, NULL, 'Ier siècle'),
('holy-innocents', 'Les Saints Innocents, martyrs', NULL, NULL, ''),
('saint-thomas-becket', 'Saint Thomas Becket', NULL, NULL, 'v. 1118–1170'),
('saint-sylvester-i', 'Saint Sylvestre I', NULL, NULL, 'm. 335')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-xavier', 'Sanctus Franciscus Xaverius', NULL, NULL, '1506–1552'),
('saint-john-damascene', 'Sanctus Ioannes Damascenus', NULL, NULL, 'c. 675–749'),
('saint-nicholas', 'Sanctus Nicolaus, Episcopus', NULL, NULL, 'c. 270–343'),
('saint-ambrose', 'Sanctus Ambrosius', NULL, NULL, 'c. 340–397'),
('saint-juan-diego-cuauhtlatoatzin', 'Sanctus Ioannes Didacus Cuauhtlatoatzin', NULL, NULL, 'c. 1474–1548'),
('saint-damasus-i', 'Sanctus Damasus I', NULL, NULL, 'c. 305–384'),
('saint-lucy', 'Sancta Lucia, Virgo et Martyr', NULL, NULL, 'ob. 304'),
('saint-john-of-the-cross', 'Sanctus Ioannes a Cruce', NULL, NULL, '1542–1591'),
('saint-peter-canisius', 'Sanctus Petrus Canisius', NULL, NULL, '1521–1597'),
('saint-john-of-kanty', 'Sanctus Ioannes de Cantiis', NULL, NULL, 'c. 1390–1473'),
('saint-stephen-martyr', 'Sanctus Stephanus, Protomartyr', NULL, NULL, 'saec. I'),
('saint-john', 'Sanctus Ioannes, Apostolus et Evangelista', NULL, NULL, 'saec. I'),
('holy-innocents', 'Sancti Innocentes, Martyres', NULL, NULL, ''),
('saint-thomas-becket', 'Sanctus Thomas Becket', NULL, NULL, 'c. 1118–1170'),
('saint-sylvester-i', 'Sanctus Silvester I', NULL, NULL, 'ob. 335')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

COMMIT;
