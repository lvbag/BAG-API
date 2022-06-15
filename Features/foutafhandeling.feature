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
| Foutsituatie                        | status | title                                                            | code                   |
| Geen parameter is meegegeven        | 400    | Ten minste één parameter moet worden opgegeven.                  | paramsRequired         |
| Verplichte parameter(combinatie)    | 400    | Minimale combinatie van parameters moet worden opgegeven.        | paramsCombination      |
| Niet toegestane parametercombinatie | 400    | De combinatie van opgegeven parameters is niet toegestaan.       | unsupportedCombination |
| Parametervalidatie                  | 400    | Een of meerdere parameters zijn niet correct.                    | paramsValidation       |
| Teveel zoekresultaten               | 400    | Teveel zoekresultaten.                                           | tooManyResults         |
| Niet geauthenticeerd                | 401    | Niet correct geauthenticeerd.                                    | authentication         |
| Geen autorisatie voor operatie      | 403    | U bent niet geautoriseerd voor deze operatie.                    | autorisation           |
| Opgevraagde resource bestaat niet   | 404    | Opgevraagde resource bestaat niet.                               | notFound               |
| Methode niet toegestaan             | 405    | Deze methode is niet toegestaan                                  | methodNotAllowed       |
| Accept header <> JSON               | 406    | Gevraagde contenttype wordt niet ondersteund.                    | notAcceptable          |
| Accept-Crs niet ondersteund         | 406    | CRS niet ondersteund.                                            | crsNotAcceptable       |
| Geen Accept-Crs                     | 412    | Gewenste coördinatenstelsel voor geometrie moet worden opgegeven.| acceptCrsMissing       |
| Geen Content-Crs                    | 412    | Coördinatenstelsel van gestuurde geometrie moet worden opgegeven.| contentCrsMissing      |
| Content-Crs niet ondersteund        | 415    | CRS niet ondersteund                                             | crsNotSupported        |
| Invalide request body               | 422    | Request body bevat een ongeldige waarde.                         | unprocessableEntity    |
| Technische of interne fout          | 500    | Interne server fout.                                             | serverError            |
| Bronservice niet beschikbaar        | 503    | Bronservice is niet beschikbaar.                                 | sourceUnavailable      |

Wanneer de fout is veroorzaakt door fouten in requestparameters (of request body), wordt "invalid-params" gevuld met details over elke foute parameter.

Wanneer er fouten worden veroorzaak door meerdere parameters, dan wordt er per validatiefout een "invalid-params" instantie opgenomen in het antwoord. Alle fouten worden dus teruggegeven.

Bij een fout op een parameter krijgt in "invalid-params" attribuut "type" een url naar een beschrijving van de fout in de parameter. De hier gerefereeerde foutbeschrijving is specifieker dan "type" op het hoofdniveau van het bericht.
Bij een fout op een parameter krijgt in "invalid-params" attribuut "name" de naam van de parameter waar de fout in zit.
Bij een fout op een parameter krijgt in "invalid-params" attribuut "code" een vaste waarde afhankelijk van het soort fout, zie tabel hieronder.
Bij een fout op een parameter krijgt in "invalid-params" attribuut "reason" een vaste omschrijving afhankelijk van het soort fout, zie tabel hieronder.

Bij valideren van een parameter tegen schema kunnen de volgende meldingen komen:
| validatie        | reason                                                    | code         |
| type: integer    | Waarde is geen geldige integer.                           | integer      |
| type: number     | Waarde is geen geldige number.                            | number       |
| type: boolean    | Waarde is geen geldige boolean.                           | boolean      |
| format: date     | Waarde is geen geldige datum.                             | date         |
| format: timestamp| Waarde is geen geldig tijdstip.                           | timestamp    |
| minimum          | Waarde is lager dan minimum {minimum}.                    | minimum      |
| maximum          | Waarde is hoger dan maximum {maximum}.                    | maximum      |
| minLength        | Waarde is korter dan minimale lengte {minLength}.         | minLength    |
| maxLength        | Waarde is langer dan maximale lengte {maxLength}.         | maxLength    |
| pattern          | Waarde voldoet niet aan patroon {pattern}.                | pattern      |
| enumeratiewaarde | Waarde heeft geen geldige waarde uit de enumeratie.       | enum         |
| tabelwaarde      | Waarde komt niet voor in de tabel.                        | table        |
| required         | Parameter is verplicht.                                   | required     |
| expand           | Deel van de parameterwaarde niet correct: {waarde}.       | expand       |
| wildcard         | Incorrect gebruik van wildcard karakter {wildcard}.       | wildcard     |

Bij een validatiefout op de expandparameter, wordt de plek binnen de parameterwaarde opgenomen waar de fout gevonden wordt.

