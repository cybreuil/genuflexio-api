-- Reviewed biography batch 1: saint-mary, saint-joseph, saint-john-the-baptist.
-- Prerequisite: seedRomanSaints.sql, including its nine existing en/fr/la rows.
-- The remaining 203 saints are outside this batch. Names, life_label, saint
-- metadata, patronages and attributes are deliberately not updated here.
-- English is the canonical editorial text; French and Latin follow its sections
-- and paragraphs. Scripture narratives, Catholic doctrine and historical limits
-- are distinguished; the sources do not support precise birth/death dates.
-- Sources below link to the consulted digital editions.

BEGIN;

UPDATE saint_translations AS st
SET short_description = x.short_description,
    full_biography = x.full_biography
FROM saints AS s
JOIN (VALUES
(
  'saint-mary',
  'en',
  'Mary of Nazareth, mother of Jesus and spouse of Joseph, receives God''s word in faith. Scripture presents her at the beginnings of Jesus'' life, at his cross, and among the praying disciples; Catholic faith venerates her as Mother of God.',
  $desc$## Identity and sources

Mary of Nazareth is known above all through the New Testament as the mother of Jesus. Matthew and Luke place her within the Jewish people and identify Joseph as her spouse; Luke locates the annunciation of Jesus' birth at Nazareth in Galilee. These writings proclaim the meaning of Jesus' coming rather than offer a continuous biography of his mother. They do not establish her date of birth, describe her childhood, or give a chronology of her final years. A responsible account therefore distinguishes what the biblical narratives say from the Church's later doctrinal formulations and from details the sources leave unknown.

## The annunciation and the birth of Jesus

In Luke 1, the angel Gabriel announces that Mary will bear a son whose kingdom will have no end. When she asks how this will happen, the angel attributes the conception to the Holy Spirit. Mary freely accepts the word addressed to her. The narrative presents neither a self-appointed mission nor an understanding of everything to come, but a response of trust to God's initiative. Matthew 1 tells the beginning from Joseph's perspective: he is instructed in a dream to receive Mary and to name the child Jesus.

Luke then recounts Mary's visit to Elizabeth in the hill country of Judaea. Elizabeth welcomes her as the mother of her Lord and blesses her faith; the child in Elizabeth's womb leaps at Mary's greeting. The Magnificat places Mary's thanksgiving within the promises made to Israel. Its praise concerns God's mercy, the raising of the lowly and the feeding of the hungry, not an achievement Mary claims for herself. Luke says that she remains with Elizabeth for about three months before returning home.

In Luke 2, Mary travels with Joseph to Bethlehem and gives birth to Jesus, whom she lays in a manger. Shepherds find the child with Mary and Joseph and report what they have heard about him. The evangelist repeatedly describes Mary as preserving and pondering these events. At the presentation in the Temple, Simeon associates the child with salvation and opposition and tells Mary of sorrow that will pierce her own soul. Matthew 2 adds a different sequence: the visit of the magi, Joseph's flight with the child and his mother into Egypt, and their settlement at Nazareth after Herod's death.

## Following her son

The account of the twelve-year-old Jesus in the Temple is Luke's final childhood episode. Mary and Joseph search anxiously before finding him among the teachers. His answer directs them to his Father, but Luke expressly says that they do not understand it. Jesus returns with them to Nazareth, and Mary continues to keep these matters in her heart. The passage leaves room for the growth and difficulty of faith; it does not portray motherhood as complete foreknowledge of Jesus' mission.

John's Gospel places Jesus' mother at the wedding at Cana, where she notices the lack of wine and directs the servants to follow his instructions. The sign that follows manifests Jesus' glory. Later, she stands near his cross with other women and the disciple whom Jesus loves. Jesus entrusts mother and disciple to one another, and the disciple receives her into his care. Acts 1 subsequently names Mary among those persevering in prayer with the apostles. These are distinct scriptural scenes, not evidence for a detailed itinerary of all her movements during or after Jesus' ministry.

## Catholic faith and the limits of biography

Catholic teaching calls Mary Mother of God because the son she bore is the incarnate Son of God; the title concerns Christ's identity and does not make Mary the origin of his divinity. The Second Vatican Council's Lumen gentium presents her as both uniquely associated with Christ and a member and model of the Church. Her consent, charity and perseverance are understood in dependence on divine grace. The Council describes her life as a pilgrimage of faith and insists that her maternal role neither replaces nor diminishes Christ's unique mediation.

The same teaching affirms her virginal motherhood, her preservation from original sin and her assumption, body and soul, into heavenly glory at the completion of her earthly life. These are statements of Catholic faith, not dates or circumstances supplied by a surviving eyewitness biography. The New Testament passages cited here do not narrate her final days. Lumen gentium also distinguishes the veneration given to Mary from the adoration owed to God and warns against exaggeration and credulity. Thus her enduring place in Catholic life rests on her relationship to Christ and on the discipleship witnessed in Scripture, without requiring invented details to fill the silences.

## Sources

- Scripture: Matthew 1–2; Luke 1–2; John 2:1–12 and 19:25–27; Acts 1:12–14. [Douay-Rheims text consulted, digital mirror](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Second Vatican Council, Lumen gentium, especially §§53–60, 66–67. [Vatican edition](https://www.vatican.va/archive/hist_councils/ii_vatican_council/documents/vat-ii_const_19641121_lumen-gentium_en.html); [text consulted, chapter VIII in digital mirror](https://github.com/BenjaminPoole/Ecumenical-Christian-Library-Obsidian-Vault/blob/71c1582adc8ceca8f0ee35b41d4e9ddb0a493d49/03%20Councils%2C%20Creeds%20%26%20Confessions%20%28325%E2%80%93present%29/Vatican%20II%20%281962%29/Vatican%20II%20%E2%80%94%20Lumen%20Gentium%20II.md).
$desc$
),
(
  'saint-mary',
  'fr',
  'Marie de Nazareth, mère de Jésus et épouse de Joseph, accueille avec foi la parole de Dieu. L''Écriture la présente aux débuts de la vie de Jésus, auprès de sa croix et parmi les disciples en prière ; la foi catholique la vénère comme Mère de Dieu.',
  $desc$## Identité et sources

Marie de Nazareth est connue avant tout par le Nouveau Testament comme la mère de Jésus. Matthieu et Luc la situent au sein du peuple juif et désignent Joseph comme son époux ; Luc place l'annonce de la naissance de Jésus à Nazareth, en Galilée. Ces écrits proclament le sens de la venue de Jésus plutôt qu'ils ne donnent une biographie continue de sa mère. Ils n'établissent pas sa date de naissance, ne décrivent pas son enfance et ne fournissent aucune chronologie de ses dernières années. Un récit rigoureux distingue donc ce que disent les récits bibliques, les formulations doctrinales ultérieures de l'Église et les détails que les sources laissent inconnus.

## L'annonciation et la naissance de Jésus

En Luc 1, l'ange Gabriel annonce à Marie qu'elle enfantera un fils dont le règne n'aura pas de fin. Lorsqu'elle demande comment cela se fera, l'ange attribue la conception à l'Esprit Saint. Marie accueille librement la parole qui lui est adressée. Le récit ne présente ni une mission qu'elle se serait donnée elle-même ni une compréhension de tout l'avenir, mais une réponse confiante à l'initiative de Dieu. Matthieu 1 raconte ce commencement du point de vue de Joseph : un songe lui enjoint d'accueillir Marie et de donner à l'enfant le nom de Jésus.

Luc raconte ensuite la visite de Marie à Élisabeth dans la région montagneuse de Judée. Élisabeth l'accueille comme la mère de son Seigneur et bénit sa foi ; l'enfant qu'elle porte tressaille à la salutation de Marie. Le Magnificat inscrit l'action de grâce de Marie dans les promesses faites à Israël. Sa louange célèbre la miséricorde de Dieu, le relèvement des humbles et la nourriture donnée aux affamés, non un accomplissement qu'elle s'attribuerait. Luc précise qu'elle demeure environ trois mois auprès d'Élisabeth avant de rentrer chez elle.

En Luc 2, Marie se rend avec Joseph à Bethléem et donne naissance à Jésus, qu'elle couche dans une mangeoire. Des bergers trouvent l'enfant avec Marie et Joseph et rapportent ce qu'ils ont entendu à son sujet. À plusieurs reprises, l'évangéliste décrit Marie gardant et méditant ces événements. Lors de la présentation au Temple, Syméon associe l'enfant au salut et à la contradiction, et annonce à Marie une douleur qui transpercera son âme. Matthieu 2 ajoute une autre séquence : la visite des mages, la fuite de Joseph en Égypte avec l'enfant et sa mère, puis leur installation à Nazareth après la mort d'Hérode.

## À la suite de son fils

Le récit de Jésus au Temple à douze ans est le dernier épisode de l'enfance chez Luc. Marie et Joseph le cherchent avec angoisse avant de le retrouver parmi les docteurs. Sa réponse les renvoie à son Père, mais Luc précise qu'ils ne la comprennent pas. Jésus retourne avec eux à Nazareth, et Marie continue de garder ces choses dans son cœur. Le passage laisse place à la croissance et aux difficultés de la foi ; il ne présente pas la maternité comme une connaissance anticipée et complète de la mission de Jésus.

L'Évangile selon Jean situe la mère de Jésus aux noces de Cana, où elle remarque le manque de vin et invite les serviteurs à suivre ses instructions. Le signe qui suit manifeste la gloire de Jésus. Plus tard, elle se tient près de sa croix avec d'autres femmes et le disciple que Jésus aime. Jésus confie sa mère et le disciple l'un à l'autre, et le disciple la prend auprès de lui. Actes 1 nomme ensuite Marie parmi ceux qui persévèrent dans la prière avec les apôtres. Il s'agit de scènes scripturaires distinctes, non de preuves permettant de reconstituer un itinéraire détaillé de tous ses déplacements pendant ou après le ministère de Jésus.

## La foi catholique et les limites de la biographie

L'enseignement catholique appelle Marie Mère de Dieu parce que le fils qu'elle a enfanté est le Fils de Dieu incarné ; ce titre concerne l'identité du Christ et ne fait pas de Marie l'origine de sa divinité. Lumen gentium, du concile Vatican II, la présente à la fois comme associée au Christ d'une manière unique et comme membre et modèle de l'Église. Son consentement, sa charité et sa persévérance sont compris dans leur dépendance envers la grâce divine. Le Concile décrit sa vie comme un pèlerinage de foi et souligne que son rôle maternel ne remplace ni ne diminue l'unique médiation du Christ.

Ce même enseignement affirme sa maternité virginale, sa préservation du péché originel et son assomption, corps et âme, dans la gloire céleste au terme de sa vie terrestre. Ce sont des affirmations de la foi catholique, non des dates ou des circonstances fournies par une biographie conservée qui serait due à un témoin oculaire. Les passages du Nouveau Testament cités ici ne racontent pas ses derniers jours. Lumen gentium distingue également la vénération accordée à Marie de l'adoration due à Dieu et met en garde contre l'exagération et la crédulité. Ainsi, sa place durable dans la vie catholique repose sur sa relation au Christ et sur la fidélité du disciple dont témoigne l'Écriture, sans qu'il faille inventer des détails pour combler les silences.

## Sources

- Écriture : Matthieu 1–2 ; Luc 1–2 ; Jean 2, 1–12 et 19, 25–27 ; Actes 1, 12–14. [Texte de la Bible Douay-Rheims consulté, copie numérique](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Concile Vatican II, Lumen gentium, notamment nos 53–60, 66–67. [Édition du Vatican](https://www.vatican.va/archive/hist_councils/ii_vatican_council/documents/vat-ii_const_19641121_lumen-gentium_en.html) ; [texte consulté, chapitre VIII dans une copie numérique](https://github.com/BenjaminPoole/Ecumenical-Christian-Library-Obsidian-Vault/blob/71c1582adc8ceca8f0ee35b41d4e9ddb0a493d49/03%20Councils%2C%20Creeds%20%26%20Confessions%20%28325%E2%80%93present%29/Vatican%20II%20%281962%29/Vatican%20II%20%E2%80%94%20Lumen%20Gentium%20II.md).
$desc$
),
(
  'saint-mary',
  'la',
  'Maria Nazarethana, mater Iesu et sponsa Ioseph, verbum Dei fide suscipit. Scriptura eam in initiis vitae Iesu, iuxta eius crucem et inter discipulos orantes exhibet; fides catholica eam ut Dei Genetricem veneratur.',
  $desc$## Persona et fontes

Maria Nazarethana praesertim ex Novo Testamento ut mater Iesu cognoscitur. Matthaeus et Lucas eam in populo Iudaico collocant atque Ioseph eius sponsum appellant; Lucas annuntiationem nativitatis Iesu Nazareth in Galilaea factam esse narrat. Haec scripta sensum adventus Iesu proclamant potius quam continuam vitae matris eius narrationem praebent. Neque diem eius natalem definiunt, neque infantiam describunt, neque ordinem temporum ultimorum eius annorum tradunt. Recta igitur narratio distinguit quae relationes biblicae dicant, quae Ecclesia postea doctrinaliter definiverit, et quae ex fontibus cognosci nequeant.

## Annuntiatio et nativitas Iesu

In primo Lucae capite angelus Gabriel Mariae annuntiat eam filium parituram esse, cuius regni non erit finis. Quaerenti quomodo hoc fiat angelus conceptionem Spiritui Sancto tribuit. Maria verbum sibi dictum libere accipit. Narratio neque missionem ab ipsa sibi assumptam neque omnium futurorum intellegentiam exhibet, sed responsum fiduciae Deo primum agenti datum. Matthaeus in primo capite initium ex parte Ioseph narrat: is in somnis iubetur Mariam accipere et puero nomen Iesu imponere.

Lucas deinde visitationem Mariae ad Elisabeth in montana Iudaeae narrat. Elisabeth eam ut matrem Domini sui excipit eiusque fidem beatam praedicat; infans in utero Elisabeth ad salutationem Mariae exsultat. Magnificat gratiarum actionem Mariae cum promissionibus Israeli factis coniungit. Laus eius misericordiam Dei, exaltationem humilium et esurientium refectionem celebrat, non opus quod Maria sibi tribuat. Lucas eam circiter tres menses apud Elisabeth mansisse antequam domum rediret refert.

In secundo Lucae capite Maria cum Ioseph Bethlehem proficiscitur et Iesum parit, quem in praesepio reclinat. Pastores puerum cum Maria et Ioseph inveniunt atque quae de eo audierunt narrant. Evangelista saepius Mariam haec conservantem et meditantem describit. In praesentatione in Templo Simeon puerum cum salute et contradictione coniungit Mariaeque dolorem praedicit qui ipsius animam pertransibit. Matthaeus in secundo capite aliam rerum seriem addit: magorum visitationem, fugam Ioseph cum puero et matre eius in Aegyptum, atque habitationem eorum Nazareth post mortem Herodis.

## Filium sequens

Narratio de Iesu duodecim annos nato in Templo ultima est infantiae narratio apud Lucam. Maria et Ioseph eum anxie quaerunt antequam inter doctores inveniant. Responsum eius eos ad Patrem suum dirigit; Lucas tamen expresse dicit eos illud non intellexisse. Iesus cum eis Nazareth redit, Maria vero haec in corde suo servare pergit. Locus incremento et difficultatibus fidei spatium relinquit; maternitatem non exhibet tamquam plenam praescientiam missionis Iesu.

Evangelium secundum Ioannem matrem Iesu in nuptiis Canae collocat, ubi vinum deficere animadvertit et ministros ad eius mandata servanda dirigit. Signum quod sequitur gloriam Iesu manifestat. Postea iuxta crucem eius stat cum aliis mulieribus et discipulo quem Iesus diligit. Iesus matrem et discipulum alterum alteri commendat, atque discipulus eam in curam suam recipit. Actus Apostolorum in primo capite Mariam deinde inter eos nominant qui cum apostolis in oratione perseverant. Hae sunt distinctae scaenae scripturales, non testimonia quibus singula itinera eius durante vel post ministerium Iesu describi possint.

## Fides catholica et limites narrationis vitae

Doctrina catholica Mariam Dei Genetricem appellat, quia filius quem peperit est Filius Dei incarnatus; titulus ad personam Christi pertinet nec Mariam originem divinitatis eius facit. Lumen gentium Concilii Vaticani II eam exhibet et singulariter Christo sociatam et membrum exemplarque Ecclesiae. Eius consensus, caritas et perseverantia ex divina gratia pendere intelleguntur. Concilium vitam eius tamquam peregrinationem fidei describit atque affirmat munus eius maternum unicam Christi mediationem neque supplere neque minuere.

Eadem doctrina affirmat maternitatem eius virginalem, praeservationem a peccato originali atque assumptionem corpore et anima in gloriam caelestem, expleto terrestris vitae cursu. Haec sunt fidei catholicae affirmata, non tempora aut adiuncta quae in servata vitae narratione ab oculato teste conscripta tradantur. Loci Novi Testamenti hic citati ultimos eius dies non narrant. Lumen gentium etiam venerationem Mariae exhibitam ab adoratione Deo debita distinguit atque ab exaggeratione et credulitate monet. Ita perennis eius locus in vita catholica in coniunctione cum Christo et in discipulatu quem Scriptura testatur fundatur, neque commenticia requirit quibus silentia impleantur.

## Fontes

- Scriptura: Matthaeus 1–2; Lucas 1–2; Ioannes 2, 1–12 et 19, 25–27; Actus Apostolorum 1, 12–14. [Textus Bibliorum Duacensium consultus, exemplar digitale](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Concilium Vaticanum II, Lumen gentium, praesertim nn. 53–60, 66–67. [Editio Vaticana](https://www.vatican.va/archive/hist_councils/ii_vatican_council/documents/vat-ii_const_19641121_lumen-gentium_en.html); [textus consultus, caput VIII in exemplari digitali](https://github.com/BenjaminPoole/Ecumenical-Christian-Library-Obsidian-Vault/blob/71c1582adc8ceca8f0ee35b41d4e9ddb0a493d49/03%20Councils%2C%20Creeds%20%26%20Confessions%20%28325%E2%80%93present%29/Vatican%20II%20%281962%29/Vatican%20II%20%E2%80%94%20Lumen%20Gentium%20II.md).
$desc$
),
(
  'saint-joseph',
  'en',
  'Joseph, spouse of Mary, receives and protects Jesus in the Gospel infancy narratives. Remembered for righteousness and obedience, he cares for the child without being his biological father; his birth, later years and death remain undocumented in those accounts.',
  $desc$## Identity and sources

Joseph is known principally from the infancy narratives in Matthew 1–2 and Luke 1–2. Both associate him with the house of David and with Mary, the mother of Jesus. Their purpose is to tell the beginnings of Jesus' life, so Joseph appears through his relationship to the child and his mother rather than in a complete personal biography. Neither narrative supplies his age, a description of his childhood or the date of his death. These limits matter: a devotional interpretation of his character should not be mistaken for additional historical documentation.

## Receiving Mary and protecting Jesus

Matthew introduces Joseph as a righteous man confronted with Mary's pregnancy before they have begun living together. Unwilling to expose her publicly, he considers separating from her privately. An angel then tells him in a dream that the child has been conceived through the Holy Spirit and instructs him to receive Mary and name her son Jesus. Joseph acts on the message. The evangelist thus connects his righteousness with a concrete decision to protect Mary and accept responsibility for the child, while expressly attributing the conception to divine action rather than to Joseph.

In Matthew 2, danger again requires a response. After the magi's departure, Joseph is warned that Herod intends to kill the child. He takes Jesus and Mary to Egypt by night and remains there until Herod's death. A further message calls him back to the land of Israel. Learning that Archelaus rules in Judaea, he is afraid to settle there; another warning leads him to Galilee, where the family lives at Nazareth. Matthew records these movements without specifying how long the family spent in Egypt or describing its daily circumstances there.

## Family life in Luke

Luke tells of Joseph's journey from Nazareth to Bethlehem with Mary, the birth of Jesus and the shepherds' visit. Joseph participates in the child's presentation in Jerusalem, where the family observes the requirements of the Law. The account places him within the worship and hopes of Israel, not outside them. Later, when Jesus is twelve, Joseph and Mary search for him after the Passover pilgrimage and find him among the teachers in the Temple. Mary speaks of their shared distress. Neither parent understands Jesus' answer about his Father, and Jesus returns with them to Nazareth.

Matthew 13:55 identifies Jesus as the carpenter's son, the scriptural basis for remembering Joseph as a working craftsman. The sources do not describe his workshop or preserve a record of his teaching Jesus a trade. Nor do the infancy accounts report words spoken by Joseph himself. His narrative role is expressed through receiving, travelling, protecting and seeking. Silence in the written sources, however, is not proof that he never spoke, nor does it authorize an invented account of his inner thoughts.

## Catholic remembrance and historical limits

In Redemptoris Custos, John Paul II reflects on Joseph's acceptance of Mary and his service to Jesus as an obedience of faith. This Catholic reading recognizes a genuine paternal responsibility without attributing biological paternity to him. It draws a spiritual meaning from the Gospel actions rather than supplying a lost record of his private life. Joseph's example is consequently one of faithful responsibility within circumstances he does not fully control. The Gospel episodes do not tell how or when his life ended; no precise age or death scene can be established from them.

## Sources

- Scripture: Matthew 1–2 and 13:55; Luke 1:26–27 and 2. [Douay-Rheims text consulted, digital mirror](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- John Paul II, Redemptoris Custos, especially §§1–5. [Vatican edition](https://www.vatican.va/content/john-paul-ii/en/apost_exhortations/documents/hf_jp-ii_exh_15081989_redemptoris-custos.html); [French text consulted, digital mirror](https://github.com/lologhi/vatican/blob/9e65068eb2bf7f09153f893950dd3058c4e78fee/john-paul-ii/apost_exhortations/1989-08-15-redemptoris-custos.md).
$desc$
),
(
  'saint-joseph',
  'fr',
  'Joseph, époux de Marie, accueille et protège Jésus dans les récits évangéliques de l''enfance. Sa justice et son obéissance sont commémorées ; il prend soin de l''enfant sans être son père biologique. Ces récits ne documentent ni sa naissance, ni ses dernières années, ni sa mort.',
  $desc$## Identité et sources

Joseph est connu principalement par les récits de l'enfance en Matthieu 1–2 et Luc 1–2. Tous deux le rattachent à la maison de David et à Marie, la mère de Jésus. Leur propos est de raconter les débuts de la vie de Jésus : Joseph apparaît donc par sa relation à l'enfant et à sa mère, plutôt que dans une biographie personnelle complète. Aucun de ces récits ne fournit son âge, une description de son enfance ou la date de sa mort. Ces limites sont importantes : une interprétation spirituelle de sa personne ne doit pas être confondue avec une documentation historique supplémentaire.

## Accueillir Marie et protéger Jésus

Matthieu présente Joseph comme un homme juste confronté à la grossesse de Marie avant qu'ils aient commencé à vivre ensemble. Ne voulant pas l'exposer publiquement, il envisage de se séparer d'elle en secret. Un ange lui annonce alors en songe que l'enfant a été conçu par l'Esprit Saint et lui ordonne d'accueillir Marie et de donner à son fils le nom de Jésus. Joseph agit selon ce message. L'évangéliste relie ainsi sa justice à une décision concrète : protéger Marie et assumer la responsabilité de l'enfant, tout en attribuant expressément la conception à l'action divine et non à Joseph.

En Matthieu 2, le danger appelle de nouveau une réponse. Après le départ des mages, Joseph est averti qu'Hérode veut tuer l'enfant. Il emmène Jésus et Marie en Égypte, de nuit, et y demeure jusqu'à la mort d'Hérode. Un autre message le rappelle au pays d'Israël. Apprenant qu'Archélaüs règne en Judée, il craint de s'y établir ; un nouvel avertissement le conduit en Galilée, où la famille vit à Nazareth. Matthieu rapporte ces déplacements sans préciser la durée du séjour en Égypte ni les conditions de la vie quotidienne de la famille dans ce pays.

## La vie familiale chez Luc

Luc raconte le voyage de Joseph de Nazareth à Bethléem avec Marie, la naissance de Jésus et la visite des bergers. Joseph participe à la présentation de l'enfant à Jérusalem, où la famille observe les prescriptions de la Loi. Le récit le situe au sein du culte et des espérances d'Israël, non en dehors d'eux. Plus tard, lorsque Jésus a douze ans, Joseph et Marie le cherchent après le pèlerinage pascal et le trouvent parmi les docteurs du Temple. Marie exprime leur angoisse commune. Aucun des deux parents ne comprend la réponse de Jésus au sujet de son Père, et Jésus retourne avec eux à Nazareth.

Matthieu 13, 55 désigne Jésus comme le fils du charpentier : c'est le fondement scripturaire du souvenir de Joseph comme artisan. Les sources ne décrivent pas son atelier et ne conservent aucun récit de l'enseignement d'un métier à Jésus par Joseph. Les récits de l'enfance ne rapportent pas non plus de paroles prononcées par Joseph lui-même. Son rôle narratif s'exprime dans l'accueil, les voyages, la protection et la recherche de l'enfant. Le silence des sources écrites ne prouve cependant pas qu'il n'ait jamais parlé et n'autorise pas davantage à inventer le récit de ses pensées intérieures.

## La mémoire catholique et les limites historiques

Dans Redemptoris Custos, Jean-Paul II médite l'accueil de Marie par Joseph et son service de Jésus comme une obéissance de la foi. Cette lecture catholique reconnaît une véritable responsabilité paternelle sans lui attribuer une paternité biologique. Elle dégage un sens spirituel des actes rapportés dans l'Évangile plutôt qu'elle ne fournit des archives perdues de sa vie privée. Joseph offre donc l'exemple d'une responsabilité fidèle dans des circonstances qu'il ne maîtrise pas entièrement. Les épisodes évangéliques ne disent ni comment ni quand sa vie s'est achevée ; ils ne permettent d'établir ni un âge précis ni une scène de mort.

## Sources

- Écriture : Matthieu 1–2 et 13, 55 ; Luc 1, 26–27 et 2. [Texte de la Bible Douay-Rheims consulté, copie numérique](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Jean-Paul II, Redemptoris Custos, notamment nos 1–5. [Édition du Vatican](https://www.vatican.va/content/john-paul-ii/en/apost_exhortations/documents/hf_jp-ii_exh_15081989_redemptoris-custos.html) ; [texte français consulté, copie numérique](https://github.com/lologhi/vatican/blob/9e65068eb2bf7f09153f893950dd3058c4e78fee/john-paul-ii/apost_exhortations/1989-08-15-redemptoris-custos.md).
$desc$
),
(
  'saint-joseph',
  'la',
  'Ioseph, sponsus Mariae, Iesum in narrationibus evangelicis infantiae suscipit ac tuetur. Ob iustitiam et oboedientiam memoratur atque puerum curat, quamvis pater eius naturalis non sit; ortus, ultimi anni et mors eius in his narrationibus non traduntur.',
  $desc$## Persona et fontes

Ioseph praecipue ex narrationibus infantiae apud Matthaeum 1–2 et Lucam 1–2 cognoscitur. Uterque eum cum domo David et cum Maria, matre Iesu, coniungit. Propositum eorum est initia vitae Iesu narrare; itaque Ioseph per coniunctionem suam cum puero eiusque matre apparet, non in plena propriae vitae narratione. Neutra narratio aetatem eius, infantiae descriptionem aut tempus mortis praebet. Hi limites magni momenti sunt: pia interpretatio personae eius cum additis testimoniis historicis confundi non debet.

## Mariam suscipere et Iesum tueri

Matthaeus Ioseph ut virum iustum exhibet qui, antequam cum Maria habitare coeperit, eam gravidam esse cognoscit. Cum eam publice exponere nolit, occulte ab ea discedere cogitat. Angelus deinde in somnis eum docet puerum de Spiritu Sancto conceptum esse atque iubet Mariam accipere et filio eius nomen Iesu imponere. Ioseph secundum nuntium agit. Evangelista ita iustitiam eius cum certo consilio Mariam tuendi et curam pueri suscipiendi coniungit, conceptionem tamen expresse actioni divinae, non Ioseph, tribuens.

In secundo Matthaei capite periculum iterum responsum postulat. Magis profectis, Ioseph monetur Herodem puerum occidere velle. Iesum et Mariam noctu in Aegyptum ducit ibique usque ad mortem Herodis manet. Alius nuntius eum in terram Israel revocat. Audiens autem Archelaum in Iudaea regnare, timet ibi habitare; alia admonitio eum in Galilaeam ducit, ubi familia Nazareth habitat. Matthaeus haec itinera refert neque definit quamdiu familia in Aegypto manserit neque condiciones cotidianae vitae eius ibi describit.

## Vita familiaris apud Lucam

Lucas iter Ioseph cum Maria a Nazareth in Bethlehem, nativitatem Iesu atque visitationem pastorum narrat. Ioseph praesentationis pueri Hierosolymis particeps est, ubi familia praecepta Legis servat. Narratio eum intra cultum et spem Israel collocat, non extra ea. Postea, cum Iesus duodecim annos natus sit, Ioseph et Maria eum post peregrinationem paschalem quaerunt et inter doctores in Templo inveniunt. Maria communem eorum dolorem exprimit. Neuter parens responsum Iesu de Patre suo intellegit, atque Iesus cum eis Nazareth redit.

Matthaeus 13, 55 Iesum fabri filium appellat: hoc est fundamentum scripturale memoriae Ioseph ut artificis laborantis. Fontes officinam eius non describunt neque narrationem servant qua Iesum artem docuisse referatur. Narrationes infantiae verba ab ipso Ioseph dicta quoque non tradunt. Munus eius in narratione accipiendo, peregrinando, tuendo et quaerendo exprimitur. Silentium autem fontium scriptorum non probat eum numquam locutum esse, neque licentiam praebet fingendi quid animo cogitaverit.

## Memoria catholica et limites historici

In Redemptoris Custos Ioannes Paulus II receptionem Mariae a Ioseph factam eiusque servitium Iesu praestitum ut oboedientiam fidei considerat. Haec interpretatio catholica verum munus paternum agnoscit, quin ei paternitatem naturalem tribuat. Sensum spiritualem ex actibus evangelicis elicit potius quam amissam vitae privatae eius memoriam restituit. Ioseph igitur exemplum praebet fidelis officii in condicionibus quae non omnino in eius potestate sunt. Narrationes evangelicae neque quomodo neque quando vita eius finita sit tradunt; ex eis neque certa aetas neque mortis adiuncta definiri possunt.

## Fontes

- Scriptura: Matthaeus 1–2 et 13, 55; Lucas 1, 26–27 et 2. [Textus Bibliorum Duacensium consultus, exemplar digitale](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Ioannes Paulus II, Redemptoris Custos, praesertim nn. 1–5. [Editio Vaticana](https://www.vatican.va/content/john-paul-ii/en/apost_exhortations/documents/hf_jp-ii_exh_15081989_redemptoris-custos.html); [textus Gallicus consultus, exemplar digitale](https://github.com/lologhi/vatican/blob/9e65068eb2bf7f09153f893950dd3058c4e78fee/john-paul-ii/apost_exhortations/1989-08-15-redemptoris-custos.md).
$desc$
),
(
  'saint-john-the-baptist',
  'en',
  'John the Baptist preached repentance and baptized in the Jordan region. The Gospels present him as the forerunner who directs others to Jesus; Josephus independently records his influence and execution under Herod Antipas, while important details of his chronology remain uncertain.',
  $desc$## Identity and sources

John the Baptist was a Jewish preacher associated with baptism and a call to moral renewal. His ministry belongs to the setting of Roman rule and the Herodian rulers in the first century. The Gospels interpret his vocation in relation to Jesus, while the Jewish historian Flavius Josephus describes his preaching and death in Antiquities of the Jews. These sources have different purposes and emphases. Their agreement on John's influence and execution does not remove every difficulty in reconstructing the order of events, and they do not provide secure dates for his birth and death.

## Birth and prophetic calling

Luke 1 presents John as the son of Zechariah, a priest, and Elizabeth, who also belongs to a priestly family. Both are elderly and childless when an angel announces John's birth during Zechariah's service in the Temple. The announcement describes a vocation to turn people towards God and prepare them for the Lord. Zechariah's inability to speak, the child's naming and the restoration of his speech form part of this scriptural account. They should be identified as Luke's narrative, not as details independently recorded by Josephus.

Luke connects John's beginnings with those of Jesus through Mary's visit to Elizabeth. The unborn John leaps when Elizabeth hears Mary's greeting. After the birth, Zechariah's song speaks of his son as a prophet who will prepare the Lord's ways. Luke closes this childhood account by saying that John grew in spirit and lived in the wilderness until his public appearance to Israel. The text does not describe his education or establish membership in a particular religious community; such a biography cannot be supplied from its brief notice about the wilderness.

## Preaching and baptism

Luke 3 places John's public call in the fifteenth year of Tiberius and names contemporary rulers and priestly authorities. John preaches around the Jordan, calling for repentance and baptism. Matthew describes his austere clothing and food and relates his warning that descent from Abraham cannot substitute for a changed life. Luke gives the moral demand practical form: those with clothing and food should share, tax collectors should not exact more than authorized, and soldiers should not extort or make false accusations. Conversion is presented as conduct as well as a public religious act.

John also announces someone more powerful than himself, contrasting his baptism with water with the coming baptism in the Holy Spirit. Matthew narrates Jesus' arrival at the Jordan and John's initial reluctance to baptize him, followed by his acceptance of Jesus' response. The descent of the Spirit and the heavenly declaration identify Jesus within the Gospel's proclamation. John's Gospel emphasizes the Baptist's testimony: he denies that he is the Messiah, identifies Jesus as the Lamb of God and directs his disciples' attention away from himself. It also reports his joy at Jesus' growing prominence rather than treating that prominence simply as a rivalry.

## Imprisonment and death

The Gospel accounts connect John's imprisonment with his criticism of Herod Antipas over Herodias. Matthew 11 shows him still communicating through disciples from prison: he asks whether Jesus is the one expected, and Jesus answers by pointing to works of healing and the good news brought to the poor. Jesus then praises John's prophetic role. The scene preserves a question and a response; it does not provide a complete account of John's private state of mind or license a confident reconstruction of all his expectations.

Mark 6 recounts John's death through a banquet narrative. Herodias' daughter dances, Herod promises her a reward, and, prompted by her mother, she requests John's head. Herod orders the execution despite his distress, and John's disciples take his body for burial. Josephus gives another emphasis: he portrays John as a good man whose large following made Herod fear political unrest. He says that Herod had him imprisoned and killed at Machaerus. Josephus also describes John's washing as bodily purification following moral righteousness, rather than a substitute for it. This account supplies an important non-Christian witness without repeating the banquet scene.

## Christian remembrance and historical caution

The political motive described by Josephus and the moral confrontation narrated in the Gospels should remain distinguishable rather than being joined into an undocumented sequence. Neither account justifies inventing a precise execution date. Christian remembrance sees John as the forerunner whose preaching prepared for Christ and whose fidelity endured confrontation with a ruler. His significance rests on that demanding call to conversion and on the Gospel witness that directs attention to Jesus. Recognizing the distinct voices of the sources preserves both the historical person and the particular meaning given to his life in Christian faith.

## Sources

- Scripture: Luke 1 and 3; Matthew 3 and 11:2–15; Mark 6:17–29; John 1:19–37 and 3:22–30. [Douay-Rheims text consulted, digital mirror](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Flavius Josephus, Antiquities of the Jews, book XVIII, chapter 5, §2 (18.116–119), William Whiston's translation. [Text consulted in Sefaria's source collection](https://github.com/Sefaria/Sefaria-Data/blob/c3cba315dc4f4ba25c5f10bb1201094f1424ac04/sources/Josephus/Antiquities_Book_18).
$desc$
),
(
  'saint-john-the-baptist',
  'fr',
  'Jean-Baptiste prêchait la conversion et baptisait dans la région du Jourdain. Les Évangiles le présentent comme le précurseur qui oriente vers Jésus ; Josèphe atteste indépendamment son influence et son exécution sous Hérode Antipas, tandis que des éléments importants de sa chronologie demeurent incertains.',
  $desc$## Identité et sources

Jean-Baptiste était un prédicateur juif associé au baptême et à un appel au renouvellement moral. Son ministère s'inscrit au premier siècle, dans le contexte de la domination romaine et des souverains hérodiens. Les Évangiles interprètent sa vocation dans sa relation à Jésus, tandis que l'historien juif Flavius Josèphe décrit sa prédication et sa mort dans les Antiquités judaïques. Ces sources ont des intentions et des accents différents. Leur accord sur l'influence et l'exécution de Jean ne supprime pas toutes les difficultés de reconstitution de l'ordre des événements, et elles ne fournissent pas de dates assurées pour sa naissance et sa mort.

## Naissance et vocation prophétique

Luc 1 présente Jean comme le fils de Zacharie, un prêtre, et d'Élisabeth, elle aussi issue d'une famille sacerdotale. Tous deux sont âgés et sans enfant lorsqu'un ange annonce la naissance de Jean pendant le service de Zacharie au Temple. L'annonce décrit une vocation à tourner les hommes vers Dieu et à les préparer pour le Seigneur. L'impossibilité pour Zacharie de parler, le nom donné à l'enfant et le retour de la parole appartiennent à ce récit scripturaire. Il convient de les désigner comme des éléments du récit de Luc, non comme des détails attestés indépendamment par Josèphe.

Luc relie les commencements de Jean à ceux de Jésus par la visite de Marie à Élisabeth. Jean, encore dans le sein de sa mère, tressaille lorsqu'Élisabeth entend la salutation de Marie. Après la naissance, le cantique de Zacharie présente son fils comme un prophète qui préparera les chemins du Seigneur. Luc termine ce récit de l'enfance en disant que Jean grandissait en esprit et vivait au désert jusqu'à sa manifestation publique à Israël. Le texte ne décrit pas son éducation et n'établit pas son appartenance à une communauté religieuse particulière ; sa brève mention du désert ne permet pas de construire une telle biographie.

## Prédication et baptême

Luc 3 situe l'appel public de Jean dans la quinzième année de Tibère et nomme les souverains et les autorités sacerdotales de l'époque. Jean prêche aux alentours du Jourdain, appelant à la conversion et au baptême. Matthieu décrit l'austérité de ses vêtements et de sa nourriture et rapporte son avertissement : descendre d'Abraham ne saurait remplacer une vie transformée. Luc donne à l'exigence morale une forme concrète : ceux qui ont des vêtements et de la nourriture doivent partager, les collecteurs d'impôts ne doivent rien exiger au-delà de ce qui est autorisé, et les soldats ne doivent pratiquer ni extorsion ni fausse accusation. La conversion est présentée comme une conduite autant qu'un acte religieux public.

Jean annonce aussi quelqu'un de plus puissant que lui, distinguant son baptême dans l'eau du baptême à venir dans l'Esprit Saint. Matthieu raconte l'arrivée de Jésus au Jourdain, la réticence initiale de Jean à le baptiser, puis son acceptation de la réponse de Jésus. La descente de l'Esprit et la déclaration céleste manifestent l'identité de Jésus dans la proclamation évangélique. L'Évangile selon Jean souligne le témoignage du Baptiste : il nie être le Messie, désigne Jésus comme l'Agneau de Dieu et détourne de lui-même l'attention de ses disciples. Il rapporte aussi sa joie devant la place croissante de Jésus, plutôt que de présenter simplement cette évolution comme une rivalité.

## Emprisonnement et mort

Les récits évangéliques relient l'emprisonnement de Jean à sa critique d'Hérode Antipas au sujet d'Hérodiade. Matthieu 11 le montre communiquant encore par ses disciples depuis la prison : il demande si Jésus est celui qui est attendu, et Jésus répond en évoquant les guérisons et la Bonne Nouvelle apportée aux pauvres. Jésus loue ensuite le rôle prophétique de Jean. La scène conserve une question et une réponse ; elle ne fournit pas un exposé complet de l'état intérieur de Jean et ne permet pas de reconstituer avec certitude toutes ses attentes.

Marc 6 raconte la mort de Jean à travers le récit d'un banquet. La fille d'Hérodiade danse, Hérode lui promet une récompense et, poussée par sa mère, elle demande la tête de Jean. Hérode ordonne l'exécution malgré sa tristesse, et les disciples de Jean prennent son corps pour l'ensevelir. Josèphe met l'accent ailleurs : il dépeint Jean comme un homme de bien dont les nombreux auditeurs faisaient craindre à Hérode des troubles politiques. Il affirme qu'Hérode le fit emprisonner et tuer à Machéronte. Josèphe décrit également son baptême comme une purification du corps faisant suite à la rectitude morale, et non comme son substitut. Ce récit apporte un important témoignage non chrétien sans reprendre la scène du banquet.

## La mémoire chrétienne et la prudence historique

Le motif politique décrit par Josèphe et la confrontation morale racontée dans les Évangiles doivent rester distincts, plutôt que d'être réunis dans une suite d'événements non documentée. Aucun des récits ne justifie l'invention d'une date précise d'exécution. La mémoire chrétienne voit en Jean le précurseur dont la prédication préparait au Christ et dont la fidélité a résisté à la confrontation avec un souverain. Son importance repose sur cet appel exigeant à la conversion et sur le témoignage évangélique qui dirige l'attention vers Jésus. Reconnaître les voix distinctes des sources préserve à la fois le personnage historique et le sens particulier donné à sa vie dans la foi chrétienne.

## Sources

- Écriture : Luc 1 et 3 ; Matthieu 3 et 11, 2–15 ; Marc 6, 17–29 ; Jean 1, 19–37 et 3, 22–30. [Texte de la Bible Douay-Rheims consulté, copie numérique](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Flavius Josèphe, Antiquités judaïques, livre XVIII, chapitre 5, §2 (18.116–119), traduction de William Whiston. [Texte consulté dans la collection de sources de Sefaria](https://github.com/Sefaria/Sefaria-Data/blob/c3cba315dc4f4ba25c5f10bb1201094f1424ac04/sources/Josephus/Antiquities_Book_18).
$desc$
),
(
  'saint-john-the-baptist',
  'la',
  'Ioannes Baptista paenitentiam praedicabat et in regione Iordanis baptizabat. Evangelia eum praecursorem exhibent qui alios ad Iesum dirigit; Iosephus quoque auctoritatem eius et mortem sub Herode Antipa testatur, quamvis magnae quaestiones de temporibus vitae eius incertae maneant.',
  $desc$## Persona et fontes

Ioannes Baptista praedicator Iudaeus fuit, baptismate et vocatione ad mores renovandos notus. Ministerium eius ad primum saeculum pertinet, quo Romani et principes ex domo Herodis regionem regebant. Evangelia vocationem eius in coniunctione cum Iesu interpretantur, dum historicus Iudaeus Flavius Iosephus praedicationem eius et mortem in Antiquitatibus Iudaicis describit. Hi fontes diversa proposita et diversos accentus habent. Consensus eorum de auctoritate Ioannis et de supplicio eius non omnes difficultates ordinis rerum gestarum restituendi tollit, neque certa tempora ortus et mortis eius praebent.

## Nativitas et vocatio prophetica

Lucas in primo capite Ioannem filium Zachariae sacerdotis et Elisabeth, quae etiam ex familia sacerdotali orta est, exhibet. Ambo aetate provecti et sine liberis sunt, cum angelus nativitatem Ioannis annuntiat, Zacharia in Templo ministerium exercente. Annuntiatio vocationem describit homines ad Deum convertendi et Domino praeparandi. Impotentia Zachariae loquendi, nomen puero impositum et loquela restituta partes sunt huius narrationis scripturalis. Ut elementa narrationis Lucae agnoscenda sunt, non ut res ab Iosepho quoque separatim traditae.

Lucas initia Ioannis cum initiis Iesu per visitationem Mariae ad Elisabeth coniungit. Ioannes nondum natus exsultat cum Elisabeth salutationem Mariae audit. Post nativitatem canticum Zachariae filium eius prophetam appellat qui vias Domini praeparabit. Lucas narrationem infantiae concludit dicens Ioannem spiritu crevisse et in desertis habitasse usque ad publicam manifestationem suam ad Israel. Textus educationem eius non describit neque eum cuidam communitati religiosae adscriptum esse demonstrat; talis vitae narratio ex brevi illa deserti mentione suppleri non potest.

## Praedicatio et baptismus

Lucas in tertio capite vocationem publicam Ioannis anno quinto decimo Tiberii collocat atque principes et auctoritates sacerdotales illius temporis nominat. Ioannes circa Iordanem praedicat, ad paenitentiam et baptismum vocans. Matthaeus austerum vestitum et victum eius describit atque monitionem refert originem ex Abraham loco vitae mutatae esse non posse. Lucas postulationi morali formam concretam dat: qui vestes et cibum habent cum aliis communicent, publicani non plus quam permissum exigant, milites neque pecuniam vi extorqueant neque falsa crimina inferant. Conversio ut vitae ratio simul atque actus religiosus publicus exhibetur.

Ioannes etiam potentiorem se venturum annuntiat, baptismum suum in aqua a futuro baptismate in Spiritu Sancto distinguens. Matthaeus adventum Iesu ad Iordanem narrat atque Ioannem primo eum baptizare recusantem, deinde responsum Iesu accipientem. Descensus Spiritus et vox caelestis Iesum in proclamatione evangelica manifestant. Evangelium secundum Ioannem testimonium Baptistae extollit: negat se esse Messiam, Iesum Agnum Dei indicat atque discipulorum suorum attentionem a se avertit. Etiam gaudium eius de Iesu magis magisque agnito refert, neque hanc rem tantum ut aemulationem tractat.

## Carcer et mors

Narrationes evangelicae incarcerationem Ioannis cum reprehensione Herodis Antipae propter Herodiadem coniungunt. Matthaeus in undecimo capite eum adhuc e carcere per discipulos nuntios mittentem exhibet: quaerit num Iesus sit qui exspectatur, Iesus autem respondet opera sanationis et bonum nuntium pauperibus allatum ostendens. Iesus deinde munus propheticum Ioannis laudat. Scaena quaestionem et responsum servat; neque plenam interioris animi Ioannis descriptionem praebet neque certam omnium exspectationum eius restitutionem permittit.

Marcus in sexto capite mortem Ioannis per narrationem convivii refert. Filia Herodiadis saltat, Herodes ei praemium promittit, atque illa, matre suadente, caput Ioannis petit. Herodes, quamvis tristis, supplicium imperat, et discipuli Ioannis corpus eius ad sepeliendum tollunt. Iosephus aliam rationem extollit: Ioannem virum bonum describit, cuius frequentissimi auditores Herodi metum tumultus politici iniecerint. Refert Herodem eum Machaerunte incarcerari et occidi iussisse. Iosephus etiam lavacrum Ioannis ut corporis purificationem rectitudinem moralem subsequentem describit, non ut eius vicem gerens. Haec narratio magni momenti testimonium non christianum praebet, quin convivii scaenam repetat.

## Memoria christiana et cautela historica

Ratio politica ab Iosepho descripta et conflictus moralis in Evangeliis narratus distinguendi manent, potius quam in seriem rerum gestarum testimoniis carentem coniungantur. Neutra narratio certum supplicii diem fingere permittit. Memoria christiana Ioannem praecursorem agnoscit, cuius praedicatio ad Christum praeparabat et cuius fidelitas adversus principem constitit. Momentum eius in illa severa vocatione ad conversionem et in testimonio evangelico quod animos ad Iesum dirigit positum est. Distinctas fontium voces agnoscere et personam historicam servat et peculiarem sensum quem fides christiana vitae eius tribuit.

## Fontes

- Scriptura: Lucas 1 et 3; Matthaeus 3 et 11, 2–15; Marcus 6, 17–29; Ioannes 1, 19–37 et 3, 22–30. [Textus Bibliorum Duacensium consultus, exemplar digitale](https://github.com/scrollmapper/bible_databases/blob/master/formats/txt/DRC.txt).
- Flavius Iosephus, Antiquitates Iudaicae, liber XVIII, caput 5, §2 (18.116–119), translatio Gulielmi Whiston. [Textus consultus in collectione fontium Sefaria](https://github.com/Sefaria/Sefaria-Data/blob/c3cba315dc4f4ba25c5f10bb1201094f1424ac04/sources/Josephus/Antiquities_Book_18).
$desc$
)
) AS x(slug, locale_code, short_description, full_biography)
ON s.slug = x.slug
WHERE st.saint_id = s.id
  AND st.locale_code = x.locale_code;

COMMIT;
