**Release notes 26-11-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen van de uitgebreide informatie van één huidig adres met de identificatie van een nummeraanduiding.
- Bevragen/zoeken van alle aan een woonplaats gerelateerde openbare ruimten met de woonplaats identificatie.
- Bevragen/zoeken van alle aan een openbare ruimte gerelateerde nummeraanduidingen met een openbare ruimte identificatie.
- Bevragen/zoeken van alle aan een pand gerelateerde verblijfsobjecten met een pand identificatie.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 

**Release notes 11-11-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Zoeken van huidige adressen met postcode, woonplaats, straatnaam, huisnummer, huisletter, huisnummertoevoeging.
- Bevragen van één huidig adres met de identificatie van een zoekresultaat verkregen via /adressen/zoek.
- Bevragen van een huidig adres met de identificatie van een nummeraanduiding.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 

**Release notes 01-10-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Expand parameter bij bevragen van een verblijfsobject
- Expand parameter bij bevragen van een ligplaats
- Expand parameter bij bevragen van een standplaats


### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen
- Zoeken van een bronhouder, op basis van de geometrische locatie (punt), evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd
- Zoeken van een bronhouder, op basis van de object identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd voor objecten anders dan woonplaatsen (openbareruimte, nummeraanduiding, ligplaats, standplaats, verblijfsobject en pand)

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------  

**Release notes 16-09-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen van een verblijfsobject op basis van de verblijfsobject-identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, exclusief expand parameter
- Bevragen van een ligplaats op basis van de ligplaats-identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, exclusief expand parameter
- Bevragen van een standplaats op basis van de standplaats-identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, exclusief expand parameter
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. verblijfsobjecten via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten.yaml
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. ligplaatsen via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/ligplaatsen.yaml
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. standplaatsen via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/standplaatsen.yaml

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen
- Zoeken van een bronhouder, op basis van de geometrische locatie (punt), evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd
- Zoeken van een bronhouder, op basis van de object identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd voor objecten anders dan woonplaatsen (openbareruimte, nummeraanduiding, ligplaats, standplaats, verblijfsobject en pand)

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------  
  
**Release notes 10-09-2020:**
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen van een openbare ruimte op basis van de openbare ruimte identificatie, evt. i.c.m. expand parameter en/of tijdreisparameters: geldigOp en beschikbaarOp
- Bevragen van een nummeraanduiding op basis van de nummeraanduiding identificatie, evt. i.c.m. expand parameter en/of tijdreisparameters: geldigOp en beschikbaarOp
- Bevragen van een pand op basis van de pand identificatie, evt. i.c.m. expand parameter en/of tijdreisparameters: geldigOp en beschikbaarOp
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. openbare ruimten via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten.yaml
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. nummeraanduidingen via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen.yaml
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. panden via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden.yaml  

### Known issues:
- Bij de woonplaatsen endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen
- Zoeken van een bronhouder, op basis van de geometrische locatie (punt), evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd
- Zoeken van een bronhouder, op basis van de object identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd voor objecten anders dan woonplaatsen (openbareruimte, nummeraanduiding, ligplaats, standplaats, verblijfsobject en pand)
- Bij de bronhouders endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen  
  
###  Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven. Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints. Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------  
  
**Release notes 03-07-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen van een woonplaats op basis van de woonplaats identificatie, evt. i.c.m. expand parameter en/of tijdreisparameters: geldigOp en beschikbaarOp
- Bevragen van de levenscyclus van een woonplaats, op basis van de woonplaats identificatie, evt. i.c.m. query parameter geheleLvc en/of expand
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. woonplaatsen via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen.yaml
- Bevragen van een voorkomen van een woonplaats, op basis van de identificatie van een woonplaats en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG
- Bevragen van een bronhouder, op basis van de bronhouder identificatie (gemeentecode), evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp
- Bevragen van een bronhouder, op basis van de woonplaats identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp
- Bevragen van een voorkomen van een bronhouder, op basis van de identificatie van een bronhouder en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG
- Het opvragen van de OpenAPI Specificatie (v3) m.b.t. bronhouders via de URI: https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/bronhouders.yaml

### Known issues:
- Zoeken van een woonplaats, op basis van een geometrisch locatie (punt), evt. i.c.m. expand parameter en/of tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd
- Zoeken van één of meer woonplaatsen op basis van een woonplaatsnaam, evt. i.c.m. expand parameter en/of tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd
- Bij de woonplaatsen endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen
- Zoeken van een bronhouder, op basis van de geometrische locatie (punt), evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd
- Zoeken van een bronhouder, op basis van de object identificatie, evt. i.c.m. tijdreisparameters: geldigOp en beschikbaarOp, is nog niet (volledig) geïmplementeerd voor objecten anders dan woonplaatsen (openbareruimte, nummeraanduiding, ligplaats, standplaats, verblijfsobject en pand)
- Bij de bronhouders endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
