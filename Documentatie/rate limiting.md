# Rate limiting
Het gebruik van de BAG API Individuele Bevragingen is kosteloos.
Bij het gebruik van deze service gelden voorwaarden om overbelasting van de API of server te voorkomen en het service level voor alle clients beter kan worden gegarandeerd. 
De BAG API Individuele Bevragingen is bedoeld voor het opvragen van gegevens van één of enkele objecten, waarbij er direct gebruik gemaakt wordt van deze gegevens.
De API is expliciet niet bedoeld voor bulkbevragingen waarmee veel gegevens in één keer worden opgevraagd en in een database worden verwerkt.

Om die reden is op deze API rate limiting van toepassing.
Hierbij wordt gemonitord hoeveel requests een client per tijdsperiode indient en gecontroleerd of de client het maximaal aantal requesten per tijdsperiode niet overschrijdt.
Wanneer overschrijding wordt geconstateerd, wordt een `429 Too Many Requests` foutmelding gestuurd.

Rate limiting zal gefaseerd worden ingevoerd. 
Hieronder is de huidige inrichting omschreven.
 
### Rate limiting o.b.v. IP adres
Bij deze oplossing wordt voor het bepalen van het aantal requests dat een client doet, naar het IP adres van het client systeem gekeken.

Configuratie BAG API Individuele Bevragingen:
Aantal: maximaal 5 requests per seconde
Gemeten over: 60 seconden 
Aantal toegestane requests in de vastgestelde tijdsperiode: 5 x 60 = 300

Rate limiting response headers, comform NL API Strategie:

| Header | Beschrijving |
|--------|--------------|
| X-Rate-Limit-Limit | Aantal requesten per seconde (n) maal het aantal seconden van de tijdsperiode (60): 300 |
| X-Rate-Limit-Remaining | Aantal resterende client requests in de huidige tijdsperiode: 300 - x, waarbij x het aantal ingediende requesten is. |
| X-Rate-Limit-Reset | Aantal seconden in de tijdsperiode. In dit geval is dit altijd 60 seconden. |
