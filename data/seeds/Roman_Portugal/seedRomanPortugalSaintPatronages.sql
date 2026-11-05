BEGIN;

-- =====================================================
-- SEED: PATRONAGES – Calendrier propre du Portugal
-- =====================================================
-- Run order: after seedRomanSaintPatronages.sql (General)
--            and seedRomanPortugalSaints.sql
-- Réutilise les codes déjà seedés dans Roman_General ;
-- n'ajoute que les quelques patronages manquants.
-- Niveau : grandes lignes / patronages évidents.
-- source_type : OFF = officiel · TRD = traditionnel · DEV = dévotion
-- =====================================================


-- =====================================================
-- 1) NOUVEAUX PATRONAGES (absents du seed général)
-- =====================================================

INSERT INTO patronages (code) VALUES
('BRAZIL'),
('BRAGA'),
('COIMBRA'),
('LISBON'),
('AMARANTE'),
('LAGOS'),
('ENGINEERS'),
('AGAINST_TUBERCULOSIS')
ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRANSLATIONS – EN
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'en', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('BRAZIL',                'Brazil',                 'Our Lady of Aparecida; Saint José de Anchieta, apostle of Brazil.'),
  ('BRAGA',                 'Braga',                  'Saints Martin of Dume and Gerald; Blessed Bartholomew of the Martyrs.'),
  ('COIMBRA',               'Coimbra',                'Saint Theotonius, prior of Santa Cruz; Queen Saint Elizabeth.'),
  ('LISBON',                'Lisbon',                 'Saint Vincent, deacon and martyr; Saint Anthony of Padua.'),
  ('AMARANTE',              'Amarante',               'Blessed Gonçalo de Amarante.'),
  ('LAGOS',                 'Lagos',                  'Blessed Gonçalo de Lagos.'),
  ('ENGINEERS',             'Engineers',              'Blessed Gonçalo de Amarante, bridge builder; Saint Patrick.'),
  ('AGAINST_TUBERCULOSIS',  'Against tuberculosis',   'Saint Thérèse of Lisieux; Saints Jacinta and Francisco Marto.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) TRANSLATIONS – FR
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'fr', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('BRAZIL',                'Brésil',                    'Notre-Dame d''Aparecida ; saint José de Anchieta, apôtre du Brésil.'),
  ('BRAGA',                 'Braga',                     'Saints Martin de Dume et Gérald ; bienheureux Barthélemy des Martyrs.'),
  ('COIMBRA',               'Coimbra',                   'Saint Théotonius, prieur de Santa Cruz ; sainte Élisabeth reine.'),
  ('LISBON',                'Lisbonne',                  'Saint Vincent, diacre et martyr ; saint Antoine de Padoue.'),
  ('AMARANTE',              'Amarante',                  'Bienheureux Gonçalo d''Amarante.'),
  ('LAGOS',                 'Lagos',                     'Bienheureux Gonçalo de Lagos.'),
  ('ENGINEERS',             'Ingénieurs',                'Bienheureux Gonçalo d''Amarante, bâtisseur de pont ; saint Patrick.'),
  ('AGAINST_TUBERCULOSIS',  'Contre la tuberculose',     'Sainte Thérèse de Lisieux ; saints Jacinta et Francisco Marto.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 4) TRANSLATIONS – LA
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'la', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('BRAZIL',                'Brasilia',                  'Beata Maria Virgo de Aparecida; Sanctus Iosephus de Anchieta.'),
  ('BRAGA',                 'Bracara',                   'Sancti Martinus Dumiensis et Geraldus; Beatus Bartholomaeus a Martyribus.'),
  ('COIMBRA',               'Conimbrica',                'Sanctus Theotonius, prior Sanctae Crucis; Sancta Elisabeth regina.'),
  ('LISBON',                'Olisipo',                   'Sanctus Vincentius, diaconus et martyr; Sanctus Antonius Patavinus.'),
  ('AMARANTE',              'Amarantum',                 'Beatus Gundisalvus de Amarante.'),
  ('LAGOS',                 'Lacobriga',                 'Beatus Gundisalvus de Lagos.'),
  ('ENGINEERS',             'Ingeniarii',                'Beatus Gundisalvus de Amarante, pontis aedificator; Sanctus Patricius.'),
  ('AGAINST_TUBERCULOSIS',  'Contra tuberculosim',       'Sancta Teresia a Iesu Infante; Sancti Hyacintha et Franciscus Marto.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 5) SAINT_PATRONAGES
-- =====================================================

INSERT INTO saint_patronages (saint_id, patronage_id, source_type)
SELECT s.id, p.id, pairs.source_type
FROM (VALUES

  -- Gonçalo de Amarante – Amarante, bâtisseur de pont
  ('blessed-goncalo-de-amarante',        'AMARANTE',              'TRD'),
  ('blessed-goncalo-de-amarante',        'ENGINEERS',             'DEV'),
  ('blessed-goncalo-de-amarante',        'MARRIED_COUPLES',       'DEV'),  -- invoqué par les célibataires cherchant à se marier

  -- John de Brito – missions, Inde
  ('saint-john-de-brito',                'INDIA',                 'TRD'),
  ('saint-john-de-brito',                'MISSIONARIES',          'TRD'),

  -- Theotonius – Coimbra
  ('saint-theotonius',                   'COIMBRA',               'TRD'),

  -- Jacinta & Francisco Marto – enfants, malades (tuberculose / grippe espagnole)
  ('saint-jacinta-marto',                'CHILDREN',              'TRD'),
  ('saint-jacinta-marto',                'SICK',                  'DEV'),
  ('saint-jacinta-marto',                'AGAINST_TUBERCULOSIS',  'DEV'),
  ('saint-francisco-marto',              'CHILDREN',              'TRD'),
  ('saint-francisco-marto',              'SICK',                  'DEV'),

  -- Inácio de Azevedo – missions, Brésil
  ('blessed-inacio-de-azevedo',          'BRAZIL',                'TRD'),
  ('blessed-inacio-de-azevedo',          'MISSIONARIES',          'TRD'),

  -- Bartholomew of the Martyrs – Braga
  ('blessed-bartholomew-of-the-martyrs', 'BRAGA',                 'TRD'),
  ('blessed-bartholomew-of-the-martyrs', 'CLERGY',                'DEV'),  -- Stimulus pastorum, modèle des évêques

  -- Gonçalo de Lagos – Lagos, pêcheurs de l'Algarve
  ('blessed-goncalo-de-lagos',           'LAGOS',                 'TRD'),
  ('blessed-goncalo-de-lagos',           'FISHERMEN',             'TRD'),

  -- Nuno of Saint Mary – Portugal, soldats
  ('saint-nuno-of-saint-mary',           'PORTUGAL',              'TRD'),
  ('saint-nuno-of-saint-mary',           'SOLDIERS',              'TRD'),

  -- Martin of Dume & Gerald – Braga
  ('saint-martin-of-dume',               'BRAGA',                 'TRD'),
  ('saint-gerald-of-braga',              'BRAGA',                 'TRD')

) AS pairs(saint_slug, patronage_code, source_type)
JOIN saints     s ON s.slug  = pairs.saint_slug
JOIN patronages p ON p.code  = pairs.patronage_code
ON CONFLICT (saint_id, patronage_id) DO UPDATE SET source_type = EXCLUDED.source_type;

COMMIT;
