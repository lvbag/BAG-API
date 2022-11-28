# Getting Started 
  
Om aan te sluiten kun je de volgende stappen doorlopen:
1.	Aanmelden om toegang te krijgen tot de acceptatie- en productieomgeving
2.	Bekijk de functionaliteit en specificaties
3.	Implementeer de API Client
4.	Probeer en test de API  
  
## Aanmelden  
  
[Vraag een API key voor de test- en productieomgeving aan.](https://formulieren.kadaster.nl/aanvraag_bag_api_individuele_bevragingen_productie) 
Testen wordt bij voorkeur gedaan in de testomgeving.  
  
## Fucntionaliteit en specificaties  
 
Je kunt de Open API Specificaties (OAS3) van de API bekijken in [Swagger-formaat](https://lvbag.github.io/BAG-API/Technische%20specificatie/) of [Redoc.](https://lvbag.github.io/BAG-API/Technische%20specificatie/Redoc/)
De (resolved) OAS3 is hier te downloaden: [openapi.yaml](https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openapi.yaml).
 
  
  
  
  
  
  
  
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
