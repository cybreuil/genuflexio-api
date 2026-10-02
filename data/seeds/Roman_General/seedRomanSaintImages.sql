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

-- =========================
-- Principal Roman saints (Mary, Joseph, John the Baptist)
-- =========================

-- Saint Mary
('saint-mary', '/saints/saint-mary_tiepolo.webp', 1, TRUE, 'subject'),
('saint-mary', '/saints/saint-mary_velazquez.webp', 2, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_caravaggio_annunciation.webp', 3, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_raphael.webp', 4, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_caravaggio_madonna-di-loreto.webp', 5, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_caravaggio_madonna-of-the-rosary.webp', 6, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_botticelli_madonna-of-the-book.webp', 7, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_botticelli_magnificat.webp', 8, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_sassoferrato.webp', 9, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_murillo.webp', 10, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_guido-reni.webp', 11, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_caravaggio_dormition.webp', 12, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_velazquez_adoration.webp', 13, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_champaigne.webp', 14, FALSE, 'subject'),
('saint-mary', '/saints/saint-mary_gentileschi_annunciation.webp', 15, FALSE, 'subject'),

-- Saint Joseph
('saint-joseph', '/saints/saint-joseph_guido-reni.webp', 1, TRUE, 'subject'),
('saint-joseph', '/saints/saint-joseph_carracci.webp', 2, FALSE, 'subject'),
('saint-joseph', '/saints/saint-joseph_murillo.webp', 3, FALSE, 'subject'),
('saint-joseph', '/saints/saint-joseph_murillo_holy-family.webp', 4, FALSE, 'subject'),
('saint-joseph', '/saints/saint-joseph_la-tour.webp', 5, FALSE, 'subject'),
('saint-joseph', '/saints/saint-joseph_champaigne.webp', 6, FALSE, 'subject'),
('saint-joseph', '/saints/saint-joseph_briggs.webp', 7, FALSE, 'subject'),

-- Saint John the Baptist
('saint-john-the-baptist', '/saints/saint-john-the-baptist_caravaggio.webp', 1, TRUE, 'subject'),
('saint-john-the-baptist', '/saints/saint-john-the-baptist_leonardo-da-vinci.webp', 2, FALSE, 'subject'),
('saint-john-the-baptist', '/saints/saint-john-the-baptist_lemoine.webp', 3, FALSE, 'subject'),
('saint-john-the-baptist', '/saints/saint-john-the-baptist_tanzio.webp', 4, FALSE, 'subject'),

-- =========================
-- January saints
-- =========================

-- Saint Basil the Great
('saint-basil-the-great', '/saints/saint-basil-the-great_domenichino_grottaferrata.webp', 1, TRUE, 'subject'),
('saint-basil-the-great', '/saints/saint-basil-the-great.webp', 2, FALSE, 'subject'),
('saint-basil-the-great', '/saints/saint-basil-the-great_mosaic.webp', 3, FALSE, 'subject'),

-- Saint Gregory Nazianzen
('saint-gregory-nazianzen', '/saints/saint-gregory-nazianzen_domenichino_grottaferrata.webp', 1, TRUE, 'subject'),
('saint-gregory-nazianzen', '/saints/saint-gregory-nazianzen.webp', 2, FALSE, 'subject'),

-- Saint Raymond of Penyafort
('saint-raymond-of-penyafort', '/saints/saint-raymond-of-penyafort_francisco-de-reyna.webp', 1, TRUE, 'subject'),
('saint-raymond-of-penyafort', '/saints/saint-raymond-of-penyafort_tommaso-dolabella.webp', 2, FALSE, 'subject'),

-- Saint Hilary of Poitiers
('saint-hilary-of-poitiers', '/saints/saint-hilary-of-poitiers_cremiere.webp', 1, TRUE, 'subject'),
('saint-hilary-of-poitiers', '/saints/saint-hilary-of-poitiers.webp', 2, FALSE, 'subject'),

-- Saint Anthony, Abbot
('saint-anthony-abbot', '/saints/saint-anthony-abbot_zurbaran.webp', 1, TRUE, 'subject'),
('saint-anthony-abbot', '/saints/saint-anthony-abbot_icon.webp', 2, FALSE, 'subject'),
('saint-anthony-abbot', '/saints/saint-anthony-abbot_osservanza-master_gold-temptation.webp', 3, FALSE, 'subject'),
('saint-anthony-abbot', '/saints/saint-anthony-abbot_osservanza-master_woman-temptation.webp', 4, FALSE, 'subject'),
('saint-anthony-abbot', '/saints/saint-anthony-abbot_bosch.webp', 5, FALSE, 'subject'),
('saint-anthony-abbot', '/saints/saint-anthony-abbot-&-cornelius-&-cyprian_veronese.webp', 6, FALSE, 'subject'),

-- Saint Fabian Pope
('saint-fabian-pope', '/saints/saint-fabian-pope.webp', 1, TRUE, 'subject'),
('saint-fabian-pope', '/saints/saint-fabian-pope_master-of-messkirch.webp', 2, FALSE, 'subject'),

-- Saint Sebastian
('saint-sebastian', '/saints/saint-sebastian_sodoma.webp', 1, TRUE, 'subject'),
('saint-sebastian', '/saints/saint-sebastian_guido-reni.webp', 2, FALSE, 'subject'),
('saint-sebastian', '/saints/saint-sebastian_ribera.webp', 3, FALSE, 'subject'),
('saint-sebastian', '/saints/saint-sebastian_rubens.webp', 4, FALSE, 'subject'),

-- Saint Agnes of Rome
('saint-agnes-of-rome', '/saints/saint-agnes-of-rome_domenichino.webp', 1, TRUE, 'subject'),
('saint-agnes-of-rome', '/saints/saint-agnes-of-rome_massimo-stanzione.webp', 2, FALSE, 'subject'),
('saint-agnes-of-rome', '/saints/saint-agnes-of-rome_andrea-del-sarto.webp', 3, FALSE, 'subject'),

-- Saint Vincent of Saragossa
('saint-vincent-of-saragossa', '/saints/saint-vincent-of-saragossa_tomas-giner.webp', 1, TRUE, 'subject'),
('saint-vincent-of-saragossa', '/saints/saint-vincent-of-saragossa_school-of-francisco-ribalta.webp', 2, FALSE, 'subject'),

-- Saint Francis de Sales
('saint-francis-de-sales', '/saints/saint-francis-de-sales.webp', 1, TRUE, 'subject'),
('saint-francis-de-sales', '/saints/saint-francis-de-sales_2.webp', 2, FALSE, 'subject'),
('saint-francis-de-sales', '/saints/saint-francis-de-sales_briggs.webp', 3, FALSE, 'subject'),
('saint-francis-de-sales', '/saints/saint-francis-de-sales_brenet.webp', 4, FALSE, 'subject'),
('saint-francis-de-sales', '/saints/saint-francis-de-sales-&-jane-frances-de-chantal_bayeu.webp', 5, FALSE, 'subject'),
('saint-francis-de-sales', '/saints/saint-francis-de-sales-&-jane-frances-de-chantal_halle.webp', 6, FALSE, 'subject'),
('saint-francis-de-sales', '/saints/saint-francis-de-sales-&-jane-frances-de-chantal.webp', 7, FALSE, 'subject'),

-- Saint Paul, Apostle
('saint-paul-apostle', '/saints/saint-paul-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_ribera.webp', 2, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_velasquez.webp', 3, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_zurbaran.webp', 4, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_dyck.webp', 5, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_caravaggio_conversion.webp', 6, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_rembrandt_prison.webp', 7, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_rembrandt.webp', 8, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_la-tour.webp', 9, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_guercino.webp', 10, FALSE, 'subject'),
('saint-paul-apostle', '/saints/saint-paul-apostle_guercino_2.webp', 11, FALSE, 'subject'),

-- Saint Timothy of Ephesus
('saint-timothy-of-ephesus', '/saints/saint-timothy-of-ephesus_icon.webp', 1, TRUE, 'subject'),
('saint-timothy-of-ephesus', '/saints/saint-timothy-of-ephesus_drost_timothy-with-grandmother-lois.webp', 2, FALSE, 'subject'),
('saint-timothy-of-ephesus', '/saints/saint-timothy-of-ephesus.webp', 3, FALSE, 'subject'),

-- Saint Titus of Crete
('saint-titus-of-crete', '/saints/saint-titus-of-crete_icon.webp', 1, TRUE, 'subject'),
('saint-titus-of-crete', '/saints/saint-titus-of-crete.webp', 2, FALSE, 'subject'),

-- Saint Angela Merici
('saint-angela-merici', '/saints/saint-angela-merici.webp', 1, TRUE, 'subject'),
('saint-angela-merici', '/saints/saint-angela-merici_crucifix.webp', 2, FALSE, 'subject'),

-- Saint Thomas Aquinas
('saint-thomas-aquinas', '/saints/saint-thomas-aquinas.webp', 1, TRUE, 'subject'),
('saint-thomas-aquinas', '/saints/saint-thomas-aquinas_velasquez_temptation.webp', 2, FALSE, 'subject'),
('saint-thomas-aquinas', '/saints/saint-thomas-aquinas_tito.webp', 3, FALSE, 'subject'),
('saint-thomas-aquinas', '/saints/saint-thomas-aquinas_zurbaran.webp', 4, FALSE, 'subject'),

-- Saint John Bosco
('saint-john-bosco', '/saints/saint-john-bosco_painting-from-picture.webp', 1, TRUE, 'subject'),
('saint-john-bosco', '/saints/saint-john-bosco_picture.webp', 2, FALSE, 'subject'),

-- =========================
-- February saints
-- =========================

-- Saint Blaise
('saint-blaise', '/saints/saint-blaise_trotti.webp', 1, TRUE, 'subject'),
('saint-blaise', '/saints/saint-blaise_tiepolo.webp', 2, FALSE, 'subject'),

-- Saint Ansgar
('saint-ansgar', '/saints/saint-ansgar.webp', 1, TRUE, 'subject'),

-- Saint Agatha
('saint-agatha', '/saints/saint-agatha.webp', 1, TRUE, 'subject'),
('saint-agatha', '/saints/saint-agatha_tiepolo.webp', 2, FALSE, 'subject'),

-- Saint Paul Miki
('saint-paul-miki', '/saints/saint-paul-miki_tanzio.webp', 1, TRUE, 'subject'),
('saint-paul-miki', '/saints/saint-paul-miki.webp', 2, FALSE, 'subject'),

-- Saint Jerome Emiliani
('saint-jerome-emiliani', '/saints/saint-jerome-emiliani_traverso.webp', 1, TRUE, 'subject'),
('saint-jerome-emiliani', '/saints/saint-jerome-emiliani_crespi.webp', 2, FALSE, 'subject'),
('saint-jerome-emiliani', '/saints/saint-jerome-emiliani.webp', 3, FALSE, 'subject'),
('saint-jerome-emiliani', '/saints/saint-jerome-emiliani_2.webp', 4, FALSE, 'subject'),

-- Saint Josephine Bakhita
('saint-josephine-bakhita', '/saints/saint-josephine-bakhita_ferreira.webp', 1, TRUE, 'subject'),
('saint-josephine-bakhita', '/saints/saint-josephine-bakhita_warford_no-watermark.webp', 2, FALSE, 'subject'),
('saint-josephine-bakhita', '/saints/saint-josephine-bakhita.webp', 3, FALSE, 'subject'),

-- Saint Scholastica
('saint-scholastica', '/saints/saint-scholastica_bergl.webp', 1, TRUE, 'subject'),
('saint-scholastica', '/saints/saint-scholastica.webp', 2, FALSE, 'subject'),
('saint-scholastica', '/saints/saint-scholastica_sassoferrato.webp', 3, FALSE, 'subject'),
('saint-scholastica', '/saints/saint-scholastica_briggs.webp', 4, FALSE, 'subject'),
('saint-scholastica', '/saints/saint-benedict-&-scholastica.webp', 5, FALSE, 'subject'),

-- Saint Cyril
('saint-cyril', '/saints/saint-cyril.webp', 1, TRUE, 'subject'),
('saint-cyril', '/saints/saint-cyril-&-methodius.webp', 2, FALSE, 'subject'),
('saint-cyril', '/saints/saint-cyril-&-methodius_2.webp', 3, FALSE, 'subject'),
('saint-cyril', '/saints/saint-cyril-&-methodius_3.webp', 4, FALSE, 'subject'),

