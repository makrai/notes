Magyar nyelvű szó~ és karakterszintű szóbeágyazások
Szántó Zsolt, Vincze Veronika, Farkas Richárd
2017 mszny 333

A létrehozott szóvektorok szabadon elérhetők a rgai.inf.u-szeged.hu/w2v oldalon

#Abstract

* bemutatunk publikusan elérhető magyar nyelvű szóvektorokat, amelyeket
  * 4,3 milliárd szövegszónyi korpuszból építettünk. Az első modellek
  http://rgai.inf.u-szeged.hu/project/nlp/research/w2v/doc.html
  rgai.inf.u-szeged.hu/w2v
* összehasonlítunk ugyanazon adatbázisból épített szó~ és karakterszintű embed
* téma~ és véleményosztályozási feladatokon kiértékelve

#2. Szóbeágyazási modellek 334

* Jelen cikkben a Facebook kutatói által publikált [3] FastTextet alkalmazzuk,
  * a szavak vektorát kiegészítjük a bennük szereplő karakter 3 és 4 gramokkal
  * skip-gram módszerrel tanítunk szóbeágyazásokat

##3.1. Szóbeágyazások kiértékelése

* Véleményosztályozásra az arukereso.hu oldalról letöltött termékértékeléseket
  * Az egyes termékekhez megadható előnyöket és hátrányokat alkalmaztuk pozitív
    és negatív tanító példaként
* Témaosztályozásra videojáték és sport témájú facebook bejegyzésekből ké-
  * Mindkét esetben tehát bináris dokumentumosztályozási problémát fogalmaztunk
  * a tanító és a kiértékelő adatbázison is az egyes címkék 50-50%-ban

#4. Eredmények

* FastText rendszer neuronhálókon [9] alapuló dokumentumosztályozóját
  * sebességben vetekszik a hagyományos lineáris modelleket alkalmazó
  * alapértelmezésként a tanító halmazból tanulja meg az [embeddinget], de
    képes ... [külső] szóbeágyazások alkalmazására is
  * A szószintű modellre építő nagymennyiségű adaton tanított szóbeágyazásokkal
    nem sikerült jobb eredményt elérni a külső erőforrást nem használó
    modellhez képest. Ezzel a
  * karakterszintű modell alkalmazásával a témaosztályozás esetén 3,5, míg
    véleménydetekció esetén csekélyebb, 0,4 százalékpontos javulást sikerült

#5. Összegzés
