# language: nl

Functionaliteit: inclusief eind status

  Bij endpoints die standaard huidige (actueel zonder eind status) gegevens leveren (zoals /adressen en /adressenuitgebreid, zie https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openapi.yaml),
  kan middels een parameter inclusiefEindStatus ook de actuele gegevens worden opgevraagd.
  Actuele gegevens zijn de gegevens die nu geldig zijn ongeacht de status van het object voorkomen.

  Deze parameter kan niet worden gebruikt i.c.m. tijdreis parameters, zie https://github.com/lvbag/BAG-API/blob/master/Features/tijdreizen.feature of huidig parameter, zie https://github.com/lvbag/BAG-API/blob/master/Features/huidig.feature.

  De default waarde van de parameter inclusiefEindStatus is 'false'.

  Scenario: geen inclusiefindStatus in request
    Gegeven een object met een actueel voorkomen <status>
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus wordt niet meegegeven in de request
    Dan bevat de response het actuele voorkomen <resultaat> 
    | status              | resultaat |
    | zonder eind status  | wel       |
    | met een eind status | niet      |    

  Scenario: inclusiefEindStatus in request
    Gegeven een object met een actueel voorkomen met <status>
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus bevat waarde <inclusiefEindStatus>
    Dan bevat de response het actuele voorkomen <resultaat> 
    | status              | inclusiefEindStatus | resultaat |
    | zonder eind status  | true                | wel       |
    | met een eind status | true                | wel       |    
    | zonder eind status  | false               | wel       |
    | met een eind status | false               | niet      |

  Scenario: geldigOp, beschikbaarOp of huidig i.c.m. inclusiefEindStatus
    Als naar een endpoint dat standaard huidige gegevens levert een request wordt gestuurd
    En ingeinclusiefEindStatus=true is opgegeven
    En één of meer van de parameters geldigOp, beschikbaarOp of huidig zijn opgegeven
    Dan bevat de response status=400
    En bevat de response code=unsupportedCombination
    En bevat de response title=De combinatie van opgegeven parameters is niet toegestaan.
