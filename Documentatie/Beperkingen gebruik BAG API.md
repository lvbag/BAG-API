# Beperkingen gebruik BAG API Individuele Bevragingen (versie 2022)
Het gebruik van de BAG API Individuele Bevragingen is kosteloos. Bij het gebruik van deze service gelden voorwaarden om overmatig of onwenselijk gebruik van de API te voorkomen. We willen de BAG API voor alle afnemers snel en bruikbaar houden. Om dit te kunnen waarborgen zijn limieten ingesteld.

Bij kosteloos gebruik geldt een maximum van 50.000 berichten per dag (quota limit). Daarnaast is een beperking gesteld aan de hoeveelheid berichten per seconde en per minuut (rate limit). Hierbij wordt gemonitord hoeveel requests een gebruiker per tijdsperiode indient en wordt gecontroleerd of de gebruiker het maximaal aantal requests per tijdsperiode niet overschrijdt. Wanneer overschrijding wordt geconstateerd, wordt een `429 Too Many Requests` foutmelding gestuurd.
  
## Wijzigingen t.o.v. rate limiting 2021

Van enkele afnemers hebben wij vernomen dat de in 2021 voorgestelde rate limiting niet werkbaar was. Wij hebben daarom besloten rate limiting op een andere wijze toe te passen. Bij het controleren van de limiet kijken wij nu niet meer naar het IP-adres, maar naar de API key. 
Daarnaast werd voorheen gekeken naar het aantal berichten dat per minuut binnen kwam. Vanaf 1 maart 2023 kijken wij naar het aantal berichten dat per seconde wordt aangeboden. Hierdoor wordt u sneller gewezen op het feit dat u de limiet overschrijdt.  
  
  Nieuw is de invoering van een quotum. In het gebruik van de BAG API zien wij regelmatig pieken in het aantal bevragingen die de beschikbaarheid van de BAG API in het gedrang brengen. Om de beschikbaarheid en de snelheid van de API te kunnen garanderen, wordt naast rate limiting ook een quotum in de vorm van een maximaal aantal bevragingen per dag ingesteld. 
  
## Stappenplan invoering quotum en rate limit
  
###   Stap 1)	1 september 2022: quotum van 200.000 berichten per dag  
Vanaf 1 september 2022 kunt u maximaal 200.000 bevragingen per dag doen met de BAG API Individuele Bevragingen. Op het moment dat u deze limiet overschrijdt, zult u de melding `429 Too Many Requests` ontvangen. U kunt in dit geval de volgende dag (na 00:00 uur) weer gebruik maken van de BAG API. 
###   Stap 2)	1 december 2022: quotum van 50.000 berichten per dag  
Vanaf 1 december 2022 wordt het quotum van maximaal 200.000 berichten per dag verlaagd naar 50.000 berichten per dag. Ook hier geldt dat op het moment dat u deze limiet overschrijdt, u de melding `429 Too Many Requests` zult ontvangen. U kunt in dit geval de volgende dag (na 00:00 uur) weer gebruik maken van de BAG API.
###   Stap 3)	1 maart 2023: rate limiting 50 berichten per seconde
Vanaf 1 maart 2023 wordt ter aanvulling op het quotum ook een rate limiet ingesteld. Hierbij wordt gecontroleerd hoeveel berichten per seconde per API key worden ingestuurd. Er mogen maximaal 50 berichten per seconde worden gestuurd. Op het moment dat u deze limiet overschrijdt, zult u de melding `429 Too Many Requests` ontvangen. U mag dan na een seconde weer bevragingen doen, mits u binnen het quotum van 50.000 berichten bent gebleven.  

## Headers
### Quotum  

Quotum response headers
  
| Header | Beschrijving |
|:--- |:--- |
| Kadaster-RateLimit-DayLimit | Aantal requests per dag |
| Kadaster-RateLimit-DayLimit-Remaining | Aantal resterende client requests in de huidige tijdsperiode | 
  
### Rate limiting 

Rate limiting response headers, comform NL API Strategie:

| Header | Beschrijving |
|:--- |:--- |
| X-Rate-Limit-Limit | Aantal requests per seconde (n) |
| X-Rate-Limit-Remaining | Aantal resterende client requests in de huidige tijdsperiode: waarbij x het aantal ingediende requests is. |
| X-Rate-Limit-Reset | Aantal seconden in de tijdsperiode. In dit geval is dit altijd 1 seconde. |

Komt u hier structureel boven? [Neem dan contact met ons op](https://formulieren.kadaster.nl/contact_bag).