-- Saint Methodius
('saint-methodius', '/saints/saint-methodius.webp', 1, TRUE, 'subject'),
('saint-methodius', '/saints/saint-cyril-&-methodius.webp', 2, FALSE, 'subject'),
('saint-methodius', '/saints/saint-cyril-&-methodius_2.webp', 3, FALSE, 'subject'),
('saint-methodius', '/saints/saint-cyril-&-methodius_3.webp', 4, FALSE, 'subject'),

-- Saint Peter Damian
('saint-peter-damian', '/saints/saint-peter-damian.webp', 1, TRUE, 'subject'),
('saint-peter-damian', '/saints/saint-peter-damian_briggs.webp', 2, FALSE, 'subject'),

-- Saint Polycarp
('saint-polycarp', '/saints/saint-polycarp.webp', 1, TRUE, 'subject'),
('saint-polycarp', '/saints/saint-polycarp_2.webp', 2, FALSE, 'subject'),
('saint-polycarp', '/saints/saint-polycarp_3.webp', 3, FALSE, 'subject'),

-- Saint Gregory of Narek
('saint-gregory-of-narek', '/saints/saint-gregory-of-narek_minin.webp', 1, TRUE, 'subject'),
('saint-gregory-of-narek', '/saints/saint-gregory-of-narek.webp', 2, FALSE, 'subject'),

-- =========================
-- March saints
-- =========================

-- Saint Casimir
('saint-casimir', '/saints/saint-casimir_masucci.webp', 1, TRUE, 'subject'),
('saint-casimir', '/saints/saint-casimir_collenius.webp', 2, FALSE, 'subject'),
('saint-casimir', '/saints/saint-casimir.webp', 3, FALSE, 'subject'),

-- Saint Perpetua
('saint-perpetua', '/saints/saint-perpetua_ridolfi.webp', 1, TRUE, 'subject'),
('saint-perpetua', '/saints/saint-perpetua_bouguereau.webp', 2, FALSE, 'subject'),
('saint-perpetua', '/saints/saint-perpetua_mosaic.webp', 3, FALSE, 'subject'),
('saint-perpetua', '/saints/saint-perpetua-&-felicity.webp', 4, FALSE, 'subject'),
('saint-perpetua', '/saints/saint-perpetua_martyr.webp', 5, FALSE, 'subject'),
('saint-perpetua', '/saints/saint-perpetua-&-felicity_2.webp', 6, FALSE, 'subject'),
('saint-perpetua', '/saints/saint-perpetua-&-felicity_3.webp', 7, FALSE, 'subject'),

-- Saint Felicity
('saint-felicity', '/saints/saint-perpetua-&-felicity.webp', 1, TRUE, 'subject'),
('saint-felicity', '/saints/saint-perpetua-&-felicity_2.webp', 2, FALSE, 'subject'),
('saint-felicity', '/saints/saint-perpetua-&-felicity_3.webp', 3, FALSE, 'subject'),

-- Saint John of God
('saint-john-of-god', '/saints/saint-john-of-god_murillo.webp', 1, TRUE, 'subject'),
('saint-john-of-god', '/saints/saint-john-of-god_coello.webp', 2, FALSE, 'subject'),
('saint-john-of-god', '/saints/saint-john-of-god_gonzalez.webp', 3, FALSE, 'subject'),

-- Saint Frances of Rome
('saint-frances-of-rome', '/saints/saint-frances-of-rome_sparadino.webp', 1, TRUE, 'subject'),
('saint-frances-of-rome', '/saints/saint-frances-of-rome_gentileschi.webp', 2, FALSE, 'subject'),
('saint-frances-of-rome', '/saints/saint-frances-of-rome_poussin.webp', 3, FALSE, 'subject'),
('saint-frances-of-rome', '/saints/saint-frances-of-rome.webp', 4, FALSE, 'subject'),

-- Saint Patrick
('saint-patrick', '/saints/saint-patrick.webp', 1, TRUE, 'subject'),
('saint-patrick', '/saints/saint-patrick_tiepolo.webp', 2, FALSE, 'subject'),
('saint-patrick', '/saints/saint-patrick_collaert.webp', 3, FALSE, 'subject'),
('saint-patrick', '/saints/saint-patrick_stained-glass.webp', 4, FALSE, 'subject'),

-- Saint Cyril of Jerusalem
('saint-cyril-of-jerusalem', '/saints/saint-cyril-of-jerusalem_bartolozzi.webp', 1, TRUE, 'subject'),
('saint-cyril-of-jerusalem', '/saints/saint-cyril-of-jerusalem.webp', 2, FALSE, 'subject'),
('saint-cyril-of-jerusalem', '/saints/saint-cyril-of-jerusalem_2.webp', 3, FALSE, 'subject'),

-- Saint Turibius of Mogrovejo
('saint-turibius-of-mogrovejo', '/saints/saint-turibius-of-mogrovejo.webp', 1, TRUE, 'subject'),
('saint-turibius-of-mogrovejo', '/saints/saint-turibius-of-mogrovejo_conca.webp', 2, FALSE, 'subject'),

-- =========================
-- April saints
-- =========================

-- Saint Francis of Paola
('saint-francis-of-paola', '/saints/saint-francis-of-paola_ribera.webp', 1, TRUE, 'subject'),
('saint-francis-of-paola', '/saints/saint-francis-of-paola_bianchi.webp', 2, FALSE, 'subject'),
('saint-francis-of-paola', '/saints/saint-francis-of-paola_gandolfi.webp', 3, FALSE, 'subject'),
('saint-francis-of-paola', '/saints/saint-francis-of-paola_giordano.webp', 4, FALSE, 'subject'),

-- Saint Isidore
('saint-isidore', '/saints/saint-isidore_murillo.webp', 1, TRUE, 'subject'),
('saint-isidore', '/saints/saint-isidore_pacully.webp', 2, FALSE, 'subject'),

-- Saint Vincent Ferrer
('saint-vincent-ferrer', '/saints/saint-vincent-ferrer_miranda.webp', 1, TRUE, 'subject'),
('saint-vincent-ferrer', '/saints/saint-vincent-ferrer_pace.webp', 2, FALSE, 'subject'),
('saint-vincent-ferrer', '/saints/saint-vincent-ferrer_cano.webp', 3, FALSE, 'subject'),
('saint-vincent-ferrer', '/saints/saint-vincent-ferrer_juanes.webp', 4, FALSE, 'subject'),

-- Saint John Baptist de La Salle
('saint-john-baptist-de-la-salle', '/saints/saint-john-baptist-de-la-salle.webp', 1, TRUE, 'subject'),
('saint-john-baptist-de-la-salle', '/saints/saint-john-baptist-de-la-salle_muller.webp', 2, FALSE, 'subject'),
('saint-john-baptist-de-la-salle', '/saints/saint-john-baptist-de-la-salle_2.webp', 3, FALSE, 'subject'),

-- Saint Stanislaus
('saint-stanislaus', '/saints/saint-stanislaus_samostrzelnik.webp', 1, TRUE, 'subject'),
('saint-stanislaus', '/saints/saint-stanislaus.webp', 2, FALSE, 'subject'),

-- Saint Martin I
('saint-martin-i', '/saints/saint-martin-i_montor.webp', 1, TRUE, 'subject'),
('saint-martin-i', '/saints/saint-martin-i_stained-glass.webp', 2, FALSE, 'subject'),
('saint-martin-i', '/saints/saint-martin-i.webp', 3, FALSE, 'subject'),

-- Saint Anselm
('saint-anselm', '/saints/saint-anselm_glover.webp', 1, TRUE, 'subject'),
('saint-anselm', '/saints/saint-anselm.webp', 2, FALSE, 'subject'),

-- Saint George
('saint-george', '/saints/saint-george_raphael.webp', 1, TRUE, 'subject'),
('saint-george', '/saints/saint-george_martorell.webp', 2, FALSE, 'subject'),
('saint-george', '/saints/saint-george_rubens.webp', 3, FALSE, 'subject'),
('saint-george', '/saints/saint-george_moreau.webp', 4, FALSE, 'subject'),
('saint-george', '/saints/saint-george_schut.webp', 5, FALSE, 'subject'),
('saint-george', '/saints/saint-george_domenichino.webp', 6, FALSE, 'subject'),
('saint-george', '/saints/saint-george_icon.webp', 7, FALSE, 'subject'),

-- Saint Adalbert
('saint-adalbert', '/saints/saint-adalbert_kovacz.webp', 1, TRUE, 'subject'),
('saint-adalbert', '/saints/saint-adalbert-&-procopius.webp', 2, FALSE, 'subject'),

-- Saint Fidelis of Sigmaringen
('saint-fidelis-of-sigmaringen', '/saints/saint-fidelis-of-sigmaringen.webp', 1, TRUE, 'subject'),
('saint-fidelis-of-sigmaringen', '/saints/saint-fidelis-of-sigmaringen.webp', 2, FALSE, 'subject'),
('saint-fidelis-of-sigmaringen', '/saints/saint-fidelis-of-sigmaringen-&-joseph-of-leonessa_tiepolo.webp', 3, FALSE, 'subject'),

-- Saint Mark the Evangelist
('saint-mark-evangelist', '/saints/saint-mark-evangelist_hals.webp', 1, TRUE, 'subject'),
('saint-mark-evangelist', '/saints/saint-mark-evangelist_borovikovsky.webp', 2, FALSE, 'subject'),
('saint-mark-evangelist', '/saints/saint-mark-evangelist_tintoretto_finding.webp', 3, FALSE, 'subject'),
('saint-mark-evangelist', '/saints/saint-mark-evangelist_tintoretto_translation.webp', 4, FALSE, 'subject'),

-- Saint Peter Chanel
('saint-peter-chanel', '/saints/saint-peter-chanel.webp', 1, TRUE, 'subject'),
('saint-peter-chanel', '/saints/saint-peter-chanel_nicolet.webp', 2, FALSE, 'subject'),

-- Saint Louis Grignion de Montfort
('saint-louis-grignion-de-montfort', '/saints/saint-louis-grignion-de-montfort.webp', 1, TRUE, 'subject'),
('saint-louis-grignion-de-montfort', '/saints/saint-louis-grignion-de-montfort_2.webp', 2, FALSE, 'subject'),
('saint-louis-grignion-de-montfort', '/saints/saint-louis-grignion-de-montfort_3.webp', 3, FALSE, 'subject'),

-- Saint Catherine of Siena
('saint-catherine-of-siena', '/saints/saint-catherine-of-siena_dolci.webp', 1, TRUE, 'subject'),
('saint-catherine-of-siena', '/saints/saint-catherine-of-siena_tiepolo.webp', 2, FALSE, 'subject'),
('saint-catherine-of-siena', '/saints/saint-catherine-of-siena.webp', 3, FALSE, 'subject'),
('saint-catherine-of-siena', '/saints/saint-catherine-of-siena-&-rose-of-lima-&-agnes-of-montepulciano_tiepolo.webp', 4, FALSE, 'subject'),
('saint-catherine-of-siena', '/saints/saint-catherine-of-siena_sassoferrato.webp', 5, FALSE, 'subject'),

-- Saint Pius V
('saint-pius-v', '/saints/saint-pius-v_passarotti.webp', 1, TRUE, 'subject'),
('saint-pius-v', '/saints/saint-pius-v_giovane.webp', 2, FALSE, 'subject'),
('saint-pius-v', '/saints/saint-pius-v.webp', 3, FALSE, 'subject'),

-- =========================
-- May saints
-- =========================

-- Saint Athanasius
('saint-athanasius', '/saints/saint-athanasius_domenichino_grottaferrata.webp', 1, TRUE, 'subject'),
('saint-athanasius', '/saints/saint-athanasius_solimena.webp', 2, FALSE, 'subject'),
('saint-athanasius', '/saints/saint-athanasius_icon.webp', 3, FALSE, 'subject'),

-- Saint Philip, Apostle
('saint-philip-apostle', '/saints/saint-philip-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-philip-apostle', '/saints/saint-philip-apostle_la-tour.webp', 2, FALSE, 'subject'),
('saint-philip-apostle', '/saints/saint-philip-apostle_ribera.webp', 3, FALSE, 'subject'),
('saint-philip-apostle', '/saints/saint-philip-apostle_dyck.webp', 4, FALSE, 'subject'),

-- Saint James the Less, Apostle
('saint-james-the-less-apostle', '/saints/saint-james-the-less-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-james-the-less-apostle', '/saints/saint-james-the-less-apostle_la-tour.webp', 2, FALSE, 'subject'),
('saint-james-the-less-apostle', '/saints/saint-james-the-less-apostle_ribera.webp', 3, FALSE, 'subject'),
('saint-james-the-less-apostle', '/saints/saint-james-the-less-apostle_batoni.webp', 4, FALSE, 'subject'),

