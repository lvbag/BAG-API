# language: nl

Functionaliteit: Zoeken met een bounding box
    Als gebruiker wil ik een pand of adresseerbaar object kunnen zoeken binnen een gebied
    Zodat ik de adresseerbare objecten of panden kan vinden binnen een rechthoek die ik teken op een kaart

    Zoeken in een rechthoekig gebied kan met de parameter bbox.

    Onderstaande scenario's zoeken op bbox bij twee panden en bij een verblijfsobject.
    Een pand is een rechthoekig vlak, geïllustreerd in afbeelding pand-bbox-zoeken <img src='../../features/media/pand-bbox-zoeken.svg' title='pand-bbox-zoeken'>
    Een pand heeft een uitsnede (bijvoorbeeld een binnenplaats), geïllustreerd in afbeelding pand-uitsnede-bbox-zoeken <img src='../../features/media/pand-uitsnede-bbox-zoeken.svg' title='pand-uitsnede-bbox-zoeken'>
    Een verblijfsobject met een puntgeometrie, geïllustreerd in afbeelding verblijfsobject-bbox-zoeken <img src='../../features/media/verblijfsobject-bbox-zoeken.svg' title='verblijfsobject-bbox-zoeken'>
    In de illustraties staan de testgevallen aangegeven als blauw punt met een nummer. 
    Deze testgevallen zie je in de scenariotitels in rechte haken met respectievelijk V (voor vlak), U (voor uitsnede) en P (voor punt) plus het testgeval nummer.
    Bijvoorbeeld [U2] vindt je in de illustratie pand-uitsnede-locatie-zoeken.svg als het blauwe punt met nummer 2.


Rule: De standaardwaarde voor het coördinatenstelsel (CRS) voor de bbox-parameter is Rijksdriehoekscoördinaten New Nederlands (epsg:28992)

    Scenario: zoek op bbox zonder het coördinatenstelsel aan te geven
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118314,404843,118326,404850" wordt gezocht zonder requestheader "Content-Crs"
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: zoek op bbox met het coördinatenstelsel dat je gebruikt in de bbox-parameter
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118314,404843,118326,404850" wordt gezocht met requestheader "Content-Crs" met waarde "epsg:28992"
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

Rule: Resource wordt gevonden wanneer de bbox de resourcegeometrie geheel of gedeeltelijk overlapt

    Scenario: bbox overlapt geheel geometrievlak van gezochte pand [V1]
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118313,404852,118327,404841" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: bbox valt geheel binnen geometrievlak van gezochte pand [V2]
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118317,404848,118320,404845" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: bbox overlapt deels geometrievlak van pand en coördinaten bbox vallen buiten geometrievlak van pand [V3]
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118308,404847,118318,404840" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: bbox overlapt geheel de geometrie van verblijfsobject [P1]
        Gegeven het adresseerbaar object met identificatie "0226010000038820" heeft de volgende geometrie punt coördinaten
        | geometriecoördinaten    |
        | [196733.427,439931.991] |
        Als met "GET" "/adresseerbareobjecten?bbox=196713.000,439951.0001,196753.000,439911.000" wordt gezocht
        Dan bevat het resultaat het adresseerbaar object met identificatie "0226010000038820"

    Scenario: bbox valt binnen geometrie van binnenvlak (binnen de uitsnede) van gezochte pand met uitsnede [U1]
        Gegeven het pand met identificatie "1926100000495231" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                                                                 |
        | [ [90275.639,446939.302],[90241.499,446929.194],[90265.134,446876.961],[90301.792,446899.558],[90293.907,446944.715],[90279.026,446940.298],[90275.639,446939.302] ] |
        | [ [90257.962,446920.845],[90277.66,446926.938],[90282.005,446928.282],[90285.691,446907.282],[90268.911,446896.459],[90257.962,446920.845] ]                         |
        Als met "GET" "/panden?bbox=90270,446915,90275,446905" wordt gezocht
        Dan bevat het resultaat GEEN pand met identificatie "1926100000495231"

