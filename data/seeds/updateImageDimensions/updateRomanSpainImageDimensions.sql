-- Dimensions extraites depuis le seed : ../genuflexio-api/data/seeds/Roman_Spain/seedRomanSpainImages.sql
-- Vérifier les chemins avant exécution.
BEGIN;

UPDATE images SET width = 1600, height = 1451 WHERE image_url = 'feasts/jesus-christ-the-eternal-high-priest.webp';
UPDATE images SET width = 1105, height = 1600 WHERE image_url = 'saints/es/saint-eulalia-of-merida_martyr.webp';
UPDATE images SET width = 1277, height = 1009 WHERE image_url = 'saints/es/saint-eulogius-of-cordoba_martyr.webp';
UPDATE images SET width = 477, height = 643 WHERE image_url = 'saints/es/saint-ezequiel-moreno.webp';
UPDATE images SET width = 320, height = 460 WHERE image_url = 'saints/es/saint-ferdinand.webp';
UPDATE images SET width = 1028, height = 1600 WHERE image_url = 'saints/es/saint-francis-borgia_cano.webp';
UPDATE images SET width = 247, height = 373 WHERE image_url = 'saints/es/saint-fructuosus.webp';
UPDATE images SET width = 435, height = 450 WHERE image_url = 'saints/es/saint-fructuous-augurius-eulogius-martyrdom.webp';
UPDATE images SET width = 1122, height = 1600 WHERE image_url = 'saints/es/saint-hermenegild_herrera.webp';
UPDATE images SET width = 709, height = 1049 WHERE image_url = 'saints/es/saint-ildephonsus-of-toledo_greco.webp';
UPDATE images SET width = 738, height = 1000 WHERE image_url = 'saints/es/saint-isidore-the-farmer.webp';
UPDATE images SET width = 1072, height = 1600 WHERE image_url = 'saints/es/saint-joaquina-vedruna.webp';
UPDATE images SET width = 1280, height = 1600 WHERE image_url = 'saints/es/saint-jose-de-anchieta.webp';
UPDATE images SET width = 663, height = 800 WHERE image_url = 'saints/es/saint-leander_murillo.webp';
UPDATE images SET width = 440, height = 620 WHERE image_url = 'saints/es/saint-maria-micaela-of-the-blessed-sacrament_madrazo.webp';
UPDATE images SET width = 647, height = 800 WHERE image_url = 'saints/es/saint-paschal-baylon.webp';
UPDATE images SET width = 1134, height = 1600 WHERE image_url = 'saints/es/saint-pelagius_martyr.webp';
UPDATE images SET width = 1317, height = 1600 WHERE image_url = 'saints/es/saint-peter-of-alcantara.webp';
UPDATE images SET width = 368, height = 492 WHERE image_url = 'saints/es/saint-peter-of-saint-joseph-de-betancur.webp';
UPDATE images SET width = 441, height = 614 WHERE image_url = 'saints/es/saint-soledad-torres-acosta.webp';
UPDATE images SET width = 495, height = 680 WHERE image_url = 'saints/es/saint-teresa-of-jesus-jornet-and-ibars.webp';
UPDATE images SET width = 876, height = 1228 WHERE image_url = 'saints/es/saint-thomas-of-villanova.webp';
COMMIT;
