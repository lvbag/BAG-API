# language: nl

# Nederlandse API Strategie:
# Hoofdstuk 11 is weliswaar niet normatief, maar dient wel als uitgangspunt voor deze feature beschrijving.

Functionaliteit: tijdreizen

  Tijdreizen is het opvragen van resource informatie op een bepaald moment in de tijd.
  Bij tijdreizen wordt er gekeken naar twee aspecten:
  - welke informatie was op een bepaald moment geldig (de materiële historie)
  - welke informatie was op een bepaald beschikbaar (de formele historie)
  
  Tijdreizen wordt mogelijk gemaakt voor de volgende resources:
  - woonplaats
  - openbare ruimte
  - nummeraanduiding
  - ligplaats
  - standplaats
  - verblijfsobject
  - pand
  - bronhouder
  
  Tijdreizen wordt niet ondersteund voor de volgende resources:
  - adres
  - adresuitgebreid
  Dit zijn samengestelde resources, waarover geen historie wordt bijgehouden.

  Tijdreizen wordt niet ondersteund bij endpoints:
  - waar de levenscyclus van een object opgevraagd kan worden
  - waar een specifiek voorkomen van een object opgevraagd kan worden

  De volgende query parameters worden ondersteund:
  - geldigOp: datum waarop de resource geldig is
  - beschikbaarOp: datum en tijd waarop de resource beschikbaar is
  
  De waarden van geldigOp en beschikbaarOp bevatten een datum resp. datum en tijd conform ISO-8601.
  - geldigOp bevat een datum in de vorm: YYYY-MM-DD
  - beschikbaarOp bevat een datum en tijdstip in de vorm: YYYY-MM-DDThh:mm:ss.sss
  
  YYYY  Jaartal 4 cijfers
  MM	  Maand 2 cijfers (01 = januari, etc.)
  DD	  Dag van de maand 2 cijfers (01 to 31)
  hh	  Uren 2 cijfers (00 to 23)
  mm	  Minuten 2 cijfers (00 to 59)
  ss	  Seconden 2 cijfers (00 to 59)
  sss	  Milliseconden 3 cijfers (000-999)

  Als geen waarde is gespecificeerd voor één van de query parameters, dan wordt impliciet de datum (en tijd) van het moment van bevragen gebruikt. Dit levert de meest recente informatie over de gevraagde resource.
  
  Parameters geldigOp en/of beschikbaarOp kunnen niet worden gebruikt i.c.m. parameter huidig.

  Zie ook huidig feature beschrijving: https://github.com/lvbag/BAG-API/blob/master/Features/huidig.feature

  Scenario: geldigOp en beschikbaarOp niet opgegeven in request
    Als bij een endpoint geldigOp en beschikbaar op ondersteund worden
    En geldigOp is niet opgegeven in het request
    En beschikbaarOp is niet opgegeven in het request
    Dan bevat de response het voorkomen van een object dat geldig is op het moment van bevragen
    En dat geregistreerd staat op het moment van bevragen
  
  Scenario: geldigOp niet en beschikbaarOp wel opgegeven in request
    Als bij een endpoint geldigOp en beschikbaar op ondersteund worden
    En geldigOp is niet opgegeven in het request
    En beschikbaarOp is wel opgegeven in het request
    Dan bevat de response het voorkomen van een object dat geregistreerd stond op het opgegeven moment beschikbaarOp
    En dat met de kennis van toen geldig is op het moment van bevragen
  
  Scenario: geldigOp wel en beschikbaarOp niet opgegeven in request
    Als bij een endpoint geldigOp en beschikbaar op ondersteund worden
    En geldigOp is wel opgegeven in het request
    En beschikbaarOp is niet opgegeven in het request
    Dan bevat de response het voorkomen van een object dat op dit moment geregistreerd staat
    En dat met de kennis van dit moment, geldig was op het moment geldigOp
  
  Scenario: geldigOp en beschikbaarOp opgegeven in request
    Als bij een endpoint geldigOp en beschikbaar op ondersteund worden
    En geldigOp is wel opgegeven in het request
    En beschikbaarOp is wel opgegeven in het request
    Dan bevat de response het voorkomen van een object dat geregistreerd stond op het opgegeven moment beschikbaarOp
    En dat met de kennis van toen, geldig was op het moment geldigOp
  
  Scenario: endpoint ondersteunt query parameters geldigOp en beschikbaarOp niet
    Als bij een endpoint geldigOp en beschikbaarOp niet wordt ondersteund
    En in een request wordt geldigOp en/of beschikbaarOp opgegeven
    Dan treedt de volgende foutmelding op:
    | Foutsituatie                        | status | voorbeeld title                                            | code              |
    | Niet toegestane parametercombinatie | 400    | De combinatie van opgegeven parameters is niet toegestaan. | unsupportedCombi  |

  Scenario: query parameter huidig in request, status object voorkomen is geen eind status
    Als bij een endpoint geldigOp, beschikbaarOp en huidig worden ondersteund
    En in een request wordt geen geldigOp opgegeven
    En in de request wordt geen beschikbaarOp opgegeven
    En in de request wordt huidig opgegeven
    En de status van het betreffende object voorkomen is geen eind status
    Dan bevat de response het actuele voorkomen van een object

  Scenario: query parameter huidig in request, status object voorkomen is eind status
    Als bij een endpoint geldigOp, beschikbaarOp en huidig worden ondersteund
    En in een request wordt geen geldigOp opgegeven
    En in de request wordt geen beschikbaarOp opgegeven
    En in de request wordt huidig opgegeven
    En de status van het betreffende object voorkomen is geen eind status
    Dan bevat de response geen resultaat

  Scenario: query parameter geldigOp, beschikbaarOp en huidig in request
    Als bij een endpoint geldigOp, beschikbaarOp en huidig worden ondersteund
    En in een request wordt geldigOp opgegeven
    En in de request wordt beschikbaarOp opgegeven
    En in de request wordt huidig opgegeven
    Dan treedt de volgende foutmelding op:
    | Foutsituatie                        | status | voorbeeld title                                            | code              |
    | Niet toegestane parametercombinatie | 400    | De combinatie van opgegeven parameters is niet toegestaan. | unsupportedCombi  |
