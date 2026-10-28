-- =========================================================
-- Roman Spain Calendar - Proper Saints and Promoted Feasts
-- Calendar: ROMAN_SPAIN
--
-- ROMAN_SPAIN inherits from ROMAN_GENERAL.
--
-- IMPORTANT:
--   - Only saints/events absent from ROMAN_GENERAL are inserted
--     into feasts.
--   - Existing ROMAN_GENERAL feasts are NOT duplicated.
--   - Spain-specific celebrations are represented by additional
--     celebration rows for ROMAN_SPAIN.
--   - Liturgical ranks are inherited from ROMAN_GENERAL.
-- =========================================================

BEGIN;

-- =========================================================
-- Section 1: Spain-only feasts
--
-- These slugs do NOT exist in ROMAN_GENERAL.
-- =========================================================

INSERT INTO feasts (slug, default_name, feast_type) VALUES

('saint-eulogius-of-cordoba-bishop-and-martyr',
 'Saint Eulogius of Córdoba, Bishop and Martyr',
 'sanctoral'),

('saints-fructuosus-augurius-and-eulogius-martyrs',
 'Saints Fructuosus, Augurius, and Eulogius, Martyrs',
 'sanctoral'),

('saint-ildephonsus-of-toledo-bishop',
 'Saint Ildephonsus of Toledo, Bishop',
 'sanctoral'),

('saint-hermenegild-martyr',
 'Saint Hermenegild, Martyr',
 'sanctoral'),

('saint-peter-of-saint-joseph-de-betancur-missionary',
 'Saint Peter of Saint Joseph de Betancur, Missionary',
 'sanctoral'),

('saint-isidore-of-seville-bishop-and-doctor',
 'Saint Isidore of Seville, Bishop and Doctor of the Church',
 'sanctoral'),

('saint-isidore-the-farmer',
 'Saint Isidore the Farmer',
 'sanctoral'),

('saint-paschal-baylon',
 'Saint Paschal Baylon',
 'sanctoral'),

('saint-joaquina-vedruna',
 'Saint Joaquina Vedruna',
 'sanctoral'),

('saint-ferdinand',
 'Saint Ferdinand',
 'sanctoral'),

('saint-jose-de-anchieta-missionary',
 'Saint José de Anchieta, Missionary',
 'sanctoral'),

('saint-maria-micaela-of-the-blessed-sacrament-virgin',
 'Saint María Micaela of the Blessed Sacrament, Virgin',
 'sanctoral'),

('saint-pelagius-martyr',
 'Saint Pelagius, Martyr',
 'sanctoral'),

('saint-ezequiel-moreno-bishop',
 'Saint Ezequiel Moreno, Bishop',
 'sanctoral'),

('saint-teresa-of-jesus-jornet-and-ibars-virgin',
 'Saint Teresa of Jesus Jornet e Ibars, Virgin',
 'sanctoral'),

('our-lady-of-mercy',
 'Our Lady of Mercy',
 'marian'),

('saint-francis-borgia-priest',
 'Saint Francis Borgia, Priest',
 'sanctoral'),

('saint-thomas-of-villanova-bishop',
 'Saint Thomas of Villanova, Bishop',
 'sanctoral'),

('saint-soledad-torres-acosta-virgin',
 'Saint Soledad Torres Acosta, Virgin',
 'sanctoral'),

('our-lady-of-the-pillar',
 'Our Lady of the Pillar',
 'marian'),

('saint-peter-of-alcantara-priest',
 'Saint Peter of Alcántara, Priest',
 'sanctoral'),

('saint-leander-bishop',
 'Saint Leander, Bishop',
 'sanctoral'),

('saint-eulalia-of-merida-virgin-and-martyr',
 'Saint Eulalia of Mérida, Virgin and Martyr',
 'sanctoral'),

 ('jesus-christ-the-eternal-high-priest',
  'Jesus Christ, the Eternal High Priest',
  'christological')

ON CONFLICT (slug) DO NOTHING;


-- =========================================================
-- Section 2: Feast translations
-- =========================================================

