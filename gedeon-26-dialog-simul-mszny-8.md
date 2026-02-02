Mesterséges párbeszédek, valós eredmények –
  dialógus-szimuláció a pontosabb leiratozásért
Gedeon Máté 1,2 , Mihajlik Péter 1,3
MSZNY 2026

# Kivonat

* A spontán, több-beszélős beszélgetések pontos gépi leiratozása
  továbbra is komoly kihívást jelent a beszédfelismerő rendszerek számára,
  különösen olyan nyelveken, ahol korlátozott a párbeszédes tanítóadatok
* we: párbeszéd-szimuláció magyar nyelvű megvalósítása volt, amely képes
  * a valós beszélgetésekre jellemző egyéni időzítési mintázatok reprod. A
  * alapját a BEA-Large korpusz egyszereplős felvételei képezték, amelyekből
  * statisztikai modellezés
    * kernel-alapú sűrűségfüggvény-becslés és Markov-lánc) segítségével
      generáltunk kétbeszélős, valósághű időzítésű szimulált párbeszédeket. A
      * a CallHome és a BEA-Dialogue természetes beszédkorpuszokból kinyert
        eloszlásokat alkalmaztuk, és
  * megvizsgáltuk a térszimuláció hatását is
  * Az így előállított szintetikus adatokkal kiegészített tanítóhalmazzal
    finomhangolt Fast Conformer CTC modellek
    következetesen javuló teljesítményt mutattak, mind szószintű, mind char
* ie a beszélőfüggő párbeszéd-szimuláció hatékony módszer a magyar nyelvű,
  több-beszélős beszédfelismerés teljesítményének javítására

# 1 Intro

* egymásra beszélés, vagy a közbeszólások megnehezítik (Yu+ 2016; Kanda+ 2020)
  * gyors beszélőváltás
  * azok a modellek, amelyeket elsősorban tiszta monológokat tartalmazó
    beszédanyagon tanítottak, gyakran nehézségekbe ütköznek
* Robusztus, több-beszélős modellek tanításához
  nagy mennyiségű, párbeszédes stílusú hanganyagra van szükség
  * Magyar nyelven azonban ilyen adatból komoly hiány mutatkozik, mivel
* beszélgetések szimulálása, pontosabban új párbeszédek létrehozása
  különálló, egybeszélős felvételek egymásután helyezésével. Mára bevett
  * figyelembe venni, hogy általában az emberek mekkora szüneteket tartanak
    mondataik között, vagy
  * mennyire hajlamosak a másik szavába vágni (Landini+ 2022). A gyakorlatban ez
  * statisztikai modellekkel történik, amelyek a természetes beszélgetések
    mintázatait – például a megszólalások közti szünetek hosszát vagy az
    átfedések gyakoriságát – próbálják reprodukálni. A legtöbb
  * hE korábbi megközelítés a beszélőket egymással felcserélhetőnek tekinti
    * elveszítik a valós beszélgetések szereplőire jellemző egyéni sajátos
* beszélőfüggő párbeszéd-szimuláció (speaker-aware conversation simulation)
  * Gedeon és Mihajlik (2025a) koncepciója. Ennek alapgondolata, hogy
  * minden beszélő őrizze meg a saját, jellemző mintázatait – hasonlóan ahhoz,
  * angol nyelvű dialóguskorpuszokon végzett kiértékelések azt mutatták, hogy a
    * sokkal jobban közelíti a valós beszélgetések mintázatait
      számos metrika szerint, mint a korábbiak
* we: magyar
  * Vizsgálatunk a BEA-Large korpuszon (Gedeon+ 2025) alapul, ami
    egyszereplős felvételekből áll. Ez ideális alapanyagot biztosít a módszertan
  * számos különböző magyar beszélő nagyszámú megszólalása, amelyekből realisz-
  * Az így előállított adathalmazt a BEA-Dialogue korpusszal (Gedeon+ 2025)
    együtt használjuk beszédfelismerő modellek tanítására, majd
  * a BEA-Dialogue kiértékelési halmazán hasonlítjuk össze a különböző
    konfigurációk teljesítményét

# 2 Adatok

## 2.1. BEA-Large

* A BEA-Large a BEA magyar beszélt nyelvi korpusz egy részhalmaza, amely
  * 433 beszélő többnyire spontán beszédét tartalmazza, ezzel
  * megfelelő alapot nyújt a magyar spontán beszédre épülő beszédfelismerő
    rendszerek kutatásához és összehasonlító értékeléséhez (Mády+ 2024)
* Tanulmányunkban a BEA-Large azon beszélőinek felvételeiből szimuláltunk,
  akik nem szerepelnek a BEA-Dialogue validációs és kiértékelési halmazaiban
  * 240 beszélő összesen 58 ezer megszólalását tudtuk felhasználni, körülbelül
    70 órás összidővel

