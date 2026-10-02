BEGIN;

-- ==============
-- IMPORTANT SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-mary', 'Saint Mary (Blessed Virgin Mary)',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='NAZARETH'),
  NULL,
  (SELECT id FROM places WHERE code='NAZARETH')
  ),
(
  'saint-joseph', 'Saint Joseph',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL,
  NULL,
  (SELECT id FROM places WHERE code='NAZARETH')
),
(
  'saint-john-the-baptist', 'Saint John the Baptist',
  NULL, NULL, NULL, TRUE,
  30, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='JUDAEA'),
  (SELECT id FROM places WHERE code='MACHAERUS'),
  (SELECT id FROM places WHERE code='JUDAEA')
)
ON CONFLICT (slug) DO NOTHING;

-- EN (expanded)
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
(
  'saint-mary',
  'Saint Mary (Blessed Virgin Mary)',
  NULL,
  NULL,
  '1st century'
),
(
  'saint-joseph',
  'Saint Joseph',
  NULL,
  NULL,
  '1st century'
),
(
  'saint-john-the-baptist',
  'Saint John the Baptist',
  NULL,
  NULL,
  '1st century'
)
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- FR (expanded)
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
(
  'saint-mary',
  'Sainte Marie (Bienheureuse Vierge Marie)',
  NULL,
  NULL,
  'Ier siècle'
),
(
  'saint-joseph',
  'Saint Joseph',
  NULL,
  NULL,
  'Ier siècle'
),
(
  'saint-john-the-baptist',
  'Saint Jean-Baptiste',
  NULL,
  NULL,
  'Ier siècle'
)
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- LA (expanded)
INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
(
  'saint-mary',
  'Sancta Maria (Beata Virgo Maria)',
  NULL,
  NULL,
  'saec. I'
),
(
  'saint-joseph',
  'Sanctus Ioseph',
  NULL,
  NULL,
  'saec. I'
),
(
  'saint-john-the-baptist',
  'Sanctus Ioannes Baptista',
  NULL,
  NULL,
  'saec. I'
)
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;


