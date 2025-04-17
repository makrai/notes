# Abstract

* A szóalakok helyett fogalmi egységek mentén előtanított nyelvi modellek
  * több korábbi munka csupán finomhangolhatóságuk szempontjából vizsgálták
  * we: a nyelvi modellezés elvégzésére gyakorolt (negatív) hatását mutatjuk
* javaslunk két módszert is, amelykel a modellek LM képességei javíthatók
  a fogalmakra való érzékenységének megtartása mellett
  * a konklúzióból: egyike (SM-MLSM) azt is lehetővé teszi, hogy az LM
    előtanításának megkezdésekor ne kelljen rendelkezésünkre állnia egy
    betanított már átesett segéd nyelvi modellnek

# 1 Intro

* maszkolt látens szemantikus modellezés (MLSM)
* A korábban javasolt látens szemantikus tulajdonságok mentén történő előtanítás
  * egy már előtanításon átesett segéd nyelvi modellre támaszkodik. Azon túl,
  * szótárának szükségképpen a segédmodell szótárával megegyezőnek kell legyen,
* Jelen cikk: olyan kiterjesztései a MLSM előtanításnak, amely segítségével
  * a modellek a tokenek fogalmi csoportosításán túlmenően a konkrét maszkolt
    nyelvi modellezési feladat ellátására is képesek. A javasolt új módszerek
  * az egyik nem igényli egy már korábban betanított nyelvi modell meglétét

# 2. Kapcsolódó munkák

* BERT (Devlin+ 2019) modell létrehozása során lefektetett
  * szótöredékek véletlenszerűen kiválasztott 15%-a alapján hajtja végre az
* számos alternatíva (Joshi+ 2020; Levine+ 2021; Yang+ 2023)
* Wettig és mtsai (2023) az inputszekvencia 15%-ára irányuló kiválasztási
  stratégiát vizsgálta, és azt találták, hogy érdemes az inputban található
  tokeneknek a megszokottnál nagyobb hányadát rekonstruálandó tokenként
  kezelni
* Berend (2023) egy olyan előtanítási feladatot vezetett be, amely során a ta-

# 3. Vizsgált módszerek

## 3.1. Maszkolt nyelvi modellezés (MLM)

* kategorikus keresztentrópia hibatagot használjuk annak számszerűsítésére,

## 3.2. Maszkolt látens szemantikus modellezés (MLSM)

* első előkészítő lépése a segédmodell h-dimenziós rejtett állapotaiból
  mintavételezéssel létrehozott X ∈ R h×n mátrixra támaszkodik, amelyre
  megkeressük (1) optimumát, és amely alapján egy korábbiakban nem látott x i ∈
  / X rejtett reprezentációval rendelkező vektorra a D ∈ R h×k mátrixot már
  ismertnek tekintve (2)-vel határozható meg annak látens szemantikus
  jellemzését előállító α i ∈ R k ≥0 vektora
* A λ regularizációs tag azt eredményezi, hogy
  * az α i -beli együtthatók többsége pontosan 0 lesz, míg
  * a nemnulla együtthatók pozíciói olyanok lesznek, hogy azok – a kísérleteink
    által is a későbbiekben alátámasztott módon – nagyfokú együttállást mutatnak
    a szemantikus tulajdonságaikkal

## UT-MLSM: Utólagos tanításon átesett maszkolt látens szemantikus modellezés A

* kváziszimbolikus látens szemantikus tulajdonságok segítségével előtanított

## SM-MLSM: Segédmodellmentes maszkolt látens szemantikus modellezés A

* nem igényli egy az előtanítás megkezdésének pillanatában már rendelkezésre ál-
  ló betanított neurális nyelvi modell létezését. A segédmodellmentes maszkolt
* a maszkolt nyelvi modellezés és a látens szemantikus kategóriák kialakításának
  alternáló végrehajtásának az elvét követi
* 4.1-ből: egy többfeladatos tanulási problémaként értelmezhető
* véletlenszerű súlyokkal inicializált neurális nyelvi modellből indul ki,
  majd az előtanítás során elvégzendő lépések számának az első meghatározott
  (esetünkben 12, 5%-nak választott) lépésében kizárólagosan a klasszikus
  maszkolt nyelvi modellezés feladatát látja el
  * Az előtanítás a hiperparaméterben meghatározott darabszámú kisebb
    előtanítási szakaszból áll, és
  * minden egyes szakasz végén, az adott szakaszban meghatározott utolsó 200
    kötegben előfordult tokeneknek a transzformer modell utolsó rétegében
    előálló rejtett vektorai alapján egy (1)-ben található alakú optimalizálás
    problémát old meg annak érdekében, hogy
  * a következő előtanítási szakaszban – a klasszikus MLM feladat mellett
    – a látens szemantikus tulajdonságok modellezésére vonatkozó előtanítási
    feladatot is el tudja látni a modell a frissített szótármátrixszal
* a maszkolt nyelvi modellezés és a látens szemantikus tulajdonságokra
  támaszkodó modellezésből jövő veszteség egymáshoz való viszonyát az
  előtanítás előre haladtával szakaszosan változtatjuk. A legelső szakaszban
  kizárólagosan csak a maszkolt nyelvi modellezésből jövő veszteségfüggvényt
  vesszük figyelembe a modell frissítése során, míg a következő szakaszokban
  * a maszkolt komponens azonos ütemben csökkenve egyre kisebb szerephez jut,
  * az előtanítás végére elérve egy előzetesen meghatározott arányt
    (kísérleteink során 0, 25-et)

# 4. Kísérletek

## 4.1. Az előtanítás

