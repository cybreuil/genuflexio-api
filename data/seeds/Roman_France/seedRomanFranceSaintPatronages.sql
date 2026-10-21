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

INSERT INTO patronage_translations
    (patronage_id, locale_code, label, description)
SELECT p.id, x.locale_code, x.label, x.description
FROM patronages p
JOIN (VALUES
  ('FRANCE',      'en', 'France',
   'Patronage associated with the French nation, its people, and its spiritual heritage.'),

  ('LOURDES',     'en', 'Lourdes',
   'French pilgrimage town renowned for the Marian apparitions reported by Saint Bernadette Soubirous in 1858.'),

  ('LYON',        'en', 'Lyon',
   'Historic French city and major center of early Christianity in Gaul, associated with the martyrs Saint Blandina and Saint Pothinus.'),

  ('ARLES',       'en', 'Arles',
   'Historic city in Provence associated with Saint Caesarius, bishop of Arles in the sixth century.'),

  ('ALAT',        'en', 'French Army Light Aviation (ALAT)',
   'French Army aviation branch responsible for helicopter operations in support of land forces.'),

  ('PARIS',       'en', 'Paris',
   'French capital placed under the spiritual protection of Saint Genevieve, traditionally credited with protecting the city during times of danger.'),

  ('NANTERRE',    'en', 'Nanterre',
   'Town near Paris traditionally associated with the birthplace of Saint Genevieve.'),

  ('GENDARMERIE', 'en', 'French National Gendarmerie',
   'French military-status national law enforcement force responsible for public security, policing, and the protection of people and property.'),

  ('LAWYERS',     'en', 'Lawyers',
   'Legal professionals whose patron saint is Saint Yves of Kermartin, renowned for his integrity and defense of the poor.'),

  ('BRITTANY',    'en', 'Brittany',
   'French historical region strongly associated with Saint Yves of Kermartin, a major Breton patron saint.'),

  ('REIMS',       'en', 'Reims',
   'Historic French city associated with Saint Remigius, bishop of Reims, who traditionally baptized King Clovis I.')
) AS x(code, locale_code, label, description)
  ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;
INSERT INTO patronage_translations
    (patronage_id, locale_code, label, description)
SELECT p.id, x.locale_code, x.label, x.description
FROM patronages p
JOIN (VALUES
  ('FRANCE',      'fr', 'France',
   'Patronage associé à la nation française, à son peuple et à son héritage spirituel.'),

  ('LOURDES',     'fr', 'Lourdes',
   'Ville de pèlerinage française renommée pour les apparitions mariales rapportées par sainte Bernadette Soubirous en 1858.'),

  ('LYON',        'fr', 'Lyon',
   'Ville historique française et grand centre du christianisme primitif en Gaule, associée aux martyrs sainte Blandine et saint Pothin.'),

  ('ARLES',       'fr', 'Arles',
   'Ville historique de Provence associée à saint Césaire, évêque d’Arles au VIe siècle.'),

  ('ALAT',        'fr', 'Aviation légère de l’armée de Terre (ALAT)',
   'Branche de l’armée de Terre française chargée des opérations héliportées en soutien des forces terrestres.'),

  ('PARIS',       'fr', 'Paris',
   'Capitale française placée sous la protection spirituelle de sainte Geneviève, traditionnellement reconnue pour avoir protégé la ville dans les périodes de danger.'),

  ('NANTERRE',    'fr', 'Nanterre',
   'Ville proche de Paris traditionnellement associée au lieu de naissance de sainte Geneviève.'),

  ('GENDARMERIE', 'fr', 'Gendarmerie nationale',
   'Force de sécurité intérieure française à statut militaire, chargée de la sécurité publique, de la police et de la protection des personnes et des biens.'),

  ('LAWYERS',     'fr', 'Avocats',
   'Professionnels du droit qui conseillent et représentent leurs clients, défendent leurs droits et contribuent à l’administration de la justice. Saint Yves de Kermartin est reconnu comme leur saint patron.'),

  ('BRITTANY',    'fr', 'Bretagne',
   'Région historique française du nord-ouest du pays, fortement associée à saint Yves de Kermartin, figure majeure de la sainteté bretonne.'),

  ('REIMS',       'fr', 'Reims',
   'Ville historique du nord-est de la France associée à saint Rémi, évêque de Reims, qui baptisa traditionnellement le roi Clovis Ier.')
) AS x(code, locale_code, label, description)
  ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;
INSERT INTO patronage_translations
    (patronage_id, locale_code, label, description)
SELECT p.id, x.locale_code, x.label, x.description
FROM patronages p
JOIN (VALUES
  ('FRANCE',      'la', 'Francia',
   'Patrocinium cum natione Francica, populo eius atque hereditate spirituali coniunctum.'),

  ('LOURDES',     'la', 'Lurdum',
   'Oppidum Francicum peregrinationum, apparitionibus marialibus Sanctae Bernadettae Soubirous anno 1858 relatis celebre.'),

  ('LYON',        'la', 'Lugdunum',
   'Urbs historica Francica et praecipuum centrum christianitatis primaevae in Gallia, cum martyribus Sancta Blandina et Sancto Pothino coniunctum.'),

  ('ARLES',       'la', 'Arelate',
   'Urbs historica Provinciae cum Sancto Caesario, episcopo Arelatensi saeculi sexti, coniuncta.'),

  ('ALAT',        'la', 'Aviatio levis Exercitus terrestris Francici (ALAT)',
   'Pars Exercitus terrestris Francici quae operationibus helicopterorum in auxilium copiarum terrestrium fungitur.'),

  ('PARIS',       'la', 'Lutetia Parisiorum',
   'Caput Franciae sub spirituali tutela Sanctae Genovefae positum, quae traditione urbi temporibus periculi praesidium tulisse creditur.'),

  ('NANTERRE',    'la', 'Nemptodurum',
   'Oppidum prope Lutetiam Parisiorum, traditione loco natalium Sanctae Genovefae coniunctum.'),

  ('GENDARMERIE', 'la', 'Gendarmeria Nationalis Francica',
   'Vis securitatis publicae Francica statum militarem habens, securitati publicae, custodiae legum et protectioni personarum atque bonorum dedita.'),

  ('LAWYERS',     'la', 'Advocati',
   'Iuris periti qui clientes consulunt et repraesentant, iura eorum defendunt atque iustitiae administrationi serviunt. Sanctus Ivo Kermartinensis eorum patronus agnoscitur.'),

  ('BRITTANY',    'la', 'Britannia Armorica',
   'Regio historica Franciae occidentalis, cum Sancto Ivone Kermartinensi, praecipuo sancto patrono Britanniae Armoricae, arcte coniuncta.'),

  ('REIMS',       'la', 'Durocortorum Remorum',
   'Urbs historica Franciae septentrionalis-orientalis cum Sancto Remigio, episcopo Remensi, qui secundum traditionem Clodoveum regem baptizavit, coniuncta.')
) AS x(code, locale_code, label, description)
  ON p.code = x.code
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
  ('saint-bernadette-soubirous', 'SICK',    	'TRD'),

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