-- Saint John of Ávila
('saint-john-of-avila', '/saints/saint-john-of-avila_greco.webp', 1, TRUE, 'subject'),
('saint-john-of-avila', '/saints/saint-john-of-avila_subleyras.webp', 2, FALSE, 'subject'),

-- Saint Nereus
('saint-nereus', '/saints/saint-domitilla-&-nereus-&-achilleus_rubens.webp', 1, TRUE, 'subject'),
('saint-nereus', '/saints/saint-domitilla-&-nereus-&-achilleus_pomarancio.webp', 2, FALSE, 'subject'),

-- Saint Achilleus
('saint-achilleus', '/saints/saint-domitilla-&-nereus-&-achilleus_rubens.webp', 1, TRUE, 'subject'),
('saint-achilleus', '/saints/saint-domitilla-&-nereus-&-achilleus_pomarancio.webp', 2, FALSE, 'subject'),

-- Saint Pancras
('saint-pancras', '/saints/saint-pancras_sachs.webp', 1, TRUE, 'subject'),
('saint-pancras', '/saints/saint-pancras_guercino.webp', 2, FALSE, 'subject'),

-- Saint Matthias, Apostle
('saint-matthias-apostle', '/saints/saint-matthias-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-matthias-apostle', '/saints/saint-matthias-apostle_dyck.webp', 2, FALSE, 'subject'),
('saint-matthias-apostle', '/saints/saint-matthias-apostle_tristan.webp', 3, FALSE, 'subject'),

-- Saint John I
('saint-john-i', '/saints/saint-john-i_montor.webp', 1, TRUE, 'subject'),
('saint-john-i', '/saints/saint-john-i.webp', 2, FALSE, 'subject'),

-- Saint Bernardine of Siena
('saint-bernardine-of-siena', '/saints/saint-bernardine-of-siena_bellini.webp', 1, TRUE, 'subject'),
('saint-bernardine-of-siena', '/saints/saint-bernardine-of-siena.webp', 2, FALSE, 'subject'),
('saint-bernardine-of-siena', '/saints/saint-bernardine-of-siena_greco.webp', 3, FALSE, 'subject'),
('saint-bernardine-of-siena', '/saints/saint-bernardine-of-siena_brescia.webp', 4, FALSE, 'subject'),

-- Saint Christopher Magallanes
('saint-christopher-magallanes', '/saints/saint-christopher-magallanes.webp', 1, TRUE, 'subject'),
('saint-christopher-magallanes', '/saints/saint-christopher-magallanes_2.webp', 2, FALSE, 'subject'),
('saint-christopher-magallanes', '/saints/saint-christopher-magallanes_picture.webp', 3, FALSE, 'subject'),

-- Saint Rita of Cascia
('saint-rita-of-cascia', '/saints/saint-rita-of-cascia.webp', 1, TRUE, 'subject'),
('saint-rita-of-cascia', '/saints/saint-rita-of-cascia_2.webp', 2, FALSE, 'subject'),
('saint-rita-of-cascia', '/saints/saint-rita-of-cascia_brandi.webp', 3, FALSE, 'subject'),
('saint-rita-of-cascia', '/saints/saint-rita-of-cascia_poussin.webp', 4, FALSE, 'subject'),
('saint-rita-of-cascia', '/saints/saint-rita-of-cascia_torres.webp', 5, FALSE, 'subject'),

-- Saint Bede the Venerable
('saint-bede-the-venerable', '/saints/saint-bede-the-venerable.webp', 1, TRUE, 'subject'),
('saint-bede-the-venerable', '/saints/saint-bede-the-venerable_penrose.webp', 2, FALSE, 'subject'),
('saint-bede-the-venerable', '/saints/saint-bede-the-venerable_icon.webp', 3, FALSE, 'subject'),

-- Saint Gregory VII
('saint-gregory-vii', '/saints/saint-gregory-vii_knille.webp', 1, TRUE, 'subject'),
('saint-gregory-vii', '/saints/saint-gregory-vii.webp', 2, FALSE, 'subject'),
('saint-gregory-vii', '/saints/saint-gregory-vii_scarpelli.webp', 3, FALSE, 'subject'),
('saint-gregory-vii', '/saints/saint-gregory-vii_2.webp', 4, FALSE, 'subject'),
('saint-gregory-vii', '/saints/saint-gregory-vii_3.webp', 5, FALSE, 'subject'),
('saint-gregory-vii', '/saints/saint-gregory-vii_4.webp', 6, FALSE, 'subject'),

-- Saint Mary Magdalene de’ Pazzi
('saint-mary-magdalene-de-pazzi', '/saints/saint-mary-magdalene-de-pazzi_cano.webp', 1, TRUE, 'subject'),
('saint-mary-magdalene-de-pazzi', '/saints/saint-mary-magdalene-de-pazzi_rosi.webp', 2, FALSE, 'subject'),
('saint-mary-magdalene-de-pazzi', '/saints/saint-mary-magdalene-de-pazzi_moya.webp', 3, FALSE, 'subject'),

-- Saint Philip Neri
('saint-philip-neri', '/saints/saint-philip-neri_reni.webp', 1, TRUE, 'subject'),
('saint-philip-neri', '/saints/saint-philip-neri_conca.webp', 2, FALSE, 'subject'),
('saint-philip-neri', '/saints/saint-philip-neri_dolci.webp', 3, FALSE, 'subject'),
('saint-philip-neri', '/saints/saint-philip-neri_tiepolo.webp', 4, FALSE, 'subject'),
('saint-philip-neri', '/saints/saint-philip-neri_nogari.webp', 5, FALSE, 'subject'),

-- Saint Augustine of Canterbury
('saint-augustine-of-canterbury', '/saints/saint-augustine-of-canterbury_lommelin.webp', 1, TRUE, 'subject'),
('saint-augustine-of-canterbury', '/saints/saint-augustine-of-canterbury.webp', 2, FALSE, 'subject'),
('saint-augustine-of-canterbury', '/saints/saint-augustine-of-canterbury_icon.webp', 3, FALSE, 'subject'),

-- Saint Paul VI
('saint-paul-vi', '/saints/saint-paul-vi.webp', 1, TRUE, 'subject'),
('saint-paul-vi', '/saints/saint-paul-vi_picture.webp', 2, FALSE, 'subject'),
('saint-paul-vi', '/saints/saint-paul-vi_picture_2.webp', 3, FALSE, 'subject'),

-- =========================
-- June saints
-- =========================

-- Saint Justin Martyr
('saint-justin-martyr', '/saints/saint-justin-martyr_thevet.webp', 1, TRUE, 'subject'),
('saint-justin-martyr', '/saints/saint-justin-martyr_icon.webp', 2, FALSE, 'subject'),

-- Saint Marcellinus
('saint-marcellinus', '/saints/saint-marcellinus-&-peter.webp', 1, TRUE, 'subject'),
('saint-marcellinus', '/saints/saint-marcellinus-&-peter_martyr.webp', 2, FALSE, 'subject'),
('saint-marcellinus', '/saints/saint-marcellinus-&-peter_2.webp', 3, FALSE, 'subject'),

-- Saint Peter (Exorcist)
('saint-peter-exorcist', '/saints/saint-marcellinus-&-peter.webp', 1, TRUE, 'subject'),
('saint-peter-exorcist', '/saints/saint-marcellinus-&-peter_martyr.webp', 2, FALSE, 'subject'),
('saint-peter-exorcist', '/saints/saint-marcellinus-&-peter_2.webp', 3, FALSE, 'subject'),

-- Saint Charles Lwanga and Companions
('saint-charles-lwanga', '/saints/saint-charles-lwanga-and-companions_icon.webp', 1, TRUE, 'subject'),
('saint-charles-lwanga', '/saints/saint-charles-lwanga-and-companions.avif', 2, FALSE, 'subject'),
('saint-charles-lwanga', '/saints/saint-charles-lwanga-and-companions_2.webp', 3, FALSE, 'subject'),

-- Saint Boniface
('saint-boniface', '/saints/saint-boniface_bloemaert.webp', 1, TRUE, 'subject'),
('saint-boniface', '/saints/saint-boniface_rode.webp', 2, FALSE, 'subject'),
('saint-boniface', '/saints/saint-boniface_rethel.webp', 3, FALSE, 'subject'),

-- Saint Norbert
('saint-norbert', '/saints/saint-norbert_vaszary.webp', 1, TRUE, 'subject'),
('saint-norbert', '/saints/saint-norbert_rubens.webp', 2, FALSE, 'subject'),
('saint-norbert', '/saints/saint-norbert_hoey.webp', 3, FALSE, 'subject'),
('saint-norbert', '/saints/saint-norbert_crayer.webp', 4, FALSE, 'subject'),
('saint-norbert', '/saints/saint-norbert.webp', 5, FALSE, 'subject'),

-- Saint Ephrem
('saint-ephrem', '/saints/saint-ephrem_icon.webp', 1, TRUE, 'subject'),
('saint-ephrem', '/saints/saint-ephrem_mosaic.webp', 2, FALSE, 'subject'),
('saint-ephrem', '/saints/saint-ephrem_illustration.webp', 3, FALSE, 'subject'),

-- Saint Barnabas, Apostle
('saint-barnabas-apostle', '/saints/saint-barnabas-apostle.webp', 1, TRUE, 'subject'),
('saint-barnabas-apostle', '/saints/saint-barnabas-apostle_veronese.webp', 2, FALSE, 'subject'),
('saint-barnabas-apostle', '/saints/saint-paul-apostle-&-barnabas.webp', 3, FALSE, 'subject'),

-- Saint Anthony of Padua
('saint-anthony-of-padua', '/saints/saint-anthony-of-padua_zurbaran.webp', 1, TRUE, 'subject'),
('saint-anthony-of-padua', '/saints/saint-anthony-of-padua_farelli.webp', 2, FALSE, 'subject'),
('saint-anthony-of-padua', '/saints/saint-anthony-of-padua_sirani.webp', 3, FALSE, 'subject'),
('saint-anthony-of-padua', '/saints/saint-anthony-of-padua_strozzi.webp', 4, FALSE, 'subject'),
('saint-anthony-of-padua', '/saints/saint-anthony-of-padua_murillo.webp', 5, FALSE, 'subject'),

-- Saint Romuald
('saint-romuald', '/saints/saint-romuald_guercino.webp', 1, TRUE, 'subject'),
('saint-romuald', '/saints/saint-romuald_loth.webp', 2, FALSE, 'subject'),
('saint-romuald', '/saints/saint-romuald_angelico.webp', 3, FALSE, 'subject'),
('saint-romuald', '/saints/saint-romuald_mussini.webp', 4, FALSE, 'subject'),

-- Saint Aloysius Gonzaga
('saint-aloysius-gonzaga', '/saints/saint-aloysius-gonzaga_mazzanti.webp', 1, TRUE, 'subject'),
('saint-aloysius-gonzaga', '/saints/saint-aloysius-gonzaga_guercino.webp', 2, FALSE, 'subject'),
('saint-aloysius-gonzaga', '/saints/saint-aloysius-gonzaga_goya.webp', 3, FALSE, 'subject'),
('saint-aloysius-gonzaga', '/saints/saint-aloysius-gonzaga_tiepolo.webp', 4, FALSE, 'subject'),

-- Saint Paulinus of Nola
('saint-paulinus-of-nola', '/saints/saint-paulinus-of-nola.webp', 1, TRUE, 'subject'),
('saint-paulinus-of-nola', '/saints/saint-paulinus-of-nola_stained-glass.webp', 2, FALSE, 'subject'),
('saint-paulinus-of-nola', '/saints/saint-paulinus-of-nola_azzolino.webp', 3, FALSE, 'subject'),

-- Saint John Fisher
('saint-john-fisher', '/saints/saint-john-fisher_holbein-younger.webp', 1, TRUE, 'subject'),
('saint-john-fisher', '/saints/saint-john-fisher_illustration.webp', 2, FALSE, 'subject'),
('saint-john-fisher', '/saints/saint-john-fisher_briggs.webp', 3, FALSE, 'subject'),
('saint-john-fisher', '/saints/saint-john-fisher_briggs_2.webp', 4, FALSE, 'subject'),

-- Saint Thomas More
('saint-thomas-more', '/saints/saint-thomas-more_holbein-younger.webp', 1, TRUE, 'subject'),
('saint-thomas-more', '/saints/saint-thomas-more_ward.webp', 2, FALSE, 'subject'),

