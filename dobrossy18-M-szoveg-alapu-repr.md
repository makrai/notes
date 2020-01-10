# SZAKDOLGOZAT FELADAT Döbrössy Bálint mérnök hallgató részére

* nyelvtani (szintaktikai) -- mondattani (szintaktikai)
* disztributivitás -- melyik művelet melyikre nézve?
* az első bekezdés után oldaltörés
* Magyarlánc --> e-magyar
* szövegelemtár --> reprezentációs szint (ha jól értem)

#Összefoglaló 7

* és a belőlük formálható mondatok -- mit ért az alatt, hogy a gazdag
  morfológiájú nyelvekben több lehetséges mondat van?
* morféma vagy morf -- nem látok különbséget a kettő között ebben a kontextusban
* Google Analogy Test Set magyar fordítását már előállította [Makrai
  (2015)](http://corpus.nytud.hu/efnilex-vect/).

#Abstract 8

1 Számítógépes szóábrázolás vektorok segítségével 9

1.1 One-hot vector 9

* A sok angolul meghagyott szó miatt a szöveg kicsit olyan, mintha a jelölt nem
  döntötte volna el, hogy milyen nyelven akar írni, vagy mondjuk kanadai magyar
  lenne. Javaslom a vocabulary szót magyarul bátran szókincsnek mondani, vagy,
  ha minden alkalommal hangsúlyozni akarja, hogy szóalakokról beszél, akkor
  szóalakkincsnek. A célfüggvény (objective function) terminus bevett a magyar
  gépitanulás-közösségben.

##1.2 Tulajdonság-/környezetvektor (distribution vector) 10

* LSA-t is kéne említeni

1.3 Szóbeágyazások (embedding vector) 11

2 Beágyazóvektorok használata a szövegfeldolgozásban 12

* a word2vec-ben, GloVe-ban minden szónak kétféle vektora van
* a skip-gram és a cbow közös tolajdonságait érdemes lenne már az eltérő részek
  előtt elmondani.
* a neuronháló fogalmát ismertnek tételezi? Ha igen, akkor furcsa a 14.~oldal
  megfogalmazása, ha nem, akkor az előző oldal nem érhető.

2.1 Skip-gram 12
2.2 Continuous Bag-of-Words 15

* A Quorára való hivatkozás hasznos, de nem sztenderd, ezért a szövegben
  jelezni kéne az abból származó fenntartásokat, hogy ez a vélemény nem esett
  át a hagyományos publikációknál szokásos bírálaton. 

2.3 Karakter n-gram 16

* Az első bekezdésben leírtak nemcsak a morfológiailag gazdag nyelvekre igazak,
  hanem mindegyikre, ezért jobban meg kellene fogalmazni, hogy gazdag
  morfológia esetén miért nélkülözhetetlenebbek a szó alatti reprezentációk,
  mint az angolban.
* Az itt leírtak a karakter-n-gram-modell egy speciális esete (end-markerek, az
  egész szónak is van reprezentációja). Ezt jobban jelezni kéne.

2.4 Negatív mintavételezés 17

* Nincs explicite leírva az alapprobléma, hogy a softmax esetén a nevező
  számítása túl időigényes.

2.5 Gyakori szavak alulmintavételezése 18
2.6 Előre tanított beágyazások 19

* neurális hálókkal végzett fordításban (Neural Machine Translation - NMT) --
  mintha itt is bajban lenne a jelölt a magyarítással, pedig a _neurális gépi
  fordítás_ terminus elééég adja magát.

2.6.1 GloVe 19
2.6.2 FastText 20

3 Python 21

3.1 TensorFlow 21
3.2 gensim 21

4 Saját munka 23
4.1 Motiváció 23
4.2 Nehézségek a magyar nyelv kapcsán 23
4.3 Morfológiai alapfogalmak 25
4.4 Eszközök 25
4.4.1 fastText 26
4.4.2 Morfessor 26
4.4.3 magyarlánc 28
4.5 Tesztszekvenciák 28
4.6 Magyar nyelvű tesztszekvenciák előállítása 29
4.7 Az elvégzendő feladat specifikálása 31

5 Összehasonlított módszerek 32

5.1 Eredeti korpuszon való tanítás 32
5.2 Magyarlánc - szótövezés 33
5.3 Morfessor - leghosszabb szegmens felhasználása 36
5.4 Morfessor - minden szegmens felhasználása 39

6 Az eredmények összefoglalása 41

6.1 Legjobb szemantikai pontszámok módszerenként 42
6.2 Legjobb szintaktikai pontszámok módszerenként 43
6.3 A legjobb, ill. a legrosszabb szemantikai eredményt elérő modellek ... 43
6.4 A legjobb, ill. a legrosszabb szintaktikai eredményt elérő modellek ... 44

7 További tervek, fejlesztési lehetőségek 45

Irodalomjegyzék 46
