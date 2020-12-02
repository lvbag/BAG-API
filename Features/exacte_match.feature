# language: nl

Functionaliteit: leveren van objecten die exact matchen met de opgegeven (combinatie van) huisnummer, huisletter en/of huisnummertoevoeging

Deze functionaliteit biedt de mogelijkheid om een specifiek object te bevragen ook wanneer er meerdere objecten aan de gegeven parameters voldoen.
Parameter extacteMatch=true werkt als een filter op de objecten die voldoen aan de opgegeven parameters huisnummer, huisletter en huisnummertoevoeging.
De endpoints waar exacte match kan worden toegepast kennen geen fuzzy search.

Wanneer een zoekvraag met de opgegeven parameters meerdere resultaten oplevert en exacteMatch=false, dan worden alle zoekresultaten die overeenkomen met de zoekcriteria geretourneerd.

Wanneer een zoekvraag met de opgegeven parameters meerdere resultaten oplevert en exacteMatch=true, dan wordt alleen het object dat exact overeenkomt met de zoekcriteria geretourneerd.
Er zijn situaties waarbij er ondanks het gebruik van exacteMatch=true meerdere resultaten mogelijk zijn, in dat geval worden alle resultaten geretourneerd.

Wanneer de combinatie van postcode, huisnummer en optioneel huisletter en/of huisnummertoevoeging meerdere keren voorkomt en exacteMatch=true, dan worden wel alle resultaten geretourneerd.

De default waarde van de exacteMatch parameter is false.

Abstract scenario: standaard gedrag
  Gegeven een object met postcode 1234AA en 3 objecten met huisnummer en huisletter combinaties: 3, 3A en 3B.
  Als er wordt gezocht met postcode: 1234AA 
  En huisnummer: 3
  En geen huisletter
  En geen huisnummertoevoeging 
  En exacteMatch=false
  Dan bevat het resultaat alle 3 de objecten
	
  Gegeven een object met postcode 1234AA en 3 objecten met huisnummer en huisletter combinaties: 3, 3A en 3B.
  Als er wordt gezocht met postcode: 1234AA 
  En huisnummer: 3
  En geen huisletter
  En geen huisnummertoevoeging 
  En exacteMatch=true
  Dan bevat het resultaat alleen het object met postcode 1234AA en huisnummer 3

Abstract scenario: geen exacte match ondanks exacteMatch=true	
  Gegeven een object met postcode 1234AA en 5 objecten met huisnummer, huisletter en huisnummertoevoeging combinaties: 3, 3A en 3Abis, 3B en 3Bbis.
  Als er wordt gezocht met postcode 1234AA
  En huisnummer 3 
  En toevoeging bis
  En geen huisletter 
  En exacteMatch=false
  Dan bevat het resultaat de objecten met huisnummer, huisletter en huisnummertoevoeging combinaties: 3Abis en 3Bbis. 
	
  Gegeven een object met postcode 1234AA en huisnummer, huisletter en huisnummertoevoeging combinaties: 3, 3A en 3Abis, 3B en 3Bbis.
  Als er wordt gezocht met postcode 1234AA
  En huisnummer 3 
  En toevoeging bis
  En geen huisletter 
  En exacteMatch=true
  Dan bevat het resultaat geen objecten

Abstract Scenario: combinatie van huisnummer, huisletter en/of huisnummertoevoeging komt meerdere keren voor
  Gegeven een object met postcode 1234AA en twee objecten met huisnummer 3
  Als postcode=1234AA
  En huisnummer=3
  En optioneel huisnummertoevoeging
  En optioneel huisletter 
  En exacteMatch=false
  Dan bevat het resultaat beide objecten
  
Abstract Scenario: combinatie van huisnummer, huisletter en/of huisnummertoevoeging komt meerdere keren voor
  Gegeven een object met postcode 1234AA en twee objecten met huisnummer 3
  Als postcode=1234AA
  En huisnummer=3
  En optioneel huisnummertoevoeging
  En optioneel huisletter 
  En exacteMatch=true
  Dan bevat het resultaat beide objecten
  
Abstract Scenario: endpoints waarbij exacteMatch kan worden toegepast kennen geen fuzzy search
  Gegeven een object met postcode 1234AA en een object met huisnummer 3 en een object met huisnummer 13
  Als postcode=1234AA
  En huisnummer=3
  En exacteMatch=false
  Dan bevat het resultaat alleen het object met postcode 1234AA en huisnummer 3

Abstract Scenario: endpoints waarbij exacteMatch kan worden toegepast kennen geen fuzzy search
  Gegeven een object met postcode 1234AA en een object met huisnummer 3 en een huisnummer 2 en huisletter B en geen huisnummertoevoeging
  Als postcode=1234AA
  En huisnummer=3
  En huisnummertoevoeging = B
  En exacteMatch=false
  Dan bevat het resultaat geen objecten
