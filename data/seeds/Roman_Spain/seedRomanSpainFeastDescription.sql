-- =========================================================
-- Roman Spain Calendar - Feast descriptions (EN/FR/LA)
-- Populates feast_translations.description for country-specific feasts.
-- Run this file after seedRomanSpain.sql.
-- =========================================================

BEGIN;

-- 1) DESCRIPTIONS EN
UPDATE feast_translations ft
SET description = x.description
FROM feasts f
JOIN (VALUES
('saint-eulogius-of-cordoba-bishop-and-martyr', $desc$
This celebration honors Saint Eulogius of Córdoba, pastor, teacher, and martyr, whose fidelity strengthened Christians living under pressure. His memory joins learning, pastoral care, and courageous confession of Christ.

Eulogius shows that the word of God can be guarded and proclaimed even when public witness is costly. His holiness was expressed in teaching, encouraging the faithful, and accepting suffering rather than denying the Lord.

For believers today, this celebration invites perseverance, clarity of faith, and charity toward communities tested by hostility or fear.
$desc$),
('saints-fructuosus-augurius-and-eulogius-martyrs', $desc$
This celebration honors Saints Fructuosus, Augurius, and Eulogius, martyrs whose common witness manifests the unity of the Church around her shepherd and ministers. Their death proclaims that Christ is worth more than life itself.

Their testimony belongs to the ancient memory of the Church, where bishop, deacons, and faithful were strengthened by the Eucharistic hope of sharing in the Lord's sacrifice and victory.

For the faithful today, this celebration encourages courage, ecclesial unity, and trust that suffering borne in Christ becomes a seed of life.
$desc$),
('saint-ildephonsus-of-toledo-bishop', $desc$
This celebration honors Saint Ildephonsus of Toledo, bishop and teacher, remembered especially for his defense of the mystery of Christ and his devotion to the Mother of God. His witness unites doctrinal clarity with liturgical and pastoral service.

Ildephonsus reminds the Church that authentic Marian devotion protects and deepens faith in the Incarnation. To honor Mary rightly is to confess more fully the dignity of her Son, true God and true man.

For believers today, this celebration invites love for sound teaching, reverent worship, and a devotion to Mary that always leads to Christ.
$desc$),
('saint-hermenegild-martyr', $desc$
This celebration honors Saint Hermenegild, martyr, whose witness is linked to fidelity to the Catholic faith amid family and political conflict. His memory contemplates conscience formed by truth and strengthened by grace.

Hermenegild's martyrdom shows that faith cannot be reduced to convenience, inheritance, or public advantage. The disciple may be called to choose communion with Christ even when that choice brings suffering and loss.

For the faithful today, this celebration encourages firmness without bitterness, fidelity without pride, and trust that God can bring reconciliation and fruit from costly obedience.
$desc$),
('saint-peter-of-saint-joseph-de-betancur-missionary', $desc$
This celebration honors Saint Peter of Saint Joseph de Betancur, missionary and servant of the poor, whose life joined contemplation, penance, and concrete mercy. He recognized Christ in the sick, abandoned, and forgotten.

His holiness reveals the missionary heart of the Church: evangelization is credible when the Gospel is announced by compassion, humility, and personal sacrifice. Love of Christ became in him hospitality for the least.

For believers today, this celebration invites generous service, simplicity of life, and a missionary charity that makes the nearness of God visible.
$desc$),
('saint-isidore-of-seville-bishop-and-doctor', $desc$
This celebration honors Saint Isidore of Seville, bishop and doctor of the Church, whose learning served the preservation and transmission of Christian wisdom. He sought to gather knowledge in the light of faith and place it at the service of the Church.

Isidore's witness shows that study can become charity when it helps believers understand creation, history, language, and doctrine as gifts ordered toward truth. His pastoral learning formed minds and strengthened ecclesial life.

For the faithful today, this celebration encourages disciplined study, love for sacred doctrine, and the humble use of knowledge for evangelization and service.
$desc$),
('saint-isidore-the-farmer', $desc$
This celebration honors Saint Isidore the Farmer, whose sanctity was lived in ordinary labor, prayer, and family life. His memory shows that holiness is not confined to cloisters or public office, but can flourish in fields, homes, and daily responsibilities.

Isidore's life contemplates work as a place of communion with God when it is marked by honesty, gratitude, and care for the poor. Prayer did not remove him from duty but purified and sustained his labor.

For believers today, this celebration invites sanctification of work, simplicity, generosity, and trust in God's providence amid ordinary tasks.
$desc$),
('saint-paschal-baylon', $desc$
This celebration honors Saint Paschal Baylon, religious, remembered for humility, poverty, and profound devotion to the Eucharist. His life expresses a simple and ardent love for Christ truly present among his people.

Paschal's witness teaches that Eucharistic faith is not merely devotional feeling, but a school of adoration, obedience, and charity. Contemplation of the Lord's presence shaped his service and his poverty of spirit.

For believers today, this celebration invites renewed reverence for the Eucharist, humble prayer, and a life made generous by adoration.
$desc$),
('saint-joaquina-vedruna', $desc$
This celebration honors Saint Joaquina Vedruna, wife, mother, widow, foundress, and servant of Christian education and charity. Her life shows the breadth of holiness across changing states of life.

Joaquina answered God's call through family fidelity, suffering, and apostolic service. Her witness reveals how personal trials can become a path to wider fruitfulness when offered to Christ in faith.

For the faithful today, this celebration encourages openness to vocation, perseverance through change, and generous service to the young, the sick, and the poor.
$desc$),
('saint-ferdinand', $desc$
This celebration honors Saint Ferdinand, remembered as a ruler who sought to unite public responsibility with Christian faith. His memory invites reflection on authority as service under the judgment of God.

The holiness associated with Ferdinand is not a celebration of power for its own sake, but of justice, devotion, and concern that civil life be ordered toward the common good. Christian leadership must remain accountable to truth and mercy.

For believers today, this celebration encourages prayer for those who govern and a renewed commitment to justice, peace, and the responsible use of authority.
$desc$),
('saint-jose-de-anchieta-missionary', $desc$
This celebration honors Saint José de Anchieta, missionary, priest, educator, and evangelizer, whose life was spent bringing the Gospel across cultures. His memory highlights patience, language, teaching, and charity as instruments of mission.

Anchieta's witness shows that evangelization requires both zeal and respect, both proclamation and service. The missionary becomes a servant of Christ by drawing near to peoples, learning their needs, and offering the hope of the Gospel.

For believers today, this celebration invites missionary creativity, perseverance, and a charity able to cross boundaries for the sake of Christ.
$desc$),
('saint-maria-micaela-of-the-blessed-sacrament-virgin', $desc$
This celebration honors Saint María Micaela of the Blessed Sacrament, virgin and foundress, whose life joined Eucharistic adoration with the rescue and restoration of vulnerable women. Her charity was rooted in contemplation of Christ.

Her witness shows that adoration and social mercy belong together. Before the Eucharistic Lord she learned to recognize wounded dignity and to serve those whom society was tempted to ignore or condemn.

For believers today, this celebration invites reverence for the Eucharist, compassionate action, and hope in the healing power of grace.
$desc$),
('saint-pelagius-martyr', $desc$
This celebration honors Saint Pelagius, martyr, remembered for youthful courage, purity, and fidelity to Christ under coercion. His witness proclaims the dignity of conscience and the strength given by grace.

Pelagius reminds the Church that holiness can shine in the young and that chastity is a form of freedom ordered to love. His martyrdom speaks of a heart belonging wholly to the Lord.

For the faithful today, this celebration encourages protection of the vulnerable, courage in temptation, and confidence that Christ strengthens those who remain faithful.
$desc$),
('saint-ezequiel-moreno-bishop', $desc$
This celebration honors Saint Ezequiel Moreno, bishop and missionary, whose pastoral life was marked by zeal, endurance, and service to the Church in demanding circumstances. His memory reflects the missionary breadth of episcopal charity.

Ezequiel's witness shows that a shepherd is called to guard the faith, strengthen communities, and spend himself for the Gospel. Pastoral holiness requires courage, prayer, sacrifice, and closeness to the people entrusted to one's care.

For believers today, this celebration invites prayer for bishops and missionaries, perseverance in service, and generous love for the Church.
$desc$),
('saint-teresa-of-jesus-jornet-and-ibars-virgin', $desc$
This celebration honors Saint Teresa of Jesus Jornet e Ibars, virgin and foundress, whose charity was devoted especially to elderly persons in need. Her life reveals the face of Christ in those who are frail, dependent, or forgotten.

Her witness teaches that care for the aged is not merely assistance but reverence for human dignity. In serving the elderly with tenderness, the Church honors memory, suffering, and the hidden wisdom of lives entrusted to God.

For believers today, this celebration invites compassion, patience, and concrete service to older persons and all who depend on the charity of others.
$desc$),
('our-lady-of-mercy', $desc$
This celebration honors Our Lady of Mercy, contemplating Mary's maternal intercession for those in captivity, danger, or oppression. It remembers the Christian conviction that mercy seeks the freedom and salvation of the whole person.

Devotion to Our Lady of Mercy points to Christ the Redeemer, whose saving love breaks the deepest forms of bondage. Mary accompanies the Church's prayer and service for those who suffer visible and hidden captivity.

For believers today, this celebration invites works of mercy, prayer for the oppressed, and confidence that God's compassion is stronger than every chain.
$desc$),
('saint-francis-borgia-priest', $desc$
This celebration honors Saint Francis Borgia, priest, religious, and former nobleman, whose conversion led him from worldly honors to the service of Christ. His life witnesses to the freedom found in surrendering status and ambition to God.

Francis's holiness joined humility, discipline, leadership, and missionary concern. He shows that the gifts of administration and influence can be purified by grace and redirected toward the building up of the Church.

For believers today, this celebration invites detachment, conversion of ambition, and generous use of talents for the greater glory of God.
$desc$),
('saint-thomas-of-villanova-bishop', $desc$
This celebration honors Saint Thomas of Villanova, bishop, preacher, and servant of the poor. His pastoral memory is marked by simplicity, reform, and a charity that treated the needy as members of Christ.

Thomas shows that episcopal leadership is credible when joined to humility and concrete mercy. His preaching and governance sought not personal prestige, but the renewal of Christian life and the relief of suffering.

For the faithful today, this celebration invites pastors and all Christians to unite truth with compassion, and worship with care for the poor.
$desc$),
('saint-soledad-torres-acosta-virgin', $desc$
This celebration honors Saint Soledad Torres Acosta, virgin and servant of the sick, whose life was marked by humility, perseverance, and compassion. She recognized Christ in those who suffered and gave herself to their care.

Her witness reveals the sanctity of hidden service. Patient charity at the bedside becomes a participation in the mercy of Christ, who draws near to the weak and wounded.

For believers today, this celebration invites tenderness toward the sick, fidelity in humble tasks, and trust that hidden charity is precious before God.
$desc$),
('our-lady-of-the-pillar', $desc$
This celebration honors Our Lady of the Pillar, a Marian devotion deeply associated with apostolic faith and perseverance. It contemplates Mary as mother and support of the Church, strengthening disciples in their witness to Christ.

The image of the pillar speaks of firmness, encouragement, and fidelity. Mary does not replace the foundation, who is Christ, but points believers toward him and supports the Church's mission by her maternal intercession.

For the faithful today, this celebration invites steadfast faith, confidence in Mary's care, and renewed commitment to bear witness to the Gospel.
$desc$),
('saint-peter-of-alcantara-priest', $desc$
This celebration honors Saint Peter of Alcántara, priest and reformer, remembered for austerity, prayer, and spiritual counsel. His life points to the evangelical freedom that comes from penance and intimate friendship with God.

Peter's witness shows that reform in the Church begins with conversion of heart. His asceticism was not contempt for creation, but a radical desire to belong wholly to Christ and to help others seek him.

For believers today, this celebration invites deeper prayer, simplicity of life, and openness to spiritual renewal.
$desc$),
('saint-leander-bishop', $desc$
This celebration honors Saint Leander, bishop and pastor, remembered for his role in strengthening Catholic faith and ecclesial unity. His ministry joined teaching, diplomacy, and perseverance in service of communion.

Leander's witness reminds the Church that truth and unity are gifts to be received and tasks to be served. Pastoral patience and doctrinal fidelity together help heal divisions and form believers in the apostolic faith.

For the faithful today, this celebration invites prayer for unity, love of sound doctrine, and patient work for reconciliation in Christ.
$desc$),
('saint-eulalia-of-merida-virgin-and-martyr', $desc$
This celebration honors Saint Eulalia of Mérida, virgin and martyr, whose witness has long inspired courage, purity, and fidelity to Christ. Her memory proclaims that even youthful faith can become strong through grace.

Eulalia's martyrdom is a confession that belonging to Christ surpasses fear, coercion, and worldly security. Her virginity and suffering point to an undivided heart offered to the Lord.

For believers today, this celebration encourages courage in witness, protection of innocence, and hope in the victory of Christ over violence and death.
$desc$),
('jesus-christ-the-eternal-high-priest', $desc$
This celebration honors Jesus Christ as the eternal High Priest, contemplating him as the one Mediator who offers himself to the Father for the salvation of the world. In him priesthood, sacrifice, and offering are perfectly one.

The mystery directs the Church to the heart of Christ's paschal offering. Every ordained ministry and every baptismal offering of the faithful receives meaning from his priesthood, which is holy, merciful, and everlasting.

For believers today, this celebration invites adoration, gratitude for the Eucharist, prayer for priests, and a deeper offering of one's life in union with Christ.
$desc$)
) AS x(slug, description)
ON f.slug = x.slug
WHERE ft.feast_id = f.id AND ft.locale_code = 'en';

