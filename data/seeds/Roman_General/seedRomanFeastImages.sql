BEGIN;

-- =========================================================
-- Roman feast cover images (ROMAN_GENERAL)
-- =========================================================


-- =============================================================
-- PART 2 : FEAST -> COVER IMAGE
-- =============================================================

UPDATE feasts f
SET cover_image_id = i.id
FROM (
    VALUES

    -- Fixed feasts of the Lord
    ('the-most-holy-name-of-jesus',       '/images/feats/holy-name-of-jesus.webp'),
    ('the-epiphany-of-the-lord',          '/images/feats/epiphany.webp'),
    ('the-baptism-of-the-lord',           '/images/feats/baptism-of-the-lord.webp'),
    ('the-presentation-of-the-lord',      '/images/feats/presentation-of-the-lord.webp'),
    ('the-annunciation-of-the-lord',      '/images/feats/annunciation.webp'),
    ('the-transfiguration-of-the-lord',   '/images/feats/transfiguration.webp'),
    ('the-exaltation-of-the-holy-cross',  '/images/feats/exaltation-of-the-cross.webp'),

    -- Christmas time
    ('christmas-vigil',                          '/images/feats/christmas-vigil.webp'),
    ('nativity-of-the-lord',                     '/images/feats/nativity.webp'),
    ('the-holy-family-of-jesus-mary-and-joseph', '/images/saints/saint-joseph_carracci.webp'),
    ('sixth-day-in-the-octave-of-christmas',     '/images/feasts/christmas-octave.webp'),

    -- Advent
    ('first-sunday-of-advent',   '/images/feasts/advent.webp'),
    ('second-sunday-of-advent',  '/images/feasts/advent.webp'),
    ('third-sunday-of-advent',   '/images/feasts/advent.webp'),
    ('fourth-sunday-of-advent',  '/images/feasts/advent.webp'),
    ('december-24-advent-feria', '/images/feasts/advent.webp'),

    -- Lent
    ('ash-wednesday',                '/images/feasts/ash-wednesday.webp'),
    ('thursday-after-ash-wednesday', '/images/feasts/lent.webp'),
    ('friday-after-ash-wednesday',   '/images/feasts/lent.webp'),
    ('saturday-after-ash-wednesday', '/images/feasts/lent.webp'),
    ('first-sunday-of-lent',         '/images/feasts/lent.webp'),
    ('second-sunday-of-lent',        '/images/feasts/lent.webp'),
    ('third-sunday-of-lent',         '/images/feasts/lent.webp'),
    ('fourth-sunday-of-lent',        '/images/feasts/lent.webp'),
    ('fifth-sunday-of-lent',         '/images/feasts/lent.webp'),

    -- Holy Week / Triduum
    ('palm-sunday-of-the-passion-of-the-lord', '/images/feasts/palm-sunday.webp'),
    ('monday-of-holy-week',                    '/images/feasts/holy-week-monday.webp'),
    ('tuesday-of-holy-week',                   '/images/feasts/holy-week-tuesday.webp'),
    ('wednesday-of-holy-week',                 '/images/feasts/holy-week-wednesday.webp'),
    ('holy-thursday-evening-mass-of-the-lords-supper', '/images/feasts/holy-week-thursday.webp'),
    ('friday-of-the-passion-of-the-lord',      '/images/feasts/good-friday.webp'),
    ('holy-saturday',                          '/images/feasts/holy-saturday.webp'),
    ('easter-vigil-in-the-holy-night',         '/images/feasts/easter-vigil.webp'),

    -- Easter time
    ('easter-sunday-of-the-resurrection-of-the-lord', '/images/feasts/resurrection.webp'),
    ('monday-in-the-octave-of-easter',                '/images/feasts/easter-octave-monday.webp'),
    ('tuesday-in-the-octave-of-easter',               '/images/feasts/easter-octave-tuesday.webp'),
    ('wednesday-in-the-octave-of-easter',             '/images/feasts/easter-octave-wednesday.webp'),
    ('thursday-in-the-octave-of-easter',              '/images/feasts/easter-octave.webp'),
    ('friday-in-the-octave-of-easter',                '/images/feasts/easter-octave.webp'),
    ('saturday-in-the-octave-of-easter',              '/images/feasts/easter-octave.webp'),
    ('second-sunday-of-easter-divine-mercy-sunday',   '/images/saints/saint-thomas-apostle_caravaggio.webp'),
    ('third-sunday-of-easter',                        '/images/feasts/easter-octave.webp'),
    ('fourth-sunday-of-easter',                       '/images/feasts/good-shepherd.webp'),
    ('fifth-sunday-of-easter',                        '/images/feasts/easter-octave.webp'),
    ('sixth-sunday-of-easter',                        '/images/feasts/easter-octave.webp'),
    ('seventh-sunday-of-easter',                      '/images/feasts/easter-octave.webp'),
    ('the-ascension-of-the-lord',                     '/images/feasts/ascension.webp'),
    ('pentecost-sunday',                              '/images/feasts/pentecost.webp'),

    -- Movable solemnities after Pentecost
    ('the-most-holy-trinity',                     '/images/feasts/holy-trinity.webp'),
    ('the-most-holy-body-and-blood-of-christ',    '/images/feasts/corpus-christi.webp'),
    ('the-most-sacred-heart-of-jesus',            '/images/feasts/sacred-heart.webp'),
    ('our-lord-jesus-christ-king-of-the-universe','/images/feasts/christ-the-king.webp'),

    -- Marian feasts
    -- ('solemnity-of-mary-the-holy-mother-of-god',          '/feasts/mary-mother-of-god.webp'),
    ('our-lady-of-lourdes',                                '/images/feasts/our-lady-of-lourdes.webp'),
    -- ('our-lady-of-fatima',                                 '/feasts/our-lady-of-fatima.webp'),
    ('the-visitation-of-the-blessed-virgin-mary',          '/images/feasts/visitation.webp'),
    ('our-lady-of-mount-carmel',                           '/images/feasts/our-lady-of-mount-carmel.webp'),
    ('the-assumption-of-the-blessed-virgin-mary',          '/images/saints/saint-mary_guido-reni.webp'),
    ('the-queenship-of-the-blessed-virgin-mary',           '/images/saints/saint-mary_velazquez.webp'),
    ('the-nativity-of-the-blessed-virgin-mary',            '/images/feasts/nativity-of-mary.webp'),
    ('the-most-holy-name-of-mary',                         '/images/feasts/holy-name-of-mary.webp'),
    ('our-lady-of-sorrows',                                '/images/feasts/our-lady-of-sorrows.webp'),
    ('our-lady-of-the-rosary',                             '/images/feasts/our-lady-of-the-rosary.webp'),
    ('the-presentation-of-the-blessed-virgin-mary',        '/images/saints/saint-anne-&-mary_stella.webp'),
    -- ('the-immaculate-conception-of-the-blessed-virgin-mary','/feasts/immaculate-conception.webp'),
    -- ('our-lady-of-loreto',                                 '/feasts/our-lady-of-loreto.webp'),
    ('our-lady-of-guadalupe',                              '/images/feasts/our-lady-of-guadalupe.webp'),
    ('blessed-virgin-mary-mother-of-the-church',           '/images/feasts/mary-mother-of-the-church.webp'),
    ('the-immaculate-heart-of-the-blessed-virgin-mary',    '/images/feasts/immaculate-heart-of-mary.webp'),

    -- Dedications
    ('the-dedication-of-the-basilica-of-saint-mary-major',               '/images/feasts/saint-mary-major.webp'),
    ('the-dedication-of-the-lateran-basilica',                           '/images/feasts/lateran-basilica.webp'),
    ('the-dedication-of-the-basilicas-of-saints-peter-and-paul-apostles','/images/feasts/basilicas-peter-and-paul.webp'),

    -- Other
    -- ('the-holy-guardian-angels',                     '/feasts/guardian-angels.webp'),
    ('the-commemoration-of-all-the-faithful-departed','/images/feasts/all-souls.webp'),
    ('all-saints',                   '/images/feasts/all-saints.webp'),
    ('the-seven-holy-founders-of-the-servite-order', '/images/feasts/seven-servites.webp'),
    ('the-first-martyrs-of-holy-roman-church',      '/images/feasts/first-martyrs-of-rome.webp'),
    ('saints-michael-gabriel-and-raphael-archangels',                         '/images/feasts/three-archangels.webp'),
    ('the-holy-guardian-angels', '/images/feasts/angel-guardian.webp')

) AS x(feast_slug, image_url)
JOIN images i ON i.image_url = x.image_url
WHERE f.slug = x.feast_slug;


COMMIT;
