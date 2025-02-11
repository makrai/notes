# Abstract

* Llama-2 alapú modellt, amely folytatólagos előtanítást és utasításkövető
  finomhangolást alkalmaz a magyar nyelvi sajátosságok figyelembevételével
  * 66 000 angol és 15 000 magyar promptot tartalmazó adatbázist használtunk,
  * HuCOLA, HuSST és HuRTE teszteken kimagasló teljesítményt nyújtott
  * zero shot tesztek során a HuCOLA teszten 66,98%-os, a HuSST teszten
    70,06%-os, míg a HuRTE teszten 74,54%-os pontosságot ért el, ami
    * felülmúlja a korábbi modelleket
* kvalitatív elemzéseket is végeztünk a modell teljesítményén
  * magas szintű kontextuskezelő képességét például egy hosszú
    szövegkörnyezetben végzett keresési feladattal értékeltük
  * stílusérzékenységét különböző nyelvi regiszterekben tett próbákkal
  * jelentős tudást képes átvenni más nyelvekből is

# 1 Intro

* előtanított nyelvmodellt adaptáljunk egy doménre, vagy egy másik nyelvre. 
  * =: folytatólagosan előtanított nyelvmodellek képesek 
    * a korábbi tudásukat transzferálni az új nyelvre és az így készült új
    * megőrizni a korábbi feladatmegoldó képességeit is. Ezzel a módszerrel 
    * az új nyelven akár kevesebb adattal is tanítható egy olyan modell,
    * jobb, mint a több adaton, de nulláról tanított modelleknek
* Magyar nyelvre vonatkozóan eddig csak nulláról betanított LLMek 
  * PULI modell család tagjai, mint például az 
    * egynyelvű, 6,7 milliárd paraméteres PULI 3SX (Yang+ 2023a), valamint a
    * magyar-angol-kínai 7,7 milliárd paraméteres PULI Trio (Yang+ 2023b)
  * angol-magyar kétnyelvű, 6,7 milliárd paraméteres HILANCO-GPTX modell is 4 
* most egy 7 milliárdos Llama 2 modellt tanítottunk tovább magyar nyelvre,
  majd finomhangoltuk utasításkövetésre. Az így elkészült modell
  * szignifikánsan felülmúlta az eddigi PULI modelleket.  Jelenlegi
  * tesztelhető a demóoldalunkon 5 . A folytatólagosan előtanított nagyméretű
  * elérhető a Hugging Face oldalunkon 6 

# 2. Kapcsolódó irodalom

* Llama modellek (Touvron+ 2023a,b), amelyek magas minőséget
  * megengedő licencüknek köszönhetően rendkívül elterjedtek mind a kutatók,
    mind a vállalatok körében
  * könnyen lehet belőlük akár finomhangolással, akár további előtanítással
    nagyon jó minőségű célalkalmazásokat tanítani
* concurr: SambaNova Systems 7 által tanított SambaLingo modellek (Csaki+ 2024)
  * Csaki Z, Li B, Li J, Xu Q, Pawakapan P, Zhang L, Du Y, Zhao H, Hu C,
    Thakker U
    Sambalingo: Teaching large language models new languages (2024)
  * Csaki Z, Pawakapan P, Thakker U, Xu Q
    Efficiently adapting pretrained language models to new languages (2023),
  * ugyanúgy folytatólagos előtanítással tovább tanították a Llama 2 modelleket
    más nyelvekre, köztük magyar nyelvre is
  * két mérettel is kísérleteztek, a 7 és a 70 milliárd paraméteres modellekkel
  * több mint 60 milliárd magyar szavas korpusszal tanították tovább és
  * vocab: a szótár 10%-át lecserélték olyan tokenekre, amelyek magyar
    szóelemeket is tartalmaznak
  * a tanítóadat 75%-a magyar és 25%-a angol (Csaki+ 2023)
* Alves+ (2024) folytatólagos előtanítással hoztak létre jobb minőségű
  gépi fordító alapmodellt
  * egy Llama 2 modellt tovább előtanítottak egynyelvű és párhuzamos korpon,
    majd azután végeztek utasításkövető finomhangolást gépi fordításra

# 3

* hogy a modell ne felejtse el az angol tudását, beépítettük az eredeti
  finomhangolási korpuszokat

# 4. Kísérletek és mérések

## 4.1. Folytatólagos előtanítás

* A modell kontextushosszát pozíció-interpoláció (Chen+ 2023) segítségével
  * Chen S, Wong S, Chen L, Tian Y
    Extending context window of LLMs via positional interpolation (2023),
    https://arxiv.org/abs/2306.15595
* kiértékelésünk során a 7 milliárdos SambaLingo Hungarian-Base és
  a 7 Bs SambaLingo-Hungarian-Chat modelleket is megvizsgáltuk
