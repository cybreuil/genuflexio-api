BEGIN;

-- =========================================================
-- Roman feast cover images (ROMAN_GENERAL)
-- =========================================================
-- Cover illustration for feasts that have no saint (Easter, Christmas…).
-- When a feast has a saint, the front falls back on the saint's image,
-- so only feasts listed here need a cover.
--
-- Convention: image_url served from /public, stored as /feasts/...
--
-- HOW TO FILL A LINE
--   Part 1 : replace the TODO fields (title, type, creator, date, century, repository…)
--   Part 2 : nothing to do, the image_url must simply match Part 1
--   Then uncomment both lines.
--
-- Feasts sharing an image (octave days, Sundays of a season) point to the
-- same image_url in Part 2; the image is inserted only once in Part 1.
-- =========================================================


-- =============================================================
-- PART 1 : IMAGES (unique artworks)
-- =============================================================

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

-- =========================
-- Fixed feasts of the Lord
-- =========================
('/feasts/holy-name-of-jesus.webp',      'The Adoration of the Name of Jesus', 'painting', 'Holy Name of Jesus', 'El Greco', '1577-1580', 16, 'El Escorial', NULL, 'Public Domain', NULL),
('/feasts/epiphany.webp',                'Adoration of the Magi', 'painting', 'Adoration of the Magi', 'Bartolomé Esteban Murillo', '1655-1660', 17, 'Toledo Museum of Art', NULL, 'Public Domain', NULL),
('/feasts/baptism-of-the-lord.webp',     'Baptism of Christ', 'painting', 'Baptism of Christ', 'Andrea del Verrocchio & Leonardo da Vinci', '1470-1475', 15, 'Uffizi Gallery', NULL, 'Attribution-ShareAlike 4.0 International', NULL),
('/feasts/presentation-of-the-lord.webp','The Scene of Christ in the Temple', 'painting', 'The Presentation of Christ in the Temple', 'Fra Bartolomeo', '1516', 16, 'Kunsthistorisches Museum', NULL, 'Public Domain', NULL),
('/feasts/annunciation.webp',            'Annunciation', 'painting', 'The Annunciation', 'Fra Angelico', '1438-1450', 15, 'Museo Nazionale di San Marco', NULL, 'Public Domain', NULL),
('/feasts/transfiguration.webp',         'Transfiguration of Christ', 'painting', 'Transfiguration of Christ', 'Luca Giordano', '1685', 17, 'Uffizi Gallery', NULL, 'Public Domain', NULL),
('/feasts/exaltation-of-the-cross.webp', 'The Frankfurt Altarpiece of the Exaltation of the True Cross', 'painting', 'Exaltation of the True Cross', 'Adam Elsheimer', '1578-1610', 17, 'Städel Museum', NULL, 'Public Domain Mark 1.0 Universal', NULL),

