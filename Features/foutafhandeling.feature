# language: nl

Functionaliteit: Afhandeling van fouten
Wanneer er een foutsituatie is, wordt de betreffende http statuscode teruggegeven. Het antwoord bevat dan details over de fout conform problem+json.

In de foutresponse krijgt "type" een url naar een beschrijving van de fout.
In de foutresponse krijgt "title" een korte omschrijving van de fout, zie tabel hieronder.
In de foutresponse krijgt "status" de waarde van de http status code, zie tabel hieronder.
In de foutresponse krijgt "detail" een uitgebreide beschrijving van de fout.
In de foutresponse krijgt "code" een waarde, zie tabel hieronder.
In de foutresponse krijgt "instance" de url van het request die tot de fout heeft geleid.

We kennen de volgende foutsituaties:
| Foutsituatie                        | status | title                                                             | code                   |
| Geen parameter is meegegeven        | 400    | Ten minste één parameter moet worden opgegeven.                   | paramsRequired         |
| Verplichte parameter(combinatie)    | 400    | Minimale combinatie van parameters moet worden opgegeven.         | paramsCombination      |
| Niet toegestane parametercombinatie | 400    | De combinatie van opgegeven parameters is niet toegestaan.        | unsupportedCombination |
| Parametervalidatie                  | 400    | Een of meerdere parameters zijn niet correct.                     | paramsValidation       |
| Teveel zoekresultaten               | 400    | Teveel zoekresultaten.                                            | tooManyResults         |
| Niet geauthenticeerd                | 401    | Niet correct geauthenticeerd.                                     | authentication         |
| Geen autorisatie voor operatie      | 403    | U bent niet geautoriseerd voor deze operatie.                     | autorisation           |
| Opgevraagde resource bestaat niet   | 404    | Opgevraagde resource bestaat niet.                                | notFound               |
| Methode niet toegestaan             | 405    | Deze methode is niet toegestaan                                   | methodNotAllowed       |
| Accept header <> JSON               | 406    | Gevraagde contenttype wordt niet ondersteund.                     | notAcceptable          |
| Invalide request body               | 422    | Request body bevat een ongeldige waarde.                          | unprocessableEntity    |
| Teveel verzoeken                    | 429    | Te veel verzoeken.                                                | tooManyRequests        |
| Technische of interne fout          | 500    | Interne server fout.                                              | serverError            |
| Bronservice niet beschikbaar        | 503    | Bronservice is niet beschikbaar.                                  | sourceUnavailable      |

DEPRECATED:
| Accept-Crs niet ondersteund         | 406    | CRS niet ondersteund.                                             | crsNotAcceptable       |
| Geen Accept-Crs                     | 412    | Gewenste coördinatenstelsel voor geometrie moet worden opgegeven. | acceptCrsMissing       |
| Geen Content-Crs                    | 412    | Coördinatenstelsel van gestuurde geometrie moet worden opgegeven. | contentCrsMissing      |
| Content-Crs niet ondersteund        | 415    | CRS niet ondersteund                                              | crsNotSupported        | 


Wanneer de fout is veroorzaakt door fouten in requestparameters (of request body), wordt "invalid-params" gevuld met details over elke foute parameter.

Wanneer een parameterwaarde niet overeenkomt met het gespecificeerde type (integer, number, boolean of enumeratie), wordt alleen deze fout gemeld.

Wanneer er meerdere parameterwaarden niet voldoen aan de gespecificeerde eisen (minimum ,maximum, pattern, maxItems, expand), dan wordt voor iedere validatiefout een "invalid parameter" instantie opgenomen in het antwoord

Bij een fout op een parameter krijgt in "invalid-params" attribuut "type" een url naar een beschrijving van de fout in de parameter. De hier gerefereeerde foutbeschrijving is specifieker dan "type" op het hoofdniveau van het bericht.
Bij een fout op een parameter krijgt in "invalid-params" attribuut "name" de naam van de parameter waar de fout in zit.
Bij een fout op een parameter krijgt in "invalid-params" attribuut "code" een vaste waarde afhankelijk van het soort fout, zie tabel hieronder.
Bij een fout op een parameter krijgt in "invalid-params" attribuut "reason" een vaste omschrijving afhankelijk van het soort fout, zie tabel hieronder.

