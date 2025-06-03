Magyar páciensek narratív tapasztalatainak elemzése
  BERT témamodellezéssel és szentimentelemzéssel
Osváth Mátyás, Yang Zijian Győző, Kósa Karolina
XVIII. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2022. január 27–28.

# Abstract

* 1663 blogbejegyzést elemeztünk témamodellezéssel és szentimentelemzéssel,
  előtanított huBERT és egy finomhangolt HIL-SBERT transzformer modell
  * A modell 326 és 200 témát azonosított, amelyeket
    manuális elemzéssel kategóriákká vontuk össze
  * A modell az írások 94,4%-át negatívan osztályozta,
    hasonló tendenciát mutatva az éves bontásra is

# 1. Bevezetés

## 1.1. Kapcsolódó irodalom

* első olyan rendszeres áttekintés az orvosi szakirodalomban, amely betegek
  által írott szabad szövegeket elemző, az elmúlt 20 évben megjelent,
  természetesnyelv-feldolgozást és gépi tanulást alkalmazó, összesen 19
  tudományos közleményt foglalt össze (Khanbhai+ 2021). Ezek között
  * 6 cikk felügyeletlen gépi tanuláson alapuló modelleket, spec témamodellezés
  * Tudomásunk szerint egy kutatás alkalmazta a word2vec és kontextuális BERT
    * eg a betegség súlyossága, időbeli hossza és fennállása (Saha+ 2020).
  * Hazánkban tudomásunk szerint eddig nem történt olyan vizsgálat, amelynek
    fókuszában szöveges páciens-élmények elemzése állt volna NLP-vel

# 2. Módszerek

## 2.1. Adatgyűjtés

* 1660 blogbejegyzésből, 54,843 mondatból és 873,442 szóból állt,
  blogbejegyzésenként átlagosan 532,6 szóval.

## 2.2. Adatelemzés

* min clust size 15

# 3. Eredmények

* A huBERT és HIL-SBERT által feldolgozott mondatok alapján 326 és 200 téma
  * >50% zajként (huBERT: 33,744, HIL-SBERT: 34,745) értelmezve. A
* kval anal
  * a huBERT modell kimenetét könnyebb volt értelmezni, ezért a további
  * a 326 téma közül kizártuk az elemzés szempontjából nem relevánsakat. A
  * humán interpretációval az összetartozó témákat kategóriákká csoportosítsuk.
    * a szerzők közötti iteratív megbeszélések révén kerültek kiválasztásra a
* az öt legjelentősebb kategóriát mutatjuk be (1. táblázat), illetve a modell
  által fontosnak jelölt, 2. táblázatban látható 18 témát.

# 4. Következtetés

* A kategóriák közül kettő, a struktúra és az ellátás kimenete megegyezik a
  Donabedian-féle modell két dimenziójával
