# Adressen zoeken in vrije tekstvorm
Functionaliteit: adressen/zoek
Endpoint: .../adressen/zoek?zoek=<zoekterm>

Deze functionaliteit biedt de mogelijkheid om op basis van een zoekterm een of meerdere huidige adressen te vinden.
Huidig betekent dat het object actueel is en geen eindstatus heeft. 
 Voor meer informatie over huidig kunt u de Praktijkhandleiding BAG raadplegen. (https://imbag.github.io/praktijkhandleiding/artikelen/wat-is-het-verschil-tussen-actieve-voorkomens-actuele-voorkomens-en-huidige-voorkomens).

Er kan gezocht worden met (een deel van) een postcode, woonplaats, straatnaam, huisnummer, huisletter, huisnummertoevoeging
Het resultaat is een collectie van zoekresultaten waarin delen van de adressen overeenkomen met de zoekterm
Het zoekresultaat bevat alle gegevens van het adres.
Zoektermen kunnen gecombineerd worden door ze te scheiden met bijvoorbeeld een komma of een spatie (= %20) 

 Voorbeeld
* ../adressen/zoek?zoek=snoekstraat,1065TA
* ../adressen/zoek?zoek=amsterdam,1065
* ../adressen/zoek?zoek=snoekstraat 1

 Lege collectie
Wanneer er geen adressen overeenkomen met de zoektermen is de collectie met zoekresultaten leeg.
Er moet minimaal 1 teken worden opgegeven om een resultaat te geven. 
Hoe meer tekens, hoe specifieker het resultaat.
Wanneer er geen tekens worden opgegeven, volgt er een foutmelding.

 Links
De links.feature is van toepassing.
Ieder zoekresultaat heeft een link naar het specifieke adres op het adressenendpoint
Omdat een zoekactie veel resultaten terug kan geven is het mogelijk dat de links als templated links worden gegeven conform de templatedlinks.feature.

 Paginering
Omdat een zoekactie veel resultaten kan bevatten is de paginering.feature van toepassing
