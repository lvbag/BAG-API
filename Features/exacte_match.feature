# language: nl

Functionaliteit: leveren van objecten die exacte matchen met de opgegeven (combinatie van) huisnummer, huisleeter en/of huisnummertoevoeging

Wanneer een zoekopdracht met de opgegeven zoekcriteria meerdere resultaten oplevert en exacteMatch=false, dan worden alle zoekresultaten die overeenkomen met de zoekcriteria geretourneerd.

Wanneer een zoekopdracht met de opgegeven zoekcriteria meerdere resultaten oplevert en exacteMatch=true, dan wordt alleen het object dat exact overeenkomt met de zoekcriteria geretourneerd.
Er zijn situaties waarbij er ondanks het gebruik van exacteMatch=true meerdere resultaten mogelijk zijn, in dat geval wordt een lege verzameling geretourneerd.

Wanneer de combinatie van postcode, huisnummer en optioneel huisletter en/of huisnummertoevoeging meerdere keren voorkomt en exacteMatch=true, dan worden wel alle resultaten geretourneerd.

De default waarde van de exacteMatch parameter is false. Als deze niet wordt opgegeven zullen de resultaten niet exact overeenkomen met de opgegeven parameters en zal het resultaat meerdere objecten bevatten.

Abstract scenario: standaard gedrag
  Gegeven een straat met postcode 1234AA en 3 objecten met huisnummer en huisletter combinaties: 3, 3A en 3B.
  Als er wordt gezocht met postcode: 1234AA 
  En huisnummer: 3
  En geen huisletter
  En geen huisnummertoevoeging 
  En exacteMatch=false
  Dan bevat het resultaat alle 3 de objecten. 
	
  Gegeven een straat met postcode 1234AA en 3 objecten met huisnummer en huisletter combinaties: 3, 3A en 3B.
  Als er wordt gezocht met postcode: 1234AA 
  En huisnummer: 3
  En geen huisletter
  En geen huisnummertoevoeging 
  En exacteMatch=true
  Dan bevat het resultaat alleen het object met postcode 1234AA en huisnummer 3. 

Abstract scenario: geen exacte match ondanks exacteMatch=true	
  Gegeven een straat met postcode 1234AA en 5 objecten met huisnummer, huisletter en huisnummertoevoeging combinaties: 3, 3A en 3Abis, 3B en 3Bbis.
  Als er wordt gezocht met postcode 1234AA
  En huisnummer 3 
  En toevoeging bis
  En geen huisletter 
  En exacteMatch=false
  Dan bevat het resultaat de objecten met huisnummer, huisletter en huisnummertoevoeging combinaties: 3Abis en 3Bbis. 
	
  Gegeven een straat met postcode 1234AA en hhuisnummer, huisletter en huisnummertoevoeging combinaties: 3, 3A en 3Abis, 3B en 3Bbis.
  Als er wordt gezocht met postcode 1234AA
  En huisnummer 3 
  En toevoeging bis
  En geen huisletter 
  En exacteMatch=true
  Dan bevat het resultaat geen objecten

Abstract Scenario: combinatie van huisnummer, huisletter en/of huisnummertoevoeging komt meerdere keren voor
  Gegeven een straat met postcode 1234AA en twee objecten met huisnummer 3 (evt. in combinatie met dezelfde huisletter en huisnummertoevoeging voor beide adressen).
  Als postcode=1234AA
  En huisnummer=3
  En optioneel huisnummertoevoeging
  En optioneel huisletter 
  En exacteMatch=false
  Dan bevat het resultaat beide objecten.
  
Abstract Scenario: combinatie van huisnummer, huisletter en/of huisnummertoevoeging komt meerdere keren voor
  Gegeven een straat met postcode 1234AA en twee objecten met huisnummer 3 (evt. in combinatie met dezelfde huisletter en huisnummertoevoeging voor beide adressen).
  Als postcode=1234AA
  En huisnummer=3
  En optioneel huisnummertoevoeging
  En optioneel huisletter 
  En exacteMatch=true
  Dan bevat het resultaat beide objecten.
  



