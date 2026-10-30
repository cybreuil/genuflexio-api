BEGIN;

-- =====================================================
-- SEED: PATRONAGES + TRANSLATIONS + SAINT_PATRONAGES
-- Calendrier romain général – fichier complet
-- =====================================================
-- Run order: after seedRomanSaints.sql
-- Sources : Vatican.va · Acta Apostolicae Sedis
--           Catholic Encyclopedia · Butler's Lives
-- Colonne source_type dans saint_patronages :
--   OFF = proclamation officielle du Saint-Siège (AAS)
--   TRD = patronage traditionnel séculaire reconnu
--   DEV = dévotion populaire répandue
-- =====================================================

-- =====================================================
-- 1) CODES DES PATRONAGES
-- =====================================================

INSERT INTO patronages (code) VALUES

-- GÉOGRAPHIE ─ nations & grandes régions
('EUROPE'),
('IRELAND'),
('ENGLAND'),
('SCOTLAND'),
('GERMANY'),
('FRANCE'),
('SPAIN'),
('PORTUGAL'),
('ITALY'),
('HUNGARY'),
('POLAND'),
('CZECH_REPUBLIC'),
('UKRAINE'),
('SWEDEN'),
('DENMARK'),
('CANADA'),
('INDIA'),
('JAPAN'),
('VIETNAM'),
('KOREA'),
('MEXICO'),
('PERU'),
('ROME'),
('AFRICA_SUBSAHARAN'),
('OCEANIA'),
('LATIN_AMERICA'),
('AMERICAS'),

-- PROFESSIONS & MÉTIERS
('WORKERS'),
('CARPENTERS'),
('ARCHITECTS'),
('TEACHERS'),
('STUDENTS'),
('THEOLOGIANS'),
('PHILOSOPHERS'),
('JOURNALISTS'),
('WRITERS_AUTHORS'),
('TRANSLATORS'),
('EDITORS_PRINTERS'),
('MUSICIANS'),
('PAINTERS_ARTISTS'),
('PHYSICIANS'),
('SURGEONS'),
('NURSES_CAREGIVERS'),
('PHARMACISTS'),
('FISHERMEN'),
('SAILORS'),
('SOLDIERS'),
('POLICE_GUARDS'),
('POLITICIANS'),
('ACCOUNTANTS'),
('MERCHANTS_TRADERS'),
('COOKS'),
('LIBRARIANS'),
('MISSIONARIES'),
('SCIENTISTS'),
('ATHLETES'),
('CLERGY'),
('CATECHISTS'),
('BEEKEEPERS'),
('FARMERS_GARDENERS'),
('SOCIAL_WORKERS'),

-- GROUPES & ÉTATS DE VIE
('POOR'),
('SICK'),
('ORPHANS'),
('PRISONERS'),
('ENSLAVED_PEOPLE'),
('MOTHERS'),
('FATHERS'),
('GRANDPARENTS'),
('FAMILIES'),
('MARRIED_COUPLES'),
('CHILDREN'),
('YOUTH'),
('PILGRIMS'),
('WIDOWS'),
('CONVERTS'),
('ABUSE_VICTIMS'),
('IMMIGRANTS_REFUGEES'),
('ELDERLY'),
('PREGNANT_WOMEN'),

-- CAUSES & DOMAINES
('LOST_CAUSES'),
('LOST_ITEMS'),
('DESPERATE_CASES'),
('GOOD_DEATH'),
('ECOLOGY_ENVIRONMENT'),
('PEACE'),
('INTERNET'),
('UNIVERSAL_CHURCH'),

-- Extras
('MISSIONS'),
('CHARITY_WORKS')

ON CONFLICT (code) DO NOTHING;


