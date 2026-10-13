-- Dimensions extraites depuis le seed : ./data/seeds/Roman_Portugal/seedRomanPortugalImages.sql
-- Vérifier les chemins avant exécution.
BEGIN;

UPDATE images SET width = 383, height = 527 WHERE image_url = '/saints/pt/blessed-bartholomew-of-the-martyrs_2.webp';
UPDATE images SET width = 1600, height = 1513 WHERE image_url = '/saints/pt/blessed-bartholomew-of-the-martyrs_andre.webp';
UPDATE images SET width = 319, height = 450 WHERE image_url = '/saints/pt/blessed-bartholomew-of-the-martyrs.webp';
UPDATE images SET width = 634, height = 928 WHERE image_url = '/saints/pt/blessed-goncalo-de-amarante_andre.webp';
UPDATE images SET width = 484, height = 633 WHERE image_url = '/saints/pt/blessed-goncalo-de-amarante.webp';
UPDATE images SET width = 538, height = 784 WHERE image_url = '/saints/pt/blessed-goncalo-de-lagos.webp';
UPDATE images SET width = 1121, height = 1600 WHERE image_url = '/saints/pt/blessed-inacio-de-azevedo_2.webp';
UPDATE images SET width = 988, height = 1296 WHERE image_url = '/saints/pt/blessed-inacio-de-azevedo_3.webp';
UPDATE images SET width = 747, height = 1005 WHERE image_url = '/saints/pt/blessed-inacio-de-azevedo.webp';
UPDATE images SET width = 474, height = 720 WHERE image_url = '/saints/pt/blessed-joan-of-portugal_goncalves.webp';
UPDATE images SET width = 490, height = 710 WHERE image_url = '/saints/pt/blessed-joan-of-portugal.webp';
UPDATE images SET width = 998, height = 1202 WHERE image_url = '/saints/pt/blessed-mafalda-of-portugal_holanda.webp';
UPDATE images SET width = 564, height = 800 WHERE image_url = '/saints/pt/blessed-mafalda-of-portugal.webp';
UPDATE images SET width = 980, height = 1580 WHERE image_url = '/saints/pt/blessed-sancha-of-portugal_holanda.webp';
UPDATE images SET width = 1160, height = 1386 WHERE image_url = '/saints/pt/blessed-theresa-of-portugal_holanda.webp';
UPDATE images SET width = 397, height = 593 WHERE image_url = '/saints/pt/saint-beatrice-of-silva_2.webp';
UPDATE images SET width = 677, height = 1016 WHERE image_url = '/saints/pt/saint-beatrice-of-silva_3.webp';
UPDATE images SET width = 546, height = 739 WHERE image_url = '/saints/pt/saint-beatrice-of-silva.webp';
UPDATE images SET width = 818, height = 1260 WHERE image_url = '/saints/pt/saint-francisco-marto.webp';
UPDATE images SET width = 1487, height = 1600 WHERE image_url = '/saints/pt/saint-gerald-of-braga_2.webp';
UPDATE images SET width = 1180, height = 1600 WHERE image_url = '/saints/pt/saint-gerald-of-braga.webp';
UPDATE images SET width = 1120, height = 1600 WHERE image_url = '/saints/pt/saint-jacinta-marto-&-lucia-santos.webp';
UPDATE images SET width = 1200, height = 1600 WHERE image_url = '/saints/pt/saint-jacinta-marto.webp';
UPDATE images SET width = 646, height = 932 WHERE image_url = '/saints/pt/saint-john-de-brito.webp';
UPDATE images SET width = 427, height = 616 WHERE image_url = '/saints/pt/saint-martin-of-dume_2.webp';
UPDATE images SET width = 720, height = 902 WHERE image_url = '/saints/pt/saint-martin-of-dume_3.webp';
UPDATE images SET width = 1187, height = 1600 WHERE image_url = '/saints/pt/saint-martin-of-dume.webp';
UPDATE images SET width = 275, height = 543 WHERE image_url = '/saints/pt/saint-nuno-of-saint-mary_2.webp';
UPDATE images SET width = 608, height = 660 WHERE image_url = '/saints/pt/saint-nuno-of-saint-mary.webp';
UPDATE images SET width = 896, height = 1600 WHERE image_url = '/saints/pt/saint-theotonius_goncalves_2.webp';
UPDATE images SET width = 555, height = 752 WHERE image_url = '/saints/pt/saint-theotonius_goncalves.webp';
COMMIT;
