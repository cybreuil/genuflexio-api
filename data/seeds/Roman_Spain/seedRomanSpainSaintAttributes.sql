BEGIN;

-- =====================================================
-- SEED: ATTRIBUTES – Calendrier propre d'Espagne
-- =====================================================
-- Run order: after seedRomanSaintAttributes.sql (General)
--            and seedRomanSpainSaints.sql
-- Réutilise les codes déjà seedés dans Roman_General ;
-- n'ajoute que les quelques attributs manquants.
-- Niveau : grandes lignes / iconographie évidente.
-- =====================================================


-- =====================================================
-- 1) NOUVEAUX ATTRIBUTES (absents du seed général)
-- =====================================================

INSERT INTO attributes (code, category) VALUES
('PLOUGH',             'symbol'),  -- Charrue (saint Isidore le Laboureur)
('CHASUBLE',           'symbol'),  -- Chasuble reçue de la Vierge (saint Ildefonse)
('BLESSED',            'title')    -- Bienheureux / Bienheureuse
ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRANSLATIONS – EN
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'en', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('PLOUGH',    'Plough',    'Plough, often drawn by angels: Saint Isidore the Farmer.'),
  ('CHASUBLE',  'Chasuble',  'Chasuble given by the Virgin Mary to Saint Ildephonsus of Toledo.'),
  ('BLESSED',   'Blessed',   'Beatified by the Church, awaiting canonization.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) TRANSLATIONS – FR
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'fr', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('PLOUGH',    'Charrue',     'Charrue, souvent tirée par des anges : saint Isidore le Laboureur.'),
  ('CHASUBLE',  'Chasuble',    'Chasuble remise par la Vierge à saint Ildefonse de Tolède.'),
  ('BLESSED',   'Bienheureux', 'Béatifié(e) par l''Église, en attente de canonisation.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 4) TRANSLATIONS – LA
-- =====================================================

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'la', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('PLOUGH',    'Aratrum',  'Aratrum, saepe ab angelis tractum: Sanctus Isidorus Agricola.'),
  ('CHASUBLE',  'Casula',   'Casula a Beata Virgine Sancto Ildephonso Toletano donata.'),
  ('BLESSED',   'Beatus',   'Ab Ecclesia beatificatus, canonizationem exspectans.')
) AS x(code, label, description) ON x.code = a.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- =====================================================
-- 5) SAINT_ATTRIBUTES
-- =====================================================