-- =====================================================
-- 2) TRADUCTIONS – English (en)
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'en', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('EUROPE',             'Europe',                      'Co-patrons: Benedict (1964), Cyril & Methodius (1980), Bridget, Catherine of Siena, Teresa Benedicta (1999).'),
  ('IRELAND',            'Ireland',                     'Saint Patrick, apostle and bishop of Ireland (5th c.).'),
  ('ENGLAND',            'England',                     'Saint George, martyr and knight; also Augustine of Canterbury and Gregory the Great.'),
  ('SCOTLAND',           'Scotland',                    'Saint Andrew, apostle; also Margaret of Scotland.'),
  ('GERMANY',            'Germany',                     'Saint Boniface, apostle of the Germans; also Peter Canisius.'),
  ('FRANCE',             'France',                      'Saint Denis, bishop-martyr; also Martin of Tours and Thérèse of Lisieux (secondary, 1947).'),
  ('SPAIN',              'Spain',                       'Saint James the Greater (Santiago de Compostela).'),
  ('PORTUGAL',           'Portugal',                    'Saint Anthony of Padua, born in Lisbon; patron of Portugal, Lisbon and Brazil.'),
  ('ITALY',              'Italy',                       'Francis of Assisi and Catherine of Siena (Pius XII, 1939).'),
  ('HUNGARY',            'Hungary',                     'Saint Stephen of Hungary, first Christian king.'),
  ('POLAND',             'Poland',                      'Stanislaus of Kraków (main), Adalbert, Casimir.'),
  ('CZECH_REPUBLIC',     'Czech Republic',              'Wenceslaus, duke-martyr; also Adalbert.'),
  ('UKRAINE',            'Ukraine',                     'Saint Josaphat, bishop-martyr of Polotsk.'),
  ('SWEDEN',             'Sweden',                      'Saint Bridget of Sweden, mystic and foundress.'),
  ('DENMARK',            'Denmark',                     'Saint Ansgar, "Apostle of the North," first archbishop of Hamburg-Bremen.'),
  ('CANADA',             'Canada',                      'Saint Joseph, patron of Canada (Pius X).'),
  ('INDIA',              'India',                       'Saint Thomas the Apostle, who evangelized India (tradition); also Francis Xavier.'),
  ('JAPAN',              'Japan',                       'Saint Francis Xavier, missionary; also Paul Miki and the Japanese Martyrs.'),
  ('VIETNAM',            'Vietnam',                     'Andrew Dung-Lac and the 117 Vietnamese Martyrs.'),
  ('KOREA',              'Korea',                       'Andrew Kim Tae-gon and the 103 Korean Martyrs.'),
  ('MEXICO',             'Mexico',                      'Juan Diego and Our Lady of Guadalupe.'),
  ('PERU',               'Peru',                        'Rose of Lima, first canonized saint of the Americas; also Turibius of Mongrovejo.'),
  ('ROME',               'Rome',                        'Peter and Paul, apostles and martyrs in Rome; also Philip Neri ("Apostle of Rome").'),
  ('AFRICA_SUBSAHARAN',  'Sub-Saharan Africa',          'Charles Lwanga and the Uganda Martyrs, patrons of African Catholic youth.'),
  ('OCEANIA',            'Oceania',                     'Peter Chanel, first martyr of Oceania, martyred in Futuna (1841).'),
  ('LATIN_AMERICA',      'Latin America',               'Rose of Lima and Turibius of Mongrovejo, both active in colonial Peru.'),
  ('AMERICAS',           'The Americas',                'Rose of Lima, proclaimed first canonized saint of all the Americas.'),
  ('WORKERS',            'Workers',                     'Joseph the Worker (feast instituted by Pius XII, 1 May 1955).'),
  ('CARPENTERS',         'Carpenters',                  'Saint Joseph, carpenter of Nazareth and guardian of the Holy Family.'),
  ('ARCHITECTS',         'Architects',                  'Thomas the Apostle, who tradition says built a palace-church in India.'),
  ('TEACHERS',           'Teachers',                    'John Baptist de La Salle (Leo XIII, 1900); also Angela Merici, Gregory the Great, Francis de Sales.'),
  ('STUDENTS',           'Students',                    'Thomas Aquinas, patron of Catholic schools and students; also John Baptist de La Salle.'),
  ('THEOLOGIANS',        'Theologians',                 'Thomas Aquinas (Doctor Angelicus); also Augustine, Paul, and Hilary of Poitiers.'),
  ('PHILOSOPHERS',       'Philosophers',                'Thomas Aquinas, the universal scholar and Doctor Angelicus.'),
  ('JOURNALISTS',        'Journalists',                 'Francis de Sales, patron of journalists and the Catholic press (Pius XI, 1923).'),
  ('WRITERS_AUTHORS',    'Writers and authors',         'Francis de Sales; also Paul the Apostle, John the Evangelist.'),
  ('TRANSLATORS',        'Translators',                 'Saint Jerome, who translated the entire Bible into Latin (Vulgate).'),
  ('EDITORS_PRINTERS',   'Editors, printers, booksellers','John the Evangelist, patron of booksellers and printers; also John Bosco (Catholic press).'),
  ('MUSICIANS',          'Musicians',                   'Cecilia, virgin-martyr, patron of sacred music; also Gregory the Great (Gregorian chant), Hildegard, Ephrem.'),
  ('PAINTERS_ARTISTS',   'Painters and artists',        'Luke the Evangelist (tradition: painted first icon of Mary); also John Damascene (icon painters).'),
  ('PHYSICIANS',         'Physicians',                  'Luke the Evangelist (Col 4:14, "the beloved physician"); also Cosmas and Damian.'),
  ('SURGEONS',           'Surgeons',                    'Cosmas and Damian, physician-martyrs; also Luke the Evangelist.'),
  ('NURSES_CAREGIVERS',  'Nurses and caregivers',       'Camillus de Lellis (Leo XIII, 1886); also John of God, Catherine of Siena, Elizabeth of Hungary.'),
  ('PHARMACISTS',        'Pharmacists',                 'Cosmas and Damian, who dispensed medicine freely; also Mary Magdalene (alabaster jar of myrrh).'),
  ('FISHERMEN',          'Fishermen',                   'Peter the Apostle, the fisherman; also Andrew the Apostle.'),
  ('SAILORS',            'Sailors and navigators',      'Nicholas of Myra; also Clement I (drowned with anchor); Francis Xavier (crossed vast seas).'),
  ('SOLDIERS',           'Soldiers',                    'George, martyr and soldier; also Sebastian, Martin of Tours, Ignatius of Loyola.'),
  ('POLICE_GUARDS',      'Police and law enforcement',  'Sebastian, the soldier-martyr; also Michael the Archangel.'),
  ('POLITICIANS',		 'Politicians',     			'Thomas More, lord chancellor and martyr (John Paul II, 2000).'),
  ('ACCOUNTANTS',        'Accountants and bankers',     'Matthew the Apostle, the tax collector turned evangelist.'),
  ('MERCHANTS_TRADERS',  'Merchants and traders',       'Nicholas of Myra (patron of merchants); also Matthew, Frances of Rome.'),
  ('COOKS',              'Cooks',                       'Lawrence, deacon-martyr (the gridiron); also Martha of Bethany.'),
  ('LIBRARIANS',         'Librarians and archivists',   'Lawrence (entrusted with the church''s books and treasury); also Jerome, translator of the Bible.'),
  ('MISSIONARIES',       'Missionaries',                'Francis Xavier (Benedict XV, 1927); also Thérèse of Lisieux (Pius XI, 1927), Paul the Apostle.'),
  ('SCIENTISTS',         'Scientists',                  'Albert the Great, patron of natural scientists (Pius XII, 1941).'),
  ('ATHLETES',           'Athletes',                    'Sebastian, the arrow-pierced soldier, invoked by athletes since antiquity.'),
  ('CLERGY',             'Diocesan clergy and parish priests','John Vianney, Curé d''Ars (Pius XI, 1929); also Peter Damian, Thomas Becket.'),
  ('CATECHISTS',         'Catechists',                  'Robert Bellarmine and Peter Canisius (great catechism writers); also Thomas Aquinas, John of Ávila.'),
  ('BEEKEEPERS',         'Beekeepers',                  'Ambrose (bees alighted on him as a child) and Bernard of Clairvaux (Doctor mellifluus, honeyed teacher).'),
  ('FARMERS_GARDENERS',  'Farmers and gardeners',       'Benedict of Nursia, patron of rural life; Isidore the Farmer (not in GRC) is the classic patron.'),
  ('SOCIAL_WORKERS',     'Social workers',              'Vincent de Paul, founder of organised charity; also Teresa of Calcutta and Thomas More.'),
  ('POOR',               'The poor',                    'Lawrence; Vincent de Paul, Francis of Assisi, Elizabeth of Hungary, Anthony of Padua, Teresa of Calcutta.'),
  ('SICK',               'The sick',                    'John of God and Camillus de Lellis (both Leo XIII, 1886).'),
  ('ORPHANS',            'Orphans',                     'Jerome Emiliani, founder of the Somascans devoted to orphans and abandoned children.'),
  ('PRISONERS',          'Prisoners',                   'Vincent de Paul (galley slaves); also Nicholas of Myra, Maximilian Kolbe.'),
  ('ENSLAVED_PEOPLE',    'Enslaved people',             'Peter Claver, "apostle of the Negroes" (Leo XIII); also Josephine Bakhita.'),
  ('MOTHERS',            'Mothers',                     'The Blessed Virgin Mary, model of motherhood; also Monica, mother of Augustine; Anne, mother of Mary.'),
  ('FATHERS',            'Fathers',                     'Joseph, model of paternal love and faithfulness; also Joachim, father of Mary.'),
  ('GRANDPARENTS',       'Grandparents',                'Joachim and Anne, grandparents of Jesus; Anne is patron of grandmothers.'),
  ('FAMILIES',           'Families',                    'Joseph, patron of the Holy Family; the Holy Family as universal model.'),
  ('MARRIED_COUPLES',    'Married couples',             'Joseph and Mary as models of faithful marriage; also Anne and Joachim.'),
  ('CHILDREN',           'Children',                    'Nicholas of Myra, who saved three children; also the Holy Innocents.'),
  ('YOUTH',              'Young people',                'John Bosco (Pius XI); also Aloysius Gonzaga (patron of youth, Benedict XIII 1729), Philip Neri, Thérèse.'),
  ('PILGRIMS',           'Pilgrims',                    'James the Greater (Camino de Santiago); also Bridget of Sweden, Christopher Magallanes.'),
  ('WIDOWS',             'Widows',                      'Rita of Cascia; also Monica, Elizabeth of Hungary, Bridget of Sweden.'),
  ('CONVERTS',           'Converts',                    'Augustine of Hippo (the great convert); also Paul the Apostle, Monica, Mary Magdalene.'),
  ('ABUSE_VICTIMS',      'Victims of abuse and violence','Maria Goretti, martyr who forgave her attacker; also Rita of Cascia.'),
  ('IMMIGRANTS_REFUGEES','Immigrants and refugees',     'Josephine Bakhita, herself a slave and refugee; also Teresa of Calcutta (the destitute and displaced).'),
  ('ELDERLY',            'The elderly',                 'Anne, grandmother of Jesus; invoked by the elderly and those in the autumn of life.'),
  ('PREGNANT_WOMEN',     'Pregnant women',             	'The Blessed Virgin Mary, model of motherhood; also Elizabeth, mother of John the Baptist.'),
  ('LOST_CAUSES',        'Lost and hopeless causes',    'Jude the Apostle, invoked for desperate and seemingly impossible situations since the Middle Ages.'),
  ('LOST_ITEMS',         'Lost objects',                'Anthony of Padua, invoked for finding lost objects since the 13th century.'),
  ('DESPERATE_CASES',    'Desperate and impossible cases','Rita of Cascia, the "saint of impossible cases," patron of the desperate.'),
  ('GOOD_DEATH',         'A holy and peaceful death',   'Joseph, who died in the arms of Jesus and Mary; patron of a happy death (ars moriendi).'),
  ('ECOLOGY_ENVIRONMENT','Ecology and the environment', 'Francis of Assisi, patron of ecology (John Paul II, Canticle of Brother Sun, 1979).'),
  ('PEACE',              'Peace and reconciliation',    'Francis of Assisi, peacemaker between peoples and the Sultan; patron of peace.'),
  ('INTERNET',           'The internet and digital media','Isidore of Seville, universal encyclopedist; proposed by John Paul II in 1997 for internet users.'),
  ('UNIVERSAL_CHURCH',   'The Universal Church',        'Joseph, patron of the Universal Church (Pius IX, Quemadmodum Deus, 8 Dec 1870).'),
  ('MISSIONS',           'Missions',                    'Francis Xavier, missionary; also Thérèse of Lisieux (Pius XI, 1927), Paul the Apostle.'),
  ('CHARITY_WORKS',      'Charitable works',            'Vincent de Paul, founder of organised charity; also Teresa of Calcutta and Thomas More.')
  ) AS x(code, label, description)
ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO UPDATE
  SET label = EXCLUDED.label, description = EXCLUDED.description;