Abstract Scenario: Ongeldige pathparameter waarde bij raadplegen resource
  Als de {resource} wordt geraadpleegd met {parameter}={waarde}
  Dan is de http status code van het antwoord 400
  En is in het antwoord title=Een of meerdere parameters zijn niet correct
  En is in het antwoord status=400
  En eindigt attribuut instance met /{resource}/{waarde}
  En bevat invalid-params exact 1 voorkomen(s)
  En is in het antwoord invalid-params.name={parameter}
  En is in het antwoord invalid-params.reason={reason}
  En is in het antwoord invalid-params.code={code}

  Voorbeelden:
    | code         | reason                                                     | resource        | parameter           | waarde                  |
    | minLength    | Waarde is korter dan minimale lengte 16.                   | panden          | pandidentificatie   | 100010921152            |
    | maxLength    | Waarde is langer dan maximale lengte 16.                   | panden          | pandidentificatie   | 980014100010921152      |
    | expand       | Deel van de parameterwaarde is niet correct: bestaatniet.  | panden          | expand              | bestaatniet             |

Abstract Scenario: Ongeldige queryparameter waarde bij zoeken
  Als {resource} worden gezocht met {parameter}={waarde}
  Dan is de http status code van het antwoord 400
  En is in het antwoord title=Een of meerdere parameters zijn niet correct
  En is in het antwoord status=400
  En eindigt attribuut instance met /{resource}?{parameter}={waarde}
  En bevat invalid-params exact 1 voorkomen(s)
  En is in het antwoord invalid-params.name={parameter}
  En is in het antwoord invalid-params.reason={reason}
  En is in het antwoord invalid-params.code={code}

  Voorbeelden:
    | code         | reason                                                       | resource             | parameter                  | waarde                      |
    | integer      | Waarde is geen geldige integer.                              | panden               | identificatie              | a                           |
    | number       | Waarde is geen geldige number.                               | panden               | coordinates                | [null, 474479.898]          |
    | date         | Waarde is geen geldige datum.                                | panden               | geldigOp                   | 23-04-2019                  |
    | date         | Waarde is geen geldige datum.                                | panden               | geldigOp                   | 1983-05-00                  |
    | maximum      | Waarde is hoger dan maximum 99999.                           | nummeraanduidingen   | huisnummer                 | 123456                      |
    | maxLength    | Waarde is langer dan maximale lengte 4.                      | nummeraanduidingen   | huisnummertoevoeging       | tegenover                   |
    | pattern      | Waarde voldoet niet aan patroon ^[1-9]{1}[0-9]{3}[A-Z]{2}.   | nummeraanduidingen   | postcode                   | 123aa                       |
    | enum         | Waarde heeft geen geldige waarde uit de enumeratie.          | nummeraanduidingen   | geconstateerd              | B                           |
    | expand       | Deel van de parameterwaarde is niet correct: bestaatniet.    | nummeraanduidingen   | expand                     | bestaatniet                 |

  Scenario: geen enkele zoekparameter opgegeven in zoekvraag
    Als resources worden gezocht zonder parameters
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Minimale combinatie van parameters moet worden opgegeven.
    En is in het antwoord status=400
    En eindigt attribuut instance met /panden
    En is in het antwoord code=paramsRequired
    En is in het antwoord title=Ten minste één parameter moet worden opgegeven
    En komt attribuut invalid-params niet voor in het antwoord

  Scenario: meerdere fouten in parameters
    Gegeven dat pand 9914100010921152 bestaat
    Als pand 9914100010921152 wordt gezocht met onbekend=a&fout=b
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Een of meerdere parameters zijn niet correct.
    En is in het antwoord status=400
    En eindigt attribuut instance met panden/9914100010921152?onbekend=a&fout=b
    En bevat invalid-params exact 2 voorkomen(s)
    En is er een invalid-params met name=onbekend
    En is er een invalid-params met name=fout

  Scenario: zoeken zonder minimale combinatie van zoekparameters
    Als er openbare ruimten worden gezocht met een openbare ruimte naam <openbare ruimte naam>
    Dan is de http status code van het antwoord 400
    En is in het antwoord status=400
    En eindigt attribuut instance met openbareruimten?openbareRuimteNaam=<openbare ruimte naam>
    En is in het antwoord code=paramsCombination
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: combinatie van opgegeven parameters wordt niet ondersteund
    Gegeven op endpoint /openbareruimten kan gezocht worden op <woonplaatsnaam> en <openbare ruimtenaam> of <woonplaatsidentificate> en <openbare ruimtenaam> of <woonplaatsidentificatie>
    En worden andere combinaties van deze parameters niet ondersteund
    Als <woonplaatsidentificatie>, <woonplaatsnaam>, <openbare ruimtenaam> worden opgegeven
    Dan is de http status code van het antwoord 400
    En is in het antwoord status=400
    En eindigt attribuut instance met /openbareruimten?woonplaatsIdentificatie=<woonplaatsIdentificatie>&woonplaatsNaam=<woonplaatsnaam>&openbareRuimteNaam=<openbare ruimtenaam>
    En is in het antwoord code=unsupportedCombi
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: niet geauthenticeerd
    Als panden worden gezocht zonder authenticatiegegevens (zonder SAML assertion)
    Dan is de http status code van het antwoord 401
    En is in het antwoord title=Niet correct geauthenticeerd
    En is in het antwoord status=401
    En is in het antwoord code=authentication
    En komt attribuut invalid-params niet voor in het antwoord
    Als panden worden gezocht met invalide authenticatiegegevens (onjuiste SAML assertion)
    Dan is de http status code van het antwoord 401
    En is in het antwoord title=Niet correct geauthenticeerd.
    En is in het antwoord status=401
    En is in het antwoord code=authentication
    En komt attribuut invalid-params niet voor in het antwoord
    Als panden worden gezocht met onbekende gebruiker (onbekende SAML assertion)
    Dan is de http status code van het antwoord 401
    En is in het antwoord title=Niet correct geauthenticeerd.
    En is in het antwoord status=401
    En is in het antwoord code=authentication
    En komt attribuut invalid-params niet voor in het antwoord

  Scenario: niet geautoriseerd
    Als een pand wordt gezocht met een geauthentiseerde gebruiker zonder rechten op de API
    Dan is de http status code van het antwoord 403
    En is in het antwoord title=U bent niet geautoriseerd voor deze operatie.
    En is in het antwoord status=403
    En is in het antwoord code=autorisation

  Scenario: niet gevonden
    Gegeven dat er geen panden bestaan met een pandidentificatie=9999100000117766
    Als een pand wordt gezocht op basis van een pandidentificatie=9999100000117766
    Dan is de http status code van het antwoord 404
    En is in het antwoord title=Opgevraagde resource bestaat niet.
    En is in het antwoord status=404
    En is in het antwoord code=notFound

  Scenario: methode niet toegestaan
    Gegeven dat panden alleen geraadpleegd kunnen worden via een GET-request
    Als een pand wordt geraadpleegd via een POST-request
    Dan is de http status code van het antwoord 405
    En is in het antwoord title=Deze methode is niet toegestaan
    En is in het antwoord status=405
    En is in het antwoord code=methodNotAllowed

  Scenario: niet ondersteund contenttype
    Als een pand wordt geraadpleegd met de header 'Accept' = application/xml
    Dan is de http status code van het antwoord 406
    En is in het antwoord title=Gevraagde contenttype wordt niet ondersteund.
    En is in het antwoord status=406
    En is in het antwoord code=notAcceptable

  Scenario: niet voldaan aan vooraf gestelde voorwaarde
    Als een pand wordt geraadpleegd met de header 'Accept-Crs' = b
    Dan is de http status code van het antwoord 406
    En is in het antwoord title=Gevraagde coördinatenstelsel b wordt niet ondersteund
    En is in het antwoord status=406
    En is in het antwoord code=crsNotAcceptable

  Scenario: niet voldaan aan vooraf gestelde voorwaarde
    Als een resource wordt geraadpleegd/bevraagd
    En de resource bevat geometrie
    En de bevraging sluit de geometrie niet uit
    En er wordt geen Accept-Crs meegestuurd
    Dan is de http status code van het antwoord 412
    En is in het antwoord title=Gewenste coördinatenstelsel voor geometrie moet worden opgegeven.
    En is in het antwoord status=412
    En is in het antwoord code=acceptCrsMissing

  Scenario: niet voldaan aan vooraf gestelde voorwaarde
    Als een resource wordt gezocht op basis van geometrie zonder de header 'Content-Crs' mee te sturen
    Dan is de http status code van het antwoord 412
    En is in het antwoord title=Coördinatenstelsel van gestuurde geometrie moet worden opgegeven.
    En is in het antwoord status=412
    En is in het antwoord code=contentCrsMissing

  Scenario: Content-Crs niet ondersteund
    Als een resource wordt gezocht op basis van geometrie met de header 'Content-Crs' = a
    Dan is de http status code van het antwoord 415
    En is in het antwoord title=Coördinatenstelsel a in Content-Crs wordt niet ondersteund.
    En is in het antwoord status=415
    En is in het antwoord code=crsNotSupported

  Scenario: Invalide request body
    Gegeven op endpoint /panden kan met POST gezocht worden op <locatie>
    Als een request body wordt aangeboden die niet vertaald kan worden naar een valide locatie
    Dan is de http status code van het antwoord 422
    En is in het antwoord title=Request body bevat een ongeldige waarde.
    En is in het antwoord status=422
    En is in het antwoord code=unprocessableEntity

  Scenario: Technische- of interne fout
    Gegeven de API heeft last van een technisch probleem bij een verzoek van de gebruiker
    Als een endpoint wordt aangesproken
    Dan is de http status code van het antwoord 500
    En is in het antwoord title=Interne server fout.
    En is in het antwoord status=500
    En is in het antwoord code=serverError

  Scenario: Bronservice is niet beschikbaar
    Als een endpoint wordt geraadpleegd
    En de BAG API geen response of een timeout geeft
    Dan is de http status code van het antwoord 503
    En is in het antwoord title=Bronservice is niet beschikbaar.
    En is in het antwoord status=503
