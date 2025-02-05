Magyar nyelvű beszédleiratozó tanítása sok (tíz)ezer óra beszéddel
Dobsinszki Gergely, Kádár Máté Soma, Fegyó Tibor, Mády Katalin, Mihajlik Péter 
MSZNY 2025

* nagy mennyiségű tanítóanyag és önfelügyelt tanulás (Self-Supervised Lea, SSL) 
* kisebb, nyilvános és nagyobb, nem publikus adathalmazokon is SSL
* Az SSL kis méretű, magyar nyelvű tanító adathalmazok esetén látványos jav
* nagy, több ezer órás adathalmazon történő finomhangolás esetén is
  felgyorsította a tanulási konvergenciát, azonban a jelenlegi eredmények
  * nem múlja felül az angol nyelvű felügyelt előtanítással elért pontosságot.
* minden korábbinál nagyobb, tisztán magyar nyelvű halmazzal felügyelten
  finomhangolt modellek több független kiértékelő halmazon is
  minden korábbit megelőző pontosságot értek el.

# 1 Intro

* cross-ling ASR pretrain (Huang+ 2020)
* we: magyar nyelvű beszédfelismerésnél milyen mértékben segíthet a célzottan
  magyar nyelvű hanyaganyagokon végzett önfelügyelt előtanítás. 
  * Nagyméretű, közel húszezer órányi magyar nyelvű hanganyagon tanítottunk SSL
    akusztikus modelleket, majd 
    különféle jellegű és méretű, leiratozott hanganyagokon finomhangoltuk és
    nyilvános adatokon értékeltük ki őket.
  * összehasonlítva más, magyar nyelvre elérhető nyílt modellekkel elértekkel,
  * általánosabban használható, esetenként lényegesen magasabb beszédfelismerési
    pontosságot sikerült elérni.

# 2. Adatok

* hangfájlok tömörítésének kiválasztása. Az adatok könnyebb kezelése végett
  tarred 1 gyűjteményeket hoztunk létre az egyes fájlokból. Mivel ezek a
  * több fájlt foglalnak egyszerre magukba, így kevesebb fájlolvasásra van

## 2.1. SSL

* megismételhetőségének és az eredmények jobb hasonlíthatósága érdekében
  előnyben részesítettük a nyilvánosan elérhető adatbázisokat.
* nagyját a Voxpopuli V2 Wang+ (2021) halmaz tette ki. Ez 
  * a Meta/ Facebook Research által karbantartott halmaz 
  * több nemzet különböző nyelvű európai parlamenti felszólalását tartalmazza.
  * Hosszabb (több perces) felvételek is akadnak, de mivel 
    * az ASR rendszerek tanításához rövidebb hangszeletekre van szükség,
    * feldaraboltuk a hanganyagokat 20 másodpercnél nem hosszabb egységekre.
    * Többnyire automatikusan detektált, csendes, beszédet nem tartalmazó
      részeknél igyekeztünk a vágásokat megtenni. Továbbá, a 
  * hosszabb szüneteket kivágva csökkentettük a teljes halmaz hosszát. A végső
  * 17.470 (tizenhétezer-négyszázhetven) órányi magyar nyelvű felvételt tesz ki.
* kisebb, "házon belüli" (In House, IH) halmazt is használtunk az önfelügyelt
  * főképpen rádiós beszélgetőműsorokat tartalmaz.
  * Előkészítésénél a Voxpopuli halmazhoz hasonlóan jártunk el, csend részeknél
  * 3.36 ezer órányi anyagot kaptunk. Bár terjedelemben lényegesen rövidebb a
  * a beszéd stílusát és jellegét tekintve más területhez tartozik, így jelentős
* a Voxpopuli + IH = SSL halmazon történt minden tanítás.


## 2.2. Mozilla Common Voice (CV-16)

* Finomhangolásés kiértékeléshez a szabadon hozzáférh (Ardila+ 2019)

## 2.3. BEA

