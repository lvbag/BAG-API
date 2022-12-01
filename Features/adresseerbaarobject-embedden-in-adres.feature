# language: nl
@skip-verify
Functionaliteit: Adresseerbaar object embedden in een adres

	Als consumer van de BAG API
	Wil ik bij het opvragen van Adressen tegelijk het bijbehorende Adresseerbaar Object kunnen opvragen
	Zodat ik niet een aparte aanroep hoeft te doen voor het opvragen van het bijbehorende Adresseerbaar object

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

Abstract Scenario: Opvragen van adressen en een deel van de kenmerken van bijbehorend adresseerbaar object via het /adressen endpoint
    Als GET /adressen<query part>expand=adresseerbaarObject.gebruiksdoelen,adresseerbaarObject.geconstateerd,adresseerbaarObject.geometrie is aangeroepen
    Dan bevat de _embedded.adresseerbaarObject property van elk Adres in de response de gevraagde kenmerken van het bijbehorend Adresseerbaar Object

    Voorbeelden:
        | query part                                                        |
        | ?pandIdentificatie=0193100000048288&                              |
        | ?adresseerbaarObjectIdentificatie=0484010002033603&               |
        | ?zoekresultaatIdentificatie=adr-89d5a4d96f09c60716c4671fdb9334b8& |
        | ?postcode=2391PH&huisnummer=1&                                    |
        | /0826200000016921?                                                |

Scenario: Opvragen van adressen en bijbehorend adresseerbaar object met overtollig expand waarden
    Als GET /adressen?pandIdentificatie=0193100000048288&expand=<expand> is aangeroepen
    Dan bevat de _embedded.adresseerbaarObject property van elk Adres in de response de gevraagde kenmerken van het bijbehorend Adresseerbaar Object

    Voorbeelden:
        | expand                                                                |
        | adresseerbaarObject,adresseerbaarObject                               |
        | adresseerbaarObject,adresseerbaarObject.gebruiksdoelen                |
        | adresseerbaarObject.gebruiksdoelen,adresseerbaarObject.gebruiksdoelen |

Rule: Foutsituaties

Abstract Scenario: Verkeerde casing
    Als GET /adressen/<nummeraanduidingidentificatie>&expand=<expand> is aangeroepen
    Dan is de response
    """
    {
        "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
        "title": "Een of meerdere parameters zijn niet correct.",
        "status": 400,
        "detail": "Bad request.",
        "instance": "https://api.bag.acceptatie.kadaster.nl/esd/huidigebevragingen/v1/adressen/<nummeraanduidingidentificatie>?expand=<expand>",
        "code": "paramsValidation",
        "invalidParams": [
            {
                "name": "expand",
                "code": "expand",
                "reason": "Deel van de parameterwaarde is niet correct: <expand>."
            }
        ]
    }
    """

    Voorbeelden:
        | nummeraanduidingidentificatie | expand                             |
        | 0826200000016921              | adresseerbaarobject                |
        | 0826200000016921              | adresseerbaarObject.gebruiksDoelen |

Rule: filteren van een resource met de identificatie van een sub-resource en tegelijk embedden van dezelfde sub-resource is niet toegestaan om redundantie te voorkomen

Scenario: filteren van adressen met adresseerbaar object identificatie en embedden van adresseerbaar object
    Als GET /adressen?adresseerbaarObjectIdentificatie=0484010002033603&expand=adresseerbaarObject
    Dan is de response
    """
    {
        "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
        "title": "Een of meerdere parameters zijn niet correct.",
        "status": 400,
        "detail": "Bad request.",
        "instance": "https://api.bag.acceptatie.kadaster.nl/esd/huidigebevragingen/v1/adressen??adresseerbaarObjectIdentificatie=0484010002033603&expand=adresseerbaarObject",
        "code": "paramsValidation",
        "invalidParams": [
            {
                "name": "expand",
                "code": "expand",
                "reason": "filteren met adresseerbaarObjectIdentificatie en tegelijk expanden van adresseerbaarObject is niet toegestaan."
            }
        ]
    }
    """
