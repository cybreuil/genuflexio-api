BEGIN;


-- ============================================================
-- 1. NOUVEAUX ATTRIBUTS
-- Les codes déjà présents dans ta table ne sont pas recréés.
-- ============================================================

INSERT INTO attributes (code, category) VALUES
    -- Iconographie de sainte Blandine
    ('BULL',                 'symbol'),
    ('BEAR',                 'symbol'),
    ('NET',                  'symbol'),
    ('STAKE',                'symbol'),

    -- Iconographie de sainte Geneviève
    ('MEDALLION',            'symbol'),
    ('DISTAFF',              'symbol'),
    ('SPINDLE',              'symbol'),
    ('SHEEP',                'symbol'),

    -- Iconographie de saint Yves
    ('PURSE',                'symbol'),
    ('DOCUMENT',             'symbol'),
    ('SCALES',               'symbol'),

    -- Iconographie de Jeanne d'Arc
    ('BANNER',               'symbol'),
    ('ARMOR',                'symbol'),

    -- Iconographie de saint Rémi et de saint Césaire
    ('HOLY_AMPULLA',         'symbol'),
    ('PALLIUM',              'symbol'),

    -- Famille religieuse de sainte Bernadette
    ('SISTERS_OF_CHARITY_OF_NEVERS', 'order')

ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- 2. TRADUCTIONS DES ATTRIBUTS
-- ============================================================

-- English translations
INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'en', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BULL', 'Bull', 'Animal associated with Saint Blandina’s martyrdom in the arena at Lyon.'),
  ('BEAR', 'Bear', 'Arena animal associated with the tortures of Christian martyrs.'),
  ('NET', 'Net', 'Iconographic attribute evoking the tortures inflicted on martyrs in the arena.'),
  ('STAKE', 'Stake', 'Stake evoking the tortures endured by certain martyrs.'),
  ('MEDALLION', 'Medallion', 'Iconographic attribute associated with Saint Genevieve.'),
  ('DISTAFF', 'Distaff', 'Textile tool evoking daily life and traditional depictions of Saint Genevieve.'),
  ('SPINDLE', 'Spindle', 'Spinning tool associated with traditional depictions of Saint Genevieve.'),
  ('SHEEP', 'Sheep', 'Animal evoking pastoral life and iconographic traditions associated with Saint Genevieve.'),
  ('PURSE', 'Purse', 'Symbol of charity and the defense of the poor, associated with Saint Yves.'),
  ('DOCUMENT', 'Legal document', 'Attribute evoking Saint Yves’s judicial work and defense of litigants.'),
  ('SCALES', 'Scales of justice', 'Symbol of justice and fairness associated with Saint Yves, patron saint of lawyers.'),
  ('BANNER', 'Banner', 'Banner associated with Saint Joan of Arc and her military mission.'),
  ('ARMOR', 'Armor', 'Military equipment associated with depictions of Saint Joan of Arc.'),
  ('HOLY_AMPULLA', 'Holy Ampulla', 'Sacred flask associated with the tradition of Clovis’s baptism by Saint Remigius.'),
  ('PALLIUM', 'Pallium', 'Liturgical vestment worn by certain archbishops and associated with archiepiscopal dignity.'),
  ('SISTERS_OF_CHARITY_OF_NEVERS', 'Sisters of Charity of Nevers', 'Religious congregation in which Saint Bernadette Soubirous lived her consecrated life.')
) AS x(code, label, description)
ON a.code = x.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;

INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'fr', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BULL', 'Taureau', 'Animal associé au martyre de sainte Blandine dans l’arène de Lyon.'),
  ('BEAR', 'Ours', 'Animal de l’arène associé aux supplices des martyrs chrétiens.'),
  ('NET', 'Filet', 'Attribut évoquant les supplices infligés aux martyrs dans l’arène.'),
  ('STAKE', 'Pieu', 'Pieu évoquant les supplices subis par certains martyrs.'),
  ('MEDALLION', 'Médaillon', 'Attribut iconographique associé à sainte Geneviève.'),
  ('DISTAFF', 'Quenouille', 'Outil textile pouvant évoquer la vie quotidienne et les représentations traditionnelles de sainte Geneviève.'),
  ('SPINDLE', 'Fuseau', 'Outil de filage associé aux représentations traditionnelles de sainte Geneviève.'),
  ('SHEEP', 'Mouton', 'Animal évoquant la vie pastorale et les traditions iconographiques liées à sainte Geneviève.'),
  ('PURSE', 'Bourse', 'Symbole de la charité et de la défense des pauvres, associé à saint Yves.'),
  ('DOCUMENT', 'Document juridique', 'Attribut évoquant l’activité judiciaire et la défense des justiciables de saint Yves.'),
  ('SCALES', 'Balance de justice', 'Symbole de justice et d’équité, associé à saint Yves, patron des juristes.'),
  ('BANNER', 'Étendard', 'Étendard associé à sainte Jeanne d’Arc et à sa mission militaire.'),
  ('ARMOR', 'Armure', 'Équipement militaire associé aux représentations de sainte Jeanne d’Arc.'),
  ('HOLY_AMPULLA', 'Sainte Ampoule', 'Fiole sacrée associée à la tradition du baptême de Clovis par saint Rémi.'),
  ('PALLIUM', 'Pallium', 'Insigne liturgique porté par certains archevêques, associé à la dignité archiépiscopale.'),
  ('SISTERS_OF_CHARITY_OF_NEVERS', 'Sœurs de la Charité de Nevers', 'Congrégation religieuse dans laquelle sainte Bernadette Soubirous a vécu sa vie consacrée.')
) AS x(code, label, description)
ON a.code = x.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;

