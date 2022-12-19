# language: nl
@skip-verify
Functionaliteit: Adresseerbaar object embedden in een adres

	Als consumer van de BAG API
	Wil ik bij het opvragen van Adressen tegelijk het bijbehorende Adresseerbaar Object kunnen opvragen
	Zodat ik niet een aparte aanroep hoef te doen voor het opvragen van het bijbehorende Adresseerbaar object

Abstract Scenario: Opvragen van adressen en bijbehorend adresseerbaar object via het /adressen endpoint
    Als GET /adressen<query part>expand=adresseerbaarObject is aangeroepen
    Dan bevat de _embedded.adresseerbaarObject property van elk Adres in de response het bijbehorend Adresseerbaar Object

    Voorbeelden:
        | query part                                                        |
        | ?pandIdentificatie=0193100000048288&                              |
        | ?adresseerbaarObjectIdentificatie=0484010002033603&               |
        | ?zoekresultaatIdentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8& |
        | ?postcode=2391PH&huisnummer=1&                                    |
        | /0826200000016921?                                                |

Abstract Scenario: Verkeerde casing
    Als GET /adressen/<nummeraanduidingidentificatie>&expand=<expand> is aangeroepen
    Dan bevat de _embedded.adresseerbaarObject property van het Adres in de response het bijbehorend Adresseerbaar Object

    Voorbeelden:
        | nummeraanduidingidentificatie | expand                             |
        | 0826200000016921              | adresseerbaarobject                |

Scenario: filteren van adressen met adresseerbaar object identificatie en embedden van adresseerbaar object
    Als GET /adressen?adresseerbaarObjectIdentificatie=0484010002033603&expand=adresseerbaarObject
    Dan bevat de _embedded.adresseerbaarObject property van het Adres in de response het bijbehorend Adresseerbaar Object