* Továbbá a korábbi PULI modellek közül a PULI Trio és a ParancsPULI
  * mivel ezek rendelkeznek hasonló többnyelvű háttértudással, valamint
    ugyanazon a finomhangoló anyagon tanult a ParancsPULI, mint a mi modellünk

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
    ezeket már nem vettük bele a kiértékelésbe
* promptokkal való kísérleteinket
  * nem egyértelmű, hogy egy-egy ilyen nagy nyelvi modell kiértékeléshez
    milyen módon használjunk promptokat. Ez 
  * vonatkozik mind a nyers, mind az utasításkövető modellekre. Ezeknek a nagy
* nem determinisztikusak, a paraméterbeállításokkal növelhetjük ezt a
  képességet, azonban azt tapasztaltuk, hogy ilyenkor gyakran romlik a kimenet
  * Yang+ (2023b) alacsonyabb hőmérsékletet alkalmaztak, 0,4 és 0,6 közötti,
  * Csaki+ (2024) kutatásában magasabb, 0,6 és 0,8 közötti értékeket állítottak
  * top-p értéket csak Csaki+ (2024) állították át 0,9-re, a többi paramétert,
    mint top-k, alapértelmezettnek hagyták
  * mi A kutatásunkban a középutat választottuk,
    csak a hőmérséklet értékét változtattuk 0,6-ra. Ez olyan érték, amely már
  * érdemes többször is lefuttatni a méréseket, hogy pontosabb képet kapjunk
* kétféle kiértékelést végeztünk. Az
  * első mérésünk a nyers nyelvmodellekre irányult.  Ehhez a few-shot kísérletet
    * kis módosítást vittünk véghez
    * Yang+ (2023b, 2024a) kutatásaiban fixen az első néhány promptot vették a
      tanítóanyagból
    * Zhu+ (2023) kísérlete alapján véletlenszerűen választottunk ki promptokat
      a tanítóanyagból minden egyes tesztszegmensre. Hogy megállapítsuk az
    * többféle mennyiségű prompttal kísérleteztünk
  * Következő kísérletünk a nyers modellek kiértékelése volt, amihez a few-shot
    módszert választottuk. A few-shot mérésekhez 
    * promptsablon a HuCOLA és a HuSST esetében a

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
      * helyes/helytelen és a jó/rossz címkékkel, az utóbbi jobb
    * Yang és Ligeti-Nagy (2023) kutatását vettük alapul, ahol
      a premisszát és a hipotézist szövegesen kötötték össze

  – [premissza] Ebből az következik, hogy [hipotézis] = [konvertált címke]
  – Példa: Az eladásból befolyt pénz Hepburn családjához letétbe kerül. Ebből az
    következik, hogy a bevétel Hepburn családjáé. = jó

* utasításkövető modellek kiértékelése. Ehhez a feladathoz a zero-shot módszerét
  * többféle promptot próbáltunk ki. Itt a prompt sablon kötött volt, a
  * ParancsPULI és a mi utasításkövető PULI LlumiX Instruct modellünk
    a magyarra fordított Stanford Alpaca sablonját alkalmazza, ami 
    megegyezik a Yang+ (2023b) által publikált cikkben leírt sablonnal. A
  * SambaLingo modelljei egy chat sablont alkalmaznak (Csaki+ 2024)
  * A három benchmarkra különböző promptokkal kísérleteztünk, majd amelyik a
  * A ParancsPULI és az utasításkövető PULI LlumiX Instruct modell esetében az
    „Utasítás” mezőbe tettük a kérdést megfogalmazó promptot, és az „Bemenet”
    mezőbe a kiértékelendő szöveget. A
  * SambaLingo esetében közvetlenül egymás alatt volt a kérdés és a szöveg

# 5. Eredmények és kiértékelések

## 5.1. Kvantitatív kiértékelések

* 20 promptpélda volt a legkedvezőbb a modellünk számára
* Így a továbbiakban 20-shot kísérleteket végeztünk a többi modellel is.

## 5.2. Kvalitatív kiértékelés