Bij valideren van een parameter tegen schema kunnen de volgende meldingen komen:
| validatie         | reason                                               | code                |
| type: integer     | Waarde is geen geldige integer.                      | integer             |
| type: number      | Waarde is geen geldige number.                       | number              |
| type: boolean     | Waarde is geen geldige boolean.                      | boolean             |
| format: date      | Waarde is geen geldige datum.                        | date                |
| format: timestamp | Waarde is geen geldig tijdstip.                      | timestamp           |
| minimum           | Waarde is lager dan minimum {minimum}.               | minimum             |
| maximum           | Waarde is hoger dan maximum {maximum}.               | maximum             |
| minLength         | Waarde is korter dan minimale lengte {minLength}.    | minLength           |
| maxLength         | Waarde is langer dan maximale lengte {maxLength}.    | maxLength           |
| pattern           | Waarde voldoet niet aan patroon {pattern}.           | pattern             |
| enumeratiewaarde  | Waarde heeft geen geldige waarde uit de enumeratie.  | enum                |
| required          | Parameter is verplicht.                              | required            |
| expand            | Deel van de parameterwaarde niet correct: {waarde}.  | expand              |
| schema            | Waarde voldoet niet aan schema van {parameter}.      | schema              |
| paramWaarde       | Parameter bevat niet toegestane karakters.           | notAllowedCharacter |
| min < max         | Min mag niet hoger zijn dan max.                     | range               |

Bij een validatiefout op de expandparameter, wordt de plek binnen de parameterwaarde opgenomen waar de fout gevonden wordt.

