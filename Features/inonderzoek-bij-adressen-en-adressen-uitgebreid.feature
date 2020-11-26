# language: nl

Functionaliteit: In onderzoek bij Adressen en Adressen uitgebreid

  Bij de /adressen en /adressenuitgebreid endpoints worden attributen teruggegeven die in onderzoek zijn. 
  Bij deze endpoints wordt in onderzoek alleen gegeven voor de attributen die relevant zijn voor een adres of de aanvullende gegevens bij adressenuitgebreid.
  Dit betekent dat er bij deze endpoints attributen van objecten in onderzoek kunnen zijn, maar dat deze geen onderdeel uitmaken van de Adressen of Adressenuitgebreid resource en daarom niet geleverd worden. 
  Om een compleet beeld te krijgen welke attributen van een object in onderzoek zijn, moet de resource van het object worden geraadpleegd.
  Voor een extra toelichting op in onderzoek zie het artikel hierover in de praktijkhandleiding BAG raadplegen. (https://imbag.github.io/praktijkhandleiding/artikelen/wat-is-de-inhoudelijke-betekenis-van-de-verschillende-soorten-in-onderzoek).

  Abstract Scenario: In onderzoek wordt gevuld op basis van het in onderzoek staan van gegevens in de registratie
    Gegeven in object <Objecttype> is gegeven <Attribuut> in onderzoek
    En het <Attribuut> dat in onderzoek is, is relevant voor een Adres of voor Adres uitgebreid
    Als /adressen of /adressenuitgebreid wordt bevraagd
    Dan bevat het antwoord in property inonderzoek een property met de naam <Naam> van ieder attribuut <Attribuut> dat in onderzoek is
    En bevat ieder property de waarde true
    En bevat het antwoord in property inOnderzoek de property toelichting een lijst met toelichtingen <Toelichting> voor ieder attribuut <Attribuut> dat in onderzoek is

    Attributen waarbij in onderzoek relevant is voor Adressen:
      | Objecttype       | Attribuut                                | Naam                   | Toelichting |
      | Woonplaats       | Naam                                     | woonplaatsNaam 	       | Woonplaatsnaam is mogelijk onjuist geschreven. |
      | Openbare ruimte  | Naam                                     | openbareRuimteNaam     | Openbare ruimte naam komt mogelijk niet overeen met de vermelding in het straatnaambesluit. |
      | Openbare ruimte  | Naam                                     | korteNaam              | Korte naam is mogelijk onjuist, omdat de Openbare ruimte naam mogelijk niet overeen komt met de vermelding in het straatnaambesluit. Dit is geen indicatie dat de openbare ruimte naam mogelijk onjuist is verkort. |
      | Openbare ruimte  | Status                                   | openbareRuimteStatus   | Openbare ruimte bestaat mogelijk niet (meer). |
      | Openbare ruimte  | Ligt in (gerelateerde woonplaats)        | openbareRuimteLigtIn   | Mogelijk verkeerde woonplaats gebruikt. De openbare ruimte moet verwijzen naar de woonplaats waarin de openbare ruimte fysiek ligt. |
      | Nummeraanduiding | Huisnummer                               | huisnummer             | Mogelijk is het verkeerde huisnummer geregistreerd. |
      | Nummeraanduiding | Huisletter                               | huisletter             | Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend. |
      | Nummeraanduiding | Huisnummertoevoeging                     | huisnummertoevoeging   | Mogelijk is ten onrechte een huisnummertoevoeging toegekend, ontbreekt de huisnummertoevoeging ten onrechte, of is een verkeerde huisnummertoevoeging toegekend. |
      | Nummeraanduiding | Postcode                                 | postcode               | Mogelijk is ten onrechte een postcode toegekend, ontbreekt de postcode ten onrechte, of is een verkeerde postcode toegekend. |
      | Nummeraanduiding | Status                                   | nummeraanduidingStatus | Adres bestaat mogelijk niet (meer), omdat de nummeraanduiding mogelijk niet (meer) bestaat. |
      | Nummeraanduiding | Ligt in (gerelateerde woonplaats)        | nummeraanduidingLigtIn | Mogelijk verkeerde woonplaats gebruikt. Het adres moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Nummeraanduiding | Ligt aan (gerelateerde openbare ruimte)  | nummeraanduidingligtAan| Mogelijk verkeerde openbare ruimte gebruikt. Het adres moet verwijzen naar de openbare ruimte waaraan het adres ligt. |

     Attributen waarbij in onderzoek relevant is voor Adressen uitgebreid. Dit is aanvullend op wat bij Adressen wordt geleverd:
      | Objecttype       | Attribuut                                      | Naam                                      | Toelichting |
      | Nummeraanduidng  | Type adresseerbaarobject                       | typeAdresseerbaarObject                   | Mogelijk is het verkeerde type adresseerbaar object gekoppeld. Deze indicatie heeft daarmee feitelijke betrekking op het gerelateerde adresseerbare object. |
      | Pand             | Oorspronkelijk bouwjaar                        | oorspronkelijkBouwjaar                    | Mogelijk is het bouwjaar onjuist |
      | Verblijfsobject  | Geometrie                                      | adresseerbaarObjectGeometrie              | Mogelijk is de locatie van het verblijfsobject onjuist of, wanneer het een standplaats of ligplaats betreft, is mogelijk de locatie van de contouren onjuist of de contour onjuist. |
      | Verblijfsobject  | Status                                         | adresseerbaarObjectStatus                 | De status van het verblijfsobject is mogelijk onjuist of, wanneer het een standplaats of ligplaats betreft, bestaat deze mogelijk niet meer. |
      | Verblijfsobject  | Gebruiksdoel                                   | gebruiksdoelen                            | Het gebruiksdoel komt mogelijk niet overeen met het gebruik dat beschreven staat in de vergunning |
      | Verblijfsobject  | Oppervlakte                                    | oppervlakte                               | De oppervlakte van het verblijfsobject is mogelijk onjuist. |
      | Verblijfsobject  | Maakt deel uit van (gerelateerd pand)          | maaktDeelUitVan                           | Mogelijk is niet het juiste pand gerelateerd, of bestaat Ã©Ã©n van de gerelateerde panden niet meer. |
      | Verblijfsobject  | Heeft als hoofdadres                           | adresseerbaarObjectHeeftAlsHoofdadres     | Het adresseerbaar object heeft mogelijk een verkeerd adres. |
      | Verblijfsobject  | Heeft als nevenadres                           | adresserbaarObjectHeeftAlsNevenadres      | Mogelijk is ten onrechte een nevenadres toegekend, ontbreekt de relatie met het nevenadres of is een verkeerde relatie aanwezig |
      | Standplaats      | Geometrie                                      | adresseerbaarObjectGeometrie              | Mogelijk is de locatie van het verblijfsobject onjuist of, wanneer het een standplaats of ligplaats betreft, is mogelijk de locatie van de contouren onjuist of de contour onjuist. |
      | Standplaats      | Status                                         | adresseerbaarObjectStatus                 | De status van het verblijfsobject is mogelijk onjuist of, wanneer het een standplaats of ligplaats betreft, bestaat deze mogelijk niet meer. |
      | Standplaats      | Heeft als hoofdadres                           | adresseerbaarObjectHeeftAlsHoofdadres     | Het adresseerbaar object heeft mogelijk een verkeerd adres. |
      | Standplaats      | Heeft als nevenadres                           | adresserbaarObjectHeeftAlsNevenadres      | Mogelijk is ten onrechte een nevenadres toegekend, ontbreekt de relatie met het nevenadres of is een verkeerde relatie aanwezig |
      | Ligplaats        | Geometrie                                      | adresseerbaarObjectGeometrie              | Mogelijk is de locatie van het verblijfsobject onjuist of, wanneer het een standplaats of ligplaats betreft, is mogelijk de locatie van de contouren onjuist of de contour onjuist. |
      | Ligplaats        | Status                                         | adresseerbaarObjectStatus                 | De status van het verblijfsobject is mogelijk onjuist of, wanneer het een standplaats of ligplaats betreft, bestaat deze mogelijk niet meer. |
      | Ligplaats        | Heeft als hoofdadres                           | adresseerbaarObjectHeeftAlsHoofdadres     | Het adresseerbaar object heeft mogelijk een verkeerd adres. |
      | Ligplaats        | Heeft als nevenadres                           | adresserbaarObjectHeeftAlsNevenadres      | Mogelijk is ten onrechte een nevenadres toegekend, ontbreekt de relatie met het nevenadres of is een verkeerde relatie aanwezig |


    Scenario: In onderzoek wordt ook geleverd wanneer het gegeven geen waarde heeft
      Gegeven in object nummeraanduiding is gegeven huisletter in onderzoek
      En in object nummeraanduiding heeft huisletter geen waarde of is leeg
      Als de afgeleide Adres resource wordt opgevraagd
      Dan bevat het antwoord een property huisletter
      En bevat het antwoord:
      
      {  
        ...
        "inonderzoek": {
          "huisletter": true,
          "toelichting": [
            "Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend."
          ]
        }
      }