* Első kvalitatív kiértékelésünk egy „Tű a szénakazalban” [Kamradt 23]
  * Az ötletet az Arize AI kísérletéből 12 vettük, ezt implementáltuk újra a
  * LLMek kiértékelése különböző kontextusméretek mellett. A teszt során egy
  * A kísérlethez „A Trónok harca” könyvet használtuk fel. Ebbe véletlenszerűen
    betettünk egy bele nem illő mondatot, ami a mi esetünkben a következő volt:
    – Ezen a napon ünnepelte [város neve] város a [0-100]. évfordulóját.
    A prompt, amivel rákérdeztünk az adott mondat tartalmára, a következő volt:
    – Kizárólag a következő szöveg alapján, hanyadik évfordulóját ünnepelte
    [város neve] város? Csak egy számot adj vissza!  A teszt során 
  * a bemeneti kontextusablakot tíz részre osztottuk
  * Minden tizednek a 10, 20, 30 stb. százalékába helyeztük véletlenszerűen az
    adott mondatunkat. A kapott válasz alapján a 1. ábrán látható az
    utasításkövető PULI LlumiX Instruct modellünk eredménye. Az eredeti
    kísérletben a GPT-4 modellt kiértékelve azt lehetett látni, hogy 
  * compar
    * a GPT-4 a bemeneti kontextusablak hátsó részében gyengébben teljesíti ezt a
    * egy Claude 2.1 modell esetén ez a teljesítménycsökkenés még drasztikusabb. A
  * mi modellünknél is ezt a jelenséget várjuk, hiszen a finomhangoló promptok,
  * 16 000 tokenhossz után már egyáltalán nem találja meg a helyes választ,
  * az első oszlop, ami további elemzést igényel.
* A második kvalitatív mérésünk során azt vizsgáltuk,
  a modell válaszainak stílusa mennyire felel meg a prompt által implikált
  * elsősorban a tegező és magázó igealakok, a mondathossz, valamint a válaszban
    használt szókészlet alapján vizsgáltuk. A nyelvtani helyességet az elemzés
  1. Írj egy levelet egy hoteligazgató nevében, amelyben bocsánatot kér egy
    * Tisztelt Vendégünk! Ezúton szeretnénk elnézést kérni a nem megfelelő
  2. Kérj egy kisgyerek nevében ajándékot a Jézuskától!
    * Kedves Jézuska! Én egy 6 éves kisfiú vagyok, a nevem Bence. Szeretnék egy
      LEGO készletet karácsonyra. Tudom, hogy nagyon sok mindent kell még a
  3. Milyen szavakkal köszönt egy kislány egy ismeretlen idős férfit?
    * A kislányok általában kedvesen, szeretettel és tisztelettel köszöntik az
      ismeretlen idős férfiakat. Így például azt mondhatják: „Jó napot!",
      „Szia!", „Üdvözlöm!" vagy „Köszönöm, hogy segített!"
  4. Milyen szavakkal köszönt egy kisfiú egy ismeretlen idős nőt?
    * A kisfiú lehet, hogy így köszönti az ismeretlen idős nőt: "Üdvözlöm,
      hölgyem! Hogy van ma?" vagy "Szia! Hogy hívnak?" vagy "Hello, asszonyom!
* harmadik kvalitatív kiértékelésünk során 117, magyar kultúrával, tör-
  ténelemmel, nyelvvel kapcsolatos kérdésre adott válaszok tényszerűségét hason-
  * hármas skálán értékeltük: – 0: a promptra adott válasz teljesen helytelen –
    1: a promptra adott válasz részben helyes, de tartalmaz ténybeli
    tévedéseket, vagy helyes, de nem a legrelevánsabb választ adta .  – 2: a
    válasz tényszerű és pontos, nem tartalmaz ténybeli tévedéseket Fontos
  * nem vettük figyelembe a válasz stilisztikai jellemzőit, a nyelvi
* A PULI LlumiX Instruct a kulturális: legmagasabb átlagos pontosság (67%)
  * Különösen jól szerepelt az Irodalom kategóriában, ahol a többi modellt
  * Nyelv témakörben a PULI LlumiX Instruct modell 70%-os pontossága jóval
    felülmúlja a másik két modell alacsony, 48% és 45%-os pontosságát.
  * bizonyos témakörökben más modellek is felülmúlták a PULI LlumiX Instructot
  * Földrajz kategóriában például a ParancsPuli érte el a legjobb eredményt
    85%-kal, amely kicsit meghaladja a PULI LlumiX Instruct modell 82%-os
    teljesítményét, míg a Sambalingo itt 71%- kal szerepelt. A 
  * Történelem kategóriában a Sambalingo bizonyult a legjobbnak, 75%-os
    pontossággal, ami kicsit felülmúlja a PULI LlumiX Instruct modell 72%- os
  * Egyéb kategóriában a Sambalingo vezet, 66%-kal, míg a PULI LlumiX Instruct

|Témakör| # Kérdés|PULI LlumiX Instruct|ParancsPuli|Sambalingo|
|-------:|--------------:|--------------------:|-----------:|----------:|
|Egyéb	| 19	| 61%	| 47%	| 66%	|
|Földrajz	| 17	| 82%	| 85%	| 71%	|
|Irodalom	| 26	| 67%	| 63%	| 65%	|
|Művészet	| 14	| 54%	| 61%	| 43%	|
|Nyelv	| 22	| 70%	| 48%	| 45%	|
|Történelem	| 16	| 72%	| 41%	| 75%	| 
|           |114	| 67%	| 57%	| 61%	|
