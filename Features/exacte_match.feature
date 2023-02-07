# language: nl
@skip-verify
Functionaliteit: leveren van objecten die exact overeenkomen met een opgegeven huisnummer, eventueel in combinatie met een huisletter en/of huisnummertoevoeging

Deze functionaliteit biedt de mogelijkheid om een specifiek object te bevragen ook wanneer er meerdere objecten aan de gegeven parameters voldoen.
Parameter exacteMatch=true werkt als een filter op de objecten die voldoen aan de opgegeven parameters huisnummer, huisletter en huisnummertoevoeging.

Wanneer een zoekvraag met de opgegeven parameters meerdere resultaten oplevert en exacteMatch=false, dan worden alle zoekresultaten die overeenkomen met de zoekcriteria geretourneerd.

Wanneer een zoekvraag met de opgegeven parameters meerdere resultaten oplevert en exacteMatch=true, dan wordt alleen het object dat exact overeenkomt met de zoekcriteria geretourneerd.
Er zijn situaties waarbij er ondanks het gebruik van exacteMatch=true meerdere resultaten mogelijk zijn, in dat geval worden alle resultaten geretourneerd.

De exacteMatch parameter is optioneel.
De default waarde van de exacteMatch parameter is false. 
Dit betekent dat wanneer de exacteMatch parameter niet wordt opgegeven, dat hetzelfde resultaat oplevert als exacteMatch=false wordt opgegeven.

De exacte match feature kan niet worden gebruikt i.c.m. fuzzy search feature. 

Achtergrond:

  Gegeven de volgende verzameling van objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging | nummeraanduidingIdentificatie |
  | 2391PH   | 1          |            |                      | 1672200000008468              |
  | 2391PH   | 1          | A          |                      | 1672200000009028              |
  | 2391PH   | 1          | A          |  1                   | 0484200002040487              |
  | 2391PH   | 1          | A          |  2                   | 0484200002040488              |
  | 2391PH   | 1          | A          |  3                   | 0484200002040489              |
  | 2391PH   | 1          | A          |  4                   | 0484200002040490              |
  | 2391PH   | 1          | A          |  5                   | 0484200002040491              |
  | 2391PH   | 1          | A          |  6                   | 0484200002040492              |
  | 2391PH   | 1          | A          |  7                   | 0484200002040493              |
  | 2391PH   | 1          | A          |  8                   | 0484200002040494              |
  | 2391PH   | 1          | B          |                      | 1672200000009029              |
  | 2391PH   | 1          | C          |                      | 1672200000009030              |
  | 2391PH   | 1          | D          |                      | 1672200000009031              |
  | 2391PH   | 1          | E          |                      | 1672200000009032              |
  | 2391PH   | 1          | F          |                      | 1672200000009034              |
  | 2594AN   | 265        |            |                      | 0518200000390367              |
  | 2594AN   | 265        | A          |                      | 0518200000452568              |
  | 2594AN   | 265        | A          | 1                    | 0518200000452570              |
  | 2594AN   | 265        | A          | 2                    | 0518200000620759              |
  | 2594AN   | 265        | A          | 3                    | 0518200000625989              |
  | 2594AN   | 265        | B          |                      | 0518200000454095              |
  | 2594AN   | 265        | B          | 1                    | 0518200001647713              |
  | 2594AN   | 265        | B          | 2                    | 0518200001647715              |
  | 2594AN   | 265        | B          | 3                    | 0518200001647717              |
  | 2594AN   | 265        | B          | 3                    | 0518200001775151              |
  | 2594AN   | 265        | C          |                      | 0518200001664062              |
  | 2594AN   | 265        | C          | 1                    | 0518200001664064              |
  | 2594AN   | 265        | C          | 2                    | 0518200001664066              |
  | 2594AN   | 265        | C          | 3                    | 0518200001664068              |
  | 2594AN   | 265        | D          |                      | 0518200000411785              |
  | 2594AN   | 265        | E          |                      | 0518200001639143              |
  | 2594AN   | 265        | F          |                      | 0518200001639145              |
  | 7411CC   | 36         |            |                      | 0150200000052413              |
  | 7411CC   | 36         |            |                      | 0150200000039067              |
  | 7437SZ   | 2          | A          |                      | 0150200000000313              |
  | 7437SZ   | 2          | A          |                      | 0150200000052567              |
  | 1015DT   | 237        | A          | V                    | 0363200000459979              |
  | 1015DT   | 237        | C          | A                    | 0363200000459980              |
  | 3581KL   | 49         |            | A                    | 0344200000172058              |

