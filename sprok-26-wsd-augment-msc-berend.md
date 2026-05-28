Szintetikus szövegekkel történő adataugmentáció használatának vizsgálata 
  a jelentésegyértelműsítési feladaton
Sprok Dániel
MSc Szegedi Tudományegyetem Informatikai Intézet Dr. Berend Gábor Szeged 2026

# Feladatkiírás

* A WSD tanítóadatbázisok fedése nem kielégítő még angolra sem
  * szóalakok gyakran nagy számú (akár több tucat) lehetséges jelentéssel is
  * ezek gyakorisági eloszlása kifejezetten ferde, továbbá a többjelentésű
  * költséges humán annotációra támaszkodva végezhető el.
* we: a generatív mesterséges intelligencia eszköztárára támaszkodva, hozzon
  * (általános célú és specializált) modellek segítségével olyan 
    szintetikus jelentésegyértelműsítési adathalmazokat, amelyekkel
    adataugmentációs kísérletek végezhetők az angol jelentésegyértelműsítési
    feladaton. 
  * A dolgozat vizsgálja meg, hogy a 
    * kizárólag szintetikus adatokon tanított, illetve 
    * a tanítóhalmazban nem szereplő jelentésárnyalatok tekintetében szintetikus
      adatokkal kiegészített adathalmazokkal milyen hatásfokú 
  * szondázáson alapuló (a feladat megoldására használt neurális modell súlyait
    nem módosító) felügyelt modellek készíthetők.
  * a szóalakok ritka jelentéseinek felismerésének vizsgálatára.

# Tartalmi összefoglaló

* A megoldási mód: A választott specializált és általános célú modellek
  * kontextusokat generálunk különböző stratégiák mentén. Miután megvannak a
  * ezekből felépítjük az adatkészleteket és melléjük még létrehozásra kerülnek
    az annotációkat tartalmazó szöveges fájlok is.
* Alkalmazott eszközök, módszerek: 
  * A szövegkörnyezetek előállításához a Janus és Qwen modellek kerültek
    * amelyeknek kezelését egyszerűsítette a vLLM programkönyvtár, és egyben
  * az adatkészleteket használó modellek felépítése és tesztelése a 
    Sparsity Makes Sense kódbázis programjaival történt. Ezek mellett fontos
  * NLTK, a spaCy, a WSD Evaluation Framework és a WordNet is.
* eredmények: A szintetikus adatokat tartalmazó korpuszokkal sikerült
  megközelíteni az emberi eredetű szöveges adatkészletekkel elérhető
  teljesítményt, így azok helyettesítésére ígéretes alternatívát nyújtanak.

# 1. Bevezetés 6
# 2. Felhasznált modellek és eszközök bemutatása 7
## 2.1. janus 7
## 2.2. qwen3 8b 8
## 2.3 vllm 9
## 2.4 wsd evaluation framework, wordnet 10
## 2.5 nltk és más fontos könyvtárak 11
## 2.6 sparsity makes sense kódbázis (Berend 2020) 12

* a sűrű kontextualizált reprezentációkat fogjuk egymás alá rendezni, majd
  egységnormálni. Ezt követően egy célfüggvényt minimalizálunk, amiben a két
  mátrixunk, a tokenek ritka együtthatóinak és szemantikai bázisvektorok egy
  szótár mátrixának szorzatát szeretnénk, hogy minél jobban közelítse a sűrű
  reprezentációkat és az együtthatóink minél ritkábbak maradjanak.
Eredményül így megkapjuk a ritka reprezentációinkat. Ritka vektorokban az elemek
túlnyomó többsége nulla és magasabb dimenziószámúak a sűrű vektorokhoz képest. 
* ezek a ritka reprezentációk megnövelhetik a szavak jelentésének
  megkülönböztetését igénylő problémamegoldó képességet.
* 03_train: a WSD modell felépítése a lehetséges WordNetes jelentéscímkék és
  ritka reprezentációk aggregálásával, ezzel létrehozva a Φ mátrixot, ami
  pontszámokat rendel minden egyes bázisvektor-címke pároshoz. Ezt a kódot sűrű
  reprezentációkkal is futtatni lehet, ami fontos lesz számunkra a kétféle
  ábrázolás általunk történő összehasonlítása során.
* 04_predict-hez
  * csak a szavak lemmáihoz tartozó jelentések lesznek kiértékelve, a pontszámok
    kalkulációja végbemegy a Φ segítségével, és az adott szóhoz a legjobb
    pontszámot elérő jelentés kerül.
  * A pontszámokat a teszt tokenek reprezentációinak a Φ mátrixszal vett
    szorzatából kapjuk. Minden skalár az így létrejött produktumban azt jelöli,
    hogy az adott token mennyire tartozik a lehetséges jelentésekhez a saját
    szövegkörnyezetében.
