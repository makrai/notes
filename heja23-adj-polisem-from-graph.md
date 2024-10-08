Magyar melléknevek poliszém jelentéseinek automatikus kinyerése gráfokkal
Héja Enikő, Ligeti-Nagy Noémi
XIX. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2023. január 26–27

# Kivonat

* interpretálható poliszém melléknévi jelentések automatikus kinyerése egy-
  nyelvű korpuszból egy felügyelet nélküli tanulási keretben
* 4 kritériumot határoztunk meg a jelentések elkülönítésére
  * statikus szóbeágyazásokból egy szemantikai hasonlósági gráfot csináltunk
* A jelentések elkülönítésére szolgáló kritériumokat ezen gráf részgráfjaival
* részletes kvalitatív kiértékelés következett
* from the conclusion: a fedés alacsony, így a jövőben
  1. a paraméterek változtatásával kívánjuk növelni
  2. klikkeknél kevésbé megszorított részgráfok
  3. a poliszémiában szerepet játszó főnévi kontextusok szemantikai osztályai

# Kulcsszavak: poliszémia, WSI, gráf, klikk, főnévi kontextusok

# 1 Intro

* a beszélők intuicíója nagy eltérést mutat az egyes szavakhoz tartozó
  jelentések particionálásában
  * Véronis, 2003; Adamska-Sałaciak, 2006; Kuti+ 2010
  * következmények a lexikográfiában, a lexikális szemantikában és az NLP-ben
  * Különösen a poliszémia esetében
  * cél: elégséges kritérium a jelentések megkülönböztetésére. Elvárásaink
    * az egyes jelentések kontextusokhoz való lehorgonyozása
    * az így elkülönített jelentéseket szemantikai kategóriákhoz is kötik, hogy
      azok az emberi intuíció számára is megragadhatóvá váljanak
    * felügyelet nélküli tanulási módszerrel modellezzük, hogy introspekció min
* statikus szóbeágyazásokkal reprezentáljuk
  * nem alkalmas egy szóalak egyes jelentéseinek az elkülönítésére
  * meaning conflation deficiency (Camacho-Collados és Pilehvar, 2018)
  * első eredményeink: a gráf-alapú módszerek ezt a problémát ki tudják küszöb
    * legalábbis a poliszém jelentések esetében

# 2 Hipotézis és 4 kritérium a jelentések megkülönböztetésére

* gráf lokális tulajdonságán alapul számos WSI-t célzó kutatás
    * Dorow B, Widdows D, Ling K, Eckmann JP, Sergi D, Moses E
      Using Curvature and Markov Clustering in Graphs for Lex Acqui & WSDiscrim
      2004 https://arxiv.org/abs/cond-mat/0403693
    * Véronis, 2004 HyperLex: lexical cartography for information retrieval
      Computer Speech & Language 18(3), 223–252 (2004)
    * Biemann, 2006
      Chinese Whispers ~ an Efficient Graph Clustering Algorithm and its Applic
      TextGraphs: the First Workshop on Graph Based Methods 4NLP
* statikus sűrű szóbeágyazásokból épített gráfokat Pelevina+ (2016)
  * Pelevina M, Arefiev N, Biemann C, Panchenko A
    Making Sense of Word Embeddings
    1st Workshop on Representation Learning for NLP
* A jelentés hagyományos definíciója a jelentések azonosságát veszi alapul
  * szinonímia definíciója2 hosszú múltra tekint vissza (pl Frege, 1892)
  * azokat a jelentéseket tekintjük különbözőknek, amelyek nem szinonimák
  * we: megfordítjuk a definíciós sorrendet: nem a szinonímia fogalmából indul
  * mikor eltérő két jelentés
  * a szinonímia fogalma előfeltételezi az igazságfeltételek (IF) fogalmát
    * az IF disztribúciós szemantika számára közvetlenül nem megragadható
    * az automatikusan kinyert szinonima-osztályok sok esetben egyéb szűk
      szemantikai osztályokat is lefednek, pl nemzetek neveit, színneveket, sőt
      hasonló disztribúciós tulajdonságokat mutató antonimákat is

