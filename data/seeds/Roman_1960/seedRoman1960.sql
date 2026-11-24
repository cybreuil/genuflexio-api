-- =========================================================
-- General Roman Calendar of 1960 - as it is used in 1962 Missal
-- Revised by Pope John XXIII in 1960, and used in the 1962 Missal.
-- Calendar: ROMAN_1960
-- Source: https://en.wikipedia.org/wiki/General_Roman_Calendar_of_1960
-- Ranks: CLASS_I, CLASS_II, CLASS_III, COMM (commemoration), VIGIL
-- =========================================================

BEGIN;

-- =========================================================
-- SECTION 1: NEW FEASTS (slugs not in ROMAN_GENERAL)
-- =========================================================

INSERT INTO feasts (slug, default_name, feast_type) VALUES
-- Extra
('saturday-of-the-virgin', 'Saturday of the Blessed Virgin Mary', 'marian'),
-- quatre temps
('ember-wednesday-of-advent', 'Ember Wednesday in Advent', 'liturgical'),
('ember-friday-of-advent', 'Ember Friday in Advent', 'liturgical'),
('ember-saturday-of-advent', 'Ember Saturday in Advent', 'liturgical'),

('ember-wednesday-of-lent', 'Ember Wednesday in Lent', 'liturgical'),
('ember-friday-of-lent', 'Ember Friday in Lent', 'liturgical'),
('ember-saturday-of-lent', 'Ember Saturday in Lent', 'liturgical'),

('ember-wednesday-after-pentecost', 'Ember Wednesday in the Octave of Pentecost', 'liturgical'),
('ember-friday-after-pentecost', 'Ember Friday in the Octave of Pentecost', 'liturgical'),
('ember-saturday-after-pentecost', 'Ember Saturday in the Octave of Pentecost', 'liturgical'),

('ember-wednesday-of-september', 'September Ember Wednesday', 'liturgical'),
('ember-friday-of-september', 'September Ember Friday', 'liturgical'),
('ember-saturday-of-september', 'September Ember Saturday', 'liturgical'),

-- septuagesima
('septuagesima-sunday', 'Septuagesima Sunday', 'liturgical'),
('sexagesima-sunday', 'Sexagesima Sunday', 'liturgical'),
('quinquagesima-sunday', 'Quinquagesima Sunday', 'liturgical'),

-- Pentecost Octave
('monday-in-the-octave-of-pentecost',
 'Monday in the Octave of Pentecost',
 'liturgical'),

('tuesday-in-the-octave-of-pentecost',
 'Tuesday in the Octave of Pentecost',
 'liturgical'),

('thursday-in-the-octave-of-pentecost',
 'Thursday in the Octave of Pentecost',
 'liturgical'),

('saturday-in-the-octave-of-pentecost',
 'Saturday in the Octave of Pentecost',
 'liturgical'),

-- Vigil of Ascension
('vigil-of-the-ascension',
 'Vigil of the Ascension',
 'vigil'),

-- Vigil of Pentecost
('vigil-of-pentecost',
 'Vigil of Pentecost',
 'vigil'),


-- January
('circumcision-and-octave-day-of-the-nativity', 'Circumcision of Our Lord and Octave Day of the Nativity', 'christological'),
('saints-fabian-and-sebastian-martyrs', 'Saints Fabian and Sebastian, Martyrs', 'saint'),
('saints-vincent-and-anastasius-martyrs', 'Saints Vincent and Anastasius, Martyrs', 'saint'),
('saint-timothy-bishop-and-martyr-1962', 'Saint Timothy, Bishop and Martyr', 'saint'),
('saint-peter-nolasco-confessor', 'Saint Peter Nolasco, Confessor', 'saint'),
('saint-martina-virgin-and-martyr', 'Saint Martina, Virgin and Martyr', 'saint'),
('saint-paul-the-first-hermit', 'Saint Paul the First Hermit', 'saint'),
('saint-marcellus-i-pope-and-martyr', 'Saint Marcellus I, Pope and Martyr', 'saint'),
('the-holy-family-of-jesus-mary-and-joseph-1960', 'The Holy Family of Jesus, Mary and Joseph', 'christological'),
('commemoration-of-saint-telesphorus', 'Commemoration of Saint Telesphorus, Pope and Martyr', 'saint'),
('commemoration-of-saint-hyginus', 'Commemoration of Saint Hyginus, Pope and Martyr', 'saint'),
('commemoration-of-saint-felix-of-nola', 'Commemoration of Saint Felix of Nola, Priest and Martyr', 'saint'),
('commemoration-of-saint-maurus-abbot', 'Commemoration of Saint Maurus, Abbot', 'saint'),
('commemoration-of-saint-prisca', 'Commemoration of Saint Prisca, Virgin and Martyr', 'saint'),
('commemoration-of-saints-marius-martha-audifax-abachum', 'Commemoration of Saints Marius, Martha, Audifax and Abachum, Martyrs', 'saint'),
-- February
('saint-andrew-corsini-bishop-and-confessor', 'Saint Andrew Corsini, Bishop and Confessor', 'saint'),
('saint-titus-bishop-and-confessor', 'Saint Titus, Bishop and Confessor', 'saint'),
('saint-john-of-matha-confessor', 'Saint John of Matha, Confessor', 'saint'),
('saint-gabriel-of-our-lady-of-sorrows', 'Saint Gabriel of Our Lady of Sorrows, Confessor', 'saint'),
('commemoration-of-saint-valentine', 'Commemoration of Saint Valentine, Priest and Martyr', 'saint'),
('commemoration-of-saints-faustinus-and-jovita', 'Commemoration of Saints Faustinus and Jovita, Martyrs', 'saint'),
('commemoration-of-saint-simeon-bishop-and-martyr', 'Commemoration of Saint Simeon, Bishop and Martyr', 'saint'),
-- March
('the-forty-holy-martyrs-of-sebaste', 'The Forty Holy Martyrs of Sebaste', 'saint'),
('saint-gabriel-the-archangel', 'Saint Gabriel the Archangel', 'christological'),
('saint-john-capistran-confessor', 'Saint John Capistran, Confessor', 'saint'),
-- April
('saint-hermenegild-martyr', 'Saint Hermenegild, Martyr', 'saint'),
('saints-soter-and-cajus-popes-and-martyrs', 'Saints Soter and Cajus, Popes and Martyrs', 'saint'),
('saints-cletus-and-marcellinus-popes-and-martyrs', 'Saints Cletus and Marcellinus, Popes and Martyrs', 'saint'),
('saint-peter-martyr-op', 'Saint Peter Martyr, Dominican', 'saint'),
-- May
('saint-joseph-the-workman', 'Saint Joseph the Workman', 'saint'),
('saint-monica-widow', 'Saint Monica, Widow', 'saint'),
('saint-gregory-nazianzen-bishop-and-doctor', 'Saint Gregory Nazianzen, Bishop and Doctor', 'saint'),
('saint-antoninus-archbishop', 'Saint Antoninus, Archbishop', 'saint'),
('saints-nereus-achilleus-domitilla-pancras-martyrs', 'Saints Nereus, Achilleus, Domitilla and Pancras, Martyrs', 'saint'),
('saint-ubald-bishop-and-confessor', 'Saint Ubald, Bishop and Confessor', 'saint'),
('saint-paschal-baylon-confessor', 'Saint Paschal Baylon, Confessor', 'saint'),
('saint-venantius-martyr', 'Saint Venantius, Martyr', 'saint'),
('saint-peter-celestine-pope', 'Saint Peter Celestine, Pope and Confessor', 'saint'),
('blessed-virgin-mary-queen', 'Blessed Virgin Mary, Queen', 'marian'),
('commemoration-of-saints-alexander-eventius-theodulus', 'Commemoration of Saints Alexander, Eventius, Theodulus and Juvenal, Martyrs', 'saint'),
('commemoration-of-saint-boniface-martyr-may', 'Commemoration of Saint Boniface, Martyr', 'saint'),
('commemoration-of-saint-felix-i-pope', 'Commemoration of Saint Felix I, Pope and Martyr', 'saint'),
-- June
('saint-angela-merici-virgin-june', 'Saint Angela Merici, Virgin', 'saint'),
('saint-francis-caracciolo-confessor', 'Saint Francis Caracciolo, Confessor', 'saint'),
('saint-boniface-bishop-and-martyr', 'Saint Boniface, Bishop and Martyr', 'saint'),
('saint-margaret-of-scotland-queen', 'Saint Margaret of Scotland, Queen and Widow', 'saint'),
('saint-john-of-san-facundo-confessor', 'Saint John of San Facundo, Confessor', 'saint'),
('saint-basil-the-great-bishop-and-doctor', 'Saint Basil the Great, Bishop and Doctor', 'saint'),
('saint-gregory-barbarigo-bishop', 'Saint Gregory Barbarigo, Bishop', 'saint'),
('saint-juliana-falconieri-virgin', 'Saint Juliana Falconieri, Virgin', 'saint'),
('vigil-of-saint-john-the-baptist', 'Vigil of the Nativity of Saint John the Baptist', 'saint'),
('saint-william-abbot', 'Saint William, Abbot and Confessor', 'saint'),
('saints-john-and-paul-martyrs', 'Saints John and Paul, Martyrs', 'saint'),
('vigil-of-saints-peter-and-paul', 'Vigil of Saints Peter and Paul, Apostles', 'saint'),
('commemoration-of-saint-paul-apostle-june', 'Commemoration of Saint Paul, Apostle', 'saint'),
('commemoration-of-saints-marcellinus-peter-erasmus', 'Commemoration of Saints Marcellinus, Peter and Erasmus, Martyrs', 'saint'),
('commemoration-of-saints-primus-and-felician', 'Commemoration of Saints Primus and Felician, Martyrs', 'saint'),
('commemoration-of-saint-silverius', 'Commemoration of Saint Silverius, Pope and Martyr', 'saint'),
-- July
('the-most-precious-blood-of-our-lord', 'The Most Precious Blood of Our Lord Jesus Christ', 'christological'),
('seven-holy-brothers-martyrs', 'The Seven Holy Brothers, Martyrs, with Saints Rufina and Secunda', 'saint'),
('saint-john-gualbert-abbot', 'Saint John Gualbert, Abbot and Confessor', 'saint'),
('saint-anne-mother-of-the-blessed-virgin-mary', 'Saint Anne, Mother of the Blessed Virgin Mary', 'saint'),
('saint-martha-virgin', 'Saint Martha, Virgin', 'saint'),
('commemoration-of-our-lady-of-mt-carmel', 'Commemoration of the Blessed Virgin Mary of Mount Carmel', 'marian'),
('commemoration-of-saint-alexius', 'Commemoration of Saint Alexius, Confessor', 'saint'),
('commemoration-of-saint-pius-i', 'Commemoration of Saint Pius I, Pope and Martyr', 'saint'),
('commemoration-of-saint-christina-virgin', 'Commemoration of Saint Christina, Virgin and Martyr', 'saint'),
('commemoration-of-saint-pantaleon', 'Commemoration of Saint Pantaleon, Martyr', 'saint'),
('commemoration-of-saints-nazarius-celsus-victor-innocent', 'Commemoration of Saints Nazarius, Celsus, Victor I and Innocent I', 'saint'),
('commemoration-of-saints-abdon-and-sennen', 'Commemoration of Saints Abdon and Sennen, Martyrs', 'saint'),
-- August
('commemoration-of-holy-machabees', 'Commemoration of the Holy Machabees, Martyrs', 'saint'),
('vigil-of-saint-laurence', 'Vigil of Saint Laurence, Martyr', 'saint'),
('saint-joachim-father-of-the-blessed-virgin-mary', 'Saint Joachim, Father of the Blessed Virgin Mary', 'saint'),
('saint-hyacinth-confessor', 'Saint Hyacinth, Confessor', 'saint'),
('saint-philip-benizi-confessor', 'Saint Philip Benizi, Confessor', 'saint'),
('saint-raymond-nonnatus-confessor', 'Saint Raymond Nonnatus, Confessor', 'saint'),
('vigil-of-the-assumption', 'Vigil of the Assumption of the Blessed Virgin Mary', 'marian'),
('commemoration-of-saints-tiburtius-and-susanna', 'Commemoration of Saints Tiburtius and Susanna, Martyrs', 'saint'),
('commemoration-of-saints-hippolytus-and-cassian', 'Commemoration of Saints Hippolytus and Cassian, Martyrs', 'saint'),
('commemoration-of-saint-agapitus-martyr', 'Commemoration of Saint Agapitus, Martyr', 'saint'),
('commemoration-of-saint-zephyrinus', 'Commemoration of Saint Zephyrinus, Pope and Martyr', 'saint'),
-- September
('saint-laurence-justinian-bishop', 'Saint Laurence Justinian, Bishop and Confessor', 'saint'),
('saint-nicholas-of-tolentino-confessor', 'Saint Nicholas of Tolentino, Confessor', 'saint'),
('the-seven-sorrows-of-the-blessed-virgin-mary', 'The Seven Sorrows of the Blessed Virgin Mary', 'marian'),
('saint-joseph-of-cupertino-confessor', 'Saint Joseph of Cupertino, Confessor', 'saint'),
('saint-thomas-of-villanova-bishop', 'Saint Thomas of Villanova, Bishop and Confessor', 'saint'),
('saint-linus-pope-and-martyr', 'Saint Linus, Pope and Martyr', 'saint'),
('dedication-of-saint-michael-archangel', 'Dedication of Saint Michael the Archangel', 'christological'),
('commemoration-of-saint-gorgonius', 'Commemoration of Saint Gorgonius, Martyr', 'saint'),
('commemoration-of-saints-protus-and-hyacinth', 'Commemoration of Saints Protus and Hyacinth, Martyrs', 'saint'),
('commemoration-of-stigmata-of-saint-francis', 'Commemoration of the Stigmata of Saint Francis', 'saint'),
('commemoration-of-saint-eustace', 'Commemoration of Saint Eustace, Martyr', 'saint'),
('commemoration-of-our-lady-of-ransom', 'Commemoration of Our Lady of Ransom', 'marian'),
('commemoration-of-saint-giles-abbot', 'Commemoration of Saint Giles, Abbot', 'saint'),
-- October
('maternity-of-the-blessed-virgin-mary', 'The Maternity of the Blessed Virgin Mary', 'marian'),
('saint-edward-king-and-confessor', 'Saint Edward, King and Confessor', 'saint'),
('saint-peter-of-alcantara-confessor', 'Saint Peter of Alcantara, Confessor', 'saint'),
('saint-raphael-archangel', 'Saint Raphael the Archangel', 'christological'),
('our-lord-jesus-christ-the-king', 'Our Lord Jesus Christ the King', 'christological'),
('commemoration-of-saint-hilarion', 'Commemoration of Saint Hilarion, Abbot', 'saint'),
('commemoration-of-saints-chrysanthus-and-daria', 'Commemoration of Saints Chrysanthus and Daria, Martyrs', 'saint'),
('commemoration-of-saint-evaristus', 'Commemoration of Saint Evaristus, Pope and Martyr', 'saint'),
-- November
('saint-andrew-avellino-confessor', 'Saint Andrew Avellino, Confessor', 'saint'),
('saint-didacus-confessor', 'Saint Didacus, Confessor', 'saint'),
('saint-gregory-thaumaturgus-bishop', 'Saint Gregory Thaumaturgus, Bishop and Confessor', 'saint'),
('saint-felix-of-valois-confessor', 'Saint Felix of Valois, Confessor', 'saint'),
('saint-sylvester-abbot', 'Saint Sylvester, Abbot and Confessor', 'saint'),
('commemoration-of-holy-four-crowned-martyrs', 'Commemoration of the Holy Four Crowned Martyrs', 'saint'),
('commemoration-of-saint-saturninus', 'Commemoration of Saint Saturninus, Martyr', 'saint'),
-- December
('saint-bibiana-virgin-and-martyr', 'Saint Bibiana, Virgin and Martyr', 'saint'),
('fifth-day-within-octave-of-christmas', 'Fifth Day within the Octave of Christmas', 'christological'),
('sixth-day-within-octave-of-christmas', 'Sixth Day within the Octave of Christmas', 'christological'),
('seventh-day-within-octave-of-christmas', 'Seventh Day within the Octave of Christmas, with Commemoration of Saint Sylvester I', 'christological'),
('commemoration-of-saint-sabbas-abbot', 'Commemoration of Saint Sabbas, Abbot', 'saint')
ON CONFLICT (slug) DO NOTHING;

