In dit document zijn de URL's voor de **productieomgeving** weergegeven. De URL's die nog niet beschikbaar zijn, zijn ```gehighlight```.

De basis url voor de BAG API is; https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/

Deze API kan worden aangevuld met één van de zeven objecttypen:  

  
woonplaatsen  
openbareruimten  
nummeraanduidingen  
verblijfsobjecten  
standplaatsen  
ligplaatsen  
panden  
  
Voor elk van de zeven objecttypen zijn de volgende aanvullingen mogelijk;  
  
/identificatie  
/  
```/identificatie/lvc```  
```/identificatie/versie/timestampRegistratieLv```  
  
Bijvoorbeeld als met de API alle gegevens van de nummeraanduiding met BAG ID 0200200000075716 opgehaald wenst te worden dan is de juist url om dit te bevragen;  
  
https://api.bag.kadaster.nl/lvbag/individuelebevragingen/v2/nummeraanduidingen/0200200000075716  
  
Voor een volledige beschrijving van de request die gedaan kunnen worden met de BAG API verwijzen wij u naar de [yaml files](https://github.com/lvbag/BAG-API/tree/master/Technische%20specificatie/Yaml's/BAG%20API%20Individuele%20Bevragingen) 
