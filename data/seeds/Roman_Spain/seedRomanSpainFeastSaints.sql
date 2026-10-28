
BEGIN;

-- =========================================================
-- Roman Spain Calendar - FEAST <-> SAINT links
-- =========================================================
-- Covers only Spain-specific feasts that are NOT already
-- present in ROMAN_GENERAL's feast_saints.
--
-- Promoted feasts from ROMAN_GENERAL are elevated in Spain
-- but their feast_saints links already exist — no new rows
-- needed here.
--
-- Assumes:
-- - table feast_saints(feast_id, saint_id, role)
-- - unique constraint on (feast_id, saint_id)
-- =========================================================

INSERT INTO feast_saints (feast_id, saint_id, role)
SELECT f.id, s.id, x.role
FROM (VALUES

  -- Jan 9 – Saint Eulogius of Córdoba, Bishop
  ('saint-eulogius-of-cordoba-bishop-and-martyr',
   'saint-eulogius-of-cordoba',
   'primary'),

  -- Jan 20 – Saints Fructuosus, Augurius, and Eulogius, Martyrs
  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   'saint-fructuosus',
   'primary'),
  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   'saint-augurius',
   'primary'),
  ('saints-fructuosus-augurius-and-eulogius-martyrs',
   'saint-eulogius',
   'primary'),

  -- Jan 23 – Saint Ildephonsus of Toledo, Bishop
  ('saint-ildephonsus-of-toledo-bishop',
   'saint-ildephonsus-of-toledo',
   'primary'),

  -- Apr 13 – Saint Hermenegild, Martyr
  ('saint-hermenegild-martyr',
   'saint-hermenegild',
   'primary'),

  -- Apr 24 – Saint Peter of Saint Joseph de Betancur, Missionary
  ('saint-peter-of-saint-joseph-de-betancur-missionary',
   'saint-peter-of-saint-joseph-de-betancur',
   'primary'),

  -- Apr 26 – Saint Isidore of Seville, Bishop and Doctor
  ('saint-isidore-of-seville-bishop-and-doctor',
   'saint-isidore-of-seville',
   'primary'),

  -- May 15 – Saint Isidore the Farmer
  ('saint-isidore-the-farmer',
   'saint-isidore-the-farmer',
   'primary'),

  -- May 17 – Saint Paschal Baylon
  ('saint-paschal-baylon',
   'saint-paschal-baylon',
   'primary'),

  -- May 22 – Saint Joaquina Vedruna
  ('saint-joaquina-vedruna',
   'saint-joaquina-vedruna',
   'primary'),

  -- May 30 – Saint Ferdinand
  ('saint-ferdinand',
   'saint-ferdinand',
   'primary'),

  -- Jun 9 – Saint José de Anchieta, Missionary
  ('saint-jose-de-anchieta-missionary',
   'saint-jose-de-anchieta',
   'primary'),

  -- Jun 15 – Saint María Micaela of the Blessed Sacrament, Virgin
  ('saint-maria-micaela-of-the-blessed-sacrament-virgin',
   'saint-maria-micaela-of-the-blessed-sacrament',
   'primary'),

  -- Jun 26 – Saint Pelagius, Martyr
  ('saint-pelagius-martyr',
   'saint-pelagius',
   'primary'),

  -- Aug 19 – Saint Ezequiel Moreno, Bishop
  ('saint-ezequiel-moreno-bishop',
   'saint-ezequiel-moreno',
   'primary'),

  -- Aug 26 – Saint Teresa of Jesus Jornet e Ibars, Virgin
  ('saint-teresa-of-jesus-jornet-and-ibars-virgin',
   'saint-teresa-of-jesus-jornet-and-ibars',
   'primary'),

  -- Sep 24 – Our Lady of Mercy
  ('our-lady-of-mercy',
   'saint-mary',
   'primary'),

  -- Oct 3 – Saint Francis Borgia, Priest
  ('saint-francis-borgia-priest',
   'saint-francis-borgia',
   'primary'),

  -- Oct 10 – Saint Thomas of Villanova, Bishop
  ('saint-thomas-of-villanova-bishop',
   'saint-thomas-of-villanova',
   'primary'),

  -- Oct 11 – Saint Soledad Torres Acosta, Virgin
  ('saint-soledad-torres-acosta-virgin',
   'saint-soledad-torres-acosta',
   'primary'),

  -- Oct 12 – Our Lady of the Pillar
  ('our-lady-of-the-pillar',
   'saint-mary',
   'primary'),

  -- Oct 19 – Saint Peter of Alcántara, Priest
  ('saint-peter-of-alcantara-priest',
   'saint-peter-of-alcantara',
   'primary'),

  -- Nov 13 – Saint Leander, Bishop
  ('saint-leander-bishop',
   'saint-leander',
   'primary'),

  -- Dec 10 – Saint Eulalia of Mérida, Virgin and Martyr
  ('saint-eulalia-of-merida-virgin-and-martyr',
   'saint-eulalia-of-merida',
   'primary')

) AS x(feast_slug, saint_slug, role)
JOIN feasts f ON f.slug = x.feast_slug
JOIN saints s ON s.slug = x.saint_slug
ON CONFLICT (feast_id, saint_id) DO NOTHING;

COMMIT;
