# Huidig

In het dagelijks gebruik van gegevens zijn soms alleen huidige gegevens nodig.
Huidig betekent dat het object actueel is en geen eindstatus heeft.
Voor een toelichting zie de [Praktijkhandleiding BAG](https://imbag.github.io/praktijkhandleiding/artikelen/wat-is-het-verschil-tussen-actieve-voorkomens-actuele-voorkomens-en-huidige-voorkomens).

Enkele endpoints leveren alleen huidige gegevens.
Bij enkele endpoints wordt de mogelijkheid geboden om met de parameter 'Huidig' alleen huidige objecten op te vragen

Parameter Huidig werkt als een filter.
Bij toepassing van de paramater wordt als defaultwaarde 'nee' gebruikt.
Dan worden alle objecten teruggegeven.

Bij toepassing van de parameter huidig worden geen objecten teruggeven waarvan de statussen een van de volgende is:
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
**Gegeven** een pand met verblijfsobjecten waaronder verblijfsobjecten met een eindstatus, (niet gerealiseerd verblijfsobject, of verblijfsobject ingetrokken of verblijfsobject ten onrechte opgevoerd)<br />
**Wanneer** ik de API bevraag met parameter 'huidig'<br />
**Dan** bevat de response de verblijfsobjecten met een eindstatus niet en de verblijfsobjecten met de overige statussen (Verblijfsobject in gebruik, (niet ingemeten), Verblijfsobject in gebruik, Verblijfsobject buiten gebruik, tverbouwing verblijfsobject) wel

#### Scenario:
**Gegeven** een pand met een eindstatus<br />
**Wanneer** op het endpoint verblijfsobjecten de verblijfsobjecten in dat pand worden opgevraagd<br />
**Dan** volgt een foutmelding.