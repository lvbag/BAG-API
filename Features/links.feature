# language: nl

De response van endpoints bevat altijd of één resource of een collectie van resources.

Functionaliteit: self links

  Scenario: self link van een resource
    Als er een bevraging wordt gedaan op één van de endpoints
    En deze endpoint levert één enkele resource
    Dan bevat de _links.self van de resource exact de URL (incl. path en query parameters) zoals die door een client is opgegeven
    
    Als er een bevraging wordt gedaan op één van de endpoints
    En deze endpoint levert één enkele resource
    En een client geeft bepaalde parameters niet op (bv. expand)
    Dan bevat de _links.self van de resource deze parameters niet
    
    Als er een bevraging wordt gedaan op één van de endpoints
    En deze endpoint levert één enkele resource
    En een client geeft bepaalde parameters niet op (bv. geldigOp, beschikbaarOp)
    En de <Datum van request> resp. <DatumTijd van request> wordt als default gebruikt voor deze parameters
    Dan bevat de _links.self van de resource deze parameters niet

  Scenario: self link van een collectie (niet zijnde een levenscyclusendpoint)
    Als er een bevraging wordt gedaan op één van de endpoints
    En deze endpoint levert een collectie van resources
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van de collectie exact de URL (incl. path en query parameters) zoals die door een client is opgegeven

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En een client geeft bepaalde parameters niet op (bv. page, pageSize, geldigOp, beschikbaarOp)
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van de collectie deze parameters niet

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En een client geeft bepaalde parameters niet op (bv. page, pageSize, geldigOp, beschikbaarOp)
    En de default waarde wordt gebruikt voor deze parameters
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van de collectie deze parameters niet

  Scenario: self link van een resource in een collectie (niet zijnde een levenscyclus endpoint)
    Als er een bevraging wordt gedaan op één van de endpoints
    En deze endpoint levert een collectie van resources
    En de geldigOp parameter wordt meegegeven
    En de beschikbaarOp parameter wordt meegegeven
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van iedere resource in de collectie een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link.self de meegegeven tijdreisparameter geldigOp 
    En bevat de link.self de meegegeven tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En de geldigOp parameter wordt meegegeven
    En de beschikbaarOp parameter wordt niet meegegeven
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van iedere resource in de collectie een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link.self de meegegeven tijdreisparameter geldigOp 
    En bevat de link.self niet de tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En de geldigOp parameter wordt niet meegegeven
    En de beschikbaarOp parameter wordt meegegeven
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van iedere resource in de collectie een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link.self niet de tijdreisparameter geldigOp 
    En bevat de link.self de meegegeven tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En de geldigOp parameter wordt niet meegegeven
    En de beschikbaarOp parameter wordt niet meegegeven
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van iedere resource in de collectie een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link.self niet de tijdreisparameter geldigOp 
    En bevat de link.self niet de tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En een client geeft bepaalde parameters niet op (bv. expand maar niet geldigOp en beschikbaarOp)
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van iedere resource in de collectie een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID, zoals hierboven beschreven (binnen het scenario)
    En bevat de _links.self van iedere resource in de collectie deze parameters niet

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En een client geeft bepaalde parameters niet op (bv. expand maar niet geldigOp en beschikbaarOp)
    En de default waarde wordt gebruikt voor deze parameters
    Dan bevat _embedded van de collectie de resources in die collectie
    En bevat de _links.self van iedere resource in de collectie een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID, zoals hierboven beschreven (binnen het scenario)
    En bevat de _links.self van iedere resource in de collectie deze parameters niet

  Scenario: self link van een embedded resource in een resource
    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één enkele resource
    En één of meer gerelateerde resource worden geëxpand
    Dan bevat _embedded de opgevraagde en aan de resource gerelateerde resources
    En bevat de _links.self van een embedded resources in de resource een link die op dezelfde manier is samengesteld als bij het scenario 'self link van een resource in een collectie'

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert een collectie van resources
    En één of meer gerelateerde resource worden geëxpand
    Dan bevat _embedded van iedere resource in de collectie de opgevraagde en aan de resource gerelateerde resources
    En bevat de _links.self van een embedded resources in de resource een link die op dezelfde manier is samengesteld als bij het scenario 'self link van een resource in een collectie'

