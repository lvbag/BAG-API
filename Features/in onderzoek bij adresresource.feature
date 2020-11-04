# language: nl

Functionaliteit: In onderzoek bij Adresresource

  In de resource Adres worden de attributen teruggegeven die in onderzoek zijn. 
  Bij deze resource wordt in onderzoek alleen gegeven voor de attributen die relevant zijn voor een Adres.
  Dit betekent dat er van de objecten, woonplaats, openbare ruimte en nummeraanduiding, die in vereenvoudigde vorm gezamenlijk de afgeleide resource Adres vormen, attributen in onderzoek kunnen zijn die niet geleverd worden bij de resource Adres. Om te weten welke attributen van een object in onderzoek zijn, moet de resource van het object worden geraadpleegd.
   Voor een extra toelichting op in onderzoek zie kunt u het artikel hierover in de praktijkhandleiding BAG raadplegen. (https://imbag.github.io/praktijkhandleiding/artikelen/wat-is-de-inhoudelijke-betekenis-van-de-verschillende-soorten-in-onderzoek).

  Abstract Scenario: In onderzoek wordt gevuld op basis van in onderzoek staan van gegevens in de registratie
    Gegeven in object <Objecttype> is gegeven <Attribuut in de BAG> in onderzoek
    En het <attibuut in de BAG> dat in onderzoek is, is relevant voor een Adres
    Als de afgeleide Adresresource wordt opgevraagd
    Dan bevat het antwoord in property inOnderzoek de naam of namen van de properties die in onderzoek zijn
    En bevat het antwoord in property inOnderzoek de property toelichting met een waarde "<toelichting>"
    
    Attributen waarbij in onderzoek relevant is voor het Adres:
      | Objecttype       | Attribuut		                    | Naam	             | toelichting |
      | Woonplaats       | Naam                                     | woonplaatsNaam 	     | Woonplaatsnaam is mogelijk onjuist geschreven. |
      | Openbare ruimte  | Naam                                     | openbareRuimteNaam     | Openbare ruimte naam komt mogelijk niet overeen met de vermelding in het straatnaambesluit. |
      | Openbare ruimte  | Naam                                     | korteNaam              | Korte naam is mogelijk onjuist, omdat de Openbare ruimte naam mogelijk niet overeen komt met de vermelding in het straatnaambesluit. Dit is geen indicatie dat de openbare ruimte naam mogelijk onjuist is verkort. |
      | Openbare ruimte  | Status                                   | openbareRuimteStatus   | Openbare ruimte bestaat mogelijk niet (meer). |
      | Openbare ruimte  | Ligt in (gerelateerde woonplaats)        | openbareRuimteLigtIn   | Mogelijk verkeerde woonplaats gebruikt. De openbare ruimte moet verwijzen naar de woonplaats waarin de openbare ruimte fysiek ligt. |
      | Nummeraanduiding | Huisnummer                               | huisnummer	     | Mogelijk is het verkeerde huisnummer geregistreerd. |
      | Nummeraanduiding | Huisletter                               | huisletter             | Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend. |
      | Nummeraanduiding | Huisnummertoevoeging                     | huisnummertoevoeging   | Mogelijk is ten onrechte een huisnummertoevoeging toegekend, ontbreekt de huisnummertoevoeging ten onrechte, of is een verkeerde huisnummertoevoeging toegekend. |
      | Nummeraanduiding | Postcode                                 | postcode               | Mogelijk is ten onrechte een postcode toegekend, ontbreekt de postcode ten onrechte, of is een verkeerde postcode toegekend. |
      | Nummeraanduiding | Status                                   | nummeraanduidingStatus | Adres bestaat mogelijk niet (meer), omdat de nummeraanduiding mogelijk niet (meer) bestaat. |
      | Nummeraanduiding | Ligt in (gerelateerde woonplaats)        | nummeraanduidingLigtIn | Mogelijk is de verkeerde woonplaats gebruikt. Het adres moet verwijzen naar de woonplaats waarin het adres fysiek ligt. |
      | Nummeraanduiding | Ligt aan (gerelateerde openbare ruimte)  | nummeraanduidingligtAan| Mogelijk is de verkeerde openbare ruimte gebruikt. Het adres moet verwijzen naar de openbare ruimte waaraan het adres ligt. |


    Scenario: In onderzoek wordt ook geleverd wanneer het gegeven geen waarde heeft
      Gegeven in object nummeraanduiding is gegeven huisletter in onderzoek
      En in object nummeraanduiding heeft huisletter geen waarde of is leeg
      Als de afgeleide Adres resource wordt opgevraagd
      Dan bevat het antwoord geen property huisletter
      En bevat het antwoord:
        """
            "Inonderzoek": {
                "huisletter": true,
                "toelichting": [
                  "Mogelijk is ten onrechte een huisletter toegekend, ontbreekt de huisletter ten onrechte, of is een verkeerde huisletter toegekend."
                ]
            }
        """
    
 
     
