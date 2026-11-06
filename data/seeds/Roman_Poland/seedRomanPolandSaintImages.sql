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

	-- Saint Józef Sebastian Pelczar
	('saint-jozef-sebastian-pelczar', '/saints/pl/saint-jozef-sebastian-pelczar.webp', 1, TRUE, 'subject'),
	('saint-jozef-sebastian-pelczar', '/saints/pl/saint-jozef-sebastian-pelczar_2.webp', 2, FALSE, 'subject'),

	-- Saint Vincent Pallotti
	('saint-vincent-pallotti', '/saints/pl/saint-vincent-pallotti.webp', 1, TRUE, 'subject'),
	('saint-vincent-pallotti', '/saints/pl/saint-vincent-pallotti_2.webp', 2, FALSE, 'subject'),

	-- Saint Florian
	('saint-florian', '/saints/pl/saint-florian_cossa.webp', 1, TRUE, 'subject'), --- IGNORE ---
	('saint-florian', '/saints/pl/saint-florian_altdorfer_martyr.webp', 2, FALSE, 'subject'),
	('saint-florian', '/saints/pl/saint-florian_reni.webp', 3, FALSE, 'subject'),
	('saint-florian', '/saints/pl/saint-florian.webp', 4, FALSE, 'subject'),

	-- Saint Stanisław Kazimierczyk
	('saint-stanislaw-kazimierczyk', '/saints/pl/saint-stanislaw-kazimierczyk.webp', 1, TRUE, 'subject'),
	('saint-stanislaw-kazimierczyk', '/saints/pl/saint-stanislaw-kazimierczyk_2.webp', 2, FALSE, 'subject'),

	-- Saint Andrew Bobola
	('saint-andrew-bobola', '/saints/pl/saint-andrew-bobola.webp', 1, TRUE, 'subject'),
	('saint-andrew-bobola', '/saints/pl/saint-andrew-bobola_2.webp', 2, FALSE, 'subject'),

	-- Saint Ursula Ledóchowska
	('saint-ursula-ledochowska', '/saints/pl/saint-ursula-ledochowska.webp', 1, TRUE, 'subject'),
	('saint-ursula-ledochowska', '/saints/pl/saint-ursula-ledochowska_2.webp', 2, FALSE, 'subject'),

	-- Saint John Sarkander
	('saint-john-sarkander', '/saints/pl/saint-john-sarkander.webp', 1, TRUE, 'subject'),
	('saint-john-sarkander', '/saints/pl/saint-john-sarkander_2.webp', 2, FALSE, 'subject'),

	-- Saint Zdzislawa
	('saint-zdzislawa', '/saints/pl/saint-zdzislawa.webp', 1, TRUE, 'subject'),
	('saint-zdzislawa', '/saints/pl/saint-zdzislawa_2.webp', 2, FALSE, 'subject'),

	-- Saint Hedwig the Queen
	('saint-hedwig-the-queen', '/saints/pl/saint-hedwig-the-queen_simmler.webp', 1, TRUE, 'subject'),
	('saint-hedwig-the-queen', '/saints/pl/saint-hedwig-the-queen_bacciarelli.webp', 2, FALSE, 'subject'),
	('saint-hedwig-the-queen', '/saints/pl/saint-hedwig-the-queen.webp', 3, FALSE, 'subject'),

	-- Blessed Antoni Nowowiejski
	('blessed-antoni-nowowiejski', '/saints/pl/blessed-antoni-nowowiejski.webp', 1, TRUE, 'subject'),
	('blessed-antoni-nowowiejski', '/saints/pl/blessed-antoni-nowowiejski_2.webp', 2, FALSE, 'subject'),

	-- Blessed Michael Kozal
	('blessed-michael-kozal', '/saints/pl/blessed-michael-kozal.webp', 1, TRUE, 'subject'),
	('blessed-michael-kozal', '/saints/pl/blessed-michael-kozal_2.webp', 2, FALSE, 'subject'),

	-- Saint Albert Chmielowski
	('saint-albert-chmielowski', '/saints/pl/saint-albert-chmielowski.webp', 1, TRUE, 'subject'),
	('saint-albert-chmielowski', '/saints/pl/saint-albert-chmielowski_2.webp', 2, FALSE, 'subject'),

	-- Saint Zygmunt Gorazdowski
	('saint-zygmunt-gorazdowski', '/saints/pl/saint-zygmunt-gorazdowski.webp', 1, TRUE, 'subject'),
	('saint-zygmunt-gorazdowski', '/saints/pl/saint-zygmunt-gorazdowski_2.webp', 2, FALSE, 'subject'),

	-- Saint Otto of Bamberg
	('saint-otto-of-bamberg', '/saints/pl/saint-otto-of-bamberg.webp', 1, TRUE, 'subject'),
	('saint-otto-of-bamberg', '/saints/pl/saint-otto-of-bamberg_2.webp', 2, FALSE, 'subject'),

	-- Blessed Maria Teresia Ledóchowska
	('blessed-maria-teresia-ledochowska', '/saints/pl/blessed-maria-teresia-ledochowska.webp', 1, TRUE, 'subject'),
	('blessed-maria-teresia-ledochowska', '/saints/pl/blessed-maria-teresia-ledochowska_2.webp', 2, FALSE, 'subject'),

	-- Saint John of Dukla
	('saint-john-of-dukla', '/saints/pl/saint-john-of-dukla_matejko.webp', 1, TRUE, 'subject'),
	('saint-john-of-dukla', '/saints/pl/saint-john-of-dukla.webp', 2, FALSE, 'subject'),

	-- Saint Bruno Boniface of Querfurt
	('saint-bruno-boniface-of-querfurt', '/saints/pl/saint-bruno-boniface-of-querfurt.webp', 1, TRUE, 'subject'),
	('saint-bruno-boniface-of-querfurt', '/saints/pl/saint-bruno-boniface-of-querfurt_2.webp', 2, FALSE, 'subject'),

	-- Saint Andrzej Świerad
	('saint-andrzej-swierad', '/saints/pl/saint-andrzej-swierad_hadziewicz.webp', 1, TRUE, 'subject'),
	('saint-andrzej-swierad', '/saints/pl/saint-andrzej-swierad-&-saint-benedict-the-hermit.webp', 2, FALSE, 'subject'),

	-- Saint Benedict the Hermit
	('saint-benedict-the-hermit', '/saints/pl/saint-benedict-the-hermit.webp', 1, TRUE, 'subject'),

	-- Saint Simon of Lipnica
	('saint-simon-of-lipnica', '/saints/pl/saint-simon-of-lipnica.webp', 1, TRUE, 'subject'),
	('saint-simon-of-lipnica', '/saints/pl/saint-simon-of-lipnica_2.webp', 2, FALSE, 'subject'),

	-- Blessed Czesław
	('blessed-czeslaw', '/saints/pl/blessed-czeslaw_muszynski.webp', 1, TRUE, 'subject'),
	('blessed-czeslaw', '/saints/pl/blessed-czeslaw.webp', 2, FALSE, 'subject'),

	-- Saint Kinga
	('saint-kinga', '/saints/pl/saint-kinga_matejko.webp', 1, TRUE, 'subject'),
	('saint-kinga', '/saints/pl/saint-kinga_czarnic.webp', 2, FALSE, 'subject'),

	-- Saint Hyacinth
	('saint-hyacinth', '/saints/pl/saint-hyacinth_carracci.webp', 1, TRUE, 'subject'),
	('saint-hyacinth', '/saints/pl/saint-hyacinth.webp', 2, FALSE, 'subject'),
	('saint-hyacinth', '/saints/pl/saint-hyacinth_serre.webp', 3, FALSE, 'subject'),

	-- Blessed Maria Stella
	('blessed-maria-stella', '/saints/pl/blessed-maria-stella-&-her-ten-companions.webp', 1, TRUE, 'subject'),
	('blessed-maria-stella', '/saints/pl/blessed-maria-stella-&-her-ten-companions_2.webp', 2, FALSE, 'subject'),
	('blessed-maria-stella', '/saints/pl/blessed-maria-stella.webp', 3, FALSE, 'subject'),
	('blessed-maria-stella', '/saints/pl/blessed-maria-stella-&-her-ten-companions_3.webp', 4, FALSE, 'subject'),

	-- Saint Melchior Grodziecki
	('saint-melchior-grodziecki', '/saints/pl/saint-melchior-grodziecki.webp', 1, TRUE, 'subject'),

	-- Saint Zygmunt Szczęsny Feliński
	('saint-zygmunt-szczesny-felinski', '/saints/pl/saint-zygmunt-szczesny-felinski.webp', 1, TRUE, 'subject'),
	('saint-zygmunt-szczesny-felinski', '/saints/pl/saint-zygmunt-szczesny-felinski_2.webp', 2, FALSE, 'subject'),

	-- Saint Stanislaw Kostka
	('saint-stanislaw-kostka', '/saints/pl/saint-stanislaw-kostka.webp', 1, TRUE, 'subject'),
	('saint-stanislaw-kostka', '/saints/pl/saint-stanislaw-kostka_2.webp', 2, FALSE, 'subject'),

	-- Blessed John Beyzym
	('blessed-john-beyzym', '/saints/pl/blessed-john-beyzym.webp', 1, TRUE, 'subject'),

	-- Blessed Honorat Koźmiński
	('blessed-honorat-kozminski', '/saints/pl/blessed-honorat-kozminski.webp', 1, TRUE, 'subject'),
	('blessed-honorat-kozminski', '/saints/pl/blessed-honorat-kozminski_2.webp', 2, FALSE, 'subject'),

	-- Saint Hedwig of Poland
	('saint-hedwig-of-poland', '/saints/pl/saint-hedwig-of-poland_bacciarelli.webp', 1, TRUE, 'subject'),
	('saint-hedwig-of-poland', '/saints/pl/saint-hedwig-of-poland_simmler.webp', 2, FALSE, 'subject'),

	-- Saint Josef Bilczewski
	('saint-josef-bilczewski', '/saints/pl/saint-joseph-bilczewski.webp', 1, TRUE, 'subject'),
	('saint-josef-bilczewski', '/saints/pl/saint-joseph-bilczewski_2.webp', 2, FALSE, 'subject'),

	-- Saint Benedykt of Poland
	('saint-benedykt-of-poland', '/saints/pl/saints-benedykt-jan-mateusz-isaak-and-krystyn-the-first-martyrs-of-poland.webp', 1, TRUE, 'subject'),

	-- Saint Jan of Poland
	('saint-jan-of-poland', '/saints/pl/saints-benedykt-jan-mateusz-isaak-and-krystyn-the-first-martyrs-of-poland.webp', 1, TRUE, 'subject'),

	-- Saint Mateusz of Poland
	('saint-mateusz-of-poland', '/saints/pl/saints-benedykt-jan-mateusz-isaak-and-krystyn-the-first-martyrs-of-poland.webp', 1, TRUE, 'subject'),

	-- Saint Isaak of Poland
	('saint-isaak-of-poland', '/saints/pl/saints-benedykt-jan-mateusz-isaak-and-krystyn-the-first-martyrs-of-poland.webp', 1, TRUE, 'subject'),

	-- Saint Krystyn of Poland
	('saint-krystyn-of-poland', '/saints/pl/saints-benedykt-jan-mateusz-isaak-and-krystyn-the-first-martyrs-of-poland.webp', 1, TRUE, 'subject'),

	-- Blessed Karolina Kózkówna
	('blessed-karolina-kozkowna', '/saints/pl/blessed-karolina-kozkowna.webp', 1, TRUE, 'subject'),

	-- Saint Rafal Kalinowski
	('saint-rafal-kalinowski', '/saints/pl/saint-rafal-kalinowski.webp', 1, TRUE, 'subject'),

	-- Saint Barbara
	('saint-barbara', '/saints/pl/saint-barbara.webp', 1, TRUE, 'subject'),
	('saint-barbara', '/saints/pl/saint-barbara_ratgeb.webp', 2, FALSE, 'subject'),
	('saint-barbara', '/saints/pl/saint-barbara_requena.webp', 3, FALSE, 'subject')

) AS x (saint_slug, image_url, sort_order, is_primary, subject_role)
ON s.slug = x.saint_slug
JOIN images i ON i.image_url = x.image_url
ON CONFLICT (saint_id, image_id) DO NOTHING;

COMMIT;