Functionaliteit: links naar gerelateerde resources

  Scenario: links naar gerelateerde resources in een resource
    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En de resource heeft een relatie met één of meer andere resources
    En de geldigOp parameter wordt meegegeven
    En de beschikbaarOp parameter wordt meegegeven
    Dan bevat de _links een property voor iedere gerelateerde resource met een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link de meegegeven tijdreisparameter geldigOp 
    En bevat de link de meegegeven tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En de resource heeft een relatie met één of meer andere resources
    En de geldigOp parameter wordt meegegeven
    En de beschikbaarOp parameter wordt niet meegegeven
    Dan bevat de _links een property voor iedere gerelateerde resource met een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link de meegegeven tijdreisparameter geldigOp 
    En bevat de link de default waarde <DatumTijd van request> voor de tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En de resource heeft een relatie met één of meer andere resources
    En de geldigOp parameter wordt niet meegegeven
    En de beschikbaarOp parameter wordt meegegeven
    Dan bevat de _links een property voor iedere gerelateerde resource met een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link de default waarde <Datum van request> voor de tijdreisparameter geldigOp 
    En bevat de link de meegegeven tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En de resource heeft een relatie met één of meer andere resources
    En de geldigOp parameter wordt niet meegegeven
    En de beschikbaarOp parameter wordt niet meegegeven
    Dan bevat de _links een property voor iedere gerelateerde resource met een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En bevat de link niet de tijdreisparameter geldigOp 
    En bevat de link niet de tijdreisparameter beschikbaarOp

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En een client geeft bepaalde parameters niet op (bv. expand maar niet geldigOp en beschikbaarOp)
    Dan bevat de _links een property voor iedere gerelateerde resource met een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID, zoals hierboven beschreven (binnnen het scenario)
    En bevat de link deze parameters niet

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En een client geeft bepaalde parameters niet op (bv. expand maar niet geldigOp en beschikbaarOp)
    En er wordt een default gebruikt voor deze parameters
    Dan bevat de _links een property voor iedere gerelateerde resource met een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID, zoals hierboven beschreven (binnnen het scenario)
    En bevat de link deze parameters niet

    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En de resource heeft geen relatie met andere resources conform het informatiemodel BAG 2.0
    Dan bevat de _links geen property voor gerelateerde resources

  Scenario: links naar gerelateerde resources in embedded resources
    Als er een bevraging wordt gedaan op één van de endpoints (niet zijnde een levenscyclus endpoint)
    En deze endpoint levert één of meerdere resource
    En één of meer aan een resource gerelateerde resource worden geëxpand
    Dan bevat de _embedded sectie van iedere resource, de embedded resources
    En bevat de embedded resource voor iedere aan de embedded resource gerelateerde resource een link naar het tijdreis endpoint van het betreffende resource type en met de resource ID
    En wordt de link opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'

Functionaliteit: paginering links
  
  Paginering parameters zijn alleen van toepassing voor de links van een collectie van resources.
  
  Voor een beschrijving van paginering links, zie https://github.com/lvbag/BAG-API/blob/master/Features/paginering.feature

Functionaliteit: templated links

  Voor een beschrijving van templated links, zie https://github.com/lvbag/BAG-API/blob/master/Features/uri_templating.feature
  
