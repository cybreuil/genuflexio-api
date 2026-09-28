BEGIN;

-- =====
-- Roman POLAND saints images
-- =====
--

INSERT INTO images (
  image_url,
  title,
  image_type,
  alt_text,
  creator,
  date_label,
  repository,
  credit,
  license,
  source_url
) VALUES

-- Saint Józef Sebastian Pelczar
('/saints/pl/saint-jozef-sebastian-pelczar.webp', 'Saint Józef Sebastian Pelczar', 'painting', 'Saint Józef Sebastian Pelczar Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-jozef-sebastian-pelczar_2.webp', 'Saint Józef Sebastian Pelczar', 'photograph', 'Saint Józef Sebastian Pelczar Photograph', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Vincent Pallotti
('/saints/pl/saint-vincent-pallotti.webp', 'Saint Vincent Pallotti', 'painting', 'Saint Vincent Pallotti Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-vincent-pallotti_2.webp', 'Saint Vincent Pallotti', 'painting', 'Saint Vincent Pallotti Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL);

-- Saint Florian
-- WIP
