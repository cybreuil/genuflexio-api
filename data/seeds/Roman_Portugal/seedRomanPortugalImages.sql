BEGIN;

-- =====
-- Roman PORTUGAL saints images
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

-- Blessed Gonçalo de Amarante
('/saints/pt/blessed-goncalo-de-amarante_andre.webp', 'Blessed Gonçalo de Amarante', 'painting', 'Blessed Gonçalo de Amarante Painting', 'António André', '1618-1625', 'Museum of Aveiro (Portugal)', NULL, 'Public Domain', NULL),
('/saints/pt/blessed-goncalo-de-amarante.webp', 'Blessed Gonçalo de Amarante', 'painting', 'Blessed Gonçalo de Amarante Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint John de Brito
('/saints/pt/saint-john-de-brito.webp', 'Saint John de Brito', 'painting', 'Saint John de Brito Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/pt/saint-john-de-brito_martyr.webp', 'Martyrdom of Saint John de Britto Killed by Sethupathi King of Ramnad', 'illustration', 'Saint John de Brito Martyrdom Illustration', NULL, '19th Century', NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),

-- Saint Theotonius
('/saints/pt/saint-theotonius_goncalves.webp', 'Saint Theotonius', 'painting', 'Saint Theotonius Painting', 'Nuno Gonçalves', '15th Century', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/pt/saint-theotonius_goncalves_2.webp', 'Saint Theotonius at the feet of Our Lady of the Immaculate Conception', 'painting', 'Saint Theotonius Painting', 'André Gonçalves', '18th Century', 'Santa Casa da Misericórdia (Coimbra)', NULL, 'Public Domain', NULL),

-- Saint Jacinta Marto
('/saints/pt/saint-jacinta-marto.webp', 'Saint Jacinta Marto', 'painting', 'Saint Jacinta Marto Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pt/saint-jacinta-marto-&-lucia-santos.webp', 'Saint Jacinta Marto', 'photograph', 'Saint Jacinta Marto & Lucia Santos Photograph', NULL, '1917', NULL, NULL, 'Public Domain', NULL),

-- Saint Francisco Marto
('/saints/pt/saint-francisco-marto.webp', 'Saint Francisco Marto', 'painting', 'Saint Francisco Marto Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pt/saint-francisco-&-jacinta-marto.webp', 'Saint Francisco Marto & Saint Jacinta Marto', 'photograph', 'Saint Francisco Marto & Saint Jacinta Marto Photograph', 'Joshua Benoliel', '1917', NULL, NULL, 'Public Domain', NULL),

-- Blessed Joan of Portugal
('/saints/pt/blessed-joan-of-portugal_goncalves.webp', 'Blessed Joan of Portugal', 'painting', 'Blessed Joan of Portugal Painting', 'Nuno Gonçalves', '1475', 'Convento de Jesus Aveiro (Portugal)', NULL, 'Public Domain', NULL),
('/saints/pt/blessed-joan-of-portugal.webp', 'Blessed Joan of Portugal', 'painting', 'Blessed Joan of Portugal Painting', NULL, '18th Century', 'Private Collection (Paris)', NULL, 'Public Domain', NULL),

-- Blessed Sancha of Portugal
('/saints/pt/blessed-sancha-of-portugal_holanda.webp', 'Blessed Sancha of Portugal', 'painting', 'Blessed Sancha of Portugal Painting', 'António de Holanda', '1530-1534', 'The Portuguese Genealogy / Genealogia dos Reis de Portugal', NULL, 'Public Domain', NULL),
('/saints/pt/blessed-sancha-of-portugal.webp', 'Blessed Sancha of Portugal', 'painting', 'Blessed Sancha of Portugal Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),

-- Blessed Mafalda of Portugal
('/saints/pt/blessed-mafalda-of-portugal.webp', 'Blessed Mafalda of Portugal', 'painting', 'Blessed Mafalda of Portugal Painting', NULL, '1740', 'Monastery of Arouca (Portugal)', NULL, 'Public Domain', NULL),
('/saints/pt/blessed-mafalda-of-portugal_odazzi.webp', 'Blessed Mafalda of Portugal saves the Monastery of Arouca from a fire', 'painting', 'Blessed Mafalda of Portugal Painting', 'Giovanni Odazzi', '1704-1725', 'Museum of Sacred Art of Arouca (Diocese of Porto)', NULL, 'Public Domain', NULL),
('/saints/pt/blessed-mafalda-of-portugal_holanda.webp', 'Blessed Mafalda of Portugal', 'painting', 'Blessed Mafalda of Portugal Painting', 'António de Holanda', '1530-1534', 'The Portuguese Genealogy / Genealogia dos Reis de Portugal', NULL, 'Public Domain', NULL),

-- Blessed Theresa of Portugal
('/saints/pt/blessed-theresa-of-portugal_holanda.webp', 'Blessed Theresa of Portugal', 'painting', 'Blessed Theresa of Portugal Painting', 'António de Holanda', '1530-1534', 'The Portuguese Genealogy / Genealogia dos Reis de Portugal', NULL, 'Public Domain', NULL),

-- Blessed Inácio de Azevedo
('/saints/pt/blessed-inacio-de-azevedo.webp', 'The Blessed Ignatius Azevedo & his companions', 'painting', 'Blessed Inácio de Azevedo & Companions Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pt/blessed-inacio-de-azevedo_2.webp', 'The Blessed Ignatius Azevedo stands holding an image of Mary while being pierced by a sword', 'illustration', 'Blessed Inácio de Azevedo Painting', NULL, '1675', NULL, NULL, 'Public Domain', NULL),
('/saints/pt/blessed-inacio-de-azevedo_3.webp', 'Blessed Inácio de Azevedo & his companions', 'painting', 'Blessed Inácio de Azevedo & Companions Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Blessed Bartholomew of the Martyrs
('/saints/pt/blessed-bartholomew-of-the-martyrs_andre.webp', 'Blessed Bartholomew of the Martyrs', 'painting', 'Blessed Bartholomew of the Martyrs Painting', 'António André', '1618-1625', 'Museu de Aveiro (Portugal)', NULL, 'Public Domain', NULL),
('/saints/pt/blessed-bartholomew-of-the-martyrs.webp', 'Blessed Bartholomew of the Martyrs', 'painting', 'Blessed Bartholomew of the Martyrs Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pt/blessed-bartholomew-of-the-martyrs_2.webp', 'Blessed Bartholomew of the Martyrs', 'engraving', 'Blessed Bartholomew of the Martyrs Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Beatrice of Silva
('/saints/pt/saint-beatrice-of-silva.webp', ' Saint Beatrice of Silva, foundress of the Order of the Immaculate Conception', 'painting', 'Saint Beatrice of Silva Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/pt/saint-beatrice-of-silva_2.webp', 'Saint Beatrice of Silva', 'painting', 'Saint Beatrice of Silva Painting', NULL, '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/pt/saint-beatrice-of-silva_3.webp', 'Saint Beatrice of Silva', 'painting', 'Saint Beatrice of Silva Painting', NULL, '19th Century', NULL, NULL, 'Public Domain', NULL),

-- Blessed Gonçalo de Lagos
('/saints/pt/blessed-goncalo-de-lagos.webp', 'Blessed Gonçalo de Lagos', 'illustration', 'Blessed Gonçalo de Lagos Illustration', NULL, '19th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Nuno of Saint Mary
('/saints/pt/saint-nuno-of-saint-mary.webp', 'Saint Nuno of Saint Mary', 'painting', 'Saint Nuno of Saint Mary Painting', NULL, '1850', NULL, NULL, 'Public Domain', NULL),
('/saints/pt/saint-nuno-of-saint-mary_2.webp', 'Saint Nuno of Saint Mary', 'painting', 'Saint Nuno of Saint Mary Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Martin of Dume
('/saints/pt/saint-martin-of-dume.webp', 'Saint Martin of Dume', 'painting', 'Saint Martin of Dume Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/pt/saint-martin-of-dume_2.webp', 'Saint Martin of Dume', 'illustration', 'Saint Martin of Dume Illustration', NULL, '10th Century', 'Códex Albeldensis - Biblioteca del Monasterio de San Lorenzo de El Escorial (Madrid)', NULL, 'Public Domain', NULL),
('/saints/pt/saint-martin-of-dume_3.webp', 'Saint Martin of Dume', 'icon', 'Saint Martin of Dume Icon', NULL, NULL, NULL, NULL, 'CC0 1.0 Universal', NULL),

-- Saint Gerald of Braga
('/saints/pt/saint-gerald-of-braga.webp', 'Saint Gerald of Braga', 'painting', 'Saint Gerald of Braga Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/pt/saint-gerald-of-braga_2.webp', 'Saint Gerald of Braga', 'painting', 'Saint Gerald of Braga Painting', NULL, '17th Century', 'Museu de Aveiro (Portugal)', NULL, 'Attribution-ShareAlike 4.0 International', NULL);

COMMIT;
