# Huidig

In het dagelijks gebruik van gegevens zijn soms alleen huidige gegevens nodig.
Huidig betekent dat het object actueel is en geen eindstatus heeft.
Voor een toelichting kunt u het artikel hierover in de Praktijkhandleiding BAG raadplegen. (https://imbag.github.io/praktijkhandleiding/artikelen/wat-is-het-verschil-tussen-actieve-voorkomens-actuele-voorkomens-en-huidige-voorkomens).

Bij enkele endpoints wordt de mogelijkheid geboden om met de parameter 'Huidig' alleen huidige objecten op te vragen
Anders endpoints leveren alleen huidige gegevens. Het gaat dan om het adressen en adressen uitgebreid endpoint.
NB: In de scenario's hieronder wordt nader toegelicht hoe 'huidig' bij die endpoints werkt.

Parameter Huidig werkt als een filter.
Bij toepassing van de paramater wordt als defaultwaarde 'nee' gebruikt.
Dan worden alle objecten teruggegeven.

Bij toepassing van de parameter huidig of wanneer een endpoint alleen huidige gegevens levert, 
dan worden alleen actuele objecten terugggeven waarvan de status NIET een van de volgende is:
* naamgeving ingetrokken
* woonplaats ingetrokken
* plaats ingetrokken
* niet gerealiseerd verblijfsobject
* verblijfsobject ingetrokken
* verblijfsobject ten onrechte opgevoerd
* niet gerealiseerd pand,
* pand gesloopt
* pand ten onrechte opgevoerd

#### Scenario:
Gegeven een pand met verblijfsobjecten waaronder verblijfsobjecten met een eindstatus, (niet gerealiseerd verblijfsobject, of verblijfsobject ingetrokken of verblijfsobject ten onrechte opgevoerd)
Wanneer de  API wordt bevraagd met parameter 'huidig'
Dan bevat de response de verblijfsobjecten met een eindstatus niet en de verblijfsobjecten met de overige statussen (Verblijfsobject in gebruik, (niet ingemeten), Verblijfsobject in gebruik, Verblijfsobject buiten gebruik, tverbouwing verblijfsobject) wel

#### Scenario:
Gegeven een pand met een eindstatus
Wanneer op het endpoint verblijfsobjecten de verblijfsobjecten in dat pand worden opgevraagd met de parameter 'huidig'
Dan worden er geen verblijfsobjecten geretourneerd

#### Scenario: het adressen endpoint levert altijd huidige objecten
Gegeven het adressen endpoint retourneert alleen huidige objecten
En er bestaat een nummeraanduiding met status 'Naamgeving ingetrokken'
Wanneer het adressen endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres niet geretourneerd

#### Scenario: het adressen endpoint levert altijd huidige objecten en retourneert een object niet als een gerelateerd object een eindstatus heeft
Gegeven het adressen endpoint retourneert alleen huidige objecten
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject ingetrokken'
Wanneer het adressen endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres niet geretourneerd

#### Scenario: het adressen endpoint levert altijd huidige objecten
Gegeven het adressen endpoint retourneert alleen huidige objecten
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
Wanneer het adressen endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres geretourneerd

#### Scenario: het adressen endpoint levert altijd huidige objecten tenzij op basis van een identificatie van een pand wordt bevraagd, het pand kan een eindstatus hebben en het adres wordt dan wel geretourneerd
Gegeven het adressen endpoint retourneert alleen huidige objecten
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
En het gerelateerde pand heeft status 'Pand gesloopt'
Wanneer het adressen endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres geretourneerd

#### Scenario: het adressen uitgebreid endpoint levert altijd huidige objecten, ook als op basis van een identificatie van een pand wordt bevraagd
Gegeven het adressen uitgebereid endpoint retourneert alleen huidige objecten
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde pand heeft status 'Pand gesloopt'
Wanneer het adressen uitgebreid endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres niet geretourneerd

#### Scenario: het adressen uitgebreid endpoint levert altijd huidige objecten
Gegeven het adressen uitgebereid endpoint retourneert alleen huidige objecten
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde pand heeft status 'Pand in gebruik'
Wanneer het adressen uitgebreid endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres geretourneerd