Rule: wanneer een parameterwaarde niet aan de parameterspecificaties voldoet wordt een 400 fout gegeven met de reden in invalidParams

  Scenario: waarde van de padparameter is niet correct conform parameterspecificaties
    Als '/adresseerbareobjecten/0599040000' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Een of meerdere parameters zijn niet correct. |
    | status | 400                                           |
    | code   | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name                             | code    | reason                                                         |
    | adresseerbaarobjectidentificatie | pattern | Waarde voldoet niet aan patroon ^[0-9]{4}(01|02|03)[0-9]{10}$. |

  Abstract Scenario: Ongeldige queryparameter waarde bij zoeken
    Als bij <path> wordt gezocht met <query string>
    Dan bevat de response ten minste de volgende velden
    | naam     | waarde                                        |
    | title    | Een of meerdere parameters zijn niet correct. |
    | status   | 400                                           |
    | code     | paramsValidation                              |
    | instance | <path><query string>                          | 
    En bevat de response de volgende invalidParams
    | name        | code   | reason   |
    | <parameter> | <code> | <reason> |

    Voorbeelden:
      | path                   | query string                                                              | parameter            | code         | reason                                                                 |
      | /adressen              | ?postcode=1234aa&huisnummer=a                                             | huisnummer           | integer      | Waarde is geen geldige integer.                                        |
      | /panden                | ?point=type,Point,coordinates,null,474479.898                             | point                | pointgeojson | Waarde is geen geldige pointgeojson.                                   |
      | /panden                | ?geldigOp=23-04-2019                                                      | geldigOp             | date         | Waarde is geen geldige datum.                                          |
      | /panden                | ?geldigOp=1983-05-00                                                      | geldigOp             | date         | Waarde is geen geldige datum.                                          |
      | /panden                | ?point=type,Point,caardinates,155000,463000                               | point                | schema       | Waarde voldoet niet aan schema van point.                              |
      | /nummeraanduidingen    | ?huisnummer=123456                                                        | huisnummer           | maximum      | Waarde is hoger dan maximum 99999.                                     |
      | /nummeraanduidingen    | ?huisnummertoevoeging=tegenover                                           | huisnummertoevoeging | maxLength    | Waarde is langer dan maximale lengte 4.                                |
      | /nummeraanduidingen    | ?postcode=123aa                                                           | postcode             | pattern      | Waarde voldoet niet aan patroon ^[1-9]{1}[0-9]{3}[ ]{0,1}[a-zA-Z]{2}$. |
      | /nummeraanduidingen    | ?expand=bestaatniet                                                       | expand               | expand       | Deel van de parameterwaarde is niet correct: bestaatniet.              |
      | /adressen              | ?pandIdentificatie=0345100002016017&page=a                                | page                 | integer      | Waarde is geen geldige integer.                                        |
      | /panden                | ?point=type,Point,coordinates,abc,def                                     | point                | schema       | Waarde voldoet niet aan schema van point.                              |
      | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&geconstateerd=Nee                       | geconstateerd        | boolean      | Waarde is geen geldige boolean.                                        |
      | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&oppervlakte[min]=-1&oppervlakte[max]=1  | oppervlakte[min]     | minimum      | Waarde is lager dan minimum 1.                                         |
      | /panden                | ?bbox=135207,457400,135418,457162&bouwjaar[min]=2000&bouwjaar[max]=20200  | bouwjaar[max]        | maximum      | Waarde is hoger dan maximum 9999.                                      |
      | /panden                | ?point=type,Point,coordinates,98095.02                                    | point                | minItems     | Array bevat minder dan 2 items.                                        |
      | /panden                | ?point=type,Point,coordinates,98095.02,438495.09,0                        | point                | maxItems     | Array bevat meer dan 2 items.                                          |
      | /adressen              | ?pandIdentificatie=0345100002016017X                                      | pandIdentificatie    | pattern      | Waarde voldoet niet aan patroon ^[0-9]{4}10[0-9]{10}$.                 |
      | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&type=fout                               | type                 | enum         | Waarde heeft geen geldige waarde uit de enumeratie.                    |

  Abstract Scenario: Ongeldige request body bij zoeken
    Als bij <path> wordt gezocht met een POST en <request body>
    Dan bevat de response ten minste de volgende velden
    | naam     | waarde                                        |
    | title    | Een of meerdere parameters zijn niet correct. |
    | status   | 400                                           |
    | code     | paramsValidation                              |
    | instance | <path><request body>                          | 
    En bevat de response de volgende invalidParams
    | name        | code   | reason   |
    | <parameter> | <code> | <reason> |

    Voorbeelden:
      | path     | request body                                          | parameter   | code   | reason                         |
      | /panden  | {"type": "Point","coordinates": "[null, 474479.898]"} | coordinates | number | Waarde is geen geldige number. |

  Abstract scenario: meerdere parameter waarden voldoen niet aan gespecificeerde type
    Als <path><query string> wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam     | waarde                                        |
    | title    | Een of meerdere parameters zijn niet correct. |
    | status   | 400                                           |
    | instance | <path><query string>                          |
    | code     | paramsValidation                              |
    En bevat de response de invalidParams alleen voor de eerste foutieve parameter waarde
    | name        | code   | reason   |
    | <parameter> | <code> | <reason> |

    Voorbeelden:
    | path                   | query string                                                                                                                                   | parameter     | code             | reason                                                 |
    | /verblijfsobjecten     | ?pandIdentificatie=0345100002016017X&geldigOp=23-04-2019                                                                                       | identificatie | pattern          | Waarde voldoet niet aan patroon ^[0-9]{4}10[0-9]{10}$. |
    | /adressen              | ?postcode=1234AA&huisnummer=a&huisletter=3                                                                                                     | huisnummer    | integer          | Waarde is geen geldige integer.                        |
    | /adresseerbareobejcten | ?nummeraanduidingIdentificatie=0772200000097041&geldigOp=23-04-2019&beschikbaarOp=23-04-2019T00:00:00                                          | geldigOp      | date             | Waarde is geen geldige datum.                          |
    | /panden                | ?point=type,Point,coordinates,98095.02,438495.09&statusPand=Pand%20niet%20in%20gebruik&geconstateerd=null&bouwjaar[min]=-1&bouwjaar[max]=10000 | statusPand    | enumeratiewaarde | Waarde heeft geen geldige waarde uit de enumeratie.    |
    | /panden                | ?point=type,Point,coordinates,98095.02,438495.09&statusPand=Pand%20in%20gebruik&geconstateerd=null&bouwjaar[min]=-1&bouwjaar[max]=10000        | geconstateerd | enumeratiewaarde | Waarde heeft geen geldige waarde uit de enumeratie.    |

  Scenario: meerdere parameter waarden buiten het gespecificeerde bereik
    Als <path><query string> wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam     | waarde                                        |
    | title    | Een of meerdere parameters zijn niet correct. |
    | status   | 400                                           |
    | instance | <path><query string>                          |
    | code     | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name       | code   | reason   |
    | <paraeter> | <code> | <reason> |

    Voorbeelden:
    | path      | query string                                                                                                                            | parameter  | code    | reason                                         |
    | /adressen | ?postcode=1234AA&huisnummer=999999&huisletter=AA                                                                                        | huisnummer | maximum | Waarde is hoger dan maximum {maximum}.         |
    | /adressen | ?postcode=1234AA&huisnummer=999999&huisletter=AA                                                                                        | huisletter | pattern | Waarde voldoet niet aan patroon ^[a-zA-Z]{1}$. |
    | /panden   | ?point=type,Point,coordinates,98095.02,438495.09&statusPand=Pand%20in%20gebruik&geconstateerd=true&bouwjaar[min]=-1&bouwjaar[max]=10000 | bouwjaar   | minimum | Waarde is lager dan minimum {minimum}.         |
    | /panden   | ?point=type,Point,coordinates,98095.02,438495.09&statusPand=Pand%20in%20gebruik&geconstateerd=true&bouwjaar[min]=-1&bouwjaar[max]=10000 | bouwjaar   | maximum | Waarde is hoger dan maximum {maximum}.         |

