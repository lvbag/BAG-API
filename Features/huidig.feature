# Huidig

In het dagelijks gebruik van gegevens zijn soms alleen huidige objecten of adressen nodig.
Huidig betekent dat het object actueel is en geen eindstatus heeft.
Voor een toelichting kunt u het artikel hierover in de Praktijkhandleiding BAG raadplegen. (https://imbag.github.io/praktijkhandleiding/artikelen/wat-is-het-verschil-tussen-actieve-voorkomens-actuele-voorkomens-en-huidige-voorkomens).

Bij enkele endpoints wordt de mogelijkheid geboden om met de parameter 'Huidig' alleen huidige objecten op te vragen.
Het adressen en adressen uitgebreid endpoint leveren alleen huidige gegevens.

Endpoints waarbij parameter Huidig kan worden toegepast:
Parameter Huidig werkt als een filter.
De defaultwaarde van de parameter is 'nee'.
Dan worden alle objecten teruggegeven ongeacht de status van het object.

Parameter huidig kan niet worden gebruikt i.c.m. parameters geldigOp en/of beschikbaarOp.

Wanneer parameter huidig=true wordt toegepast
Dan worden alleen actuele objecten teruggegeven waarvan de status NIET een van de volgende is:
* naamgeving ingetrokken
* woonplaats ingetrokken
* plaats ingetrokken
* niet gerealiseerd verblijfsobject
* verblijfsobject ingetrokken
* verblijfsobject ten onrechte opgevoerd
* niet gerealiseerd pand
* pand gesloopt
* pand ten onrechte opgevoerd

#### Scenario:
Gegeven een pand met status 'pand in gebruik' met verblijfsobjecten waaronder verblijfsobjecten met een eindstatus, (niet gerealiseerd verblijfsobject, of verblijfsobject ingetrokken of verblijfsobject ten onrechte opgevoerd)
Wanneer op het endpoint verblijfsobjecten de verblijfsobjecten in dat pand worden opgevraagd met de pandidentificatie zonder parameter 'huidig'
Dan bevat de response alle verblijfsobjecten met een relatie met dat pand ongeacht de status van de verblijfsobjecten.

#### Scenario:
Gegeven een pand met status 'pand in gebruik' met verblijfsobjecten waaronder verblijfsobjecten met een eindstatus, (niet gerealiseerd verblijfsobject, of verblijfsobject ingetrokken of verblijfsobject ten onrechte opgevoerd)
Wanneer op het endpoint verblijfsobjecten de verblijfsobjecten in dat pand worden opgevraagd met de pandidentificatie en de parameter 'huidig'
Dan bevat de response de verblijfsobjecten met een eindstatus NIET en de verblijfsobjecten met de overige statussen (Verblijfsobject in gebruik, (niet ingemeten), Verblijfsobject in gebruik, Verblijfsobject buiten gebruik, Verbouwing verblijfsobject) wel


De endpoints adressen en adressen uitgebreid leveren altijd alleen huidige gegevens.

Voor het endpoint adressen betekent dit dat alleen adressen worden teruggegeven waarbij één van de objecten waarop het adres is gebaseerd en het gerelateerde adresseerbaar object NIET één van de volgende statussen heeft:
* naamgeving ingetrokken
* woonplaats ingetrokken
* plaats ingetrokken
* niet gerealiseerd verblijfsobject
* verblijfsobject ingetrokken
* verblijfsobject ten onrechte opgevoerd

Voor adressen uitgebreid betekent dit dat alleen adressen worden teruggegeven waarbij één van de objecten waarop het adres is gebaseerd en het gerelateerde adresseerbaar object en eventueel het gerelateerde pand NIET een van de volgende statussen heeft:
* naamgeving ingetrokken
* woonplaats ingetrokken
* plaats ingetrokken
* niet gerealiseerd verblijfsobject
* verblijfsobject ingetrokken
* verblijfsobject ten onrechte opgevoerd
* niet gerealiseerd pand
* pand gesloopt
* pand ten onrechte opgevoerd

Bij het endpoint adressen wordt een adres dus WEL geleverd wanneer een pand waarin dat ligt een eindstatus heeft en bij het endpoint adressen uitgebreid wordt een adres NIET geleverd wanneer dat in een pand ligt met een eindstatus.

#### Scenario: het adressen endpoint levert huidige adressen
Gegeven het adressen endpoint levert alleen huidige adressen
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En die nummeraanduiding is gerelateerd aan een openbare ruimte met de status 'Naamgeving uitgegeven'
En die openbare ruimte is gerelateerd aan een woonplaats met de status 'Woonplaats aangewezen'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
Wanneer het adressen endpoint voor dit adres wordt bevraagd
Dan wordt het adres geleverd

#### Scenario: het adressen uitgebreid endpoint levert huidige objecten
Gegeven het adressen uitgebreid endpoint levert alleen huidige adressen
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En die nummeraanduiding is gerelateerd aan een openbare ruimte met de status 'Naamgeving uitgegeven'
En die openbare ruimte is gerelateerd aan een woonplaats met de status 'Woonplaats aangewezen'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
En het gerelateerde pand heeft status 'Pand in gebruik'
Wanneer het adressen uitgebreid endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres geleverd

#### Scenario: het adressen endpoint levert een adres niet als een object waaruit het adres is opgebouwd of het gerelateerde adresseerbaar object een eindstatus heeft
Gegeven het adressen endpoint levert alleen huidige adressen
En er bestaat een adres waarbij de nummeraanduiding de status 'Naamgeving ingetrokken' heeft
Wanneer het adressen endpoint voor dit adres wordt bevraagd
Dan wordt het adres niet geleverd

#### Scenario: het adressen endpoint levert een adres niet als een object waaruit het adres is opgebouwd of het gerelateerde adresseerbaar object een eindstatus heeft
Gegeven het adressen endpoint levert alleen huidige adressen
En er bestaat een adres waarbij de nummeraanduiding, de openbare ruimte en de woonplaats een huidige status hebben
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject ingetrokken'
Wanneer het adressen endpoint voor dit adres wordt bevraagd
Dan wordt het adres niet geleverd

#### Scenario: het adressen endpoint levert WEL adressen wanneer deze gerelateerd is aan een pand met een eindstatus.
Gegeven het adressen endpoint levert alleen huidige adressen
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
En het gerelateerde pand heeft status 'Pand gesloopt'
Wanneer het adressen endpoint voor deze nummeraanduiding wordt bevraagd met een queryparameter anders dan pandidentificatie
Dan wordt het adres geleverd

#### Scenario: het adressen endpoint levert GEEN adressen wanneer wordt bevraagd met het ID van een pand met een eindstatus, de queryparameter is niet huidig.
Gegeven het adressen endpoint levert alleen huidige adressen
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
En het gerelateerde pand heeft status 'Pand gesloopt'
Wanneer het adressen endpoint voor deze nummeraanduiding wordt bevraagd met queryparameter pandidentificatie
Dan wordt het adres niet geleverd

#### Scenario: het adressen uitgebreid endpoint levert GEEN adressen wanneer deze gerelateerd is aan een pand met een eindstatus.
Gegeven het adressen uitgebreid endpoint levert alleen huidige adressen
En er bestaat een nummeraanduiding met status 'Naamgeving uitgegeven'
En het gerelateerde verblijfsobject heeft status 'Verblijfsobject in gebruik'
En het gerelateerde pand heeft status 'Pand gesloopt'
Wanneer het adressen uitgebreid endpoint voor deze nummeraanduiding wordt bevraagd
Dan wordt het adres niet geleverd