## 2.1. A majdnem-szinonímia (near-synonymy vö. Ploux és Victorri, 1998)

* ha van a kontextusoknak egy olyan korlátozott halmaza, ahol a két kifejezés
  felcserélhető egymással a mondatok jelentésének megváltozása nélkül
  * eg a finom és a lágy
    * szinonimák számos zenéhez kapcsolódó főnév előtt, mint például dallam,
      ritmus vagy a zene maga, de
    * nem szinonimák pl ételek nevei előtt (pl lágy kenyér ̸= finom kenyér)
* A fenti definíción túl a szűk szemantikai osztályok elemeit is
  majdnem-szinonimáknak tekintjük. A definíció ilyen irányú kiterjesztését az
  * mert az eltérő szemantikai osztályokhoz való tartozás
    elégséges feltétele a jelentés megkülönböztetésnek
    * még akkor is, ha a szűk szemantikai osztályok elemeit egymással
      felcserélve nem feltétlenül őrizzük meg a mondatok igazságértékét

## 2.2. A jelentés megkülönböztetés kritérumai

* egy melléknév két jelentését akkor kell megkülönböztetni, ha:
  1. Mindegyik melléknévi jelentéshez találunk (min. 1) majdnem-szinonimát
  2. Vannak olyan főnevek, amelyek grammatikus konstrukciókat alkotnak az ere-
     deti melléknévvel és ennek majdnem-szinonimáival is
  3. Az egyes jelentéseket karakterizáló főnevek halmazai nem átfedőek
  4. A nem-átfedő főnév-halmazok egy vagy több szemantikai kategóriát képez-
     nek „amelyek tükrözik a melléknevek szubszelekciós tulajdonságait”
    (vö Pustejovsky, 1995)
* eg napfényes melléknév automatikusan kinyert két jelentését tartalmazza
  * majdnem-szinonima: a napsütéses az 1. jelentéshez és a napsütötte a 2.-hoz
  * a szavakkal grammatikus szerkezeteket alkotó főneveket is:
    napfényes/napsütéses vasárnap, napfényes/napsütéses nap stb., és
    napfényes/napsütötte terület, napfényes/napsütötte terasz stb
  * A két főnévhalmaz nem átfedő:
    nincs olyan, hogy napsütötte nap vagy napsütéses terasz
  * a szóban forgó főnevek egy szemantikai kategóriát alkotnak:
    1. időintervallumokat, míg
    2. fizikai kiterjedéssel rendelkező dolgokat jelölnek

# 3 Módszer

* egy gráf-alapú megközelítést javaslunk a kritériumok modellezésére
* Módszerünk alapjául Ah-Pine és Jacquet (2009) szolgált, amennyiben
  * a jelentés-megkülönböztetéseket teljes részgráfokkal, vagyis klikkekkel
  * különbséget azonban érdemes kiemelni
    * Ah-Pine és Jacquet (2009) kísérleteik során a névelemekre fókuszáltak,
    * mi kizárólag az attributív mellékneveket vizsgáljuk. Ennek elsődleges
    * szerintünk az attributív pozicióban lévő melléknevek jelentése egy
      viszonylag egyszerű jegykészlettel – a módosított főnévi csoport feje –
      leírható
    * a célszavakat statikus sűrű beágyazásokkal reprezentáljuk a
      gyakoriság-alapú ritka vektorok helyett

# 4 Hogyan validáltuk a kinyert eredményeket főnévi kontextusaikkal

# 5 Kiértékelés

## 5.2

* eg _mindennapi_ melléknév két klikkhez is tartozott: a 6. és a 7. ábrák
  * a majdnem-szinonimák már megvilágítják a mindennapi melléknév két jel.jét
  * hétköznapi ill. mindennapos
  * a nyelvhez kapcsolódó dolgok (pl szóhasználat, nyelvhasználat) inkább
  * gyakorlás vagy a testmozgás szabályos időközönként végzett (végzendő)

# 6 Összefoglalás
