# Abstract

* Llama-2 alapú modellt, amely folytatólagos előtanítást és utasításkövető
  finomhangolást alkalmaz a magyar nyelvi sajátosságok figyelembevételével
  * 66 000 angol és 15 000 magyar promptot tartalmazó adatbázist használtunk,
  * HuCOLA, HuSST és HuRTE teszteken – kimagasló teljesítményt nyújtott
  * zero shot tesztek során a HuCOLA teszten 66,98%-os, a HuSST teszten
    70,06%-os, míg a HuRTE teszten 74,54%-os pontosságot ért el, ami
    * felülmúlja a korábbi modelleket.
* kvalitatív elemzéseket is végeztünk a modell teljesítményén
  * magas szintű kontextuskezelő képességét például egy hosszú
    szövegkörnyezetben végzett keresési feladattal értékeltük
  * stílusérzékenységét különböző nyelvi regiszterekben tett próbákkal
    vizsgáltuk
  * jelentős tudást képes átvenni más nyelvekből is

# 1 Intro

* előtanított nyelvmodellt adaptáljunk egy doménspecifikus tudásra, vagy egy
  másik nyelvre. Az így folytatólagosan előtanított nyelvmodellek képesek a
  korábbi tudásukat transzferálni az új nyelvre és az így készült új modell az
  új nyelv elsajátítása mellett képes megőrizni a korábbi feladatmegoldó
  képességeit is. Ezzel a módszerrel az új nyelven akár kevesebb adattal is
  tanítható egy olyan modell, amelynek jobb a minősége, mint a több adaton, de
  nulláról tanított modelleknek.
* Magyar nyelvre vonatkozóan eddig csak nulláról betanított nagyméretű nyelvi
  modellek állnak rendelkezésre. Ezek közé tartoznak a 
  * PULI modell család tagjai, mint például az egynyelvű, 6,7 milliárd
    paraméteres PULI 3SX (Yang+ 2023a), valamint a 
  * háromnyelvű (magyar-angol-kínai) 7,7 milliárd paraméteres PULI Trio (Yang
   + 2023b). Továbbá elérhető még az 
  * angol-magyar kétnyelvű, 6,7 milliárd paraméteres HILANCO-GPTX modell is 4 .
* most egy 7 milliárdos Llama 2 modellt tanítottunk tovább magyar nyelvre,
  majd finomhangoltuk utasításkövetésre. Az így elkészült modell 
  * szignifikánsan felülmúlta az eddigi PULI modelleket.  Jelenlegi
  * tesztelhető a demóoldalunkon 5 . A folytatólagosan előtanított nagyméretű
  * elérhető a Hugging Face oldalunkon 6 .

# 2. Kapcsolódó irodalom

* Llama modellek (Touvron+ 2023a,b), amelyek magas minőséget
  * megengedő licencüknek köszönhetően rendkívül elterjedtek mind a kutatók,
    mind a vállalatok körében. Ezek a modellek annyira magas minőségűek, hogy
  * könnyen lehet belőlük akár finomhangolással, akár további előtanítással
    nagyon jó minőségű célalkalmazásokat tanítani.
* A mi modellünk megjelenésének egyidőben jelentek meg a SambaNova Systems 7
  által tanított SambaLingo modellek (Csaki+ 2024). Gyakorlatilag
  * Csaki Z, Li B, Li J, Xu Q, Pawakapan P, Zhang L, Du Y, Zhao H, Hu C, 
    Thakker U
    Sambalingo: Teaching large language models new languages (2024)
  * Csaki Z, Pawakapan P, Thakker U, Xu Q.
    Efficiently adapting pretrained language models to new languages (2023),
  * ugyanúgy folytatólagos előtanítással tovább tanították a Llama 2 modelleket
    más nyelvekre, köztük magyar nyelvre is. Ők 
  * két mérettel is kísérleteztek, a 7 és a 70 milliárd paraméteres modellekkel.
  * több mint 60 milliárd magyar szavas korpusszal tanították tovább és 
  * vocab: az angol-központúság problémájára reflektálva a szótár 10%-át
    lecserélték olyan tokenekre, amelyek magyar szóelemeket is tartalmaznak.
  * a tanítóadat 75%-a magyar és 25%-a angol (Csaki+ 2023).
* Alves+ (2024) folytatólagos előtanítással hoztak létre jobb minőségű
  gépi fordító alapmodellt. Kutatásukban 
  * egy Llama 2 modellt tovább előtanítottak egynyelvű és párhuzamos korpon,
    majd azután végeztek utasításkövető finomhangolást gépi fordításra.

# 3

* hogy a modell ne felejtse el az angol tudását, beépítettük az eredeti
  finomhangolási korpuszokat

# 4. Kísérletek és mérések

## 4.1. Folytatólagos előtanítás

* A modell kontextushosszát pozíció-interpoláció (Chen+ 2023) segítségével
  növelték meg.
* kiértékelésünk során a 7 milliárdos SambaLingoHungarian-Base és a 7
  milliárdos SambaLingo-Hungarian-Chat modelleket is megvizsgáltuk. 
* Továbbá a korábbi PULI modellek közül a PULI Trio és a ParancsPULI
  modelleket, mivel ezek rendelkeznek hasonló többnyelvű háttértudással,
  valamint ugyanazon a finomhangoló anyagon tanult a ParancsPULI, mint a mi
  modellünk.

## 4.2. Kiértékelési kísérletek