-- 2) DESCRIPTIONS FR
UPDATE feast_translations ft
SET description = x.description
FROM feasts f
JOIN (VALUES
('saint-eulogius-of-cordoba-bishop-and-martyr', $desc$
Cette célébration honore saint Euloge de Cordoue, pasteur, maître et martyr, dont la fidélité fortifia les chrétiens vivant sous la pression. Sa mémoire unit la science, le soin pastoral et la courageuse confession du Christ.

Euloge montre que la parole de Dieu peut être gardée et proclamée même lorsque le témoignage public coûte cher. Sa sainteté s'exprima dans l'enseignement, l'encouragement des fidèles et l'acceptation de la souffrance plutôt que le reniement du Seigneur.

Pour les croyants aujourd'hui, cette célébration invite à la persévérance, à la clarté de la foi et à la charité envers les communautés éprouvées par l'hostilité ou la peur.
$desc$),
('saints-fructuosus-augurius-and-eulogius-martyrs', $desc$
Cette célébration honore saints Fructueux, Augure et Euloge, martyrs dont le témoignage commun manifeste l'unité de l'Église autour de son pasteur et de ses ministres. Leur mort proclame que le Christ vaut plus que la vie elle-même.

Leur témoignage appartient à la mémoire ancienne de l'Église, où l'évêque, les diacres et les fidèles étaient fortifiés par l'espérance eucharistique de participer au sacrifice et à la victoire du Seigneur.

Pour les fidèles aujourd'hui, cette célébration encourage le courage, l'unité ecclésiale et la confiance que la souffrance portée dans le Christ devient semence de vie.
$desc$),
('saint-ildephonsus-of-toledo-bishop', $desc$
Cette célébration honore saint Ildefonse de Tolède, évêque et docteur, rappelé particulièrement pour sa défense du mystère du Christ et sa dévotion à la Mère de Dieu. Son témoignage unit la clarté doctrinale au service liturgique et pastoral.

Ildefonse rappelle à l'Église qu'une authentique dévotion mariale protège et approfondit la foi en l'Incarnation. Honorer Marie justement, c'est confesser plus pleinement la dignité de son Fils, vrai Dieu et vrai homme.

Pour les croyants aujourd'hui, cette célébration invite à aimer la saine doctrine, le culte révérencieux et une dévotion à Marie qui conduit toujours au Christ.
$desc$),
('saint-hermenegild-martyr', $desc$
Cette célébration honore saint Herménégilde, martyr, dont le témoignage est lié à la fidélité à la foi catholique au milieu de conflits familiaux et politiques. Sa mémoire contemple une conscience formée par la vérité et fortifiée par la grâce.

Le martyre d'Herménégilde montre que la foi ne peut être réduite à la convenance, à l'héritage ou à l'avantage public. Le disciple peut être appelé à choisir la communion avec le Christ même lorsque ce choix entraîne souffrance et perte.

Pour les fidèles aujourd'hui, cette célébration encourage la fermeté sans amertume, la fidélité sans orgueil et la confiance que Dieu peut tirer de l'obéissance coûteuse réconciliation et fruit.
$desc$),
('saint-peter-of-saint-joseph-de-betancur-missionary', $desc$
Cette célébration honore saint Pierre de Saint-Joseph de Betancur, missionnaire et serviteur des pauvres, dont la vie unit contemplation, pénitence et miséricorde concrète. Il reconnut le Christ dans les malades, les abandonnés et les oubliés.

Sa sainteté révèle le cœur missionnaire de l'Église : l'évangélisation devient crédible lorsque l'Évangile est annoncé par la compassion, l'humilité et le sacrifice personnel. L'amour du Christ devint en lui hospitalité pour les plus petits.

Pour les croyants aujourd'hui, cette célébration invite au service généreux, à la simplicité de vie et à une charité missionnaire qui rend visible la proximité de Dieu.
$desc$),
('saint-isidore-of-seville-bishop-and-doctor', $desc$
Cette célébration honore saint Isidore de Séville, évêque et docteur de l'Église, dont le savoir servit la conservation et la transmission de la sagesse chrétienne. Il chercha à rassembler la connaissance à la lumière de la foi et à la mettre au service de l'Église.

Le témoignage d'Isidore montre que l'étude peut devenir charité lorsqu'elle aide les croyants à comprendre la création, l'histoire, le langage et la doctrine comme des dons ordonnés à la vérité. Son savoir pastoral forma les esprits et fortifia la vie ecclésiale.

Pour les fidèles aujourd'hui, cette célébration encourage l'étude disciplinée, l'amour de la doctrine sacrée et l'usage humble de la connaissance pour l'évangélisation et le service.
$desc$),
('saint-isidore-the-farmer', $desc$
Cette célébration honore saint Isidore le Laboureur, dont la sainteté fut vécue dans le travail ordinaire, la prière et la vie familiale. Sa mémoire montre que la sainteté n'est pas réservée aux cloîtres ou aux charges publiques, mais peut fleurir dans les champs, les maisons et les responsabilités quotidiennes.

La vie d'Isidore contemple le travail comme un lieu de communion avec Dieu lorsqu'il est marqué par l'honnêteté, la gratitude et le souci des pauvres. La prière ne l'éloignait pas du devoir, mais purifiait et soutenait son labeur.

Pour les croyants aujourd'hui, cette célébration invite à la sanctification du travail, à la simplicité, à la générosité et à la confiance en la providence de Dieu au cœur des tâches ordinaires.
$desc$),
('saint-paschal-baylon', $desc$
Cette célébration honore saint Pascal Baylon, religieux, rappelé pour son humilité, sa pauvreté et sa profonde dévotion à l'Eucharistie. Sa vie exprime un amour simple et ardent pour le Christ réellement présent au milieu de son peuple.

Le témoignage de Pascal enseigne que la foi eucharistique n'est pas seulement un sentiment dévot, mais une école d'adoration, d'obéissance et de charité. La contemplation de la présence du Seigneur façonna son service et sa pauvreté d'esprit.

Pour les croyants aujourd'hui, cette célébration invite à une révérence renouvelée envers l'Eucharistie, à la prière humble et à une vie rendue généreuse par l'adoration.
$desc$),
('saint-joaquina-vedruna', $desc$
Cette célébration honore sainte Joaquina Vedruna, épouse, mère, veuve, fondatrice et servante de l'éducation chrétienne et de la charité. Sa vie montre l'ampleur de la sainteté à travers les changements d'état de vie.

Joaquina répondit à l'appel de Dieu par la fidélité familiale, la souffrance et le service apostolique. Son témoignage révèle comment les épreuves personnelles peuvent devenir un chemin de fécondité plus large lorsqu'elles sont offertes au Christ dans la foi.

Pour les fidèles aujourd'hui, cette célébration encourage l'ouverture à la vocation, la persévérance dans les changements et le service généreux des jeunes, des malades et des pauvres.
$desc$),
('saint-ferdinand', $desc$
Cette célébration honore saint Ferdinand, rappelé comme un souverain qui chercha à unir responsabilité publique et foi chrétienne. Sa mémoire invite à comprendre l'autorité comme un service placé sous le jugement de Dieu.

La sainteté associée à Ferdinand ne célèbre pas le pouvoir pour lui-même, mais la justice, la dévotion et le souci que la vie civile soit ordonnée au bien commun. Le leadership chrétien doit demeurer responsable devant la vérité et la miséricorde.

Pour les croyants aujourd'hui, cette célébration encourage la prière pour ceux qui gouvernent et un engagement renouvelé pour la justice, la paix et l'usage responsable de l'autorité.
$desc$),
('saint-jose-de-anchieta-missionary', $desc$
Cette célébration honore saint José de Anchieta, missionnaire, prêtre, éducateur et évangélisateur, dont la vie fut consacrée à porter l'Évangile au-delà des cultures. Sa mémoire met en valeur la patience, la langue, l'enseignement et la charité comme instruments de mission.

Le témoignage d'Anchieta montre que l'évangélisation exige à la fois zèle et respect, proclamation et service. Le missionnaire devient serviteur du Christ en se rendant proche des peuples, en apprenant leurs besoins et en offrant l'espérance de l'Évangile.

Pour les croyants aujourd'hui, cette célébration invite à la créativité missionnaire, à la persévérance et à une charité capable de franchir les frontières pour le Christ.
$desc$),
('saint-maria-micaela-of-the-blessed-sacrament-virgin', $desc$
Cette célébration honore sainte María Micaela du Saint-Sacrement, vierge et fondatrice, dont la vie unit l'adoration eucharistique au relèvement de femmes vulnérables. Sa charité était enracinée dans la contemplation du Christ.

Son témoignage montre que l'adoration et la miséricorde sociale vont ensemble. Devant le Seigneur eucharistique, elle apprit à reconnaître la dignité blessée et à servir celles que la société était tentée d'ignorer ou de condamner.

Pour les croyants aujourd'hui, cette célébration invite à la révérence envers l'Eucharistie, à l'action compatissante et à l'espérance dans la puissance guérissante de la grâce.
$desc$),
('saint-pelagius-martyr', $desc$
Cette célébration honore saint Pélage, martyr, rappelé pour son courage juvénile, sa pureté et sa fidélité au Christ sous la contrainte. Son témoignage proclame la dignité de la conscience et la force donnée par la grâce.

Pélage rappelle à l'Église que la sainteté peut briller chez les jeunes et que la chasteté est une forme de liberté ordonnée à l'amour. Son martyre parle d'un cœur appartenant entièrement au Seigneur.

Pour les fidèles aujourd'hui, cette célébration encourage la protection des vulnérables, le courage dans la tentation et la confiance que le Christ fortifie ceux qui demeurent fidèles.
$desc$),
('saint-ezequiel-moreno-bishop', $desc$
Cette célébration honore saint Ézéchiel Moreno, évêque et missionnaire, dont la vie pastorale fut marquée par le zèle, l'endurance et le service de l'Église dans des circonstances exigeantes. Sa mémoire reflète l'ampleur missionnaire de la charité épiscopale.

Le témoignage d'Ézéchiel montre qu'un pasteur est appelé à garder la foi, à fortifier les communautés et à se dépenser pour l'Évangile. La sainteté pastorale demande courage, prière, sacrifice et proximité avec le peuple confié.

Pour les croyants aujourd'hui, cette célébration invite à prier pour les évêques et les missionnaires, à persévérer dans le service et à aimer généreusement l'Église.
$desc$),
('saint-teresa-of-jesus-jornet-and-ibars-virgin', $desc$
Cette célébration honore sainte Thérèse de Jésus Jornet e Ibars, vierge et fondatrice, dont la charité fut consacrée spécialement aux personnes âgées dans le besoin. Sa vie révèle le visage du Christ dans ceux qui sont fragiles, dépendants ou oubliés.

Son témoignage enseigne que le soin des anciens n'est pas seulement une assistance, mais une révérence pour la dignité humaine. En servant les personnes âgées avec tendresse, l'Église honore la mémoire, la souffrance et la sagesse cachée des vies confiées à Dieu.

Pour les croyants aujourd'hui, cette célébration invite à la compassion, à la patience et au service concret des personnes âgées et de tous ceux qui dépendent de la charité d'autrui.
$desc$),
('our-lady-of-mercy', $desc$
Cette célébration honore Notre-Dame de la Merci, en contemplant l'intercession maternelle de Marie pour ceux qui sont captifs, en danger ou opprimés. Elle rappelle la conviction chrétienne que la miséricorde cherche la liberté et le salut de toute la personne.

La dévotion à Notre-Dame de la Merci renvoie au Christ Rédempteur, dont l'amour sauveur brise les formes les plus profondes de servitude. Marie accompagne la prière et le service de l'Église pour ceux qui souffrent de captivités visibles ou cachées.

Pour les croyants aujourd'hui, cette célébration invite aux œuvres de miséricorde, à la prière pour les opprimés et à la confiance que la compassion de Dieu est plus forte que toute chaîne.
$desc$),
('saint-francis-borgia-priest', $desc$
Cette célébration honore saint François Borgia, prêtre, religieux et ancien noble, dont la conversion le conduisit des honneurs du monde au service du Christ. Sa vie témoigne de la liberté trouvée lorsqu'on remet à Dieu le rang et l'ambition.

La sainteté de François unit humilité, discipline, gouvernement et souci missionnaire. Il montre que les dons d'administration et d'influence peuvent être purifiés par la grâce et réorientés vers l'édification de l'Église.

Pour les croyants aujourd'hui, cette célébration invite au détachement, à la conversion de l'ambition et à l'usage généreux des talents pour la plus grande gloire de Dieu.
$desc$),
('saint-thomas-of-villanova-bishop', $desc$
Cette célébration honore saint Thomas de Villeneuve, évêque, prédicateur et serviteur des pauvres. Sa mémoire pastorale est marquée par la simplicité, la réforme et une charité qui traitait les nécessiteux comme des membres du Christ.

Thomas montre que la direction épiscopale devient crédible lorsqu'elle est unie à l'humilité et à la miséricorde concrète. Sa prédication et son gouvernement ne cherchèrent pas le prestige personnel, mais le renouvellement de la vie chrétienne et le soulagement de la souffrance.

Pour les fidèles aujourd'hui, cette célébration invite pasteurs et chrétiens à unir vérité et compassion, culte et soin des pauvres.
$desc$),
('saint-soledad-torres-acosta-virgin', $desc$
Cette célébration honore sainte Soledad Torres Acosta, vierge et servante des malades, dont la vie fut marquée par l'humilité, la persévérance et la compassion. Elle reconnut le Christ en ceux qui souffraient et se donna à leur soin.

Son témoignage révèle la sainteté du service caché. La charité patiente au chevet des malades devient une participation à la miséricorde du Christ, qui s'approche des faibles et des blessés.

Pour les croyants aujourd'hui, cette célébration invite à la tendresse envers les malades, à la fidélité dans les tâches humbles et à la confiance que la charité cachée est précieuse devant Dieu.
$desc$),
('our-lady-of-the-pillar', $desc$
Cette célébration honore Notre-Dame du Pilier, une dévotion mariale profondément liée à la foi apostolique et à la persévérance. Elle contemple Marie comme mère et soutien de l'Église, fortifiant les disciples dans leur témoignage au Christ.

L'image du pilier parle de fermeté, d'encouragement et de fidélité. Marie ne remplace pas le fondement, qui est le Christ, mais oriente les croyants vers lui et soutient la mission de l'Église par son intercession maternelle.

Pour les fidèles aujourd'hui, cette célébration invite à une foi ferme, à la confiance dans la sollicitude de Marie et à un engagement renouvelé pour témoigner de l'Évangile.
$desc$),
('saint-peter-of-alcantara-priest', $desc$
Cette célébration honore saint Pierre d'Alcántara, prêtre et réformateur, rappelé pour son austérité, sa prière et son conseil spirituel. Sa vie renvoie à la liberté évangélique qui naît de la pénitence et de l'amitié intime avec Dieu.

Le témoignage de Pierre montre que la réforme dans l'Église commence par la conversion du cœur. Son ascèse n'était pas mépris de la création, mais désir radical d'appartenir entièrement au Christ et d'aider les autres à le chercher.

Pour les croyants aujourd'hui, cette célébration invite à une prière plus profonde, à la simplicité de vie et à l'ouverture au renouvellement spirituel.
$desc$),
('saint-leander-bishop', $desc$
Cette célébration honore saint Léandre, évêque et pasteur, rappelé pour son rôle dans l'affermissement de la foi catholique et de l'unité ecclésiale. Son ministère unit enseignement, diplomatie et persévérance au service de la communion.

Le témoignage de Léandre rappelle à l'Église que la vérité et l'unité sont des dons à recevoir et des tâches à servir. La patience pastorale et la fidélité doctrinale aident ensemble à guérir les divisions et à former les croyants dans la foi apostolique.

Pour les fidèles aujourd'hui, cette célébration invite à prier pour l'unité, à aimer la saine doctrine et à travailler patiemment à la réconciliation dans le Christ.
$desc$),
('saint-eulalia-of-merida-virgin-and-martyr', $desc$
Cette célébration honore sainte Eulalie de Mérida, vierge et martyre, dont le témoignage inspira depuis longtemps le courage, la pureté et la fidélité au Christ. Sa mémoire proclame que même la foi jeune peut devenir forte par la grâce.

Le martyre d'Eulalie confesse que l'appartenance au Christ dépasse la peur, la contrainte et la sécurité du monde. Sa virginité et sa souffrance indiquent un cœur sans partage offert au Seigneur.

Pour les croyants aujourd'hui, cette célébration encourage le courage dans le témoignage, la protection de l'innocence et l'espérance dans la victoire du Christ sur la violence et la mort.
$desc$),
('jesus-christ-the-eternal-high-priest', $desc$
Cette célébration honore Jésus Christ comme Souverain Prêtre éternel, en le contemplant comme l'unique Médiateur qui s'offre au Père pour le salut du monde. En lui, le sacerdoce, le sacrifice et l'offrande sont parfaitement unis.

Ce mystère conduit l'Église au cœur de l'offrande pascale du Christ. Tout ministère ordonné et toute offrande baptismale des fidèles reçoivent leur sens de son sacerdoce, qui est saint, miséricordieux et éternel.

Pour les croyants aujourd'hui, cette célébration invite à l'adoration, à la gratitude pour l'Eucharistie, à la prière pour les prêtres et à une offrande plus profonde de sa vie en union avec le Christ.
$desc$)
) AS x(slug, description)
ON f.slug = x.slug
WHERE ft.feast_id = f.id AND ft.locale_code = 'fr';