Functionaliteit: links bij tijdreisvragen endpoints

  Scenario: bevragen resource via tijdreisvraag endpoint zonder tijdreisparameters
    Als er een nummeraanduiding wordt opgevraagd op het tijdreisvraagendpoint nummeraanduidingen met een <nummeraanduidingIdentificatie>
    En er wordt geen geldigOp meegegeven
    En er wordt geen beschikbaarOp meegegeven
    En er worden geen andere query parameters meegegeven
    Dan wordt de self link van de resource opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'
    En bevat de resource in het antwoord de volgende links:
    
    {
      "_links": {
        "self": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>"
        },
        "ligtInWoonplaats": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>"
        },
        "ligtAanOpenbareRuimte": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>"
        }
      }
    }

  Scenario: bevragen resource via tijdreisvraag endpoint met geldigOp tijdreisparameter
    Als er een nummeraanduiding wordt opgevraagd op het tijdreisvraagendpoint nummeraanduidingen met een <nummeraanduidingIdentificatie>
    En er wordt geldigOp <Datum> meegegeven
    En er wordt geen beschikbaarOp meegegeven
    En er worden geen andere query parameters meegegeven
    Dan wordt de self link van de resource opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'
    En bevat de resource in het antwoord de volgende links:
    
    {
      "_links": {
        "self": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>?geldigOp=<Datum>"
        },
        "ligtInWoonplaats": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd van request>"
        },
        "ligtAanOpenbareRuimte": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd van request>"
        }
      }
    }
      
  Scenario: bevragen resource via tijdreisvraag endpoint met beschikbaarOp tijdreisparameter
    Als er een nummeraanduiding wordt opgevraagd op het tijdreisvraagendpoint nummeraanduidingen met een <nummeraanduidingIdentificatie>
    En er wordt geen geldigOp meegegeven
    En er wordt beschikbaarOp <DatumTijd> meegegeven
    En er worden geen andere query parameters meegegeven
    Dan wordt de self link van de resource opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'
    En bevat de resource in het antwoord de volgende links:
    
    {
      "_links": {
        "self": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>?beschikbaarOp=<DatumTijd>"
        },
        "ligtInWoonplaats": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>?geldigOp=<Datum van request>&beschikbaarOp=<DatumTijd>"
        },
        "ligtAanOpenbareRuimte": {
           "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>?geldigOp=<Datum van request>&beschikbaarOp=<DatumTijd>"
        }
      }
    }

  Scenario: bevragen resource via tijdreisvraag endpoint met geldigOp en beschikbaarOp tijdreisparameters
    Als er een nummeraanduiding wordt opgevraagd op het tijdreisvraagendpoint nummeraanduidingen met een <nummeraanduidingIdentificatie>
    En er wordt geldigOp <Datum> meegegeven
    En er wordt beschikbaarOp <DatumTijd> meegegeven
    En er wordt expand=true meegegeven
    En er worden geen andere query parameters meegegeven
    Dan wordt de self link van de resource opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'
    En bevat de resource in het antwoord de volgende links:
    
    {
      "nummeraanduiding": {
        ...
      },
      "_embedded": {
        "ligtInWoonplaats": {
          "woonplaats": {
             ...
          },
          "_links": {
            "self": {
              "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentficatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>"
            },
            "bronhouders": [
              {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/bronhouders/<bronhouderIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>"
              }
            ]
          }
        },
        "ligtAanOpenbareRuimte": {
          "openbareRuimte": {
            ...
          },
          "_links": {
            "self": {
              "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>"
            },
            "ligtInWoonplaats": {
              "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>"
            }
          }
        }
      },
      "_links": {
        "self": {
          "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>&expand=true"
        },
        "ligtInWoonplaats": {
          "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>"
        },
        "ligtAanOpenbareRuimte": {
          "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd>"
        }
      }
    }

