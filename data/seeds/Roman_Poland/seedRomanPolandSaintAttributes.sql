BEGIN;

-- =====================================================
-- SEED: ATTRIBUTES – Calendrier propre de Pologne
-- =====================================================
-- Run order: after seedRomanSaintAttributes.sql (General)
--            and seedRomanPolandSaints.sql
-- Réutilise les codes déjà seedés dans Roman_General ;
-- n'ajoute que les quelques attributs manquants.
-- Niveau : grandes lignes / iconographie évidente.
-- =====================================================


-- =====================================================
-- 1) NOUVEAUX ATTRIBUTES (absents du seed général)
-- =====================================================

INSERT INTO attributes (code, category) VALUES
('BUCKET',             'symbol'),  -- Seau d'eau (saint Florian éteignant l'incendie)
('TOWER',              'symbol'),  -- Tour à trois fenêtres (sainte Barbe)
('BLESSED',            'title'),   -- Bienheureux / Bienheureuse
('PALLOTTINE',         'order'),   -- Société de l'Apostolat catholique
('CAPUCHIN',           'order'),   -- Frères mineurs capucins
('CANON_REGULAR',      'order')    -- Chanoines réguliers (Latran)
ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRANSLATIONS – EN
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'en', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BUCKET',        'Bucket',           'Bucket of water, Saint Florian extinguishing a fire.'),
  ('TOWER',         'Tower',            'Tower with three windows, attribute of Saint Barbara.'),
  ('BLESSED',       'Blessed',          'Beatified by the Church, awaiting canonization.'),
  ('PALLOTTINE',    'Pallottine',       'Society of the Catholic Apostolate, founded by Vincent Pallotti.'),
  ('CAPUCHIN',      'Capuchin',         'Order of Friars Minor Capuchin.'),
  ('CANON_REGULAR', 'Canon Regular',    'Canons Regular living under the Rule of Saint Augustine.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) TRANSLATIONS – FR
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'fr', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BUCKET',        'Seau',              'Seau d''eau, saint Florian éteignant un incendie.'),
  ('TOWER',         'Tour',              'Tour à trois fenêtres, attribut de sainte Barbe.'),
  ('BLESSED',       'Bienheureux',       'Béatifié(e) par l''Église, en attente de canonisation.'),
  ('PALLOTTINE',    'Pallottin',         'Société de l''Apostolat catholique, fondée par Vincent Pallotti.'),
  ('CAPUCHIN',      'Capucin',           'Ordre des Frères mineurs capucins.'),
  ('CANON_REGULAR', 'Chanoine régulier', 'Chanoines réguliers vivant sous la règle de saint Augustin.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 4) TRANSLATIONS – LA
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'la', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BUCKET',        'Situla',             'Situla aquae, Sanctus Florianus incendium exstinguens.'),
  ('TOWER',         'Turris',             'Turris tribus fenestris, signum Sanctae Barbarae.'),
  ('BLESSED',       'Beatus',             'Ab Ecclesia beatificatus, canonizationem exspectans.'),
  ('PALLOTTINE',    'Pallottinus',        'Societas Apostolatus Catholici, a Vincentio Pallotti condita.'),
  ('CAPUCHIN',      'Capuccinus',         'Ordo Fratrum Minorum Capuccinorum.'),
  ('CANON_REGULAR', 'Canonicus Regularis','Canonici Regulares sub Regula Sancti Augustini.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 5) SAINT_ATTRIBUTES
-- =====================================================

INSERT INTO saint_attributes (saint_id, attribute_id)
SELECT s.id, a.id
FROM (VALUES

  -- Józef Sebastian Pelczar – évêque de Przemyśl, fondateur
  ('saint-jozef-sebastian-pelczar',   'MITRE'),
  ('saint-jozef-sebastian-pelczar',   'BISHOP'),

  -- Vincent Pallotti – prêtre, fondateur des Pallottins
  ('saint-vincent-pallotti',          'PRIEST'),
  ('saint-vincent-pallotti',          'PALLOTTINE'),

  -- Florian – soldat romain martyr, seau d'eau
  ('saint-florian',                   'BUCKET'),
  ('saint-florian',                   'PALM'),
  ('saint-florian',                   'MARTYR'),

  -- Stanisław Kazimierczyk – chanoine régulier de Latran
  ('saint-stanislaw-kazimierczyk',    'PRIEST'),
  ('saint-stanislaw-kazimierczyk',    'CANON_REGULAR'),

  -- Andrew Bobola – jésuite martyr
  ('saint-andrew-bobola',             'PALM'),
  ('saint-andrew-bobola',             'PRIEST'),
  ('saint-andrew-bobola',             'MARTYR'),
  ('saint-andrew-bobola',             'JESUIT'),

  -- Ursula Ledóchowska – fondatrice des Ursulines grises
  ('saint-ursula-ledochowska',        'VIRGIN'),
  ('saint-ursula-ledochowska',        'RELIGIOUS'),
  ('saint-ursula-ledochowska',        'URSULINE'),

  -- John Sarkander – prêtre martyr (secret de la confession)
  ('saint-john-sarkander',            'PALM'),
  ('saint-john-sarkander',            'PRIEST'),
  ('saint-john-sarkander',            'MARTYR'),

  -- Zdzisława – mère de famille, tertiaire dominicaine
  ('saint-zdzislawa',                 'DOMINICAN'),

  -- Hedwig the Queen (Jadwiga) – reine de Pologne
  ('saint-hedwig-the-queen',          'CROWN'),
  ('saint-hedwig-the-queen',          'QUEEN'),

  -- Antoni Nowowiejski – évêque martyr (Działdowo)
  ('blessed-antoni-nowowiejski',      'MITRE'),
  ('blessed-antoni-nowowiejski',      'PALM'),
  ('blessed-antoni-nowowiejski',      'BISHOP'),
  ('blessed-antoni-nowowiejski',      'MARTYR'),
  ('blessed-antoni-nowowiejski',      'BLESSED'),

  -- Michael Kozal – évêque martyr (Dachau)
  ('blessed-michael-kozal',           'MITRE'),
  ('blessed-michael-kozal',           'PALM'),
  ('blessed-michael-kozal',           'BISHOP'),
  ('blessed-michael-kozal',           'MARTYR'),
  ('blessed-michael-kozal',           'BLESSED'),

  -- Albert Chmielowski – peintre, frère albertin (tertiaire franciscain)
  ('saint-albert-chmielowski',        'BREAD'),
  ('saint-albert-chmielowski',        'RELIGIOUS'),
  ('saint-albert-chmielowski',        'FRANCISCAN'),

  -- Zygmunt Gorazdowski – prêtre, fondateur
  ('saint-zygmunt-gorazdowski',       'PRIEST'),

  -- Otto of Bamberg – évêque, apôtre de la Poméranie
  ('saint-otto-of-bamberg',           'MITRE'),
  ('saint-otto-of-bamberg',           'CROSIER'),
  ('saint-otto-of-bamberg',           'BISHOP'),

  -- Maria Teresia Ledóchowska – fondatrice (missions d'Afrique)
  ('blessed-maria-teresia-ledochowska', 'VIRGIN'),
  ('blessed-maria-teresia-ledochowska', 'RELIGIOUS'),
  ('blessed-maria-teresia-ledochowska', 'BLESSED'),

  -- John of Dukla – franciscain
  ('saint-john-of-dukla',             'PRIEST'),
  ('saint-john-of-dukla',             'FRANCISCAN'),

  -- Bruno Boniface of Querfurt – évêque missionnaire martyr
  ('saint-bruno-boniface-of-querfurt','MITRE'),
  ('saint-bruno-boniface-of-querfurt','PALM'),
  ('saint-bruno-boniface-of-querfurt','BISHOP'),
  ('saint-bruno-boniface-of-querfurt','MARTYR'),
  ('saint-bruno-boniface-of-querfurt','CAMALDOLESE'),

  -- Andrzej Świerad & Benedict – ermites
  ('saint-andrzej-swierad',           'HERMIT'),
  ('saint-andrzej-swierad',           'BENEDICTINE'),
  ('saint-benedict-the-hermit',       'HERMIT'),
  ('saint-benedict-the-hermit',       'MARTYR'),
  ('saint-benedict-the-hermit',       'BENEDICTINE'),

  -- Simon of Lipnica – franciscain prédicateur
  ('saint-simon-of-lipnica',          'IHS_MONOGRAM'),
  ('saint-simon-of-lipnica',          'PRIEST'),
  ('saint-simon-of-lipnica',          'FRANCISCAN'),

  -- Czesław – dominicain
  ('blessed-czeslaw',                 'PRIEST'),
  ('blessed-czeslaw',                 'DOMINICAN'),
  ('blessed-czeslaw',                 'BLESSED'),

  -- Kinga – duchesse, clarisse
  ('saint-kinga',                     'CROWN'),
  ('saint-kinga',                     'POOR_CLARES'),

  -- Hyacinth – dominicain, ostensoir + statue de la Vierge
  ('saint-hyacinth',                  'MONSTRANCE'),
  ('saint-hyacinth',                  'PRIEST'),
  ('saint-hyacinth',                  'DOMINICAN'),

  -- Maria Stella & compagnes – religieuses martyres (Nowogródek)
  ('blessed-maria-stella',            'PALM'),
  ('blessed-maria-stella',            'VIRGIN'),
  ('blessed-maria-stella',            'MARTYR'),
  ('blessed-maria-stella',            'RELIGIOUS'),
  ('blessed-maria-stella',            'BLESSED'),

  -- Melchior Grodziecki – jésuite martyr (Košice)
  ('saint-melchior-grodziecki',       'PALM'),
  ('saint-melchior-grodziecki',       'PRIEST'),
  ('saint-melchior-grodziecki',       'MARTYR'),
  ('saint-melchior-grodziecki',       'JESUIT'),

  -- Zygmunt Szczęsny Feliński – archevêque de Varsovie
  ('saint-zygmunt-szczesny-felinski', 'MITRE'),
  ('saint-zygmunt-szczesny-felinski', 'BISHOP'),

  -- Stanisław Kostka – novice jésuite, lys, Enfant Jésus
  ('saint-stanislaw-kostka',          'LILY'),
  ('saint-stanislaw-kostka',          'CHILD_JESUS'),
  ('saint-stanislaw-kostka',          'RELIGIOUS'),
  ('saint-stanislaw-kostka',          'JESUIT'),

  -- John Beyzym – jésuite, apôtre des lépreux
  ('blessed-john-beyzym',             'PRIEST'),
  ('blessed-john-beyzym',             'JESUIT'),
  ('blessed-john-beyzym',             'BLESSED'),

  -- Honorat Koźmiński – capucin
  ('blessed-honorat-kozminski',       'PRIEST'),
  ('blessed-honorat-kozminski',       'CAPUCHIN'),
  ('blessed-honorat-kozminski',       'BLESSED'),

  -- Hedwig of Poland (Jadwiga) – reine
  ('saint-hedwig-of-poland',          'CROWN'),
  ('saint-hedwig-of-poland',          'QUEEN'),

  -- Józef Bilczewski – archevêque de Lwów
  ('saint-josef-bilczewski',          'MITRE'),
  ('saint-josef-bilczewski',          'BISHOP'),

  -- Cinq Frères Martyrs de Pologne (1003)
  ('saint-benedykt-of-poland',        'PALM'),
  ('saint-benedykt-of-poland',        'MARTYR'),
  ('saint-benedykt-of-poland',        'CAMALDOLESE'),
  ('saint-jan-of-poland',             'PALM'),
  ('saint-jan-of-poland',             'MARTYR'),
  ('saint-jan-of-poland',             'CAMALDOLESE'),
  ('saint-mateusz-of-poland',         'PALM'),
  ('saint-mateusz-of-poland',         'MARTYR'),
  ('saint-mateusz-of-poland',         'CAMALDOLESE'),
  ('saint-isaak-of-poland',           'PALM'),
  ('saint-isaak-of-poland',           'MARTYR'),
  ('saint-isaak-of-poland',           'CAMALDOLESE'),
  ('saint-krystyn-of-poland',         'PALM'),
  ('saint-krystyn-of-poland',         'MARTYR'),
  ('saint-krystyn-of-poland',         'CAMALDOLESE'),

  -- Karolina Kózkówna – vierge martyre (1914)
  ('blessed-karolina-kozkowna',       'LILY'),
  ('blessed-karolina-kozkowna',       'PALM'),
  ('blessed-karolina-kozkowna',       'VIRGIN'),
  ('blessed-karolina-kozkowna',       'MARTYR'),
  ('blessed-karolina-kozkowna',       'BLESSED'),

  -- Rafał Kalinowski – carme déchaux
  ('saint-rafal-kalinowski',          'PRIEST'),
  ('saint-rafal-kalinowski',          'CARMELITE'),

  -- Barbara – vierge martyre, tour
  ('saint-barbara',                   'TOWER'),
  ('saint-barbara',                   'PALM'),
  ('saint-barbara',                   'CHALICE'),
  ('saint-barbara',                   'VIRGIN'),
  ('saint-barbara',                   'MARTYR')

) AS pairs(saint_slug, attr_code)
JOIN saints     s ON s.slug = pairs.saint_slug
JOIN attributes a ON a.code = pairs.attr_code
ON CONFLICT DO NOTHING;

COMMIT;