-- Latin translations
INSERT INTO attribute_translations (attribute_id, locale_code, label, description)
SELECT a.id, 'la', x.label, x.description
FROM attributes a
JOIN (VALUES
  ('BULL', 'Taurus', 'Animal cum martyrio Sanctae Blandinae in arena Lugdunensi coniunctum.'),
  ('BEAR', 'Ursus', 'Animal arenae cum suppliciis martyrum Christianorum coniunctum.'),
  ('NET', 'Rete', 'Instrumentum supplicii, quod tormenta martyrum in arena evocare potest.'),
  ('STAKE', 'Palus', 'Palus ad supplicia quorundam martyrum evocanda.'),
  ('MEDALLION', 'Phalera', 'Ornamentum iconographicum cum Sancta Genovefa coniunctum.'),
  ('DISTAFF', 'Colus', 'Instrumentum texendi, quod vitam cotidianam et traditiones iconographicas Sanctae Genovefae evocare potest.'),
  ('SPINDLE', 'Fusus', 'Instrumentum fili ducendi cum traditionibus iconographicis Sanctae Genovefae coniunctum.'),
  ('SHEEP', 'Ovis', 'Animal vitam pastoralem et traditiones iconographicas Sanctae Genovefae evocans.'),
  ('PURSE', 'Marsupium', 'Symbolum caritatis et defensionis pauperum, cum Sancto Ivone coniunctum.'),
  ('DOCUMENT', 'Instrumentum iuridicum', 'Attributum opus iudiciale et defensionem litigantium Sancti Ivonis significans.'),
  ('SCALES', 'Libra iustitiae', 'Symbolum iustitiae et aequitatis, cum Sancto Ivone, patrono iuris peritorum, coniunctum.'),
  ('BANNER', 'Vexillum', 'Vexillum cum Sancta Ioanna de Arco et eius missione militari coniunctum.'),
  ('ARMOR', 'Loricamentum', 'Armatura militaris in imaginibus Sanctae Ioannae de Arco conspicua.'),
  ('HOLY_AMPULLA', 'Sancta Ampulla', 'Vas sacrum cum traditione baptismi Clodovei a Sancto Remigio celebrati coniunctum.'),
  ('PALLIUM', 'Pallium', 'Vestimentum liturgicum a quibusdam archiepiscopis gestatum, dignitatem archiepiscopalem significans.'),
  ('SISTERS_OF_CHARITY_OF_NEVERS', 'Sorores Caritatis Nivernensis', 'Congregatio religiosa in qua Sancta Bernadetta Soubirous vitam consecratam egit.')
) AS x(code, label, description)
ON a.code = x.code
ON CONFLICT (attribute_id, locale_code) DO NOTHING;


-- ============================================================
-- 3. ASSOCIATIONS SAINTS / ATTRIBUTS
-- ============================================================

