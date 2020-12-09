# language: nl

Functionaliteit: leveren van objecten die exact overeenkomen met een opgegeven huisnummer, eventueel in combinatie met een huisletter en/of huisnummertoevoeging

Deze functionaliteit biedt de mogelijkheid om een specifiek object te bevragen ook wanneer er meerdere objecten aan de gegeven parameters voldoen.
Parameter exacteMatch=true werkt als een filter op de objecten die voldoen aan de opgegeven parameters huisnummer, huisletter en huisnummertoevoeging.
De endpoints waar exacte match kan worden toegepast kennen geen fuzzy search.

Wanneer een zoekvraag met de opgegeven parameters meerdere resultaten oplevert en exacteMatch=false, dan worden alle zoekresultaten die overeenkomen met de zoekcriteria geretourneerd.

Wanneer een zoekvraag met de opgegeven parameters meerdere resultaten oplevert en exacteMatch=true, dan wordt alleen het object dat exact overeenkomt met de zoekcriteria geretourneerd.
Er zijn situaties waarbij er ondanks het gebruik van exacteMatch=true meerdere resultaten mogelijk zijn, in dat geval worden alle resultaten geretourneerd.

De default waarde van de exacteMatch parameter is false.

Scenario: standaard gedrag
  Gegeven een verzameling van 3 objecten met postcode=1234AA 
  En één object (1) met huisnummer=3
  En geen huisletter
  En geen huisnummertoevoeging
  En één object (2) met huisnummer=3
  En huisletter=A
  En geen huisnummertoevoeging
  En één object (3) met huisnummer=3
  En huisletter=B
  En geen huisnummertoevoeging
  Als er wordt gezocht met postcode=1234AA 
  En huisnummer=3
  En geen huisletter
  En geen huisnummertoevoeging 
  En exacteMatch=false
  Dan bevat het resultaat alle 3 de objecten
	
  Gegeven een verzameling van 3 objecten met postcode=1234AA 
  En één object (1) met huisnummer=3
  En geen huisletter
  En geen huisnummertoevoeging
  En één object (2) met huisnummer=3
  En huisletter=A
  En geen huisnummertoevoeging
  En één object (3) met huisnummer=3
  En huisletter=B
  En geen huisnummertoevoeging
  Als er wordt gezocht met postcode=1234AA 
  En huisnummer=3
  En geen huisletter
  En geen huisnummertoevoeging 
  En exacteMatch=true
  Dan bevat het resultaat alleen het object (1) met postcode=1234AA 
  En huisnummer=3

Scenario: combinatie van huisnummer en huisnummertoevoeging
  Gegeven een verzameling van 5 objecten met postcode=1234AA 
  En één object (1) met huisnummer=3
  En geen huisletter
  En geen huisnummertoevoeging
  En één object (2) met huisnummer=3
  En huisletter=A
  En geen huisnummertoevoeging
  En één object (3) met huisnummer=3
  En huisletter=A
  En huisnummertoevoeging=bis
  En één object (4) met huisnummer=3
  En huisletter=B
  En geen huisnummertoevoeging
  En één object (5) met huisnummer=3
  En huisletter=B
  En huisnummertoevoeging=bis
  Als er wordt gezocht met postcode=1234AA
  En huisnummer=3 
  En huisnummertoevoeging=bis
  En geen huisletter 
  En exacteMatch=false
  Dan bevat het resultaat object (3) met huisnummer=3
  Em huisletter=A 
  En huisnummertoevoeging=bis 
  En object (5) met huisnummer=3
  En huisletter=B
  En huisnummertoevoeging=bis
	
  Gegeven een verzameling van 5 objecten met postcode=1234AA 
  En één object (1) met huisnummer=3
  En geen huisletter
  En geen huisnummertoevoeging
  En één object (2) met huisnummer=3
  En huisletter=A
  En geen huisnummertoevoeging
  En één object (3) met huisnummer=3
  En huisletter=A
  En huisnummertoevoeging=bis
  En één object (4) met huisnummer=3
  En huisletter=B
  En geen huisnummertoevoeging
  En één object (5) met huisnummer=3
  En huisletter=B
  En huisnummertoevoeging=bis
  Als er wordt gezocht met postcode=1234AA
  En huisnummer=3 
  En huisnummertoevoeging=bis
  En geen huisletter 
  En exacteMatch=true
  Dan bevat het resultaat geen objecten

Scenario: combinatie van huisnummer, huisletter en/of huisnummertoevoeging komt meerdere keren voor en exacteMatch wordt niet toegepast
  Gegeven een verzameling van 2 objecten met postcode=1234AA
  En huisnummer=3 
  En geen huisletter 
  En geen huisnummertoevoeging
  Als er wordt gezocht met postcode=1234AA
  En huisnummer=3
  En geen huisnummertoevoeging
  En geen huisletter 
  En exacteMatch=false
  Dan bevat het resultaat beide objecten
  
Scenario: combinatie van huisnummer, huisletter en/of huisnummertoevoeging komt meerdere keren voor en exacteMatch wordt toegepast
  Gegeven een verzameling van 2 objecten met postcode=1234AA
  En huisnummer=3 
  En geen huisletter 
  En geen huisnummertoevoeging
  Als er wordt gezocht met postcode=1234AA
  En huisnummer=3
  En geen huisnummertoevoeging
  En geen huisletter 
  En exacteMatch=true
  Dan bevat het resultaat beide objecten
  
Scenario: endpoints waarbij exacteMatch kan worden toegepast kennen geen fuzzy search
  Gegeven een verzameling van 2 objecten met postcode=1234AA
  En één object (1) met huisnummer=3 
  En één object (2) met huisnummer=13
  Als er wordt gezocht met postcode=1234AA
  En huisnummer=3
  En exacteMatch=false
  Dan bevat het resultaat alleen object (1) met postcode=1234AA 
  En huisnummer=3

Scenario: endpoints waarbij exacteMatch kan worden toegepast kennen geen fuzzy search
  Gegeven een object met postcode= 1234AA 
  En huisnummer=3 
  En huisletter=B
  En geen huisnummertoevoeging
  Als er wordt gezocht met postcode=1234AA
  En huisnummer=3
  En huisnummertoevoeging=B
  En exacteMatch=false
  Dan bevat het resultaat geen objecten
