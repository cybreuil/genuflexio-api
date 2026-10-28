-- =========================================================
-- Roman General Calendar - (EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- Revised By Pope Paul VI, 1969, after the Second Vatican Council (Vatican II)
-- =========================================================

BEGIN;

-- 1) FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('solemnity-of-mary-the-holy-mother-of-god', 'Solemnity of Mary, the Holy Mother of God', 'marian'),
('saints-basil-the-great-and-gregory-nazianzen-bishops-and-doctors-of-the-church', 'Saints Basil the Great and Gregory Nazianzen, Bishops and Doctors of the Church', 'saint'),
('the-most-holy-name-of-jesus', 'The Most Holy Name of Jesus', 'christological'),
('the-epiphany-of-the-lord', 'The Epiphany of the Lord', 'christological'),
('saint-raymond-of-penyafort-priest', 'Saint Raymond of Penyafort, Priest', 'saint'),
('saint-hilary-bishop-and-doctor-of-the-church', 'Saint Hilary, Bishop and Doctor of the Church', 'saint'),
('saint-anthony-abbot', 'Saint Anthony, Abbot', 'saint'),
('saint-fabian-pope-and-martyr', 'Saint Fabian, Pope and Martyr', 'saint'),
('saint-sebastian-martyr', 'Saint Sebastian, Martyr', 'saint'),
('saint-agnes-virgin-and-martyr', 'Saint Agnes, Virgin and Martyr', 'saint'),
('saint-vincent-deacon-and-martyr', 'Saint Vincent, Deacon and Martyr', 'saint'),
('saint-francis-de-sales-bishop-and-doctor-of-the-church', 'Saint Francis de Sales, Bishop and Doctor of the Church', 'saint'),
('the-conversion-of-saint-paul-the-apostle', 'The Conversion of Saint Paul the Apostle', 'saint'),
('saints-timothy-and-titus-bishops', 'Saints Timothy and Titus, Bishops', 'saint'),
('saint-angela-merici-virgin', 'Saint Angela Merici, Virgin', 'saint'),
('saint-thomas-aquinas-priest-and-doctor-of-the-church', 'Saint Thomas Aquinas, Priest and Doctor of the Church', 'saint'),
('saint-john-bosco-priest', 'Saint John Bosco, Priest', 'saint'),
('the-baptism-of-the-lord', 'The Baptism of the Lord', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- 2) TRANSLATIONS EN
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('solemnity-of-mary-the-holy-mother-of-god', 'Solemnity of Mary, the Holy Mother of God'),
('saints-basil-the-great-and-gregory-nazianzen-bishops-and-doctors-of-the-church', 'Saints Basil the Great and Gregory Nazianzen, Bishops and Doctors of the Church'),
('the-most-holy-name-of-jesus', 'The Most Holy Name of Jesus'),
('the-epiphany-of-the-lord', 'The Epiphany of the Lord'),
('saint-raymond-of-penyafort-priest', 'Saint Raymond of Penyafort, Priest'),
('saint-hilary-bishop-and-doctor-of-the-church', 'Saint Hilary, Bishop and Doctor of the Church'),
('saint-anthony-abbot', 'Saint Anthony, Abbot'),
('saint-fabian-pope-and-martyr', 'Saint Fabian, Pope and Martyr'),
('saint-sebastian-martyr', 'Saint Sebastian, Martyr'),
('saint-agnes-virgin-and-martyr', 'Saint Agnes, Virgin and Martyr'),
('saint-vincent-deacon-and-martyr', 'Saint Vincent, Deacon and Martyr'),
('saint-francis-de-sales-bishop-and-doctor-of-the-church', 'Saint Francis de Sales, Bishop and Doctor of the Church'),
('the-conversion-of-saint-paul-the-apostle', 'The Conversion of Saint Paul the Apostle'),
('saints-timothy-and-titus-bishops', 'Saints Timothy and Titus, Bishops'),
('saint-angela-merici-virgin', 'Saint Angela Merici, Virgin'),
('saint-thomas-aquinas-priest-and-doctor-of-the-church', 'Saint Thomas Aquinas, Priest and Doctor of the Church'),
('saint-john-bosco-priest', 'Saint John Bosco, Priest'),
('the-baptism-of-the-lord', 'The Baptism of the Lord')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- 3) TRANSLATIONS FR
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('solemnity-of-mary-the-holy-mother-of-god', 'Sainte Marie, Mère de Dieu'),
('saints-basil-the-great-and-gregory-nazianzen-bishops-and-doctors-of-the-church', 'Saints Basile le Grand et Grégoire de Nazianze'),
('the-most-holy-name-of-jesus', 'Très Saint Nom de Jésus'),
('the-epiphany-of-the-lord', 'Épiphanie du Seigneur'),
('saint-raymond-of-penyafort-priest', 'Saint Raymond de Penyafort, prêtre'),
('saint-hilary-bishop-and-doctor-of-the-church', 'Saint Hilaire, évêque et docteur de l''Église'),
('saint-anthony-abbot', 'Saint Antoine, abbé'),
('saint-fabian-pope-and-martyr', 'Saint Fabien, pape et martyr'),
('saint-sebastian-martyr', 'Saint Sébastien, martyr'),
('saint-agnes-virgin-and-martyr', 'Sainte Agnès, vierge et martyre'),
('saint-vincent-deacon-and-martyr', 'Saint Vincent, diacre et martyr'),
('saint-francis-de-sales-bishop-and-doctor-of-the-church', 'Saint François de Sales, évêque et docteur de l''Église'),
('the-conversion-of-saint-paul-the-apostle', 'Conversion de saint Paul, apôtre'),
('saints-timothy-and-titus-bishops', 'Saints Timothée et Tite, évêques'),
('saint-angela-merici-virgin', 'Sainte Angèle Merici, vierge'),
('saint-thomas-aquinas-priest-and-doctor-of-the-church', 'Saint Thomas d''Aquin, prêtre et docteur de l''Église'),
('saint-john-bosco-priest', 'Saint Jean Bosco, prêtre'),
('the-baptism-of-the-lord', 'Baptême du Seigneur')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- 4) TRANSLATIONS LA
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('solemnity-of-mary-the-holy-mother-of-god', 'Sancta Dei Genetrix Maria'),
('saints-basil-the-great-and-gregory-nazianzen-bishops-and-doctors-of-the-church', 'Sancti Basilius Magnus et Gregorius Nazianzenus'),
('the-most-holy-name-of-jesus', 'Sanctissimi Nominis Iesu'),
('the-epiphany-of-the-lord', 'Epiphania Domini'),
('saint-raymond-of-penyafort-priest', 'Sanctus Raymundus de Peniafort, Presbyter'),
('saint-hilary-bishop-and-doctor-of-the-church', 'Sanctus Hilarius, Episcopus et Ecclesiae Doctor'),
('saint-anthony-abbot', 'Sanctus Antonius, Abbas'),
('saint-fabian-pope-and-martyr', 'Sanctus Fabianus, Papa et Martyr'),
('saint-sebastian-martyr', 'Sanctus Sebastianus, Martyr'),
('saint-agnes-virgin-and-martyr', 'Sancta Agnes, Virgo et Martyr'),
('saint-vincent-deacon-and-martyr', 'Sanctus Vincentius, Diaconus et Martyr'),
('saint-francis-de-sales-bishop-and-doctor-of-the-church', 'Sanctus Franciscus Salesius, Episcopus et Ecclesiae Doctor'),
('the-conversion-of-saint-paul-the-apostle', 'Conversio Sancti Pauli Apostoli'),
('saints-timothy-and-titus-bishops', 'Sancti Timotheus et Titus, Episcopi'),
('saint-angela-merici-virgin', 'Sancta Angela Merici, Virgo'),
('saint-thomas-aquinas-priest-and-doctor-of-the-church', 'Sanctus Thomas de Aquino, Presbyter et Ecclesiae Doctor'),
('saint-john-bosco-priest', 'Sanctus Ioannes Bosco, Presbyter'),
('the-baptism-of-the-lord', 'Baptisma Domini')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- 5) CELEBRATIONS (fixed)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
-- Christmas octave
('solemnity-of-mary-the-holy-mother-of-god', 1, 1, 'SOLEMNITY', 'WHITE', 'octave', FALSE, 'Wikipedia'),
-- Christmas octave ended
('saints-basil-the-great-and-gregory-nazianzen-bishops-and-doctors-of-the-church', 1, 2, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-most-holy-name-of-jesus', 1, 3, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-epiphany-of-the-lord', 1, 6, 'SOLEMNITY_LORD', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-raymond-of-penyafort-priest', 1, 7, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-hilary-bishop-and-doctor-of-the-church', 1, 13, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-anthony-abbot', 1, 17, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-fabian-pope-and-martyr', 1, 20, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-sebastian-martyr', 1, 20, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-agnes-virgin-and-martyr', 1, 21, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-vincent-deacon-and-martyr', 1, 22, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-francis-de-sales-bishop-and-doctor-of-the-church', 1, 24, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-conversion-of-saint-paul-the-apostle', 1, 25, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saints-timothy-and-titus-bishops', 1, 26, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-angela-merici-virgin', 1, 27, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-thomas-aquinas-priest-and-doctor-of-the-church', 1, 28, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-john-bosco-priest', 1, 31, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- January movable rule:
-- Sunday after 6 January: The Baptism of the Lord
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', 'BAPTISM_OF_THE_LORD', 0, 'normal', FALSE, 'Wikipedia movable'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'FEAST_LORD'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'the-baptism-of-the-lord'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Roman General Calendar - February (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('the-presentation-of-the-lord', 'The Presentation of the Lord', 'christological'),
('saint-blaise-bishop-and-martyr', 'Saint Blaise, Bishop and Martyr', 'saint'),
('saint-ansgar-bishop', 'Saint Ansgar, Bishop', 'saint'),
('saint-agatha-virgin-and-martyr', 'Saint Agatha, Virgin and Martyr', 'saint'),
('saints-paul-miki-and-companions-martyrs', 'Saints Paul Miki and Companions, Martyrs', 'saint'),
('saint-jerome-emiliani-priest', 'Saint Jerome Emiliani, Priest', 'saint'),
('saint-josephine-bakhita-virgin', 'Saint Josephine Bakhita, Virgin', 'saint'),
('saint-scholastica-virgin', 'Saint Scholastica, Virgin', 'saint'),
('our-lady-of-lourdes', 'Our Lady of Lourdes', 'marian'),
('saints-cyril-monk-and-methodius-bishop', 'Saints Cyril, Monk, and Methodius, Bishop', 'saint'),
('the-seven-holy-founders-of-the-servite-order', 'The Seven Holy Founders of the Servite Order', 'saint'),
('saint-peter-damian-bishop-and-doctor-of-the-church', 'Saint Peter Damian, Bishop and Doctor of the Church', 'saint'),
('the-chair-of-saint-peter-the-apostle', 'The Chair of Saint Peter the Apostle', 'saint'),
('saint-polycarp-bishop-and-martyr', 'Saint Polycarp, Bishop and Martyr', 'saint'),
('saint-gregory-of-narek-abbot-and-doctor-of-the-church', 'Saint Gregory of Narek, Abbot and Doctor of the Church', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('the-presentation-of-the-lord', 'The Presentation of the Lord'),
('saint-blaise-bishop-and-martyr', 'Saint Blaise, Bishop and Martyr'),
('saint-ansgar-bishop', 'Saint Ansgar, Bishop'),
('saint-agatha-virgin-and-martyr', 'Saint Agatha, Virgin and Martyr'),
('saints-paul-miki-and-companions-martyrs', 'Saints Paul Miki and Companions, Martyrs'),
('saint-jerome-emiliani-priest', 'Saint Jerome Emiliani, Priest'),
('saint-josephine-bakhita-virgin', 'Saint Josephine Bakhita, Virgin'),
('saint-scholastica-virgin', 'Saint Scholastica, Virgin'),
('our-lady-of-lourdes', 'Our Lady of Lourdes'),
('saints-cyril-monk-and-methodius-bishop', 'Saints Cyril, Monk, and Methodius, Bishop'),
('the-seven-holy-founders-of-the-servite-order', 'The Seven Holy Founders of the Servite Order'),
('saint-peter-damian-bishop-and-doctor-of-the-church', 'Saint Peter Damian, Bishop and Doctor of the Church'),
('the-chair-of-saint-peter-the-apostle', 'The Chair of Saint Peter the Apostle'),
('saint-polycarp-bishop-and-martyr', 'Saint Polycarp, Bishop and Martyr'),
('saint-gregory-of-narek-abbot-and-doctor-of-the-church', 'Saint Gregory of Narek, Abbot and Doctor of the Church')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('the-presentation-of-the-lord', 'La Présentation du Seigneur'),
('saint-blaise-bishop-and-martyr', 'Saint Blaise, évêque et martyr'),
('saint-ansgar-bishop', 'Saint Anschaire, évêque'),
('saint-agatha-virgin-and-martyr', 'Sainte Agathe, vierge et martyre'),
('saints-paul-miki-and-companions-martyrs', 'Saints Paul Miki et ses compagnons, martyrs'),
('saint-jerome-emiliani-priest', 'Saint Jérôme Emilien, prêtre'),
('saint-josephine-bakhita-virgin', 'Sainte Joséphine Bakhita, vierge'),
('saint-scholastica-virgin', 'Sainte Scholastique, vierge'),
('our-lady-of-lourdes', 'Notre-Dame de Lourdes'),
('saints-cyril-monk-and-methodius-bishop', 'Saints Cyrille, moine, et Méthode, évêque'),
('the-seven-holy-founders-of-the-servite-order', 'Les Sept saints fondateurs de l''Ordre des Servites'),
('saint-peter-damian-bishop-and-doctor-of-the-church', 'Saint Pierre Damien, évêque et docteur de l''Église'),
('the-chair-of-saint-peter-the-apostle', 'La Chaire de saint Pierre, Apôtre'),
('saint-polycarp-bishop-and-martyr', 'Saint Polycarpe, évêque et martyr'),
('saint-gregory-of-narek-abbot-and-doctor-of-the-church', 'Saint Grégoire de Narek, abbé et docteur de l''Église')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;
-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('the-presentation-of-the-lord', 'Praesentatio Domini'),
('saint-blaise-bishop-and-martyr', 'Sancti Blasii, Episcopi et Martyris'),
('saint-ansgar-bishop', 'Sancti Anscharii, Episcopi'),
('saint-agatha-virgin-and-martyr', 'Sanctae Agathae, Virginis et Martyris'),
('saints-paul-miki-and-companions-martyrs', 'Sanctorum Pauli Miki et Sociorum, Martyrum'),
('saint-jerome-emiliani-priest', 'Sancti Hieronymi Aemiliani, Presbyteri'),
('saint-josephine-bakhita-virgin', 'Sanctae Iosephinae Bakhita, Virginis'),
('saint-scholastica-virgin', 'Sanctae Scholasticae, Virginis'),
('our-lady-of-lourdes', 'Beatae Mariae Virginis de Lourdes'),
('saints-cyril-monk-and-methodius-bishop', 'Sanctorum Cyrilli, Monachi, et Methodii, Episcopi'),
('the-seven-holy-founders-of-the-servite-order', 'Septem Sanctorum Fundatorum Ordinis Servorum Mariae'),
('saint-peter-damian-bishop-and-doctor-of-the-church', 'Sancti Petri Damiani, Episcopi et Ecclesiae Doctoris'),
('the-chair-of-saint-peter-the-apostle', 'Cathedrae Sancti Petri Apostoli'),
('saint-polycarp-bishop-and-martyr', 'Sancti Polycarpi, Episcopi et Martyris'),
('saint-gregory-of-narek-abbot-and-doctor-of-the-church', 'Sancti Gregorii Narekensis, Abbatis et Ecclesiae Doctoris')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('the-presentation-of-the-lord', 2, 2, 'FEAST_LORD', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-blaise-bishop-and-martyr', 2, 3, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-ansgar-bishop', 2, 3, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-agatha-virgin-and-martyr', 2, 5, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saints-paul-miki-and-companions-martyrs', 2, 6, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-jerome-emiliani-priest', 2, 8, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-josephine-bakhita-virgin', 2, 8, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-scholastica-virgin', 2, 10, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('our-lady-of-lourdes', 2, 11, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-cyril-monk-and-methodius-bishop', 2, 14, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-seven-holy-founders-of-the-servite-order', 2, 17, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-peter-damian-bishop-and-doctor-of-the-church', 2, 21, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-chair-of-saint-peter-the-apostle', 2, 22, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-polycarp-bishop-and-martyr', 2, 23, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-gregory-of-narek-abbot-and-doctor-of-the-church', 2, 27, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - March (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- With movable handling for:
--   - Saint Joseph (March 19)
-- 		if overlaps Holy Week --> Saturday before Palm Sunday
--   - Annunciation (March 25) if overlaps Holy Week / Easter Octave
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-casimir', 'Saint Casimir', 'saint'),
('saints-perpetua-and-felicity-martyrs', 'Saints Perpetua and Felicity, Martyrs', 'saint'),
('saint-john-of-god-religious', 'Saint John of God, Religious', 'saint'),
('saint-frances-of-rome-religious', 'Saint Frances of Rome, Religious', 'saint'),
('saint-patrick-bishop', 'Saint Patrick, Bishop', 'saint'),
('saint-cyril-of-jerusalem-bishop-and-doctor-of-the-church', 'Saint Cyril of Jerusalem, Bishop and Doctor of the Church', 'saint'),
('saint-joseph-spouse-of-the-blessed-virgin-mary', 'Saint Joseph, Spouse of the Blessed Virgin Mary', 'saint'),
('saint-turibius-of-mongrovejo-bishop', 'Saint Turibius of Mongrovejo, Bishop', 'saint'),
('the-annunciation-of-the-lord', 'The Annunciation of the Lord', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-casimir', 'Saint Casimir'),
('saints-perpetua-and-felicity-martyrs', 'Saints Perpetua and Felicity, Martyrs'),
('saint-john-of-god-religious', 'Saint John of God, Religious'),
('saint-frances-of-rome-religious', 'Saint Frances of Rome, Religious'),
('saint-patrick-bishop', 'Saint Patrick, Bishop'),
('saint-cyril-of-jerusalem-bishop-and-doctor-of-the-church', 'Saint Cyril of Jerusalem, Bishop and Doctor of the Church'),
('saint-joseph-spouse-of-the-blessed-virgin-mary', 'Saint Joseph, Spouse of the Blessed Virgin Mary'),
('saint-turibius-of-mongrovejo-bishop', 'Saint Turibius of Mongrovejo, Bishop'),
('the-annunciation-of-the-lord', 'The Annunciation of the Lord')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;
-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-casimir', 'Saint Casimir'),
('saints-perpetua-and-felicity-martyrs', 'Saintes Perpétue et Félicité, martyres'),
('saint-john-of-god-religious', 'Saint Jean de Dieu, religieux'),
('saint-frances-of-rome-religious', 'Sainte Françoise de Rome, religieuse'),
('saint-patrick-bishop', 'Saint Patrick, évêque'),
('saint-cyril-of-jerusalem-bishop-and-doctor-of-the-church', 'Saint Cyrille de Jérusalem, évêque et docteur de l''Église'),
('saint-joseph-spouse-of-the-blessed-virgin-mary', 'Saint Joseph, époux de la Bienheureuse Vierge Marie'),
('saint-turibius-of-mongrovejo-bishop', 'Saint Turibe de Mogrovejo, évêque'),
('the-annunciation-of-the-lord', 'Annonciation du Seigneur')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;
-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-casimir', 'Sanctus Casimirus'),
('saints-perpetua-and-felicity-martyrs', 'Sanctae Perpetua et Felicitas, Martyres'),
('saint-john-of-god-religious', 'Sanctus Ioannes a Deo, Religiosus'),
('saint-frances-of-rome-religious', 'Sancta Francisca Romana, Religiosa'),
('saint-patrick-bishop', 'Sanctus Patricius, Episcopus'),
('saint-cyril-of-jerusalem-bishop-and-doctor-of-the-church', 'Sanctus Cyrillus Hierosolymitanus, Episcopus et Ecclesiae Doctor'),
('saint-joseph-spouse-of-the-blessed-virgin-mary', 'Sanctus Ioseph, Sponsus Beatae Mariae Virginis'),
('saint-turibius-of-mongrovejo-bishop', 'Sanctus Turibius de Mongrovejo, Episcopus'),
('the-annunciation-of-the-lord', 'Annuntiatio Domini')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;
-- Celebrations (fixed; transfer rules for Joseph/Annunciation handled by API engine)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-casimir', 3, 4, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-perpetua-and-felicity-martyrs', 3, 7, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-john-of-god-religious', 3, 8, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-frances-of-rome-religious', 3, 9, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-patrick-bishop', 3, 17, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-cyril-of-jerusalem-bishop-and-doctor-of-the-church', 3, 18, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-turibius-of-mongrovejo-bishop', 3, 23, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Saint Joseph Movable Rule (almost fixed - 19 March - but with movable handling for Holy Week)
-- &
-- Annunciation Movable Rule (almost fixed - 25 March - but with movable handling for Holy Week / Easter Octave)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.movable_offset_days, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-joseph-spouse-of-the-blessed-virgin-mary', 'SAINT_JOSEPH', 0, 'SOLEMNITY', 'normal', FALSE, 'Wikipedia'),
('the-annunciation-of-the-lord', 'ANNUNCIATION', 0, 'SOLEMNITY', 'normal', FALSE, 'Wikipedia')
) AS x(slug, movable_base, movable_offset_days, rank_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - April (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-francis-of-paola-hermit', 'Saint Francis of Paola, Hermit', 'saint'),
('saint-isidore-bishop-and-doctor-of-the-church', 'Saint Isidore, Bishop and Doctor of the Church', 'saint'),
('saint-vincent-ferrer-priest', 'Saint Vincent Ferrer, Priest', 'saint'),
('saint-john-baptist-de-la-salle-priest', 'Saint John Baptist de la Salle, Priest', 'saint'),
('saint-stanislaus-bishop-and-martyr', 'Saint Stanislaus, Bishop and Martyr', 'saint'),
('saint-martin-i-pope-and-martyr', 'Saint Martin I, Pope and Martyr', 'saint'),
('saint-anselm-bishop-and-doctor-of-the-church', 'Saint Anselm, Bishop and Doctor of the Church', 'saint'),
('saint-george-martyr', 'Saint George, Martyr', 'saint'),
('saint-adalbert-bishop-and-martyr', 'Saint Adalbert, Bishop and Martyr', 'saint'),
('saint-fidelis-of-sigmaringen-priest-and-martyr', 'Saint Fidelis of Sigmaringen, Priest and Martyr', 'saint'),
('saint-mark-evangelist', 'Saint Mark, Evangelist', 'saint'),
('saint-peter-chanel-priest-and-martyr', 'Saint Peter Chanel, Priest and Martyr', 'saint'),
('saint-louis-grignon-de-montfort-priest', 'Saint Louis Grignon de Montfort, Priest', 'saint'),
('saint-catherine-of-siena-virgin-and-doctor-of-the-church', 'Saint Catherine of Siena, Virgin and Doctor of the Church', 'saint'),
('saint-pius-v-pope', 'Saint Pius V, Pope', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-francis-of-paola-hermit', 'Saint Francis of Paola, Hermit'),
('saint-isidore-bishop-and-doctor-of-the-church', 'Saint Isidore, Bishop and Doctor of the Church'),
('saint-vincent-ferrer-priest', 'Saint Vincent Ferrer, Priest'),
('saint-john-baptist-de-la-salle-priest', 'Saint John Baptist de la Salle, Priest'),
('saint-stanislaus-bishop-and-martyr', 'Saint Stanislaus, Bishop and Martyr'),
('saint-martin-i-pope-and-martyr', 'Saint Martin I, Pope and Martyr'),
('saint-anselm-bishop-and-doctor-of-the-church', 'Saint Anselm, Bishop and Doctor of the Church'),
('saint-george-martyr', 'Saint George, Martyr'),
('saint-adalbert-bishop-and-martyr', 'Saint Adalbert, Bishop and Martyr'),
('saint-fidelis-of-sigmaringen-priest-and-martyr', 'Saint Fidelis of Sigmaringen, Priest and Martyr'),
('saint-mark-evangelist', 'Saint Mark, Evangelist'),
('saint-peter-chanel-priest-and-martyr', 'Saint Peter Chanel, Priest and Martyr'),
('saint-louis-grignon-de-montfort-priest', 'Saint Louis Grignon de Montfort, Priest'),
('saint-catherine-of-siena-virgin-and-doctor-of-the-church', 'Saint Catherine of Siena, Virgin and Doctor of the Church'),
('saint-pius-v-pope', 'Saint Pius V, Pope')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-francis-of-paola-hermit', 'Saint François de Paule, ermite'),
('saint-isidore-bishop-and-doctor-of-the-church', 'Saint Isidore, évêque et docteur de l''Église'),
('saint-vincent-ferrer-priest', 'Saint Vincent Ferrier, prêtre'),
('saint-john-baptist-de-la-salle-priest', 'Saint Jean-Baptiste de La Salle, prêtre'),
('saint-stanislaus-bishop-and-martyr', 'Saint Stanislas, évêque et martyr'),
('saint-martin-i-pope-and-martyr', 'Saint Martin Ier, pape et martyr'),
('saint-anselm-bishop-and-doctor-of-the-church', 'Saint Anselme, évêque et docteur de l''Église'),
('saint-george-martyr', 'Saint Georges, martyr'),
('saint-adalbert-bishop-and-martyr', 'Saint Adalbert, évêque et martyr'),
('saint-fidelis-of-sigmaringen-priest-and-martyr', 'Saint Fidèle de Sigmaringen, prêtre et martyr'),
('saint-mark-evangelist', 'Saint Marc, évangéliste'),
('saint-peter-chanel-priest-and-martyr', 'Saint Pierre Chanel, prêtre et martyr'),
('saint-louis-grignon-de-montfort-priest', 'Saint Louis-Marie Grignion de Montfort, prêtre'),
('saint-catherine-of-siena-virgin-and-doctor-of-the-church', 'Sainte Catherine de Sienne, vierge et docteur de l''Église'),
('saint-pius-v-pope', 'Saint Pie V, pape')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-francis-of-paola-hermit', 'Sanctus Franciscus de Paula, Eremita'),
('saint-isidore-bishop-and-doctor-of-the-church', 'Sanctus Isidorus, Episcopus et Ecclesiae Doctor'),
('saint-vincent-ferrer-priest', 'Sanctus Vincentius Ferrerius, Presbyter'),
('saint-john-baptist-de-la-salle-priest', 'Sanctus Ioannes Baptista de La Salle, Presbyter'),
('saint-stanislaus-bishop-and-martyr', 'Sanctus Stanislaus, Episcopus et Martyr'),
('saint-martin-i-pope-and-martyr', 'Sanctus Martinus Primus, Papa et Martyr'),
('saint-anselm-bishop-and-doctor-of-the-church', 'Sanctus Anselmus, Episcopus et Ecclesiae Doctor'),
('saint-george-martyr', 'Sanctus Georgius, Martyr'),
('saint-adalbert-bishop-and-martyr', 'Sanctus Adalbertus, Episcopus et Martyr'),
('saint-fidelis-of-sigmaringen-priest-and-martyr', 'Sanctus Fidelis a Sigmaringen, Presbyter et Martyr'),
('saint-mark-evangelist', 'Sanctus Marcus, Evangelista'),
('saint-peter-chanel-priest-and-martyr', 'Sanctus Petrus Chanel, Presbyter et Martyr'),
('saint-louis-grignon-de-montfort-priest', 'Sanctus Ludovicus Maria Grignion de Montfort, Presbyter'),
('saint-catherine-of-siena-virgin-and-doctor-of-the-church', 'Sancta Catharina Senensis, Virgo et Ecclesiae Doctor'),
('saint-pius-v-pope', 'Sanctus Pius Quintus, Papa')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-francis-of-paola-hermit', 4, 2, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-isidore-bishop-and-doctor-of-the-church', 4, 4, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-vincent-ferrer-priest', 4, 5, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-baptist-de-la-salle-priest', 4, 7, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-stanislaus-bishop-and-martyr', 4, 11, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-martin-i-pope-and-martyr', 4, 13, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-anselm-bishop-and-doctor-of-the-church', 4, 21, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-george-martyr', 4, 23, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-adalbert-bishop-and-martyr', 4, 23, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-fidelis-of-sigmaringen-priest-and-martyr', 4, 24, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-mark-evangelist', 4, 25, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-peter-chanel-priest-and-martyr', 4, 28, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-louis-grignon-de-montfort-priest', 4, 28, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-catherine-of-siena-virgin-and-doctor-of-the-church', 4, 29, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-pius-v-pope', 4, 30, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - May (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-joseph-the-worker', 'Saint Joseph the Worker', 'saint'),
('saint-athanasius-bishop-and-doctor-of-the-church', 'Saint Athanasius, Bishop and Doctor of the Church', 'saint'),
('saints-philip-and-james-apostles', 'Saints Philip and James, Apostles', 'saint'),
('saint-john-of-avila-priest-and-doctor-of-the-church', 'Saint John of Ávila, Priest and Doctor of the Church', 'saint'),
('saints-nereus-and-achilleus-martyrs', 'Saints Nereus and Achilleus, Martyrs', 'saint'),
('saint-pancras-martyr', 'Saint Pancras, Martyr', 'saint'),
('our-lady-of-fatima', 'Our Lady of Fatima', 'marian'),
('saint-matthias-apostle', 'Saint Matthias, Apostle', 'saint'),
('saint-john-i-pope-and-martyr', 'Saint John I, Pope and Martyr', 'saint'),
('saint-bernardine-of-siena-priest', 'Saint Bernardine of Siena, Priest', 'saint'),
('saint-christopher-magallanes-priest-and-companions-martyrs', 'Saint Christopher Magallanes, Priest, and Companions, Martyrs', 'saint'),
('saint-rita-of-cascia-religious', 'Saint Rita of Cascia, Religious', 'saint'),
('saint-bede-the-venerable-priest-and-doctor-of-the-church', 'Saint Bede the Venerable, Priest and Doctor of the Church', 'saint'),
('saint-gregory-vii-pope', 'Saint Gregory VII, Pope', 'saint'),
('saint-mary-magdalene-de-pazzi-virgin', 'Saint Mary Magdalene de'' Pazzi, Virgin', 'saint'),
('saint-philip-neri-priest', 'Saint Philip Neri, Priest', 'saint'),
('saint-augustine-of-canterbury-bishop', 'Saint Augustine of Canterbury, Bishop', 'saint'),
('saint-paul-vi-pope', 'Saint Paul VI, Pope', 'saint'),
('the-visitation-of-the-blessed-virgin-mary', 'The Visitation of the Blessed Virgin Mary', 'marian')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-joseph-the-worker', 'Saint Joseph the Worker'),
('saint-athanasius-bishop-and-doctor-of-the-church', 'Saint Athanasius, Bishop and Doctor of the Church'),
('saints-philip-and-james-apostles', 'Saints Philip and James, Apostles'),
('saint-john-of-avila-priest-and-doctor-of-the-church', 'Saint John of Ávila, Priest and Doctor of the Church'),
('saints-nereus-and-achilleus-martyrs', 'Saints Nereus and Achilleus, Martyrs'),
('saint-pancras-martyr', 'Saint Pancras, Martyr'),
('our-lady-of-fatima', 'Our Lady of Fatima'),
('saint-matthias-apostle', 'Saint Matthias, Apostle'),
('saint-john-i-pope-and-martyr', 'Saint John I, Pope and Martyr'),
('saint-bernardine-of-siena-priest', 'Saint Bernardine of Siena, Priest'),
('saint-christopher-magallanes-priest-and-companions-martyrs', 'Saint Christopher Magallanes, Priest, and Companions, Martyrs'),
('saint-rita-of-cascia-religious', 'Saint Rita of Cascia, Religious'),
('saint-bede-the-venerable-priest-and-doctor-of-the-church', 'Saint Bede the Venerable, Priest and Doctor of the Church'),
('saint-gregory-vii-pope', 'Saint Gregory VII, Pope'),
('saint-mary-magdalene-de-pazzi-virgin', 'Saint Mary Magdalene de'' Pazzi, Virgin'),
('saint-philip-neri-priest', 'Saint Philip Neri, Priest'),
('saint-augustine-of-canterbury-bishop', 'Saint Augustine of Canterbury, Bishop'),
('saint-paul-vi-pope', 'Saint Paul VI, Pope'),
('the-visitation-of-the-blessed-virgin-mary', 'The Visitation of the Blessed Virgin Mary')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-joseph-the-worker', 'Saint Joseph, travailleur'),
('saint-athanasius-bishop-and-doctor-of-the-church', 'Saint Athanase, évêque et docteur de l''Église'),
('saints-philip-and-james-apostles', 'Saints Philippe et Jacques, apôtres'),
('saint-john-of-avila-priest-and-doctor-of-the-church', 'Saint Jean d''Avila, prêtre et docteur de l''Église'),
('saints-nereus-and-achilleus-martyrs', 'Saints Nérée et Achillée, martyrs'),
('saint-pancras-martyr', 'Saint Pancrace, martyr'),
('our-lady-of-fatima', 'Notre-Dame de Fatima'),
('saint-matthias-apostle', 'Saint Matthias, apôtre'),
('saint-john-i-pope-and-martyr', 'Saint Jean Ier, pape et martyr'),
('saint-bernardine-of-siena-priest', 'Saint Bernardin de Sienne, prêtre'),
('saint-christopher-magallanes-priest-and-companions-martyrs', 'Saint Christophe Magallanès, prêtre, et ses compagnons, martyrs'),
('saint-rita-of-cascia-religious', 'Sainte Rita de Cascia, religieuse'),
('saint-bede-the-venerable-priest-and-doctor-of-the-church', 'Saint Bède le Vénérable, prêtre et docteur de l''Église'),
('saint-gregory-vii-pope', 'Saint Grégoire VII, pape'),
('saint-mary-magdalene-de-pazzi-virgin', 'Sainte Marie-Madeleine de Pazzi, vierge'),
('saint-philip-neri-priest', 'Saint Philippe Néri, prêtre'),
('saint-augustine-of-canterbury-bishop', 'Saint Augustin de Cantorbéry, évêque'),
('saint-paul-vi-pope', 'Saint Paul VI, pape'),
('the-visitation-of-the-blessed-virgin-mary', 'Visitation de la Bienheureuse Vierge Marie')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-joseph-the-worker', 'Sanctus Ioseph Opifex'),
('saint-athanasius-bishop-and-doctor-of-the-church', 'Sanctus Athanasius, Episcopus et Ecclesiae Doctor'),
('saints-philip-and-james-apostles', 'Sancti Philippus et Iacobus, Apostoli'),
('saint-john-of-avila-priest-and-doctor-of-the-church', 'Sanctus Ioannes de Avila, Presbyter et Ecclesiae Doctor'),
('saints-nereus-and-achilleus-martyrs', 'Sancti Nereus et Achilleus, Martyres'),
('saint-pancras-martyr', 'Sanctus Pancratius, Martyr'),
('our-lady-of-fatima', 'Beata Maria Virgo Fatimensis'),
('saint-matthias-apostle', 'Sanctus Matthias, Apostolus'),
('saint-john-i-pope-and-martyr', 'Sanctus Ioannes I, Papa et Martyr'),
('saint-bernardine-of-siena-priest', 'Sanctus Bernardinus Senensis, Presbyter'),
('saint-christopher-magallanes-priest-and-companions-martyrs', 'Sanctus Christophorus Magallanes, Presbyter, et Socii, Martyres'),
('saint-rita-of-cascia-religious', 'Sancta Rita de Cascia, Religiosa'),
('saint-bede-the-venerable-priest-and-doctor-of-the-church', 'Sanctus Beda Venerabilis, Presbyter et Ecclesiae Doctor'),
('saint-gregory-vii-pope', 'Sanctus Gregorius VII, Papa'),
('saint-mary-magdalene-de-pazzi-virgin', 'Sancta Maria Magdalena de Pazzi, Virgo'),
('saint-philip-neri-priest', 'Sanctus Philippus Neri, Presbyter'),
('saint-augustine-of-canterbury-bishop', 'Sanctus Augustinus Cantuariensis, Episcopus'),
('saint-paul-vi-pope', 'Sanctus Paulus VI, Papa'),
('the-visitation-of-the-blessed-virgin-mary', 'Visitatio Beatae Mariae Virginis')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-joseph-the-worker', 5, 1, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-athanasius-bishop-and-doctor-of-the-church', 5, 2, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saints-philip-and-james-apostles', 5, 3, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-john-of-avila-priest-and-doctor-of-the-church', 5, 10, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-nereus-and-achilleus-martyrs', 5, 12, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-pancras-martyr', 5, 12, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('our-lady-of-fatima', 5, 13, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-matthias-apostle', 5, 14, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-john-i-pope-and-martyr', 5, 18, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-bernardine-of-siena-priest', 5, 20, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-christopher-magallanes-priest-and-companions-martyrs', 5, 21, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-rita-of-cascia-religious', 5, 22, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-bede-the-venerable-priest-and-doctor-of-the-church', 5, 25, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-gregory-vii-pope', 5, 25, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-mary-magdalene-de-pazzi-virgin', 5, 25, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-philip-neri-priest', 5, 26, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-augustine-of-canterbury-bishop', 5, 27, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-paul-vi-pope', 5, 29, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-visitation-of-the-blessed-virgin-mary', 5, 31, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - June (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-justin-martyr', 'Saint Justin, Martyr', 'saint'),
('saints-marcellinus-and-peter-martyrs', 'Saints Marcellinus and Peter, Martyrs', 'saint'),
('saints-charles-lwanga-and-companions-martyrs', 'Saints Charles Lwanga and Companions, Martyrs', 'saint'),
('saint-boniface-bishop-and-martyr', 'Saint Boniface, Bishop and Martyr', 'saint'),
('saint-norbert-bishop', 'Saint Norbert, Bishop', 'saint'),
('saint-ephrem-deacon-and-doctor-of-the-church', 'Saint Ephrem, Deacon and Doctor of the Church', 'saint'),
('saint-barnabas-apostle', 'Saint Barnabas, Apostle', 'saint'),
('saint-anthony-of-padua-priest-and-doctor-of-the-church', 'Saint Anthony of Padua, Priest and Doctor of the Church', 'saint'),
('saint-romuald-abbot', 'Saint Romuald, Abbot', 'saint'),
('saint-aloysius-gonzaga-religious', 'Saint Aloysius Gonzaga, Religious', 'saint'),
('saint-paulinus-of-nola-bishop', 'Saint Paulinus of Nola, Bishop', 'saint'),
('saints-john-fisher-bishop-and-thomas-more-martyrs', 'Saints John Fisher, Bishop, and Thomas More, Martyrs', 'saint'),
('the-nativity-of-saint-john-the-baptist', 'The Nativity of Saint John the Baptist', 'saint'),
('saint-cyril-of-alexandria-bishop-and-doctor-of-the-church', 'Saint Cyril of Alexandria, Bishop and Doctor of the Church', 'saint'),
('saint-irenaeus-bishop-martyr-and-doctor-of-the-church', 'Saint Irenaeus, Bishop, Martyr and Doctor of the Church', 'saint'),
('saints-peter-and-paul-apostles', 'Saints Peter and Paul, Apostles', 'saint'),
('the-first-martyrs-of-holy-roman-church', 'The First Martyrs of Holy Roman Church', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-justin-martyr', 'Saint Justin, Martyr'),
('saints-marcellinus-and-peter-martyrs', 'Saints Marcellinus and Peter, Martyrs'),
('saints-charles-lwanga-and-companions-martyrs', 'Saints Charles Lwanga and Companions, Martyrs'),
('saint-boniface-bishop-and-martyr', 'Saint Boniface, Bishop and Martyr'),
('saint-norbert-bishop', 'Saint Norbert, Bishop'),
('saint-ephrem-deacon-and-doctor-of-the-church', 'Saint Ephrem, Deacon and Doctor of the Church'),
('saint-barnabas-apostle', 'Saint Barnabas, Apostle'),
('saint-anthony-of-padua-priest-and-doctor-of-the-church', 'Saint Anthony of Padua, Priest and Doctor of the Church'),
('saint-romuald-abbot', 'Saint Romuald, Abbot'),
('saint-aloysius-gonzaga-religious', 'Saint Aloysius Gonzaga, Religious'),
('saint-paulinus-of-nola-bishop', 'Saint Paulinus of Nola, Bishop'),
('saints-john-fisher-bishop-and-thomas-more-martyrs', 'Saints John Fisher, Bishop, and Thomas More, Martyrs'),
('the-nativity-of-saint-john-the-baptist', 'The Nativity of Saint John the Baptist'),
('saint-cyril-of-alexandria-bishop-and-doctor-of-the-church', 'Saint Cyril of Alexandria, Bishop and Doctor of the Church'),
('saint-irenaeus-bishop-martyr-and-doctor-of-the-church', 'Saint Irenaeus, Bishop, Martyr and Doctor of the Church'),
('saints-peter-and-paul-apostles', 'Saints Peter and Paul, Apostles'),
('the-first-martyrs-of-holy-roman-church', 'The First Martyrs of Holy Roman Church')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-justin-martyr', 'Saint Justin, martyr'),
('saints-marcellinus-and-peter-martyrs', 'Saints Marcellin et Pierre, martyrs'),
('saints-charles-lwanga-and-companions-martyrs', 'Saint Charles Lwanga et ses compagnons, martyrs'),
('saint-boniface-bishop-and-martyr', 'Saint Boniface, évêque et martyr'),
('saint-norbert-bishop', 'Saint Norbert, évêque'),
('saint-ephrem-deacon-and-doctor-of-the-church', 'Saint Éphrem, diacre et docteur de l''Église'),
('saint-barnabas-apostle', 'Saint Barnabé, apôtre'),
('saint-anthony-of-padua-priest-and-doctor-of-the-church', 'Saint Antoine de Padoue, prêtre et docteur de l''Église'),
('saint-romuald-abbot', 'Saint Romuald, abbé'),
('saint-aloysius-gonzaga-religious', 'Saint Louis de Gonzague, religieux'),
('saint-paulinus-of-nola-bishop', 'Saint Paulin de Nole, évêque'),
('saints-john-fisher-bishop-and-thomas-more-martyrs', 'Saints Jean Fisher, évêque, et Thomas More, martyrs'),
('the-nativity-of-saint-john-the-baptist', 'Nativité de saint Jean-Baptiste'),
('saint-cyril-of-alexandria-bishop-and-doctor-of-the-church', 'Saint Cyrille d''Alexandrie, évêque et docteur de l''Église'),
('saint-irenaeus-bishop-martyr-and-doctor-of-the-church', 'Saint Irénée, évêque, martyr et docteur de l''Église'),
('saints-peter-and-paul-apostles', 'Saints Pierre et Paul, apôtres'),
('the-first-martyrs-of-holy-roman-church', 'Les premiers martyrs de la sainte Église de Rome')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-justin-martyr', 'Sanctus Iustinus, martyr'),
('saints-marcellinus-and-peter-martyrs', 'Sancti Marcellinus et Petrus, martyres'),
('saints-charles-lwanga-and-companions-martyrs', 'Sancti Carolus Lwanga et Socii, martyres'),
('saint-boniface-bishop-and-martyr', 'Sanctus Bonifatius, episcopus et martyr'),
('saint-norbert-bishop', 'Sanctus Norbertus, episcopus'),
('saint-ephrem-deacon-and-doctor-of-the-church', 'Sanctus Ephraem, diaconus et Ecclesiae doctor'),
('saint-barnabas-apostle', 'Sanctus Barnabas, Apostolus'),
('saint-anthony-of-padua-priest-and-doctor-of-the-church', 'Sanctus Antonius Patavinus, presbyter et Ecclesiae doctor'),
('saint-romuald-abbot', 'Sanctus Romualdus, abbas'),
('saint-aloysius-gonzaga-religious', 'Sanctus Aloisius Gonzaga, religiosus'),
('saint-paulinus-of-nola-bishop', 'Sanctus Paulinus Nolanus, episcopus'),
('saints-john-fisher-bishop-and-thomas-more-martyrs', 'Sancti Ioannes Fisher et Thomas Morus, martyres'),
('the-nativity-of-saint-john-the-baptist', 'Nativitas Sancti Ioannis Baptistae'),
('saint-cyril-of-alexandria-bishop-and-doctor-of-the-church', 'Sanctus Cyrillus Alexandrinus, episcopus et Ecclesiae doctor'),
('saint-irenaeus-bishop-martyr-and-doctor-of-the-church', 'Sanctus Irenaeus, episcopus, martyr et Ecclesiae doctor'),
('saints-peter-and-paul-apostles', 'Sancti Petrus et Paulus, Apostoli'),
('the-first-martyrs-of-holy-roman-church', 'Sancti Primi Martyres Sanctae Romanae Ecclesiae')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-justin-martyr', 6, 1, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saints-marcellinus-and-peter-martyrs', 6, 2, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saints-charles-lwanga-and-companions-martyrs', 6, 3, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-boniface-bishop-and-martyr', 6, 5, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-norbert-bishop', 6, 6, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-ephrem-deacon-and-doctor-of-the-church', 6, 9, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-barnabas-apostle', 6, 11, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-anthony-of-padua-priest-and-doctor-of-the-church', 6, 13, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-romuald-abbot', 6, 19, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-aloysius-gonzaga-religious', 6, 21, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-paulinus-of-nola-bishop', 6, 22, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-john-fisher-bishop-and-thomas-more-martyrs', 6, 22, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('the-nativity-of-saint-john-the-baptist', 6, 24, 'SOLEMNITY', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-cyril-of-alexandria-bishop-and-doctor-of-the-church', 6, 27, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-irenaeus-bishop-martyr-and-doctor-of-the-church', 6, 28, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saints-peter-and-paul-apostles', 6, 29, 'SOLEMNITY', 'RED', 'normal', FALSE, 'Wikipedia'),
('the-first-martyrs-of-holy-roman-church', 6, 30, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - July (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-thomas-apostle', 'Saint Thomas, Apostle', 'saint'),
('saint-elizabeth-of-portugal', 'Saint Elizabeth of Portugal', 'saint'),
('saint-anthony-zaccaria-priest', 'Saint Anthony Zaccaria, Priest', 'saint'),
('saint-maria-goretti-virgin-and-martyr', 'Saint Maria Goretti, Virgin and Martyr', 'saint'),
('saint-augustine-zhao-rong-priest-and-companions-martyrs', 'Saint Augustine Zhao Rong, Priest, and Companions, Martyrs', 'saint'),
('saint-benedict-abbot', 'Saint Benedict, Abbot', 'saint'),
('saint-henry', 'Saint Henry', 'saint'),
('saint-camillus-de-lellis-priest', 'Saint Camillus de Lellis, Priest', 'saint'),
('saint-bonaventure-bishop-and-doctor-of-the-church', 'Saint Bonaventure, Bishop and Doctor of the Church', 'saint'),
('our-lady-of-mount-carmel', 'Our Lady of Mount Carmel', 'marian'),
('saint-apollinaris-bishop-and-martyr', 'Saint Apollinaris, Bishop and Martyr', 'saint'),
('saint-lawrence-of-brindisi-priest-and-doctor-of-the-church', 'Saint Lawrence of Brindisi, Priest and Doctor of the Church', 'saint'),
('saint-mary-magdalene', 'Saint Mary Magdalene', 'saint'),
('saint-bridget-religious', 'Saint Bridget, Religious', 'saint'),
('saint-sharbel-makhluf-priest', 'Saint Sharbel Makhluf, Priest', 'saint'),
('saint-james-apostle', 'Saint James, Apostle', 'saint'),
('saints-joachim-and-anne-parents-of-the-blessed-virgin-mary', 'Saints Joachim and Anne, Parents of the Blessed Virgin Mary', 'saint'),
('saints-martha-mary-and-lazarus', 'Saints Martha, Mary and Lazarus', 'saint'),
('saint-peter-chrysologus-bishop-and-doctor-of-the-church', 'Saint Peter Chrysologus, Bishop and Doctor of the Church', 'saint'),
('saint-ignatius-of-loyola-priest', 'Saint Ignatius of Loyola, Priest', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-thomas-apostle', 'Saint Thomas, Apostle'),
('saint-elizabeth-of-portugal', 'Saint Elizabeth of Portugal'),
('saint-anthony-zaccaria-priest', 'Saint Anthony Zaccaria, Priest'),
('saint-maria-goretti-virgin-and-martyr', 'Saint Maria Goretti, Virgin and Martyr'),
('saint-augustine-zhao-rong-priest-and-companions-martyrs', 'Saint Augustine Zhao Rong, Priest, and Companions, Martyrs'),
('saint-benedict-abbot', 'Saint Benedict, Abbot'),
('saint-henry', 'Saint Henry'),
('saint-camillus-de-lellis-priest', 'Saint Camillus de Lellis, Priest'),
('saint-bonaventure-bishop-and-doctor-of-the-church', 'Saint Bonaventure, Bishop and Doctor of the Church'),
('our-lady-of-mount-carmel', 'Our Lady of Mount Carmel'),
('saint-apollinaris-bishop-and-martyr', 'Saint Apollinaris, Bishop and Martyr'),
('saint-lawrence-of-brindisi-priest-and-doctor-of-the-church', 'Saint Lawrence of Brindisi, Priest and Doctor of the Church'),
('saint-mary-magdalene', 'Saint Mary Magdalene'),
('saint-bridget-religious', 'Saint Bridget, Religious'),
('saint-sharbel-makhluf-priest', 'Saint Sharbel Makhluf, Priest'),
('saint-james-apostle', 'Saint James, Apostle'),
('saints-joachim-and-anne-parents-of-the-blessed-virgin-mary', 'Saints Joachim and Anne, Parents of the Blessed Virgin Mary'),
('saints-martha-mary-and-lazarus', 'Saints Martha, Mary and Lazarus'),
('saint-peter-chrysologus-bishop-and-doctor-of-the-church', 'Saint Peter Chrysologus, Bishop and Doctor of the Church'),
('saint-ignatius-of-loyola-priest', 'Saint Ignatius of Loyola, Priest')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-thomas-apostle', 'Saint Thomas, apôtre'),
('saint-elizabeth-of-portugal', 'Sainte Élisabeth du Portugal'),
('saint-anthony-zaccaria-priest', 'Saint Antoine-Marie Zaccaria, prêtre'),
('saint-maria-goretti-virgin-and-martyr', 'Sainte Maria Goretti, vierge et martyre'),
('saint-augustine-zhao-rong-priest-and-companions-martyrs', 'Saint Augustin Zhao Rong, prêtre, et ses compagnons, martyrs'),
('saint-benedict-abbot', 'Saint Benoît, abbé'),
('saint-henry', 'Saint Henri'),
('saint-camillus-de-lellis-priest', 'Saint Camille de Lellis, prêtre'),
('saint-bonaventure-bishop-and-doctor-of-the-church', 'Saint Bonaventure, évêque et docteur de l''Église'),
('our-lady-of-mount-carmel', 'Notre-Dame du Mont-Carmel'),
('saint-apollinaris-bishop-and-martyr', 'Saint Apollinaire, évêque et martyr'),
('saint-lawrence-of-brindisi-priest-and-doctor-of-the-church', 'Saint Laurent de Brindes, prêtre et docteur de l''Église'),
('saint-mary-magdalene', 'Sainte Marie-Madeleine'),
('saint-bridget-religious', 'Sainte Brigitte, religieuse'),
('saint-sharbel-makhluf-priest', 'Saint Charbel Makhlouf, prêtre'),
('saint-james-apostle', 'Saint Jacques, apôtre'),
('saints-joachim-and-anne-parents-of-the-blessed-virgin-mary', 'Saints Joachim et Anne, parents de la Bienheureuse Vierge Marie'),
('saints-martha-mary-and-lazarus', 'Saints Marthe, Marie et Lazare'),
('saint-peter-chrysologus-bishop-and-doctor-of-the-church', 'Saint Pierre Chrysologue, évêque et docteur de l''Église'),
('saint-ignatius-of-loyola-priest', 'Saint Ignace de Loyola, prêtre')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-thomas-apostle', 'Sanctus Thomas, Apostolus'),
('saint-elizabeth-of-portugal', 'Sancta Elisabeth Lusitaniae'),
('saint-anthony-zaccaria-priest', 'Sanctus Antonius Maria Zaccaria, presbyter'),
('saint-maria-goretti-virgin-and-martyr', 'Sancta Maria Goretti, virgo et martyr'),
('saint-augustine-zhao-rong-priest-and-companions-martyrs', 'Sanctus Augustinus Zhao Rong et Socii, martyres'),
('saint-benedict-abbot', 'Sanctus Benedictus, abbas'),
('saint-henry', 'Sanctus Henricus'),
('saint-camillus-de-lellis-priest', 'Sanctus Camillus de Lellis, presbyter'),
('saint-bonaventure-bishop-and-doctor-of-the-church', 'Sanctus Bonaventura, episcopus et Ecclesiae doctor'),
('our-lady-of-mount-carmel', 'Beata Maria Virgo de Monte Carmelo'),
('saint-apollinaris-bishop-and-martyr', 'Sanctus Apollinaris, episcopus et martyr'),
('saint-lawrence-of-brindisi-priest-and-doctor-of-the-church', 'Sanctus Laurentius a Brundusio, presbyter et Ecclesiae doctor'),
('saint-mary-magdalene', 'Sancta Maria Magdalena'),
('saint-bridget-religious', 'Sancta Birgitta, religiosa'),
('saint-sharbel-makhluf-priest', 'Sanctus Charbel Makhluf, presbyter'),
('saint-james-apostle', 'Sanctus Iacobus, Apostolus'),
('saints-joachim-and-anne-parents-of-the-blessed-virgin-mary', 'Sancti Ioachim et Anna'),
('saints-martha-mary-and-lazarus', 'Sanctae Martha, Maria et Lazarus'),
('saint-peter-chrysologus-bishop-and-doctor-of-the-church', 'Sanctus Petrus Chrysologus, episcopus et Ecclesiae doctor'),
('saint-ignatius-of-loyola-priest', 'Sanctus Ignatius de Loyola, presbyter')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-thomas-apostle', 7, 3, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-elizabeth-of-portugal', 7, 4, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-anthony-zaccaria-priest', 7, 5, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-maria-goretti-virgin-and-martyr', 7, 6, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-augustine-zhao-rong-priest-and-companions-martyrs', 7, 9, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-benedict-abbot', 7, 11, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-henry', 7, 13, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-camillus-de-lellis-priest', 7, 14, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-bonaventure-bishop-and-doctor-of-the-church', 7, 15, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('our-lady-of-mount-carmel', 7, 16, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-apollinaris-bishop-and-martyr', 7, 20, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-lawrence-of-brindisi-priest-and-doctor-of-the-church', 7, 21, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-mary-magdalene', 7, 22, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-bridget-religious', 7, 23, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-sharbel-makhluf-priest', 7, 24, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-james-apostle', 7, 25, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saints-joachim-and-anne-parents-of-the-blessed-virgin-mary', 7, 26, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saints-martha-mary-and-lazarus', 7, 29, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-peter-chrysologus-bishop-and-doctor-of-the-church', 7, 30, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-ignatius-of-loyola-priest', 7, 31, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - August (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-alphonsus-liguori-bishop-and-doctor-of-the-church', 'Saint Alphonsus Liguori, Bishop and Doctor of the Church', 'saint'),
('saint-eusebius-of-vercelli-bishop', 'Saint Eusebius of Vercelli, Bishop', 'saint'),
('saint-peter-julian-eymard-priest', 'Saint Peter Julian Eymard, Priest', 'saint'),
('saint-jean-vianney-priest', 'Saint Jean Vianney, Priest', 'saint'),
('the-dedication-of-the-basilica-of-saint-mary-major', 'The Dedication of the Basilica of Saint Mary Major', 'dedication'),
('the-transfiguration-of-the-lord', 'The Transfiguration of the Lord', 'christological'),
('saint-sixtus-ii-pope-and-companions-martyrs', 'Saint Sixtus II, Pope, and Companions, Martyrs', 'saint'),
('saint-cajetan-priest', 'Saint Cajetan, Priest', 'saint'),
('saint-dominic-priest', 'Saint Dominic, Priest', 'saint'),
('saint-teresa-benedicta-of-the-cross-virgin-and-martyr', 'Saint Teresa Benedicta of the Cross, Virgin and Martyr', 'saint'),
('saint-lawrence-deacon-and-martyr', 'Saint Lawrence, Deacon and Martyr', 'saint'),
('saint-clare-virgin', 'Saint Clare, Virgin', 'saint'),
('saint-jane-frances-de-chantal-religious', 'Saint Jane Frances de Chantal, Religious', 'saint'),
('saints-pontian-pope-and-hippolytus-priest-martyrs', 'Saints Pontian, Pope, and Hippolytus, Priest, Martyrs', 'saint'),
('saint-maximus-the-confessor', 'Saint Maximus the Confessor', 'saint'),
('saint-maximilian-kolbe-priest-and-martyr', 'Saint Maximilian Kolbe, Priest and Martyr', 'saint'),
('the-assumption-of-the-blessed-virgin-mary', 'The Assumption of the Blessed Virgin Mary', 'marian'),
('saint-stephen-of-hungary', 'Saint Stephen of Hungary', 'saint'),
('saint-john-eudes-priest', 'Saint John Eudes, Priest', 'saint'),
('saint-bernard-abbot-and-doctor-of-the-church', 'Saint Bernard, Abbot and Doctor of the Church', 'saint'),
('saint-pius-x-pope', 'Saint Pius X, Pope', 'saint'),
('the-queenship-of-the-blessed-virgin-mary', 'The Queenship of the Blessed Virgin Mary', 'marian'),
('saint-rose-of-lima-virgin', 'Saint Rose of Lima, Virgin', 'saint'),
('saint-bartholomew-apostle', 'Saint Bartholomew, Apostle', 'saint'),
('saint-louis', 'Saint Louis', 'saint'),
('saint-joseph-calasanz-priest', 'Saint Joseph Calasanz, Priest', 'saint'),
('saint-monica', 'Saint Monica', 'saint'),
('saint-augustine-of-hippo-bishop-and-doctor-of-the-church', 'Saint Augustine of Hippo, Bishop and Doctor of the Church', 'saint'),
('the-passion-of-saint-john-the-baptist-martyr', 'The Passion of Saint John the Baptist, Martyr', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-alphonsus-liguori-bishop-and-doctor-of-the-church', 'Saint Alphonsus Liguori, Bishop and Doctor of the Church'),
('saint-eusebius-of-vercelli-bishop', 'Saint Eusebius of Vercelli, Bishop'),
('saint-peter-julian-eymard-priest', 'Saint Peter Julian Eymard, Priest'),
('saint-jean-vianney-priest', 'Saint Jean Vianney, Priest'),
('the-dedication-of-the-basilica-of-saint-mary-major', 'The Dedication of the Basilica of Saint Mary Major'),
('the-transfiguration-of-the-lord', 'The Transfiguration of the Lord'),
('saint-sixtus-ii-pope-and-companions-martyrs', 'Saint Sixtus II, Pope, and Companions, Martyrs'),
('saint-cajetan-priest', 'Saint Cajetan, Priest'),
('saint-dominic-priest', 'Saint Dominic, Priest'),
('saint-teresa-benedicta-of-the-cross-virgin-and-martyr', 'Saint Teresa Benedicta of the Cross, Virgin and Martyr'),
('saint-lawrence-deacon-and-martyr', 'Saint Lawrence, Deacon and Martyr'),
('saint-clare-virgin', 'Saint Clare, Virgin'),
('saint-jane-frances-de-chantal-religious', 'Saint Jane Frances de Chantal, Religious'),
('saints-pontian-pope-and-hippolytus-priest-martyrs', 'Saints Pontian, Pope, and Hippolytus, Priest, Martyrs'),
('saint-maximus-the-confessor', 'Saint Maximus the Confessor'),
('saint-maximilian-kolbe-priest-and-martyr', 'Saint Maximilian Kolbe, Priest and Martyr'),
('the-assumption-of-the-blessed-virgin-mary', 'The Assumption of the Blessed Virgin Mary'),
('saint-stephen-of-hungary', 'Saint Stephen of Hungary'),
('saint-john-eudes-priest', 'Saint John Eudes, Priest'),
('saint-bernard-abbot-and-doctor-of-the-church', 'Saint Bernard, Abbot and Doctor of the Church'),
('saint-pius-x-pope', 'Saint Pius X, Pope'),
('the-queenship-of-the-blessed-virgin-mary', 'The Queenship of the Blessed Virgin Mary'),
('saint-rose-of-lima-virgin', 'Saint Rose of Lima, Virgin'),
('saint-bartholomew-apostle', 'Saint Bartholomew, Apostle'),
('saint-louis', 'Saint Louis'),
('saint-joseph-calasanz-priest', 'Saint Joseph Calasanz, Priest'),
('saint-monica', 'Saint Monica'),
('saint-augustine-of-hippo-bishop-and-doctor-of-the-church', 'Saint Augustine of Hippo, Bishop and Doctor of the Church'),
('the-passion-of-saint-john-the-baptist-martyr', 'The Passion of Saint John the Baptist, Martyr')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-alphonsus-liguori-bishop-and-doctor-of-the-church', 'Saint Alphonse de Liguori, évêque et docteur de l''Église'),
('saint-eusebius-of-vercelli-bishop', 'Saint Eusèbe de Verceil, évêque'),
('saint-peter-julian-eymard-priest', 'Saint Pierre-Julien Eymard, prêtre'),
('saint-jean-vianney-priest', 'Saint Jean-Marie Vianney, prêtre'),
('the-dedication-of-the-basilica-of-saint-mary-major', 'Dédicace de la basilique Sainte-Marie-Majeure'),
('the-transfiguration-of-the-lord', 'Transfiguration du Seigneur'),
('saint-sixtus-ii-pope-and-companions-martyrs', 'Saint Sixte II, pape, et ses compagnons, martyrs'),
('saint-cajetan-priest', 'Saint Gaétan, prêtre'),
('saint-dominic-priest', 'Saint Dominique, prêtre'),
('saint-teresa-benedicta-of-the-cross-virgin-and-martyr', 'Sainte Thérèse-Bénédicte de la Croix, vierge et martyre'),
('saint-lawrence-deacon-and-martyr', 'Saint Laurent, diacre et martyr'),
('saint-clare-virgin', 'Sainte Claire, vierge'),
('saint-jane-frances-de-chantal-religious', 'Sainte Jeanne-Françoise de Chantal, religieuse'),
('saints-pontian-pope-and-hippolytus-priest-martyrs', 'Saints Pontien, pape, et Hippolyte, prêtre, martyrs'),
('saint-maximus-the-confessor', 'Saint Maxime le Confesseur'),
('saint-maximilian-kolbe-priest-and-martyr', 'Saint Maximilien Kolbe, prêtre et martyr'),
('the-assumption-of-the-blessed-virgin-mary', 'Assomption de la Bienheureuse Vierge Marie'),
('saint-stephen-of-hungary', 'Saint Étienne de Hongrie'),
('saint-john-eudes-priest', 'Saint Jean Eudes, prêtre'),
('saint-bernard-abbot-and-doctor-of-the-church', 'Saint Bernard, abbé et docteur de l''Église'),
('saint-pius-x-pope', 'Saint Pie X, pape'),
('the-queenship-of-the-blessed-virgin-mary', 'La Royauté de la Bienheureuse Vierge Marie'),
('saint-rose-of-lima-virgin', 'Sainte Rose de Lima, vierge'),
('saint-bartholomew-apostle', 'Saint Barthélemy, apôtre'),
('saint-louis', 'Saint Louis'),
('saint-joseph-calasanz-priest', 'Saint Joseph Calasanz, prêtre'),
('saint-monica', 'Sainte Monique'),
('saint-augustine-of-hippo-bishop-and-doctor-of-the-church', 'Saint Augustin d''Hippone, évêque et docteur de l''Église'),
('the-passion-of-saint-john-the-baptist-martyr', 'Passion de saint Jean-Baptiste, martyr')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-alphonsus-liguori-bishop-and-doctor-of-the-church', 'Sanctus Alphonsus Maria de Ligorio, episcopus et Ecclesiae doctor'),
('saint-eusebius-of-vercelli-bishop', 'Sanctus Eusebius Vercellensis, episcopus'),
('saint-peter-julian-eymard-priest', 'Sanctus Petrus Iulianus Eymard, presbyter'),
('saint-jean-vianney-priest', 'Sanctus Ioannes Maria Vianney, presbyter'),
('the-dedication-of-the-basilica-of-saint-mary-major', 'Dedicatio Basilicae Sanctae Mariae Maioris'),
('the-transfiguration-of-the-lord', 'Transfiguratio Domini'),
('saint-sixtus-ii-pope-and-companions-martyrs', 'Sanctus Sixtus II et Socii, martyres'),
('saint-cajetan-priest', 'Sanctus Caietanus, presbyter'),
('saint-dominic-priest', 'Sanctus Dominicus, presbyter'),
('saint-teresa-benedicta-of-the-cross-virgin-and-martyr', 'Sancta Teresia Benedicta a Cruce, virgo et martyr'),
('saint-lawrence-deacon-and-martyr', 'Sanctus Laurentius, diaconus et martyr'),
('saint-clare-virgin', 'Sancta Clara, virgo'),
('saint-jane-frances-de-chantal-religious', 'Sancta Ioanna Francisca de Chantal, religiosa'),
('saints-pontian-pope-and-hippolytus-priest-martyrs', 'Sancti Pontianus et Hippolytus, martyres'),
('saint-maximus-the-confessor', 'Sanctus Maximus Confessor'),
('saint-maximilian-kolbe-priest-and-martyr', 'Sanctus Maximilianus Maria Kolbe, presbyter et martyr'),
('the-assumption-of-the-blessed-virgin-mary', 'Assumptio Beatae Mariae Virginis'),
('saint-stephen-of-hungary', 'Sanctus Stephanus Hungariae'),
('saint-john-eudes-priest', 'Sanctus Ioannes Eudes, presbyter'),
('saint-bernard-abbot-and-doctor-of-the-church', 'Sanctus Bernardus, abbas et Ecclesiae doctor'),
('saint-pius-x-pope', 'Sanctus Pius X, papa'),
('the-queenship-of-the-blessed-virgin-mary', 'Beatae Mariae Virginis Reginae'),
('saint-rose-of-lima-virgin', 'Sancta Rosa de Lima, virgo'),
('saint-bartholomew-apostle', 'Sanctus Bartholomaeus, Apostolus'),
('saint-louis', 'Sanctus Ludovicus'),
('saint-joseph-calasanz-priest', 'Sanctus Iosephus Calasanctius, presbyter'),
('saint-monica', 'Sancta Monica'),
('saint-augustine-of-hippo-bishop-and-doctor-of-the-church', 'Sanctus Augustinus, episcopus et Ecclesiae doctor'),
('the-passion-of-saint-john-the-baptist-martyr', 'Passio Sancti Ioannis Baptistae')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-alphonsus-liguori-bishop-and-doctor-of-the-church', 8, 1, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-eusebius-of-vercelli-bishop', 8, 2, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-peter-julian-eymard-priest', 8, 2, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-jean-vianney-priest', 8, 4, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-dedication-of-the-basilica-of-saint-mary-major', 8, 5, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-transfiguration-of-the-lord', 8, 6, 'FEAST_LORD', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-sixtus-ii-pope-and-companions-martyrs', 8, 7, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-cajetan-priest', 8, 7, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-dominic-priest', 8, 8, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-teresa-benedicta-of-the-cross-virgin-and-martyr', 8, 9, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-lawrence-deacon-and-martyr', 8, 10, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-clare-virgin', 8, 11, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-jane-frances-de-chantal-religious', 8, 12, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-pontian-pope-and-hippolytus-priest-martyrs', 8, 13, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-maximus-the-confessor', 8, 13, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-maximilian-kolbe-priest-and-martyr', 8, 14, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('the-assumption-of-the-blessed-virgin-mary', 8, 15, 'SOLEMNITY', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-stephen-of-hungary', 8, 16, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-eudes-priest', 8, 19, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-bernard-abbot-and-doctor-of-the-church', 8, 20, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-pius-x-pope', 8, 21, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-queenship-of-the-blessed-virgin-mary', 8, 22, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-rose-of-lima-virgin', 8, 23, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-bartholomew-apostle', 8, 24, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-louis', 8, 25, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-joseph-calasanz-priest', 8, 25, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-monica', 8, 27, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-augustine-of-hippo-bishop-and-doctor-of-the-church', 8, 28, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-passion-of-saint-john-the-baptist-martyr', 8, 29, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - September (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-gregory-the-great-pope-and-doctor-of-the-church', 'Saint Gregory the Great, Pope and Doctor of the Church', 'saint'),
('saint-teresa-of-calcutta-virgin', 'Saint Teresa of Calcutta, Virgin', 'saint'),
('the-nativity-of-the-blessed-virgin-mary', 'The Nativity of the Blessed Virgin Mary', 'marian'),
('saint-peter-claver-priest', 'Saint Peter Claver, Priest', 'saint'),
('the-most-holy-name-of-mary', 'The Most Holy Name of Mary', 'marian'),
('saint-john-chrysostom-bishop-and-doctor-of-the-church', 'Saint John Chrysostom, Bishop and Doctor of the Church', 'saint'),
('the-exaltation-of-the-holy-cross', 'The Exaltation of the Holy Cross', 'christological'),
('our-lady-of-sorrows', 'Our Lady of Sorrows', 'marian'),
('saints-cornelius-pope-and-cyprian-bishop-martyrs', 'Saints Cornelius, Pope, and Cyprian, Bishop, Martyrs', 'saint'),
('saint-robert-bellarmine-bishop-and-doctor-of-the-church', 'Saint Robert Bellarmine, Bishop and Doctor of the Church', 'saint'),
('saint-hildegard-of-bingen-virgin-and-doctor-of-the-church', 'Saint Hildegard of Bingen, Virgin and Doctor of the Church', 'saint'),
('saint-januarius-bishop-and-martyr', 'Saint Januarius, Bishop and Martyr', 'saint'),
('saints-andrew-kim-tae-gon-priest-paul-chong-ha-sang-and-companions-martyrs', 'Saints Andrew Kim Tae-gon, Priest, Paul Chong Ha-sang, and Companions, Martyrs', 'saint'),
('saint-matthew-apostle-and-evangelist', 'Saint Matthew, Apostle and Evangelist', 'saint'),
('saint-pius-of-pietrelcina-priest', 'Saint Pius of Pietrelcina, Priest', 'saint'),
('saints-cosmas-and-damian-martyrs', 'Saints Cosmas and Damian, Martyrs', 'saint'),
('saint-vincent-de-paul-priest', 'Saint Vincent de Paul, Priest', 'saint'),
('saint-wenceslaus-martyr', 'Saint Wenceslaus, Martyr', 'saint'),
('saint-lawrence-ruiz-and-companions-martyrs', 'Saint Lawrence Ruiz and Companions, Martyrs', 'saint'),
('saints-michael-gabriel-and-raphael-archangels', 'Saints Michael, Gabriel and Raphael, Archangels', 'saint'),
('saint-jerome-priest-and-doctor-of-the-church', 'Saint Jerome, Priest and Doctor of the Church', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-gregory-the-great-pope-and-doctor-of-the-church', 'Saint Gregory the Great, Pope and Doctor of the Church'),
('saint-teresa-of-calcutta-virgin', 'Saint Teresa of Calcutta, Virgin'),
('the-nativity-of-the-blessed-virgin-mary', 'The Nativity of the Blessed Virgin Mary'),
('saint-peter-claver-priest', 'Saint Peter Claver, Priest'),
('the-most-holy-name-of-mary', 'The Most Holy Name of Mary'),
('saint-john-chrysostom-bishop-and-doctor-of-the-church', 'Saint John Chrysostom, Bishop and Doctor of the Church'),
('the-exaltation-of-the-holy-cross', 'The Exaltation of the Holy Cross'),
('our-lady-of-sorrows', 'Our Lady of Sorrows'),
('saints-cornelius-pope-and-cyprian-bishop-martyrs', 'Saints Cornelius, Pope, and Cyprian, Bishop, Martyrs'),
('saint-robert-bellarmine-bishop-and-doctor-of-the-church', 'Saint Robert Bellarmine, Bishop and Doctor of the Church'),
('saint-hildegard-of-bingen-virgin-and-doctor-of-the-church', 'Saint Hildegard of Bingen, Virgin and Doctor of the Church'),
('saint-januarius-bishop-and-martyr', 'Saint Januarius, Bishop and Martyr'),
('saints-andrew-kim-tae-gon-priest-paul-chong-ha-sang-and-companions-martyrs', 'Saints Andrew Kim Tae-gon, Priest, Paul Chong Ha-sang, and Companions, Martyrs'),
('saint-matthew-apostle-and-evangelist', 'Saint Matthew, Apostle and Evangelist'),
('saint-pius-of-pietrelcina-priest', 'Saint Pius of Pietrelcina, Priest'),
('saints-cosmas-and-damian-martyrs', 'Saints Cosmas and Damian, Martyrs'),
('saint-vincent-de-paul-priest', 'Saint Vincent de Paul, Priest'),
('saint-wenceslaus-martyr', 'Saint Wenceslaus, Martyr'),
('saint-lawrence-ruiz-and-companions-martyrs', 'Saint Lawrence Ruiz and Companions, Martyrs'),
('saints-michael-gabriel-and-raphael-archangels', 'Saints Michael, Gabriel and Raphael, Archangels'),
('saint-jerome-priest-and-doctor-of-the-church', 'Saint Jerome, Priest and Doctor of the Church')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-gregory-the-great-pope-and-doctor-of-the-church', 'Saint Grégoire le Grand, pape et docteur de l''Église'),
('saint-teresa-of-calcutta-virgin', 'Sainte Teresa de Calcutta, vierge'),
('the-nativity-of-the-blessed-virgin-mary', 'Nativité de la Bienheureuse Vierge Marie'),
('saint-peter-claver-priest', 'Saint Pierre Claver, prêtre'),
('the-most-holy-name-of-mary', 'Très Saint Nom de Marie'),
('saint-john-chrysostom-bishop-and-doctor-of-the-church', 'Saint Jean Chrysostome, évêque et docteur de l''Église'),
('the-exaltation-of-the-holy-cross', 'Exaltation de la Sainte Croix'),
('our-lady-of-sorrows', 'Notre-Dame des Douleurs'),
('saints-cornelius-pope-and-cyprian-bishop-martyrs', 'Saints Corneille, pape, et Cyprien, évêque, martyrs'),
('saint-robert-bellarmine-bishop-and-doctor-of-the-church', 'Saint Robert Bellarmin, évêque et docteur de l''Église'),
('saint-hildegard-of-bingen-virgin-and-doctor-of-the-church', 'Sainte Hildegarde de Bingen, vierge et docteur de l''Église'),
('saint-januarius-bishop-and-martyr', 'Saint Janvier, évêque et martyr'),
('saints-andrew-kim-tae-gon-priest-paul-chong-ha-sang-and-companions-martyrs', 'Saints André Kim Tae-gon, prêtre, Paul Chong Ha-sang et compagnons, martyrs'),
('saint-matthew-apostle-and-evangelist', 'Saint Matthieu, apôtre et évangéliste'),
('saint-pius-of-pietrelcina-priest', 'Saint Pio de Pietrelcina, prêtre'),
('saints-cosmas-and-damian-martyrs', 'Saints Côme et Damien, martyrs'),
('saint-vincent-de-paul-priest', 'Saint Vincent de Paul, prêtre'),
('saint-wenceslaus-martyr', 'Saint Venceslas, martyr'),
('saint-lawrence-ruiz-and-companions-martyrs', 'Saint Laurent Ruiz et ses compagnons, martyrs'),
('saints-michael-gabriel-and-raphael-archangels', 'Saints Michel, Gabriel et Raphaël, archanges'),
('saint-jerome-priest-and-doctor-of-the-church', 'Saint Jérôme, prêtre et docteur de l''Église')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-gregory-the-great-pope-and-doctor-of-the-church', 'Sanctus Gregorius Magnus, papa et Ecclesiae doctor'),
('saint-teresa-of-calcutta-virgin', 'Sancta Teresia Calcuttiensis, virgo'),
('the-nativity-of-the-blessed-virgin-mary', 'Nativitas Beatae Mariae Virginis'),
('saint-peter-claver-priest', 'Sanctus Petrus Claver, presbyter'),
('the-most-holy-name-of-mary', 'Sanctissimi Nominis Mariae'),
('saint-john-chrysostom-bishop-and-doctor-of-the-church', 'Sanctus Ioannes Chrysostomus, episcopus et Ecclesiae doctor'),
('the-exaltation-of-the-holy-cross', 'Exaltatio Sanctae Crucis'),
('our-lady-of-sorrows', 'Beata Maria Virgo Perdolens'),
('saints-cornelius-pope-and-cyprian-bishop-martyrs', 'Sancti Cornelius et Cyprianus, martyres'),
('saint-robert-bellarmine-bishop-and-doctor-of-the-church', 'Sanctus Robertus Bellarminus, episcopus et Ecclesiae doctor'),
('saint-hildegard-of-bingen-virgin-and-doctor-of-the-church', 'Sancta Hildegardis Bingensis, virgo et Ecclesiae doctor'),
('saint-januarius-bishop-and-martyr', 'Sanctus Ianuarius, episcopus et martyr'),
('saints-andrew-kim-tae-gon-priest-paul-chong-ha-sang-and-companions-martyrs', 'Sancti Andreas Kim Tae-gon et Socii, martyres'),
('saint-matthew-apostle-and-evangelist', 'Sanctus Matthaeus, Apostolus et evangelista'),
('saint-pius-of-pietrelcina-priest', 'Sanctus Pius de Pietrelcina, presbyter'),
('saints-cosmas-and-damian-martyrs', 'Sancti Cosmas et Damianus, martyres'),
('saint-vincent-de-paul-priest', 'Sanctus Vincentius a Paulo, presbyter'),
('saint-wenceslaus-martyr', 'Sanctus Wenceslaus, martyr'),
('saint-lawrence-ruiz-and-companions-martyrs', 'Sanctus Laurentius Ruiz et Socii, martyres'),
('saints-michael-gabriel-and-raphael-archangels', 'Sancti Michael, Gabriel et Raphael, Archangeli'),
('saint-jerome-priest-and-doctor-of-the-church', 'Sanctus Hieronymus, presbyter et Ecclesiae doctor')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-gregory-the-great-pope-and-doctor-of-the-church', 9, 3, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-teresa-of-calcutta-virgin', 9, 5, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-nativity-of-the-blessed-virgin-mary', 9, 8, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-peter-claver-priest', 9, 9, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-most-holy-name-of-mary', 9, 12, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-chrysostom-bishop-and-doctor-of-the-church', 9, 13, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-exaltation-of-the-holy-cross', 9, 14, 'FEAST_LORD', 'RED', 'normal', FALSE, 'Wikipedia'),
('our-lady-of-sorrows', 9, 15, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saints-cornelius-pope-and-cyprian-bishop-martyrs', 9, 16, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-robert-bellarmine-bishop-and-doctor-of-the-church', 9, 17, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-hildegard-of-bingen-virgin-and-doctor-of-the-church', 9, 17, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-januarius-bishop-and-martyr', 9, 19, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saints-andrew-kim-tae-gon-priest-paul-chong-ha-sang-and-companions-martyrs', 9, 20, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-matthew-apostle-and-evangelist', 9, 21, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-pius-of-pietrelcina-priest', 9, 23, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saints-cosmas-and-damian-martyrs', 9, 26, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-vincent-de-paul-priest', 9, 27, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-wenceslaus-martyr', 9, 28, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-lawrence-ruiz-and-companions-martyrs', 9, 28, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saints-michael-gabriel-and-raphael-archangels', 9, 29, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-jerome-priest-and-doctor-of-the-church', 9, 30, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - October (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-therese-of-the-child-jesus-virgin-and-doctor-of-the-church', 'Saint Thérèse of the Child Jesus, Virgin and Doctor of the Church', 'saint'),
('the-holy-guardian-angels', 'The Holy Guardian Angels', 'other'),
('saint-francis-of-assisi', 'Saint Francis of Assisi', 'saint'),
('saint-faustina-kowalska-virgin', 'Saint Faustina Kowalska, Virgin', 'saint'),
('saint-bruno-priest', 'Saint Bruno, Priest', 'saint'),
('our-lady-of-the-rosary', 'Our Lady of the Rosary', 'marian'),
('saint-denis-bishop-and-companions-martyrs', 'Saint Denis, Bishop, and Companions, Martyrs', 'saint'),
('saint-john-leonardi-priest', 'Saint John Leonardi, Priest', 'saint'),
('saint-john-henry-newman-priest-and-doctor-of-the-church', 'Saint John Henry Newman, Priest and Doctor of the Church', 'saint'),
('saint-john-xxiii-pope', 'Saint John XXIII, Pope', 'saint'),
('saint-callistus-i-pope-and-martyr', 'Saint Callistus I, Pope and Martyr', 'saint'),
('saint-teresa-of-jesus-virgin-and-doctor-of-the-church', 'Saint Teresa of Jesus, Virgin and Doctor of the Church', 'saint'),
('saint-hedwig-religious', 'Saint Hedwig, Religious', 'saint'),
('saint-margaret-mary-alacoque-virgin', 'Saint Margaret Mary Alacoque, Virgin', 'saint'),
('saint-ignatius-of-antioch-bishop-and-martyr', 'Saint Ignatius of Antioch, Bishop and Martyr', 'saint'),
('saint-luke-evangelist', 'Saint Luke, Evangelist', 'saint'),
('saints-john-de-brebeuf-isaac-jogues-priests-and-companions-martyrs', 'Saints John de Brébeuf, Isaac Jogues, Priests, and Companions, Martyrs', 'saint'),
('saint-paul-of-the-cross-priest', 'Saint Paul of the Cross, Priest', 'saint'),
('saint-john-paul-ii-pope', 'Saint John Paul II, Pope', 'saint'),
('saint-john-of-capistrano-priest', 'Saint John of Capistrano, Priest', 'saint'),
('saint-anthony-mary-claret-bishop', 'Saint Anthony Mary Claret, Bishop', 'saint'),
('saints-simon-and-jude-apostles', 'Saints Simon and Jude, Apostles', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-therese-of-the-child-jesus-virgin-and-doctor-of-the-church', 'Saint Thérèse of the Child Jesus, Virgin and Doctor of the Church'),
('the-holy-guardian-angels', 'The Holy Guardian Angels'),
('saint-francis-of-assisi', 'Saint Francis of Assisi'),
('saint-faustina-kowalska-virgin', 'Saint Faustina Kowalska, Virgin'),
('saint-bruno-priest', 'Saint Bruno, Priest'),
('our-lady-of-the-rosary', 'Our Lady of the Rosary'),
('saint-denis-bishop-and-companions-martyrs', 'Saint Denis, Bishop, and Companions, Martyrs'),
('saint-john-leonardi-priest', 'Saint John Leonardi, Priest'),
('saint-john-henry-newman-priest-and-doctor-of-the-church', 'Saint John Henry Newman, Priest and Doctor of the Church'),
('saint-john-xxiii-pope', 'Saint John XXIII, Pope'),
('saint-callistus-i-pope-and-martyr', 'Saint Callistus I, Pope and Martyr'),
('saint-teresa-of-jesus-virgin-and-doctor-of-the-church', 'Saint Teresa of Jesus, Virgin and Doctor of the Church'),
('saint-hedwig-religious', 'Saint Hedwig, Religious'),
('saint-margaret-mary-alacoque-virgin', 'Saint Margaret Mary Alacoque, Virgin'),
('saint-ignatius-of-antioch-bishop-and-martyr', 'Saint Ignatius of Antioch, Bishop and Martyr'),
('saint-luke-evangelist', 'Saint Luke, Evangelist'),
('saints-john-de-brebeuf-isaac-jogues-priests-and-companions-martyrs', 'Saints John de Brébeuf, Isaac Jogues, Priests, and Companions, Martyrs'),
('saint-paul-of-the-cross-priest', 'Saint Paul of the Cross, Priest'),
('saint-john-paul-ii-pope', 'Saint John Paul II, Pope'),
('saint-john-of-capistrano-priest', 'Saint John of Capistrano, Priest'),
('saint-anthony-mary-claret-bishop', 'Saint Anthony Mary Claret, Bishop'),
('saints-simon-and-jude-apostles', 'Saints Simon and Jude, Apostles')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-therese-of-the-child-jesus-virgin-and-doctor-of-the-church', 'Sainte Thérèse de l''Enfant-Jésus, vierge et docteur de l''Église'),
('the-holy-guardian-angels', 'Les Saints Anges gardiens'),
('saint-francis-of-assisi', 'Saint François d''Assise'),
('saint-faustina-kowalska-virgin', 'Sainte Faustine Kowalska, vierge'),
('saint-bruno-priest', 'Saint Bruno, prêtre'),
('our-lady-of-the-rosary', 'Notre-Dame du Rosaire'),
('saint-denis-bishop-and-companions-martyrs', 'Saint Denis, évêque, et ses compagnons, martyrs'),
('saint-john-leonardi-priest', 'Saint Jean Léonardi, prêtre'),
('saint-john-henry-newman-priest-and-doctor-of-the-church', 'Saint John Henry Newman, prêtre et docteur de l''Église'),
('saint-john-xxiii-pope', 'Saint Jean XXIII, pape'),
('saint-callistus-i-pope-and-martyr', 'Saint Calixte Ier, pape et martyr'),
('saint-teresa-of-jesus-virgin-and-doctor-of-the-church', 'Sainte Thérèse de Jésus, vierge et docteur de l''Église'),
('saint-hedwig-religious', 'Sainte Edwige, religieuse'),
('saint-margaret-mary-alacoque-virgin', 'Sainte Marguerite-Marie Alacoque, vierge'),
('saint-ignatius-of-antioch-bishop-and-martyr', 'Saint Ignace d''Antioche, évêque et martyr'),
('saint-luke-evangelist', 'Saint Luc, évangéliste'),
('saints-john-de-brebeuf-isaac-jogues-priests-and-companions-martyrs', 'Saints Jean de Brébeuf, Isaac Jogues, prêtres, et leurs compagnons, martyrs'),
('saint-paul-of-the-cross-priest', 'Saint Paul de la Croix, prêtre'),
('saint-john-paul-ii-pope', 'Saint Jean-Paul II, pape'),
('saint-john-of-capistrano-priest', 'Saint Jean de Capistran, prêtre'),
('saint-anthony-mary-claret-bishop', 'Saint Antoine-Marie Claret, évêque'),
('saints-simon-and-jude-apostles', 'Saints Simon et Jude, apôtres')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-therese-of-the-child-jesus-virgin-and-doctor-of-the-church', 'Sancta Teresia a Iesu Infante, virgo et Ecclesiae doctor'),
('the-holy-guardian-angels', 'Sancti Angeli Custodes'),
('saint-francis-of-assisi', 'Sanctus Franciscus Assisiensis'),
('saint-faustina-kowalska-virgin', 'Sancta Faustina Kowalska, virgo'),
('saint-bruno-priest', 'Sanctus Bruno, presbyter'),
('our-lady-of-the-rosary', 'Beata Maria Virgo a Rosario'),
('saint-denis-bishop-and-companions-martyrs', 'Sanctus Dionysius et Socii, martyres'),
('saint-john-leonardi-priest', 'Sanctus Ioannes Leonardi, presbyter'),
('saint-john-henry-newman-priest-and-doctor-of-the-church', 'Sanctus Ioannes Henricus Newman, presbyter et Ecclesiae doctor'),
('saint-john-xxiii-pope', 'Sanctus Ioannes XXIII, papa'),
('saint-callistus-i-pope-and-martyr', 'Sanctus Callistus I, papa et martyr'),
('saint-teresa-of-jesus-virgin-and-doctor-of-the-church', 'Sancta Teresia a Iesu, virgo et Ecclesiae doctor'),
('saint-hedwig-religious', 'Sancta Hedvigis, religiosa'),
('saint-margaret-mary-alacoque-virgin', 'Sancta Margarita Maria Alacoque, virgo'),
('saint-ignatius-of-antioch-bishop-and-martyr', 'Sanctus Ignatius Antiochenus, episcopus et martyr'),
('saint-luke-evangelist', 'Sanctus Lucas, evangelista'),
('saints-john-de-brebeuf-isaac-jogues-priests-and-companions-martyrs', 'Sancti Ioannes de Brebeuf, Isaac Jogues et Socii, martyres'),
('saint-paul-of-the-cross-priest', 'Sanctus Paulus a Cruce, presbyter'),
('saint-john-paul-ii-pope', 'Sanctus Ioannes Paulus II, papa'),
('saint-john-of-capistrano-priest', 'Sanctus Ioannes Capistranensis, presbyter'),
('saint-anthony-mary-claret-bishop', 'Sanctus Antonius Maria Claret, episcopus'),
('saints-simon-and-jude-apostles', 'Sancti Simon et Iudas, Apostoli')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-therese-of-the-child-jesus-virgin-and-doctor-of-the-church', 10, 1, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-holy-guardian-angels', 10, 2, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-francis-of-assisi', 10, 4, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-faustina-kowalska-virgin', 10, 5, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-bruno-priest', 10, 6, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('our-lady-of-the-rosary', 10, 7, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-denis-bishop-and-companions-martyrs', 10, 9, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-john-leonardi-priest', 10, 9, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-henry-newman-priest-and-doctor-of-the-church', 10, 9, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-xxiii-pope', 10, 11, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-callistus-i-pope-and-martyr', 10, 14, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-teresa-of-jesus-virgin-and-doctor-of-the-church', 10, 15, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-hedwig-religious', 10, 16, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-margaret-mary-alacoque-virgin', 10, 16, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-ignatius-of-antioch-bishop-and-martyr', 10, 17, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-luke-evangelist', 10, 18, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia'),
('saints-john-de-brebeuf-isaac-jogues-priests-and-companions-martyrs', 10, 19, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-paul-of-the-cross-priest', 10, 19, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-paul-ii-pope', 10, 22, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-of-capistrano-priest', 10, 23, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-anthony-mary-claret-bishop', 10, 24, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-simon-and-jude-apostles', 10, 28, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - November (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('all-saints', 'All Saints', 'saint'),
('the-commemoration-of-all-the-faithful-departed', 'The Commemoration of All the Faithful Departed', 'other'),
('saint-martin-de-porres-religious', 'Saint Martin de Porres, Religious', 'saint'),
('saint-charles-borromeo-bishop', 'Saint Charles Borromeo, Bishop', 'saint'),
('the-dedication-of-the-lateran-basilica', 'The Dedication of the Lateran Basilica', 'dedication'),
('saint-leo-the-great-pope-and-doctor-of-the-church', 'Saint Leo the Great, Pope and Doctor of the Church', 'saint'),
('saint-martin-of-tours-bishop', 'Saint Martin of Tours, Bishop', 'saint'),
('saint-josaphat-bishop-and-martyr', 'Saint Josaphat, Bishop and Martyr', 'saint'),
('saint-albert-the-great-bishop-and-doctor-of-the-church', 'Saint Albert the Great, Bishop and Doctor of the Church', 'saint'),
('saint-margaret-of-scotland', 'Saint Margaret of Scotland', 'saint'),
('saint-gertrude-virgin', 'Saint Gertrude, Virgin', 'saint'),
('saint-elizabeth-of-hungary-religious', 'Saint Elizabeth of Hungary, Religious', 'saint'),
('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles', 'The Dedication of the Basilicas of Saints Peter and Paul, Apostles', 'dedication'),
('the-presentation-of-the-blessed-virgin-mary', 'The Presentation of the Blessed Virgin Mary', 'marian'),
('saint-cecilia-virgin-and-martyr', 'Saint Cecilia, Virgin and Martyr', 'saint'),
('saint-clement-i-pope-and-martyr', 'Saint Clement I, Pope and Martyr', 'saint'),
('saint-columban-abbot', 'Saint Columban, Abbot', 'saint'),
('saints-andrew-dung-lac-priest-and-companions-martyrs', 'Saints Andrew Dung-Lac, Priest, and Companions, Martyrs', 'saint'),
('saint-catherine-of-alexandria-virgin-and-martyr', 'Saint Catherine of Alexandria, Virgin and Martyr', 'saint'),
('saint-andrew-apostle', 'Saint Andrew, Apostle', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('all-saints', 'All Saints'),
('the-commemoration-of-all-the-faithful-departed', 'The Commemoration of All the Faithful Departed'),
('saint-martin-de-porres-religious', 'Saint Martin de Porres, Religious'),
('saint-charles-borromeo-bishop', 'Saint Charles Borromeo, Bishop'),
('the-dedication-of-the-lateran-basilica', 'The Dedication of the Lateran Basilica'),
('saint-leo-the-great-pope-and-doctor-of-the-church', 'Saint Leo the Great, Pope and Doctor of the Church'),
('saint-martin-of-tours-bishop', 'Saint Martin of Tours, Bishop'),
('saint-josaphat-bishop-and-martyr', 'Saint Josaphat, Bishop and Martyr'),
('saint-albert-the-great-bishop-and-doctor-of-the-church', 'Saint Albert the Great, Bishop and Doctor of the Church'),
('saint-margaret-of-scotland', 'Saint Margaret of Scotland'),
('saint-gertrude-virgin', 'Saint Gertrude, Virgin'),
('saint-elizabeth-of-hungary-religious', 'Saint Elizabeth of Hungary, Religious'),
('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles', 'The Dedication of the Basilicas of Saints Peter and Paul, Apostles'),
('the-presentation-of-the-blessed-virgin-mary', 'The Presentation of the Blessed Virgin Mary'),
('saint-cecilia-virgin-and-martyr', 'Saint Cecilia, Virgin and Martyr'),
('saint-clement-i-pope-and-martyr', 'Saint Clement I, Pope and Martyr'),
('saint-columban-abbot', 'Saint Columban, Abbot'),
('saints-andrew-dung-lac-priest-and-companions-martyrs', 'Saints Andrew Dung-Lac, Priest, and Companions, Martyrs'),
('saint-catherine-of-alexandria-virgin-and-martyr', 'Saint Catherine of Alexandria, Virgin and Martyr'),
('saint-andrew-apostle', 'Saint Andrew, Apostle')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('all-saints', 'Tous les Saints'),
('the-commemoration-of-all-the-faithful-departed', 'Commémoration de tous les fidèles défunts'),
('saint-martin-de-porres-religious', 'Saint Martin de Porres, religieux'),
('saint-charles-borromeo-bishop', 'Saint Charles Borromée, évêque'),
('the-dedication-of-the-lateran-basilica', 'Dédicace de la basilique du Latran'),
('saint-leo-the-great-pope-and-doctor-of-the-church', 'Saint Léon le Grand, pape et docteur de l''Église'),
('saint-martin-of-tours-bishop', 'Saint Martin de Tours, évêque'),
('saint-josaphat-bishop-and-martyr', 'Saint Josaphat, évêque et martyr'),
('saint-albert-the-great-bishop-and-doctor-of-the-church', 'Saint Albert le Grand, évêque et docteur de l''Église'),
('saint-margaret-of-scotland', 'Sainte Marguerite d''Écosse'),
('saint-gertrude-virgin', 'Sainte Gertrude, vierge'),
('saint-elizabeth-of-hungary-religious', 'Sainte Élisabeth de Hongrie, religieuse'),
('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles', 'Dédicace des basiliques des saints Pierre et Paul, apôtres'),
('the-presentation-of-the-blessed-virgin-mary', 'Présentation de la Bienheureuse Vierge Marie'),
('saint-cecilia-virgin-and-martyr', 'Sainte Cécile, vierge et martyre'),
('saint-clement-i-pope-and-martyr', 'Saint Clément Ier, pape et martyr'),
('saint-columban-abbot', 'Saint Colomban, abbé'),
('saints-andrew-dung-lac-priest-and-companions-martyrs', 'Saints André Dung-Lac, prêtre, et ses compagnons, martyrs'),
('saint-catherine-of-alexandria-virgin-and-martyr', 'Sainte Catherine d''Alexandrie, vierge et martyre'),
('saint-andrew-apostle', 'Saint André, apôtre')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('all-saints', 'Omnium Sanctorum'),
('the-commemoration-of-all-the-faithful-departed', 'Commemoratio Omnium Fidelium Defunctorum'),
('saint-martin-de-porres-religious', 'Sanctus Martinus de Porres, religiosus'),
('saint-charles-borromeo-bishop', 'Sanctus Carolus Borromeo, episcopus'),
('the-dedication-of-the-lateran-basilica', 'Dedicatio Basilicae Lateranensis'),
('saint-leo-the-great-pope-and-doctor-of-the-church', 'Sanctus Leo Magnus, papa et Ecclesiae doctor'),
('saint-martin-of-tours-bishop', 'Sanctus Martinus Turonensis, episcopus'),
('saint-josaphat-bishop-and-martyr', 'Sanctus Iosaphat, episcopus et martyr'),
('saint-albert-the-great-bishop-and-doctor-of-the-church', 'Sanctus Albertus Magnus, episcopus et Ecclesiae doctor'),
('saint-margaret-of-scotland', 'Sancta Margarita Scotiae'),
('saint-gertrude-virgin', 'Sancta Gertrudis, virgo'),
('saint-elizabeth-of-hungary-religious', 'Sancta Elisabeth Hungariae, religiosa'),
('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles', 'Dedicatio Basilicarum Sanctorum Petri et Pauli'),
('the-presentation-of-the-blessed-virgin-mary', 'Praesentatio Beatae Mariae Virginis'),
('saint-cecilia-virgin-and-martyr', 'Sancta Caecilia, virgo et martyr'),
('saint-clement-i-pope-and-martyr', 'Sanctus Clemens I, papa et martyr'),
('saint-columban-abbot', 'Sanctus Columbanus, abbas'),
('saints-andrew-dung-lac-priest-and-companions-martyrs', 'Sancti Andreas Dung-Lac et Socii, martyres'),
('saint-catherine-of-alexandria-virgin-and-martyr', 'Sancta Catharina Alexandrina, virgo et martyr'),
('saint-andrew-apostle', 'Sanctus Andreas, Apostolus')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('all-saints', 11, 1, 'SOLEMNITY', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-commemoration-of-all-the-faithful-departed', 11, 2, 'SOLEMNITY', 'PURPLE', 'normal', FALSE, 'Wikipedia'),
('saint-martin-de-porres-religious', 11, 3, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-charles-borromeo-bishop', 11, 4, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-dedication-of-the-lateran-basilica', 11, 9, 'FEAST', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-leo-the-great-pope-and-doctor-of-the-church', 11, 10, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-martin-of-tours-bishop', 11, 11, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-josaphat-bishop-and-martyr', 11, 12, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-albert-the-great-bishop-and-doctor-of-the-church', 11, 15, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-margaret-of-scotland', 11, 16, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-gertrude-virgin', 11, 16, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-elizabeth-of-hungary-religious', 11, 17, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles', 11, 18, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('the-presentation-of-the-blessed-virgin-mary', 11, 21, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-cecilia-virgin-and-martyr', 11, 22, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-clement-i-pope-and-martyr', 11, 23, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-columban-abbot', 11, 23, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saints-andrew-dung-lac-priest-and-companions-martyrs', 11, 24, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-catherine-of-alexandria-virgin-and-martyr', 11, 25, 'MEM_OPT', 'RED', 'normal', TRUE, 'Wikipedia'),
('saint-andrew-apostle', 11, 30, 'FEAST', 'RED', 'normal', FALSE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Roman General Calendar - December (append mode, EN/FR/LA)
-- Calendar: ROMAN_GENERAL
-- Includes movable rule from source list:
--   - Sunday within Octave of Christmas OR 30 Dec: Holy Family (feast)
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('saint-francis-xavier-priest', 'Saint Francis Xavier, Priest', 'saint'),
('saint-john-damascene-priest-and-doctor-of-the-church', 'Saint John Damascene, Priest and Doctor of the Church', 'saint'),
('saint-nicholas-bishop', 'Saint Nicholas, Bishop', 'saint'),
('saint-ambrose-bishop-and-doctor-of-the-church', 'Saint Ambrose, Bishop and Doctor of the Church', 'saint'),
('the-immaculate-conception-of-the-blessed-virgin-mary', 'The Immaculate Conception of the Blessed Virgin Mary', 'marian'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin', 'saint'),
('our-lady-of-loreto', 'Our Lady of Loreto', 'marian'),
('saint-damasus-i-pope', 'Saint Damasus I, Pope', 'saint'),
('our-lady-of-guadalupe', 'Our Lady of Guadalupe', 'marian'),
('saint-lucy-virgin-and-martyr', 'Saint Lucy, Virgin and Martyr', 'saint'),
('saint-john-of-the-cross-priest-and-doctor-of-the-church', 'Saint John of the Cross, Priest and Doctor of the Church', 'saint'),
('saint-peter-canisius-priest-and-doctor-of-the-church', 'Saint Peter Canisius, Priest and Doctor of the Church', 'saint'),
('saint-john-of-kanty-priest', 'Saint John of Kanty, Priest', 'saint'),
('nativity-of-the-lord', 'Nativity of the Lord', 'christological'),
('saint-stephen-the-first-martyr', 'Saint Stephen, the First Martyr', 'saint'),
('saint-john-apostle-and-evangelist', 'Saint John, Apostle and Evangelist', 'saint'),
('the-holy-innocents-martyrs', 'The Holy Innocents, Martyrs', 'saint'),
('saint-thomas-becket-bishop-and-martyr', 'Saint Thomas Becket, Bishop and Martyr', 'saint'),
('saint-sylvester-i-pope', 'Saint Sylvester I, Pope', 'saint'),
('the-holy-family-of-jesus-mary-and-joseph', 'The Holy Family of Jesus, Mary and Joseph', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('saint-francis-xavier-priest', 'Saint Francis Xavier, Priest'),
('saint-john-damascene-priest-and-doctor-of-the-church', 'Saint John Damascene, Priest and Doctor of the Church'),
('saint-nicholas-bishop', 'Saint Nicholas, Bishop'),
('saint-ambrose-bishop-and-doctor-of-the-church', 'Saint Ambrose, Bishop and Doctor of the Church'),
('the-immaculate-conception-of-the-blessed-virgin-mary', 'The Immaculate Conception of the Blessed Virgin Mary'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin'),
('our-lady-of-loreto', 'Our Lady of Loreto'),
('saint-damasus-i-pope', 'Saint Damasus I, Pope'),
('our-lady-of-guadalupe', 'Our Lady of Guadalupe'),
('saint-lucy-virgin-and-martyr', 'Saint Lucy, Virgin and Martyr'),
('saint-john-of-the-cross-priest-and-doctor-of-the-church', 'Saint John of the Cross, Priest and Doctor of the Church'),
('saint-peter-canisius-priest-and-doctor-of-the-church', 'Saint Peter Canisius, Priest and Doctor of the Church'),
('saint-john-of-kanty-priest', 'Saint John of Kanty, Priest'),
('nativity-of-the-lord', 'Nativity of the Lord'),
('saint-stephen-the-first-martyr', 'Saint Stephen, the First Martyr'),
('saint-john-apostle-and-evangelist', 'Saint John, Apostle and Evangelist'),
('the-holy-innocents-martyrs', 'The Holy Innocents, Martyrs'),
('saint-thomas-becket-bishop-and-martyr', 'Saint Thomas Becket, Bishop and Martyr'),
('saint-sylvester-i-pope', 'Saint Sylvester I, Pope'),
('the-holy-family-of-jesus-mary-and-joseph', 'The Holy Family of Jesus, Mary and Joseph')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('saint-francis-xavier-priest', 'Saint François Xavier, prêtre'),
('saint-john-damascene-priest-and-doctor-of-the-church', 'Saint Jean Damascène, prêtre et docteur de l''Église'),
('saint-nicholas-bishop', 'Saint Nicolas, évêque'),
('saint-ambrose-bishop-and-doctor-of-the-church', 'Saint Ambroise, évêque et docteur de l''Église'),
('the-immaculate-conception-of-the-blessed-virgin-mary', 'Immaculée Conception de la Bienheureuse Vierge Marie'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin'),
('our-lady-of-loreto', 'Notre-Dame de Lorette'),
('saint-damasus-i-pope', 'Saint Damase Ier, pape'),
('our-lady-of-guadalupe', 'Notre-Dame de Guadalupe'),
('saint-lucy-virgin-and-martyr', 'Sainte Lucie, vierge et martyre'),
('saint-john-of-the-cross-priest-and-doctor-of-the-church', 'Saint Jean de la Croix, prêtre et docteur de l''Église'),
('saint-peter-canisius-priest-and-doctor-of-the-church', 'Saint Pierre Canisius, prêtre et docteur de l''Église'),
('saint-john-of-kanty-priest', 'Saint Jean de Kenty, prêtre'),
('nativity-of-the-lord', 'Nativité du Seigneur'),
('saint-stephen-the-first-martyr', 'Saint Étienne, premier martyr'),
('saint-john-apostle-and-evangelist', 'Saint Jean, apôtre et évangéliste'),
('the-holy-innocents-martyrs', 'Les Saints Innocents, martyrs'),
('saint-thomas-becket-bishop-and-martyr', 'Saint Thomas Becket, évêque et martyr'),
('saint-sylvester-i-pope', 'Saint Sylvestre Ier, pape'),
('the-holy-family-of-jesus-mary-and-joseph', 'La Sainte Famille de Jésus, Marie et Joseph')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('saint-francis-xavier-priest', 'Sanctus Franciscus Xaverius, presbyter'),
('saint-john-damascene-priest-and-doctor-of-the-church', 'Sanctus Ioannes Damascenus, presbyter et Ecclesiae doctor'),
('saint-nicholas-bishop', 'Sanctus Nicolaus, episcopus'),
('saint-ambrose-bishop-and-doctor-of-the-church', 'Sanctus Ambrosius, episcopus et Ecclesiae doctor'),
('the-immaculate-conception-of-the-blessed-virgin-mary', 'Immaculata Conceptio Beatae Mariae Virginis'),
('saint-juan-diego-cuauhtlatoatzin', 'Sanctus Ioannes Didacus Cuauhtlatoatzin'),
('our-lady-of-loreto', 'Beata Maria Virgo Lauretana'),
('saint-damasus-i-pope', 'Sanctus Damasus I, papa'),
('our-lady-of-guadalupe', 'Beata Maria Virgo Guadalupensis'),
('saint-lucy-virgin-and-martyr', 'Sancta Lucia, virgo et martyr'),
('saint-john-of-the-cross-priest-and-doctor-of-the-church', 'Sanctus Ioannes a Cruce, presbyter et Ecclesiae doctor'),
('saint-peter-canisius-priest-and-doctor-of-the-church', 'Sanctus Petrus Canisius, presbyter et Ecclesiae doctor'),
('saint-john-of-kanty-priest', 'Sanctus Ioannes Cantius, presbyter'),
('nativity-of-the-lord', 'Nativitas Domini'),
('saint-stephen-the-first-martyr', 'Sanctus Stephanus, Protomartyr'),
('saint-john-apostle-and-evangelist', 'Sanctus Ioannes, Apostolus et evangelista'),
('the-holy-innocents-martyrs', 'Sancti Innocentes, martyres'),
('saint-thomas-becket-bishop-and-martyr', 'Sanctus Thomas Becket, episcopus et martyr'),
('saint-sylvester-i-pope', 'Sanctus Silvester I, papa'),
('the-holy-family-of-jesus-mary-and-joseph', 'Sancta Familia Iesu, Mariae et Ioseph')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- Celebrations (fixed)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('saint-francis-xavier-priest', 12, 3, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-john-damascene-priest-and-doctor-of-the-church', 12, 4, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-nicholas-bishop', 12, 6, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-ambrose-bishop-and-doctor-of-the-church', 12, 7, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-juan-diego-cuauhtlatoatzin', 12, 9, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('our-lady-of-loreto', 12, 10, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-damasus-i-pope', 12, 11, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('our-lady-of-guadalupe', 12, 12, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-lucy-virgin-and-martyr', 12, 13, 'MEM_OBL', 'RED', 'normal', FALSE, 'Wikipedia'),
('saint-john-of-the-cross-priest-and-doctor-of-the-church', 12, 14, 'MEM_OBL', 'WHITE', 'normal', FALSE, 'Wikipedia'),
('saint-peter-canisius-priest-and-doctor-of-the-church', 12, 21, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('saint-john-of-kanty-priest', 12, 23, 'MEM_OPT', 'WHITE', 'normal', TRUE, 'Wikipedia'),
('nativity-of-the-lord', 12, 25, 'SOLEMNITY_LORD', 'WHITE', 'octave', FALSE, 'Wikipedia'),
('saint-stephen-the-first-martyr', 12, 26, 'FEAST', 'RED', 'octave', FALSE, 'Wikipedia'),
('saint-john-apostle-and-evangelist', 12, 27, 'FEAST', 'WHITE', 'octave', FALSE, 'Wikipedia'),
('the-holy-innocents-martyrs', 12, 28, 'FEAST', 'RED', 'octave', FALSE, 'Wikipedia'),
('saint-thomas-becket-bishop-and-martyr', 12, 29, 'MEM_OPT', 'RED', 'octave', TRUE, 'Wikipedia'),
('saint-sylvester-i-pope', 12, 31, 'MEM_OPT', 'WHITE', 'octave', TRUE, 'Wikipedia')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- MOVABLE rule:
-- Sunday within Octave of Christmas, or if none, 30 December: Holy Family
-- Store a movable base and handle fallback-to-30-Dec in API logic.
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', 'SUNDAY_WITHIN_CHRISTMAS_OCTAVE_OR_DEC30', 0, 'normal', FALSE, 'Wikipedia movable'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'SUNDAY_ORDINARY'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'the-holy-family-of-jesus-mary-and-joseph'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- MOVABLE rule:
-- Immaculate Conception (Dec 8) is a Solemnity, but if it falls on a Sunday (Advent Sunday), it is transferred to Dec 9.
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', 'IMMACULATE_CONCEPTION', 0, 'normal', FALSE, 'Wikipedia movable'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'SOLEMNITY_LORD'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'the-immaculate-conception-of-the-blessed-virgin-mary'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Christmas Vigil (Dec 24)
-- =========================================================

-- FEAST
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('christmas-vigil', 'Christmas Vigil', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- TRANSLATIONS
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('christmas-vigil', 'Christmas Vigil')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('christmas-vigil', 'Vigile de Noël')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('christmas-vigil', 'Vigilia Nativitatis Domini')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATION (fixed Dec 24, vigil)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', 12, 24, 'vigil', FALSE, 'Roman General Calendar'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'FERIA_PRIVILEGED'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'christmas-vigil'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Octave marker for Dec 30
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('sixth-day-in-the-octave-of-christmas', 'Sixth Day in the Octave of Christmas', 'christological')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('sixth-day-in-the-octave-of-christmas', 'Sixth Day in the Octave of Christmas')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('sixth-day-in-the-octave-of-christmas', 'Sixième jour dans l''Octave de Noël')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('sixth-day-in-the-octave-of-christmas', 'Dies Sextus infra Octavam Nativitatis Domini')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATION (fixed Dec 30, octave)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', 12, 30, 'octave', FALSE, 'Parallel octave marker'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'FERIA'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'sixth-day-in-the-octave-of-christmas'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Easter Octave (Sunday INCLUDED as observance_type='octave')
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('easter-sunday-of-the-resurrection-of-the-lord', 'Easter Sunday of the Resurrection of the Lord', 'christological'),
('monday-in-the-octave-of-easter', 'Monday in the Octave of Easter', 'christological'),
('tuesday-in-the-octave-of-easter', 'Tuesday in the Octave of Easter', 'christological'),
('wednesday-in-the-octave-of-easter', 'Wednesday in the Octave of Easter', 'christological'),
('thursday-in-the-octave-of-easter', 'Thursday in the Octave of Easter', 'christological'),
('friday-in-the-octave-of-easter', 'Friday in the Octave of Easter', 'christological'),
('saturday-in-the-octave-of-easter', 'Saturday in the Octave of Easter', 'christological'),
('second-sunday-of-easter-divine-mercy-sunday', 'Second Sunday of Easter (Divine Mercy Sunday)', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('easter-sunday-of-the-resurrection-of-the-lord', 'Easter Sunday of the Resurrection of the Lord'),
('monday-in-the-octave-of-easter', 'Monday in the Octave of Easter'),
('tuesday-in-the-octave-of-easter', 'Tuesday in the Octave of Easter'),
('wednesday-in-the-octave-of-easter', 'Wednesday in the Octave of Easter'),
('thursday-in-the-octave-of-easter', 'Thursday in the Octave of Easter'),
('friday-in-the-octave-of-easter', 'Friday in the Octave of Easter'),
('saturday-in-the-octave-of-easter', 'Saturday in the Octave of Easter'),
('second-sunday-of-easter-divine-mercy-sunday', 'Second Sunday of Easter (Divine Mercy Sunday)')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('easter-sunday-of-the-resurrection-of-the-lord', 'Dimanche de Pâques de la Résurrection du Seigneur'),
('monday-in-the-octave-of-easter', 'Lundi dans l''Octave de Pâques'),
('tuesday-in-the-octave-of-easter', 'Mardi dans l''Octave de Pâques'),
('wednesday-in-the-octave-of-easter', 'Mercredi dans l''Octave de Pâques'),
('thursday-in-the-octave-of-easter', 'Jeudi dans l''Octave de Pâques'),
('friday-in-the-octave-of-easter', 'Vendredi dans l''Octave de Pâques'),
('saturday-in-the-octave-of-easter', 'Samedi dans l''Octave de Pâques'),
('second-sunday-of-easter-divine-mercy-sunday', 'Dimanche II de Pâques (de la Divine Miséricorde)')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('easter-sunday-of-the-resurrection-of-the-lord', 'Dominica Paschae de Resurrectione Domini'),
('monday-in-the-octave-of-easter', 'Feria II infra Octavam Paschae'),
('tuesday-in-the-octave-of-easter', 'Feria III infra Octavam Paschae'),
('wednesday-in-the-octave-of-easter', 'Feria IV infra Octavam Paschae'),
('thursday-in-the-octave-of-easter', 'Feria V infra Octavam Paschae'),
('friday-in-the-octave-of-easter', 'Feria VI infra Octavam Paschae'),
('saturday-in-the-octave-of-easter', 'Sabbato infra Octavam Paschae'),
('second-sunday-of-easter-divine-mercy-sunday', 'Dominica II Paschae seu de divina Misericordia')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATIONS (movable, all octave, including Easter Sunday and Divine Mercy Sunday)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.movable_offset_days, x.observance_type, FALSE, x.notes
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('easter-sunday-of-the-resurrection-of-the-lord', 'EASTER_SUNDAY', 0, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('monday-in-the-octave-of-easter', 'EASTER_SUNDAY', 1, 'SOLEMNITY', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('tuesday-in-the-octave-of-easter', 'EASTER_SUNDAY', 2, 'SOLEMNITY', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('wednesday-in-the-octave-of-easter', 'EASTER_SUNDAY', 3, 'SOLEMNITY', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('thursday-in-the-octave-of-easter', 'EASTER_SUNDAY', 4, 'SOLEMNITY', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('friday-in-the-octave-of-easter', 'EASTER_SUNDAY', 5, 'SOLEMNITY', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('saturday-in-the-octave-of-easter', 'EASTER_SUNDAY', 6, 'SOLEMNITY', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)'),
('second-sunday-of-easter-divine-mercy-sunday', 'EASTER_SUNDAY', 7, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE', 'octave', 'Roman General Calendar (Easter Octave)')
) AS x(slug, movable_base, movable_offset_days, rank_code, color_code, observance_type, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Sundays of Eastertide 3rd–7th
-- (3rd = +14, 4th Good Shepherd = +21, 5th = +28, 6th = +35, 7th = +42)
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('third-sunday-of-easter',  'Third Sunday of Easter',                'christological'),
('fourth-sunday-of-easter', 'Fourth Sunday of Easter (Good Shepherd)', 'christological'),
('fifth-sunday-of-easter',  'Fifth Sunday of Easter',                 'christological'),
('sixth-sunday-of-easter',  'Sixth Sunday of Easter',                 'christological'),
('seventh-sunday-of-easter','Seventh Sunday of Easter',               'christological')
ON CONFLICT (slug) DO NOTHING;

-- TRANSLATIONS EN
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
  ('third-sunday-of-easter', 'Third Sunday of Easter'),
  ('fourth-sunday-of-easter', 'Fourth Sunday of Easter (Good Shepherd)'),
  ('fifth-sunday-of-easter', 'Fifth Sunday of Easter'),
  ('sixth-sunday-of-easter', 'Sixth Sunday of Easter'),
  ('seventh-sunday-of-easter', 'Seventh Sunday of Easter')
) AS x(slug, name) ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- TRANSLATIONS FR
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
  ('third-sunday-of-easter', 'Troisième dimanche de Pâques'),
  ('fourth-sunday-of-easter', 'Quatrième dimanche de Pâques (Bon Pasteur)'),
  ('fifth-sunday-of-easter', 'Cinquième dimanche de Pâques'),
  ('sixth-sunday-of-easter', 'Sixième dimanche de Pâques'),
  ('seventh-sunday-of-easter', 'Septième dimanche de Pâques')
) AS x(slug, name) ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- TRANSLATIONS LA
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
  ('third-sunday-of-easter', 'Dominica III Paschae'),
  ('fourth-sunday-of-easter', 'Dominica IV Paschae (Boni Pastoris)'),
  ('fifth-sunday-of-easter', 'Dominica V Paschae'),
  ('sixth-sunday-of-easter', 'Dominica VI Paschae'),
  ('seventh-sunday-of-easter', 'Dominica VII Paschae')
) AS x(slug, name) ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATIONS (movable, EASTER_SUNDAY + offset)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.offset_days, 'normal', FALSE, 'Roman General Calendar'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
  ('third-sunday-of-easter',   'EASTER_SUNDAY', 14, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE'),
  ('fourth-sunday-of-easter',  'EASTER_SUNDAY', 21, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE'),
  ('fifth-sunday-of-easter',   'EASTER_SUNDAY', 28, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE'),
  ('sixth-sunday-of-easter',   'EASTER_SUNDAY', 35, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE'),
  ('seventh-sunday-of-easter', 'EASTER_SUNDAY', 42, 'SUNDAY_ADVENT_LENT_EASTER', 'WHITE')
) AS x(slug, movable_base, offset_days, rank_code, color_code) ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- FEAST
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('easter-vigil-in-the-holy-night', 'Easter Vigil in the Holy Night', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- TRANSLATIONS
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('easter-vigil-in-the-holy-night', 'Easter Vigil in the Holy Night')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('easter-vigil-in-the-holy-night', 'Vigile pascale dans la Nuit sainte')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('easter-vigil-in-the-holy-night', 'Vigilia Paschalis in Nocte Sancta')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATION (movable: Easter Sunday - 1, vigil)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', 'EASTER_SUNDAY', -1, 'vigil', FALSE, 'Roman General Calendar'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'PASCHAL_TRIDUUM'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'easter-vigil-in-the-holy-night'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Holy Week (Roman General Calendar)
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('palm-sunday-of-the-passion-of-the-lord', 'Palm Sunday of the Passion of the Lord', 'christological'),
('monday-of-holy-week', 'Monday of Holy Week', 'christological'),
('tuesday-of-holy-week', 'Tuesday of Holy Week', 'christological'),
('wednesday-of-holy-week', 'Wednesday of Holy Week', 'christological'),
('holy-thursday-evening-mass-of-the-lords-supper', 'Holy Thursday: Evening Mass of the Lord''s Supper', 'christological'),
('friday-of-the-passion-of-the-lord', 'Friday of the Passion of the Lord', 'christological'),
('holy-saturday', 'Holy Saturday', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- TRANSLATIONS EN
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('palm-sunday-of-the-passion-of-the-lord', 'Palm Sunday of the Passion of the Lord'),
('monday-of-holy-week', 'Monday of Holy Week'),
('tuesday-of-holy-week', 'Tuesday of Holy Week'),
('wednesday-of-holy-week', 'Wednesday of Holy Week'),
('holy-thursday-evening-mass-of-the-lords-supper', 'Holy Thursday: Evening Mass of the Lord''s Supper'),
('friday-of-the-passion-of-the-lord', 'Friday of the Passion of the Lord'),
('holy-saturday', 'Holy Saturday')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- TRANSLATIONS FR
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('palm-sunday-of-the-passion-of-the-lord', 'Dimanche des Rameaux et de la Passion du Seigneur'),
('monday-of-holy-week', 'Lundi de la Semaine sainte'),
('tuesday-of-holy-week', 'Mardi de la Semaine sainte'),
('wednesday-of-holy-week', 'Mercredi de la Semaine sainte'),
('holy-thursday-evening-mass-of-the-lords-supper', 'Jeudi saint : Messe du soir de la Cène du Seigneur'),
('friday-of-the-passion-of-the-lord', 'Vendredi de la Passion du Seigneur'),
('holy-saturday', 'Samedi saint')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- TRANSLATIONS LA
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('palm-sunday-of-the-passion-of-the-lord', 'Dominica in Palmis de Passione Domini'),
('monday-of-holy-week', 'Feria II Hebdomadae Sanctae'),
('tuesday-of-holy-week', 'Feria III Hebdomadae Sanctae'),
('wednesday-of-holy-week', 'Feria IV Hebdomadae Sanctae'),
('holy-thursday-evening-mass-of-the-lords-supper', 'Feria V in Cena Domini'),
('friday-of-the-passion-of-the-lord', 'Feria VI in Passione Domini'),
('holy-saturday', 'Sabbatum Sanctum')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATIONS (movable, relative to Easter Sunday)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.movable_offset_days, x.observance_type, FALSE, 'Roman General Calendar (Holy Week)'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('palm-sunday-of-the-passion-of-the-lord', 'EASTER_SUNDAY', -7, 'SUNDAY_ADVENT_LENT_EASTER', 'RED', 'normal'),
('monday-of-holy-week', 'EASTER_SUNDAY', -6, 'FERIA_PRIVILEGED', 'PURPLE', 'normal'),
('tuesday-of-holy-week', 'EASTER_SUNDAY', -5, 'FERIA_PRIVILEGED', 'PURPLE', 'normal'),
('wednesday-of-holy-week', 'EASTER_SUNDAY', -4, 'FERIA_PRIVILEGED', 'PURPLE', 'normal'),
('holy-thursday-evening-mass-of-the-lords-supper', 'EASTER_SUNDAY', -3, 'PASCHAL_TRIDUUM', 'WHITE', 'normal'),
('friday-of-the-passion-of-the-lord', 'EASTER_SUNDAY', -2, 'PASCHAL_TRIDUUM', 'RED', 'normal'),
('holy-saturday', 'EASTER_SUNDAY', -1, 'PASCHAL_TRIDUUM', 'PURPLE', 'normal')
) AS x(slug, movable_base, movable_offset_days, rank_code, color_code, observance_type)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Lent core block (Roman General Calendar)
-- - Ash Wednesday
-- - 1st to 5th Sundays of Lent
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('ash-wednesday', 'Ash Wednesday', 'christological'),
('thursday-after-ash-wednesday', 'Thursday after Ash Wednesday', 'christological'),
('friday-after-ash-wednesday', 'Friday after Ash Wednesday', 'christological'),
('saturday-after-ash-wednesday', 'Saturday after Ash Wednesday', 'christological'),
('first-sunday-of-lent', 'First Sunday of Lent', 'christological'),
('second-sunday-of-lent', 'Second Sunday of Lent', 'christological'),
('third-sunday-of-lent', 'Third Sunday of Lent', 'christological'),
('fourth-sunday-of-lent', 'Fourth Sunday of Lent', 'christological'),
('fifth-sunday-of-lent', 'Fifth Sunday of Lent', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('ash-wednesday', 'Ash Wednesday'),
('first-sunday-of-lent', 'First Sunday of Lent'),
('thursday-after-ash-wednesday', 'Thursday after Ash Wednesday'),
('friday-after-ash-wednesday', 'Friday after Ash Wednesday'),
('saturday-after-ash-wednesday', 'Saturday after Ash Wednesday'),
('second-sunday-of-lent', 'Second Sunday of Lent'),
('third-sunday-of-lent', 'Third Sunday of Lent'),
('fourth-sunday-of-lent', 'Fourth Sunday of Lent'),
('fifth-sunday-of-lent', 'Fifth Sunday of Lent')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('ash-wednesday', 'Mercredi des Cendres'),
('thursday-after-ash-wednesday', 'Jeudi après le Mercredi des Cendres'),
('friday-after-ash-wednesday', 'Vendredi après le Mercredi des Cendres'),
('saturday-after-ash-wednesday', 'Samedi après le Mercredi des Cendres'),
('first-sunday-of-lent', 'Premier dimanche de Carême'),
('second-sunday-of-lent', 'Deuxième dimanche de Carême'),
('third-sunday-of-lent', 'Troisième dimanche de Carême'),
('fourth-sunday-of-lent', 'Quatrième dimanche de Carême'),
('fifth-sunday-of-lent', 'Cinquième dimanche de Carême')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('ash-wednesday', 'Feria IV Cinerum'),
('thursday-after-ash-wednesday', 'Feria V post Cineres'),
('friday-after-ash-wednesday', 'Feria VI post Cineres'),
('saturday-after-ash-wednesday', 'Sabbatum post Cineres'),
('first-sunday-of-lent', 'Dominica I in Quadragesima'),
('second-sunday-of-lent', 'Dominica II in Quadragesima'),
('third-sunday-of-lent', 'Dominica III in Quadragesima'),
('fourth-sunday-of-lent', 'Dominica IV in Quadragesima'),
('fifth-sunday-of-lent', 'Dominica V in Quadragesima')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATIONS (movable relative to Easter Sunday)
-- Ash Wednesday = Easter - 46
-- Lent Sundays = Easter -42, -35, -28, -21, -14
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.movable_offset_days, 'normal', FALSE, 'Roman General Calendar (Lent core)'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('ash-wednesday', 'EASTER_SUNDAY', -46, 'FERIA_PRIVILEGED', 'PURPLE'),
('thursday-after-ash-wednesday', 'EASTER_SUNDAY', -45, 'FERIA_PRIVILEGED', 'PURPLE'),
('friday-after-ash-wednesday', 'EASTER_SUNDAY', -44, 'FERIA_PRIVILEGED', 'PURPLE'),
('saturday-after-ash-wednesday', 'EASTER_SUNDAY', -43, 'FERIA_PRIVILEGED', 'PURPLE'),
('first-sunday-of-lent', 'EASTER_SUNDAY', -42, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE'),
('second-sunday-of-lent', 'EASTER_SUNDAY', -35, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE'),
('third-sunday-of-lent', 'EASTER_SUNDAY', -28, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE'),
('fourth-sunday-of-lent', 'EASTER_SUNDAY', -21, 'SUNDAY_ADVENT_LENT_EASTER', 'ROSE'),
('fifth-sunday-of-lent', 'EASTER_SUNDAY', -14, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE')
) AS x(slug, movable_base, movable_offset_days, rank_code, color_code)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- Advent core block (Roman General Calendar)
-- - First to Fourth Sunday of Advent
-- - Christmas Eve day (optional explicit marker)
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('first-sunday-of-advent', 'First Sunday of Advent', 'christological'),
('second-sunday-of-advent', 'Second Sunday of Advent', 'christological'),
('third-sunday-of-advent', 'Third Sunday of Advent', 'christological'),
('fourth-sunday-of-advent', 'Fourth Sunday of Advent', 'christological'),
('december-24-advent-feria', '24 December (Advent Feria)', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('first-sunday-of-advent', 'First Sunday of Advent'),
('second-sunday-of-advent', 'Second Sunday of Advent'),
('third-sunday-of-advent', 'Third Sunday of Advent'),
('fourth-sunday-of-advent', 'Fourth Sunday of Advent'),
('december-24-advent-feria', '24 December (Advent Feria)')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('first-sunday-of-advent', 'Premier dimanche de l''Avent'),
('second-sunday-of-advent', 'Deuxième dimanche de l''Avent'),
('third-sunday-of-advent', 'Troisième dimanche de l''Avent'),
('fourth-sunday-of-advent', 'Quatrième dimanche de l''Avent'),
('december-24-advent-feria', '24 décembre (Férie de l''Avent)')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('first-sunday-of-advent', 'Dominica I Adventus'),
('second-sunday-of-advent', 'Dominica II Adventus'),
('third-sunday-of-advent', 'Dominica III Adventus'),
('fourth-sunday-of-advent', 'Dominica IV Adventus'),
('december-24-advent-feria', 'Die 24 Decembris (Feria Adventus)')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATIONS (movable Sundays: 1st Sunday of Advent + 7, +14, +21)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.movable_offset_days, x.observance_type, FALSE, 'Roman General Calendar'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('first-sunday-of-advent', 'FIRST_ADVENT_SUNDAY', 0, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE', 'normal'),
('second-sunday-of-advent', 'FIRST_ADVENT_SUNDAY', 7, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE', 'normal'),
('third-sunday-of-advent', 'FIRST_ADVENT_SUNDAY', 14, 'SUNDAY_ADVENT_LENT_EASTER', 'ROSE', 'normal'),
('fourth-sunday-of-advent', 'FIRST_ADVENT_SUNDAY', 21, 'SUNDAY_ADVENT_LENT_EASTER', 'PURPLE', 'normal')
) AS x(slug, movable_base, movable_offset_days, rank_code, color_code, observance_type)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- CELEBRATION (Dec 24 as fixed Advent feria marker, daytime before Christmas Vigil)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'fixed', 12, 24, 'normal', FALSE, 'Roman General Calendar'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = 'FERIA_PRIVILEGED'
LEFT JOIN liturgical_colors lc ON lc.code = 'PURPLE'
WHERE f.slug = 'december-24-advent-feria'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- CENTRAL MOVABLE TEMPORAL BLOCK
-- (Ascension, Pentecost, Trinity, Corpus Christi,
--  Sacred Heart, Immaculate Heart, Christ the King)
-- =========================================================

-- FEASTS
INSERT INTO feasts (slug, default_name, feast_type) VALUES
('the-ascension-of-the-lord', 'The Ascension of the Lord', 'christological'),
('pentecost-sunday', 'Pentecost Sunday', 'christological'),
('blessed-virgin-mary-mother-of-the-church', 'Blessed Virgin Mary, Mother of the Church', 'marian'),
('the-most-holy-trinity', 'The Most Holy Trinity', 'christological'),
('the-most-holy-body-and-blood-of-christ', 'The Most Holy Body and Blood of Christ', 'christological'),
('the-most-sacred-heart-of-jesus', 'The Most Sacred Heart of Jesus', 'christological'),
('the-immaculate-heart-of-the-blessed-virgin-mary', 'The Immaculate Heart of the Blessed Virgin Mary', 'marian'),
('our-lord-jesus-christ-king-of-the-universe', 'Our Lord Jesus Christ, King of the Universe', 'christological')
ON CONFLICT (slug) DO NOTHING;

-- EN translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'en', x.name
FROM feasts f
JOIN (VALUES
('the-ascension-of-the-lord', 'The Ascension of the Lord'),
('pentecost-sunday', 'Pentecost Sunday'),
('blessed-virgin-mary-mother-of-the-church', 'Blessed Virgin Mary, Mother of the Church'),
('the-most-holy-trinity', 'The Most Holy Trinity'),
('the-most-holy-body-and-blood-of-christ', 'The Most Holy Body and Blood of Christ'),
('the-most-sacred-heart-of-jesus', 'The Most Sacred Heart of Jesus'),
('the-immaculate-heart-of-the-blessed-virgin-mary', 'The Immaculate Heart of the Blessed Virgin Mary'),
('our-lord-jesus-christ-king-of-the-universe', 'Our Lord Jesus Christ, King of the Universe')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- FR translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'fr', x.name
FROM feasts f
JOIN (VALUES
('the-ascension-of-the-lord', 'Ascension du Seigneur'),
('pentecost-sunday', 'Dimanche de la Pentecôte'),
('blessed-virgin-mary-mother-of-the-church', 'Bienheureuse Vierge Marie, Mère de l''Église'),
('the-most-holy-trinity', 'La Très Sainte Trinité'),
('the-most-holy-body-and-blood-of-christ', 'Le Très Saint Corps et Sang du Christ'),
('the-most-sacred-heart-of-jesus', 'Le Sacré-Cœur de Jésus'),
('the-immaculate-heart-of-the-blessed-virgin-mary', 'Le Cœur Immaculé de la Bienheureuse Vierge Marie'),
('our-lord-jesus-christ-king-of-the-universe', 'Notre Seigneur Jésus-Christ, Roi de l''Univers')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- LA translations
INSERT INTO feast_translations (feast_id, locale_code, name)
SELECT f.id, 'la', x.name
FROM feasts f
JOIN (VALUES
('the-ascension-of-the-lord', 'Ascensio Domini'),
('pentecost-sunday', 'Dominica Pentecostes'),
('blessed-virgin-mary-mother-of-the-church', 'Beata Maria Virgo, Mater Ecclesiae'),
('the-most-holy-trinity', 'Sanctissima Trinitas'),
('the-most-holy-body-and-blood-of-christ', 'Sanctissimi Corporis et Sanguinis Christi'),
('the-most-sacred-heart-of-jesus', 'Sacratissimum Cor Iesu'),
('the-immaculate-heart-of-the-blessed-virgin-mary', 'Cor Immaculatum Beatae Mariae Virginis'),
('our-lord-jesus-christ-king-of-the-universe', 'Domini Nostri Iesu Christi Universorum Regis')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- CELEBRATIONS (movable)
-- Ascension: Easter +39
-- Pentecost: Easter +49
-- Mother of the Church: Pentecost +1 (Monday)
-- Trinity: Pentecost +7 (Sunday)
-- Corpus Christi: Trinity +4 (Thursday)
-- Sacred Heart: Second Sunday after Pentecost +5 (Friday)
-- Immaculate Heart: Second Sunday after Pentecost +6 (Saturday)
-- Christ the King: last Sunday of Ordinary Time = Sunday before 1st Advent Sunday
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, c.id, r.id, lc.id, 'movable', x.movable_base, x.movable_offset_days, 'normal', FALSE, 'Roman General Calendar'
FROM feasts f
JOIN calendars c ON c.code = 'ROMAN_GENERAL'
JOIN (VALUES
('the-ascension-of-the-lord', 'EASTER_SUNDAY', 39, 'SOLEMNITY', 'WHITE'),
('pentecost-sunday', 'EASTER_SUNDAY', 49, 'SOLEMNITY', 'RED'),
('blessed-virgin-mary-mother-of-the-church', 'PENTECOST', 1, 'MEM_OBL', 'WHITE'),
('the-most-holy-trinity', 'PENTECOST', 7, 'SOLEMNITY_LORD', 'WHITE'),
('the-most-holy-body-and-blood-of-christ', 'TRINITY_SUNDAY', 4, 'SOLEMNITY_LORD', 'WHITE'),
('the-most-sacred-heart-of-jesus', 'SECOND_SUNDAY_AFTER_PENTECOST', 5, 'SOLEMNITY_LORD', 'WHITE'),
('the-immaculate-heart-of-the-blessed-virgin-mary', 'SECOND_SUNDAY_AFTER_PENTECOST', 6, 'MEM_OBL', 'WHITE'),
('our-lord-jesus-christ-king-of-the-universe', 'FIRST_ADVENT_SUNDAY', -7, 'SOLEMNITY_LORD', 'WHITE')
) AS x(slug, movable_base, movable_offset_days, rank_code, color_code)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = c.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

COMMIT;