-- =====================================================
-- 3) TRADUCTIONS – Français (fr)
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'fr', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('EUROPE',             'Europe',                         'Co-patrons : Benoît (1964), Cyrille & Méthode (1980), Brigitte, Catherine de Sienne, Thérèse Bénédicte (1999).'),
  ('IRELAND',            'Irlande',                        'Saint Patrick, apôtre et évêque de l''Irlande (Ve s.).'),
  ('ENGLAND',            'Angleterre',                     'Saint Georges, martyr-chevalier ; aussi Augustin de Cantorbéry et Grégoire le Grand.'),
  ('SCOTLAND',           'Écosse',                         'Saint André, apôtre ; aussi Marguerite d''Écosse.'),
  ('GERMANY',            'Allemagne',                      'Saint Boniface, apôtre des Germains ; aussi Pierre Canisius.'),
  ('FRANCE',             'France',                         'Saint Denis, évêque-martyr ; aussi Martin de Tours et Thérèse de l''Enfant-Jésus (patronne secondaire, 1947).'),
  ('SPAIN',              'Espagne',                        'Saint Jacques le Majeur (Saint-Jacques-de-Compostelle).'),
  ('PORTUGAL',           'Portugal',                       'Saint Antoine de Padoue, né à Lisbonne ; patron du Portugal, de Lisbonne et du Brésil.'),
  ('ITALY',              'Italie',                         'François d''Assise et Catherine de Sienne (Pie XII, 1939).'),
  ('HUNGARY',            'Hongrie',                        'Saint Étienne de Hongrie, premier roi chrétien.'),
  ('POLAND',             'Pologne',                        'Stanislas de Cracovie (principal), Adalbert, Casimir.'),
  ('CZECH_REPUBLIC',     'République tchèque',             'Venceslas, prince et martyr ; aussi Adalbert.'),
  ('UKRAINE',            'Ukraine',                        'Saint Josaphat, évêque-martyr de Polotsk.'),
  ('SWEDEN',             'Suède',                          'Sainte Brigitte de Suède, mystique et fondatrice.'),
  ('DENMARK',            'Danemark',                       'Saint Anschaire, « Apôtre du Nord », premier archevêque de Hambourg-Brême.'),
  ('CANADA',             'Canada',                         'Saint Joseph, patron du Canada (Pie X).'),
  ('INDIA',              'Inde',                           'Saint Thomas l''Apôtre, qui évangélisa l''Inde selon la tradition ; aussi François Xavier.'),
  ('JAPAN',              'Japon',                          'Saint François Xavier, missionnaire ; aussi Paul Miki et les martyrs japonais.'),
  ('VIETNAM',            'Vietnam',                        'André Dũng-Lạc et les 117 martyrs du Vietnam.'),
  ('KOREA',              'Corée',                          'André Kim Tae-gŏn et les 103 martyrs coréens.'),
  ('MEXICO',             'Mexique',                        'Juan Diego et Notre-Dame de Guadalupe.'),
  ('PERU',               'Pérou',                          'Rose de Lima, première sainte canonisée d''Amérique ; aussi Turibe de Mogrovejo.'),
  ('ROME',               'Rome',                           'Pierre et Paul, apôtres martyrisés à Rome ; aussi Philippe Néri (« Apôtre de Rome »).'),
  ('AFRICA_SUBSAHARAN',  'Afrique subsaharienne',          'Charles Lwanga et les martyrs de l''Ouganda, patrons de la jeunesse catholique africaine.'),
  ('OCEANIA',            'Océanie',                        'Pierre Chanel, premier martyr d''Océanie, tué à Futuna (1841).'),
  ('LATIN_AMERICA',      'Amérique latine',                'Rose de Lima et Turibe de Mogrovejo, tous deux actifs dans le Pérou colonial.'),
  ('AMERICAS',           'Les Amériques',                  'Rose de Lima, proclamée première sainte canonisée de tout le continent américain.'),
  ('WORKERS',            'Travailleurs',                   'Saint Joseph travailleur (fête instituée par Pie XII, 1er mai 1955).'),
  ('CARPENTERS',         'Charpentiers',                   'Saint Joseph, charpentier de Nazareth et gardien de la Sainte Famille.'),
  ('ARCHITECTS',         'Architectes',                    'Thomas l''Apôtre, qui aurait construit un palais-église en Inde selon la tradition.'),
  ('TEACHERS',           'Enseignants',                    'Jean-Baptiste de La Salle (Léon XIII, 1900) ; aussi Angèle Merici, Grégoire le Grand, François de Sales.'),
  ('STUDENTS',           'Étudiants',                      'Thomas d''Aquin, patron des étudiants et écoles catholiques ; aussi Jean-Baptiste de La Salle.'),
  ('THEOLOGIANS',        'Théologiens',                    'Thomas d''Aquin (Docteur Angélique) ; aussi Augustin, Paul, Hilaire de Poitiers.'),
  ('PHILOSOPHERS',       'Philosophes',                    'Thomas d''Aquin, savant universel et Docteur de l''Église.'),
  ('JOURNALISTS',        'Journalistes',                   'François de Sales, patron des journalistes et de la presse catholique (Pie XI, 1923).'),
  ('WRITERS_AUTHORS',    'Écrivains et auteurs',           'François de Sales ; aussi Paul l''Apôtre et Jean l''Évangéliste.'),
  ('TRANSLATORS',        'Traducteurs',                    'Saint Jérôme, traducteur de la Bible entière en latin (Vulgate).'),
  ('EDITORS_PRINTERS',   'Éditeurs, imprimeurs, libraires','Jean l''Évangéliste, patron des libraires et imprimeurs ; aussi Jean Bosco (presse catholique).'),
  ('MUSICIANS',          'Musiciens',                      'Cécile, vierge-martyre, patronne de la musique sacrée ; aussi Grégoire (chant grégorien), Hildegarde, Éphrem.'),
  ('PAINTERS_ARTISTS',   'Peintres et artistes',           'Luc l''Évangéliste (tradition : première icône de Marie) ; aussi Jean Damascène (peintres d''icônes).'),
  ('PHYSICIANS',         'Médecins',                       'Luc l''Évangéliste (Col 4,14, « le médecin bien-aimé ») ; aussi Côme et Damien.'),
  ('SURGEONS',           'Chirurgiens',                    'Côme et Damien, martyrs médecins ; aussi Luc l''Évangéliste.'),
  ('NURSES_CAREGIVERS',  'Infirmiers et soignants',        'Camille de Lellis (Léon XIII, 1886) ; aussi Jean de Dieu, Catherine de Sienne, Élisabeth de Hongrie.'),
  ('PHARMACISTS',        'Pharmaciens',                    'Côme et Damien, qui prodiguaient soins et remèdes sans rétribution ; aussi Marie-Madeleine (vase de parfum).'),
  ('FISHERMEN',          'Pêcheurs',                       'Pierre l''Apôtre, le pêcheur ; aussi André l''Apôtre.'),
  ('SAILORS',            'Marins et navigateurs',          'Nicolas de Myre ; aussi Clément I (noyé avec ancre) ; François Xavier (grands voyages maritimes).'),
  ('SOLDIERS',           'Soldats',                        'Georges, martyr et soldat ; aussi Sébastien, Martin de Tours, Ignace de Loyola.'),
  ('POLICE_GUARDS',      'Forces de l''ordre',             'Sébastien, soldat-martyr ; aussi Michel Archange.'),
  ('POLITICIANS',		 'Hommes d''État',      		   'Thomas More, lord chancelier et martyr (Jean-Paul II, 2000).'),
  ('ACCOUNTANTS',        'Comptables et banquiers',        'Matthieu l''Apôtre, le publicain devenu évangéliste.'),
  ('MERCHANTS_TRADERS',  'Marchands et commerçants',       'Nicolas de Myre (patron des marchands) ; aussi Matthieu, Françoise de Rome.'),
  ('COOKS',              'Cuisiniers',                     'Laurent, diacre-martyr (le gril) ; aussi Marthe de Béthanie.'),
  ('LIBRARIANS',         'Bibliothécaires et archivistes', 'Laurent (chargé des trésors de l''Église) ; aussi Jérôme, traducteur de la Bible.'),
  ('MISSIONARIES',       'Missionnaires',                  'François Xavier (Benoît XV, 1927) ; aussi Thérèse de Lisieux (Pie XI, 1927), Paul l''Apôtre.'),
  ('SCIENTISTS',         'Scientifiques',                  'Albert le Grand, patron des sciences naturelles (Pie XII, 1941).'),
  ('ATHLETES',           'Sportifs et athlètes',           'Sébastien, soldat transpercé de flèches, invoqué par les athlètes depuis l''Antiquité.'),
  ('CLERGY',             'Clergé diocésain et curés',      'Jean-Marie Vianney, curé d''Ars (Pie XI, 1929) ; aussi Pierre Damien, Thomas Becket.'),
  ('CATECHISTS',         'Catéchistes',                    'Robert Bellarmine et Pierre Canisius (grands auteurs de catéchismes) ; aussi Thomas d''Aquin, Jean d''Ávila.'),
  ('BEEKEEPERS',         'Apiculteurs',                    'Ambroise (des abeilles se posèrent sur lui enfant) et Bernard de Clairvaux (Doctor mellifluus).'),
  ('FARMERS_GARDENERS',  'Agriculteurs et jardiniers',     'Benoît de Nursie, patron de la vie rurale ; Isidore le Laboureur (hors CRG) est le patron classique.'),
  ('SOCIAL_WORKERS',     'Travailleurs sociaux',           'Vincent de Paul, fondateur de la charité organisée ; aussi Mère Teresa et Thomas More.'),
  ('POOR',               'Les pauvres',                    'Laurent ; Vincent de Paul, François d''Assise, Élisabeth de Hongrie, Antoine de Padoue, Mère Teresa.'),
  ('SICK',               'Les malades',                    'Jean de Dieu et Camille de Lellis (tous deux Léon XIII, 1886).'),
  ('ORPHANS',            'Les orphelins',                  'Jérôme Émiliani, fondateur des Somasques au service des orphelins et enfants abandonnés.'),
  ('PRISONERS',          'Les prisonniers',                'Vincent de Paul (galériens) ; aussi Nicolas de Myre et Maximilien Kolbe.'),
  ('ENSLAVED_PEOPLE',    'Les victimes de l''esclavage',   'Pierre Claver, « apôtre des Noirs » (Léon XIII) ; aussi Joséphine Bakhita.'),
  ('MOTHERS',            'Les mères',                      'La Vierge Marie, modèle de la maternité ; aussi Monique, mère d''Augustin ; Anne, mère de Marie.'),
  ('FATHERS',            'Les pères',                      'Joseph, modèle de la paternité fidèle et protectrice ; aussi Joachim, père de Marie.'),
  ('GRANDPARENTS',       'Les grands-parents',             'Joachim et Anne, grands-parents de Jésus ; Anne est patronne des grand-mères.'),
  ('FAMILIES',           'Les familles',                   'Joseph, patron de la Sainte Famille ; la Sainte Famille, modèle universel.'),
  ('MARRIED_COUPLES',    'Les époux',                      'Joseph et Marie, modèles du mariage fidèle et chaste ; aussi Anne et Joachim.'),
  ('CHILDREN',           'Les enfants',                    'Nicolas de Myre, qui sauva trois enfants ; aussi les Saints Innocents.'),
  ('YOUTH',              'Les jeunes',                     'Jean Bosco (Pie XI) ; aussi Aloysius Gonzague (Benoît XIII, 1729), Philippe Néri, Thérèse.'),
  ('PILGRIMS',           'Les pèlerins',                   'Jacques le Majeur (Chemin de Saint-Jacques) ; aussi Brigitte de Suède et Christophe Magallanes.'),
  ('WIDOWS',             'Les veuves',                     'Rita de Cascia ; aussi Monique, Élisabeth de Hongrie, Brigitte de Suède.'),
  ('CONVERTS',           'Les convertis',                  'Augustin d''Hippone (le grand converti) ; aussi Paul l''Apôtre, Monique, Marie-Madeleine.'),
  ('ABUSE_VICTIMS',      'Les victimes de violence',       'Marie Goretti, martyre qui pardonna à son agresseur ; aussi Rita de Cascia.'),
  ('IMMIGRANTS_REFUGEES','Les migrants et réfugiés',       'Joséphine Bakhita, elle-même esclave et réfugiée ; aussi Mère Teresa (les sans-abri).'),
  ('ELDERLY',            'Les personnes âgées',            'Anne, grand-mère de Jésus ; invoquée par les personnes âgées et en fin de vie.'),
  ('PREGNANT_WOMEN',     'Les femmes enceintes',      	   'La Vierge Marie, modèle de la maternité ; aussi Élisabeth, mère de Jean-Baptiste.'),
  ('LOST_CAUSES',        'Les causes désespérées',         'Jude l''Apôtre, invoqué pour les situations sans espoir depuis le Moyen Âge.'),
  ('LOST_ITEMS',         'Les objets perdus',              'Antoine de Padoue, invoqué pour retrouver les objets perdus depuis le XIIIe siècle.'),
  ('DESPERATE_CASES',    'Les cas impossibles',            'Rita de Cascia, la « sainte des causes impossibles ».'),
  ('GOOD_DEATH',         'La bonne mort',                  'Joseph, mort dans les bras de Jésus et Marie ; patron de l''art de bien mourir.'),
  ('ECOLOGY_ENVIRONMENT','Écologie et environnement',      'François d''Assise, patron de l''écologie (Jean-Paul II, Cantique de frère Soleil, 1979).'),
  ('PEACE',              'La paix et la réconciliation',   'François d''Assise, artisan de paix entre les peuples et le Sultan ; patron de la paix.'),
  ('INTERNET',           'Internet et les médias numériques','Isidore de Séville, encyclopédiste universel ; proposé par Jean-Paul II en 1997 pour les usagers d''Internet.'),
  ('UNIVERSAL_CHURCH',   'L''Église universelle',          'Joseph, patron de l''Église universelle (Pie IX, Quemadmodum Deus, 8 déc. 1870).'),
  ('MISSIONS',           'Les missions',                   'François Xavier, missionnaire ; aussi Thérèse de Lisieux (Pie XI, 1927), Paul l''Apôtre.'),
  ('CHARITY_WORKS',      'Les œuvres de charité',          'Vincent de Paul, fondateur de la charité organisée ; aussi Mère Teresa et Thomas More.')
) AS x(code, label, description)
ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO UPDATE
  SET label = EXCLUDED.label, description = EXCLUDED.description;