-- ---------------------------------------------------------
-- EN
-- ---------------------------------------------------------

INSERT INTO feast_translations (feast_id, locale_code, name, description)
SELECT f.id, 'en', x.name, NULL
FROM feasts f
JOIN (VALUES

  ('saint-eulogius-of-cordoba-bishop-and-martyr',
   'Saint Eulogius of Córdoba, Bishop and Martyr'),

  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   'Saints Fructuosus, Augurius, and Eulogius, Martyrs'),

  ('saint-ildephonsus-of-toledo-bishop',
   'Saint Ildephonsus of Toledo, Bishop'),

  ('saint-hermenegild-martyr',
   'Saint Hermenegild, Martyr'),

  ('saint-peter-of-saint-joseph-de-betancur-missionary',
   'Saint Peter of Saint Joseph de Betancur, Missionary'),

  ('saint-isidore-of-seville-bishop-and-doctor',
   'Saint Isidore of Seville, Bishop and Doctor of the Church'),

  ('saint-isidore-the-farmer',
   'Saint Isidore the Farmer'),

  ('saint-paschal-baylon',
   'Saint Paschal Baylon'),

  ('saint-joaquina-vedruna',
   'Saint Joaquina Vedruna'),

  ('saint-ferdinand',
   'Saint Ferdinand'),

  ('saint-jose-de-anchieta-missionary',
   'Saint José de Anchieta, Missionary'),

  ('saint-maria-micaela-of-the-blessed-sacrament-virgin',
   'Saint María Micaela of the Blessed Sacrament, Virgin'),

  ('saint-pelagius-martyr',
   'Saint Pelagius, Martyr'),

  ('saint-ezequiel-moreno-bishop',
   'Saint Ezequiel Moreno, Bishop'),

  ('saint-teresa-of-jesus-jornet-and-ibars-virgin',
   'Saint Teresa of Jesus Jornet e Ibars, Virgin'),

  ('our-lady-of-mercy',
   'Our Lady of Mercy'),

  ('saint-francis-borgia-priest',
   'Saint Francis Borgia, Priest'),

  ('saint-thomas-of-villanova-bishop',
   'Saint Thomas of Villanova, Bishop'),

  ('saint-soledad-torres-acosta-virgin',
   'Saint Soledad Torres Acosta, Virgin'),

  ('our-lady-of-the-pillar',
   'Our Lady of the Pillar'),

  ('saint-peter-of-alcantara-priest',
   'Saint Peter of Alcántara, Priest'),

  ('saint-leander-bishop',
   'Saint Leander, Bishop'),

  ('saint-eulalia-of-merida-virgin-and-martyr',
   'Saint Eulalia of Mérida, Virgin and Martyr'),

   ('jesus-christ-the-eternal-high-priest',
    'Jesus Christ, the Eternal High Priest')


) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;


-- ---------------------------------------------------------
-- FR
-- ---------------------------------------------------------

