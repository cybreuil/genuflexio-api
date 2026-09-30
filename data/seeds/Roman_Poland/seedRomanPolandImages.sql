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
('/saints/pl/saint-vincent-pallotti_2.webp', 'Saint Vincent Pallotti', 'painting', 'Saint Vincent Pallotti Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Florian
('/saints/pl/saint-florian_cossa.webp', 'Saint Florian', 'painting', 'Saint Florian Painting', 'Francesco del Cossa', '1473', 'National Gallery of Art (Washington D.C.)', NULL, 'Public Domain', NULL),
('/saints/pl/saint-florian_altdorfer_martyr.webp', 'The Martyrdom of Saint Florian', 'painting', 'Saint Florian Painting', 'Albrecht Altdorfer', '1516-1520', 'Uffizi Gallery', NULL, 'Public Domain', NULL),
('/saints/pl/saint-florian_reni.webp', 'Saint Florian', 'painting', 'Saint Florian Painting', 'Guido Reni', '1614', NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-florian.webp', 'Saint Florian', 'painting', 'Saint Florian Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Stanisław Kazimierczyk
('/saints/pl/saint-stanislaw-kazimierczyk.webp', 'Saint Stanisław Kazimierczyk', 'painting', 'Saint Stanisław Kazimierczyk Painting', NULL, '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-stanislaw-kazimierczyk_2.webp', 'Saint Stanisław Kazimierczyk', 'illustration', 'Saint Stanisław Kazimierczyk Illustration', NULL, '1704', NULL, NULL, 'Public Domain', NULL),

-- Saint Andrew Bobola
('/saints/pl/saint-andrew-bobola.webp', 'Saint Andrew Bobola', 'painting', 'Saint Andrew Bobola Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-andrew-bobola_2.webp', 'Saint Andrew Bobola', 'painting', 'Saint Andrew Bobola Painting', 'Brother Bronisław Podsiadły SJ', '21th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Ursula Ledóchowska
('/saints/pl/saint-ursula-ledochowska.webp', 'Saint Ursula Ledóchowska', 'painting', 'Saint Ursula Ledóchowska Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-ursula-ledochowska_2.webp', 'Saint Ursula Ledóchowska in Saint Petersburg', 'photograph', 'Saint Ursula Ledóchowska Photograph', NULL, '1907', NULL, NULL, 'Public Domain', NULL),

-- Saint John Sarkander
('/saints/pl/saint-john-sarkander.webp', 'Saint John Sarkander', 'painting', 'Saint John Sarkander Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-john-sarkander_2.webp', 'Saint John Sarkander', 'illustration', 'Saint John Sarkander Illustration', NULL, '1855', NULL, NULL, 'Public Domain', NULL),

-- Saint Zdzislawa
('/saints/pl/saint-zdzislawa.webp', 'Saint Zdzislawa', 'painting', 'Saint Zdzislawa Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-zdzislawa_2.webp', 'Saint Zdzislawa', 'stained_glass', 'Saint Zdzislawa Stained Glass', NULL, NULL, 'Sts. Cyril and Methodius''s church in Olomouc (Czech Republic)', NULL, 'Attribution 4.0 International', NULL),

-- Saint Hedwig the Queen
('/saints/pl/saint-hedwig-the-queen_simmler.webp', 'Queen Jadwiga''s oath', 'painting', 'Saint Hedwig the Queen Painting', 'Józef Simmler', '1867', 'National Museum in Warsaw', NULL, 'Public Domain', NULL),
('/saints/pl/saint-hedwig-the-queen_bacciarelli.webp', 'Saint Hedwig the Queen', 'painting', 'Saint Hedwig the Queen Painting', 'Marcello Bacciarelli', '1768-1771', 'Royal Castle (Warsaw)', NULL, 'Public Domain', NULL),
('/saints/pl/saint-hedwig-the-queen.webp', 'Saint Hedwig the Queen', 'painting', 'Saint Hedwig the Queen Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Blessed Antoni Nowowiejski
('/saints/pl/blessed-antoni-nowowiejski.webp', 'Blessed Antoni Nowowiejski', 'painting', 'Blessed Antoni Nowowiejski Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/blessed-antoni-nowowiejski_2.webp', 'Blessed Antoni Nowowiejski', 'photograph', 'Blessed Antoni Nowowiejski Photograph', NULL, '1921', NULL, NULL, 'Public Domain', NULL),

-- Blessed Michael Kozal
('/saints/pl/blessed-michael-kozal.webp', 'Blessed Michael Kozal', 'painting', 'Blessed Michael Kozal Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/blessed-michael-kozal_2.webp', 'Blessed Michael Kozal', 'photograph', 'Blessed Michael Kozal Photograph', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Albert Chmielowski
('/saints/pl/saint-albert-chmielowski.webp', 'Saint Albert Chmielowski', 'painting', 'Saint Albert Chmielowski Painting', 'Sr. Lydia Pawełczak', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-albert-chmielowski_2.webp', 'Saint Albert Chmielowski', 'photograph', 'Saint Albert Chmielowski Photograph', NULL, '1900-1916', NULL, NULL, 'Public Domain', NULL),

-- Saint Zygmunt Gorazdowski
('/saints/pl/saint-zygmunt-gorazdowski.webp', 'Saint Zygmunt Gorazdowski', 'painting', 'Saint Zygmunt Gorazdowski Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-zygmunt-gorazdowski_2.webp', 'Saint Zygmunt Gorazdowski', 'photograph', 'Saint Zygmunt Gorazdowski Photograph', NULL, '20th Century', 'Franciscan Monastery in Sanok', NULL, 'Public Domain', NULL),

-- Saint Otto of Bamberg
('/saints/pl/saint-otto-of-bamberg.webp', 'Saint Otto of Bamberg', 'fresco', 'Saint Otto of Bamberg Fresco', NULL, '1130', 'Prüfening Abbey', NULL, 'Public Domain', NULL),
('/saints/pl/saint-otto-of-bamberg_2.webp', 'Saint Otto of Bamberg', 'painting', 'Saint Otto of Bamberg Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Blessed Maria Teresia Ledóchowska
('/saints/pl/blessed-maria-teresia-ledochowska.webp', 'Blessed Maria Teresia Ledóchowska', 'painting', 'Blessed Maria Teresia Ledóchowska Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/blessed-maria-teresia-ledochowska_2.webp', 'Blessed Maria Teresia Ledóchowska', 'photograph', 'Blessed Maria Teresia Ledóchowska Photograph', NULL, '1902', NULL, NULL, 'Public Domain', NULL),

-- Saint John of Dukla
('/saints/pl/saint-john-of-dukla_matejko.webp', 'Saint John of Dukla', 'painting', 'Saint John of Dukla Painting', 'Jan Matejko', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-john-of-dukla.webp', 'Saint John of Dukla', 'painting', 'Saint John of Dukla Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Bruno Boniface of Querfurt
('/saints/pl/saint-bruno-boniface-of-querfurt.webp', 'Saint Bruno Boniface of Querfurt', 'fresco', 'Saint Bruno Boniface of Querfurt Fresco', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/pl/saint-bruno-boniface-of-querfurt_2.webp', 'Saint Bruno Boniface of Querfurt', 'painting', 'Saint Bruno Boniface of Querfurt Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Andrzej Świerad
('/saints/pl/saint-andrzej-swierad_hadziewicz.webp', 'Saint Andrzej Świerad', 'painting', 'Saint Andrzej Świerad Painting', 'Rafał Hadziewicz', '1834-1839', 'National Museum in Kraków', NULL, 'Public Domain', NULL),
('/saints/pl/saint-andrzej-swierad-&-saint-benedict-the-hermit.webp', 'Saint Andrzej Świerad & Saint Benedict the Hermit', 'painting', 'Saint Andrzej Świerad & Saint Benedict the Hermit Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Benedict the Hermit
('/saints/pl/saint-benedict-the-hermit.webp', 'Saint Benedict the Hermit', 'painting', 'Saint Benedict the Hermit Painting', NULL, '18th Century', 'Rozalia Cemetery (Kosice)', NULL, 'Public Domain', NULL),

-- Saint Simon of Lipnica
('/saints/pl/saint-simon-of-lipnica.webp', 'Saint Simon of Lipnica', 'painting', 'Saint Simon of Lipnica Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-simon-of-lipnica_2.webp', 'Saint Simon of Lipnica', 'painting', 'Saint Simon of Lipnica Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Blessed Czesław
('/saints/pl/blessed-czeslaw_muszynski.webp', 'Blessed Czesław', 'painting', 'Blessed Czesław Painting', 'Tomasz Muszyński', '1665', 'Dominican Monastery in Lublin', NULL, 'Public Domain', NULL),
('/saints/pl/blessed-czeslaw.webp', 'Blessed Czesław', 'painting', 'Blessed Czesław Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Kinga
('/saints/pl/saint-kinga_matejko.webp', 'Saint Kinga', 'painting', 'Saint Kinga Painting', 'Jan Alojzy Matejko', '1892', NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-kinga_czarnic.webp', 'Saint Kinga', 'painting', 'Saint Kinga Painting', 'Grzegorza Czarnic', '1686', NULL, NULL, 'Public Domain', NULL),

-- Saint Hyacinth
('/saints/pl/saint-hyacinth_carracci.webp', 'Madonna and Child Appearing to Saint Hyacinth', 'painting', 'Saint Hyacinth Painting', 'Ludovico Carracci', '1594', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/pl/saint-hyacinth.webp', 'Saint Hyacinth', 'painting', 'Saint Hyacinth Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/saint-hyacinth_serre.webp', 'Miracle of Saint Hyacinth', 'painting', 'Saint Hyacinth Painting', 'Michel Serre', '1799', NULL, NULL, 'Public Domain', NULL),

-- Blessed Maria Stella
('/saints/pl/blessed-maria-stella-&-her-ten-companions.webp', 'Eleven Nuns of Nowogrodek', 'painting', 'Blessed Maria Stella Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/pl/blessed-maria-stella-&-her-ten-companions_2.webp', 'Eleven Nuns of Nowogrodek', 'painting', 'Blessed Maria Stella Painting', 'Adam Styka', '20th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/pl/blessed-maria-stella.webp', 'Blessed Maria Stella', 'photograph', 'Blessed Maria Stella Photograph', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),


-- 