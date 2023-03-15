# language: nl

Functionaliteit: Rate limiting
Het doel van rate limiting is het beschermen van systemen tegen overbelasting binnen de kaders van de met afnemers gemaakte afspraken.

Wanneer er meer dan het afgesproken aantal requesten binnen een tijdsperiode worden ingediend bij een REST JSON API, dan treedt een foutmelding op met HTTP statuscode 429 en informatie over de overschreden limiet, zoals: het maximum aantal requesten per tijdsperiode, het aantal resterende requesten binnen de tijdsperiode en de duur van de tijdsperiode.
 
Bij iedere succesvolle request binnen een bepaalde tijdsperiode bevat de response een HTTP statuscode 200 en informatie over de geconfigureerde limieten.

Er kunnen meerdere limieten gelden over verschillende tijdsperioden, bv. rate limiting per seconde en dag quotum.

De duur van de tijdsperiode is in seconden.

Na het verstrijken van de reset periode wordt het aantal resterende requesten teruggezet naar het maximaal toegestane aantal requesten voor een tijdsperiode en kan een afnemer weer requesten indienen.

Het maximaal aantal toegestane requesten per tijdseenheid is per API configureerbaar.

Scenario: request binnen het toegestane aantal requesten per seconde (rate limiting)

  Gegeven een gebruiker mag maximaal 20 requesten per seconde indienen
  Wanneer een gebruiker een request indient
  En het aantal ingediende requesten binnen een seconde (inclusief dit request) is <= 20
  Dan bevat de response een HTTP status code 200 (mits request succesvol is)
  En bevat de response een Content-Type header met waarde application/json of application/hal+json
  En bevat de response een RateLimit-Limit header met het maximum aantal requesten per seconde=20
  En bevat de response een RateLimit-Remaining header met het aantal resterende requesten per seconde
  En bevat de response een RateLimit-Reset header met het aantal seconden tot wanneer het quotum reset (rate limit kan worden gemeten over een langere periode van bv. een minuut)

Scenario: request buiten het toegestane aantal requesten per seconde (rate limiting)

  Gegeven een gebruiker mag maximaal 20 requesten per seconde indienen
  Wanneer een gebruiker een request indient
  En het aantal ingediende requesten binnen een seconde (inclusief dit request) is > 20
  Dan bevat de response een HTTP status code 429
  En een title=Too Many Requests
  En een detail=You have exceeded your quota
  En bevat de response een Content-Type header met waarde application/problem+json
  En bevat de response een RateLimit-Limit header met het maximum aantal requesten per seconde=20
  En bevat de response een RateLimit-Remaining header met het aantal resterende requesten per seconde=0
  En bevat de response een RateLimit-Reset header met het aantal seconden tot wanneer het quotum reset (rate limit kan worden gemeten over een langere periode van bv. een minuut)

Scenario: request binnen het overeengekomen dag quotum

  Gegeven een gebruiker mag maximaal 50.000 requesten per dag indienen
  Wanneer een gebruiker een request indient
  En het aantal ingediende requesten per dag (inclusief dit request) is <= 50.000
  Dan bevat de response een HTTP status code 200
  En bevat de response een Content-Type header met waarde application/json of application/hal+json
  En bevat de response een Kadaster-RateLimit-DayLimit header met het maximum aantal requesten per dag=50.000
  En bevat de response een Kadaster-RateLimit-DayLimit-Remaining header met het aantal resterende requesten per dag
  En bevat de response een Kadaster-RateLimit-DayLimit-Reset header met het aantal seconden tot wanneer het quotum reset

Scenario: request buiten het overeengekomen dag quotum

  Gegeven een gebruiker mag maximaal 50.000 requesten per dag indienen
  Wanneer een gebruiker een request indient
  En het aantal ingediende requesten binnen een dag (inclusief dit request) is > 50.000
  Dan bevat de response een HTTP status code 429
  En een title=Too Many Requests
  En een detail=You have exceeded your quota
  En bevat de response een Content-Type header met waarde application/problem+json
  En bevat de response een Kadaster-RateLimit-DayLimit header met het maximum aantal requesten per dag=50.000
  En bevat de response een Kadaster-RateLimit-DayLimit-Remaining header met het aantal resterende requesten per dag=0
  En bevat de response een Kadaster-RateLimit-DayLimit-Reset header met het aantal seconden tot wanneer het quotum reset 
