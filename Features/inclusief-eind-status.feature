# language: nl

Functionaliteit: inclusief eind status

  Bij endpoints die standaard huidige (actueel zonder eind status) gegevens leveren,
  kan middels een parameter inclusiefEindStatus ook de actuele gegevens worden opgevraagd. 
  Actuele gegevens zijn de gegevens die nu geldig zijn ongeacht de status van het object voorkomen.

  Deze parameter kan niet worden gebruikt i.c.m. tijdreis parameters, zie https://github.com/lvbag/BAG-API/blob/master/Features/tijdreizen.feature of huidig parameter, zie https://github.com/lvbag/BAG-API/blob/master/Features/huidig.feature.

  De default waarde van de parameter inclusiefEindStatus is 'false'.

  Scenario: geen inclusiefEindStatus in request
    Gegeven een object met een actueel voorkomen zonder eind status (huidig)
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus is niet opgegeven
    En geldigOp is niet opgegeven
    En beschikbaarOp is niet opgegeven
    En huidig is niet opgegeven
    Dan bevat de response het huidige voorkomen van het object

  Scenario: inclusiefEindStatus=false in request
    Gegeven een object met een actueel voorkomen zonder eind status (huidig)
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus=false is opgegeven
    En geldigOp is niet opgegeven
    En beschikbaarOp is niet opgegeven
    En huidig is niet opgegeven
    Dan bevat de response het huidige voorkomen van het object

  Scenario: inclusiefEindStatus=true in request
    Gegeven een object met een actueel voorkomen zonder eind status
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus=true is opgegeven
    En geldigOp is niet opgegeven
    En beschikbaarOp is niet opgegeven
    En huidig is niet opgegeven
    Dan bevat de response het huidige voorkomen van het object

  Scenario: geen inclusiefEindStatus in request
    Gegeven een object met een actueel voorkomen met een eind status
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus is niet opgegeven
    En geldigOp is niet opgegeven
    En beschikbaarOp is niet opgegeven
    En huidig is niet opgegeven
    Dan wordt het actuele voorkomen niet geleverd
  
  Scenario: inclusiefEindStatus=false in request
    Gegeven een object met een actueel voorkomen met een eind status
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus=false is opgegeven
    En geldigOp is niet opgegeven
    En beschikbaarOp is niet opgegeven
    En huidig is niet opgegeven
    Dan wordt het actuele voorkomen niet geleverd

  Scenario: inclusiefEindStatus=true in request
    Gegeven een object met een actueel voorkomen met een eind status
    Als een request wordt ingediend om het huidige voorkomen op te vragen
    En inclusiefEindStatus=true is opgegeven
    En geldigOp is niet opgegeven
    En beschikbaarOp is niet opgegeven
    En huidig is niet opgegeven
    Dan bevat de response het actuele voorkomen van het object

  Scenario: geldigOp, beschikbaarOp of huidig i.c.m. inclusiefEindStatus
    Als naar een endpoint dat standaard huidige gegevens levert een request wordt gestuurd
    En ingeinclusiefEindStatus=true is opgegeven
    En één of meer van de parameters geldigOp, beschikbaarOp of huidig zijn opgegeven
    Dan bevat de response status=400
    En bevat de response code=unsupportedCombination
    En bevat de response title=De combinatie van opgegeven parameters is niet toegestaan.
