# adresregels
Functionaliteit: Als gebruiker wil ik samengestelde adresregels
    zodat ik het samengestelde adres direct en correct kan gebruiken.

    Het adres wordt samengesteld conform NEN 5825:2002. Dit betreft alleen het adresdeel van de adressering, het naamdeel van de adressering komt uit een andere bron (zoals BRP, HR of BRK).
    Bij de nummering van de adresregels is de NEN 5825:2002 gevolgd.

    De adresregels worden samengesteld op basis van de volgende regels
    - Property adresregel5 wordt samengesteld uit korteNaam + huisnummer + huisletter + huisnummertoevoeging
    - Property adresregel6 wordt samengesteld uit postcode + woonplaats
    - Tussen kortenaam en huisnummer wordt een spatie opgenomen
    - Tussen het huisnummer en de huisnummertoevoeging (wat in de NEN een samenstelling is van huisletter en huisnummertoevoeging, niet gecheiden van elkaar) moet een koppelteken ("-") worden geplaatst indien de huisnummertoevoeging met een cijfer begint, een spatie in alle andere gevallen
    - Tussen postcode numeriek deel en postcode alfabetisch deel moet een spatie worden geplaatst
    - Tussen postcode alfabetisch deel en woonplaatsnaam moeten twee spaties worden geplaatst
    - De woonplaatsnaam wordt in hoofdletters geschreven

    Scenario: er is geen huisnummertoevoeging en geen huisletter
        Gegeven adres met nummeraanduidingidentificatie "0957200000021241" heeft de volgende gegevens:
        """
        {
            "straat": "Annelien Kappeyne van de Coppellostraat",
            "huisnummer": 8,
            "postcode": "6049HD",
            "woonplaats": "Herten",
            "korteNaam": "A K vd Coppellostr"
        }
        """
        Als het adres wordt gevraagd met /adressen/0957200000021241
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "A K vd Coppellostr 8",
            "adresregel6": "6049 HD  HERTEN"
        }
        """

    Scenario: er is een huisletter en er is geen huinummertoevoeging
        Gegeven adres met nummeraanduidingidentificatie "0344200000004821" heeft de volgende gegevens:
        """
        {
            "straat": "Blauwkapelseweg",
            "huisnummer": 1,
            "huisletter": "A",
            "postcode": "3572KA",
            "woonplaats": "Utrecht",
            "korteNaam": "Blauwkapelseweg"
        }
        """
        Als het adres wordt gevraagd met /adressen/0344200000004821
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "Blauwkapelseweg 1 A",
            "adresregel6": "3572 KA  UTRECHT"
        }
        """

    Scenario: er is een huisnummertoevoeging die begint met een letter en er is geen huisletter
        Gegeven adres met nummeraanduidingidentificatie "0417200000000354" heeft de volgende gegevens:
        """
        {
            "straat": "Burgemeester van Nispen van Sevenaerstraat",
            "huisnummer": 1,
            "huisnummertoevoeging": "BEN",
            "postcode": "1251KD",
            "woonplaats": "Laren",
            "korteNaam": "Burg v N v Sevenaerstr"
        }
        """
        Als het adres wordt gevraagd met /adressen/0417200000000354
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "Burg v N v Sevenaerstr 1 BEN",
            "adresregel6": "1251 KD  LAREN"
        }
        """

    Scenario: er is een huisnummertoevoeging die begint met een cijfer en er is geen huisletter
        Gegeven adres met nummeraanduidingidentificatie "0289200000017214" heeft de volgende gegevens:
        """
        {
            "straat": "Bornsesteeg",
            "huisnummer": 1,
            "huisnummertoevoeging": "5A3",
            "postcode": "6708GA",
            "woonplaats": "Wageningen",
            "korteNaam": "Bornsesteeg"
        }
        """
        Als het adres wordt gevraagd met /adressen/0014200022188962
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "Bornsesteeg 1-5A3",
            "adresregel6": "6708 GA  WAGENINGEN"
        }
        """

    Scenario: er is een huisletter en een huisnummertoevoeging die begint met een letter
        Gegeven adres met nummeraanduidingidentificatie "0118200000264072" heeft de volgende gegevens:
        """
        {
            "straat": "Defensieweg",
            "huisnummer": 16,
            "huisletter": "D",
            "huisnummertoevoeging": "K",
            "postcode": "7933TL",
            "woonplaats": "Pesse",
            "korteNaam": "Defensieweg"
        }
        """
        Als het adres wordt gevraagd met /adressen/0118200000264072
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "Defensieweg 16 DK",
            "adresregel6": "7933 TL  PESSE"
        }
        """

    Scenario: er is een huisletter en een huisnummertoevoeging die begint met een cijfer
        Gegeven adres met nummeraanduidingidentificatie "0484200002040489" heeft de volgende gegevens:
        """
        {
            "straat": "Belgiëlaan",
            "huisnummer": 1,
            "huisletter": "A",
            "huisnummertoevoeging": "3",
            "postcode": "2391PH",
            "woonplaats": "Hazerswoude-Dorp",
            "korteNaam": "Belgiëlaan"
        }
        """
        Als het adres wordt gevraagd met /adressen/0484200002040489
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "Belgiëlaan 1 A3",
            "adresregel6": "2391 PH  HAZERSWOUDE-DORP"
        }
        """

    Scenario: er is geen postcode
        Gegeven adres met nummeraanduidingidentificatie "0518200001661726" heeft de volgende gegevens:
        """
        {
            "straat": "Zorgvlietstraat",
            "huisnummer": 4,
            "huisletter": "T",
            "woonplaats": "'s-Gravenhage",
            "korteNaam": "Zorgvlietstraat"
        }
        """
        Als het adres wordt gevraagd met /adressen/0518200001661726
        Dan bevat het antwoord:
        """
        {
            "adresregel5": "Zorgvlietstraat 4 T",
            "adresregel6": "'S-GRAVENHAGE"
        }
        """