* A további finomhangolási kísérletekhez társalgási beszéd 
* A BEA (BEszélt nyelvi Adatbázis) Gósy (2013); Neuberger+ (2014) a
* spontán (monologikus és dialogikus), valamint olvasott beszédet is tartalmaz
  több egyedi beszélőtől. 
* A BEÁ-n belül a BEA-Base részhalmazt Mihajlik+ (2023) használtuk, ami
  kifejezetten beszédfelismerési modellek kiértékelése céljából készült. Az
  * kutatási célokra ingyenesen hozzáférhető.
* Az általunk tanításra használt (train-114) halmazának hossza 68 óra, validá-
  ciós halmaza (dev-spont) 3.8, teszt halmaza (eval-spont) pedig 4.75 óra

## 2.4. BNC

* Broadcast News and Conversations (BNC) adatgyűjtemény egy 
  * privát[?] leiratozott, több ezer órányi, magyar nyelvű televíziós műsorok
    hangsávját tartalmazó halmaz.
* Túlnyomó többségben többrésztvevős beszélgetéseket tartalmaznak a
* kisebb részben pedig olvasott híreket vagy beszédeket.  Felhasználása előtt a
* darabolására és normalizálására volt szükség, így biztosítva a konzisztenciát
  és összehasonlíthatóságot a többi tanító és kiértékelő halmazokkal.
* az általunk létrehozott tanítóadat hossza 2703 óra, validációs halmaza 113 óra
  és teszt halmaza 41 órányi hanganyagot tartalmaz.

# 3. Kísérletek

* hogyan tudjuk a nagyméretű beszédadatokat a legjobban felhasználni ASR-re
  beszédfelismerő tanításához. A nagy adatbázisokkal való manipuláció
* a hiperparamétereket a kisméretű CV-16 és BEA adatokon kíséreltük meg
  beállítani/optimalizálni. Ez esetekben tudatosan kerültük 
* a kiértékelő halmazokat későbbre, a nagy (BNC) halmazon történő tanítás
  kiértékelésére tartogattuk.

## 3.1. Kísérleti környezet

* Nvidia NeMo Toolkit 1.23-as verziójával végeztünk Harper+ (2023). A környezet
  * több modellarchitektúrát is támogat, multi-gpu és multi-node tanítást tesz
  * SSL tanítás is konfigurálható a segítségével.  A NeMo Toolkit 
  * támogatja a SLURM ütemező rendszert, ami segítségével az SSL tanítások
  * a Komondor szuperszámítógépen.

## 3.2. Modellek

* neur archit: legalább egy angol nyelvű előtanított súlymátrix elérhető legyen
  összehasonlításnak
  . Ezen súlyokat felhasználva tudtunk olyan tanításokat végezni melyekhez az
  SSL alapú kísérleteinket hasonlítottuk. Önfelügyelt tanításnál először egy
  általános modellt készítettünk címkézetlen adatok segítségével. Ezen
  modellből kiindulva pedig beszédfelismerési feladatra finomhangoltuk a modellt
  különböző annotált adatokat felhasználva.
A kutatásainkhoz egy konkrét akusztikus modell architektúrát kerestünk.
* Mivel az SSL tanítás egy rendkívül számításigényes folyamat, igyekeztünk re-
  latíve kis paraméterszámú, gyorsan tanítható modellt kiválasztani, szem előtt
  tartva a megfelelően magas pontosság mellett a lehetséges ipari felhasználási
  szempontokat is (véges GPU memória, számítási kapacitások, stb.). 
  * Választásunk így a NeMo toolkit-ben Harper+ (2023) kényelmesen használható
    FastConformer Large (CTC) 2 -re esett, melynek paraméterszáma kb. 121 millió
  * A Conformer architektúra Gulati+ (2020) lényegében egy transformer encoder
    * attention és előrecsatolt (fully connected) réteg mellett egy 1D
      konvolúciós réteg is megtalálható blokkonként a lokális kontextus
      hangsúlyosabb figyelembe vétele érdekében.
  * Ez az architektúra talán a legnépszerűbb az end-to-end mélyneuron-hálók ASR
  * FastConformer hagyományos 1D konvolúció helyett ún "time-channel separable"
    konvolúciót Kriman+ (2020) alkalmaz, ami voltaképpen egy 
    * paraméterés számításhatékony közelítő változata az utóbbinak.
    * kimenete a skálázható szótárméretű szótöredék (subwords unit)
      valószínűségeloszlása 80ms-onként, 
  * erre került a végső CTC Graves+ (2006) réteg/költségfüggvény. A
  * szöveges leiratáak tokenizálására a SentencePiece Kudo és Richardson (2018)
    * alapértelmezett 1024-es szótármérettel.