Rule: Resource wordt gevonden wanneer de buitenrand van de bbox op de buitenrand van de resourcegeometrie ligt

    Scenario: geometrie coördinaat van pand ligt op een verbindingslijn van de bbox [V4]
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118310.304,404850.835,118320.604,404860.592" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: bbox coördinaat ligt op de verbindingslijn tussen twee coördinaten van pand [V5]
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118324.681,404846.437,118328.911,404840.524" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: een bbox coördinaat komt overeen met een geometrie coördinaat van pand [V6]
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=118324.183,404843.509,118331.628,404839.365" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "0826100000036343"

    Scenario: een bbox coördinaat komt overeen met puntgeometrie verblijfsobject [P2]
        Gegeven het adresseerbaar object met identificatie "0226010000038820" heeft de volgende geometrie punt coördinaten
        | geometriecoördinaten    |
        | [196733.427,439931.991] |
        Als met "GET" "/adresseerbareobjecten?bbox=196715.427,439910.991,196733.427,439931.991" wordt gezocht
        Dan bevat het resultaat het adresseerbaar object met identificatie "0226010000038820"

    Scenario: puntgeometrie van een verblijfsobject ligt op een verbindingslijn van de bbox [P3]
        Gegeven het adresseerbaar object met identificatie "0226010000038820" heeft de volgende geometrie punt coördinaten
        | geometriecoördinaten    |
        | [196733.427,439931.991] |
        Als met "GET" "/adresseerbareobjecten?bbox=196710.427,439940.935,196733.427,439920.142" wordt gezocht
        Dan bevat het resultaat het adresseerbaar object met identificatie "0226010000038820"

    Scenario: bbox coördinaat ligt op de verbindingslijn tussen twee coördinaten van de uitsnedegeometrie van pand [U2]
        Gegeven het pand met identificatie "1926100000495231" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                                                                 |
        | [ [90275.639,446939.302],[90241.499,446929.194],[90265.134,446876.961],[90301.792,446899.558],[90293.907,446944.715],[90279.026,446940.298],[90275.639,446939.302] ] |
        | [ [90257.962,446920.845],[90277.66,446926.938],[90282.005,446928.282],[90285.691,446907.282],[90268.911,446896.459],[90257.962,446920.845] ]                         |
        Als met "GET" "/panden?bbox=90268.848,446917.782,90283.848,446912.782" wordt gezocht
        Dan bevat het resultaat het pand met identificatie "1926100000495231"

Rule: Resource wordt gevonden wanneer de coördinaat of rand van de bbox-parameter niet meer dan een halve milimeter buiten de rand van de resourcegeometrie ligt

    Abstract Scenario: bbox <scenario> van gezochte pand
        Gegeven het pand met identificatie "0826100000036343" heeft de volgende geometrie polygoon coördinaten
        | geometriecoördinaten                                                                                                        |
        | [ [118315.606,404844.967],[118324.183,404843.509],[118325.179,404849.365],[118316.604,404850.835],[118315.606,404844.967] ] |
        Als met "GET" "/panden?bbox=<bbox>" wordt gezocht
        Dan bevat het resultaat <resultaat> het pand met identificatie "0826100000036343"

        Voorbeelden:
        | bbox                                            | resultaat | scenario                                                               |
        | 118300.000,404800.000,118315.606,404844.967     | wel       | coördinaat is een geometriecoördinaat                                  |
        | 118300.000,404800.000,118315.605,404844.967     | niet      | coördinaat ligt 1mm van een geometriecoördinaat                        |
        | 118324.681,404846.437,118400.000,404800.000     | wel       | coördinaat ligt op de verbindingslijn tussen twee geometriecoördinaten |
        | 118324.682,404846.437,118400.000,404800.000     | niet      | ligt 0,9mm van de verbindingslijn tussen twee geometriecoördinaten     |
        | 118325.1795,404900.0000,118400.0000,404800.0000 | wel       | verbindingslijn loopt 0,5mm naast geometriecoördinaat                  |
        | 118325.1796,404900.0000,118400.0000,404800.0000 | niet      | verbindingslijn loopt 0,6mm naast geometriecoördinaat                  |
        | 118300.00,404800.00,118315.60,404844.96         | niet      | in centimeters valt buiten geometrie                                   |
        | 118325.17,404900.00,118400.00,404800.00         | wel       | in centimeters valt binnen geometrie                                   |
        | 118300,404800,118315,404844                     | niet      | in meters valt buiten geometrie                                        |
        | 118325,404900,118400,404800                     | wel       | in meters valt binnen geometrie                                        |

    Abstract Scenario: bbox <scenario> van gezochte verblijfsobject
        Gegeven het adresseerbaar object met identificatie "0226010000038820" heeft de volgende geometrie punt coördinaten
        | geometriecoördinaten    |
        | [196733.427,439931.991] |
        Als met "GET" "/adresseerbareobjecten?bbox=<bbox>" wordt gezocht
        Dan bevat het resultaat <resultaat> het adresseerbaar object met identificatie "0226010000038820"

        Voorbeelden:
        | bbox                                            | resultaat | scenario                                            |
        | 196000.000,440000.000,196733.427,439931.991     | wel       | coördinaat is geometriecoördinaat                   |
        | 196000.000,440000.000,196733.427,439931.992     | niet      | coördinaat ligt 1mm van geometriecoördinaat         |
        | 196000.000,440000.000,196800.000,439931.992     | niet      | verbindingslijn loopt 1mm van geometriecoördinaat   |
        | 196000.0000,440000.0000,196800.0000,439931.9914 | wel       | verbindingslijn loopt 0,4mm van geometriecoördinaat |
        | 196000.0000,440000.0000,196800.0000,439931.9916 | niet      | verbindingslijn loopt 0,6mm van geometriecoördinaat |
        | 196720.00,439932.00,196733.42,439930.00         | niet      | in centimeters valt buiten geometrie                |
        | 196733.42,439932.00,196735.00,439930.00         | wel       | in centimeters valt binnen geometrie                |
        | 196000,440000,196733,439931                     | niet      | in meters valt buiten geometrie                     |
        | 196733,439931,197000,440000                     | wel       | in meters valt binnen geometrie                     |