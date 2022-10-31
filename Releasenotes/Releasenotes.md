    
**Release notes 2.5.0:**  (oktober 2022)  
--  
  
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:  
- In het endpoint adressen uitgebreid wordt nu ook de pandstatus meegeleverd. 
- In het endpoint adressen is het mogelijk om een adresseerbaar object te embedden.
- De endpoints adresseerbare objecten, verblijfsobjecten, standplaatsen, ligplaatsen, panden en woonplaatsen zijn uitgebreid met de mogelijkheid om d.m.v. GET te zoeken binnen een bounding box.  
- De endpoints adresseerbare objecten, verblijfsobjecten, standplaatsen, ligplaatsen, panden en woonplaatsen zijn uitgebreid met de mogelijkheid om d.m.v. GET te zoeken op een punt.
- Het endpoint panden is uitgebreid met de mogelijkheid om te zoeken met een adresseerbaarobject identificatie (identificatie van een verblijfsobject, ligplaats of een standplaats).  
- Het endpoint panden is uitgebreid met de mogelijkheid om te zoeken met een nummeraanduiding identificatie.
    
**Release notes 2.4.0:**  (21 september 2022)  
--  

In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:  
- Het endpoint adressen is uitgebreid met de functionaliteit restful zoeken. 
- Foutmelding 429 is vanaf 15 september geïmplementeerd. Het limiet is ingesteld op 200.000 bevragingen per dag. Bij het overschreiden van het limiet, wordt foutmelding 429 gegeven.  
Vanaf 1 december wordt het limiet aangescherpt naar 50.000 bevragingen per dag. 
 
  
------------------------------    
  
**Release notes 2.3.0:**  (14 juli 2022)
--  

In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:  
- Het endpoint verblijfsobjecten is uitgebreid met de functionaliteit expand van de nummeraanduiding. Hierdoor is het mogelijk om binnen één bevraging de verblijfsobjecten en nummeraanduidingen op te halen die binnen een pand gelegen zijn. 
 
  ## Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

  
------------------------------   
**Release notes 2.2.0:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- De endpoints adressen en adressenuitgebreid zijn uitgebreid met adresregels. Hiervoor is een featurebeschrijving opgesteld.
- De definities van Surface en MultiSurface zijn verplaatst van een generieke naar een BAG specifieke locatie. De referenties naar deze types zijn aangepast.
-	Generieke geometrie types zijn verwijderd. Dit waren kopieën van GeoJSON types. De referenties naar de generieke geometrietypes zijn vervangen door referenties naar  GeoJSON types.
-	Type HalLink wordt nu hergebruikt bij paginering links: previous, next, first, last, in plaats van afzonderlijke linkdefinities.


### Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

 ------------------------------ 


**Release notes 2.1.6:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Binnen de resources, woonplaats, openbare ruimte, nummeraanduiding, verblijfsobject, standplaats, ligplaats en pand zijn de properties ' tijdstip Eindregistratie LV' en 'tijdstip inactief LV' toegevoegd
-	Binnen de gerelateerde in onderzoek resource is de property 'tijdstip Eindregistratie LV' toegevoegd.
-	In de header van de API is het versienummer van de release opgenomen. Deze is gelijkgetrokken met de versie van de productmatrix.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

 ------------------------------ 


**Release notes 2.1.5:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bevragen van één of meer nummeraanduidingen met de identificatie van een pand.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

 ------------------------------ 

**Release notes 17-02-2021:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	De resource bronhouder is aangevuld met de nog ontbrekende data.

Met deze release zijn alle endpoints die zijn opgenomen in de productmatrix compleet in productie genomen.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

  ------------------------------ 

**Release notes 04-02-2021:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bevragen van één of meer huidige adressen met woonplaats naam, openbare ruimte naam, huisnummer en optioneel huisnummertoevoeging en/of huisletter.
- Bevragen van de uitgebreide informatie van één of meer huidige adressen met woonplaats naam, openbare ruimte naam, huisnummer en optioneel huisnummertoevoeging en huisletter.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

  ------------------------------ 

**Release notes 26-01-2021:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bevragen/raadplegen van één of meer ligplaatsen met een geometrische locatie.
- Bevragen/raadplegen van één of meer standplaatsen met een geometrische locatie.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmelding 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 

**Release notes 21-01-2021:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bevragen van één of meer huidige adressen met de identificatie van een pand.
- Bevragen van één of meer huidige adressen met de identificatie van een adresseerbaar object.
- Bevragen van de uitgebreide informatie van één of meer huidige adressen met de identificatie van een adresseerbaar object.
- Bij de endpoints waar zowel de parameter huidig als geldigOp en/of beschikbaarOp wordt ondersteund, kan dit nu ook in combinatie worden toegepast.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 