INSERT INTO feast_translations (feast_id, locale_code, name, description)
SELECT f.id, 'fr', x.name, NULL
FROM feasts f
JOIN (VALUES

  ('saint-eulogius-of-cordoba-bishop-and-martyr',
   'Saint Euloge de Cordoue, évêque et martyr'),

  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   'Saints Fructueux, Augure et Euloge, martyrs'),

  ('saint-ildephonsus-of-toledo-bishop',
   'Saint Ildefonse de Tolède, évêque'),

  ('saint-hermenegild-martyr',
   'Saint Herménégilde, martyr'),

  ('saint-peter-of-saint-joseph-de-betancur-missionary',
   'Saint Pierre de Saint-Joseph de Betancur, missionnaire'),

  ('saint-isidore-of-seville-bishop-and-doctor',
   'Saint Isidore de Séville, évêque et docteur de l''Église'),

  ('saint-isidore-the-farmer',
   'Saint Isidore le Laboureur'),

  ('saint-paschal-baylon',
   'Saint Pascal Baylon'),

  ('saint-joaquina-vedruna',
   'Sainte Joaquina Vedruna'),

  ('saint-ferdinand',
   'Saint Ferdinand'),

  ('saint-jose-de-anchieta-missionary',
   'Saint José de Anchieta, missionnaire'),

  ('saint-maria-micaela-of-the-blessed-sacrament-virgin',
   'Sainte María Micaela du Saint-Sacrement, vierge'),

  ('saint-pelagius-martyr',
   'Saint Pélage, martyr'),

  ('saint-ezequiel-moreno-bishop',
   'Saint Ézéchiel Moreno, évêque'),

  ('saint-teresa-of-jesus-jornet-and-ibars-virgin',
   'Sainte Thérèse de Jésus Jornet e Ibars, vierge'),

  ('our-lady-of-mercy',
   'Notre-Dame de la Merci'),

  ('saint-francis-borgia-priest',
   'Saint François Borgia, prêtre'),

  ('saint-thomas-of-villanova-bishop',
   'Saint Thomas de Villeneuve, évêque'),

  ('saint-soledad-torres-acosta-virgin',
   'Sainte Soledad Torres Acosta, vierge'),

  ('our-lady-of-the-pillar',
   'Notre-Dame du Pilier'),

  ('saint-peter-of-alcantara-priest',
   'Saint Pierre d''Alcántara, prêtre'),

  ('saint-leander-bishop',
   'Saint Léandre, évêque'),

  ('saint-eulalia-of-merida-virgin-and-martyr',
   'Sainte Eulalie de Mérida, vierge et martyre'),

   ('jesus-christ-the-eternal-high-priest',
    'Jésus Christ, Souverain Prêtre')


) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;


-- ---------------------------------------------------------
-- LA
-- ---------------------------------------------------------

INSERT INTO feast_translations (feast_id, locale_code, name, description)
SELECT f.id, 'la', x.name, NULL
FROM feasts f
JOIN (VALUES

  ('saint-eulogius-of-cordoba-bishop-and-martyr',
   'Sanctus Eulogius Cordubensis, episcopus et martyr'),

  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   'Sancti Fructuosus, Augurius et Eulogius, martyres'),

  ('saint-ildephonsus-of-toledo-bishop',
   'Sanctus Ildephonsus Toletanus, episcopus'),

  ('saint-hermenegild-martyr',
   'Sanctus Hermenegildus, martyr'),

  ('saint-peter-of-saint-joseph-de-betancur-missionary',
   'Sanctus Petrus a Sancto Iosepho de Betancur, missionarius'),

  ('saint-isidore-of-seville-bishop-and-doctor',
   'Sanctus Isidorus Hispalensis, episcopus et Ecclesiae Doctor'),

  ('saint-isidore-the-farmer',
   'Sanctus Isidorus Agricola'),

  ('saint-paschal-baylon',
   'Sanctus Paschalis Baylon'),

  ('saint-joaquina-vedruna',
   'Sancta Ioachima Vedruna'),

  ('saint-ferdinand',
   'Sanctus Ferdinandus'),

  ('saint-jose-de-anchieta-missionary',
   'Sanctus Iosephus de Anchieta, missionarius'),

  ('saint-maria-micaela-of-the-blessed-sacrament-virgin',
   'Sancta Maria Michaela a Sanctissimo Sacramento, virgo'),

  ('saint-pelagius-martyr',
   'Sanctus Pelagius, martyr'),

  ('saint-ezequiel-moreno-bishop',
   'Sanctus Ezechiel Moreno, episcopus'),

  ('saint-teresa-of-jesus-jornet-and-ibars-virgin',
   'Sancta Teresia a Iesu Jornet et Ibars, virgo'),

  ('our-lady-of-mercy',
   'Beata Maria Virgo de Mercede'),

  ('saint-francis-borgia-priest',
   'Sanctus Franciscus Borgia, presbyter'),

  ('saint-thomas-of-villanova-bishop',
   'Sanctus Thomas a Villanova, episcopus'),

  ('saint-soledad-torres-acosta-virgin',
   'Sancta Soledas Torres Acosta, virgo'),

  ('our-lady-of-the-pillar',
   'Beata Maria Virgo de Columna'),

  ('saint-peter-of-alcantara-priest',
   'Sanctus Petrus de Alcantara, presbyter'),

  ('saint-leander-bishop',
   'Sanctus Leander, episcopus'),

  ('saint-eulalia-of-merida-virgin-and-martyr',
   'Sancta Eulalia Emeritensis, virgo et martyr'),

   ('jesus-christ-the-eternal-high-priest',
    'Iesus Christus, Summus et Aeternus Sacerdos')


) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;