## 3.3. SSL tanítás

* Contrastive Baevski+ (2020) és Masked Language Modeling (MLM) Hsu+ (2021)
  * kontrasztív megközelítések esetén a modellek úgy tanulnak, hogy
    különbséget tesznek valódi és a zavaró látens reprezentációk között, míg az
  * MLM esetén kimaszkolt audio részletet az ismert (nem maszkolt) kontextusból
    kell megbecsülnie a modellnek.
* a NeMo adott verziójának alapértelmezett beállításait használtuk, csak azon
  paramétereket tüntetjük fel a továbbiakban, melyek ettől eltértek.
* 2 darab node-ot használtunk, összesen 16 darab A100 SXM4 GPU-val, GPU-nként 40
  GB VRAM-al. Node-onként 64 CPU core és 256 GB RAM állt rendelkezésre. Egy
  epoch ideje nagyjából 1 óra volt. Tanításainknál mindenhol az AdamW optimizert
  Kingma és Ba (2014), Loshchilov és Hutter (2019) alkalmaztuk.

# 4. Eredmények

* A következőkben 
  * a 2. fejezetben felsorolt halmazokon végzett SSL módon előtanított
    súlyokból kiindult tanítások eredményeit közöljük, melyek mellé 
  * az NVIDIA által előtanított angol nyelvű akusztikus modellel inicializált
    "cross-language transfer learning" eredményeket is megadjuk referenciának. 
* A magyar nyelvű SSL modelleket és az angol nyelvű (felügyelten előtanított)
  modelleket minden esetben valamely magyar nyelvű adatbázison tanítottuk tovább
  (finomhangoltuk), mely során a validációs halmazt használtuk a tanítás
  monitorozására. A végső kiértékelést az előzőektől független tesztadatokon
  végeztük.

## 4.3. SSL + BNC

* összehasonlítottuk más, magyar nyelvű neurális háló alapú leiratozó
  * BEAST2, amely limitált mennyiségű adaton, a BEA-n tanult, a BEA teszt
    halmazán legjobb eredményt elérve. A másik rendszer 
  * a szabadon hozzáférhető OpenAI által fejlesztett Whisper architektúrának 3.
    iterációja.
    * több nyelven képes leiratozni, igény szerint az elhangzott hanganyag
      alapján nyelvdetektálást is végez, és fordítani is képes. 
  * A különböző megoldások pontosságát a CV-16, FLEURS Conneau+ (2023) és BEA
    halmazokon vizsgáltuk, ezek a 4 táblázatban láthatóak.
* Mindkét megoldásunk messze felülmúlja a másik kettő megvalósítást, teszi ezt
  LM (előzetes írott nyelvi ismeretek) nélkül
  * a legkisebb paraméterszámú architektúra a három megoldás közül.
  * a BEA halmazon teljesít rosszabbul a BEAST2-es modellnél, ez 
    * magyarázható többek közt azzal, hogy a tanításhoz nem lett felhasználva
      a BEA tanítóhalmaz, így "out of domain" ez a teszthalmaz számára.
  * messze felülmúlja a Whisper large-v3 által elért eredményeket ezen a
    halmazon, mely számára szintén ismeretlen a BEA halmaz.