* még nincsen hivatalos generatív modelleket kiértékelő korpusz, 
* a kvantitatív kiértékeléshez három magyar benchmarkot választottunk, a 
  * HuCOLA, HuSST és HuRTE korpuszokat (Ligeti-Nagy+ 2022). Azért ezt a három
  * a HuCOLA ad egy képet arról, hogy a modell mennyire sajátította el a magyar
  * HuSST egy népszerű szentimentelemző osztályozási feladat, a 
  * HuRTE pedig egy következtetéses feladat, ami komplexebb logikai
  * hE HuCOPA egy többválasztós feladat, amely komolyabb prompt kísérleteket
    tenne szükségessé, ami megnehezíti a kiértékelést és torzíthatja az
  * HuWNLI és a HuCB (Ligeti-Nagy+ 2023) is következtetéses feladatok, így
    ezeket már nem vettük bele a kiértékelésbe.
* promptokkal való kísérleteinket. Sajnos nem egyértelmű, hogy egy-egy ilyen
  nagy nyelvi modell kiértékeléshez milyen módon használjunk promptokat. Ez
  vonatkozik mind a nyers, mind az utasításkövető modellekre. Ezeknek a nagy
* nem determinisztikusak, a paraméterbeállításokkal növelhetjük ezt a
  képességet, azonban azt tapasztaltuk, hogy ilyenkor gyakran romlik a kimenet
  * Yang+ (2023b) alacsonyabb hőmérsékletet alkalmaztak, 0,4 és 0,6 közötti,
  * Csaki+ (2024) kutatásában magasabb, 0,6 és 0,8 közötti értékeket állítottak
  * top-p értéket csak Csaki+ (2024) állították át 0,9-re, a többi paramétert,
    mint top-k, alapértelmezettnek hagyták. 
  * mi A kutatásunkban a középutat választottuk, csak a hőmérséklet értékét
    változtattuk 0,6-ra. Ez olyan érték, amely már változatosabban ad
    válaszokat, azonban a determinisztikusság alacsonyabb. Ezért érdemes
    többször is lefuttatni a méréseket, hogy pontosabb képet kapjunk.A
* kétféle kiértékelést végeztünk. Az 
  * első mérésünk a nyers nyelvmodellekre irányult.  Ehhez a few-shot kísérletet
    alkalmaztuk.  Azonban egy kis módosítást vittünk véghez. 
    * Yang+ (2023b, 2024a) kutatásaiban fixen az első néhány promptot vették a
      tanítóanyagból.
    Ez egy szerencsés választás esetén magas eredményt hozhat, azonban egy
    kevésbé szerencsés választás esetén a modell gyengén teljesíthet. Ehelyett
    * Zhu+ (2023) kísérlete alapján véletlenszerűen választottunk ki promptokat
      a tanítóanyagból minden egyes tesztszegmensre. Hogy megállapítsuk az
      optimális promptmennyiséget, többféle mennyiségű prompttal kísérleteztünk.
  * Következő kísérletünk a nyers modellek kiértékelése volt, amihez a few-shot
    módszert választottuk. A few-shot mérésekhez a HuCOLA és a HuSST esetében a
    következő promptsablont használtuk:
– [szöveg] = [konvertált címke]
– 1. Példa: Az Angliáról való könyv tetszik. = rossz
– 2. Példa: Könnyű, aranyos és felejthető. = semleges
* konvertált szövegalapú címkét alkalmaztunk. Megfigyelésünk az volt, hogy az
  * eredeti szám alapú címke (0, 1, 2) kevésbé segít a nyelvmodellnek a
  * HuCOLA esetében a helyes/helytelen és a jó/rossz címkékkel kísérleteztünk,
  * HuSST esetében a konvertált címkék a következőek voltak: negatív, semleges,
  * A HuRTE esetében kétféle megoldással is kísérleteztünk. Az első, amikor 
    * egy [SEP] tokennel választottuk el a premisszát a hipotézistől (hasonló
      megközelítés, mint amit Laki és Yang (2023) alkalmaztak a kutatásukban),
      * helyes/helytelen és a jó/rossz címkékkel, és az utóbbival értünk el jobb
    * Yang és Ligeti-Nagy (2023) kutatását vettük alapul, ahol
      a premisszát és a hipotézist szövegesen kötötték össze, ezzel segítve a
– [premissza] Ebből az következik, hogy [hipotézis] = [konvertált címke]
– Példa: Az eladásból befolyt pénz Hepburn családjához letétbe kerül. Ebből
az következik, hogy a bevétel Hepburn családjáé. = jó
* utasításkövető modellek kiértékelése. Ehhez a feladathoz a zero-shot módszerét
  * többféle promptot próbáltunk ki. Itt a prompt sablon kötött volt, a
  * ParancsPULI és a mi utasításkövető PULI LlumiX Instruct modellünk a ma-
    gyarra fordított Stanford Alpaca sablonját alkalmazza, ami megegyezik a Yang
    és mtsai (2023b) által publikált cikkben leírt sablonnal. A 
  * SambaLingo modelljeiegy chat sablont alkalmaznak (Csaki+ 2024). 
  * A három benchmarkra különböző promptokkal kísérleteztünk, majd amelyik a
  * A ParancsPULI és az utasításkövető PULI LlumiX Instruct modell esetében az
    „Utasítás” mezőbe tettük a kérdést megfogalmazó promptot, és az „Bemenet”
    mezőbe a kiértékelendő szöveget. A 
  * SambaLingo esetében közvetlenül egymás alatt volt a kérdés és a szöveg.

# 5. Eredmények és kiértékelések

## 5.1. Kvantitatív kiértékelések

## 5.2. Kvalitatív kiértékelés
