BEGIN;

-- =====================
-- POLAND-SPECIFIC SAINTS
-- =====================

-- NEED DOUBLE CHECK IF PLACES ARE SEEDED !!!!
INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id,
  place_of_death_id,
  place_of_activity_id
) VALUES
(
  'saint-jozef-sebastian-pelczar', 'Saint Józef Sebastian Pelczar',
  1842, 1, 17, FALSE,
  1924, 3, 28, FALSE,
  20,
  (SELECT id FROM places WHERE code='KORCZYNA'),
  (SELECT id FROM places WHERE code='PRZEMYSL'),
  (SELECT id FROM places WHERE code='PRZEMYSL')
),
(
  'saint-vincent-pallotti', 'Saint Vincent Pallotti',
  1795, 4, 21, FALSE,
  1850, 1, 22, FALSE,
  19,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-florian', 'Saint Florian',
  250, NULL, NULL, TRUE,
  304, 5, 4, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='LORCH'),
  (SELECT id FROM places WHERE code='LORCH')
),
(
  'saint-stanislaw-kazimierczyk', 'Saint Stanisław Kazimierczyk',
  1433, 9, 27, FALSE,
  1489, 5, 3, FALSE,
  15,
  (SELECT id FROM places WHERE code='KAZIMIERZ'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-andrew-bobola', 'Saint Andrew Bobola',
  1591, 11, 30, FALSE,
  1657, 5, 16, FALSE,
  17,
  (SELECT id FROM places WHERE code='STRACHOCINA'),
  (SELECT id FROM places WHERE code='JANOW-POLESKI'),
  (SELECT id FROM places WHERE code='POLAND')
),
(
  'saint-ursula-ledochowska', 'Saint Ursula Ledóchowska',
  1865, 4, 17, FALSE,
  1939, 5, 29, FALSE,
  20,
  (SELECT id FROM places WHERE code='LOOSDORF'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='POLAND')
),
(
  'saint-john-sarkander', 'Saint John Sarkander',
  1576, 12, 20, FALSE,
  1620, 3, 17, FALSE,
  17,
  (SELECT id FROM places WHERE code='SKOCZOW'),
  (SELECT id FROM places WHERE code='OLOMOUC'),
  (SELECT id FROM places WHERE code='MORAVIA')
),
(
  'saint-zdzislawa', 'Saint Zdzisława',
  1220, NULL, NULL, TRUE,
  1252, NULL, NULL, TRUE,
  13,
  (SELECT id FROM places WHERE code='KRIZANOV'),
  (SELECT id FROM places WHERE code='JABLONNE-V-PODJESTEDI'),
  (SELECT id FROM places WHERE code='JABLONNE-V-PODJESTEDI')
),
(
  'saint-hedwig-the-queen', 'Saint Hedwig the Queen',
  1373, 2, 18, FALSE,
  1399, 7, 17, FALSE,
  14,
  (SELECT id FROM places WHERE code='BUDA'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'blessed-antoni-nowowiejski', 'Blessed Antoni Nowowiejski',
  1858, 2, 11, FALSE,
  1941, 5, 28, FALSE,
  20,
  (SELECT id FROM places WHERE code='LUBIEN'),
  (SELECT id FROM places WHERE code='DZIALDOWO'),
  (SELECT id FROM places WHERE code='PLOCK')
),
(
  'blessed-michael-kozal', 'Blessed Michael Kozal',
  1893, 9, 27, FALSE,
  1943, 1, 26, FALSE,
  20,
  (SELECT id FROM places WHERE code='NOWY-FOLWARK'),
  (SELECT id FROM places WHERE code='DACHAU'),
  (SELECT id FROM places WHERE code='WLOCLAWEK')
),
(
  'saint-albert-chmielowski', 'Saint Albert Chmielowski',
  1845, 8, 20, FALSE,
  1916, 12, 25, FALSE,
  20,
  (SELECT id FROM places WHERE code='IGOLOMIA'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-zygmunt-gorazdowski', 'Saint Zygmunt Gorazdowski',
  1845, 11, 1, FALSE,
  1920, 1, 1, FALSE,
  20,
  (SELECT id FROM places WHERE code='SANOK'),
  (SELECT id FROM places WHERE code='LWOW'),
  (SELECT id FROM places WHERE code='LWOW')
),
(
  'saint-otto-of-bamberg', 'Saint Otto of Bamberg',
  1060, NULL, NULL, TRUE,
  1139, 6, 30, FALSE,
  12,
  NULL,
  (SELECT id FROM places WHERE code='BAMBERG'),
  (SELECT id FROM places WHERE code='POMERANIA')
),
(
  'blessed-maria-teresia-ledochowska', 'Blessed Maria Teresia Ledóchowska',
  1863, 4, 29, FALSE,
  1922, 7, 6, FALSE,
  20,
  (SELECT id FROM places WHERE code='LOOSDORF'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-john-of-dukla', 'Saint John of Dukla',
  1414, NULL, NULL, TRUE,
  1484, 9, 29, FALSE,
  15,
  (SELECT id FROM places WHERE code='DUKLA'),
  (SELECT id FROM places WHERE code='LWOW'),
  (SELECT id FROM places WHERE code='LWOW')
),
(
  'saint-bruno-boniface-of-querfurt', 'Saint Bruno Boniface of Querfurt',
  974, NULL, NULL, TRUE,
  1009, 2, 14, FALSE,
  11,
  (SELECT id FROM places WHERE code='QUERFURT'),
  NULL,
  (SELECT id FROM places WHERE code='POLAND')
),
(
  'saint-andrzej-swierad', 'Saint Andrzej Świerad',
  980, NULL, NULL, TRUE,
  1030, 7, 13, FALSE,
  11,
  (SELECT id FROM places WHERE code='POLAND'),
  (SELECT id FROM places WHERE code='NITRA'),
  (SELECT id FROM places WHERE code='NITRA')
),
(
  'saint-benedict-the-hermit', 'Saint Benedict the Hermit',
  980, NULL, NULL, TRUE,
  1012, NULL, NULL, TRUE,
  11,
  NULL,
  (SELECT id FROM places WHERE code='NITRA'),
  (SELECT id FROM places WHERE code='NITRA')
),
(
  'saint-simon-of-lipnica', 'Saint Simon of Lipnica',
  1438, NULL, NULL, TRUE,
  1482, 7, 18, FALSE,
  15,
  (SELECT id FROM places WHERE code='LIPNICA-MUROWANA'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'blessed-czeslaw', 'Blessed Czesław',
  1184, NULL, NULL, TRUE,
  1242, 7, 15, FALSE,
  13,
  (SELECT id FROM places WHERE code='SILESIA'),
  (SELECT id FROM places WHERE code='WROCLAW'),
  (SELECT id FROM places WHERE code='WROCLAW')
),
(
  'saint-kinga', 'Saint Kinga',
  1224, 3, 5, FALSE,
  1292, 7, 24, FALSE,
  13,
  (SELECT id FROM places WHERE code='ESZTERGOM'),
  (SELECT id FROM places WHERE code='STARY-SACZ'),
  (SELECT id FROM places WHERE code='STARY-SACZ')
),
(
  'saint-hyacinth', 'Saint Hyacinth',
  1185, NULL, NULL, TRUE,
  1257, 8, 15, FALSE,
  13,
  (SELECT id FROM places WHERE code='KAMIEN-SLASKI'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='POLAND')
),
(
  'blessed-maria-stella', 'Blessed Maria Stella',
  1899, 5, 14, FALSE,
  1943, 8, 1, FALSE,
  20,
  (SELECT id FROM places WHERE code='NOWY-SACZ'),
  (SELECT id FROM places WHERE code='NOWOGRODEK'),
  (SELECT id FROM places WHERE code='NOWOGRODEK')
),
(
  'saint-melchior-grodziecki', 'Saint Melchior Grodziecki',
  1584, NULL, NULL, TRUE,
  1619, 9, 7, FALSE,
  17,
  (SELECT id FROM places WHERE code='CIESZYN'),
  (SELECT id FROM places WHERE code='KOSICE'),
  (SELECT id FROM places WHERE code='KOSICE')
),
(
  'saint-zygmunt-szczesny-felinski', 'Saint Zygmunt Szczęsny Feliński',
  1822, 11, 1, FALSE,
  1895, 9, 17, FALSE,
  19,
  (SELECT id FROM places WHERE code='WOLODZKA'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='WARSAW')
),
(
  'saint-stanislaw-kostka', 'Saint Stanisław Kostka',
  1550, 10, 28, FALSE,
  1568, 8, 15, FALSE,
  16,
  (SELECT id FROM places WHERE code='ROSTKOWO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'blessed-john-beyzym', 'Blessed John Beyzym',
  1850, 5, 15, FALSE,
  1912, 10, 12, FALSE,
  20,
  (SELECT id FROM places WHERE code='BEYSYMY'),
  (SELECT id FROM places WHERE code='FIANARANTSOA'),
  (SELECT id FROM places WHERE code='MADAGASCAR')
),
(
  'blessed-honorat-kozminski', 'Blessed Honorat Koźmiński',
  1829, 10, 16, FALSE,
  1916, 12, 16, FALSE,
  20,
  (SELECT id FROM places WHERE code='BIALA-PODLASKA'),
  (SELECT id FROM places WHERE code='NOWE-MIASTO-NAD-PILICA'),
  (SELECT id FROM places WHERE code='WARSAW')
),
(
  'saint-hedwig-of-poland', 'Saint Hedwig of Poland',
  1374, 2, 15, FALSE,
  1399, 7, 17, FALSE,
  14,
  (SELECT id FROM places WHERE code='BUDA'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-josef-bilczewski', 'Saint Josef Bilczewski',
  1860, 4, 26, FALSE,
  1923, 3, 20, FALSE,
  20,
  (SELECT id FROM places WHERE code='WILAMOWICE'),
  (SELECT id FROM places WHERE code='LWOW'),
  (SELECT id FROM places WHERE code='LWOW')
),
(
  'saint-benedykt-of-poland', 'Saint Benedykt of Poland',
  970, NULL, NULL, TRUE,
  1003, 11, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='POLAND'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ')
),
(
  'saint-jan-of-poland', 'Saint Jan of Poland',
  970, NULL, NULL, TRUE,
  1003, 11, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='POLAND'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ')
),
(
  'saint-mateusz-of-poland', 'Saint Mateusz of Poland',
  970, NULL, NULL, TRUE,
  1003, 11, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='POLAND'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ')
),
(
  'saint-isaak-of-poland', 'Saint Isaak of Poland',
  970, NULL, NULL, TRUE,
  1003, 11, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='POLAND'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ')
),
(
  'saint-krystyn-of-poland', 'Saint Krystyn of Poland',
  970, NULL, NULL, TRUE,
  1003, 11, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='POLAND'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ'),
  (SELECT id FROM places WHERE code='MIEDZYRZECZ')
),
(
  'blessed-karolina-kozkowna', 'Blessed Karolina Kózkówna',
  1898, 8, 2, FALSE,
  1914, 11, 18, FALSE,
  20,
  (SELECT id FROM places WHERE code='WAL-RUDA'),
  (SELECT id FROM places WHERE code='WAL-RUDA'),
  (SELECT id FROM places WHERE code='WAL-RUDA')
),
(
  'saint-rafal-kalinowski', 'Saint Rafał Kalinowski',
  1835, 9, 1, FALSE,
  1907, 11, 15, FALSE,
  20,
  (SELECT id FROM places WHERE code='VILNIUS'),
  (SELECT id FROM places WHERE code='WADOWICE'),
  (SELECT id FROM places WHERE code='CZERNA')
),
(
  'saint-barbara', 'Saint Barbara',
  NULL, NULL, NULL, TRUE,
  306, NULL, NULL, TRUE,
  4,
  NULL,
  NULL,
  NULL
)
ON CONFLICT (slug) DO NOTHING;

-- EN
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-jozef-sebastian-pelczar', 'Saint Józef Sebastian Pelczar', 'Bishop of Przemyśl and founder.', '', '1842–1924'),
('saint-vincent-pallotti', 'Saint Vincent Pallotti', 'Priest and founder of the Pallottines.', '', '1795–1850'),
('saint-florian', 'Saint Florian', 'Martyr and patron invoked against fire.', '', 'c. 250–304'),
('saint-stanislaw-kazimierczyk', 'Saint Stanisław Kazimierczyk', 'Canon Regular and preacher of Kraków.', '', '1433–1489'),
('saint-andrew-bobola', 'Saint Andrew Bobola', 'Jesuit priest and martyr.', '', '1591–1657'),
('saint-ursula-ledochowska', 'Saint Ursula Ledóchowska', 'Virgin and founder of the Ursuline Sisters of the Agonizing Heart of Jesus.', '', '1865–1939'),
('saint-john-sarkander', 'Saint John Sarkander', 'Priest and martyr of Moravia.', '', '1576–1620'),
('saint-zdzislawa', 'Saint Zdzisława', 'Wife, mother and Dominican tertiary.', '', 'c. 1220–1252'),
('saint-hedwig-the-queen', 'Saint Hedwig the Queen', 'Queen of Poland.', '', '1373–1399'),
('blessed-antoni-nowowiejski', 'Blessed Antoni Nowowiejski', 'Bishop and martyr with companions.', '', '1858–1941'),
('blessed-michael-kozal', 'Blessed Michael Kozal', 'Bishop and martyr.', '', '1893–1943'),
('saint-albert-chmielowski', 'Saint Albert Chmielowski', 'Religious and founder of the Albertine Brothers.', '', '1845–1916'),
('saint-zygmunt-gorazdowski', 'Saint Zygmunt Gorazdowski', 'Priest and founder.', '', '1845–1920'),
('saint-otto-of-bamberg', 'Saint Otto of Bamberg', 'Bishop and missionary of Pomerania.', '', 'c. 1060–1139'),
('blessed-maria-teresia-ledochowska', 'Blessed Maria Teresia Ledóchowska', 'Virgin and foundress dedicated to African missions.', '', '1863–1922'),
('saint-john-of-dukla', 'Saint John of Dukla', 'Priest and Franciscan preacher.', '', 'c. 1414–1484'),
('saint-bruno-boniface-of-querfurt', 'Saint Bruno Boniface of Querfurt', 'Bishop and missionary martyr.', '', 'c. 974–1009'),
('saint-andrzej-swierad', 'Saint Andrzej Świerad', 'Hermit and ascetic.', '', 'c. 980–1030'),
('saint-benedict-the-hermit', 'Saint Benedict', 'Hermit companion of Saint Andrzej Świerad.', '', 'c. 980–1033'),
('saint-simon-of-lipnica', 'Saint Simon of Lipnica', 'Priest and Franciscan preacher.', '', 'c. 1438–1482'),
('blessed-czeslaw', 'Blessed Czesław', 'Priest and Dominican preacher.', '', 'c. 1180–1242'),
('saint-kinga', 'Saint Kinga', 'Virgin and duchess of Poland.', '', '1234–1292'),
('saint-hyacinth', 'Saint Hyacinth', 'Priest and Dominican missionary.', '', 'c. 1185–1257'),
('blessed-maria-stella', 'Blessed Maria Stella', 'Virgin and martyr with companions.', '', '1899–1943'),
('saint-melchior-grodziecki', 'Saint Melchior Grodziecki', 'Priest and martyr.', '', 'c. 1584–1619'),
('saint-zygmunt-szczesny-felinski', 'Saint Zygmunt Szczęsny Feliński', 'Bishop and founder.', '', '1822–1895'),
('saint-stanislaw-kostka', 'Saint Stanisław Kostka', 'Religious and patron of youth.', '', '1550–1568'),
('blessed-john-beyzym', 'Blessed John Beyzym', 'Jesuit priest and missionary in Madagascar.', '', '1850–1912'),
('blessed-honorat-kozminski', 'Blessed Honorat Koźmiński', 'Capuchin priest and founder.', '', '1829–1916'),
('saint-hedwig-of-poland', 'Saint Hedwig of Poland', 'Queen of Poland.', '', '1374–1399'),
('saint-josef-bilczewski', 'Saint Josef Bilczewski', 'Archbishop of Lwów.', '', '1860–1923'),
('saint-benedykt-of-poland', 'Saint Benedykt of Poland', 'One of the first martyrs of Poland.', '', 'c. 970–1003'),
('saint-jan-of-poland', 'Saint Jan of Poland', 'One of the first martyrs of Poland.', '', 'c. 970–1003'),
('saint-mateusz-of-poland', 'Saint Mateusz of Poland', 'One of the first martyrs of Poland.', '', 'c. 970–1003'),
('saint-isaak-of-poland', 'Saint Isaak of Poland', 'One of the first martyrs of Poland.', '', 'c. 970–1003'),
('saint-krystyn-of-poland', 'Saint Krystyn of Poland', 'One of the first martyrs of Poland.', '', 'c. 970–1003'),
('blessed-karolina-kozkowna', 'Blessed Karolina Kózkówna', 'Virgin and martyr.', '', '1898–1914'),
('saint-rafal-kalinowski', 'Saint Rafał Kalinowski', 'Priest and Carmelite reformer.', '', '1835–1907'),
('saint-barbara', 'Saint Barbara', 'Virgin and martyr.', '', '† 306')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- FR
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-jozef-sebastian-pelczar', 'Saint Józef Sebastian Pelczar', 'Évêque de Przemyśl et fondateur.', '', '1842–1924'),
('saint-vincent-pallotti', 'Saint Vincent Pallotti', 'Prêtre et fondateur des Pallottins.', '', '1795–1850'),
('saint-florian', 'Saint Florian', 'Martyr invoqué contre les incendies.', '', 'v. 250–304'),
('saint-stanislaw-kazimierczyk', 'Saint Stanisław Kazimierczyk', 'Chanoine régulier et prédicateur de Cracovie.', '', '1433–1489'),
('saint-andrew-bobola', 'Saint André Bobola', 'Prêtre jésuite et martyr.', '', '1591–1657'),
('saint-ursula-ledochowska', 'Sainte Ursule Ledóchowska', 'Vierge et fondatrice des Ursulines du Cœur agonisant de Jésus.', '', '1865–1939'),
('saint-john-sarkander', 'Saint Jean Sarkander', 'Prêtre et martyr de Moravie.', '', '1576–1620'),
('saint-zdzislawa', 'Sainte Zdzisława', 'Épouse, mère de famille et tertiaire dominicaine.', '', 'v. 1220–1252'),
('saint-hedwig-the-queen', 'Sainte Edwige la Reine', 'Reine de Pologne.', '', '1373–1399'),
('blessed-antoni-nowowiejski', 'Bienheureux Antoni Nowowiejski', 'Évêque et martyr avec ses compagnons.', '', '1858–1941'),
('blessed-michael-kozal', 'Bienheureux Michel Kozal', 'Évêque et martyr.', '', '1893–1943'),
('saint-albert-chmielowski', 'Saint Albert Chmielowski', 'Religieux et fondateur des Frères Albertins.', '', '1845–1916'),
('saint-zygmunt-gorazdowski', 'Saint Zygmunt Gorazdowski', 'Prêtre et fondateur.', '', '1845–1920'),
('saint-otto-of-bamberg', 'Saint Otton de Bamberg', 'Évêque et missionnaire de Poméranie.', '', 'v. 1060–1139'),
('blessed-maria-teresia-ledochowska', 'Bienheureuse Maria Teresa Ledóchowska', 'Vierge et fondatrice vouée aux missions africaines.', '', '1863–1922'),
('saint-john-of-dukla', 'Saint Jean de Dukla', 'Prêtre et prédicateur franciscain.', '', 'v. 1414–1484'),
('saint-bruno-boniface-of-querfurt', 'Saint Bruno Boniface de Querfurt', 'Évêque et martyr missionnaire.', '', 'v. 974–1009'),
('saint-andrzej-swierad', 'Saint André Świerad', 'Ermite et ascète.', '', 'v. 980–1030'),
('saint-benedict-the-hermit', 'Saint Benoît', 'Ermite compagnon de saint André Świerad.', '', 'v. 980–1033'),
('saint-simon-of-lipnica', 'Saint Simon de Lipnica', 'Prêtre et prédicateur franciscain.', '', 'v. 1438–1482'),
('blessed-czeslaw', 'Bienheureux Czesław', 'Prêtre et prédicateur dominicain.', '', 'v. 1180–1242'),
('saint-kinga', 'Sainte Kinga', 'Vierge et duchesse de Pologne.', '', '1234–1292'),
('saint-hyacinth', 'Saint Hyacinthe', 'Prêtre et missionnaire dominicain.', '', 'v. 1185–1257'),
('blessed-maria-stella', 'Bienheureuse Maria Stella', 'Vierge et martyre avec ses compagnes.', '', '1899–1943'),
('saint-melchior-grodziecki', 'Saint Melchior Grodziecki', 'Prêtre et martyr.', '', 'v. 1584–1619'),
('saint-zygmunt-szczesny-felinski', 'Saint Zygmunt Szczęsny Feliński', 'Évêque et fondateur.', '', '1822–1895'),
('saint-stanislaw-kostka', 'Saint Stanisław Kostka', 'Religieux et patron de la jeunesse.', '', '1550–1568'),
('blessed-john-beyzym', 'Bienheureux Jean Beyzym', 'Prêtre jésuite et missionnaire à Madagascar.', '', '1850–1912'),
('blessed-honorat-kozminski', 'Bienheureux Honorat Koźmiński', 'Prêtre capucin et fondateur.', '', '1829–1916'),
('saint-hedwig-of-poland', 'Sainte Edwige de Pologne', 'Reine de Pologne.', '', '1374–1399'),
('saint-josef-bilczewski', 'Saint Josef Bilczewski', 'Archevêque de Lwów.', '', '1860–1923'),
('saint-benedykt-of-poland', 'Saint Benedykt de Pologne', 'L''un des premiers martyrs de Pologne.', '', 'v. 970–1003'),
('saint-jan-of-poland', 'Saint Jan de Pologne', 'L''un des premiers martyrs de Pologne.', '', 'v. 970–1003'),
('saint-mateusz-of-poland', 'Saint Mateusz de Pologne', 'L''un des premiers martyrs de Pologne.', '', 'v. 970–1003'),
('saint-isaak-of-poland', 'Saint Isaak de Pologne', 'L''un des premiers martyrs de Pologne.', '', 'v. 970–1003'),
('saint-krystyn-of-poland', 'Saint Krystyn de Pologne', 'L''un des premiers martyrs de Pologne.', '', 'v. 970–1003'),
('blessed-karolina-kozkowna', 'Bienheureuse Karolina Kózkówna', 'Vierge et martyre.', '', '1898–1914'),
('saint-rafal-kalinowski', 'Saint Rafał Kalinowski', 'Prêtre et réformateur carme.', '', '1835–1907'),
('saint-barbara', 'Sainte Barbe', 'Vierge et martyre.', '', '† 306')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- LA
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-jozef-sebastian-pelczar', 'Sanctus Ioseph Sebastianus Pelczar', 'Episcopus Premisliensis et fundator.', '', '1842–1924'),
('saint-vincent-pallotti', 'Sanctus Vincentius Pallotti', 'Presbyter et fundator Pallottinorum.', '', '1795–1850'),
('saint-florian', 'Sanctus Florianus', 'Martyr contra incendia invocatus.', '', 'c. 250–304'),
('saint-stanislaw-kazimierczyk', 'Sanctus Stanislaus Kazimierczyk', 'Canonicus Regularis et concionator Cracoviensis.', '', '1433–1489'),
('saint-andrew-bobola', 'Sanctus Andreas Bobola', 'Presbyter Iesuita et martyr.', '', '1591–1657'),
('saint-ursula-ledochowska', 'Sancta Ursula Ledóchowska', 'Virgo et fundatrix Ursulinarum Cordis Iesu Agonizantis.', '', '1865–1939'),
('saint-john-sarkander', 'Sanctus Ioannes Sarkander', 'Presbyter et martyr Moraviae.', '', '1576–1620'),
('saint-zdzislawa', 'Sancta Zdzislava', 'Uxor, materfamilias et tertiaria Dominicana.', '', 'c. 1220–1252'),
('saint-hedwig-the-queen', 'Sancta Hedvigis Regina', 'Regina Poloniae.', '', '1373–1399'),
('blessed-antoni-nowowiejski', 'Beatus Antonius Nowowiejski', 'Episcopus et martyr cum sociis.', '', '1858–1941'),
('blessed-michael-kozal', 'Beatus Michael Kozal', 'Episcopus et martyr.', '', '1893–1943'),
('saint-albert-chmielowski', 'Sanctus Albertus Chmielowski', 'Religiosus et fundator Fratrum Albertinorum.', '', '1845–1916'),
('saint-zygmunt-gorazdowski', 'Sanctus Sigismundus Gorazdowski', 'Presbyter et fundator.', '', '1845–1920'),
('saint-otto-of-bamberg', 'Sanctus Otto Babenbergensis', 'Episcopus et missionarius Pomeraniae.', '', 'c. 1060–1139'),
('blessed-maria-teresia-ledochowska', 'Beata Maria Theresia Ledóchowska', 'Virgo et fundatrix missionibus Africae dedita.', '', '1863–1922'),
('saint-john-of-dukla', 'Sanctus Ioannes de Dukla', 'Presbyter et praedicator Franciscanus.', '', 'c. 1414–1484'),
('saint-bruno-boniface-of-querfurt', 'Sanctus Bruno Bonifatius de Querfurt', 'Episcopus et martyr missionarius.', '', 'c. 974–1009'),
('saint-andrzej-swierad', 'Sanctus Andreas Svierad', 'Eremita et asceta.', '', 'c. 980–1030'),
('saint-benedict-the-hermit', 'Sanctus Benedictus', 'Eremita socius Sancti Andreae Svierad.', '', 'c. 980–1033'),
('saint-simon-of-lipnica', 'Sanctus Simon de Lipnica', 'Presbyter et praedicator Franciscanus.', '', 'c. 1438–1482'),
('blessed-czeslaw', 'Beatus Czeslaus', 'Presbyter et praedicator Dominicanus.', '', 'c. 1180–1242'),
('saint-kinga', 'Sancta Kinga', 'Virgo et ducissa Poloniae.', '', '1234–1292'),
('saint-hyacinth', 'Sanctus Hyacinthus', 'Presbyter et missionarius Dominicanus.', '', 'c. 1185–1257'),
('blessed-maria-stella', 'Beata Maria Stella', 'Virgo et martyr cum sociis.', '', '1899–1943'),
('saint-melchior-grodziecki', 'Sanctus Melchior Grodziecki', 'Presbyter et martyr.', '', 'c. 1584–1619'),
('saint-zygmunt-szczesny-felinski', 'Sanctus Sigismundus Felix Feliński', 'Episcopus et fundator.', '', '1822–1895'),
('saint-stanislaw-kostka', 'Sanctus Stanislaus Kostka', 'Religiosus et patronus iuventutis.', '', '1550–1568'),
('blessed-john-beyzym', 'Beatus Ioannes Beyzym', 'Presbyter Iesuita et missionarius in Madagascar.', '', '1850–1912'),
('blessed-honorat-kozminski', 'Beatus Honoratus Koźmiński', 'Presbyter Capuccinus et fundator.', '', '1829–1916'),
('saint-hedwig-of-poland', 'Sancta Hedvigis Poloniae', 'Regina Poloniae.', '', '1374–1399'),
('saint-josef-bilczewski', 'Sanctus Ioseph Bilczewski', 'Archiepiscopus Leopoliensis.', '', '1860–1923'),
('saint-benedykt-of-poland', 'Sanctus Benedykt Poloniae', 'Unus ex primis martyribus Poloniae.', '', 'c. 970–1003'),
('saint-jan-of-poland', 'Sanctus Ioannes Poloniae', 'Unus ex primis martyribus Poloniae.', '', 'c. 970–1003'),
('saint-mateusz-of-poland', 'Sanctus Matthaeus Poloniae', 'Unus ex primis martyribus Poloniae.', '', 'c. 970–1003'),
('saint-isaak-of-poland', 'Sanctus Isaac Poloniae', 'Unus ex primis martyribus Poloniae.', '', 'c. 970–1003'),
('saint-krystyn-of-poland', 'Sanctus Krystyn Poloniae', 'Unus ex primis martyribus Poloniae.', '', 'c. 970–1003'),
('blessed-karolina-kozkowna', 'Beata Carolina Kózkówna', 'Virgo et martyr.', '', '1898–1914'),
('saint-rafal-kalinowski', 'Sanctus Raphael Kalinowski', 'Presbyter et reformator Carmelitanus.', '', '1835–1907'),
('saint-barbara', 'Sancta Barbara', 'Virgo et martyr.', '', '† 306')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

COMMIT;
