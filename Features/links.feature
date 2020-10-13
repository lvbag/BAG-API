# language: nl

Voor tijdreisvragen endpoints:
self links:
Exact overnemen wat er door een client is opgegeven.
Wordt er alleen geldig op opgegeven, dan komt alleen geldig op in de self link.
Geeft een client meer parameters op dan neem je die exact over.
Geeft een client bepaalde parameters niet op en gebruiken wij een default (bv. page, pageSize, geldigOp, beschikbaarOp) dan komen die niet in de self link terug.

Links naar gerelateerde objecten:
Omdat er impliciet eigenlijk een tijdreisvraag wordt gesteld naar welke object voorkomens er op een bepaald moment aan de gevraagde resource (object) waren gekoppeld geldt het volgende:
- geen geldig op en beschikbaar op = geen tijdstippen in links van gerelateerde objecten
- geldig op in vraag (en beschikbaar op niet) = geldig op en beschikbaar op in de links van gerelateerde objecten, beschikbaar op wordt automatisch datum en tijd waarop de vraag is gesteld
- beschikbaar op in vraag (en geldig op niet) = geldig op en beschikbaar op in links van gerelateerde objecten, geldig op wordt automatisch datum en tijd waarop de vraag is gesteld
- geldig op en beschikbaar op in vraag = geldig op en beschikbaar op in links van gerelateerde objecten
In de database wordt er vanaf een object voorkomen gelinked naar een object ID. De reden waarom we hier niet ook de link naar het object (zonder geldigOp of beschikbaarOp) teruggeven, is dat je dan impliciet vraagt om het actuele voorkomen van een gerelateerd object en dat klopt niet altijd als je een tijdreisvraag stelt. Bij een vraag naar een actueel voorkomen kun je wel links naar actuele voorkomens van gerelateerde objecten teruggeven.
Paginering of andere query parameters zijn bij gerelateerde links niet van toepassing, die zijn alleen van toepassing voor self link

bv:
Bij woonplaatsen endpoint moet wanneer actueel wordt gevraagd de link naar de bronhouder niet naar het voorkomen wijzen, maar naar het object zonder tijdreisvraag parameters.
Bij woonplaatsen endpoint moet wanneer er een tijdreisvraag wordt gesteld (met geldigOp en/of beschikbaarOp), de link naar de bronhouder ook de tijdreisvraag bevatten (altijd geldig op en beschikbaar op).

Voor levenscyclus endpoints:
Wat hierboven staat geldt niet voor levenscyclus endpoints, maar alleen voor endpoints met geldigOp en beschikbaarOp ondersteuning (tijdreisvraag/actueel endpoints). Bij levensyclus endpoints worden nl. de links naar voorkomens van een object teruggegeven en geen tijdreisvraag links. 

Bij levenscyclus endpoints moet de self link (van de collectie) voldoen aan hetgeen zoals hierboven beschreven en de self links in de voorkomens van de resource (in de collectie) moeten voorkomen links bevatten. Voor evt. gerelateerde objecten per voorkomen geldt dan ook dat die links ook een voorkomen bevatten, omdat je geen tijdreisparameters hebt waarmee je kunt zoeken.