**Release notes 15-01-2021:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bij de endpoints v2/adressen? en v2/adressenuitgebreid? is het nu ook mogelijk om een postcode met lowercase in te voeren als parameter.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 
  
**Release notes 12-01-2021:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bevragen van één adresseerbaar object (ligplaats, standplaats of verblijfsobject) met de identificatie van een adresseerbaar object.
- Bevragen van de levenscyclus van een adresseerbaar object (ligplaats, standplaats of verblijfsobject) met de identificatie van een adresseerbaar object.
- Bevragen/zoeken van alle aan een nummeraanduiding identificatie gerelateerde adresseerbare objecten (ligplaats, standplaats of verblijfsobject).
- Bevragen/raadplegen van een bronhouder met de identificatie van een object (woonplaats, openbare ruimte, nummeraanduiding, ligplaats, standplaats, verblijfsobject of pand.)

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 
  

**Release notes 28-12-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
-	Bevragen van één of meer huidige adressen met postcode, huisnummer en optioneel huisnummertoevoeging en huisletter.
-	Bevragen van de uitgebreide informatie van één of meer huidige adressen met een postcode, huisnummer en optioneel huisnummertoevoeging en huisletter.
- Bevragen/raadplegen van een voorkomen van een woonplaats met een geometrische locatie.
-	Bevragen/raadplegen van een voorkomen van één of meer panden met de geometrische locatie van het pand.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 
  

**Release notes 15-12-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen/raadplegen van een (collectie van) nummeraanduiding(en) met woonplaats naam, openbare ruimte naam, huisnummer en optioneel huisnummertoevoeging en huisletter.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 
  

**Release notes 11-12-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen/raadplegen van één voorkomen van één of meer woonplaatsen met een woonplaatsnaam.
- Bevragen/raadplegen van een openbare ruimte met een woonplaatsnaam en een openbare ruimte naam. 
- Bevragen/raadplegen van een openbare ruimte met een woonplaatsidentificatie en een openbare ruimte naam.
- Bevragen/raadplegen van een (collectie van) nummeraanduiding(en) met postcode en huisnummer (evt. met huisletter en huisnummertoevoeging).

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 


**Release notes 30-11-2020:** 
--
In deze versie van de LV BAG Individuele Bevragingen API is de volgende functionaliteit geïmplementeerd:
- Bevragen/raadplegen van de levenscyclus van één openbare ruimte, via de identificatie van een openbare ruimte.
-Bevragen/raadplegen van een voorkomen van een openbare ruimte met de identificatie van een openbare ruimte en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG.
- Bevragen/raadplegen van de levenscyclus van één nummeraanduiding met de identificatie van een nummeraanduiding.
-Bevragen/raadplegen van een voorkomen van een nummeraanduiding met de identificatie van een nummeraanduiding en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG.
- Bevragen/raadplegen van de levenscyclus van een Verblijfsobject met de identificatie van de verblijfsobject.
- Bevragen/raadplegen van een voorkomen van een verblijfsobject, met de identificatie van een verblijfsobject en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG.
- Bevragen/raadplegen van de levenscyclus van een standplaats met de identificatie van de standplaats.
- Bevragen/raadplegen van een voorkomen van een standplaats met de identificatie van een standplaats en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG.
- Bevragen/raadplegen van de levenscyclus van een ligplaats, via de identificatie van de ligplaats.
- Bevragen/raadplegen van een voorkomen van een ligplaats met de identificatie van een ligplaats en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG.
- Bevragen/raadplegen van de levenscyclus van een pand met de identificatie van een pand.
- Bevragen/raadplegen van een voorkomen van een pand met de identificatie van een pand en de identificatie van een voorkomen, bestaande uit een versie en een timestamp van het tijdstip van registratie in de LV BAG.

### Known issues:
- Bij de endpoints is ondersteuning van de foutmeldingen 204, 410, 415, 422, 429 nog niet geïmplementeerd, specificaties kunnen op dit vlak nog wijzigen

### Disclaimer
Overige BAG Individuele Bevragingen API endpoints kunnen beschikbaar zijn. Deze zijn echter nog niet (volledig) geïmplementeerd, getest en om die reden nog niet formeel vrijgegeven.
Deze endpoints kunnen gebruikt worden, maar kunnen nog onvolledige of incorrecte data opleveren. Aan het gebruik van de niet formeel vrijgegeven endpoints kunnen geen rechten worden ontleend. 
Kadaster is niet aansprakelijk voor evt. schade die ontstaat door het gebruik van data verstrekt door niet formeel vrijgegeven endpoints.
Support voorwaarden zijn niet van toepassing op de nog niet formeel vrijgegeven endpoints.
  
  ------------------------------ 

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
