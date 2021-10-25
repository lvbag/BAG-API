In dit document zijn de URL's voor de **productieomgeving** weergegeven. 

De basis url voor de BAG API is; https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/

Deze API kan worden aangevuld met één van deze endpoints:  

  
adressen  
adressenuitgebreid  
woonplaatsen  
openbareruimten  
nummeraanduidingen  
verblijfsobjecten  
standplaatsen  
ligplaatsen  
panden  
bronhouders  
adresseerbareobjecten
  
Afhankelijk van het endpoint kan dit worden aangevuld met: 
  
/identificatie  
?  
/identificatie/lvc  
/identificatie/versie/timestampRegistratieLv 
  
Bijvoorbeeld als met de API alle gegevens van de nummeraanduiding met BAG ID 0200200000075716 opgehaald wenst te worden dan is de juist url om dit te bevragen;  
  
https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/0200200000075716  
  
Voor een volledige beschrijving van de requests die gedaan kunnen worden met de BAG API verwijzen wij u naar de [yaml files in Swagger](https://github.com/lvbag/BAG-API/tree/master/Technische%20specificatie). 


Om te bevragen op basis van geometrie kan een post op het endpoint worden gedaan.
