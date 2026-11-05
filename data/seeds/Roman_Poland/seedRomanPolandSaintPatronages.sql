BEGIN;

-- =====================================================
-- SEED: PATRONAGES – Calendrier propre de Pologne
-- =====================================================
-- Run order: after seedRomanSaintPatronages.sql (General)
--            and seedRomanPolandSaints.sql
-- Réutilise les codes déjà seedés dans Roman_General ;
-- n'ajoute que les quelques patronages manquants.
-- Niveau : grandes lignes / patronages évidents.
-- source_type : OFF = officiel (Saint-Siège)
--               TRD = traditionnel
--               DEV = dévotion populaire
-- =====================================================


-- =====================================================
-- 1) NOUVEAUX PATRONAGES (absents du seed général)
-- =====================================================

INSERT INTO patronages (code) VALUES
('LITHUANIA'),
('SLOVAKIA'),
('POMERANIA'),
('KRAKOW'),
('WARSAW'),
('FIREFIGHTERS'),
('CHIMNEY_SWEEPS'),
('MINERS'),
('ARTILLERYMEN'),
('LEPERS'),
('HOMELESS'),
('RAILWAY_WORKERS'),
('AGAINST_FIRE'),
('AGAINST_SUDDEN_DEATH'),
('CONFESSORS_SEAL'),
('ALTAR_SERVERS')
ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRANSLATIONS – EN
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'en', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('LITHUANIA',            'Lithuania',              'Saint Casimir; also Saint Hedwig the Queen (Polish-Lithuanian union).'),
  ('SLOVAKIA',             'Slovakia',               'Saints Andrzej Świerad and Benedict, hermits of Nitra.'),
  ('POMERANIA',            'Pomerania',              'Saint Otto of Bamberg, apostle of the Pomeranians.'),
  ('KRAKOW',               'Kraków',                 'Saint Stanislaus; also Stanisław Kazimierczyk, Hyacinth, Simon of Lipnica.'),
  ('WARSAW',               'Warsaw',                 'Blessed Władysław of Gielniów; Saint Zygmunt Szczęsny Feliński, archbishop.'),
  ('FIREFIGHTERS',         'Firefighters',           'Saint Florian, invoked against fire.'),
  ('CHIMNEY_SWEEPS',       'Chimney sweeps',         'Saint Florian.'),
  ('MINERS',               'Miners',                 'Saint Barbara, protector against sudden death underground.'),
  ('ARTILLERYMEN',         'Artillerymen',           'Saint Barbara, patron of all who handle explosives.'),
  ('LEPERS',               'Lepers',                 'Blessed John Beyzym, apostle of the lepers of Madagascar.'),
  ('HOMELESS',             'Homeless',               'Saint Albert Chmielowski, founder of shelters for the poor of Kraków.'),
  ('RAILWAY_WORKERS',      'Railway workers',        'Saint Catherine of Alexandria; also Saint Rafał Kalinowski (engineer).'),
  ('AGAINST_FIRE',         'Against fire',           'Saint Florian, invoked for protection from fires.'),
  ('AGAINST_SUDDEN_DEATH', 'Against sudden death',   'Saint Barbara, invoked for a good and prepared death.'),
  ('CONFESSORS_SEAL',      'Seal of confession',     'Saint John Sarkander and Saint John Nepomucene, martyrs of the seal of confession.'),
  ('ALTAR_SERVERS',        'Altar servers',          'Saint Stanisław Kostka; also Saint Tarcisius and Saint Dominic Savio.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 3) TRANSLATIONS – FR
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'fr', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('LITHUANIA',            'Lituanie',                   'Saint Casimir ; aussi sainte Hedwige reine (union polono-lituanienne).'),
  ('SLOVAKIA',             'Slovaquie',                  'Saints André Świerad et Benoît, ermites de Nitra.'),
  ('POMERANIA',            'Poméranie',                  'Saint Otton de Bamberg, apôtre des Poméraniens.'),
  ('KRAKOW',               'Cracovie',                   'Saint Stanislas ; aussi Stanisław Kazimierczyk, Hyacinthe, Simon de Lipnica.'),
  ('WARSAW',               'Varsovie',                   'Bienheureux Ladislas de Gielniów ; saint Zygmunt Szczęsny Feliński, archevêque.'),
  ('FIREFIGHTERS',         'Pompiers',                   'Saint Florian, invoqué contre l''incendie.'),
  ('CHIMNEY_SWEEPS',       'Ramoneurs',                  'Saint Florian.'),
  ('MINERS',               'Mineurs',                    'Sainte Barbe, protectrice contre la mort subite au fond de la mine.'),
  ('ARTILLERYMEN',         'Artilleurs',                 'Sainte Barbe, patronne de ceux qui manient les explosifs.'),
  ('LEPERS',               'Lépreux',                    'Bienheureux Jean Beyzym, apôtre des lépreux de Madagascar.'),
  ('HOMELESS',             'Sans-abri',                  'Saint Albert Chmielowski, fondateur d''asiles pour les pauvres de Cracovie.'),
  ('RAILWAY_WORKERS',      'Cheminots',                  'Sainte Catherine d''Alexandrie ; aussi saint Raphaël Kalinowski (ingénieur).'),
  ('AGAINST_FIRE',         'Contre l''incendie',         'Saint Florian, invoqué pour la protection contre le feu.'),
  ('AGAINST_SUDDEN_DEATH', 'Contre la mort subite',      'Sainte Barbe, invoquée pour une mort bien préparée.'),
  ('CONFESSORS_SEAL',      'Secret de la confession',    'Saint Jean Sarkander et saint Jean Népomucène, martyrs du secret de la confession.'),
  ('ALTAR_SERVERS',        'Servants d''autel',          'Saint Stanislas Kostka ; aussi saint Tarcisius et saint Dominique Savio.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 4) TRANSLATIONS – LA
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'la', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('LITHUANIA',            'Lituania',                   'Sanctus Casimirus; etiam Sancta Hedvigis Regina.'),
  ('SLOVAKIA',             'Slovacia',                   'Sancti Andreas Svierad et Benedictus, eremitae Nitrienses.'),
  ('POMERANIA',            'Pomerania',                  'Sanctus Otto Bambergensis, apostolus Pomeranorum.'),
  ('KRAKOW',               'Cracovia',                   'Sanctus Stanislaus; etiam Stanislaus Kazimierczyk, Hyacinthus, Simon de Lipnica.'),
  ('WARSAW',               'Varsavia',                   'Beatus Ladislaus de Gielniów; Sanctus Sigismundus Felix Feliński, archiepiscopus.'),
  ('FIREFIGHTERS',         'Vigiles ignis',              'Sanctus Florianus, contra incendium invocatus.'),
  ('CHIMNEY_SWEEPS',       'Caminorum purgatores',       'Sanctus Florianus.'),
  ('MINERS',               'Fossores',                   'Sancta Barbara, contra mortem repentinam sub terra.'),
  ('ARTILLERYMEN',         'Tormentarii',                'Sancta Barbara, patrona eorum qui pulverem pyrium tractant.'),
  ('LEPERS',               'Leprosi',                    'Beatus Ioannes Beyzym, apostolus leprosorum Madagascariae.'),
  ('HOMELESS',             'Sine tecto',                 'Sanctus Albertus Chmielowski, fundator hospitiorum pauperum Cracoviae.'),
  ('RAILWAY_WORKERS',      'Ferriviarii',                'Sancta Catharina Alexandrina; etiam Sanctus Raphael Kalinowski.'),
  ('AGAINST_FIRE',         'Contra incendium',           'Sanctus Florianus, ad tutelam contra ignem invocatus.'),
  ('AGAINST_SUDDEN_DEATH', 'Contra mortem repentinam',   'Sancta Barbara, pro bona et parata morte invocata.'),
  ('CONFESSORS_SEAL',      'Sigillum confessionis',      'Sanctus Ioannes Sarkander et Sanctus Ioannes Nepomucenus, martyres sigilli sacramentalis.'),
  ('ALTAR_SERVERS',        'Ministrantes',               'Sanctus Stanislaus Kostka; etiam Sanctus Tarcisius et Sanctus Dominicus Savio.')
) AS x(code, label, description) ON x.code = p.code
ON CONFLICT (patronage_id, locale_code) DO NOTHING;


-- =====================================================
-- 5) SAINT_PATRONAGES
-- =====================================================

