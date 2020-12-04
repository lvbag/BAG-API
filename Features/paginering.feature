# language: nl

Functionaliteit: Als afnemer wil ik kunnen bladeren door een groot aantal resultaten
  Zodat het aantal resultaten per aanroep beperkt is en de responsetijd zo kort mogelijk

  Bladeren door de resultaten kan via de links first, previous, next en last.
  Deze properties bevatten een uri die verwijst naar de eerste pagina, vorige pagina, volgende pagina en laatste pagina met resultaten.
  Bladeren kan door gebruik van de parameter page.
  De links first, previous, next en last worden alleen opgenomen in de response wanneer dit van toepassing is.

  Wanneer de opgegeven pagina met de page parameter hoger is dan het aantal pagina's resultaat, wordt een foutmelding getoond.
  
  Wanneer bij een endpoint de paginering.feature niet is geimplementeerd en de parameter page of pageSize wordt meegegeven, wordt de parameter genegeerd

  page:
    De api levert standaard pagina 1 wanneer geen page parameter wordt meegegeven in het request en als er meerdere pagina's met resultaten zijn
    Het minimale paginanummer is 1 
    Het maximale paginanummer is afhankelijk van het aantal resultaten van een query: (totaal aantal resultaten) / (aantal resultaten per pagina (pageSize))

  pageSize:
    De api levert standaard 20 resultaten per pagina
    De api levert minimaal 10 resultaten per pagina
    De api levert maximaal 100 resultaten per pagina

  Scenario: de zoekvraag levert meerdere pagina's en er wordt geen page of pageSize parameter gebruikt
    Als de zoekvraag wordt gedaan op een endpoint waar paginering van toepassing is
    En de zoekvraag bevat geen page parameter
    En de zoekvraag bevat geen pageSize parameter
    En er zijn 61-80 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoord de resultaten 1 t/m 20 in de collectie
    En is attribuut _links.self opgebouwd zoals beschreven in de links.feature: https://github.com/lvbag/BAG-API/blob/master/Features/links.feature
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord een attribuut _links.next.href met "<de bron URI>"
    En bevat het attribuut _links.next.href "page=2"
    En bevat het attribuut _links.next.href niet "pageSize"
    En bevat het antwoord een attribuut _links.last.href met "<de bron URI>"
    En bevat het attribuut _links.last.href "page=4"
    En bevat het attribuut _links.last.href niet "pageSize"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt de eerste pagina gevraagd en er wordt geen pageSize parameter gebruikt
    Als de zoekvraag wordt gedaan op een endpoint waar paginering van toepassing is
    En de zoekvraag bevat een page parameter met "page=1"
    En de zoekvraag bevat geen pageSize parameter
    En er zijn 61-80 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoord de resultaten 1 t/m 20 in de collectie
    En is attribuut _links.self opgebouwd zoals beschreven in de links.feature: https://github.com/lvbag/BAG-API/blob/master/Features/links.feature
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord een attribuut _links.next.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.next.href "page=2"
    En bevat het attribuut _links.next.href niet "pageSize"
    En bevat het antwoord een attribuut _links.last.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.last.href "page=4"
    En bevat het attribuut _links.last.href niet "pageSize"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt een volgende pagina gevraagd
    Als de zoekvraag wordt gedaan op een endpoint waar paginering van toepassing is
    En de zoekvraag bevat een page parameter met "page=3"
    En de zoekvraag bevat geen pageSize parameter
    En er zijn 61-80 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoord de resultaten 41 t/m 60 in de collectie
    En is attribuut _links.self.href opgebouwd zoals beschreven in de links.feature: https://github.com/lvbag/BAG-API/blob/master/Features/links.feature
    En bevat het antwoord een attribuut _links.first.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.first.href "page=1"
    En bevat het attribuut _links.first.href niet "pageSize"
    En bevat het antwoord een attribuut _links.previous.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.previous.href "page=2"
    En bevat het attribuut _links.previous.href niet "pageSize"
    En bevat het antwoord een attribuut _links.next.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.next.href "page=4"
    En bevat het attribuut _links.next.href niet "pageSize"
    En bevat het antwoord een attribuut _links.last.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.last.href "page=4"
    En bevat het attribuut _links.last.href niet "pageSize"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt de laatste pagina gevraagd
    Als de zoekvraag wordt gedaan op een endpoint waar paginering van toepassing is
    En de zoekvraag bevat een page parameter met "page=4"
    En de zoekvraag bevat geen pageSize parameter
    En er zijn 72 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoord de resultaten 61 t/m 72 in de collectie
    En is attribuut _links.self.href opgebouwd zoals beschreven in de links.feature: https://github.com/lvbag/BAG-API/blob/master/Features/links.feature
    En bevat het antwoord een attribuut _links.first.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.first.href "page=1"
    En bevat het attribuut _links.first.href niet "pageSize"
    En bevat het antwoord een attribuut _links.previous.href met "<de bron URI zonder de opgegeven page parameter>"
    En bevat het attribuut _links.previous.href "page=3"
    En bevat het attribuut _links.previous.href niet "pageSize"
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt een pagina bevraagd die niet bestaat
    Als de zoekvraag wordt gedaan op een endpoint waar paginering van toepassing is
    En de zoekvraag bevat een page parameter met "page=15"
    En de zoekvraag bevat geen pageSize parameter
    En er zijn 72 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoord een attribuut status met de waarde 400
    En bevat het antwoord een attribuut title met de waarde "Een of meerdere parameters zijn niet correct."
    En bevat het antwoord een attribuut instance met de waarde "?page=15"
    En bevat het antwoord een attribuut invalidParams[0].name met de waarde "page"
    En bevat het antwoord een attribuut invalidParams[0].reason met de waarde "De opgegeven pagina bestaat niet."
    En bevat het antwoord een attribuut invalidParams[0].code met de waarde "page"
    En bevat het antwoord geen attribuut _links.self
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert één pagina
    Als de zoekvraag wordt gedaan op een endpoint waar paginering van toepassing is
    En er zijn 1-20 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoord alle gevonden resultaten in de collectie
    En is attribuut _links.self.href opgebouwd zoals beschreven in de links.feature: https://github.com/lvbag/BAG-API/blob/master/Features/links.feature
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert geen resultaten
    Als de zoekvraag wordt gedaan op een endpoint waarbij paginering van toepassing is
    En er zijn geen resulaten gevonden
    Dan bevat het antwoord geen collectie
    En is attribuut _links.self.href gelijk aan de request
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert meerdere pagina's en de page en pageSize parameters worden gebruikt
    Als de zoekvraag wordt gedaan op een endpoint waarbij paginering van toepassing is
    En de zoekvraag bevat een parameter "page=3"
    En de zoekvraag bevat een parameter "pageSize=15"
    En er zijn 61-75 resultaten die voldoen aan de zoekvraag
    Dan bevat het antwoorden resultaten 31 t/m 45 in de collectie
    En is attribuut _links.self.href opgebouwd zoals beschreven in de links.feature: https://github.com/lvbag/BAG-API/blob/master/Features/links.feature "?page=3&pageSize=15"
    En bevat het antwoord een attribuut _links.first.href met "<de bron URI zonder de opgegeven page parameter maar met de opgegeven pageSize parameter>"
    En bevat het attribuut _links.first.href "page=1"
    En bevat het antwoord een attribuut _links.previous.href met "<de bron URI zonder de opgegeven page parameter maar met de opgegeven pageSize parameter>"
    En bevat het attribuut _links.previous.href "page=2"
    En bevat het antwoord een attribuut _links.next.href met "<de bron URI zonder de opgegeven page parameter maar met de opgegeven pageSize parameter>"
    En bevat het attribuut _links.next.href "page=4"
    En bevat het antwoord een attribuut _links.last.href met "<de bron URI zonder de opgegeven page parameter maar met de opgegeven pageSize parameter>"
    En bevat het attribuut _links.last.href "page=5"
