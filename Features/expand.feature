# language: nl

# Nederlandse API Strategie:
# API-10 Resources ondersteunen “lazy” en “eager” laden van relaties
# API-11 Gelinkte resources worden expliciet en selectief mee-geladen

Functionaliteit: Automatisch laden van sub-resources
  "eager loading" wordt mogelijk gemaakt voor de volgende sub-resources van een woonplaats:
  - geometrie
  - bronhouder

  "eager loading" wordt mogelijk gemaakt voor de volgende sub-resources van een openbare ruimte:
  - woonplaats

  "eager loading" wordt mogelijk gemaakt voor de volgende sub-resource van een nummeraanduiding:
  - openbare ruimte
  - woonplaats
  
  "eager loading" wordt mogelijk gemaakt voor de volgende sub-resource van een adresseerbaar object:
  - nummeraanduiding (hoofdadres)
  - nummeraanduiding (nevenadressen)
  
  "eager loading" wordt mogelijk gemaakt voor de volgende sub-resource van een verblijfsobject:
  - pand

  Deze gelinkte resources kunnen direct bij de gezochte of geraadpleegde resource worden meegeladen. Hiervoor gebruikt men de parameter expand.
  De gevraagde resources worden dan (conform HAL) opgenomen in veld _embedded binnen de resource.

  Collecties worden niet gezien als resource. Dat houdt in dat dus niet een collectie wordt geëxpand maar de resources in een collectie.

  Bij het zoeken tegen de afhankelijkheidsrichting van relaties in, wordt expand niet ondersteund.
  
  Gelinkte resources die in _embedded worden opgenomen bevatten altijd de (self) link naar de betreffende resource.

  In de API wordt expand=true ondersteund. Gewenste gelinkte resources kunnen expliciet worden opgegeven.
  Dit wordt gedaan door de gewenste resources als een komma's gescheiden lijst te specificeren, bijvoorbeeld: expand=ligtInWoonplaats,ligtAanOpenbareRuimte.

  De dot-notatie wordt niet ondersteund. Het is dus niet mogelijk om specifieke velden van resources te selecteren, bijvoorbeeld expand=ligtInWoonplaats.woonplaats.naam.
  Omdat geen specifieke velden van de resource worden aangegeven, wordt de gehele resource opgenomen.

  Het mee laden van gelinkte resources wordt tot één niveau diep ondersteund. Dit betekent dat er geen gelinkte resources van gelinkte resources kunnen worden meegeladen. 

  Relaties (links) van de embedded resource worden altijd geleverd binnen het HAL-element _links.

  Wanneer in de expand-parameter een resource(naam) wordt opgegeven die niet bestaat, of waarvoor automatisch laden niet wordt ondersteund in de api, wordt een foutmelding teruggegeven.
  Wanneer de expand-parameter wordt opgenomen zonder waarde, wordt een foutmelding gegeven.

  Achtergrond:
    Gegeven een te raadplegen verblijfsobject met een gerelateerde nummeraanduiding voor hoofdadres, meerdere gerelateerde nummeraanduidingen voor nevenadressen en meerdere gerelateerde panden waar het verblijfsobject deel van uitmaakt

  Scenario: Wanneer de expand-parameter niet is meegegeven, worden gerelateerden niet meegeladen
    Als een verblijfsobject wordt geraadpleegd zonder expand-parameter
    Dan is in het antwoord attribuut _embedded niet aanwezig
    En worden alle attributen van het verblijfsobject teruggegeven, voor zover ze een waarde hebben
    En wordt attribuut _links.heeftAlsHoofdadres teruggegeven
    En wordt attribuut _links.heeftAlsNevenAdres teruggegeven
    En wordt attribuut _links.maaktDeelUitVan teruggegeven

  Scenario: Gebruik van expand=true is toegestaan
    Als een verblijfsobject wordt geraadpleegd met expand=true en de resource heeft relaties met sub resources
    Dan worden alle attributen van het verblijfsobject teruggegeven, voor zover ze een waarde hebben
    En wordt attribuut _links.heeftAlsHoofdadres teruggegeven
    En wordt attribuut _links.heeftAlsNevenAdres teruggegeven
    En wordt attribuut _links.maaktDeelUitVan teruggegeven
    En wordt attribuut _embedded.heeftAlsHoofdadres teruggegeven
    En wordt attribuut _embedded.heeftAlsNevenAdres teruggegeven
    En wordt attribuut _embedded.maaktDeelUitVan teruggegeven

    Als een BAG object wordt geraadpleegd met expand=true en de resource heeft geen relaties met sub resources (bv. een pand)
    Dan levert dit de resource
    En wordt _embedded niet teruggegeven
    En wordt _links.self teruggegeven

  Scenario: Expand met incorrecte resource
    Als een BAG object wordt geraadpleegd met expand=resourcebestaatniet
    Dan levert dit een foutmelding
    En heeft de foutmelding betrekking op parameter expand

  Scenario: Expand met lege waarde
    Als een BAG object wordt geraadpleegd met expand=
    Dan levert dit een foutmelding
    En heeft de foutmelding betrekking op parameter expand

  Scenario: Er kunnen meerdere sub-resources worden meegeladen door deze als een komma's gescheiden lijst te specificeren
    Als een verblijfsobject wordt geraadpleegd met expand=heeftAlsHoofdadres,maaktDeelUitVan
    Dan worden alle attributen van het verblijfsobject teruggegeven, voor zover ze een waarde hebben
    En wordt attribuut _links.heeftAlsHoofdadres teruggegeven
    En wordt attribuut _links.heeftAlsNevenAdres teruggegeven
    En wordt attribuut _links.maaktDeelUitVan teruggegeven
    En wordt attribuut _embedded.heeftAlsHoofdadres teruggegeven
    En wordt attribuut _embedded.maaktDeelUitVan teruggegeven