-- =====================================================
-- 4) TRADUCTIONS – Latin (la)
-- =====================================================

INSERT INTO patronage_translations (patronage_id, locale_code, label, description)
SELECT p.id, 'la', x.label, x.description
FROM patronages p
JOIN (VALUES
  ('EUROPE',             'Europa',                         'Patroni: Benedictus (1964), Cyrillus et Methodius (1980), Birgitta, Catharina, Teresia Benedicta (1999).'),
  ('IRELAND',            'Hibernia',                       'Sanctus Patricius, apostolus et episcopus Hiberniae.'),
  ('ENGLAND',            'Anglia',                         'Sanctus Georgius, martyr; etiam Augustinus Cantuariensis et Gregorius Magnus.'),
  ('SCOTLAND',           'Scotia',                         'Sanctus Andreas, apostolus; etiam Margarita Scotiae.'),
  ('GERMANY',            'Germania',                       'Sanctus Bonifacius, apostolus Germanorum; etiam Petrus Canisius.'),
  ('FRANCE',             'Gallia',                         'Sanctus Dionysius, episcopus et martyr; etiam Martinus Turonensis et Theresia a Puero Iesu (1947).'),
  ('SPAIN',              'Hispania',                       'Sanctus Iacobus Maior (Compostella).'),
  ('PORTUGAL',           'Lusitania',                      'Sanctus Antonius Patavinus, Ulyssipone natus; patronus Lusitaniae, Ulyssiponis et Brasiliae.'),
  ('ITALY',              'Italia',                         'Franciscus Assisiensis et Catharina Senensis (Pius XII, 1939).'),
  ('HUNGARY',            'Hungaria',                       'Sanctus Stephanus, primus rex christianus Hungariae.'),
  ('POLAND',             'Polonia',                        'Stanislaus Cracoviensis (praecipuus), Adalbertus, Casimirus.'),
  ('CZECH_REPUBLIC',     'Bohemia',                        'Sanctus Venceslaus, dux et martyr; etiam Adalbertus.'),
  ('UKRAINE',            'Ucraina',                        'Sanctus Iosaphat, episcopus et martyr Polocensis.'),
  ('SWEDEN',             'Suecia',                         'Sancta Birgitta Suecica, mystica et fundatrix.'),
  ('DENMARK',            'Dania',                          'Sanctus Anscharius, "Apostolus Septentrionis," primus archiepiscopus Hamburgensis.'),
  ('CANADA',             'Canada',                         'Sanctus Ioseph, patronus Canadae (Pius X).'),
  ('INDIA',              'India',                          'Sanctus Thomas Apostolus (Indiam evangelizasse traditur); etiam Franciscus Xaverius.'),
  ('JAPAN',              'Iaponia',                        'Sanctus Franciscus Xaverius; etiam Paulus Miki et socii martyres.'),
  ('VIETNAM',            'Vietnam',                        'Andreas Dung-Lac et CXVII Martyres Vietnamenses.'),
  ('KOREA',              'Korea',                          'Andreas Kim Tae-gon et CIII Martyres Coreani.'),
  ('MEXICO',             'Mexico',                         'Ioannes Didacus et Nostra Domina Guadalupensis.'),
  ('PERU',               'Peruvia',                        'Rosa Limana, prima sancta Americarum; etiam Toribius Mogroveiensis.'),
  ('ROME',               'Roma',                           'Petrus et Paulus, apostoli et martyres Romae; etiam Philippus Nerius ("Apostolus Romae").'),
  ('AFRICA_SUBSAHARAN',  'Africa subsahariana',            'Carolus Lwanga et Martyres Ugandenses, patroni iuventutis catholicae Africae.'),
  ('OCEANIA',            'Oceania',                        'Petrus Chanel, primus martyr Oceaniae, in Futuna occisus (1841).'),
  ('LATIN_AMERICA',      'America Latina',                 'Rosa Limana et Toribius Mogroveiensis, ambo in Peruvia coloniali operam dederunt.'),
  ('AMERICAS',           'Americae',                       'Rosa Limana, prima sancta omnium Americarum canonizata.'),
  ('WORKERS',            'Opifices',                       'Sanctus Ioseph Opifex (festum a Pio XII die 1 Maii 1955 institutum).'),
  ('CARPENTERS',         'Fabri lignarii',                 'Sanctus Ioseph, faber lignarius Nazarethanus et custos Sanctae Familiae.'),
  ('ARCHITECTS',         'Architecti',                     'Thomas Apostolus, qui aulam-ecclesiam in India aedificasse traditur.'),
  ('TEACHERS',           'Magistri et paedagogi',          'Ioannes Baptista de La Salle (Leo XIII, 1900); etiam Angela Mericia, Gregorius Magnus, Franciscus Salesius.'),
  ('STUDENTS',           'Discipuli et scholares',         'Thomas Aquinas, patronus scholarium catholicorum; etiam Ioannes de La Salle.'),
  ('THEOLOGIANS',        'Theologi',                       'Thomas Aquinas (Doctor Angelicus); etiam Augustinus, Paulus, Hilarius Pictaviensis.'),
  ('PHILOSOPHERS',       'Philosophi',                     'Thomas Aquinas, Doctor universalis et Angelicus.'),
  ('JOURNALISTS',        'Ephemeridum scriptores',         'Franciscus Salesius, patronus diurnariorum (Pius XI, 1923).'),
  ('WRITERS_AUTHORS',    'Scriptores et auctores',         'Franciscus Salesius; etiam Paulus Apostolus, Ioannes Evangelista.'),
  ('TRANSLATORS',        'Interpretes',                    'Hieronymus, qui totam Bibliam in Latinum transtulit (Vulgata).'),
  ('EDITORS_PRINTERS',   'Typographi et librarii',         'Ioannes Evangelista, patronus librariorum et typographorum; etiam Ioannes Bosco.'),
  ('MUSICIANS',          'Musici',                         'Caecilia, virgo et martyr; etiam Gregorius Magnus (cantus gregorianus), Hildegardis, Ephraem.'),
  ('PAINTERS_ARTISTS',   'Pictores et artifices',          'Lucas Evangelista (primam Mariae imaginem pinxisse traditur); etiam Ioannes Damascenus (iconographi).'),
  ('PHYSICIANS',         'Medici',                         'Lucas Evangelista (Col 4,14, "medicus carissimus"); etiam Cosmas et Damianus.'),
  ('SURGEONS',           'Chirurgi',                       'Cosmas et Damianus, medici martyres; etiam Lucas Evangelista.'),
  ('NURSES_CAREGIVERS',  'Infirmarii et curatores',        'Camillus de Lellis (Leo XIII, 1886); etiam Ioannes a Deo, Catharina Senensis, Elisabeth Hungariae.'),
  ('PHARMACISTS',        'Pharmacopoei',                   'Cosmas et Damianus, qui remedia gratis praebebant; etiam Maria Magdalena (alabastrum unguentorum).'),
  ('FISHERMEN',          'Piscatores',                     'Petrus Apostolus, piscator; etiam Andreas Apostolus.'),
  ('SAILORS',            'Nautae et navigatores',          'Nicolaus Myrensis; etiam Clemens I (ancora submersus); Franciscus Xaverius (maria vasta transivit).'),
  ('SOLDIERS',           'Milites',                        'Georgius, martyr et miles; etiam Sebastianus, Martinus Turonensis, Ignatius Loyolanus.'),
  ('POLICE_GUARDS',      'Custodes et vigiles',            'Sebastianus, miles sagittis transfixus; etiam Michael Archangelus.'),
  ('POLITICIANS',		 'Politici',      				   'Thomas Morus, cancellarius regni et martyr (Ioannes Paulus II, 2000).'),
  ('ACCOUNTANTS',        'Rationarii et argentarii',       'Matthaeus Apostolus, publicanus factus evangelista.'),
  ('MERCHANTS_TRADERS',  'Mercatores et negotiatores',     'Nicolaus Myrensis (patronus mercatorum); etiam Matthaeus, Francisca Romana.'),
  ('COOKS',              'Coqui',                          'Laurentius, diaconus et martyr (craticulum); etiam Martha Bethaniae.'),
  ('LIBRARIANS',         'Bibliothecarii',                 'Laurentius (thesauris Ecclesiae praefectus); etiam Hieronymus, Bibliae translator.'),
  ('MISSIONARIES',       'Missionarii',                    'Franciscus Xaverius (Benedictus XV, 1927); etiam Theresia a Puero Iesu (Pius XI, 1927), Paulus Apostolus.'),
  ('SCIENTISTS',         'Naturae investigatores',         'Albertus Magnus, patronus scientiarum naturalium (Pius XII, 1941).'),
  ('ATHLETES',           'Athletae',                       'Sebastianus, miles sagittis transfixus, ab athletis antiquitus invocatus.'),
  ('CLERGY',             'Clerici et parochi',             'Ioannes Maria Vianney, patronus parochorum (Pius XI, 1929); etiam Petrus Damiani, Thomas Cantuariensis.'),
  ('CATECHISTS',         'Catechistae',                    'Robertus Bellarminus et Petrus Canisius (cathechismi scriptores praecipui); etiam Thomas Aquinas, Ioannes Avilanus.'),
  ('BEEKEEPERS',         'Apicultores',                    'Ambrosius (apes ei puero advolasse traduntur) et Bernardus Claravallensis (Doctor mellifluus).'),
  ('FARMERS_GARDENERS',  'Agricolae et hortulani',         'Benedictus Nursinus, patronus vitae rusticae; Isidorus Agricola (extra CRG) est patronus classicus.'),
  ('SOCIAL_WORKERS',     'Ministri sociales',              'Vincentius a Paulo, fundator caritatis ordinatae; etiam Teresia Calcuttensis et Thomas Morus.'),
  ('POOR',               'Pauperes',                       'Laurentius; Vincentius a Paulo, Franciscus Assisiensis, Elisabeth Hungariae, Antonius Patavinus, Teresia Calcuttensis.'),
  ('SICK',               'Infirmi',                        'Ioannes a Deo et Camillus de Lellis (ambo a Leone XIII, 1886).'),
  ('ORPHANS',            'Orphani',                        'Hieronymus Aemiliani, fundator Somaschensium pro orphanis et pueris derelictis.'),
  ('PRISONERS',          'Vincti et captivi',              'Vincentius a Paulo (triremis damnati); etiam Nicolaus Myrensis et Maximilianus Kolbe.'),
  ('ENSLAVED_PEOPLE',    'Servi et mancipia',              'Petrus Claver, "apostolus Afrorum" (Leo XIII); etiam Iosephina Bakhita.'),
  ('MOTHERS',            'Matres',                         'Beata Virgo Maria, exemplar maternitatis; etiam Monica, mater Augustini; Anna, mater Mariae.'),
  ('FATHERS',            'Patres familias',                'Ioseph, exemplar paternitatis fidelis; etiam Ioachim, pater Mariae.'),
  ('GRANDPARENTS',       'Avi et aviae',                   'Ioachim et Anna, avi Iesu; Anna praesertim a senibus invocatur.'),
  ('FAMILIES',           'Familiae',                       'Ioseph, patronus Sanctae Familiae; Sancta Familia ut universale exemplar.'),
  ('MARRIED_COUPLES',    'Coniuges',                       'Ioseph et Maria, exemplar matrimonii fidelis et casti; etiam Anna et Ioachim.'),
  ('CHILDREN',           'Pueri',                          'Nicolaus Myrensis, qui tres pueros servavit; etiam Sancti Innocentes.'),
  ('YOUTH',              'Iuvenes',                        'Ioannes Bosco (Pius XI); etiam Aloysius Gonzaga (Benedictus XIII, 1729), Philippus Nerius, Theresia.'),
  ('PILGRIMS',           'Peregrini',                      'Iacobus Maior (Via Sancti Iacobi); etiam Birgitta Suecica et Christophorus Magallanes.'),
  ('WIDOWS',             'Viduae',                         'Rita Cassiensis; etiam Monica, Elisabeth Hungariae, Birgitta Suecica.'),
  ('CONVERTS',           'Conversi',                       'Augustinus Hipponensis (insignis conversus); etiam Paulus Apostolus, Monica, Maria Magdalena.'),
  ('ABUSE_VICTIMS',      'Victimae violentiae',            'Maria Goretti, martyr quae aggressori ignovit; etiam Rita Cassiensis.'),
  ('IMMIGRANTS_REFUGEES','Peregrini et profugi',           'Iosephina Bakhita, ipsa serva et profuga; etiam Teresia Calcuttensis.'),
  ('ELDERLY',            'Senes',                          'Anna, avia Iesu; praesertim a senibus et moribundis invocatur.'),
  ('PREGNANT_WOMEN',     'Feminae gravidæ',                'Beata Virgo Maria, exemplar maternitas; etiam Elisabeth, mater Ioannis Baptistae.'),
  ('LOST_CAUSES',        'Causae desperatae',              'Iudas Apostolus, pro causis desperatis a Medio Aevo invocatus.'),
  ('LOST_ITEMS',         'Res amissae',                    'Antonius Patavinus, pro rebus amissis a saeculo XIII invocatus.'),
  ('DESPERATE_CASES',    'Causae impossibiles',            'Rita Cassiensis, "sancta causarum impossibilium."'),
  ('GOOD_DEATH',         'Mors bona',                      'Ioseph, qui Iesu et Maria adstantibus obiit; patronus bonae mortis (ars moriendi).'),
  ('ECOLOGY_ENVIRONMENT','Oecologia et natura',            'Franciscus Assisiensis, patronus oecologiae (Ioannes Paulus II, Canticum Fratris Solis, 1979).'),
  ('PEACE',              'Pax et reconciliatio',           'Franciscus Assisiensis, pacificator inter gentes et Sultanum; patronus pacis.'),
  ('INTERNET',           'Interrete et instrumenta digitalia','Isidorus Hispalensis, encyclopaedista universalis; a Ioanne Paulo II anno 1997 propositus pro interretis usoribus.'),
  ('UNIVERSAL_CHURCH',   'Ecclesia universalis',           'Ioseph, patronus Ecclesiae universalis (Pius IX, Quemadmodum Deus, 8 Dec. 1870).'),
  ('MISSIONS',           'Missiones',                      'Franciscus Xaverius, missionarius; etiam Theresia a Puero Iesu (Pius XI, 1927), Paulus Apostolus.'),
  ('CHARITY_WORKS',      'Opera caritatis',                'Vincentius a Paulo, fundator caritatis ordinatae; etiam Teresia Calcuttensis et Thomas Morus.')
  ) AS x(code, label, description)