Rule: een verplichte parameter moet zijn opgegeven met een waarde

  Scenario: Verplichte parameter is niet opgegeven
    Als bij een endpoint met verplichte parameters wordt aangeroepen zonder een parameter
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                          |
    | title  | Ten minste één parameter moet worden opgegeven. |
    | status | 400                                             |
    | code   | paramsRequired                                  |
    En bevat de response geen veld "invalidParams"

Rule: minimaal één zoekparameter(combinatie) moet zijn opgegeven bij een collectieaanroep

  Scenario: geen enkele zoekparameter opgegeven in zoekvraag
    Als <path> wordt aangeroepen zonder zoekparameters
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                         |
    | title  | Ten minste één parameter moet worden opgegeven |
    | status | 400                                            |
    | code   | paramsRequired                                 |
    En bevat de response geen attribuut invalidParams

    Voorbeelden:
    | path                   |
    | /adressen              |
    | /adresseerbareobjecten |
    | /panden                |

  Scenario: parameters huisletter en huisnummertoevoeging zonder postcode en huisnummer
    Als '/adressen?huisletter=a&huisnummertoevoeging=II' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                          |
    | title  | Ten minste één parameter moet worden opgegeven. |
    | status | 400                                             |
    | code   | paramsRequired                                  |
    En bevat de response geen veld "invalidParams"

  Scenario: parameters geconstateerd, type, gebruiksdoelen en oppervlakte zonder bbox
    Als '/adresseerbareobjecten?gebruiksdoelen=woonfunctie&geconstateerd=false&oppervlakte[min]=50&oppervlakte[max]=80' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                          |
    | title  | Ten minste één parameter moet worden opgegeven. |
    | status | 400                                             |
    | code   | paramsRequired                                  |
    En bevat de response geen veld "invalidParams"
  
  Scenario: parameters page, pageSize en expand zonder minimale zoekparameter(combinatie)
    Als '/adressen?page=1&pageSize=20&expand=adresseerbaarObject' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                          |
    | title  | Ten minste één parameter moet worden opgegeven. |
    | status | 400                                             |
    | code   | paramsRequired                                  |
    En bevat de response geen veld "invalidParams"

  Scenario: zoeken zonder minimale combinatie van zoekparameters
    Als er openbare ruimten worden gezocht met parameter openbareRuimteNaam=<openbare ruimte naam>
    Dan bevat de response ten minste de volgende velden
    | naam     | waarde                                                     |
    | title    | Minimale combinatie van parameters moet worden opgegeven.  |
    | status   | 400                                                        |
    | code     | paramsCombination                                          |
    | instance | /openbareruimten?openbareRuimteNaam=<openbare ruimte naam> |
    En bevat de response geen veld "invalidParams"
    
  Abstract Scenario: postcode en huisnummer niet in combinatie gebruikt
    Als '/adressen<query string>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                    |
    | title  | Minimale combinatie van parameters moet worden opgegeven. |
    | status | 400                                                       |
    | code   | paramsCombination                                         |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | query string                                         |
    | ?postcode=2391PH                                     |
    | ?huisnummer=3                                        |
    | ?postcode=2391PH&huisletter=a&huisnummertoevoeging=2 |
    | ?huisnummer=3&huisletter=a&huisnummertoevoeging=2    |

  Scenario: zoekparameter zonder waarde
    Als een endpoint wordt aangeroepen met een parameter zonder waarde
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                          |
    | title  | Ten minste één parameter moet worden opgegeven. |
    | status | 400                                             |
    | code   | paramsRequired                                  |
    En bevat de response geen veld "invalidParams"