* a „nyers” Φ mátrixszal elért pontszámok mellett még a pontonkénti kölcsönös
  információval (PMI) való kiegészítést is támogatja. A PMI két esemény 
  * bázisvektor-címke együttes bekövetkezésének valószínűségét hasonlítja össze
  * npPMI, azaz a normalizált pozitív PMI. [12] 
    * Normalizált, mert a PMI értékeket -1 és 1 határok közé méretezi át és
    * pozitív, mert a negatív asszociációk törlésre kerülnek, így 
    * a pontszám tartomány ezt követően 0-tól 1-ig tart.

# 3. Szövegkörnyezetek generálásának és az adatkészletek összeállítása 14
## 3.1. szövegkörnyezetek generálása 14
## 3.2. adatkészletek összeállítása 16
# 4. A benchmark, elkészített és teszt adatkészletek bemutatása 17
## 4.1. benchmark adatkészletek 17
### 4.1.1 semcor 17
### 4.1.2 wordnet gloss corpus 17
## 4.2. teljesen szintetikus adatkészletek 18
### 4.2.1 janus semcor 18
### 4.2.2 qwen semcor 18
### 4.2.3 qwen polysemcor 18
### 4.2.4 extended janus semcor 18
## 4.3. hibrid adatkészletek 19
### 4.3.1 extended semcor 19
### 4.3.2 extended semcor + wngc 19
## 4.4. teszt adatkészlet 19
# 5. Kiértékelés módja 20
# 6. Eredmények, következtetések 21
## 6.1 normalizált pozitív pmi-vel elért eredmények ritka reprezentációkkal 21
### 6.1.1 benchmark adatkészletek 21
### 6.1.2 teljesen szintetikus adatkészletek 22
### 6.1.3 hibrid adatkészletek 23
### 6.1.4 összehasonlítás 23
## 6.2 sűrű reprezentációkkal elért eredmények 25
### 6.2.1 benchmark adatkészletek 25
### 6.2.2 teljesen szintetikus adatkészletek 25
### 6.2.3 hibrid adatkészletek 26
### 6.2.4 összehasonlítás 26
## 6.3 további vizsgálatok 28
### 6.3.1 szintetikus vs emberi szövegek vektoraihoz tartozó normák 28
### 6.3.2 szintetikus vs emberi szövegek ritka reprezntációihoz tartozó 
  nem nulla együtthatók összehasonlítása 29
### 6.3.3 pontosság vizsgálat leggyakoribb és ritka, nem előforduló jelentésekre
  különbontva 31
### 6.3.4 hibrid adatkészlethez tartozó ritka együtthatók specializálódása 34
# 7. Összefoglaló 35

* A diplomamunkám célja az volt, hogy generatív MI-kkel 
  teljesen szintetikus és hibrid adatkészleteket állítsak elő, és ezeket
  használva megközelítsem azt a fajta teljesítményt, amelyet az emberi eredetű
  szöveges adatkészletekkel lehet elérni a jelentésegyértelműsítési feladaton. A
  * Janusszal és a Qwennel, sikerült elég jó minőségű adatkészleteket
  * A legjobb, Janus által generált szintetikus adatkészlettel elért legjobb 
    micro F1-érték 0,7318, a macro F1 pedig 0,6785 volt. 
  * Qwen esetén a mérőszámok 0,7039-re és 0,6419-re adódnak
  * baseline: SemCorral kapott eredményekkel (0,7577 és 0,7062), ezek a
  * kevésbé tűnnek alkalmasnak korpuszbővítésre az általános modellek 
    a célzottan finomhangolt modellekhez képest, de ez természetesen nem azt
* hibrid adatkészletek:
  a szintetikus adatokkal való kiegészítés nem vezetett előre, helyette inkább
  minimális teljesítményromlást hozott. Erre magyarázatot adhat az, hogy a
  vakfoltok betömésére alkalmazott generálási stratégiával előállított
  szövegek jelenléte ezekben az adatkészletekben 
  * a gyakori jelentések eltalálását nehezebbé tette, tehát ez nem feltétlen a
    szintetikus adatok hibája. Ez arra is rámutatott, hogy 
  * a nagyobb adatmennyiség nem feltétlen eredményez jobb teljesítményt, az
  * az npPMI használata ritka reprezentációkon jobb eredményeket ad a sűrű
    reprezentációs megoldásnál.
* a szintetikus és valódi kontextusok vektornormái közötti, valamint azok ritka
  reprezentációinak nem nulla együtthatóit érintő különbségek
  * hibrid adatkészletnél a kölcsönös információ metrika alapján az atomok nem
    specializálódnak oly módon, hogy azok inkább csak a szintetikus vagy emberi
    szövegekben szeretnek jelen lenni.
* a 4-bites kvantálásból eredő minőségromlás 
  * jó lenne, ha azt egy kevésbé agresszív kvantálásra váltanánk, 
    legideálisabb esetben meg ez a lépés ki is maradhatna. 
  * További előny: a 
    gyorsabb generálás és a nagyobb kapacitás több kontextus előállításához

# Irodalomjegyzék 37
# Nyilatkozat 38
# Köszönetnyilvánítás 39
