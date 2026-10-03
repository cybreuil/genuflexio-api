BEGIN;

-- =========================================================
-- Roman saints images
-- =========================================================
-- Convention:
-- - image_url served from /public (store as /saints/...)
-- - images table: one row per unique artwork
-- - saint_images: junction table allowing one image to be linked to multiple saints
--
-- NOTE:
-- all apostles painted by Rubens
-- all evangelists by Hals
-- all apostles by La Tour painted as well (some paintings missing)
-- =========================================================


-- =============================================================
-- PART 1 : IMAGES (unique artworks)
-- One row per unique image_url. Shared images are inserted once.
-- =============================================================

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

-- =========================
-- Christ
-- =========================


-- =========================
-- Principal Roman saints (Mary, Joseph, John the Baptist)
-- =========================

-- Saint Mary
('/saints/saint-mary_tiepolo.webp', 'The Immaculate Conception', 'painting', 'The Immaculate Conception Painting', 'Giambattista Tiepolo', '1748', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-mary_velazquez.webp', 'The Coronation of the Virgin', 'painting', 'The Coronation of the Virgin Painting', 'Diego Velázquez', '1645-1650', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-mary_caravaggio_annunciation.webp', 'The Annunciation', 'painting', 'The Annunciation Painting', 'Caravaggio', '1608', 'Musée des Beaux-Arts de Nancy', NULL, 'Public Domain', NULL),
('/saints/saint-mary_raphael.webp', 'The Sistine Madonna', 'painting', 'The Sistine Madonna Painting', 'Raphael', '1513-1514', 'Gemäldegalerie Alte Meister', NULL, 'Public Domain', NULL),
('/saints/saint-mary_caravaggio_madonna-di-loreto.webp', 'Madonna di Loreto', 'painting', 'Madonna di Loreto Painting', 'Caravaggio', '1606', 'Sant''Agostino (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-mary_caravaggio_madonna-of-the-rosary.webp', 'Madonna of the Rosary', 'painting', 'Madonna of the Rosary Painting', 'Caravaggio', '1607', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-mary_botticelli_madonna-of-the-book.webp', 'The Madonna of the Book', 'painting', 'The Madonna of the Book Painting', 'Sandro Botticelli', '1480-1481', 'Museo Poldi Pezzoli', NULL, 'Public Domain', NULL),
('/saints/saint-mary_botticelli_magnificat.webp', 'The Madonna of the Magnificat', 'painting', 'The Madonna of the Magnificat Painting', 'Sandro Botticelli', '1481', 'Uffizi Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-mary_sassoferrato.webp', 'The Virgin in Prayer', 'painting', 'The Virgin in Prayer Painting', 'Sassoferrato', '1640-1650', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-mary_murillo.webp', 'The Immaculate Conception', 'painting', 'The Immaculate Conception Painting', 'Bartolomé Esteban Murillo', '1678', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-mary_guido-reni.webp', 'The Assumption of the Virgin', 'painting', 'The Assumption of the Virgin Painting', 'Guido Reni', '1637-1638', 'The Städel Museum', NULL, 'Public Domain', NULL),
('/saints/saint-mary_caravaggio_dormition.webp', 'The Dormition of the Virgin', 'painting', 'The Dormition of the Virgin Painting', 'Caravaggio', '1606-1607', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-mary_velazquez_adoration.webp', 'The Adoration of the Magi', 'painting', 'The Adoration of the Magi Painting', 'Diego Velázquez', '1619', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-mary_champaigne.webp', 'Madonna and Child', 'painting', 'Madonna and Child Painting', 'Philippe de Champaigne', '17th Century', 'Musée des Beaux-Arts d''Agen', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-mary_gentileschi_annunciation.webp', 'The Annunciation', 'painting', 'The Annunciation Painting', 'Orazio Gentileschi', '1623', 'Galleria Sabauda', NULL, 'Public Domain', NULL),

-- Saint Joseph
('/saints/saint-joseph_guido-reni.webp', 'Saint Joseph and the Christ Child', 'painting', 'Saint Joseph and the Christ Child Painting', 'Guido Reni', '1640', 'Museum of Fine Arts of Houston', NULL, 'Public Domain', NULL),
('/saints/saint-joseph_carracci.webp', 'The Holy Family', 'painting', 'The Holy Family Painting', 'Annibale Carracci', '1596-1597', 'Borghese Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-joseph_murillo.webp', 'Saint Joseph and the Christ Child', 'painting', 'Saint Joseph and the Christ Child', 'Bartolomé Esteban Murillo', '1670-1675', 'The John and Mable Ringling Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-joseph_murillo_holy-family.webp', 'The Holy Family', 'painting', 'The Holy Family Painting', 'Bartolomé Esteban Murillo', '1640-1649', 'National Gallery of Ireland', NULL, 'Public Domain', NULL),
('/saints/saint-joseph_la-tour.webp', 'Joseph the Carpenter', 'painting', 'Joseph the Carpenter Painting', 'Georges de La Tour', '1640-1645', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-joseph_champaigne.webp', 'The Dream of Saint Joseph', 'painting', 'The Dream of Saint Joseph Painting', 'Philippe de Champaigne', '1642-1643', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-joseph_briggs.webp', 'The Lily and the Carpenter', 'painting', 'The Lily and the Carpenter Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),

-- Saint John the Baptist
('/saints/saint-john-the-baptist_caravaggio.webp', 'Saint John the Baptist in the Wilderness', 'painting', 'Saint John the Baptist in the Wilderness Painting', 'Caravaggio', '1604-1605', 'Nelson-Atkins Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-john-the-baptist_leonardo-da-vinci.webp', 'Saint John the Baptist', 'painting', 'Saint John the Baptist Painting', 'Leonardo da Vinci', '1513-1516', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-john-the-baptist_lemoine.webp', 'Saint John the Baptist', 'painting', 'Saint John the Baptist Painting', 'François Lemoine', '1726', 'Saint-Eustache (Paris)', NULL, 'Public Domain', NULL),
('/saints/saint-john-the-baptist_tanzio.webp', 'Saint John the Baptist', 'painting', 'Saint John the Baptist Painting', 'Tanzio da Varallo', '1627-1629', 'Philbrook Museum of Art', NULL, 'Public Domain', NULL),

-- =========================
-- January saints
-- =========================

-- Saint Basil the Great
('/saints/saint-basil-the-great_domenichino_grottaferrata.webp', 'Saint Basil the Great', 'fresco', 'Saint Basil the Great Fresco', 'Domenichino', '1609-1612', 'Grottaferrata Abbey', NULL, 'Public Domain', NULL),
('/saints/saint-basil-the-great.webp', 'Saint Basil the Great', 'painting', 'Saint Basil the Great Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-basil-the-great_mosaic.webp', 'Saint Basil the Great', 'mosaic', 'Saint Basil the Great Mosaic', NULL, '11th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Gregory Nazianzen
('/saints/saint-gregory-nazianzen_domenichino_grottaferrata.webp', 'Saint Gregory Nazianzen', 'fresco', 'Saint Gregory Nazianzen Fresco', 'Domenichino', '1609-1612', 'Grottaferrata Abbey', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-nazianzen.webp', 'Saint Gregory Nazianzen', 'fresco', 'Saint Gregory Nazianzen Fresco', NULL, '14th century', 'Kariye Camii (Istanbul)', NULL, 'Public Domain', NULL),

-- Saint Raymond of Penyafort
('/saints/saint-raymond-of-penyafort_francisco-de-reyna.webp', 'Saint Raymond of Penyafort', 'painting', 'Saint Raymond of Penyafort Painting', 'Francisco de Reyna', '17th century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-raymond-of-penyafort_tommaso-dolabella.webp', 'Saint Raymond of Penyafort', 'painting', 'Saint Raymond of Penyafort Painting', 'Tommaso Dolabella', '1627', 'Church of the Holy Trinity (Kraków)', NULL, 'Public Domain', NULL),

-- Saint Hilary of Poitiers
('/saints/saint-hilary-of-poitiers_cremiere.webp', 'Saint Hilary of Poitiers', 'painting', 'Saint Hilary of Poitiers Painting', 'Pierre-Floréal Crémière', '1846', 'Saint-Hilaire du Martray (Loudun)', NULL, 'Public Domain', NULL),
('/saints/saint-hilary-of-poitiers.webp', 'Saint Hilary of Poitiers', 'icon', 'Saint Hilary of Poitiers Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Anthony, Abbot
('/saints/saint-anthony-abbot_zurbaran.webp', 'Saint Anthony, Abbot', 'painting', 'Saint Anthony the Great Painting', 'Francisco de Zurbarán', '1640', 'Uffizi Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-abbot_icon.webp', 'Saint Anthony, Abbot', 'icon', 'Saint Anthony the Great Icon', 'Michael Damaskinos', '16th Century', 'Byzantine and Christian Museum (Athens)', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-abbot_osservanza-master_gold-temptation.webp', 'The Gold Temptation of Saint Anthony', 'painting', 'The Temptation of Saint Anthony Painting', 'Osservanza Master', '1435-1440', 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-abbot_osservanza-master_woman-temptation.webp', 'The Woman Temptation of Saint Anthony', 'painting', 'The Temptation of Saint Anthony Painting', 'Osservanza Master', '1435-1440', 'Yale University Art Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-abbot_bosch.webp', 'The Temptation of Saint Anthony', 'painting', 'The Temptation of Saint Anthony Painting', 'Hieronymus Bosch', '16th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),
-- also linked to saint-cornelius and saint-cyprian below
('/saints/saint-anthony-abbot-&-cornelius-&-cyprian_veronese.webp', 'Saint Anthony the Great with Saints Cornelius and Cyprian', 'painting', 'Saint Anthony the Great with Saints Cornelius and Cyprian Painting', 'Paolo Veronese', '1565-1571', 'Pinacoteca di Brera (Milan)', NULL, 'Public Domain', NULL),

-- Saint Fabian Pope
('/saints/saint-fabian-pope.webp', 'Saint Fabian, Pope', 'painting', 'Saint Fabian Pope Painting', 'Giovanni di Paolo', '15th Century', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-fabian-pope_master-of-messkirch.webp', 'Saint Fabian, Pope', 'painting', 'Saint Fabian Pope Painting', 'Master of Messkirch', '16th Century', 'Veste Coburg Art Collections', NULL, 'Public Domain', NULL),

-- Saint Sebastian
('/saints/saint-sebastian_sodoma.webp', 'Saint Sebastian', 'painting', 'Saint Sebastian Painting', 'Il Sodoma', '1525', 'Uffizi Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-sebastian_guido-reni.webp', 'Saint Sebastian', 'painting', 'Saint Sebastian Painting', 'Guido Reni', '1615', 'Musei di Strada Nuova', NULL, 'Public Domain', NULL),
('/saints/saint-sebastian_ribera.webp', 'Saint Sebastian', 'painting', 'Saint Sebastian Painting', 'Jusepe de Ribera', '1636', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-sebastian_rubens.webp', 'Saint Sebastian', 'painting', 'Saint Sebastian Painting', 'Peter Paul Rubens', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),

-- Saint Agnes of Rome
('/saints/saint-agnes-of-rome_domenichino.webp', 'Saint Agnes of Rome', 'painting', 'Saint Agnes of Rome Painting', 'Domenichino', '1620', 'Royal Collection of the British Royal Family', NULL, 'Public Domain', NULL),
('/saints/saint-agnes-of-rome_massimo-stanzione.webp', 'Saint Agnes of Rome', 'painting', 'Saint Agnes of Rome Painting', 'Massimo Stanzione', '1635-1640', 'Museu Nacional d''Art de Catalunya', NULL, 'Public Domain', NULL),
('/saints/saint-agnes-of-rome_andrea-del-sarto.webp', 'Saint Agnes of Rome', 'painting', 'Saint Agnes of Rome Painting', 'Andrea del Sarto', '16th Century', 'Pisa Cathedral', NULL, 'Public Domain', NULL),

-- Saint Vincent of Saragossa
('/saints/saint-vincent-of-saragossa_tomas-giner.webp', 'Saint Vincent of Saragossa', 'painting', 'Saint Vincent of Saragossa Painting', 'Tomás Giner', '1462-1466', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-vincent-of-saragossa_school-of-francisco-ribalta.webp', 'Saint Vincent of Saragossa', 'painting', 'Saint Vincent of Saragossa Painting', 'School of Francisco Ribalta', '17th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),

-- Saint Francis de Sales
('/saints/saint-francis-de-sales.webp', 'Saint Francis de Sales', 'painting', 'Saint Francis de Sales Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-francis-de-sales_2.webp', 'Saint Francis de Sales', 'painting', 'Saint Francis de Sales Painting', NULL, '17th Century', 'Château de Bussy-Rabutin', NULL, 'Public Domain', NULL),
('/saints/saint-francis-de-sales_briggs.webp', 'Saint Francis de Sales by Gwyneth Thompson Briggs', 'painting', 'Saint Francis de Sales Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-francis-de-sales_brenet.webp', 'Saint Francis de Sales', 'painting', 'Saint Francis de Sales Painting', 'Nicolas Guy Brenet', '18th Century', 'Château de Blois', NULL, 'Public Domain', NULL),
-- also linked to saint-jane-frances-de-chantal below
('/saints/saint-francis-de-sales-&-jane-frances-de-chantal_bayeu.webp', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal', 'painting', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal Painting', 'Francisco Bayeu', '18th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-francis-de-sales-&-jane-frances-de-chantal_halle.webp', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal', 'painting', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal Painting', 'Noël Hallé', '18th Century', 'Saint-Louis-en-l''Île Church', NULL, 'Public Domain', NULL),
('/saints/saint-francis-de-sales-&-jane-frances-de-chantal.webp', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal', 'painting', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal Painting', NULL, NULL, 'Monastery of the Visitation (Paris)', NULL, 'Public Domain', NULL),

-- Saint Paul, Apostle
('/saints/saint-paul-apostle_rubens.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Peter Paul Rubens', '1611-1612', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_ribera.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Jusepe de Ribera', '1615-1616', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_velasquez.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Diego Velázquez', '1619-1620', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_zurbaran.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art', NULL, 'Attribution 3.0 Unported', NULL),
('/saints/saint-paul-apostle_dyck.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Anthony van Dyck', '1618-1620', 'Landesmuseum Hannover', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_caravaggio_conversion.webp', 'The Conversion of Saint Paul', 'painting', 'The Conversion of Saint Paul Painting', 'Caravaggio', '1601', 'Odescalchi Balbi Collection', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_rembrandt_prison.webp', 'The Apostle Paul in Prison', 'painting', 'The Apostle Paul in Prison Painting', 'Rembrandt', '1627', 'Rijksmuseum', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_rembrandt.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Rembrandt', '1657', 'National Gallery of Art (Washington, D.C.)', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_la-tour.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Georges de La Tour', '1820', 'Musée Toulouse-Lautrec', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_guercino.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Il Guercino', '1650', 'Royal Collection of the British Royal Family', NULL, 'Public Domain', NULL),
('/saints/saint-paul-apostle_guercino_2.webp', 'Saint Paul the Apostle', 'painting', 'Saint Paul Apostle Painting', 'Il Guercino', '17th Century', 'Slovak National Gallery', NULL, 'Public Domain', NULL),
-- also linked to saint-barnabas-apostle below
('/saints/saint-paul-apostle-&-barnabas.webp', 'Saint Paul and Saint Barnabas in Lystra', 'painting', 'Saint Paul and Saint Barnabas in Lystra Painting', 'Claude-Guy Hallé', '1717', 'Musée Carnavalet', NULL, 'Public Domain', NULL),

-- Saint Timothy of Ephesus
('/saints/saint-timothy-of-ephesus_icon.webp', 'Saint Timothy of Ephesus', 'icon', 'Saint Timothy of Ephesus Icon', NULL, NULL, 'an Orthodox Parish (USA)', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-timothy-of-ephesus_drost_timothy-with-grandmother-lois.webp', 'Saint Timothy of Ephesus', 'painting', 'Saint Timothy of Ephesus with his Grandmother Lois Painting', 'Willem Drost', '1650', 'Hermitage Museum', NULL, 'Public Domain', NULL),
-- NOTE: data correction applied — original had creator=''1803'' (clearly a date), fixed to date_label=''1803'' and license=''Public Domain''
('/saints/saint-timothy-of-ephesus.webp', 'Saint Timothy of Ephesus', 'painting', 'Saint Timothy of Ephesus Painting', NULL, '1803', 'Basilica of Santa Pudentiana (Rome)', NULL, 'Public Domain', NULL),

-- Saint Titus of Crete
('/saints/saint-titus-of-crete_icon.webp', 'Saint Titus of Crete', 'icon', 'Saint Titus of Crete Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-titus-of-crete.webp', 'Saint Titus of Crete', 'painting', 'Saint Titus of Crete Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Angela Merici
('/saints/saint-angela-merici.webp', 'Saint Angela Merici', 'painting', 'Saint Angela Merici Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-angela-merici_crucifix.webp', 'Saint Angela Merici', 'painting', 'Saint Angela Merici Painting', NULL, '17th Century', NULL, NULL, 'Creative Commons Attribution', NULL),

-- Saint Thomas Aquinas
('/saints/saint-thomas-aquinas.webp', 'Saint Thomas Aquinas', 'painting', 'Saint Thomas Aquinas Painting', 'Carlo Crivelli', '1476', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-aquinas_velasquez_temptation.webp', 'The temptation of Saint Thomas Aquinas', 'painting', 'The Temptation of Saint Thomas Aquinas Painting', 'Diego Velázquez', '1632', 'Orihuela Cathedral Museum', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-aquinas_tito.webp', 'The Vision of Saint Thomas Aquinas', 'painting', 'The Vision of Saint Thomas Aquinas Painting', 'Santi di Tito', '1593', 'Basilica of Saint Mark (Florence)', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-aquinas_zurbaran.webp', 'The Apotheosis of Saint Thomas Aquinas', 'painting', 'The Apotheosis of Saint Thomas Aquinas Painting', 'Francisco de Zurbarán', '1631', 'Museum of Fine Arts of Seville', NULL, 'Public Domain', NULL),

-- Saint John Bosco
('/saints/saint-john-bosco_painting-from-picture.webp', 'Saint John Bosco', 'painting', 'Saint John Bosco Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-bosco_picture.webp', 'Saint John Bosco', 'photograph', 'Saint John Bosco Picture', 'Carlo Felice', '1880', NULL, NULL, 'Public Domain', NULL),

-- =========================
-- February saints
-- =========================

-- Saint Blaise
('/saints/saint-blaise_trotti.webp', 'Saint Blaise', 'painting', 'Saint Blaise Painting', 'Giovanni Battista Trotti', '1590', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-blaise_tiepolo.webp', 'Saint Blaise', 'painting', 'Saint Blaise Painting', 'Giambattista Tiepolo', '1734', 'Ca'' Rezzonico', NULL, 'Public Domain', NULL),

-- Saint Ansgar
('/saints/saint-ansgar.webp', 'Saint Ansgar', 'painting', 'Saint Ansgar Painting', 'Hans Bornemann', '1457', 'Church Trinitatis (Hamburg)', NULL, 'Public Domain', NULL),

-- Saint Agatha
('/saints/saint-agatha.webp', 'The Martyrdom of Saint Agatha', 'painting', 'The Martyrdom of Saint Agatha Painting', 'Massimo Stanzione', '1619', 'Museo Nazionale di Capodimonte', NULL, 'Public Domain', NULL),
('/saints/saint-agatha_tiepolo.webp', 'The Martyrdom of Saint Agatha', 'painting', 'The Martyrdom of Saint Agatha Painting', 'Giambattista Tiepolo', '1756', 'Gemäldegalerie', NULL, 'Public Domain', NULL),

-- Saint Paul Miki
('/saints/saint-paul-miki_tanzio.webp', 'The Martyrdom of Saint Paul Miki & Companions', 'painting', 'The Martyrdom of Saint Paul Miki & Companions Painting', 'Tanzio da Varallo', '1625-1632', 'Pinacoteca di Brera', NULL, 'Public Domain', NULL),
('/saints/saint-paul-miki.webp', 'Saint Paul Miki', 'painting', 'Saint Paul Miki Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Jerome Emiliani (need double checking)
('/saints/saint-jerome-emiliani_traverso.webp', 'Saint Jerome Emiliani presents the orphans to the Virgin', 'painting', 'Saint Jerome Emiliani presents the orphans to the Virgin Painting', 'Mattia Traverso', '1943', 'Church of Santa Maria del Popolo (Cherasco)', NULL, 'Public Domain', NULL),
('/saints/saint-jerome-emiliani_crespi.webp', 'Saint Jerome Emiliani', 'painting', 'Saint Jerome Emiliani Painting', 'Daniele Crespi', '1620', 'Vercurago', NULL, 'Public Domain', NULL),
('/saints/saint-jerome-emiliani.webp', 'Saint Jerome Emiliani', 'painting', 'Saint Jerome Emiliani Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-jerome-emiliani_2.webp', 'Saint Jerome Emiliani', 'painting', 'Saint Jerome Emiliani Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Josephine Bakhita (need small watermark correction)
('/saints/saint-josephine-bakhita_ferreira.webp', 'Saint Josephine Bakhita', 'painting', 'Saint Josephine Bakhita Painting', NULL, '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-josephine-bakhita_warford_no-watermark.webp', 'Saint Josephine Bakhita', 'painting', 'Saint Josephine Bakhita Painting', NULL, '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-josephine-bakhita.webp', 'Saint Josephine Bakhita Portrait', NULL, 'Saint Josephine Bakhita Portrait', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Scholastica
('/saints/saint-scholastica_bergl.webp', 'Saint Scholastica', 'painting', 'Saint Scholastica Painting', 'Johann Baptist Wenzel Bergl', '1765', 'Basilica of Kleinmariazell', NULL, 'Public Domain', NULL),
('/saints/saint-scholastica.webp', 'Saint Scholastica', 'painting', 'Saint Scholastica Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-scholastica_sassoferrato.webp', 'Saint Scholastica', 'painting', 'Saint Scholastica Painting', 'Sassoferrato', '17th Century', 'Museum of Fine Arts of Lyon', NULL, 'Public Domain', NULL),
('/saints/saint-scholastica_briggs.webp', 'Saint Scholastica', 'painting', 'Saint Scholastica Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),
-- also linked to saint-benedict below
('/saints/saint-benedict-&-scholastica.webp', 'Saint Benedict and Saint Scholastica', 'painting', 'Saint Benedict and Saint Scholastica Painting', 'Yan'' Dargent', '19th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Cyril (brother of Saint Methodius)
('/saints/saint-cyril.webp', 'Saint Cyril', 'icon', 'Saint Cyril Icon', NULL, NULL, 'Holy Mount of Grabarka (Poland)', NULL, 'Public Domain', NULL),
-- also linked to saint-methodius below
('/saints/saint-cyril-&-methodius.webp', 'Saint Cyril and Saint Methodius', 'painting', 'Saint Cyril and Saint Methodius Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cyril-&-methodius_2.webp', 'Saint Cyril and Saint Methodius', 'icon', 'Saint Cyril and Saint Methodius Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cyril-&-methodius_3.webp', 'Saint Cyril and Saint Methodius', 'icon', 'Saint Cyril and Saint Methodius Icon', NULL, NULL, 'Holy Trinity Monastery (New York)', NULL, 'Public Domain', NULL),

-- Saint Methodius (brother of Saint Cyril)
('/saints/saint-methodius.webp', 'Saint Methodius', 'icon', 'Saint Methodius Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Peter Damian
('/saints/saint-peter-damian.webp', 'Saint Peter Damian', 'painting', 'Saint Peter Damian Painting', 'Andrea Barbiani', '18th Century', 'Biblioteca Classense', NULL, 'Public Domain', NULL),
('/saints/saint-peter-damian_briggs.webp', 'Saint Peter Damian', 'painting', 'Saint Peter Damian Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Polycarp
('/saints/saint-polycarp.webp', 'Saint Polycarp', 'icon', 'Saint Polycarp Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-polycarp_2.webp', 'Saint Polycarp', 'icon', 'Saint Polycarp Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-polycarp_3.webp', 'Saint Polycarp', 'icon', 'Saint Polycarp Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Gregory of Narek
('/saints/saint-gregory-of-narek_minin.webp', 'Saint Gregory of Narek', 'painting', 'Saint Gregory of Narek Painting', 'Sergei Minin', '2004', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-gregory-of-narek.webp', 'Saint Gregory of Narek', 'painting', 'Saint Gregory of Narek Painting', 'Arshak Fetvadjian', '20th Century', NULL, NULL, 'Public Domain', NULL),

-- =========================
-- March saints
-- =========================

-- Saint Casimir
('/saints/saint-casimir_masucci.webp', 'Saint Casimir', 'painting', 'Saint Casimir Painting', 'Agostino Masucci', '18th Century', 'Royal Castle in Warsaw', NULL, 'Public Domain', NULL),
('/saints/saint-casimir_collenius.webp', 'Saint Casimir', 'painting', 'Saint Casimir Painting', 'Hermannus Collenius', '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-casimir.webp', 'Saint Casimir', 'painting', 'Saint Casimir Painting', NULL, '1594', 'Vilnius Cathedral', NULL, 'Public Domain', NULL),

-- Saint Perpetua
('/saints/saint-perpetua_ridolfi.webp', 'Saint Perpetua', 'painting', 'Saint Perpetua Painting', 'Antonio Ridolfi', '1857', 'Istituto d''Arte de Sienne', NULL, 'Public Domain', NULL),
-- fixed: was '/saint-perpetua_bouguereau.webp' (missing /saints/ prefix)
('/saints/saint-perpetua_bouguereau.webp', 'Saint Perpetua', 'painting', 'Saint Perpetua Painting', 'William-Adolphe Bouguereau', '1877', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-perpetua_mosaic.webp', 'Saint Perpetua', 'mosaic', 'Saint Perpetua Mosaic', NULL, NULL, 'Euphrasian Basilica (Croatia)', NULL, 'Public Domain', NULL),
-- also linked to saint-felicity below
('/saints/saint-perpetua-&-felicity.webp', 'Saint Perpetua and Saint Felicity', 'painting', 'Saint Perpetua and Saint Felicity Painting', NULL, '1520', 'National Museum in Warsaw', NULL, 'Public Domain', NULL),
('/saints/saint-perpetua_martyr.webp', 'The Martyrdom of Saint Perpetua', 'painting', 'The Martyrdom of Saint Perpetua Painting', NULL, '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-perpetua-&-felicity_2.webp', 'Saint Perpetua and Saint Felicity', 'mosaic', 'Saint Perpetua and Saint Felicity Mosaic', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-perpetua-&-felicity_3.webp', 'Saint Perpetua and Saint Felicity', 'mosaic', 'Saint Perpetua and Saint Felicity Mosaic', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint John of God
('/saints/saint-john-of-god_murillo.webp', 'Saint John of God', 'painting', 'Saint John of God Painting', 'Bartolomé Esteban Murillo', '1672', 'Hospital de la Caridad', NULL, 'Public Domain', NULL),
('/saints/saint-john-of-god_coello.webp', 'Saint John of God with an Angel', 'painting', 'Saint John of God Painting', 'Claudio Coello', '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-of-god_gonzalez.webp', 'Saint John of God', 'painting', 'Saint John of God Painting', 'Manuel Gómez-Moreno González', '1880', 'Museo de Bellas Artes de Granada', NULL, 'Public Domain', NULL),

-- Saint Frances of Rome
('/saints/saint-frances-of-rome_sparadino.webp', 'Saint Frances of Rome with the Angel', 'painting', 'Saint Frances of Rome with the Angel Painting', 'lo Sparadino', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-frances-of-rome_gentileschi.webp', 'Saint Frances of Rome', 'painting', 'Saint Frances of Rome Painting', 'Orazio Gentileschi', '1620', 'Galleria Nazionale delle Marche', NULL, 'Public Domain', NULL),
('/saints/saint-frances-of-rome_poussin.webp', 'Saint Frances Announcing the End of the Plague in Rome', 'painting', 'Saint Frances Announcing the End of the Plague in Rome Painting', 'Nicolas Poussin', '1657', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-frances-of-rome.webp', 'Saint Frances of Rome', 'painting', 'Saint Frances of Rome Painting', NULL, '1650', NULL, NULL, 'Public Domain', NULL),

-- Saint Patrick
('/saints/saint-patrick.webp', 'Saint Patrick and the Snakes', 'painting', 'Saint Patrick and the Snakes Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-patrick_tiepolo.webp', 'Saint Patrick', 'painting', 'Saint Patrick Painting', 'Giambattista Tiepolo', '1746', 'Musei Civici di Padova', NULL, 'Public Domain', NULL),
('/saints/saint-patrick_collaert.webp', 'Saint Patrick', 'painting', 'Saint Patrick Painting', 'Adriaen Collaert', '1603', 'National Gallery of Ireland', NULL, 'Public Domain', NULL),
('/saints/saint-patrick_stained-glass.webp', 'Saint Patrick', 'stained_glass', 'Saint Patrick Stained Glass', NULL, NULL, 'Saint Patrick Catholic Church (Ohio)', NULL, 'Public Domain', NULL),

-- Saint Cyril of Jerusalem
('/saints/saint-cyril-of-jerusalem_bartolozzi.webp', 'Saint Cyril of Jerusalem', 'painting', 'Saint Cyril of Jerusalem Painting', 'Francesco Bartolozzi', '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cyril-of-jerusalem.webp', 'Saint Cyril of Jerusalem', 'fresco', 'Saint Cyril of Jerusalem Fresco', NULL, '14th Century', 'an Orthodox Church', NULL, 'Public Domain', NULL),
('/saints/saint-cyril-of-jerusalem_2.webp', 'Saint Cyril of Jerusalem', 'icon', 'Saint Cyril of Jerusalem Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Turibius of Mogrovejo
('/saints/saint-turibius-of-mogrovejo.webp', 'Saint Turibius of Mogrovejo', 'painting', 'Saint Turibius of Mogrovejo Painting', NULL, '17th Century', 'Museo Nacional de Bellas Artes (Buenos Aires)', NULL, 'Public Domain', NULL),
('/saints/saint-turibius-of-mogrovejo_conca.webp', 'The Miracle of Saint Turibius of Mogrovejo', 'painting', 'The Miracle of Saint Turibius of Mogrovejo Painting', 'Sebastiano Conca', '1723', 'Musei Vaticani', NULL, 'Public Domain', NULL),

-- =========================
-- April saints
-- =========================

-- Saint Francis of Paola
('/saints/saint-francis-of-paola_ribera.webp', 'Saint Francis of Paola', 'painting', 'Saint Francis of Paola Painting', 'Jusepe de Ribera', '1652', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-paola_bianchi.webp', 'Saint Francis of Paola in Ecstasy', 'painting', 'Saint Francis of Paola in Ecstasy Painting', 'Pietro Bianchi', '1728', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-paola_gandolfi.webp', 'The Vision of Saint Francis of Paola', 'painting', 'The Vision of Saint Francis of Paola Painting', 'Ubaldo Gandolfi', '1778', 'Pinacoteca Nazionale di Bologna', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-paola_giordano.webp', 'Saint Francis of Paola crosses the straits of Messina', 'painting', 'Saint Francis of Paola crosses the straits of Messina Painting', NULL, '1692', 'Private Collection', NULL, 'Public Domain', NULL),

-- Saint Isidore
('/saints/saint-isidore_murillo.webp', 'Saint Isidore', 'painting', 'Saint Isidore Painting', 'Bartolomé Esteban Murillo', '1655', 'Seville Cathedral', NULL, 'Public Domain', NULL),
('/saints/saint-isidore_pacully.webp', 'Saint Isidore', 'painting', 'Saint Isidore Painting', 'Master of the Pacully collection', '1480-1490', 'National Museum of Sculpture (Valladolid)', NULL, 'Public Domain', NULL),

-- Saint Vincent Ferrer
('/saints/saint-vincent-ferrer_miranda.webp', 'Saint Vincent Ferrer', 'painting', 'Saint Vincent Ferrer Painting', 'Juan Carreño de Miranda', '1661', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-vincent-ferrer_pace.webp', 'Saint Vincent Ferrer', 'painting', 'Saint Vincent Ferrer Painting', 'Ranieri Del Pace', '1709', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-vincent-ferrer_cano.webp', 'Saint Vincent Ferrer Preaching', 'painting', 'Saint Vincent Ferrer Preaching Painting', 'Alonso Cano', '1644-1645', 'Fundación Banco Santander', NULL, 'Public Domain', NULL),
('/saints/saint-vincent-ferrer_juanes.webp', 'Saint Vincent Ferrer', 'painting', 'Saint Vincent Ferrer Painting', 'Juan de Juanes', '1445-1450', 'Private Collection', NULL, 'Public Domain', NULL),

-- Saint John Baptist de La Salle
('/saints/saint-john-baptist-de-la-salle.webp', 'Saint John Baptist de la Salle', 'painting', 'Saint John Baptist de la Salle Painting', NULL, '19th Century', 'Private collection', NULL, 'Public Domain', NULL),
('/saints/saint-john-baptist-de-la-salle_muller.webp', 'Saint John Baptist de la Salle, engraving by Chapon, from a Painting by Charles Muller', 'engraving', 'Saint John Baptist de la Salle Engraving', 'Chapon', '1887', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-baptist-de-la-salle_2.webp', 'Saint John Baptist de la Salle', 'painting', 'Saint John Baptist de la Salle Painting', 'Gagliardi Giovanni', '20th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Stanislaus
('/saints/saint-stanislaus_samostrzelnik.webp', 'Saint Stanislaus', 'painting', 'Saint Stanislaus Painting', 'Stanisław Samostrzelnik', '1530-1535', 'National Library of Poland', NULL, 'Public Domain', NULL),
('/saints/saint-stanislaus.webp', 'Saint Stanislaus', 'painting', 'Saint Stanislaus Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Martin I
('/saints/saint-martin-i_montor.webp', 'Saint Martin I', 'illustration', 'Saint Martin I Illustration', 'Alexis-François Artaud de Montor', '1842', 'Book : "The Lives and Times of the Popes"', NULL, 'Public Domain', NULL),
('/saints/saint-martin-i_stained-glass.webp', 'Saint Martin I', 'stained_glass', 'Saint Martin I Stained Glass', NULL, '1888', 'Saint Martin Church (Arc-en-Barrois)', NULL, 'Public Domain', NULL),
('/saints/saint-martin-i.webp', 'Saint Martin I', 'mosaic', 'Saint Martin I Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),

-- Saint Anselm
('/saints/saint-anselm_glover.webp', 'Saint Anselm', 'engraving', 'Saint Anselm Engraving', 'George Glover', '17th Century', 'National Portrait Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-anselm.webp', 'Saint Anselm', 'painting', 'Saint Anselm Painting', NULL, NULL, 'Chiesa di S. Anselmo (Bomarzo)', NULL, 'Public Domain', NULL),

-- Saint George
('/saints/saint-george_raphael.webp', 'Saint George and the Dragon', 'painting', 'Saint George and the Dragon Painting', 'Raphael', '1505-1506', 'National Gallery of Art (Washington, D.C.)', NULL, 'Public Domain', NULL),
('/saints/saint-george_martorell.webp', 'Saint George and the Dragon', 'painting', 'Saint George and the Dragon Painting', 'Bernat Martorell', '1434-1435', 'Art Institute of Chicago', NULL, 'Public Domain', NULL),
('/saints/saint-george_rubens.webp', 'Saint George Battles the Dragon', 'painting', 'Saint George Battles the Dragon Painting', 'Peter Paul Rubens', '1606-1608', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-george_moreau.webp', 'Saint George and the Dragon', 'painting', 'Saint George Slaying the Dragon Painting', 'Gustave Moreau', '1889-1890', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-george_schut.webp', 'The Beheading of Saint George', 'painting', 'The Beheading of Saint George Painting', 'Cornelis Schut', '1643', 'Royal Museum of Fine Arts Antwerp', NULL, 'Public Domain', NULL),
('/saints/saint-george_domenichino.webp', 'Saint George', 'painting', 'Saint George Painting', 'Domenichino', '17th Century', NULL, NULL, 'Public Domain', NULL),
-- Not really catholic
-- ('/saints/saint-george_rossetti.webp', 'The Wedding of Saint George and Princess Sabra', 'painting', 'The Wedding of Saint George and Princess Sabra Painting', 'Dante Gabriel Rossetti', '1857', 'Tate Britain', NULL, 'Public Domain', NULL),
('/saints/saint-george_icon.webp', 'Saint George', 'icon', 'Saint George Byzantine Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Adalbert
('/saints/saint-adalbert_kovacz.webp', 'Saint Adalbert', 'painting', 'Saint Adalbert Painting', 'Mihály Kovács', '1855', 'Dobó István Castle Museum', NULL, 'Public Domain', NULL),
('/saints/saint-adalbert-&-procopius.webp', 'Saint Adalbert and Saint Procopius', 'painting', 'Saint Adalbert and Saint Procopius Painting', 'Master of Eggenburg', '1490-1500', 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),

-- Saint Fidelis of Sigmaringen
('/saints/saint-fidelis-of-sigmaringen.webp', 'The Martyrdom of Saint Fidelis of Sigmaringen', 'painting', 'The Martyrdom of Saint Fidelis of Sigmaringen Painting', NULL, '18th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-fidelis-of-sigmaringen-&-joseph-of-leonessa_tiepolo.webp', 'Saint Fidelis of Sigmaringen and Saint Joseph of Leonessa', 'painting', 'Saint Fidelis of Sigmaringen and Saint Joseph of Leonessa Painting', 'Giambattista Tiepolo', '1752-1758', 'Galleria nazionale di Parma', NULL, 'Public Domain', NULL),

-- Saint Mark the Evangelist
('/saints/saint-mark-evangelist_hals.webp', 'Saint Mark the Evangelist', 'painting', 'Saint Mark the Evangelist Painting', 'Frans Hals', '1625-1630', 'Pushkin Museum', NULL, 'Public Domain', NULL),
('/saints/saint-mark-evangelist_borovikovsky.webp', 'Saint Mark the Evangelist', 'painting', 'Saint Mark the Evangelist Painting', 'Vladimir Borovikovsky', '1804-1809', 'State Russian Museum', NULL, 'Public Domain', NULL),
('/saints/saint-mark-evangelist_tintoretto_finding.webp', 'Finding of the Body of Saint Mark', 'painting', 'Finding of the Body of Saint Mark Painting', 'Jacopo Tintoretto', '1562', 'Pinacoteca di Brera', NULL, 'Public Domain', NULL),
('/saints/saint-mark-evangelist_tintoretto_translation.webp', 'The Translation of the Body of Saint Mark', 'painting', 'The Translation of the Body of Saint Mark Painting', 'Jacopo Tintoretto', '1562-1566', 'Gallerie dell''Accademia', NULL, 'Public Domain', NULL),

-- Saint Peter Chanel
('/saints/saint-peter-chanel.webp', 'Saint Peter Chanel', 'painting', 'Saint Peter Chanel Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-peter-chanel_nicolet.webp', 'Saint Peter Chanel', 'illustration', 'Saint Peter Chanel Illustration', 'Claude Nicolet', '1923', 'Book : "Vie du bienheureux Pierre-Louis-Marie Chanel : prêtre mariste et premier martyr de l''Océanie"', NULL, 'Public Domain', NULL),

-- Saint Louis Grignion de Montfort
('/saints/saint-louis-grignion-de-montfort.webp', 'Saint Louis Grignion de Montfort', 'painting', 'Saint Louis Grignion de Montfort Painting', NULL, '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-louis-grignion-de-montfort_2.webp', 'Saint Louis Grignion de Montfort and Blessed Marie-Louise Trichet', 'illustration', 'Saint Louis Grignion de Montfort and Blessed Marie-Louise Trichet Illustration', NULL, '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-louis-grignion-de-montfort_3.webp', 'Saint Louis Grignion de Montfort', 'illustration', 'Saint Louis Grignion de Montfort Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Catherine of Siena
('/saints/saint-catherine-of-siena_dolci.webp', 'Saint Catherine of Siena', 'painting', 'Saint Catherine of Siena Painting', 'Carlo Dolci', '1665', 'Dulwich Picture Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-siena_tiepolo.webp', 'Saint Catherine of Siena', 'painting', 'Saint Catherine of Siena Painting', 'Giambattista Tiepolo', '1746', 'Gemäldegalerie (Berlin)', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-siena.webp', 'Saint Catherine of Siena', 'painting', 'Saint Catherine of Siena Painting', NULL, '19th Century', 'Santa Maria del Rosario in Prati', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-siena-&-rose-of-lima-&-agnes-of-montepulciano_tiepolo.webp', 'The Virgin Appearing to Saint Catherine of Siena and Saint Rose of Lima and Saint Agnes of Montepulciano', 'painting', 'The Virgin Appearing to Saint Catherine of Siena, Saint Rose of Lima and Saint Agnes of Montepulciano Painting', 'Giambattista Tiepolo', '1747-1748', 'Gesuati', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-siena_sassoferrato.webp', 'Saint Catherine of Siena', 'painting', 'Saint Catherine of Siena Painting', 'Sassoferrato', '17th Century', 'Museo del Settecento Veneziano', NULL, 'Attribution 3.0 Unported', NULL),

-- Saint Pius V
('/saints/saint-pius-v_passarotti.webp', 'Saint Pius V', 'painting', 'Saint Pius V Painting', 'Bartolomeo Passarotti', '1566', 'Walters Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-pius-v_giovane.webp', 'Saint Pius V', 'painting', 'Saint Pius V Painting', 'Palma il Giovane', '1600', 'Museo d''Arte di Chianciano Terme', NULL, 'Public Domain', NULL),
('/saints/saint-pius-v.webp', 'Saint Pius V', 'painting', 'Saint Pius V Painting', NULL, '18th Century', NULL, NULL, 'Public Domain', NULL),

-- =========================
-- May saints
-- =========================

-- Saint Athanasius
('/saints/saint-athanasius_domenichino_grottaferrata.webp', 'Saint Athanasius', 'fresco', 'Saint Athanasius Fresco', 'Domenichino', '1609-1612', 'Grottaferata Abbey', NULL, 'Public Domain', NULL),
('/saints/saint-athanasius_solimena.webp', 'Saint Athanasius', 'painting', 'Saint Athanasius Painting', 'Francesco Solimena', '18th Century', 'Naples Cathedral', NULL, 'Public Domain', NULL),
('/saints/saint-athanasius_icon.webp', 'Saint Athanasius', 'icon', 'Saint Athanasius Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Philip, Apostle
('/saints/saint-philip-apostle_rubens.webp', 'Saint Philip the Apostle', 'painting', 'Saint Philip Apostle Painting', 'Peter Paul Rubens', '1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-philip-apostle_la-tour.webp', 'Saint Philip the Apostle', 'painting', 'Saint Philip Apostle Painting', 'Georges de La Tour', '1625', 'Chrysler Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-philip-apostle_ribera.webp', 'Saint Philip the Apostle', 'painting', 'Saint Philip Apostle Painting', 'Jusepe de Ribera', '1610', 'Fondazione Roberto Longhi', NULL, 'Public Domain', NULL),
('/saints/saint-philip-apostle_dyck.webp', 'Saint Philip the Apostle', 'painting', 'Saint Philip Apostle Painting', 'Anthony van Dyck', '1619-1621', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),

-- Saint James the Less, Apostle
('/saints/saint-james-the-less-apostle_rubens.webp', 'Saint James the Less the Apostle', 'painting', 'Saint James the Less Apostle Painting', 'Peter Paul Rubens', '1610-1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-james-the-less-apostle_la-tour.webp', 'Saint James the Less the Apostle', 'painting', 'Saint James the Less Apostle Painting', 'Georges de La Tour', '1625', 'Chrysler Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-james-the-less-apostle_ribera.webp', 'Saint James the Less the Apostle', 'painting', 'Saint James the Less Apostle Painting', 'Jusepe de Ribera', '1652', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-james-the-less-apostle_batoni.webp', 'Saint James the Less the Apostle', 'painting', 'Saint James the Less Apostle Painting', 'Pompeo Batoni', '1740-1743', 'National Trust', NULL, 'Public Domain', NULL),

-- Saint John of Ávila
('/saints/saint-john-of-avila_greco.webp', 'Saint John of Ávila', 'painting', 'Saint John of Ávila Painting', 'El Greco', '1580', 'El Greco Museum', NULL, 'Public Domain', NULL),
('/saints/saint-john-of-avila_subleyras.webp', 'Saint John of Ávila', 'painting', 'Saint John of Ávila Painting', 'Pierre Subleyras', '1745-1746', 'Birmingham Museums Trust', NULL, 'Public Domain', NULL),

-- Saint Nereus
-- also linked to saint-achilleus below
('/saints/saint-domitilla-&-nereus-&-achilleus_rubens.webp', 'Saint Domitilla with Saint Nereus and Saint Achilleus', 'painting', 'Saint Domitilla with Saint Nereus and Saint Achilleus Painting', 'Peter Paul Rubens', '1608', 'Santa Maria in Vallicella', NULL, 'Public Domain', NULL),
('/saints/saint-domitilla-&-nereus-&-achilleus_pomarancio.webp', 'Saint Domitilla with Saint Nereus and Saint Achilleus', 'painting', 'Saint Domitilla with Saint Nereus and Saint Achilleus Painting', 'Cristoforo Roncalli (Il Pomarancio)', '1598', 'Santi Nereo e Achilleo', NULL, 'Public Domain', NULL),

-- Saint Pancras
('/saints/saint-pancras_sachs.webp', 'Saint Pancras', 'painting', 'Saint Pancras Painting', 'Lambert Sachs', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-pancras_guercino.webp', 'Saint Pancras', 'painting', 'Saint Pancras Painting', 'Il Guercino', '1620-1625', 'Pinacoteca di Brera', NULL, 'Public Domain', NULL),

-- Saint Matthias, Apostle
('/saints/saint-matthias-apostle_rubens.webp', 'Saint Matthias the Apostle', 'painting', 'Saint Matthias Apostle Painting', 'Peter Paul Rubens', '1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-matthias-apostle_dyck.webp', 'Saint Matthias the Apostle', 'painting', 'Saint Matthias Apostle Painting', 'Anthony van Dyck', '1619', 'Yale University Art Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-matthias-apostle_tristan.webp', 'Saint Matthias the Apostle', 'painting', 'Saint Matthias Apostle Painting', 'Luis Tristán', '1620', 'El Greco Museum', NULL, 'Public Domain', NULL),

-- Saint John I
('/saints/saint-john-i_montor.webp', 'Saint John I', 'illustration', 'Saint John I Illustration', 'Alexis-François Artaud de Montor', '1842', 'Book: "The Lives and Times of the Popes"', NULL, 'Public Domain', NULL),
('/saints/saint-john-i.webp', 'Saint John I', 'mosaic', 'Saint John I Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),

-- Saint Bernardine of Siena
('/saints/saint-bernardine-of-siena_bellini.webp', 'Saint Bernardine of Siena', 'painting', 'Saint Bernardine of Siena Painting', 'Jacopo Bellini', '1450-1455', 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-bernardine-of-siena.webp', 'Saint Bernardine of Siena', 'painting', 'Saint Bernardine of Siena Painting', NULL, '16th Century', 'Langeais Castle (France)', NULL, 'Public Domain', NULL),
('/saints/saint-bernardine-of-siena_greco.webp', 'Saint Bernardine of Siena', 'painting', 'Saint Bernardine of Siena Painting', 'El Greco', '1603', 'El Greco Museum', NULL, 'Public Domain', NULL),
('/saints/saint-bernardine-of-siena_brescia.webp', 'The Virgin and Child with Saint Bernardino and Other Saints', 'painting', 'The Virgin and Child with Saint Bernardino and Other Saints', 'Moretto da Brescia', '1540', 'National Gallery (London)', NULL, 'Public Domain', NULL),

-- Saint Christopher Magallanes
('/saints/saint-christopher-magallanes.webp', 'Saint Christopher Magallanes', 'painting', 'Saint Christopher Magallanes Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-christopher-magallanes_2.webp', 'Saint Christopher Magallanes', 'painting', 'Saint Christopher Magallanes Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-christopher-magallanes_picture.webp', 'Saint Christopher Magallanes', 'photograph', 'Saint Christopher Magallanes Picture', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Rita of Cascia
('/saints/saint-rita-of-cascia.webp', 'Saint Rita of Cascia', 'painting', 'Saint Rita of Cascia Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-rita-of-cascia_2.webp', 'Saint Rita of Cascia', 'painting', 'Saint Rita of Cascia Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-rita-of-cascia_brandi.webp', 'Saint Rita of Cascia in Ecstasy', 'painting', 'Saint Rita of Cascia in Ecstasy Painting', 'Giacinto Brandi', '17th Century', 'Sant''Agostino (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-rita-of-cascia_poussin.webp', 'The Translation of Saint Rita of Cascia', 'painting', 'The Translation of Saint Rita of Cascia Painting', 'Nicolas Poussin', '1635', 'Dulwich Picture Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-rita-of-cascia_torres.webp', 'Saint Rita of Cascia', 'painting', 'Saint Rita of Cascia Painting', 'Antonio de Torres', '1720', 'El Paso Museum of Art', NULL, 'Public Domain', NULL),

-- Saint Bede the Venerable
('/saints/saint-bede-the-venerable.webp', 'Saint Bede the Venerable', 'engraving', 'Saint Bede the Venerable Engraving', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-bede-the-venerable_penrose.webp', 'Saint Bede the Venerable translating the Last Chapter of the Gospel of John on his Deathbed', 'painting', 'Saint Bede the Venerable translating the Last Chapter of the Gospel of John on his Deathbed Painting', 'James Doyle Penrose', '1902', 'Royal Academy (London)', NULL, 'Public Domain', NULL),
('/saints/saint-bede-the-venerable_icon.webp', 'Saint Bede the Venerable', 'icon', 'Saint Bede the Venerable Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Gregory VII
('/saints/saint-gregory-vii_knille.webp', 'Saint Gregory VII', 'engraving', 'Saint Gregory VII Engraving', 'Otto Knille', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-gregory-vii.webp', 'Saint Gregory VII', 'painting', 'Saint Gregory VII Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-gregory-vii_scarpelli.webp', 'The Holy Roman Emperor Henry IV begging for the forgiveness of Pope Gregory VII', 'illustration', 'The Holy Roman Emperor Henry IV begging for the forgiveness of Pope Gregory VII Illustration', 'Tancredi Scarpelli', '1930', 'Book : "Storia d''Italia by Paolo Giudici"', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-vii_2.webp', 'Saint Gregory VII forgives Quintius', 'illustration', 'Saint Gregory VII Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-gregory-vii_3.webp', 'Saint Gregory VII', 'mosaic', 'Saint Gregory VII Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-vii_4.webp', 'Saint Gregory VII', 'illustration', 'Saint Gregory VII Illustration', 'Giovanni Battista de'' Cavalieri', '1580', 'Book : "Pontificum Romanorum effigies"', NULL, 'Public Domain', NULL),

-- Saint Mary Magdalene de' Pazzi
('/saints/saint-mary-magdalene-de-pazzi_cano.webp', 'Saint Mary Magdalene de'' Pazzi', 'painting', 'Saint Mary Magdalene de'' Pazzi Painting', 'Alonso Cano', '1628', 'Museum of Fine Arts of Seville', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene-de-pazzi_rosi.webp', 'Saint Mary Magdalene de'' Pazzi in Ecstasy', 'painting', 'Saint Mary Magdalene de'' Pazzi in Ecstasy Painting', 'Alessandro Rosi', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene-de-pazzi_moya.webp', 'Vision of Saint Mary Magdalene de'' Pazzi', 'painting', 'Vision of Saint Mary Magdalene de'' Pazzi Painting', 'Pedro de Moya', '17th Century', 'Museo de Bellas Artes de Granada', NULL, 'Public Domain', NULL),

-- Saint Philip Neri
('/saints/saint-philip-neri_reni.webp', 'Saint Philip Neri in Ecstasy', 'painting', 'Saint Philip Neri in Ecstasy Painting', 'Guido Reni', '1614', 'Santa Maria in Vallicella', NULL, 'Public Domain', NULL),
('/saints/saint-philip-neri_conca.webp', 'Saint Philip Neri', 'painting', 'Saint Philip Neri Painting', 'Sebastiano Conca', '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-philip-neri_dolci.webp', 'Saint Philip Neri', 'painting', 'Saint Philip Neri Painting', 'Carlo Dolci', '1645-1646', 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-philip-neri_tiepolo.webp', 'Saint Philip Neri', 'painting', 'Saint Philip Neri Painting', 'Giambattista Tiepolo', '1739-1740', 'Museo Diocesano Camerino', NULL, 'Public Domain', NULL),
('/saints/saint-philip-neri_nogari.webp', 'Saint Philip Neri', 'painting', 'Saint Philip Neri Painting', 'Carlo Francesco Nogari', '18th Century', 'Galleria nazionale di Parma', NULL, 'Public Domain', NULL),

-- Saint Augustine of Canterbury
('/saints/saint-augustine-of-canterbury_lommelin.webp', 'Saint Augustine of Canterbury', 'engraving', 'Saint Augustine of Canterbury Engraving', 'Adriaen Lommelin', '17th Century', NULL, NULL, 'Attribution 4.0 International', NULL),
('/saints/saint-augustine-of-canterbury.webp', 'Saint Augustine of Canterbury and the Saxons', 'illustration', 'Saint Augustine of Canterbury and the Saxons Illustration', 'Joseph Martin Kronheim', '1868', 'Book: "Pictures of English history"', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-canterbury_icon.webp', 'Saint Augustine of Canterbury', 'icon', 'Saint Augustine of Canterbury Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Paul VI
('/saints/saint-paul-vi.webp', 'Saint Paul VI', 'painting', 'Saint Paul VI Painting', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-paul-vi_picture.webp', 'Saint Paul VI', 'photograph', 'Saint Paul VI Picture', 'Fotografia Felici', '1969', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-paul-vi_picture_2.webp', 'Saint Paul VI', 'photograph', 'Saint Paul VI Picture', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),

-- =========================
-- June saints
-- =========================

-- Saint Justin Martyr
('/saints/saint-justin-martyr_thevet.webp', 'Saint Justin Martyr', 'illustration', 'Saint Justin Martyr Illustration', 'André Thevet', '1584', 'Book : "Les Vrais Pourtraits et Vies des Hommes Illustres"', NULL, 'Public Domain', NULL),
('/saints/saint-justin-martyr_icon.webp', 'Saint Justin Martyr', 'icon', 'Saint Justin Martyr Icon', 'Theophanes the Cretan', '1545-1546', 'Stavronikita Monastery', NULL, 'Public Domain', NULL),

-- Saint Marcellinus
-- also linked to saint-peter-exorcist below
('/saints/saint-marcellinus-&-peter.webp', 'Saint Marcellinus and Saint Peter', 'painting', 'Saint Marcellinus and Saint Peter (exorcist) Painting', NULL, NULL, 'Santi Marcellino e Pietro al Laterano (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-marcellinus-&-peter_martyr.webp', 'The Martyrdom of Saint Marcellinus and Saint Peter (exorcist)', 'illustration', 'The Martyrdom of Saint Marcellinus and Saint Peter (exorcist) Illustration', NULL, '1170-1200', 'Codex Bodmer', NULL, 'Public Domain', NULL),
('/saints/saint-marcellinus-&-peter_2.webp', 'Saint Marcellinus and Saint Peter (exorcist)', 'illustration', 'Saint Marcellinus and Saint Peter (exorcist) Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Charles Lwanga and Companions (maybe should optimize by creating a "saint-charles-lwanga" slug only)
('/saints/saint-charles-lwanga-and-companions_icon.webp', 'Saint Charles Lwanga and Companions', 'icon', 'Saint Charles Lwanga and Companions Icon', 'Teresa Satola', '2013', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-charles-lwanga-and-companions.webp', 'Saint Charles Lwanga and Companions', 'painting', 'Saint Charles Lwanga and Companions Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-charles-lwanga-and-companions_2.webp', 'Saint Charles Lwanga and Companions', 'painting', 'Saint Charles Lwanga and Companions Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
-- WIP

-- Saint Boniface
('/saints/saint-boniface_bloemaert.webp', 'Saint Boniface', 'painting', 'Saint Boniface Painting', 'Cornelis Bloemaert', '1630', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-boniface_rode.webp', 'Saint Boniface chops down a cult tree in Hessen', 'engraving', 'Saint Boniface chops down a cult tree in Hessen Engraving', 'Bernhard Rode', '1781', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-boniface_rethel.webp', 'Saint Boniface', 'painting', 'Saint Boniface Painting', 'Alfred Rethel', '1832', 'Berggruen Museum', NULL, 'Public Domain', NULL),

-- Saint Norbert
('/saints/saint-norbert_vaszary.webp', 'Saint Norbert', 'painting', 'Saint Norbert Painting', 'János Vaszary', '1897', 'a Zsámbék Church', NULL, 'Public Domain', NULL),
('/saints/saint-norbert_rubens.webp', 'Saint Norbert overcoming Tanchelm', 'painting', 'Saint Norbert overcoming Tanchelm Painting', 'Peter Paul Rubens', '1623', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-norbert_hoey.webp', 'Saint Norbert', 'painting', 'Saint Norbert Painting', 'Jean de Hoey', '17th Century', 'Xanten Chapter Museum', NULL, 'Public Domain', NULL),
('/saints/saint-norbert_crayer.webp', 'Saint Norbert', 'painting', 'Saint Norbert Painting', 'Gaspar de Crayer', '1664', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-norbert.webp', 'Saint Norbert', 'painting', 'Saint Norbert Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Ephrem
('/saints/saint-ephrem_icon.webp', 'Saint Ephrem', 'icon', 'Saint Ephrem Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-ephrem_mosaic.webp', 'Saint Ephrem', 'mosaic', 'Saint Ephrem Mosaic', NULL, '11th Century', 'Nea Moni of Chios', NULL, 'Public Domain', NULL),
('/saints/saint-ephrem_illustration.webp', 'Saint Ephrem', 'illustration', 'Saint Ephrem Illustration', NULL, '16th Century', 'a Russian Missal', NULL, 'Public Domain', NULL),

-- Saint Barnabas, Apostle
('/saints/saint-barnabas-apostle.webp', 'Saint Barnabas the Apostle', 'painting', 'Saint Barnabas Apostle Painting', NULL, '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-barnabas-apostle_veronese.webp', 'Saint Barnabas the Apostle healing the Sick', 'painting', 'Saint Barnabas Apostle healing the Sick Painting', 'Paolo Veronese', '1566', 'San Giorgio in Braida (Verona)', NULL, 'Public Domain', NULL),
-- NOTE: '/saints/saint-paul-apostle-&-barnabas.webp' is already inserted above (also linked to Barnabas)

-- Saint Anthony of Padua
('/saints/saint-anthony-of-padua_zurbaran.webp', 'Saint Anthony of Padua', 'painting', 'Saint Anthony of Padua Painting', 'Francisco de Zurbarán', '1627-1630', 'São Paulo Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-of-padua_farelli.webp', 'Saint Anthony of Padua with the Christ Child', 'painting', 'Saint Anthony of Padua with the Christ Child Painting', 'Giacomo Farelli', '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-anthony-of-padua_sirani.webp', 'Saint Anthony of Padua with the Christ Child', 'painting', 'Saint Anthony of Padua with the Christ Child Painting', 'Elisabetta Sirani', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-of-padua_strozzi.webp', 'Saint Anthony of Padua holding the Infant Jesus', 'painting', 'Saint Anthony of Padua holding the Infant Jesus Painting', 'Bernardo Strozzi', '1625', 'Musée des Beaux-Arts de Strasbourg', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-of-padua_murillo.webp', 'Saint Anthony of Padua with the Child', 'painting', 'Saint Anthony of Padua with the Child Painting', 'Bartolomé Esteban Murillo', '1668-1669', 'Museum of Fine Arts of Seville', NULL, 'Public Domain', NULL),

-- Saint Romuald
('/saints/saint-romuald_guercino.webp', 'Saint Romuald', 'painting', 'Saint Romuald Painting', 'Il Guercino', '1640-1641', 'Ravenna Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-romuald_loth.webp', 'Saint Romuald', 'painting', 'Saint Romuald Painting', 'Johann Carl Loth', '17th Century', 'Gallerie dell''Accademia', NULL, 'Public Domain', NULL),
('/saints/saint-romuald_angelico.webp', 'Saint Romuald', 'fresco', 'Saint Romuald Fresco', 'Fra Angelico', '1441', 'Museo Nazionale di San Marco', NULL, 'Public Domain', NULL),
('/saints/saint-romuald_mussini.webp', 'Saint Romuald', 'painting', 'Saint Romuald Painting', 'Augusto Mussini', '1914-1915', 'Monastery of Camaldoli', NULL, 'Public Domain', NULL),

-- Saint Aloysius Gonzaga
('/saints/saint-aloysius-gonzaga_mazzanti.webp', 'Saint Aloysius Gonzaga adoring the Crucifix', 'painting', 'Saint Aloysius Gonzaga adoring the Crucifix Painting', 'Ludovico Mazzanti', '1740-1745', 'Fondation Bemberg', NULL, 'Public Domain', NULL),
('/saints/saint-aloysius-gonzaga_guercino.webp', 'The Vocation of Saint Aloysius Gonzaga', 'painting', 'The Vocation of Saint Aloysius Gonzaga Painting', 'Il Guercino', '1650', 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-aloysius-gonzaga_goya.webp', 'Saint Aloysius Gonzaga', 'painting', 'Saint Aloysius Gonzaga Painting', 'Francisco Goya', '1798', 'Zaragoza Museum', NULL, 'Public Domain', NULL),
('/saints/saint-aloysius-gonzaga_tiepolo.webp', 'Saint Aloysius Gonzaga in Glory', 'painting', 'Saint Aloysius Gonzaga in Glory Painting', 'Giambattista Tiepolo', '1726', 'Courtauld Institute of Art', NULL, 'Public Domain', NULL),

-- Saint Paulinus of Nola
('/saints/saint-paulinus-of-nola.webp', 'Saint Paulinus of Nola', 'engraving', 'Saint Paulinus of Nola Line Engraving', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-paulinus-of-nola_stained-glass.webp', 'Saint Paulinus of Nola', 'stained_glass', 'Saint Paulinus of Nola Stained Glass', NULL, NULL, 'Linz Cathedral (Austria)', NULL, 'Public Domain', NULL),
('/saints/saint-paulinus-of-nola_azzolino.webp', 'Saint Paulinus of Nola frees a Slave', 'painting', 'Saint Paulinus of Nola frees a Slave Painting', 'Giovanni Bernardino Azzolini', '1626', 'Pio Monte della Misericordia', NULL, 'Public Domain', NULL),

-- Saint John Fisher
('/saints/saint-john-fisher_holbein-younger.webp', 'Saint John Fisher', 'painting', 'Saint John Fisher Painting', 'Hans Holbein the Younger', '1497-1543', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-fisher_illustration.webp', 'Saint John Fisher', 'engraving', 'Saint John Fisher Line Engraving', 'Jacobus Houbraken', '1743', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-fisher_briggs.webp', 'Saint John Fisher', 'painting', 'Saint John Fisher Painting', 'Gwyneth Thompson Briggs', '2019', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-fisher_briggs_2.webp', 'Saint John Fisher', 'painting', 'Saint John Fisher Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Thomas More
('/saints/saint-thomas-more_holbein-younger.webp', 'Saint Thomas More', 'painting', 'Saint Thomas More Painting', 'Hans Holbein the Younger', '1527', 'Frick Collection', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-more_ward.webp', 'Saint Thomas More Farewell to his Daughter', 'painting', 'Saint Thomas More Farewell to his Daughter Painting', 'Edward Matthew Ward', '19th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Peter, Apostle
('/saints/saint-peter-apostle_rubens.webp', 'Saint Peter the Apostle', 'painting', 'Saint Peter Apostle Painting', 'Peter Paul Rubens', '1610-1612', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_rubens_charge.webp', 'Christ''s Charge to Peter', 'painting', 'Christ''s Charge to Peter Painting', 'Peter Paul Rubens', '1616', 'Wallace Collection', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_dyck.webp', 'Saint Peter the Apostle', 'painting', 'Saint Peter Apostle Painting', 'Anthony van Dyck', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_dyck_penitent.webp', 'The Penitent Saint Peter', 'painting', 'The Penitent Saint Peter Painting', 'Anthony van Dyck', '1618-1620', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_guercino.webp', 'Saint Peter the Apostle', 'painting', 'Saint Peter Apostle Painting', 'Il Guercino', '17th Century', 'Fondation Bemberg', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-peter-apostle_guercino_weeping.webp', 'Saint Peter Weeping before the Virgin', 'painting', 'Saint Peter Weeping before the Virgin Painting', 'Il Guercino', '1647', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_murillo.webp', 'Saint Peter the Apostle in Tears', 'painting', 'Saint Peter Apostle in Tears Painting', 'Bartolomé Esteban Murillo', '1650-1655', 'Museo de Bellas Artes de Bilbao', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_ribera.webp', 'Saint Peter the Apostle', 'painting', 'Saint Peter Apostle Painting', 'Jusepe de Ribera', '1630', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_ribera_penitent.webp', 'The Penitent Saint Peter', 'painting', 'The Penitent Saint Peter Painting', 'Jusepe de Ribera', '1628-1632', 'Art Institute of Chicago', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_caravaggio_crucifixion.webp', 'The Crucifixion of Saint Peter', 'painting', 'The Crucifixion of Saint Peter Painting', 'Caravaggio', '1600-1601', 'Santa Maria del Popolo (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_rembrandt.webp', 'Saint Peter the Apostle', 'painting', 'Saint Peter Apostle Painting', 'Rembrandt', '1632', 'Nationalmuseum (Stockholm)', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_rembrandt_denial.webp', 'The Denial of Saint Peter', 'painting', 'The Denial of Saint Peter Painting', 'Rembrandt', '1660', 'Rijksmuseum', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_rembrandt_prison.webp', 'Saint Peter in Prison', 'painting', 'Saint Peter in Prison Painting', 'Rembrandt', '1631', 'Israel Museum', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_velazquez.webp', 'The Tears of Saint Peter the Apostle', 'painting', 'The Tears of Saint Peter Apostle Painting', 'Diego Velázquez', '1617-1619', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_zurbaran.webp', 'Saint Peter the Apostle', 'painting', 'Saint Peter Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/saint-peter-apostle_brion.webp', 'Jesus and Peter on the Water', 'painting', 'Jesus and Peter on the Water Painting', 'Gustave Brion', '1863', 'Private Collection', NULL, 'Public Domain', NULL),

-- Saint Cyril of Alexandria
('/saints/saint-cyril-of-alexandria_fresco.webp', 'Saint Cyril of Alexandria', 'fresco', 'Saint Cyril of Alexandria Fresco', NULL, '14th Century', 'Kariye Camii (Istanbul)', NULL, 'Public Domain', NULL),
('/saints/saint-cyril-of-alexandria_icon.webp', 'Saint Cyril of Alexandria', 'icon', 'Saint Cyril of Alexandria Icon', 'Emmanuel Tzanes', '1654', 'Byzantine Museum of Antivouniotissa', NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-cyril-of-alexandria_stained-glass.webp', 'Saint Cyril of Alexandria', 'stained_glass', 'Saint Cyril of Alexandria Stained Glass', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Irenaeus
('/saints/saint-irenaeus_icon.webp', 'Saint Irenaeus', 'icon', 'Saint Irenaeus Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-irenaeus_stained-glass.webp', 'Saint Irenaeus', 'stained_glass', 'Saint Irenaeus Stained Glass', 'Lucien Bégule', '1901', 'Saint Irenaeus Church (Lyon)', NULL, 'Public Domain', NULL),

-- First Martyrs of the Holy Roman Church
-- (we don''t do it as it is a group of martyrs, not a saint)

-- =========================
-- July saints
-- =========================

-- Saint Thomas, Apostle
('/saints/saint-thomas-apostle_rubens.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Peter Paul Rubens', '1610-1612', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_dyck.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Anthony van Dyck', '1620', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_velazquez.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Diego Velázquez', '1618-1620', 'Musée des Beaux-Arts d''Orléans', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_ribera.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Jusepe de Ribera', '1630-1635', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_la-tour.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Georges de La Tour', '1625-1630', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_la-tour_2.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Georges de La Tour', '17th Century', 'National Museum of Western Art (Tokyo)', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_caravaggio.webp', 'The Incredulity of Saint Thomas', 'painting', 'The Incredulity of Saint Thomas Painting', 'Caravaggio', '1601-1602', 'Sanssouci', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_rubens_martyr.webp', 'The Martyrdom of Saint Thomas the Apostle', 'painting', 'The Martyrdom of Saint Thomas Apostle Painting', 'Peter Paul Rubens', '1636-1638', 'National Gallery Prague', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_rembrandt.webp', 'The Incredulity of Saint Thomas', 'painting', 'The Incredulity of Saint Thomas Painting', 'Rembrandt', '1634', 'Pushkin Museum', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-apostle_zurbaran.webp', 'Saint Thomas the Apostle', 'painting', 'Saint Thomas Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),

-- Saint Elizabeth of Portugal
('/saints/saint-elizabeth-of-portugal_zurbaran.webp', 'Saint Elizabeth of Portugal', 'painting', 'Saint Elizabeth of Portugal Painting', 'Francisco de Zurbarán', '1630-1635', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-elizabeth-of-portugal.webp', 'Saint Elizabeth of Portugal', 'painting', 'Saint Elizabeth of Portugal Painting', NULL, '1852', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-elizabeth-of-portugal_2.webp', 'Queen Saint Elizabeth and the Miracle of the Roses', 'painting', 'Queen Saint Elizabeth and the Miracle of the Roses Painting', NULL, '1540', 'Machado de Castro National Museum', NULL, 'Public Domain', NULL),
('/saints/saint-elizabeth-of-portugal_castro.webp', 'Saint Elizabeth of Portugal', 'painting', 'Saint Elizabeth of Portugal Painting', 'José Gil de Castro', '1820', 'Museo Colonial', NULL, 'Public Domain', NULL),

-- Saint Anthony Zaccaria
('/saints/saint-anthony-zaccaria.webp', 'Saint Anthony Zaccaria', 'illustration', 'Saint Anthony Zaccaria Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-anthony-zaccaria_2.webp', 'Saint Anthony Zaccaria', 'painting', 'Saint Anthony Zaccaria Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-anthony-zaccaria_3.webp', 'Saint Anthony Zaccaria', 'painting', 'Saint Anthony Zaccaria Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-anthony-zaccaria_4.webp', 'Saint Anthony Zaccaria', 'painting', 'Saint Anthony Zaccaria Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Maria Goretti
('/saints/saint-maria-goretti_soffredini.webp', 'Saint Maria Goretti', 'painting', 'Saint Maria Goretti Painting', 'Giuseppe Brovelli Soffredini', '20th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-maria-goretti_2.webp', 'Saint Maria Goretti', 'painting', 'Saint Maria Goretti Painting', NULL, '20th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Augustine Zhao Rong and Companions
('/saints/saint-augustine-zhao-rong_icon.webp', 'Saint Augustine Zhao Rong', 'icon', 'Saint Augustine Zhao Rong Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-augustine-zhao-rong-&-companions_liu.webp', 'Saint Augustine Zhao Rong and Companions (120 Martyrs of China)', 'painting', 'Saint Augustine Zhao Rong and Companions Painting', 'Monica Liu', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-augustine-zhao-rong_stained-glass.webp', 'Saint Augustine Zhao Rong', 'stained_glass', 'Saint Augustine Zhao Rong Stained Glass', NULL, NULL, 'Shrine of Saint Andrew Kim Taegon (Philippines)', NULL, 'Public Domain', NULL),

-- Saint Benedict, Abbot
('/saints/saint-benedict.webp', 'Saint Benedict', 'painting', 'Saint Benedict Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-benedict_piazzetta.webp', 'Saint Benedict', 'painting', 'Saint Benedict Painting', 'Giambattista Piazzetta', '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-benedict_briggs.webp', 'Saint Benedict', 'painting', 'Saint Benedict Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-benedict_zurbaran.webp', 'Saint Benedict', 'painting', 'Saint Benedict Painting', 'Francisco de Zurbarán', '1640-1645', 'Metropolitan Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-benedict_2.webp', 'Saint Benedict', 'painting', 'Saint Benedict Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-benedict_restout.webp', 'Saint Benedict', 'painting', 'Saint Benedict Painting', 'Jean Restout', '1746', 'Église Saint-Gilles de Bourg-la-Reine', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
-- shared image (already present earlier in your file, keep ONLY ONE row in images):
-- ('/saints/saint-benedict-&-scholastica.webp', 'Saint Benedict and Saint Scholastica', 'painting', 'Saint Benedict and Saint Scholastica Painting', 'Yan'' Dargent', '19th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Henry
('/saints/saint-henry_baer.webp', 'Saint Henry', 'painting', 'Saint Henry Painting', 'Hans Baer', '1611', 'Archdiocese of Freiburg', NULL, 'Public Domain', NULL),
('/saints/saint-henry.webp', 'Saint Henry', 'illustration', 'Saint Henry Illustration', NULL, '11th Century', 'Regensburg Sacramentary (Bavarian State Library)', NULL, 'Public Domain', NULL),
('/saints/saint-henry_fuhricht.webp', 'Saint Henry', 'illustration', 'Saint Henry Drawing', 'Joseph von Führich', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-henry_2.webp', 'Saint Henry', 'illustration', 'Saint Henry Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Camillus de Lellis
('/saints/saint-camillus-de-lellis_gandolfi.webp', 'Saint Camillus de Lellis', 'painting', 'Saint Camillus de Lellis Painting', 'Gaetano Gandolfi', '18th Century', 'Toledo Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-camillus-de-lellis_lozano.webp', 'Saint Camillus de Lellis in Ecstasy', 'painting', 'Saint Camillus de Lellis in Ecstasy Painting', 'Cristóbal Lozano', '1762', 'Lima Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-camillus-de-lellis.webp', 'Saint Camillus de Lellis', 'painting', 'Saint Camillus de Lellis Painting', NULL, '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-camillus-de-lellis_subleyras.webp', 'Saint Camillus de Lellis saves the Sick', 'painting', 'Saint Camillus de Lellis saves the Sick Painting', 'Pierre Subleyras', '1746', 'Museo di Roma', NULL, 'Public Domain', NULL),

-- Saint Bonaventure
('/saints/saint-bonaventure_cavazzola.webp', 'Saint Bonaventure', 'painting', 'Saint Bonaventure Painting', 'Il Cavazzola', '16th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-bonaventure_lombard.webp', 'Saint Bonaventure', 'painting', 'Saint Bonaventure Painting', 'François Lombard', '1639', 'Basilique Saint-Bonaventure (Lyon)', NULL, 'Public Domain', NULL),
('/saints/saint-bonaventure_rubens.webp', 'Saint Bonaventure', 'painting', 'Saint Bonaventure Painting', 'Peter Paul Rubens', '1620', 'Palais des Beaux-Arts de Lille', NULL, 'Public Domain', NULL),
('/saints/saint-bonaventure_orpen.webp', 'Saint Bonaventure Inspired to Write', 'painting', 'Saint Bonaventure Inspired to Write Painting', 'Rebecca Dulcibella Orpen', '1890', 'National Trust', NULL, 'Public Domain', NULL),
('/saints/saint-bonaventure_zurbaran.webp', 'Displaying the Body of Saint Bonaventure', 'painting', 'Displaying the Body of Saint Bonaventure Painting', 'Francisco de Zurbarán', '1629', 'Musée du Louvre', NULL, 'Public Domain', NULL),

-- Saint Apollinaris
('/saints/saint-apollinaris-&-peter_pasquali.webp', 'Saint Peter sends Saint Apollinaris to Ravenna', 'painting', 'Saint Peter sends Saint Apollinaris to Ravenna Painting', 'Filippo Pasquali', '1683', 'Ravenna Cathedral', NULL, 'Public Domain', NULL),
('/saints/saint-apollinaris_mosaic.webp', 'Saint Apollinaris', 'mosaic', 'Saint Apollinaris Mosaic', NULL, '6th Century', 'Basilica of Sant''Apollinare in Classe', NULL, 'Public Domain', NULL),

-- Saint Lawrence of Brindisi
('/saints/saint-lawrence-of-brindisi.webp', 'Saint Lawrence of Brindisi at the Battle of Albareale', 'painting', 'Saint Lawrence of Brindisi at the Battle of Albareale Painting', 'Francesco Grandi', '19th Century', 'Pinacoteca (Vatican)', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence-of-brindisi_2.webp', 'Saint Lawrence of Brindisi', 'painting', 'Saint Lawrence of Brindisi Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-lawrence-of-brindisi_3.webp', 'Communion of Saint Lawrence of Brindisi', 'painting', 'Communion of Saint Lawrence of Brindisi Painting', 'Raffaele da Roma', '1770', NULL, NULL, 'Public Domain', NULL),

-- Saint Mary Magdalene
('/saints/saint-mary-magdalene_spadarino.webp', 'The Penitent Mary Magdalene', 'painting', 'The Penitent Mary Magdalene Painting', 'Lo Spadarino', '1625-1635', 'Walters Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_caravaggio_ecstasy.webp', 'Saint Mary Magdalene in Ecstasy', 'painting', 'Saint Mary Magdalene in Ecstasy Painting', 'Caravaggio', '1606', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_champaigne.webp', 'The Repentant Mary Magdalene', 'painting', 'The Repentant Mary Magdalene Painting', 'Philippe de Champaigne', '1648', 'Museum of Fine Arts (Houston)', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_rubens.webp', 'Saint Mary Magdalene in Ecstasy', 'painting', 'Saint Mary Magdalene in Ecstasy Painting', 'Peter Paul Rubens', '1619-1620', 'Palais des Beaux-Arts de Lille', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_caravaggio_penitent.webp', 'The Penitent Mary Magdalene', 'painting', 'The Penitent Mary Magdalene Painting', 'Caravaggio', '1594-1596', 'Galleria Doria Pamphilj (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_la-tour.webp', 'Saint Mary Magdalene', 'painting', 'Saint Mary Magdalene Painting', 'Georges de La Tour', '1640-1645', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_veronese.webp', 'The Conversion of Mary Magdalene', 'painting', 'The Conversion of Mary Magdalene Painting', 'Paolo Veronese', '1548', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_merle.webp', 'Saint Mary Magdalene in the Cave', 'painting', 'Saint Mary Magdalene in the Cave Painting', 'Hugues Merle', '1868', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_ivanov.webp', 'Christ''s Appearance to Mary Magdalene after the Resurrection', 'painting', 'Christ''s Appearance to Mary Magdalene after the Resurrection Painting', 'Alexander Ivanov', '1835', 'State Russian Museum', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_titian.webp', 'Noli Me Tangere', 'painting', 'Noli Me Tangere Painting', 'Titian', '1514', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-mary-magdalene_giotto.webp', 'Noli Me Tangere', 'fresco', 'Noli Me Tangere Fresco', 'Giotto', '1304-1306', 'Scrovegni Chapel (Padua)', NULL, 'Public Domain', NULL),

-- Saint Bridget
('/saints/saint-bridget.webp', 'Saint Bridget', 'painting', 'Saint Bridget Painting', 'Hermen Rode', '15th Century', 'Salem Church (Södermanland)', NULL, 'Public Domain', NULL),
('/saints/saint-bridget_friano.webp', 'Saint Bridget', 'painting', 'Saint Bridget Painting', 'Maso da San Friano', '1540', 'Cook Collection', NULL, 'Public Domain', NULL),
('/saints/saint-bridget_2.webp', 'Saint Bridget', 'painting', 'Saint Bridget Painting', NULL, NULL, 'Santa Maria della Catena (Naples)', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-bridget_briggs.webp', 'Saint Bridget', 'painting', 'Saint Bridget Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Sharbel Makhluf
('/saints/saint-sharbel-makhluf.webp', 'Saint Sharbel Makhluf', 'painting', 'Saint Sharbel Makhluf Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-sharbel-makhluf_2.webp', 'Saint Sharbel Makhluf', 'illustration', 'Saint Sharbel Makhluf Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-sharbel-makhluf_3.webp', 'Saint Sharbel Makhluf', 'illustration', 'Saint Sharbel Makhluf Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint James, Apostle
('/saints/saint-james-apostle_rubens.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Peter Paul Rubens', '1612-1613', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_reni.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Guido Reni', '1636-1638', 'Museum of Fine Arts (Houston)', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_dyck.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Anthony van Dyck', '1620', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_ribera.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Jusepe de Ribera', '1630-1635', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_rembrandt.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Rembrandt', '1661', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_zurbaran.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_murillo.webp', 'Saint James the Apostle', 'painting', 'Saint James Apostle Painting', 'Bartolomé Esteban Murillo', '1655', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_tiepolo.webp', 'Saint James the Great Conquering the Moors (Santiago Matamoros)', 'painting', 'Saint James the Great Conquering the Moors (Santiago Matamoros) Painting', 'Giambattista Tiepolo', '1749-1750', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_dyck_martyr.webp', 'The Martyrdom of Saint James the Apostle', 'painting', 'The Martyrdom of Saint James Apostle Painting', 'Anthony van Dyck', '1627-1632', 'Musée des Beaux-Arts de Valenciennes', NULL, 'Public Domain', NULL),
('/saints/saint-james-apostle_zurbaran_martyr.webp', 'The Martyrdom of Saint James the Apostle', 'painting', 'The Martyrdom of Saint James Apostle Painting', 'Francisco de Zurbarán', '1640', 'Museo del Prado', NULL, 'Public Domain', NULL),

-- Saint Joachim
('/saints/saint-joachim_wautier.webp', 'Saint Joachim', 'painting', 'Saint Joachim Painting', 'Michaelina Wautier', '1650', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-joachim_gutierrez.webp', 'Saint Joachim', 'painting', 'Saint Joachim Painting', 'Juan Simón Gutiérrez', '1700', 'Museo de Bellas Artes de Sevilla', NULL, 'Public Domain', NULL),
('/saints/saint-joachim-&-mary_camilo.webp', 'Saint Joachim and Saint Mary', 'painting', 'Saint Joachim and Saint Mary Painting', 'Francisco Camilo', '17th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-joachim-&-mary.webp', 'Saint Joachim and Saint Mary', 'painting', 'Saint Joachim and Saint Mary Painting', NULL, '17th Century', 'Museo Colonial (Bogotá)', NULL, 'Public Domain', NULL),
('/saints/saint-joachim-&-anne_maratta.webp', 'The Vision of Saint Joachim and Saint Anne', 'painting', 'The Vision of Saint Joachim and Saint Anne Painting', 'Carlo Maratta', '1670-1685', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-joachim-&-mary_wautier.webp', 'Education of the Virgin by Saint Anne & Saint Joachim', 'painting', 'Education of the Virgin by Saint Anne & Saint Joachim Painting', 'Michaelina Wautier', '1656', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-joachim-&-mary_tiepolo.webp', 'Education of the Virgin by Saint Anne & Saint Joachim', 'painting', 'Education of the Virgin by Saint Anne & Saint Joachim Painting', 'Giambattista Tiepolo', '1732', 'Santa Maria della Fava', NULL, 'Public Domain', NULL),

-- Saint Anne
('/saints/saint-anne-&-mary_coypel.webp', 'Education of the Virgin by Saint Anne', 'painting', 'Education of the Virgin by Saint Anne Painting', 'Charles Antoine Coypel', '1735-1737', 'Speed Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-mary_murillo.webp', 'Education of the Virgin by Saint Anne', 'painting', 'Education of the Virgin by Saint Anne Painting', 'Bartolomé Esteban Murillo', '1655', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-mary_la-tour.webp', 'Education of the Virgin by Saint Anne', 'painting', 'Education of the Virgin by Saint Anne Painting', 'Georges de La Tour', '1650', 'The Frick Collection', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-mary_stella.webp', 'Saint Anne Leading the Virgin to the Temple', 'painting', 'Saint Anne Leading the Virgin to the Temple Painting', 'Jacques Stella', '1640', 'Musée des Beaux-Arts de Rouen', NULL, 'Public Domain', NULL),
-- shared images (already present earlier in your file via Joachim block; keep ONLY ONE row in images):
-- ('/saints/saint-anne-&-joachim-&-mary_wautier.webp', 'Education of the Virgin by Saint Anne & Saint Joachim', 'painting', 'Education of the Virgin by Saint Anne & Saint Joachim Painting', 'Michaelina Wautier', '1656', 'Private Collection', NULL, 'Public Domain', NULL),
-- ('/saints/saint-anne-&-joachim-&-mary_tiepolo.webp', 'Education of the Virgin by Saint Anne & Saint Joachim', 'painting', 'Education of the Virgin by Saint Anne & Saint Joachim Painting', 'Giambattista Tiepolo', '1732', 'Santa Maria della Fava', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-mary-&-child_da-vinci.webp', 'The Virgin and Child with Saint Anne', 'painting', 'The Virgin and Child with Saint Anne Painting', 'Leonardo da Vinci', '1503-1519', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-anne-&-mary_icon.webp', 'Saint Anne with the Virgin', 'icon', 'Saint Anne with the Virgin Icon', NULL, '1440', 'Benaki Museum', NULL, 'Public Domain', NULL),

-- Saint Martha of Bethany
('/saints/saint-martha-of-bethany_ring-sakabe.webp', 'Saint Martha of Bethany', 'painting', 'Saint Martha of Bethany Painting', 'Jordan Ring-Sakabe', '2019', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-martha-of-bethany-&-mary-of-bethany-&-christ_vermeer.webp', 'Christ in the House of Martha and Mary', 'painting', 'Christ in the House of Martha and Mary Painting', 'Johannes Vermeer', '1654-1655', 'Scottish National Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-martha-of-bethany-&-mary-of-bethany-&-christ_rubens.webp', 'Christ in the House of Martha and Mary', 'painting', 'Christ in the House of Martha and Mary Painting', 'Peter Paul Rubens & Jan Brueghel the Younger', '1628', 'National Gallery of Ireland', NULL, 'Public Domain', NULL),
('/saints/saint-martha-of-bethany.webp', 'Saint Martha of Bethany & the Tarasque', 'painting', 'Saint Martha of Bethany & the Tarasque Painting', NULL, '18th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Mary of Bethany
('/saints/saint-mary-of-bethany_ring-sakabe.webp', 'Saint Mary of Bethany', 'painting', 'Saint Mary of Bethany Painting', 'Jordan Ring-Sakabe', '2024', NULL, NULL, 'Public Domain', NULL),
-- NOTE: same shared artworks as above

-- Saint Lazarus of Bethany
('/saints/saint-lazarus-of-bethany_caravaggio.webp', 'The Raising of Lazarus', 'painting', 'The Raising of Lazarus Painting', 'Caravaggio', '1609', 'Regional Museum of Messina', NULL, 'Public Domain', NULL),
('/saints/saint-lazarus-of-bethany_rubens.webp', 'The Raising of Lazarus', 'painting', 'The Raising of Lazarus Painting', 'Peter Paul Rubens', '1625', 'Galleria Sabauda', NULL, 'Public Domain', NULL),
('/saints/saint-lazarus-of-bethany_gebhardt.webp', 'The Raising of Lazarus', 'painting', 'The Raising of Lazarus Painting', 'Eduard von Gebhardt', '1896', 'Museum Kunstpalast', NULL, 'Public Domain', NULL),
('/saints/saint-lazarus-of-bethany_flandes.webp', 'The Raising of Lazarus', 'painting', 'The Raising of Lazarus Painting', 'Juan de Flandes', '1514-1519', 'Museo del Prado', NULL, 'Public Domain', NULL),

-- Saint Peter Chrysologus
('/saints/saint-peter-chrysologus.webp', 'Saint Peter Chrysologus', 'painting', 'Saint Peter Chrysologus Painting', 'School of Guercino', '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-peter-chrysologus-&-cassian_fontana.webp', 'Assumption of the Virgin with Saints Peter Chrysologus and Cassian', 'painting', 'Assumption of the Virgin with Saints Peter Chrysologus and Cassian Painting', 'Lavinia Fontana', '1583', NULL, NULL, 'Public Domain', NULL),

-- Saint Ignatius of Loyola
('/saints/saint-ignatius-of-loyola_rubens.webp', 'Saint Ignatius of Loyola', 'painting', 'Saint Ignatius of Loyola Painting', 'Peter Paul Rubens', '1620-1622', 'Norton Simon Museum', NULL, 'Public Domain', NULL),
('/saints/saint-ignatius-of-loyola_rubens_miracle.webp', 'Miracle of Saint Ignatius of Loyola', 'painting', 'Miracle of Saint Ignatius of Loyola Painting', 'Peter Paul Rubens', '1617-1618', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-ignatius-of-loyola_zurbaran.webp', 'Saint Ignatius of Loyola', 'painting', 'Saint Ignatius of Loyola Painting', 'Francisco de Zurbarán', '17th Century', 'Royal Collection of the British royal family', NULL, 'Public Domain', NULL),
('/saints/saint-ignatius-of-loyola.webp', 'Ignatius convalesces at Loyola', 'painting', 'Ignatius convalesces at Loyola Painting', 'Albert Chevallier Tayler', '1904', NULL, NULL, 'Public Domain', NULL),

-- =========================
-- August Saints
-- =========================

-- Saint Alphonsus Liguori
('/saints/saint-alphonsus-liguori.webp', 'Saint Alphonsus Liguori', 'painting', 'Saint Alphonsus Liguori Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-alphonsus-liguori_2.webp', 'Saint Alphonsus Liguori', 'painting', 'Saint Alphonsus Liguori Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-alphonsus-liguori_3.webp', 'Saint Alphonsus Liguori', 'painting', 'Saint Alphonsus Liguori Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-alphonsus-liguori_4.webp', 'Saint Alphonsus Liguori', 'painting', 'Saint Alphonsus Liguori Painting', NULL, '1850', NULL, NULL, 'Public Domain', NULL),

-- Saint Eusebius of Vercelli
('/saints/saint-eusebius-of-vercelli.webp', 'Saint Eusebius of Vercelli', 'painting', 'Saint Eusebius of Vercelli Painting', NULL, NULL, 'Vercelli Cathedral', NULL, 'Public Domain', NULL),
('/saints/saint-eusebius-of-vercelli_2.webp', 'Saint Eusebius of Vercelli', 'painting', 'Saint Eusebius of Vercelli Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-eusebius-of-vercelli-&-roch-&-sebastian_ricci.webp', 'Saint Eusebius of Vercelli with Saints Roch and Sebastian', 'painting', 'Saint Eusebius of Vercelli with Saints Roch and Sebastian Painting', 'Sebastiano Ricci', '1724-1725', 'University of Turin', NULL, 'Public Domain', NULL),

-- Saint Peter Julian Eymard
('/saints/saint-peter-julian-eymard.webp', 'Saint Peter Julian Eymard', 'painting', 'Saint Peter Julian Eymard Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-peter-julian-eymard_2.webp', 'Saint Peter Julian Eymard', 'photograph', 'Saint Peter Julian Eymard Photograph', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint John Vianney
('/saints/saint-john-vianney_briggs.webp', 'Saint John Vianney', 'painting', 'Saint John Vianney Painting', 'Gwyneth Thompson Briggs', '2022', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-vianney_desvallieres.webp', 'Saint John Vianney', 'painting', 'Saint John Vianney Painting', 'George Desvallières', '1920', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-vianney.webp', 'Saint John Vianney', 'illustration', 'Saint John Vianney Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-vianney_2.webp', 'Saint John Vianney', 'painting', 'Saint John Vianney Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-vianney_borel.webp', 'Saint John Vianney', 'fresco', 'Saint John Vianney Fresco', 'Paul Borel', '1907', 'Basilique d''Ars', NULL, 'Public Domain', NULL),

-- Saint Sixtus II and Companions
('/saints/saint-sixtus-ii_botticelli.webp', 'Saint Sixtus II', 'fresco', 'Saint Sixtus II Fresco', 'Sandro Botticelli', '1481-1482', 'Sistine Chapel', NULL, 'Public Domain', NULL),
('/saints/saint-sixtus-ii.webp', 'Saint Sixtus II', 'mosaic', 'Saint Sixtus II Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),

-- Saint Cajetan
('/saints/saint-cajetan_tiepolo.webp', 'Saint Cajetan', 'painting', 'Saint Cajetan Painting', 'Giambattista Tiepolo', '1710-1736', 'Museu Nacional de Belas Artes', NULL, 'Public Domain', NULL),
('/saints/saint-cajetan_ricci.webp', 'Saint Cajetan Comforting a Dying Man', 'painting', 'Saint Cajetan Comforting a Dying Man Painting', 'Sebastiano Ricci', '1704', 'Pinacoteca di Brera', NULL, 'Public Domain', NULL),
('/saints/saint-cajetan_solimena.webp', 'Saint Cajetan in Glory', 'painting', 'Saint Cajetan in Glory Painting', 'Francesco Solimena', '1725', 'San Gaetano (Vicenza)', NULL, 'Public Domain', NULL),

-- Saint Dominic
('/saints/saint-dominic_coello.webp', 'Saint Dominic', 'painting', 'Saint Dominic Painting', 'Claudio Coello', '1685', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-dominic_cavallino.webp', 'The Vision of Saint Dominic', 'painting', 'The Vision of Saint Dominic Painting', 'Bernardo Cavallino', '1640-1645', 'National Gallery of Canada', NULL, 'Public Domain', NULL),
('/saints/saint-dominic_campeche.webp', 'Saint Dominic', 'painting', 'Saint Dominic Painting', 'José Campeche', '1790', 'Art Gallery of Ontario', NULL, 'Public Domain', NULL),

-- Saint Teresa Benedicta of the Cross
('/saints/saint-teresa-benedicta-of-the-cross_ferreira_no-watermark.webp', 'Saint Teresa Benedicta of the Cross', 'painting', 'Saint Teresa Benedicta of the Cross Painting', 'Ruben Ferreira', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-teresa-benedicta-of-the-cross_passport.webp', 'Saint Teresa Benedicta of the Cross', 'photograph', 'Saint Teresa Benedicta of the Cross Photograph', NULL, '1938-1939', 'Passport', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-benedicta-of-the-cross.webp', 'Saint Teresa Benedicta of the Cross', 'painting', 'Saint Teresa Benedicta of the Cross Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Lawrence
('/saints/saint-lawrence_briggs.webp', 'Saint Lawrence', 'painting', 'Saint Lawrence Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-lawrence_santacroce.webp', 'Saint Lawrence', 'painting', 'Saint Lawrence Painting', 'Girolamo da Santacroce', '1520-1530', 'Courtauld Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence_champaigne_martyr.webp', 'The Martyrdom of Saint Lawrence', 'painting', 'The Martyrdom of Saint Lawrence Painting', 'Jean Baptiste de Champaigne', '1660', 'National Gallery of Art (Washington, D.C.)', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence_limosin.webp', 'Saint Lawrence', 'painting', 'Saint Lawrence Painting', 'Jean Limosin', '17th Century', 'Museum of Fine Arts of Lyon', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence_cali.webp', 'Saint Lawrence', 'painting', 'Saint Lawrence Painting', 'Giuseppe Calì', '1889', 'Saint Lawrence Church (Gozo)', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence_titian_martyr.webp', 'The Martyrdom of Saint Lawrence', 'painting', 'The Martyrdom of Saint Lawrence Painting', 'Titian', '1564-1567', 'El Escorial', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence_strozzi.webp', 'Saint Lawrence Distributing the Treasures of the Church', 'painting', 'Saint Lawrence Distributing the Treasures of the Church Painting', 'Bernardo Strozzi', '1625', 'North Carolina Museum of Art', NULL, 'Public Domain', NULL),

-- Saint Clare
('/saints/saint-clare_crivelli.webp', 'Saint Clare', 'painting', 'Saint Clare Painting', 'Carlo Crivelli', '1470', 'Polo Museale di San Francesco in Montefiore dell''Aso', NULL, 'Public Domain', NULL),
('/saints/saint-clare_martini.webp', 'Saint Clare', 'fresco', 'Saint Clare Fresco', 'Simone Martini', '1322-1326', 'Lower Basilica of San Francesco', NULL, 'Public Domain', NULL),
('/saints/saint-clare_moroni.webp', 'Saint Clare', 'painting', 'Saint Clare Painting', 'Giovanni Battista Moroni', '1548', 'Tridentine Diocesan Museum', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-clare_arco.webp', 'Saint Clare', 'painting', 'Saint Clare Painting', 'Alonso del Arco', '17th Century', 'The Bowes Museum', NULL, 'Public Domain', NULL),

-- Saint Jane Frances de Chantal
('/saints/saint-jane-frances-de-chantal.webp', 'Saint Jane Frances de Chantal', 'painting', 'Saint Jane Frances de Chantal Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-jane-frances-de-chantal_2.webp', 'Saint Jane Frances de Chantal', 'painting', 'Saint Jane Frances de Chantal Painting', NULL, '19th Century', 'Monastery of the Visitation of Holy Mary in Toledo (Ohio)', NULL, 'Public Domain', NULL),
-- Already seeded in Saint Francis de Sales block (shared artwork):
-- ('/saints/saint-francis-de-sales-&-jane-frances-de-chantal.webp', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal', 'painting', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal Painting', NULL, NULL, 'Monastery of the Visitation (Paris)', NULL, 'Public Domain', NULL),
-- ('/saints/saint-francis-de-sales-&-jane-frances-de-chantal_bayeu.webp', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal', 'painting', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal Painting', 'Francisco Bayeu', '18th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),
-- ('/saints/saint-francis-de-sales-&-jane-frances-de-chantal_halle.webp', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal', 'painting', 'Saint Francis de Sales gives the Rule of the Order of the Visitation to Saint Jane Frances de Chantal Painting', 'Noël Hallé', '18th Century', 'Saint-Louis-en-l''Île Church', NULL, 'Public Domain', NULL),

-- Saint Pontian
('/saints/saint-pontian_aretino.webp', 'Saint Pontian', 'painting', 'Saint Pontian Painting', 'Aretino', '1530-1535', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-pontian_montor.webp', 'Saint Pontian', 'illustration', 'Saint Pontian Illustration', 'Alexis-François Artaud de Montor', '1842', 'Book : "The Lives and Times of the Popes"', NULL, 'Public Domain', NULL),
('/saints/saint-pontian.webp', 'Saint Pontian', 'mosaic', 'Saint Pontian Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),
('/saints/saint-pontian_echave_martyr.webp', 'The Martyrdom of Saint Pontian', 'painting', 'The Martyrdom of Saint Pontian Painting', 'Baltasar de Echave Orio', '1612', 'Museo Nacional de Arte (Mexico)', NULL, 'Public Domain', NULL),

-- Saint Hippolytus of Rome
('/saints/saint-hippolytus-of-rome.webp', 'Saint Hippolytus of Rome', 'icon', 'Saint Hippolytus of Rome Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hippolytus-of-rome_icon.webp', 'Saint Hippolytus of Rome', 'icon', 'Saint Hippolytus of Rome Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hippolytus-of-rome_julien_martyr.webp', 'The Martyrdom of Saint Hippolytus of Rome', 'painting', 'The Martyrdom of Saint Hippolytus of Rome Painting', 'Simon Julien', '1762', 'Lyon Cathedral', NULL, 'Public Domain', NULL),

-- Saint Maximus the Confessor
('/saints/saint-maximus-the-confessor.webp', 'Saint Maximus the Confessor', 'fresco', 'Saint Maximus the Confessor Fresco', NULL, '14th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-maximus-the-confessor_icon.webp', 'Saint Maximus the Confessor', 'icon', 'Saint Maximus the Confessor Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-maximus-the-confessor_icon_2.webp', 'Saint Maximus the Confessor', 'icon', 'Saint Maximus the Confessor Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-maximus-the-confessor_2.webp', 'Saint Maximus the Confessor', 'fresco', 'Saint Maximus the Confessor Fresco', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Stephen of Hungary
('/saints/saint-stephen-of-hungary.webp', 'Saint Stephen of Hungary', 'painting', 'Saint Stephen of Hungary Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-stephen-of-hungary_2.webp', 'Saint Stephen of Hungary', 'painting', 'Saint Stephen of Hungary Painting', NULL, '17th Century', 'Hungarian National Museum', NULL, 'Public Domain', NULL),
('/saints/saint-stephen-of-hungary_verhaghen.webp', 'Saint Stephen of Hungary Receiving the Legate', 'painting', 'Saint Stephen of Hungary Receiving the Legate Painting', 'Pieter-Jozef Verhaghen', '1770', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-stephen-of-hungary_3.webp', 'Saint Stephen of Hungary', 'painting', 'Saint Stephen of Hungary Painting', NULL, '18th Century', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),

-- Saint John Eudes
('/saints/saint-john-eudes.webp', 'Saint John Eudes', 'painting', 'Saint John Eudes Painting', NULL, '1673', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-eudes_2.webp', 'Saint John Eudes', 'painting', 'Saint John Eudes Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Bernard
('/saints/saint-bernard_latil.webp', 'Saint Bernard', 'painting', 'Saint Bernard Painting', 'François Vincent Latil', '19th Century', 'Saint-Étienne-du-Mont (Paris)', NULL, 'Public Domain', NULL),
('/saints/saint-bernard_greco.webp', 'Saint Bernard', 'painting', 'Saint Bernard Painting', 'El Greco', '1577-1579', 'Hermitage Museum', NULL, 'Public Domain', NULL),
('/saints/saint-bernard_goya.webp', 'Saint Bernard of Clairvaux Curing a Cripple', 'painting', 'Saint Bernard of Clairvaux Curing a Cripple Painting', 'Francisco Goya', '1787', 'Real Monasterio de San Joaquín y Santa Ana', NULL, 'Public Domain', NULL),
('/saints/saint-bernard_ribalta.webp', 'Christ Embracing Saint Bernard', 'painting', 'Christ Embracing Saint Bernard Painting', 'Francisco Ribalta', '1625-1627', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-bernard_cano.webp', 'The Vision of Saint Bernard', 'painting', 'The Vision of Saint Bernard Painting', 'Alonso Cano', '1650', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-bernard_signol.webp', 'Saint Bernard preaching the second Crusade at Vezelay', 'painting', 'Saint Bernard preaching the second Crusade at Vezelay Painting', 'Émile Signol', '1840', 'Château de Versailles', NULL, 'Public Domain', NULL),
('/saints/saint-bernard_vivar.webp', 'Saint Bernard', 'painting', 'Saint Bernard Painting', 'Juan Correa de Vivar', '1540-1545', 'Museo del Prado', NULL, 'Public Domain', NULL),

-- Saint Maximilian Kolbe
('/saints/saint-maximilian-kolbe_pawlowski.webp', 'Saint Maximilian Kolbe', 'painting', 'Saint Maximilian Kolbe Painting', 'Kevin Pawlowski', '2023', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-maximilian-kolbe.webp', 'Saint Maximilian Kolbe', 'photograph', 'Saint Maximilian Kolbe Photograph', NULL, '1936', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-maximilian-kolbe_2.webp', 'Saint Maximilian Kolbe', 'painting', 'Saint Maximilian Kolbe Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Pius X
('/saints/saint-pius-x_gerrer.webp', 'Saint Pius X', 'painting', 'Saint Pius X Painting', 'Gregory Gerrer', '1904', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-pius-x.webp', 'Saint Pius X', 'photograph', 'Saint Pius X Photograph', 'Ernest Walter Histed', '1914', 'National Portrait Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-pius-x_bordignon.webp', 'Saint Pius X', 'painting', 'Saint Pius X Painting', 'Noè Bordignon', '1920', 'Diocesan museum of Padua (Italy)', NULL, 'Public Domain', NULL),

-- Saint Rose of Lima
('/saints/saint-rose-of-lima_coello.webp', 'Saint Rose of Lima', 'painting', 'Saint Rose of Lima Painting', 'Claudio Coello', '1683', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-rose-of-lima.webp', 'Saint Rose of Lima with Child Jesus', 'painting', 'Saint Rose of Lima with Child Jesus Painting', NULL, '17th Century', 'Lima Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-rose-of-lima_medoro.webp', 'Saint Rose of Lima', 'painting', 'Saint Rose of Lima Painting', 'Angelino Medoro', '1617', 'Santuario de Santa Rosa (Lima)', NULL, 'Public Domain', NULL),
('/saints/saint-rose-of-lima_laso.webp', 'Saint Rose of Lima', 'painting', 'Saint Rose of Lima Painting', 'Francisco Laso', '1859', 'Pinacoteca Municipal Ignacio Merino', NULL, 'Public Domain', NULL),
('/saints/saint-rose-of-lima_murillo.webp', 'Saint Rose of Lima', 'painting', 'Saint Rose of Lima Painting', 'Bartolomé Esteban Murillo', '1670-1680', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-rose-of-lima_briggs.webp', 'Saint Rose of Lima', 'painting', 'Saint Rose of Lima Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Bartholomew, Apostle
('/saints/saint-bartholomew-apostle_rubens.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Peter Paul Rubens', '1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_dyck.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Anthony van Dyck', '1618-1620', 'Staatliche Kunstsammlungen Dresden', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_ribera.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Jusepe de Ribera', '1630', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_zurbaran.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_rembrandt.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Rembrandt', '1657', 'Timken Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_rembrandt_2.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Rembrandt', '1661', 'Getty Center', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_cavallino.webp', 'Saint Bartholomew the Apostle', 'painting', 'Saint Bartholomew the Apostle Painting', 'Bernardo Cavallino', '17th Century', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_ribera_martyr.webp', 'The Martyrdom of Saint Bartholomew', 'painting', 'The Martyrdom of Saint Bartholomew Painting', 'Jusepe de Ribera', '1616-1617', 'Colegiata de Nuestra Señora de la Asunción', NULL, 'Public Domain', NULL),
('/saints/saint-bartholomew-apostle_tiepolo_martyr.webp', 'The Martyrdom of Saint Bartholomew', 'painting', 'The Martyrdom of Saint Bartholomew Painting', 'Giambattista Tiepolo', '1722', 'San Stae', NULL, 'Public Domain', NULL),

-- Saint Louis (of France)
('/saints/saint-louis_signol.webp', 'Saint Louis', 'painting', 'Saint Louis Painting', 'Émile Signol', '1844', 'Château de Versailles', NULL, 'Public Domain', NULL),
('/saints/saint-louis_lagrenee.webp', 'Meeting between Innocent IV and Saint Louis', 'painting', 'Meeting between Innocent IV and Saint Louis Painting', 'Louis-Jean-François Lagrenée', '1773', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-louis_cabanel.webp', 'The Glorification of Saint Louis', 'painting', 'The Glorification of Saint Louis Painting', 'Alexandre Cabanel', '1853-1855', 'Musée Fabre', NULL, 'Public Domain', NULL),
('/saints/saint-louis_greco.webp', 'Saint Louis', 'painting', 'Saint Louis Painting', 'El Greco', '1592', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-louis_loo.webp', 'Coronation of Saint Louis', 'painting', 'Coronation of Saint Louis Painting', 'Charles-Amédée-Philippe van Loo', '1773', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-louis_decreuse.webp', 'Saint Louis', 'painting', 'Saint Louis Painting', 'Auguste de Creuse', '1837', 'Château de Versailles', NULL, 'Public Domain', NULL),
('/saints/saint-louis_vien.webp', 'Saint Louis entrusted the Regency of the Kingdom to his mother Queen Blanche of Castile', 'painting', 'Saint Louis entrusted the Regency of the Kingdom to his mother Queen Blanche of Castile Painting', 'Joseph-Marie Vien', '1773', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/saint-louis_thevenin.webp', 'Saint Louis', 'painting', 'Saint Louis Painting', 'Charles Thévenin', '19th Century', 'Château de Versailles', NULL, 'Public Domain', NULL),
--Care copyright versailles ...

-- Saint Joseph Calasanz
('/saints/saint-joseph-calasanz_casanova.webp', 'Saint Joseph Calasanz', 'painting', 'Saint Joseph Calasanz Painting', 'Francisco Jover y Casanova', '1879', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-joseph-calasanz_corvi.webp', 'Saint Joseph Calasanz Resuscitating a Child', 'painting', 'Saint Joseph Calasanz Resuscitating a Child Painting', 'Domenico Corvi', '1767', 'Wadsworth Atheneum', NULL, 'Public Domain', NULL),
('/saints/saint-joseph-calasanz_goya.webp', 'Last Communion of Saint Joseph Calasanz', 'painting', 'Last Communion of Saint Joseph Calasanz Painting', 'Francisco Goya', '1819', NULL, NULL, 'Public Domain', NULL),

-- Saint Monica
('/saints/saint-monica_cabanel.webp', 'Saint Monica', 'painting', 'Saint Monica Painting', 'Alexandre Cabanel', '1845', 'Milwaukee Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-hippo-&-monica_scheffer.webp', 'Saint Augustine and Saint Monica', 'painting', 'Saint Augustine and Saint Monica Painting', 'Ary Scheffer', '1854', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-monica_gozzoli.webp', 'Saint Monica', 'fresco', 'Saint Monica Fresco', 'Benozzo Gozzoli', '1464-1465', 'Church of Sant''Agostino (San Gimignano)', NULL, 'Public Domain', NULL),

-- Saint Augustine of Hippo
('/saints/saint-augustine-of-hippo_champaigne.webp', 'Saint Augustine of Hippo', 'painting', 'Saint Augustine of Hippo Painting', 'Philippe de Champaigne', '1645', 'Los Angeles County Museum of Art', NULL, 'Public Domain', NULL),
--already seeded
-- ('/saints/saint-augustine-of-hippo-&-monica_scheffer.webp', 'Saint Augustine and Saint Monica', 'painting', 'Saint Augustine and Saint Monica Painting', 'Ary Scheffer', '1854', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-hippo_coello.webp', 'Saint Augustine of Hippo', 'painting', 'Saint Augustine of Hippo Painting', 'Claudio Coello', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-hippo_botticelli.webp', 'Saint Augustine of Hippo', 'painting', 'Saint Augustine of Hippo Painting', 'Sandro Botticelli', '1480', 'Ognissanti Church (Florence)', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-hippo_coello_triumph.webp', 'The Triumph of Saint Augustine', 'painting', 'The Triumph of Saint Augustine Painting', 'Claudio Coello', '1664', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-hippo_rubens.webp', 'Saint Augustine of Hippo', 'painting', 'Saint Augustine of Hippo Painting', 'Peter Paul Rubens', '1636-1638', 'National Gallery Prague', NULL, 'Public Domain', NULL),
('/saints/saint-augustine-of-hippo_rubens_jesus.webp', 'Saint Augustine of Hippo with Christ & Virgin Mary', 'painting', 'Saint Augustine of Hippo with Christ & Virgin Mary Painting', 'Peter Paul Rubens', '1615', 'Royal Academy of Fine Arts of San Fernando', NULL, 'Public Domain', NULL),

-- =========================
-- September saints
-- =========================

-- Saint Gregory the Great
('/saints/saint-gregory-the-great_vien.webp', 'Saint Gregory the Great', 'painting', 'Saint Gregory the Great Painting', 'Joseph-Marie Vien', '1766', 'Musée Fabre', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-the-great_ribera.webp', 'Saint Gregory the Great', 'painting', 'Saint Gregory the Great Painting', 'Jusepe de Ribera', '1614', 'Galleria Nazionale d''Arte Antica (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-the-great_stom.webp', 'Saint Gregory the Great', 'painting', 'Saint Gregory the Great Painting', 'Matthias Stom', '17th Century', 'Kunstmuseum Basel', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-the-great_theodoric.webp', 'Saint Gregory the Great', 'painting', 'Saint Gregory the Great Painting', 'Master Theodoric', '1370', 'National Gallery Prague', NULL, 'Public Domain', NULL),
('/saints/saint-gregory-the-great_gasparro.webp', 'Saint Gregory the Great', 'painting', 'Saint Gregory the Great Painting', 'Giovanni Gasparro', '2017', 'Museo Diocesano (Lecce)', NULL, 'Public Domain', NULL),

-- Saint Teresa of Calcutta
('/saints/saint-teresa-of-calcutta_zumo.webp', 'Saint Teresa of Calcutta', 'painting', 'Saint Teresa of Calcutta Painting', 'Jacob Zumo', '2024', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-calcutta_bettmann.webp', 'Saint Teresa of Calcutta', 'photograph', 'Saint Teresa of Calcutta Photograph', NULL, '1988', 'Bettmann Archive', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-calcutta.webp', 'Saint Teresa of Calcutta', 'photograph', 'Saint Teresa of Calcutta Photograph', NULL, '1995', NULL, NULL, 'Attribution-ShareAlike 2.0 Generic', NULL),

-- Saint Peter Claver
('/saints/saint-peter-claver.webp', 'Saint Peter Claver', 'painting', 'Saint Peter Claver Painting', NULL, NULL, 'Palace of the Inquisition (Cartagena)', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-peter-claver_vitta.webp', 'Saint Peter Claver', 'engraving', 'Saint Peter Claver Engraving', 'Joseph Vitta', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-peter-claver_2.webp', 'Saint Peter Claver', 'painting', 'Saint Peter Claver Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint John Chrysostom
('/saints/saint-john-chrysostom_champaigne.webp', 'Saint John Chrysostom', 'engraving', 'Saint John Chrysostom Engraving', 'Jean-Baptiste de Champaigne', '17th Century', 'Rijksmuseum', NULL, 'Public Domain', NULL),
('/saints/saint-john-chrysostom_wencker.webp', 'Saint John Chrysostom Preaching Before the Empress Eudoxia', 'painting', 'Saint John Chrysostom Preaching Before the Empress Eudoxia Painting', 'Joseph Wencker', '1880-1881', 'Musée Crozatier', NULL, 'Public Domain', NULL),
('/saints/saint-john-chrysostom_mosaic.webp', 'Saint John Chrysostom', 'mosaic', 'Saint John Chrysostom Mosaic', NULL, '9th Century', 'Hagia Sophia (Constantinople)', NULL, 'Public Domain', NULL),

-- Saint Cornelius
('/saints/saint-cornelius.webp', 'Saint Cornelius', 'painting', 'Saint Cornelius Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cornelius_2.webp', 'Saint Cornelius', 'stained_glass', 'Saint Cornelius Stained Glass', 'Master of Saint Severin', '1520-1521', 'Victoria and Albert Museum (London)', NULL, 'Public Domain', NULL),
('/saints/saint-cornelius_mosaic.webp', 'Saint Cornelius', 'mosaic', 'Saint Cornelius Mosaic', NULL, '13th Century', 'Santa Maria in Trastevere (Rome)', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-cornelius_3.webp', 'Saint Cornelius', 'mosaic', 'Saint Cornelius Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),
-- NOTE: saint-anthony-abbot-&-cornelius-&-cyprian_veronese.webp already inserted above (January, saint-anthony-abbot)

-- Saint Cyprian
('/saints/saint-cyprian.webp', 'Saint Cyprian', 'illustration', 'Saint Cyprian Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cyprian_2.webp', 'Saint Cyprian', 'painting', 'Saint Cyprian Painting', 'Master of Messkirch', '1535-1540', 'Staatsgalerie Stuttgart', NULL, 'Public Domain', NULL),
-- NOTE: saint-anthony-abbot-&-cornelius-&-cyprian_veronese.webp already inserted above (January, saint-anthony-abbot)

-- Saint Robert Bellarmine
('/saints/saint-robert-bellarmine.webp', 'Saint Robert Bellarmine', 'painting', 'Saint Robert Bellarmine Painting', NULL, '1622-1623', 'Plantin–Moretus Museum (Antwerp)', NULL, 'Public Domain', NULL),
('/saints/saint-robert-bellarmine_2.webp', 'Saint Robert Bellarmine', 'painting', 'Saint Robert Bellarmine Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Hildegard of Bingen
('/saints/saint-hildegard-of-bingen.webp', 'Saint Hildegard von Bingen receives a divine inspiration and passes it on to her scribe', 'illumination', 'Saint Hildegard von Bingen receives a divine inspiration and passes it on to her scribe Illumination', NULL, '1151', 'Rupertsberg Codex of Liber Scivias', NULL, 'Public Domain', NULL),
('/saints/saint-hildegard-of-bingen_2.webp', 'Saint Hildegard of Bingen', 'fresco', 'Saint Hildegard of Bingen Fresco', NULL, NULL, 'Eibingen Abbey', NULL, 'Public Domain', NULL),
('/saints/saint-hildegard-of-bingen_3.webp', 'Saint Hildegard of Bingen', 'painting', 'Saint Hildegard of Bingen Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hildegard-of-bingen_casparo.webp', 'The Vision of the Church of Saint Hildegard von Bingen', 'painting', 'The Vision of the Church of Saint Hildegard von Bingen Painting', 'Giovanni Gasparro', '2014-2018', NULL, NULL, 'Public Domain', NULL),

-- Saint Januarius
('/saints/saint-januarius_caravaggio.webp', 'Saint Januarius', 'painting', 'Saint Januarius Painting', 'Louis Finson', '1610-1612', 'Palmer Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-januarius_vaccaro.webp', 'The Ascension of Saint Januarius', 'painting', 'The Ascension of Saint Januarius Painting', 'Andrea Vaccaro', '1635', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-januarius_solimena.webp', 'Saint Januarius', 'painting', 'Saint Januarius Painting', 'Francesco Solimena', '1702', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-januarius_solimena_miracle.webp', 'The Miracle of Saint Januarius', 'painting', 'The Miracle of Saint Januarius Painting', 'Francesco Solimena', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-januarius_solimena_prison.webp', 'Saint Januarius visited in prison by Proculus and Sosius', 'painting', 'Saint Januarius visited in prison by Proculus and Sosius Painting', 'Francesco Solimena', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-januarius_gentileschi_martyr.webp', 'The Martyrdom of Saint Januarius in the Amphitheatre at Pozzuoli', 'painting', 'The Martyrdom of Saint Januarius in the Amphitheatre at Pozzuoli Painting', 'Artemisia Gentileschi', '1636-1637', 'Pozzuoli cathedral', NULL, 'Public Domain', NULL),

-- Saint Andrew Kim Tae-gon
('/saints/saint-andrew-kim-tae-gon.webp', 'Saint Andrew Kim Tae-gon', 'painting', 'Saint Andrew Kim Tae-gon Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-andrew-kim-tae-gon-&-companions.webp', 'Saint Andrew Kim Tae-gon and Companions', 'painting', 'Saint Andrew Kim Tae-gon and Companions Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Paul Chong Ha-sang
('/saints/saint-paul-chong-ha-sang_warford_no-watermark.webp', 'Saint Paul Chong Ha-sang', 'painting', 'Saint Paul Chong Ha-sang Painting', 'John Alan Warford', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-paul-chong-ha-sang-&-companions.webp', 'Saint Paul Chong Ha-sang and Companions', 'illustration', 'Saint Paul Chong Ha-sang and Companions Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
-- NOTE: saint-andrew-kim-tae-gon-&-companions.webp already inserted above

-- Saint Matthew, Apostle and Evangelist
('/saints/saint-matthew_rubens.webp', 'Saint Matthew the Apostle and Evangelist', 'painting', 'Saint Matthew Apostle and Evangelist Painting', 'Peter Paul Rubens', '1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_dyck.webp', 'Saint Matthew the Apostle and Evangelist', 'painting', 'Saint Matthew Apostle and Evangelist Painting', 'Anthony van Dyck', '1618-1620', 'King Baudouin Foundation', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_rembrandt.webp', 'The Evangelist Matthew and the Angel', 'painting', 'The Evangelist Matthew and the Angel Painting', 'Rembrandt', '1661', 'Louvre-Lens', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_caravaggio.webp', 'The Inspiration of Saint Matthew', 'painting', 'The Inspiration of Saint Matthew Painting', 'Caravaggio', '1602', 'San Luigi dei Francesi (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_caravaggio_calling.webp', 'The Calling of Saint Matthew', 'painting', 'The Calling of Saint Matthew Painting', 'Caravaggio', '1599-1600', 'San Luigi dei Francesi (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_caravaggio_martyr.webp', 'The Martyrdom of Saint Matthew', 'painting', 'The Martyrdom of Saint Matthew Painting', 'Caravaggio', '1599-1600', 'San Luigi dei Francesi (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_hals.webp', 'Saint Matthew', 'painting', 'Saint Matthew Painting', 'Frans Hals', '1625', 'Odesa Museum of Western and Eastern Art', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_reni.webp', 'Saint Matthew', 'painting', 'Saint Matthew Painting', 'Guido Reni', '1635', 'Pinacoteca Vaticana', NULL, 'Public Domain', NULL),
('/saints/saint-matthew_zurbaran.webp', 'Saint Matthew', 'painting', 'Saint Matthew Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art', NULL, 'Public Domain', NULL),

-- Saint Pius of Pietrelcina
('/saints/saint-pius-of-pietrelcina_2.webp', 'Saint Pius of Pietrelcina', 'painting', 'Saint Pius of Pietrelcina Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-pius-of-pietrelcina_dughetti.webp', 'Saint Pius of Pietrelcina', 'illustration', 'Saint Pius of Pietrelcina Illustration', 'Roberto Dughetti', '1966', NULL, NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-pius-of-pietrelcina.webp', 'Saint Pius of Pietrelcina', 'photograph', 'Saint Pius of Pietrelcina Photograph', 'Elia Stelluto', '20th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-pius-of-pietrelcina_3_no-watermark.webp', 'Saint Pius of Pietrelcina', 'photograph', 'Saint Pius of Pietrelcina Photograph', 'Elia Stelluto', '20th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Cosmas & Saint Damian (shared images — inserted once)
('/saints/saint-cosmas-&-damian.webp', 'Saint Cosmas and Saint Damian', 'illustration', 'Saint Cosmas and Saint Damian Illustration', 'Jean Bourdichon', '1503-1508', 'Bibliothèque Nationale de France', NULL, 'Public Domain', NULL),
('/saints/saint-cosmas-&-damian_2.webp', 'Saint Cosmas and Saint Damian', 'painting', 'Saint Cosmas and Saint Damian Painting', 'Hans von Kulmbach', '1507-1508', 'Germanisches Nationalmuseum', NULL, 'Public Domain', NULL),
('/saints/saint-cosmas-&-damian_3.webp', 'Saint Cosmas and Saint Damian', 'icon', 'Saint Cosmas and Saint Damian Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cosmas-&-damian_4.webp', 'Saint Cosmas and Saint Damian', 'icon', 'Saint Cosmas and Saint Damian Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Vincent de Paul
('/saints/saint-vincent-de-paul_gerome.webp', 'Saint Vincent de Paul', 'painting', 'Saint Vincent de Paul Painting', 'Jean-Léon Gérôme', '1847', 'Musée Jean-Léon Gérôme', NULL, 'Public Domain', NULL),
('/saints/saint-vincent-de-paul_delaroche.webp', 'Saint Vincent de Paul Preaching to the Court of Louis XIII on Behalf of the Abandoned Children', 'painting', 'Saint Vincent de Paul Preaching to the Court of Louis XIII on Behalf of the Abandoned Children Painting', 'Paul Delaroche', '1823', 'Yale University Art Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-vincent-de-paul_tours.webp', 'Saint Vincent de Paul', 'painting', 'Saint Vincent de Paul Painting', 'Simon François de Tours', '17th Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Wenceslaus
('/saints/saint-wenceslaus_caroselli.webp', 'Saint Wenceslaus', 'painting', 'Saint Wenceslaus Painting', 'Angelo Caroselli', '1627-1630', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-wenceslaus_skreta.webp', 'Saint Wenceslaus', 'painting', 'Saint Wenceslaus Painting', 'Karel Škréta', '17th Century', 'National Museum in Warsaw', NULL, 'Public Domain', NULL),
('/saints/saint-wenceslaus_tkadlik.webp', 'Saint Wenceslaus & Saint Ludmila during the Mass', 'painting', 'Saint Wenceslaus & Saint Ludmila during the Mass Painting', 'František Tkadlík', '1837', 'National Gallery Prague', NULL, 'Public Domain', NULL),

-- Saint Lawrence Ruiz
('/saints/saint-lawrence-ruiz_warford_no-watermark.webp', 'Saint Lawrence Ruiz', 'painting', 'Saint Lawrence Ruiz Painting', 'John Alan Warford', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-lawrence-ruiz_stained-glass.webp', 'Saint Lawrence Ruiz', 'stained_glass', 'Saint Lawrence Ruiz Stained Glass', NULL, NULL, 'Cubao Cathedral (Philippines)', NULL, 'Public Domain', NULL),
('/saints/saint-lawrence-ruiz-&-companions.webp', 'Saint Lawrence Ruiz and Companions', 'illustration', 'Saint Lawrence Ruiz and Companions Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Jerome
('/saints/saint-jerome_ribera.webp', 'Saint Jerome', 'painting', 'Saint Jerome Painting', 'Jusepe de Ribera', '1620', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_vanni.webp', 'Saint Jerome', 'painting', 'Saint Jerome Painting', 'Francesco Vanni', '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-jerome_dyck.webp', 'Saint Jerome Meditating in the Desert', 'painting', 'Saint Jerome Meditating in the Desert Painting', 'Anthony van Dyck', '1619', 'Museum Boijmans Van Beuningen', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_caravaggio.webp', 'Saint Jerome Writing', 'painting', 'Saint Jerome Writing Painting', 'Caravaggio', '1605-1606', 'Galleria Borghese (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_brugghen.webp', 'Saint Jerome', 'painting', 'Saint Jerome Painting', 'Hendrick ter Brugghen', '1621', 'The Cleveland Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_durer.webp', 'Saint Jerome in the Wilderness', 'painting', 'Saint Jerome in the Wilderness Painting', 'Albrecht Dürer', '1496', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_vouet.webp', 'Saint Jerome and the Angel', 'painting', 'Saint Jerome and the Angel Painting', 'Simon Vouet', '1622-1625', 'National Gallery of Art (Washington, D.C.)', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_barocci.webp', 'Saint Jerome', 'painting', 'Saint Jerome Painting', 'Federico Barocci', '1600', 'Galleria Borghese', NULL, 'Public Domain', NULL),
('/saints/saint-jerome_goya.webp', 'Saint Jerome in Penitence', 'painting', 'Saint Jerome in Penitence Painting', 'Francisco Goya', '1798', NULL, NULL, 'Public Domain', NULL),

-- =========================
-- October saints
-- =========================

-- Saint Thérèse of the Child Jesus
('/saints/saint-therese-of-the-child-jesus_wingate.webp', 'Saint Thérèse of the Child Jesus', 'painting', 'Saint Thérèse of the Child Jesus Painting', 'Henry Wingate', '2016', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-therese-of-the-child-jesus_celine.webp', 'Saint Thérèse of the Child Jesus', 'painting', 'Saint Thérèse of the Child Jesus Painting', 'Céline Martin', '1925', 'Carmel of Lisieux', NULL, 'Public Domain', NULL),
('/saints/saint-therese-of-the-child-jesus_celine_photo.webp', 'Saint Thérèse of the Child Jesus', 'photograph', 'Saint Thérèse of the Child Jesus Photograph', 'Céline Martin', '1896', 'Carmel of Lisieux', NULL, 'Public Domain', NULL),
('/saints/saint-therese-of-the-child-jesus_celine_photo_2.webp', 'Saint Thérèse of the Child Jesus with Rosary', 'photograph', 'Saint Thérèse of the Child Jesus with Rosary Photograph', 'Céline Martin', '1896', 'Carmel of Lisieux', NULL, 'Public Domain', NULL),
('/saints/saint-therese-of-the-child-jesus_celine_photo_3.webp', 'Saint Thérèse of the Child Jesus dressed as Joan of Arc', 'photograph', 'Saint Thérèse of the Child Jesus dressed as Joan of Arc Photograph', 'Céline Martin', '1895', 'Carmel of Lisieux', NULL, 'Public Domain', NULL),
('/saints/saint-therese-of-the-child-jesus.webp', 'Saint Thérèse of the Child Jesus', 'painting', 'Saint Thérèse of the Child Jesus Painting', NULL, NULL, 'Santa Teresa del Bambin Gesù in Panfilo (Rome)', NULL, 'Public Domain', NULL),

-- Saint Francis of Assisi
('/saints/saint-francis-of-assisi_caravaggio.webp', 'Saint Francis in Prayer', 'painting', 'Saint Francis in Prayer Painting', 'Caravaggio', '1595-1606', 'Galleria Nazionale d''Arte Antica (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_zurbaran.webp', 'Saint Francis of Assisi', 'painting', 'Saint Francis of Assisi Painting', 'Francisco de Zurbarán', '1635-1639', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_fruytiers.webp', 'Saint Francis of Assisi', 'painting', 'Saint Francis of Assisi Painting', 'Philip Fruytiers', '17th Century', 'Royal Museum of Fine Arts Antwerp', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_murillo.webp', 'Saint Francis of Assisi', 'painting', 'Saint Francis of Assisi Painting', 'Bartolomé Esteban Murillo', '1645-1650', 'Cathedral of Our Lady (Antwerp)', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_ribera.webp', 'Saint Francis of Assisi', 'painting', 'Saint Francis of Assisi Painting', 'Jusepe de Ribera', '1642', 'Escurial', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_tiepolo.webp', 'Saint Francis of Assisi receiving the Stigmata', 'painting', 'Saint Francis of Assisi receiving the Stigmata Painting', 'Giambattista Tiepolo', '1767-1769', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_murillo_2.webp', 'Saint Francis embracing Christ on the Cross', 'painting', 'Saint Francis embracing Christ on the Cross Painting', 'Bartolomé Esteban Murillo', '1668-1669', 'Museum of Fine Arts of Seville', NULL, 'Public Domain', NULL),
('/saints/saint-francis-of-assisi_schut.webp', 'Miracle of the Portiuncula', 'painting', 'Miracle of the Portiuncula Painting', 'Cornelis Schut', '1649', 'Royal Museum of Fine Arts Antwerp', NULL, 'Public Domain', NULL),

-- Saint Faustina Kowalska
('/saints/saint-faustina-kowalska.webp', 'Saint Faustina Kowalska', 'painting', 'Saint Faustina Kowalska Painting', 'Stanisław Sztama', '20th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-faustina-kowalska_2.webp', 'Saint Faustina Kowalska & Divine Mercy', 'painting', 'Saint Faustina Kowalska & Divine Mercy Painting', 'Helena Tchórzewska', '20th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-faustina-kowalska_photo.webp', 'Saint Faustina Kowalska', 'photograph', 'Saint Faustina Kowalska Photograph', NULL, '1931', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-faustina-kowalska_3.webp', 'Saint Faustina Kowalska & Divine Mercy', 'painting', 'Saint Faustina Kowalska & Divine Mercy Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Bruno
('/saints/saint-bruno_rosa.webp', 'Saint Bruno', 'painting', 'Saint Bruno Painting', 'Salvator Rosa', '17th Century', 'Complesso di santa Caterina', NULL, 'Public Domain', NULL),
('/saints/saint-bruno_marchesi.webp', 'Saint Bruno', 'painting', 'Saint Bruno Painting', 'Girolamo Marchesi', '1525', 'Walters Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-bruno_mignard.webp', 'Saint Bruno', 'painting', 'Saint Bruno Painting', 'Nicolas Mignard', '1638', 'Calvet Museum', NULL, 'Public Domain', NULL),
('/saints/saint-bruno_lesueur.webp', 'The Death of Saint Bruno', 'painting', 'The Death of Saint Bruno Painting', 'Eustache Le Sueur', '1645-1648', 'Musée du Louvre', NULL, 'Public Domain', NULL),

-- Saint Denis
('/saints/saint-denis.webp', 'Saint Denis', 'painting', 'Saint Denis Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-denis_vien.webp', 'Saint Denis Preaching in Gaul', 'painting', 'Saint Denis Preaching in Gaul Painting', 'Joseph-Marie Vien', '1767', 'Church of Saint-Roch (Paris)', NULL, 'Public Domain', NULL),
('/saints/saint-denis-&-companions_bourdichon.webp', 'Saint Denis & Companions', 'illumination', 'Saint Denis & Companions Illumination', 'Jean Bourdichon', '1475-1500', 'Bibliothèque nationale de France', NULL, 'Public Domain', NULL),
('/saints/saint-denis-&-companions_bonnat_martyr.webp', 'The Martyrdom of Saint Denis & Companions', 'painting', 'The Martyrdom of Saint Denis & Companions Painting', 'Léon Bonnat', '1880', 'Panthéon (Paris)', NULL, 'Public Domain', NULL),

-- Saint John Leonardi
('/saints/saint-john-leonardi.webp', 'Saint John Leonardi', 'painting', 'Saint John Leonardi Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-leonardi_2.webp', 'Saint John Leonardi', 'painting', 'Saint John Leonardi Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-leonardi_3.webp', 'Saint John Leonardi', 'painting', 'Saint John Leonardi Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-leonardi_4.webp', 'Saint John Leonardi', 'painting', 'Saint John Leonardi Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint John Henry Newman
('/saints/saint-john-henry-newman_millais.webp', 'Saint John Henry Newman', 'painting', 'Saint John Henry Newman Painting', 'John Everett Millais', '1881', 'National Portrait Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-john-henry-newman_photo.webp', 'Saint John Henry Newman', 'photograph', 'Saint John Henry Newman Photograph', NULL, '1887', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-henry-newman.webp', 'Saint John Henry Newman', 'painting', 'Saint John Henry Newman Painting', NULL, NULL, 'a Church in Rome', NULL, 'Public Domain', NULL),

-- Saint John XXIII
('/saints/saint-john-xxiii_wenner.webp', 'Saint John XXIII', 'painting', 'Saint John XXIII Painting', 'Kurt Wenner', '2022', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-xxiii_photo.webp', 'Saint John XXIII', 'photograph', 'Saint John XXIII Photograph', 'Fotografia Felici', '1959-1962', 'Catholic News Service', NULL, 'Public Domain', NULL),
('/saints/saint-john-xxiii_photo_2.webp', 'Saint John XXIII', 'photograph', 'Saint John XXIII Photograph', NULL, '1958-1963', NULL, NULL, 'Public Domain', NULL),

-- Saint Callistus I
('/saints/saint-callistus-i.webp', 'Saint Callistus I', 'engraving', 'Saint Callistus I Engraving', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-callistus-i_2.webp', 'Saint Callistus I', 'fresco', 'Saint Callistus I Fresco', NULL, NULL, 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),
('/saints/saint-callistus-i_3.webp', 'Saint Callistus I', 'illustration', 'Saint Callistus I Illustration', 'Giovanni Battista de'' Cavalieri', '1580', 'Book : "Pontificum Romanorum effigies"', NULL, 'CC0 1.0 Universal', NULL),

-- Saint Teresa of Jesus (Teresa of Ávila)
('/saints/saint-teresa-of-jesus_cagnacci.webp', 'Saint Teresa of Jesus', 'painting', 'Saint Teresa of Jesus Painting', 'Guido Cagnacci', '1645', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_murillo.webp', 'Saint Teresa of Jesus', 'painting', 'Saint Teresa of Jesus Painting', 'Bartolomé Esteban Murillo', '1650', 'Museo de Bellas Artes de Gran Canaria', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_bazzani.webp', 'The Ecstasy of Saint Teresa of Jesus', 'painting', 'The Ecstasy of Saint Teresa of Jesus Painting', 'Giuseppe Bazzani', '1745-1750', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_balaca.webp', 'Saint Teresa of Jesus', 'painting', 'Saint Teresa of Jesus Painting', 'Eduardo Balaca', '1877', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_rubens.webp', 'Saint Teresa of Avila''s Vision of the Dove', 'painting', 'Saint Teresa of Avila''s Vision of the Dove Painting', 'Peter Paul Rubens', '1614-1635', 'Fitzwilliam Museum', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_rubens_2.webp', 'Saint Teresa of Jesus', 'painting', 'Saint Teresa of Jesus Painting', 'Peter Paul Rubens', '1615', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_batoni.webp', 'Transverberation of Saint Teresa of Jesus', 'painting', 'Transverberation of Saint Teresa of Jesus Painting', 'Pompeo Batoni', '1743', 'Museo nazionale di Villa Guinigi', NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_vien.webp', 'Saint Teresa of Jesus', 'painting', 'Saint Teresa of Jesus Painting', 'Joseph-Marie Vien', '18th century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-teresa-of-jesus_gerard.webp', 'Saint Teresa of Jesus', 'painting', 'Saint Teresa of Jesus Painting', 'François Gérard', '1827', 'Infirmerie Marie-Thérèse (Paris)', NULL, 'Public Domain', NULL),

-- Saint Hedwig
('/saints/saint-hedwig.webp', 'Saint Hedwig', 'illustration', 'Saint Hedwig Illustration', NULL, '1353', 'Schlackenwerther Codex', NULL, 'Public Domain', NULL),
('/saints/saint-hedwig_2.webp', 'Saint Hedwig', 'illustration', 'Saint Hedwig Illustration', NULL, '20th century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hedwig_3.webp', 'Saint Hedwig', 'illustration', 'Saint Hedwig Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hedwig_4.webp', 'Saint Hedwig', 'painting', 'Saint Hedwig Painting', 'Wojciech Gerson', '1861', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hedwig_5.webp', 'Saint Hedwig', 'painting', 'Saint Hedwig Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-hedwig_6.webp', 'Saint Hedwig', 'illustration', 'Saint Hedwig Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Margaret Mary Alacoque
('/saints/saint-margaret-mary-alacoque.webp', 'Saint Margaret Mary Alacoque', 'painting', 'Saint Margaret Mary Alacoque Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-margaret-mary-alacoque_2.webp', 'Saint Margaret Mary Alacoque', 'painting', 'Saint Margaret Mary Alacoque Painting', NULL, '19th Century', 'Monastery of Paray-le-Monial', NULL, 'Public Domain', NULL),
('/saints/saint-margaret-mary-alacoque_3.webp', 'Saint Margaret Mary Alacoque Vision of Sacred Heart', 'painting', 'Saint Margaret Mary Alacoque Vision of Sacred Heart Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Ignatius of Antioch
('/saints/saint-ignatius-of-antioch.webp', 'The Martyrdom of Saint Ignatius of Antioch', 'painting', 'The Martyrdom of Saint Ignatius of Antioch Painting', NULL, '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-ignatius-of-antioch_2.webp', 'The Martyrdom of Saint Ignatius of Antioch', 'painting', 'The Martyrdom of Saint Ignatius of Antioch Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-ignatius-of-antioch_3.webp', 'Saint Ignatius of Antioch', 'icon', 'Saint Ignatius of Antioch Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Luke, Evangelist
('/saints/saint-luke_reni.webp', 'Saint Luke the Evangelist', 'painting', 'Saint Luke the Evangelist Painting', 'Guido Reni', '1621', 'Bob Jones University (USA)', NULL, 'Public Domain', NULL),
('/saints/saint-luke_borovikovsky.webp', 'Saint Luke the Evangelist', 'painting', 'Saint Luke the Evangelist Painting', 'Vladimir Borovikovsky', '1804-1809', 'State Russian Museum', NULL, 'Public Domain', NULL),
('/saints/saint-luke_hals.webp', 'Saint Luke the Evangelist', 'painting', 'Saint Luke the Evangelist Painting', 'Frans Hals', '1625', 'Odesa Museum of Western and Eastern Art', NULL, 'Public Domain', NULL),
('/saints/saint-luke_weyden.webp', 'Saint Luke Drawing the Virgin', 'painting', 'Saint Luke Drawing the Virgin Painting', 'Rogier van der Weyden', '1435-1440', 'Museum of Fine Arts (Boston)', NULL, 'Public Domain', NULL),
('/saints/saint-luke_guercino.webp', 'Saint Luke Displaying a Painting of the Virgin', 'painting', 'Saint Luke Displaying a Painting of the Virgin Painting', 'Il Guercino', '1652-1653', 'Nelson-Atkins Museum of Art', NULL, 'Public Domain', NULL),

-- Saint John de Brébeuf
('/saints/saint-john-de-brebeuf.webp', 'Saint John de Brébeuf', 'painting', 'Saint John de Brébeuf Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-de-brebeuf_thwaites.webp', 'Saint John de Brébeuf', 'illustration', 'Saint John de Brébeuf Illustration', 'Reuben Gold Thwaites', '1897', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-de-brebeuf-&-companions.webp', 'Saint John de Brébeuf & Companions', 'illustration', 'Saint John de Brébeuf & Companions Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Paul of the Cross
('/saints/saint-paul-of-the-cross.webp', 'Saint Paul of the Cross', 'painting', 'Saint Paul of the Cross Painting', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-paul-of-the-cross_2.webp', 'Saint Paul of the Cross', 'painting', 'Saint Paul of the Cross Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-paul-of-the-cross_3.webp', 'Saint Paul of the Cross', 'painting', 'Saint Paul of the Cross Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-paul-of-the-cross_4.webp', 'Saint Paul of the Cross', 'painting', 'Saint Paul of the Cross Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint John Paul II
('/saints/saint-john-paul-ii_bobnick_no-watermark.webp', 'Saint John Paul II', 'painting', 'Saint John Paul II Painting', 'Dick Bobnick', '2015', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-paul-ii_babailov.webp', 'Saint John Paul II', 'painting', 'Saint John Paul II Painting', 'Igor Babailov', '21st Century', 'Palace of Castel Gandolfo', NULL, 'Public Domain', NULL),
('/saints/saint-john-paul-ii.webp', 'Saint John Paul II', 'photograph', 'Saint John Paul II Photograph', 'Grzegorz Gałązka', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-paul-ii_2.webp', 'Saint John Paul II', 'photograph', 'Saint John Paul II Photograph', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-paul-ii_tsarkova.webp', 'Saint John Paul II', 'painting', 'Saint John Paul II Painting', 'Natalia Tsarkova', '2006', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-paul-ii_tsarkova_2.webp', 'Saint John Paul II', 'painting', 'Saint John Paul II Painting', 'Natalia Tsarkova', '2000', NULL, NULL, 'Public Domain', NULL),

-- Saint John of Capistrano
('/saints/saint-john-of-capistrano_del-arco.webp', 'Saint John of Capistrano', 'painting', 'Saint John of Capistrano Painting', 'Alonso del Arco', '17th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-john-of-capistrano_grassi.webp', 'Saint John of Capistrano', 'painting', 'Saint John of Capistrano Painting', 'Nicolò Grassi', NULL, 'San Francesco della Vigna (Venice)', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-john-of-capistrano.webp', 'Saint John of Capistrano', 'illumination', 'Saint John of Capistrano Illumination', NULL, '1470-1480', NULL, NULL, 'Public Domain', NULL),

-- Saint Anthony Mary Claret
('/saints/saint-anthony-mary-claret.webp', 'Saint Anthony Mary Claret', 'painting', 'Saint Anthony Mary Claret Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-anthony-mary-claret_madrazo.webp', 'Saint Anthony Mary Claret', 'painting', 'Saint Anthony Mary Claret Painting', 'Luis de Madrazo', '19th century', 'Museum of Romanticism (Madrid)', NULL, 'Public Domain', NULL),
('/saints/saint-anthony-mary-claret_pujadas.webp', 'Saint Anthony Mary Claret', 'photograph', 'Saint Anthony Mary Claret Photograph', 'Bernardo Pujadas', '1860', NULL, NULL, 'Public Domain', NULL),

-- Saint Simon, Apostle
('/saints/saint-simon-apostle_rubens.webp', 'Saint Simon the Apostle', 'painting', 'Saint Simon Apostle Painting', 'Peter Paul Rubens', '1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-simon-apostle_dyck.webp', 'Saint Simon the Apostle', 'painting', 'Saint Simon Apostle Painting', 'Anthony van Dyck', '1619-1621', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-simon-apostle_dyck_2.webp', 'Saint Simon the Apostle', 'painting', 'Saint Simon Apostle Painting', 'Anthony van Dyck', '1618-1620', 'Staatliche Kunstsammlungen Dresden', NULL, 'Public Domain', NULL),
('/saints/saint-simon-apostle_rembrandt.webp', 'Saint Simon the Apostle', 'painting', 'Saint Simon Apostle Painting', 'Rembrandt', '1661', 'Kunsthaus Zürich', NULL, 'Public Domain', NULL),
('/saints/saint-simon-apostle_ribera.webp', 'Saint Simon the Apostle', 'painting', 'Saint Simon Apostle Painting', 'Jusepe de Ribera', '1630-1635', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-simon-apostle_zurbaran.webp', 'Saint Simon the Apostle', 'painting', 'Saint Simon Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/saint-simon-apostle-&-jude-apostle_schmidt_martyr.webp', 'The Martyrdom of Saint Simon and Saint Jude', 'painting', 'The Martyrdom of Saint Simon and Saint Jude Painting', 'Martin Johann Schmidt', '1796', 'Spencer Museum of Art (USA)', NULL, 'Public Domain', NULL),

-- Saint Jude, Apostle
('/saints/saint-jude-apostle_dyck.webp', 'Saint Jude the Apostle', 'painting', 'Saint Jude Apostle Painting', 'Anthony van Dyck', '1619-1621', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-jude-apostle_dyck_2.webp', 'Saint Jude the Apostle', 'painting', 'Saint Jude Apostle Painting', 'Anthony van Dyck', '1618-1620', 'Museums of Metz (from Musée du Louvre)', NULL, 'Public Domain', NULL),
('/saints/saint-jude-apostle_ribera.webp', 'Saint Jude the Apostle', 'painting', 'Saint Jude Apostle Painting', 'Jusepe de Ribera', '1630-1635', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-jude-apostle_la-tour.webp', 'Saint Jude the Apostle', 'painting', 'Saint Jude Apostle Painting', 'Georges de La Tour', '1620', 'Musée Toulouse-Lautrec', NULL, 'Public Domain', NULL),
('/saints/saint-jude-apostle_zurbaran.webp', 'Saint Jude the Apostle', 'painting', 'Saint Jude Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
-- NOTE: saint-simon-apostle-&-jude-apostle_schmidt_martyr.webp already inserted above (Saint Simon)

-- =========================
-- November saints
-- =========================

-- Saint Martin de Porres
('/saints/saint-martin-de-porres_briggs.webp', 'Saint Martin de Porres', 'painting', 'Saint Martin de Porres Painting', 'Gwyneth Thompson Briggs', '21st Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-martin-de-porres.webp', 'Saint Martin de Porres', 'illustration', 'Saint Martin de Porres Illustration', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-martin-de-porres_warford.webp', 'Saint Martin de Porres', 'painting', 'Saint Martin de Porres Painting', 'John Alan Warford', NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-martin-de-porres_2.webp', 'Saint Martin de Porres', 'painting', 'Saint Martin de Porres Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Charles Borromeo
('/saints/saint-charles-borromeo_borgianni.webp', 'Saint Charles Borromeo', 'painting', 'Saint Charles Borromeo Painting', 'Orazio Borgianni', '1610', 'Hermitage Museum', NULL, 'Public Domain', NULL),
('/saints/saint-charles-borromeo_figino.webp', 'Saint Charles Borromeo', 'painting', 'Saint Charles Borromeo Painting', 'Giovanni Ambrogio Figino', '1575-1599', 'Pinacoteca Ambrosiana', NULL, 'Public Domain', NULL),
('/saints/saint-charles-borromeo_tiepolo.webp', 'Saint Charles Borromeo', 'painting', 'Saint Charles Borromeo Painting', 'Giambattista Tiepolo', '1767-1769', 'Cincinnati Art Museum', NULL, 'Public Domain', NULL),
('/saints/saint-charles-borromeo_gherardi.webp', 'Saint Charles Borromeo giving Communion to Plague Victims', 'painting', 'Saint Charles Borromeo giving Communion to Plague Victims Painting', 'Antonio Gherardi', '17th Century', 'Moretti Fine Art (Paris)', NULL, 'Public Domain', NULL),
('/saints/saint-charles-borromeo_borgianni_2.webp', 'Saint Charles Borromeo', 'painting', 'Saint Charles Borromeo Painting', 'Orazio Borgianni', '1611-1612', 'San Carlo alle Quattro Fontane (Rome)', NULL, 'Public Domain', NULL),

-- Saint Leo the Great
('/saints/saint-leo-the-great_el-mozo.webp', 'Saint Leo the Great', 'painting', 'Saint Leo the Great Painting', 'Francisco Herrera the Younger', '17th Century', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-leo-the-great.webp', 'Saint Leo the Great', 'painting', 'Saint Leo the Great Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-leo-the-great_2.webp', 'Saint Leo the Great', 'mosaic', 'Saint Leo the Great Mosaic', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),

-- Saint Martin of Tours
('/saints/saint-martin-of-tours_martini.webp', 'Saint Martin of Tours', 'fresco', 'Saint Martin of Tours Fresco', 'Simone Martini', '1322-1326', 'Lower Basilica of San Francesco', NULL, 'Public Domain', NULL),
('/saints/saint-martin-of-tours_dyck.webp', 'Saint Martin Sharing his Cloak with a Beggar', 'painting', 'Saint Martin Sharing his Cloak with a Beggar Painting', 'Anthony van Dyck', '1621', 'Church of Saint Martin (Zaventem)', NULL, 'Public Domain', NULL),
('/saints/saint-martin-of-tours_maes.webp', 'Saint Martin Raising a Man from the Dead', 'painting', 'Saint Martin Raising a Man from the Dead Painting', 'Godfried Maes', '1687', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-martin-of-tours.webp', 'Saint Martin of Tours', 'painting', 'Saint Martin of Tours Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Josaphat
('/saints/saint-josaphat_azovskyj.webp', 'Saint Josaphat', 'painting', 'Saint Josaphat Painting', 'Mykola Azovskyj', '1946', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-josaphat_simmler_martyr.webp', 'The Martyrdom of Saint Josaphat', 'painting', 'The Martyrdom of Saint Josaphat Painting', 'Józef Simmler', '1861', 'National Museum in Warsaw', NULL, 'Public Domain', NULL),
('/saints/saint-josaphat_icon.webp', 'Saint Josaphat', 'icon', 'Saint Josaphat Icon', NULL, NULL, NULL, NULL, 'Attribution-ShareAlike 4.0 International', NULL),

-- Saint Albert the Great
('/saints/saint-albert-the-great_gomez.webp', 'Saint Albert the Great', 'painting', 'Saint Albert the Great Painting', 'Vicente Salvador Gómez', '1660', 'Museu de Belles Arts de València', NULL, 'Public Domain', NULL),
('/saints/saint-albert-the-great.webp', 'Saint Albert the Great', 'painting', 'Saint Albert the Great Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-albert-the-great-&-thomas-aquinas_villamor.webp', 'Saint Albert the Great & Saint Thomas Aquinas', 'painting', 'Saint Albert the Great & Saint Thomas Aquinas Painting', 'Alonso Antonio Villamor', NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Margaret of Scotland
('/saints/saint-margaret-of-scotland_largillierre.webp', 'Saint Margaret of Scotland', 'painting', 'Saint Margaret of Scotland Painting', 'Nicolas de Largillierre', '1692', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-margaret-of-scotland_hole.webp', 'The Landing of Saint Margaret at Queensferry', 'painting', 'The Landing of Saint Margaret at Queensferry Painting', 'William Hole', '1899', 'Scottish National Portrait Gallery', NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-margaret-of-scotland.webp', 'Saint Margaret of Scotland', 'illustration', 'Saint Margaret of Scotland Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Gertrude
('/saints/saint-gertrude_cabrera.webp', 'Saint Gertrude', 'painting', 'Saint Gertrude Painting', 'Miguel Cabrera', '1763', 'Dallas Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-gertrude.webp', 'Saint Gertrude', 'painting', 'Saint Gertrude Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-gertrude_2.webp', 'Saint Gertrude', 'painting', 'Saint Gertrude Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Elizabeth of Hungary
('/saints/saint-elizabeth-of-hungary_martini.webp', 'Saint Elizabeth of Hungary', 'fresco', 'Saint Elizabeth of Hungary Fresco', 'Simone Martini', '1322-1326', 'Lower Basilica of San Francesco', NULL, 'Public Domain', NULL),
('/saints/saint-elizabeth-of-hungary_leighton.webp', 'The Charity of Saint Elizabeth of Hungary', 'painting', 'The Charity of Saint Elizabeth of Hungary Painting', 'Edmund Blair Leighton', '1895', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-elizabeth-of-hungary_collins.webp', 'The Devout Childhood of Saint Elizabeth of Hungary', 'painting', 'The Devout Childhood of Saint Elizabeth of Hungary Painting', 'Charles Alston Collins', '1852', 'Detroit Institute of Arts', NULL, 'Public Domain', NULL),
('/saints/saint-elizabeth-of-hungary_stokes.webp', 'Saint Elizabeth of Hungary', 'painting', 'Saint Elizabeth of Hungary Painting', 'Marianne Stokes', '1920', 'Art Gallery of New South Wales (Sydney)', NULL, 'CC0 1.0 Universal', NULL),

-- Saint Cecilia
('/saints/saint-cecilia_reni.webp', 'Saint Cecilia', 'painting', 'Saint Cecilia Painting', 'Guido Reni', '1606', 'Norton Simon Museum (Los Angeles)', NULL, 'Public Domain', NULL),
('/saints/saint-cecilia_guercino.webp', 'Saint Cecilia', 'painting', 'Saint Cecilia Painting', 'Il Guercino', '1649', 'Dulwich Picture Gallery', NULL, 'Public Domain', NULL),
('/saints/saint-cecilia_paelinck-horgnies.webp', 'Saint Cecilia', 'painting', 'Saint Cecilia Painting', 'Fanny Paelinck-Horgnies', '1829', 'Museum of Fine Arts (Ghent)', NULL, 'Public Domain', NULL),
('/saints/saint-cecilia_gentileschi-&-lanfranco.webp', 'Saint Cecilia', 'painting', 'Saint Cecilia Painting', 'Orazio Gentileschi & Giovanni Lanfranco', '1617-1627', 'National Gallery of Art (Washington, D.C.)', NULL, 'Public Domain', NULL),
('/saints/saint-cecilia_raphael.webp', 'The Ecstasy of Saint Cecilia', 'painting', 'The Ecstasy of Saint Cecilia Painting', 'Raphael', '1514', 'Pinacoteca Nazionale di Bologna', NULL, 'Public Domain', NULL),
('/saints/saint-cecilia_saraceni_martyr.webp', 'The Martyrdom of Saint Cecilia', 'painting', 'The Martyrdom of Saint Cecilia Painting', 'Carlo Saraceni', '1610', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-cecilia_madrazo.webp', 'The Burial of Saint Cecilia', 'painting', 'The Burial of Saint Cecilia Painting', 'Luis de Madrazo', '1852', 'Museo del Prado', NULL, 'Public Domain', NULL),

-- Saint Clement I
('/saints/saint-clement-i_fresco.webp', 'Saint Clement I', 'fresco', 'Saint Clement I Fresco', NULL, '5th Century', 'Santa Maria Antiqua Church', NULL, 'CC0 1.0 Universal', NULL),
('/saints/saint-clement-i.webp', 'Saint Clement I', 'painting', 'Saint Clement I Painting', NULL, '19th Century', 'Papal Basilica of Saint Paul Outside the Walls', NULL, 'Public Domain', NULL),
('/saints/saint-clement-i_mosaic.webp', 'Saint Clement I', 'mosaic', 'Saint Clement I Mosaic', NULL, '11th Century', 'Saint Sophia Cathedral (Kyiv)', NULL, 'Public Domain', NULL),
('/saints/saint-clement-i_tiepolo.webp', 'Saint Clement I Vision of the Trinity', 'painting', 'Saint Clement I Vision of the Trinity Painting', 'Giambattista Tiepolo', '1730-1735', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-clement-i_montor.webp', 'Saint Clement I', 'illustration', 'Saint Clement I Illustration', 'Alexis-François Artaud de Montor', '1842', 'Book : "The Lives and Times of the Popes"', NULL, 'Public Domain', NULL),

-- Saint Columban
('/saints/saint-columban.webp', 'Saint Columban', 'illustration', 'Saint Columban Illustration', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-columban_stained-glass.webp', 'Saint Columban', 'stained_glass', 'Saint Columban Stained Glass', NULL, '19th Century', 'Bobbio Abbey', NULL, 'Public Domain', NULL),

-- Saint Andrew Dung-Lac
('/saints/saint-andrew-dung-lac_stained-glass.webp', 'Saint Andrew Dung-Lac', 'stained_glass', 'Saint Andrew Dung-Lac Stained Glass', NULL, NULL, 'Saint Paul Catholic Church (Westerville, Ohio)', NULL, 'Attribution-ShareAlike 3.0 Unported', NULL),
('/saints/saint-andrew-dung-lac-&-companions.webp', 'Saint Andrew Dung-Lac & Companions', 'mosaic', 'Saint Andrew Dung-Lac & Companions Mosaic', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-andrew-dung-lac_warford.webp', 'Saint Andrew Dung-Lac', 'painting', 'Saint Andrew Dung-Lac Painting', 'John Alan Warford', '21st Century', NULL, NULL, 'Public Domain', NULL),

-- Saint Catherine of Alexandria
('/saints/saint-catherine-of-alexandria_caravaggio.webp', 'Saint Catherine of Alexandria', 'painting', 'Saint Catherine of Alexandria Painting', 'Caravaggio', '1598', 'Thyssen-Bornemisza Museum', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_raphael.webp', 'Saint Catherine of Alexandria', 'painting', 'Saint Catherine of Alexandria Painting', 'Raphael', '1507-1509', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_crivelli.webp', 'Saint Catherine of Alexandria', 'painting', 'Saint Catherine of Alexandria Painting', 'Carlo Crivelli', '1470', 'Polo museale di San Francesco', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_murillo.webp', 'Saint Catherine of Alexandria', 'painting', 'Saint Catherine of Alexandria Painting', 'Bartolomé Esteban Murillo', '1650', 'Museum of Fine Arts of Seville', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_guinet.webp', 'Saint Catherine of Alexandria', 'painting', 'Saint Catherine of Alexandria Painting', 'Claude Guinet', '1507', 'Museum of Fine Arts of Lyon', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_gentileschi.webp', 'Saint Catherine of Alexandria', 'painting', 'Saint Catherine of Alexandria Painting', 'Artemisia Gentileschi', '1620', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_gentileschi_2.webp', 'Self Portrait of Artemisia Gentileschi as Saint Catherine', 'painting', 'Self Portrait of Artemisia Gentileschi as Saint Catherine Painting', 'Artemisia Gentileschi', '1616', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_farinati_martyr.webp', 'The Martyrdom of Saint Catherine of Alexandria', 'painting', 'The Martyrdom of Saint Catherine of Alexandria Painting', 'Paolo Farinati', '1579', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-catherine-of-alexandria_lehmann.webp', 'The Translation of the Body of Saint Catherine of Alexandria', 'painting', 'The Translation of the Body of Saint Catherine of Alexandria Painting', 'Henri Lehmann', '1839', 'Musée Fabre', NULL, 'Public Domain', NULL),

-- Saint Andrew, Apostle
('/saints/saint-andrew-apostle_rubens.webp', 'Saint Andrew the Apostle', 'painting', 'Saint Andrew Apostle Painting', 'Peter Paul Rubens', '1611', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-andrew-apostle_dyck.webp', 'Saint Andrew the Apostle', 'painting', 'Saint Andrew Apostle Painting', 'Anthony van Dyck', '17th Century', 'Museo de Arte de Ponce', NULL, 'Public Domain', NULL),
('/saints/saint-andrew-apostle_ribera.webp', 'Saint Andrew the Apostle', 'painting', 'Saint Andrew Apostle Painting', 'Jusepe de Ribera', '17th Century', 'Museo de Arte de Ponce', NULL, 'Public Domain', NULL),
('/saints/saint-andrew-apostle_tournier.webp', 'Saint Andrew the Apostle', 'painting', 'Saint Andrew Apostle Painting', 'Nicolas Tournier', '17th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-andrew-apostle_zurbaran.webp', 'Saint Andrew the Apostle', 'painting', 'Saint Andrew Apostle Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/saint-andrew-apostle_loo.webp', 'Saint Andrew the Apostle', 'painting', 'Saint Andrew Apostle Painting', 'Charles André van Loo', '18th Century', 'Musée des Beaux-Arts d''Angers', NULL, 'Public Domain', NULL),
('/saints/saint-andrew-apostle_murillo_martyr.webp', 'The Martyrdom of Saint Andrew the Apostle', 'painting', 'The Martyrdom of Saint Andrew Apostle Painting', 'Bartolomé Esteban Murillo', '1675-1682', 'Museo del Prado', NULL, 'Public Domain', NULL),

-- =========================
-- December saints
-- =========================

-- Saint Francis Xavier
('/saints/saint-francis-xavier_murillo.webp', 'Saint Francis Xavier', 'painting', 'Saint Francis Xavier Painting', 'Bartolomé Esteban Murillo', '1670', 'Wadsworth Atheneum', NULL, 'Public Domain', NULL),
('/saints/saint-francis-xavier_dyck.webp', 'Saint Francis Xavier', 'painting', 'Saint Francis Xavier Painting', 'Anthony van Dyck', '1630', 'Pinacoteca Vaticana', NULL, 'Public Domain', NULL),
('/saints/saint-francis-xavier_rubens.webp', 'The Miracles of Saint Francis Xavier', 'painting', 'The Miracles of Saint Francis Xavier Painting', 'Peter Paul Rubens', '1617-1618', 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/saints/saint-francis-xavier_poussin.webp', 'The Miracle of Saint Francis Xavier', 'painting', 'The Miracle of Saint Francis Xavier Painting', 'Nicolas Poussin', '1641-1642', 'Musée du Louvre', NULL, 'Public Domain', NULL),

-- Saint John Damascene
('/saints/saint-john-damascene.webp', 'Saint John Damascene', 'icon', 'Saint John Damascene Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-damascene_homsi.webp', 'Saint John Damascene', 'icon', 'Saint John Damascene Icon', 'Ne''meh Naser Homsi', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-damascene_2.webp', 'Saint John Damascene', 'icon', 'Saint John Damascene Icon', NULL, '14th Century', 'Mount Athos', NULL, 'Public Domain', NULL),
('/saints/saint-john-damascene_3.webp', 'Saint John Damascene', 'illustration', 'Saint John Damascene Illustration', 'Francesco Bartolozzi', '1762', NULL, NULL, 'Public Domain', NULL),

-- Saint Nicholas
('/saints/saint-nicholas_cermak.webp', 'Saint Nicholas', 'painting', 'Saint Nicholas Painting', 'Jaroslav Čermák', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_moretto.webp', 'Saint Nicholas of Bari presents the Rovelli students to Madonna and Child', 'painting', 'Saint Nicholas of Bari presents the Rovelli students to Madonna and Child Painting', 'Moretto da Brescia', '1539', 'Pinacoteca Tosio Martinengo', NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_bourdichon.webp', 'Saint Nicholas Resurrecting the three Butchered Children', 'illustration', 'Saint Nicholas Resurrecting the three Butchered Children Illustration', 'Jean Bourdichon', '1503-1508', 'Les Grandes Heures d''Anne de Bretagne', NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_icon.webp', 'Saint Nicholas', 'icon', 'Saint Nicholas Icon', 'Aleksa Petrov', '1294', 'Lipno Church', NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_titian.webp', 'Saint Nicholas', 'painting', 'Saint Nicholas Painting', 'Titian', '1563', 'Chiesa di San Sebastiano (Venice)', NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_repin.webp', 'Saint Nicholas of Myra saves Three Innocents from Death', 'painting', 'Saint Nicholas of Myra saves Three Innocents from Death Painting', 'Ilya Repin', '1888', 'State Russian Museum', NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_domenichino_grottaferrata.webp', 'Saint Nicholas', 'fresco', 'Saint Nicholas Fresco', 'Domenichino', '1609-1612', 'Grottaferata Abbey', NULL, 'Public Domain', NULL),
('/saints/saint-nicholas_giordano.webp', 'Saint Nicholas of Bari Saves the Young Cupbearer', 'painting', 'Saint Nicholas of Bari Saves the Young Cupbearer Painting', 'Luca Giordano', '1655', 'Santa Brigida (Naples)', NULL, 'Public Domain', NULL),

-- Saint Ambrose
('/saints/saint-ambrose_goya.webp', 'Saint Ambrose', 'painting', 'Saint Ambrose Painting', 'Francisco Goya', '1796-1799', 'Cleveland Museum of Art', NULL, 'Public Domain', NULL),
('/saints/saint-ambrose_vignon.webp', 'Saint Ambrose', 'painting', 'Saint Ambrose Painting', 'Claude Vignon', '1623-1625', 'Minneapolis Institute of Art', NULL, 'Public Domain', NULL),
('/saints/saint-ambrose_dyck.webp', 'Saint Ambrose barring Theodosius from Milan Cathedral', 'painting', 'Saint Ambrose barring Theodosius from Milan Cathedral Painting', 'Anthony van Dyck', '1619-1620', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-ambrose_subleyras.webp', 'Saint Ambrose Absolving Theodosius', 'painting', 'Saint Ambrose Absolving Theodosius Painting', 'Pierre Subleyras', '1745', 'Galleria Nazionale dell''Umbria', NULL, 'Public Domain', NULL),
('/saints/saint-ambrose_mosaic.webp', 'Saint Ambrose', 'mosaic', 'Saint Ambrose Mosaic', NULL, '1140', 'Palazzo dei Normanni', NULL, 'Public Domain', NULL),
('/saints/saint-ambrose_mosaic_2.webp', 'Saint Ambrose', 'mosaic', 'Saint Ambrose Mosaic', NULL, '4th Century', 'Basilica of Sant''Ambrogio', NULL, 'Public Domain', NULL),

-- Saint Juan Diego Cuauhtlatoatzin
('/saints/saint-juan-diego-cuauhtlatoatzin_berzosa.webp', 'Saint Juan Diego Cuauhtlatoatzin', 'painting', 'Saint Juan Diego Cuauhtlatoatzin Painting', 'Raúl Berzosa', '2016', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-juan-diego-cuauhtlatoatzin_cabrera.webp', 'Saint Juan Diego Cuauhtlatoatzin', 'painting', 'Saint Juan Diego Cuauhtlatoatzin Painting', 'Miguel Cabrera', '1752', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-juan-diego-cuauhtlatoatzin_cabrera_2.webp', 'Saint Juan Diego Cuauhtlatoatzin', 'painting', 'Saint Juan Diego Cuauhtlatoatzin Painting', 'Miguel Cabrera', '18th century', NULL, NULL, 'Public Domain', NULL),

-- Saint Damasus I
('/saints/saint-damasus-i_lithography.webp', 'Saint Damasus I', 'illustration', 'Saint Damasus I Illustration', 'Pedro Augusto Guglielmi', '1840', 'Biblioteca Nacional de Portugal', NULL, 'Public Domain', NULL),
('/saints/saint-damasus-i_cavalieri.webp', 'Saint Damasus I', 'illustration', 'Saint Damasus I Illustration', 'Giovanni Battista de'' Cavalieri', '1580', 'Book : "Pontificum Romanorum effigies"', NULL, 'Public Domain', NULL),
('/saints/saint-damasus-i.webp', 'Saint Damasus I', 'painting', 'Saint Damasus I Painting', 'Juan Carreño de Miranda', '1685', 'Casa de la Villa (Madrid)', NULL, 'Public Domain', NULL),
('/saints/saint-damasus-i_engraving.webp', 'Saint Damasus I', 'engraving', 'Saint Damasus I Engraving', 'Tomás Carlos Capuz', '19th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-damasus-i_montor.webp', 'Saint Damasus I', 'illustration', 'Saint Damasus I Illustration', 'Alexis-François Artaud de Montor', '1842', 'Book : "The Lives and Times of the Popes"', NULL, 'Public Domain', NULL),

-- Saint Lucy
('/saints/saint-lucy_zurbaran.webp', 'Saint Lucy', 'painting', 'Saint Lucy Painting', 'Francisco de Zurbarán', '1635-1640', 'National Gallery of Art (Washington, D.C.)', NULL, 'Public Domain', NULL),
('/saints/saint-lucy_pirez.webp', 'Saint Lucy', 'painting', 'Saint Lucy Painting', 'Álvaro Pires de Évora', '1420', 'Capuchin Convent of Nola', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/saints/saint-lucy_garofalo.webp', 'Saint Lucy', 'painting', 'Saint Lucy Painting', 'Il Garofalo', '1535-1540', 'Capitoline Museums (Rome)', NULL, 'Public Domain', NULL),
('/saints/saint-lucy_ricci.webp', 'Last Communion and Martyrdom of Saint Lucy', 'painting', 'Last Communion and Martyrdom of Saint Lucy Painting', 'Sebastiano Ricci', '1730', 'Santa Lucia Church (Parma)', NULL, 'Public Domain', NULL),
('/saints/saint-lucy_caravaggio.webp', 'The Burial of Saint Lucy', 'painting', 'The Burial of Saint Lucy Painting', 'Caravaggio', '1608', 'Santa Lucia al Sepolcro Church (Syracuse)', NULL, 'Public Domain', NULL),

-- Saint John of the Cross
('/saints/saint-john-of-the-cross_zurbaran.webp', 'Saint John of the Cross', 'painting', 'Saint John of the Cross Painting', 'Francisco de Zurbarán', '1656', 'Archdiocesan Museum in Katowice', NULL, 'Public Domain', NULL),
('/saints/saint-john-of-the-cross_bunel.webp', 'Saint John of the Cross', 'illustration', 'Saint John of the Cross Illustration', 'Michel Bunel', '18th Century', 'Rijksmuseum', NULL, 'Public Domain', NULL),
('/saints/saint-john-of-the-cross.webp', 'Saint John of the Cross', 'painting', 'Saint John of the Cross Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint Peter Canisius
('/saints/saint-peter-canisius.webp', 'Saint Peter Canisius', 'painting', 'Saint Peter Canisius Painting', NULL, '1699', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-peter-canisius_custos.webp', 'Saint Peter Canisius', 'painting', 'Saint Peter Canisius Painting', 'Dominicus Custos', '1600', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-peter-canisius_2.webp', 'Saint Peter Canisius', 'painting', 'Saint Peter Canisius Painting', NULL, '1546', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-peter-canisius_3.webp', 'Saint Peter Canisius', 'painting', 'Saint Peter Canisius Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),

-- Saint John of Kanty
('/saints/saint-john-of-kanty_kuntze.webp', 'Miracle of Saint John of Kanty', 'painting', 'Miracle of Saint John of Kanty Painting', 'Tadeusz Kuntze', '1767', 'National Museum in Kraków', NULL, 'Public Domain', NULL),
('/saints/saint-john-of-kanty.webp', 'Saint John of Kanty', 'painting', 'Saint John of Kanty Painting', NULL, '18th Century', NULL, NULL, 'Public Domain', NULL),
('/saints/saint-john-of-kanty_kotsis.webp', 'Saint John of Kanty before Our Lady', 'painting', 'Saint John of Kanty before Our Lady Painting', 'Aleksander Kotsis', '1865', NULL, NULL, 'Public Domain', NULL),

-- Saint Stephen, the First Martyr
('/saints/saint-stephen-martyr_crivelli.webp', 'Saint Stephen the First Martyr', 'painting', 'Saint Stephen the First Martyr Painting', 'Carlo Crivelli', '1476', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-stephen-martyr_champaigne_martyr.webp', 'The Martyrdom of Saint Stephen', 'painting', 'The Martyrdom of Saint Stephen Painting', 'Philippe de Champaigne', '17th Century', 'Private Collection', NULL, 'Public Domain', NULL),
('/saints/saint-stephen-martyr_rubens.webp', 'The Stoning of Saint Stephen', 'painting', 'The Stoning of Saint Stephen Painting', 'Peter Paul Rubens', '1616-1617', 'Musée des Beaux-Arts de Valenciennes', NULL, 'Public Domain', NULL),
('/saints/saint-stephen-martyr_damaskinos.webp', 'The Stoning of Saint Stephen', 'painting', 'The Stoning of Saint Stephen Painting', 'Michael Damaskinos', '1591', 'Municipal Gallery of Corfu', NULL, 'Public Domain', NULL),
('/saints/saint-stephen-martyr_millais.webp', 'Saint Stephen', 'painting', 'Saint Stephen Painting', 'John Everett Millais', '1895', 'Tate Britain', NULL, 'Public Domain', NULL),

-- Saint John, Apostle and Evangelist
('/saints/saint-john_rubens.webp', 'Saint John the Apostle and Evangelist', 'painting', 'Saint John Apostle and Evangelist Painting', 'Peter Paul Rubens', '1610-1612', 'Museo del Prado', NULL, 'Public Domain', NULL),
('/saints/saint-john_dyck.webp', 'Saint John the Apostle and Evangelist', 'painting', 'Saint John Apostle and Evangelist Painting', 'Anthony van Dyck', '1618-1620', 'Museum of Fine Arts (Budapest)', NULL, 'Public Domain', NULL),
('/saints/saint-john_domenichino.webp', 'Saint John the Apostle and Evangelist', 'painting', 'Saint John Apostle and Evangelist Painting', 'Domenichino', '1621-1629', 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/saints/saint-john_zurbaran.webp', 'Saint John the Apostle and Evangelist', 'painting', 'Saint John Apostle and Evangelist Painting', 'Francisco de Zurbarán', '1633', 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/saints/saint-john_dolci.webp', 'Saint John the Apostle and Evangelist', 'painting', 'Saint John Apostle and Evangelist Painting', 'Carlo Dolci', '1647', 'Pushkin State Museum of Fine Arts (Moscow)', NULL, 'Public Domain', NULL),
('/saints/saint-john_grunewald.webp', 'Saint John Supporting Saint Mary', 'painting', 'Saint John Supporting Saint Mary Painting', 'Matthias Grünewald', '1512-1516', 'Unterlinden Museum', NULL, 'Public Domain', NULL),
('/saints/saint-john_hals.webp', 'Saint John the Apostle and Evangelist', 'painting', 'Saint John Apostle and Evangelist Painting', 'Frans Hals', '1625-1628', 'Getty Center (Los Angeles)', NULL, 'Public Domain', NULL),
('/saints/saint-john_bosch.webp', 'Saint John on Patmos', 'painting', 'Saint John on Patmos Painting', 'Hieronymus Bosch', '1489', 'Gemäldegalerie (Berlin)', NULL, 'Public Domain', NULL),

-- The Holy Innocents, Martyrs
('/saints/holy-innocents_rubens.webp', 'The Virgin and Child Surrounded by the Holy Innocents', 'painting', 'The Virgin and Child Surrounded by the Holy Innocents Painting', 'Peter Paul Rubens', '1616', 'Musée du Louvre', NULL, 'Public Domain', NULL),
('/saints/holy-innocents_reni.webp', 'The Massacre of the Innocents', 'painting', 'The Massacre of the Innocents Painting', 'Guido Reni', '1611', 'Pinacoteca Nazionale di Bologna', NULL, 'Public Domain', NULL),
('/saints/holy-innocents_cogniet.webp', 'The Massacre of the Innocents', 'painting', 'The Massacre of the Innocents Painting', 'Léon Cogniet', '1824', 'Musée des Beaux-Arts de Rennes', NULL, 'Public Domain', NULL),
('/saints/holy-innocents_rubens_2.webp', 'The Massacre of the Innocents', 'painting', 'The Massacre of the Innocents Painting', 'Peter Paul Rubens', '1609-1611', 'Art Gallery of Ontario', NULL, 'Public Domain', NULL),
('/saints/holy-innocents_briggs.webp', 'The Massacre of the Innocents', 'painting', 'The Massacre of the Innocents Painting', 'Gwyneth Thompson Briggs', '2019', NULL, NULL, 'Public Domain', NULL),

-- Saint Thomas Becket
('/saints/saint-thomas-becket.webp', 'Saint Thomas Becket', 'painting', 'Saint Thomas Becket Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-thomas-becket_francke.webp', 'The Martyrdom of Saint Thomas Becket', 'painting', 'The Martyrdom of Saint Thomas Becket Painting', 'Master Francke', '1426', 'Hamburger Kunsthalle', NULL, 'Public Domain', NULL),
('/saints/saint-thomas-becket_2.webp', 'The Martyrdom of Saint Thomas Becket', 'painting', 'The Martyrdom of Saint Thomas Becket Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-thomas-becket_stained-glass.webp', 'Saint Thomas Becket', 'stained_glass', 'Saint Thomas Becket Stained Glass', NULL, '19th Century', 'Church of Saint Peter (Great Berkhamsted)', NULL, 'Public Domain', NULL),

-- Saint Sylvester I
('/saints/saint-sylvester-i.webp', 'Saint Sylvester I', 'painting', 'Saint Sylvester I Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-sylvester-i_2.webp', 'Saint Sylvester I', 'painting', 'Saint Sylvester I Painting', NULL, NULL, NULL, NULL, 'Public Domain', NULL),
('/saints/saint-sylvester-i_icon.webp', 'Saint Sylvester I', 'icon', 'Saint Sylvester I Icon', NULL, NULL, NULL, NULL, 'Public Domain', NULL);

COMMIT;