INSERT INTO saint_attributes (saint_id, attribute_id)
SELECT s.id, a.id
FROM (VALUES

  -- Eulogius of Córdoba – prêtre martyr (martyrs de Cordoue)
  ('saint-eulogius-of-cordoba',        'PALM'),
  ('saint-eulogius-of-cordoba',        'PRIEST'),
  ('saint-eulogius-of-cordoba',        'MARTYR'),

  -- Fructuosus, Augurius, Eulogius – martyrs de Tarragone (brûlés)
  ('saint-fructuosus',                 'MITRE'),
  ('saint-fructuosus',                 'FLAMES'),
  ('saint-fructuosus',                 'PALM'),
  ('saint-fructuosus',                 'BISHOP'),
  ('saint-fructuosus',                 'MARTYR'),
  ('saint-augurius',                   'FLAMES'),
  ('saint-augurius',                   'PALM'),
  ('saint-augurius',                   'DEACON'),
  ('saint-augurius',                   'MARTYR'),
  ('saint-eulogius',                   'FLAMES'),
  ('saint-eulogius',                   'PALM'),
  ('saint-eulogius',                   'DEACON'),
  ('saint-eulogius',                   'MARTYR'),

  -- Ildephonsus of Toledo – archevêque, chasuble de la Vierge
  ('saint-ildephonsus-of-toledo',      'CHASUBLE'),
  ('saint-ildephonsus-of-toledo',      'MITRE'),
  ('saint-ildephonsus-of-toledo',      'BOOK'),
  ('saint-ildephonsus-of-toledo',      'BISHOP'),

  -- Hermenegild – prince wisigoth martyr (hache)
  ('saint-hermenegild',                'CROWN'),
  ('saint-hermenegild',                'AXE'),
  ('saint-hermenegild',                'PALM'),
  ('saint-hermenegild',                'MARTYR'),

  -- Peter of Saint Joseph de Betancur – tertiaire franciscain, Guatemala
  ('saint-peter-of-saint-joseph-de-betancur', 'RELIGIOUS'),
  ('saint-peter-of-saint-joseph-de-betancur', 'FRANCISCAN'),

  -- Isidore the Farmer – laboureur, charrue
  ('saint-isidore-the-farmer',         'PLOUGH'),

  -- Paschal Baylon – franciscain, ostensoir
  ('saint-paschal-baylon',             'MONSTRANCE'),
  ('saint-paschal-baylon',             'RELIGIOUS'),
  ('saint-paschal-baylon',             'FRANCISCAN'),

  -- Joaquina Vedruna – fondatrice (Carmélites de la Charité)
  ('saint-joaquina-vedruna',           'RELIGIOUS'),
  ('saint-joaquina-vedruna',           'CARMELITE'),

  -- Ferdinand III – roi de Castille et León
  ('saint-ferdinand',                  'CROWN'),
  ('saint-ferdinand',                  'SWORD'),
  ('saint-ferdinand',                  'KING'),

  -- José de Anchieta – jésuite, apôtre du Brésil
  ('saint-jose-de-anchieta',           'PRIEST'),
  ('saint-jose-de-anchieta',           'JESUIT'),

  -- Maria Micaela – fondatrice des Adoratrices
  ('saint-maria-micaela-of-the-blessed-sacrament', 'MONSTRANCE'),
  ('saint-maria-micaela-of-the-blessed-sacrament', 'VIRGIN'),
  ('saint-maria-micaela-of-the-blessed-sacrament', 'RELIGIOUS'),

  -- Pelagius – jeune martyr de Cordoue
  ('saint-pelagius',                   'PALM'),
  ('saint-pelagius',                   'MARTYR'),

  -- Ezequiel Moreno – évêque augustin récollet
  ('saint-ezequiel-moreno',            'MITRE'),
  ('saint-ezequiel-moreno',            'BISHOP'),
  ('saint-ezequiel-moreno',            'AUGUSTINIAN'),

  -- Teresa Jornet – fondatrice (Petites Sœurs des vieillards abandonnés)
  ('saint-teresa-of-jesus-jornet-and-ibars', 'VIRGIN'),
  ('saint-teresa-of-jesus-jornet-and-ibars', 'RELIGIOUS'),

  -- Francis Borgia – jésuite, général de la Compagnie
  ('saint-francis-borgia',             'SKULL'),
  ('saint-francis-borgia',             'PRIEST'),
  ('saint-francis-borgia',             'JESUIT'),

  -- Thomas of Villanova – archevêque de Valence, aumônier des pauvres
  ('saint-thomas-of-villanova',        'MITRE'),
  ('saint-thomas-of-villanova',        'COINS'),
  ('saint-thomas-of-villanova',        'BISHOP'),
  ('saint-thomas-of-villanova',        'AUGUSTINIAN'),

  -- Soledad Torres Acosta – fondatrice des Servantes de Marie
  ('saint-soledad-torres-acosta',      'VIRGIN'),
  ('saint-soledad-torres-acosta',      'RELIGIOUS'),

  -- Peter of Alcántara – franciscain réformateur, pénitent
  ('saint-peter-of-alcantara',         'CROSS'),
  ('saint-peter-of-alcantara',         'PRIEST'),
  ('saint-peter-of-alcantara',         'FRANCISCAN'),

  -- Leander – archevêque de Séville
  ('saint-leander',                    'MITRE'),
  ('saint-leander',                    'PEN'),
  ('saint-leander',                    'BISHOP'),

  -- Eulalia of Mérida – vierge martyre
  ('saint-eulalia-of-merida',          'PALM'),
  ('saint-eulalia-of-merida',          'DOVE'),
  ('saint-eulalia-of-merida',          'VIRGIN'),
  ('saint-eulalia-of-merida',          'MARTYR')

) AS pairs(saint_slug, attr_code)
JOIN saints     s ON s.slug = pairs.saint_slug
JOIN attributes a ON a.code = pairs.attr_code
ON CONFLICT DO NOTHING;

COMMIT;