-- =========================================================
-- SECTION 2: FEAST TRANSLATIONS - ENGLISH
-- =========================================================

INSERT INTO feast_translations (feast_id, locale_code, name, description)
SELECT f.id, 'en', x.name, NULL
FROM feasts f
JOIN (VALUES
-- Extra
('saturday-of-the-virgin', 'Saturday of the Blessed Virgin Mary'),
-- Quatre temps
-- Ember Days of Advent
('ember-wednesday-of-advent', 'Ember Wednesday in Advent'),
('ember-friday-of-advent', 'Ember Friday in Advent'),
('ember-saturday-of-advent', 'Ember Saturday in Advent'),

-- Lenten Ember Days
('ember-wednesday-of-lent', 'Ember Wednesday in Lent'),
('ember-friday-of-lent', 'Ember Friday in Lent'),
('ember-saturday-of-lent', 'Ember Saturday in Lent'),

-- Ember Days of Pentecost
('ember-wednesday-after-pentecost', 'Ember Wednesday in the Octave of Pentecost'),
('ember-friday-after-pentecost', 'Ember Friday in the Octave of Pentecost'),
('ember-saturday-after-pentecost', 'Ember Saturday in the Octave of Pentecost'),

-- September Ember Days
('ember-wednesday-of-september', 'September Ember Wednesday'),
('ember-friday-of-september', 'September Ember Friday'),
('ember-saturday-of-september', 'September Ember Saturday'),

-- Septuagesima
('septuagesima-sunday', 'Septuagesima Sunday'),
('sexagesima-sunday', 'Sexagesima Sunday'),
('quinquagesima-sunday', 'Quinquagesima Sunday'),

-- Pentecost Octave
('monday-in-the-octave-of-pentecost', 'Monday in the Octave of Pentecost'),
('tuesday-in-the-octave-of-pentecost', 'Tuesday in the Octave of Pentecost'),
('thursday-in-the-octave-of-pentecost', 'Thursday in the Octave of Pentecost'),
('saturday-in-the-octave-of-pentecost', 'Saturday in the Octave of Pentecost'),

-- Vigils
('vigil-of-the-ascension', 'Vigil of the Ascension'),
('vigil-of-pentecost', 'Vigil of Pentecost'),

-- January
('circumcision-and-octave-day-of-the-nativity', 'Circumcision of Our Lord and Octave Day of the Nativity'),
('saints-fabian-and-sebastian-martyrs', 'Saints Fabian and Sebastian, Martyrs'),
('saints-vincent-and-anastasius-martyrs', 'Saints Vincent and Anastasius, Martyrs'),
('saint-timothy-bishop-and-martyr-1962', 'Saint Timothy, Bishop and Martyr'),
('saint-peter-nolasco-confessor', 'Saint Peter Nolasco, Confessor'),
('saint-martina-virgin-and-martyr', 'Saint Martina, Virgin and Martyr'),
('saint-paul-the-first-hermit', 'Saint Paul the First Hermit'),
('saint-marcellus-i-pope-and-martyr', 'Saint Marcellus I, Pope and Martyr'),
('the-holy-family-of-jesus-mary-and-joseph-1960', 'The Holy Family of Jesus, Mary and Joseph'),
('commemoration-of-saint-telesphorus', 'Commemoration of Saint Telesphorus, Pope and Martyr'),
('commemoration-of-saint-hyginus', 'Commemoration of Saint Hyginus, Pope and Martyr'),
('commemoration-of-saint-felix-of-nola', 'Commemoration of Saint Felix of Nola, Priest and Martyr'),
('commemoration-of-saint-maurus-abbot', 'Commemoration of Saint Maurus, Abbot'),
('commemoration-of-saint-prisca', 'Commemoration of Saint Prisca, Virgin and Martyr'),
('commemoration-of-saints-marius-martha-audifax-abachum', 'Commemoration of Saints Marius, Martha, Audifax and Abachum, Martyrs'),
('saint-andrew-corsini-bishop-and-confessor', 'Saint Andrew Corsini, Bishop and Confessor'),
('saint-titus-bishop-and-confessor', 'Saint Titus, Bishop and Confessor'),
('saint-john-of-matha-confessor', 'Saint John of Matha, Confessor'),
('saint-gabriel-of-our-lady-of-sorrows', 'Saint Gabriel of Our Lady of Sorrows, Confessor'),
('commemoration-of-saint-valentine', 'Commemoration of Saint Valentine, Priest and Martyr'),
('commemoration-of-saints-faustinus-and-jovita', 'Commemoration of Saints Faustinus and Jovita, Martyrs'),
('commemoration-of-saint-simeon-bishop-and-martyr', 'Commemoration of Saint Simeon, Bishop and Martyr'),
('the-forty-holy-martyrs-of-sebaste', 'The Forty Holy Martyrs of Sebaste'),
('saint-gabriel-the-archangel', 'Saint Gabriel the Archangel'),
('saint-john-capistran-confessor', 'Saint John Capistran, Confessor'),
('saint-hermenegild-martyr', 'Saint Hermenegild, Martyr'),
('saints-soter-and-cajus-popes-and-martyrs', 'Saints Soter and Cajus, Popes and Martyrs'),
('saints-cletus-and-marcellinus-popes-and-martyrs', 'Saints Cletus and Marcellinus, Popes and Martyrs'),
('saint-peter-martyr-op', 'Saint Peter Martyr'),
('saint-joseph-the-workman', 'Saint Joseph the Workman'),
('saint-monica-widow', 'Saint Monica, Widow'),
('saint-gregory-nazianzen-bishop-and-doctor', 'Saint Gregory Nazianzen, Bishop and Doctor'),
('saint-antoninus-archbishop', 'Saint Antoninus, Archbishop'),
('saints-nereus-achilleus-domitilla-pancras-martyrs', 'Saints Nereus, Achilleus, Domitilla and Pancras, Martyrs'),
('saint-ubald-bishop-and-confessor', 'Saint Ubald, Bishop and Confessor'),
('saint-paschal-baylon-confessor', 'Saint Paschal Baylon, Confessor'),
('saint-venantius-martyr', 'Saint Venantius, Martyr'),
('saint-peter-celestine-pope', 'Saint Peter Celestine, Pope and Confessor'),
('blessed-virgin-mary-queen', 'Blessed Virgin Mary, Queen'),
('commemoration-of-saints-alexander-eventius-theodulus', 'Commemoration of Saints Alexander, Eventius, Theodulus and Juvenal, Martyrs'),
('commemoration-of-saint-boniface-martyr-may', 'Commemoration of Saint Boniface, Martyr'),
('commemoration-of-saint-felix-i-pope', 'Commemoration of Saint Felix I, Pope and Martyr'),
('saint-angela-merici-virgin-june', 'Saint Angela Merici, Virgin'),
('saint-francis-caracciolo-confessor', 'Saint Francis Caracciolo, Confessor'),
('saint-boniface-bishop-and-martyr', 'Saint Boniface, Bishop and Martyr'),
('saint-margaret-of-scotland-queen', 'Saint Margaret of Scotland, Queen and Widow'),
('saint-john-of-san-facundo-confessor', 'Saint John of San Facundo, Confessor'),
('saint-basil-the-great-bishop-and-doctor', 'Saint Basil the Great, Bishop and Doctor'),
('saint-gregory-barbarigo-bishop', 'Saint Gregory Barbarigo, Bishop'),
('saint-juliana-falconieri-virgin', 'Saint Juliana Falconieri, Virgin'),
('vigil-of-saint-john-the-baptist', 'Vigil of the Nativity of Saint John the Baptist'),
('saint-william-abbot', 'Saint William, Abbot and Confessor'),
('saints-john-and-paul-martyrs', 'Saints John and Paul, Martyrs'),
('vigil-of-saints-peter-and-paul', 'Vigil of Saints Peter and Paul, Apostles'),
('commemoration-of-saint-paul-apostle-june', 'Commemoration of Saint Paul, Apostle'),
('commemoration-of-saints-marcellinus-peter-erasmus', 'Commemoration of Saints Marcellinus, Peter and Erasmus, Martyrs'),
('commemoration-of-saints-primus-and-felician', 'Commemoration of Saints Primus and Felician, Martyrs'),
('commemoration-of-saint-silverius', 'Commemoration of Saint Silverius, Pope and Martyr'),
('the-most-precious-blood-of-our-lord', 'The Most Precious Blood of Our Lord Jesus Christ'),
('seven-holy-brothers-martyrs', 'The Seven Holy Brothers, Martyrs, with Saints Rufina and Secunda'),
('saint-john-gualbert-abbot', 'Saint John Gualbert, Abbot and Confessor'),
('saint-anne-mother-of-the-blessed-virgin-mary', 'Saint Anne, Mother of the Blessed Virgin Mary'),
('saint-martha-virgin', 'Saint Martha, Virgin'),
('commemoration-of-our-lady-of-mt-carmel', 'Commemoration of the Blessed Virgin Mary of Mount Carmel'),
('commemoration-of-saint-alexius', 'Commemoration of Saint Alexius, Confessor'),
('commemoration-of-saint-pius-i', 'Commemoration of Saint Pius I, Pope and Martyr'),
('commemoration-of-saint-christina-virgin', 'Commemoration of Saint Christina, Virgin and Martyr'),
('commemoration-of-saint-pantaleon', 'Commemoration of Saint Pantaleon, Martyr'),
('commemoration-of-saints-nazarius-celsus-victor-innocent', 'Commemoration of Saints Nazarius, Celsus, Victor I and Innocent I'),
('commemoration-of-saints-abdon-and-sennen', 'Commemoration of Saints Abdon and Sennen, Martyrs'),
('commemoration-of-holy-machabees', 'Commemoration of the Holy Machabees, Martyrs'),
('vigil-of-saint-laurence', 'Vigil of Saint Laurence, Martyr'),
('saint-joachim-father-of-the-blessed-virgin-mary', 'Saint Joachim, Father of the Blessed Virgin Mary'),
('saint-hyacinth-confessor', 'Saint Hyacinth, Confessor'),
('saint-philip-benizi-confessor', 'Saint Philip Benizi, Confessor'),
('saint-raymond-nonnatus-confessor', 'Saint Raymond Nonnatus, Confessor'),
('vigil-of-the-assumption', 'Vigil of the Assumption of the Blessed Virgin Mary'),
('commemoration-of-saints-tiburtius-and-susanna', 'Commemoration of Saints Tiburtius and Susanna, Martyrs'),
('commemoration-of-saints-hippolytus-and-cassian', 'Commemoration of Saints Hippolytus and Cassian, Martyrs'),
('commemoration-of-saint-agapitus-martyr', 'Commemoration of Saint Agapitus, Martyr'),
('commemoration-of-saint-zephyrinus', 'Commemoration of Saint Zephyrinus, Pope and Martyr'),
('saint-laurence-justinian-bishop', 'Saint Laurence Justinian, Bishop and Confessor'),
('saint-nicholas-of-tolentino-confessor', 'Saint Nicholas of Tolentino, Confessor'),
('the-seven-sorrows-of-the-blessed-virgin-mary', 'The Seven Sorrows of the Blessed Virgin Mary'),
('saint-joseph-of-cupertino-confessor', 'Saint Joseph of Cupertino, Confessor'),
('saint-thomas-of-villanova-bishop', 'Saint Thomas of Villanova, Bishop and Confessor'),
('saint-linus-pope-and-martyr', 'Saint Linus, Pope and Martyr'),
('dedication-of-saint-michael-archangel', 'Dedication of Saint Michael the Archangel'),
('commemoration-of-saint-gorgonius', 'Commemoration of Saint Gorgonius, Martyr'),
('commemoration-of-saints-protus-and-hyacinth', 'Commemoration of Saints Protus and Hyacinth, Martyrs'),
('commemoration-of-stigmata-of-saint-francis', 'Commemoration of the Stigmata of Saint Francis'),
('commemoration-of-saint-eustace', 'Commemoration of Saint Eustace, Martyr'),
('commemoration-of-our-lady-of-ransom', 'Commemoration of Our Lady of Ransom'),
('commemoration-of-saint-giles-abbot', 'Commemoration of Saint Giles, Abbot'),
('maternity-of-the-blessed-virgin-mary', 'The Maternity of the Blessed Virgin Mary'),
('saint-edward-king-and-confessor', 'Saint Edward, King and Confessor'),
('saint-peter-of-alcantara-confessor', 'Saint Peter of Alcantara, Confessor'),
('saint-raphael-archangel', 'Saint Raphael the Archangel'),
('our-lord-jesus-christ-the-king', 'Our Lord Jesus Christ the King'),
('commemoration-of-saint-hilarion', 'Commemoration of Saint Hilarion, Abbot'),
('commemoration-of-saints-chrysanthus-and-daria', 'Commemoration of Saints Chrysanthus and Daria, Martyrs'),
('commemoration-of-saint-evaristus', 'Commemoration of Saint Evaristus, Pope and Martyr'),
('saint-andrew-avellino-confessor', 'Saint Andrew Avellino, Confessor'),
('saint-didacus-confessor', 'Saint Didacus, Confessor'),
('saint-gregory-thaumaturgus-bishop', 'Saint Gregory Thaumaturgus, Bishop and Confessor'),
('saint-felix-of-valois-confessor', 'Saint Felix of Valois, Confessor'),
('saint-sylvester-abbot', 'Saint Sylvester, Abbot and Confessor'),
('commemoration-of-holy-four-crowned-martyrs', 'Commemoration of the Holy Four Crowned Martyrs'),
('commemoration-of-saint-saturninus', 'Commemoration of Saint Saturninus, Martyr'),
('saint-bibiana-virgin-and-martyr', 'Saint Bibiana, Virgin and Martyr'),
('fifth-day-within-octave-of-christmas', 'Fifth Day within the Octave of Christmas'),
('sixth-day-within-octave-of-christmas', 'Sixth Day within the Octave of Christmas'),
('seventh-day-within-octave-of-christmas', 'Seventh Day within the Octave of Christmas, with Commemoration of Saint Sylvester I'),
('commemoration-of-saint-sabbas-abbot', 'Commemoration of Saint Sabbas, Abbot')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- =========================================================
-- SECTION 3: FEAST TRANSLATIONS - FRENCH
-- =========================================================

INSERT INTO feast_translations (feast_id, locale_code, name, description)
SELECT f.id, 'fr', x.name, NULL
FROM feasts f
JOIN (VALUES
--extra
('saturday-of-the-virgin', 'Samedi de la Sainte Vierge Marie'),

-- Quatre-Temps de l'Avent
('ember-wednesday-of-advent', 'Mercredi des Quatre-Temps de l’Avent'),
('ember-friday-of-advent', 'Vendredi des Quatre-Temps de l’Avent'),
('ember-saturday-of-advent', 'Samedi des Quatre-Temps de l’Avent'),

-- Quatre-Temps de Carême
('ember-wednesday-of-lent', 'Mercredi des Quatre-Temps de Carême'),
('ember-friday-of-lent', 'Vendredi des Quatre-Temps de Carême'),
('ember-saturday-of-lent', 'Samedi des Quatre-Temps de Carême'),

-- Quatre-Temps de Pentecôte
('ember-wednesday-after-pentecost', 'Mercredi des Quatre-Temps de Pentecôte'),
('ember-friday-after-pentecost', 'Vendredi des Quatre-Temps de Pentecôte'),
('ember-saturday-after-pentecost', 'Samedi des Quatre-Temps de Pentecôte'),

-- Quatre-Temps de septembre
('ember-wednesday-of-september', 'Mercredi des Quatre-Temps de septembre'),
('ember-friday-of-september', 'Vendredi des Quatre-Temps de septembre'),
('ember-saturday-of-september', 'Samedi des Quatre-Temps de septembre'),

-- Septuagésime
('septuagesima-sunday', 'Dimanche de la Septuagésime'),
('sexagesima-sunday', 'Dimanche de la Sexagésime'),
('quinquagesima-sunday', 'Dimanche de la Quinquagésime'),

-- Octave de Pentecôte
('monday-in-the-octave-of-pentecost', 'Lundi dans l’octave de la Pentecôte'),
('tuesday-in-the-octave-of-pentecost', 'Mardi dans l’octave de la Pentecôte'),
('thursday-in-the-octave-of-pentecost', 'Jeudi dans l’octave de la Pentecôte'),
('saturday-in-the-octave-of-pentecost', 'Samedi dans l’octave de la Pentecôte'),

-- Vigiles
('vigil-of-the-ascension', 'Vigile de l’Ascension'),
('vigil-of-pentecost', 'Vigile de la Pentecôte'),

-- January
('circumcision-and-octave-day-of-the-nativity', 'Circoncision de Notre-Seigneur et Octave de la Nativité'),
('saints-fabian-and-sebastian-martyrs', 'Saints Fabien et Sébastien, martyrs'),
('saints-vincent-and-anastasius-martyrs', 'Saints Vincent et Anastase, martyrs'),
('saint-timothy-bishop-and-martyr-1962', 'Saint Timothée, évêque et martyr'),
('saint-peter-nolasco-confessor', 'Saint Pierre Nolasque, confesseur'),
('saint-martina-virgin-and-martyr', 'Sainte Martine, vierge et martyre'),
('saint-paul-the-first-hermit', 'Saint Paul ermite'),
('saint-marcellus-i-pope-and-martyr', 'Saint Marcellin Ier, pape et martyr'),
('the-holy-family-of-jesus-mary-and-joseph-1960', 'La Sainte Famille de Jésus, Marie et Joseph'),
('commemoration-of-saint-telesphorus', 'Commémoration de saint Télesphore, pape et martyr'),
('commemoration-of-saint-hyginus', 'Commémoration de saint Hygin, pape et martyr'),
('commemoration-of-saint-felix-of-nola', 'Commémoration de saint Félix de Nole, prêtre et martyr'),
('commemoration-of-saint-maurus-abbot', 'Commémoration de saint Maur, abbé'),
('commemoration-of-saint-prisca', 'Commémoration de sainte Prisque, vierge et martyre'),
('commemoration-of-saints-marius-martha-audifax-abachum', 'Commémoration des saints Marius, Marthe, Audifax et Abachum, martyrs'),
('saint-andrew-corsini-bishop-and-confessor', 'Saint André Corsini, évêque et confesseur'),
('saint-titus-bishop-and-confessor', 'Saint Tite, évêque et confesseur'),
('saint-john-of-matha-confessor', 'Saint Jean de Matha, confesseur'),
('saint-gabriel-of-our-lady-of-sorrows', 'Saint Gabriel de Notre-Dame des Douleurs, confesseur'),
('commemoration-of-saint-valentine', 'Commémoration de saint Valentin, prêtre et martyr'),
('commemoration-of-saints-faustinus-and-jovita', 'Commémoration des saints Faustino et Jovite, martyrs'),
('commemoration-of-saint-simeon-bishop-and-martyr', 'Commémoration de saint Siméon, évêque et martyr'),
('the-forty-holy-martyrs-of-sebaste', 'Les quarante saints martyrs de Sébaste'),
('saint-gabriel-the-archangel', 'Saint Gabriel, archange'),
('saint-john-capistran-confessor', 'Saint Jean de Capistran, confesseur'),
('saint-hermenegild-martyr', 'Saint Herménégilde, martyr'),
('saints-soter-and-cajus-popes-and-martyrs', 'Saints Soter et Caïus, papes et martyrs'),
('saints-cletus-and-marcellinus-popes-and-martyrs', 'Saints Clet et Marcellin, papes et martyrs'),
('saint-peter-martyr-op', 'Saint Pierre Martyr, dominicain'),
('saint-joseph-the-workman', 'Saint Joseph artisan'),
('saint-monica-widow', 'Sainte Monique, veuve'),
('saint-gregory-nazianzen-bishop-and-doctor', 'Saint Grégoire de Nazianze, évêque et docteur'),
('saint-antoninus-archbishop', 'Saint Antonin, archevêque'),
('saints-nereus-achilleus-domitilla-pancras-martyrs', 'Saints Nérée, Achillée, Domitille et Pancrace, martyrs'),
('saint-ubald-bishop-and-confessor', 'Saint Ubaldo, évêque et confesseur'),
('saint-paschal-baylon-confessor', 'Saint Pascal Baylon, confesseur'),
('saint-venantius-martyr', 'Saint Venance, martyr'),
('saint-peter-celestine-pope', 'Saint Pierre Célestin, pape et confesseur'),
('blessed-virgin-mary-queen', 'La Bienheureuse Vierge Marie, Reine'),
('commemoration-of-saints-alexander-eventius-theodulus', 'Commémoration des saints Alexandre, Evence, Théodule et Juvénal, martyrs'),
('commemoration-of-saint-boniface-martyr-may', 'Commémoration de saint Boniface, martyr'),
('commemoration-of-saint-felix-i-pope', 'Commémoration de saint Félix Ier, pape et martyr'),
('saint-angela-merici-virgin-june', 'Sainte Angèle Merici, vierge'),
('saint-francis-caracciolo-confessor', 'Saint François Caracciolo, confesseur'),
('saint-boniface-bishop-and-martyr', 'Saint Boniface, évêque et martyr'),
('saint-margaret-of-scotland-queen', 'Sainte Marguerite d''Écosse, reine et veuve'),
('saint-john-of-san-facundo-confessor', 'Saint Jean de Saint-Facond, confesseur'),
('saint-basil-the-great-bishop-and-doctor', 'Saint Basile le Grand, évêque et docteur'),
('saint-gregory-barbarigo-bishop', 'Saint Grégoire Barbarigo, évêque'),
('saint-juliana-falconieri-virgin', 'Sainte Julienne Falconieri, vierge'),
('vigil-of-saint-john-the-baptist', 'Vigile de la Nativité de saint Jean-Baptiste'),
('saint-william-abbot', 'Saint Guillaume, abbé et confesseur'),
('saints-john-and-paul-martyrs', 'Saints Jean et Paul, martyrs'),
('vigil-of-saints-peter-and-paul', 'Vigile des saints Pierre et Paul, apôtres'),
('commemoration-of-saint-paul-apostle-june', 'Commémoration de saint Paul, apôtre'),
('commemoration-of-saints-marcellinus-peter-erasmus', 'Commémoration des saints Marcellin, Pierre et Érasme, martyrs'),
('commemoration-of-saints-primus-and-felician', 'Commémoration des saints Prime et Félicien, martyrs'),
('commemoration-of-saint-silverius', 'Commémoration de saint Silvère, pape et martyr'),
('the-most-precious-blood-of-our-lord', 'Le Très Précieux Sang de Notre-Seigneur Jésus-Christ'),
('seven-holy-brothers-martyrs', 'Les sept saints frères martyrs, avec saintes Rufine et Seconde'),
('saint-john-gualbert-abbot', 'Saint Jean Gualbert, abbé et confesseur'),
('saint-anne-mother-of-the-blessed-virgin-mary', 'Sainte Anne, mère de la Bienheureuse Vierge Marie'),
('saint-martha-virgin', 'Sainte Marthe, vierge'),
('commemoration-of-our-lady-of-mt-carmel', 'Commémoration de Notre-Dame du Mont-Carmel'),
('commemoration-of-saint-alexius', 'Commémoration de saint Alexis, confesseur'),
('commemoration-of-saint-pius-i', 'Commémoration de saint Pie Ier, pape et martyr'),
('commemoration-of-saint-christina-virgin', 'Commémoration de sainte Christine, vierge et martyre'),
('commemoration-of-saint-pantaleon', 'Commémoration de saint Pantaléon, martyr'),
('commemoration-of-saints-nazarius-celsus-victor-innocent', 'Commémoration des saints Nazaire, Celse, Victor Ier et Innocent Ier'),
('commemoration-of-saints-abdon-and-sennen', 'Commémoration des saints Abdon et Sennen, martyrs'),
('commemoration-of-holy-machabees', 'Commémoration des saints Machabées, martyrs'),
('vigil-of-saint-laurence', 'Vigile de saint Laurent, martyr'),
('saint-joachim-father-of-the-blessed-virgin-mary', 'Saint Joachim, père de la Bienheureuse Vierge Marie'),
('saint-hyacinth-confessor', 'Saint Hyacinthe, confesseur'),
('saint-philip-benizi-confessor', 'Saint Philippe Benizi, confesseur'),
('saint-raymond-nonnatus-confessor', 'Saint Raymond Nonnat, confesseur'),
('vigil-of-the-assumption', 'Vigile de l''Assomption de la Bienheureuse Vierge Marie'),
('commemoration-of-saints-tiburtius-and-susanna', 'Commémoration des saints Tiburce et Suzanne, martyrs'),
('commemoration-of-saints-hippolytus-and-cassian', 'Commémoration des saints Hippolyte et Cassien, martyrs'),
('commemoration-of-saint-agapitus-martyr', 'Commémoration de saint Agapit, martyr'),
('commemoration-of-saint-zephyrinus', 'Commémoration de saint Zéphyrin, pape et martyr'),
('saint-laurence-justinian-bishop', 'Saint Laurent Justinien, évêque et confesseur'),
('saint-nicholas-of-tolentino-confessor', 'Saint Nicolas de Tolentino, confesseur'),
('the-seven-sorrows-of-the-blessed-virgin-mary', 'Les Sept Douleurs de la Bienheureuse Vierge Marie'),
('saint-joseph-of-cupertino-confessor', 'Saint Joseph de Cupertino, confesseur'),
('saint-thomas-of-villanova-bishop', 'Saint Thomas de Villeneuve, évêque et confesseur'),
('saint-linus-pope-and-martyr', 'Saint Lin, pape et martyr'),
('dedication-of-saint-michael-archangel', 'Dédicace de Saint Michel Archange'),
('commemoration-of-saint-gorgonius', 'Commémoration de saint Gorgon, martyr'),
('commemoration-of-saints-protus-and-hyacinth', 'Commémoration des saints Prote et Hyacinthe, martyrs'),
('commemoration-of-stigmata-of-saint-francis', 'Commémoration des stigmates de saint François'),
('commemoration-of-saint-eustace', 'Commémoration de saint Eustache, martyr'),
('commemoration-of-our-lady-of-ransom', 'Commémoration de Notre-Dame de la Merci'),
('commemoration-of-saint-giles-abbot', 'Commémoration de saint Gilles, abbé'),
('maternity-of-the-blessed-virgin-mary', 'La Maternité de la Bienheureuse Vierge Marie'),
('saint-edward-king-and-confessor', 'Saint Édouard, roi et confesseur'),
('saint-peter-of-alcantara-confessor', 'Saint Pierre d''Alcantara, confesseur'),
('saint-raphael-archangel', 'Saint Raphaël, archange'),
('our-lord-jesus-christ-the-king', 'Notre-Seigneur Jésus-Christ, Roi'),
('commemoration-of-saint-hilarion', 'Commémoration de saint Hilarion, abbé'),
('commemoration-of-saints-chrysanthus-and-daria', 'Commémoration des saints Chrysanthe et Daria, martyrs'),
('commemoration-of-saint-evaristus', 'Commémoration de saint Évariste, pape et martyr'),
('saint-andrew-avellino-confessor', 'Saint André Avellin, confesseur'),
('saint-didacus-confessor', 'Saint Didace, confesseur'),
('saint-gregory-thaumaturgus-bishop', 'Saint Grégoire le Thaumaturge, évêque et confesseur'),
('saint-felix-of-valois-confessor', 'Saint Félix de Valois, confesseur'),
('saint-sylvester-abbot', 'Saint Sylvestre, abbé et confesseur'),
('commemoration-of-holy-four-crowned-martyrs', 'Commémoration des quatre saints couronnés, martyrs'),
('commemoration-of-saint-saturninus', 'Commémoration de saint Saturnin, martyr'),
('saint-bibiana-virgin-and-martyr', 'Sainte Bibiane, vierge et martyre'),
('fifth-day-within-octave-of-christmas', 'Cinquième jour dans l''octave de Noël'),
('sixth-day-within-octave-of-christmas', 'Sixième jour dans l''octave de Noël'),
('seventh-day-within-octave-of-christmas', 'Septième jour dans l''octave de Noël, avec commémoration de saint Sylvestre Ier'),
('commemoration-of-saint-sabbas-abbot', 'Commémoration de saint Sabbas, abbé')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- =========================================================
-- SECTION 4: FEAST TRANSLATIONS - LATIN
-- =========================================================

INSERT INTO feast_translations (feast_id, locale_code, name, description)
SELECT f.id, 'la', x.name, NULL
FROM feasts f
JOIN (VALUES
--extra
('saturday-of-the-virgin', 'Sabbato Sanctae Virginis Mariae'),

-- Quattuor Tempora Adventus
('ember-wednesday-of-advent', 'Feria quarta Quattuor Temporum Adventus'),
('ember-friday-of-advent', 'Feria sexta Quattuor Temporum Adventus'),
('ember-saturday-of-advent', 'Sabbatum Quattuor Temporum Adventus'),

-- Quattuor Tempora Quadragesimae
('ember-wednesday-of-lent', 'Feria quarta Quattuor Temporum Quadragesimae'),
('ember-friday-of-lent', 'Feria sexta Quattuor Temporum Quadragesimae'),
('ember-saturday-of-lent', 'Sabbatum Quattuor Temporum Quadragesimae'),

-- Quattuor Tempora Pentecostes
('ember-wednesday-after-pentecost', 'Feria quarta Quattuor Temporum Pentecostes'),
('ember-friday-after-pentecost', 'Feria sexta Quattuor Temporum Pentecostes'),
('ember-saturday-after-pentecost', 'Sabbatum Quattuor Temporum Pentecostes'),

-- Quattuor Tempora Septembris
('ember-wednesday-of-september', 'Feria quarta Quattuor Temporum Septembris'),
('ember-friday-of-september', 'Feria sexta Quattuor Temporum Septembris'),
('ember-saturday-of-september', 'Sabbatum Quattuor Temporum Septembris'),

-- Septuagesima
('septuagesima-sunday', 'Dominica Septuagesima'),
('sexagesima-sunday', 'Dominica Sexagesima'),
('quinquagesima-sunday', 'Dominica Quinquagesima'),

-- Octava Pentecostes
('monday-in-the-octave-of-pentecost', 'Feria II infra Octavam Pentecostes'),
('tuesday-in-the-octave-of-pentecost', 'Feria III infra Octavam Pentecostes'),
('thursday-in-the-octave-of-pentecost', 'Feria V infra Octavam Pentecostes'),
('saturday-in-the-octave-of-pentecost', 'Sabbato infra Octavam Pentecostes'),

-- Vigiliae
('vigil-of-the-ascension', 'In Vigilia Ascensionis Domini'),
('vigil-of-pentecost', 'In Vigilia Pentecostes'),

--january
('circumcision-and-octave-day-of-the-nativity', 'Circumcisio Domini et Octava Nativitatis'),
('saints-fabian-and-sebastian-martyrs', 'Sancti Fabianus et Sebastianus, martyres'),
('saints-vincent-and-anastasius-martyrs', 'Sancti Vincentius et Anastasius, martyres'),
('saint-timothy-bishop-and-martyr-1962', 'Sanctus Timotheus, episcopus et martyr'),
('saint-peter-nolasco-confessor', 'Sanctus Petrus Nolascus, confessor'),
('saint-martina-virgin-and-martyr', 'Sancta Martina, virgo et martyr'),
('saint-paul-the-first-hermit', 'Sanctus Paulus Eremita'),
('saint-marcellus-i-pope-and-martyr', 'Sanctus Marcellus I, papa et martyr'),
('the-holy-family-of-jesus-mary-and-joseph-1960', 'Sancta Familia Iesu, Mariae et Ioseph'),
('commemoration-of-saint-telesphorus', 'Commemoratio Sancti Telesphori, papae et martyris'),
('commemoration-of-saint-hyginus', 'Commemoratio Sancti Hygini, papae et martyris'),
('commemoration-of-saint-felix-of-nola', 'Commemoratio Sancti Felicis de Nola, presbyteri et martyris'),
('commemoration-of-saint-maurus-abbot', 'Commemoratio Sancti Mauri, abbatis'),
('commemoration-of-saint-prisca', 'Commemoratio Sanctae Priscae, virginis et martyris'),
('commemoration-of-saints-marius-martha-audifax-abachum', 'Commemoratio Sanctorum Marii, Marthae, Audifax et Abachum, martyrum'),
('saint-andrew-corsini-bishop-and-confessor', 'Sanctus Andreas Corsinus, episcopus et confessor'),
('saint-titus-bishop-and-confessor', 'Sanctus Titus, episcopus et confessor'),
('saint-john-of-matha-confessor', 'Sanctus Ioannes de Matha, confessor'),
('saint-gabriel-of-our-lady-of-sorrows', 'Sanctus Gabriel a Virgine Perdolente, confessor'),
('commemoration-of-saint-valentine', 'Commemoratio Sancti Valentini, presbyteri et martyris'),
('commemoration-of-saints-faustinus-and-jovita', 'Commemoratio Sanctorum Faustini et Iovitae, martyrum'),
('commemoration-of-saint-simeon-bishop-and-martyr', 'Commemoratio Sancti Simeonis, episcopi et martyris'),
('the-forty-holy-martyrs-of-sebaste', 'Sancti Quadraginta Martyres Sebasteni'),
('saint-gabriel-the-archangel', 'Sanctus Gabriel Archangelus'),
('saint-john-capistran-confessor', 'Sanctus Ioannes Capistranus, confessor'),
('saint-hermenegild-martyr', 'Sanctus Hermenegildus, martyr'),
('saints-soter-and-cajus-popes-and-martyrs', 'Sancti Soter et Caius, papae et martyres'),
('saints-cletus-and-marcellinus-popes-and-martyrs', 'Sancti Cletus et Marcellinus, papae et martyres'),
('saint-peter-martyr-op', 'Sanctus Petrus Martyr, Ordinis Praedicatorum'),
('saint-joseph-the-workman', 'Sanctus Ioseph Opifex'),
('saint-monica-widow', 'Sancta Monica, vidua'),
('saint-gregory-nazianzen-bishop-and-doctor', 'Sanctus Gregorius Nazianzenus, episcopus et doctor'),
('saint-antoninus-archbishop', 'Sanctus Antoninus, archiepiscopus'),
('saints-nereus-achilleus-domitilla-pancras-martyrs', 'Sancti Nereus, Achilleus, Domitilla et Pancratius, martyres'),
('saint-ubald-bishop-and-confessor', 'Sanctus Ubaldus, episcopus et confessor'),
('saint-paschal-baylon-confessor', 'Sanctus Paschasius Baylon, confessor'),
('saint-venantius-martyr', 'Sanctus Venantius, martyr'),
('saint-peter-celestine-pope', 'Sanctus Petrus Caelestinus, papa et confessor'),
('blessed-virgin-mary-queen', 'Beatae Mariae Virginis Reginae'),
('commemoration-of-saints-alexander-eventius-theodulus', 'Commemoratio Sanctorum Alexandri, Eventii, Theoduli et Iuvenalis, martyrum'),
('commemoration-of-saint-boniface-martyr-may', 'Commemoratio Sancti Bonifatii, martyris'),
('commemoration-of-saint-felix-i-pope', 'Commemoratio Sancti Felicis I, papae et martyris'),
('saint-angela-merici-virgin-june', 'Sancta Angela Merici, virgo'),
('saint-francis-caracciolo-confessor', 'Sanctus Franciscus Caracciolo, confessor'),
('saint-boniface-bishop-and-martyr', 'Sanctus Bonifatius, episcopus et martyr'),
('saint-margaret-of-scotland-queen', 'Sancta Margarita Scotiae, regina et vidua'),
('saint-john-of-san-facundo-confessor', 'Sanctus Ioannes a Sancto Facundo, confessor'),
('saint-basil-the-great-bishop-and-doctor', 'Sanctus Basilius Magnus, episcopus et doctor'),
('saint-gregory-barbarigo-bishop', 'Sanctus Gregorius Barbarigo, episcopus'),
('saint-juliana-falconieri-virgin', 'Sancta Iuliana Falconieri, virgo'),
('vigil-of-saint-john-the-baptist', 'Vigilia Nativitatis Sancti Ioannis Baptistae'),
('saint-william-abbot', 'Sanctus Guilelmus, abbas et confessor'),
('saints-john-and-paul-martyrs', 'Sancti Ioannes et Paulus, martyres'),
('vigil-of-saints-peter-and-paul', 'Vigilia Sanctorum Petri et Pauli, Apostolorum'),
('commemoration-of-saint-paul-apostle-june', 'Commemoratio Sancti Pauli, Apostoli'),
('commemoration-of-saints-marcellinus-peter-erasmus', 'Commemoratio Sanctorum Marcellini, Petri et Erasmi, martyrum'),
('commemoration-of-saints-primus-and-felician', 'Commemoratio Sanctorum Primi et Feliciani, martyrum'),
('commemoration-of-saint-silverius', 'Commemoratio Sancti Silverii, papae et martyris'),
('the-most-precious-blood-of-our-lord', 'Pretiosissimi Sanguinis Domini Nostri Iesu Christi'),
('seven-holy-brothers-martyrs', 'Septem Sancti Fratres, martyres, cum Sanctis Rufina et Secunda'),
('saint-john-gualbert-abbot', 'Sanctus Ioannes Gualbert, abbas et confessor'),
('saint-anne-mother-of-the-blessed-virgin-mary', 'Sancta Anna, Mater Beatae Mariae Virginis'),
('saint-martha-virgin', 'Sancta Martha, virgo'),
('commemoration-of-our-lady-of-mt-carmel', 'Commemoratio Beatae Mariae Virginis de Monte Carmelo'),
('commemoration-of-saint-alexius', 'Commemoratio Sancti Alexii, confessoris'),
('commemoration-of-saint-pius-i', 'Commemoratio Sancti Pii I, papae et martyris'),
('commemoration-of-saint-christina-virgin', 'Commemoratio Sanctae Christinae, virginis et martyris'),
('commemoration-of-saint-pantaleon', 'Commemoratio Sancti Pantaleonis, martyris'),
('commemoration-of-saints-nazarius-celsus-victor-innocent', 'Commemoratio Sanctorum Nazarii, Celsi, Victoris I et Innocentii I'),
('commemoration-of-saints-abdon-and-sennen', 'Commemoratio Sanctorum Abdon et Sennen, martyrum'),
('commemoration-of-holy-machabees', 'Commemoratio Sanctorum Machabaeorum, martyrum'),
('vigil-of-saint-laurence', 'Vigilia Sancti Laurentii, martyris'),
('saint-joachim-father-of-the-blessed-virgin-mary', 'Sanctus Ioachim, Pater Beatae Mariae Virginis'),
('saint-hyacinth-confessor', 'Sanctus Hyacinthus, confessor'),
('saint-philip-benizi-confessor', 'Sanctus Philippus Benitius, confessor'),
('saint-raymond-nonnatus-confessor', 'Sanctus Raymundus Nonnatus, confessor'),
('vigil-of-the-assumption', 'Vigilia Assumptionis Beatae Mariae Virginis'),
('commemoration-of-saints-tiburtius-and-susanna', 'Commemoratio Sanctorum Tiburtii et Susannae, martyrum'),
('commemoration-of-saints-hippolytus-and-cassian', 'Commemoratio Sanctorum Hippolyti et Cassiani, martyrum'),
('commemoration-of-saint-agapitus-martyr', 'Commemoratio Sancti Agapiti, martyris'),
('commemoration-of-saint-zephyrinus', 'Commemoratio Sancti Zepherini, papae et martyris'),
('saint-laurence-justinian-bishop', 'Sanctus Laurentius Iustinianus, episcopus et confessor'),
('saint-nicholas-of-tolentino-confessor', 'Sanctus Nicolaus a Tolentino, confessor'),
('the-seven-sorrows-of-the-blessed-virgin-mary', 'Septem Dolores Beatae Mariae Virginis'),
('saint-joseph-of-cupertino-confessor', 'Sanctus Ioseph a Cupertino, confessor'),
('saint-thomas-of-villanova-bishop', 'Sanctus Thomas a Villanova, episcopus et confessor'),
('saint-linus-pope-and-martyr', 'Sanctus Linus, papa et martyr'),
('dedication-of-saint-michael-archangel', 'Dedicatio Sancti Michaelis Archangeli'),
('commemoration-of-saint-gorgonius', 'Commemoratio Sancti Gorgonii, martyris'),
('commemoration-of-saints-protus-and-hyacinth', 'Commemoratio Sanctorum Proti et Hyacinthi, martyrum'),
('commemoration-of-stigmata-of-saint-francis', 'Commemoratio Stigmatum Sancti Francisci'),
('commemoration-of-saint-eustace', 'Commemoratio Sancti Eustachii, martyris'),
('commemoration-of-our-lady-of-ransom', 'Commemoratio Beatae Mariae Virginis de Mercede'),
('commemoration-of-saint-giles-abbot', 'Commemoratio Sancti Aegidii, abbatis'),
('maternity-of-the-blessed-virgin-mary', 'Maternitas Beatae Mariae Virginis'),
('saint-edward-king-and-confessor', 'Sanctus Eduardus, rex et confessor'),
('saint-peter-of-alcantara-confessor', 'Sanctus Petrus de Alcantara, confessor'),
('saint-raphael-archangel', 'Sanctus Raphael Archangelus'),
('our-lord-jesus-christ-the-king', 'Dominus Noster Iesus Christus Rex'),
('commemoration-of-saint-hilarion', 'Commemoratio Sancti Hilarionis, abbatis'),
('commemoration-of-saints-chrysanthus-and-daria', 'Commemoratio Sanctorum Chrysanthi et Dariae, martyrum'),
('commemoration-of-saint-evaristus', 'Commemoratio Sancti Evaristi, papae et martyris'),
('saint-andrew-avellino-confessor', 'Sanctus Andreas Avelinus, confessor'),
('saint-didacus-confessor', 'Sanctus Didacus, confessor'),
('saint-gregory-thaumaturgus-bishop', 'Sanctus Gregorius Thaumaturgus, episcopus et confessor'),
('saint-felix-of-valois-confessor', 'Sanctus Felix de Valesia, confessor'),
('saint-sylvester-abbot', 'Sanctus Silvester, abbas et confessor'),
('commemoration-of-holy-four-crowned-martyrs', 'Commemoratio Sanctorum Quatuor Coronatorum, martyrum'),
('commemoration-of-saint-saturninus', 'Commemoratio Sancti Saturnini, martyris'),
('saint-bibiana-virgin-and-martyr', 'Sancta Bibiana, virgo et martyr'),
('fifth-day-within-octave-of-christmas', 'Dies V infra Octavam Nativitatis'),
('sixth-day-within-octave-of-christmas', 'Dies VI infra Octavam Nativitatis'),
('seventh-day-within-octave-of-christmas', 'Dies VII infra Octavam Nativitatis cum Commemoratione Sancti Silvestri I'),
('commemoration-of-saint-sabbas-abbot', 'Commemoratio Sancti Sabbae, abbatis')
) AS x(slug, name)
ON f.slug = x.slug
ON CONFLICT (feast_id, locale_code) DO NOTHING;

-- =========================================================
-- SECTION 5a: CELEBRATIONS FOR NEW FIXED FEASTS (ROMAN_1960)
-- =========================================================

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, tcal.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars tcal ON tcal.code = 'ROMAN_1960'
JOIN (VALUES
-- Extra
-- Saturday of the Virgin Mary is custom made by Api, check module

-- JANUARY
('octave-day-of-the-nativity',                        1,  1, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-telesphorus',                1,  5, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-hyginus',                    1, 11, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-felix-of-nola',              1, 14, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-maurus-abbot',               1, 15, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-paul-the-first-hermit',                       1, 15, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-marcellus-i-pope-and-martyr',                 1, 16, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-prisca',                     1, 18, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-marius-martha-audifax-abachum', 1, 19, 'COMM', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saints-fabian-and-sebastian-martyrs',               1, 20, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saints-vincent-and-anastasius-martyrs',             1, 22, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-timothy-bishop-and-martyr-1962',              1, 24, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-nolasco-confessor',                     1, 28, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-martina-virgin-and-martyr',                   1, 30, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- FEBRUARY
('saint-andrew-corsini-bishop-and-confessor',         2,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-titus-bishop-and-confessor',                  2,  6, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-of-matha-confessor',                     2,  8, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-valentine',                  2, 14, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-faustinus-and-jovita',      2, 15, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-simeon-bishop-and-martyr',   2, 18, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-gabriel-of-our-lady-of-sorrows',              2, 27, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- MARCH
('the-forty-holy-martyrs-of-sebaste',                 3, 10, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-gabriel-the-archangel',                       3, 24, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-capistran-confessor',                    3, 28, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- APRIL
('saint-hermenegild-martyr',                          4, 13, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saints-soter-and-cajus-popes-and-martyrs',          4, 22, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saints-cletus-and-marcellinus-popes-and-martyrs',   4, 26, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-martyr-op',                             4, 29, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- MAY
('saint-joseph-the-workman',                          5,  1, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-alexander-eventius-theodulus', 5, 3, 'COMM',   'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-monica-widow',                                5,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-gregory-nazianzen-bishop-and-doctor',         5,  9, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-antoninus-archbishop',                        5, 10, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saints-nereus-achilleus-domitilla-pancras-martyrs', 5, 12, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-boniface-martyr-may',        5, 14, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-ubald-bishop-and-confessor',                  5, 16, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-paschal-baylon-confessor',                    5, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-venantius-martyr',                            5, 18, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-celestine-pope',                        5, 19, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-felix-i-pope',               5, 30, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('blessed-virgin-mary-queen',                         5, 31, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- JUNE
('saint-angela-merici-virgin-june',                   6,  1, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-marcellinus-peter-erasmus', 6,  2, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-francis-caracciolo-confessor',                6,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-boniface-bishop-and-martyr',                  6,  5, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-primus-and-felician',       6,  9, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-margaret-of-scotland-queen',                  6, 10, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-of-san-facundo-confessor',               6, 12, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-basil-the-great-bishop-and-doctor',           6, 14, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-gregory-barbarigo-bishop',                    6, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-juliana-falconieri-virgin',                   6, 19, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-silverius',                  6, 20, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('vigil-of-saint-john-the-baptist',                   6, 23, 'CLASS_II',  'PURPLE','normal', FALSE, 'Wikipedia 1960'),
('saint-william-abbot',                               6, 25, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saints-john-and-paul-martyrs',                      6, 26, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('vigil-of-saints-peter-and-paul',                    6, 28, 'CLASS_II',  'PURPLE','normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-paul-apostle-june',          6, 30, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- JULY
('the-most-precious-blood-of-our-lord',               7,  1, 'CLASS_I',   'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-pius-i',                     7, 11, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-john-gualbert-abbot',                         7, 12, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-our-lady-of-mt-carmel',            7, 16, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-alexius',                    7, 17, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('seven-holy-brothers-martyrs',                       7, 10, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-christina-virgin',           7, 24, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-anne-mother-of-the-blessed-virgin-mary',      7, 26, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-pantaleon',                  7, 27, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-nazarius-celsus-victor-innocent', 7, 28, 'CLASS_III', 'RED', 'normal', FALSE, 'Wikipedia 1960'),
('saint-martha-virgin',                               7, 29, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-abdon-and-sennen',          7, 30, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- AUGUST
('commemoration-of-holy-machabees',                   8,  1, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('vigil-of-saint-laurence',                           8,  9, 'VIGIL',     'PURPLE','normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-tiburtius-and-susanna',     8, 11, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-hippolytus-and-cassian',    8, 13, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('vigil-of-the-assumption',                           8, 14, 'CLASS_II',  'PURPLE','normal', FALSE, 'Wikipedia 1960'),
('saint-joachim-father-of-the-blessed-virgin-mary',   8, 16, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-hyacinth-confessor',                          8, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-agapitus-martyr',            8, 18, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-philip-benizi-confessor',                     8, 23, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-zephyrinus',                 8, 26, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-raymond-nonnatus-confessor',                  8, 31, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- SEPTEMBER
('commemoration-of-saint-giles-abbot',                9,  1, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-laurence-justinian-bishop',                   9,  5, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-gorgonius',                  9,  9, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-nicholas-of-tolentino-confessor',             9, 10, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-protus-and-hyacinth',       9, 11, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('the-seven-sorrows-of-the-blessed-virgin-mary',      9, 15, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-stigmata-of-saint-francis',        9, 17, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-joseph-of-cupertino-confessor',               9, 18, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-eustace',                    9, 20, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-thomas-of-villanova-bishop',                  9, 22, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-linus-pope-and-martyr',                       9, 23, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-our-lady-of-ransom',               9, 24, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('dedication-of-saint-michael-archangel',             9, 29, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- OCTOBER
('maternity-of-the-blessed-virgin-mary',              10, 11, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-edward-king-and-confessor',                   10, 13, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-of-alcantara-confessor',                10, 19, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-hilarion',                   10, 21, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-raphael-archangel',                           10, 24, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saints-chrysanthus-and-daria',     10, 25, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-evaristus',                  10, 26, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- NOVEMBER
('commemoration-of-holy-four-crowned-martyrs',        11,  8, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-andrew-avellino-confessor',                   11, 10, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-didacus-confessor',                           11, 13, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-gregory-thaumaturgus-bishop',                 11, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-felix-of-valois-confessor',                   11, 20, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-sylvester-abbot',                             11, 26, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-saturninus',                 11, 29, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- DECEMBER
('saint-bibiana-virgin-and-martyr',                   12,  2, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('commemoration-of-saint-sabbas-abbot',               12,  5, 'COMM',      'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('fifth-day-within-octave-of-christmas',              12, 29, 'CLASS_II',  'WHITE', 'octave', FALSE, 'Wikipedia 1960'),
('sixth-day-within-octave-of-christmas',              12, 30, 'CLASS_II',  'WHITE', 'octave', FALSE, 'Wikipedia 1960'),
('seventh-day-within-octave-of-christmas',            12, 31, 'CLASS_II',  'WHITE', 'octave', FALSE, 'Wikipedia 1960')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = tcal.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- SECTION 5b: CELEBRATIONS FOR EXISTING ROMAN_GENERAL FIXED FEASTS
--             (new celebration row for ROMAN_1960)
-- =========================================================

INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, month, day, observance_type, is_optional, notes)
SELECT f.id, tcal.id, r.id, lc.id, 'fixed', x.month, x.day, x.observance_type, x.is_optional, x.notes
FROM feasts f
JOIN calendars tcal ON tcal.code = 'ROMAN_1960'
JOIN (VALUES
-- January
('the-epiphany-of-the-lord',                              1,  6, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-baptism-of-the-lord',                               1, 13, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-hilary-bishop-and-doctor-of-the-church',          1, 14, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-anthony-abbot',                                   1, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-ignatius-of-antioch-bishop-and-martyr',           1, 20, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- Note: saints-fabian-and-sebastian (1, 20) is a new combined feast in ROMAN_1960 (Section 5a)
-- saint-fabian-pope-and-martyr and saint-sebastian-martyr kept separately in RG at Jan 20
('saint-fabian-pope-and-martyr',                          1, 20, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-sebastian-martyr',                                1, 20, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-agnes-virgin-and-martyr',                         1, 21, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-vincent-deacon-and-martyr',                       1, 22, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-raymond-of-penyafort-priest',                     1, 23, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-chrysostom-bishop-and-doctor-of-the-church', 1, 27, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-conversion-of-saint-paul-the-apostle',              1, 25, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-polycarp-bishop-and-martyr',                      1, 26, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-francis-de-sales-bishop-and-doctor-of-the-church',1, 29, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-bosco-priest',                               1, 31, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- February
('the-presentation-of-the-lord',                          2,  2, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-blaise-bishop-and-martyr',                        2,  3, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-agatha-virgin-and-martyr',                        2,  5, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-romuald-abbot',                                   2,  7, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-scholastica-virgin',                              2, 10, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('our-lady-of-lourdes',                                   2, 11, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-seven-holy-founders-of-the-servite-order',          2, 12, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-cyril-of-alexandria-bishop-and-doctor-of-the-church', 2, 9, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-matthias-apostle',                                2, 24, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('the-chair-of-saint-peter-the-apostle',                  2, 22, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-damian-bishop-and-doctor-of-the-church',    2, 23, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- March
('saint-casimir',                                         3,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saints-perpetua-and-felicity-martyrs',                  3,  6, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-thomas-aquinas-priest-and-doctor-of-the-church',  3,  7, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-of-god-religious',                           3,  8, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-frances-of-rome-religious',                       3,  9, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-gregory-the-great-pope-and-doctor-of-the-church', 3, 12, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-patrick-bishop',                                  3, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-cyril-of-jerusalem-bishop-and-doctor-of-the-church', 3, 18, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-joseph-spouse-of-the-blessed-virgin-mary',        3, 19, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-benedict-abbot',                                  3, 21, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-annunciation-of-the-lord',                          3, 25, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-damascene-priest-and-doctor-of-the-church',  3, 27, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- April
('saint-francis-of-paola-hermit',                         4,  2, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-isidore-bishop-and-doctor-of-the-church',         4,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-vincent-ferrer-priest',                           4,  5, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-stanislaus-bishop-and-martyr',                    4,  7, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-leo-the-great-pope-and-doctor-of-the-church',     4, 11, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-justin-martyr',                                   4, 14, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-anselm-bishop-and-doctor-of-the-church',          4, 21, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-george-martyr',                                   4, 23, 'COMM',      'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-fidelis-of-sigmaringen-priest-and-martyr',        4, 24, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-mark-evangelist',                                 4, 25, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-canisius-priest-and-doctor-of-the-church',  4, 27, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-paul-of-the-cross-priest',                        4, 28, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-chanel-priest-and-martyr',                  4, 28, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-louis-grignon-de-montfort-priest',                4, 28, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-catherine-of-siena-virgin-and-doctor-of-the-church', 4, 30, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- May
('saint-pius-v-pope',                                     5,  5, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-baptist-de-la-salle-priest',                 5, 15, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-athanasius-bishop-and-doctor-of-the-church',      5,  2, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saints-philip-and-james-apostles',                      5, 11, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-robert-bellarmine-bishop-and-doctor-of-the-church', 5, 13, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-bernardine-of-siena-priest',                      5, 20, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-gregory-vii-pope',                                5, 25, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-bede-the-venerable-priest-and-doctor-of-the-church', 5, 27, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-philip-neri-priest',                              5, 26, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-augustine-of-canterbury-bishop',                  5, 28, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-mary-magdalene-de-pazzi-virgin',                  5, 29, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- June
('saint-angela-merici-virgin',                            6,  1, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960 - date differs from RG'),
('saint-norbert-bishop',                                  6,  6, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-barnabas-apostle',                                6, 11, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-anthony-of-padua-priest-and-doctor-of-the-church', 6, 13, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-ephrem-deacon-and-doctor-of-the-church',          6, 18, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-aloysius-gonzaga-religious',                      6, 21, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-paulinus-of-nola-bishop',                         6, 22, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-nativity-of-saint-john-the-baptist',                6, 24, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saints-peter-and-paul-apostles',                        6, 29, 'CLASS_I',   'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- July
('the-visitation-of-the-blessed-virgin-mary',             7,  2, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-irenaeus-bishop-martyr-and-doctor-of-the-church', 7,  3, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-anthony-zaccaria-priest',                         7,  5, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-elizabeth-of-portugal',                           7,  8, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-henry',                                           7, 15, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-camillus-de-lellis-priest',                       7, 18, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-vincent-de-paul-priest',                          7, 19, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-jerome-emiliani-priest',                          7, 20, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960 - date differs from RG'),
('saint-lawrence-of-brindisi-priest-and-doctor-of-the-church', 7, 21, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-mary-magdalene',                                  7, 22, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-apollinaris-bishop-and-martyr',                   7, 23, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-james-apostle',                                   7, 25, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-ignatius-of-loyola-priest',                       7, 31, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- August
('saint-alphonsus-liguori-bishop-and-doctor-of-the-church', 8,  2, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-dominic-priest',                                  8,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-dedication-of-the-basilica-of-saint-mary-major',   8,  5, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-transfiguration-of-the-lord',                       8,  6, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-cajetan-priest',                                  8,  7, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-jean-vianney-priest',                             8,  8, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-lawrence-deacon-and-martyr',                      8, 10, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-clare-virgin',                                    8, 12, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-assumption-of-the-blessed-virgin-mary',             8, 15, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-john-eudes-priest',                               8, 19, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-bernard-abbot-and-doctor-of-the-church',          8, 20, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-jane-frances-de-chantal-religious',               8, 21, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-immaculate-heart-of-the-blessed-virgin-mary',       8, 22, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-bartholomew-apostle',                             8, 24, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-louis',                                           8, 25, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-joseph-calasanz-priest',                          8, 27, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-augustine-of-hippo-bishop-and-doctor-of-the-church', 8, 28, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('beheading-of-saint-john-the-baptist',                   8, 29, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-rose-of-lima-virgin',                             8, 30, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- September
('saint-stephen-of-hungary',                              9,  2, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-pius-x-pope',                                     9,  3, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-nativity-of-the-blessed-virgin-mary',               9,  8, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-most-holy-name-of-mary',                            9, 12, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-exaltation-of-the-holy-cross',                      9, 14, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saints-cornelius-pope-and-cyprian-bishop-martyrs',      9, 16, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-januarius-bishop-and-martyr',                     9, 19, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-matthew-apostle-and-evangelist',                  9, 21, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saints-cosmas-and-damian-martyrs',                      9, 27, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-wenceslaus-martyr',                               9, 28, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-jerome-priest-and-doctor-of-the-church',          9, 30, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- October
('the-holy-guardian-angels',                              10,  2, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-francis-of-assisi',                               10,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-bruno-priest',                                    10,  6, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('our-lady-of-the-rosary',                                10,  7, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-bridget-religious',                               10,  8, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-callistus-i-pope-and-martyr',                     10, 14, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-teresa-of-jesus-virgin-and-doctor-of-the-church', 10, 15, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-hedwig-religious',                                10, 16, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-margaret-mary-alacoque-virgin',                   10, 17, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-luke-evangelist',                                 10, 18, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-john-of-kanty-priest',                            10, 20, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-anthony-mary-claret-bishop',                      10, 23, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saints-simon-and-jude-apostles',                        10, 28, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-therese-of-the-child-jesus-virgin-and-doctor-of-the-church', 10, 3, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
-- November
('all-saints',                                            11,  1, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-commemoration-of-all-the-faithful-departed',        11,  2, 'CLASS_I',   'BLACK', 'normal', FALSE, 'Wikipedia 1960'),
('saint-charles-borromeo-bishop',                         11,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-dedication-of-the-lateran-basilica',                11,  9, 'CLASS_II',  'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-martin-of-tours-bishop',                          11, 11, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-martin-i-pope-and-martyr',                        11, 12, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-josaphat-bishop-and-martyr',                      11, 14, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-albert-the-great-bishop-and-doctor-of-the-church', 11, 15, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-gertrude-virgin',                                 11, 16, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles', 11, 18, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-elizabeth-of-hungary-religious',                  11, 19, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-presentation-of-the-blessed-virgin-mary',           11, 21, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-cecilia-virgin-and-martyr',                       11, 22, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-clement-i-pope-and-martyr',                       11, 23, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-john-of-the-cross-priest-and-doctor-of-the-church', 11, 24, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-catherine-of-alexandria-virgin-and-martyr',       11, 25, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-andrew-apostle',                                  11, 30, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
-- December
('saint-francis-xavier-priest',                           12,  3, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-peter-chrysologus-bishop-and-doctor-of-the-church', 12,  4, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-nicholas-bishop',                                 12,  6, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-ambrose-bishop-and-doctor-of-the-church',         12,  7, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('the-immaculate-conception-of-the-blessed-virgin-mary',  12,  8, 'CLASS_I',   'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-damasus-i-pope',                                  12, 11, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-lucy-virgin-and-martyr',                          12, 13, 'CLASS_III', 'RED',   'normal', FALSE, 'Wikipedia 1960'),
('saint-eusebius-of-vercelli-bishop',                     12, 16, 'CLASS_III', 'WHITE', 'normal', FALSE, 'Wikipedia 1960'),
('saint-thomas-apostle',                                  12, 21, 'CLASS_II',  'RED',   'normal', FALSE, 'Wikipedia 1960'),
('christmas-vigil',                                       12, 24, 'CLASS_I',   'VIOLET','normal', FALSE, 'Wikipedia 1960'),
('nativity-of-the-lord',                                  12, 25, 'CLASS_I',   'WHITE', 'octave', FALSE, 'Wikipedia 1960'),
('saint-stephen-the-first-martyr',                        12, 26, 'CLASS_II',  'RED',   'octave', FALSE, 'Wikipedia 1960'),
('saint-john-apostle-and-evangelist',                     12, 27, 'CLASS_II',  'WHITE', 'octave', FALSE, 'Wikipedia 1960'),
('the-holy-innocents-martyrs',                            12, 28, 'CLASS_II',  'RED',   'octave', FALSE, 'Wikipedia 1960')
) AS x(slug, month, day, rank_code, color_code, observance_type, is_optional, notes)
ON f.slug = x.slug
JOIN liturgical_ranks r ON r.calendar_id = tcal.id AND r.code = x.rank_code
LEFT JOIN liturgical_colors lc ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- SECTION 5c: MOVABLE FEASTS (ROMAN_1960)
-- =========================================================

-- =========================================================
-- MOVABLE OCTAVES - ROMAN 1960
-- =========================================================

-- =========================================================
-- PENTECOST OCTAVE FERIAS
-- CLASS I - RED
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
    x.movable_offset_days,
    'octave',
    FALSE,
    'Wikipedia 1960'
FROM feasts f
JOIN calendars cal
    ON cal.code = 'ROMAN_1960'
JOIN (
    VALUES
    ('monday-in-the-octave-of-pentecost', 1),
    ('tuesday-in-the-octave-of-pentecost', 2),
    ('thursday-in-the-octave-of-pentecost', 4),
    ('saturday-in-the-octave-of-pentecost', 6)
) AS x(slug, movable_offset_days)
    ON f.slug = x.slug
JOIN liturgical_ranks r
    ON r.calendar_id = cal.id
    AND r.code = 'CLASS_I'
JOIN liturgical_colors lc
    ON lc.code = 'RED'

ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =====================================================
-- EASTER OCTAVE
-- CLASS I - WHITE
-- =====================================================

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
    x.date_kind,
    x.movable_base,
    x.movable_offset_days,
    x.observance_type,
    FALSE,
    x.notes
FROM feasts f
JOIN calendars cal
    ON cal.code = 'ROMAN_1960'
JOIN (
    VALUES
    ('monday-in-the-octave-of-easter',
        'movable', 'EASTER_SUNDAY', 1,
        'CLASS_I', 'WHITE', 'octave',
        'Wikipedia 1960'),

    ('tuesday-in-the-octave-of-easter',
        'movable', 'EASTER_SUNDAY', 2,
        'CLASS_I', 'WHITE', 'octave',
        'Wikipedia 1960'),

    ('wednesday-in-the-octave-of-easter',
        'movable', 'EASTER_SUNDAY', 3,
        'CLASS_I', 'WHITE', 'octave',
        'Wikipedia 1960'),

    ('thursday-in-the-octave-of-easter',
        'movable', 'EASTER_SUNDAY', 4,
        'CLASS_I', 'WHITE', 'octave',
        'Wikipedia 1960'),

    ('friday-in-the-octave-of-easter',
        'movable', 'EASTER_SUNDAY', 5,
        'CLASS_I', 'WHITE', 'octave',
        'Wikipedia 1960'),

    ('saturday-in-the-octave-of-easter',
        'movable', 'EASTER_SUNDAY', 6,
        'CLASS_I', 'WHITE', 'octave',
        'Wikipedia 1960')

) AS x(
    slug,
    date_kind,
    movable_base,
    movable_offset_days,
    rank_code,
    color_code,
    observance_type,
    notes
)
    ON f.slug = x.slug

JOIN liturgical_ranks r
    ON r.calendar_id = cal.id
    AND r.code = x.rank_code

JOIN liturgical_colors lc
    ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- =========================================================
-- MOVABLE VIGILS - ROMAN 1960
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
    x.date_kind,
    x.movable_base,
    x.movable_offset_days,
    'vigil',
    FALSE,
    x.notes
FROM feasts f
JOIN calendars cal
    ON cal.code = 'ROMAN_1960'
JOIN (
    VALUES

    ('vigil-of-the-ascension',
        'movable', 'ASCENSION_SUNDAY', -1,
        'CLASS_II', 'VIOLET',
        'Wikipedia 1960'),

    ('vigil-of-pentecost',
        'movable', 'PENTECOST', -1,
        'CLASS_I', 'RED',
        'Wikipedia 1960')
) AS x(
    slug,
    date_kind,
    movable_base,
    movable_offset_days,
    rank_code,
    color_code,
    notes
)
    ON f.slug = x.slug

JOIN liturgical_ranks r
    ON r.calendar_id = cal.id
    AND r.code = x.rank_code

JOIN liturgical_colors lc
    ON lc.code = x.color_code

ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Ember Days: Wednesday, Friday, Saturday of Advent, Lent, Pentecost, and September
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
    x.movable_base,
    x.movable_offset_days,
    x.observance_type,
    FALSE,
    x.notes

FROM feasts f

JOIN calendars cal
    ON cal.code = 'ROMAN_1960'

JOIN (
    VALUES

    -- -----------------------------------------------------
    -- EMBER DAYS OF ADVENT
    -- CLASS II - VIOLET
    -- -----------------------------------------------------

    ('ember-wednesday-of-advent',
        'THIRD_ADVENT_SUNDAY', 3,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),

    ('ember-friday-of-advent',
        'THIRD_ADVENT_SUNDAY', 5,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),

    ('ember-saturday-of-advent',
        'THIRD_ADVENT_SUNDAY', 6,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),


    -- -----------------------------------------------------
    -- LENTEN EMBER DAYS
    -- CLASS II - VIOLET
    -- -----------------------------------------------------

    ('ember-wednesday-of-lent',
        'FIRST_SUNDAY_OF_LENT', 3,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),

    ('ember-friday-of-lent',
        'FIRST_SUNDAY_OF_LENT', 5,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),

    ('ember-saturday-of-lent',
        'FIRST_SUNDAY_OF_LENT', 6,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),


    -- -----------------------------------------------------
    -- EMBER DAYS OF PENTECOST
    -- CLASS I - RED
    -- OCTAVE OF PENTECOST
    -- -----------------------------------------------------

    ('ember-wednesday-after-pentecost',
        'PENTECOST', 3,
        'CLASS_I', 'RED', 'octave',
        '1960 General Rubrics 66'),

    ('ember-friday-after-pentecost',
        'PENTECOST', 5,
        'CLASS_I', 'RED', 'octave',
        '1960 General Rubrics 66'),

    ('ember-saturday-after-pentecost',
        'PENTECOST', 6,
        'CLASS_I', 'RED', 'octave',
        '1960 General Rubrics 66'),


    -- -----------------------------------------------------
    -- SEPTEMBER EMBER DAYS
    -- CLASS II - VIOLET
    -- -----------------------------------------------------

    ('ember-wednesday-of-september',
        'THIRD_SUNDAY_OF_SEPTEMBER', 3,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),

    ('ember-friday-of-september',
        'THIRD_SUNDAY_OF_SEPTEMBER', 5,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24'),

    ('ember-saturday-of-september',
        'THIRD_SUNDAY_OF_SEPTEMBER', 6,
        'CLASS_II', 'VIOLET', 'normal',
        '1960 General Rubrics 24')

) AS x(
    slug,
    movable_base,
    movable_offset_days,
    rank_code,
    color_code,
    observance_type,
    notes
)

    ON f.slug = x.slug

JOIN liturgical_ranks r
    ON r.calendar_id = cal.id
    AND r.code = x.rank_code

JOIN liturgical_colors lc
    ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

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
    x.movable_base,
    x.movable_offset_days,
    'normal',
    FALSE,
    x.notes
FROM feasts f
JOIN calendars cal
    ON cal.code = 'ROMAN_1960'
JOIN (
    VALUES
    -- Septuagesima
    ('septuagesima-sunday',
        'SEPTUAGESIMA_SUNDAY', 0,
        'CLASS_II', 'VIOLET',
        '1960 General Rubrics 10-12'),

    -- Sexagesima
    ('sexagesima-sunday',
        'SEPTUAGESIMA_SUNDAY', 7,
        'CLASS_II', 'VIOLET',
        '1960 General Rubrics 10-12'),

    -- Quinquagesima
    ('quinquagesima-sunday',
        'SEPTUAGESIMA_SUNDAY', 14,
        'CLASS_II', 'VIOLET',
        '1960 General Rubrics 10-12')

) AS x(
    slug,
    movable_base,
    movable_offset_days,
    rank_code,
    color_code,
    notes
)
    ON f.slug = x.slug
JOIN liturgical_ranks r
    ON r.calendar_id = cal.id
    AND r.code = x.rank_code
JOIN liturgical_colors lc
    ON lc.code = x.color_code
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Most Holy Name of Jesus: Sunday between octave of Christmas and Epiphany (or Jan 2 if no Sunday)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, tcal.id, r.id, lc.id, 'movable', 'SUNDAY_BETWEEN_CHRISTMAS_OCTAVE_AND_EPIPHANY', 0, 'normal', FALSE, 'Wikipedia 1960 movable'
FROM feasts f
JOIN calendars tcal ON tcal.code = 'ROMAN_1960'
JOIN liturgical_ranks r ON r.calendar_id = tcal.id AND r.code = 'CLASS_II'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'the-most-holy-name-of-jesus'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- The Holy Family: First Sunday after Epiphany
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, tcal.id, r.id, lc.id, 'movable', 'SUNDAY_AFTER_EPIPHANY', 0, 'normal', FALSE, 'Wikipedia 1960 movable'
FROM feasts f
JOIN calendars tcal ON tcal.code = 'ROMAN_1960'
JOIN liturgical_ranks r ON r.calendar_id = tcal.id AND r.code = 'CLASS_II'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'the-holy-family-of-jesus-mary-and-joseph-1960'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Our Lord Jesus Christ the King: Last Sunday in October
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, tcal.id, r.id, lc.id, 'movable', 'CHRIST_THE_KING', 0, 'normal', FALSE, 'Wikipedia 1960 movable'
FROM feasts f
JOIN calendars tcal ON tcal.code = 'ROMAN_1960'
JOIN liturgical_ranks r ON r.calendar_id = tcal.id AND r.code = 'CLASS_I'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'our-lord-jesus-christ-the-king'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

-- Seven Sorrows of BVM (movable): Friday after First Sunday in Passiontide (2nd Sunday of Passion)
INSERT INTO celebrations (feast_id, calendar_id, rank_id, color_id, date_kind, movable_base, movable_offset_days, observance_type, is_optional, notes)
SELECT f.id, tcal.id, r.id, lc.id, 'movable', 'PASSION_SUNDAY', 5, 'normal', FALSE, 'Wikipedia 1960 movable - Friday after I Sunday in Passiontide'
FROM feasts f
JOIN calendars tcal ON tcal.code = 'ROMAN_1960'
JOIN liturgical_ranks r ON r.calendar_id = tcal.id AND r.code = 'COMM'
LEFT JOIN liturgical_colors lc ON lc.code = 'WHITE'
WHERE f.slug = 'the-seven-sorrows-of-the-blessed-virgin-mary'
ON CONFLICT (feast_id, calendar_id) DO NOTHING;

COMMIT;