-- =========================================================
-- Section 3: Spain celebrations
-- =========================================================

-- ---------------------------------------------------------
-- 3a. Spain-only feasts
-- ---------------------------------------------------------

INSERT INTO celebrations (
  feast_id,
  calendar_id,
  rank_id,
  color_id,
  date_kind,
  month,
  day,
  observance_type,
  is_optional,
  notes
)
SELECT
  f.id,
  cal.id,
  r.id,
  lc.id,
  'fixed',
  x.month,
  x.day,
  x.observance_type,
  x.is_optional,
  'Calendario Propio de España'
FROM feasts f
JOIN calendars cal
  ON cal.code = 'ROMAN_SPAIN'
JOIN calendars rcal
  ON rcal.code = 'ROMAN_GENERAL'
JOIN (VALUES

  ('saint-eulogius-of-cordoba-bishop-and-martyr',
   1, 9, 'MEM_OPT', 'RED', 'normal', true),

  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   1, 20, 'MEM_OPT', 'RED', 'normal', true),

  ('saint-ildephonsus-of-toledo-bishop',
   1, 23, 'MEM_OBL', 'WHITE', 'normal', false),

  ('saint-hermenegild-martyr',
   4, 13, 'MEM_OPT', 'RED', 'normal', true),

  ('saint-peter-of-saint-joseph-de-betancur-missionary',
   4, 24, 'MEM_OBL', 'WHITE', 'normal', false),

  ('saint-isidore-of-seville-bishop-and-doctor',
   4, 26, 'FEAST', 'WHITE', 'normal', false),

  ('saint-isidore-the-farmer',
   5, 15, 'MEM_OBL', 'WHITE', 'normal', false),

  ('saint-paschal-baylon',
   5, 17, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-joaquina-vedruna',
   5, 22, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-ferdinand',
   5, 30, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-jose-de-anchieta-missionary',
   6, 9, 'MEM_OBL', 'WHITE', 'normal', false),

  ('saint-maria-micaela-of-the-blessed-sacrament-virgin',
   6, 15, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-pelagius-martyr',
   6, 26, 'MEM_OPT', 'RED', 'normal', true),

  ('saint-ezequiel-moreno-bishop',
   8, 19, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-teresa-of-jesus-jornet-and-ibars-virgin',
   8, 26, 'MEM_OBL', 'WHITE', 'normal', false),

  ('our-lady-of-mercy',
   9, 24, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-francis-borgia-priest',
   10, 3, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-thomas-of-villanova-bishop',
   10, 10, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-soledad-torres-acosta-virgin',
   10, 11, 'MEM_OPT', 'WHITE', 'normal', true),

  ('our-lady-of-the-pillar',
   10, 12, 'FEAST', 'WHITE', 'normal', false),

  ('saint-peter-of-alcantara-priest',
   10, 19, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-leander-bishop',
   11, 13, 'MEM_OPT', 'WHITE', 'normal', true),

  ('saint-eulalia-of-merida-virgin-and-martyr',
   12, 10, 'MEM_OPT', 'RED', 'normal', true)

) AS x(
  slug,
  month,
  day,
  rank_code,
  color_code,
  observance_type,
  is_optional
)
  ON f.slug = x.slug
JOIN liturgical_ranks r
  ON r.calendar_id = rcal.id
 AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc
  ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;


-- ---------------------------------------------------------
-- 3b. Existing ROMAN_GENERAL feasts promoted in Spain
-- ---------------------------------------------------------