INSERT INTO saint_attributes (saint_id, attribute_id)
SELECT s.id, a.id
FROM (VALUES

    -- --------------------------------------------------------
    -- SAINTE BERNADETTE SOUBIROUS
    -- --------------------------------------------------------
    -- Apparitions de Lourdes, prière et vie religieuse.

    ('saint-bernadette-soubirous', 'ROSARY'),
    ('saint-bernadette-soubirous', 'VEIL'),
    ('saint-bernadette-soubirous', 'CANDLE'),
    ('saint-bernadette-soubirous', 'VIRGIN'),
    ('saint-bernadette-soubirous', 'RELIGIOUS'),
    ('saint-bernadette-soubirous', 'SISTERS_OF_CHARITY_OF_NEVERS'),

    -- --------------------------------------------------------
    -- SAINTE BLANDINE
    -- --------------------------------------------------------
    -- Martyre de Lyon en 177.

    ('saint-blandina', 'MARTYR'),
    ('saint-blandina', 'VIRGIN'),
    ('saint-blandina', 'PALM'),
    ('saint-blandina', 'GRIDIRON'),
    ('saint-blandina', 'BULL'),
    ('saint-blandina', 'BEAR'),
    ('saint-blandina', 'LION'),
    ('saint-blandina', 'NET'),
    ('saint-blandina', 'STAKE'),
    ('saint-blandina', 'CROSS'),

    -- --------------------------------------------------------
    -- SAINT CÉSAIRE D'ARLES
    -- --------------------------------------------------------
    -- Évêque d'Arles, auteur et réformateur monastique.

    ('saint-caesarius-of-arles', 'BISHOP'),
    ('saint-caesarius-of-arles', 'CONFESSOR'),
    ('saint-caesarius-of-arles', 'BOOK'),
    ('saint-caesarius-of-arles', 'CROSIER'),
    ('saint-caesarius-of-arles', 'MITRE'),
    ('saint-caesarius-of-arles', 'PALLIUM'),

    -- --------------------------------------------------------
    -- SAINTE CLOTILDE
    -- --------------------------------------------------------
    -- Reine des Francs, épouse de Clovis.

    ('saint-clotilde', 'QUEEN'),
    ('saint-clotilde', 'CROWN'),
    ('saint-clotilde', 'CROSS'),
    ('saint-clotilde', 'ROSARY'),
    ('saint-clotilde', 'VEIL'),

    -- --------------------------------------------------------
    -- SAINTE GENEVIÈVE DE PARIS
    -- --------------------------------------------------------
    -- Patronne de Paris ; cierge miraculeux et clés de la ville.

    ('saint-genevieve', 'VIRGIN'),
    ('saint-genevieve', 'RELIGIOUS'),
    ('saint-genevieve', 'BOOK'),
    ('saint-genevieve', 'CANDLE'),
    ('saint-genevieve', 'KEYS'),
    ('saint-genevieve', 'CROSS'),
    ('saint-genevieve', 'MEDALLION'),
    ('saint-genevieve', 'DISTAFF'),
    ('saint-genevieve', 'SPINDLE'),
    ('saint-genevieve', 'SHEEP'),

    -- --------------------------------------------------------
    -- SAINT YVES DE KERMARTIN
    -- --------------------------------------------------------
    -- Prêtre, juge ecclésiastique et défenseur des pauvres.

    ('saint-ivo-of-kermartin', 'PRIEST'),
    ('saint-ivo-of-kermartin', 'CONFESSOR'),
    ('saint-ivo-of-kermartin', 'BOOK'),
    ('saint-ivo-of-kermartin', 'DOCUMENT'),
    ('saint-ivo-of-kermartin', 'PURSE'),
    ('saint-ivo-of-kermartin', 'SCALES'),

    -- --------------------------------------------------------
    -- SAINTE JEANNE D'ARC
    -- --------------------------------------------------------
    -- Pucelle d'Orléans, condamnée et exécutée à Rouen.

    ('saint-joan-of-arc', 'VIRGIN'),
    ('saint-joan-of-arc', 'MARTYR'),
    ('saint-joan-of-arc', 'SWORD'),
    ('saint-joan-of-arc', 'LANCE'),
    ('saint-joan-of-arc', 'BANNER'),
    ('saint-joan-of-arc', 'ARMOR'),
    ('saint-joan-of-arc', 'CROSS'),

    -- --------------------------------------------------------
    -- SAINT POTHIN DE LYON
    -- --------------------------------------------------------
    -- Premier évêque de Lyon, martyr en 177.

    ('saint-pothinus', 'BISHOP'),
    ('saint-pothinus', 'MARTYR'),
    ('saint-pothinus', 'CROSIER'),
    ('saint-pothinus', 'MITRE'),
    ('saint-pothinus', 'PALM'),
    ('saint-pothinus', 'CROSS'),
    ('saint-pothinus', 'CHAINS'),

    -- --------------------------------------------------------
    -- SAINT RÉMI DE REIMS
    -- --------------------------------------------------------
    -- Évêque de Reims, baptême de Clovis et Sainte Ampoule.

    ('saint-remigius', 'BISHOP'),
    ('saint-remigius', 'CONFESSOR'),
    ('saint-remigius', 'CROSIER'),
    ('saint-remigius', 'MITRE'),
    ('saint-remigius', 'DOVE'),
    ('saint-remigius', 'HOLY_AMPULLA'),
    ('saint-remigius', 'CHALICE'),
    ('saint-remigius', 'CROSS'),
    ('saint-remigius', 'BOOK')

) AS v(saint_slug, attribute_code)
JOIN saints s
    ON s.slug = v.saint_slug
JOIN attributes a
    ON a.code = v.attribute_code
ON CONFLICT (saint_id, attribute_id) DO NOTHING;

COMMIT;