ON p.code = x.code
ON CONFLICT (patronage_id, locale_code) DO UPDATE
  SET label = EXCLUDED.label, description = EXCLUDED.description;


-- =====================================================
-- 5) LIAISONS SAINT_PATRONAGES
-- =====================================================

INSERT INTO saint_patronages (saint_id, patronage_id, source_type)
SELECT s.id, p.id, pairs.source_type
FROM (VALUES

  -- ── MARIE ────────────────────────────────────────────────────────────────
  ('saint-mary',                          'FRANCE',               'OFF'),  -- Pie XI, 2 mars 1922: patronne principale de la France
  ('saint-mary',                          'MOTHERS',              'TRD'),  -- modèle universel de la maternité
  ('saint-mary',                          'FAMILIES',             'TRD'),  -- mère de la Sainte Famille
  ('saint-mary',                          'POOR',                 'TRD'),  -- Magnificat : il a comblé de biens les affamés
  ('saint-mary',                          'SICK',                 'TRD'),  -- Notre-Dame de Lourdes, de Fatima, innombrables guérisons
  ('saint-mary',                          'PILGRIMS',             'TRD'),  -- Lourdes, Fatima, Guadalupe, principaux pèlerinages mondiaux
  ('saint-mary',                          'CONVERTS',             'TRD'),  -- Fatima : chapelet pour la conversion des pécheurs
  ('saint-mary',                          'WIDOWS',               'TRD'),  -- tradition : elle survit à Joseph, modèle des veuves
  ('saint-mary',                          'MISSIONARIES',         'TRD'),  -- Reine des Apôtres, patronne de nombreuses congrégations missionnaires
  ('saint-mary',                          'PREGNANT_WOMEN',       'TRD'),  -- modèle de maternité

  -- ── JOSEPH ───────────────────────────────────────────────────────────────
  ('saint-joseph',                        'UNIVERSAL_CHURCH',     'OFF'),  -- Pie IX, Quemadmodum Deus, 1870
  ('saint-joseph',                        'WORKERS',              'OFF'),  -- Pie XII, fête du 1er mai 1955
  ('saint-joseph',                        'CARPENTERS',           'TRD'),
  ('saint-joseph',                        'FATHERS',              'TRD'),
  ('saint-joseph',                        'FAMILIES',             'TRD'),
  ('saint-joseph',                        'MARRIED_COUPLES',      'TRD'),
  ('saint-joseph',                        'GOOD_DEATH',           'TRD'),
  ('saint-joseph',                        'CANADA',               'OFF'),  -- Pie X

  -- ── APÔTRES ──────────────────────────────────────────────────────────────
  ('saint-peter-apostle',                 'FISHERMEN',            'TRD'),
  ('saint-peter-apostle',                 'ROME',                 'TRD'),
  ('saint-peter-apostle',                 'SAILORS',              'TRD'),  -- pêcheur sur la mer de Galilée

  ('saint-paul-apostle',                  'MISSIONARIES',         'TRD'),
  ('saint-paul-apostle',                  'THEOLOGIANS',          'TRD'),
  ('saint-paul-apostle',                  'WRITERS_AUTHORS',      'TRD'),
  ('saint-paul-apostle',                  'ROME',                 'TRD'),
  ('saint-paul-apostle',                  'CONVERTS',             'TRD'),
  ('saint-paul-apostle',                  'WORKERS',              'TRD'),  -- fabricant de tentes, travailla de ses mains (1 Th 2,9)
  ('saint-paul-apostle',                  'MISSIONS',             'TRD'),

  ('saint-andrew-apostle',                'SCOTLAND',             'TRD'),
  ('saint-andrew-apostle',                'FISHERMEN',            'TRD'),

  ('saint-james-apostle',                 'SPAIN',                'TRD'),
  ('saint-james-apostle',                 'PILGRIMS',             'TRD'),
  ('saint-james-apostle',                 'FISHERMEN',            'TRD'),  -- pêcheur sur le lac avant d'être appelé
  ('saint-james-apostle',                 'SOLDIERS',             'TRD'),  -- Santiago Matamoros, tradition hispanique séculaire

  ('saint-john',                          'THEOLOGIANS',          'TRD'),
  ('saint-john',                          'WRITERS_AUTHORS',      'TRD'),
  ('saint-john',                          'EDITORS_PRINTERS',     'TRD'),
  ('saint-john',                          'YOUTH',                'TRD'),  -- le plus jeune des apôtres, le disciple bien-aimé

  ('saint-thomas-apostle',                'INDIA',                'TRD'),
  ('saint-thomas-apostle',                'ARCHITECTS',           'TRD'),
  ('saint-thomas-apostle',                'MISSIONARIES',         'TRD'),  -- évangélisa l'Inde et la Perse selon la tradition

  ('saint-matthew',                       'ACCOUNTANTS',          'TRD'),
  ('saint-matthew',                       'MERCHANTS_TRADERS',    'TRD'),
  ('saint-matthew',                       'WRITERS_AUTHORS',      'TRD'),  -- auteur du 1er Évangile

  ('saint-luke',                          'PHYSICIANS',           'TRD'),
  ('saint-luke',                          'SURGEONS',             'TRD'),
  ('saint-luke',                          'PAINTERS_ARTISTS',     'TRD'),
  ('saint-luke',                          'WRITERS_AUTHORS',      'TRD'),  -- auteur du 3e Évangile et des Actes des Apôtres

  ('saint-philip-apostle',                'POOR',                 'TRD'),

  ('saint-jude-apostle',                  'LOST_CAUSES',          'TRD'),

  ('saint-bartholomew-apostle',           'FARMERS_GARDENERS',    'TRD'),

  -- ── JEAN-BAPTISTE ────────────────────────────────────────────────────────
  -- (pas de patronage universel correspondant à nos codes)

  -- ── MARTYRS ──────────────────────────────────────────────────────────────
  ('holy-innocents',                      'CHILDREN',             'TRD'),

  ('saint-stephen-martyr',                'POOR',                 'TRD'),

  ('saint-sebastian',                     'SOLDIERS',             'TRD'),
  ('saint-sebastian',                     'ATHLETES',             'TRD'),
  ('saint-sebastian',                     'POLICE_GUARDS',        'TRD'),
  ('saint-sebastian',                     'SICK',                 'TRD'),  -- invoqué contre la peste noire ; survivà aux flèches

  ('saint-agnes-of-rome',                 'YOUTH',                'TRD'),
  ('saint-agnes-of-rome',                 'ABUSE_VICTIMS',        'TRD'),

  ('saint-vincent-of-saragossa',          'SAILORS',              'TRD'),

  ('saint-george',                        'ENGLAND',              'TRD'),
  ('saint-george',                        'SOLDIERS',             'TRD'),

  ('saint-lawrence',                      'COOKS',                'TRD'),
  ('saint-lawrence',                      'LIBRARIANS',           'TRD'),
  ('saint-lawrence',                      'POOR',                 'TRD'),
  ('saint-lawrence',                      'ROME',                 'TRD'),  -- second patron de Rome, basilique majeure sur l'Esquilin

  ('saint-blaise',                        'FARMERS_GARDENERS',    'TRD'),
  ('saint-blaise',                        'SICK',                 'TRD'),  -- guérit un enfant d'une arête ; invoqué pour la gorge et les maladies

  ('saint-agatha',                        'NURSES_CAREGIVERS',    'TRD'),
  ('saint-agatha',                        'SICK',                 'TRD'),  -- invoquée contre les maladies du sein et les épidémies

  ('saint-cecilia',                       'MUSICIANS',            'TRD'),

  ('saint-clement-i',                     'SAILORS',              'TRD'),

  ('saint-polycarp',                      'THEOLOGIANS',          'TRD'),

  ('saint-nicholas',                      'CHILDREN',             'TRD'),
  ('saint-nicholas',                      'SAILORS',              'TRD'),
  ('saint-nicholas',                      'PRISONERS',            'TRD'),
  ('saint-nicholas',                      'MERCHANTS_TRADERS',    'TRD'),
  ('saint-nicholas',                      'POOR',                 'TRD'),  -- dot secrète aux jeunes filles pauvres ; fondement de sa légende

  ('saint-thomas-becket',                 'CLERGY',               'TRD'),

  ('saint-thomas-more',                   'POLITICIANS',  		  'OFF'),  -- Jean-Paul II, 2000
  ('saint-thomas-more',                   'SOCIAL_WORKERS',       'TRD'),

  ('saint-maximilian-kolbe',              'JOURNALISTS',          'TRD'),
  ('saint-maximilian-kolbe',              'PRISONERS',            'TRD'),
  ('saint-maximilian-kolbe',              'MISSIONARIES',         'TRD'),  -- missionnaire au Japon, fonda Mugenzai no Sono
  ('saint-maximilian-kolbe',              'YOUTH',                'TRD'),  -- fonda la Militia Immaculatae et une presse pour la jeunesse

  ('saint-charles-lwanga',                'AFRICA_SUBSAHARAN',    'TRD'),
  ('saint-charles-lwanga',                'YOUTH',                'TRD'),
  ('saint-charles-lwanga',                'CATECHISTS',           'TRD'),  -- tué précisément parce qu'il enseignait le christianisme aux pages royaux

  ('saint-paul-miki',                     'JAPAN',                'TRD'),
  ('saint-paul-miki',                     'MISSIONARIES',         'TRD'),  -- novice jésuite, prêcha jusqu'à son exécution

  ('saint-andrew-dung-lac',               'VIETNAM',              'OFF'),

  ('saint-andrew-kim-tae-gon',            'KOREA',                'TRD'),
  ('saint-paul-chong-ha-sang',            'KOREA',                'TRD'),

  ('saint-josaphat',                      'UKRAINE',              'TRD'),

  ('saint-stanislaus',                    'POLAND',               'TRD'),
  ('saint-adalbert',                      'POLAND',               'TRD'),
  ('saint-adalbert',                      'CZECH_REPUBLIC',       'TRD'),
  ('saint-casimir',                       'POLAND',               'TRD'),

  ('saint-wenceslaus',                    'CZECH_REPUBLIC',       'TRD'),

  ('saint-stephen-of-hungary',            'HUNGARY',              'TRD'),

  ('saint-maria-goretti',                 'ABUSE_VICTIMS',        'TRD'),
  ('saint-maria-goretti',                 'YOUTH',                'TRD'),

  ('saint-irenaeus',                      'THEOLOGIANS',          'TRD'),
  ('saint-irenaeus',                      'MISSIONARIES',         'TRD'),  -- évêque de Lyon, évangélisa la Gaule

  -- ── PAPES ────────────────────────────────────────────────────────────────
  ('saint-gregory-the-great',             'MUSICIANS',            'TRD'),
  ('saint-gregory-the-great',             'TEACHERS',             'TRD'),
  ('saint-gregory-the-great',             'ENGLAND',              'TRD'),  -- envoya Augustin évangéliser l'Angleterre
  ('saint-gregory-the-great',             'MISSIONARIES',         'TRD'),  -- initiateur de la mission en Angleterre
  ('saint-gregory-the-great',             'CLERGY',               'TRD'),  -- réforma profondément le clergé romain

  -- ── ÉVÊQUES ──────────────────────────────────────────────────────────────
  ('saint-patrick',                       'IRELAND',              'OFF'),
  ('saint-patrick',                       'MISSIONARIES',         'TRD'),  -- apôtre de l'Irlande, convertit un peuple entier

  ('saint-boniface',                      'GERMANY',              'TRD'),

  ('saint-denis',                         'FRANCE',               'TRD'),

  ('saint-martin-of-tours',               'FRANCE',               'TRD'),
  ('saint-martin-of-tours',               'SOLDIERS',             'TRD'),
  ('saint-martin-of-tours',               'POOR',                 'TRD'),

  ('saint-augustine-of-canterbury',       'ENGLAND',              'TRD'),

  ('saint-peter-canisius',                'GERMANY',              'TRD'),
  ('saint-peter-canisius',                'CATECHISTS',           'TRD'),
  ('saint-peter-canisius',                'THEOLOGIANS',          'TRD'),  -- Docteur de l'Église, défenseur de la foi contre la Réforme

  ('saint-ansgar',                        'DENMARK',              'TRD'),

  ('saint-turibius-of-mogrovejo',         'PERU',                 'TRD'),
  ('saint-turibius-of-mogrovejo',         'LATIN_AMERICA',        'TRD'),

  -- ── DOCTEURS ─────────────────────────────────────────────────────────────
  ('saint-thomas-aquinas',                'STUDENTS',             'OFF'),  -- Léon XIII, 1880
  ('saint-thomas-aquinas',                'THEOLOGIANS',          'TRD'),
  ('saint-thomas-aquinas',                'PHILOSOPHERS',         'TRD'),
  ('saint-thomas-aquinas',                'CATECHISTS',           'TRD'),
  ('saint-thomas-aquinas',                'TEACHERS',             'TRD'),  -- le Docteur Angélique enseigna à Paris et Naples

  ('saint-augustine-of-hippo',            'THEOLOGIANS',          'TRD'),
  ('saint-augustine-of-hippo',            'CONVERTS',             'TRD'),
  ('saint-augustine-of-hippo',            'STUDENTS',             'TRD'),  -- patron des séminaristes et étudiants en théologie
  ('saint-augustine-of-hippo',            'WRITERS_AUTHORS',      'TRD'),  -- Confessions, Cité de Dieu : l'un des plus grands écrivains chrétiens

  ('saint-jerome',                        'LIBRARIANS',           'TRD'),
  ('saint-jerome',                        'TRANSLATORS',          'TRD'),
  ('saint-jerome',                        'WRITERS_AUTHORS',      'TRD'),  -- auteur prolixe : commentaires, lettres, traités

  ('saint-ambrose',                       'MUSICIANS',            'TRD'),
  ('saint-ambrose',                       'BEEKEEPERS',           'TRD'),
  ('saint-ambrose',                       'CATECHISTS',           'TRD'),  -- catéchisa et baptisa Augustin d'Hippone
  ('saint-ambrose',                       'TEACHERS',             'TRD'),  -- un des plus grands catéchètes de l'Antiquité tardive

  ('saint-hilary-of-poitiers',            'THEOLOGIANS',          'TRD'),

  -- Saint Isidore of Seville
  ('saint-isidore',                       'STUDENTS',             'TRD'),
  ('saint-isidore',                       'INTERNET',             'DEV'),  -- proposé Jean-Paul II, 1997

  ('saint-francis-de-sales',              'JOURNALISTS',          'OFF'),  -- Pie XI, 1923
  ('saint-francis-de-sales',              'WRITERS_AUTHORS',      'TRD'),
  ('saint-francis-de-sales',              'TEACHERS',             'TRD'),

  ('saint-albert-the-great',              'SCIENTISTS',           'OFF'),  -- Pie XII, 1941

  ('saint-anselm',                        'THEOLOGIANS',          'TRD'),

  ('saint-peter-damian',                  'CLERGY',               'TRD'),

  ('saint-john-chrysostom',               'THEOLOGIANS',          'TRD'),
  ('saint-john-chrysostom',               'CLERGY',               'TRD'),  -- réforma le clergé de Constantinople
  ('saint-john-chrysostom',               'WRITERS_AUTHORS',      'TRD'),  -- « Bouche d'Or » : immense corpus d'homélies et lettres

  ('saint-bernard',                       'BEEKEEPERS',           'TRD'),
  ('saint-bernard',                       'THEOLOGIANS',          'TRD'),

  ('saint-bonaventure',                   'THEOLOGIANS',          'TRD'),
  ('saint-bonaventure',                   'CATECHISTS',           'TRD'),  -- Itinerarium mentis et écrits de vulgarisation de la foi

  ('saint-ephrem',                        'MUSICIANS',            'TRD'),

  ('saint-hildegard-of-bingen',           'MUSICIANS',            'TRD'),
  ('saint-hildegard-of-bingen',           'PHYSICIANS',           'TRD'),
  ('saint-hildegard-of-bingen',           'SCIENTISTS',           'TRD'),  -- Physica, Causae et Curae : pionnière des sciences naturelles
  ('saint-hildegard-of-bingen',           'WRITERS_AUTHORS',      'TRD'),  -- visions, poèmes, théologie : œuvre littéraire exceptionnelle

  ('saint-john-of-avila',                 'CATECHISTS',           'TRD'),

  ('saint-john-damascene',                'PAINTERS_ARTISTS',     'TRD'),

  ('saint-robert-bellarmine',             'CATECHISTS',           'TRD'),

  ('saint-alphonsus-liguori',             'THEOLOGIANS',          'TRD'),
  ('saint-alphonsus-liguori',             'CLERGY',               'TRD'),
  ('saint-alphonsus-liguori',             'CATECHISTS',           'TRD'),  -- fonda les Rédemptoristes pour la prédication populaire

  ('saint-bede-the-venerable',            'TRANSLATORS',          'TRD'),
  ('saint-bede-the-venerable',            'WRITERS_AUTHORS',      'TRD'),  -- Historia Ecclesiastica, premier historien de l'Église d'Angleterre

  ('saint-cyril-of-jerusalem',            'CATECHISTS',           'TRD'),

  ('saint-peter-chrysologus',             'THEOLOGIANS',          'TRD'),

  ('saint-john-henry-newman',             'THEOLOGIANS',          'TRD'),
  ('saint-john-henry-newman',             'CONVERTS',             'TRD'),

  ('saint-therese-of-the-child-jesus',    'MISSIONARIES',         'OFF'),  -- Pie XI, 1927
  ('saint-therese-of-the-child-jesus',    'FRANCE',               'TRD'),
  ('saint-therese-of-the-child-jesus',    'MISSIONS',             'OFF'),  -- 1927


  ('saint-teresa-of-jesus',               'THEOLOGIANS',          'TRD'),
  ('saint-teresa-of-jesus',               'SICK',                 'TRD'),  -- souffrit de maladies graves toute sa vie

  ('saint-gregory-of-narek',              'THEOLOGIANS',          'TRD'),

  -- ── FONDATEURS D'ORDRES ──────────────────────────────────────────────────
  ('saint-benedict',                      'EUROPE',               'OFF'),  -- Paul VI, 1964
  ('saint-benedict',                      'FARMERS_GARDENERS',    'TRD'),
  ('saint-benedict',                      'STUDENTS',             'TRD'),  -- écoles monastiques, berceau de l'enseignement en Europe
  ('saint-benedict',                      'POOR',                 'TRD'),  -- hospitalité bénédictine, accueil des pauvres et voyageurs

  ('saint-cyril',                         'EUROPE',               'OFF'),  -- Jean-Paul II, 1980
  ('saint-cyril',                         'TRANSLATORS',          'TRD'),  -- créa l'alphabet glagolitique pour traduire les Écritures

  ('saint-methodius',                     'EUROPE',               'OFF'),  -- Jean-Paul II, 1980
  ('saint-methodius',                     'TRANSLATORS',          'TRD'),  -- même mission que Cyrille

  ('saint-bridget',                       'EUROPE',               'OFF'),  -- Jean-Paul II, 1999
  ('saint-bridget',                       'SWEDEN',               'TRD'),
  ('saint-bridget',                       'PILGRIMS',             'TRD'),
  ('saint-bridget',                       'WIDOWS',               'TRD'),
  ('saint-bridget',                       'WRITERS_AUTHORS',      'TRD'),  -- Revelationes Caelestes, œuvre mystique majeure en 8 livres

  ('saint-catherine-of-siena',            'EUROPE',               'OFF'),  -- Jean-Paul II, 1999
  ('saint-catherine-of-siena',            'ITALY',                'OFF'),  -- Pie XII, 1939
  ('saint-catherine-of-siena',            'NURSES_CAREGIVERS',    'TRD'),

  ('saint-teresa-benedicta-of-the-cross', 'EUROPE',               'OFF'),  -- Jean-Paul II, 1999
  ('saint-teresa-benedicta-of-the-cross', 'PHILOSOPHERS',         'TRD'),  -- phénoménologue, élève de Husserl
  ('saint-teresa-benedicta-of-the-cross', 'CONVERTS',             'TRD'),  -- convertie du judaïsme, modèle de la conversion intellectuelle

  ('saint-francis-of-assisi',             'ITALY',                'OFF'),  -- Pie XII, 1939
  ('saint-francis-of-assisi',             'ECOLOGY_ENVIRONMENT',  'OFF'),  -- Jean-Paul II, 1979
  ('saint-francis-of-assisi',             'POOR',                 'TRD'),
  ('saint-francis-of-assisi',             'PEACE',                'TRD'),

  ('saint-dominic',                       'THEOLOGIANS',          'TRD'),
  ('saint-dominic',                       'MISSIONARIES',         'TRD'),  -- envoya ses frères prêcher et convertir
  ('saint-dominic',                       'CATECHISTS',           'TRD'),  -- combat des hérésies par le catéchisme et la prédication

  ('saint-ignatius-of-loyola',            'SOLDIERS',             'TRD'),
  ('saint-ignatius-of-loyola',            'MISSIONARIES',         'TRD'),
  ('saint-ignatius-of-loyola',            'TEACHERS',             'TRD'),  -- les jésuites fondèrent des centaines de collèges
  ('saint-ignatius-of-loyola',            'STUDENTS',             'TRD'),  -- la Ratio Studiorum : système éducatif jésuite de référence
  ('saint-ignatius-of-loyola',            'THEOLOGIANS',          'TRD'),  -- Exercices spirituels, père de la théologie ascétique moderne

  ('saint-john-bosco',                    'YOUTH',                'OFF'),  -- Pie XI
  ('saint-john-bosco',                    'EDITORS_PRINTERS',     'TRD'),
  ('saint-john-bosco',                    'TEACHERS',             'TRD'),  -- méthode préventive, système éducatif salésien
  ('saint-john-bosco',                    'SOCIAL_WORKERS',       'TRD'),  -- œuvres sociales pour les jeunes défavorisés de Turin

  ('saint-angela-merici',                 'TEACHERS',             'TRD'),

  ('saint-john-baptist-de-la-salle',      'TEACHERS',             'OFF'),  -- Léon XIII, 1900
  ('saint-john-baptist-de-la-salle',      'STUDENTS',             'TRD'),

  ('saint-joseph-calasanz',               'TEACHERS',             'OFF'),  -- Pie XII, 1948
  ('saint-joseph-calasanz',               'STUDENTS',             'TRD'),

  ('saint-vincent-de-paul',               'POOR',                 'TRD'),
  ('saint-vincent-de-paul',               'PRISONERS',            'TRD'),
  ('saint-vincent-de-paul',               'SOCIAL_WORKERS',       'TRD'),
  ('saint-vincent-de-paul',               'CLERGY',               'TRD'),  -- fonda les Lazaristes pour la formation du clergé
  ('saint-vincent-de-paul',               'MISSIONARIES',         'TRD'),  -- envoya des missionnaires en France rurale et à Madagascar
  ('saint-vincent-de-paul',               'CHARITY_WORKS',    	  'TRD'),

  ('saint-john-vianney',                  'CLERGY',               'OFF'),  -- Pie XI, 1929

  ('saint-john-of-god',                   'SICK',                 'OFF'),  -- Léon XIII, 1886
  ('saint-john-of-god',                   'NURSES_CAREGIVERS',    'OFF'),  -- Léon XIII, 1886

  ('saint-camillus-de-lellis',            'SICK',                 'OFF'),  -- Léon XIII, 1886
  ('saint-camillus-de-lellis',            'NURSES_CAREGIVERS',    'OFF'),  -- Léon XIII, 1886

  ('saint-aloysius-gonzaga',              'YOUTH',                'OFF'),  -- Benoît XIII, 1729

  ('saint-rita-of-cascia',                'DESPERATE_CASES',      'TRD'),
  ('saint-rita-of-cascia',                'WIDOWS',               'TRD'),
  ('saint-rita-of-cascia',                'ABUSE_VICTIMS',        'TRD'),

  ('saint-elizabeth-of-hungary',          'POOR',                 'TRD'),
  ('saint-elizabeth-of-hungary',          'NURSES_CAREGIVERS',    'TRD'),
  ('saint-elizabeth-of-hungary',          'WIDOWS',               'TRD'),
  ('saint-elizabeth-of-hungary',          'SOCIAL_WORKERS',       'TRD'),  -- organisa des hôpitaux et une charité systématique

  ('saint-margaret-of-scotland',          'SCOTLAND',             'TRD'),
  ('saint-margaret-of-scotland',          'MOTHERS',              'TRD'),  -- mère de huit enfants élevés dans la piété
  ('saint-margaret-of-scotland',          'FAMILIES',             'TRD'),  -- modèle de la vie familiale chrétienne

  ('saint-teresa-of-calcutta',            'POOR',                 'TRD'),
  ('saint-teresa-of-calcutta',            'IMMIGRANTS_REFUGEES',  'TRD'),
  ('saint-teresa-of-calcutta',            'SOCIAL_WORKERS',       'TRD'),
  ('saint-teresa-of-calcutta',            'SICK',                 'TRD'),  -- Missionnaires de la Charité pour les mourants
  ('saint-teresa-of-calcutta',            'NURSES_CAREGIVERS',    'TRD'),  -- ses sœurs soignaient les démunis malades abandonnés
  ('saint-teresa-of-calcutta',            'CHARITY_WORKS',        'TRD'),

  ('saint-jerome-emiliani',               'ORPHANS',              'TRD'),

  ('saint-peter-claver',                  'ENSLAVED_PEOPLE',      'TRD'),
  ('saint-peter-claver',                  'MISSIONARIES',         'TRD'),  -- missionnaire jésuite, 40 ans au service des esclaves africains
  ('saint-peter-claver',                  'POOR',                 'TRD'),  -- servit les plus démunis parmi les esclaves débarqués à Carthagène

  ('saint-josephine-bakhita',             'ENSLAVED_PEOPLE',      'TRD'),
  ('saint-josephine-bakhita',             'IMMIGRANTS_REFUGEES',  'TRD'),
  ('saint-josephine-bakhita',             'ABUSE_VICTIMS',        'TRD'),

  ('saint-rose-of-lima',                  'PERU',                 'TRD'),
  ('saint-rose-of-lima',                  'LATIN_AMERICA',        'TRD'),
  ('saint-rose-of-lima',                  'AMERICAS',             'TRD'),

  ('saint-francis-xavier',                'MISSIONARIES',         'OFF'),  -- Benoît XV, 1927
  ('saint-francis-xavier',                'JAPAN',                'TRD'),
  ('saint-francis-xavier',                'INDIA',                'TRD'),
  ('saint-francis-xavier',                'SAILORS',              'TRD'),
  ('saint-francis-xavier',                'OCEANIA',              'TRD'),
  ('saint-francis-xavier',                'MISSIONS',             'OFF'),

  ('saint-peter-chanel',                  'OCEANIA',              'TRD'),

  ('saint-columban',                      'MISSIONARIES',         'TRD'),
  ('saint-columban',                      'FARMERS_GARDENERS',    'TRD'),
  ('saint-columban',                      'PILGRIMS',             'TRD'),  -- archétype du peregrinatio pro Christo, pèlerin d'Irlande en Italie

  ('saint-romuald',                       'FARMERS_GARDENERS',    'TRD'),

  ('saint-faustina-kowalska',             'POOR',                 'TRD'),
  ('saint-faustina-kowalska',             'SICK',                 'TRD'),  -- offrit ses souffrances (tuberculose) pour les pécheurs

  ('saint-philip-neri',                   'YOUTH',                'TRD'),
  ('saint-philip-neri',                   'ROME',                 'TRD'),
  ('saint-philip-neri',                   'MUSICIANS',            'TRD'),  -- fonda l'Oratorio, berceau de la musique sacrée populaire
  ('saint-philip-neri',                   'PILGRIMS',             'TRD'),  -- organisa le pèlerinage des Sept Églises de Rome
  ('saint-philip-neri',                   'CLERGY',               'TRD'),  -- fonda l'Oratoire pour la formation des prêtres séculiers

  ('saint-norbert',                       'CLERGY',               'TRD'),
  ('saint-norbert',                       'MISSIONARIES',         'TRD'),  -- évangélisa Anvers et de nombreuses régions d'Europe du Nord

  -- ── AUTRES SAINTS ────────────────────────────────────────────────────────
  ('saint-monica',                        'MOTHERS',              'TRD'),
  ('saint-monica',                        'WIDOWS',               'TRD'),
  ('saint-monica',                        'CONVERTS',             'TRD'),

  ('saint-anne',                          'GRANDPARENTS',         'TRD'),
  ('saint-anne',                          'MOTHERS',              'TRD'),
  ('saint-anne',                          'MARRIED_COUPLES',      'TRD'),
  ('saint-anne',                          'ELDERLY',              'TRD'),
  ('saint-anne',                          'TEACHERS',             'TRD'),  -- enseigna la foi à la Vierge Marie ; patronne des catéchètes familiaux

  ('saint-joachim',                       'GRANDPARENTS',         'TRD'),
  ('saint-joachim',                       'FATHERS',              'TRD'),
  ('saint-joachim',                       'MARRIED_COUPLES',      'TRD'),

  ('saint-mary-magdalene',                'PHARMACISTS',          'TRD'),
  ('saint-mary-magdalene',                'CONVERTS',             'TRD'),
  ('saint-mary-magdalene',                'PILGRIMS',             'TRD'),  -- Sainte-Baume (Provence) : pèlerinage majeur depuis le Moyen Âge

  ('saint-martha-of-bethany',             'COOKS',                'TRD'),
  ('saint-martha-of-bethany',             'SOCIAL_WORKERS',       'TRD'),
  ('saint-martha-of-bethany',             'NURSES_CAREGIVERS',    'TRD'),  -- servit et soigna ses hôtes ; modèle du service des malades

  ('saint-lazarus-of-bethany',            'POOR',                 'TRD'),
  ('saint-lazarus-of-bethany',            'SICK',                 'TRD'),

  ('saint-mary-of-bethany',               'THEOLOGIANS',          'TRD'),

  ('saint-anthony-of-padua',              'LOST_ITEMS',           'TRD'),
  ('saint-anthony-of-padua',              'POOR',                 'TRD'),
  ('saint-anthony-of-padua',              'PORTUGAL',             'TRD'),
  ('saint-anthony-of-padua',              'FISHERMEN',            'TRD'),
  ('saint-anthony-of-padua',              'MISSIONARIES',         'TRD'),  -- frère mineur envoyé en mission au Maroc puis en Italie du Nord

  ('saint-paul-of-the-cross',             'MISSIONARIES',         'TRD'),

  ('saint-januarius',                     'POOR',                 'TRD'),

  ('saint-catherine-alexandria',          'PHILOSOPHERS',         'TRD'),  -- Patronne des philosophes, célèbre pour sa sagesse et sa disputation avec les philosophes païens
  ('saint-catherine-alexandria',          'STUDENTS',          	  'TRD')

) AS pairs(saint_slug, patronage_code, source_type)
JOIN saints     s ON s.slug  = pairs.saint_slug
JOIN patronages p ON p.code  = pairs.patronage_code
ON CONFLICT (saint_id, patronage_id) DO UPDATE SET source_type = EXCLUDED.source_type;

COMMIT;