## 2.2. BEA-Dialogue

* A BEA-Dialogue a BEA korpusz spontán párbeszédeket tartalmazó része, amely
  * 85 órányi természetes magyar beszélgetést foglal magában. Az adatok
  * beszélő-független bontásban, és kifejezetten a párbeszéd-alapú
    beszédfelismerés és a beszélőszegmentálás (diarizáció) kutatásához
  * eredeti formájában használtuk fel a kísérletekhez,
    * tanítás esetén a szimulált adathalmazt a BEA-Dialogue tanító halmazához
    * kiértékeléshez pedig csak a BEA-Dialogue megfelelő részét használtuk

# 3 Módszertan

## 3.1. Beszélőfüggő párbeszéd-szimuláció

* A beszélőfüggő párbeszéd-szimuláció (SASC, Speaker-Aware Conversation Si-
  mulation, Gedeon és Mihajlik, 2025a)
  * olyan több-beszélős (tetszőleges számú) beszélgetéseket generál, amelyek
    időbeli, szerkezeti és akusztikai tulajdonságai valós beszélgetések
    alapján vannak modellezve
  * A beszélőváltásoknál tartott szüneteket illetve átfedéseket egy δ változó
    írja le, ahol δ < 0 átfedést (overlap), δ ≥ 0 szünetet jelez, és a negatív
    tartomány feletti integrál az átfedés valószínűségének, p overlap -nek felel
    meg (2. ábra)
  * Hisztogram-alapú megközelítések helyett
    kernel-alapú sűrűségfüggvény-becslést (KDE, Kernel Density Estimation)
    alkalmazunk, hogy a szünetek eloszlásáról folytonos becsléseket kapjunk. Az
    időzítésbeli konzisztencia érdekében
  * két eloszlás kerül meghatározásra:
    D̂ = azonos beszélő közötti átlagos szünetekre (amikor nincs beszélőváltás),
    D̂ ̸ = különböző beszélők közötti átlagos szünetekre
  * Minden s beszélő esetén egy kezdeti bázisérték (µ) kerül mintavételezésre a
  * az azt követő szünetek egy eltérés (v) hozzáadásával adódnak:
    δ n = ( µ s same  + v ha X n = X n−1 , v ∼ V = ,
            µ s diff  + v ha X n ̸ = X n−1 , v ∼ V ̸ =
  * V = és V ̸ = nulla várható értékű beszélőnkénti "eltérés-eloszlások", amelyek
    szintén az adatok alapján kerültek becslésre
  * A beszélőváltás egy elsőrendű Markov-lánccal kerül modellezésre, ahol
    az átmeneti mátrix P turn adja meg annak valószínűségét, hogy az előző
    beszélő után ki következik
  * Az összes beszélő ugyanabban az akusztikus környezetben helyezkedik el:
    * egy szoba kerül kiválasztásra a rendelkezésre álló RIR-ek (Room Impulse
      Response, "teremben felvett impulzusválasz") közül, majd
      minden beszélőhöz egyedi pozíció rendelődik a szobán belül

## 3.2. Statisztikák készítése

* három fő statisztikára van szükség:
  * azonos beszélő megszólalásai között tartott szünetek,
  * beszélőváltás esetén tartott szünetek,
  * beszélőváltás valószínűsége
* Ezek kinyeréséhez két adathalmazt használtunk fel:
  * az angol telefonbeszélgetéseket tartalmazó CallHome korpuszt (Canavan+ 1997)
  * a BEA-Dialogue tanítóhalmazát
  * A CallHome esetén egy angol nyelvű szimulált adatbázis létrehozása közben
    megfigyeltük (Gedeon és Mihajlik, 2025b), hogy
    a publikusan elérhető annotációk pontatlanok annak tekintetében, hogy az
    elhangzott szövegek pontosan mikor hangoztak el, ami kulcsfontosságú
    ~> Voice Activity Detection (VAD) modellel újraannotáltuk ezeket és az így
  * magyarra is a Silero VAD (Team, 2024) modelljét használtuk fel erre a célra
  * a korpusz sztereóban, mindkét beszélőt külön csatornán van tárolva, így
    ~> könnyen kinyerhetőek a szükséges statisztikák
* Hogy legyen olyan statisztika is, amit magyar beszédből nyerünk ki, a BEA-
  Dialogue tanítóhalmazát is felhasználtuk
  * Az annotációk esetén itt is pontatlanságokat fedeztünk fel, ennek legfőbb
    * a szavak/egységek elhangzási időpontjai érintették egymást, tehát az
  * az elérhető annotációk felülvizsgálatára volt szükség. Ebben az esetben ezt
  * nehezítette, hogy egy sávra lett rögzítve minden beszélő, ezért nem volt
    ~> többlépéses megközelítésre volt szükség
    * egy szinkronizáló (Montreal Forced Aligner, McAuliffe+ 2017) modellel
       meghatároztuk az elhangzott szavak (leirat alapján) időpontját. Mivel
    * szavak menti határokat kaptunk és
    * hE a statisztikákhoz nagyobb (pl. mondatszintű) egységek az ideálisak,
    * ~> egy írásjel-visszaállító modell 1 segítségével visszafejteni
        https://huggingface.co/oliverguhr/fullstop-punctuation-multilang-large
* Mindkét adathalmaz esetén a használt eloszlásokat
  kernel-alapú sűrűségfüggvénybecslés segítségével határoztuk meg,
  α = 0,1 kernel-paraméterrel. Az így kapott eloszlásokat a
  Fig 1. mutatja az azonos beszélők közti szünetek esetén,
  Fig 2. pedig a beszélőváltások esetén


## 3.3. Adathalmazok létrehozása

* a BEA-Large azon beszélőinek felvételeiből dolgoztunk,
  akik nincsenek benne a BEA-Dialogue validációs vagy kiértékelő halmazaiban
  * párokat képeztünk, mégpedig úgy, hogy egy adott beszélő pontosan két
    párosnak legyen tagja, így próbálva egyensúlyozni a minél nagyobb
    létrehozható adathalmaz és a beszélők túlhasználtsága között
* A mondathosszúsághoz hasonló egységekre szűrtünk: a 2–10 másodperc közötti
  * minden beszélőpárhoz a lehető leghosszabb szimulált párbeszédet állítottuk
  * egy Markov-lánc segítségével iteratívan határoztuk meg, hogy
    egy n szegmensből álló beszélgetéshez hány felvétel szükséges az A és B
  * n értékét addig növeltük, amíg meg nem találtuk
    a legnagyobb olyan számot, amelyhez mindkét beszélőtől elegendő felvétel
  * Az egyes beszélők felvételeinek eredeti sorrendjét megtartottuk, hogy a
    szegmensek koherensek maradjanak
* két verziót hoztunk létre. Az
  * egyikben a párbeszédek 40%-ára térszimulációt alkalmaztunk Gedeon és
    Mihajlik (2025b) módszere alapján, míg
    a másik egy natúr változat volt
  * A kísérleteket mindkét verzión elvégeztük

# 4 Kísérletek bemutatása az eredményekkel együtt

## 4.1. Előkészítés

* azonos módszertant alkalmaztunk, mint a BEALarge cikkjében (Gedeon+ 2025)
  * 30 másodperces szegmensekre történő bontásával kezdődött, majd
    ezeken belül a beszélőváltásokat egy speciális (<sc>) tokennel annotáltuk
    Utóbbiakat a tanítások közben is használtuk, így
    a finomhangolt modellek esetén ezek megtanítása is cél volt.  A modellek
  * NVIDIA NeMo (Kuchaiev+ 2019) keretrendszert használtuk. Az
  * Fast Conformer Large CTC (Rekesh+ 2023) modellt finomhangoltunk az összes
    * itt is az eredeti cikk módszertanát követtük és egy
  * NVIDIA RTX 5000 Ada Geneneration GPU-n futottak, 16-os batch mérettel

## 4.2. Eredmények

* A párbeszédek leiratozásánál előfordulhat, hogy a modellek
  helyesen ismerik fel az elhangzott szöveget, azonban
  felcserélik a beszélők szerinti hozzárendelést,
  például amikor az A: "Aha." és B: "Szuper." megszólalások részben átfedik
  * a modell kimenete egyaránt lehet "Aha.  <sc> Szuper." és "Szuper. <sc> Aha."
* error rate-ek  csak egy sorrendet kezelnek helyesen, jóllehet a tartalmi
  * A hagyományos WER (Word Error Rate, szószintű hibaarány) és
  * CER (Character Error Rate, karakterszintű hibaarány) metrikák ilyen
  ~> a táblázat a cpWER és cpCER értékeket is tartalmazza, amelyek
  minden lehetséges megszólalás-permutációra kiszámítják a hibát, és a legkisebb
  * scAcc mutató azt jelzi, hogy a modellek a szegmensek hány százalékában
    azonosították helyesen a beszélőváltások számát
* Tab 1 dev result, 2 eval result
  * A szimulációs konfiguráció azt jelöli, hogy
    * a CallHome vagy a BEA-Dialogue korpuszból kinyert statisztikák szolgáltak-e
    * alkalmaztunk-e térszimulációt (RIR) a felvételek 40%-án, ahogy azt a Sec 3.3
  * Az fc_base modell
    angol súlyokból 3 került inicializálásra (ahogy az összes Fast Conformer)
    majd a BEA-Dialogue tanítóhalmazán lett finomhangolva. A táblázat
  * két referenciamodell eredményeit is tartalmazza, amik esetében
    a BEA-Dialogue tanítóhalmazát olyan szimulált adathalmazzal egészítettük ki,
    amihez nem használtuk a kinyert statisztikákat:
    * fc_naivesim: statisztikák használata helyett fix, 0,25 másodperces szünetek
    * fc_nosim: a szimulációhoz kiválasztott megszólalásokat egymástól függetlenül
      adtuk a modellnek (összefűzés és így <sc> token nélkül), így a modell
      jellemzően rövidebb mintákon és több iteráción keresztül tanult
      * A BEADialogue tanítóhalmazában megtartottuk az <sc> tokeneket, így ez a
        modell is képes a beszélőváltások jelölésére
  * A statsim jelzésű modellek esetében szintén ugyanabból az angol alapmodellből
    nL a BEA-Dialogue tanítóhalmazát (kb. 67 óra) a bemutatott szimulációs
    eljárással generált adatokkal (kb. 108 óra) egészítettük ki. A
  * CH+BEA statisztika a két különböző statisztikával szimulált adathalmazok
    összességét jelölik, így ott a szimulált halmaz mérete kétszeres
* mindkét halmazon jelentős javulást eredményezett a nagyobb mennyiségű tanító
  * akkor is, ha ehhez nem használtunk semmilyen statisztikai információt
  * további javulást hozott a statisztikai modellezés alkalmazása. A
  * térszimuláció hozzáadása minden esetben enyhe teljesítményromlást okozott,
    * a felvételek stúdiókörnyezetben készültek, így az akusztikai feltételek
      nem voltak eléggé diverzek ahhoz, hogy az ilyen típusú augmentáció előnyt
  * A BEA statisztikái alapján szimulált adathalmazok mindkét esetben jobb
    eredményt mutattak, mint a CallHome-ból származó szimulációk. A
    * legjobb a két szimulációs eljárás kombinálásával egyesítettük az
  * ha az eredeti konfigurációtól eltérve nem két, hanem
    öt párosban szerepeltetünk minden beszélőt, akkor a modell romlik
    * ie a két statisztika alapján végzett szimuláció egyesítése nem pusztán a
      tanítóadat mennyiségének növekedése miatt kedvező, hanem azért is, mert
      ilyen módon nagyobb diverzitás kerül a statisztikákba
* A dev halmazon az scAcc mutató enyhe romlást mutatott, míg
  az eval halmazon vegyes tendenciák figyelhetők meg:
  egyes konfigurációkban kismértékű javulás, másokban mérsékelt romlás
  * a WER és CER értékek alapján legjobb modell scAcc-ban nem a legerősebb

# 5 Összegzés

* a beszélőfüggő párbeszéd-szimuláció magyar nyelvű megvalósítását és
  hatását beszédfelismerő rendszerek teljesítményé- re. Célunk az volt, hogy a
  * korlátozott magyar párbeszédes adatforrások problé- máját enyhítsük olyan,
  * egyszereplős felvételekből generált mesterséges párbeszé- dek segítségével,
    amelyek a beszélők egyéni időzítési sajátosságait is megőrzik
* A szimulációs folyamat során a BEA-Large korpusz egyszereplős felvétele- it
  * mind a CallHome, mind a BEA-Dialogue adathalmazból származó statisztikákat
    alkalmaztuk a szünetek, beszélőváltá- sok és átfedések modellezésére. A
  * kernel-alapú sűrűségfüggvény-becslés és elsőrendű Markov-lánccal határoztuk
    meg. Az így elő- állított,
  ~> 240 párbeszédet tartalmazó szimulált korpusz két változatban készült el:
  térszimulációval (RIR) és anélkül, hogy a módszer robusztusságát több konfigu-
* Eredményeink azt mutatták, hogy a szimulált párbeszédekkel kibővített taní-
  * következetesen javította a modellek teljesítményét
    mind a WER/CER, mind pedig a cpWER/cpCER mutatók tekintetében,
    függetlenül attól, hogy a szimuláció alapjául mely statisztikák szolgáltak
  * A statisztika-alapú szimuláció előnyt biztosított a pusztán adatnöveléshez
  * a térszimulá- ció hozzáadása enyhe romlást eredményezett
  * A BEA-Dialogue alapján generált minták mindkét adathalmazon jobbnak
  * a két statisztikai forrás egyesítése hozta a legerősebb eredményeket, ami
    * nem csupán az adatmennyiség növelése, hanem a statisztikai diverzitás
* jövőbeli: a statisztikák mélyebb elemzése, javítása, illetve >2 beszélő