Scenario: Zoeken met combinatie postcode en huisnummer

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2391PH   | 1          |            |                      | false       |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2391PH   | 1          |            |                      |
  | 2391PH   | 1          | A          |                      |
  | 2391PH   | 1          | A          |  1                   |
  | 2391PH   | 1          | A          |  2                   |
  | 2391PH   | 1          | A          |  3                   |
  | 2391PH   | 1          | A          |  4                   |
  | 2391PH   | 1          | A          |  5                   |
  | 2391PH   | 1          | A          |  6                   |
  | 2391PH   | 1          | A          |  7                   |
  | 2391PH   | 1          | A          |  8                   |
  | 2391PH   | 1          | B          |                      |
  | 2391PH   | 1          | C          |                      |
  | 2391PH   | 1          | D          |                      |
  | 2391PH   | 1          | E          |                      |
  | 2391PH   | 1          | F          |                      |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2391PH   | 1          |            |                      | true        |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2391PH   | 1          |            |                      |

Scenario: Zoeken met combinatie postcode, huisnummer en huisletter

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 1015DT   | 237        | A          |                      | false       |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 1015DT   | 237        | A          | V                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 1015DT   | 237        | A          |                      | true        |
  Dan bevat het resultaat geen objecten

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2594AN   | 265        | A          |                      | false       |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2594AN   | 265        | A          |                      |
  | 2594AN   | 265        | A          | 1                    |
  | 2594AN   | 265        | A          | 2                    |
  | 2594AN   | 265        | A          | 3                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2594AN   | 265        | A          |                      | true        |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2594AN   | 265        | A          |                      |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 3581KL   | 49         | A          |                      | false       |
  Dan bevat het resultaat geen objecten

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 3581KL   | 49         | A          |                      | true        |
  Dan bevat het resultaat geen objecten

Scenario: zoeken met combinatie postcode, huisnummer en huisnummertoevoeging

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2594AN   | 265        |            | 2                    | false       |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2594AN   | 265        | A          | 2                    |
  | 2594AN   | 265        | B          | 2                    |
  | 2594AN   | 265        | C          | 2                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2594AN   | 265        |            | 2                    | true        |
  Dan bevat het resultaat geen objecten

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 3581KL   | 49         |            | A                    | false       |
  Dan bevat het resultaat de volgende objecten
  | 3581KL   | 49         |            | A                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 3581KL   | 49         |            | A                    | true        |
  Dan bevat het resultaat de volgende objecten
  | 3581KL   | 49         |            | A                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 1015DT   | 237        |            | A                    | false       |
  Dan bevat het resultaat de volgende objecten
  | 1015DT   | 237        | C          | A                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 1015DT   | 237        |            | A                    | true        |
  Dan bevat het resultaat geen objecten

Scenario: zoeken met combinatie van postcode, huisnummer, huisletter en huisnummertoevoeging

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2391PH   | 1          | A          | 7                    | false       |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2391PH   | 1          | A          | 7                    |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 2391PH   | 1          | A          | 7                    | true        |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging |
  | 2391PH   | 1          | A          | 7                    |

Scenario: zoeken met combinatie postcode en huisnummer komt meerdere keren voor

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 7411CC   | 36         |            |                      | false       |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging | identificatie    |
  | 7411CC   | 36         |            |                      | 0150200000052413 |
  | 7411CC   | 36         |            |                      | 0150200000039067 |

  Als er wordt gezocht met
  | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | 7411CC   | 36         |            |                      | true        |
  Dan bevat het resultaat de volgende objecten
  | postcode | huisnummer | huisletter | huisnummertoevoeging | identificatie    |
  | 7411CC   | 36         |            |                      | 0150200000052413 |
  | 7411CC   | 36         |            |                      | 0150200000039067 |

Scenario: zoeken met combinatie van postcode, huisnummer en exacteMatch i.c.m. fuzzy search wordt niet ondersteund

  Als er wordt gezocht met
  | q     | postcode | huisnummer | huisletter | huisnummertoevoeging | exacteMatch |
  | Brink | 2391PH   | 1          |            |                      | false       |
  Dan bevat de response ten minste de volgende velden
  | naam   | waarde                                                     |
  | title  | De combinatie van opgegeven parameters is niet toegestaan. |
  | status | 400                                                        |
  | code   | unsupportedCombi                                           |
  En bevat de response geen veld "invalidParams"