INSERT INTO saint_patronages (saint_id, patronage_id, source_type)
SELECT s.id, p.id, pairs.source_type
FROM (VALUES

  -- Florian – soldat martyr, feu
  ('saint-florian',                     'POLAND',               'TRD'),  -- co-patron de la Pologne (reliques à Cracovie, 1184)
  ('saint-florian',                     'FIREFIGHTERS',         'TRD'),
  ('saint-florian',                     'CHIMNEY_SWEEPS',       'TRD'),
  ('saint-florian',                     'AGAINST_FIRE',         'TRD'),
  ('saint-florian',                     'SOLDIERS',             'TRD'),

  -- Stanisław Kazimierczyk – Cracovie (Kazimierz)
  ('saint-stanislaw-kazimierczyk',      'KRAKOW',               'TRD'),

  -- Andrew Bobola – patron de la Pologne (Pie XII, 1938 ; confirmé 2002)
  ('saint-andrew-bobola',               'POLAND',               'OFF'),

  -- Ursula Ledóchowska – éducatrice
  ('saint-ursula-ledochowska',          'TEACHERS',             'TRD'),
  ('saint-ursula-ledochowska',          'CHILDREN',             'TRD'),

  -- John Sarkander – secret de la confession
  ('saint-john-sarkander',              'CONFESSORS_SEAL',      'TRD'),
  ('saint-john-sarkander',              'CZECH_REPUBLIC',       'TRD'),  -- patron de la Moravie

  -- Zdzisława – mère de famille
  ('saint-zdzislawa',                   'FAMILIES',             'TRD'),
  ('saint-zdzislawa',                   'MOTHERS',              'TRD'),
  ('saint-zdzislawa',                   'CZECH_REPUBLIC',       'TRD'),

  -- Hedwig the Queen (Jadwiga) – reine de Pologne
  ('saint-hedwig-the-queen',            'POLAND',               'TRD'),
  ('saint-hedwig-the-queen',            'LITHUANIA',            'TRD'),

  -- Albert Chmielowski – pauvres, sans-abri, artistes
  ('saint-albert-chmielowski',          'POOR',                 'TRD'),
  ('saint-albert-chmielowski',          'HOMELESS',             'TRD'),
  ('saint-albert-chmielowski',          'PAINTERS_ARTISTS',     'TRD'),

  -- Zygmunt Gorazdowski – œuvres de charité (Lwów)
  ('saint-zygmunt-gorazdowski',         'POOR',                 'TRD'),
  ('saint-zygmunt-gorazdowski',         'CHARITY_WORKS',        'TRD'),

  -- Otto of Bamberg – Poméranie
  ('saint-otto-of-bamberg',             'POMERANIA',            'TRD'),
  ('saint-otto-of-bamberg',             'MISSIONARIES',         'TRD'),

  -- Maria Teresia Ledóchowska – missions d'Afrique (Sodalité de Saint-Pierre Claver)
  ('blessed-maria-teresia-ledochowska', 'MISSIONS',             'TRD'),
  ('blessed-maria-teresia-ledochowska', 'AFRICA_SUBSAHARAN',    'DEV'),

  -- John of Dukla – Pologne & Lituanie (patron proclamé 1739)
  ('saint-john-of-dukla',               'POLAND',               'TRD'),
  ('saint-john-of-dukla',               'LITHUANIA',            'TRD'),

  -- Bruno of Querfurt – missionnaire
  ('saint-bruno-boniface-of-querfurt',  'MISSIONARIES',         'TRD'),

  -- Andrzej Świerad & Benedict – Slovaquie (Nitra)
  ('saint-andrzej-swierad',             'SLOVAKIA',             'TRD'),
  ('saint-benedict-the-hermit',         'SLOVAKIA',             'TRD'),

  -- Simon of Lipnica – Cracovie
  ('saint-simon-of-lipnica',            'KRAKOW',               'TRD'),

  -- Czesław – Wrocław / Silésie
  ('blessed-czeslaw',                   'POLAND',               'DEV'),

  -- Kinga – Pologne & Lituanie (Clément XI, 1715)
  ('saint-kinga',                       'POLAND',               'OFF'),
  ('saint-kinga',                       'LITHUANIA',            'OFF'),
  ('saint-kinga',                       'MINERS',               'TRD'),  -- légende de la mine de sel de Wieliczka

  -- Hyacinth – Pologne, Cracovie
  ('saint-hyacinth',                    'POLAND',               'TRD'),
  ('saint-hyacinth',                    'KRAKOW',               'TRD'),

  -- Melchior Grodziecki – Slovaquie (martyr de Košice)
  ('saint-melchior-grodziecki',         'SLOVAKIA',             'TRD'),

  -- Zygmunt Szczęsny Feliński – Varsovie
  ('saint-zygmunt-szczesny-felinski',   'WARSAW',               'TRD'),

  -- Stanisław Kostka – jeunesse polonaise, servants d'autel
  ('saint-stanislaw-kostka',            'POLAND',               'OFF'),  -- patron de la Pologne, Clément X (1674)
  ('saint-stanislaw-kostka',            'YOUTH',                'TRD'),
  ('saint-stanislaw-kostka',            'STUDENTS',             'TRD'),
  ('saint-stanislaw-kostka',            'ALTAR_SERVERS',        'TRD'),
  ('saint-stanislaw-kostka',            'SEMINARIANS',          'TRD'),

  -- John Beyzym – lépreux
  ('blessed-john-beyzym',               'LEPERS',               'TRD'),
  ('blessed-john-beyzym',               'MISSIONARIES',         'TRD'),

  -- Hedwig of Poland (Jadwiga) – reine
  ('saint-hedwig-of-poland',            'POLAND',               'TRD'),

  -- Karolina Kózkówna – jeunesse, victimes d'abus
  ('blessed-karolina-kozkowna',         'YOUTH',                'TRD'),
  ('blessed-karolina-kozkowna',         'ABUSE_VICTIMS',        'TRD'),

  -- Rafał Kalinowski – ingénieur, exilé en Sibérie
  ('saint-rafal-kalinowski',            'RAILWAY_WORKERS',      'DEV'),
  ('saint-rafal-kalinowski',            'PRISONERS',            'TRD'),  -- 10 ans de bagne en Sibérie

  -- Barbara – mineurs, artilleurs, mort subite
  ('saint-barbara',                     'MINERS',               'TRD'),
  ('saint-barbara',                     'ARTILLERYMEN',         'TRD'),
  ('saint-barbara',                     'AGAINST_SUDDEN_DEATH', 'TRD'),
  ('saint-barbara',                     'GOOD_DEATH',           'TRD'),
  ('saint-barbara',                     'ARCHITECTS',           'TRD')

) AS pairs(saint_slug, patronage_code, source_type)
JOIN saints     s ON s.slug  = pairs.saint_slug
JOIN patronages p ON p.code  = pairs.patronage_code
ON CONFLICT (saint_id, patronage_id) DO UPDATE SET source_type = EXCLUDED.source_type;

COMMIT;