* szekvenciahosszát 128 szubtokenben maximalizáltuk, 16-os gradiens akkumuláció
  mellett 64-es kötegméretet, valamint 1e–4 maximális tanulási rátát
  alkalmaztunk. A
  * maszkolásra kiválasztott tokenek arányát megemeltük 0,15-ről 0,25-re,
    összhangban (Wettig+ 2023) ajánlásaival. Minden elkészült modellünknek
    elkészítettük az előtanítási lépéseinek 10%-a, 25%-a, 50%-a, valamint 100%-a
    után előálló változatát. Az előtanítást miden esetben a huBERT (Nemeskey,
    2021) tokenizálójára és a Webcorpus2.0(Nemeskey, 2020) szövegeire
    támaszkodva végeztük el. A korpusz hozzávetőlegesen 16 Md tokenből áll
### UT-MLSM előtanítások

* Saját UT-MLSM modellünk létrehozása során 
  Berend (2024) publikus, MLSM módszerrel előtanított DeBERTa (He+ 2021)
  modelljéből  indultunk ki
* Mivel az UTMLSM modell esetén a kiinduló modell súlyai lefagyasztva,
  és éppen arra voltunk kíváncsiak, hogy az eredeti modell által visszaadott
  látens szemantikus tulajdonságokra vonatkozó tokenreprezentációk mennyire
  alkalmasak a maszkolásos nyelvi modellezési feladat hatékony megtanulására,
  ebben az esetben mindössze 10000 előtanítási lépést hajtottunk végre, ami a
  Webcorpus2.0 körülbelül 7,5%-ának felel meg

### SM-MLSM és tradicionális MLM előtanítások

* a modellek nem egy már korábbi előtanított modell továbbtanításiból jöttek
  ~> az előtanításra fordított frissítési lépéseink számát százezerre
  * hozzávetőlegesen tizenkétmilliárd token
    (a Webcorpus2.0 hozzávetőlegesen háromnegyede)
  * A tradicionális MLM modell 3 előtanításra vonatkozó hiperparamétereink nem
    tértek el a korábban megadottaktól, míg
  * a segédmodellmentes MLSM modell 4 számára specifikus hiperparaméterek a
    következők szerint alakultak: a szótármátrix frissítését 12500 lépésenként
    (a teljes előtanítás ideje alatt tehát összesen 8 alkalommal) végeztük el,
    az alkalmazott látens kategóriák számát a modell rejtett vektorainak
    dimenziószámának kétszeresére (1536-nak) választottuk, és a maszkolásos
    nyelvi modellezés veszteségfüggvényének relatív súlya az előtanítás végére a
    0,25-ös értéket vette fel. Az SM-MLSM előtanítás tulajdonképpen
    * Az aggregált veszteségfüggvényünk egyes komponenseinek alakulását Fig 1

## 4.2. A modellek maszkolt nyelvi modellezési képességei

* fig 2: A modellek tanítására nem használt fejlesztési korpusz mentén a
  különböző módon előtanított modellek átlagos veszteségfüggvényértékét közöljük
* Az UT-MLSM modell esetén egy már előzetesen 100 ezer előtanítási lépésen
* 1. ábra [valójában 2.]: az előtanítás során a tokenek látens fogalmi
  tulajdonságait is figyelembe vevő modelljeink maszkolt nyelvi modellezési
  képességei összehasonlíthatók a kizárólag a maszkolásos nyelvi modellezési
  feladat ellátását elvégezni képes tradicionális MLM módon előtanított
  modellével
* Az UT-MLSM modellel már a Webcorpus2.0 kevesebb, mint 1%-ának a
  fölhasználásával nemtriviális nyelvi modellezési képességekre tett szert (4.0
  * ie a huDeBERTa-MLSM modell által előzetesen megalkotott látens fogalmi
    hierarchiája hasznos kiindulási alapot tudott biztosítani az MLM-képességhez

## 4.3. Jelentésegyértelműsítési eredmények

* huWSD jelentésegyértelműsítési feladaton elért eredményeket. A nyelvi
* fig 3.a: erős baseline: az egyes ismert jelentéskategóriákhoz egy-egy
  centroidot rendelünk az adott kategóriába tartozó tanítóhalmazbeli szavakhoz a
  nyelvi modell által rendelt rejtett reprezentációkból, és tesztelés során egy
  egyszerű legközelebbi szomszédsági elven döntünk (Loureiro és Jorge, 2019). Az
  * a modell utolsó rétegéből jövő rejtett állapotok, illetve
  * mindegyik modell kifejezetten magas pontosság elérésére képes
* fig 3.b
  * konkrétan magára a modell kiementén produkált eloszlásvektorokra hagyatkozva
    * kevésbé gyakori megközelítés
    * a modellezést a kváziszimbolikus látens szemantikus fogalmi tulajdonságok
      mentén (is) elvégző előtanítási módszerek esetén kínálja magát
    * a modell belső rejtett reprezentációi helyett
  * legközelebbi szomszédság megítélését az Hellinger-távolság kiszámolásával
  * a látens tulajdonságokat alkalmazó modellek ebben a fajta kiértékelésben
    sokkal jobb teljesítmény elérésére voltak képesek a látens szemantikus
    tulajdonságokat az előtanítás során figyelembe nem vevő társaikhoz képest

## 4.4. Finomhangolásos eredmények

* opinhubank (Miháltz, 2013) szentimentosztályozási feladatán elért
* A modelleket 5 alkalommal finomhangoltuk, és közöljük az egyes modellek mentén
  kapott pontosság átlagát (4a), valamint a független finomhangolással
  létrehozott modellek szavaztatásával kapott eredményeinket (4b) a különböző
  módszerrel előtanított neurális nyelvi modelljeinkre. A kapott finomhangolási
* minden eredmény összehasonlítható, vagyis a javasolt módosításokkal is a
  finomhangolásra nézve jól teljesítő nyelvi modelleket kaphatunk