Rule: combineren van verschillende zoekcombinaties is niet toegestaan

  Abstract Scenario: combinatie van opgegeven parameters wordt niet ondersteund
    Als '<path><query string>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                     |
    | title  | De combinatie van opgegeven parameters is niet toegestaan. |
    | status | 400                                                        |
    | code   | unsupportedCombination                                     |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | path                   | query string                                                                                                                             |
    | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&pandIdentificatie=0826100000000467                                      |
    | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&adresseerbaarObjectIdentificatie=0226010000038820                       |
    | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&postcode=2391PH&huisnummer=1                                            |
    | /adressen              | ?pandIdentificatie=0226100000008856&adresseerbaarObjectIdentificatie=0226010000038820                                                    |
    | /adressen              | ?pandIdentificatie=0226100000008856&postcode=4904AM                                                                                      |
    | /adressen              | ?pandIdentificatie=0226100000008856&huisnummer=633                                                                                       |
    | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&pandIdentificaties=0226100000008856                                                      |
    | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&pandIdentificaties=0599100000103376,0289100000002082                                     |
    | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&bbox=135228,457502,135246,457457                                                         |
    | /adresseerbareobjecten | ?pandIdentificaties=0226100000008856&pandIdentificaties=0599100000103376,0289100000002082                                                |
    | /adresseerbareobjecten | ?pandIdentificaties=0226100000008856&bbox=135228,457502,135246,457457                                                                    |
    | /adresseerbareobjecten | ?pandIdentificaties=0599100000103376,0289100000002082&bbox=135228,457502,135246,457457                                                   |
    | /openbareruimten       | ?woonplaatsIdentificatie=2856&woonplaatsNaam=Deventer&openbareRuimteNaam=Brink                                                           |
    | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&nummeraanduidingIdentificatie=0484200002040489                                        |
    | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&point=type,Point,coordinates,98095.02,438495.09                                       |
    | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&bbox=135228,457502,135246,457457                                                      |
    | /panden                | ?nummeraanduidingIdentificatie=0484200002040489&point=type,Point,coordinates,98095.02,438495.09                                          |
    | /panden                | ?nummeraanduidingIdentificatie=0484200002040489&bbox=135228,457502,135246,457457                                                         |
    | /panden                | ?point=type,Point,coordinates,98095.02,438495.09&bbox=135228,457502,135246,457457                                                        |
    | /panden                | ?point=type,Point,coordinates,98095.02,438495.09&statusPand=Pand%20in%20gebruik&geconstateerd=true&bouwjaar[min]=1950&bouwjaar[max]=1979 |

  Abstract Scenario: page, pageSize en expand mogen gecombineerd worden met elke zoekcombinatie
    Als '<path><query string>' wordt aangeroepen
    Dan bevat de response http status code 200
    En de resources die voldoen aan de <path><query string>

    Voorbeelden:
    | path                   | query string                                                                                              |
    | /adressen              | ?zoekresultaatIdentificatie=adr-35eabe366d08b6087fe9cb0d2fe3922b&page=1&pageSize=20&expand=openbareRuimte |
    | /adressen              | ?pandIdentificatie=0226100000008856&page=1&pageSize=20&expand=openbareRuimte                              |
    | /adressen              | ?adresseerbaarObjectIdentificatie=0226010000038820&page=1&pageSize=20&expand=openbareRuimte               |
    | /adresseerbareobjecten | ?nummeraanduidingIdentificatie=0226200000038923&page=1&pageSize=20&expand=adressen                        |
    | /adresseerbareobjecten | ?pandIdentificaties=0226100000008856&page=1&pageSize=20&expand=adressen                                   |
    | /adresseerbareobjecten | ?bbox=135228,457502,135246,457457&page=1&pageSize=20&expand=adressen                                      |
    | /panden                | ?adresseerbaarObjectIdentificatie=0484010002033603&page=1&pageSize=20                                     |
    | /panden                | ?nummeraanduidingIdentificatie=0484200002040489&page=1&pageSize=20                                        |
    | /panden                | ?point=type,Point,coordinates,98095.02,438495.09&page=1&pageSize=20                                       |
    | /panden                | ?bbox=135228,457502,135246,457457&page=1&pageSize=20                                                      |

