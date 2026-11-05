BEGIN;

-- =====================================================
-- SEED: PATRONAGES – Calendrier propre d'Espagne
-- =====================================================
-- Run order: after seedRomanSaintPatronages.sql (General)
--            and seedRomanSpainSaints.sql
-- Réutilise les codes déjà seedés dans Roman_General ;
-- n'ajoute que les quelques patronages manquants.
-- Niveau : grandes lignes / patronages évidents.
-- source_type : OFF = officiel · TRD = traditionnel · DEV = dévotion
-- =====================================================


-- =====================================================
-- 1) NOUVEAUX PATRONAGES (absents du seed général)
-- =====================================================

INSERT INTO patronages (code) VALUES
('MADRID'),
('SEVILLE'),
('TOLEDO'),
('VALENCIA'),
('CATALONIA'),
('BARCELONA'),
('TARRAGONA'),
('CORDOBA'),
('BRAZIL'),
('GUATEMALA'),
('EUCHARISTIC_CONGRESSES'),
('CONVERTED_RULERS')
ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRANSLATIONS – EN
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'en', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('MADRID',                 'Madrid',                   'Saint Isidore the Farmer, patron of the city of Madrid.'),
  ('SEVILLE',                'Seville',                  'Saints Leander and Isidore; Saint Ferdinand III, king.'),
  ('TOLEDO',                 'Toledo',                   'Saint Ildephonsus, archbishop of Toledo.'),
  ('VALENCIA',               'Valencia',                 'Saint Thomas of Villanova, archbishop; Saint Vincent Ferrer.'),
  ('CATALONIA',              'Catalonia',                'Saint George; Saint Eulalia of Barcelona.'),
  ('BARCELONA',              'Barcelona',                'Saint Eulalia, virgin and martyr.'),
  ('TARRAGONA',              'Tarragona',                'Saints Fructuosus, Augurius and Eulogius, martyrs (259).'),
  ('CORDOBA',                'Córdoba',                  'Saints Eulogius and Pelagius, martyrs of Córdoba.'),
  ('BRAZIL',                 'Brazil',                   'Our Lady of Aparecida; Saint José de Anchieta, apostle of Brazil.'),
  ('GUATEMALA',              'Guatemala',                'Saint Peter of Saint Joseph de Betancur, first saint of Central America.'),
  ('EUCHARISTIC_CONGRESSES', 'Eucharistic congresses',   'Saint Paschal Baylon (Leo XIII, 1897).'),
  ('CONVERTED_RULERS',       'Converts among rulers',    'Saint Hermenegild, Visigothic prince converted from Arianism.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) TRANSLATIONS – FR
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'fr', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('MADRID',                 'Madrid',                      'Saint Isidore le Laboureur, patron de la ville de Madrid.'),
  ('SEVILLE',                'Séville',                     'Saints Léandre et Isidore ; saint Ferdinand III, roi.'),
  ('TOLEDO',                 'Tolède',                      'Saint Ildefonse, archevêque de Tolède.'),
  ('VALENCIA',               'Valence',                     'Saint Thomas de Villeneuve, archevêque ; saint Vincent Ferrier.'),
  ('CATALONIA',              'Catalogne',                   'Saint Georges ; sainte Eulalie de Barcelone.'),
  ('BARCELONA',              'Barcelone',                   'Sainte Eulalie, vierge et martyre.'),
  ('TARRAGONA',              'Tarragone',                   'Saints Fructueux, Augure et Euloge, martyrs (259).'),
  ('CORDOBA',                'Cordoue',                     'Saints Euloge et Pélage, martyrs de Cordoue.'),
  ('BRAZIL',                 'Brésil',                      'Notre-Dame d''Aparecida ; saint José de Anchieta, apôtre du Brésil.'),
  ('GUATEMALA',              'Guatemala',                   'Saint Pierre de Saint-Joseph Betancur, premier saint d''Amérique centrale.'),
  ('EUCHARISTIC_CONGRESSES', 'Congrès eucharistiques',      'Saint Pascal Baylon (Léon XIII, 1897).'),
  ('CONVERTED_RULERS',       'Souverains convertis',        'Saint Herménégilde, prince wisigoth converti de l''arianisme.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 4) TRANSLATIONS – LA
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'la', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('MADRID',                 'Matritum',                    'Sanctus Isidorus Agricola, patronus urbis Matritensis.'),
  ('SEVILLE',                'Hispalis',                    'Sancti Leander et Isidorus; Sanctus Ferdinandus III, rex.'),
  ('TOLEDO',                 'Toletum',                     'Sanctus Ildephonsus, archiepiscopus Toletanus.'),
  ('VALENCIA',               'Valentia',                    'Sanctus Thomas a Villanova, archiepiscopus; Sanctus Vincentius Ferrerius.'),
  ('CATALONIA',              'Catalaunia',                  'Sanctus Georgius; Sancta Eulalia Barcinonensis.'),
  ('BARCELONA',              'Barcino',                     'Sancta Eulalia, virgo et martyr.'),
  ('TARRAGONA',              'Tarraco',                     'Sancti Fructuosus, Augurius et Eulogius, martyres (259).'),
  ('CORDOBA',                'Corduba',                     'Sancti Eulogius et Pelagius, martyres Cordubenses.'),
  ('BRAZIL',                 'Brasilia',                    'Beata Maria Virgo de Aparecida; Sanctus Iosephus de Anchieta.'),
  ('GUATEMALA',              'Guatimala',                   'Sanctus Petrus a Sancto Ioseph Betancur, primus sanctus Americae Centralis.'),
  ('EUCHARISTIC_CONGRESSES', 'Conventus eucharistici',      'Sanctus Paschalis Baylon (Leo XIII, 1897).'),
  ('CONVERTED_RULERS',       'Principes conversi',          'Sanctus Hermenegildus, princeps Visigothorum ab arianismo conversus.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 5) SAINT_PATRONAGES
-- =====================================================

INSERT INTO saint_patronages (saint_id, patronage_id, source_type)
SELECT s.id, p.id, pairs.source_type
FROM (VALUES

  -- Martyrs de Cordoue
  ('saint-eulogius-of-cordoba',        'CORDOBA',                'TRD'),
  ('saint-pelagius',                   'CORDOBA',                'TRD'),
  ('saint-pelagius',                   'YOUTH',                  'TRD'),

  -- Martyrs de Tarragone
  ('saint-fructuosus',                 'TARRAGONA',              'TRD'),
  ('saint-augurius',                   'TARRAGONA',              'TRD'),
  ('saint-eulogius',                   'TARRAGONA',              'TRD'),

  -- Ildephonsus – Tolède
  ('saint-ildephonsus-of-toledo',      'TOLEDO',                 'TRD'),
  ('saint-ildephonsus-of-toledo',      'THEOLOGIANS',            'DEV'),

  -- Hermenegild – souverains convertis, Séville
  ('saint-hermenegild',                'CONVERTED_RULERS',       'TRD'),
  ('saint-hermenegild',                'SEVILLE',                'DEV'),

  -- Peter de Betancur – Guatemala, pauvres
  ('saint-peter-of-saint-joseph-de-betancur', 'GUATEMALA',       'TRD'),
  ('saint-peter-of-saint-joseph-de-betancur', 'POOR',            'TRD'),
  ('saint-peter-of-saint-joseph-de-betancur', 'SICK',            'TRD'),

  -- Isidore the Farmer – Madrid, agriculteurs
  ('saint-isidore-the-farmer',         'MADRID',                 'TRD'),
  ('saint-isidore-the-farmer',         'FARMERS_GARDENERS',      'TRD'),

  -- Paschal Baylon – congrès eucharistiques (Léon XIII, 1897), cuisiniers
  ('saint-paschal-baylon',             'EUCHARISTIC_CONGRESSES', 'OFF'),
  ('saint-paschal-baylon',             'COOKS',                  'TRD'),

  -- Joaquina Vedruna – enseignantes, malades
  ('saint-joaquina-vedruna',           'TEACHERS',               'DEV'),
  ('saint-joaquina-vedruna',           'SICK',                   'DEV'),

  -- Ferdinand III – Séville, souverains
  ('saint-ferdinand',                  'SEVILLE',                'TRD'),
  ('saint-ferdinand',                  'POLITICIANS',            'DEV'),

  -- José de Anchieta – Brésil
  ('saint-jose-de-anchieta',           'BRAZIL',                 'TRD'),
  ('saint-jose-de-anchieta',           'MISSIONARIES',           'TRD'),

  -- Teresa Jornet – personnes âgées (Jean-Paul II)
  ('saint-teresa-of-jesus-jornet-and-ibars', 'ELDERLY',          'OFF'),

  -- Francis Borgia – proclamé patron du Portugal (Jean V, 1756)
  ('saint-francis-borgia',             'PORTUGAL',               'TRD'),

  -- Thomas of Villanova – Valence, pauvres
  ('saint-thomas-of-villanova',        'VALENCIA',               'TRD'),
  ('saint-thomas-of-villanova',        'POOR',                   'TRD'),

  -- Soledad Torres Acosta – malades, soignants
  ('saint-soledad-torres-acosta',      'SICK',                   'TRD'),
  ('saint-soledad-torres-acosta',      'NURSES_CAREGIVERS',      'TRD'),

  -- Peter of Alcántara – Brésil (co-patron, 1826), veilleurs de nuit (trad.)
  ('saint-peter-of-alcantara',         'BRAZIL',                 'OFF'),

  -- Leander – Séville
  ('saint-leander',                    'SEVILLE',                'TRD'),

  -- Eulalia – Mérida ; la patronne de Barcelone est traditionnellement identifiée à elle
  ('saint-eulalia-of-merida',          'BARCELONA',              'TRD'),
  ('saint-eulalia-of-merida',          'SAILORS',                'DEV')

) AS pairs(saint_slug, patronage_code, source_type)
JOIN saints     s ON s.slug  = pairs.saint_slug
JOIN patronages p ON p.code  = pairs.patronage_code
ON CONFLICT (saint_id, patronage_id) DO UPDATE SET source_type = EXCLUDED.source_type;

COMMIT;