Functionaliteit: links bij collecties (niet zijnde een levenscyclus endpoint)

  Scenario: tegen afhankelijkheidsrichting in zoeken van gerelateerde resources zonder paginering
    Als de verblijfsobjecten worden opgevraagd in een pand waarin slechts 1 verblijfsobject is gelegen
    En er worden geen tijdreisparameters meegegeven
    Dan bevat de collectie in de response één resource
    En wordt de self link van de collectie opgebouwd zoals beschreven in scenario 'self link van collectie'
    En bevat de collectie geen paginering links
    En wordt de self link van de resource opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'
    En bevat de collectie en de resource in het antwoord de volgende links:
 
    {
      "_embedded": {
        "verblijfsobjecten": [
          {
            "verblijfsobject": {
              ...
            },
            "_links": {
              "self": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/<verblijfsobjectIdentificatie>"
              },
              "heeftAlsHoofdAdres": {
                "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>"
              },
              "maaktDeelUitVan": [
                {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/<pandIdentificatie>"
                }
              ]
            }
          }
        ]
      },
      "_links": {
        "self": {
          "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten?pandIdentificatie=<pandIdentificatie>"
        }
      }
    }

  Scenario: tegen afhankelijkheidsrichting in zoeken van gerelateerde resources met paginering
    Als de verblijfsobjecten worden opgevraagd in een pand waarin meerdere verblijfsobjecten zijn gelegen
    En er worden geen tijdreisparameters meegegeven
    En er zijn zoveel verblijfsobjecten dat deze over 2 pagina's verdeeld zijn
    Dan bevat de collectie in de response meerdere voorkomens
    En wordt de self link van de collectie opgebouwd zoals beschreven in scenario 'self link van collectie'
    En bevat de collectie paginering links zoals beschreven in functionaliteit 'paginering links'
    En wordt de self link van de resources opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'links naar gerelateerde resources in een resource'
    En bevat de collectie en de resources in het antwoord de volgende links:

    {
      "_embedded": {
        "verblijfsobjecten": [
          {
            "verblijfsobject": {
              ...
            },
            "_links": {
              "self": {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/<verblijfsobjectIdentficatie>"
              },
              "heeftAlsHoofdAdres": {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentficatie>"
              },
              "maaktDeelUitVan": [
                  {
                      "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/<pandIdentficatie>"
                  }
              ]
            }
          },

          ...

          {
            "verblijfsobject": {
              ...
            },
            "_links": {
              "self": {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/<verblijfsobjectIdentficatie>"
              },
              "heeftAlsHoofdAdres": {
                  "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentficatie>"
              },
              "maaktDeelUitVan": [
                  {
                      "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/<pandIdentficatie>"
                  }
              ]
            }
          },
        ]
      },
      "_links": {
        "self": {
          "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten?pandIdentificatie=<pandIdentificatie>"
        },
        "next": {
          "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten?pandIdentificatie=<pandIdentificatie>&page=2"
        },
        "last": {
          "href": "https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten?pandIdentificatie=<pandIdentificatie>&page=2"
        }
      }
    }

