BEGIN;

INSERT INTO saint_images (
    saint_id,
    image_id,
    sort_order,
    is_primary,
    subject_role
)
SELECT
    s.id,
    i.id,
    x.sort_order,
    x.is_primary,
    x.subject_role
FROM saints s
JOIN (
	VALUES
-- saint-eulogius-of-cordoba
('saint-eulogius-of-cordoba', '/images/saints/es/saint-eulogius-of-cordoba_martyr.webp', 1, TRUE, 'subject'),

-- saint fructuosus & saint-augurius & saint-eulogius
('saint-fructuosus', '/images/saints/es/saint-fructuosus.webp', 1, TRUE, 'subject'),
('saint-fructuosus', '/images/saints/es/saint-fructuous-augurius-eulogius-martyrdom.webp', 2, FALSE, 'subject'),
('saint-augurius', '/images/saints/es/saint-fructuous-augurius-eulogius-martyrdom.webp', 1, TRUE, 'subject'),
('saint-eulogius', '/images/saints/es/saint-fructuous-augurius-eulogius-martyrdom.webp', 1, TRUE, 'subject'),

-- saint-ildephonsus-of-toledo
('saint-ildephonsus-of-toledo', '/images/saints/es/saint-ildephonsus-of-toledo_greco.webp', 1, TRUE, 'subject'),

-- saint-hermenegild
('saint-hermenegild', '/images/saints/es/saint-hermenegild_herrera.webp', 1, TRUE, 'subject'),

-- saint-peter-of-saint-joseph-de-betancur
('saint-peter-of-saint-joseph-de-betancur', '/images/saints/es/saint-peter-of-saint-joseph-de-betancur.webp', 1, TRUE, 'subject'),

-- saint-isidore-the-farmer
('saint-isidore-the-farmer', '/images/saints/es/saint-isidore-the-farmer.webp', 1, TRUE, 'subject'),

-- saint-paschal-baylon
('saint-paschal-baylon', '/images/saints/es/saint-paschal-baylon.webp', 1, TRUE, 'subject'),

-- saint-joaquina-vedruna
('saint-joaquina-vedruna', '/images/saints/es/saint-joaquina-vedruna.webp', 1, TRUE, 'subject'),

-- saint-ferdinand
('saint-ferdinand', '/images/saints/es/saint-ferdinand.webp', 1, TRUE, 'subject'),

-- saint-jose-de-anchieta
('saint-jose-de-anchieta', '/images/saints/es/saint-jose-de-anchieta.webp', 1, TRUE, 'subject'),

-- saint-maria-micaela-of-the-blessed-sacrament
('saint-maria-micaela-of-the-blessed-sacrament', '/images/saints/es/saint-maria-micaela-of-the-blessed-sacrament_madrazo.webp', 1, TRUE, 'subject'),

-- saint-pelagius
('saint-pelagius', '/images/saints/es/saint-pelagius_martyr.webp', 1, TRUE, 'subject'),

-- saint-ezequiel-moreno
('saint-ezequiel-moreno', '/images/saints/es/saint-ezequiel-moreno.webp', 1, TRUE, 'subject'),

-- saint-teresa-of-jesus-jornet-and-ibars
('saint-teresa-of-jesus-jornet-and-ibars', '/images/saints/es/saint-teresa-of-jesus-jornet-and-ibars.webp', 1, TRUE, 'subject'),

-- saint-francis-borgia
('saint-francis-borgia', '/images/saints/es/saint-francis-borgia_cano.webp', 1, TRUE, 'subject'),

-- saint-thomas-of-villanova
('saint-thomas-of-villanova', '/images/saints/es/saint-thomas-of-villanova.webp', 1, TRUE, 'subject'),

-- saint-soledad-torres-acosta
('saint-soledad-torres-acosta', '/images/saints/es/saint-soledad-torres-acosta.webp', 1, TRUE, 'subject'),

-- saint-peter-of-alcantara
('saint-peter-of-alcantara', '/images/saints/es/saint-peter-of-alcantara.webp', 1, TRUE, 'subject'),

-- saint-leander
('saint-leander', '/images/saints/es/saint-leander_murillo.webp', 1, TRUE, 'subject'),

-- saint-eulalia-of-merida
('saint-eulalia-of-merida', '/images/saints/es/saint-eulalia-of-merida_martyr.webp', 1, TRUE, 'subject')

) AS x (saint_slug, image_url, sort_order, is_primary, subject_role)
ON s.slug = x.saint_slug
JOIN images i ON i.image_url = x.image_url
ON CONFLICT (saint_id, image_id) DO NOTHING;

COMMIT;
