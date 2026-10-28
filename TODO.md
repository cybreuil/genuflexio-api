Full structure in rust ?
Rest api design ! json responses ! maybe a web server like actix-web or rocket ?

- GET /saints - list all saints
- GET /saints/{id} - get details of a specific saint
- POST /saints - create a new saint
- PUT /saints/{id} - update an existing saint
- DELETE /saints/{id} - delete a saint
- GET /feasts - list all feasts
- etc

Maybe no modification alowed ? i should maybe prerssxent this as a definitive list of saints and feasts, with no option to add or remove entries. This would make it more of a reference API rather than a CRUD API.

maybe romcal on node ? or scrap it ?

fix sql
+++ ALL LIST OF MODERN REGIONAL CALENDAR ON WIKIPEDIA
https://en.wikipedia.org/wiki/National_calendars_of_the_Roman_Rite

full list of saints
https://en.wikipedia.org/wiki/List_of_Catholic_saints

- ajouter accompagnements / liens avec probleme de tous les jours: saint des troubles du sommeil, saint des voyageurs, etc sans forcement passer par le patronage officiel, mais en se basant sur les traditions populaires et les croyances associées à certains saints. (terme intercession me parait plus approprié que patronage dans ce cas)

- ajouter une table liaison peinture, pour avoir plusieurs saints par peinture ?

- need double check dates birth death...

- need couble check on companions saints, need normalization

- need double check on indexs :
  ORDER BY default_name ASC
  /for exemple

- maybe should split logic for saint of today & saint of the day / actually are on same route with query param, but maybe should be split into two routes for clarity ?

Need mapping query errors on apierrors

- need checking on differences between rome & vatican for places

- cache control

+++ logique celebration en table pour l'année ?
Une autre possibilité (que beaucoup de projets liturgiques utilisent)

Au démarrage de l'application (ou via un cron annuel), tu génères toutes les célébrations mobiles de l'année et tu les stockes dans une table du type :

## celebration_occurrences

celebration_id
date
calendar_id

Par exemple :

2026-04-05 Easter
2026-04-06 Monday in Easter Octave
2026-05-14 Ascension
2026-06-04 Corpus Christi

Ensuite ton endpoint devient simplement :

SELECT ...
FROM celebration_occurrences
WHERE date = $1;

C'est extrêmement rapide et toute la logique de calcul est déplacée dans une étape de génération.

++ Need gerer heritage des celebrations en fonction des calendriers

- Check ash wednesday / bernadette soubirous
- Need double check feria lent / advent are privileged ???

++ need dedicated file with full recap of precedence and rules by calendar replacements etc

++ Need double check on tridentine saints & celebrations

- should i add diocesan calendars ? maybe not, too much complexity for now, maybe later if needed
  we can stick for france for now

Should change name of tridentine calendar; it is not really tridentine, which is with double, but the final calendar before vatican II, so maybe "pre-vatican II calendar" or "1962 calendar" or "1960 calendar" ?
Need brainstorm this

- Need correction on saint joseph on sunday, should go sunday+1 to not conflict with sunday celebration, especially lent sundays

- maybe i should complexify preseance like this + version simplifiée
  Classe Exemples
  1 Triduum pascal
  2 Noël, Épiphanie, Ascension, Pentecôte
  3 Dimanches de l'Avent, du Carême et de Pâques
  4 Solennités du Seigneur, de la Vierge et des saints du calendrier général
  5 Commémoration de tous les fidèles défunts (2 novembre)
  6 Dimanches du Temps de Noël et du Temps ordinaire
  7 Fêtes du Seigneur
  8 Fêtes de la Vierge et des saints du calendrier général
  9 Fêtes propres (diocèse, patron, etc.)
  10 Mémoires obligatoires
  11 Mémoires facultatives
  12 Féries

- maybe build differences between vigils and day celebrations based on a time request, like if the celebration is before or after 18h

- need debug here
-   5. Le gros point : Temps ordinaire I

Tu as :

let first_ot1 = first_sunday_after_baptism;

Puis :

let week = ((date - first_ot1).num_days() / 7) as u32 + 2;

Ça suppose que le premier dimanche après le Baptême est toujours la 2e semaine du Temps ordinaire.

C'est presque toujours vrai dans le missel romain actuel.

Exemple :

Baptême du Seigneur : dimanche
lundi suivant : férial de la 1re semaine du Temps ordinaire ?
dimanche suivant : 2e dimanche du Temps ordinaire

Donc ton calcul fonctionne pour les dimanches.

Mais pour les féries, il y a une subtilité :

Le lundi après le Baptême n'est pas forcément "Monday of the 2nd Week".

C'est bien :
Monday of the First Week in Ordinary Time

+++ need add after ash thrusday friday saturday

++ Need double check on places seeded

++ need final push on traditional calendar logic

++++ regle transfert pour calendrier pologne :
3 mai — Notre-Dame Reine de Pologne : conserve la date habituelle dans ta table annuelle, mais prévois une règle de transfert. En 2026, la célébration a été déplacée au 2 mai en raison du dimanche de Pâques