-- Saint Peter, Apostle
('saint-peter-apostle', '/saints/saint-peter-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_rubens_charge.webp', 2, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_dyck.webp', 3, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_dyck_penitent.webp', 4, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_guercino.webp', 5, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_guercino_weeping.webp', 6, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_murillo.webp', 7, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_ribera.webp', 8, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_ribera_penitent.webp', 9, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_caravaggio_crucifixion.webp', 10, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_rembrandt.webp', 11, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_rembrandt_denial.webp', 12, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_rembrandt_prison.webp', 13, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_velazquez.webp', 14, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_zurbaran.webp', 15, FALSE, 'subject'),
('saint-peter-apostle', '/saints/saint-peter-apostle_brion.webp', 16, FALSE, 'subject'),

-- Saint Cyril of Alexandria
('saint-cyril-of-alexandria', '/saints/saint-cyril-of-alexandria_fresco.webp', 1, TRUE, 'subject'),
('saint-cyril-of-alexandria', '/saints/saint-cyril-of-alexandria_icon.webp', 2, FALSE, 'subject'),
('saint-cyril-of-alexandria', '/saints/saint-cyril-of-alexandria_stained-glass.webp', 3, FALSE, 'subject'),

-- Saint Irenaeus
('saint-irenaeus', '/saints/saint-irenaeus_icon.webp', 1, TRUE, 'subject'),
('saint-irenaeus', '/saints/saint-irenaeus_stained-glass.webp', 2, FALSE, 'subject'),

-- =========================
-- July saints
-- =========================

-- Saint Thomas, Apostle
('saint-thomas-apostle', '/saints/saint-thomas-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_dyck.webp', 2, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_velazquez.webp', 3, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_ribera.webp', 4, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_la-tour.webp', 5, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_la-tour_2.webp', 6, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_caravaggio.webp', 7, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_rubens_martyr.webp', 8, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_rembrandt.webp', 9, FALSE, 'subject'),
('saint-thomas-apostle', '/saints/saint-thomas-apostle_zurbaran.webp', 10, FALSE, 'subject'),

-- Saint Elizabeth of Portugal
('saint-elizabeth-of-portugal', '/saints/saint-elizabeth-of-portugal_zurbaran.webp', 1, TRUE, 'subject'),
('saint-elizabeth-of-portugal', '/saints/saint-elizabeth-of-portugal.webp', 2, FALSE, 'subject'),
('saint-elizabeth-of-portugal', '/saints/saint-elizabeth-of-portugal_2.webp', 3, FALSE, 'subject'),
('saint-elizabeth-of-portugal', '/saints/saint-elizabeth-of-portugal_castro.webp', 4, FALSE, 'subject'),

-- Saint Anthony Zaccaria
('saint-anthony-zaccaria', '/saints/saint-anthony-zaccaria.webp', 1, TRUE, 'subject'),
('saint-anthony-zaccaria', '/saints/saint-anthony-zaccaria_2.webp', 2, FALSE, 'subject'),
('saint-anthony-zaccaria', '/saints/saint-anthony-zaccaria_3.webp', 3, FALSE, 'subject'),
('saint-anthony-zaccaria', '/saints/saint-anthony-zaccaria_4.webp', 4, FALSE, 'subject'),

-- Saint Maria Goretti
('saint-maria-goretti', '/saints/saint-maria-goretti_soffredini.webp', 1, TRUE, 'subject'),
('saint-maria-goretti', '/saints/saint-maria-goretti_2.webp', 2, FALSE, 'subject'),

-- Saint Augustine Zhao Rong and Companions
('saint-augustine-zhao-rong', '/saints/saint-augustine-zhao-rong_icon.webp', 1, TRUE, 'subject'),
('saint-augustine-zhao-rong', '/saints/saint-augustine-zhao-rong-&-companions_liu.webp', 2, FALSE, 'subject'),
('saint-augustine-zhao-rong', '/saints/saint-augustine-zhao-rong_stained-glass.webp', 3, FALSE, 'subject'),

-- Saint Benedict, Abbot
('saint-benedict', '/saints/saint-benedict.webp', 1, TRUE, 'subject'),
('saint-benedict', '/saints/saint-benedict_piazzetta.webp', 2, FALSE, 'subject'),
('saint-benedict', '/saints/saint-benedict_briggs.webp', 3, FALSE, 'subject'),
('saint-benedict', '/saints/saint-benedict_zurbaran.webp', 4, FALSE, 'subject'),
('saint-benedict', '/saints/saint-benedict_2.webp', 5, FALSE, 'subject'),
('saint-benedict', '/saints/saint-benedict_restout.webp', 6, FALSE, 'subject'),
('saint-benedict', '/saints/saint-benedict-&-scholastica.webp', 7, FALSE, 'subject'),

-- Saint Henry
('saint-henry', '/saints/saint-henry_baer.webp', 1, TRUE, 'subject'),
('saint-henry', '/saints/saint-henry.webp', 2, FALSE, 'subject'),
('saint-henry', '/saints/saint-henry_fuhrich.webp', 3, FALSE, 'subject'),
('saint-henry', '/saints/saint-henry_2.webp', 4, FALSE, 'subject'),

-- Saint Camillus de Lellis
('saint-camillus-de-lellis', '/saints/saint-camillus-de-lellis_gandolfi.webp', 1, TRUE, 'subject'),
('saint-camillus-de-lellis', '/saints/saint-camillus-de-lellis_lozano.webp', 2, FALSE, 'subject'),
('saint-camillus-de-lellis', '/saints/saint-camillus-de-lellis.webp', 3, FALSE, 'subject'),
('saint-camillus-de-lellis', '/saints/saint-camillus-de-lellis_subleyras.webp', 4, FALSE, 'subject'),

-- Saint Bonaventure
('saint-bonaventure', '/saints/saint-bonaventure_cavazzola.webp', 1, TRUE, 'subject'),
('saint-bonaventure', '/saints/saint-bonaventure_lombard.webp', 2, FALSE, 'subject'),
('saint-bonaventure', '/saints/saint-bonaventure_rubens.webp', 3, FALSE, 'subject'),
('saint-bonaventure', '/saints/saint-bonaventure_orpen.webp', 4, FALSE, 'subject'),
('saint-bonaventure', '/saints/saint-bonaventure_zurbaran.webp', 5, FALSE, 'subject'),

-- Saint Apollinaris
('saint-apollinaris', '/saints/saint-apollinaris-&-peter_pasquali.webp', 1, TRUE, 'subject'),
('saint-apollinaris', '/saints/saint-apollinaris_mosaic.webp', 2, FALSE, 'subject'),

-- Saint Lawrence of Brindisi
('saint-lawrence-of-brindisi', '/saints/saint-lawrence-of-brindisi.webp', 1, TRUE, 'subject'),
('saint-lawrence-of-brindisi', '/saints/saint-lawrence-of-brindisi_2.webp', 2, FALSE, 'subject'),
('saint-lawrence-of-brindisi', '/saints/saint-lawrence-of-brindisi_3.webp', 3, FALSE, 'subject'),

-- Saint Mary Magdalene
('saint-mary-magdalene', '/saints/saint-mary-magdalene_spadarino.webp', 1, TRUE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_caravaggio_ecstasy.webp', 2, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_champaigne.webp', 3, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_rubens.webp', 4, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_caravaggio_penitent.webp', 5, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_la-tour.webp', 6, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_veronese.webp', 7, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_merle.webp', 8, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_ivanov.webp', 9, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_titian.webp', 10, FALSE, 'subject'),
('saint-mary-magdalene', '/saints/saint-mary-magdalene_giotto.webp', 11, FALSE, 'subject'),

-- Saint Bridget
('saint-bridget', '/saints/saint-bridget.webp', 1, TRUE, 'subject'),
('saint-bridget', '/saints/saint-bridget_friano.webp', 2, FALSE, 'subject'),
('saint-bridget', '/saints/saint-bridget_2.webp', 3, FALSE, 'subject'),
('saint-bridget', '/saints/saint-bridget_briggs.webp', 4, FALSE, 'subject'),

-- Saint Sharbel Makhluf
('saint-sharbel-makhluf', '/saints/saint-sharbel-makhluf.webp', 1, TRUE, 'subject'),
('saint-sharbel-makhluf', '/saints/saint-sharbel-makhluf_2.webp', 2, FALSE, 'subject'),
('saint-sharbel-makhluf', '/saints/saint-sharbel-makhluf_3.webp', 3, FALSE, 'subject'),

-- Saint James, Apostle
('saint-james-apostle', '/saints/saint-james-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_reni.webp', 2, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_dyck.webp', 3, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_ribera.webp', 4, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_rembrandt.webp', 5, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_zurbaran.webp', 6, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_murillo.webp', 7, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_tiepolo.webp', 8, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_dyck_martyr.webp', 9, FALSE, 'subject'),
('saint-james-apostle', '/saints/saint-james-apostle_zurbaran_martyr.webp', 10, FALSE, 'subject'),

-- Saint Joachim
('saint-joachim', '/saints/saint-joachim_wautier.webp', 1, TRUE, 'subject'),
('saint-joachim', '/saints/saint-joachim_gutierrez.webp', 2, FALSE, 'subject'),
('saint-joachim', '/saints/saint-joachim-&-mary_camilo.webp', 3, FALSE, 'subject'),
('saint-joachim', '/saints/saint-joachim-&-mary.webp', 4, FALSE, 'subject'),
('saint-joachim', '/saints/saint-joachim-&-anne_maratta.webp', 5, FALSE, 'subject'),
('saint-joachim', '/saints/saint-anne-&-joachim-&-mary_wautier.webp', 6, FALSE, 'subject'),
('saint-joachim', '/saints/saint-anne-&-joachim-&-mary_tiepolo.webp', 7, FALSE, 'subject'),

-- Saint Anne
('saint-anne', '/saints/saint-anne-&-mary_coypel.webp', 1, TRUE, 'subject'),
('saint-anne', '/saints/saint-anne-&-mary_murillo.webp', 2, FALSE, 'subject'),
('saint-anne', '/saints/saint-anne-&-mary_la-tour.webp', 3, FALSE, 'subject'),
('saint-anne', '/saints/saint-anne-&-mary_stella.webp', 4, FALSE, 'subject'),
('saint-anne', '/saints/saint-anne-&-joachim-&-mary_wautier.webp', 5, FALSE, 'subject'),
('saint-anne', '/saints/saint-anne-&-joachim-&-mary_tiepolo.webp', 6, FALSE, 'subject'),
('saint-anne', '/saints/saint-anne-&-mary-&-child_da-vinci.webp', 7, FALSE, 'subject'),
('saint-anne', '/saints/saint-anne-&-mary_icon.webp', 8, FALSE, 'subject'),

-- Saint Martha of Bethany
('saint-martha-of-bethany', '/saints/saint-martha-of-bethany_ring-sakabe.webp', 1, TRUE, 'subject'),
('saint-martha-of-bethany', '/saints/saint-martha-of-bethany-&-mary-of-bethany-&-christ_vermeer.webp', 2, FALSE, 'subject'),
('saint-martha-of-bethany', '/saints/saint-martha-of-bethany-&-mary-of-bethany-&-christ_rubens.webp', 3, FALSE, 'subject'),
('saint-martha-of-bethany', '/saints/saint-martha-of-bethany.webp', 4, FALSE, 'subject'),

-- Saint Mary of Bethany
('saint-mary-of-bethany', '/saints/saint-mary-of-bethany_ring-sakabe.webp', 1, TRUE, 'subject'),
('saint-mary-of-bethany', '/saints/saint-martha-of-bethany-&-mary-of-bethany-&-christ_vermeer.webp', 2, FALSE, 'subject'),
('saint-mary-of-bethany', '/saints/saint-martha-of-bethany-&-mary-of-bethany-&-christ_rubens.webp', 3, FALSE, 'subject'),

-- Saint Lazarus of Bethany
('saint-lazarus-of-bethany', '/saints/saint-lazarus-of-bethany_caravaggio.webp', 1, TRUE, 'subject'),
('saint-lazarus-of-bethany', '/saints/saint-lazarus-of-bethany_rubens.webp', 2, FALSE, 'subject'),
('saint-lazarus-of-bethany', '/saints/saint-lazarus-of-bethany_gebhardt.webp', 3, FALSE, 'subject'),
('saint-lazarus-of-bethany', '/saints/saint-lazarus-of-bethany_flandes.webp', 4, FALSE, 'subject'),

-- Saint Peter Chrysologus
('saint-peter-chrysologus', '/saints/saint-peter-chrysologus.webp', 1, TRUE, 'subject'),
('saint-peter-chrysologus', '/saints/saint-peter-chrysologus-&-cassian_fontana.webp', 2, FALSE, 'subject'),

-- Saint Ignatius of Loyola
('saint-ignatius-of-loyola', '/saints/saint-ignatius-of-loyola_rubens.webp', 1, TRUE, 'subject'),
('saint-ignatius-of-loyola', '/saints/saint-ignatius-of-loyola_rubens_miracle.webp', 2, FALSE, 'subject'),
('saint-ignatius-of-loyola', '/saints/saint-ignatius-of-loyola_zurbaran.webp', 3, FALSE, 'subject'),
('saint-ignatius-of-loyola', '/saints/saint-ignatius-of-loyola.webp', 4, FALSE, 'subject'),

-- =========================
-- August Saints
-- =========================

-- Saint Alphonsus Liguori
('saint-alphonsus-liguori', '/saints/saint-alphonsus-liguori.webp', 1, TRUE, 'subject'),
('saint-alphonsus-liguori', '/saints/saint-alphonsus-liguori_2.webp', 2, FALSE, 'subject'),
('saint-alphonsus-liguori', '/saints/saint-alphonsus-liguori_3.webp', 3, FALSE, 'subject'),
('saint-alphonsus-liguori', '/saints/saint-alphonsus-liguori_4.webp', 4, FALSE, 'subject'),

-- Saint Eusebius of Vercelli
('saint-eusebius-of-vercelli', '/saints/saint-eusebius-of-vercelli.webp', 1, TRUE, 'subject'),
('saint-eusebius-of-vercelli', '/saints/saint-eusebius-of-vercelli_2.webp', 2, FALSE, 'subject'),
('saint-eusebius-of-vercelli', '/saints/saint-eusebius-of-vercelli-&-roch-&-sebastian_ricci.webp', 3, FALSE, 'subject'),

-- Saint Peter Julian Eymard
('saint-peter-julian-eymard', '/saints/saint-peter-julian-eymard.webp', 1, TRUE, 'subject'),
('saint-peter-julian-eymard', '/saints/saint-peter-julian-eymard_2.webp', 2, FALSE, 'subject'),

-- Saint John Vianney
('saint-john-vianney', '/saints/saint-john-vianney_briggs.webp', 1, TRUE, 'subject'),
('saint-john-vianney', '/saints/saint-john-vianney_desvallieres.webp', 2, FALSE, 'subject'),
('saint-john-vianney', '/saints/saint-john-vianney.webp', 3, FALSE, 'subject'),
('saint-john-vianney', '/saints/saint-john-vianney_2.webp', 4, FALSE, 'subject'),
('saint-john-vianney', '/saints/saint-john-vianney_borel.webp', 5, FALSE, 'subject'),

-- Saint Sixtus II and Companions
('saint-sixtus-ii-and-companions', '/saints/saint-sixtus-ii_botticelli.webp', 1, TRUE, 'subject'),
('saint-sixtus-ii-and-companions', '/saints/saint-sixtus-ii.webp', 2, FALSE, 'subject'),

-- Saint Cajetan
('saint-cajetan', '/saints/saint-cajetan_tiepolo.webp', 1, TRUE, 'subject'),
('saint-cajetan', '/saints/saint-cajetan_ricci.webp', 2, FALSE, 'subject'),
('saint-cajetan', '/saints/saint-cajetan_solimena.webp', 3, FALSE, 'subject'),

-- Saint Dominic
('saint-dominic', '/saints/saint-dominic_coello.webp', 1, TRUE, 'subject'),
('saint-dominic', '/saints/saint-dominic_cavallino.webp', 2, FALSE, 'subject'),
('saint-dominic', '/saints/saint-dominic_campeche.webp', 3, FALSE, 'subject'),

-- Saint Teresa Benedicta of the Cross (Edith Stein)
('saint-teresa-benedicta-of-the-cross', '/saints/saint-teresa-benedicta-of-the-cross_ferreira_no-watermark.webp', 1, TRUE, 'subject'),
('saint-teresa-benedicta-of-the-cross', '/saints/saint-teresa-benedicta-of-the-cross_passport.webp', 2, FALSE, 'subject'),
('saint-teresa-benedicta-of-the-cross', '/saints/saint-teresa-benedicta-of-the-cross.webp', 3, FALSE, 'subject'),

-- Saint Lawrence
('saint-lawrence', '/saints/saint-lawrence_briggs.webp', 1, TRUE, 'subject'),
('saint-lawrence', '/saints/saint-lawrence_santacroce.webp', 2, FALSE, 'subject'),
('saint-lawrence', '/saints/saint-lawrence_champaigne_martyr.webp', 3, FALSE, 'subject'),
('saint-lawrence', '/saints/saint-lawrence_limosin.webp', 4, FALSE, 'subject'),
('saint-lawrence', '/saints/saint-lawrence_cali.webp', 5, FALSE, 'subject'),
('saint-lawrence', '/saints/saint-lawrence_titan_martyr.webp', 6, FALSE, 'subject'),
('saint-lawrence', '/saints/saint-lawrence_strozzi.webp', 7, FALSE, 'subject'),

-- Saint Clare
('saint-clare', '/saints/saint-clare_crivelli.webp', 1, TRUE, 'subject'),
('saint-clare', '/saints/saint-clare_martini.webp', 2, FALSE, 'subject'),
('saint-clare', '/saints/saint-clare_moroni.webp', 3, FALSE, 'subject'),
('saint-clare', '/saints/saint-clare_arco.webp', 4, FALSE, 'subject'),

-- Saint Jane Frances de Chantal
('saint-jane-frances-de-chantal', '/saints/saint-jane-frances-de-chantal.webp', 1, TRUE, 'subject'),
('saint-jane-frances-de-chantal', '/saints/saint-jane-frances-de-chantal_2.webp', 2, FALSE, 'subject'),
('saint-jane-frances-de-chantal', '/saints/saint-francis-de-sales-&-jane-frances-de-chantal.webp', 3, FALSE, 'subject'),
('saint-jane-frances-de-chantal', '/saints/saint-francis-de-sales-&-jane-frances-de-chantal_bayeu.webp', 4, FALSE, 'subject'),
('saint-jane-frances-de-chantal', '/saints/saint-francis-de-sales-&-jane-frances-de-chantal_halle.webp', 5, FALSE, 'subject'),

-- Saint Pontian
('saint-pontian', '/saints/saint-pontian_aretino.webp', 1, TRUE, 'subject'),
('saint-pontian', '/saints/saint-pontian_montor.webp', 2, FALSE, 'subject'),
('saint-pontian', '/saints/saint-pontian.webp', 3, FALSE, 'subject'),
('saint-pontian', '/saints/saint-pontian_echave_martyr.webp', 4, FALSE, 'subject'),

-- Saint Hippolytus of Rome
('saint-hippolytus-of-rome', '/saints/saint-hippolytus-of-rome.webp', 1, TRUE, 'subject'),
('saint-hippolytus-of-rome', '/saints/saint-hippolytus-of-rome_icon.webp', 2, FALSE, 'subject'),
('saint-hippolytus-of-rome', '/saints/saint-hippolytus-of-rome_julien_martyr.webp', 3, FALSE, 'subject'),

-- Saint Maximus the Confessor
('saint-maximus-the-confessor', '/saints/saint-maximus-the-confessor.webp', 1, TRUE, 'subject'),
('saint-maximus-the-confessor', '/saints/saint-maximus-the-confessor_icon.webp', 2, FALSE, 'subject'),
('saint-maximus-the-confessor', '/saints/saint-maximus-the-confessor_icon_2.webp', 3, FALSE, 'subject'),
('saint-maximus-the-confessor', '/saints/saint-maximus-the-confessor_2.webp', 4, FALSE, 'subject'),

-- Saint Maximilian Kolbe
('saint-maximilian-kolbe', '/saints/saint-maximilian-kolbe_pawlowski.webp', 1, TRUE, 'subject'),
('saint-maximilian-kolbe', '/saints/saint-maximilian-kolbe.webp', 2, FALSE, 'subject'),
('saint-maximilian-kolbe', '/saints/saint-maximilian-kolbe_2.webp', 3, FALSE, 'subject'),

-- Saint Stephen of Hungary
('saint-stephen-of-hungary', '/saints/saint-stephen-of-hungary.webp', 1, TRUE, 'subject'),
('saint-stephen-of-hungary', '/saints/saint-stephen-of-hungary_2.webp', 2, FALSE, 'subject'),
('saint-stephen-of-hungary', '/saints/saint-stephen-of-hungary_verhaghen.webp', 3, FALSE, 'subject'),
('saint-stephen-of-hungary', '/saints/saint-stephen-of-hungary_3.webp', 4, FALSE, 'subject'),

-- Saint John Eudes
('saint-john-eudes', '/saints/saint-john-eudes.webp', 1, TRUE, 'subject'),
('saint-john-eudes', '/saints/saint-john-eudes_2.webp', 2, FALSE, 'subject'),

-- Saint Bernard (of Clairvaux)
('saint-bernard', '/saints/saint-bernard_latil.webp', 1, TRUE, 'subject'),
('saint-bernard', '/saints/saint-bernard_greco.webp', 2, FALSE, 'subject'),
('saint-bernard', '/saints/saint-bernard_goya.webp', 3, FALSE, 'subject'),
('saint-bernard', '/saints/saint-bernard_ribalta.webp', 4, FALSE, 'subject'),
('saint-bernard', '/saints/saint-bernard_cano.webp', 5, FALSE, 'subject'),
('saint-bernard', '/saints/saint-bernard_signol.webp', 6, FALSE, 'subject'),
('saint-bernard', '/saints/saint-bernard_vivar.webp', 7, FALSE, 'subject'),

-- Saint Pius X
('saint-pius-x', '/saints/saint-pius-x_gerrer.webp', 1, TRUE, 'subject'),
('saint-pius-x', '/saints/saint-pius-x.webp', 2, FALSE, 'subject'),
('saint-pius-x', '/saints/saint-pius-x_bordignon.webp', 3, FALSE, 'subject'),

-- Saint Rose of Lima
('saint-rose-of-lima', '/saints/saint-rose-of-lima_coello.webp', 1, TRUE, 'subject'),
('saint-rose-of-lima', '/saints/saint-rose-of-lima.webp', 2, FALSE, 'subject'),
('saint-rose-of-lima', '/saints/saint-rose-of-lima_medoro.webp', 3, FALSE, 'subject'),
('saint-rose-of-lima', '/saints/saint-rose-of-lima_laso.webp', 4, FALSE, 'subject'),
('saint-rose-of-lima', '/saints/saint-rose-of-lima_murillo.webp', 5, FALSE, 'subject'),
('saint-rose-of-lima', '/saints/saint-rose-of-lima_briggs.webp', 6, FALSE, 'subject'),

-- Saint Bartholomew, Apostle
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_dyck.webp', 2, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_ribera.webp', 3, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_zurbaran.webp', 4, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_rembrandt.webp', 5, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_rembrandt_2.webp', 6, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle-cavallino.webp', 7, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_ribera_martyr.webp', 8, FALSE, 'subject'),
('saint-bartholomew-apostle', '/saints/saint-bartholomew-apostle_tiepolo_martyr.webp', 9, FALSE, 'subject'),

-- Saint Louis
('saint-louis', '/saints/saint-louis_signol.webp', 1, TRUE, 'subject'),
('saint-louis', '/saints/saint-louis_lagrenee.webp', 2, FALSE, 'subject'),
('saint-louis', '/saints/saint-louis_cabanel.webp', 3, FALSE, 'subject'),
('saint-louis', '/saints/saint-louis_greco.webp', 4, FALSE, 'subject'),
('saint-louis', '/saints/saint-louis_loo.webp', 5, FALSE, 'subject'),
('saint-louis', '/saints/saint-louis_decreuse.webp', 6, FALSE, 'subject'),
('saint-louis', '/saints/saint-louis_vien.webp', 7, FALSE, 'subject'),
('saint-louis', '/saints/saint-louis_thevenin.webp', 8, FALSE, 'subject'),

-- Saint Joseph Calasanz
('saint-joseph-calasanz', '/saints/saint-joseph-calasanz_casanova.webp', 1, TRUE, 'subject'),
('saint-joseph-calasanz', '/saints/saint-joseph-calasanz_corvi.webp', 2, FALSE, 'subject'),
('saint-joseph-calasanz', '/saints/saint-joseph-calasanz_goya.webp', 3, FALSE, 'subject'),

-- Saint Monica
('saint-monica', '/saints/saint-monica_cabanel.webp', 1, TRUE, 'subject'),
('saint-monica', '/saints/saint-augustine-of-hippo-&-monica_scheffer.webp', 2, FALSE, 'subject'),
('saint-monica', '/saints/saint-monica_gozzoli.webp', 3, FALSE, 'subject'),

-- Saint Augustine of Hippo
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo_champaigne.webp', 1, TRUE, 'subject'),
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo-&-monica_scheffer.webp', 2, FALSE, 'subject'),
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo_coello.webp', 3, FALSE, 'subject'),
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo_botticelli.webp', 4, FALSE, 'subject'),
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo_coello_triumph.webp', 5, FALSE, 'subject'),
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo_rubens.webp', 6, FALSE, 'subject'),
('saint-augustine-of-hippo', '/saints/saint-augustine-of-hippo_rubens_jesus.webp', 7, FALSE, 'subject'),

-- =========================
-- September Saints
-- =========================

-- Saint Gregory the Great
('saint-gregory-the-great', '/saints/saint-gregory-the-great_vien.webp', 1, TRUE, 'subject'),
('saint-gregory-the-great', '/saints/saint-gregory-the-great_ribera.webp', 2, FALSE, 'subject'),
('saint-gregory-the-great', '/saints/saint-gregory-the-great_stom.webp', 3, FALSE, 'subject'),
('saint-gregory-the-great', '/saints/saint-gregory-the-great_theodoric.webp', 4, FALSE, 'subject'),
('saint-gregory-the-great', '/saints/saint-gregory-the-great_gasparro.webp', 5, FALSE, 'subject'),

-- Saint Teresa of Calcutta
('saint-teresa-of-calcutta', '/saints/saint-teresa-of-calcutta_zumo.webp', 1, TRUE, 'subject'),
('saint-teresa-of-calcutta', '/saints/saint-teresa-of-calcutta_bettmann.webp', 2, FALSE, 'subject'),
('saint-teresa-of-calcutta', '/saints/saint-teresa-of-calcutta.webp', 3, FALSE, 'subject'),

-- Saint Peter Claver
('saint-peter-claver', '/saints/saint-peter-claver.webp', 1, TRUE, 'subject'),
('saint-peter-claver', '/saints/saint-peter-claver_vitta.webp', 2, FALSE, 'subject'),
('saint-peter-claver', '/saints/saint-peter-claver_2.webp', 3, FALSE, 'subject'),

-- Saint John Chrysostom
('saint-john-chrysostom', '/saints/saint-john-chrysostom_champaigne.webp', 1, TRUE, 'subject'),
('saint-john-chrysostom', '/saints/saint-john-chrysostom_wencker.webp', 2, FALSE, 'subject'),
('saint-john-chrysostom', '/saints/saint-john-chrysostom_mosaic.webp', 3, FALSE, 'subject'),

-- Saint Cornelius
('saint-cornelius', '/saints/saint-cornelius.webp', 1, TRUE, 'subject'),
('saint-cornelius', '/saints/saint-cornelius_2.webp', 2, FALSE, 'subject'),
('saint-cornelius', '/saints/saint-cornelius_mosaic.webp', 3, FALSE, 'subject'),
('saint-cornelius', '/saints/saint-cornelius_3.webp', 4, FALSE, 'subject'),
('saint-cornelius', '/saints/saint-anthony-abbot-&-cornelius-&-cyprian_veronese.webp', 5, FALSE, 'subject'),

-- Saint Cyprian
('saint-cyprian', '/saints/saint-cyprian.webp', 1, TRUE, 'subject'),
('saint-cyprian', '/saints/saint-cyprian_2.webp', 2, FALSE, 'subject'),
('saint-cyprian', '/saints/saint-anthony-abbot-&-cornelius-&-cyprian_veronese.webp', 3, FALSE, 'subject'),

-- Saint Robert Bellarmine
('saint-robert-bellarmine', '/saints/saint-robert-bellarmine.webp', 1, TRUE, 'subject'),
('saint-robert-bellarmine', '/saints/saint-robert-bellarmine_2.webp', 2, FALSE, 'subject'),

-- Saint Hildegard of Bingen
('saint-hildegard-of-bingen', '/saints/saint-hildegard-of-bingen.webp', 1, TRUE, 'subject'),
('saint-hildegard-of-bingen', '/saints/saint-hildegard-of-bingen_2.webp', 2, FALSE, 'subject'),
('saint-hildegard-of-bingen', '/saints/saint-hildegard-of-bingen_3.webp', 3, FALSE, 'subject'),
('saint-hildegard-of-bingen', '/saints/saint-hildegard-of-bingen_casparo.webp', 4, FALSE, 'subject'),

-- Saint Januarius
('saint-januarius', '/saints/saint-januarius_caravaggio.webp', 1, TRUE, 'subject'),
('saint-januarius', '/saints/saint-januarius_vaccaro.webp', 2, FALSE, 'subject'),
('saint-januarius', '/saints/saint-januarius_solimena.webp', 3, FALSE, 'subject'),
('saint-januarius', '/saints/saint-januarius_solimena_miracle.webp', 4, FALSE, 'subject'),
('saint-januarius', '/saints/saint-januarius_solimena_prison.webp', 5, FALSE, 'subject'),
('saint-januarius', '/saints/saint-januarius_gentileschi_martyr.webp', 6, FALSE, 'subject'),

-- Saint Andrew Kim Tae-gon
('saint-andrew-kim-tae-gon', '/saints/saint-andrew-kim-tae-gon.webp', 1, TRUE, 'subject'),
('saint-andrew-kim-tae-gon', '/saints/saint-andrew-kim-tae-gon-&-companions.webp', 2, FALSE, 'subject'),

-- Saint Paul Chong Ha-sang
('saint-paul-chong-ha-sang', '/saints/saint-paul-chong-ha-sang_warford_no-watermark.webp', 1, TRUE, 'subject'),
('saint-paul-chong-ha-sang', '/saints/saint-paul-chong-ha-sang-&-companions.webp', 2, FALSE, 'subject'),
('saint-paul-chong-ha-sang', '/saints/saint-andrew-kim-tae-gon-&-companions.webp', 3, FALSE, 'subject'),

-- Saint Matthew, Apostle and Evangelist
('saint-matthew', '/saints/saint-matthew_rubens.webp', 1, TRUE, 'subject'),
('saint-matthew', '/saints/saint-matthew_dyck.webp', 2, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_rembrandt.webp', 3, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_caravaggio.webp', 4, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_caravaggio_calling.webp', 5, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_caravaggio_martyr.webp', 6, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_hals.webp', 7, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_reni.webp', 8, FALSE, 'subject'),
('saint-matthew', '/saints/saint-matthew_zurbaran.webp', 9, FALSE, 'subject'),

-- Saint Pius of Pietrelcina
('saint-pius-of-pietrelcina', '/saints/saint-pius-of-pietrelcina_2.webp', 1, TRUE, 'subject'),
('saint-pius-of-pietrelcina', '/saints/saint-pius-of-pietrelcina_dughetti.webp', 2, FALSE, 'subject'),
('saint-pius-of-pietrelcina', '/saints/saint-pius-of-pietrelcina.webp', 3, FALSE, 'subject'),
('saint-pius-of-pietrelcina', '/saints/saint-pius-of-pietrelcina_3_no-watermark.webp', 4, FALSE, 'subject'),

-- Saint Cosmas
('saint-cosmas', '/saints/saint-cosmas-&-damian.webp', 1, TRUE, 'subject'),
('saint-cosmas', '/saints/saint-cosmas-&-damian_2.webp', 2, FALSE, 'subject'),
('saint-cosmas', '/saints/saint-cosmas-&-damian_3.webp', 3, FALSE, 'subject'),
('saint-cosmas', '/saints/saint-cosmas-&-damian_4.webp', 4, FALSE, 'subject'),

-- Saint Damian
('saint-damian', '/saints/saint-cosmas-&-damian.webp', 1, TRUE, 'subject'),
('saint-damian', '/saints/saint-cosmas-&-damian_2.webp', 2, FALSE, 'subject'),
('saint-damian', '/saints/saint-cosmas-&-damian_3.webp', 3, FALSE, 'subject'),
('saint-damian', '/saints/saint-cosmas-&-damian_4.webp', 4, FALSE, 'subject'),

-- Saint Vincent de Paul
('saint-vincent-de-paul', '/saints/saint-vincent-de-paul_gerome.webp', 1, TRUE, 'subject'),
('saint-vincent-de-paul', '/saints/saint-vincent-de-paul_delaroche.webp', 2, FALSE, 'subject'),
('saint-vincent-de-paul', '/saints/saint-vincent-de-paul_tours.webp', 3, FALSE, 'subject'),

-- Saint Wenceslaus
('saint-wenceslaus', '/saints/saint-wenceslaus_caroselli.webp', 1, TRUE, 'subject'),
('saint-wenceslaus', '/saints/saint-wenceslaus_skreta.webp', 2, FALSE, 'subject'),
('saint-wenceslaus', '/saints/saint-wenceslaus_tkadlik.webp', 3, FALSE, 'subject'),

-- Saint Lawrence Ruiz
('saint-lawrence-ruiz', '/saints/saint-lawrence-ruiz_warford_no-watermark.webp', 1, TRUE, 'subject'),
('saint-lawrence-ruiz', '/saints/saint-lawrence-ruiz_stained-glass.webp', 2, FALSE, 'subject'),
('saint-lawrence-ruiz', '/saints/saint-lawrence-ruiz-&-companions.webp', 3, FALSE, 'subject'),

-- Saint Jerome
('saint-jerome', '/saints/saint-jerome_ribera.webp', 1, TRUE, 'subject'),
('saint-jerome', '/saints/saint-jerome_vanni.webp', 2, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_dyck.webp', 3, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_caravaggio.webp', 4, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_brugghen.webp', 5, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_durer.webp', 6, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_vouet.webp', 7, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_barocci.webp', 8, FALSE, 'subject'),
('saint-jerome', '/saints/saint-jerome_goya.webp', 9, FALSE, 'subject'),

-- =========================
-- October Saints
-- =========================

-- Saint Thérèse of the Child Jesus
('saint-therese-of-the-child-jesus', '/saints/saint-therese-of-the-child-jesus_wingate.webp', 1, TRUE, 'subject'),
('saint-therese-of-the-child-jesus', '/saints/saint-therese-of-the-child-jesus_celine.webp', 2, FALSE, 'subject'),
('saint-therese-of-the-child-jesus', '/saints/saint-therese-of-the-child-jesus_celine_photo.webp', 3, FALSE, 'subject'),
('saint-therese-of-the-child-jesus', '/saints/saint-therese-of-the-child-jesus_celine_photo_2.webp', 4, FALSE, 'subject'),
('saint-therese-of-the-child-jesus', '/saints/saint-therese-of-the-child-jesus_celine_photo_3.webp', 5, FALSE, 'subject'),
('saint-therese-of-the-child-jesus', '/saints/saint-therese-of-the-child-jesus.webp', 6, FALSE, 'subject'),

-- Saint Francis of Assisi
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_caravaggio.webp', 1, TRUE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_zurbaran.webp', 2, FALSE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_fruytiers.webp', 3, FALSE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_murillo.webp', 4, FALSE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_ribera.webp', 5, FALSE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_tiepolo.webp', 6, FALSE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_murillo_2.webp', 7, FALSE, 'subject'),
('saint-francis-of-assisi', '/saints/saint-francis-of-assisi_schut.webp', 8, FALSE, 'subject'),

-- Saint Faustina Kowalska
('saint-faustina-kowalska', '/saints/saint-faustina-kowalska.webp', 1, TRUE, 'subject'),
('saint-faustina-kowalska', '/saints/saint-faustina-kowalska_2.webp', 2, FALSE, 'subject'),
('saint-faustina-kowalska', '/saints/saint-faustina-kowalska_photo.webp', 3, FALSE, 'subject'),
('saint-faustina-kowalska', '/saints/saint-faustina-kowalska_3.webp', 4, FALSE, 'subject'),

-- Saint Bruno
('saint-bruno', '/saints/saint-bruno_rosa.webp', 1, TRUE, 'subject'),
('saint-bruno', '/saints/saint-bruno_marchesi.webp', 2, FALSE, 'subject'),
('saint-bruno', '/saints/saint-bruno_mignard.webp', 3, FALSE, 'subject'),
('saint-bruno', '/saints/saint-bruno_lesueur.webp', 4, FALSE, 'subject'),

-- Saint Denis
('saint-denis', '/saints/saint-denis.webp', 1, TRUE, 'subject'),
('saint-denis', '/saints/saint-denis_vien.webp', 2, FALSE, 'subject'),
('saint-denis', '/saints/saint-denis-&-companions_bourdichon.webp', 3, FALSE, 'subject'),
('saint-denis', '/saints/saint-denis-&-companions_bonnat_martyr.webp', 4, FALSE, 'subject'),

-- Saint John Leonardi
('saint-john-leonardi', '/saints/saint-john-leonardi.webp', 1, TRUE, 'subject'),
('saint-john-leonardi', '/saints/saint-john-leonardi_2.webp', 2, FALSE, 'subject'),
('saint-john-leonardi', '/saints/saint-john-leonardi_3.webp', 3, FALSE, 'subject'),
('saint-john-leonardi', '/saints/saint-john-leonardi_4.webp', 4, FALSE, 'subject'),

-- Saint John Henry Newman
('saint-john-henry-newman', '/saints/saint-john-henry-newman_millais.webp', 1, TRUE, 'subject'),
('saint-john-henry-newman', '/saints/saint-john-henry-newman_photo.webp', 2, FALSE, 'subject'),
('saint-john-henry-newman', '/saints/saint-john-henry-newman.webp', 3, FALSE, 'subject'),

-- Saint John XXIII
('saint-john-xxiii', '/saints/saint-john-xxiii_wenner.webp', 1, TRUE, 'subject'),
('saint-john-xxiii', '/saints/saint-john-xxiii_photo.webp', 2, FALSE, 'subject'),
('saint-john-xxiii', '/saints/saint-john-xxiii_photo_2.webp', 3, FALSE, 'subject'),

-- Saint Callistus I
('saint-callistus-i', '/saints/saint-callistus-i.webp', 1, TRUE, 'subject'),
('saint-callistus-i', '/saints/saint-callistus-i_2.webp', 2, FALSE, 'subject'),
('saint-callistus-i', '/saints/saint-callistus-i_3.webp', 3, FALSE, 'subject'),

-- Saint Teresa of Jesus (Teresa of Ávila)
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_cagnacci.webp', 1, TRUE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_murillo.webp', 2, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_bazzani.webp', 3, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_balaca.webp', 4, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_rubens.webp', 5, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_rubens_2.webp', 6, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_batoni.webp', 7, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_vien.webp', 8, FALSE, 'subject'),
('saint-teresa-of-jesus', '/saints/saint-teresa-of-jesus_gerard.webp', 9, FALSE, 'subject'),

-- Saint Hedwig
('saint-hedwig', '/saints/saint-hedwig.webp', 1, TRUE, 'subject'),
('saint-hedwig', '/saints/saint-hedwig_2.webp', 2, FALSE, 'subject'),
('saint-hedwig', '/saints/saint-hedwig_3.webp', 3, FALSE, 'subject'),
('saint-hedwig', '/saints/saint-hedwig_4.webp', 4, FALSE, 'subject'),
('saint-hedwig', '/saints/saint-hedwig_5.webp', 5, FALSE, 'subject'),
('saint-hedwig', '/saints/saint-hedwig_6.webp', 6, FALSE, 'subject'),

-- Saint Margaret Mary Alacoque
('saint-margaret-mary-alacoque', '/saints/saint-margaret-mary-alacoque.webp', 1, TRUE, 'subject'),
('saint-margaret-mary-alacoque', '/saints/saint-margaret-mary-alacoque_2.webp', 2, FALSE, 'subject'),
('saint-margaret-mary-alacoque', '/saints/saint-margaret-mary-alacoque_3.webp', 3, FALSE, 'subject'),

-- Saint Ignatius of Antioch, Bishop and Martyr
('saint-ignatius-of-antioch', '/saints/saint-ignatius-of-antioch.webp', 1, TRUE, 'subject'),
('saint-ignatius-of-antioch', '/saints/saint-ignatius-of-antioch_2.webp', 2, FALSE, 'subject'),
('saint-ignatius-of-antioch', '/saints/saint-ignatius-of-antioch_3.webp', 3, FALSE, 'subject'),

-- Saint Luke, Evangelist
('saint-luke', '/saints/saint-luke_reni.webp', 1, TRUE, 'subject'),
('saint-luke', '/saints/saint-luke_borovikovsky.webp', 2, FALSE, 'subject'),
('saint-luke', '/saints/saint-luke_hals.webp', 3, FALSE, 'subject'),
('saint-luke', '/saints/saint-luke_weyden.webp', 4, FALSE, 'subject'),
('saint-luke', '/saints/saint-luke_guercino.webp', 5, FALSE, 'subject'),

-- Saint John de Brébeuf
('saint-john-de-brebeuf', '/saints/saint-john-de-brebeuf.webp', 1, TRUE, 'subject'),
('saint-john-de-brebeuf', '/saints/saint-john-de-brebeuf_thwaites.webp', 2, FALSE, 'subject'),
('saint-john-de-brebeuf', '/saints/saint-john-de-brebeuf-&-companions.webp', 3, FALSE, 'subject'),

-- Saint Paul of the Cross
('saint-paul-of-the-cross', '/saints/saint-paul-of-the-cross.webp', 1, TRUE, 'subject'),
('saint-paul-of-the-cross', '/saints/saint-paul-of-the-cross_2.webp', 2, FALSE, 'subject'),
('saint-paul-of-the-cross', '/saints/saint-paul-of-the-cross_3.webp', 3, FALSE, 'subject'),
('saint-paul-of-the-cross', '/saints/saint-paul-of-the-cross_4.webp', 4, FALSE, 'subject'),

-- Saint John Paul II
('saint-john-paul-ii', '/saints/saint-john-paul-ii_bobnick_no-watermark.webp', 1, TRUE, 'subject'),
('saint-john-paul-ii', '/saints/saint-john-paul-ii_babailov.webp', 2, FALSE, 'subject'),
('saint-john-paul-ii', '/saints/saint-john-paul-ii.webp', 3, FALSE, 'subject'),
('saint-john-paul-ii', '/saints/saint-john-paul-ii_2.webp', 4, FALSE, 'subject'),
('saint-john-paul-ii', '/saints/saint-john-paul-ii_tsarkova.webp', 5, FALSE, 'subject'),
('saint-john-paul-ii', '/saints/saint-john-paul-ii_tsarkova_2.webp', 6, FALSE, 'subject'),

-- Saint John of Capistrano
('saint-john-of-capistrano', '/saints/saint-john-of-capistrano_del-arco.webp', 1, TRUE, 'subject'),
('saint-john-of-capistrano', '/saints/saint-john-of-capistrano_grassi.webp', 2, FALSE, 'subject'),
('saint-john-of-capistrano', '/saints/saint-john-of-capistrano.webp', 3, FALSE, 'subject'),

-- Saint Anthony Mary Claret, Bishop
('saint-anthony-mary-claret', '/saints/saint-anthony-mary-claret.webp', 1, TRUE, 'subject'),
('saint-anthony-mary-claret', '/saints/saint-anthony-mary-claret_madrazo.webp', 2, FALSE, 'subject'),
('saint-anthony-mary-claret', '/saints/saint-anthony-mary-claret_pujadas.webp', 3, FALSE, 'subject'),

-- Saint Simon, Apostle
('saint-simon-apostle', '/saints/saint-simon-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-simon-apostle', '/saints/saint-simon-apostle_dyck.webp', 2, FALSE, 'subject'),
('saint-simon-apostle', '/saints/saint-simon-apostle_dyck_2.webp', 3, FALSE, 'subject'),
('saint-simon-apostle', '/saints/saint-simon-apostle_rembrandt.webp', 4, FALSE, 'subject'),
('saint-simon-apostle', '/saints/saint-simon-apostle_ribera.webp', 5, FALSE, 'subject'),
('saint-simon-apostle', '/saints/saint-simon-apostle_zurbaran.webp', 6, FALSE, 'subject'),
('saint-simon-apostle', '/saints/saint-simon-apostle-&-jude-apostle_schmidt_martyr.webp', 7, FALSE, 'subject'),

-- Saint Jude, Apostle
('saint-jude-apostle', '/saints/saint-jude-apostle_dyck.webp', 1, TRUE, 'subject'),
('saint-jude-apostle', '/saints/saint-jude-apostle_dyck_2.webp', 2, FALSE, 'subject'),
('saint-jude-apostle', '/saints/saint-jude-apostle_ribera.webp', 3, FALSE, 'subject'),
('saint-jude-apostle', '/saints/saint-jude-apostle_la-tour.webp', 4, FALSE, 'subject'),
('saint-jude-apostle', '/saints/saint-jude-apostle_zurbaran.webp', 5, FALSE, 'subject'),
('saint-jude-apostle', '/saints/saint-simon-apostle-&-jude-apostle_schmidt_martyr.webp', 6, FALSE, 'subject'),

-- =========================
-- November Saints
-- =========================

-- Saint Martin de Porres
('saint-martin-de-porres', '/saints/saint-martin-de-porres_briggs.webp', 1, TRUE, 'subject'),
('saint-martin-de-porres', '/saints/saint-martin-de-porres.webp', 2, FALSE, 'subject'),
('saint-martin-de-porres', '/saints/saint-martin-de-porres_warford.webp', 3, FALSE, 'subject'),
('saint-martin-de-porres', '/saints/saint-martin-de-porres_2.webp', 4, FALSE, 'subject'),

-- Saint Charles Borromeo
('saint-charles-borromeo', '/saints/saint-charles-borromeo_borgianni.webp', 1, TRUE, 'subject'),
('saint-charles-borromeo', '/saints/saint-charles-borromeo_figino.webp', 2, FALSE, 'subject'),
('saint-charles-borromeo', '/saints/saint-charles-borromeo_tiepolo.webp', 3, FALSE, 'subject'),
('saint-charles-borromeo', '/saints/saint-charles-borromeo_gherardi.webp', 4, FALSE, 'subject'),
('saint-charles-borromeo', '/saints/saint-charles-borromeo_borgianni_2.webp', 5, FALSE, 'subject'),

-- Saint Leo the Great
('saint-leo-the-great', '/saints/saint-leo-the-great_el-mozo.webp', 1, TRUE, 'subject'),
('saint-leo-the-great', '/saints/saint-leo-the-great.webp', 2, FALSE, 'subject'),
('saint-leo-the-great', '/saints/saint-leo-the-great_2.webp', 3, FALSE, 'subject'),

-- Saint Martin of Tours
('saint-martin-of-tours', '/saints/saint-martin-of-tours_martini.webp', 1, TRUE, 'subject'),
('saint-martin-of-tours', '/saints/saint-martin-of-tours_dyck.webp', 2, FALSE, 'subject'),
('saint-martin-of-tours', '/saints/saint-martin-of-tours_maes.webp', 3, FALSE, 'subject'),
('saint-martin-of-tours', '/saints/saint-martin-of-tours.webp', 4, FALSE, 'subject'),

-- Saint Josaphat, Bishop and Martyr
('saint-josaphat', '/saints/saint-josaphat_azovskyj.webp', 1, TRUE, 'subject'),
('saint-josaphat', '/saints/saint-josaphat_simmler_martyr.webp', 2, FALSE, 'subject'),
('saint-josaphat', '/saints/saint-josaphat_icon.webp', 3, FALSE, 'subject'),

-- Saint Albert the Great
('saint-albert-the-great', '/saints/saint-albert-the-great_gomez.webp', 1, TRUE, 'subject'),
('saint-albert-the-great', '/saints/saint-albert-the-great.webp', 2, FALSE, 'subject'),
('saint-albert-the-great', '/saints/saint-albert-the-great-&-thomas-aquinas_villamor.webp', 3, FALSE, 'subject'),

-- Saint Margaret of Scotland
('saint-margaret-of-scotland', '/saints/saint-margaret-of-scotland_largillierre.webp', 1, TRUE, 'subject'),
('saint-margaret-of-scotland', '/saints/saint-margaret-of-scotland_hole.webp', 2, FALSE, 'subject'),
('saint-margaret-of-scotland', '/saints/saint-margaret-of-scotland.webp', 3, FALSE, 'subject'),

-- Saint Gertrude
('saint-gertrude', '/saints/saint-gertrude_cabrera.webp', 1, TRUE, 'subject'),
('saint-gertrude', '/saints/saint-gertrude.webp', 2, FALSE, 'subject'),
('saint-gertrude', '/saints/saint-gertrude_2.webp', 3, FALSE, 'subject'),

-- Saint Elizabeth of Hungary
('saint-elizabeth-of-hungary', '/saints/saint-elizabeth-of-hungary_martini.webp', 1, TRUE, 'subject'),
('saint-elizabeth-of-hungary', '/saints/saint-elizabeth-of-hungary_leighton.webp', 2, FALSE, 'subject'),
('saint-elizabeth-of-hungary', '/saints/saint-elizabeth-of-hungary_collins.webp', 3, FALSE, 'subject'),
('saint-elizabeth-of-hungary', '/saints/saint-elizabeth-of-hungary_stokes.webp', 4, FALSE, 'subject'),

-- Saint Cecilia
('saint-cecilia', '/saints/saint-cecilia_reni.webp', 1, TRUE, 'subject'),
('saint-cecilia', '/saints/saint-cecilia_guercino.webp', 2, FALSE, 'subject'),
('saint-cecilia', '/saints/saint-cecilia_paelinck-horgnies.webp', 3, FALSE, 'subject'),
('saint-cecilia', '/saints/saint-cecilia_gentileschi-&-lanfranco.webp', 4, FALSE, 'subject'),
('saint-cecilia', '/saints/saint-cecilia_raphael.webp', 5, FALSE, 'subject'),
('saint-cecilia', '/saints/saint-cecilia_saraceni_martyr.webp', 6, FALSE, 'subject'),
('saint-cecilia', '/saints/saint-cecilia_madrazo.webp', 7, FALSE, 'subject'),

-- Saint Clement I
('saint-clement-i', '/saints/saint-clement-i_fresco.webp', 1, TRUE, 'subject'),
('saint-clement-i', '/saints/saint-clement-i.webp', 2, FALSE, 'subject'),
('saint-clement-i', '/saints/saint-clement-i_mosaic.webp', 3, FALSE, 'subject'),
('saint-clement-i', '/saints/saint-clement-i_tiepolo.webp', 4, FALSE, 'subject'),
('saint-clement-i', '/saints/saint-clement-i_montor.webp', 5, FALSE, 'subject'),

-- Saint Columban, Abbot
('saint-columban', '/saints/saint-columban.webp', 1, TRUE, 'subject'),
('saint-columban', '/saints/saint-columban_stained-glass.webp', 2, FALSE, 'subject'),

-- Saint Andrew Dung-Lac
('saint-andrew-dung-lac', '/saints/saint-andrew-dung-lac_stained-glass.webp', 1, TRUE, 'subject'),
('saint-andrew-dung-lac', '/saints/saint-andrew-dung-lac-&-companions.webp', 2, FALSE, 'subject'),
('saint-andrew-dung-lac', '/saints/saint-andrew-dung-lac_warford.webp', 3, FALSE, 'subject'),

-- Saint Catherine of Alexandria
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_caravaggio.webp', 1, TRUE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_raphael.webp', 2, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_crivelli.webp', 3, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_murillo.webp', 4, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_guinet.webp', 5, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_gentileschi.webp', 6, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_gentileschi_2.webp', 7, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_farinati_martyr.webp', 8, FALSE, 'subject'),
('saint-catherine-of-alexandria', '/saints/saint-catherine-of-alexandria_lehmann.webp', 9, FALSE, 'subject'),

-- Saint Andrew, Apostle
('saint-andrew-apostle', '/saints/saint-andrew-apostle_rubens.webp', 1, TRUE, 'subject'),
('saint-andrew-apostle', '/saints/saint-andrew-apostle_dyck.webp', 2, FALSE, 'subject'),
('saint-andrew-apostle', '/saints/saint-andrew-apostle_ribera.webp', 3, FALSE, 'subject'),
('saint-andrew-apostle', '/saints/saint-andrew-apostle_tournier.webp', 4, FALSE, 'subject'),
('saint-andrew-apostle', '/saints/saint-andrew-apostle_zurbaran.webp', 5, FALSE, 'subject'),
('saint-andrew-apostle', '/saints/saint-andrew-apostle_loo.webp', 6, FALSE, 'subject'),
('saint-andrew-apostle', '/saints/saint-andrew-apostle_murillo_martyr.webp', 7, FALSE, 'subject'),

-- =========================
-- December Saints
-- =========================

-- Saint Francis Xavier
('saint-francis-xavier', '/saints/saint-francis-xavier_murillo.webp', 1, TRUE, 'subject'),
('saint-francis-xavier', '/saints/saint-francis-xavier_dyck.webp', 2, FALSE, 'subject'),
('saint-francis-xavier', '/saints/saint-francis-xavier_rubens.webp', 3, FALSE, 'subject'),
('saint-francis-xavier', '/saints/saint-francis-xavier_poussin.webp', 4, FALSE, 'subject'),

-- Saint John Damascene
('saint-john-damascene', '/saints/saint-john-damascene.webp', 1, TRUE, 'subject'),
('saint-john-damascene', '/saints/saint-john-damascene_homsi.webp', 2, FALSE, 'subject'),
('saint-john-damascene', '/saints/saint-john-damascene_2.webp', 3, FALSE, 'subject'),
('saint-john-damascene', '/saints/saint-john-damascene_3.webp', 4, FALSE, 'subject'),

-- Saint Nicholas
('saint-nicholas', '/saints/saint-nicholas_cermak.webp', 1, TRUE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_moretto.webp', 2, FALSE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_bourdichon.webp', 3, FALSE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_icon.webp', 4, FALSE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_titian.webp', 5, FALSE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_repin.webp', 6, FALSE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_domenichino_grottaferrata.webp', 7, FALSE, 'subject'),
('saint-nicholas', '/saints/saint-nicholas_giordano.webp', 8, FALSE, 'subject'),

-- Saint Ambrose
('saint-ambrose', '/saints/saint-ambrose_goya.webp', 1, TRUE, 'subject'),
('saint-ambrose', '/saints/saint-ambrose_vignon.webp', 2, FALSE, 'subject'),
('saint-ambrose', '/saints/saint-ambrose_dyck.webp', 3, FALSE, 'subject'),
('saint-ambrose', '/saints/saint-ambrose_subleyras.webp', 4, FALSE, 'subject'),
('saint-ambrose', '/saints/saint-ambrose_mosaic.webp', 5, FALSE, 'subject'),
('saint-ambrose', '/saints/saint-ambrose_mosaic_2.webp', 6, FALSE, 'subject'),

-- Saint Juan Diego Cuauhtlatoatzin
('saint-juan-diego-cuauhtlatoatzin', '/saints/saint-juan-diego-cuauhtlatoatzin_berzosa.webp', 1, TRUE, 'subject'),
('saint-juan-diego-cuauhtlatoatzin', '/saints/saint-juan-diego-cuauhtlatoatzin_cabrera.webp', 2, FALSE, 'subject'),
('saint-juan-diego-cuauhtlatoatzin', '/saints/saint-juan-diego-cuauhtlatoatzin_cabrera_2.webp', 3, FALSE, 'subject'),

-- Saint Damasus I
('saint-damasus-i', '/saints/saint-damasus-i_lithography.webp', 1, TRUE, 'subject'),
('saint-damasus-i', '/saints/saint-damasus-i_cavalieri.webp', 2, FALSE, 'subject'),
('saint-damasus-i', '/saints/saint-damasus-i.webp', 3, FALSE, 'subject'),
('saint-damasus-i', '/saints/saint-damasus-i_engraving.webp', 4, FALSE, 'subject'),
('saint-damasus-i', '/saints/saint-damasus-i_montor.webp', 5, FALSE, 'subject'),

-- Saint Lucy
('saint-lucy', '/saints/saint-lucy_zurbaran.webp', 1, TRUE, 'subject'),
('saint-lucy', '/saints/saint-lucy_pirez.webp', 2, FALSE, 'subject'),
('saint-lucy', '/saints/saint-lucy_garofalo.webp', 3, FALSE, 'subject'),
('saint-lucy', '/saints/saint-lucy_ricci.webp', 4, FALSE, 'subject'),
('saint-lucy', '/saints/saint-lucy_caravaggio.webp', 5, FALSE, 'subject'),

-- Saint John of the Cross
('saint-john-of-the-cross', '/saints/saint-john-of-the-cross_zurbaran.webp', 1, TRUE, 'subject'),
('saint-john-of-the-cross', '/saints/saint-john-of-the-cross_bunel.webp', 2, FALSE, 'subject'),
('saint-john-of-the-cross', '/saints/saint-john-of-the-cross.webp', 3, FALSE, 'subject'),

-- Saint Peter Canisius
('saint-peter-canisius', '/saints/saint-peter-canisius.webp', 1, TRUE, 'subject'),
('saint-peter-canisius', '/saints/saint-peter-canisius_custos.webp', 2, FALSE, 'subject'),
('saint-peter-canisius', '/saints/saint-peter-canisius_2.webp', 3, FALSE, 'subject'),
('saint-peter-canisius', '/saints/saint-peter-canisius_3.webp', 4, FALSE, 'subject'),

-- Saint John of Kanty
('saint-john-of-kanty', '/saints/saint-john-of-kanty_kuntze.webp', 1, TRUE, 'subject'),
('saint-john-of-kanty', '/saints/saint-john-of-kanty.webp', 2, FALSE, 'subject'),
('saint-john-of-kanty', '/saints/saint-john-of-kanty_kotsis.webp', 3, FALSE, 'subject'),

-- Saint Stephen, the First Martyr
('saint-stephen-martyr', '/saints/saint-stephen-martyr_crivelli.webp', 1, TRUE, 'subject'),
('saint-stephen-martyr', '/saints/saint-stephen-martyr_champaigne_martyr.webp', 2, FALSE, 'subject'),
('saint-stephen-martyr', '/saints/saint-stephen-martyr_rubens.webp', 3, FALSE, 'subject'),
('saint-stephen-martyr', '/saints/saint-stephen-martyr_damaskinos.webp', 4, FALSE, 'subject'),
('saint-stephen-martyr', '/saints/saint-stephen-martyr_millais.webp', 5, FALSE, 'subject'),

-- Saint John, Apostle and Evangelist
('saint-john', '/saints/saint-john_rubens.webp', 1, TRUE, 'subject'),
('saint-john', '/saints/saint-john_dyck.webp', 2, FALSE, 'subject'),
('saint-john', '/saints/saint-john_domenichino.webp', 3, FALSE, 'subject'),
('saint-john', '/saints/saint-john_zurbaran.webp', 4, FALSE, 'subject'),
('saint-john', '/saints/saint-john_dolci.webp', 5, FALSE, 'subject'),
('saint-john', '/saints/saint-john_grunewald.webp', 6, FALSE, 'subject'),
('saint-john', '/saints/saint-john_hals.webp', 7, FALSE, 'subject'),
('saint-john', '/saints/saint-john_bosch.webp', 8, FALSE, 'subject'),

-- The Holy Innocents, Martyrs
('holy-innocents', '/saints/holy-innocents_rubens.webp', 1, TRUE, 'subject'),
('holy-innocents', '/saints/holy-innocents_reni.webp', 2, FALSE, 'subject'),
('holy-innocents', '/saints/holy-innocents_cogniet.webp', 3, FALSE, 'subject'),
('holy-innocents', '/saints/holy-innocents_rubens_2.webp', 4, FALSE, 'subject'),
('holy-innocents', '/saints/holy-innocents_briggs.webp', 5, FALSE, 'subject'),

-- Saint Thomas Becket
('saint-thomas-becket', '/saints/saint-thomas-becket.webp', 1, TRUE, 'subject'),
('saint-thomas-becket', '/saints/saint-thomas-becket_francke.webp', 2, FALSE, 'subject'),
('saint-thomas-becket', '/saints/saint-thomas-becket_2.webp', 3, FALSE, 'subject'),
('saint-thomas-becket', '/saints/saint-thomas-becket_stained-glass.webp', 4, FALSE, 'subject'),

-- Saint Sylvester I
('saint-sylvester-i', '/saints/saint-sylvester-i.webp', 1, TRUE, 'subject'),
('saint-sylvester-i', '/saints/saint-sylvester-i_2.webp', 2, FALSE, 'subject'),
('saint-sylvester-i', '/saints/saint-sylvester-i_icon.webp', 3, FALSE, 'subject')


	) AS x(
    saint_slug,
    image_url,
    sort_order,
    is_primary,
    subject_role
)
ON s.slug = x.saint_slug
JOIN images i
    ON i.image_url = x.image_url
ON CONFLICT (saint_id, image_id) DO NOTHING;

COMMIT;
