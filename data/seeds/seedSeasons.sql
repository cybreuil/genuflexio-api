BEGIN;

-- =========================================================
-- Liturgical seasons reference + translations
-- =========================================================

INSERT INTO liturgical_seasons (code, default_name) VALUES
('ADVENT', 'Advent'),
('CHRISTMASTIDE', 'Christmastide'),
('ORDINARY_TIME', 'Ordinary Time'),
('LENT', 'Lent'),
('TRIDUUM', 'Triduum'),
('EASTERTIDE', 'Eastertide'),

-- Traditional Roman calendar (1960) Extra Seasons
('THROUGHOUT_THE_YEAR', 'Time throughout the Year'),
('AFTER_EPIPHANY', 'Time after Epiphany'),
('AFTER_PENTECOST', 'Time after Pentecost'),
('CHRISTMAS', 'Christmas'),
('EPIPHANY', 'Epiphany'),
('SEPTUAGESIMA', 'Septuagesima'),
('PASSIONTIDE', 'Passiontide'),
('HOLY_WEEK', 'Holy Week'),
('PASCHALTIDE', 'Paschaltide'),
('ASCENSIONTIDE', 'Ascensiontide'),
('PENTECOST_OCTAVE', 'Octave of Pentecost')
ON CONFLICT (code) DO NOTHING;

-- =========================================================
-- TRANSLATIONS
-- =========================================================

INSERT INTO liturgical_season_translations (season_code, locale_code, label) VALUES

-- =========================================================
-- ENGLISH
-- =========================================================

('ADVENT', 'en', 'Advent'),
('CHRISTMASTIDE', 'en', 'Christmas Time'),
('ORDINARY_TIME', 'en', 'Ordinary Time'),
('LENT', 'en', 'Lent'),
('TRIDUUM', 'en', 'Paschal Triduum'),
('EASTERTIDE', 'en', 'Eastertide'),

('THROUGHOUT_THE_YEAR', 'en', 'Time throughout the Year'),
('AFTER_EPIPHANY', 'en', 'Time after Epiphany'),
('AFTER_PENTECOST', 'en', 'Time after Pentecost'),
('CHRISTMAS', 'en', 'Christmas'),
('EPIPHANY', 'en', 'Epiphany'),
('SEPTUAGESIMA', 'en', 'Septuagesima'),
('PASSIONTIDE', 'en', 'Passiontide'),
('HOLY_WEEK', 'en', 'Holy Week'),
('PASCHALTIDE', 'en', 'Paschaltide'),
('ASCENSIONTIDE', 'en', 'Ascensiontide'),
('PENTECOST_OCTAVE', 'en', 'Octave of Pentecost'),

-- =========================================================
-- FRENCH
-- =========================================================

('ADVENT', 'fr', 'Avent'),
('CHRISTMASTIDE', 'fr', 'Temps de Noël'),
('ORDINARY_TIME', 'fr', 'Temps ordinaire'),
('LENT', 'fr', 'Carême'),
('TRIDUUM', 'fr', 'Triduum pascal'),
('EASTERTIDE', 'fr', 'Temps pascal'),

('THROUGHOUT_THE_YEAR', 'fr', 'Temps tout au long de l''année'),
('AFTER_EPIPHANY', 'fr', 'Temps après l''Épiphanie'),
('AFTER_PENTECOST', 'fr', 'Temps après la Pentecôte'),
('CHRISTMAS', 'fr', 'Temps de Noël'),
('EPIPHANY', 'fr', 'Temps de l''Épiphanie'),
('SEPTUAGESIMA', 'fr', 'Temps de la Septuagésime'),
('PASSIONTIDE', 'fr', 'Temps de la Passion'),
('HOLY_WEEK', 'fr', 'Semaine sainte'),
('PASCHALTIDE', 'fr', 'Temps pascal'),
('ASCENSIONTIDE', 'fr', 'Temps de l''Ascension'),
('PENTECOST_OCTAVE', 'fr', 'Octave de la Pentecôte'),

-- =========================================================
-- LATIN
-- =========================================================

('ADVENT', 'la', 'Tempus Adventus'),
('CHRISTMASTIDE', 'la', 'Tempus Nativitatis'),
('ORDINARY_TIME', 'la', 'Tempus per annum'),
('LENT', 'la', 'Tempus Quadragesimae'),
('TRIDUUM', 'la', 'Triduum Paschale'),
('EASTERTIDE', 'la', 'Tempus Paschale'),

('THROUGHOUT_THE_YEAR', 'la', 'Tempus per annum'),
('AFTER_EPIPHANY', 'la', 'Tempus post Epiphaniam'),
('AFTER_PENTECOST', 'la', 'Tempus post Pentecosten'),
('CHRISTMAS', 'la', 'Tempus Nativitatis'),
('EPIPHANY', 'la', 'Tempus Epiphaniae'),
('SEPTUAGESIMA', 'la', 'Tempus Septuagesimae'),
('PASSIONTIDE', 'la', 'Tempus Passionis'),
('HOLY_WEEK', 'la', 'Hebdomada Sancta'),
('PASCHALTIDE', 'la', 'Tempus Paschale'),
('ASCENSIONTIDE', 'la', 'Tempus Ascensionis'),
('PENTECOST_OCTAVE', 'la', 'Octava Pentecostes')

ON CONFLICT (season_code, locale_code) DO NOTHING;

COMMIT;