-- =========================
-- Christmas time
-- =========================
('/feasts/christmas-vigil.webp',         'On the Eve of the Birth of Christ', 'painting', 'On the Eve of the Birth of Christ', 'Michael Rieser', '1869', 19, NULL, NULL, 'Public Domain', NULL),
('/feasts/nativity.webp',                'Adoration of the Shepherds', 'painting', 'Adoration of the Shepherds', 'Gerrit van Honthorst', '1622', 17, 'Pommersche Landesmuseum', NULL, 'Public Domain', NULL),
-- We have holy family
-- ('/feasts/holy-family.webp',             'The Montalto Madonna', 'painting', 'Holy Family', 'Annibale Carracci', '1597-1598', 16, 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/feasts/christmas-octave.webp',        'Adoration of the Shepherds', 'painting', 'Adoration of the Shepherds', 'Frères Le Nain', '1640', 17, 'National Gallery (London)', NULL, 'Public Domain', NULL),

-- =========================
-- Advent (one shared image for the 4 Sundays + Dec 24)
-- =========================
('/feasts/advent.webp',                  'Joseph and Mary Flight to Bethlehem', 'painting', 'Joseph and Mary Flight to Bethlehem', 'Cesare Maccari', '19th Century', 19, NULL, NULL, 'Public Domain', NULL),

-- =========================
-- Lent
-- =========================
('/feasts/ash-wednesday.webp',           'Christ in the Wilderness', 'painting', 'Christ in the Wilderness', 'Ivan Kramskoi', '1872', 19, 'Tretyakov Gallery', NULL, 'Public Domain', NULL),
('/feasts/lent.webp',                    'The Temptation of Christ', 'painting', 'The Temptation of Christ', 'Ary Scheffer', '1854', 19, 'Walker Art Gallery', NULL, 'Public Domain', NULL),

-- =========================
-- Holy Week / Triduum
-- =========================
('/feasts/palm-sunday.webp',             'Entry into Jerusalem', 'painting', 'Entry into Jerusalem', 'Alessandro Turchi', '1640', 17, 'Hermitage Museum', NULL, 'Public Domain', NULL),
('/feasts/holy-week-monday.webp',        'Jesus casting out the money changers at the temple', 'painting', 'Jesus casting out the money changers at the temple', 'Carl Bloch', '19th Century', 19, NULL, NULL, 'Public Domain', NULL),
('/feasts/holy-week-tuesday.webp',       'The Chief Priests Ask Jesus by What Right Does He Act in This Way', 'painting', 'Holy Week Tuesday', 'James Tissot', '1886-1894', 19, 'Brooklyn Museum', NULL, 'Public Domain', NULL),
('/feasts/holy-week-wednesday.webp',     'Judas'' Betrayal', 'painting', 'Judas'' Betrayal', 'Giotto', '1304-1306', 14, 'Scrovegni Chapel', NULL, 'Public Domain', NULL),
('/feasts/holy-week-thursday.webp',      'The Last Supper', 'painting', 'The Last Supper', 'Juan de Juanes', '1562', 16, 'Museo del Prado', NULL, 'Public Domain', NULL),
('/feasts/good-friday.webp',        	'Christ on the Cross', 'painting', 'Christ on the Cross', 'Anthony van Dyck', '1620', 17, 'Royal Museum of Fine Arts Antwerp', NULL, 'Public Domain', NULL),
('/feasts/holy-saturday.webp',           'The Dead Body of Christ', 'painting', 'The Dead Body of Christ', 'Johann Melchior Wyrsch', '1779', 18, 'Kunstmuseum Basel', NULL, 'Public Domain', NULL),
-- ('/feasts/easter-vigil.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

-- =========================
-- Easter time
-- =========================
('/feasts/resurrection.webp',            'The Resurrection of Jesus Christ', 'painting', 'The Resurrection of Jesus Christ', 'Luca Giordano', '1665', 17, 'Residenzgalerie', NULL, 'Public Domain', NULL),
('/feasts/easter-octave-monday.webp',    'Les Saintes femmes au tombeau', 'painting', 'Les Saintes femmes au tombeau', 'Irma Martin', '1843', 19, NULL, NULL, 'Public Domain', NULL),
('/feasts/easter-octave-tuesday.webp',    'Noli Me Tangere', 'painting', 'Noli Me Tangere', 'Fra Angelico', '1439-1443', 15, 'Museo Nazionale di San Marco', NULL, 'Public Domain', NULL),
('/feasts/easter-octave-wednesday.webp',    'Supper at Emmaus', 'painting', 'Supper at Emmaus', 'Caravaggio', '1601', 17, 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/feasts/easter-octave.webp',    'Christ Appearing to the Apostles after the Resurrection', 'painting', 'Christ Appearing to the Apostles after the Resurrection', 'Szymon Czechowicz', '1758', 18, 'National Museum in Kraków', NULL, 'Public Domain', NULL),
-- Already-have
-- ('/feasts/divine-mercy.webp',            'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),

('/feasts/good-shepherd.webp',           'The Good Shepherd', 'painting', 'The Good Shepherd', NULL, '250-300', 3, 'Catacomb of Callixtus (Rome)', NULL, 'Public Domain', NULL),
-- ('/feasts/easter-season.webp',           'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
('/feasts/ascension.webp',               'Ascension', 'painting', 'Ascension', 'Francisco Camilo', '1651', 17, 'Museu Nacional d''Art de Catalunya', NULL, 'Public Domain', NULL),
('/feasts/pentecost.webp',               'Pentecost', 'painting', 'Pentecost', 'Jean II Restout', '1732', 18, NULL, NULL, 'Public Domain', NULL),

-- =========================
-- Movable solemnities after Pentecost
-- =========================
('/feasts/holy-trinity.webp',            'Holy Trinity', 'painting', 'Holy Trinity', 'Hendrick van Balen the Elder', '1620', 17, 'St. James'' Church (Antwerp)', NULL, 'Public Domain', NULL),
('/feasts/corpus-christi.webp',          'Procession at the Feast of Corpus Christi in Rome', 'painting', 'Corpus Christi', 'Egron Lundgren', '1847', 19, NULL, NULL, 'Public Domain', NULL),
('/feasts/sacred-heart.webp',            ' La Santísima Trinidad', 'painting', ' La Santísima Trinidad', 'Corrado Giaquinto', '1754', 18, 'Museo del Prado', NULL, 'Public Domain', NULL),
('/feasts/christ-the-king.webp',         'Jesus the Pantokrator and Teacher Among the Angels', 'painting', 'Christ the King', 'Luigi Cavenaghi', '19th Century', 19, 'Basilica of Santa Eufemia (Milan)', NULL, 'Public Domain', NULL),

-- =========================
-- Marian feasts
-- =========================
-- ('/feasts/mary-mother-of-god.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
('/feasts/our-lady-of-lourdes.webp',     'Our Lady of Lourdes', 'painting', 'Our Lady of Lourdes', 'Virgilio Tojetti', '1877', 19, NULL, NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-fatima.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
('/feasts/visitation.webp',              'The Visitation', 'painting', 'The Visitation', 'Mariotto Albertinelli', '1503', 16, 'Uffizi Gallery', NULL, 'Public Domain', NULL),
('/feasts/our-lady-of-mount-carmel.webp','Our Lady of Mount Carmel', 'painting', 'Our Lady of Mount Carmel', 'Pietro Novelli', '1641', 17, 'Museo diocesano di Palermo', NULL, 'Public Domain', NULL),
-- ('/feasts/assumption.webp',              'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/queenship-of-mary.webp',       'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
('/feasts/nativity-of-mary.webp',        'Nativity of Mary', 'painting', 'Nativity of Mary', 'Andrea di Bartolo', '1405', 15, 'National Gallery of Art (Washington)', NULL, 'Public Domain', NULL),
('/feasts/holy-name-of-mary.webp',       'The Holy Name of Mary', 'painting', 'The Holy Name of Mary', 'Cristóbal de Villalpando', '1690-1700', 17, 'Basilica of Our Lady of Guadalupe', NULL, 'Public Domain', NULL),
('/feasts/our-lady-of-sorrows.webp',     'Our Lady of Sorrows', 'painting', 'Our Lady of Sorrows', 'Quinten Metsys', '1509-1511', 16, 'National Museum of Ancient Art (Lisbon)', NULL, 'Public Domain', NULL),
('/feasts/our-lady-of-the-rosary.webp',  'Our Lady of the Rosary', 'painting', 'Our Lady of the Rosary', 'Simone Cantarini', '1640', 17, 'Pinacoteca Tosio Martinengo', NULL, 'Public Domain', NULL),
-- ('/feasts/presentation-of-mary.webp',    'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/immaculate-conception.webp',   'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
-- ('/feasts/our-lady-of-loreto.webp',      'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
('/feasts/our-lady-of-guadalupe.webp',   'Our Lady of Guadalupe', 'painting', 'Our Lady of Guadalupe', NULL, '16th Century', 16, NULL, NULL, 'Public Domain', NULL),
('/feasts/mary-mother-of-the-church.webp','The Virgin and Child Enthroned among Angels and Saints', 'painting', 'The Virgin and Child Enthroned among Angels and Saints', 'Benozzo Gozzoli', '1461-1462', 15, 'National Gallery (London)', NULL, 'Public Domain', NULL),
('/feasts/immaculate-heart-of-mary.webp','Immaculate Heart of Mary', 'painting', 'Immaculate Heart of Mary', 'Miguel Ballejo y Mandirano', '1750', 18, 'Bowers Museum in Santa Ana (California)', NULL, 'Public Domain', NULL),

-- =========================
-- Dedications
-- =========================
('/feasts/saint-mary-major.webp',        'Coronation of the Virgin', 'mosaic', 'Coronation of the Virgin', 'Jacopo Torriti', '1295', 13, 'Santa Maria Maggiore (Rome)', NULL, 'Public Domain', NULL),
('/feasts/lateran-basilica.webp',        'Lateran Basilica Fresco', 'fresco', 'Lateran Basilica Fresco', NULL, "4-5th Century, Repairs and Additions 13th Century", 5, "Basilica of St. John Lateran (Rome)", NULL, 'Public Domain', NULL),
('/feasts/basilicas-peter-and-paul.webp','Saint Peter & Saint Paul', 'painting', 'Saint Peter & Saint Paul', 'Jusepe de Ribera', '1616', 17, 'Museum of Fine Arts of Strasbourg', NULL, 'Public Domain', NULL),

-- =========================
-- Other
-- =========================
-- ('/feasts/guardian-angels.webp',         'TODO title', 'painting', 'TODO alt', 'TODO creator', 'TODO date', NULL, 'TODO repository', NULL, 'Public Domain', NULL),
('/feasts/all-souls.webp',               'Saint Lawrence Liberates Souls from Purgatory', 'painting', 'Saint Lawrence Liberates Souls from Purgatory', 'Lorenzo di Niccolò', '1412', 15, 'Brooklyn Museum', NULL, 'Public Domain', NULL),
('/feasts/all-saints.webp',               'The Forerunners of Christ with Saints and Martyrs', 'painting', 'All Saints', 'Fra Angelico', '1420', 15, 'National Gallery (London)', NULL, 'Public Domain', NULL)

ON CONFLICT (image_url) DO NOTHING;


-- =============================================================
-- PART 2 : FEAST -> COVER IMAGE
-- =============================================================

UPDATE feasts f
SET cover_image_id = i.id
FROM (
    VALUES
    (feast_slug, image_url)

    -- Fixed feasts of the Lord
    ('the-most-holy-name-of-jesus',       '/feasts/holy-name-of-jesus.webp'),
    ('the-epiphany-of-the-lord',          '/feasts/epiphany.webp'),
    ('the-baptism-of-the-lord',           '/feasts/baptism-of-the-lord.webp'),
    ('the-presentation-of-the-lord',      '/feasts/presentation-of-the-lord.webp'),
    ('the-annunciation-of-the-lord',      '/feasts/annunciation.webp'),
    ('the-transfiguration-of-the-lord',   '/feasts/transfiguration.webp'),
    ('the-exaltation-of-the-holy-cross',  '/feasts/exaltation-of-the-cross.webp'),

    -- Christmas time
    ('christmas-vigil',                          '/feasts/christmas-vigil.webp'),
    ('nativity-of-the-lord',                     '/feasts/nativity.webp'),
    ('the-holy-family-of-jesus-mary-and-joseph', '/saints/saint-joseph_carracci.webp'),
    ('sixth-day-in-the-octave-of-christmas',     '/feasts/christmas-octave.webp'),

    -- Advent
    ('first-sunday-of-advent',   '/feasts/advent.webp'),
    ('second-sunday-of-advent',  '/feasts/advent.webp'),
    ('third-sunday-of-advent',   '/feasts/advent.webp'),
    ('fourth-sunday-of-advent',  '/feasts/advent.webp'),
    ('december-24-advent-feria', '/feasts/advent.webp'),

    -- Lent
    ('ash-wednesday',                '/feasts/ash-wednesday.webp'),
    ('thursday-after-ash-wednesday', '/feasts/lent.webp'),
    ('friday-after-ash-wednesday',   '/feasts/lent.webp'),
    ('saturday-after-ash-wednesday', '/feasts/lent.webp'),
    ('first-sunday-of-lent',         '/feasts/lent.webp'),
    ('second-sunday-of-lent',        '/feasts/lent.webp'),
    ('third-sunday-of-lent',         '/feasts/lent.webp'),
    ('fourth-sunday-of-lent',        '/feasts/lent.webp'),
    ('fifth-sunday-of-lent',         '/feasts/lent.webp'),

    -- Holy Week / Triduum
    ('palm-sunday-of-the-passion-of-the-lord', '/feasts/palm-sunday.webp'),
    ('monday-of-holy-week',                    '/feasts/holy-week-monday.webp'),
    ('tuesday-of-holy-week',                   '/feasts/holy-week-tuesday.webp'),
    ('wednesday-of-holy-week',                 '/feasts/holy-week-wednesday.webp'),
    ('holy-thursday-evening-mass-of-the-lords-supper', '/feasts/holy-week-thursday.webp'),
    ('friday-of-the-passion-of-the-lord',      '/feasts/good-friday.webp'),
    -- ('holy-saturday',                          '/feasts/holy-saturday.webp'),
    ('easter-vigil-in-the-holy-night',         '/feasts/easter-vigil.webp'),

    -- Easter time
    ('easter-sunday-of-the-resurrection-of-the-lord', '/feasts/resurrection.webp'),
    ('monday-in-the-octave-of-easter',                '/feasts/easter-octave-monday.webp'),
    ('tuesday-in-the-octave-of-easter',               '/feasts/easter-octave-tuesday.webp'),
    ('wednesday-in-the-octave-of-easter',             '/feasts/easter-octave-wednesday.webp'),
    ('thursday-in-the-octave-of-easter',              '/feasts/easter-octave.webp'),
    ('friday-in-the-octave-of-easter',                '/feasts/easter-octave.webp'),
    ('saturday-in-the-octave-of-easter',              '/feasts/easter-octave.webp'),
    ('second-sunday-of-easter-divine-mercy-sunday',   '/feasts/divine-mercy.webp'),
    ('third-sunday-of-easter',                        '/feasts/easter-octave.webp'),
    ('fourth-sunday-of-easter',                       '/feasts/good-shepherd.webp'),
    ('fifth-sunday-of-easter',                        '/feasts/easter-octave.webp'),
    ('sixth-sunday-of-easter',                        '/feasts/easter-octave.webp'),
    ('seventh-sunday-of-easter',                      '/feasts/easter-octave.webp'),
    ('the-ascension-of-the-lord',                     '/feasts/ascension.webp'),
    ('pentecost-sunday',                              '/feasts/pentecost.webp'),

    -- Movable solemnities after Pentecost
    ('the-most-holy-trinity',                     '/feasts/holy-trinity.webp'),
    ('the-most-holy-body-and-blood-of-christ',    '/feasts/corpus-christi.webp'),
    ('the-most-sacred-heart-of-jesus',            '/feasts/sacred-heart.webp'),
    ('our-lord-jesus-christ-king-of-the-universe','/feasts/christ-the-king.webp'),

    -- Marian feasts
    -- ('solemnity-of-mary-the-holy-mother-of-god',          '/feasts/mary-mother-of-god.webp'),
    ('our-lady-of-lourdes',                                '/feasts/our-lady-of-lourdes.webp'),
    -- ('our-lady-of-fatima',                                 '/feasts/our-lady-of-fatima.webp'),
    ('the-visitation-of-the-blessed-virgin-mary',          '/feasts/visitation.webp'),
    ('our-lady-of-mount-carmel',                           '/feasts/our-lady-of-mount-carmel.webp'),
    ('the-assumption-of-the-blessed-virgin-mary',          '/saints/saint-mary_guido-reni.webp'),
    ('the-queenship-of-the-blessed-virgin-mary',           '/saints/saint-mary_velazquez.webp'),
    ('the-nativity-of-the-blessed-virgin-mary',            '/feasts/nativity-of-mary.webp'),
    ('the-most-holy-name-of-mary',                         '/feasts/holy-name-of-mary.webp'),
    ('our-lady-of-sorrows',                                '/feasts/our-lady-of-sorrows.webp'),
    ('our-lady-of-the-rosary',                             '/feasts/our-lady-of-the-rosary.webp'),
    ('the-presentation-of-the-blessed-virgin-mary',        '/saints/saint-anne-&-mary_stella.webp'),
    -- ('the-immaculate-conception-of-the-blessed-virgin-mary','/feasts/immaculate-conception.webp'),
    -- ('our-lady-of-loreto',                                 '/feasts/our-lady-of-loreto.webp'),
    ('our-lady-of-guadalupe',                              '/feasts/our-lady-of-guadalupe.webp'),
    ('blessed-virgin-mary-mother-of-the-church',           '/feasts/mary-mother-of-the-church.webp'),
    ('the-immaculate-heart-of-the-blessed-virgin-mary',    '/feasts/immaculate-heart-of-mary.webp'),

    -- Dedications
    -- ('the-dedication-of-the-basilica-of-saint-mary-major',               '/feasts/saint-mary-major.webp'),
    -- ('the-dedication-of-the-lateran-basilica',                           '/feasts/lateran-basilica.webp'),
    -- ('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles','/feasts/basilicas-peter-and-paul.webp'),

    -- Other
    -- ('the-holy-guardian-angels',                     '/feasts/guardian-angels.webp'),
    -- ('the-commemoration-of-all-the-faithful-departed','/feasts/all-souls.webp'),

) AS x(feast_slug, image_url)
JOIN images i ON i.image_url = x.image_url
WHERE f.slug = x.feast_slug;


COMMIT;