Rule: parameters geconstateerd, type, gebruiksdoelen, oppervlakte, statusPand, geconstateerd en bouwjaar mogen alleen in combinatie met bbox worden gebruikt

  Abstract Scenario: geconstateerd, type, gebruiksdoelen, oppervlakte zonder bbox
    Als '/adresseerbareobjecten<query string>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                     |
    | title  | De combinatie van opgegeven parameters is niet toegestaan. |
    | status | 400                                                        |
    | code   | unsupportedCombination                                     |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | query string                                                                                   |
    | ?nummeraanduidingIdentificatie=0599200000193766&geconstateerd=true                             |
    | ?pandIdentificaties=0599100000103376&type=verblijfsobject                                      |
    | ?pandIdentificaties=0599100000103376,0289100000002082&gebruiksdoelen=woonfunctie               |
    | ?pandIdentificaties=0599100000103376,0289100000002082&oppervlakte[min]=10&oppervlakte[max]=200 |

  Abstract Scenario: status, geconstateerd en bouwjaar zonder bbox
    Als '/panden<query string>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                     |
    | title  | De combinatie van opgegeven parameters is niet toegestaan. |
    | status | 400                                                        |
    | code   | unsupportedCombination                                     |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | query string                                                                           |
    | ?adresseerbaarObjectIdentificatie=0226010000038820&statusPand=Pand%20in%20gebruik      |
    | ?nummeraanduidingIdentificatie=0599200000193766&geconstateerd=true                     |
    | ?point=type,Point,coordinates,98095.02,438495.09&bouwjaar[min]=1950&bouwjaar[max]=1979 |

Rule: gebruik van de parameter oppervlakte in combinatie met type=standplaats of type=ligplaats levert geen resultaten

  Abstract Scenario: zoeken met oppervlakte van standplaats of ligplaats
    Als '/adresseerbareobjecten?bbox=135207,457400,135418,457162&oppervlakte[max]=100&type=<type>' wordt aangeroepen
    Dan bevat de response geen resultaten
    En is de http status code 200

    Voorbeelden:
    | type        |
    | Standplaats |
    | Ligplaats   |      

Rule: de oppervlakte van de bounding box mag maximaal 250 duizend vierkante meter zijn.

  Scenario: waarde van bbox parameter overschrijdt maximale toegestane oppervlakte 
    Als '/panden?bbox=134647,457842,137512,455907' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Een of meerdere parameters zijn niet correct. |
    | status | 400                                           |
    | code   | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name | code           | reason                                             |
    | bbox | surfaceMaximum | Waarde is hoger dan maximum oppervlakte 250000 m2. |

Rule: min waarde mag niet groter zijn dan max waarde

  Abstract Scenario: opgegeven minimale waarde is groter dan opgegeven maximale waarde
    Als '<path><query string>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Een of meerdere parameters zijn niet correct. |
    | status | 400                                           |
    | code   | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name        | code   | reason                |
    | <parameter> | <code> | <reason omschrijving> |

    Voorbeelden:
    | path                   | query string                                                                | parameter   | code  | reason omschrijving              |
    | /adresseerbareobjecten | ?bbox=135207,457400,135418,457162&oppervlakte[min]=200&oppervlakte[max]=100 | oppervlakte | range | Min mag niet hoger zijn dan max. |
    | /panden                | ?bbox=135207,457400,135418,457162&bouwjaar[min]=2000&bouwjaar[max]=1000     | bouwjaar    | range | Min mag niet hoger zijn dan max. |

Rule: page mag niet hoger zijn dan de laatste pagina

  Scenario: Vragen om een pagina die niet bestaat
    Gegeven pand met identificatie "0826100000000467" heeft 72 adresseerbare objecten
    Als '/adresseerbareobjecten?pandIdentificaties=0826100000000467&pageSize=20&page=5' wordt aangeroepen
    Dan bevat de response geen resultaten

Rule: de expand parameter mag geen resourcenamen of veldnamen bevatten die niet in de response voor kunnen komen

  Scenario: Er is één onbekende resource naam opgegeven
    Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=bestaatniet' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Een of meerdere parameters zijn niet correct. |
    | status | 400                                           |
    | code   | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name   | code   | reason                                                    |
    | expand | expand | Deel van de parameterwaarde is niet correct: bestaatniet. |

  Scenario: Er zijn meerdere onbekende resource namen opgegeven
    Als '/adressen?zoekresultaatIdentificatie=adr-f6b00930705c1ef12c2624623a797d21&expand=bestaatniet,bestaatookniet' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Een of meerdere parameters zijn niet correct. |
    | status | 400                                           |
    | code   | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name   | code   | reason                                                       |
    | expand | expand | Deel van de parameterwaarde is niet correct: bestaatniet.    |
    | expand | expand | Deel van de parameterwaarde is niet correct: bestaatookniet. |

