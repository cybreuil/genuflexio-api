BEGIN;

-- =====
-- Roman Spain images
-- =====

INSERT INTO images (
  image_url,
  title,
  image_type,
  alt_text,
  creator,
  date_label,
  century,
  repository,
  credit,
  license,
  source_url
) VALUES

-- feast
-- jesus-christ-the-eternal-high-priest
('feasts/jesus-christ-the-eternal-high-priest.webp', 'Christ on the Cross with Saints Vincent Ferrer, John the Baptist, Mark and Antoninus', 'painting', 'Jesus Christ Painting', 'Master of the Fiesole Epiphany', '1491-1495', 15, 'Los Angeles County Museum of Art', NULL, 'Public Domain', NULL),

-- saints
-- saint-eulogius-of-cordoba
('saints/es/saint-eulogius-of-cordoba_martyr.webp', 'Saint Eulogius of Cordoba Martyr', 'painting', 'Saint Eulogius of Cordoba Painting', NULL, '17th century', 17, 'Cathedral of Córdoba', NULL, 'Public Domain', NULL),

-- saint-fructuosus & saint-augurius & saint-eulogius
('saints/es/saint-fructuosus.webp', 'Saint Fructuosus', 'painting', 'Saint Fructuosus Painting', NULL, NULL, NULL, 'Bierge (Huesca)', NULL, 'Public Domain', NULL),
('saints/es/saint-fructuous-augurius-eulogius-martyrdom.webp', 'Martyrdom of Saint Fructuous, Augurius, and Eulogius', 'painting', 'Martyrdom of Saint Fructuous, Augurius, and Eulogius Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- saint-ildephonsus-of-toledo
('saints/es/saint-ildephonsus-of-toledo_greco.webp', 'Saint Ildephonsus of Toledo', 'painting', 'Saint Ildephonsus of Toledo Painting', 'El Greco', '1603-1605', 17, 'Capilla Mayor del Hospital de la Caridad de Illescas', NULL, 'Public Domain', NULL),

-- saint-hermenegild
('saints/es/saint-hermenegild_herrera.webp', 'Saint Hermenegild', 'painting', 'Saint Hermenegild Painting', 'Francisco Herrera the Younger', '1654', 17, 'Museo del Prado', NULL, 'Public Domain', NULL),

-- saint-peter-of-saint-joseph-de-betancur
('saints/es/saint-peter-of-saint-joseph-de-betancur.webp', 'Saint Peter of Saint Joseph de Betancur', 'painting', 'Saint Peter of Saint Joseph de Betancur Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- saint-isidore-the-farmer
('saints/es/saint-isidore-the-farmer.webp', 'Saint Isidore the Farmer', 'painting', 'Saint Isidore the Farmer Painting', NULL, '19th Century', 19, NULL, NULL, 'Public Domain', NULL),

-- saint-paschal-baylon
('saints/es/saint-paschal-baylon.webp', 'Saint Paschal Baylon', 'painting', 'Saint Paschal Baylon Painting', 'Bernardo López Piquer', '1811', 19, 'Museu de Belles Arts de València', NULL, 'Public Domain', NULL),

-- saint-joaquina-vedruna
('saints/es/saint-joaquina-vedruna.webp', 'Saint Joaquina Vedruna', 'painting', 'Saint Joaquina Vedruna Painting', 'Francesc Morell i Cornet', '1903', 20, NULL, NULL, 'Public Domain', NULL),

-- saint-ferdinand
('saints/es/saint-ferdinand.webp', 'Saint Ferdinand', 'illustration', 'Saint Ferdinand Illustration', NULL, '13th Century', 13, 'Book : "Índice de los privilegios reales"', NULL, 'Public Domain', NULL),

-- saint-jose-de-anchieta
('saints/es/saint-jose-de-anchieta.webp', 'Saint José de Anchieta', 'painting', 'Saint José de Anchieta Painting', NULL, '18th Century', 18, 'Museu do Ipiranga', NULL, 'Public Domain', NULL),

-- saint-maria-micaela-of-the-blessed-sacrament
('saints/es/saint-maria-micaela-of-the-blessed-sacrament_madrazo.webp', 'Saint María Micaela of the Blessed Sacrament', 'painting', 'Saint María Micaela of the Blessed Sacrament Painting', 'Luis de Madrazo', '1865', 19, NULL, NULL, 'Public Domain', NULL),

-- saint-pelagius
('saints/es/saint-pelagius_martyr.webp', 'Martyrdom of Saint Pelagius', 'painting', 'Saint Pelagius Painting', 'Master of Becerril', '1520', 16, NULL, NULL, 'Public Domain', NULL),

-- saint-ezequiel-moreno
('saints/es/saint-ezequiel-moreno.webp', 'Saint Ezequiel Moreno', 'painting', 'Saint Ezequiel Moreno Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- saint-teresa-of-jesus-jornet-and-ibars
('saints/es/saint-teresa-of-jesus-jornet-and-ibars.webp', 'Saint Teresa of Jesus Jornet and Ibars', 'painting', 'Saint Teresa of Jesus Jornet and Ibars Painting', NULL, NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- saint-francis-borgia
('saints/es/saint-francis-borgia_cano.webp', 'Saint Francis Borgia', 'painting', 'Saint Francis Borgia Painting', 'Alonso Cano', '1624', 17, 'Museum of Fine Arts of Seville', NULL, 'Public Domain', NULL),

-- saint-thomas-of-villanova
('saints/es/saint-thomas-of-villanova.webp', 'Saint Thomas of Villanova', 'painting', 'Saint Thomas of Villanova Painting', 'Bartolomé Esteban Murillo', '1665-1670', 17, NULL, NULL, 'Public Domain', NULL),

-- saint-soledad-torres-acosta
('saints/es/saint-soledad-torres-acosta.webp', 'Saint Soledad Torres Acosta', 'painting', 'Saint Soledad Torres Acosta Painting', '1890', 19, NULL, NULL, NULL, 'Public Domain', NULL),

-- saint-peter-of-alcantara
('saints/es/saint-peter-of-alcantara.webp', 'Saint Peter of Alcantara', 'painting', 'Saint Peter of Alcantara Painting', 'Antonio Palomino', '18th Century', 18, NULL, NULL, 'Public Domain', NULL),

-- saint-leander
('saints/es/saint-leander_murillo.webp', 'Saint Leander', 'painting', 'Saint Leander Painting', 'Bartolomé Esteban Murillo', '1655', 17, 'Seville Cathedral', NULL, 'Public Domain', NULL),

-- saint-eulalia-of-merida
('saints/es/saint-eulalia-of-merida_martyr.webp', 'Saint Eulalia of Merida Martyr', 'painting', 'Saint Eulalia of Merida Painting', 'Gabriel Palencia y Ubanell', '1895', 19, 'Museo del Prado', NULL, 'Museo del Prado', NULL);

COMMIT;
