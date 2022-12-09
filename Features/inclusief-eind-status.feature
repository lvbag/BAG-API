# language: nl

Functionaliteit: inclusief eind status

  Bij endpoints die standaard huidige (actueel zonder eind status) gegevens leveren (zoals /adressen en /adressenuitgebreid, zie https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openapi.yaml),
  kan middels een parameter inclusiefEindStatus ook de actuele gegevens worden opgevraagd.
  Actuele gegevens zijn de gegevens die nu geldig zijn ongeacht de status van het object voorkomen.

  Deze parameter kan niet worden gebruikt i.c.m. tijdreis parameters, zie https://github.com/lvbag/BAG-API/blob/master/Features/tijdreizen.feature of huidig parameter, zie https://github.com/lvbag/BAG-API/blob/master/Features/huidig.feature.

  De default waarde van de parameter inclusiefEindStatus is 'false'.

  Parameters die niet worden ondersteund bij endpoints die huidige gegevens leveren en wel worden opgegeven, worden genegeerd.
  Er treedt in dat geval geen foutmelding op.

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
