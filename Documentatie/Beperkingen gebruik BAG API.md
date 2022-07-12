# Beperkingen gebruik BAG API Individuele Bevragingen
Het gebruik van de BAG API Individuele Bevragingen is kosteloos. Bij het gebruik van deze service gelden voorwaarden om overmatig of onwenselijk gebruik van de API te voorkomen. We willen de BAG API voor alle afnemers snel en bruikbaar houden. Om dit te kunnen waarborgen zijn limieten ingesteld.

Bij kosteloos gebruik geldt een maximum van 50.000 berichten per dag (quotalimit). Daarnaast is een beperking gesteld aan de hoeveelheid berichten per seconde en per minuut (ratelimit). Hierbij wordt gemonitord hoeveel requests een client per tijdsperiode indient en wordt gecontroleerd of de client het maximaal aantal requests per tijdsperiode niet overschrijdt. Wanneer overschrijding wordt geconstateerd, wordt een `429 Too Many Requests` foutmelding gestuurd.
 
### Rate limiting 
Er mogen maximaal 5 berichten per seconde worden gestuurd waarbij wordt gekeken naar het gemiddelde over een hele minuut. Concreet betekent dit dat er 300 berichten per minuut aangeboden mogen worden. Als dit wordt overschreden, dan kunt u 1 minuut lang geen bevragingen doen. 

Configuratie BAG API Individuele Bevragingen:
Aantal: maximaal 5 requests per seconde
Gemeten over: 1 seconde
Aantal toegestane requests in de vastgestelde tijdsperiode: 5 x 60 = 300

Rate limiting response headers, comform NL API Strategie:

| Header | Beschrijving |
|--------|--------------|
| X-Rate-Limit-Limit | Aantal requests per seconde (n) maal het aantal seconden van de tijdsperiode (60): 300 |
| X-Rate-Limit-Remaining | Aantal resterende client requests in de huidige tijdsperiode: 300 - x, waarbij x het aantal ingediende requests is. |
| X-Rate-Limit-Reset | Aantal seconden in de tijdsperiode. In dit geval is dit altijd 60 seconden. |

Komt u hier structureel boven? [Neem dan contact met ons op](https://formulieren.kadaster.nl/contact_bag).
