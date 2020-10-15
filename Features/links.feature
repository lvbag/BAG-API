# language: nl

Voor tijdreisvragen endpoints:
 opbouw self link:
 Er wordt exact overgenomen wat er door een client is opgegeven.
 Wordt er alleen geldig op opgegeven, dan komt alleen geldig op in de self link.
 Geeft een client meer parameters op dan worden die exact overgenomen.
 Geeft een client bepaalde parameters niet op en wordt een default gebruikt(bv. page, pageSize, geldigOp, beschikbaarOp) dan komen die niet in de self link terug.

 Links naar gerelateerde objecten:
 Omdat er impliciet een tijdreisvraag wordt gesteld naar welke object voorkomens er op een bepaald moment aan de gevraagde resource (object) waren gekoppeld geldt het volgende:
 - geen geldig op en beschikbaar op (actueel voorkomen) = geen tijdstippen in links van gerelateerde objecten (actueel voorkomen)
 - geldig op in vraag (en beschikbaar op niet) = geldig op en beschikbaar op in de links van gerelateerde objecten, beschikbaar op wordt automatisch datum en tijd waarop de vraag is gesteld
 - beschikbaar op in vraag (en geldig op niet) = geldig op en beschikbaar op in links van gerelateerde objecten, geldig op wordt automatisch datum en tijd waarop de vraag is gesteld
 - geldig op en beschikbaar op in vraag = geldig op en beschikbaar op in links van gerelateerde objecten

 Paginering of andere query parameters zijn bij gerelateerde links niet van toepassing, die zijn alleen van toepassing voor self link
 
 Voor endpoints die collecties opleveren:
  opbouw self link van de collectie:
  Er wordt exact overgenomen wat er door een client is opgegeven.
  Geeft een client meer parameters op dan worden die exact overgenomen.
  Geeft een client bepaalde parameters niet op en wordt een default gebruikt dan komen die niet in de self link terug.

  opbouw self link embedded resource
  De self links in de embedded resources verwijzen naar het specifieke voorkomen het object

  opbouw gerelateerde link in embedded resource
  De link naar gerelateerde objecten verwijzen naar voorkomens van het gerelateerde object

   Scenario: Er wordt een nummeraanduiding opgevraagd op het tijdreisvraagendpoint nummeraanduidingen
      Er wordt geen geldigOp of beschikbaarOp of andere querieparameter opgegeven
      Dan bevat het antwoord:
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

   Scenario: Er wordt een nummeraanduiding opgevraagd op het tijdreisvraagendpoint nummeraanduidingen
      Er wordt geldigOp <Datum> en geen beschikbaarOp opgegeven
      En er wordt expand=<Objecttype> opgegeven
      Dan bevat het antwoord:
        "_links": {
            "self": {
               "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/<nummeraanduidingIdentificatie>?geldigOp=<Datum>&expand=<objecttype>"
            },
            "ligtInWoonplaats": {
               "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd van request>"
            },
            "ligtAanOpenbareRuimte": {
               "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/openbareruimten/<openbareRuimteIdentificatie>?geldigOp=<Datum>&beschikbaarOp=<DatumTijd van request>"
               }


  Scenario: er wordt een woonplaats opgevraagd op het levenscyclusendpoint woonplaatsen (levert collectie)
     En er wordt expand = true opgegeven
     Dan bevat het antwoord:
     "_links": {
         "self": {
             "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>/lvc?expand=true"
           }
                 "_embedded": {},
                 "_links": {
                     "self": {
                        "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/woonplaatsen/<woonplaatsIdentificatie>/<versie>/<timestapRegistratieLv>"
                     },
                     "bronhouders": [
                         {
                             "href": "http://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/bronhouders/<versie>/<timestapRegistratieLv>"
                         },