Rule: waarde van geometrie coördinaten moet overeenkomen met opgegeven CRS

  Abstract Scenario: zoekgeometrie die niet klopt met de opgegeven of default CRS geeft een foutmelding
    Als '<path><query string>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Een of meerdere parameters zijn niet correct. |
    | status | 400                                           |
    | code   | paramsValidation                              |
    En bevat de response de volgende invalidParams
    | name        | code             | reason                                |
    | <parameter> | geometryMismatch | Waarde is niet conform opgegeven CRS. |

    Voorbeelden:
    | path                   | query string                                   | parameter |
    | /panden                | ?point=type,Point,coordinates,51.93201,4.55980 | point     |
    | /panden                | ?bbox=52.10540,5.09861,52.10500,5.09887        | bbox      |
    | /adresseerbareobjecten | ?bbox=52.10540,5.09861,52.10500,5.09887        | bbox      |

Rule: wanneer er geen API key wordt gestuurd wordt een 400 fout gegeven

  Scenario: geen api key in request
    Als '/adressen/0599200000193766' request wordt gedaan zonder header 'x-api-key'
    Dan is de http status code van het antwoord 400 Bad Request
    En bevat de response ten minste de volgende velden
    | naam             | waarde                                |
    | error            | Kadaster - Foute aanvraag.            |
    | errorDescription | Het bericht kan niet worden verwerkt. |
    | errorDetail      | Missing API Key                       |
    En bevat de response geen attribuut invalidParams

Rule: wanneer een onjuiste API key wordt gestuurd wordt een 401 Unauthorized fout gegeven met html response

  Scenario: onjuiste API key
    Als '/adressen/0599200000193766' request wordt gedaan met header 'x-api-key: onjuist'
    Dan is de http status code van het antwoord 401 Unauthorized
    En bevat de response ten minste de volgende velden
    | naam             | waarde                                |
    | error            | Kadaster - Foute aanvraag.            |
    | errorDescription | Het bericht kan niet worden verwerkt. |
    | errorDetail      | Invalid API Key                       |
    En bevat de response geen attribuut invalidParams

Rule: wanneer de gevraagde resource niet bestaat wordt een 404 Not found fout gegeven

  Abstract scenario: resource niet gevonden
    Gegeven resources <path> met identificatie <identificatie> bestaan niet
    Als '<path>/<identificatie>' wordt aangeroepen
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                             |
    | title  | Opgevraagde resource bestaat niet. |
    | status | 404                                |
    | code   | notFound                           |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | path                   | identificatie    | resource naam       |
    | /adresseerbareobjecten | 1599010000048400 | adresseerbaarObject |
    | /panden                | 9999100000117766 | pand                |

Rule: wanneer een methode wordt aangeroepen die niet wordt ondersteund dan wordt een 405 fout gegeven

  Scenario: methode niet toegestaan
    Gegeven dat panden alleen geraadpleegd kunnen worden via een GET-request
    Als een pand wordt geraadpleegd via een POST-request
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                           |
    | status | 405                              |
    | detail | Method not allowed               |
    En bevat de response geen veld "invalidParams"

Rule: wanneer gevraagd wordt om een contenttype anders dan application/hal+json wordt een 406 Not Acceptable gegeven

  Scenario: niet ondersteund contenttype
    Als '/adressen/0599200000193766' request wordt gedaan met header 'Accept: application/xml'
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Gevraagde contenttype wordt niet ondersteund. |
    | status | 406                                           |
    | code   | notAcceptable                                 |
    En bevat de response geen veld "invalidParams"

  Scenario: contenttype json
    Als '/adressen/0599200000193766' request wordt gedaan met header 'Accept: application/json'
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                        |
    | title  | Gevraagde contenttype wordt niet ondersteund. |
    | status | 406                                           |
    | code   | notAcceptable                                 |
    En bevat de response geen veld "invalidParams"

  Scenario: contenttype hal+json
    Als '/adressen/0599200000193766' request wordt gedaan met header 'Accept: application/hal+json'
    Dan is de http status code van het antwoord 200

Rule: de inhoud van een request body is conform specificatie

  Scenario: Invalide request body
    Gegeven op endpoint /panden kan met POST gezocht worden op <point>
    Als een request body wordt aangeboden die niet vertaald kan worden naar een valide locatie
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                   |
    | title  | Request body bevat een ongeldige waarde. |
    | status | 422                                      |
    | code   | unprocessableEntity                      |
    En bevat de response geen veld "invalidParams"

Rule: wanneer er een technische fout optreed wordt een 500 Server Error gegeven

  @not-testable
  Scenario: Technische- of interne server fout
    Gegeven er treedt een technisch fout op
    Als een endpoint wordt aangesproken door een gebruiker
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde               |
    | title  | Interne server fout. |
    | status | 500                  |
    | code   | serverError          |
    En bevat de response geen veld "invalidParams"