INSERT INTO celebrations (
  feast_id,
  calendar_id,
  rank_id,
  color_id,
  date_kind,
  month,
  day,
  observance_type,
  is_optional,
  notes
)
SELECT
  f.id,
  cal.id,
  r.id,
  lc.id,
  'fixed',
  x.month,
  x.day,
  x.observance_type,
  x.is_optional,
  x.notes
FROM feasts f
JOIN calendars cal
  ON cal.code = 'ROMAN_SPAIN'
JOIN calendars rcal
  ON rcal.code = 'ROMAN_GENERAL'
JOIN (VALUES

  ('saint-vincent-deacon-and-martyr',
   1, 22, 'MEM_OBL', 'RED', 'normal', false,
   'Calendario Propio de España'),

  ('saints-cyril-monk-and-methodius-bishop',
   2, 14, 'FEAST', 'WHITE', 'normal', false,
   'Patrons of Europe; Calendario Propio de España'),

  ('saint-catherine-of-siena-virgin-and-doctor-of-the-church',
   4, 29, 'FEAST', 'WHITE', 'normal', false,
   'Patroness of Europe; Calendario Propio de España'),

  ('saint-john-of-avila-priest-and-doctor-of-the-church',
   5, 10, 'MEM_OBL', 'WHITE', 'normal', false,
   'Calendario Propio de España'),

  ('saint-benedict-abbot',
   7, 11, 'FEAST', 'WHITE', 'normal', false,
   'Patron of Europe; Calendario Propio de España'),

  ('our-lady-of-mount-carmel',
   7, 16, 'MEM_OBL', 'WHITE', 'normal', false,
   'Calendario Propio de España'),

  ('saint-bridget-religious',
   7, 23, 'FEAST', 'WHITE', 'normal', false,
   'Patroness of Europe; Calendario Propio de España'),

  ('saint-james-apostle',
   7, 25, 'SOLEMNITY', 'RED', 'normal', false,
   'Principal Patron of Spain; Calendario Propio de España'),

  ('saint-teresa-benedicta-of-the-cross-virgin-and-martyr',
   8, 9, 'FEAST', 'RED', 'normal', false,
   'Patroness of Europe; Calendario Propio de España'),

  ('saint-teresa-of-jesus-virgin-and-doctor-of-the-church',
   10, 15, 'FEAST', 'WHITE', 'normal', false,
   'Calendario Propio de España'),

  ('saint-anthony-mary-claret-bishop',
   10, 24, 'MEM_OBL', 'WHITE', 'normal', false,
   'Calendario Propio de España'),

  ('saint-john-of-the-cross-priest-and-doctor-of-the-church',
   12, 14, 'MEM_OBL', 'WHITE', 'normal', false,
   'Calendario Propio de España')

) AS x(
  slug,
  month,
  day,
  rank_code,
  color_code,
  observance_type,
  is_optional,
  notes
)
  ON f.slug = x.slug
JOIN liturgical_ranks r
  ON r.calendar_id = rcal.id
 AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc
  ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;



-- =========================================================
-- 3c. Jesus Christ, Eternal High Priest
-- =========================================================

INSERT INTO celebrations (
  feast_id,
  calendar_id,
  rank_id,
  color_id,
  date_kind,
  movable_base,
  movable_offset_days,
  observance_type,
  is_optional,
  notes
)
SELECT
  f.id,
  cal.id,
  r.id,
  lc.id,
  'movable',
  'PENTECOST',
  4,
  'normal',
  false,
  'Thursday after Pentecost; Calendario Propio de España'
FROM feasts f
JOIN calendars cal
  ON cal.code = 'ROMAN_SPAIN'
JOIN calendars rcal
  ON rcal.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r
  ON r.calendar_id = rcal.id
 AND r.code = 'FEAST_LORD'
LEFT JOIN liturgical_colors lc
  ON lc.code = 'WHITE'
WHERE f.slug = 'jesus-christ-the-eternal-high-priest'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;


COMMIT;
