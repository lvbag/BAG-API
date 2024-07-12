# Getting Started 
  
Om aan te sluiten kun je de volgende stappen doorlopen:
1.	[Aanmelden om toegang te krijgen tot de productieomgeving](#aanmelden)
2.	[Bekijk de functionaliteit en specificaties](#functionaliteiten-en-specificaties)
3.	[Implementeer de API Client](#implementeer-de-api-client)
4.	[Probeer en test de API](#probeer-en-test-de-api)
  
## Aanmelden  
  
[Vraag een API key voor de productieomgeving aan.](https://formulieren.kadaster.nl/aanvraag_bag_api_individuele_bevragingen_productie)
  
## Functionaliteiten en specificaties  
 
Je kunt de Open API Specificaties (OAS3) van de API bekijken in [Swagger-formaat](https://lvbag.github.io/BAG-API/Technische%20specificatie/) of [Redoc.](https://lvbag.github.io/BAG-API/Technische%20specificatie/Redoc/)
De (resolved) OAS3 is hier te downloaden: [openapi.yaml](https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openapi.yaml).  
  
### Beschikbare endpoints  
  
De API kent de volgende endpoints:  

•	*Bronhouder*    
•	*Ligplaats*  
•	*Nummeraanduiding*  
•	*Openbare ruimte*  
•	*Pand*  
•	*Standplaatsen*   
•	*Verblijfsobjecten*  
•	*Woonplaatsen*  


•	*Adres*: hierin zijn samenhangende en gerelateerde gegevens samengevoegd uit de nummeraanduiding, openbare ruimte en woonplaats die samen een adres vormen.

•	*Adres uitgebreid*: deze resource ondersteunt de mogelijkheid om met één bevraging meer informatie over het adres op te halen, zoals het bouwjaar en de gebruiksoppervlakte.   
  
•	*Adresseerbare object*: dit kan een verblijfsobject, ligplaats of standplaats zijn.  

De objecten endpoints leveren één of meer (voorkomens van) object(en), met embedded resources en links. 

De endpoints *Adres* en *Adres uitgebreid* en *Adresseerbare object* zijn samengestelde (convenience) endpoints waarin de gegevens van verschillende BAG objecten zijn samengevoegd.  
  
### Zoekingangen van de verschillende endpoints  
  
Elk endpoint beschikt over een eigen set aan gegevens en elk endpoint is door middel van verschillende zoekingangen te bevragen.  
In de tabel [Wat zit in welk endpoint](https://github.com/lvbag/BAG-API/blob/master/Documentatie/Tabel_Wat%20zit%20in%20welk%20endpoint_.pdf) is af te lezen welke zoekingangen mogelijk zijn bij de verschillende endpoints en welke informatie dit oplevert.  
  
###   Algemene functionaliteit  
  
Er zijn een aantal algemene functies die gelden voor bovenstaande aanvragen:  
  
  •	De expand resource is te gebruiken om binnen een response extra informatie te ontvangen over een van de objecttypen. Zo kan bijvoorbeeld bij een adres de volledige informatie (inclusief registratie tijdstippen) van een openbare ruimte worden opgevraagd door expand=openbareruimte mee te nemen in de bevraging. Voor de werking, zie feature [expand.](https://github.com/lvbag/BAG-API/blob/master/Features/expand.feature)

•	De functionaliteit exacte match biedt de mogelijkheid om een specifiek object te bevragen. Ook wanneer er meerdere objecten aan de opgegeven parameters voldoen. Parameter exacteMatch=true werkt als een filter op de objecten die voldoen aan de opgegeven parameters huisnummer, huisletter en huisnummertoevoeging. De endpoints waar exacte match kan worden toegepast kennen geen fuzzy search. Voor de werking, zie feature [exacte match.](https://github.com/lvbag/BAG-API/blob/master/Features/exacte_match.feature)

•	Er wordt paginering gebruikt om het aantal zoekresultaten per zoekvraag te beperken. Met de page parameter kan een volgende pagina worden gevraagd. Met de pageSize parameter kan gekozen worden voor meer of minder zoekresultaten per pagina (standaard is 20, maximum is 100). Voor de werking, zie feature [paginering.](https://github.com/lvbag/BAG-API/blob/master/Features/paginering.feature) 

•	Bij enkele endpoints wordt de mogelijkheid geboden om met de parameter Huidig alleen huidige objecten op te vragen. Huidig betekent dat het object actueel is en geen eindstatus heeft. De endpoints Adressen en Adressen uitgebreid leveren alleen huidige gegevens. Voor meer informatie, zie feature [huidig.](https://github.com/lvbag/BAG-API/blob/master/Features/huidig.feature)

•	Soms kan een onderzoek lopen naar de juistheid van een gegeven. Er zijn dan twijfels over de juistheid van de geregistreerde waarde. De API levert deze waarde wel, maar neemt die velden dan op in Inonderzoek met de waarde True. Voor de werking, zie feature [Inonderzoek bij adressen en adressenUitgebreid.](https://github.com/lvbag/BAG-API/blob/master/Features/inonderzoek-bij-adressen-en-adressen-uitgebreid.feature)  

•	De gegevens die worden geleverd met de endpoints adressen en adressen uitgebreid zijn huidige gegevens. Door middel van de boolean inclusief eindstatus, is het mogelijk om ook adressen te zoeken waarbij één van de bronobjecten (nummeraanduiding, openbare ruimte en woonplaats) een eindstatus heeft.

•	Sommige resources bevatten geometrie. De API ondersteunt op dit moment alleen het RD coördinatenstelsel (epsg:28992). Bij een aanvraag die geometrie teruglevert, moet de request header Accept-Crs worden meegestuurd.

•	Bij het zoeken naar panden en adresseerbare objecten kan gebruik worden gemaakt van een boundingbox.  

Voor alle feature beschrijvingen zie: (https://github.com/lvbag/BAG-API/blob/master/Features/).
  
### Uitwerking Use cases  
  
####  Zoeken op een adres d.m.v. postcode en huisnummer binnen het endpoint Adressen  
  
Je kan een adres zoeken met het endpoint /adressen/. Als zoekingang kan bijvoorbeeld de postcode en huisnummercombinatie worden gebruikt.  
 
Een volledig overzicht met mogelijke zoekingangen is opgenomen in de tabel [Wat zit in welk endpoint](https://github.com/lvbag/BAG-API/blob/master/Documentatie/Tabel_Wat%20zit%20in%20welk%20endpoint_.pdf).  
  
Deze zoekfunctie kan soms veel zoekresultaten opleveren. Daarom wordt hier [paginering](https://github.com/lvbag/BAG-API/blob/master/Features/paginering.feature) toegepast.  
  
In onderstaand voorbeeld is gezocht op postcode 2631 CR, huisnummer 15 en huisletter c.  
  
    

    {
      "_links": {
        "self": {
          "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/adressen?postcode=2631CR&huisnummer=15&huisletter=C&exacteMatch=true&page=1&pageSize=20&inclusiefEindStatus=true"
        }
      },
      "_embedded": {
        "adressen": [
          {
            "openbareRuimteNaam": "Dorpsstraat",
            "korteNaam": "Dorpsstraat",
            "huisnummer": 15,
            "huisletter": "c",
            "postcode": "2631CR",
            "woonplaatsNaam": "Nootdorp",
            "nummeraanduidingIdentificatie": "1926200000508011",
            "openbareRuimteIdentificatie": "1926300000479027",
            "woonplaatsIdentificatie": "1142",
            "adresseerbaarObjectIdentificatie": "1926010000508012",
            "pandIdentificaties": [
              "1926100000485708"
            ],
            "adresregel5": "Dorpsstraat 15 c",
            "adresregel6": "2631 CR  NOOTDORP",
            "_links": {
              "self": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/adressen/1926200000508011"
              },
              "openbareRuimte": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/1926300000479027"
              },
              "nummeraanduiding": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/1926200000508011"
              },
              "woonplaats": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/1142"
              },
              "adresseerbaarObject": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/1926010000508012"
              },
              "panden": [
                {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/1926100000485708"
                }
              ]
            }
          }
        ]
      }
    }   
  
#### Zoeken naar alle verblijfsobjecten gelegen binnen een pand  
  
Wanneer je op zoek bent naar alle verblijfsobjecten die gelegen zijn binnen een pand, kan je dit doen door gebruik te maken van het verblijfsobjecten endpoint. Door de pandidentificatie als zoekingang te gebruiken, worden alle verblijfsobjecten binnen het pand geleverd.  

Dit doe je met /verblijfsobjecten?pandIdentificatie={pandIdentificatie}, waarbij {pandIdentificatie} moet worden vervangen door de identificatie van het betreffende pand. Bijvoorbeeld /adressen?pandIdentificatie=0268100000021458:  
  
  
     {
      "_embedded": {
        "verblijfsobjecten": [
          {
            "verblijfsobject": {
              "type": "Verblijfsobject",
              "heeftAlsHoofdAdres": "0268200000041560",
              "identificatie": "0268010000036826",
              "domein": "NL.IMBAG.Verblijfsobject",
              "geometrie": {
                "punt": {
                  "type": "Point",
                  "coordinates": [
                    183003.794,
                    425425.693,
                    0
                  ]
                }
              },
              "gebruiksdoelen": [
                "woonfunctie"
              ],
              "oppervlakte": 48,
              "status": "Verblijfsobject in gebruik",
              "geconstateerd": "N",
              "documentdatum": "2010-03-16",
              "documentnummer": "CB 16-03-2010",
              "voorkomen": {
                "tijdstipRegistratie": "2010-12-10T02:45:55",
                "versie": 1,
                "beginGeldigheid": "2010-03-16",
                "tijdstipRegistratieLV": "2010-12-10T03:01:55.973"
              },
              "maaktDeelUitVan": [
                "0268100000021458"
              ]
            },
            "_links": {
              "self": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/0268010000036826"
              },
              "heeftAlsHoofdAdres": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/0268200000041560"
              },
              "maaktDeelUitVan": [
                {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/0268100000021458"
                }
              ]
            }
          }  

 Aangezien dit veel adressen kan opleveren, wordt hier [paginering](https://github.com/lvbag/BAG-API/blob/master/Features/paginering.feature) toegepast.  
   
 #### Zoeken naar adressen binnen een bounding box  
   
De BAG API biedt de mogelijkheid om binnen een specifiek gebied (bounding box) BAG gegevens op te vragen. Het is bijvoorbeeld mogelijk om door middel van een bounding box te zoeken naar adresseerbare objecten (met adresgegevens) binnen een maximum oppervlakte van 250.000 vierkante meter.  
  
Binnen het endpoint adresseerbare objecten kunnen de x en y coördinaten van de hoek linksonder worden opgegeven en de x en y coördinaten van de hoek rechtsboven. Deze twee punten maken een rechthoekige box waarbinnen wordt gezocht.  

Let erop dat bij de bevraging de Content-Crs  epsg:28992 wordt meegegeven. 
  
De url is als volgt:  
https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/adresseerbareobjecten?huidig=false&page=1&pageSize=20&bbox=230781.67,582665.17,230956.35,582882.42  
  

    {
      "_embedded": {
        "adresseerbareObjecten": [
          {
            "verblijfsobject": {
              "verblijfsobject": {
                "type": "Verblijfsobject",
                "heeftAlsHoofdAdres": "0014200010900021",
                "identificatie": "0014010011089620",
                "domein": "NL.IMBAG.Verblijfsobject",
                "geometrie": {
                  "punt": {
                    "type": "Point",
                    "coordinates": [
                      230900.789,
                      582669.048,
                      0
                    ]
                  }
                },
                "gebruiksdoelen": [
                  "overige gebruiksfunctie"
                ],
                "oppervlakte": 19,
                "status": "Verblijfsobject in gebruik",
                "geconstateerd": "N",
                "documentdatum": "2013-02-19",
                "documentnummer": "3535704",
                "voorkomen": {
                  "tijdstipRegistratie": "2013-02-22T09:17:09",
                  "versie": 2,
                  "beginGeldigheid": "2013-02-19",
                  "tijdstipRegistratieLV": "2013-02-22T09:35:31.531"
                },
                "maaktDeelUitVan": [
                  "0014100010923600"
                ]
              },
              "_links": {
                "self": {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/0014010011089620"
                },
                "heeftAlsHoofdAdres": {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/0014200010900021"
                },
                "maaktDeelUitVan": [
                  {
                    "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/0014100010923600"
                  }
                ]
              }
            }
          },

  
### Beperking gebruik BAG API Individuele Bevragingen
  
Het gebruik van de BAG API Individuele Bevragingen is kosteloos. Bij het gebruik van deze service gelden voorwaarden om overmatig of onwenselijk gebruik van de API te voorkomen. We willen de BAG API voor alle afnemers snel en bruikbaar houden. Om dit te kunnen waarborgen zijn limieten ingesteld. Meer informatie over de beperkingen van de BAG API vindt u [hier.](https://github.com/lvbag/BAG-API/blob/master/Documentatie/Beperkingen%20gebruik%20BAG%20API.md)     
  
## Implementeer de API client  
  
Client code kan worden gegenereerd met de “[genereervariant](https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openapi.yaml)” van de API-specificaties en een code generator. Een overzicht met codegeneratoren is te vinden op [OpenAPI.Tools.](https://openapi.tools/#sdk)  
  
## Probeer en test de API  
  
De werking van de API is het gemakkelijkst te testen met behulp van [Postman](https://www.getpostman.com/). De [openapi.yaml](https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openapi.yaml) kan je importeren als project, waarna de verschillende requests worden ingeladen die deze API ondersteunt.  
  
### API Key  
  
Om de API te kunnen bevragen, is een API key nodig. Deze moet je bij het request opnemen in request header “X-Api-Key”. [Vraag een API key voor de BAG API aan.](https://formulieren.kadaster.nl/aanvraag_bag_api_individuele_bevragingen_productie)  
  
### Testgevallen  
  
Onderstaande tabellen bevatten testgevallen voor specifieke situaties waarmee de werking van de API kan worden getest:  
   
  | **Resource**          | **Test situatie**                                                                | **URI**                                 |
|-----------------------|----------------------------------------------------------------------------------|-----------------------------------------|
| adressen              | Adres met diakriet in straatnaam, huisnummer, huisletter en huisnummertoevoeging | /adressen/0484200002040489              |
| adressen              | Lange straatnaam                                                                 | /adressen/0417200000000354              |
| adressen              | Nevenadres                                                                       | /adressen/0014200022197986              |
| adressen              | Geconstateerd                                                                    | /adressen/0014200022188962              |
| adressen              | Meerdere panden op zelfde adres                                                  | /adressen/0193200000096680              |
| adresseerbareobjecten | Verblijfsobject                                                                  | /adresseerbareobjecten/0599010000165822 |
| adresseerbareobjecten | Standplaats                                                                      | /adresseerbareobjecten/0503030000103062 |
| adresseerbareobjecten | Ligplaats                                                                        | /adresseerbareobjecten/0569020000012435 |
| adresseerbareobjecten | Meerdere gebruiksdoelen                                                          | /adresseerbareobjecten/0626019900006674 |
| adresseerbareobjecten | Met nevenadres                                                                   | /adresseerbareobjecten/0014010011067299 |
| adresseerbareobjecten | Meerdere panden                                                                  | /adresseerbareobjecten/0193010000096628 |
| panden                | Veel adressen                                                                    | /panden/0826100000000467                |
| panden                | Met nevenadres                                                                   | /panden/0014100010921152                |
| panden                | Zonder adres                                                                     | /panden/0503100000034877                |
  
Tip: Je kan ook de [BAG Viewer](https://bagviewer.kadaster.nl/lvbag/bag-viewer/index.html) gebruiken om meer testgevallen te zoeken.  
  
### URL  
  
De API is te benaderen via de volgende url:

Productieomgeving:  
https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/  
  


    
