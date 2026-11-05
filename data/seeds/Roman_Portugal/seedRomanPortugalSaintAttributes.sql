BEGIN;

-- =====================================================
-- SEED: ATTRIBUTES – Calendrier propre du Portugal
-- =====================================================
-- Run order: after seedRomanSaintAttributes.sql (General)
--            and seedRomanPortugalSaints.sql
-- Réutilise les codes déjà seedés dans Roman_General ;
-- n'ajoute que les quelques attributs manquants.
-- Niveau : grandes lignes / iconographie évidente.
-- =====================================================


-- =====================================================
-- 1) NOUVEAUX ATTRIBUTES (absents du seed général)
-- =====================================================

INSERT INTO attributes (code, category) VALUES
('BLESSED',            'title'),   -- Bienheureux / Bienheureuse
('CANON_REGULAR',      'order'),   -- Chanoines réguliers (Santa Cruz de Coimbra)
('CONCEPTIONIST',      'order')    -- Ordre de l'Immaculée Conception (Béatrice de Silva)
ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRANSLATIONS – EN
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'en', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BLESSED',       'Blessed',        'Beatified by the Church, awaiting canonization.'),
  ('CANON_REGULAR', 'Canon Regular',  'Canons Regular living under the Rule of Saint Augustine.'),
  ('CONCEPTIONIST', 'Conceptionist',  'Order of the Immaculate Conception, founded by Beatrice of Silva.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) TRANSLATIONS – FR
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'fr', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BLESSED',       'Bienheureux',        'Béatifié(e) par l''Église, en attente de canonisation.'),
  ('CANON_REGULAR', 'Chanoine régulier',  'Chanoines réguliers vivant sous la règle de saint Augustin.'),
  ('CONCEPTIONIST', 'Conceptionniste',    'Ordre de l''Immaculée Conception, fondé par Béatrice de Silva.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 4) TRANSLATIONS – LA
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'la', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BLESSED',       'Beatus',               'Ab Ecclesia beatificatus, canonizationem exspectans.'),
  ('CANON_REGULAR', 'Canonicus Regularis',  'Canonici Regulares sub Regula Sancti Augustini.'),
  ('CONCEPTIONIST', 'Conceptionista',       'Ordo Immaculatae Conceptionis, a Beatrice de Silva conditus.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 5) SAINT_ATTRIBUTES
-- =====================================================

INSERT INTO saint_attributes (saint_id, attribute_id)
SELECT s.id, a.id
FROM (VALUES

  -- Gonçalo de Amarante – dominicain, bâtisseur de pont
  ('blessed-goncalo-de-amarante',      'PRIEST'),
  ('blessed-goncalo-de-amarante',      'DOMINICAN'),
  ('blessed-goncalo-de-amarante',      'BLESSED'),

  -- John de Brito – jésuite martyr en Inde
  ('saint-john-de-brito',              'PALM'),
  ('saint-john-de-brito',              'PRIEST'),
  ('saint-john-de-brito',              'MARTYR'),
  ('saint-john-de-brito',              'JESUIT'),

  -- Theotonius – chanoine régulier de Coimbra
  ('saint-theotonius',                 'PRIEST'),
  ('saint-theotonius',                 'CANON_REGULAR'),

  -- Jacinta & Francisco Marto – enfants de Fátima
  ('saint-jacinta-marto',              'ROSARY'),
  ('saint-francisco-marto',            'ROSARY'),

  -- Joan of Portugal – princesse, dominicaine
  ('blessed-joan-of-portugal',         'CROWN'),
  ('blessed-joan-of-portugal',         'VIRGIN'),
  ('blessed-joan-of-portugal',         'DOMINICAN'),
  ('blessed-joan-of-portugal',         'BLESSED'),

  -- Sancha, Mafalda, Theresa – infantes, cisterciennes
  ('blessed-sancha-of-portugal',       'CROWN'),
  ('blessed-sancha-of-portugal',       'VIRGIN'),
  ('blessed-sancha-of-portugal',       'CISTERCIAN'),
  ('blessed-sancha-of-portugal',       'BLESSED'),
  ('blessed-mafalda-of-portugal',      'CROWN'),
  ('blessed-mafalda-of-portugal',      'CISTERCIAN'),
  ('blessed-mafalda-of-portugal',      'BLESSED'),
  ('blessed-theresa-of-portugal',      'CROWN'),
  ('blessed-theresa-of-portugal',      'QUEEN'),
  ('blessed-theresa-of-portugal',      'CISTERCIAN'),
  ('blessed-theresa-of-portugal',      'BLESSED'),

  -- Inácio de Azevedo – jésuite martyr (quarante martyrs du Brésil)
  ('blessed-inacio-de-azevedo',        'PALM'),
  ('blessed-inacio-de-azevedo',        'PRIEST'),
  ('blessed-inacio-de-azevedo',        'MARTYR'),
  ('blessed-inacio-de-azevedo',        'JESUIT'),
  ('blessed-inacio-de-azevedo',        'BLESSED'),

  -- Bartholomew of the Martyrs – archevêque de Braga, dominicain
  ('blessed-bartholomew-of-the-martyrs', 'MITRE'),
  ('blessed-bartholomew-of-the-martyrs', 'BOOK'),
  ('blessed-bartholomew-of-the-martyrs', 'BISHOP'),
  ('blessed-bartholomew-of-the-martyrs', 'DOMINICAN'),
  ('blessed-bartholomew-of-the-martyrs', 'BLESSED'),

  -- Beatrice of Silva – fondatrice des Conceptionnistes
  ('saint-beatrice-of-silva',          'VIRGIN'),
  ('saint-beatrice-of-silva',          'RELIGIOUS'),
  ('saint-beatrice-of-silva',          'CONCEPTIONIST'),

  -- Gonçalo de Lagos – ermite augustin
  ('blessed-goncalo-de-lagos',         'PRIEST'),
  ('blessed-goncalo-de-lagos',         'AUGUSTINIAN'),
  ('blessed-goncalo-de-lagos',         'BLESSED'),

  -- Nuno of Saint Mary – connétable devenu carme
  ('saint-nuno-of-saint-mary',         'SWORD'),
  ('saint-nuno-of-saint-mary',         'RELIGIOUS'),
  ('saint-nuno-of-saint-mary',         'CARMELITE'),

  -- Martin of Dume – évêque de Braga
  ('saint-martin-of-dume',             'MITRE'),
  ('saint-martin-of-dume',             'BOOK'),
  ('saint-martin-of-dume',             'BISHOP'),

  -- Gerald of Braga – archevêque
  ('saint-gerald-of-braga',            'MITRE'),
  ('saint-gerald-of-braga',            'CROSIER'),
  ('saint-gerald-of-braga',            'BISHOP'),
  ('saint-gerald-of-braga',            'BENEDICTINE')

) AS pairs(saint_slug, attr_code)
JOIN saints     s ON s.slug = pairs.saint_slug
JOIN attributes a ON a.code = pairs.attr_code
ON CONFLICT DO NOTHING;

COMMIT;
