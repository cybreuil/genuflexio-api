BEGIN;

-- =====================================================
-- SEED: PATRONAGES + TRANSLATIONS + SAINT_PATRONAGES
-- Calendrier romain – France
-- =====================================================
-- Run order: after seedRomanSaintPatronages.sql
--            after seedRomanFranceSaints.sql
-- Sources : Vatican.va · Acta Apostolicae Sedis
--           Catholic Encyclopedia · Butler's Lives
-- Colonne source_type dans saint_patronages :
--   OFF = proclamation officielle du Saint-Siège (AAS)
--   TRD = patronage traditionnel séculaire reconnu
--   DEV = dévotion populaire répandue
-- =====================================================


-- =====================================================
-- 1) CODES DES PATRONAGES
-- =====================================================
-- FRANCE is already inserted in seedRomanSaintPatronages.sql.
-- Guard against execution order variations.

INSERT INTO patronages (code) VALUES
  ('FRANCE'),
  ('LOURDES'),
  ('THE_SICK'),
  ('LYON'),
  ('ARLES'),
  ('ALAT'),
  ('PARIS'),
  ('NANTERRE'),
  ('GENDARMERIE'),
  ('LAWYERS'),
  ('BRITTANY'),
  ('REIMS')
ON CONFLICT (code) DO NOTHING;

-- TODO: ('PARIS') – patronage code does not yet exist in the schema.
-- Once a PARIS patronage code is added (distinct from the PARIS places code),
-- add saint-genevieve → PARIS (TRD) here.


-- =====================================================
-- 2) TRADUCTIONS DES PATRONAGES
-- =====================================================
-- FRANCE translations are already seeded in seedRomanSaintPatronages.sql.
-- Guard against execution order variations.

INSERT INTO patronage_translations (patronage_id, locale_code, label)
SELECT p.id, x.locale_code, x.label
FROM patronages p
JOIN (VALUES
  ('FRANCE',      'en', 'France'),
  ('LOURDES',     'en', 'Lourdes'),
  ('THE_SICK',    'en', 'The Sick'),
  ('LYON',        'en', 'Lyon'),
  ('ARLES',       'en', 'Arles'),
  ('ALAT',        'en', 'French Army Light Aviation (ALAT)'),
  ('PARIS',       'en', 'Paris'),
  ('NANTERRE',    'en', 'Nanterre'),
  ('GENDARMERIE', 'en', 'French National Gendarmerie'),
  ('LAWYERS',     'en', 'Lawyers'),
  ('BRITTANY',    'en', 'Brittany'),
  ('REIMS',       'en', 'Reims')
) AS x(code, locale_code, label) ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;

INSERT INTO patronage_translations (patronage_id, locale_code, label)
SELECT p.id, x.locale_code, x.label
FROM patronages p
JOIN (VALUES
  ('FRANCE',      'fr', 'France'),
  ('LOURDES',     'fr', 'Lourdes'),
  ('THE_SICK',    'fr', 'Les malades'),
  ('LYON',        'fr', 'Lyon'),
  ('ARLES',       'fr', 'Arles'),
  ('ALAT',        'fr', 'Aviation légère de l’armée de Terre (ALAT)'),
  ('PARIS',       'fr', 'Paris'),
  ('NANTERRE',    'fr', 'Nanterre'),
  ('GENDARMERIE', 'fr', 'Gendarmerie nationale'),
  ('LAWYERS',     'fr', 'Avocats'),
  ('BRITTANY',    'fr', 'Bretagne'),
  ('REIMS',       'fr', 'Reims')
) AS x(code, locale_code, label) ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;

INSERT INTO patronage_translations (patronage_id, locale_code, label)
SELECT p.id, x.locale_code, x.label
FROM patronages p
JOIN (VALUES
  ('FRANCE',      'la', 'Gallia'),
  ('LOURDES',     'la', 'Lurdum'),
  ('THE_SICK',    'la', 'Infirmi'),
  ('LYON',        'la', 'Lugdunum'),
  ('ARLES',       'la', 'Arelate'),
  ('ALAT',        'la', 'Aviatio Levis Exercitus Terrae Gallici'),
  ('PARIS',       'la', 'Lutetia Parisiorum'),
  ('NANTERRE',    'la', 'Nemptodurum'),
  ('GENDARMERIE', 'la', 'Gendarmeria Nationalis Gallica'),
  ('LAWYERS',     'la', 'Advocati'),
  ('BRITTANY',    'la', 'Britannia Minor'),
  ('REIMS',       'la', 'Durocortorum')
) AS x(code, locale_code, label) ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) SAINT_PATRONAGES LINKS
-- =====================================================
-- OFF = officially established patronage
-- TRD = traditional / devotional patronage
--
-- Sources and notes:
--   Bernadette Soubirous: devotion associated with the sick.
--   Blandina: traditional association with Lyon.
--   Caesarius of Arles: historical association with Arles.
--   Clotilde: officially established patroness of the ALAT
--     on 22 May 1994 by Bishop Michel Dubost.
--   Genevieve: patroness of Paris and the Gendarmerie.
--   Ivo of Kermartin: traditional patron saint of lawyers.
--   Joan of Arc: secondary patroness of France, 1922.
--   Pothinus: early bishop and martyr of Lyon.
--   Remigius: traditional association with Reims.
--
-- Patronage codes are in English, except proper names
-- and institutional names such as GENDARMERIE.
-- =====================================================

INSERT INTO saint_patronages (saint_id, patronage_id, source_type)
SELECT s.id, p.id, x.source_type
FROM (VALUES

  -- Saint Bernadette Soubirous
  ('saint-bernadette-soubirous', 'LOURDES',     'TRD'),
  ('saint-bernadette-soubirous', 'THE_SICK',    'TRD'),

  -- Saint Blandina
  ('saint-blandina',             'LYON',        'TRD'),

  -- Saint Caesarius of Arles
  ('saint-caesarius-of-arles',   'ARLES',       'TRD'),

  -- Saint Clotilde
  ('saint-clotilde',             'ALAT',        'OFF'),

  -- Saint Genevieve
  ('saint-genevieve',            'PARIS',       'TRD'),
  ('saint-genevieve',            'NANTERRE',    'TRD'),
  ('saint-genevieve',            'GENDARMERIE', 'OFF'),

  -- Saint Ivo of Kermartin
  ('saint-ivo-of-kermartin',     'LAWYERS',     'TRD'),
  ('saint-ivo-of-kermartin',     'BRITTANY',    'TRD'),

  -- Saint Joan of Arc
  ('saint-joan-of-arc',          'FRANCE',      'OFF'),

  -- Saint Pothinus
  ('saint-pothinus',             'LYON',        'TRD'),

  -- Saint Remigius
  ('saint-remigius',             'REIMS',       'TRD')

) AS x(saint_slug, patronage_code, source_type)
JOIN saints s
  ON s.slug = x.saint_slug
JOIN patronages p
  ON p.code = x.patronage_code
ON CONFLICT (saint_id, patronage_id) DO NOTHING;

COMMIT;