-- 3) DESCRIPTIONS LA
UPDATE feast_translations ft
SET description = x.description
FROM feasts f
JOIN (VALUES
('saint-eulogius-of-cordoba-bishop-and-martyr', $desc$
Haec celebratio sanctum Eulogium Cordubensem, pastorem, doctorem et martyrem, honorat, cuius fidelitas christianos sub pressione viventes confirmavit. Eius memoria doctrinam, curam pastoralem et fortem Christi confessionem coniungit.

Eulogius ostendit verbum Dei custodiri et annuntiari posse etiam cum testimonium publicum magno pretio constat. Sanctitas eius in doctrina, consolatione fidelium et passione potius quam Domini negatione apparuit.

Fideles hodie haec celebratio ad perseverantiam, fidei claritatem et caritatem erga communitates hostilitate vel metu probatas invitat.
$desc$),
('saints-fructuosus-augurius-and-eulogius-martyrs', $desc$
Haec celebratio sanctos Fructuosum, Augurium et Eulogium martyres honorat, quorum commune testimonium unitatem Ecclesiae circa pastorem et ministros manifestat. Mors eorum proclamat Christum ipsa vita cariorem esse.

Testimonium eorum ad antiquam Ecclesiae memoriam pertinet, in qua episcopus, diaconi et fideles spe eucharistica participationis sacrificii et victoriae Domini roborabantur.

Fideles hodie haec celebratio ad fortitudinem, unitatem ecclesialem et fiduciam invitat quod passio in Christo portata semen vitae fit.
$desc$),
('saint-ildephonsus-of-toledo-bishop', $desc$
Haec celebratio sanctum Ildephonsum Toletanum, episcopum et doctorem, honorat, praesertim ob defensionem mysterii Christi et devotionem erga Dei Genetricem memoratum. Testimonium eius doctrinalem claritatem cum servitio liturgico et pastorali coniungit.

Ildephonsus Ecclesiae memorat authenticam devotionem marianam fidem in Incarnationem custodire et profundius efficere. Mariam recte honorare est dignitatem Filii eius, veri Dei et veri hominis, plenius confiteri.

Fideles hodie haec celebratio ad sanam doctrinam diligendam, cultum reverentem et devotionem Marianam semper ad Christum ducentem invitat.
$desc$),
('saint-hermenegild-martyr', $desc$
Haec celebratio sanctum Hermenegildum martyrem honorat, cuius testimonium cum fidelitate fidei catholicae inter conflictus familiares et politicos coniungitur. Eius memoria conscientiam veritate formatam et gratia roboratam contemplatur.

Martyrium Hermenegildi ostendit fidem non ad commodum, hereditatem aut utilitatem publicam redigi posse. Discipulus vocari potest ut communionem cum Christo eligat etiam cum electio dolorem et iacturam affert.

Fideles hodie haec celebratio ad firmitatem sine amaritudine, fidelitatem sine superbia et fiduciam invitat Deum ex oboedientia pretiosa reconciliationem et fructum elicere posse.
$desc$),
('saint-peter-of-saint-joseph-de-betancur-missionary', $desc$
Haec celebratio sanctum Petrum a Sancto Iosepho de Betancur, missionarium et pauperum servum, honorat, cuius vita contemplationem, paenitentiam et misericordiam concretam coniunxit. Christum in infirmis, derelictis et oblivioni datis agnovit.

Sanctitas eius cor missionarium Ecclesiae revelat: evangelizatio credibilis fit cum Evangelium compassione, humilitate et personali sacrificio annuntiatur. Amor Christi in eo hospitalitas pro minimis factus est.

Fideles hodie haec celebratio ad generosum servitium, vitae simplicitatem et caritatem missionariam Dei propinquitatem visibilem facientem invitat.
$desc$),
('saint-isidore-of-seville-bishop-and-doctor', $desc$
Haec celebratio sanctum Isidorum Hispalensem, episcopum et Ecclesiae doctorem, honorat, cuius doctrina sapientiae christianae servandae et tradendae inservivit. Scientiam sub lumine fidei colligere et Ecclesiae servire studuit.

Testimonium Isidori ostendit studium caritatem fieri posse, cum credentes adiuvat creationem, historiam, linguam et doctrinam ut dona ad veritatem ordinata intellegere. Doctrina eius pastoralis mentes formavit et vitam ecclesialem roboravit.

Fideles hodie haec celebratio ad studium disciplinatum, amorem doctrinae sacrae et humilem scientiae usum pro evangelizatione et servitio hortatur.
$desc$),
('saint-isidore-the-farmer', $desc$
Haec celebratio sanctum Isidorum Agricolam honorat, cuius sanctitas in labore cotidiano, oratione et vita familiari vixit. Eius memoria ostendit sanctitatem non claustris aut officiis publicis contineri, sed in agris, domibus et officiis quotidianis florere posse.

Vita Isidori laborem contemplatur ut locum communionis cum Deo, cum honestate, gratitudine et cura pauperum signatur. Oratio eum a munere non removit, sed laborem purificavit et sustentavit.

Fideles hodie haec celebratio ad sanctificationem laboris, simplicitatem, generositatem et fiduciam in providentia Dei inter officia ordinaria invitat.
$desc$),
('saint-paschal-baylon', $desc$
Haec celebratio sanctum Paschalem Baylon religiosum honorat, humilitate, paupertate et profunda erga Eucharistiam devotione memoratum. Vita eius simplicem et ardentem amorem Christi vere praesentis exprimit.

Testimonium Paschalis docet fidem eucharisticam non solum affectum devotum esse, sed scholam adorationis, oboedientiae et caritatis. Contemplatio praesentiae Domini servitium et paupertatem spiritus eius formavit.

Fideles hodie haec celebratio ad renovatam Eucharistiae reverentiam, humilem orationem et vitam adoratione generosam factam invitat.
$desc$),
('saint-joaquina-vedruna', $desc$
Haec celebratio sanctam Ioachimam Vedruna honorat, uxorem, matrem, viduam, fundatricem et educationis christianae atque caritatis ministram. Vita eius amplitudinem sanctitatis per varios vitae status ostendit.

Ioachima vocationi Dei per fidelitatem familiarem, dolorem et servitium apostolicum respondit. Eius testimonium revelat probationes personales viam ad maiorem fecunditatem fieri posse, cum Christo in fide offeruntur.

Fideles hodie haec celebratio ad vocationi aperiendum cor, perseverantiam inter mutationes et generosum servitium iuvenum, infirmorum et pauperum hortatur.
$desc$),
('saint-ferdinand', $desc$
Haec celebratio sanctum Ferdinandum honorat, rectorem memoratum qui publicam responsabilitatem cum fide christiana coniungere studuit. Eius memoria auctoritatem ut servitium sub iudicio Dei considerare invitat.

Sanctitas Ferdinando coniuncta non potestatem propter se celebrat, sed iustitiam, devotionem et curam ut vita civilis ad bonum commune ordinetur. Ductus christianus veritati et misericordiae semper rationem reddere debet.

Fideles hodie haec celebratio ad orationem pro gubernantibus et ad renovatum studium iustitiae, pacis et responsalis auctoritatis usus invitat.
$desc$),
('saint-jose-de-anchieta-missionary', $desc$
Haec celebratio sanctum Iosephum de Anchieta, missionarium, presbyterum, educatorem et evangelizatorem, honorat, cuius vita Evangelium inter culturas ferre intenta fuit. Eius memoria patientiam, linguam, doctrinam et caritatem tamquam instrumenta missionis extollit.

Testimonium Anchietae ostendit evangelizationem et zelum et reverentiam, proclamationem et servitium exigere. Missionarius servus Christi fit dum populis appropinquat, necessitates discit et spem Evangelii offert.

Fideles hodie haec celebratio ad creativitatem missionariam, perseverantiam et caritatem fines propter Christum transire valentem invitat.
$desc$),
('saint-maria-micaela-of-the-blessed-sacrament-virgin', $desc$
Haec celebratio sanctam Mariam Michaëlam a Sanctissimo Sacramento, virginem et fundatricem, honorat, cuius vita adorationem eucharisticam cum restauratione mulierum vulnerabilium coniunxit. Caritas eius in contemplatione Christi radicata erat.

Testimonium eius ostendit adorationem et misericordiam socialem simul pertinere. Coram Domino eucharistico dignitatem vulneratam agnoscere didicit et eas servire quas societas ignorare vel condemnare tentabatur.

Fideles hodie haec celebratio ad Eucharistiae reverentiam, actionem compatientem et spem in virtute sanante gratiae invitat.
$desc$),
('saint-pelagius-martyr', $desc$
Haec celebratio sanctum Pelagium martyrem honorat, iuvenili fortitudine, puritate et fidelitate Christo sub coactione memoratum. Testimonium eius dignitatem conscientiae et robur gratia datum proclamat.

Pelagius Ecclesiae memorat sanctitatem in iuvenibus fulgere posse et castitatem formam libertatis ad amorem ordinatae esse. Martyrium eius de corde totum Domino pertinente loquitur.

Fideles hodie haec celebratio ad tutelam vulnerabilium, fortitudinem in tentatione et fiduciam invitat Christum eos qui fideles manent roborare.
$desc$),
('saint-ezequiel-moreno-bishop', $desc$
Haec celebratio sanctum Ezechielem Moreno, episcopum et missionarium, honorat, cuius vita pastoralis zelo, patientia et servitio Ecclesiae in rebus difficilibus signata fuit. Eius memoria latitudinem missionariam caritatis episcopalis refert.

Testimonium Ezechielis ostendit pastorem vocari ad fidem custodiendam, communitates confirmandas et se pro Evangelio impendendum. Sanctitas pastoralis fortitudinem, orationem, sacrificium et propinquitatem populo commisso requirit.

Fideles hodie haec celebratio ad orationem pro episcopis et missionariis, perseverantiam in servitio et generosum amorem Ecclesiae invitat.
$desc$),
('saint-teresa-of-jesus-jornet-and-ibars-virgin', $desc$
Haec celebratio sanctam Teresiam a Iesu Jornet et Ibars, virginem et fundatricem, honorat, cuius caritas praesertim senibus egentibus dedicata fuit. Vita eius vultum Christi in fragilibus, dependentibus et oblivioni datis revelat.

Testimonium eius docet curam senum non solum auxilium esse, sed reverentiam dignitatis humanae. Senes cum teneritudine serviens Ecclesia memoriam, dolorem et occultam sapientiam vitarum Deo commissarum honorat.

Fideles hodie haec celebratio ad compassionem, patientiam et concretum servitium senum omniumque qui caritate aliorum indigent invitat.
$desc$),
('our-lady-of-mercy', $desc$
Haec celebratio Beatam Mariam Virginem de Mercede honorat, maternam Mariae intercessionem pro captivis, periclitantibus et oppressis contemplans. Memoriam servat persuasionis christianae misericordiam libertatem et salutem totius personae quaerere.

Devotio erga Dominam Nostram de Mercede ad Christum Redemptorem ducit, cuius amor salvificus profundissimas servitutis formas frangit. Maria orationem et servitium Ecclesiae pro iis qui captivitatem visibilem vel occultam patiuntur comitatur.

Fideles hodie haec celebratio ad opera misericordiae, orationem pro oppressis et fiduciam invitat misericordiam Dei omni vinculo fortiorem esse.
$desc$),
('saint-francis-borgia-priest', $desc$
Haec celebratio sanctum Franciscum Borgia, presbyterum, religiosum et quondam nobilem, honorat, cuius conversio eum ab honoribus mundi ad servitium Christi duxit. Vita eius libertatem testatur quae in statu et ambitione Deo tradendis invenitur.

Sanctitas Francisci humilitatem, disciplinam, gubernationem et curam missionariam coniunxit. Ostendit dona administrationis et auctoritatis gratia purificari et ad Ecclesiam aedificandam dirigi posse.

Fideles hodie haec celebratio ad detachmentum, conversionem ambitionis et generosum talentorum usum ad maiorem Dei gloriam invitat.
$desc$),
('saint-thomas-of-villanova-bishop', $desc$
Haec celebratio sanctum Thomam a Villanova, episcopum, praedicatorem et pauperum servum, honorat. Memoria eius pastoralis simplicitate, reformatione et caritate signatur quae egentes tamquam membra Christi tractabat.

Thomas ostendit regimen episcopale credibile fieri cum humilitati et misericordiae concretae iungitur. Praedicatio et gubernatio eius non gloriam propriam quaesierunt, sed renovationem vitae christianae et alleviationem doloris.

Fideles hodie haec celebratio pastores omnesque christianos invitat ut veritatem cum compassione et cultum cum cura pauperum coniungant.
$desc$),
('saint-soledad-torres-acosta-virgin', $desc$
Haec celebratio sanctam Soledatem Torres Acosta, virginem et infirmorum ministram, honorat, cuius vita humilitate, perseverantia et compassione signata fuit. Christum in patientibus agnovit et eorum curae se tradidit.

Testimonium eius sanctitatem servitii occulti revelat. Patiens caritas ad lectum infirmorum fit participatio misericordiae Christi, qui infirmis et vulneratis appropinquat.

Fideles hodie haec celebratio ad teneritudinem erga infirmos, fidelitatem in humilibus officiis et fiduciam invitat occultam caritatem coram Deo pretiosam esse.
$desc$),
('our-lady-of-the-pillar', $desc$
Haec celebratio Beatam Mariam Virginem de Columna honorat, devotionem Marianam cum fide apostolica et perseverantia intime coniunctam. Mariam contemplatur ut matrem et firmamentum Ecclesiae, discipulos in testimonio Christi roborantem.

Imago columnae firmitatem, consolationem et fidelitatem significat. Maria fundamentum, quod Christus est, non substituit, sed credentes ad eum dirigit et missionem Ecclesiae materna intercessione sustinet.

Fideles hodie haec celebratio ad firmam fidem, fiduciam in cura Mariae et renovatum studium Evangelii testificandi invitat.
$desc$),
('saint-peter-of-alcantara-priest', $desc$
Haec celebratio sanctum Petrum de Alcantara, presbyterum et reformatorem, honorat, austeritate, oratione et consilio spirituali memoratum. Vita eius libertatem evangelicam ostendit quae ex paenitentia et intima cum Deo amicitia nascitur.

Testimonium Petri ostendit reformationem in Ecclesia a conversione cordis incipere. Ascesis eius non contemptus creationis fuit, sed radicale desiderium totum Christo pertinendi et alios ad eum quaerendum adiuvandi.

Fideles hodie haec celebratio ad profundiorem orationem, vitae simplicitatem et renovationi spirituali aperiendum cor invitat.
$desc$),
('saint-leander-bishop', $desc$
Haec celebratio sanctum Leandrum, episcopum et pastorem, honorat, ob munus in fide catholica et unitate ecclesiali confirmandis memoratum. Ministerium eius doctrinam, prudentiam et perseverantiam in servitio communionis coniunxit.

Testimonium Leandri Ecclesiae memorat veritatem et unitatem dona esse accipienda atque munera servienda. Patientia pastoralis et fidelitas doctrinalis simul divisiones sanare et credentes in fide apostolica formare adiuvant.

Fideles hodie haec celebratio ad orationem pro unitate, amorem sanae doctrinae et patientem laborem reconciliationis in Christo invitat.
$desc$),
('saint-eulalia-of-merida-virgin-and-martyr', $desc$
Haec celebratio sanctam Eulaliam Emeritensem, virginem et martyrem, honorat, cuius testimonium fortitudinem, puritatem et fidelitatem Christo diu inspiravit. Eius memoria proclamat etiam iuvenem fidem gratia robustam fieri posse.

Martyrium Eulaliae confitetur pertinere ad Christum metum, coactionem et securitatem mundanam superare. Virginitas et passio eius cor indivisum Domino oblatum significant.

Fideles hodie haec celebratio ad fortitudinem in testimonio, tutelam innocentiae et spem in victoria Christi super violentiam et mortem invitat.
$desc$),
('jesus-christ-the-eternal-high-priest', $desc$
Haec celebratio Iesum Christum Summum et Aeternum Sacerdotem honorat, eum contemplans ut unum Mediatorem qui se Patri pro salute mundi offert. In eo sacerdotium, sacrificium et oblatio perfecte unum sunt.

Hoc mysterium Ecclesiam ad cor oblationis paschalis Christi dirigit. Omne ministerium ordinatum et omnis oblatio baptismalis fidelium sensum accipit ex sacerdotio eius sancto, misericordi et sempiterno.

Fideles hodie haec celebratio ad adorationem, gratiam pro Eucharistia, orationem pro sacerdotibus et profundiorem vitae oblationem in unione cum Christo invitat.
$desc$)
) AS x(slug, description)
ON f.slug = x.slug
WHERE ft.feast_id = f.id AND ft.locale_code = 'la';

COMMIT;