Rule: wanneer een bron service niet beschikbaar is wordt een 503 fout gegeven

  Scenario: Bronservice is niet beschikbaar
    Als een endpoint wordt geraadpleegd
    En deze reageert niet of resulteert in een timeout
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde |
    | status | 503    |
    En bevat de response geen veld "invalidParams"

Rule: wanneer er binnen een bepaalde periode teveel verzoeken worden ingediend, wordt een 429 fout gegeven

  Scenario: Teveel verzoeken
    Gegeven een maximum aantal toegestane verzoeken binnen een bepaalde tijdsperiode
    Als binnen deze tijdsperiode een verzoek wordt ingediend
    En het totaal aantal verzoeken dat binnen de tijdsperiode is ingediend is daarmee hoger dan het maximaal toegestane aantal verzoeken
    Dan bevat de response tenminste de volgende velden
    | naam   | waarde |
    | status | 429    |
    En bevat de response geen veld "invalidParams"


DEPRECATED:

Rule: wanneer gevraagd wordt om geometrie in een CRS die niet wordt ondersteund, dan wordt een 406 Not Acceptable fout gegeven

  Scenario: niet ondersteunde Accept-Crs geeft een 406 foutmelding
    Als '/adresseerbareobjecten/0599010000165822' request wordt gedaan met header 'Accept-Crs: epsg:4326'
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                         |
    | title  | Gevraagde coördinatenstelsel epsg:4326 wordt niet ondersteund. |
    | status | 406                                                            |
    | code   | crsNotAcceptable                                               |
    En bevat de response geen veld "invalidParams"

  Scenario: Accept-Crs RD wordt ondersteund
    Als '/adresseerbareobjecten/0599010000165822' request wordt gedaan met header 'Accept-Crs: epsg:28992'
    Dan is de http status code van het antwoord 200

Rule: wanneer er geometrie wordt geretourneerd moet de gebruiker aangeven in welk CRS de geometrie moet zijn

  Abstract scenario: Accept-Crs niet meegegeven
    Als <path><query string> wordt aangeroepen
    En de resource bevat geometrie
    En de bevraging sluit de geometrie niet uit
    En er wordt geen Accept-Crs meegestuurd
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                            |
    | title  | Gewenste coördinatenstelsel voor geometrie moet worden opgegeven. |
    | status | 412                                                               |
    | code   | acceptCrsMissing                                                  |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | path          | query string                                |
    | /woonplaatsen | ?expand=geometrie                           |
    | /panden       | ?point=type,Point,coordinates,135207,457400 |

Rule: wanneer een resource wordt gezocht op basis van geometrie zonder de header Content-Crs mee te geven dan wordt een 412 fout gegeven

  Abstract scenario: Content-Crs niet meegegeven
    Als <path><query string> wordt aangeroepen
    En er wordt geen header 'Content-Crs' meegestuurd
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                            |
    | title  | Coördinatenstelsel van gestuurde geometrie moet worden opgegeven. |
    | status | 412                                                               |
    | code   | contentCrsMissing                                                 |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | path                   | query string                               |
    | /panden                | ?point=type,Point,coordinates,98095,438495 |
    | /panden                | ?bbox=135228,457502,135246,457457          |
    | /adresseerbareobjecten | ?bbox=135228,457502,135246,457457          |

Rule: wanneer een parameter geometrie bevat en het opgegeven CRS wordt niet ondersteund, dan wordt een 415 fout gegeven

  Abstract Scenario: Niet ondersteunde Content-Crs geeft een 415 foutmelding
    Gegeven WGS 84 wordt niet ondersteund
    Als '<path><query string>' request wordt gedaan met header 'Content-Crs: epsg:4326'
    Dan bevat de response ten minste de volgende velden
    | naam   | waarde                                                              |
    | title  | Coördinatenstelsel epsg:4326 in Content-Crs wordt niet ondersteund. |
    | status | 415                                                                 |
    | code   | crsNotSupported                                                     |
    En bevat de response geen veld "invalidParams"

    Voorbeelden:
    | path                   | query string                                   |
    | /panden                | ?point=type,Point,coordinates,98095,438495     |
    | /panden                | ?point=type,Point,coordinates,51.93201,4.55980 |
    | /panden                | ?bbox=135228,457502,135246,457457              |
    | /adresseerbareobjecten | ?bbox=135228,457502,135246,457457              |
    | /adresseerbareobjecten | ?bbox=52.10540,5.09861,52.10500,5.09887        |