-- ==============
-- JANUARY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-basil-the-great', 'Saint Basil the Great',
  330, NULL, NULL, TRUE,
  379, 1, 1, TRUE,
  4,
  (SELECT id FROM places WHERE code='CAESAREA_CAPPADOCIAE'),
  (SELECT id FROM places WHERE code='CAESAREA_CAPPADOCIAE'),
  (SELECT id FROM places WHERE code='CAESAREA_CAPPADOCIAE')
),
(
  'saint-gregory-nazianzen', 'Saint Gregory Nazianzen',
  329, NULL, NULL, TRUE,
  390, 1, 25, TRUE,
  4,
  (SELECT id FROM places WHERE code='ARIANZUS'),
  (SELECT id FROM places WHERE code='ARIANZUS'),
  (SELECT id FROM places WHERE code='ARIANZUS')
),
(
  'saint-raymond-of-penyafort', 'Saint Raymond of Penyafort',
  1175, NULL, NULL, TRUE,
  1275, 1, 6, FALSE,
  13,
  (SELECT id FROM places WHERE code='PENYAFORT'),
  (SELECT id FROM places WHERE code='BARCELONA'),
  (SELECT id FROM places WHERE code='BARCELONA')
),
(
  'saint-hilary-of-poitiers', 'Saint Hilary of Poitiers',
  310, NULL, NULL, TRUE,
  367, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='POITIERS'),
  (SELECT id FROM places WHERE code='POITIERS'),
  (SELECT id FROM places WHERE code='POITIERS')
),
(
  'saint-anthony-abbot', 'Saint Anthony, Abbot',
  251, 1, 12, TRUE,
  356, 1, 17, TRUE,
  4,
  (SELECT id FROM places WHERE code='HERAKLEOPOLIS_MAGNA'),
  (SELECT id FROM places WHERE code='MOUNT_COLZIM'),
  (SELECT id FROM places WHERE code='MOUNT_COLZIM')
),
(
  'saint-fabian-pope', 'Saint Fabian, Pope',
  178, NULL, NULL, TRUE,
  250, 1, 20, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-sebastian', 'Saint Sebastian',
  256, NULL, NULL, TRUE,
  288, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-agnes-of-rome', 'Saint Agnes of Rome',
  291, NULL, NULL, TRUE,
  304, 1, 21, TRUE,
  4,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-vincent-of-saragossa', 'Saint Vincent of Saragossa',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='HUESCA'),
  (SELECT id FROM places WHERE code='VALENCIA'),
  (SELECT id FROM places WHERE code='SARAGOSSA')
),
(
  'saint-francis-de-sales', 'Saint Francis de Sales',
  1567, 8, 22, FALSE,
  1622, 12, 28, FALSE,
  17,
  (SELECT id FROM places WHERE code='THORENS_GLIERES'),
  (SELECT id FROM places WHERE code='LYON'),
  (SELECT id FROM places WHERE code='ANNECY')
),
(
  'saint-paul-apostle', 'Saint Paul, Apostle',
  5, NULL, NULL, TRUE,
  65, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='TARSUS'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-timothy-of-ephesus', 'Saint Timothy of Ephesus',
  NULL, NULL, NULL, TRUE,
  97, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='LYSTRA'),
  (SELECT id FROM places WHERE code='EPHESUS'),
  (SELECT id FROM places WHERE code='EPHESUS')
),
(
  'saint-titus-of-crete', 'Saint Titus of Crete',
  NULL, NULL, NULL, TRUE,
  96, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='CRETE'),
  (SELECT id FROM places WHERE code='CRETE'),
  (SELECT id FROM places WHERE code='CRETE')
),
(
  'saint-angela-merici', 'Saint Angela Merici',
  1474, 3, 21, TRUE,
  1540, 1, 27, FALSE,
  16,
  (SELECT id FROM places WHERE code='DESENZANO_DEL_GARDA'),
  (SELECT id FROM places WHERE code='BRESCIA'),
  (SELECT id FROM places WHERE code='BRESCIA')
),
(
  'saint-thomas-aquinas', 'Saint Thomas Aquinas',
  1225, NULL, NULL, TRUE,
  1274, 3, 7, FALSE,
  13,
  (SELECT id FROM places WHERE code='ROCCASECCA'),
  (SELECT id FROM places WHERE code='FOSSANOVA_ABBEY'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-john-bosco', 'Saint John Bosco',
  1815, 8, 16, FALSE,
  1888, 1, 31, FALSE,
  19,
  (SELECT id FROM places WHERE code='BECCHI_CASTELNUOVO_DON_BOSCO'),
  (SELECT id FROM places WHERE code='TURIN'),
  (SELECT id FROM places WHERE code='TURIN')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-basil-the-great', 'Saint Basil the Great', 'Bishop and Doctor of the Church; one of the Cappadocian Fathers.', 'Basil of Caesarea was a 4th-century bishop, theologian and monastic reformer. His doctrinal works and pastoral writings deeply shaped Eastern and Western Christianity, especially on the Trinity and the Holy Spirit.', 'c. 330–379'),
('saint-gregory-nazianzen', 'Saint Gregory Nazianzen', 'Bishop and Doctor of the Church; theologian of the Trinity.', 'Gregory of Nazianzus, called “the Theologian,” is one of the great Cappadocian Fathers. His orations defended Nicene faith and clarified Trinitarian doctrine in the 4th century.', 'c. 329–390'),
('saint-raymond-of-penyafort', 'Saint Raymond of Penyafort', 'Dominican priest and canonist.', 'Raymond of Penyafort was a major medieval canon lawyer and Dominican friar. He helped compile canonical legislation and served the Church through preaching, governance and legal scholarship.', '1175–1275'),
('saint-hilary-of-poitiers', 'Saint Hilary of Poitiers', 'Bishop and Doctor of the Church; defender of Nicene orthodoxy.', 'Hilary was a 4th-century bishop who strongly opposed Arianism. His theological writings, especially on the Trinity, earned him recognition as a Doctor of the Church.', 'c. 310–367'),
('saint-anthony-abbot', 'Saint Anthony, Abbot', 'Desert father and pioneer of Christian monasticism.', 'Anthony withdrew to the Egyptian desert and became a spiritual father for generations of monks. His life, popularized by Athanasius, made him a foundational figure of Christian asceticism.', 'c. 251–356'),
('saint-fabian-pope', 'Saint Fabian, Pope', 'Early Church pope and martyr.', 'Fabian governed the Church of Rome in the 3rd century and is remembered for organizing ecclesial ministry in Rome. He died as a martyr during the Decian persecution.', '† 250'),
('saint-sebastian', 'Saint Sebastian', 'Roman martyr venerated since antiquity.', 'Sebastian is one of the best-known early martyrs of Rome. His cult spread widely in East and West, and he is traditionally invoked in times of plague and suffering.', '3rd century'),
('saint-agnes-of-rome', 'Saint Agnes of Rome', 'Virgin and martyr of Rome.', 'Agnes was a young Christian martyr of early 4th-century Rome. Revered for her fidelity and purity, she became one of the most beloved saints of the Roman Church.', '† c. 304'),
('saint-vincent-of-saragossa', 'Saint Vincent of Saragossa', 'Deacon and martyr in Hispania.', 'Vincent, a deacon from Saragossa, suffered martyrdom in Valencia during the Diocletianic persecution. His witness made him one of the great martyrs of the Iberian Church.', '† c. 304'),
('saint-francis-de-sales', 'Saint Francis de Sales', 'Bishop and Doctor of the Church.', 'Francis de Sales, bishop of Geneva, is renowned for his gentle spirituality and pastoral wisdom. His works, especially Introduction to the Devout Life, shaped modern Christian devotion.', '1567–1622'),
('saint-paul-apostle', 'Saint Paul the Apostle', 'Apostle to the Gentiles.', 'Paul of Tarsus, converted on the road to Damascus, became the great missionary of the early Church. His letters form a central part of the New Testament and Christian theology.', '1st century'),
('saint-timothy-of-ephesus', 'Saint Timothy of Ephesus', 'Disciple of Saint Paul; bishop of Ephesus.', 'Timothy accompanied Paul in missionary work and later led the Church of Ephesus. The Pastoral Epistles preserve Paul’s guidance for his ministry and leadership.', '1st century'),
('saint-titus-of-crete', 'Saint Titus of Crete', 'Companion of Saint Paul; bishop in Crete.', 'Titus was entrusted by Paul with organizing the Church in Crete. He is remembered as a faithful collaborator in apostolic mission and pastoral governance.', '1st century'),
('saint-angela-merici', 'Saint Angela Merici', 'Founder of the Ursulines.', 'Angela Merici dedicated her life to Christian formation of girls and young women. Her foundation became the Ursuline family, influential in education across the world.', '1474–1540'),
('saint-thomas-aquinas', 'Saint Thomas Aquinas', 'Priest and Doctor of the Church; major theologian.', 'Thomas Aquinas, Dominican friar and philosopher-theologian, integrated faith and reason with exceptional clarity. His Summa Theologiae remains a cornerstone of Catholic thought.', '1225–1274'),
('saint-john-bosco', 'Saint John Bosco', 'Priest and educator; founder of the Salesians.', 'John Bosco devoted his priestly life to poor and abandoned youth in Turin. His “preventive system” of education and pastoral charity inspired the Salesian mission worldwide.', '1815–1888')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-basil-the-great', 'Saint Basile le Grand', 'Évêque et docteur de l’Église, Père cappadocien.', 'Basile de Césarée, évêque du IVe siècle, est l’un des grands Pères de l’Église. Sa pensée théologique sur la Trinité et l’Esprit Saint, ainsi que son action pastorale et monastique, ont marqué durablement la tradition chrétienne.', 'v. 330–379'),
('saint-gregory-nazianzen', 'Saint Grégoire de Nazianze', 'Évêque et docteur de l’Église, grand théologien de la Trinité.', 'Surnommé « le Théologien », Grégoire de Nazianze a défendu la foi nicéenne face aux controverses ariennes. Ses discours théologiques ont joué un rôle majeur dans la formulation de la doctrine trinitaire.', 'v. 329–390'),
('saint-raymond-of-penyafort', 'Saint Raymond de Penyafort', 'Prêtre dominicain et canoniste.', 'Dominicain catalan, Raymond fut un grand juriste de l’Église médiévale. Il contribua à la codification du droit canonique et exerça un ministère de gouvernement, de prédication et de conseil.', '1175–1275'),
('saint-hilary-of-poitiers', 'Saint Hilaire de Poitiers', 'Évêque et docteur de l’Église, défenseur de la foi nicéenne.', 'Évêque au IVe siècle, Hilaire fut l’un des principaux opposants à l’arianisme en Occident. Ses écrits sur la Trinité lui ont valu le titre de docteur de l’Église.', 'v. 310–367'),
('saint-anthony-abbot', 'Saint Antoine, abbé', 'Père du désert et figure fondatrice du monachisme.', 'Antoine se retira dans le désert d’Égypte pour mener une vie d’ascèse et de prière. Son exemple, largement diffusé dans toute la chrétienté, en fit un modèle majeur de vie monastique.', 'v. 251–356'),
('saint-fabian-pope', 'Saint Fabien, pape', 'Pape de l’Église primitive et martyr.', 'Fabien gouverna l’Église de Rome au IIIe siècle. Il est mort martyr pendant la persécution de Dèce et demeure une figure importante de l’organisation de l’Église ancienne.', '† 250'),
('saint-sebastian', 'Saint Sébastien', 'Martyr romain vénéré depuis l’Antiquité.', 'Saint Sébastien est l’un des martyrs les plus connus de l’Église de Rome. Son culte s’est diffusé très tôt en Orient et en Occident.', 'IIIe siècle'),
('saint-agnes-of-rome', 'Sainte Agnès de Rome', 'Vierge et martyre de Rome.', 'Jeune martyre des premiers siècles, Agnès est honorée pour sa fidélité au Christ. Elle est l’une des saintes les plus aimées de la tradition romaine.', '† v. 304'),
('saint-vincent-of-saragossa', 'Saint Vincent de Saragosse', 'Diacre et martyr en Hispanie.', 'Diacre de Saragosse, Vincent subit le martyre à Valence lors des persécutions du début du IVe siècle. Sa mémoire s’est largement répandue dans l’Église latine.', '† v. 304'),
('saint-francis-de-sales', 'Saint François de Sales', 'Évêque et docteur de l’Église.', 'Évêque de Genève, François de Sales est célèbre pour sa douceur pastorale et sa spiritualité accessible à tous. Ses écrits, notamment l’Introduction à la vie dévote, ont eu une grande influence.', '1567–1622'),
('saint-paul-apostle', 'Saint Paul apôtre', 'Apôtre des nations.', 'Ancien persécuteur converti sur le chemin de Damas, Paul devint l’un des plus grands missionnaires de l’Église naissante. Ses lettres constituent une part essentielle du Nouveau Testament.', 'Ier siècle'),
('saint-timothy-of-ephesus', 'Saint Timothée d’Éphèse', 'Disciple de saint Paul, évêque d’Éphèse.', 'Timothée accompagna Paul dans son œuvre missionnaire et reçut la charge pastorale de l’Église d’Éphèse. La tradition le retient comme un pasteur fidèle de l’ère apostolique.', 'Ier siècle'),
('saint-titus-of-crete', 'Saint Tite de Crète', 'Compagnon de saint Paul, évêque en Crète.', 'Tite fut envoyé par Paul pour organiser les communautés chrétiennes de Crète. Il est honoré comme un collaborateur essentiel de la mission apostolique.', 'Ier siècle'),
('saint-angela-merici', 'Sainte Angèle Merici', 'Fondatrice des Ursulines.', 'Angèle Merici consacra sa vie à l’éducation chrétienne des jeunes filles. Son charisme donna naissance à la famille ursuline, marquante dans l’histoire de l’éducation.', '1474–1540'),
('saint-thomas-aquinas', 'Saint Thomas d’Aquin', 'Prêtre et docteur de l’Église, théologien majeur.', 'Religieux dominicain, Thomas d’Aquin a profondément marqué la théologie et la philosophie chrétiennes. Sa Somme théologique demeure une référence majeure de la pensée catholique.', '1225–1274'),
('saint-john-bosco', 'Saint Jean Bosco', 'Prêtre éducateur, fondateur des Salésiens.', 'Jean Bosco se dévoua à l’accueil et à la formation des jeunes pauvres de Turin. Son œuvre éducative et pastorale a donné naissance à la famille salésienne.', '1815–1888')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-basil-the-great', 'Sanctus Basilius Magnus', 'Episcopus et Ecclesiae doctor, unus ex Patribus Cappadocibus.', 'Basilius Caesariensis, episcopus saeculi IV, doctrina de Trinitate et de Spiritu Sancto necnon vita pastorali et monastica Ecclesiam valde formavit.', 'c. 330–379'),
('saint-gregory-nazianzen', 'Sanctus Gregorius Nazianzenus', 'Episcopus et Ecclesiae doctor, insignis theologus Trinitatis.', 'Gregorius, cognomento “Theologus”, fidem Nicaenam strenue defendit. Orationes eius ad doctrinam trinitariam in Ecclesia magni momenti fuerunt.', 'c. 329–390'),
('saint-raymond-of-penyafort', 'Sanctus Raymundus de Penyafort', 'Presbyter Ordinis Praedicatorum et canonista.', 'Raymundus, frater Praedicator, in iure canonico excelluit et Ecclesiae in regimine, praedicatione atque disciplina iuridica profuit.', '1175–1275'),
('saint-hilary-of-poitiers', 'Sanctus Hilarius Pictaviensis', 'Episcopus et Ecclesiae doctor, fidei Nicaenae defensor.', 'Hilarius Pictaviensis contra Arianos fortiter pugnavit. Scripta eius de Trinitate eum inter praecipuos doctores Ecclesiae collocant.', 'c. 310–367'),
('saint-anthony-abbot', 'Sanctus Antonius Abbas', 'Pater deserti et vitae monasticae exemplar.', 'Antonius in deserto Aegypti vitam asceticam duxit atque multos ad vitam monasticam inspiravit; ideo pater monachorum vocatur.', 'c. 251–356'),
('saint-fabian-pope', 'Sanctus Fabianus Papa', 'Papa Ecclesiae antiquae et martyr.', 'Fabianus Ecclesiam Romanam saeculo III rexit et in persecutione Deciana martyrium consummavit.', '† 250'),
('saint-sebastian', 'Sanctus Sebastianus', 'Martyr Romanus ab antiquis temporibus veneratus.', 'Sebastianus inter martyres Romanos celeberrimus est; cultus eius per totam Ecclesiam diffuse propagatus est.', 'saec. III'),
('saint-agnes-of-rome', 'Sancta Agnes Romana', 'Virgo et martyr Romana.', 'Agnes, iuvenis martyr, ob constantiam fidei et puritatem insigniter colitur in traditione Ecclesiae Romanae.', '† c. 304'),
('saint-vincent-of-saragossa', 'Sanctus Vincentius Caesaraugustanus', 'Diaconus et martyr in Hispania.', 'Vincentius diaconus martyrium Valentiae passus est et inter maximos martyres Hispaniae numeratur.', '† c. 304'),
('saint-francis-de-sales', 'Sanctus Franciscus Salesius', 'Episcopus et Ecclesiae doctor.', 'Franciscus Salesius, episcopus Genevensis, mansuetudine pastorali et scriptis spiritualibus claruit, praesertim in vita devota tradenda.', '1567–1622'),
('saint-paul-apostle', 'Sanctus Paulus Apostolus', 'Apostolus gentium.', 'Paulus, post conversionem Damascenam, Evangelium late annuntiavit; epistulae eius theologiae christianae fundamentum praebent.', 'saec. I'),
('saint-timothy-of-ephesus', 'Sanctus Timotheus Ephesius', 'Discipulus Sancti Pauli, episcopus Ephesi.', 'Timotheus socius Pauli in missione fuit et Ecclesiae Ephesi pastor constitutus est.', 'saec. I'),
('saint-titus-of-crete', 'Sanctus Titus Cretensis', 'Socius Sancti Pauli, episcopus in Creta.', 'Titus a Paulo ad ecclesias Cretenses ordinandas missus est et fidelis minister apostolicus habetur.', 'saec. I'),
('saint-angela-merici', 'Sancta Angela Merici', 'Fundatrix Ursulinarum.', 'Angela educationi christianae puellarum se dedicavit; ex eius charismate familia Ursulina orta est.', '1474–1540'),
('saint-thomas-aquinas', 'Sanctus Thomas Aquinas', 'Presbyter et Ecclesiae doctor, theologus praeclarus.', 'Thomas Aquinas, Ordinis Praedicatorum, fidem et rationem mirabiliter composuit; Summa Theologiae opus eius praecipuum est.', '1225–1274'),
('saint-john-bosco', 'Sanctus Ioannes Bosco', 'Presbyter educator, Fundator Salesianorum.', 'Ioannes Bosco iuvenibus pauperibus Taurini se tradidit; eius methodus educativa et caritas pastoralis per orbem fructum dederunt.', '1815–1888')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- FEBRUARY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-blaise', 'Saint Blaise',
  NULL, NULL, NULL, TRUE,
  316, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='SIVAS'),
  (SELECT id FROM places WHERE code='SIVAS')
),
(
  'saint-ansgar', 'Saint Ansgar',
  801, 9, 8, FALSE,
  865, 2, 3, FALSE,
  9,
  NULL,
  (SELECT id FROM places WHERE code='BREMEN'),
  NULL
),
(
  'saint-agatha', 'Saint Agatha',
  NULL, NULL, NULL, TRUE,
  251, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='CATANIA'),
  (SELECT id FROM places WHERE code='CATANIA'),
  (SELECT id FROM places WHERE code='CATANIA')
),
(
  'saint-paul-miki', 'Saint Paul Miki',
  1564, NULL, NULL, TRUE,
  1597, 2, 5, FALSE,
  16,
  (SELECT id FROM places WHERE code='OSAKA'),
  (SELECT id FROM places WHERE code='NAGASAKI'),
  (SELECT id FROM places WHERE code='JAPAN')
),
(
  'saint-jerome-emiliani', 'Saint Jerome Emiliani',
  1486, NULL, NULL, TRUE,
  1537, 2, 8, FALSE,
  16,
  (SELECT id FROM places WHERE code='VENICE'),
  (SELECT id FROM places WHERE code='SOMASCA'),
  (SELECT id FROM places WHERE code='SOMASCA')
),
(
  'saint-josephine-bakhita', 'Saint Josephine Bakhita',
  1869, NULL, NULL, TRUE,
  1947, 2, 8, FALSE,
  20,
  (SELECT id FROM places WHERE code='NYALA'),
  (SELECT id FROM places WHERE code='SCHIO'),
  (SELECT id FROM places WHERE code='SCHIO')
),
(
  'saint-scholastica', 'Saint Scholastica',
  480, NULL, NULL, TRUE,
  547, 2, 10, TRUE,
  6,
  (SELECT id FROM places WHERE code='NURSIA'),
  (SELECT id FROM places WHERE code='MONTECASSINO'),
  (SELECT id FROM places WHERE code='MONTECASSINO')
),
(
  'saint-cyril', 'Saint Cyril',
  826, NULL, NULL, TRUE,
  869, 2, 14, FALSE,
  9,
  (SELECT id FROM places WHERE code='THESSALONICA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='NITRA')
),
(
  'saint-methodius', 'Saint Methodius',
  815, NULL, NULL, TRUE,
  885, 4, 6, FALSE,
  9,
  (SELECT id FROM places WHERE code='THESSALONICA'),
  (SELECT id FROM places WHERE code='STARE_MESTO'),
  (SELECT id FROM places WHERE code='NITRA')
),
(
  'saint-peter-damian', 'Saint Peter Damian',
  1007, NULL, NULL, TRUE,
  1072, 2, 22, TRUE,
  11,
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='FAENZA'),
  (SELECT id FROM places WHERE code='FONTE_AVELLANA')
),
(
  'saint-polycarp', 'Saint Polycarp',
  69, NULL, NULL, TRUE,
  155, NULL, NULL, TRUE,
  2,
  NULL,
  (SELECT id FROM places WHERE code='SMYRNA'),
  (SELECT id FROM places WHERE code='SMYRNA')
),
(
  'saint-gregory-of-narek', 'Saint Gregory of Narek',
  951, NULL, NULL, TRUE,
  1003, NULL, NULL, TRUE,
  10,
  NULL,
  (SELECT id FROM places WHERE code='NAREK'),
  (SELECT id FROM places WHERE code='NAREK')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-blaise', 'Saint Blaise', 'Bishop and martyr venerated in the East and West.', 'Blaise is traditionally remembered as bishop of Sebaste and martyr. His cult spread widely, especially through the blessing of throats on his feast day.', '4th century'),
('saint-ansgar', 'Saint Ansgar', 'Missionary bishop, apostle of the North.', 'Ansgar evangelized in Scandinavia and became archbishop of Hamburg-Bremen. He is remembered for founding missions and enduring hardship for the Gospel.', '801–865'),
('saint-agatha', 'Saint Agatha', 'Virgin and martyr of Sicily.', 'Agatha, one of the most beloved early martyrs, witnessed faithfully to Christ in persecution. Her cult became universal very early in the Church.', '3rd century'),
('saint-paul-miki', 'Saint Paul Miki', 'Jesuit martyr of Japan.', 'Paul Miki and his companions were martyred at Nagasaki. Their witness remains central in the history of Christianity in Japan.', '1564–1597'),
('saint-jerome-emiliani', 'Saint Jerome Emiliani', 'Priest, founder devoted to abandoned children.', 'A Venetian noble turned priest, Jerome dedicated himself to orphans and the poor, and founded the Somascan Fathers.', '1486–1537'),
('saint-josephine-bakhita', 'Saint Josephine Bakhita', 'Former slave, religious sister, witness of hope.', 'Born in Sudan, Bakhita endured slavery before finding freedom and religious life in Italy. She is a modern witness of forgiveness and dignity.', 'c. 1869–1947'),
('saint-scholastica', 'Saint Scholastica', 'Virgin, sister of Saint Benedict.', 'Scholastica is venerated as a model of monastic prayer and charity. Tradition remembers her spiritual bond with her brother Benedict.', 'c. 480–543'),
('saint-cyril', 'Saint Cyril', 'Monk and missionary, co-patron of Europe.', 'Cyril, with Methodius, evangelized the Slavs and helped develop the Slavic liturgical tradition.', 'c. 826–869'),
('saint-methodius', 'Saint Methodius', 'Bishop and missionary among Slavs.', 'Brother and companion of Cyril, Methodius continued the Slavic mission and defended the use of local language in liturgy.', 'c. 815–885'),
('saint-peter-damian', 'Saint Peter Damian', 'Bishop and Doctor of the Church, reformer.', 'Peter Damian was a leading figure of 11th-century Church reform, combining ascetic life, scholarship and service to ecclesial unity.', 'c. 1007–1072'),
('saint-polycarp', 'Saint Polycarp', 'Bishop and martyr, apostolic father.', 'Polycarp of Smyrna, disciple of the Apostle John according to tradition, gave heroic witness in martyrdom and remains a key early Christian figure.', 'c. 69–155'),
('saint-gregory-of-narek', 'Saint Gregory of Narek', 'Monk and Doctor of the Church in the Armenian tradition.', 'Gregory, monk and mystic, is renowned for the Book of Lamentations and his profound spiritual theology.', 'c. 951–1003')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-blaise', 'Saint Blaise', 'Évêque et martyr vénéré en Orient et en Occident.', 'Saint Blaise est traditionnellement honoré comme évêque de Sébaste et martyr. Son culte s’est largement diffusé, notamment par la bénédiction des gorges.', 'IVe siècle'),
('saint-ansgar', 'Saint Anschaire', 'Évêque missionnaire, apôtre du Nord.', 'Anschaire évangélisa la Scandinavie et devint archevêque de Hambourg-Brême. Il reste une figure majeure de l’évangélisation des peuples du Nord.', '801–865'),
('saint-agatha', 'Sainte Agathe', 'Vierge et martyre de Sicile.', 'Sainte Agathe, l’une des grandes martyres antiques, est honorée pour sa fidélité au Christ au temps des persécutions.', 'IIIe siècle'),
('saint-paul-miki', 'Saint Paul Miki', 'Martyr jésuite au Japon.', 'Paul Miki et ses compagnons furent martyrisés à Nagasaki. Leur témoignage demeure central dans l’histoire chrétienne japonaise.', '1564–1597'),
('saint-jerome-emiliani', 'Saint Jérôme Emilien', 'Prêtre, fondateur au service des orphelins.', 'Noble vénitien devenu prêtre, Jérôme se consacra aux enfants abandonnés et fonda les Somasques.', '1486–1537'),
('saint-josephine-bakhita', 'Sainte Joséphine Bakhita', 'Ancienne esclave, religieuse, témoin d’espérance.', 'Née au Soudan, Bakhita connut l’esclavage avant de trouver la liberté et la vie religieuse en Italie. Elle est un signe moderne de pardon et de dignité.', 'v. 1869–1947'),
('saint-scholastica', 'Sainte Scholastique', 'Vierge, sœur de saint Benoît.', 'Scholastique est honorée comme modèle de prière monastique et de charité fraternelle dans la tradition bénédictine.', 'v. 480–543'),
('saint-cyril', 'Saint Cyrille', 'Moine missionnaire, copatron de l’Europe.', 'Cyrille, avec Méthode, annonça l’Évangile aux Slaves et contribua à la tradition liturgique slave.', 'v. 826–869'),
('saint-methodius', 'Saint Méthode', 'Évêque missionnaire des Slaves.', 'Frère et collaborateur de Cyrille, Méthode poursuivit l’œuvre missionnaire et défendit l’usage des langues locales dans la liturgie.', 'v. 815–885'),
('saint-peter-damian', 'Saint Pierre Damien', 'Évêque et docteur de l’Église, réformateur.', 'Pierre Damien fut une figure majeure de la réforme ecclésiale au XIe siècle, alliant vie ascétique, science théologique et service de l’unité.', 'v. 1007–1072'),
('saint-polycarp', 'Saint Polycarpe', 'Évêque et martyr, Père apostolique.', 'Polycarpe de Smyrne, disciple de saint Jean selon la tradition, donna un témoignage exemplaire dans le martyre.', 'v. 69–155'),
('saint-gregory-of-narek', 'Saint Grégoire de Narek', 'Moine et docteur de l’Église dans la tradition arménienne.', 'Grégoire de Narek est célèbre pour le Livre des Lamentations et sa théologie spirituelle profonde.', 'v. 951–1003')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-blaise', 'Sanctus Blasius', 'Episcopus et martyr in Oriente et Occidente veneratus.', 'Sanctus Blasius ut episcopus Sebastensis et martyr traditur. Cultus eius late diffusus est, praesertim per benedictionem gutturis.', 'saec. IV'),
('saint-ansgar', 'Sanctus Ansgarius', 'Episcopus missionarius, apostolus Septentrionis.', 'Ansgarius in Scandinavia evangelizavit atque archiepiscopus Hamburgensis-Bremensis factus est. Inter praecipuos missionarios numeratur.', '801–865'),
('saint-agatha', 'Sancta Agatha', 'Virgo et martyr Sicula.', 'Sancta Agatha inter clarissimas martyres antiquitatis habetur, ob constantiam fidei in persecutione.', 'saec. III'),
('saint-paul-miki', 'Sanctus Paulus Miki', 'Martyr e Societate Iesu in Iaponia.', 'Paulus Miki cum sociis Nagasakii martyrium subiit; eorum testimonium in historia Ecclesiae Iaponicae eminenter manet.', '1564–1597'),
('saint-jerome-emiliani', 'Sanctus Hieronymus Aemilianus', 'Presbyter, fundator pro orphanis et pauperibus.', 'Hieronymus Aemilianus, Venetus nobilis ad sacerdotium conversus, orphanis et egenis se dedicavit atque Somascos fundavit.', '1486–1537'),
('saint-josephine-bakhita', 'Sancta Iosephina Bakhita', 'Olim serva, postea religiosa, spei testis.', 'Nata in Sudania, servitutem passa est; in Italia libertatem et vitam religiosam invenit, signum reconciliationis et dignitatis humanae facta.', 'c. 1869–1947'),
('saint-scholastica', 'Sancta Scholastica', 'Virgo, soror Sancti Benedicti.', 'Scholastica in traditione monastica tamquam exemplar orationis et caritatis recolitur.', 'c. 480–543'),
('saint-cyril', 'Sanctus Cyrillus', 'Monachus missionarius, co-patronus Europae.', 'Cyrillus cum Methodio Slavos evangelizavit et traditioni liturgicae Slavicae fundamenta dedit.', 'c. 826–869'),
('saint-methodius', 'Sanctus Methodius', 'Episcopus missionarius inter Slavos.', 'Frater et socius Cyrilli, Methodius opus missionarium continuavit atque usum linguae vernaculae in liturgia defendit.', 'c. 815–885'),
('saint-peter-damian', 'Sanctus Petrus Damiani', 'Episcopus et Ecclesiae doctor, reformator.', 'Petrus Damiani in reformatione Ecclesiae saeculi XI primas partes egit, vitam asceticam cum doctrina et ministerio coniungens.', 'c. 1007–1072'),
('saint-polycarp', 'Sanctus Polycarpus', 'Episcopus et martyr, pater apostolicus.', 'Polycarpus Smyrnensis, secundum traditionem discipulus Ioannis Apostoli, in martyrio clarum fidei testimonium dedit.', 'c. 69–155'),
('saint-gregory-of-narek', 'Sanctus Gregorius Narekensis', 'Monachus et Ecclesiae doctor in traditione Armena.', 'Gregorius Narekensis ob Librum Lamentationum et altam theologiam spiritualem in Ecclesia honoratur.', 'c. 951–1003')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- MARCH SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-casimir', 'Saint Casimir',
  1458, 10, 3, FALSE,
  1484, 3, 4, FALSE,
  15,
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='GRODNO'),
  (SELECT id FROM places WHERE code='VILNIUS')
),
(
  'saint-perpetua', 'Saint Perpetua',
  182, NULL, NULL, TRUE,
  203, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE')
),
(
  'saint-felicity', 'Saint Felicity',
  182, NULL, NULL, TRUE,
  203, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE')
),
(
  'saint-john-of-god', 'Saint John of God',
  1495, 3, 8, TRUE,
  1550, 3, 8, FALSE,
  16,
  (SELECT id FROM places WHERE code='MONTEMOR_O_NOVO'),
  (SELECT id FROM places WHERE code='GRANADA'),
  (SELECT id FROM places WHERE code='GRANADA')
),
(
  'saint-frances-of-rome', 'Saint Frances of Rome',
  1384, NULL, NULL, TRUE,
  1440, 3, 9, FALSE,
  15,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-patrick', 'Saint Patrick',
  385, NULL, NULL, TRUE,
  460, NULL, NULL, TRUE,
  5,
  NULL,
  (SELECT id FROM places WHERE code='DOWNPATRICK'),
  (SELECT id FROM places WHERE code='IRELAND')
),
(
  'saint-cyril-of-jerusalem', 'Saint Cyril of Jerusalem',
  313, NULL, NULL, TRUE,
  386, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
-- (
--   'saint-joseph-spouse-of-mary', 'Saint Joseph, Spouse of Mary',
--   NULL, NULL, NULL, TRUE,
--   NULL, NULL, NULL, TRUE,
--   1,
--   NULL, NULL,
--   (SELECT id FROM places WHERE code='NAZARETH')
-- ),
(
  'saint-turibius-of-mogrovejo', 'Saint Turibius of Mogrovejo',
  1538, 11, 16, FALSE,
  1606, 3, 23, FALSE,
  17,
  (SELECT id FROM places WHERE code='MAYORGA'),
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='ZANA')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-casimir', 'Saint Casimir', 'Prince of Poland and Lithuania, model of Christian virtue.', 'Casimir, known for charity and purity of life, is venerated as a patron of Poland and Lithuania.', '1458–1484'),
('saint-perpetua', 'Saint Perpetua', 'Martyr of Carthage.', 'Perpetua, together with Felicity and companions, gave one of the earliest and most moving testimonies of martyrdom in the early Church.', '† 203'),
('saint-felicity', 'Saint Felicity', 'Martyr of Carthage.', 'Felicity, martyred with Perpetua, is remembered for steadfast faith under persecution.', '† 203'),
('saint-john-of-god', 'Saint John of God', 'Religious founder dedicated to the sick and poor.', 'John of God founded a path of hospital charity and care for the vulnerable, inspiring the Hospitaller tradition.', '1495–1550'),
('saint-frances-of-rome', 'Saint Frances of Rome', 'Wife, mother, and religious; witness of charity.', 'Frances of Rome lived holy marriage and later religious life, serving the poor and the sick in the city of Rome.', '1384–1440'),
('saint-patrick', 'Saint Patrick', 'Missionary bishop and patron of Ireland.', 'Patrick evangelized Ireland and remains one of the most beloved missionary saints in Christian tradition.', 'c. 385–461'),
('saint-cyril-of-jerusalem', 'Saint Cyril of Jerusalem', 'Bishop and Doctor of the Church.', 'Cyril is especially known for his catechetical instructions and his defense of orthodox faith in Jerusalem.', 'c. 315–386'),
-- ('saint-joseph-spouse-of-mary', 'Saint Joseph, Spouse of Mary', 'Spouse of the Blessed Virgin Mary, guardian of Jesus.', 'Joseph is honored as foster-father of Christ, patron of the universal Church and model of obedience and quiet fidelity.', '1st century'),
('saint-turibius-of-mogrovejo', 'Saint Turibius of Mogrovejo', 'Archbishop and missionary pastor in Peru.', 'Turibius reformed church life in the New World, defended indigenous peoples and promoted evangelization with great zeal.', '1538–1606')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-casimir', 'Saint Casimir', 'Prince de Pologne et de Lituanie, modèle de vertu chrétienne.', 'Casimir est honoré pour sa charité et sa pureté de vie; il est patron de la Pologne et de la Lituanie.', '1458–1484'),
('saint-perpetua', 'Sainte Perpétue', 'Martyre de Carthage.', 'Perpétue, avec Félicité et leurs compagnons, a donné l’un des plus anciens témoignages de martyre de l’Église ancienne.', '† 203'),
('saint-felicity', 'Sainte Félicité', 'Martyre de Carthage.', 'Félicité, martyre avec Perpétue, est vénérée pour sa constance dans la foi.', '† 203'),
('saint-john-of-god', 'Saint Jean de Dieu', 'Religieux fondateur au service des malades et des pauvres.', 'Jean de Dieu a inspiré la tradition hospitalière chrétienne par son engagement envers les plus fragiles.', '1495–1550'),
('saint-frances-of-rome', 'Sainte Françoise de Rome', 'Épouse, mère et religieuse, témoin de charité.', 'Françoise de Rome a vécu la sainteté dans le mariage puis dans la vie religieuse, au service des pauvres et des malades.', '1384–1440'),
('saint-patrick', 'Saint Patrick', 'Évêque missionnaire et patron de l’Irlande.', 'Patrick évangélisa l’Irlande et demeure l’une des figures missionnaires les plus célèbres de l’Église.', 'v. 385–461'),
('saint-cyril-of-jerusalem', 'Saint Cyrille de Jérusalem', 'Évêque et docteur de l’Église.', 'Cyrille est connu pour ses catéchèses baptismales et sa défense de la foi orthodoxe à Jérusalem.', 'v. 315–386'),
-- ('saint-joseph-spouse-of-mary', 'Saint Joseph, époux de Marie', 'Époux de la Vierge Marie, gardien de Jésus.', 'Joseph est honoré comme père nourricier du Christ, patron de l’Église universelle et modèle de fidélité silencieuse.', 'Ier siècle'),
('saint-turibius-of-mogrovejo', 'Saint Turibe de Mogrovejo', 'Archevêque missionnaire au Pérou.', 'Turibe renouvela la vie de l’Église au Pérou, défendit les peuples autochtones et promut l’évangélisation.', '1538–1606')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-casimir', 'Sanctus Casimirus', 'Princeps Poloniae et Lituaniae, exemplar virtutis christianae.', 'Casimirus propter caritatem et puritatem vitae celebratur; inter patronos Poloniae et Lituaniae numeratur.', '1458–1484'),
('saint-perpetua', 'Sancta Perpetua', 'Martyr Carthaginensis.', 'Perpetua cum Felicitate et sociis inter priscos martyrii testes eminuit.', '† 203'),
('saint-felicity', 'Sancta Felicitas', 'Martyr Carthaginensis.', 'Felicitas, una cum Perpetua passa, ob constantiam fidei veneratur.', '† 203'),
('saint-john-of-god', 'Sanctus Ioannes a Deo', 'Religiosus fundator in servitio infirmorum et pauperum.', 'Ioannes a Deo opere hospitali christiano novum impulsum dedit atque misericordiae exemplar praebuit.', '1495–1550'),
('saint-frances-of-rome', 'Sancta Francisca Romana', 'Uxor, mater et religiosa, caritatis testis.', 'Francisca Romana sanctitatem in vita coniugali et religiosa coniunxit, pauperibus atque aegrotis serviens.', '1384–1440'),
('saint-patrick', 'Sanctus Patricius', 'Episcopus missionarius et patronus Hiberniae.', 'Patricius Hiberniam evangelizavit et inter maximos missionarios Ecclesiae habetur.', 'c. 385–461'),
('saint-cyril-of-jerusalem', 'Sanctus Cyrillus Hierosolymitanus', 'Episcopus et Ecclesiae doctor.', 'Cyrillus catechesibus suis notissimus est et fidem orthodoxam Hierosolymis strenue defendit.', 'c. 315–386'),
-- ('saint-joseph-spouse-of-mary', 'Sanctus Ioseph, Sponsus Mariae', 'Sponsus Beatae Mariae Virginis, custos Iesu.', 'Ioseph tamquam pater nutritius Christi et patronus Ecclesiae universalis colitur.', 'saec. I'),
('saint-turibius-of-mogrovejo', 'Sanctus Turibius de Mogrovejo', 'Archiepiscopus missionarius in Peruvia.', 'Turibius vitam ecclesialem in Novo Orbe reformavit et evangelizationem cum zelo promovit.', '1538–1606')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- APRIL SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-francis-of-paola', 'Saint Francis of Paola',
  1416, 3, 27, FALSE,
  1507, 4, 2, FALSE,
  16,
  (SELECT id FROM places WHERE code='PAOLA'),
  (SELECT id FROM places WHERE code='PLESSIS_LEZ_TOURS'),
  (SELECT id FROM places WHERE code='PAOLA')
),
(
  'saint-isidore', 'Saint Isidore',
  560, NULL, NULL, TRUE,
  636, 4, 4, FALSE,
  7,
  (SELECT id FROM places WHERE code='CARTAGENA'),
  (SELECT id FROM places WHERE code='SEVILLE'),
  (SELECT id FROM places WHERE code='SEVILLE')
),
(
  'saint-vincent-ferrer', 'Saint Vincent Ferrer',
  1350, 1, 23, FALSE,
  1419, 4, 5, FALSE,
  15,
  (SELECT id FROM places WHERE code='VALENCIA'),
  (SELECT id FROM places WHERE code='VANNES'),
  NULL
),
(
  'saint-john-baptist-de-la-salle', 'Saint John Baptist de La Salle',
  1651, 4, 30, FALSE,
  1719, 4, 7, FALSE,
  18,
  (SELECT id FROM places WHERE code='REIMS'),
  (SELECT id FROM places WHERE code='ROUEN'),
  (SELECT id FROM places WHERE code='REIMS')
),
(
  'saint-stanislaus', 'Saint Stanislaus',
  1030, 7, 26, TRUE,
  1079, 4, 11, FALSE,
  11,
  (SELECT id FROM places WHERE code='SZCZEPANOW'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-martin-i', 'Saint Martin I',
  600, NULL, NULL, TRUE,
  655, 9, 16, TRUE,
  7,
  (SELECT id FROM places WHERE code='TODI'),
  (SELECT id FROM places WHERE code='CHERSON'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-anselm', 'Saint Anselm',
  1033, NULL, NULL, TRUE,
  1109, 4, 21, FALSE,
  12,
  (SELECT id FROM places WHERE code='AOSTA'),
  (SELECT id FROM places WHERE code='CANTERBURY'),
  (SELECT id FROM places WHERE code='CANTERBURY')
),
(
  'saint-george', 'Saint George',
  275, NULL, NULL, TRUE,
  303, 4, 23, FALSE,
  4,
  (SELECT id FROM places WHERE code='KAYSERI'),
  (SELECT id FROM places WHERE code='IZMIT'),
  (SELECT id FROM places WHERE code='IZMIT')
),
(
  'saint-adalbert', 'Saint Adalbert',
  956, NULL, NULL, TRUE,
  997, 4, 23, FALSE,
  10,
  (SELECT id FROM places WHERE code='LIBICE_NAD_CIDLINOU'),
  (SELECT id FROM places WHERE code='ELBLAG'),
  (SELECT id FROM places WHERE code='PRAGUE')
),
(
  'saint-fidelis-of-sigmaringen', 'Saint Fidelis of Sigmaringen',
  1578, 10, 1, TRUE,
  1622, 4, 24, FALSE,
  17,
  (SELECT id FROM places WHERE code='SIGMARINGEN'),
  (SELECT id FROM places WHERE code='SEEWIS_IM_PRATTIGAU'),
  (SELECT id FROM places WHERE code='CHUR')
),
(
  'saint-mark-evangelist', 'Saint Mark the Evangelist',
  12, NULL, NULL, TRUE,
  68, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-peter-chanel', 'Saint Peter Chanel',
  1803, 7, 12, FALSE,
  1841, 4, 28, FALSE,
  19,
  (SELECT id FROM places WHERE code='CUET'),
  (SELECT id FROM places WHERE code='FUTUNA'),
  (SELECT id FROM places WHERE code='FUTUNA')
),
(
  'saint-louis-grignion-de-montfort', 'Saint Louis Grignion de Montfort',
  1673, 1, 31, FALSE,
  1716, 4, 28, FALSE,
  18,
  (SELECT id FROM places WHERE code='MONTFORT_SUR_MEU'),
  (SELECT id FROM places WHERE code='SAINT_LAURENT_SUR_SEVRE'),
  (SELECT id FROM places WHERE code='BRITTANY')
),
(
  'saint-catherine-of-siena', 'Saint Catherine of Siena',
  1347, 3, 25, FALSE,
  1380, 4, 29, FALSE,
  14,
  (SELECT id FROM places WHERE code='SIENA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='SIENA')
),
(
  'saint-pius-v', 'Saint Pius V',
  1504, 1, 17, FALSE,
  1572, 5, 1, FALSE,
  16,
  (SELECT id FROM places WHERE code='BOSCO_MARENGO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-of-paola', 'Saint Francis of Paola', 'Hermit and founder of the Order of Minims.', 'Francis of Paola founded the Order of Minims, a congregation committed to a life of humility, penance and service. He was known for his austere asceticism, charity toward the poor, and numerous accounts of pastoral counsel and miracles that spread his reputation across Italy and beyond.', '1416–1507'),
('saint-isidore', 'Saint Isidore of Seville', 'Bishop, scholar and Doctor of the Church.', 'Isidore of Seville was one of the great intellectual figures of the early Middle Ages. As bishop, compiler and teacher, he preserved and systematized much classical and ecclesiastical knowledge for the Latin West; his encyclopedic works, especially the Etymologiae, were used as reference texts for centuries.', 'c. 560–636'),
('saint-vincent-ferrer', 'Saint Vincent Ferrer', 'Dominican preacher and missionary renowned for evangelization and sermons.', 'Vincent Ferrer was a Dominican friar whose preaching drew large crowds across Europe. He labored for the reform of clergy and laity alike and was celebrated for his zeal in preaching, pastoral care, and missionary journeys. Later tradition attributes many conversions and miracles to his ministry.', '1350–1419'),
('saint-john-baptist-de-la-salle', 'Saint John Baptist de La Salle', 'Priest, educational pioneer and founder of the Institute of the Brothers of the Christian Schools.', 'John Baptist de La Salle devoted his life to the education of poor and abandoned boys in France. He introduced systematic teacher training, classroom methods suited to popular education, and founded a religious institute of lay brothers dedicated to schooling and formation. His work laid the foundation for modern Catholic education.', '1651–1719'),
('saint-stanislaus', 'Saint Stanislaus of Szczepanów', 'Bishop and martyr, patron of Poland and Kraków.', 'Stanislaus was bishop of Kraków and is remembered for his pastoral courage and defense of ecclesiastical rights. Conflict with the reigning monarch culminated in his murder during a confrontation; his death became a symbol of resistance to royal abuses and he was venerated as a martyr and patron of Poland.', '1030–1079'),
('saint-martin-i', 'Saint Martin I', 'Pope and confessor; opponent of Monothelitism.', 'Martin I was pope in a turbulent era and strongly opposed the Monothelite doctrine. For his firm stance he was arrested by imperial authorities, brought to Constantinople, tried, and ultimately exiled, where he died. His courage in defense of orthodox Christology earned him lasting esteem.', '† 655'),
('saint-anselm', 'Saint Anselm of Canterbury', 'Philosopher-theologian and Archbishop of Canterbury.', 'Anselm is among the foremost medieval theologians. As archbishop he worked for ecclesial reform and pastoral care; as a scholar he produced influential theological arguments, including the ontological argument for God''s existence and careful treatments of atonement and faith seeking understanding. His works deeply shaped scholastic theology.', '1033–1109'),
('saint-george', 'Saint George', 'Martyr and warrior-saint widely venerated in East and West.', 'Saint George is celebrated in Christian tradition as a martyr and soldier who bore witness to the faith. Although historical details are sparse and wrapped in legend, his cult became widespread and his image as a defender of the Christian people made him an enduring patron figure in many lands.', '† c. 303'),
('saint-adalbert', 'Saint Adalbert of Prague', 'Bishop, missionary and martyr among the Baltic peoples.', 'Adalbert was a Polish-Bohemian bishop and missionary who labored to evangelize the peoples of Central and Eastern Europe. After efforts in his episcopal see and missionary journeys, he was martyred while evangelizing the Prussians and is honored as a patron and missionary martyr.', 'c. 956–997'),
('saint-fidelis-of-sigmaringen', 'Saint Fidelis of Sigmaringen', 'Capuchin friar and martyr of the Counter-Reformation era.', 'Fidelis of Sigmaringen entered the Capuchin Order and became noted for his preaching and pastoral zeal in regions afflicted by religious conflict. In 1622, while engaged in missionary work among Protestant communities, he was attacked and killed; his martyrdom was later recognized and he is venerated as a model of dedication to reconciliation and pastoral courage.', '1578–1622'),
('saint-mark-evangelist', 'Saint Mark the Evangelist', 'Author of the second Gospel and founder of the Church of Alexandria (trad.).', 'Tradition attributes to Mark the authorship of the Gospel that bears his name and credits him with founding the Christian community in Alexandria. His Gospel, drawn from apostolic sources and missionary memory, became a foundational text for the early Church and remains central to Christian proclamation.', '† c. 68'),
('saint-peter-chanel', 'Saint Peter Chanel', 'Marist missionary, catechist and martyr in Oceania.', 'Peter Chanel joined the Marist Fathers and volunteered for mission in the South Pacific. Stationed on the island of Futuna, he labored with humility among the islanders, teaching and serving the sick. In 1841 he suffered martyrdom, and his witness became instrumental in the later widespread Christianization of the islands.', '1803–1841'),
('saint-louis-grignion-de-montfort', 'Saint Louis Grignion de Montfort', 'Priest, Marian theologian and founder of a missionary family.', 'Louis Grignion de Montfort is known for his strong Marian devotion and missionary activity among the poor. His writings, notably on total consecration to Mary, influenced Catholic spirituality and fostered renewed devotion and apostolic zeal. He founded congregations devoted to education, mission and pastoral care.', '1673–1716'),
('saint-catherine-of-siena', 'Saint Catherine of Siena', 'Dominican tertiary, mystic and Doctor of the Church.', 'Catherine of Siena combined intense mystical prayer with active ministry in service to the Church and the poor. She is remembered for her letters, spiritual counsel to leaders, and a decisive role in persuading the papacy to return from Avignon to Rome. Her witness of charity, asceticism and theological insight earned her the title Doctor of the Church.', '1347–1380'),
('saint-pius-v', 'Saint Pius V', 'Dominican pope, reformer and promoter of Tridentine discipline.', 'Pius V, a Dominican friar before his election to the papacy, played a major role in implementing the reforms of the Council of Trent. He promoted liturgical and disciplinary uniformity, encouraged moral reform of the clergy, and supported efforts to defend Christendom, including the papal encouragement of the Holy League. His papacy left a lasting imprint on Catholic worship and discipline.', '1504–1572')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-of-paola', 'Saint François de Paule', 'Ermite et fondateur de l''Ordre des Minimes.', 'François de Paule fonda l''Ordre des Minimes, dédié à une vie d''humilité, de pénitence et de service. Réputé pour son ascèse rigoureuse et sa charité envers les pauvres, il attira de nombreux disciples et fut consulté comme directeur spirituel par des personnes de tous milieux.', '1416–1507'),
('saint-isidore', 'Saint Isidore de Séville', 'Évêque, érudit et docteur de l''Église.', 'Isidore de Séville fut l''un des grands intellectuels du haut Moyen Âge. Évêque et maître, il compila et conserva une vaste part du savoir antique et ecclésiastique pour l''Occident latin ; son œuvre encyclopédique, notamment les Etymologiae, servit de manuel de référence pendant des siècles et influença profondément l''enseignement médiéval.', 'v. 560–636'),
('saint-vincent-ferrer', 'Saint Vincent Ferrier', 'Prédicateur dominicain et missionnaire réputé pour ses conversions et ses sermons.', 'Vincent Ferrier, frère dominicain, fut un prédicateur itinérant dont les interventions attirèrent des foules à travers l''Europe. Il se consacra à la réforme spirituelle du clergé et du peuple, multiplia les missions et les sermons populaires, et la tradition lui attribue de nombreuses conversions et miracle.', '1350–1419'),
('saint-john-baptist-de-la-salle', 'Saint Jean-Baptiste de La Salle', 'Prêtre, pionnier de l''éducation et fondateur des Frères des Écoles Chrétiennes.', 'Jean-Baptiste de La Salle consacra sa vie à l''éducation des enfants pauvres. Il instaura des méthodes pédagogiques organisées, forma des enseignants laïcs consacrés et fonda un institut religieux dédié à l''enseignement populaire, posant ainsi les bases de l''enseignement catholique moderne.', '1651–1719'),
('saint-stanislaus', 'Saint Stanislas de Szczepanów', 'Évêque et martyr, patron de la Pologne et de Cracovie.', 'Stanislas, évêque de Cracovie, est surtout connu pour son courage pastoral et son opposition aux abus du pouvoir. Confronté au roi pour la justice ecclésiastique, il fut assassiné et devint un symbole national et religieux ; sa canonisation renforça sa place comme patron de la nation polonaise.', '1030–1079'),
('saint-martin-i', 'Saint Martin Ier', 'Pape et confesseur, adversaire du monothélisme.', 'Martin Ier a défendu avec fermeté la doctrine christologique face au monothélisme. Arrêté par les autorités impériales pour sa position théologique, il fut déporté et mourut en exil ; sa ténacité fut considérée comme un témoignage courageux en faveur de l''orthodoxie.', '† 655'),
('saint-anselm', 'Saint Anselme de Cantorbéry', 'Philosophe-théologien et archevêque de Cantorbéry.', 'Anselme est l''un des théologiens médiévaux majeurs : évêque engagé dans la réforme ecclésiale, il a aussi laissé une œuvre philosophique importante (dont l''argument ontologique) et des traités sur la foi et la raison. Ses écrits et sa méthode rigoureuse marquèrent profondément la scolastique naissante.', '1033–1109'),
('saint-george', 'Saint Georges', 'Martyr et saint chevalier, vénéré largement en Orient et en Occident.', 'Saint Georges est une figure de tradition largement légendaire, représentée comme soldat-martyr et protecteur. Malgré l''incertitude historique sur les détails de sa vie, son culte populaire et son iconographie en firent un patron et un symbole de défense chrétienne dans de nombreuses régions.', '† v. 303'),
('saint-adalbert', 'Saint Adalbert de Prague', 'Évêque, missionnaire et martyr parmi les peuples baltes.', 'Adalbert fut évêque puis missionnaire, parcourant la Bohême, la Pologne et les terres de l''Europe centrale pour annoncer l''Évangile. Il fut tué lors de l''évangelisation des Prussiens et est vénéré comme un apôtre et martyr des peuples d''Europe centrale.', 'v. 956–997'),
('saint-fidelis-of-sigmaringen', 'Saint Fidèle de Sigmaringen', 'Frère capucin et martyr de l''époque de la Contre-Réforme.', 'Entré chez les Capucins, Fidèle se distingua par son zèle pastoral et ses missions en zones de tensions religieuses. En 1622, alors qu''il travaillait au dialogue et à la prédication, il fut assassiné ; sa mort fut reconnue comme martyre et il est honoré pour sa fidélité et son courage apostolique.', '1578–1622'),
('saint-mark-evangelist', 'Saint Marc, évangéliste', 'Auteur du deuxième Évangile et fondateur traditionnel de l''Église d''Alexandrie.', 'La tradition attribue à Marc la rédaction d''un Évangile fondé sur la mémoire apostolique et la prédication primitive. Il est également associé à la fondation de l''Église d''Alexandrie ; son témoignage littéraire a profondément contribué à la transmission de la foi chrétienne dans l''Antiquité.', '† v. 68'),
('saint-peter-chanel', 'Saint Pierre Chanel', 'Missionnaire mariste, catéchiste et martyr en Océanie.', 'Pierre Chanel rejoignit les Pères maristes et fut envoyé en mission dans le Pacifique. Sur l''île de Futuna, il consacra sa vie à l''annonce de l''Évangile, aux soins des malades et à l''éducation ; il fut tué en 1841 et son martyre ouvrit la voie à la conversion de nombreuses îles voisines.', '1803–1841'),
('saint-louis-grignion-de-montfort', 'Saint Louis-Marie Grignion de Montfort', 'Prêtre, théologien marial et fondateur d''instituts missionnaires.', 'Louis-Marie Grignion de Montfort est réputé pour sa profonde dévotion mariale et son zèle missionnaire auprès des pauvres. Ses écrits sur la consécration à la Vierge ont exercé une grande influence spirituelle et contribué à renouveler la piété populaire et la vie apostolique.', '1673–1716'),
('saint-catherine-of-siena', 'Sainte Catherine de Sienne', 'Tertiaire dominicaine, mystique et docteur de l''Église.', 'Catherine de Sienne allia une vie de prière mystique à une activité intense au service de l''Église et des nécessiteux. Par ses lettres, ses conseils aux autorités ecclésiastiques et son rôle dans le retour du pape à Rome, elle demeure une figure majeure de spiritualité et d''engagement ecclésial.', '1347–1380'),
('saint-pius-v', 'Saint Pie V', 'Pape dominicain, réformateur et promoteur de la discipline tridentine.', 'Avant son élection, Pie V était dominicain. En tant que pape, il mit en œuvre les réformes du concile de Trente, favorisa l''uniformité liturgique, poursuivit la réforme morale du clergé et soutint les moyens d''action de la chrétienté face aux menaces extérieures ; son pontificat eut un impact durable sur la liturgie et la discipline ecclésiastique.', '1504–1572')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-of-paola', 'Sanctus Franciscus de Paula', 'Eremita et Ordinis Minimorum fundator.', 'Franciscus de Paula Ordinem Minimorum condidit, qui vitam humilitatis, paupertatis et paenitentiae professus est. Austeritatem vitam exercuit et pauperibus largus fuit; fama miraculis et prudentia spirituali eum per Italiam divulgavit.', '1416–1507'),
('saint-isidore', 'Sanctus Isidorus Hispalensis', 'Episcopus, eruditus et Ecclesiae doctor.', 'Isidorus Hispalensis erat episcopus et eruditus qui multa ex antiquis litteris et sapientia collegit et systematizavit. Magnum opus eius, "Etymologiae", usque ad saecula medii aevi fuit manualis compendium litterarum et disciplinae ecclesiasticae.', 'c. 560–636'),
('saint-vincent-ferrer', 'Sanctus Vincentius Ferrerius', 'Praedicator Ordinis Praedicatorum et missionarius fervens.', 'Vincentius Ferrerius, frater Ordinis Praedicatorum, per Europam instar itinerantis praedicavit et multos ad conversionem traxit. Notus erat propter ardorem in praedicatione, exhortationem ad paenitentiam et fama miraculis quae conversiones corroboraverunt.', '1350–1419'),
('saint-john-baptist-de-la-salle', 'Sanctus Ioannes Baptista de La Salle', 'Presbyter et paedagogiae innovator; fundator Fratrum Scholarum Christianarum.', 'Ioannes Baptista de La Salle vitam suam dediit institutioni scholarum pauperum: novas methodos docendi instituit, magistrorum formationem ordinavit et institutum religiosum ad educationem creatus est. Opera eius fundamenta educationis catholicae popularis posuerunt.', '1651–1719'),
('saint-stanislaus', 'Sanctus Stanislaus Szczepanowski', 'Episcopus et martyr; patronus Poloniae et Cracoviae.', 'Stanislaus, episcopus Cracoviensis, notus est propter firmam justitiam et oppositum iniuriis regiae potestatis. Confrontatione cum rege occisus est; memoria eius facta est symbolum resistentiae ad reges abutientes, et cultus eius nationalem locum obtinuit.', '1030–1079'),
('saint-martin-i', 'Sanctus Martinus I', 'Papa et confessor, adversarius Monothelitarum.', 'Martinus I Pontifex tempore turbulento contra doctrinam Monothelitam firmiter stetit. Propter hanc constantiam auctoritates imperiales eum detinuerunt, Constantinopolim advenerunt, exsilium passi sunt ubi mortem obiit; haec patientia ad orthodoxiam defensionem celebrata est.', '† 655'),
('saint-anselm', 'Sanctus Anselmus Cantuariensis', 'Theologus et archiepiscopus; magister scholasticus.', 'Anselmus, archiepiscopus Cantuariensis, clarus est ob scripta theologiae et philosophiae: argumentum ontologicum et tractatus de fide quaerente intellectum inter opera eius celeberrima sunt. Tamquam pastor et doctus multum contulit ad doctrinam medievalem.', '1033–1109'),
('saint-george', 'Sanctus Georgius', 'Martyr milesque, in oriente et occidente late veneratus.', 'Sanctus Georgius, figura martyris et militis, in traditione populari ac iconographia magnam locum obtinuit. Quamvis historicitas plurium narrationum dubia sit, cultus eius per regiones multae diffusum est et saepe ad tutelam christianam referitur.', '† c. 303'),
('saint-adalbert', 'Sanctus Adalbertus Pragensis', 'Episcopus, missionarius et martyr in terris septentrionalibus.', 'Adalbertus episcopus et missionarius fuit, qui labore evangelizandi in Bohemia, Polonia et transmarinis regionibus oppositus est. In missione ad gentem Prussicam interemit; memoria eius est tam unionis ecclesiasticae quam martyrum exemplar.', 'c. 956–997'),
('saint-fidelis-of-sigmaringen', 'Sanctus Fidelis Sigmaringensis', 'Frater Capucinus et martyr aevi Contrareformationis.', 'Fidelis Sigmaringensis ordinem Capuccinorum ingressus vir fuit strenui animi, praedicationis et curae pastoralis. In itineribus missionariis inter dissensiones religiosae occisus est; hanc devotionem et martyrionis testimonium Ecclesia commemorat.', '1578–1622'),
('saint-mark-evangelist', 'Sanctus Marcus Evangelista', 'Auctor secundi Evangelii et traditus fundator Aegyptii ecclesiae Alexandrinae.', 'Traditio Markum censet scriptorem Evangelii quod nomen eius portat et initium praedicationis christianorum in Alexandria fuisse creditur. Operis eius memoria ad formandas primitivae ecclesiae traditiones magnopere contulit.', '† c. 68'),
('saint-peter-chanel', 'Sanctus Petrus Chanel', 'Missionarius Maristae, catechista et martyr in Oceania.', 'Petrus Chanel, sacerdos Maristarum, in missionem insularum Pacificarum missus est. In Futuna ministerio se dedit, pauperibus et infirmis servivit, et pro evangelio vitae suae praemium dedit; postea haec seed conversiones in regione promote.', '1803–1841'),
('saint-louis-grignion-de-montfort', 'Sanctus Ludovicus Mariae Grignion de Montfort', 'Presbyter, theologus Marianus et fundator instituta missionaria.', 'Ludovicus Mariae de Montfort notus est ob ardorem erga Virginem Mariam et doctrinam de consecratione totali ad Mariam. Scriptis suis multos ad pietatem renovandam et vitam apostolicam excitavit; congregationes et sodalitates a missionibus eius orta sunt.', '1673–1716'),
('saint-catherine-of-siena', 'Sancta Catharina Senensis', 'Tertia Dominicana, mystica et Ecclesiae doctor.', 'Catharina Senensis vitae contemplativae et operi pro Ecclesiae reformatione fuit exemplar. Epistolae eius et consilia praevaluerunt in negotiis ecclesiasticis; propter doctrinam et sanctitatem nomen doctoris Ecclesiae accepit.', '1347–1380'),
('saint-pius-v', 'Sanctus Pius V', 'Papa Ordinis Praedicatorum, reformatio Tridentinae disciplinae.', 'Pius V, olim dominicanus, post electionem ad sedem apostolicam statim ad implenda consilia Concilij Tridentini incumbebat. Liturgicam et moralem disciplinam firmavit, institutiones sancivit et actiones ad defensionem Christendom promovit; memoria eius in vita liturgica et normis ecclesiasticis permanet.', '1504–1572')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- MAY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
-- (
--   'saint-joseph-the-worker', 'Saint Joseph the Worker',
--   NULL, NULL, NULL, TRUE,
--   NULL, 5, 1, TRUE,
--   1,
--   NULL,
--   NULL,
--   (SELECT id FROM places WHERE code='NAZARETH')
-- ),
(
  'saint-athanasius', 'Saint Athanasius',
  296, NULL, NULL, TRUE,
  373, 5, 2, TRUE,
  4,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-philip-apostle', 'Saint Philip, Apostle',
  NULL, NULL, NULL, TRUE,
  63, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='HIERAPOLIS'),
  (SELECT id FROM places WHERE code='HIERAPOLIS')
),
(
  'saint-james-the-less-apostle', 'Saint James the Less, Apostle',
  NULL, NULL, NULL, TRUE,
  62, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-john-of-avila', 'Saint John of Ávila',
  1499, 1, 6, FALSE,
  1569, 5, 10, FALSE,
  16,
  (SELECT id FROM places WHERE code='ALMODOVAR_DEL_CAMPO'),
  (SELECT id FROM places WHERE code='MONTILLA'),
  (SELECT id FROM places WHERE code='CORDOUE')
),
(
  'saint-nereus', 'Saint Nereus',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-achilleus', 'Saint Achilleus',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-pancras', 'Saint Pancras',
  289, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='SYNNADA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-matthias-apostle', 'Saint Matthias, Apostle',
  NULL, NULL, NULL, TRUE,
  64, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-john-i', 'Saint John I',
  470, NULL, NULL, TRUE,
  526, 5, 18, TRUE,
  6,
  (SELECT id FROM places WHERE code='TUSCANY'),
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-bernardine-of-siena', 'Saint Bernardine of Siena',
  1380, 9, 8, FALSE,
  1444, 5, 20, FALSE,
  14,
  (SELECT id FROM places WHERE code='MASSA_MARITTIMA'),
  (SELECT id FROM places WHERE code='AQUILA'),
  (SELECT id FROM places WHERE code='SIENA')
),
(
  'saint-christopher-magallanes', 'Saint Christopher Magallanes',
  1869, 7, 30, FALSE,
  1927, 5, 25, FALSE,
  19,
  (SELECT id FROM places WHERE code='TOTATICHE'),
  (SELECT id FROM places WHERE code='COLOTLAN'),
  (SELECT id FROM places WHERE code='JALISCO')
),
(
  'saint-rita-of-cascia', 'Saint Rita of Cascia',
  1381, NULL, NULL, TRUE,
  1457, 5, 22, FALSE,
  15,
  (SELECT id FROM places WHERE code='ROCCAPORENA'),
  (SELECT id FROM places WHERE code='CASCIA'),
  (SELECT id FROM places WHERE code='CASCIA')
),
(
  'saint-bede-the-venerable', 'Saint Bede the Venerable',
  672, NULL, NULL, TRUE,
  735, 5, 26, TRUE,
  8,
  (SELECT id FROM places WHERE code='NORTHUMBRIA'),
  (SELECT id FROM places WHERE code='JARROW'),
  (SELECT id FROM places WHERE code='JARROW')
),
(
  'saint-gregory-vii', 'Saint Gregory VII',
  1015, NULL, NULL, TRUE,
  1085, 5, 25, FALSE,
  11,
  (SELECT id FROM places WHERE code='SOVANA'),
  (SELECT id FROM places WHERE code='SALERNO'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-mary-magdalene-de-pazzi', 'Saint Mary Magdalene de’ Pazzi',
  1566, 4, 2, FALSE,
  1607, 5, 25, FALSE,
  16,
  (SELECT id FROM places WHERE code='FLORENCE'),
  (SELECT id FROM places WHERE code='FLORENCE'),
  (SELECT id FROM places WHERE code='FLORENCE')
),
(
  'saint-philip-neri', 'Saint Philip Neri',
  1515, 7, 21, FALSE,
  1595, 5, 26, FALSE,
  16,
  (SELECT id FROM places WHERE code='FLORENCE'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-augustine-of-canterbury', 'Saint Augustine of Canterbury',
  NULL, NULL, NULL, TRUE,
  604, NULL, NULL, TRUE,
  7,
  NULL,
  (SELECT id FROM places WHERE code='CANTERBURY'),
  (SELECT id FROM places WHERE code='CANTERBURY')
),
(
  'saint-paul-vi', 'Saint Paul VI',
  1897, 9, 26, FALSE,
  1978, 8, 6, FALSE,
  20,
  (SELECT id FROM places WHERE code='CONCESIO'),
  (SELECT id FROM places WHERE code='CASTEL_GANDOLFO'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
-- ('saint-joseph-the-worker', 'Saint Joseph the Worker', 'Patron of workers and model of quiet fidelity.', 'Saint Joseph, spouse of the Blessed Virgin Mary, is honored for his humble service, protective care of the Holy Family and as a model of faithful labor; the feast of Saint Joseph the Worker highlights the dignity of human work and Joseph''s patronage of workers.', '1st century'),
('saint-athanasius', 'Saint Athanasius', 'Bishop of Alexandria and staunch defender of Nicene orthodoxy.', 'Athanasius of Alexandria is renowned for his uncompromising defense of the Nicene faith against Arianism, for guiding the Alexandrian church through repeated exiles and persecutions, and for his theological writings such as On the Incarnation which articulate a coherent Christology and the doctrine of salvation; his pastoral courage and doctrinal clarity shaped both Eastern and Western theology and earned him recognition as a Doctor of the Church.', 'c. 296–373'),
('saint-philip-apostle', 'Saint Philip, Apostle', 'Apostle of the Lord and witness of the early Gospel mission.', 'Philip, counted among the Twelve Apostles, appears in the Gospels as one of the first called disciples and as a direct witness to Christ''s public ministry. He is remembered for his readiness to bring others to Jesus and for his role in the apostolic proclamation after the Resurrection. Christian tradition associates him with missionary activity in the early Church and venerates him as a faithful herald of the Gospel. In liturgical memory, he is often commemorated together with James the Less, while remaining a distinct apostolic person in the Church''s tradition.', '1st century'),
('saint-james-the-less-apostle', 'Saint James the Less, Apostle', 'Apostle of Christ, linked to leadership in the early Jerusalem Church.', 'James the Less, one of the Twelve, is traditionally identified with an important leader in the earliest Christian community of Jerusalem. He is remembered for fidelity to apostolic teaching, moral rigor, and pastoral authority in the formative period of the Church. Though historical identifications vary across traditions, liturgical remembrance consistently honors him as an apostolic witness to Christ. He is frequently celebrated with Philip in the Roman calendar, while remaining a distinct saintly person.', '1st century'),
('saint-john-of-avila', 'Saint John of Ávila', 'Priest, preacher and spiritual master of 16th-century Spain.', 'John of Ávila was a leading preacher and spiritual teacher in sixteenth-century Spain whose pastoral initiatives revitalized parishes, improved clergy formation, and provided practical spiritual guidance to lay and clerical audiences; his writings on prayer and the Christian life influenced generations of spiritual directors and earned him recognition as a Doctor of the Church for the pastoral depth of his teaching.', '1500–1569'),
('saint-nereus', 'Saint Nereus', 'Roman martyr of early Christian tradition, commemorated with Saint Achilleus.', 'Nereus is venerated as an ancient Roman martyr whose cult is rooted in early Christian memory connected with Rome and the witness of the martyrs. Historical data remain limited, but liturgical tradition preserves his name with that of Achilleus as a pair of steadfast witnesses to Christ. Their commemoration reflects the Church''s reverence for those who confessed the faith under persecution and whose testimony nourished Christian devotion in the Roman tradition.', 'c. 304'),
('saint-achilleus', 'Saint Achilleus', 'Roman martyr of early Christian tradition, commemorated with Saint Nereus.', 'Achilleus is honored as an early Roman martyr, traditionally associated with Nereus in the Church''s liturgical memory. While precise biographical details are sparse, their shared cult belongs to the ancient testimony of Roman Christianity and the veneration of those who gave witness to Christ in times of persecution. The Church preserves his name as part of the enduring memorial of martyrs whose faith strengthened subsequent generations.', 'c. 304'),
('saint-pancras', 'Saint Pancras', 'Young martyr venerated at Rome and model of youthful fidelity.', 'Pancras is honored as a young Christian martyr whose steadfast witness in the face of persecution became a model for youth; his martyrdom near Rome and the subsequent popular devotion to his memory are attested by churches and chapels dedicated in his name, reflecting the long-standing place of his cult in Christian piety.', '1st century'),
('saint-matthias-apostle', 'Saint Matthias, Apostle', 'Apostle chosen to replace Judas Iscariot; witness of apostolic continuity.', 'Matthias was selected by the early Jerusalem community to fill the apostolic college after the betrayal and loss of Judas, and while later traditions about his missionary activity and death vary, his election underscores the early Church''s concern to preserve apostolic continuity and legitimacy in its foundational ministry.', '1st century'),
('saint-john-i', 'Saint John I', 'Pope and confessor; diplomat and defender of the Church in the 6th century.', 'Pope John I is remembered for his diplomatic mission to Constantinople undertaken to negotiate on behalf of the Church in Italy, for the arrest and hardship he endured at imperial hands, and for his death soon after return from exile; his perseverance in the face of political pressure earned him the title of confessor and marks his papacy as an example of leadership amid complex church–state tensions.', '† 526'),
('saint-bernardine-of-siena', 'Saint Bernardine of Siena', 'Franciscan preacher and ardent promoter of devotion to the Holy Name of Jesus.', 'Bernardine of Siena was a dynamic Franciscan missionary preacher whose missions across Italy addressed moral reform, popular piety and care for the poor; using vivid images and accessible rhetoric he encouraged devotion to the Holy Name of Jesus, fostered charitable works, and left a notable imprint on lay spirituality despite occasional controversies over his methods.', '1380–1444'),
('saint-christopher-magallanes', 'Saint Christopher Magallanes', 'Priest and martyr of Mexico; pastor and advocate for the poor.', 'Christopher Magallanes served as a parish priest in Mexico during a period of anti‑clerical violence and social upheaval, dedicating himself to catechesis, pastoral care and the defense of the dignity of local communities; arrested and executed for his ministry, his martyrdom is honored alongside his companions as a testimony of pastoral fidelity and sacrifice in the twentieth century.', '1869–1927'),
('saint-rita-of-cascia', 'Saint Rita of Cascia', 'Religious and mystic, patroness of impossible causes and model of patient suffering.', 'Rita of Cascia experienced a life marked by family suffering and personal trials, becoming a widow and later entering religious life where she embraced a life of prayer, service and union with the cross; tradition records mystical experiences, a reputation for intercession in desperate cases, and a ministry of reconciliation that made her a beloved figure for pilgrims and devotees.', '1381–1457'),
('saint-bede-the-venerable', 'Saint Bede the Venerable', 'Scholar, historian and Father of English Christianity.', 'Bede, a monk of Jarrow, combined scholarly exactitude with pastoral concern in works of history, exegesis and computus; his Ecclesiastical History of the English People organized the memory of the English Church and provided a lasting foundation for medieval learning, while his theological and liturgical writings served generations of monastics and bishops.', 'c. 672–735'),
('saint-gregory-vii', 'Saint Gregory VII', 'Pope and reformer noted for his role in Gregorian reform and the Investiture Controversy.', 'Gregory VII (Hildebrand of Sovana) championed reforms to combat simony, enforce clerical discipline and assert ecclesiastical independence from secular rulers; his conflict over investiture with emperors and his willingness to suffer exile reflected a vision of papal authority and ecclesial reform that profoundly shaped the medieval Church.', '1015–1085'),
('saint-mary-magdalene-de-pazzi', 'Saint Mary Magdalene de'' Pazzi', 'Carmelite nun and mystic noted for austere holiness and contemplative prayer.', 'Mary Magdalene de'' Pazzi lived as a Carmelite in Florence and became known for intense contemplative prayer, ascetical practices and mystical experiences; her spiritual writings and recorded visions focus on the soul''s union with God and were influential in promoting interior reform and a renewed emphasis on personal sanctity in her context.', '1566–1607'),
('saint-philip-neri', 'Saint Philip Neri', 'Priest, founder of the Oratory and beloved pastor of Rome.', 'Philip Neri brought a pastoral style marked by humor, simplicity and an emphasis on personal conversion to sixteenth-century Rome, founding the Congregation of the Oratory to encourage communal prayer, catechesis and active lay participation; his work in spiritual direction, liturgical life and charitable care left an enduring legacy in Roman spirituality.', '1515–1595'),
('saint-augustine-of-canterbury', 'Saint Augustine of Canterbury', 'Apostle to the English and first Archbishop of Canterbury in the Gregorian mission.', 'Augustine, sent by Pope Gregory the Great, led the mission that established the episcopal see at Canterbury, baptized converts, founded churches and negotiated with local rulers to secure the footing of the Church in Anglo‑Saxon England; his foundational labors initiated the organized Christian mission that would shape English Christianity for centuries.', '† 604'),
('saint-paul-vi', 'Saint Paul VI', 'Pope of the Second Vatican Council era; promoter of aggiornamento and modern social teaching.', 'Paul VI guided the Church through the implementation of the Second Vatican Council''s reforms, promoted liturgical renewal, fostered ecumenical and international dialogue, and developed social teaching addressing development, peace and moral challenges of the modern world; his papacy sought to balance reform and continuity and left a significant mark on contemporary Catholic life.', '1897–1978')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
-- ('saint-joseph-the-worker', 'Saint Joseph travailleur', 'Patron des travailleurs et modèle de fidélité silencieuse.', 'Saint Joseph, époux de la Bienheureuse Vierge Marie, est honoré pour son service humble, son rôle de protecteur de la Sainte Famille et son exemple de travail fidèle. La fête de Saint Joseph travailleur souligne la dignité du travail humain et l''exemple du saint pour les familles et les artisans.', 'Ier siècle'),
('saint-athanasius', 'Saint Athanase d''Alexandrie', 'Évêque d''Alexandrie et défenseur résolu de l''orthodoxie nicéenne.', 'Athanase d''Alexandrie est surtout connu pour sa défense sans compromis de la foi nicéenne contre l''arianisme. Évêque en des temps de crise doctrinale et d''exil, il guida l''Église d''Alexandrie et produisit des œuvres théologiques majeures, notamment ''De incarnatione'', qui apportent un exposé profond du mystère du Christ et de la rédemption. Son influence se prolongea bien au‑delà de sa vie et ses écrits façonnèrent la théologie ecclésiastique tant en Orient qu''en Occident.', 'v. 296–373'),
('saint-philip-apostle', 'Saint Philippe, apôtre', 'Apôtre du Seigneur et témoin de la première annonce évangélique.', 'Philippe, compté parmi les Douze Apôtres, apparaît dans les Évangiles comme l''un des premiers disciples appelés et comme témoin direct du ministère public du Christ. Il est rappelé pour sa disponibilité à conduire d''autres à Jésus et pour sa participation à la mission apostolique après la Résurrection. La tradition chrétienne lui attribue une activité missionnaire dans l''Église naissante et le vénère comme annonciateur fidèle de l''Évangile. Dans la mémoire liturgique, il est souvent célébré avec Jacques le Mineur, tout en demeurant une personne apostolique distincte.', 'Ier siècle'),
('saint-james-the-less-apostle', 'Saint Jacques le Mineur, apôtre', 'Apôtre du Christ, lié à la direction de l''Église primitive de Jérusalem.', 'Jacques le Mineur, l''un des Douze, est traditionnellement associé à une figure majeure de la communauté chrétienne primitive de Jérusalem. Il est honoré pour sa fidélité à l''enseignement apostolique, son exigence morale et son autorité pastorale dans la période fondatrice de l''Église. Même si les identifications historiques varient selon les traditions, la mémoire liturgique le célèbre de manière constante comme témoin apostolique du Christ. Il est fréquemment commémoré avec Philippe dans le calendrier romain, tout en restant un saint distinct.', 'Ier siècle'),
('saint-john-of-avila', 'Saint Jean d''Ávila', 'Prêtre, prédicateur et maître spirituel de l''Espagne du XVIe siècle.', 'Jean d''Ávila fut une figure centrale de la réforme spirituelle en Espagne durant le XVIe siècle. Prédicateur recherché, il renouvela la vie paroissiale, forma les clercs et conseilla des évêques et des communautés religieuses. Ses écrits sur la prière et la direction spirituelle allient profondeur doctrinale et pastorale, et sa démarche, qui marie une ascèse authentique à une sollicitude pratique pour les âmes, lui valut une grande influence parmi les enseignants spirituels de son temps.', '1500–1569'),
('saint-nereus', 'Saint Nérée', 'Martyr romain de la tradition chrétienne ancienne, commémoré avec saint Achillée.', 'Nérée est vénéré comme un martyr romain ancien, dont le culte est enraciné dans la mémoire chrétienne primitive liée à Rome et au témoignage des martyrs. Les données historiques demeurent limitées, mais la tradition liturgique a conservé son nom avec celui d''Achillée comme une paire de témoins fidèles du Christ. Leur commémoration exprime la vénération de l''Église pour ceux qui ont confessé la foi dans la persécution et dont le témoignage a nourri la dévotion chrétienne romaine.', 'v. 304'),
('saint-achilleus', 'Saint Achillée', 'Martyr romain de la tradition chrétienne ancienne, commémoré avec saint Nérée.', 'Achillée est honoré comme martyr de la Rome antique, traditionnellement associé à Nérée dans la mémoire liturgique de l''Église. Bien que les détails biographiques précis soient rares, leur culte commun appartient au témoignage ancien du christianisme romain et à la vénération de ceux qui ont rendu témoignage au Christ en temps de persécution. L''Église garde son nom comme part durable de la mémoire des martyrs qui ont fortifié les générations suivantes.', 'v. 304'),
('saint-pancras', 'Saint Pancrace', 'Jeune martyr vénéré à Rome et modèle de fidélité juvénile.', 'Pancrace est célébré comme un jeune chrétien martyr qui, par son courage et sa constance dans la foi malgré la persécution, devint un modèle pour la jeunesse chrétienne. La piété populaire et les édifices religieux dédiés à son nom témoignent de la longévité de son culte au sein de l''Église romaine.', 'Ier siècle'),
('saint-matthias-apostle', 'Saint Matthias, apôtre', 'Apôtre choisi pour remplacer Judas Iscariot; témoin apostolique.', 'Matthias fut choisi par la communauté primitive pour compléter le collège apostolique après la trahison et la disparition de Judas. Si les détails de sa vie ultérieure restent incertains, la tradition lui attribue une mission évangélique et, dans certaines récits, le martyre ; sa désignation souligne l''importance de la continuité apostolique pour l''Église naissante.', 'Ier siècle'),
('saint-john-i', 'Saint Jean I', 'Pape et confesseur; diplomate et défenseur de l''Église au VIe siècle.', 'Le pape Jean I est connu pour sa mission diplomatique à Constantinople, entreprise pour plaider la cause de l''Église d''Italie auprès des autorités impériales. Arrêté et rappelé en exil, il souffrit pour la liberté de l''Église et mourut peu après son retour, recevant le titre de confesseur pour sa souffrance au service de l''institution ecclésiale.', '† 526'),
('saint-bernardine-of-siena', 'Saint Bernardin de Sienne', 'Prêcheur franciscain et ardent promoteur de la dévotion au Nom de Jésus.', 'Bernardin de Sienne fut un prédicateur populaire dont les missions à travers l''Italie attirèrent d''immenses foules. Il prêcha la réforme morale, encouragea la charité envers les pauvres et promut la dévotion au saint nom de Jésus en recourant à un langage et des images adaptés aux foules. Malgré certaines controverses, son influence pastorale fut considérable et contribua au renouveau spirituel de nombreuses villes.', '1380–1444'),
('saint-christopher-magallanes', 'Saint Christopher Magallanes', 'Prêtre et martyr mexicain; pasteur engagé auprès des pauvres.', 'Christopher Magallanes exerça son ministère dans un contexte de tensions socio‑politiques au Mexique et se distingua par son engagement pastoral, sa défense de la dignité des populations locales et sa fidélité à la mission. Arrêté durant une période d''antagonisme anticlérical, il fut exécuté pour son ministère et est vénéré comme l''un des martyrs qui témoignent du coût du témoignage en des temps de persécution.', '1869–1927'),
('saint-rita-of-cascia', 'Sainte Rita de Cascia', 'Religieuse et mystique, patronne des causes désespérées et modèle de patience.', 'Rita de Cascia connut une vie marquée par la souffrance personnelle, la prière et le service aux pauvres. Veuve puis religieuse, elle embrassa une vie de croix et fut connue pour ses expériences mystiques et son intercession auprès des fidèles confrontés à des situations apparemment sans issue. Sa réputation d''intercession et son exemple de réconciliation ont attiré des pèlerins et des dévotions populaires à Cascia.', '1381–1457'),
('saint-bede-the-venerable', 'Saint Bède le Vénérable', 'Erudit, historien et père du christianisme anglais.', 'Bède, moine de Jarrow, fut un historien et un théologien dont l''œuvre maîtresse, l''Histoire ecclésiastique du peuple anglais, demeura une source fondamentale pour la connaissance de l''Église médiévale. Auteur d''écrits exégétiques, liturgiques et scientifiques, il combina rigueur critique et sentiment pastoral, et sa mémoire resta vivante dans la culture intellectuelle de l''Angleterre médiévale.', 'v. 672–735'),
('saint-gregory-vii', 'Saint Grégoire VII', 'Pape et réformateur, acteur majeur de la réforme grégorienne.', 'Grégoire VII (Hildebrand de Sovana) promut des réformes destinées à libérer l''Église des ingérences séculières, combattre la simonie et affirmer la discipline du clergé. Son affrontement avec les pouvoirs laïcs durant la Querelle des Investitures et son exil firent de lui une figure centrale du renouveau ecclésial du XIe siècle ; ses mesures ont durablement influencé la structure et l''autorité pontificale.', '1015–1085'),
('saint-mary-magdalene-de-pazzi', 'Sainte Marie-Madeleine de Pazzi', 'Carmélite et mystique célèbre pour sa prière contemplative et sa sainteté austère.', 'Marie-Madeleine de Pazzi vécut en Florence en tant que carmélite et se distingua par une vie de prière intense, des pratiques ascétiques et des expériences mystiques. Ses écrits spirituels et les récits de ses extases traitent de l''union de l''âme avec Dieu et de l''exigence d''une sanctification personnelle, influençant la spiritualité carmélitaine et locale.', '1566–1607'),
('saint-philip-neri', 'Saint Philippe Néri', 'Prêtre, fondateur de l''Oratoire et pasteur aimé de Rome.', 'Philippe Néri développa un ministère pastoral original fondé sur la joie, la simplicité et la direction spirituelle. Fondateur de la Congrégation de l''Oratoire, il encouragea la prière communautaire, la formation spirituelle et l''art comme moyens d''évangélisation et de sainteté laïque. Sa capacité à toucher les cœurs des Romains fit de lui une figure majeure de la vie religieuse de la renaissance.', '1515–1595'),
('saint-augustine-of-canterbury', 'Saint Augustin de Cantorbéry', 'Apôtre des Angles et premier archevêque de Cantorbéry dans la mission grégorienne.', 'Augustin, envoyé par le pape Grégoire le Grand, dirigea la mission qui lança l''organisation chrétienne en Angleterre anglo‑saxonne. Consacré archevêque, il établit le siège de Cantorbéry, fonda des églises, baptisa des convertis et négocia avec les chefs locaux pour assurer la stabilité de l''implantation chrétienne ; son œuvre posa les fondements de l''Église anglaise.', '† 604'),
('saint-paul-vi', 'Saint Paul VI', 'Pape de l''ère conciliaire; promoteur de l''aggiornamento et de la doctrine sociale.', 'Paul VI accompagna l''application des réformes du concile Vatican II, chercha à concilier rénovation pastorale et fidélité doctrinale, développa la doctrine sociale de l''Église et encouragea l''œcuménisme et le dialogue international. Ses encycliques et interventions sur la paix, le développement et la morale publique ont marqué la réflexion catholique au XXe siècle.', '1897–1978')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
-- ('saint-joseph-the-worker', 'Sanctus Iosephus Opifex', 'Patronus operariorum et exemplar humilitatis.', 'Sanctus Iosephus, sponsus Beatae Mariae Virginis, honoratur ob humilem servitium et diligentem curam Sanctae Familiae; eius vita exemplum devotionis et laboris fidelis est et festum eius significat dignitatem operis humanioris.', 'saec. I'),
('saint-athanasius', 'Sanctus Athanasius', 'Episcopus Alexandrinus et strenuus defensor fidae Nicaenae.', 'Athanasius Alexandrinus clarus est propter intransigentem defensionem fidei Nicaenae contra Arianismum, propter gubernationem ecclesiae Alexandrinae per persecutiones et exilia, atque propter scripta theologica praeclare exposita, inter quae "De Incarnatione" principatum obtinet; doctrina et patientia eius multum contulerunt ad formandam theologiam Trinitatis.', 'c. 296–373'),
('saint-philip-apostle', 'Sanctus Philippus, Apostolus', 'Apostolus Domini et testis primae missionis evangelicae.', 'Philippus, inter Duodecim Apostolos annumeratus, in Evangeliis ut unus ex primis vocatis discipulis apparet atque ministerii publici Christi testis est. Memoratur promptitudine qua alios ad Iesum adduxit et munere quod in praedicatione apostolica post Resurrectionem exercuit. Traditio christiana eum missioni in Ecclesia nascente coniungit et ut fidelem Evangelii praeconem veneratur. In memoria liturgica saepe cum Iacobo Minore celebratur, manens tamen persona apostolica distincta.', 'saec. I'),
('saint-james-the-less-apostle', 'Sanctus Iacobus Minor, Apostolus', 'Apostolus Christi, cum regimine primae Ecclesiae Hierosolymitanae coniunctus.', 'Iacobus Minor, unus ex Duodecim, traditur cum praecipua persona communitatis christianae primaevae Hierosolymis coniungi. In memoria Ecclesiae servatur propter fidelitatem doctrinae apostolicae, severitatem moralem et auctoritatem pastoralem in aetate fundationis. Quamvis identificationes historicae inter traditiones differant, liturgia eum constanter honorat ut apostolicum Christi testem. Saepe cum Philippo in calendario Romano commemoratur, manens tamen sanctus distinctus.', 'saec. I'),
('saint-john-of-avila', 'Sanctus Ioannes Abilaeus', 'Presbyter, praedicator et magister spiritualis saeculi XVI Hispaniae.', 'Ioannes Abilaeus, praedicator clarus et magister spiritualis, ecclesias et parochias in Andalusia et Castella renovavit, clerum formavit et animarum curam promovit; scriptis de oratione et vita christiana multos ad dirigendum et reformandum animas contulit, merens honorem doctoris Ecclesiae pro prudentia pastorali.', '1500–1569'),
('saint-nereus', 'Sanctus Nereus', 'Martyr Romanus antiquae traditionis christianae, cum Sancto Achilleo commemoratus.', 'Nereus veneratur ut martyr Romanus antiquus, cuius cultus in memoria christiana prisca Romae et in testimonio martyrum radicatur. Quamvis notitiae historicae sint paucae, traditio liturgica nomen eius cum Achilleo tamquam par fidei testium servavit. Eorum commemoratio ostendit venerationem Ecclesiae erga eos qui fidem sub persecutione confessi sunt et quorum testimonium devotionem christianam in traditione Romana aluit.', 'c. 304'),
('saint-achilleus', 'Sanctus Achilleus', 'Martyr Romanus antiquae traditionis christianae, cum Sancto Nereo commemoratus.', 'Achilleus colitur ut martyr antiquae Romae, tradite cum Nereo in memoria liturgica Ecclesiae coniunctus. Etsi vitae singularis notitiae certae desunt, cultus eorum communis ad antiquum testimonium christianitatis Romanae pertinet atque ad venerationem eorum qui Christo in persecutione testimonium reddiderunt. Ecclesia nomen eius servat in perenni martyrum memoria, quae posteriores generationes roboravit.', 'c. 304'),
('saint-pancras', 'Sanctus Pancratius', 'Iuvenis martyr et exemplar constantiae iuvenilis.', 'Pancratius veneratedur ut iuvenis martyr Romanus qui, propter firmae fidei testimonium in persecutione, multis generibus iuvenum fuit exemplar; cultus eius per saecula in ecclesiis et oratoriis manifestatus est.', 'saec. I'),
('saint-matthias-apostle', 'Sanctus Matthias, Apostolus', 'Apostolus electus ad locum Iudae Iscarioth repletus; signer apostolicae continuitatis.', 'Matthias a primitiva communitate Hierosolymitana electus est ut collegium apostolicum integraret, et quamvis de subsequenti vita eius traditiones variant, electio eius demonstrat sollicitudinem Ecclesiae ad conservandam auctoritatem apostolicam et successionem ministerii.', 'saec. I'),
('saint-john-i', 'Sanctus Ioannes I', 'Papa et confessor; legatus et defensor Ecclesiae saeculo VI.', 'Ioannes I memoria dignus est propter missionem diplomaticam ad Constantinopolim, ubi pro Ecclesia Italiae litigavit, et propter persecutionem quam passa est sub auctoritati imperiali; mortuus post reditionem exsilii, titulo confessoris donatus est ob patientiam in causa ecclesiastica.', '† 526'),
('saint-bernardine-of-siena', 'Sanctus Bernardinus Senensis', 'Praedicator Franciscanae familiae et ardor devotionis nominis Iesu promotus.', 'Bernardinus Senensis praedicator strenuus fuit qui per Italiam missiones fecit ad mores corrigendos, pauperum curam promovendum et devotionem ad nomen Iesu excitandam; usus imaginis et sermonum aptorum populis ei magnam auctoritatem pastorali tribuit, etsi nonnullae controversiae eum non absconserunt.', '1380–1444'),
('saint-christopher-magallanes', 'Sanctus Christophorus Magallanes', 'Presbyter et martyr Mexicanus, pastor et advocatus pauperum.', 'Christophorus Magallanes ministerio parochiali in Mexico dedicatus est, catechismo et cura animarum incumbens, et propter oppositionem anticlarelicam ab hostibus persecutus et interfectus est; eius martyrium et vitae testimonium in memoriam pro fidelitate pastorali servatur.', '1869–1927'),
('saint-rita-of-cascia', 'Sancta Rita Casciensis', 'Religiosa et mystica, patrona causarum difficilium et patientiae.', 'Rita Casciensis vitae suae crisis pertulit, vidua facta et postea monacha, crucem accipiens et experiendi mysticae relationes servans; nota est pro intercessionibus in casibus desperatis et pro ministerio reconciliationis, propter quod multis est locus peregrinationis.', '1381–1457'),
('saint-bede-the-venerable', 'Sanctus Beda Venerabilis', 'Eruditus, historicus et pater Christianitatis Anglicanae.', 'Beda, monachus Iarvae, opus historium et theologicarum composuit quod Ecclesiae Anglicanae originem et progressum clare documentavit; opera eius de historia ecclesiastica et tractatus exegetici et computales usui monachorum et episcoporum servierunt, et eius memoria in studiis et liturgia manet.', 'c. 672–735'),
('saint-gregory-vii', 'Sanctus Gregorius VII', 'Papa et reformator, actor principalis in reformatione Gregoriania.', 'Gregorius VII, Hildebrandus Sovanae, reformis obsedit ad simoniam prohibendam, disciplinam clericorum instaurandam et libertatem ecclesiae a dominatione laica affirmandam; conflicta de investituris et exilium eius demonstrant constantiam ad ecclesiae reformam instaurandam et auctoritatem pontificalem robustiorem.', '1015–1085'),
('saint-mary-magdalene-de-pazzi', 'Sancta Maria Magdalena de Pazzi', 'Carmelita mystica nota pro austera pietate et contemplatione.', 'Maria Magdalena de Pazzi in Florentia ut Carmelita vixit vitae contemplationi deditam, asceticae disciplinae et extasiis spiritualibus famam acquisivit; scripta eius et narrationes visionum tractant unionem animae cum Deo et sollicitationem ad sanctitatem personalem.', '1566–1607'),
('saint-philip-neri', 'Sanctus Philippus Neri', 'Presbyter, Oratorii fundator et pastor Romanus dilectus.', 'Philippus Neri ministerium suum in Roma per hilaritatem, simplicitatem et directionem spiritualem exercuit, Congregationem Oratorii condidit ad vota communia et praeparationem spiritualem, et per caritatem et institutiones liturgicas animas convertit; eius praxis pastoralior et humana in ecclesia urbana magnum reliquit momentum.', '1515–1595'),
('saint-augustine-of-canterbury', 'Sanctus Augustinus Cantuariensis', 'Apostolus Anglorum et primus archiepiscopus Cantuariae in missione Gregoriana.', 'Augustinus a Gregorio Magno missus missionem in Anglia duxit, sedes Cantuariae condidit, convertit populum et cum ducibus localibus tractavit ut novae ecclesiae stabilitas coleretur; eius initia impulsa sunt fundamentum Christianizationis regionis.', '† 604'),
('saint-paul-vi', 'Sanctus Paulus VI', 'Papa temporis Concilii Vaticani Secundi, promotor aggiornamenti et doctrinae socialis.', 'Paulus VI concilii effectus dirigere studuit, renovationem liturgicam et dialogum oeconomicum et oeconomicum promovebat, doctrina socialis de progressu et pacis quaestiones tractavit, et tentavit continuitatem doctrinam et renovatio pastoralis coniungere; eius pontificatus vestigia in vita catholica moderna manent.', '1897–1978')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- JUNE SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-justin-martyr', 'Saint Justin Martyr',
  90, NULL, NULL, TRUE,
  165, NULL, NULL, TRUE,
  2,
  (SELECT id FROM places WHERE code='NABLUS'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-marcellinus', 'Saint Marcellinus',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-peter-exorcist', 'Saint Peter (Exorcist)',
  NULL, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-charles-lwanga', 'Saints Charles Lwanga and Companions',
  1860, 1, 1, FALSE,
  1886, 6, 3, FALSE,
  19,
  (SELECT id FROM places WHERE code='BUGANDA'),
  (SELECT id FROM places WHERE code='NAMUGONGO'),
  (SELECT id FROM places WHERE code='BUGANDA')
),
(
  'saint-boniface', 'Saint Boniface',
  675, NULL, NULL, TRUE,
  754, 6, 5, FALSE,
  8,
  (SELECT id FROM places WHERE code='CREDITON'),
  (SELECT id FROM places WHERE code='DOKKUM'),
  (SELECT id FROM places WHERE code='MAINZ')
),
(
  'saint-norbert', 'Saint Norbert',
  1080, NULL, NULL, TRUE,
  1134, 6, 6, FALSE,
  12,
  (SELECT id FROM places WHERE code='XANTEN'),
  (SELECT id FROM places WHERE code='MAGDEBURG'),
  (SELECT id FROM places WHERE code='PREMONTRE')
),
(
  'saint-ephrem', 'Saint Ephrem the Syrian',
  306, NULL, NULL, TRUE,
  373, 6, 9, TRUE,
  4,
  (SELECT id FROM places WHERE code='NISIBIS'),
  (SELECT id FROM places WHERE code='EDESSA'),
  (SELECT id FROM places WHERE code='EDESSA')
),
(
  'saint-barnabas-apostle', 'Saint Barnabas, Apostle',
  NULL, NULL, NULL, TRUE,
  61, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='SALAMIS_CYPRUS'),
  (SELECT id FROM places WHERE code='SALAMIS_CYPRUS'),
  (SELECT id FROM places WHERE code='CYPRUS')
),
(
  'saint-anthony-of-padua', 'Saint Anthony of Padua',
  1195, NULL, NULL, TRUE,
  1231, 6, 13, FALSE,
  13,
  (SELECT id FROM places WHERE code='LISBON'),
  (SELECT id FROM places WHERE code='PADUA'),
  (SELECT id FROM places WHERE code='PADUA')
),
(
  'saint-romuald', 'Saint Romuald',
  951, NULL, NULL, TRUE,
  1027, 6, 19, FALSE,
  10,
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='VAL_DI_CASTRO'),
  (SELECT id FROM places WHERE code='CAMALDOLI')
),
(
  'saint-aloysius-gonzaga', 'Saint Aloysius Gonzaga',
  1568, 3, 9, FALSE,
  1591, 6, 21, FALSE,
  16,
  (SELECT id FROM places WHERE code='CASTIGLIONE_DELLA_STIVIERE'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-paulinus-of-nola', 'Saint Paulinus of Nola',
  354, NULL, NULL, TRUE,
  431, 6, 22, TRUE,
  5,
  (SELECT id FROM places WHERE code='BORDEAUX'),
  (SELECT id FROM places WHERE code='NOLA'),
  (SELECT id FROM places WHERE code='NOLA')
),
(
  'saint-john-fisher', 'Saint John Fisher',
  1469, 10, 19, TRUE,
  1535, 6, 22, FALSE,
  16,
  (SELECT id FROM places WHERE code='BEVERLEY'),
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='ROCHESTER')
),
(
  'saint-thomas-more', 'Saint Thomas More',
  1478, 2, 7, FALSE,
  1535, 7, 6, FALSE,
  16,
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='LONDON')
),
(
  'saint-peter-apostle', 'Saint Peter, Apostle',
  NULL, NULL, NULL, TRUE,
  64, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-cyril-of-alexandria', 'Saint Cyril of Alexandria',
  376, NULL, NULL, TRUE,
  444, 6, 27, FALSE,
  5,
  NULL,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-irenaeus', 'Saint Irenaeus',
  122, NULL, NULL, TRUE,
  200, NULL, NULL, TRUE,
  2,
  (SELECT id FROM places WHERE code='SMYRNA'),
  (SELECT id FROM places WHERE code='LYON'),
  (SELECT id FROM places WHERE code='LYON')
)
-- (
--   'first-martyrs-of-holy-roman-church', 'First Martyrs of the Holy Roman Church',
--   NULL, NULL, NULL, TRUE,
--   NULL, 6, 30, TRUE,
--   1,
--   NULL,
--   (SELECT id FROM places WHERE code='ROME'),
--   (SELECT id FROM places WHERE code='ROME')
-- )
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-justin-martyr', 'Saint Justin Martyr', 'Early Christian apologist and martyr.', 'Justin Martyr was an important early Christian apologist who wrote defenses of the Christian faith addressed to Greco-Roman audiences, produced theological reflections on the Logos and baptism, and gave witness by suffering martyrdom amid the second-century persecutions; his works anchored nascent Christian theology in dialogue with classical philosophy.', '† 165'),
('saint-marcellinus', 'Saint Marcellinus', 'Roman martyr of early Christianity, commemorated with Saint Peter the Exorcist.', 'Marcellinus is venerated as an early Roman martyr, traditionally associated with Peter the Exorcist in the memory of the Church. Historical details are limited, but their joint cult became firmly rooted in Roman Christian tradition and in the liturgical remembrance of those who bore witness to Christ under persecution. His name endures as part of the ancient martyrological heritage of Rome.', '† 304'),
('saint-peter-exorcist', 'Saint Peter (Exorcist)', 'Roman martyr of early Christianity, commemorated with Saint Marcellinus.', 'Peter, known in tradition as an exorcist, is honored as an early Roman martyr and is remembered together with Marcellinus. Though biographical precision is scarce, the Church preserved their witness through longstanding liturgical commemoration, highlighting fidelity to Christ in times of trial and violence. His memory belongs to the foundational martyrological tradition of Rome.', '† 304'),
('saint-charles-lwanga', 'Saint Charles Lwanga', 'Martyrs of Uganda and witnesses to the faith under persecution.', 'Charles Lwanga and his companions were catechists, lay leaders and youthful catechumens executed for their refusal to renounce the Christian faith during the late nineteenth-century persecutions in Uganda; their courage inspired the Church in Africa and their memory continues to be a source of missionary zeal and witness.', '1860–1886'),
('saint-boniface', 'Saint Boniface', 'Missionary bishop to the Germanic peoples and martyr.', 'Boniface, born Winfrid in Anglo-Saxon England, became the leading missionary bishop in the Germanic lands, reorganizing the church, founding bishoprics and monasteries, promoting clerical reform and Christian education, and leaving a durable institutional and pastoral legacy across central Europe; tradition reports his martyrdom while on mission, sealing his reputation as apostle of the Germans.', 'c. 675–754'),
('saint-norbert', 'Saint Norbert', 'Founder and reformer; Archbishop and promoter of clerical renewal.', 'Norbert of Xanten founded the Premonstratensian Order, worked for clerical reform and reconciliation, and served as a prominent ecclesial leader who combined pastoral zeal with institutional renewal; his charismatic leadership and monastic reforms shaped twelfth-century reform movements.', '1080–1134'),
('saint-ephrem', 'Saint Ephrem the Syrian', 'Deacon, hymnographer and theologian of the Syriac tradition.', 'Ephrem the Syrian was a prolific Syriac theologian and poet whose hymns, sermons and catechetical works defended orthodox teaching and nurtured devotional life among Syriac Christians; his poetic theology and pastoral writings continue to influence Eastern Christian spirituality and hymnody.', 'c. 306–373'),
('saint-barnabas-apostle', 'Saint Barnabas, Apostle', 'Apostolic figure associated with Cyprus and missionary activity.', 'Barnabas, companion of Saint Paul in the Acts of the Apostles, is venerated as an early apostolic figure who supported missionary foundations, encouraged converts, and is traditionally associated with missionary labors in Cyprus where his memory remained prominent in local Christian identity.', '1st century'),
('saint-anthony-of-padua', 'Saint Anthony of Padua', 'Franciscan preacher and prodigious teacher of the Gospel.', 'Anthony of Padua, famed for his preaching, scriptural knowledge and care for the poor, combined pastoral ministry with theological insight and became a beloved Franciscan preacher whose sermons, homilies and miracles contributed to his wide veneration across Europe.', '1195–1231'),
('saint-romuald', 'Saint Romuald', 'Founder of a hermit tradition and monastic reformer.', 'Romuald established a movement of eremitical monasticism that emphasized contemplative solitude, ascetic discipline and spiritual direction; his foundations and reforms influenced the monastic landscape of medieval Italy and inspired later movements of solitary religious life.', '951–1027'),
('saint-aloysius-gonzaga', 'Saint Aloysius Gonzaga', 'Jesuit novice and patron of young people and students.', 'Aloysius Gonzaga, a Jesuit novice known for his intense devotion, care for plague victims and early death, has been venerated as a model of youthful holiness and dedication to the spiritual life, particularly among students and young people.', '1568–1591'),
('saint-paulinus-of-nola', 'Saint Paulinus of Nola', 'Bishop, poet and model of Christian charity.', 'Paulinus of Nola was a Christian bishop and literary figure who promoted episcopal reform, generous charity and the renewal of Christian communal life; his letters, poetry and patronage of monastic foundations contributed to the cultural and spiritual life of late antiquity.', '354–431'),
('saint-john-fisher', 'Saint John Fisher', 'Bishop, theologian and martyr in the English Reformation.', 'John Fisher was an English bishop and scholar who defended the rights and doctrines of the Church in a time of political pressure; imprisoned for his opposition to royal policies concerning the Church, he suffered death as a confessor and martyr and is remembered for his integrity of conscience and learning.', '1469–1535'),
('saint-thomas-more', 'Saint Thomas More', 'Statesman, lawyer and martyr, exemplar of conscience and civic virtue.', 'Thomas More combined public service with deep personal conviction, defending religious liberty of conscience and refusing to compromise his principles in the face of royal demands; his execution is read as a testimony to the primacy of conscience and the difficult relationship between Church and state in early modern England.', '1478–1535'),
('saint-peter-apostle', 'Saint Peter, Apostle', 'Chief of the Apostles and foundational witness of the Church in Rome.', 'Peter, originally Simon of Galilee, was called by Christ and entrusted with a decisive pastoral mission among the Apostles. The New Testament presents him as a principal witness of Jesus'' ministry, Passion, and Resurrection, and as a leading figure in the apostolic community. Christian tradition holds that he exercised ministry in Rome and died there as a martyr under Nero. He is venerated as Apostle, shepherd, and enduring sign of apostolic continuity in the Church.', '1st century'),
('saint-cyril-of-alexandria', 'Saint Cyril of Alexandria', 'Bishop, theologian and defender of Christological orthodoxy.', 'Cyril of Alexandria played a central role in the christological controversies of the fifth century, articulating theological responses to Nestorian thought, guiding his see through intense doctrinal struggle, and leaving a body of letters and sermons influential for the defense of orthodox Christology.', 'c. 376–444'),
('saint-irenaeus', 'Saint Irenaeus', 'Bishop, apologist and formative theologian of the second century.', 'Irenaeus of Lyons defended the apostolic faith against emerging heresies by appealing to apostolic tradition, the rule of faith and scriptural interpretation; his work ''Against Heresies'' remains a foundational source for understanding early Christian theology and ecclesiology.', 'c. 130–202')
-- ('first-martyrs-of-holy-roman-church', 'First Martyrs of the Holy Roman Church', 'Early Roman martyrs whose witness inaugurated the Church''s martyrial memory.', 'This collective title commemorates the earliest Christians of Rome who suffered for the faith and whose burial places, tombs and liturgical remembrance helped form the Church''s martyrology and devotional memory in the city of Rome.', '1st century')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-justin-martyr', 'Saint Justin Martyr', 'Apologiste chrétien et martyr des premiers siècles.', 'Justin fut un des premiers apologistes chrétiens à dialoguer avec la culture gréco‑romaine; ses écrits exposent la foi chrétienne en termes philosophiques, traitent du Logos et de la signification du baptême, et témoignent d''une pensée théologique qui chercha à rendre compte de l''Évangile dans le monde classique; il donna également sa vie en martyre.', '† 165'),
('saint-marcellinus', 'Saint Marcellin', 'Martyr romain de l''antiquité chrétienne, commémoré avec saint Pierre exorciste.', 'Marcellin est vénéré comme martyr de la Rome chrétienne ancienne, traditionnellement associé à Pierre exorciste dans la mémoire de l''Église. Les données biographiques sont limitées, mais leur culte commun s''est enraciné durablement dans la tradition romaine et la mémoire liturgique de ceux qui ont témoigné du Christ dans la persécution. Son nom demeure dans le patrimoine martyrologique antique de Rome.', '† 304'),
('saint-peter-exorcist', 'Saint Pierre (exorciste)', 'Martyr romain de l''antiquité chrétienne, commémoré avec saint Marcellin.', 'Pierre, connu dans la tradition comme exorciste, est honoré comme martyr de la Rome antique et commémoré avec Marcellin. Bien que les détails biographiques soient rares, l''Église a conservé leur témoignage par une commémoration liturgique stable, soulignant la fidélité au Christ dans l''épreuve et la violence. Sa mémoire appartient au noyau ancien de la tradition martyrologique romaine.', '† 304'),
('saint-charles-lwanga', 'Saint Charles Lwanga', 'Martyrs d''Ouganda et témoins de la foi face à la persécution.', 'Charles Lwanga et ses compagnons, catechistes, laïcs et catéchumènes, furent exécutés pour avoir refusé d''abandonner la foi chrétienne à la fin du XIXe siècle; leur courage inspira l''Église d''Afrique et leur mémoire demeure un appel missionnaire et un exemple de fidélité dans l''adversité.', '1860–1886'),
('saint-boniface', 'Saint Boniface', 'Évêque missionnaire des Germains et martyr.', 'Boniface (Winfrid), originaire d''Angleterre, devint le principal évangélisateur des peuples germaniques en organisant des diocèses, fondant des monastères, promouvant la réforme du clergé et l''éducation chrétienne; son action institutionnelle et pastorale a durablement structuré l''Église en Europe centrale et sa mort en mission scella son renom d''apôtre des Germains.', 'v. 675–754'),
('saint-norbert', 'Saint Norbert', 'Fondateur et réformateur; promoteur du renouveau clérical.', 'Norbert de Xanten fonda l''ordre des Prémontrés, œuvra pour la réforme du clergé et favorisa la réconciliation ecclésiale; son leadership charismatique et ses réformes monastiques marquèrent profondément les mouvements réformateurs du XIIe siècle.', '1080–1134'),
('saint-ephrem', 'Saint Éphrem le Syrien', 'Diacre, poète et théologien de la tradition syriaque.', 'Éphrem le Syrien fut un théologien et hymnodiste prolifique dont les hymnes, sermons et catéchèses défendirent la foi orthodoxe et nourrirent la vie dévotionnelle des chrétiens syriaques; sa théologie poétique et pastorale influence encore la spiritualité orientale.', 'v. 306–373'),
('saint-barnabas-apostle', 'Saint Barnabas, apôtre', 'Figure apostolique liée à Chypre et à la mission.', 'Barnabas, compagnon de Paul selon les Actes, est vénéré comme un acteur apostolique précoce qui soutint les premières communautés, encouragea les convertis et est traditionnellement associé aux œuvres missionnaires à Chypre où sa mémoire demeura vivante.', 'Ier siècle'),
('saint-anthony-of-padua', 'Saint Antoine de Padoue', 'Prêcheur franciscain et maître du sermon évangélique.', 'Antoine de Padoue se distingua par sa prédication, sa connaissance biblique et son ministère envers les pauvres; ses homélies et les nombreux récits de miracles contribuèrent à une dévotion populaire large et durable à travers l''Europe.', '1195–1231'),
('saint-romuald', 'Saint Romuald', 'Fondateur d''une tradition d''ermitage et réformateur monastique.', 'Romuald instaura un courant d''ermitage axé sur la solitude contemplative, la discipline ascétique et la direction spirituelle; ses fondations et ses réformes eurent une influence notable sur le paysage monastique médiéval en Italie.', '951–1027'),
('saint-aloysius-gonzaga', 'Saint Aloysius Gonzaga', 'Novice jésuite et patron des jeunes et étudiants.', 'Aloysius Gonzaga, jeune novice jésuite, est admiré pour sa ferveur, ses soins aux victimes de peste et sa mort prématurée; il est devenu un modèle de sainteté juvénile et un patron pour les étudiants.', '1568–1591'),
('saint-paulinus-of-nola', 'Saint Paulin de Nole', 'Évêque, poète et modèle de charité chrétienne.', 'Paulin de Nole fut un évêque et homme de lettres qui œuvra pour la réforme épiscopale, la charité et le renouveau de la vie communautaire; ses lettres, sa poésie et son patronage des institutions monastiques enrichirent la vie culturelle et spirituelle de la fin de l''Antiquité.', '354–431'),
('saint-john-fisher', 'Saint John Fisher', 'Évêque, théologien et martyr de la Réforme anglaise.', 'John Fisher, évêque et universitaire anglais, défendit les droits et la doctrine de l''Église face aux pressions royales; emprisonné pour son opposition aux politiques religieuses du souverain, il mourut en témoignage de sa conscience et est reconnu pour son intégrité intellectuelle et spirituelle.', '1469–1535'),
('saint-thomas-more', 'Saint Thomas More', 'Homme d''État, juriste et martyr, modèle de conscience et vertu civique.', 'Thomas More allia service public et profonde conviction personnelle en refusant de renier ses principes devant la pression royale; son exécution est lue comme un témoignage de la primauté de la conscience et de la complexité des rapports entre Église et pouvoir au début de l''époque moderne.', '1478–1535'),
('saint-peter-apostle', 'Saint Pierre, apôtre', 'Chef des Apôtres et témoin fondateur de l''Église à Rome.', 'Pierre, d''abord appelé Simon, fut choisi par le Christ et chargé d''une mission pastorale décisive parmi les Apôtres. Le Nouveau Testament le présente comme témoin privilégié du ministère, de la Passion et de la Résurrection de Jésus, puis comme figure centrale de la communauté apostolique. La tradition chrétienne le situe à Rome pour son ministère final et son martyre sous Néron. Il est vénéré comme apôtre, pasteur et signe durable de la continuité apostolique de l''Église.', 'Ier siècle'),
('saint-cyril-of-alexandria', 'Saint Cyrille d''Alexandrie', 'Évêque, théologien et défenseur de l''orthodoxie christologique.', 'Cyrille d''Alexandrie joua un rôle central dans les controverses christologiques du Ve siècle, s''opposant aux thèses nestoriennes et développant une articulation théologique qui aida à défendre la foi sur la nature du Christ; ses lettres et sermons eurent une grande influence pour la formulation de l''orthodoxie.', 'v. 376–444'),
('saint-irenaeus', 'Saint Irénée', 'Évêque, apologiste et théologien majeur du IIe siècle.', 'Irénée de Lyon défendit la foi apostolique contre les hérésies naissantes en s''appuyant sur la tradition apostolique, la règle de foi et une lecture ordonnée de l''Écriture; son ouvrage "Contre les hérésies" demeure une source essentielle pour la théologie et l''ecclésiologie anciennes.', 'v. 130–202')
-- ('first-martyrs-of-holy-roman-church', 'Premiers martyrs de la Sainte Église romaine', 'Martyrs anciens de Rome dont le témoignage a forgé la mémoire martyrologique de la ville.', 'Ce titre collectif commémore les premiers chrétiens de Rome qui souffrirent pour la foi et dont les tombeaux, lieux de sépulture et la mémoire liturgique contribuèrent à construire le martyrologe et la piété de l''Église romaine.', 'Ier siècle')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-justin-martyr', 'Sanctus Justinus Martyr', 'Apologeta christianus et martyr.', 'Justinus Martyr, philosophus convertitus, apologeta est clarus qui doctrinam christianam in dialogo cum philosophia Graeco-Romana defendit et qui sub persecutionibus saeculi II martirio coronatus est.', '† 165'),
('saint-marcellinus', 'Sanctus Marcellinus', 'Martyr Romanus antiquae christianitatis, cum Sancto Petro Exorcista commemoratus.', 'Marcellinus colitur ut martyr antiquae Ecclesiae Romanae, in traditione cum Petro Exorcista coniunctus. Quamvis notitiae historicae exiguae sint, cultus eorum communis in memoria liturgica Romana firmiter radicatus est, ut testimonium fidelitatis Christi sub persecutione. Nomen eius in patrimonium martyrologicum antiquum Romae permanet.', '† 304'),
('saint-peter-exorcist', 'Sanctus Petrus Exorcista', 'Martyr Romanus antiquae christianitatis, cum Sancto Marcellino commemoratus.', 'Petrus, in traditione Exorcista dictus, honoratur ut martyr antiquae Romae et una cum Marcellino recolitur. Etsi vitae singularis notitiae paucae sunt, Ecclesia eorum testimonium per stabilem commemorationem liturgicam servavit, fidelitatem erga Christum in tempore persecutionis illustrans. Memoria eius ad fundamenta traditionis martyrologicae Romanae pertinet.', '† 304'),
('saint-charles-lwanga', 'Sanctus Carolus Lwanga', 'Martyres Ugandenses et testimonium fidei sub persecutione.', 'Carolus Lwanga et socii eius catechistae et iuvenes pro fide Christi persecuti et ejecuti sunt; memoria eorum in Ecclesia Africana missionaria est et exemplar fortitudinis praebet.', '1860–1886'),
('saint-boniface', 'Sanctus Bonifatius', 'Apostolus Germaniae, episcopus et martyr.', 'Bonifatius, natus Winfrid in Anglia, per Germaniam missiones duxit, dioceses et monasteria instituit, clerum reformavit et educationem christianam promovit; traditione narratur in missione occisus esse, et ideo appellatur apostolus Germanorum.', 'c. 675–754'),
('saint-norbert', 'Sanctus Norbertus', 'Fundator et reformator, archiepiscopus et promotus reformationis clericalis.', 'Norbertus Xantensis Ordinem Praemonstratensem condidit, regulam canonicam restauravit et episcopatum cum vocatione reformandi clerum exercuit; eius institutio et zealum reformationis monasticae et clericalis memorantur.', '1080–1134'),
('saint-ephrem', 'Sanctus Ephraem Syrius', 'Diaconus, hymnographus et theologus Syriacus.', 'Ephraem Syrius hymnos, sermones et cathecheses composuit quae doctrinam orthodoxam defenderunt et vitam devotionis inter Christianos Syriacos firmaverunt; eius carmina theologicam et pietatem coniungunt.', 'c. 306–373'),
('saint-barnabas-apostle', 'Sanctus Barnabas, Apostolus', 'Apostolicus associatus Cypro et missioni.', 'Barnabas, socius Pauli secundum Acta Apostolorum, in institutione ecclesiarum et in consolatione convertitorum magnum munus egit et traditione cum Cypro valde coniungitur.', 'saec. I'),
('saint-anthony-of-padua', 'Sanctus Antonius Patavinus', 'Praedicator Franciscanae familiae et doctor popularis.', 'Antonius Patavinus per praedicationem, cognitionem scripturarum et ministerium ad pauperes clarus factus est; miracula et doctrinae eius devotionem popularem oriunarunt.', '1195–1231'),
('saint-romuald', 'Sanctus Romualdus', 'Fundator eremiticus et reformator monasticus.', 'Romualdus traditionem eremiticam et disciplinam asceticam promovit, institutiones solitarias condidit et directionem spiritualem propagavit quae in vita monastica Italica postea influit.', '951–1027'),
('saint-aloysius-gonzaga', 'Sanctus Aloysius Gonzaga', 'Novitius Societatis Iesu et patronus iuventutis et studentium.', 'Aloysius Gonzaga, novitius Societatis Iesu, pietate et caritate erga aegrotos clarus est; morte praeacuta ob pestem vitam sanctam exemplificavit et iuventuti patronatum obtulit.', '1568–1591'),
('saint-paulinus-of-nola', 'Sanctus Paulinus Nola', 'Episcopus, poeta et exemplar caritatis Christianae.', 'Paulinus Nolaensis episcopus et litteratus fuit qui episcopalem vocationem, caritatem largam et patronatum monachicum promovebat; epistulae et carmina eius culturalem et spiritualem vitae civitatis auxerunt.', '354–431'),
('saint-john-fisher', 'Sanctus Ioannes Fisher', 'Episcopus, theologus et martyr Anglicus.', 'Ioannes Fisher doctus et pastor, pro principiis ecclesiae et conscientiae staeterit; ob constantiam doctrinam a rege oppositus et morti subiectus est, memoriamque suam in testimonio conscientiae reliquit.', '1469–1535'),
('saint-thomas-more', 'Sanctus Thomas More', 'Consiliarius regius, iurisconsultus et martyr conscientiae.', 'Thomas More publicae officiis cum fide privata conjunctis principia sua in causa conscientiae fortiter defendit; exsecutione mortis obfirmam constantiam suam exemplavit et posteritati reliquit.', '1478–1535'),
('saint-peter-apostle', 'Sanctus Petrus, Apostolus', 'Princeps Apostolorum et testis fundamentalis Ecclesiae Romanae.', 'Petrus, antea Simon dictus, a Christo vocatus est et missione pastorali praecipua inter Apostolos insignitus. Novum Testamentum eum exhibet testem praecipuum ministerii, Passionis et Resurrectionis Iesu, atque in communitate apostolica primarium. Traditio christiana docet eum Romae ministerium exercuisse ibique sub Nerone martyrium consummasse. In Ecclesia colitur ut Apostolus, pastor et signum permanens continuitatis apostolicae.', 'saec. I'),
('saint-cyril-of-alexandria', 'Sanctus Cyrillus Alexandrinus', 'Episcopus et defensor christologiae orthodoxae.', 'Cyrillus Alexandrinus in controversiis christologicis V saeculi claram doctrinam de unione personarum in Christo proposuit, contra Nestorium pugnavit et per epistulas et sermones doctrinam orthodoxam firmavit.', 'c. 376–444'),
('saint-irenaeus', 'Sanctus Irenaeus', 'Episcopus, apologeta et doctor anitquus fidei.', 'Irenaeus Lugdunensis adversus haereses scripsit, apostolicam traditionem et regulam fidei defendit, et opus eius "Adversus Haereses" fundamentum theologiae et ecclesiologiae patristicae praebet.', 'c. 130–202')
-- ('first-martyrs-of-holy-roman-church', 'Primi Martyrum Sanctae Ecclesiae Romanae', 'Titulus collectivus primorum martyrum Romae et memoriae martyrologicae.', 'Primi Martyrum Sanctae Ecclesiae Romanae primos Christianos Romae commemorant qui pro fide passi sunt et quorum sepulturae et cultus martyrologium et piatem civitatis aedificarunt.', 'saec. I')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- JULY SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-thomas-apostle', 'Saint Thomas, Apostle',
  NULL, NULL, NULL, TRUE,
  72, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='MYLAPORE'),
  (SELECT id FROM places WHERE code='MYLAPORE')
),
(
  'saint-elizabeth-of-portugal', 'Saint Elizabeth of Portugal',
  1271, 1, 4, FALSE,
  1336, 7, 4, FALSE,
  14,
  (SELECT id FROM places WHERE code='SARAGOSSA'),
  (SELECT id FROM places WHERE code='ESTREMOZ'),
  (SELECT id FROM places WHERE code='LISBON')
),
(
  'saint-anthony-zaccaria', 'Saint Anthony Zaccaria',
  1502, NULL, NULL, TRUE,
  1539, 7, 5, FALSE,
  16,
  (SELECT id FROM places WHERE code='CREMONA'),
  (SELECT id FROM places WHERE code='CREMONA'),
  (SELECT id FROM places WHERE code='MILAN')
),
(
  'saint-maria-goretti', 'Saint Maria Goretti',
  1890, 10, 16, FALSE,
  1902, 7, 6, FALSE,
  20,
  (SELECT id FROM places WHERE code='CORINALDO'),
  (SELECT id FROM places WHERE code='NETTUNO'),
  (SELECT id FROM places WHERE code='LE_FERRIERE')
),
(
  'saint-augustine-zhao-rong', 'Saint Augustine Zhao Rong and Companions',
  1746, NULL, NULL, TRUE,
  1815, 1, 27, TRUE,
  19,
  (SELECT id FROM places WHERE code='WUCHUAN_GZ'),
  (SELECT id FROM places WHERE code='CHENGDU'),
  (SELECT id FROM places WHERE code='CHINA')
),
(
  'saint-benedict', 'Saint Benedict, Abbot',
  480, 3, 2, TRUE,
  547, 3, 21, FALSE,
  6,
  (SELECT id FROM places WHERE code='NORCIA'),
  (SELECT id FROM places WHERE code='MONTECASSINO'),
  (SELECT id FROM places WHERE code='MONTECASSINO')
),
(
  'saint-henry', 'Saint Henry',
  973, 5, 6, TRUE,
  1024, 7, 13, FALSE,
  11,
  (SELECT id FROM places WHERE code='BAD_ABBACH'),
  (SELECT id FROM places WHERE code='GOTTINGEN'),
  (SELECT id FROM places WHERE code='HOLY_ROMAN_EMPIRE')
),
(
  'saint-camillus-de-lellis', 'Saint Camillus de Lellis',
  1550, 5, 25, TRUE,
  1614, 7, 14, FALSE,
  17,
  (SELECT id FROM places WHERE code='BUCCHIANICO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-bonaventure', 'Saint Bonaventure',
  1217, NULL, NULL, TRUE,
  1274, 7, 15, FALSE,
  13,
  (SELECT id FROM places WHERE code='BAGNOREGIO'),
  (SELECT id FROM places WHERE code='LYON'),
  (SELECT id FROM places WHERE code='PARIS')
),
-- (
--   'our-lady-of-mount-carmel', 'Our Lady of Mount Carmel',
--   NULL, NULL, NULL, TRUE,
--   NULL, 7, 16, TRUE,
--   NULL,
--   NULL, NULL,
--   (SELECT id FROM places WHERE code='MOUNT_CARMEL')
-- ),
(
  'saint-apollinaris', 'Saint Apollinaris',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  2,
  NULL,
  (SELECT id FROM places WHERE code='RAVENNA'),
  (SELECT id FROM places WHERE code='RAVENNA')
),
(
  'saint-lawrence-of-brindisi', 'Saint Lawrence of Brindisi',
  1559, 7, 22, TRUE,
  1619, 7, 22, FALSE,
  16,
  (SELECT id FROM places WHERE code='BRINDISI'),
  (SELECT id FROM places WHERE code='LISBON'),
  (SELECT id FROM places WHERE code='ITALY')
),
(
  'saint-mary-magdalene', 'Saint Mary Magdalene',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='MAGDALA'),
  (SELECT id FROM places WHERE code='SAINTE_BEAUME'),
  (SELECT id FROM places WHERE code='GALILEE')
),
(
  'saint-bridget', 'Saint Bridget',
  1303, NULL, NULL, TRUE,
  1373, 7, 23, FALSE,
  14,
  (SELECT id FROM places WHERE code='UPPLAND'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-sharbel-makhluf', 'Saint Sharbel Makhluf',
  1828, 5, 8, FALSE,
  1898, 12, 24, FALSE,
  19,
  (SELECT id FROM places WHERE code='BEKAAKAFRA'),
  (SELECT id FROM places WHERE code='ANNAYA_MONASTERY'),
  (SELECT id FROM places WHERE code='ANNAYA_MONASTERY')
),
(
  'saint-james-apostle', 'Saint James, Apostle',
  NULL, NULL, NULL, TRUE,
  44, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='GALILEE')
),
(
  'saint-joachim', 'Saint Joachim',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL, (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-anne', 'Saint Anne',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL, (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-martha-of-bethany', 'Saint Martha of Bethany',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL,
  (SELECT id FROM places WHERE code='BETHANY')
),
(
  'saint-mary-of-bethany', 'Saint Mary of Bethany',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL,
  (SELECT id FROM places WHERE code='BETHANY')
),
(
  'saint-lazarus-of-bethany', 'Saint Lazarus of Bethany',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  NULL, NULL,
  (SELECT id FROM places WHERE code='BETHANY')
),
(
  'saint-peter-chrysologus', 'Saint Peter Chrysologus',
  406, NULL, NULL, TRUE,
  450, 7, 31, TRUE,
  5,
  (SELECT id FROM places WHERE code='IMOLA'),
  (SELECT id FROM places WHERE code='IMOLA'),
  (SELECT id FROM places WHERE code='RAVENNA')
),
(
  'saint-ignatius-of-loyola', 'Saint Ignatius of Loyola',
  1491, 10, 23, TRUE,
  1556, 7, 31, FALSE,
  16,
  (SELECT id FROM places WHERE code='LOYOLA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-thomas-apostle', 'Saint Thomas, Apostle', 'Apostle and missionary traditionally associated with India.', 'Thomas the Apostle is venerated as one of the Twelve who witnessed the resurrection and carried the Gospel to distant lands according to tradition; various Christian communities claim his missionary activity across Asia, and he is particularly honored in the Saint-Thomas Christian tradition of India for his foundational role in establishing local churches.', '1st century'),
('saint-elizabeth-of-portugal', 'Saint Elizabeth of Portugal', 'Queen and peacemaker noted for charity and mediation.', 'Elizabeth of Portugal, queen and widow, became known for her charitable works, peacemaking efforts between warring factions and devotion to the poor; she combined royal responsibility with personal piety and was venerated for her charitable legacy and reconciliation efforts in fourteenth‑century Iberia.', '† 1336'),
('saint-anthony-zaccaria', 'Saint Anthony Zaccaria', 'Priest and founder engaged in reform and pastoral renewal.', 'Anthony Zaccaria was a sixteenth‑century priest who founded the Clerics Regular of St Paul (Barnabites) and promoted pastoral renewal, devotion and care for the sick and poor; his efforts emphasized spiritual reform and active charity in the context of Catholic renewal in northern Italy.', '1502–1539'),
('saint-maria-goretti', 'Saint Maria Goretti', 'Virgin and martyr; model of forgiveness and purity.', 'Maria Goretti is remembered for her youth, steadfastness in the face of assault, and her remarkable forgiveness of her assailant before her death; her life and martyrdom inspired devotion to chastity, reconciliation and the sanctity of youthful vocation, and she became a powerful modern symbol of mercy and moral courage.', '1890–1902'),
('saint-augustine-zhao-rong', 'Saint Augustine Zhao Rong and Companions', 'Chinese priest and martyr who led a group of faithful during persecution.', 'Augustine Zhao Rong was a Chinese convert and priest born in Wuchuan, Guizhou, who ministered in Sichuan and was arrested and executed in Chengdu during early 19th‑century persecutions; he and his companions are honored for their pastoral courage, fidelity under pressure and witness that strengthened Catholic communities in China.', '1746–1815'),
('saint-benedict', 'Saint Benedict, Abbot', 'Founder of Western monasticism and author of a monastic rule.', 'Benedict of Nursia established a monastic pattern centered on prayer, work and communal stability that deeply shaped Western monasticism; his Rule provided a balanced program of spiritual life and community governance, and his foundation at Montecassino became a model for monastic reform and cultural renewal throughout medieval Europe.', 'c. 480–547'),
('saint-henry', 'Saint Henry', 'Holy Roman Emperor noted for piety and ecclesial patronage.', 'Henry II, Holy Roman Emperor, combined imperial rule with notable support for the Church, founding churches, promoting monastic life and encouraging missionary activity; his reign is remembered for efforts to strengthen Christian institutions and for his personal piety recognized in his veneration as a saint.', '973–1024'),
('saint-camillus-de-lellis', 'Saint Camillus de Lellis', 'Priest and founder dedicated to the care of the sick.', 'Camillus de Lellis founded the Ministers of the Sick (Camillians) and pioneered hospitaller care marked by professional charity, organized nursing and a special emphasis on service to the most vulnerable; his reforms shaped early modern Christian healthcare and inspired the institutional care of the ill.', '1550–1614'),
('saint-bonaventure', 'Saint Bonaventure', 'Franciscan minister general, bishop and Doctor of the Church.', 'Bonaventure combined mystical theology, pastoral sensitivity and administrative skill as a leader of the Franciscan Order and later as a bishop; his theological synthesis integrated Augustinian and Franciscan spirituality and his writings and leadership helped the mendicant movement mature intellectually and spiritually in the thirteenth century.', '1217–1274'),
-- ('our-lady-of-mount-carmel', 'Our Lady of Mount Carmel', 'Title of the Blessed Virgin Mary associated with the Carmelite tradition.', 'Our Lady of Mount Carmel is a Marian title rooted in the spiritual heritage of the Carmelites on Mount Carmel; devotion under this title emphasizes Mary''s maternal care, contemplative witness and patronage of those consecrated to prayer and apostolic service.', ''),
('saint-apollinaris', 'Saint Apollinaris', 'Bishop and martyr traditionally associated with Ravenna.', 'Apollinaris is venerated in the West as an early bishop and martyr linked with the city of Ravenna; his cult and episcopal legacy informed local Christian identity and episcopal succession in northern Italy.', '1st century'),
('saint-lawrence-of-brindisi', 'Saint Lawrence of Brindisi', 'Capuchin friar, scholar and diplomat known for preaching and theological work.', 'Lawrence of Brindisi, a Capuchin scholar and preacher, combined linguistic skill, theological depth and pastoral zeal in missions and diplomatic efforts; his preaching, writings and service in areas of conflict contributed to Catholic renewal and he is remembered for both spiritual insight and practical leadership.', '1559–1619'),
('saint-mary-magdalene', 'Saint Mary Magdalene', 'Follower of Jesus, witness to the Resurrection and apostle to the apostles.', 'Mary Magdalene is honored as a devoted disciple of Jesus who stood by him at the cross, discovered the empty tomb and announced the resurrection to the apostles; her witness has inspired a rich devotional and theological tradition regarding discipleship, repentance and proclamation.', '1st century'),
('saint-bridget', 'Saint Bridget of Sweden', 'Mystic, founder and advocate for reform and pilgrimage.', 'Bridget of Sweden, mystic and founder of a religious family, combined prophetic prayer, hospitality to pilgrims and letters of spiritual counsel to rulers and church leaders; her influence extended across northern Europe and she is revered for her mystical writings and commitment to ecclesial reform.', '1303–1373'),
('saint-sharbel-makhluf', 'Saint Sharbel Makhluf', 'Maronite monk and hermit noted for asceticism and intercessory devotion.', 'Sharbel Makhluf lived as a Maronite monk and hermit in Lebanon, cultivating a life of silence, ascetic prayer and pastoral simplicity; after his death he became a popular focus of devotion for miracles and intercession, especially among Eastern Christians.', '1828–1898'),
('saint-james-apostle', 'Saint James the Greater', 'Apostle and patron associated with pilgrimage to Compostela.', 'James the Greater, son of Zebedee, is venerated as an apostolic missionary whose tomb at Santiago de Compostela became one of the great pilgrimage centers of medieval Europe, symbolizing the spread of the Gospel in the Iberian peninsula and the privileged role of apostolic witness.', '1st century'),
(
  'saint-joachim',
  'Saint Joachim',
  'Righteous elder of Israel, venerated in Christian tradition as the father of the Blessed Virgin Mary.',
  'Saint Joachim is honored in Christian tradition as the father of the Blessed Virgin Mary and therefore as one of the holy ancestors nearest to the mystery of the Incarnation. Although the canonical Gospels do not record biographical details about him, ancient ecclesial tradition preserved his memory as a just and faithful man of Israel, devoted to prayer, covenant fidelity, and trust in God''s promises.\n\nWithin the developing liturgical and devotional life of the Church, Joachim came to represent the holiness of family life rooted in expectation of the Messiah. His witness is contemplatively linked to the long preparation of salvation history: through generations of hidden fidelity, God readies the coming of Christ. In this sense, Joachim is not remembered primarily for public acts or writings, but for the sanctity of ordinary, persevering faith that receives and transmits divine blessing.\n\nTheologically, Joachim''s significance is inseparable from his relation to Mary. By venerating him, the Church contemplates the concrete human lineage through which the Word became flesh. Devotion to him therefore highlights the dignity of parenthood, the vocation of elders in transmitting faith, and the holiness possible in quiet obedience to God over time.\n\nIn pastoral spirituality, Saint Joachim is invoked as patron of grandparents and of families seeking constancy in prayer and trust. His memory encourages believers to value hidden virtue, patient hope, and the intergenerational transmission of faith. He is commonly celebrated with Saint Anne, not as a legendary pair detached from doctrine, but as witnesses to the familial soil in which the Mother of the Lord was formed for her unique vocation.',
  '1st century'
),
(
  'saint-anne',
  'Saint Anne',
  'Venerated mother of the Blessed Virgin Mary and model of maternal faith in Christian tradition.',
  'Saint Anne is revered by the Church as the mother of the Blessed Virgin Mary and thus as grandmother in the earthly lineage of Jesus Christ. While the canonical Scriptures do not provide direct biographical narratives about her, ancient Christian tradition has long honored her as a woman of prayer, fidelity, and maternal dedication within the people of Israel.\n\nIn liturgical memory, Anne embodies the sanctity of motherhood lived in faith, patience, and openness to God''s providence. Her place in Christian devotion reflects the Church''s contemplation of salvation history not only through prophets and apostles, but also through humble family life in which grace is quietly received and transmitted. In honoring Anne, the Church gives thanks for the domestic and intergenerational context in which Mary was nurtured and prepared for her mission.\n\nAnne''s spiritual significance extends to ecclesial and pastoral life: she is frequently invoked as patroness of mothers, grandmothers, women who long for children, and families seeking perseverance in faith. Her example emphasizes that holiness can flourish in hidden daily fidelity, tenderness, and instruction in the ways of God.\n\nTogether with Joachim, Saint Anne belongs to the living memory of the Church''s reverence for the human roots of the Incarnation. Their commemoration invites believers to esteem family vocation, to cherish elders as transmitters of wisdom, and to recognize God''s salvific work unfolding through generations. In this way Anne remains a powerful figure of maternal trust, spiritual fruitfulness, and enduring hope.',
  '1st century'
),
('saint-martha-of-bethany', 'Saint Martha of Bethany', 'Disciple of the Lord in Bethany, remembered for service and faith.', 'Martha of Bethany appears in the Gospel as a close friend of Jesus, together with her siblings Mary and Lazarus. She is remembered both for practical hospitality and for a profound confession of faith in Christ. In Christian memory, Martha represents active charity united with trust in the Lord, showing that service and contemplation belong together in discipleship.', '1st century'),
('saint-mary-of-bethany', 'Saint Mary of Bethany', 'Disciple of the Lord in Bethany, remembered for listening and loving devotion.', 'Mary of Bethany, sister of Martha and Lazarus, is honored in the Gospel tradition for contemplative attentiveness to the word of Christ and for loving devotion toward him. Her figure has long been read as an icon of receptive discipleship: she listens, believes, and responds with reverence to the presence of the Lord.', '1st century'),
('saint-lazarus-of-bethany', 'Saint Lazarus of Bethany', 'Friend of Jesus and witness to the power of Christ over death.', 'Lazarus of Bethany, brother of Martha and Mary, is remembered above all through the Gospel sign in which Christ raises him from the tomb. His memory points to faith in the resurrection and to the revelation of Jesus as Lord of life. In liturgical tradition he is honored as a close companion of the Lord and a witness to divine mercy.', '1st century'),
('saint-peter-chrysologus', 'Saint Peter Chrysologus', 'Bishop of Ravenna and celebrated preacher of the fifth century.', 'Peter Chrysologus, bishop of Ravenna, was famed for his concise and powerful sermons, theological clarity and pastoral concern; his preaching and liturgical leadership made him a notable figure in the formative centuries of the Western Church.', '406–450'),
('saint-ignatius-of-loyola', 'Saint Ignatius of Loyola', 'Founder of the Society of Jesus and architect of Ignatian spirituality.', 'Ignatius of Loyola founded the Jesuit order, developed the Spiritual Exercises and promoted a disciplined, contemplative apostolate aimed at personal conversion, education and missionary outreach; his influence reshaped Catholic formation and missionary strategy in the early modern period.', '1491–1556')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-thomas-apostle', 'Saint Thomas, apôtre', 'Apôtre et missionnaire traditionnellement associé à l''Inde.', 'Thomas l''Apôtre est honoré comme témoin de la Résurrection et, selon la tradition ancienne, comme évangélisateur de régions lointaines; la tradition des chrétiens de saint Thomas en Inde le considère comme le fondateur des premières communautés chrétiennes locales, illustrant la diffusion apostolique au-delà du monde méditerranéen.', 'Ier siècle'),
('saint-elizabeth-of-portugal', 'Sainte Élisabeth du Portugal', 'Reine et pacificatrice, connue pour sa charité et sa médiation.', 'Élisabeth du Portugal, reine devenue veuve, est célébrée pour son dévouement aux pauvres, ses efforts de médiation entre factions rivales et son exemple de piété royale; sa vie allia responsabilité politique et œuvres de miséricorde qui lui valu une vénération durable.', '† 1336'),
('saint-anthony-zaccaria', 'Saint Antoine Zaccaria', 'Prêtre et fondateur engagé dans le renouveau pastoral.', 'Antoine Zaccaria fonda la congrégation des Barnabites et œuvra pour le renouveau spirituel et social en Italie du Nord au XVIe siècle; il promut la formation du clergé, la dévotion et les œuvres de charité, insistant sur la sanctification par l''action apostolique.', '1502–1539'),
('saint-maria-goretti', 'Sainte Maria Goretti', 'Vierge et martyre, modèle de pardon et de pureté.', 'Maria Goretti est vénérée pour son refus de céder à la violence, son pardon donné à son agresseur avant de mourir et son exemple de chasteté et de réconciliation; sa courte vie et son martyre ont inspiré une dévotion vivace pour la sainteté juvénile et le pardon chrétien.', '1890–1902'),
('saint-augustine-zhao-rong', 'Saint Augustin Zhao Rong et compagnons', 'Prêtre chinois et martyr, leader parmi les martyrs du Sichuan.', 'Augustin Zhao Rong, né à Wuchuan (Guizhou) et mort à Chengdu (Sichuan), est honoré pour son ministère pastoral et son témoignage durant les persécutions du début du XIXe siècle; son sacrifice et celui de ses compagnons soutinrent la fidélité des communautés catholiques en Chine et furent reconnus comme exemple de courage et de foi.', '1746–1815'),
('saint-benedict', 'Saint Benoît, abbé', 'Fondateur du monachisme occidental et auteur d''une règle monastique.', 'Benoît de Nursie institua une forme de vie monastique fondée sur la prière, le travail et la stabilité communautaire; sa Règle offrit un équilibre entre vie spirituelle et organisation pratique, et Montecassino, centre de son activité, devint modèle de réforme monastique et d''influence culturelle en Europe médiévale.', 'v. 480–547'),
('saint-henry', 'Saint Henri', 'Empereur, reconnu pour sa piété et son patronage de l''Église.', 'Henri II, empereur du Saint-Empire, se distingua par son soutien aux institutions ecclésiales, la fondation d''églises et la promotion de la vie monastique; sa piété personnelle et son action politique en faveur de l''Église contribuèrent à sa vénération en tant que saint protecteur des institutions chrétiennes.', '973–1024'),
('saint-camillus-de-lellis', 'Saint Camille de Lellis', 'Prêtre et fondateur dédié aux soins des malades.', 'Camille de Lellis fonda l''ordre des Camilliens et institua des formes organisées de soin hospitalier marquées par la charité professionnelle, le service des malades et l''attention aux plus vulnérables; son œuvre marque une étape importante dans l''histoire de l''aide sanitaire chrétienne.', '1550–1614'),
('saint-bonaventure', 'Saint Bonaventure', 'Ministre général franciscain, évêque et docteur de l''Église.', 'Bonaventure allia mystique et sens pastoral, organisant la vie franciscaine et contribuant à sa maturation intellectuelle; théologien et guide spirituel, il sut concilier expérience contemplative et ordre, laissant une œuvre théologique et pastorale considérable.', '1217–1274'),
-- ('our-lady-of-mount-carmel', 'Notre-Dame du Mont-Carmel', 'Titre marial lié à la tradition carmélite et à la montagne de l''Élie.', 'Notre-Dame du Mont-Carmel renvoie à la spiritualité contemplative des Carmels et à la dévotion mariale qui souligne la protection maternelle, la vie de prière et l''appel à la sainteté pour ceux qui suivent la vocation contemplative ou apostolique.', ''),
('saint-apollinaris', 'Saint Apollinaire', 'Évêque et martyr traditionnellement associé à Ravenne.', 'Apollinaire est vénéré comme évêque des premières communautés de Ravenne et comme martyr dont le culte a façonné l''identité ecclésiale locale; sa mémoire a contribué à la formation de la tradition épiscopale dans le nord de l''Italie.', 'Ier siècle'),
('saint-lawrence-of-brindisi', 'Saint Laurent de Brindes', 'Frère capucin, érudit et prédicateur diplomate.', 'Laurent de Brindes, capucin et théologien, se fit connaître par son zèle missionnaire, sa maîtrise des langues et son office de prédicateur et diplomate; il allia profondeur doctrinale et engagement pastoral, contribuant à la vie intellectuelle et missionnaire de son époque.', '1559–1619'),
('saint-mary-magdalene', 'Sainte Marie-Madeleine', 'Discipule de Jésus, témoin de la Résurrection et annonciatrice.', 'Marie-Madeleine est célébrée comme disciple fidèle qui resta auprès du Christ, découvrit le tombeau vide et annonça la Résurrection; sa figure a nourri une riche tradition spirituelle sur la conversion, le service et la proclamation de la foi.', 'Ier siècle'),
('saint-bridget', 'Sainte Brigitte de Suède', 'Mystique, fondatrice et promotrice de réforme et de pèlerinage.', 'Brigitte de Suède, mystique et fondatrice d''une famille religieuse, fut connue pour ses révélations, son hospitalité envers les pèlerins et ses conseils spirituels adressés aux puissants; son influence s''étendit au-delà de la Suède et marqua la piété médiévale nordique.', '1303–1373'),
('saint-sharbel-makhluf', 'Saint Charbel Makhlouf', 'Moine maronite et ermite, célèbre pour son ascèse et son intercession.', 'Charbel Makhlouf mena une vie d''ermitage et de prière au Liban; après sa mort, sa tombe devint lieu de dévotion populaire et lui fut attribué de nombreux récits de guérisons, renforçant son statut de saint intercesseur dans la tradition orientale et universelle.', '1828–1898'),
('saint-james-apostle', 'Saint Jacques le Majeur', 'Apôtre et patron lié au pèlerinage de Compostelle.', 'Jacques le Majeur, fils de Zébédée, est honoré comme apôtre actif dans la péninsule ibérique selon la tradition; son tombeau à Santiago de Compostela fit de ce lieu un centre majeur de pèlerinage médiéval et un symbole de l''expansion missionnaire chrétienne en Hispanie.', 'Ier siècle'),
(
  'saint-joachim',
  'Saint Joachim',
  'Juste d’Israël, vénéré dans la tradition chrétienne comme père de la Bienheureuse Vierge Marie.',
  'Saint Joachim est honoré dans la tradition chrétienne comme père de la Bienheureuse Vierge Marie, et donc comme l’un des ancêtres les plus proches du mystère de l’Incarnation. Même si les Évangiles canoniques ne donnent pas de biographie détaillée, l’ancienne tradition ecclésiale a conservé sa mémoire comme celle d’un homme juste et fidèle, enraciné dans la prière, l’obéissance à l’Alliance et l’espérance des promesses de Dieu.\n\nDans la vie liturgique et spirituelle de l’Église, Joachim représente la sainteté familiale vécue dans l’attente du Messie. Son témoignage renvoie à la longue préparation de l’histoire du salut : à travers des générations de fidélité cachée, Dieu prépare la venue du Christ. Joachim n’est donc pas d’abord retenu pour des œuvres publiques ou des écrits, mais pour la sainteté d’une foi humble et persévérante qui accueille et transmet la bénédiction divine.\n\nSur le plan théologique, l’importance de Joachim est inséparable de son lien à Marie. En le vénérant, l’Église contemple la généalogie humaine concrète par laquelle le Verbe s’est fait chair. La dévotion à son égard met en lumière la dignité de la paternité, la mission des anciens dans la transmission de la foi et la fécondité de l’obéissance silencieuse à Dieu.\n\nDans la pastorale, saint Joachim est invoqué comme patron des grands-parents et des familles en quête de persévérance dans la prière et la confiance. Sa mémoire invite à valoriser les vertus cachées, l’espérance patiente et la transmission intergénérationnelle de la foi. Il est souvent célébré avec sainte Anne, non comme un simple souvenir pieux, mais comme témoin de la terre familiale où la Mère du Seigneur fut préparée à sa vocation unique.',
  'Ier siècle'
),
(
  'saint-anne',
  'Sainte Anne',
  'Mère de la Bienheureuse Vierge Marie, vénérée comme modèle de foi maternelle dans la tradition chrétienne.',
  'Sainte Anne est vénérée par l’Église comme mère de la Bienheureuse Vierge Marie et, par conséquent, comme grand-mère dans la lignée terrestre de Jésus-Christ. Bien que l’Écriture canonique ne livre pas de récit biographique direct, la tradition chrétienne ancienne l’honore depuis longtemps comme femme de prière, de fidélité et de don maternel au sein du peuple d’Israël.\n\nDans la mémoire liturgique, Anne incarne la sainteté de la maternité vécue dans la foi, la patience et l’abandon à la providence de Dieu. Sa place dans la dévotion chrétienne exprime la contemplation d’une histoire du salut qui passe non seulement par les prophètes et les apôtres, mais aussi par la vie familiale humble où la grâce est reçue et transmise discrètement. En honorant Anne, l’Église rend grâce pour le milieu domestique et intergénérationnel dans lequel Marie a été formée et préparée à sa mission.\n\nLa portée spirituelle de sainte Anne est également pastorale : elle est fréquemment invoquée comme patronne des mères, des grands-mères, des femmes désirant un enfant et des familles qui cherchent à demeurer fermes dans la foi. Son exemple montre que la sainteté peut croître dans la fidélité quotidienne cachée, la tendresse et l’éducation aux voies de Dieu.\n\nAvec Joachim, sainte Anne appartient à la mémoire vivante de l’Église qui vénère les racines humaines de l’Incarnation. Leur commémoration invite les fidèles à estimer la vocation familiale, à reconnaître les anciens comme passeurs de sagesse et à discerner l’action salvifique de Dieu à travers les générations. Anne demeure ainsi une figure majeure de confiance maternelle, de fécondité spirituelle et d’espérance durable.',
  'Ier siècle'
),
('saint-martha-of-bethany', 'Sainte Marthe de Béthanie', 'Disciple du Seigneur à Béthanie, mémoire de service et de foi.', 'Marthe de Béthanie apparaît dans l’Évangile comme une amie proche de Jésus, avec ses frère et sœur, Marie et Lazare. Elle est honorée à la fois pour son hospitalité concrète et pour une profession de foi profonde dans le Christ. Dans la tradition chrétienne, Marthe manifeste l’unité entre charité active et confiance en Dieu.', 'Ier siècle'),
('saint-mary-of-bethany', 'Sainte Marie de Béthanie', 'Disciple du Seigneur à Béthanie, figure d’écoute et de dévotion aimante.', 'Marie de Béthanie, sœur de Marthe et de Lazare, est vénérée dans la tradition évangélique pour son écoute contemplative de la parole du Christ et pour son attachement aimant envers lui. Sa figure est souvent lue comme une icône de la disponibilité du disciple: écouter, croire et répondre avec révérence à la présence du Seigneur.', 'Ier siècle'),
('saint-lazarus-of-bethany', 'Saint Lazare de Béthanie', 'Ami de Jésus et témoin de la puissance du Christ sur la mort.', 'Lazare de Béthanie, frère de Marthe et de Marie, est surtout rappelé par le signe évangélique où le Christ le relève du tombeau. Sa mémoire renvoie à la foi en la résurrection et à la révélation de Jésus comme Seigneur de la vie. Dans la tradition liturgique, il est honoré comme proche du Seigneur et témoin de la miséricorde divine.', 'Ier siècle'),
('saint-peter-chrysologus', 'Saint Pierre Chrysologue', 'Évêque de Ravenne et prédicateur renommé du Ve siècle.', 'Pierre Chrysologue fut connu pour ses sermons concis et puissants, sa clarté théologique et son zèle pastoral; en tant qu''évêque de Ravenne il contribua à la formation liturgique et doctrinale de l''Église occidentale de son temps.', '406–450'),
('saint-ignatius-of-loyola', 'Saint Ignace de Loyola', 'Fondateur de la Compagnie de Jésus et artisan de la spiritualité ignatienne.', 'Ignace de Loyola fonda la Compagnie de Jésus et composa les Exercices spirituels, offrant un itinéraire de conversion personnelle, de discernement et d''apostolat; sa pédagogie spirituelle et sa vision missionnaire transformèrent la formation chrétienne et la présence de l''Église dans le monde moderne.', '1491–1556')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-thomas-apostle', 'Sanctus Thomas Apostolus', 'Apostolus et missionarius, traditus in Indiam.', 'Thomas Apostolus unus ex Duodecim est, qui secundum traditionem Evangelium in terras longinquas portavit et ecclesias fundavit; in variis traditionibus Orientis et Indiae commemoratur ut praeco fidei et solidator ecclesiarum localium.', 'saec. I'),
('saint-elizabeth-of-portugal', 'Sancta Elisabeth Lusitaniae', 'Regina et pacatrix, nota ob caritatem et mediationem.', 'Elisabetha, regina Lusitaniae, virtute caritatis et labore pro pacificatione inter principes celebrata est; post viduitatem vitam erga pauperes et consolationem in regno suis operibus illustravit.', '† 1336'),
('saint-anthony-zaccaria', 'Sanctus Antonius Zaccaria', 'Presbyter et fundator, actor renovationis pastoralis.', 'Antonius Zaccaria, saeculo XVI presbyter, congregationem clericorum regularium instituit et laborem in renovo spirituali et cura sanorum suscepit, promovens disciplinae clericalis et devotionis popularis incrementum.', '1502–1539'),
('saint-maria-goretti', 'Sancta Maria Goretti', 'Virgo et martyr, exemplar indulgentiae et pudicitiae.', 'Maria Goretti, iuvenis martyr, ob constantiam in fide et misericordiam erga aggressorem postremum memoratur; cultus eius modernus adorationem innocentiae et reconciliationis excitavit.', '1890–1902'),
('saint-augustine-zhao-rong', 'Sanctus Augustinus Zhao Rong et Socii', 'Presbyter Sinensis et martyres, testes fidei in Szechuania.', 'Augustinus Zhao Rong, natus in Wuchuan (Guizhou) et decollatus in Chengdu (Sichuan), pastoribus et fidelibus consociatus, martyrio coronatus est; memoria eorum in Ecclesia Sinica munus constantiae et fidelitatis refert.', '1746–1815'),
('saint-benedict', 'Sanctus Benedictus Abbas', 'Fundator monachismi occidentalem et regulator vitae monasticae.', 'Benedictus Nursiensis regulam vitae monasticae composuit quae orationem, laborem et stabilitatem communitatis coniungit; fundatio Montecassini centrum reformae et exemplar monasticum in Europa facta est.', 'c. 480–547'),
('saint-henry', 'Sanctus Henricus', 'Imperator pius et patronus institutorum ecclesiasticorum.', 'Henricus II, Imperator Romanus Sacri Imperii, pius et benefactor ecclesiae, ecclesias fundavit et monachatum sustinuit; ob devotionem et curam institutionum Christianarum cultus sanctitatis ei tribuitur.', '973–1024'),
('saint-camillus-de-lellis', 'Sanctus Camillus de Lellis', 'Presbyter et fundator ministrorum aegrotorum.', 'Camillus de Lellis institutum Ministrorum Aegrotorum condidit, curam infirmorum institutionaliter ordinans et caritati professionalis formam dedit quae in historia hospitalitatis Christianitatis momentum habet.', '1550–1614'),
('saint-bonaventure', 'Sanctus Bonaventura', 'Ministri generalis Franciscanus, episcopus et Ecclesiae doctor.', 'Bonaventura theologus mysticus et rector ordinis, doctrinam contemplativam cum administrativa prudentia coniunxit; opera et magisterium eius ad maturationem spiritualem et intellectualem mendicantium contulit.', '1217–1274'),
-- ('our-lady-of-mount-carmel', 'Beata Maria Virgo de Monte Carmelo', 'Titulus Marianus cum traditione Carmelitarum.', 'Beata Maria Virgo de Monte Carmelo titulus est Marianus qui devotionem contemplativam et protectionem maternam exhibet, traditio Carmelitarum in monte Carmeli radicata.', ''),
('saint-apollinaris', 'Sanctus Apollinaris', 'Episcopus et martyr, traditus cum Ravenna.', 'Apollinaris, episcopus antiquus et martyr, in Ravenna cultus habet; eius memoria ad formandam identitatem ecclesiae locales pertinuit.', 'saec. I'),
('saint-lawrence-of-brindisi', 'Sanctus Laurentius Brundisii', 'Frater Capuccinus, eruditus et praedicator.', 'Laurentius Brundisii Capuccinus, linguarum peritus et praedicator, missionibus et controversiis doctrinalibus strenue operatus est; ingenium et pietas eius in ministerio et litteris extiterunt.', '1559–1619'),
('saint-mary-magdalene', 'Sancta Maria Magdalena', 'Discipula Christi, testis Resurrectionis et apostola apostolorum.', 'Maria Magdalena, fidelis discipula Christi, ad crucem stetit et tumulum repertum nuntians primarum inter apostolos testimonium resurrectionis promulgavit; veneratio eius multas traditiones devotionis et exegeseos inspiravit.', 'saec. I'),
('saint-bridget', 'Sancta Brigitta Suecica', 'Mystica, fundatrix et advocata reformae.', 'Brigitta Suecica mystica et fundatrix familiae religiosae, revelationibus et ad reges scripta multa, peregrinationibus et operibus caritatis claruit; auctoritas spiritualis eius in Europa Septentrionali late persistebat.', '1303–1373'),
('saint-sharbel-makhluf', 'Sanctus Sharbel Makhluf', 'Monachus Maronita et eremita, notus ob ascese et intercessionem.', 'Sharbel Makhluf in Libano vitam eremiticam agebat, orationi et asceti dedicatus; post obitum miracula et devotionis flatus ei attributi sunt, unde cultus eius in Oriente et transmarinis diffusus est.', '1828–1898'),
('saint-james-apostle', 'Sanctus Jacobus Maior', 'Apostolus et patronus peregrinationis Compostellanae.', 'Jacobus Maior, filius Zebedaei, apostolus et missionarius, tumulus eius in Compostella centrum magnum peregrinationis medii aevi factus est et symbolum evangelizationis in Hispania patefecit.', 'saec. I'),
(
  'saint-joachim',
  'Sanctus Ioachim',
  'Vir iustus Israel, in traditione christiana ut pater Beatae Mariae Virginis veneratus.',
  'Sanctus Ioachim in traditione christiana colitur ut pater Beatae Mariae Virginis, ideoque inter proximos antecessores mysterii Incarnationis numeratur. Quamvis Evangelia canonica de vita eius singularia non tradant, antiqua traditio ecclesialis memoriam eius servavit tamquam viri iusti et fidelis, orationi dediti et promissionibus Dei confidentis.\n\nIn vita liturgica ac spirituali Ecclesiae, Ioachim sanctitatem vitae familiaris in expectatione Messiae repraesentat. Testimonium eius ad longam praeparationem historiae salutis refertur: per generationes fidelitatis absconditae Deus adventum Christi praeparavit. Itaque Ioachim non propter acta publica vel scripta commemoratur, sed propter sanctitatem fidei humilis et perseverantis quae benedictionem divinam recipit ac transmittit.\n\nTheologice momentum Ioachim a relatione ad Mariam separari non potest. Eum venerando Ecclesia humanam genealogiam concretam contemplatur per quam Verbum caro factum est. Huiusmodi devotio dignitatem paternitatis, munus seniorum in fide tradenda, et fructuositatem oboedientiae tacitae erga Deum illustrat.\n\nIn vita pastorali Sanctus Ioachim patronus avorum et familiarum habetur, praesertim eorum qui constantiam in oratione et fiducia quaerunt. Eius memoria fideles monet ut virtutes absconditas, spem patientem et traditionem fidei inter generationes magni aestiment. Saepe cum Sancta Anna celebratur, ut testis humani soli familiaris in quo Mater Domini ad vocationem suam unicam praeparata est.',
  'saec. I'
),
(
  'saint-anne',
  'Sancta Anna',
  'Mater Beatae Mariae Virginis, in traditione christiana exemplar fidei maternae venerata.',
  'Sancta Anna ab Ecclesia colitur ut mater Beatae Mariae Virginis atque ideo avia in terrestri Iesu Christi linea. Etsi Scriptura canonica narrationem biographicam directam non praebet, antiqua traditio christiana eam diuturno tempore honoravit tamquam mulierem orationis, fidelitatis et dedicationis maternae in populo Israel.\n\nIn memoria liturgica Anna sanctitatem maternitatem exprimit in fide, patientia et apertitudine erga providentiam Dei. Locus eius in devotione christiana ostendit Ecclesiam historiam salutis contemplari non solum per prophetas et apostolos, sed etiam per vitam domesticam humilem, ubi gratia quiete recipitur et transmittitur. Annam honorando Ecclesia gratias agit pro contextu familiari et intergenerationali in quo Maria ad missionem suam formata est.\n\nSignificatio spiritualis Annae ad vitam pastoralem quoque pertinet: saepe invocatur patrona matrum, aviarum, feminarum prole carentium, atque familiarum quae in fide perseverare cupiunt. Exemplum eius docet sanctitatem in cotidiana fidelitate abscondita, in teneritudine et in institutione ad vias Dei florere posse.\n\nCum Ioachim, Sancta Anna ad vivam Ecclesiae memoriam pertinet, qua radices humanas Incarnationis venerantur. Eorum commemoratio fideles invitat ut vocationem familialem aestiment, seniores ut sapientiae traditores recognoscant, et opus salutis Dei per generationes agnoscant. Sic Anna manet figura fiduciae maternae, fecunditatis spiritualis et spei perseverantis.',
  'saec. I'
),
('saint-martha-of-bethany', 'Sancta Martha Bethaniae', 'Discipula Domini Bethaniae, memor ministerii et fidei.', 'Martha Bethaniae in Evangelio apparet amica Iesu una cum sorore Maria et fratre Lazaro. Colitur tum propter hospitalitatem operosam tum propter confessionem fidei in Christum. In memoria christiana Martha caritatem activam cum fiducia in Domino coniunctam repraesentat.', 'saec. I'),
('saint-mary-of-bethany', 'Sancta Maria Bethaniae', 'Discipula Domini Bethaniae, figura auditionis et devotionis amantis.', 'Maria Bethaniae, soror Marthae et Lazari, in traditione evangelica veneratur propter attentionem contemplativam ad verbum Christi et propter amantem erga eum devotionem. Figura eius saepe intellegitur ut imago discipulatus receptivi: audit, credit et cum reverentia respondet praesentiae Domini.', 'saec. I'),
('saint-lazarus-of-bethany', 'Sanctus Lazarus Bethaniae', 'Amicus Iesu et testis potestatis Christi super mortem.', 'Lazarus Bethaniae, frater Marthae et Mariae, maxime memoratur in signo evangelico quo Christus eum de sepulcro suscitavit. Eius memoria ad fidem resurrectionis refertur et ad revelationem Iesu ut Domini vitae. In traditione liturgica honoratur ut familiaris Domini et testis misericordiae divinae.', 'saec. I'),
('saint-peter-chrysologus', 'Sanctus Petrus Chrysologus', 'Episcopus Ravennae et praedicator insignis saeculi V.', 'Petrus Chrysologus, episcopus Ravennae, brevitas sermonum et claritas theologica eum notum fecerunt; pastoralis eius zelus et doctrina in officiis liturgicis et catechesi resonabant.', '406–450'),
('saint-ignatius-of-loyola', 'Sanctus Ignatius Loyola', 'Fundator Societatis Iesu et auctor Exercituum spiritualium.', 'Ignatius de Loyola Societatem Iesu condidit et Exercitia spiritualia composuit, methodum contemplationis et discernendi proponens quae conversionem personalem et missionem ad apostolatum promovit; haec praxis formationem religiosam et missionariam transformavit.', '1491–1556')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- AUGUST SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-alphonsus-liguori', 'Saint Alphonsus Liguori',
  1696, 9, 27, FALSE,
  1787, 8, 1, FALSE,
  18,
  (SELECT id FROM places WHERE code='NAPLES'),
  (SELECT id FROM places WHERE code='PAGANI'),
  (SELECT id FROM places WHERE code='NAPLES')
),
(
  'saint-eusebius-of-vercelli', 'Saint Eusebius of Vercelli',
  283, 3, 2, TRUE,
  371, 8, 1, TRUE,
  4,
  (SELECT id FROM places WHERE code='SARDINIA'),
  (SELECT id FROM places WHERE code='VERCELLI'),
  (SELECT id FROM places WHERE code='VERCELLI')
),
(
  'saint-peter-julian-eymard', 'Saint Peter Julian Eymard',
  1811, 2, 4, FALSE,
  1868, 8, 1, FALSE,
  19,
  (SELECT id FROM places WHERE code='LA_MURE'),
  (SELECT id FROM places WHERE code='LA_MURE'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-john-vianney', 'Saint John Vianney',
  1786, 5, 8, FALSE,
  1859, 8, 4, FALSE,
  19,
  (SELECT id FROM places WHERE code='DARDILLY'),
  (SELECT id FROM places WHERE code='ARS'),
  (SELECT id FROM places WHERE code='ARS')
),
-- (
--   'dedication-basilica-santa-maria-maggiore', 'Dedication of the Basilica of Saint Mary Major',
--   NULL, NULL, NULL, TRUE,
--   NULL, 8, 5, TRUE,
--   NULL,
--   NULL, NULL, (SELECT id FROM places WHERE code='ROME')
-- ),
-- (
--   'transfiguration-of-the-lord', 'The Transfiguration of the Lord',
--   NULL, NULL, NULL, TRUE,
--   NULL, 8, 6, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-sixtus-ii-and-companions', 'Saint Sixtus II and Companions',
  195, NULL, NULL, TRUE,
  258, 8, 6, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-cajetan', 'Saint Cajetan',
  1480, 10, NULL, TRUE,
  1547, 8, 7, FALSE,
  16,
  (SELECT id FROM places WHERE code='VICENZA'),
  (SELECT id FROM places WHERE code='NAPLES'),
  (SELECT id FROM places WHERE code='NAPLES')
),
(
  'saint-dominic', 'Saint Dominic',
  1170, NULL, NULL, TRUE,
  1221, 8, 6, FALSE,
  13,
  (SELECT id FROM places WHERE code='CALERUEGA'),
  (SELECT id FROM places WHERE code='BOLOGNA'),
  (SELECT id FROM places WHERE code='TOULOUSE')
),
(
  'saint-teresa-benedicta-of-the-cross', 'Saint Teresa Benedicta of the Cross (Edith Stein)',
  1891, 10, 12, FALSE,
  1942, 8, 9, FALSE,
  20,
  (SELECT id FROM places WHERE code='WROCLAW'),
  (SELECT id FROM places WHERE code='AUSCHWITZ'),
  (SELECT id FROM places WHERE code='COLOGNE')
),
(
  'saint-lawrence', 'Saint Lawrence, Deacon and Martyr',
  225, NULL, NULL, TRUE,
  258, 8, 10, TRUE,
  3,
  (SELECT id FROM places WHERE code='HUESCA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-clare', 'Saint Clare',
  1194, 7, 16, TRUE,
  1253, 8, 11, FALSE,
  13,
  (SELECT id FROM places WHERE code='ASSISI'),
  (SELECT id FROM places WHERE code='SAN_DAMIANO_ASSISI'),
  (SELECT id FROM places WHERE code='SAN_DAMIANO_ASSISI')
),
(
  'saint-jane-frances-de-chantal', 'Saint Jane Frances de Chantal',
  1572, 1, 23, FALSE,
  1641, 12, 13, FALSE,
  16,
  (SELECT id FROM places WHERE code='DIJON'),
  (SELECT id FROM places WHERE code='MOULINS'),
  (SELECT id FROM places WHERE code='ANNECY')
),
(
  'saint-pontian', 'Saint Pontian',
  NULL, NULL, NULL, TRUE,
  235, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='SARDINIA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-hippolytus-of-rome', 'Saint Hippolytus of Rome',
  170, NULL, NULL, TRUE,
  235, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='SARDINIA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-maximus-the-confessor', 'Saint Maximus the Confessor',
  580, NULL, NULL, TRUE,
  662, 8, 13, TRUE,
  7,
  (SELECT id FROM places WHERE code='CONSTANTINOPLE'),
  (SELECT id FROM places WHERE code='KHIRSA_MONASTERY'),
  (SELECT id FROM places WHERE code='CONSTANTINOPLE')
),
(
  'saint-maximilian-kolbe', 'Saint Maximilian Kolbe',
  1894, 1, 8, FALSE,
  1941, 8, 14, FALSE,
  20,
  (SELECT id FROM places WHERE code='ZDUNSKA_WOLA'),
  (SELECT id FROM places WHERE code='AUSCHWITZ'),
  (SELECT id FROM places WHERE code='NIEPOKALANOW')
),
(
  'saint-stephen-of-hungary', 'Saint Stephen of Hungary',
  975, NULL, NULL, TRUE,
  1038, 8, 15, FALSE,
  11,
  (SELECT id FROM places WHERE code='ESZTERGOM'),
  (SELECT id FROM places WHERE code='SZEKESFEHERVAR'),
  (SELECT id FROM places WHERE code='ESZTERGOM')
),
(
  'saint-john-eudes', 'Saint John Eudes',
  1601, 11, 14, FALSE,
  1680, 8, 19, FALSE,
  17,
  (SELECT id FROM places WHERE code='RI_ORNE'),
  (SELECT id FROM places WHERE code='CAEN'),
  (SELECT id FROM places WHERE code='CAEN')
),
(
  'saint-bernard', 'Saint Bernard (of Clairvaux)',
  1090, NULL, NULL, TRUE,
  1153, 8, 20, FALSE,
  12,
  (SELECT id FROM places WHERE code='FONTAINE_LES_DIJON'),
  (SELECT id FROM places WHERE code='CLAIRVAUX'),
  (SELECT id FROM places WHERE code='CLAIRVAUX')
),
(
  'saint-pius-x', 'Saint Pius X',
  1835, 6, 2, FALSE,
  1914, 8, 20, FALSE,
  20,
  (SELECT id FROM places WHERE code='RIESE_PIO_X'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-rose-of-lima', 'Saint Rose of Lima',
  1586, 4, 30, FALSE,
  1617, 8, 24, FALSE,
  17,
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA')
),
(
  'saint-bartholomew-apostle', 'Saint Bartholomew, Apostle',
  NULL, NULL, NULL, TRUE,
  70, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='ARMENIA'),
  (SELECT id FROM places WHERE code='ARMENIA')
),
(
  'saint-louis', 'Saint Louis (King of France)',
  1214, 4, 25, FALSE,
  1270, 8, 25, FALSE,
  13,
  (SELECT id FROM places WHERE code='POISSY'),
  (SELECT id FROM places WHERE code='TUNIS'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-joseph-calasanz', 'Saint Joseph Calasanz',
  1557, 9, 11, FALSE,
  1648, 8, 25, FALSE,
  16,
  (SELECT id FROM places WHERE code='PERALTA_DE_LA_SAL'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-monica', 'Saint Monica',
  332, NULL, NULL, TRUE,
  387, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='TAGASTE'),
  (SELECT id FROM places WHERE code='OSTIA'),
  (SELECT id FROM places WHERE code='OSTIA')
),
(
  'saint-augustine-of-hippo', 'Saint Augustine of Hippo',
  354, 11, 13, FALSE,
  430, 8, 28, FALSE,
  5,
  (SELECT id FROM places WHERE code='TAGASTE'),
  (SELECT id FROM places WHERE code='HIPPO_REGIUS'),
  (SELECT id FROM places WHERE code='HIPPO_REGIUS')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-alphonsus-liguori', 'Saint Alphonsus Liguori', 'Bishop, moral theologian and founder of the Redemptorists.', 'Alphonsus Liguori combined pastoral care with systematic moral theology and spiritual writing; he founded the Congregation of the Most Holy Redeemer and authored influential works on moral theology, devotion and pastoral charity.', '1696–1787'),
('saint-eusebius-of-vercelli', 'Saint Eusebius of Vercelli', 'Bishop and defender of Nicene faith in the West.', 'Eusebius of Vercelli was a staunch supporter of Nicene orthodoxy who endured exile for opposing Arian influence; he worked to strengthen the episcopal ministry and ecclesial unity in northern Italy, remembered for his pastoral courage and episcopal leadership.', '† 371'),
('saint-peter-julian-eymard', 'Saint Peter Julian Eymard', 'Priest and Eucharistic apostle, founder of the Congregation of the Blessed Sacrament.', 'Peter Julian Eymard devoted his priesthood to promoting frequent communion and Eucharistic devotion, founding a religious congregation and an associated female branch to foster adoration and pastoral formation centered on the Blessed Sacrament.', '1811–1868'),
('saint-john-vianney', 'Saint John Vianney', 'Curé of Ars and model of parish priesthood.', 'John Vianney is celebrated for his tireless pastoral ministry, sacramental devotion and exemplary care for souls at Ars; his humility, practice of lengthy hours in the confessional and reforming influence on parish life made him a patron of parish priests.', '1786–1859'),
-- ('dedication-basilica-santa-maria-maggiore', 'Dedication of the Basilica of Saint Mary Major', 'Commemoration of the dedication of one of the major Roman basilicas.', 'The dedication of the Basilica of Saint Mary Major recalls the ancient church''s role as a principal site of Marian devotion in Rome and the continuity of liturgical life centered on the Mother of God.', ''),
-- ('transfiguration-of-the-lord', 'The Transfiguration of the Lord', 'Feast commemorating Christ''s transfiguration on Mount Tabor.', 'The Transfiguration celebrates the revelation of Christ''s glory to Peter, James and John, a pivotal theophany that anticipates the paschal mystery and strengthens the apostles for mission.', ''),
('saint-sixtus-ii-and-companions', 'Saint Sixtus II and Companions', 'Pope Sixtus II and martyrs of the Valerian persecution.', 'Sixtus II and his deacons bore witness in the third century amid imperial persecution; their martyrdom exemplified episcopal fidelity and the formative memory of the Roman Church''s early martyrs.', '† 258'),
('saint-cajetan', 'Saint Cajetan', 'Priest and reformer, co‑founder of the Theatine movement.', 'Cajetan worked for ecclesial renewal, care of the poor and clerical reform, co‑founding the Theatines to renew the clergy and encourage pastoral holiness through Gospel-inspired reform.', '1480–1547'),
('saint-dominic', 'Saint Dominic', 'Founder of the Order of Preachers (Dominicans).', 'Dominic Guzmán founded the Order of Preachers to proclaim the Gospel in preaching and study, promoting doctrinal clarity, itinerant preaching and the formation of a learned, apostolic religious life committed to itinerant mission.', '1170–1221'),
('saint-teresa-benedicta-of-the-cross', 'Saint Teresa Benedicta of the Cross (Edith Stein)', 'Philosopher, convert and martyr of Auschwitz.', 'Edith Stein, a Jewish-born philosopher who converted to Catholicism and became a Carmelite nun, is remembered for her philosophical writings, spiritual depth and martyrdom at Auschwitz; her life blends intellectual witness and sacrificial fidelity.', '1891–1942'),
('saint-lawrence', 'Saint Lawrence, Deacon and Martyr', 'Deacon of Rome renowned for his service to the poor and witness in martyrdom.', 'Lawrence, noted for his ministry of diaconal charity and his bold witness before Roman authorities, is venerated for his martyrdom and enduring example of service to the marginalized as central to Christian life.', '† 258'),
('saint-clare', 'Saint Clare', 'Founder of the Poor Clares and model of evangelical poverty.', 'Clare of Assisi embraced Franciscan poverty and contemplative dedication, founding a female religious family that lived the evangelical counsels in cloistered simplicity and service, inspiring generations of female religious life.', '1194–1253'),
('saint-jane-frances-de-chantal', 'Saint Jane Frances de Chantal', 'Religious founder and promoter of Christian charity and formation.', 'Jane Frances de Chantal co-founded the Visitation Order with Saint Francis de Sales and labored for the spiritual formation of women and the care of the needy, embodying a balanced combination of contemplative life and charitable action.', '1572–1641'),
('saint-pontian', 'Saint Pontian', 'Pope and martyr of the third-century Roman Church.', 'Pontian served as bishop of Rome during a period of ecclesial tension and imperial persecution. His exile and death in suffering became a lasting witness of pastoral fidelity. In liturgical memory he is often commemorated with Hippolytus as a sign of reconciliation and unity in the early Roman Church.', '† 235'),
('saint-hippolytus-of-rome', 'Saint Hippolytus of Rome', 'Priest and martyr associated with early Roman theological tradition.', 'Hippolytus is remembered as an important figure of early Christian theology in Rome. Although aspects of his historical profile remain complex, the Church venerates him as a martyr and frequently commemorates him with Pontian, emphasizing the healing of divisions through common witness in Christ.', '† 235'),
('saint-maximus-the-confessor', 'Saint Maximus the Confessor', 'Monk and theologian who defended the two wills of Christ.', 'Maximus the Confessor contributed crucially to Christological theology by defending the full humanity and divinity of Christ and articulating the orthodox doctrine of wills in Christ amid seventh-century controversies, enduring exile and suffering for his witness.', 'c. 580–662'),
('saint-maximilian-kolbe', 'Saint Maximilian Kolbe', 'Franciscan friar and martyr who volunteered to die at Auschwitz for another prisoner.', 'Maximilian Kolbe''s self-sacrificial offer to take the place of a condemned man at Auschwitz and his life of missionary zeal and Marian devotion have made him a powerful modern witness to charity and courage in the face of evil.', '1894–1941'),
('saint-stephen-of-hungary', 'Saint Stephen of Hungary', 'First king of Hungary and promoter of Christian institutions.', 'Stephen I consolidated the Christian kingdom of Hungary, established dioceses and monasteries and promoted Christian law and institutions, becoming a national patron for the Church''s role in shaping society.', '975–1038'),
('saint-john-eudes', 'Saint John Eudes', 'Priest and founder noted for devotion to the Sacred Hearts and missionary formation.', 'John Eudes promoted devotion to the Hearts of Jesus and Mary and engaged in priestly formation and missionary work, founding congregations and writing popular devotional works that influenced French spirituality.', '1601–1680'),
('saint-bernard', 'Saint Bernard of Clairvaux', 'Cistercian abbot, preacher and influential medieval theologian.', 'Bernard of Clairvaux combined reforming monastic zeal, effective preaching and mystical theology, helping to shape twelfth-century spirituality and ecclesial reform through his pastoral letters, sermons and leadership of the Cistercian movement.', '1090–1153'),
('saint-pius-x', 'Saint Pius X', 'Pope and liturgical reformer who promoted frequent communion and catechesis.', 'Pope Pius X championed liturgical renewal, catechetical instruction, the promotion of frequent communion and reforms aimed at clerical discipline and pastoral care in the early twentieth century.', '1835–1914'),
('saint-rose-of-lima', 'Saint Rose of Lima', 'Lay Dominican mystic and patroness of Peru, model of ascetic charity.', 'Rose of Lima lived a life of austere devotion, care for the poor and deep prayer while advancing Dominican spirituality in the Americas; her sanctity and social concern made her the first canonized saint of the Americas.', '1586–1617'),
('saint-bartholomew-apostle', 'Saint Bartholomew, Apostle', 'Apostle traditionally linked to early missions beyond the Mediterranean.', 'Bartholomew, counted among the Twelve, figures in various apostolic traditions associating him with early missionary outreach; his identity in some traditions is associated with Nathanael of the Gospels and apostolic preaching.', '1st century'),
('saint-louis', 'Saint Louis (King of France)', 'King and crusader known for personal piety and justice.', 'Louis IX of France is remembered for his personal devotion, promotion of justice, care for the poor and participation in crusading efforts; his reign sought to align royal power with Christian principles and he became a model medieval Christian monarch.', '1214–1270'),
('saint-joseph-calasanz', 'Saint Joseph Calasanz', 'Priest and pioneer of popular Christian education, founder of the Piarists.', 'Joseph Calasanz founded the Order of Poor Clerics Regular of the Mother of God of the Pious Schools to provide free education to poor children and to promote catechesis and civic formation through schooling.', '1557–1648'),
('saint-monica', 'Saint Monica', 'Mother of Augustine and exemplar of persistent prayer and conversion.', 'Monica''s persistent prayer and pastoral care for her son Augustine led to his conversion; she is venerated for maternal fidelity, penitential prayer and enduring trust in God''s mercy.', 'c. 332–387'),
('saint-augustine-of-hippo', 'Saint Augustine of Hippo', 'Bishop, theologian and Doctor of the Church whose writings shaped Western Christianity.', 'Augustine''s Confessions and theological corpus on grace, sin, church and sacraments profoundly influenced Western theology, pastoral practice and Christian self-understanding across centuries.', '354–430')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-alphonsus-liguori', 'Saint Alphonse de Liguori', 'Évêque, théologien moral et fondateur de la congrégation des Rédemptoristes.', 'Alphonse de Liguori a combiné une pastorale attentive avec une théologie morale systématique et des écrits spirituels influents; fondateur des Rédemptoristes, il a produit des traités sur la morale et la piété qui ont marqué la spiritualité catholique en Italie et au-delà.', '1696–1787'),
('saint-eusebius-of-vercelli', 'Saint Eusèbe de Vérceil', 'Évêque et défenseur de la foi nicéenne en Occident.', 'Eusèbe de Vérceil soutint fermement l''orthodoxie nicéenne, endura l''exil pour sa position face à l''arianisme et travailla à consolider le ministère épiscopal et l''unité ecclésiale dans le nord de l''Italie; il est retenu pour son courage pastoral.', '† 371'),
('saint-peter-julian-eymard', 'Saint Pierre-Julien Eymard', 'Prêtre et apôtre de l''Eucharistie, fondateur de la Congrégation du Très Saint-Sacrement.', 'Pierre-Julien Eymard consacra son ministère à promouvoir la dévotion eucharistique et la communion fréquente, fondant une congrégation masculine et un institut féminin pour encourager l''adoration et la formation pastorale centrées sur le Saint-Sacrement.', '1811–1868'),
('saint-john-vianney', 'Saint Jean-Marie Vianney', 'Curé d''Ars et modèle du ministère paroissial.', 'Jean-Marie Vianney est célébré pour son ministère pastoral infatigable, sa dévotion sacramentelle et son soin des âmes à Ars; son humilité, ses longues heures au confessionnal et son influence sur la vie paroissiale font de lui le patron des curés.', '1786–1859'),
-- ('dedication-basilica-santa-maria-maggiore', 'Dédicace de la Basilique Sainte-Marie-Majeure', 'Commémoration de la dédicace d''une des basiliques majeures de Rome.', 'La dédicace de la basilique Sainte-Marie-Majeure rappelle le rôle ancien de cette église comme lieu principal de la dévotion mariale à Rome et la continuité de la vie liturgique centrée sur la Mère de Dieu.', ''),
-- ('transfiguration-of-the-lord', 'Transfiguration du Seigneur', 'Fête commémorant la transfiguration du Christ au Mont Thabor.', 'La Transfiguration célèbre la révélation de la gloire du Christ à Pierre, Jacques et Jean, événement qui anticipe le mystère pascal et fortifie les apôtres pour la mission; elle est source de méditation sur la divinité du Christ.', ''),
('saint-sixtus-ii-and-companions', 'Saint Sixte II et compagnons', 'Le pape Sixte II et martyrs de la persécution de Valérien.', 'Sixte II et ses diacres portèrent témoignage au IIIe siècle lors des persécutions impériales; leur martyre illustre la fidélité épiscopale et la mémoire formatrice des premiers martyrs de l''Église de Rome.', '† 258'),
('saint-cajetan', 'Saint Gaëtan (Cajetan)', 'Prêtre et réformateur, cofondateur du mouvement thérézin (Théatins).', 'Gaëtan s''engagea pour le renouveau ecclésial, la charité envers les pauvres et la réforme du clergé; cofondateur des Théatins, il encouragea une vie sacerdotale conforme aux exigences évangéliques.', '1480–1547'),
('saint-dominic', 'Saint Dominique', 'Fondateur de l''Ordre des Prêcheurs (Dominicains).', 'Dominique de Guzmán fonda l''Ordre des Prêcheurs pour proclamer l''Évangile par la prédication et l''étude; il favorisa la clarté doctrinale, la vie apostolique itinérante et la formation d''un clergé religieux instruIt et missionnaire.', '1170–1221'),
('saint-teresa-benedicta-of-the-cross', 'Sainte Thérèse-Bénédicte de la Croix (Edith Stein)', 'Philosophe convertie et martyre à Auschwitz.', 'Edith Stein, née dans une famille juive puis convertie au catholicisme et entrée au Carmel, est reconnue pour ses travaux philosophiques et sa profondeur spirituelle; déportée et morte à Auschwitz, son parcours conjugue témoignage intellectuel et fidélité sacrificielle.', '1891–1942'),
('saint-lawrence', 'Saint Laurent', 'Diacre de Rome, célèbre pour son service aux pauvres et son martyre.', 'Laurent est vénéré pour son ministère diaconal de charité et son courage face aux autorités romaines; son martyre et son exemple demeurent un modèle d''engagement en faveur des plus démunis dans la vie chrétienne.', '† 258'),
('saint-clare', 'Sainte Claire d''Assise', 'Fondatrice des Pauvres Dames (Clarisses) et modèle de pauvreté évangélique.', 'Claire d''Assise adopta la pauvreté franciscaine et fonda une famille religieuse féminine consacrée à la prière et à la simplicité; sa vie contemplative et son influence sur la vie monastique féminine demeurent considérables.', '1194–1253'),
('saint-jane-frances-de-chantal', 'Sainte Jeanne-Françoise de Chantal', 'Fondatrice et promotrice de la charité et de la formation chrétienne.', 'Jeanne-Françoise de Chantal cofonda la Visitation avec François de Sales et s''engagea pour la formation spirituelle des femmes et le soin des pauvres, conjuguant vie contemplative et action caritative.', '1572–1641'),
('saint-pontian', 'Saint Pontien', 'Pape et martyr de l’Église romaine du IIIe siècle.', 'Pontien exerça le ministère d’évêque de Rome dans un contexte de tensions ecclésiales et de persécution impériale. Son exil et sa mort dans l’épreuve demeurent un témoignage de fidélité pastorale. Dans la mémoire liturgique, il est souvent célébré avec Hippolyte comme signe de réconciliation et d’unité dans l’Église romaine primitive.', '† 235'),
('saint-hippolytus-of-rome', 'Saint Hippolyte de Rome', 'Prêtre et martyr lié à la tradition théologique romaine ancienne.', 'Hippolyte est retenu comme une figure importante de la théologie chrétienne ancienne à Rome. Même si certains aspects historiques demeurent complexes, l’Église le vénère comme martyr et le commémore fréquemment avec Pontien, soulignant la guérison des divisions dans le témoignage commun au Christ.', '† 235'),
('saint-maximus-the-confessor', 'Saint Maxime le Confesseur', 'Moine et théologien qui défendit la double volonté du Christ.', 'Maxime le Confesseur apporta une contribution fondamentale à la christologie en défendant l''humanité et la divinité du Christ et en articulant la doctrine orthodoxe des volontés dans le Christ pendant les controverses du VIIe siècle; il subit exil et souffrance pour sa fidélité.', 'v. 580–662'),
('saint-maximilian-kolbe', 'Saint Maximilien Kolbe', 'Frère franciscain et martyr qui se porta volontaire pour mourir à Auschwitz à la place d''un autre prisonnier.', 'Maximilien Kolbe est honoré pour son sacrifice volontaire à Auschwitz, sa vita missionnaire et sa dévotion mariale; son geste est devenu un puissant symbole de charité et de résistance spirituelle face au mal.', '1894–1941'),
('saint-stephen-of-hungary', 'Saint Étienne de Hongrie', 'Premier roi de Hongrie et promoteur des institutions chrétiennes.', 'Étienne Ier consolida le royaume chrétien de Hongrie, établit diocèses et monastères et promut les lois chrétiennes et les institutions ecclésiales, devenant un patron national pour le rôle de l''Église dans la société.', '975–1038'),
('saint-john-eudes', 'Saint Jean Eudes', 'Prêtre fondateur, promoteur des Sacrés-Cœurs et formateur missionnaire.', 'Jean Eudes encouragea la dévotion aux Sacrés-Cœurs et travailla à la formation sacerdotale et missionnaire en fondant congrégations et en rédigeant œuvres dévotionnelles qui influencèrent la spiritualité française.', '1601–1680'),
('saint-bernard', 'Saint Bernard de Clairvaux', 'Abbé cistercien, prédicateur et théologien médiéval influent.', 'Bernard de Clairvaux sut allier réforme monastique, prédication efficace et mystique théologique; ses lettres, sermons et son rôle dans le mouvement cistercien marquèrent profondément la spiritualité du XIIe siècle.', '1090–1153'),
('saint-pius-x', 'Saint Pie X', 'Pape réformateur liturgique, promoteur de la communion fréquente et de la catéchèse.', 'Le pape Pie X favorisa le renouveau liturgique, la catéchèse et la communion fréquente, et mena des réformes visant la discipline cléricale et le soin pastoral des fidèles au début du XXe siècle.', '1835–1914'),
('saint-rose-of-lima', 'Sainte Rose de Lima', 'Mystique dominicaine et patronne du Pérou, modèle d''ascèse et de charité.', 'Rose de Lima vécut une dévotion austère, un soin des pauvres et une intense vie de prière, renouvelant la spiritualité dominicaine en Amérique et devenant la première sainte canonisée du Nouveau Monde.', '1586–1617'),
('saint-bartholomew-apostle', 'Saint Barthélemy, apôtre', 'Apôtre traditionnellement lié aux premières missions au-delà de la Méditerranée.', 'Barthélemy, inclus parmi les Douze, apparaît dans diverses traditions apostoliques liées à l''expansion missionnaire; son identification avec Nathanaël dans certains récits enrichit la réflexion sur l''origine apostolique.', 'Ier siècle'),
('saint-louis', 'Saint Louis (roi de France)', 'Roi et croisé connu pour sa piété personnelle et sa justice.', 'Louis IX est reconnu pour sa piété, sa promotion de la justice, son souci des pauvres et sa participation aux croisades; son règne chercha à subordonner le pouvoir royal aux principes chrétiens et il resta un modèle de souverain pieux.', '1214–1270'),
('saint-joseph-calasanz', 'Saint Joseph Calasanz', 'Prêtre et pionnier de l''éducation chrétienne populaire, fondateur des Piaristes.', 'Joseph Calasanz fonda les Écoles Pies pour offrir une instruction gratuite aux enfants pauvres, promouvant la catéchèse et la formation civique par l''école et posant les bases de l''éducation chrétienne populaire.', '1557–1648'),
('saint-monica', 'Sainte Monique', 'Mère de saint Augustin, exemple de prière persévérante et de conversion.', 'Monique se distingua par sa prière persévérante et son soin pastoral pour la conversion de son fils Augustin; vénérée pour sa fidélité maternelle, sa pénitence et son espérance confiante, elle demeure un modèle de prière pour les familles.', 'v. 332–387'),
('saint-augustine-of-hippo', 'Saint Augustin d''Hippo', 'Évêque, théologien et docteur de l''Église dont les écrits ont façonné le christianisme occidental.', 'Les Confessions et l''œuvre théologique d''Augustin ont profondément marqué la théologie occidentale sur la grâce, le péché, l''Église et les sacrements, influençant la pensée chrétienne et la pastorale pendant des siècles.', '354–430')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-alphonsus-liguori', 'Sanctus Alphonsus Liguori', 'Episcopus, theologus moralis et fundator Redemptoristarum.', 'Alphonsus Liguori pastoralis curae cum theologia morali conexit atque Congregationem Sanctissimi Redemptoris condidit; opera eius in moribus et pietate multis inservierunt.', '1696–1787'),
('saint-eusebius-of-vercelli', 'Sanctus Eusebius Vercellensis', 'Episcopus et defensor fidei Nicaenae in Occidente.', 'Eusebius Vercellensis firmus fuit in defensione orthodoxiae Nicaenae, exsiliis et laboribus ad ecclesiae integritatem in Septentrionali Italia contribuens.', '† 371'),
('saint-peter-julian-eymard', 'Sanctus Petrus Iulianus Eymard', 'Presbyter et apostolus Eucharistiae; fundator Congregationis Sanctissimi Sacramenti.', 'Petrus Iulianus Eymard totam vitam in promovendis devotionibus eucharisticis consumpsit, congregationem condidit et ministerium ad sacramentum altioris venerandae relationis civitati ecclesiasticae dedi.', '1811–1868'),
('saint-john-vianney', 'Sanctus Ioannes Maria Vianney', 'Curatus Arsi et exemplar ministerii parochialis.', 'Ioannes Maria Vianney notus est ob industriam in confessionali, curam animarum et simplicem pietatem quae exemplaratum pastorale praebuit.', '1786–1859'),
-- ('dedication-basilica-santa-maria-maggiore', 'Dedicatio Basilicae Sanctae Mariae Majoris', 'Dedicatio antiquae basilicae Romanae quae Mariae devotione clamat.', 'Dedicatio Basilicae Sanctae Mariae Majoris memoriam liturgicam et centralem locum cultus Marianique devotionis Romae commemorat.', ''),
-- ('transfiguration-of-the-lord', 'Transfiguratio Domini', 'Festum transfigurationis Christi in monte.', 'Transfiguratio Domini revelatio gloriae Christi est, quae apostolos roboret et mysteria paschalia praeparat.', ''),
('saint-sixtus-ii-and-companions', 'Sanctus Sixtus II et Socii', 'Papa et martyres persecutionis Valerianae.', 'Sixtus II et diaconi eius martyrio coronati sunt, eorum testimonium exemplum fidelitatis episcopalis et ministerii ecclesiastici tradit.', '† 258'),
('saint-cajetan', 'Sanctus Cajetanus', 'Presbyter et reformator, cofundator Theatinorum.', 'Cajetanus studuit reformationi clericorum et curis pauperum, institutum Theatinorum condidit ad renovandam vitam sacerdotalem.', '1480–1547'),
('saint-dominic', 'Sanctus Dominicus', 'Fundator Ordinis Praedicatorum (Dominicani).', 'Dominicus Guzman Ordinem Praedicatorum condidit ut evangelium per praedicationem et studium diffunderetur et clerum religiosum erudiretur.', '1170–1221'),
('saint-teresa-benedicta-of-the-cross', 'Sancta Teresia Benedicta a Cruce (Edith Stein)', 'Philosopha conversae et martyr Auschwitzensis.', 'Edith Stein, philosophia docta et caritate animata, conversione ad fidem catholicam accensa, vitam carmelitam suscepit et sub persecutione in Auschwitz obiit.', '1891–1942'),
('saint-lawrence', 'Sanctus Laurentius', 'Diaconus Romanus notus propter caritatem erga pauperes et martyrum testimonium.', 'Laurentius ministerio diaconali pauperum totum dedit et in testimonio coram magistratibus Romanis martirio coronatus est.', '† 258'),
('saint-clare', 'Sancta Clara Assisiensis', 'Fundatrix Pauperum Dominicarum (Clarissarum) et exemplar paupertatis evangelicae.', 'Clara Assisiensis paupertatem Francisci imitata, ordinem feminine contemplativum condidit et vita eius exemplum humilitatis et orationis praebuit.', '1194–1253'),
('saint-jane-frances-de-chantal', 'Sancta Ioanna-Francesca de Chantal', 'Fundatrix et promotrix caritatis et formationis christianae.', 'Ioanna-Francesca de Chantal cofundatrix Visitationis cum Francisco Salesio fuit et vitam spiritualem ac caritatem practicam in institutis promovit.', '1572–1641'),
('saint-pontian', 'Sanctus Pontianus', 'Papa et martyr Ecclesiae Romanae saeculi tertii.', 'Pontianus Ecclesiae Romanae praefuit tempore difficultatum ecclesialium et persecutionis imperialis. Exsilium eius atque mors in passione testimonium pastoralis fidelitatis reliquerunt. In memoria liturgica saepe cum Hippolyto commemoratur ut signum reconciliationis et unitatis in Ecclesia Romana antiqua.', '† 235'),
('saint-hippolytus-of-rome', 'Sanctus Hippolytus Romanus', 'Presbyter et martyr, traditioni theologicae Romanae antiquae coniunctus.', 'Hippolytus memoratur ut gravis auctor in theologia christiana antiqua Romae. Etsi quaedam vitae eius historica minus clara manent, Ecclesia eum ut martyrem veneratur atque saepe cum Pontiano commemorat, reconciliationem divisionum in communi Christi testimonio significans.', '† 235'),
('saint-maximus-the-confessor', 'Sanctus Maximus Confessor', 'Monachus et theologia qui de voluntatibus Christi disputavit.', 'Maximus Confessor doctrinam de duabus voluntatibus in Christo defendit et propter fidei constantiam exsilium passa est.', 'c. 580–662'),
('saint-maximilian-kolbe', 'Sanctus Maximilianus Kolbe', 'Frater Franciscanus et martyr, se pro altero in Auschwitz obtulit.', 'Maximilianus Kolbe sacrificium suum in Auschwitz obtulit, exemplum caritatis et fortitudinis spiritualis in tempore persecutionis reddens.', '1894–1941'),
('saint-stephen-of-hungary', 'Sanctus Stephanus Hungariae', 'Primus rex Hungariae et promotrix institutionum christianarum.', 'Stephanus I regnum christiane in Hungaria consolidavit, dioceses et monasteria instituit et leges Christianas promulgavit, ut ecclesiam in societate firmaret.', '975–1038'),
('saint-john-eudes', 'Sanctus Ioannes Eudes', 'Presbyter et fundator, promotio devotionum Sacrorum Cordium.', 'Ioannes Eudes devotionem ad Sacra Cordia Iesu et Mariae propagavit, institutis sacerdotibus et missionibus operam dedit et scriptis pietatem populari formavit.', '1601–1680'),
('saint-bernard', 'Sanctus Bernardus Claravallensis', 'Abbas Cisterciensis, praedicator et theologus mediivalis.', 'Bernardus Claravallensis reformam monasticam, praedicationem ferventem et mysticam theologiamm exercuit, cuius litterae et sermones magnum in XII saeculo impactum habuerunt.', '1090–1153'),
('saint-pius-x', 'Sanctus Pius X', 'Papa et reformator liturgicus, promotio communionis frequenti et catechesis.', 'Pius X liturgica et catechetica reformatione studuit, communionem frequentem et disciplinam cleri promote, curam pastoralis ac doctrinalis servans.', '1835–1914'),
('saint-rose-of-lima', 'Sancta Rosa Limae', 'Mystica Dominicana et patrona Peruviae, exemplar ascese et caritatis.', 'Rosa Limae vitam asceticam et operam caritativam in America Meridionali vixit, primam sanctorum canonizationem in Novo Mundo consequuta.', '1586–1617'),
('saint-bartholomew-apostle', 'Sanctus Bartholomaeus, Apostolus', 'Apostolus traditione ad missiones extra Mediterraneum relatus.', 'Bartholomaeus inter Duodecim memoratur et in traditionibus missionum extra Mediterraneanus conexus est; eius persona in evangelizatione antiquae tractatur.', 'saec. I'),
('saint-louis', 'Sanctus Ludovicus Franciae', 'Rex et cruciatus notus ob pietatem personalem et iustitiam.', 'Ludovicus IX Franciae notus est ob pietatem, iustitiam erga pauperes et participationem in expeditionibus Terra Sancta; eius regnum exemplum monarchiae christianae exhibuit.', '1214–1270'),
('saint-joseph-calasanz', 'Sanctus Iosephus Calasanctius', 'Presbyter et pioniere educationis christianae pauperum, fundator Piaristarum.', 'Iosephus Calasanctius scholas pie fundavit ad pueros pauperes educandos, catechesim et formationem civem promote, fundamenta educationis popularis catholica posuit.', '1557–1648'),
('saint-monica', 'Sancta Monica', 'Mater Augustini, exemplar orationis perseverantis et conversionis filii.', 'Monica devotionem perseverantem et curam pastoralis ad filium Augustinum dedicavit; ob orationes et patientiam eius memorata est pro conversione et paternitate spirituali.', 'c. 332–387'),
('saint-augustine-of-hippo', 'Sanctus Augustinus Hipponensis', 'Episcopus, theologus et Ecclesiae doctor cuius opera Christianitatem Occidentalem formaverunt.', 'Augustinus Confessiones et opera theologica de gratia, peccato, ecclesia et sacramentis doctrinam occidentalem et praxis pastoralis per saecula informaverunt.', '354–430')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- SEPTEMBER SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-gregory-the-great', 'Saint Gregory the Great',
  540, NULL, NULL, TRUE,
  604, 3, 12, FALSE,
  7,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-teresa-of-calcutta', 'Saint Teresa of Calcutta',
  1910, 8, 26, FALSE,
  1997, 9, 5, FALSE,
  20,
  (SELECT id FROM places WHERE code='SKOPJE'),
  (SELECT id FROM places WHERE code='CALCUTTA'),
  (SELECT id FROM places WHERE code='CALCUTTA')
),
(
  'saint-peter-claver', 'Saint Peter Claver',
  1580, 6, 26, TRUE,
  1654, 9, 8, FALSE,
  17,
  (SELECT id FROM places WHERE code='VERDU'),
  (SELECT id FROM places WHERE code='CARTAGENA_COLOMBIA'),
  (SELECT id FROM places WHERE code='CARTAGENA_COLOMBIA')
),
-- (
--   'most-holy-name-of-mary', 'The Most Holy Name of Mary',
--   NULL, NULL, NULL, TRUE,
--   NULL, 9, 12, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-john-chrysostom', 'Saint John Chrysostom',
  347, NULL, NULL, TRUE,
  407, 9, 14, FALSE,
  5,
  (SELECT id FROM places WHERE code='ANTIOCH'),
  (SELECT id FROM places WHERE code='COMANA_PONTICA'),
  (SELECT id FROM places WHERE code='CONSTANTINOPLE')
),
-- (
--   'our-lady-of-sorrows', 'Our Lady of Sorrows',
--   NULL, NULL, NULL, TRUE,
--   NULL, 9, 15, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-cornelius', 'Saint Cornelius',
  180, NULL, NULL, TRUE,
  253, 6, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='CIVITAVECCHIA'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-cyprian', 'Saint Cyprian',
  200, NULL, NULL, TRUE,
  258, 9, 14, TRUE,
  3,
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE'),
  (SELECT id FROM places WHERE code='CARTHAGE')
),
(
  'saint-robert-bellarmine', 'Saint Robert Bellarmine',
  1542, 10, 4, FALSE,
  1621, 9, 17, FALSE,
  17,
  (SELECT id FROM places WHERE code='MONTEPULCIANO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-hildegard-of-bingen', 'Saint Hildegard of Bingen',
  1098, NULL, NULL, TRUE,
  1179, 9, 17, FALSE,
  12,
  (SELECT id FROM places WHERE code='BERMERSHEIM_VOR_DER_HOEHE'),
  (SELECT id FROM places WHERE code='BINGEN'),
  (SELECT id FROM places WHERE code='BINGEN')
),
(
  'saint-januarius', 'Saint Januarius',
  232, 4, 21, TRUE,
  305, 9, 19, TRUE,
  4,
  (SELECT id FROM places WHERE code='BENEVENTO'),  -- birthplace (traditional)
  (SELECT id FROM places WHERE code='POZZUOLI'),   -- place_of_death (martyred at/near Pozzuoli)
  (SELECT id FROM places WHERE code='NAPLES')     -- place_of_activity (bishop / patron of Naples)

),
(
  'saint-andrew-kim-tae-gon', 'Saint Andrew Kim Tae-gon',
  1821, 8, 21, FALSE,
  1846, 9, 16, FALSE,
  19,
  (SELECT id FROM places WHERE code='SOLMOE'),
  (SELECT id FROM places WHERE code='SEOUL'),
  (SELECT id FROM places WHERE code='KOREA')
),
(
  'saint-paul-chong-ha-sang', 'Saint Paul Chong Ha-sang',
  1795, NULL, NULL, TRUE,
  1839, 9, 22, FALSE,
  19,
  (SELECT id FROM places WHERE code='MAJAE_KOREA'),
  (SELECT id FROM places WHERE code='SEOUL'),
  (SELECT id FROM places WHERE code='KOREA')
),
(
  'saint-matthew', 'Saint Matthew, Apostle and Evangelist',
  NULL, NULL, NULL, TRUE,
  71, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),   -- birthplace (regional)
  (SELECT id FROM places WHERE code='HIERAPOLIS'),-- place_of_death (tradition)
  (SELECT id FROM places WHERE code='BETHSAIDA') -- place_of_activity (Capernaum area)

),
(
  'saint-pius-of-pietrelcina', 'Saint Pius of Pietrelcina',
  1887, 5, 25, FALSE,
  1968, 9, 23, FALSE,
  20,
  (SELECT id FROM places WHERE code='PIETRELCINA'),
  (SELECT id FROM places WHERE code='SAN_GIOVANNI_ROTONDO'),
  (SELECT id FROM places WHERE code='SAN_GIOVANNI_ROTONDO')
),
(
  'saint-cosmas', 'Saint Cosmas',
  NULL, NULL, NULL, TRUE,
  300, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='ARABIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA')
),
(
  'saint-damian', 'Saint Damian',
  NULL, NULL, NULL, TRUE,
  300, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='ARABIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA'),
  (SELECT id FROM places WHERE code='AEGAE_CILICIA')
),
(
  'saint-vincent-de-paul', 'Saint Vincent de Paul',
  1581, 4, 24, FALSE,
  1660, 9, 27, FALSE,
  17,
  (SELECT id FROM places WHERE code='SAINT_VINCENT_DE_PAUL'),
  (SELECT id FROM places WHERE code='PARIS'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-wenceslaus', 'Saint Wenceslaus',
  907, NULL, NULL, TRUE,
  935, 9, 28, TRUE,
  10,
  (SELECT id FROM places WHERE code='STOCHOV'),
  (SELECT id FROM places WHERE code='STARA_BOLESLAV'),
  (SELECT id FROM places WHERE code='PRAGUE')
),
(
  'saint-lawrence-ruiz', 'Saint Lawrence Ruiz', --and Companions
  1594, 11, 28, TRUE,
  1637, 9, 29, FALSE,
  17,
  (SELECT id FROM places WHERE code='BINONDO'),
  (SELECT id FROM places WHERE code='NAGASAKI'),
  (SELECT id FROM places WHERE code='MANILA')
),
-- (
--   'saints-michael-gabriel-and-raphael', 'Saints Michael, Gabriel and Raphael, Archangels',
--   NULL, NULL, NULL, TRUE,
--   NULL, 9, 29, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-jerome', 'Saint Jerome',
  347, NULL, NULL, TRUE,
  420, 9, 30, TRUE,
  5,
  (SELECT id FROM places WHERE code='STRIDON'),
  (SELECT id FROM places WHERE code='BETHLEHEM'),
  (SELECT id FROM places WHERE code='BETHLEHEM')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-gregory-the-great', 'Saint Gregory the Great', 'Pope and Doctor of the Church; pastor, liturgist and reformer.', 'Gregory the Great guided the Church at a time of political fragmentation and social crisis, strengthening pastoral governance, monastic influence and missionary outreach, especially through the mission sent to Anglo-Saxon England; his writings, including the Pastoral Rule and Moralia, shaped Western spirituality and ecclesial leadership for centuries.', 'c. 540–604'),
('saint-teresa-of-calcutta', 'Saint Teresa of Calcutta', 'Missionary of Charity and witness of mercy among the poorest.', 'Teresa of Calcutta founded the Missionaries of Charity and devoted her life to serving abandoned, sick and dying people in urban poverty; her witness combined practical compassion, radical poverty and persistent prayer, and her global mission inspired renewed commitment to corporal works of mercy.', '1910–1997'),
('saint-peter-claver', 'Saint Peter Claver', 'Jesuit priest and advocate for enslaved people in Cartagena.', 'Peter Claver dedicated his priestly ministry to the care of enslaved Africans arriving in Cartagena, providing catechesis, sacraments, medical aid and personal accompaniment; his life is remembered as a prophetic witness to human dignity and Christian solidarity in the context of colonial injustice.', '1581–1654'),
('saint-john-chrysostom', 'Saint John Chrysostom', 'Bishop and Doctor of the Church; renowned preacher and scriptural commentator.', 'John Chrysostom, called the ''Golden-Mouthed,'' is one of the greatest preachers of Christian antiquity, known for biblical homilies, moral exhortation and critique of social abuses; as bishop of Constantinople he pursued reform of clergy and court culture and endured exile for his frank pastoral stance.', 'c. 347–407'),
('saint-cornelius', 'Saint Cornelius', 'Pope and martyr during the mid-third-century persecutions.', 'Cornelius led the Roman Church during a period marked by persecution and debates on reconciliation of the lapsed; his pontificate emphasized ecclesial mercy and unity, and his witness under pressure contributed to the consolidation of Roman pastoral authority in a turbulent era.', '† 253'),
('saint-cyprian', 'Saint Cyprian', 'Bishop of Carthage, martyr and formative ecclesial theologian.', 'Cyprian of Carthage combined episcopal governance with theological reflection on Church unity, sacraments and episcopacy; his letters and treatises guided Christians through persecution and schism, and his martyrdom sealed a legacy that deeply influenced Latin ecclesiology.', 'c. 200–258'),
('saint-robert-bellarmine', 'Saint Robert Bellarmine', 'Jesuit cardinal, controversialist and Doctor of the Church.', 'Robert Bellarmine was a leading theologian of the Counter-Reformation whose scholarly work in apologetics, ecclesiology and scriptural interpretation shaped post-Tridentine Catholic thought; as pastor and cardinal he also promoted catechesis, clerical reform and prudent spiritual direction.', '1542–1621'),
('saint-hildegard-of-bingen', 'Saint Hildegard of Bingen', 'Abbess, mystic and Doctor of the Church with wide theological and cultural influence.', 'Hildegard of Bingen united monastic leadership, visionary theology, liturgical creativity and natural observation in a body of writings that influenced medieval spirituality and ecclesial reform; her letters, music and prophetic exhortations gave her a distinctive voice in twelfth-century Christian Europe.', '1098–1179'),
('saint-januarius', 'Saint Januarius', 'Bishop and martyr, principal patron of Naples.', 'Januarius is venerated as a bishop-martyr of early Christianity whose cult became central to the identity and devotional life of Naples; his memory, linked to enduring local traditions, symbolizes steadfast witness and communal intercession in times of trial.', '4th century'),
('saint-andrew-kim-tae-gon', 'Saint Andrew Kim Tae-gon', 'First Korean-born Catholic priest and martyr.', 'Andrew Kim Tae-gon was ordained as the first native Korean priest and served clandestinely amid persecution, organizing pastoral networks and sustaining persecuted communities; his martyrdom became a foundational symbol of the Korean Church''s courage, missionary commitment and fidelity under oppression.', '1821–1846'),
('saint-paul-chong-ha-sang', 'Saint Paul Chong Ha-sang', 'Korean lay leader and martyr; companion of Andrew Kim.', 'Paul Chong Ha-sang was a prominent lay leader of the early Korean Church who organized communities, supported clergy, and defended the faith under persecution. He was martyred in 1839 and is honored with the Korean Martyrs as a witness of steadfast Christian courage.', '1794–1839'),
('saint-matthew', 'Saint Matthew, Apostle and Evangelist', 'Apostle, evangelist and witness to Christ''s teaching and mission.', 'Matthew, traditionally identified as a former tax collector called by Jesus, is honored as one of the Twelve and as the evangelist associated with the first canonical Gospel, whose theological portrait of Christ and fulfillment themes profoundly shaped Christian catechesis and liturgy.', '1st century'),
('saint-pius-of-pietrelcina', 'Saint Pius of Pietrelcina', 'Capuchin friar, confessor and stigmatist known for prayer and pastoral care.', 'Pius of Pietrelcina, known as Padre Pio, became internationally known for his intense sacramental ministry, spiritual direction, charity and reported mystical phenomena; his witness emphasized conversion, confession, Eucharistic devotion and compassionate accompaniment of suffering people.', '1887–1968'),
('saint-cosmas', 'Saint Cosmas', 'Early Christian physician-martyr, traditionally commemorated with Saint Damian.', 'Cosmas is venerated in Christian tradition as a physician-martyr who, with Damian, cared for the sick and witnessed to Christ in the age of persecution. Their cult spread widely in East and West as a model of medical charity joined to steadfast faith. Although precise biographical data are limited, ecclesial memory preserves Cosmas as a figure of healing service and evangelical generosity.', '3rd century'),
('saint-damian', 'Saint Damian', 'Early Christian physician-martyr, traditionally commemorated with Saint Cosmas.', 'Damian is honored as an early Christian physician-martyr, remembered together with Cosmas for charitable care of the sick and courageous witness to the Gospel. Their shared veneration became deeply rooted in liturgical tradition and Christian devotion, especially as patrons linked to medicine and compassionate service.', '3rd century'),
('saint-vincent-de-paul', 'Saint Vincent de Paul', 'Priest and organizer of charitable service to the poor.', 'Vincent de Paul transformed early modern Catholic charity by founding institutions and collaborating with lay and religious networks for care of the poor, abandoned children, prisoners and rural populations; his pastoral strategy united practical organization, spiritual formation and social compassion.', '1581–1660'),
('saint-wenceslaus', 'Saint Wenceslaus', 'Duke and martyr, patron of Bohemia.', 'Wenceslaus, duke of Bohemia, is remembered for promoting Christian faith, justice and peace in a politically unstable context; his death in dynastic conflict was interpreted as martyrdom, and his memory became central to Bohemian Christian identity and royal sanctity traditions.', 'c. 907–935'),
('saint-lawrence-ruiz', 'Saint Lawrence Ruiz', 'Filipino protomartyr with companions martyred in Japan.', 'Lawrence Ruiz, a layman from Manila, was martyred in seventeenth-century Japan with missionary companions after refusing to renounce the faith; his witness symbolizes the transnational character of Catholic mission in Asia and the steadfast courage of lay and clerical believers under severe persecution.', 'c. 1600–1637'),
-- ('saints-michael-gabriel-and-raphael', 'Saints Michael, Gabriel and Raphael, Archangels', 'Archangels revered as messengers and servants of God in salvation history.', 'Michael, Gabriel and Raphael are venerated as archangels whose biblical missions reveal divine protection, proclamation and healing; their joint celebration in the Roman calendar expresses the Church''s faith in angelic ministry and God''s providential care.', ''),
('saint-jerome', 'Saint Jerome', 'Priest, biblical scholar and Doctor of the Church; translator of the Vulgate.', 'Jerome devoted his life to biblical study, ascetic discipline and pastoral correspondence, producing the Latin Vulgate that became foundational for Western Christianity; his scholarship, polemical writings and monastic engagement in Bethlehem left a decisive mark on scriptural theology and Christian learning.', 'c. 347–420')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-gregory-the-great', 'Saint Grégoire le Grand', 'Pape et docteur de l''Église; pasteur, liturgiste et réformateur.', 'Grégoire le Grand guida l''Église dans une période de crise politique et sociale, renforça le gouvernement pastoral, soutint l''influence monastique et relança l''élan missionnaire, notamment vers l''Angleterre anglo-saxonne; ses écrits, tels que la Règle pastorale et les Morales sur Job, ont marqué durablement la spiritualité et le ministère en Occident.', 'v. 540–604'),
('saint-teresa-of-calcutta', 'Sainte Teresa de Calcutta', 'Fondatrice des Missionnaires de la Charité et témoin de miséricorde auprès des plus pauvres.', 'Teresa de Calcutta fonda les Missionnaires de la Charité et consacra sa vie aux personnes abandonnées, malades et mourantes dans les contextes de grande pauvreté urbaine; son témoignage unit compassion concrète, pauvreté évangélique et persévérance dans la prière, inspirant une vaste mobilisation caritative.', '1910–1997'),
('saint-peter-claver', 'Saint Pierre Claver', 'Prêtre jésuite et défenseur des personnes réduites en esclavage à Carthagène.', 'Pierre Claver voua son ministère aux esclaves africains débarquant à Carthagène en leur offrant catéchèse, sacrements, soins et accompagnement personnel; sa vie demeure un témoignage prophétique de la dignité humaine et de la solidarité chrétienne dans un contexte d''injustice coloniale.', '1581–1654'),
('saint-john-chrysostom', 'Saint Jean Chrysostome', 'Évêque et docteur de l''Église; prédicateur et exégète remarquable.', 'Jean Chrysostome, dit ''Bouche d''or'', est l''un des plus grands prédicateurs de l''Antiquité chrétienne; ses homélies bibliques, son exigence morale et sa critique des abus sociaux marquèrent profondément son temps, et son ministère épiscopal à Constantinople fut accompagné d''épreuves et d''exil.', 'v. 347–407'),
('saint-cornelius', 'Saint Corneille', 'Pape et martyr au milieu des persécutions du IIIe siècle.', 'Corneille gouverna l''Église de Rome à une époque de persécution et de débats sur la réconciliation des lapsi; son pontificat mit en valeur la miséricorde ecclésiale et l''unité, et son témoignage dans l''épreuve renforça l''autorité pastorale romaine.', '† 253'),
('saint-cyprian', 'Saint Cyprien', 'Évêque de Carthage, martyr et théologien majeur de l''ecclésiologie latine.', 'Cyprien de Carthage unit gouvernement pastoral et réflexion doctrinale sur l''unité de l''Église, les sacrements et l''épiscopat; ses lettres et traités guidèrent les chrétiens durant persécutions et schismes, et son martyre confirma une influence durable.', 'v. 200–258'),
('saint-robert-bellarmine', 'Saint Robert Bellarmin', 'Cardinal jésuite, controversiste et docteur de l''Église.', 'Robert Bellarmin fut une figure intellectuelle majeure de la Contre-Réforme; ses travaux d''apologétique, d''ecclésiologie et d''interprétation biblique structurèrent la pensée catholique post-tridentine, tandis que son ministère pastoral encouragea catéchèse et réforme du clergé.', '1542–1621'),
('saint-hildegard-of-bingen', 'Sainte Hildegarde de Bingen', 'Abbesse, mystique et docteur de l''Église à l''influence théologique et culturelle large.', 'Hildegarde de Bingen associa direction monastique, théologie visionnaire, création liturgique et observation de la nature dans une œuvre considérable; ses lettres, sa musique et ses exhortations prophétiques marquèrent la spiritualité médiévale et les dynamiques de réforme au XIIe siècle.', '1098–1179'),
('saint-januarius', 'Saint Janvier', 'Évêque et martyr, principal patron de Naples.', 'Janvier est vénéré comme évêque martyr des premiers siècles; son culte est central dans la mémoire religieuse napolitaine et demeure lié à des traditions populaires de protection et d''intercession en temps d''épreuve.', 'IVe siècle'),
('saint-andrew-kim-tae-gon', 'Saint André Kim Tae-gon', 'Premier prêtre catholique coréen et martyr.', 'André Kim Tae-gon fut ordonné comme premier prêtre coréen autochtone et exerça un ministère clandestin dans un contexte de persécution, organisant des réseaux pastoraux et soutenant des communautés opprimées; son martyre est devenu un symbole fondateur de la fidélité de l''Église de Corée.', '1821–1846'),
('saint-paul-chong-ha-sang', 'Saint Paul Chong Ha-sang', 'Laïc coréen et martyr, compagnon de saint André Kim.', 'Paul Chong Ha-sang fut un laïc influent de l’Église coréenne naissante, organisant les communautés, soutenant les missionnaires et défendant la foi malgré les persécutions. Il fut martyrisé en 1839 et est honoré parmi les martyrs coréens pour son courage et sa fidélité.', '1794–1839'),
('saint-matthew', 'Saint Matthieu, apôtre et évangéliste', 'Apôtre, évangéliste et témoin de l''enseignement du Christ.', 'Matthieu, traditionnellement identifié comme ancien publicain appelé par Jésus, est honoré comme membre des Douze et évangéliste du premier évangile canonique; sa présentation théologique du Christ et des accomplissements scripturaires a profondément marqué la catéchèse et la liturgie.', 'Ier siècle'),
('saint-pius-of-pietrelcina', 'Saint Pio de Pietrelcina', 'Frère capucin, confesseur et stigmatisé connu pour la prière et l''accompagnement pastoral.', 'Padre Pio est devenu mondialement connu pour son ministère sacramentel intense, sa direction spirituelle, sa charité et des phénomènes mystiques rapportés; son témoignage insiste sur la conversion, la confession, l''Eucharistie et la compassion envers les souffrants.', '1887–1968'),
('saint-cosmas', 'Saint Côme', 'Médecin-martyr des premiers siècles, traditionnellement commémoré avec saint Damien.', 'Côme est vénéré dans la tradition chrétienne comme médecin-martyr qui, avec Damien, soigna les malades et rendit témoignage au Christ durant les persécutions. Leur culte s’est largement diffusé en Orient et en Occident comme modèle de charité médicale unie à la fidélité de la foi. Même si les données biographiques précises sont limitées, la mémoire ecclésiale conserve Côme comme figure de service guérissant et de générosité évangélique.', 'IIIe siècle'),
('saint-damian', 'Saint Damien', 'Médecin-martyr des premiers siècles, traditionnellement commémoré avec saint Côme.', 'Damien est honoré comme médecin-martyr de l’antiquité chrétienne, commémoré avec Côme pour le soin charitable des malades et le témoignage courageux de l’Évangile. Leur vénération commune est devenue profondément enracinée dans la liturgie et la dévotion chrétienne, notamment comme patrons liés à la médecine et à la compassion.', 'IIIe siècle'),
('saint-vincent-de-paul', 'Saint Vincent de Paul', 'Prêtre et organisateur majeur de la charité au service des pauvres.', 'Vincent de Paul transforma les pratiques caritatives de l''époque moderne en fondant des institutions et en mobilisant réseaux laïcs et religieux pour servir pauvres, enfants abandonnés, prisonniers et populations rurales; son approche unit organisation concrète, formation spirituelle et compassion sociale.', '1581–1660'),
('saint-wenceslaus', 'Saint Venceslas', 'Duc et martyr, patron de la Bohême.', 'Venceslas, duc de Bohême, est honoré pour la promotion de la foi chrétienne, de la justice et de la paix dans un contexte politique instable; sa mort dans un conflit dynastique fut reçue comme martyre et sa mémoire devint centrale dans l''identité chrétienne bohémienne.', 'v. 907–935'),
('saint-lawrence-ruiz', 'Saint Laurent Ruiz', 'Protomartyr philippin et compagnons martyrisés au Japon.', 'Laurent Ruiz, laïc originaire de Manille, fut martyrisé au Japon au XVIIe siècle avec des compagnons missionnaires après avoir refusé d''abjurer la foi; son témoignage manifeste le caractère transnational de la mission catholique en Asie et le courage des fidèles, laïcs et clercs.', 'v. 1600–1637'),
-- ('saints-michael-gabriel-and-raphael', 'Saints Michel, Gabriel et Raphaël, archanges', 'Archanges vénérés comme messagers et serviteurs de Dieu dans l''histoire du salut.', 'Michel, Gabriel et Raphaël sont honorés comme archanges dont les missions bibliques expriment protection divine, annonce du salut et guérison; leur célébration conjointe dans le calendrier romain rappelle la foi de l''Église en l''assistance angélique.', ''),
('saint-jerome', 'Saint Jérôme', 'Prêtre, bibliste et docteur de l''Église; traducteur de la Vulgate.', 'Jérôme consacra sa vie à l''étude de l''Écriture, à l''ascèse et à la direction spirituelle; sa traduction latine de la Bible (Vulgate) devint une référence fondamentale pour l''Occident chrétien, et ses travaux exégétiques influencèrent durablement la théologie biblique.', 'v. 347–420')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-gregory-the-great', 'Sanctus Gregorius Magnus', 'Papa et Doctor Ecclesiae; pastor, liturgicus et reformator.', 'Gregorius Magnus Ecclesiae praesuit temporibus fracturae politicae et socialis crisi; gubernationem pastoralem, influentiam monasticam ac missiones, praesertim ad Anglos, firmavit. Opera eius, inter quas Regula Pastoralis et Moralia, spiritum et officium in Occidente diu informaverunt.', 'c. 540–604'),
('saint-teresa-of-calcutta', 'Sancta Teresa a Calcutta', 'Fundatrix Missionariarum Caritatis et testimonium misericordiae erga pauperes.', 'Teresa a Calcutta Missionarias Caritatis condidit et vitam suam dedi ut pauperibus, despectis et infirmis ministraret; eius exemplum coniungit compassiorem operam, paupertatem evengelicam et perseverantem orationem, et inspiravit missionem caritatis in toto orbe.', '1910–1997'),
('saint-peter-claver', 'Sanctus Petrus Claverius', 'Presbyter Societatis Iesu et defensor servorum in Carthagine.', 'Petrus Claver ministerium suum dedidit ad servos africanos in portu Carthagenae advenientes: catechesim, sacramenta, curam medicam et personalem comitatum praestans. Vita eius testimonio dignitatis humanae et solidarietatis christianorum in iniustitia coloniali fuit.', '1581–1654'),
('saint-john-chrysostom', 'Sanctus Ioannes Chrysostomus', 'Episcopus et Doctor Ecclesiae; praeclarus praedicator et exsegeta.', 'Ioannes Chrysostomus, vulgo "Chrysostomus", unus ex amplissimis oratoribus antiquae Christianitatis est; notus est ob homilias biblicas, exhortationes morales et censuras in mores corruptos; ut Constantinopolitanae episcopus, reformationem clericorum et aulicae morum intendit et propter sinceritatem in exsilium missus est.', 'c. 347–407'),
('saint-cornelius', 'Sanctus Cornelius', 'Papa et martyr temporibus persecutionum saeculi III.', 'Cornelius Ecclesiae Romanae praeerat in aetate persecutionum et controversiarum de reconciliatione lapsorum; pontificatus eius misericordiam et unitatem ecclesiae promovit, et martyrio memoratur.', '† 253'),
('saint-cyprian', 'Sanctus Cyprianus', 'Episcopus Carthaginensis, martyr et auctor theologiae ecclesiasticae.', 'Cyprianus administrationem episcopalem cum reflectione doctrinali de unitate Ecclesiae, sacramentis et episcopatu coniunxit; epistulae et tractatus eius Christianos per persecutiones et schismata dirigerunt, et martyrio confirmatus est.', 'c. 200–258'),
('saint-robert-bellarmine', 'Sanctus Robertus Bellarminus', 'Cardinalis Societatis Iesu, controversista et Doctor Ecclesiae.', 'Robertus Bellarminus fuit praeclarus theologus Contrareformationis; scriptis in apologetica, ecclesiologia et interpretatione scripturarum magnum sensum doctrinalem post-Tridentinum attulit; ut pastor et cardinalis catechesim et disciplinam clericalem fovebat.', '1542–1621'),
('saint-hildegard-of-bingen', 'Sancta Hildegardis Bingensis', 'Abbatissa, mystica et Doctor Ecclesiae; multum theologica, musica et medicina scripsit.', 'Hildegardis Bingensis monasticam directionem, visionum theologicam, opus liturgicum et observationes naturales concinnavit; epistulae, musica et exhortationes propheticae eius in spiritualitate medii aevi valde sonuerunt.', '1098–1179'),
('saint-januarius', 'Sanctus Ianuarius', 'Episcopus et martyr; patronus principalis Neapolis.', 'Ianuarius veneratur ut episcopus-martyrus antiquus cuius cultus factus est cardo identitatis et pietatis Neapolitanae; memoria eius ad traditiones locales et intercessionem communitatis vinculatur.', 'saec. IV'),
('saint-andrew-kim-tae-gon', 'Sanctus Andreas Kim Tae-gon', 'Primus sacerdos coreanus nativus et martyr.', 'Andreas Kim Tae-gon primus sacerdos nativus Coreae ordinatus est et sub persecutione clandestine pastorem gessit, retia pastoralia ordinavit et communitates sustentavit; martyrio factus signum est virtutis et missionis coreanae.', '1821–1846'),
('saint-paul-chong-ha-sang', 'Sanctus Paulus Chong Ha-sang', 'Laicus Coreanus et martyr; socius Sancti Andreae Kim.', 'Paulus Chong Ha-sang laicus eminens Ecclesiae Coreanae fuit, qui communitates ordinavit, missionarios sustentavit et fidem sub persecutione defendit. Anno 1839 martyrium passus est et inter martyres Coreanos fidelitatis exemplum colitur.', '1794–1839'),
('saint-matthew', 'Sanctus Matthaeus, apostolus et evangelista', 'Apostolus et evangelista, testis doctrinae et missionis Christi.', 'Matthaeus, traditus ut publicanus et a Christo vocatus, inter Duodecim numeratur; evangelium illi attributum thema complendi et personam Christi theologicam in ecclesia primitiva firmavit.', 'saec. I'),
('saint-pius-of-pietrelcina', 'Sanctus Pius a Pietrelcina', 'Frater Capucinus, confessarius et stigmatisatus notus pro oratione et cura pastorali.', 'Pius a Pietrelcina (Padre Pio) amplam famam assecutus est propter ministerium sacramentale intensum, directionem spiritualem, caritatem et relationes mysticas reportatas; eius vita conversionem, confessionem et devotionem eucharisticam extollit.', '1887–1968'),
('saint-cosmas', 'Sanctus Cosmas', 'Medicus-martyr antiquae Ecclesiae, cum Sancto Damiano tradite commemoratus.', 'Cosmas in traditione christiana colitur ut medicus-martyr qui, una cum Damiano, aegrotis ministravit et Christo sub persecutione testimonium dedit. Cultus eorum late in Oriente et Occidente diffusus est ut exemplar caritatis medicae cum fide constanti coniunctae. Etsi notitiae biographicae certae paucae sunt, memoria ecclesialis Cosmam servat ut figuram ministerii sanantis et liberalitatis evangelicae.', 'saec. III'),
('saint-damian', 'Sanctus Damianus', 'Medicus-martyr antiquae Ecclesiae, cum Sancto Cosma tradite commemoratus.', 'Damianus honoratur ut medicus-martyr antiquae christianitatis, cum Cosma commemoratus propter curam misericordem infirmorum et fortem Evangelii confessionem. Communis eorum veneratio in traditione liturgica et devotione christiana alte radicata est, praesertim ut patroni medicinae et caritatis.', 'saec. III'),
('saint-vincent-de-paul', 'Sanctus Vincentius a Paulo', 'Presbyter et architectus operum caritatis pro pauperibus.', 'Vincentius a Paulo instituta caritatis condidit et per nexus laicorum et religiosorum curam pauperum, orphanorum et captivorum ordinavit; eius praxis unit organizationem practicam cum formatione spirituali.', '1581–1660'),
('saint-wenceslaus', 'Sanctus Venceslaus', 'Dux et martyr; patronus Bohemiae.', 'Venceslaus, dux Bohemiae, fidem Christianam, iustitiam et pacem propagavit in temporibus instabilibus; occisio eius in conflictu dynastico quasi martyria accipitur et memoria eius nationalem identitatem religiosam formavit.', 'c. 907–935'),
('saint-lawrence-ruiz', 'Sanctus Laurentius Ruiz', 'Protomartyr Philippinus cum sociis in Iaponia martyrizatus.', 'Laurentius Ruiz, laicus Manilae oriundus, in Iaponia saeculo XVII cum missionariis martyrizatus est post recusationem abjurationis; eius vita exemplum missionis transnationalis et constantiae laicorum in fide praebet.', 'c. 1600–1637'),
-- ('saints-michael-gabriel-and-raphael', 'Sancti Michael, Gabriel et Raphaël, Archangeli', 'Archangeli venerandi ut nuntii et ministri Dei.', 'Michael, Gabriel et Raphaël archangeli sunt quorum scripturae missiones protectionem, nuntiationem et sanationem significant; communis celebratio in calendario Romano fidem Ecclesiae in ministerio angelico et providentia Dei exprimit.', ''),
('saint-jerome', 'Sanctus Hieronymus', 'Presbyter, biblio-criticus et Doctor Ecclesiae; Vulgatae auctor.', 'Hieronymus vitam suam studiis scripturarum, asceti et directioni spirituali dedicavit; interpretatio Latina Bibliorum (Vulgata) ab eo completa fundamentum doctrinae et liturgiae in Occidente posuit, et opera exegetica eius usque hodie valde influunt.', 'c. 347–420')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- OCTOBER SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-therese-of-the-child-jesus', 'Saint Thérèse of the Child Jesus, Virgin and Doctor of the Church',
  1873, 1, 2, FALSE,
  1897, 9, 30, FALSE,
  19,
  (SELECT id FROM places WHERE code='ALENCON'),
  (SELECT id FROM places WHERE code='LISIEUX'),
  (SELECT id FROM places WHERE code='LISIEUX')
),
-- (
--   'holy-guardian-angels', 'The Holy Guardian Angels',
--   NULL, NULL, NULL, TRUE,
--   NULL, 10, 2, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-francis-of-assisi', 'Saint Francis of Assisi',
  1182, NULL, NULL, TRUE,
  1226, 10, 3, FALSE,
  13,
  (SELECT id FROM places WHERE code='ASSISI'),
  (SELECT id FROM places WHERE code='ASSISI'),
  (SELECT id FROM places WHERE code='ASSISI')
),
(
  'saint-faustina-kowalska', 'Saint Faustina Kowalska',
  1905, 8, 25, FALSE,
  1938, 10, 5, FALSE,
  20,
  (SELECT id FROM places WHERE code='GLOGOWIEC'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-bruno', 'Saint Bruno',
  1030, NULL, NULL, TRUE,
  1101, 10, 6, FALSE,
  12,
  (SELECT id FROM places WHERE code='COLOGNE'),           -- place_of_birth
  (SELECT id FROM places WHERE code='SERRA_SAN_BRUNO'),   -- place_of_death
  (SELECT id FROM places WHERE code='GRANDE_CHARTREUSE')  -- place_of_activity (founder of the Carthusian order)

),
-- (
--   'our-lady-of-the-rosary', 'Our Lady of the Rosary',
--   NULL, NULL, NULL, TRUE,
--   NULL, 10, 7, TRUE,
--   NULL,
--   NULL, NULL, NULL
-- ),
(
  'saint-denis', 'Saint Denis, Bishop', -- and Companions, Martyrs
  NULL, NULL, NULL, TRUE,
  250, NULL, NULL, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='MONTMARTRE'),
  (SELECT id FROM places WHERE code='PARIS')
),
(
  'saint-john-leonardi', 'Saint John Leonardi',
  1541, NULL, NULL, FALSE,
  1609, 10, 9, FALSE,
  17,
  (SELECT id FROM places WHERE code='DIECIMO'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='LUCCA')
),
(
  'saint-john-henry-newman', 'Saint John Henry Newman',
  1801, 2, 21, FALSE,
  1890, 8, 11, FALSE,
  19,
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='BIRMINGHAM'),
  (SELECT id FROM places WHERE code='OXFORD')
),
(
  'saint-john-xxiii', 'Saint John XXIII',
  1881, 11, 25, FALSE,
  1963, 6, 3, FALSE,
  20,
  (SELECT id FROM places WHERE code='SOTTO_IL_MONTE_GIOVANNI_XXIII'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-callistus-i', 'Saint Callistus I, Pope and Martyr',
  155, NULL, NULL, TRUE,
  222, 10, 14, TRUE,
  3,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-teresa-of-jesus', 'Saint Teresa of Jesus (Teresa of Ávila), Virgin and Doctor of the Church',
  1515, 3, 28, FALSE,
  1582, 10, 4, FALSE,
  16,
  (SELECT id FROM places WHERE code='AVILA'),
  (SELECT id FROM places WHERE code='ALBA_DE_TORMES'),
  (SELECT id FROM places WHERE code='AVILA')
),
(
  'saint-hedwig', 'Saint Hedwig',
  1174, NULL, NULL, TRUE,
  1243, 10, 15, FALSE,
  13,
  (SELECT id FROM places WHERE code='ANDECHS'),
  (SELECT id FROM places WHERE code='TRZEBNICA'),
  (SELECT id FROM places WHERE code='WROCLAW')

),
(
  'saint-margaret-mary-alacoque', 'Saint Margaret Mary Alacoque',
  1647, 7, 22, FALSE,
  1690, 10, 17, FALSE,
  17,
  (SELECT id FROM places WHERE code='VEROSVRES'),
  (SELECT id FROM places WHERE code='PARAY-LE-MONIAL'),
  (SELECT id FROM places WHERE code='PARAY-LE-MONIAL')
),
(
  'saint-ignatius-of-antioch', 'Saint Ignatius of Antioch, Bishop and Martyr',
  33, NULL, NULL, TRUE,
  110, NULL, NULL, TRUE,
  2,
  (SELECT id FROM places WHERE code='ANTIOCH'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ANTIOCH')
),
(
  'saint-luke', 'Saint Luke, Evangelist',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='ANTIOCH'),
  NULL,
  (SELECT id FROM places WHERE code='ANTIOCH')
),
(
  'saint-john-de-brebeuf', 'Saints John de Brébeuf', -- Isaac Jogues, and Companions, Martyrs
  1593, 3, 25, FALSE,
  1649, 3, 16, TRUE,
  17,
  (SELECT id FROM places WHERE code='CONDE_SUR_VIRE'),
  (SELECT id FROM places WHERE code='MIDLAND'),
  (SELECT id FROM places WHERE code='MIDLAND')
),
(
  'saint-paul-of-the-cross', 'Saint Paul of the Cross',
  1694, 1, 3, FALSE,
  1775, 10, 18, FALSE,
  18,
  (SELECT id FROM places WHERE code='OVADA'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='MONTE_ARGENTARIO')
),
(
  'saint-john-paul-ii', 'Saint John Paul II',
  1920, 5, 18, FALSE,
  2005, 4, 2, FALSE,
  21,
  (SELECT id FROM places WHERE code='WADOWICE'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
  -- krakovie ?
),
(
  'saint-john-of-capistrano', 'Saint John of Capistrano',
  1386, 6, 24, TRUE,
  1456, 10, 23, FALSE,
  15,
  (SELECT id FROM places WHERE code='CAPESTRANO'),
  (SELECT id FROM places WHERE code='ILOK'),
  (SELECT id FROM places WHERE code='BELGRADE')
),
(
  'saint-anthony-mary-claret', 'Saint Anthony Mary Claret, Bishop',
  1807, 12, 23, FALSE,
  1870, 10, 24, FALSE,
  19,
  (SELECT id FROM places WHERE code='SALLENT'),
  (SELECT id FROM places WHERE code='FONTFROIDE'),
  (SELECT id FROM places WHERE code='VIC')
),
(
  'saint-simon-apostle', 'Saint Simon, Apostle',
  5, NULL, NULL, TRUE,
  65, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='CANA'),
  (SELECT id FROM places WHERE code='PERSIA'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-jude-apostle', 'Saint Jude, Apostle',
  10, NULL, NULL, TRUE,
  65, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='GALILEE'),
  (SELECT id FROM places WHERE code='PERSIA'),
  (SELECT id FROM places WHERE code='JERUSALEM')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-therese-of-the-child-jesus', 'Saint Thérèse of the Child Jesus, Virgin and Doctor of the Church', 'Carmelite nun and Doctor of the Church known for her "little way" of spiritual childhood.', 'Thérèse of Lisieux proposed a path of simple trust and love — the "little way" — through a life of prayer and hidden sacrifice; her autobiographical work and example influenced modern spirituality.', '1873–1897'),
-- ('holy-guardian-angels', 'The Holy Guardian Angels', 'Memorial honoring angels entrusted with the protection of individuals.', 'The memorial recognizes the Church''s belief in guardian angels assigned to accompany and protect each person, encouraging devotion and prayer for heavenly assistance.', ''),
('saint-francis-of-assisi', 'Saint Francis of Assisi', 'Founder of the Franciscan family, model of poverty and care for creation.', 'Francis embraced radical poverty, preaching and service; he founded the Friars Minor and inspired a spiritual renewal that emphasized simplicity, fraternity and reverence for creation.', '1182–1226'),
('saint-faustina-kowalska', 'Saint Faustina Kowalska', 'Polish nun and mystic associated with the Divine Mercy devotion.', 'Sister Faustina''s diary recorded revelations that promoted the message of Divine Mercy; her spirituality encouraged trust in God''s mercy and led to a global devotion and feast.', '1905–1938'),
('saint-bruno', 'Saint Bruno', 'Priest and founder of the Carthusian Order, noted for contemplative rigor.', 'Bruno of Cologne established the Carthusian hermit-monastic life, combining solitude and communal observance, and became a model for contemplative discipline in the Latin West.', 'c. 1030–1101'),
('saint-denis', 'Saint Denis, Bishop', 'Bishop and martyrs linked to the evangelization of Gaul; traditional patrons of Paris.', 'Denis is venerated as an early bishop-martyr whose cult became central to the Christian identity of Paris; his companions share in the memory of evangelization and witness.', '3rd century'),
('saint-john-leonardi', 'Saint John Leonardi', 'Priest and reformer who promoted clergy formation and missions.', 'John Leonardi worked for clerical reform and pastoral renewal, founding a congregation dedicated to priestly formation and evangelization in post‑Tridentine Italy.', '1541–1609'),
('saint-john-henry-newman', 'Saint John Henry Newman', 'English convert, priest, theologian and Cardinal; later declared Doctor of the Church.', 'Newman''s intellectual conversion and ministry shaped Anglican‑Catholic dialogue and modern Catholic theology; his sermons, letters and pastoral work emphasized conscience and the development of doctrine.', '1801–1890'),
('saint-john-xxiii', 'Saint John XXIII', 'Pope who convoked the Second Vatican Council and promoted pastoral renewal.', 'Pope John XXIII guided the Church through a spirit of openness and aggiornamento, calling the Council that fostered liturgical, pastoral and ecumenical renewal in the modern era.', '1881–1963'),
('saint-callistus-i', 'Saint Callistus I, Pope and Martyr', 'Pope of the early third century associated with pastoral care and martyrdom.', 'Callistus led the Roman Church during a difficult era and his memory is connected with the pastoral challenges of reconciliation and witness under persecution.', '3rd century'),
('saint-teresa-of-jesus', 'Saint Teresa of Jesus (Teresa of Ávila), Virgin and Doctor of the Church', 'Carmelite reformer, mystic and Doctor of the Church.', 'Teresa of Ávila renewed Carmelite life through contemplative reforms, writings on prayer and mystical theology that have become classics of Christian spirituality.', '1515–1582'),
('saint-hedwig', 'Saint Hedwig', 'Religious and patron known for charity and monastic patronage.', 'Hedwig of Silesia devoted herself to prayer, care of the poor and the support of monasteries, becoming a model of noble piety and generosity in medieval Central Europe.', 'c. 1174–1243'),
('saint-margaret-mary-alacoque', 'Saint Margaret Mary Alacoque', 'Visitation nun who promoted devotion to the Sacred Heart of Jesus.', 'Margaret Mary''s mystical experiences popularized the devotion to the Sacred Heart, leading to renewed Eucharistic devotion and the spread of the devotion in the modern Church.', '1647–1690'),
('saint-ignatius-of-antioch', 'Saint Ignatius of Antioch, Bishop and Martyr', 'Early bishop and eloquent martyr whose letters shaped early ecclesiology.', 'Ignatius''s letters emphasize episcopal unity, sacramental life and the centrality of Christ; his witness by martyrdom became a foundational testimony for the Church''s identity.', '2nd century'),
('saint-luke', 'Saint Luke, Evangelist', 'Evangelist, physician and author of the Gospel and Acts.', 'Luke the Evangelist contributed a theological and pastoral Gospel and the Acts of the Apostles, offering a narrative shaped by compassion, healing and mission to the Gentiles.', '1st century'),
('saint-john-de-brebeuf', 'Saint John de Brébeuf', 'Jesuit missionaries and companions martyred in North America; remembered for missionary zeal and sacrifice.', 'The Canadian Martyrs served Indigenous peoples and European missions, facing persecution and death for their missionary commitment in the seventeenth century.', ''),
('saint-paul-of-the-cross', 'Saint Paul of the Cross', 'Founder of the Passionists and preacher of the Passion of Christ.', 'Paul of the Cross established the Congregation of the Passion to promote recollection, preaching and devotion centered on Christ''s passion as the heart of Christian life.', '1694–1775'),
('saint-john-paul-ii', 'Saint John Paul II', 'Pope, theologian and global pastor who engaged culture and evangelization.', 'Karol Wojtyła''s papacy combined philosophical reflection, pastoral outreach and charismatic leadership, with a strong emphasis on human dignity, evangelization and engagement with the modern world.', '1920–2005'),
('saint-john-of-capistrano', 'Saint John of Capistrano', 'Franciscan friar, preacher and missionary leader.', 'John of Capistrano was known for his preaching, reform efforts and missionary zeal in fifteenth‑century Europe, playing a notable role in popular mobilization and pastoral renewal.', '1386–1456'),
('saint-anthony-mary-claret', 'Saint Anthony Mary Claret, Bishop', 'Founder of the Claretians, missionary and confessor to the poor.', 'Anthony Mary Claret combined pastoral care, missionary activity and publishing to promote catechesis, social reform and devotion in nineteenth‑century Spain and Latin America.', '1807–1870'),
('saint-simon-apostle', 'Saint Simon, Apostle', 'Apostle of the Lord, honored among the Twelve for apostolic witness.', 'Simon is venerated as one of the Twelve Apostles of Christ. Although historical details about his later ministry are limited, Christian tradition consistently honors him as a faithful witness to the Resurrection and participant in the apostolic mission of the early Church. In liturgical memory he is frequently commemorated together with Jude, while remaining a distinct apostolic person.', '1st century'),
('saint-jude-apostle', 'Saint Jude, Apostle', 'Apostle of the Lord, traditionally invoked as intercessor in difficult causes.', 'Jude, also called Thaddaeus in some traditions, is honored as one of the Twelve Apostles. Ecclesial memory venerates him as a faithful herald of the Gospel and a witness of Christ in the apostolic age. Over time he became widely invoked by the faithful in situations of great difficulty, while liturgy often commemorates him jointly with Simon.', '1st century')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-therese-of-the-child-jesus', 'Sainte Thérèse de l''Enfant-Jésus, vierge et docteur de l''Église', 'Carmélite et docteur de l''Église connue pour sa "petite voie".', 'Thérèse de Lisieux proposa une voie de confiance et d''amour simple — la "petite voie" — à travers une vie de prière et de sacrifice discret; son autobiographie et son exemple ont profondément marqué la spiritualité moderne.', '1873–1897'),
-- ('holy-guardian-angels', 'Les Saints Anges Gardiens', 'Commémoration des anges chargés de la protection des personnes.', 'La fête invite à reconnaître la présence et l''assistance des anges gardiens, encourageant la dévotion et la prière pour leur aide céleste.', ''),
('saint-francis-of-assisi', 'Saint François d''Assise', 'Fondateur de la famille franciscaine, modèle de pauvreté et de soin de la création.', 'François embrassa la pauvreté évangélique, la prédication et le service; fondateur des Frères Mineurs, il inspira un renouveau spirituel axé sur la simplicité, la fraternité et le respect de la création.', '1182–1226'),
('saint-faustina-kowalska', 'Sainte Faustine Kowalska', 'Religieuse et mystique polonaise liée à la dévotion à la Divine Miséricorde.', 'Le journal de Sœur Faustine rapporte des révélations qui ont diffusé le message de la Miséricorde Divine; sa spiritualité a encouragé la confiance en la miséricorde de Dieu et a conduit à une dévotion mondiale.', '1905–1938'),
('saint-bruno', 'Saint Bruno', 'Prêtre et fondateur de l''ordre des Chartreux, renommé pour la vie contemplative.', 'Bruno de Cologne institua une forme de vie monastique combinant solitude et vie communautaire, devenant un modèle de discipline contemplative en Occident.', 'c. 1030–1101'),
('saint-denis', 'Saint Denis, évêque', 'Évêque et martyrs liés à l''évangélisation de la Gaule; patrons traditionnels de Paris.', 'Denis est vénéré comme évêque‑martyr dont le culte est central pour l''identité chrétienne de Paris; ses compagnons partagent la mémoire de l''évangélisation et du témoignage.', 'IIIe siècle'),
('saint-john-leonardi', 'Saint Jean Leonardi', 'Prêtre réformateur engagé dans la formation sacerdotale et la mission.', 'Jean Leonardi œuvra pour la réforme du clergé et le renouveau pastoral, fondant une congrégation dédiée à la formation sacerdotale et à l''évangélisation en Italie post‑tridentine.', '1541–1609'),
('saint-john-henry-newman', 'Saint John Henry Newman', 'Converti anglais, prêtre, théologien et cardinal; docteur de l''Église.', 'La conversion intellectuelle de Newman et son ministère ont marqué le dialogue anglican‑catholique et la théologie moderne; ses écrits soulignent la conscience et le développement de la doctrine.', '1801–1890'),
('saint-john-xxiii', 'Saint Jean XXIII', 'Pape qui convoqua le Concile Vatican II et promut un renouveau pastoral.', 'Le pape Jean XXIII anima l''église d''un esprit d''ouverture et d''aggiornamento, appelant à un concile qui a favorisé le renouveau liturgique, pastoral et œcuménique au XXe siècle.', '1881–1963'),
('saint-callistus-i', 'Saint Callixte I', 'Pape du IIIe siècle associé aux défis pastoraux et au martyre.', 'Callixte présida l''Église romaine dans une période troublée; sa mémoire est liée aux enjeux de réconciliation et de témoignage sous la persécution.', 'IIIe siècle'),
('saint-teresa-of-jesus', 'Sainte Thérèse d''Avila (Thérèse de Jésus), vierge et docteur de l''Église', 'Réformatrice carmélite, mystique et docteur de l''Église.', 'Thérèse d''Avila renouvela la vie carmélitaine par des réformes contemplatives et des écrits sur la prière et la mystique qui demeurent des références majeures.', '1515–1582'),
('saint-hedwig', 'Sainte Hedwige', 'Religieuse et mécène monastique connue pour sa charité.', 'Hedwige de Silésie consacre sa vie à la prière, au soin des pauvres et au soutien des monastères, devenant un modèle de piété aristocratique et de générosité au Moyen Âge.', 'v. 1174–1243'),
('saint-margaret-mary-alacoque', 'Sainte Marguerite-Marie Alacoque', 'Religieuse de la Visitation promotrice de la dévotion au Sacré-Cœur.', 'Les expériences mystiques de Marguerite-Marie popularisèrent la dévotion au Sacré‑Cœur, contribuant à un renouveau eucharistique et dévotionnel dans l''Église moderne.', '1647–1690'),
('saint-ignatius-of-antioch', 'Saint Ignace d''Antioche, évêque et martyr', 'Évêque antique et martyr dont les lettres ont structuré l''ecclésiologie primitive.', 'Les lettres d''Ignace insistent sur l''unité épiscopale, la vie sacramentelle et le centre christologique; son martyre est un témoignage fondateur pour l''Église.', 'IIe siècle'),
('saint-luke', 'Saint Luc, évangéliste', 'Évangéliste, médecin et auteur de l''Évangile et des Actes.', 'Luc donna un récit théologique et pastoral du message chrétien et des premiers jours de l''Église, marqué par la miséricorde, la guérison et la mission aux païens.', 'Ier siècle'),
('saint-john-de-brebeuf', 'Saint Jean de Brébeuf', 'Jésuites missionnaires et compagnons martyrisés en Amérique du Nord; mémoire de zèle missionnaire et de sacrifice.', 'Les martyrs du Canada servirent les peuples autochtones et les missions européennes, affrontant persécution et mort pour leur engagement évangélisateur au XVIIe siècle.', ''),
('saint-paul-of-the-cross', 'Saint Paul de la Croix', 'Fondateur des Passionistes et prédicateur de la Passion du Christ.', 'Paul de la Croix fonda la Congrégation de la Passion pour promouvoir la recollection, la prédication et la dévotion centrée sur la Passion du Christ.', '1694–1775'),
('saint-john-paul-ii', 'Saint Jean-Paul II', 'Pape, théologien et pasteur mondial engagé dans la culture et l''évangélisation.', 'Le pontificat de Karol Wojtyła allia réflexion philosophique, pastorale et leadership charismatique, insistant sur la dignité humaine, l''évangélisation et le dialogue avec le monde moderne.', '1920–2005'),
('saint-john-of-capistrano', 'Saint Jean de Capistran', 'Religieux franciscain, prédicateur et chef missionnaire.', 'Jean de Capistran se distingua par sa prédication, ses efforts de réforme et son zèle missionnaire au XVe siècle, jouant un rôle important dans la mobilisation populaire et le renouveau pastoral.', '1386–1456'),
('saint-anthony-mary-claret', 'Saint Antoine-Marie Claret', 'Fondateur des Clarétains, missionnaire et confesseur des pauvres.', 'Antoine-Marie Claret associe soin pastoral, activité missionnaire et publications pour promouvoir la catéchèse, la réforme sociale et la piété au XIXe siècle.', '1807–1870'),
('saint-simon-apostle', 'Saint Simon, apôtre', 'Apôtre du Seigneur, honoré parmi les Douze pour son témoignage apostolique.', 'Simon est vénéré comme l’un des Douze Apôtres du Christ. Même si les données historiques sur son ministère ultérieur sont limitées, la tradition chrétienne l’honore constamment comme témoin fidèle de la Résurrection et acteur de la mission apostolique de l’Église primitive. Dans la mémoire liturgique, il est souvent célébré avec Jude tout en demeurant une personne apostolique distincte.', 'Ier siècle'),
('saint-jude-apostle', 'Saint Jude, apôtre', 'Apôtre du Seigneur, traditionnellement invoqué dans les causes difficiles.', 'Jude, aussi appelé Thaddée dans certaines traditions, est honoré comme l’un des Douze Apôtres. La mémoire ecclésiale le vénère comme annonciateur fidèle de l’Évangile et témoin du Christ à l’âge apostolique. Au fil du temps, il a été largement invoqué par les fidèles dans les situations de grande épreuve, tandis que la liturgie le commémore souvent avec Simon.', 'Ier siècle')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-therese-of-the-child-jesus', 'Sancta Theresia a Iesu Infante, Virgo et Doctor Ecclesiae', 'Monacha Carmelitana et doctor Ecclesiae, nota "via parva".', 'Theresia Liseviensis viam fidei simplicem et caritatis docuit — "viam parvam" — per vitam orationis et sacrificii humilis; eius opus autobiographicum modernam spiritualitatem valde affecit.', '1873–1897'),
-- ('holy-guardian-angels', 'Sancti Angeli Custodes', 'Memoria angelorum singulorum ad guardianam personarum deputatorum.', 'Memoria veneratur fidem Ecclesiae in angelos custodes, qui singulos homines comitentur et protegent; festivitas hortatur ad orationem et devotionem ad eorum auxilium.', ''),
('saint-francis-of-assisi', 'Sanctus Franciscus Assisiensis', 'Fundator Familiae Franciscalis, exemplar paupertatis et curae creaturae.', 'Franciscus paupertatem evangelicam, predicationem et ministerium diligenter amplectitus est; Fratres Minores condidit et renovatio spiritualis per simplicitatem et fraternitatem diffusa est.', '1182–1226'),
('saint-faustina-kowalska', 'Sancta Faustina Kowalska', 'Religiosa Polona et mystica, associata devotioni Misericordiae Divinae.', 'Sister Faustina diarium reliquit cum revelationibus quae message Misericordiae Divinae propagaverunt; eius spiritualitas fiduciam in Dei misericordia et devotionem globalem excitavit.', '1905–1938'),
('saint-bruno', 'Sanctus Bruno', 'Presbyter et fundator Ordinis Cartusiensium, notus ob rigor contemplativum.', 'Bruno Coloniensis vitam chartusianam instituit, solitudinem cum vita communi coniungens; factus est exemplar disciplinae contemplativae in Occidente.', 'c. 1030–1101'),
('saint-denis', 'Sanctus Dionysius Episcopus', 'Episcopus et martyres, coniuncti cum evangelizatione Galliae; patroni Lutetiae traditi.', 'Dionysius venerated est ut episcopus‑martyr cuius cultus in identitate Christiana Lutetiae centralis factus est; socii eius memoriae evangelisationis et testimoni communiter participes sunt.', 'saec. III'),
('saint-john-leonardi', 'Sanctus Ioannes Leonardi', 'Presbyter et reformator, promotus in formatione clericorum et missione.', 'Ioannes Leonardi ad reformam clericorum et renovationem pastoralem laboravit, congregationem condidit ad formationem sacerdotalem et evangelizationem in Italia post‑Tridentina.', '1541–1609'),
('saint-john-henry-newman', 'Sanctus Ioannes Henricus Newman', 'Anglicus conversus, presbyter, theologus et cardinalis; postea Doctor Ecclesiae.', 'Newman conversionem intellectualem et ministerium exercuit, dialogum inter Anglicanismum et Catholicismum afficiens; scriptis de conscientia et progressu doctrinae clarus est.', '1801–1890'),
('saint-john-xxiii', 'Sanctus Ioannes XXIII', 'Pontifex qui Concilium Vaticanum Secundum convocavit et renovationem pastoralis fovit.', 'Ioannes XXIII Ecclesiam in spiritu aperturae et aggiornamento duxit, Concilium convocans quod renovationem liturgicam, pastoralem et oeconomicam promovit.', '1881–1963'),
('saint-callistus-i', 'Sanctus Callistus I', 'Papa saeculi III, memor pastoralium provocationum et martyris.', 'Callistus Ecclesiae Romanae praesuit in tempore perturbato; memoria eius cum quaestionibus reconciliationis et testimonii sub persecutione coniungitur.', 'saec. III'),
('saint-teresa-of-jesus', 'Sancta Teresia a Iesu (Teresa Abulensis), Virgo et Doctor Ecclesiae', 'Reformatrix Carmelitarum, mystica et doctor Ecclesiae.', 'Teresa Abulensis vitam carmelitam renovavit per reformationes contemplativas et scriptura de oratione et mystica quae adhuc sunt fontes spiritualitatis Christianae.', '1515–1582'),
('saint-hedwig', 'Sancta Hedvigis', 'Religiosa et patrona monachorum, nota pro caritate.', 'Hedvigis Silesiensis vitam pecuniosam ad orationem, pauperum curam et subsidium monasteriorum dedicavit, efficens exemplum pietatis et largitatis in Medio Aevo.', 'c. 1174–1243'),
('saint-margaret-mary-alacoque', 'Sancta Margarita Maria Alacoque', 'Monacha Visitationis quae devotionem ad Sacratissimum Cor promovit.', 'Experientiae mysticae Margaritae Mariae devotionem ad Sacratissimum Cor propagaverunt, auxilium ad renovandam devotionem eucharisticam et pietatem in Ecclesia moderna attulerunt.', '1647–1690'),
('saint-ignatius-of-antioch', 'Sanctus Ignatius Antiochenus, Episcopus et Martyr', 'Antiquus episcopus et clarus martyr, cuius epistulae ecclesiologiam primi saeculi formaverunt.', 'Ignatii epistulae unitatem episcopalem, vitam sacramentalem et centralitatem Christi student; martyrio eius testimonium fundamentale Ecclesiae est.', 'saec. II'),
('saint-luke', 'Sanctus Lucas, Evangelista', 'Evangelista, medicus et auctor Evangelii et Actuum.', 'Lucas evangelium et Acta Apostolorum conscripsit, narrationem theologice et pastorale quae misericordiam, sanationem et missionem ad gentes celebrat.', 'saec. I'),
('saint-john-de-brebeuf', 'Sanctus Ioannes de Brébeuf', 'Societatis Iesu missionarii et socii in America Septentrionali martyrizati; memoria zelis missionarii et sacrificii.', 'Martyrs Canadenses populis indigenis et missionibus Europaeis ministrabant, persecutionem et mortem ob missionem in saeculo XVII passi sunt.', ''),
('saint-paul-of-the-cross', 'Sanctus Paulus a Cruce', 'Fundator Passionistarum et praedicator Passionis Christi.', 'Paulus a Cruce congregationem Passionistarum condidit ut recollectionem, praedicationem et devotionem circa Passionem Christi promoveret.', '1694–1775'),
('saint-john-paul-ii', 'Sanctus Ioannes Paulus II', 'Pontifex, theologus et pastor globalis; actor culturae et evangelizationis.', 'Karolus Wojtyła pontificatum combinavit philosophicam reflectionem, pastoralem actionem et charisma, dum dignitatem humanam, evangelizationem et dialogum cum mundo moderno in primis promovebat.', '1920–2005'),
('saint-john-of-capistrano', 'Sanctus Ioannes Capistranus', 'Franciscanus, praeconius et dux missionarius.', 'Ioannes Capistranus praeceptione, reformis et zilio missionario clarus fuit in saeculo XV, mobilizationem popularem et renovationem pastoralem promovendus.', '1386–1456'),
('saint-anthony-mary-claret', 'Sanctus Antonius Maria Claret', 'Fundator Congregationis Claretianae, missionarius et pastor pauperum.', 'Antonius Maria Claret officium pastoralem, missionariam et typographicam coniunxit ad catechesim, reformam socialem et pietatem in saeculo XIX propagandam.', '1807–1870'),
('saint-simon-apostle', 'Sanctus Simon, Apostolus', 'Apostolus Domini, inter Duodecim propter testimonium apostolicum honoratus.', 'Simon colitur ut unus ex Duodecim Apostolis Christi. Etsi notitiae historicae de ministerio posteriori paucae sunt, traditio christiana eum constanter veneratur ut fidelem Resurrectionis testem et participem missionis apostolicae Ecclesiae primae. In memoria liturgica saepe cum Iuda commemoratur, manens tamen persona apostolica distincta.', 'saec. I'),
('saint-jude-apostle', 'Sanctus Iudas, Apostolus', 'Apostolus Domini, in causis difficilibus tradite invocatus.', 'Iudas, qui in quibusdam traditionibus Thaddaeus appellatur, honoratur ut unus ex Duodecim Apostolis. Memoria ecclesialis eum veneratur ut fidelem Evangelii praeconem et Christi testem in aetate apostolica. Decursu temporis a fidelibus late invocatus est in gravibus necessitatibus, cum in liturgia saepe una cum Simone celebretur.', 'saec. I')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- NOVEMBER SAINTS
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-martin-de-porres', 'Saint Martin de Porres',
  1579, 12, 9, FALSE,
  1639, 11, 3, FALSE,
  17,
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA'),
  (SELECT id FROM places WHERE code='LIMA')
),
(
  'saint-charles-borromeo', 'Saint Charles Borromeo',
  1538, 10, 2, FALSE,
  1584, 11, 3, FALSE,
  16,
  (SELECT id FROM places WHERE code='ARONA'),
  (SELECT id FROM places WHERE code='MILAN'),
  (SELECT id FROM places WHERE code='MILAN')
),
(
  'saint-leo-the-great', 'Saint Leo the Great',
  391, NULL, NULL, TRUE,
  461, 11, 10, TRUE,
  5,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-martin-of-tours', 'Saint Martin of Tours',
  316, NULL, NULL, TRUE,
  397, 11, 8, TRUE,
  4,
  (SELECT id FROM places WHERE code='SZOMBATHELY'),
  (SELECT id FROM places WHERE code='CANDES_SAINT_MARTIN'),
  (SELECT id FROM places WHERE code='TOURS')
),
(
  'saint-josaphat', 'Saint Josaphat, Bishop and Martyr',
  1580, NULL, NULL, TRUE,
  1623, 11, 12, TRUE,
  17,
  (SELECT id FROM places WHERE code='VOLODYMYR'),
  (SELECT id FROM places WHERE code='VITEBSK'),
  (SELECT id FROM places WHERE code='SZOMBATHELY')
),
(
  'saint-albert-the-great', 'Saint Albert the Great',
  1200, NULL, NULL, TRUE,
  1280, 11, 15, TRUE,
  13,
  (SELECT id FROM places WHERE code='LAUINGEN'),
  (SELECT id FROM places WHERE code='COLOGNE'),
  (SELECT id FROM places WHERE code='COLOGNE')
),
(
  'saint-margaret-of-scotland', 'Saint Margaret of Scotland',
  1045, NULL, NULL, TRUE,
  1093, 11, 16, TRUE,
  11,
  (SELECT id FROM places WHERE code='MECSEKNADASD'),
  (SELECT id FROM places WHERE code='EDINBURGH_CASTLE'),
  (SELECT id FROM places WHERE code='DUNFERMLINE')
),
(
  'saint-gertrude', 'Saint Gertrude',
  1256, 1, 6, TRUE,
  1301, 11, 17, TRUE,
  14,
  (SELECT id FROM places WHERE code='THURINGIA'),
  (SELECT id FROM places WHERE code='HELFTA'),
  (SELECT id FROM places WHERE code='HELFTA')
),
(
  'saint-elizabeth-of-hungary', 'Saint Elizabeth of Hungary',
  1207, 7, 7, TRUE,
  1231, 11, 17, FALSE,
  13,
  (SELECT id FROM places WHERE code='SAROSPATAK'),
  (SELECT id FROM places WHERE code='MARBURG'),
  (SELECT id FROM places WHERE code='MARBURG')
),
(
  'saint-cecilia', 'Saint Cecilia, Virgin and Martyr',
  NULL, NULL, NULL, TRUE,
  230, NULL, NULL, TRUE,
  3,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-clement-i', 'Saint Clement I, Pope and Martyr',
  NULL, NULL, NULL, TRUE,
  98, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='CHERSON'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-columban', 'Saint Columban, Abbot',
  543, NULL, NULL, TRUE,
  615, 11, 23, TRUE,
  7,
  (SELECT id FROM places WHERE code='MYSHALL'),
  (SELECT id FROM places WHERE code='BOBBIO'),
  (SELECT id FROM places WHERE code='LUXEUIL')
),
(
  'saint-andrew-dung-lac', 'Saints Andrew Dung-Lac, Priest', --and Companions, Martyrs
  1795, NULL, NULL, TRUE,
  1839, 12, 21, TRUE,
  19,
  (SELECT id FROM places WHERE code='BAC_NINH'),
  (SELECT id FROM places WHERE code='HANOI'),
  (SELECT id FROM places WHERE code='HANOI')
),
(
  'saint-catherine-of-alexandria', 'Saint Catherine of Alexandria',
  287, NULL, NULL, TRUE,
  305, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA'),
  (SELECT id FROM places WHERE code='ALEXANDRIA')
),
(
  'saint-andrew-apostle', 'Saint Andrew, Apostle',
  NULL, NULL, NULL, TRUE,
  60, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='PATRAS'),
  (SELECT id FROM places WHERE code='CAPERNAUM')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-martin-de-porres', 'Saint Martin de Porres', 'Peruvian Dominican lay brother known for charity to the poor and the sick.', 'Martin de Porres combined deep humility and practical charity in service to the poorest in Lima; noted for his care of the sick, reconciliation and devotion, he remains a model of interracial and social solidarity.', '1579–1639'),
('saint-charles-borromeo', 'Saint Charles Borromeo', 'Archbishop of Milan and leading figure of post‑Tridentine reform.', 'Charles Borromeo implemented reforms of the Council of Trent in Milan, fostering clergy formation, catechesis and charitable institutions; his pastoral zeal and administrative reforms influenced Catholic renewal in the late 16th century.', '1538–1584'),
('saint-leo-the-great', 'Saint Leo the Great', 'Pope, Doctor of the Church and defender of doctrinal orthodoxy in a turbulent age.', 'Leo I strengthened the pastoral authority of the Roman See, confronted theological and political challenges of his era and is remembered for his sermons and letters that shaped Western ecclesial order and Christological reflection.', 'c. 400–461'),
('saint-martin-of-tours', 'Saint Martin of Tours', 'Bishop and monastic founder remembered for charity and evangelical simplicity.', 'Martin, a former soldier turned monk and bishop, is famed for his act of charity toward a beggar and for founding monastic communities that shaped Western monasticism; his witness influenced medieval pastoral care and piety.', 'c. 316–397'),
('saint-josaphat', 'Saint Josaphat, Bishop and Martyr', 'Monk and bishop who sought Eastern‑Latin reconciliation and died for the faith.', 'Josaphat Kuntsevych worked for unity and reform among Eastern Christians in the Polish‑Lithuanian Commonwealth and suffered martyrdom amid religious conflict; his life is remembered for ecclesial reconciliation and pastoral courage.', '1580–1623'),
('saint-albert-the-great', 'Saint Albert the Great', 'Scholar, bishop and Doctor of the Church noted for learning and engagement with natural philosophy.', 'Albertus Magnus bridged Christian theology with extensive study of the natural world and Aristotelian thought, training figures such as Thomas Aquinas and contributing to medieval intellectual life as a model of learned pastoral service.', 'c. 1200–1280'),
('saint-margaret-of-scotland', 'Saint Margaret of Scotland', 'Queen and reformer noted for piety, charity and support for the Church.', 'Margaret used her position to promote ecclesial reform, care for the poor and monastic foundations; her Christian witness shaped the religious life of the Scottish court and broader society.', 'c. 1045–1093'),
('saint-gertrude', 'Saint Gertrude', 'Religious venerated for devotion and spiritual care (various saints named Gertrude).', 'Various women named Gertrude are honored in Christian tradition; they are remembered generally for lives of prayer, hospitality and care for the needy, with particular local cults and spiritual writings in some cases.', ''),
('saint-elizabeth-of-hungary', 'Saint Elizabeth of Hungary', 'Princess known for exemplary charity and care for the poor.', 'Elizabeth used her royal resources to found hospitals and serve the poor, living a life of penance and charity that inspired medieval models of Christian service and sanctity.', '1207–1231'),
('saint-cecilia', 'Saint Cecilia, Virgin and Martyr', 'Patroness of musicians, venerated for faith and martyrdom.', 'Cecilia is celebrated as a virgin‑martyr whose cult inspired musical and liturgical devotion; traditions associate her with the protection of sacred song and steadfast witness in persecution.', ''),
('saint-clement-i', 'Saint Clement I, Pope and Martyr', 'Early pope remembered for pastoral leadership in the apostolic age.', 'Clement of Rome is linked to early efforts to preserve apostolic order and charity in the Church; his letter to the Corinthians and his martyrdom mark him as a formative figure in Roman ecclesial memory.', '1st century'),
('saint-columban', 'Saint Columban, Abbot', 'Missionary‑founder whose monastic foundations influenced Europe.', 'Columban (Columbanus) led Irish missionary activity on the Continent, founding monasteries that became centers of learning and reform and shaping early medieval monasticism through discipline and evangelization.', 'd. 615'),
('saint-andrew-dung-lac', 'Saint Andrew Dũng‑Lạc', 'Vietnamese martyrs who witnessed to the faith under persecution.', 'Andrew Dũng‑Lạc and many companions suffered martyrdom in Vietnam across different eras; their witness strengthened local Christian communities and remains a formative testimony of Asian Catholic witness.', ''),
('saint-catherine-of-alexandria', 'Saint Catherine of Alexandria', 'Virgin and martyr traditionally venerated for learning and courage.', 'Catherine is celebrated as a learned maiden who defended the faith before pagan magistrates and bore martyrdom; her cult inspired monastic and intellectual devotion in the medieval Church.', ''),
('saint-andrew-apostle', 'Saint Andrew, Apostle', 'Apostle, missionary and brother of Saint Peter; early witness to the Gospel.', 'Andrew is venerated as one of the Twelve who preached to various regions and whose memory became important in apostolic tradition, marked by missionary zeal and martyrdom in several local traditions.', '1st century')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-martin-de-porres', 'Saint Martin de Porres', 'Frère dominicain péruvien connu pour sa charité envers les pauvres et les malades.', 'Martin de Porres allia une grande humilité à une charité active au service des plus démunis à Lima; reconnu pour son soin des malades, sa réconciliation et sa dévotion, il demeure un modèle de solidarité sociale et interculturelle.', '1579–1639'),
('saint-charles-borromeo', 'Saint Charles Borromée', 'Archevêque de Milan et acteur majeur de la réforme post‑tridentine.', 'Charles Borromée mit en œuvre les réformes du Concile de Trente à Milan, développant la formation du clergé, la catéchèse et les œuvres de charité; son zèle pastoral a marqué le renouveau catholique de la fin du XVIe siècle.', '1538–1584'),
('saint-leo-the-great', 'Saint Léon le Grand', 'Pape et docteur de l''Église, défenseur de l''orthodoxie doctrinale en temps troublé.', 'Léon I renforça l''autorité pastorale de l''Siège romain, affronta difficultés théologiques et politiques de son époque et demeure connu pour ses sermons et lettres qui influencèrent l''ordre ecclésial occidental et la christologie.', 'v. 400–461'),
('saint-martin-of-tours', 'Saint Martin de Tours', 'Évêque et fondateur monastique, célèbre pour sa charité et sa simplicité évangélique.', 'Martin, ancien soldat devenu moine puis évêque, est célèbre pour le geste de partage du manteau avec un mendiant et pour la fondation de communautés monastiques; son témoignage a nourri la piété et la pastorale médiévales.', 'v. 316–397'),
('saint-josaphat', 'Saint Josaphat, évêque et martyr', 'Moine et évêque engagé pour la réconciliation entre traditions orientales et latines, mort en martyr.', 'Josaphat Kuntsevych chercha l''unité et la réforme parmi les chrétiens orientaux dans la république polono‑lituanienne et fut assassiné dans un contexte de tensions religieuses; sa vie rappelle l''appel à la paix et à la fidélité ecclésiale.', '1580–1623'),
('saint-albert-the-great', 'Saint Albert le Grand', 'Érudit, évêque et docteur de l''Église, connu pour sa culture scientifique.', 'Albert le Grand rapprocha la théologie chrétienne des études sur la nature et la pensée aristotélienne, formant des disciples comme Thomas d''Aquin et jouant un rôle central dans la vie intellectuelle médiévale.', 'v. 1200–1280'),
('saint-margaret-of-scotland', 'Sainte Marguerite d''Écosse', 'Reine et réformatrice connue pour sa piété et sa charité.', 'Marguerite mit sa position au service de la réforme ecclésiale, de l''aide aux pauvres et du soutien aux fondations monastiques; son témoignage a façonné la vie religieuse de la cour écossaise.', 'v. 1045–1093'),
('saint-gertrude', 'Sainte Gertrude', 'Religieuse vénérée pour sa dévotion et ses soins spirituels (plusieurs saintes nommées Gertrude).', 'Différentes saintes nommées Gertrude sont honorées dans la tradition chrétienne; elles sont généralement commémorées pour leur vie de prière, leur hospitalité et leur attention aux nécessiteux, avec des cultes locaux spécifiques.', ''),
('saint-elizabeth-of-hungary', 'Sainte Élisabeth de Hongrie', 'Princesse célèbre pour sa charité exemplaire envers les pauvres.', 'Élisabeth utilisa ses ressources pour fonder des hôpitaux et servir les pauvres, menant une vie de pénitence et de charité qui inspira des modèles médiévaux de sainteté et de service chrétien.', '1207–1231'),
('saint-cecilia', 'Sainte Cécile, vierge et martyre', 'Patronne des musiciens, vénérée pour sa foi et son martyre.', 'Cécile est célébrée comme une vierge‑martyre dont le culte inspira la dévotion musicale et liturgique; les traditions la relient à la protection du chant sacré et au témoignage inébranlable dans la persécution.', ''),
('saint-clement-i', 'Saint Clément I', 'Pape ancien, rappelé pour son ministère pastoral à l''âge apostolique.', 'Clément de Rome est associé aux premiers efforts pour préserver l''ordre apostolique et la charité dans l''Église; sa lettre aux Corinthiens et son martyre le désignent comme une figure formative de la mémoire romaine.', 'Ier siècle'),
('saint-columban', 'Saint Colomban', 'Fondateur missionnaire dont les monastères marquèrent l''Europe.', 'Colomban mena la mission irlandaise sur le Continent, fondant monastères devenus centres d''étude et de réforme; sa discipline et son zèle évangélisateur influencèrent le monachisme médiéval.', 'm. 615'),
('saint-andrew-dung-lac', 'Saint André Dũng‑Lạc', 'Martyrs vietnamiens témoignants de la foi sous la persécution.', 'André Dũng‑Lạc et de nombreux compagnons subirent le martyre au Vietnam à différentes époques; leur mémoire fortifia les communautés chrétiennes locales et demeure un témoignage marquant de la foi asiatique.', ''),
('saint-catherine-of-alexandria', 'Sainte Catherine d''Alexandrie', 'Vierge et martyre traditionnellement honorée pour son savoir et son courage.', 'Catherine est fêtée comme une jeune érudite ayant défendu la foi devant les magistrats païens et ayant subi le martyre; son culte a inspiré la dévotion monastique et intellectuelle au Moyen Âge.', ''),
('saint-andrew-apostle', 'Saint André, apôtre', 'Apôtre, missionnaire et frère de saint Pierre; témoin précoce de l''Évangile.', 'André est vénéré comme l''un des Douze qui prêcha dans diverses régions; sa mémoire s''est imposée dans la tradition apostolique, marquée par le zèle missionnaire et le martyre.', 'Ier siècle')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-martin-de-porres', 'Sanctus Martinus de Porres', 'Frater Dominicus Peruvianus notus pro caritate erga pauperes et aegros.', 'Martinus de Porres humilitate et caritate erga pauperes Limiensis claruit; curis infirmorum et reconciliationi dedutus, exemplum socialis et interracialis solidarietatis praebet.', '1579–1639'),
('saint-charles-borromeo', 'Sanctus Carolus Borromaeus', 'Archiepiscopus Mediolani et reformator post‑Tridentinus.', 'Carolus Borromaeus reformis Concilii Tridentini in Mediolano operam dedit, formationem clericorum, catechesin et instituta caritatis promovens; pastoralis eius zelus renovationem Catholicam saeculi XVI impulit.', '1538–1584'),
('saint-leo-the-great', 'Sanctus Leo Magnus', 'Papa et Doctor Ecclesiae, defensor orthodoxiae in tempore turbido.', 'Leo I auctoritatem pastoralem Sedis Romanae firmavit, difficultates theologicæ et politicas suscepit et sermones ac epistulas reliquit quae ordinem ecclesiasticum occidentalem et christologiam moderatam formaverunt.', 'c. 400–461'),
('saint-martin-of-tours', 'Sanctus Martinus Turonensis', 'Episcopus et fundator monachicus, memor caritatis et simplicitatis evangelicae.', 'Martinus, miles factus monachus et postea episcopus, pro veste socia cum mendico notus est et monasteria condidit quae monachismum occidentalem signaverunt; eius testimonium in pietate medievali valde resonat.', 'c. 316–397'),
('saint-josaphat', 'Sanctus Iosaphat, Episcopus et Martyr', 'Monachus et episcopus unitatem ecclesiasticam instituebans, ob fidem martyrizatus.', 'Iosaphat Kuntsevych unitatem et reformationem inter traditiones orientales et latinas quaesivit et in conflictu religioso martyrio coronatus est; vita eius unitatem ecclesiae et pastoralem constantiam commemorat.', '1580–1623'),
('saint-albert-the-great', 'Sanctus Albertus Magnus', 'Doctor Ecclesiae, episcopus et eruditus naturae philosophiæ.', 'Albertus Magnus theologiae et naturalium studia coniunxit, Aristotelicam traditionem integrans et discipulos ut Thomam Aquinatem formans; exemplo eruditionis pastoralis medii aevi permansit.', 'c. 1200–1280'),
('saint-margaret-of-scotland', 'Sancta Margarita Scotiae', 'Regina et reformatrix nota pro pietate et caritate.', 'Margarita officio suo ut regina ad reformam ecclesiasticam, pauperum curam et subsidium monachiorum se dedicavit; eius testimonium vitam religiosam curiae Scoticae formavit.', 'c. 1045–1093'),
('saint-gertrude', 'Sancta Gertrudis', 'Religiosa veneranda pro devotionibus et curis spiritualibus (plures sanctae Gertrudis).', 'Plurimae Gertrudises in traditione Christiana venerantur; plerumque memorantur propter vitam orationis, hospitalitatem et curam pauperum, cum cultibus localibus.', ''),
('saint-elizabeth-of-hungary', 'Sancta Elisabeth Hungariae', 'Principissa nota ob caritatem erga pauperes.', 'Elisabeth opes regias ad hospitia fundanda et pauperibus serviendum impendit, vitam poenitentiae et caritatis agente, quae exempla medievalia sanctitatis produxit.', '1207–1231'),
('saint-cecilia', 'Sancta Caecilia, Virgo et Martyr', 'Patrona musicorum, venerata pro fide et martyrio.', 'Caecilia ut virgo‑martyr celebratur et cultus eius devotionem musicam et liturgicam excitavit; traditiones eam cum tutela cantus sacri et firma constantia in persecutione coniungunt.', ''),
('saint-clement-i', 'Sanctus Clemens I', 'Papa antiquus memor pastoralis in aetate apostolica.', 'Clemens Romae ordinis apostolici et caritatis servitium fovere coniunctus est; epistula eius ad Corinthios et martyrium eum in memoria Romana collocat.', 'saec. I'),
('saint-columban', 'Sanctus Columbanus', 'Abbas et fundator missionum, cuius monasteria Europam signaverunt.', 'Columbanus missionem Hibernicam in continentem duxit, monasteria condidit quae centros studii et reformationis effecerunt et monachismum medievalem formaverunt.', 'ob. 615'),
('saint-andrew-dung-lac', 'Sanctus Andreas Dung‑Lac', 'Martyrs Vietnamenses qui fidem sub persecutione professi sunt.', 'Andreas Dung‑Lac et multi socii martyrio affecti sunt in Vietnamia; eorum memoria communitates christianas localiter firmavit et testimonium fidei Asiaticum repraesentationem habet.', ''),
('saint-catherine-of-alexandria', 'Sancta Catharina Alexandrina', 'Virgo et martyr, tradita pro eruditione et fortitudine.', 'Catharina ut puella erudita memorialiter celebratur quae fidem coram magistratibus paganorum defendit et martyrio coronata est; cultus eius devotionem monasticam et intellectualem in Medio Aevo excitavit.', ''),
('saint-andrew-apostle', 'Sanctus Andreas, Apostolus', 'Apostolus et missionarius, frater Sancti Petri; primus testis Evangelii.', 'Andreas una ex Duodecim venerated est qui in varias regiones praedicationem retulit; memoria eius in traditione apostolica, zelo missionario et martyrio consistit.', 'saec. I')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

-- ==============
-- DECEMBER SAINTS (sans dédicaces ni vocables marials)
-- ==============

INSERT INTO saints (
  slug, default_name,
  birth_year, birth_month, birth_day, birth_is_approximate,
  death_year, death_month, death_day, death_is_approximate,
  century,
  place_of_birth_id, place_of_death_id, place_of_activity_id
) VALUES
(
  'saint-francis-xavier', 'Saint Francis Xavier',
  1506, 4, 7, FALSE,
  1552, 12, 3, FALSE,
  16,
  (SELECT id FROM places WHERE code='XAVIER'),
  (SELECT id FROM places WHERE code='SHANGCHUAN_ISLAND'),
  (SELECT id FROM places WHERE code='GOA')
),
(
  'saint-john-damascene', 'Saint John Damascene',
  675, NULL, NULL, TRUE,
  749, 12, 4, TRUE,
  8,
  (SELECT id FROM places WHERE code='DAMASCUS'),
  (SELECT id FROM places WHERE code='MAR_SABA'),
  (SELECT id FROM places WHERE code='MAR_SABA')
),
(
  'saint-nicholas', 'Saint Nicholas, Bishop',
  270, 3, 15, TRUE,
  343, 12, 6, TRUE,
  4,
  (SELECT id FROM places WHERE code='PATARA'),
  (SELECT id FROM places WHERE code='MYRA'),
  (SELECT id FROM places WHERE code='MYRA')
),
(
  'saint-ambrose', 'Saint Ambrose',
  339, NULL, NULL, TRUE,
  397, 4, 4, FALSE,
  4,
  (SELECT id FROM places WHERE code='AUGUSTA_TREVERORUM'),
  (SELECT id FROM places WHERE code='MILAN'),
  (SELECT id FROM places WHERE code='MILAN')
),
(
  'saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin',
  1474, NULL, NULL, TRUE,
  1548, 5, 30, FALSE,
  16,
  (SELECT id FROM places WHERE code='CUAUHTITLAN'),
  (SELECT id FROM places WHERE code='MEXICO_CITY'),
  (SELECT id FROM places WHERE code='GUADALUPE_MX')

),
(
  'saint-damasus-i', 'Saint Damasus I, Pope',
  305, NULL, NULL, TRUE,
  384, 12, 11, TRUE,
  4,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
),
(
  'saint-lucy', 'Saint Lucy, Virgin and Martyr',
  283, NULL, NULL, TRUE,
  304, NULL, NULL, TRUE,
  4,
  (SELECT id FROM places WHERE code='SIRACUSA'),
  (SELECT id FROM places WHERE code='SIRACUSA'),
  (SELECT id FROM places WHERE code='SIRACUSA')
),
(
  'saint-john-of-the-cross', 'Saint John of the Cross',
  1542, 6, 24, FALSE,
  1591, 12, 14, FALSE,
  16,
  (SELECT id FROM places WHERE code='FONTIVEROS'),
  (SELECT id FROM places WHERE code='UBEDA'),
  (SELECT id FROM places WHERE code='AVILA')
),
(
  'saint-peter-canisius', 'Saint Peter Canisius',
  1521, 5, 8, FALSE,
  1597, 12, 21, FALSE,
  16,
  (SELECT id FROM places WHERE code='NIJMEGEN'),
  (SELECT id FROM places WHERE code='FREIBURG_IM_BREISGAU'),
  (SELECT id FROM places WHERE code='VIENNA')
),
(
  'saint-john-of-kanty', 'Saint John of Kanty',
  1390, 6, 23, TRUE,
  1473, 12, 24, FALSE,
  15,
  (SELECT id FROM places WHERE code='KETY'),
  (SELECT id FROM places WHERE code='KRAKOW'),
  (SELECT id FROM places WHERE code='KRAKOW')
),
(
  'saint-stephen-martyr', 'Saint Stephen, the First Martyr',
  5, NULL, NULL, TRUE,
  34, NULL, NULL, TRUE,
  1,
  NULL,
  (SELECT id FROM places WHERE code='JERUSALEM'),
  (SELECT id FROM places WHERE code='JERUSALEM')
),
(
  'saint-john', 'Saint John, Apostle and Evangelist',
  6, NULL, NULL, TRUE,
  100, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHSAIDA'),
  (SELECT id FROM places WHERE code='EPHESUS'),
  (SELECT id FROM places WHERE code='EPHESUS')
),
(
  'holy-innocents', 'The Holy Innocents, Martyrs',
  NULL, NULL, NULL, TRUE,
  NULL, NULL, NULL, TRUE,
  1,
  (SELECT id FROM places WHERE code='BETHLEHEM'),
  (SELECT id FROM places WHERE code='BETHLEHEM'),
  (SELECT id FROM places WHERE code='BETHLEHEM')
),
(
  'saint-thomas-becket', 'Saint Thomas Becket',
  1118, 12, 21, TRUE,
  1170, 12, 29, FALSE,
  12,
  (SELECT id FROM places WHERE code='LONDON'),
  (SELECT id FROM places WHERE code='CANTERBURY'),
  (SELECT id FROM places WHERE code='CANTERBURY')
),
(
  'saint-sylvester-i', 'Saint Sylvester I',
  NULL, NULL, NULL, TRUE,
  335, 12, 31, TRUE,
  4,
  NULL,
  (SELECT id FROM places WHERE code='ROME'),
  (SELECT id FROM places WHERE code='ROME')
)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'en', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-xavier', 'Saint Francis Xavier', 'Jesuit missionary and pioneer of evangelization in Asia.', 'Francis Xavier, one of the first companions of Ignatius of Loyola, carried the Gospel to India, Southeast Asia and Japan; his missionary zeal, pastoral creativity and endurance under hardship made him a model for global mission in the early modern Church.', '1506–1552'),
('saint-john-damascene', 'Saint John Damascene', 'Priest and Doctor of the Church, defender of sacred images.', 'John Damascene is remembered for theological synthesis and his defense of holy images during iconoclastic controversies; his writings on Christology, liturgy and Marian doctrine deeply shaped Eastern and Western Christian thought.', 'c. 675–749'),
('saint-nicholas', 'Saint Nicholas, Bishop', 'Bishop revered for pastoral charity and protection of the vulnerable.', 'Nicholas of Myra became one of the most beloved saints of Christian tradition, associated with care for the poor, defense of the innocent and generous almsgiving; his cult spread widely in both East and West.', 'c. 270–343'),
('saint-ambrose', 'Saint Ambrose', 'Bishop of Milan and Doctor of the Church, influential pastor and theologian.', 'Ambrose guided the Church of Milan through political and theological tensions, promoted liturgical life and biblical preaching, and influenced major figures such as Augustine; his legacy remains foundational for Latin ecclesial tradition.', 'c. 340–397'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin', 'Lay indigenous witness associated with the Guadalupan tradition.', 'Juan Diego is honored as a humble layman whose testimony is linked to the apparitions of Our Lady of Guadalupe in 1531; his life became a sign of inculturated faith and evangelization in the Americas.', 'c. 1474–1548'),
('saint-damasus-i', 'Saint Damasus I, Pope', 'Pope who promoted Roman liturgy and the cult of martyrs.', 'Damasus strengthened the memory of the Roman martyrs, encouraged biblical scholarship and supported Jerome''s scriptural work; his pontificate helped consolidate Roman ecclesial identity in late antiquity.', 'c. 305–384'),
('saint-lucy', 'Saint Lucy, Virgin and Martyr', 'Virgin martyr venerated for steadfast faith and purity.', 'Lucy of Syracuse became a widely honored martyr in Christian devotion, remembered for courageous witness under persecution and associated in tradition with spiritual and bodily light.', 'd. 304'),
('saint-john-of-the-cross', 'Saint John of the Cross', 'Carmelite reformer, mystic and Doctor of the Church.', 'John of the Cross collaborated with Teresa of Ávila in Carmelite reform and authored major mystical works on purification, union with God and contemplative prayer, shaping Christian spirituality for centuries.', '1542–1591'),
('saint-peter-canisius', 'Saint Peter Canisius', 'Jesuit priest and Doctor of the Church, leading catechist of the Counter‑Reformation.', 'Peter Canisius worked across German-speaking lands to renew Catholic life through preaching, education and influential catechisms; his pastoral clarity and intellectual rigor strengthened the Church in confessional conflict.', '1521–1597'),
('saint-john-of-kanty', 'Saint John of Kanty', 'Priest and professor known for learning, humility and charity.', 'John Cantius taught theology at Kraków and became renowned for his personal austerity, care for students and poor, and fidelity to pastoral and academic vocation.', 'c. 1390–1473'),
('saint-stephen-martyr', 'Saint Stephen, the First Martyr', 'Protomartyr of the Church and witness to Christ in the apostolic age.', 'Stephen, one of the first deacons, proclaimed Christ with courage and became the first to shed his blood for the Gospel; his martyrdom in Acts remains a foundational witness to forgiveness and fidelity.', '1st century'),
('saint-john', 'Saint John, Apostle and Evangelist', 'Apostle and evangelist, theologian of divine love and incarnation.', 'John, traditionally identified as the beloved disciple, is associated with the Fourth Gospel, Johannine letters and Revelation; his witness shaped Christological reflection and contemplative theology in the Church.', '1st century'),
('holy-innocents', 'The Holy Innocents, Martyrs', 'Children of Bethlehem commemorated as martyrs in the infancy narrative.', 'The Holy Innocents are remembered as children killed in Herod''s persecution after Christ''s birth; their commemoration expresses the Church''s memory of innocent suffering and witness linked to the coming of the Messiah.', ''),
('saint-thomas-becket', 'Saint Thomas Becket', 'Archbishop of Canterbury and martyr for ecclesial freedom.', 'Thomas Becket defended the rights and autonomy of the Church in conflict with royal authority; his martyrdom in Canterbury became a symbol of conscience, episcopal responsibility and fidelity to ecclesial justice.', 'c. 1118–1170'),
('saint-sylvester-i', 'Saint Sylvester I', 'Pope of the Constantinian era associated with early public peace of the Church.', 'Sylvester governed the Church during a period of transition after imperial toleration, remembered in tradition for the consolidation of ecclesial life and worship in fourth-century Rome.', 'd. 335')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'fr', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-xavier', 'Saint François Xavier', 'Missionnaire jésuite et pionnier de l''évangélisation en Asie.', 'François Xavier, l''un des premiers compagnons d''Ignace de Loyola, porta l''Évangile en Inde, en Asie du Sud-Est et au Japon; son zèle missionnaire, sa créativité pastorale et son endurance dans l''épreuve en firent une figure majeure de la mission catholique moderne.', '1506–1552'),
('saint-john-damascene', 'Saint Jean Damascène', 'Prêtre et docteur de l''Église, défenseur des saintes images.', 'Jean Damascène est reconnu pour sa synthèse théologique et sa défense des icônes pendant les controverses iconoclastes; ses écrits sur la christologie, la liturgie et la doctrine mariale ont marqué durablement l''Orient et l''Occident chrétiens.', 'v. 675–749'),
('saint-nicholas', 'Saint Nicolas, évêque', 'Évêque vénéré pour sa charité pastorale et sa protection des plus vulnérables.', 'Nicolas de Myre est l''un des saints les plus populaires de la tradition chrétienne, associé au soin des pauvres, à la défense des innocents et à la générosité; son culte s''est largement diffusé en Orient comme en Occident.', 'v. 270–343'),
('saint-ambrose', 'Saint Ambroise', 'Évêque de Milan et docteur de l''Église, pasteur et théologien influent.', 'Ambroise guida l''Église de Milan dans un contexte de tensions politiques et doctrinales, développa la vie liturgique et la prédication biblique, et influença des figures majeures comme Augustin; son héritage est fondamental pour la tradition latine.', 'v. 340–397'),
('saint-juan-diego-cuauhtlatoatzin', 'Saint Juan Diego Cuauhtlatoatzin', 'Laïc autochtone lié à la tradition guadalupéenne.', 'Juan Diego est honoré comme un humble laïc dont le témoignage est lié aux apparitions de Notre-Dame de Guadalupe en 1531; sa figure est devenue un signe d''inculturation de la foi et d''évangélisation sur le continent américain.', 'v. 1474–1548'),
('saint-damasus-i', 'Saint Damase I', 'Pape ayant promu la liturgie romaine et la mémoire des martyrs.', 'Damase renforça le culte des martyrs romains, encouragea les études bibliques et soutint le travail scripturaire de Jérôme; son pontificat contribua à consolider l''identité ecclésiale romaine à la fin de l''Antiquité.', 'v. 305–384'),
('saint-lucy', 'Sainte Lucie, vierge et martyre', 'Vierge martyre vénérée pour sa fidélité et sa pureté.', 'Lucie de Syracuse est largement honorée dans la dévotion chrétienne pour son courage dans la persécution; la tradition associe son témoignage à la lumière spirituelle et à l''espérance chrétienne.', 'm. 304'),
('saint-john-of-the-cross', 'Saint Jean de la Croix', 'Réformateur carmélite, mystique et docteur de l''Église.', 'Jean de la Croix collabora avec Thérèse d''Avila à la réforme du Carmel et composa des œuvres majeures de mystique sur la purification, l''union à Dieu et la prière contemplative, influençant profondément la spiritualité chrétienne.', '1542–1591'),
('saint-peter-canisius', 'Saint Pierre Canisius', 'Prêtre jésuite et docteur de l''Église, grand catéchiste de la Contre-Réforme.', 'Pierre Canisius œuvra dans les régions germaniques pour le renouveau catholique par la prédication, l''éducation et ses catéchismes influents; sa clarté pastorale et sa rigueur intellectuelle renforcèrent l''Église en temps de conflits confessionnels.', '1521–1597'),
('saint-john-of-kanty', 'Saint Jean de Kenty', 'Prêtre et professeur connu pour son savoir, son humilité et sa charité.', 'Jean de Kenty enseigna la théologie à Cracovie et se distingua par son austérité, son attention aux étudiants et aux pauvres, et sa fidélité à sa vocation académique et pastorale.', 'v. 1390–1473'),
('saint-stephen-martyr', 'Saint Étienne, premier martyr', 'Protomartyr de l''Église et témoin du Christ à l''âge apostolique.', 'Étienne, l''un des premiers diacres, annonça le Christ avec courage et fut le premier à verser son sang pour l''Évangile; son martyre, rapporté dans les Actes, demeure un témoignage fondateur de fidélité et de pardon.', 'Ier siècle'),
('saint-john', 'Saint Jean, apôtre et évangéliste', 'Apôtre et évangéliste, théologien de l''amour divin et de l''Incarnation.', 'Jean, traditionnellement identifié comme le disciple bien-aimé, est associé au quatrième évangile, aux lettres johanniques et à l''Apocalypse; son témoignage a marqué la christologie et la théologie contemplative.', 'Ier siècle'),
('holy-innocents', 'Les Saints Innocents, martyrs', 'Enfants de Bethléem commémorés comme martyrs dans le récit de l''enfance du Christ.', 'Les Saints Innocents rappellent les enfants mis à mort sous Hérode après la naissance de Jésus; leur mémoire exprime la souffrance innocente et le témoignage lié à la venue du Messie.', ''),
('saint-thomas-becket', 'Saint Thomas Becket', 'Archevêque de Cantorbéry et martyr pour la liberté de l''Église.', 'Thomas Becket défendit les droits et l''autonomie de l''Église face au pouvoir royal; son martyre à Cantorbéry devint un symbole de conscience, de responsabilité épiscopale et de fidélité ecclésiale.', 'v. 1118–1170'),
('saint-sylvester-i', 'Saint Sylvestre I', 'Pape de l''époque constantinienne associé à la paix publique de l''Église.', 'Sylvestre gouverna l''Église durant la période de transition après la tolérance impériale, et demeure lié à la consolidation de la vie ecclésiale et liturgique dans la Rome du IVe siècle.', 'm. 335')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

INSERT INTO saint_translations (saint_id, locale_code, name, short_description, full_biography, life_label)
SELECT s.id, 'la', x.name, x.short_description, x.full_biography, x.life_label
FROM saints s
JOIN (VALUES
('saint-francis-xavier', 'Sanctus Franciscus Xaverius', 'Missionarius Societatis Iesu et praeco Evangelii in Asia.', 'Franciscus Xaverius, inter primos socios Ignatii de Loyola, Evangelium in Indiam, Asiam Australem et Iaponiam attulit; zelo missionario, prudentia pastorali et patientia in laboribus claruit.', '1506–1552'),
('saint-john-damascene', 'Sanctus Ioannes Damascenus', 'Presbyter et Doctor Ecclesiae, defensor imaginum sacrarum.', 'Ioannes Damascenus pro synthesi theologica et defensione imaginum in controversiis iconoclasticis memoratur; eius opera de christologia, liturgia et doctrina mariana magnam vim in Oriente et Occidente habuerunt.', 'c. 675–749'),
('saint-nicholas', 'Sanctus Nicolaus, Episcopus', 'Episcopus ob caritatem pastoralem et tutelam infirmorum celebratus.', 'Nicolaus Myrensis unus ex dilectissimis sanctis traditionis christianae factus est, cum cura pauperum, tutela innocentium et largitate eleemosynarum coniunctus; cultus eius late per Orientem et Occidentem diffusus est.', 'c. 270–343'),
('saint-ambrose', 'Sanctus Ambrosius', 'Episcopus Mediolanensis et Doctor Ecclesiae, pastor et theologus insignis.', 'Ambrosius Ecclesiam Mediolanensem inter difficultates politicas et doctrinales rexit, vitam liturgicam et praedicationem biblicam promovit atque Augustinum aliosque valde movit; hereditas eius fundamentalis mansit in traditione Latina.', 'c. 340–397'),
('saint-juan-diego-cuauhtlatoatzin', 'Sanctus Ioannes Didacus Cuauhtlatoatzin', 'Laicus indigena testis traditionis Guadalupensis.', 'Ioannes Didacus ut humilis laicus honoratur, cuius testimonium cum apparitionibus Guadalupensibus anno 1531 connectitur; vita eius signum fidei inculturatae et evangelizationis in America facta est.', 'c. 1474–1548'),
('saint-damasus-i', 'Sanctus Damasus I', 'Papa qui liturgiam Romanam et cultum martyrum promovit.', 'Damasus memoriam martyrum Romanorum roboravit, studia biblica fovit et operi Hieronymi favit; pontificatus eius identitatem ecclesialem Romanam in antiquitatis fine consolidavit.', 'c. 305–384'),
('saint-lucy', 'Sancta Lucia, Virgo et Martyr', 'Virgo martyr ob fidei constantiam et puritatem venerata.', 'Lucia Syracusana late colitur ut martyr fortis sub persecutione; traditio eius testimonium cum lumine spirituali et spe christiana coniungit.', 'ob. 304'),
('saint-john-of-the-cross', 'Sanctus Ioannes a Cruce', 'Reformator Carmelitarum, mysticus et Doctor Ecclesiae.', 'Ioannes a Cruce cum Theresia Abulensi in reformatione Carmelitana cooperatus est et opera mystica praecipua de purgatione, unione cum Deo et oratione contemplativa composuit.', '1542–1591'),
('saint-peter-canisius', 'Sanctus Petrus Canisius', 'Presbyter Societatis Iesu et Doctor Ecclesiae, magnus catechista Contrareformationis.', 'Petrus Canisius in regionibus Germanicis ad renovationem catholicam per praedicationem, institutionem et catechismos contulit; claritas pastoralis et rigor intellectualis eius Ecclesiam in contentionibus confessionum firmaverunt.', '1521–1597'),
('saint-john-of-kanty', 'Sanctus Ioannes de Cantiis', 'Presbyter et professor, notus doctrina, humilitate et caritate.', 'Ioannes de Cantiis Cracoviae theologiam docuit et austeritate vitae, cura discipulorum pauperumque atque fidelitate vocationis academicae pastoralisque eminuit.', 'c. 1390–1473'),
('saint-stephen-martyr', 'Sanctus Stephanus, Protomartyr', 'Protomartyr Ecclesiae et testis Christi in aetate apostolica.', 'Stephanus, unus e primis diaconis, Christum fortiter praedicavit et primus sanguinem pro Evangelio fudit; eius martyrium in Actibus Apostolorum testimonium fundamentale mansit.', 'saec. I'),
('saint-john', 'Sanctus Ioannes, Apostolus et Evangelista', 'Apostolus et evangelista, theologus amoris divini et Incarnationis.', 'Ioannes, discipulus dilectus traditus, cum quarto Evangelio, epistulis Ioanneis et Apocalypsi coniungitur; testimonium eius christologiam et theologiam contemplativam valde formavit.', 'saec. I'),
('holy-innocents', 'Sancti Innocentes, Martyres', 'Pueri Bethlehemitici ut martyres in narratione infantiae commemorati.', 'Sancti Innocentes memorant pueros a Herode occisos post nativitatem Christi; eorum commemoratio innocentis doloris et testimonii in adventu Messiae signum est.', ''),
('saint-thomas-becket', 'Sanctus Thomas Becket', 'Archiepiscopus Cantuariensis et martyr pro libertate Ecclesiae.', 'Thomas Becket iura et libertatem Ecclesiae contra potestatem regiam defendit; martyrium eius Cantuariae symbolum conscientiae, officii episcopalis et fidelitatis ecclesialis factum est.', 'c. 1118–1170'),
('saint-sylvester-i', 'Sanctus Silvester I', 'Papa aetatis Constantini, cum pace publica Ecclesiae coniunctus.', 'Silvester Ecclesiam rexit tempore transitionis post tolerantiam imperialem, et in traditione cum consolidatione vitae ecclesialis et cultus in Roma saeculi quarti coniungitur.', 'ob. 335')
) AS x(slug, name, short_description, full_biography, life_label)
ON s.slug = x.slug
ON CONFLICT (saint_id, locale_code)
DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_biography = EXCLUDED.full_biography,
  life_label = EXCLUDED.life_label;

COMMIT;
