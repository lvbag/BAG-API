# language: nl

Functionaliteit: Als afnemer wil ik kunnen bladeren door een groot aantal resultaten
  Zodat het aantal resultaten per aanroep beperkt is en de responsetijd zo kort mogelijk

  Bladeren door de resultaten kan via de links first, previous, next en last.
  Deze properties bevatten een uri die verwijst naar de eerste pagina, vorige pagina, volgende pagina en laatste pagina met resultaten.
  Bladeren kan door gebruik van de parameter page.
  De links first, previous, next en last worden alleen opgenomen in de response wanneer dit van toepassing is.

  De provider kan ervoor kiezen de link last niet te leveren, om te voorkomen dat elke keer een volledige table scan nodig is om een enkele pagina te leveren.

  Wanneer geen page parameter wordt meegegeven in het request, wordt de eerste pagina van het resultaat getoond.

  Wanneer de opgegeven pagina met de page parameter hoger is dan het aantal pagina's resultaat, wordt een foutmelding getoond.
  
  Wanneer bij een endpoint de paginering.feature niet is geimplementeerd en de parameter page of pageSize wordt meegegeven, wordt de parameter genegeerd

PageSize:
    De api toont standaard 20 resultaten per pagina
    De api toont minimaal 10 resultaten per pagina
    De api toont maximaal 100 resultaten per pagina

  Scenario: de zoekvraag levert meerdere pagina's en er wordt geen page parameter gebruikt
    Als de request wordt gedaan zonder page parameter 
    Dan zitten er 20 resultaten in het antwoord
    En zijn dit <items> 1 tot en met 20 van de collectie
    En is attribuut _links.self.href gelijk aan de request
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En is attribuut _links.next.href gelijk aan "?page=2"
    En is attribuut _links.last.href gelijk aan "?page=4"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt de eerste pagina gevraagd
    Als de request wordt gedaan naar naar een endpoint waar paginering van toepassing is met de parameter ?page=1
    En er zijn meer dan 20 items die voldoen aan de zoekvraag
    Dan zitten er 20 items in het antwoord
    En zijn dit items 1 tot en met 20 van de collectie
    En is attribuut _links.self.href gelijk aan "?page=1"
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En is attribuut _links.next.href gelijk aan "?page=2"
    En is attribuut _links.last.href gelijk aan "?page=4"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt een volgende pagina gevraagd
    Als de request wordt gedaan naar naar een endpoint waar paginering is geimplementeerd met de parameter "?page=3
    Dan zitten er 20 resultaten in het antwoord
    En zijn dit items 41 tot en met 60 met de collectie
    En is attribuut _links.self.href gelijk aan "?page=3"
    En is attribuut _links.first.href gelijk aan "?page=1"
    En is attribuut _links.previous.href gelijk aan "?page=2"
    En is attribuut _links.next.href gelijk aan "?page=4"
    En is attribuut _links.last.href gelijk aan "?page=4"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt de laatste pagina gevraagd
    Als de request wordt gedaan naar een endpoint waar paginering van toepassing is met "?page=4"
    En het totaal aantal items in de collectie was 72
    Dan zitten er 12 resultaten in het antwoord
    En zijn dit items 61 tot en met 72 van de collectie
    En is attribuut _links.self.href gelijk aan "?page=4"
    En is attribuut _links.first.href gelijk aan "?page=1"
    En is attribuut _links.previous.href gelijk aan "?page=3"
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt een pagina bevraagd die niet bestaat
    Als de request wordt gedaan naar een endpoint waar paginering van toepassing is met parameter "?page=15"
    Dan heeft het antwoord statuscode 400
    En bevat het antwoord status met de waarde 400
    En bevat het antwoord title met de waarde "Een of meerdere parameters zijn niet correct."
    En bevat het antwoord instance met de waarde "?page=15"
    En bevat het antwoord invalidParams[0].name met de waarde "page"
    En bevat het antwoord invalidParams[0].reason met de waarde "De opgegeven pagina bestaat niet."
    En bevat het antwoord invalidParams[0].code met de waarde "page"

  Scenario: de zoekvraag levert één pagina
    Als de request wordt gedaan naar een endpoint waar paginering van toepassing is
    En er zitten er voldoen minder dan 20 items in het antwoord
    Dan is attribuut _links.self.href gelijk aan de request
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert geen resultaten
    Als de request wordt gedaan naar een endpoint waarbij paginering van toepassing is
    En er zijn geen resulaten gevonden
    Dan is attribuut _links.self.href gelijk aan de request
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert meerdere pagina's en de pageSize parameter wordt gebruikt
    Als de request wordt gedaan met parameter "?page=3&pageSize=15"
    Dan zitten er 15 resultaten in het antwoord
    En is attribuut _links.self.href gelijk aan "?page=3&pageSize=15"
    En is attribuut _links.first.href gelijk aan "?page=1&pageSize=15"
    En is attribuut _links.previous.href gelijk aan "?page=2&pageSize=15"
    En is attribuut _links.next gelijk aan "?page=4&pageSize=15"
    En is attribuut _links.last gelijk aan "?page=5&pageSize=15"
    
   