Functionaliteit: links bij levenscyclusendpoints

  Scenario: self link van een collectie bij een levenscyclus
    Als de levenscyclus van een resource wordt opgevraagd via de levenscyclus endpoint van dat resource type
    Dan bevat _embedded de collectie van de voorkomens van de resource
    En bevat de _links.self van de collectie exact de URL (incl. path en query parameters) zoals die door een client is opgegeven

  Scenario: self link van een resource in de levenscyclus collectie
    Als de levenscyclus van een resource wordt opgevraagd via de levenscyclus endpoint van dat resource type
    Dan bevat _embedded de collectie van de voorkomens van de resource
    En bevat de _links.self van iedere resource voorkomen in de levenscyclus collectie, een link naar het voorkomen endpoint van het betreffende resource type, met de resource identificatie, versie en timestamp van registratie in de LV BAG

  Scenario: link naar gerelateerde resources van een resource in een levenscyclus
    Als de levenscyclus van een resource wordt opgevraagd via de levenscyclus endpoint van dat resource type
    Dan bevat _embedded de collectie van de voorkomens van de resource
    En bevat de _links van iedere resource voorkomen in de levenscyclus collectie, een attribuut met een link naar het levenscyclus endpoint van het betreffende gerelateerde resource type

  Scenario: self link van een embedded resource in een resource 
    Als de levenscyclus van een resource wordt opgevraagd via de levenscyclus endpoint van dat resource type
    En één, meer of alle gerelateerde resources worden geëxpand met de expand parameter
    Dan bevat _embedded de collectie van de voorkomens van de resource
    En bevat ieder van de resources een _embedded sectie voor de gerelateerde resources
    En bevat _embedded.<gerelateerder resource>._links sectie een self property met een link naar de levenscyclus endpoint van het gerelateerde resource type

  Scenario: links naar gerelateerde resources in een embedded resources
    Als de levenscyclus van een resource wordt opgevraagd via de levenscyclus endpoint van dat resource type
    En één, meer of alle gerelateerde resources worden geëxpand met de expand parameter
    Dan bevat _embedded de collectie van de voorkomens van de resource
    En bevat ieder van de resources een _embedded sectie voor de gerelateerde resources
    En bevat _embedded.<gerelateerder resource>._links sectie een property met een link naar de levenscyclus endpoint van het betreffende resource type

  Scenario: geen paginering links bij levenscyclus
    Als er een levenscyclus wordt opgevraagd van een resource
    Dan bevat de collectie in de response de voorkomens
    En bevat de collectie geen paginering links

  Scenario: bevragen levenscyclus van een resource
    Als er een verblijfsobject wordt opgevraagd op het levenscyclusendpoint verblijfsobjecten
    En er wordt expand=heeftAlsHoofdAdres meegegeven
    Dan bevat de collectie in de response de voorkomens van het verblijfsobject
    En wordt de self link van de collectie opgebouwd zoals beschreven in scenario 'self link van collectie'
    En wordt de self link van de resources (voorkomens) opgebouwd zoals beschreven in scenario 'self link van een resource in de levenscyclus collectie'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'link naar gerelateerde resources van een resource in een levenscyclus'
    En worden de self links van embedded resources opgebouw zoals beschreven in scenario 'self link van een embedded resource in een resource'
    En worden de links van gerelateerde resources in embedded resources opgebouw zoals beschreven in scenario 'links naar gerelateerde resources in een embedded resources'
    En worden er geen paginering links opgegeven zoals beschreven in scenario 'geen paginering links bij levenscyclus'
    En bevat de collectie en de resources in het antwoord de volgende links:
    
    {
      "_embedded": {
        "voorkomens": [
          {
            "verblijfsobject": {
              ...
            },
            "inonderzoek": [
              {
                ...
              }
            ],
            "_embedded": {
              "heeftAlsHoofdAdres": {
                "nummeraanduiding": {
                  ...
                },
                "inonderzoek": [
                  {
                    ...
                  }
                ],
                "_links": {
                  "self": {
                    "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>/lvc",
                  },
                  "ligtInWoonplaats": {
                    "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>/lvc",
                  },
                  "ligtAanOpenbareRuimte": {
                    "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>/lvc",
                  }
                }
              },
            },
            "_links": {
              "self": {
                "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/<verblijfsobjectIdentificatie>/<versie>/<timestampRegistratieLv>",
              },
              "heeftAlsHoofdAdres": {
                "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>/lvc",
              },
              "heeftAlsNevenAdres": [
                {
                  "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>/lvc",
                }
              ],
              "maaktDeelUitVan": [
                {
                  "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/panden/<pandIdentificatie>/lvc",
                }
              ]
            }
          }
        ]
      },
      "_links": {
        "self": {
          "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/verblijfsobjecten/<verblijfsobjectIdentificatie>/lvc?expand=heeftAlsHoofdAdres",
        }
      }
    }
    
Functionaliteit: links bij voorkomen endpoints

  Scenario: links naar resources bij voorkomen endpoints
    Als er een object voorkomen wordt opgevraagd op het voorkomen endpoint voor dat object type
    Dan bevat de response het voorkomen van het object
    En wordt de self link van de resource (het voorkomen) opgebouwd zoals beschreven in scenario 'self link van een resource'
    En worden de links naar gerelateerde resources opgebouwd zoals beschreven in scenario 'link naar gerelateerde resources in een resource'
    En worden de self links van embedded resources opgebouw zoals beschreven in scenario 'self link van een embedded resource in een resource'
    En worden de links van gerelateerde resources in embedded resources opgebouw zoals beschreven in scenario 'links naar gerelateerde resources in een embedded resources'
    En worden er geen paginering links opgegeven zoals beschreven in scenario 'geen paginering links bij levenscyclus'

