Nagy nyelvi modellek által generált szövegek felismerése magyar nyelven
Kiss Mihály, Berend Gábor
MSZNY 2026

# 1 Intro

* egyre több publikációban, cikkben lehet szintetikus szöveget találni 
  (Liang+ 2024b). Korábbi kutatások kimutatták, hogy 
  * az MI-konferenciákra beküldött cikkek 6,5–16,9%-a erősen támaszkodhat
    LLM-re, vagy akár teljesen át is írhatták azokat (Liang+ 2024a).
* számos közelmúltbeli verseny és workshop hangsúlyozza, amelyek kifejezetten
  (Sarvazyanés mtsai, 2023; Wang+ 2024; Chamezopoulos+ 2024;
  Wang+ 2025)
* módszerek általában mély neurális hálózatú architektúrákra épülnek,
  * transformer alapú modellek, amelyeket finomhangolnak nagyobb, annotált
    adathalmazokon (Sarvazyan+ 2024; Marchitan+ 2024).
  * transformer modelleknek kombinálással vett valószínűségi kimenete még tovább
    javíthatja az eredm és a robusztus (Gu és Meng, 2024; Kiss és Berend, 2025)
* we:
  * magyar nyelven generált szövegek felismerésének problémáját – legjobb
    tudomásunk szerint – elsőként vizsgáljuk tudományos igényességgel, amely
  * új publikus teszthalmazt is létrehoztunk. A cikkben 
  * kettő megoldás eredményeit mutatjuk be. Az első megoldást 
    1. három publikus adathalmazból összegyűjtött szövegekre, a másikat pedig
    2. egy korábban saját szkriptekkel gyűjtött adathalmazra támaszkodva hoztuk
* metrika a fals pozitív ráta (FPR) és a fals negatív ráta (FNR). (igen = LLM)
  * FPR azt jelzi, hogy a modell milyen gyakran sorol tévesen emberi szöveget
  * FNR azt mutatja meg, hogy az MI által generált szövegek mekkora részét nem
  * legfontosabb, hogy emberi szöveget ne osztályozzunk MI-generáltnak, ezért
* by adathalmazra kapott eredmények azt mutatják, hogy
  * a publikus adathalmazon finomhangolt modellek teljesítménye nem kiemelkedő,
  * a saját gyűjtésű, kiegészített adathalmaz jóval robusztusabb és pontosabb
  * A szavaztatásos módszerek 
    a publikus adatokon nem hoztak érdemi javulást, 
    a kiegészített adatokon azonban
    csökkentették a fals pozitív rátát és növelték az F1-pontszámot

# 2. Kapcsolódó irodalom

* modellek szavaztatásával nyert (ensemble) tanulási módszerek hatékonyságát 
  (Gu és Meng, 2024; Kiss és Berend, 2025)
  * Gu és Meng (2024) finomhangolt transformer modellek szavaztatásával vett
    részt SemEval-2024 8 versenykiírásán (Wang+ 2024). Megközelítésük 
  * hatékonyan kezelte a kiegyensúlyozatlan címkék problémáját, amivel 
    kimagasló teljesítményt voltak képesek elérni.
* a standard ensemble módszerek magas számítási költséggel járnak, amelyek több
  * snapshot ensemble technika (Huang+ 2017), amely 
    a finomhangolás különböző időpontjaiban rögzíti
  * általában nem éri el a standard ensemble módszer teljesítményét.
* zero-shot módszerek (Mitchell+ 2023; Bao+ 2024). Ezen módszerek nem igényelnek
  * (nagy) generatív nyelvi modelleknek az egyes szövegekhez társított
    valószínűségek elemzésére támaszkodnak.

# 3. Adathalmazok

## 3.1. Publikus adathalmaz

* három másik nyilvános adathalmazból lett készítve mintavételezéssel. Ezek az
  * Az ember által írt szövegeket két forrásból szereztük be: egyrészt 
    a magyar Wikipedia szócikkeiből Niklaus (2023), másrészt pedig 
    a Hungarian Webcorpus 2 Nemeskey (2020) korpuszban található webes
    tartalmakból történő mintavételezésre támaszkodtunk. Ezáltal az
    * véletlenszerűen kiválasztva 5000 szöveg, egyenlő arányban. A 
  * gép által generált szövegekre vonatkozó tanítóadat
    a boapps (2024) adathalmazból származik, amelyben 
    * magyar nyelven megfogalmazott utasításokra nagy nyelvi modellek által
    * szintén kiválasztottunk 5000 szöveget, és így végső formában megkaptuk a
  * hogy sok rövid szöveg is megtalálható az adathalmazban, amelyekről
    nehezen megmondható, hogy ki írta valójában.

## 3.2. Kiegészített adathalmaz

* A modellek fejlesztéséhez egy általunk összeállított kiegészített adathalmaz
  is felhasználásra került. A saját gyűjtésű adathalmazt kiegészítettnek
* célja a publikus adathalmazban nem reprezentált szövegtípusok és nyelvi
* adatgyűjtés és annotáció teljes mértékben a saját erőforrásainkból valósult
* az adathalmaz diverz, sok témakört lefed. Ez alatt lehet érteni 
  * fórumok, esszék, tudományos cikkek, beadandókból előállított szövegeket. A
* hogy megmutassuk azt, hogy egy minőségi adathalmazon finomhangolt modell jobb
* Fig 3: A szövegek hosszára vonatkozó statisztikák a 3. ábrán láthatók.

## 3.3. Teszt adathalmaz

* A teszt adathalmaz a kiegészített illetve a publikus adathalmaz keveréke.
  * Mindkettőből 1000-1000 szöveg lett beletéve, azon belül pedig 
    500-500 darab az em-ber és az MI osztályból. Ezáltal a teszthalmaz diverz,
* A szövegek hossza a 4. ábrán látható. 
* [A teszt adathalmaz](huggingface.co/datasets/mihalykiss/Hun_ai_test)

# 4. Felhasznált modellek

* több, magyar nyelvre finomhangolt transformer alapú nyelvi modellt
  * huBERT (Nemeskey, 2021), PULI-BERT-Large (Yang+ 2023) és a
    SzegedAI/huDeBERTaMLM modellek klasszikus, maszkolt nyelvi modellezésen
  * A huDeBERTa-MLSM illetve a huDeBERTa-LSM a standard MLM helyett 
    látens szemantikus tulajdonságok modellezésére lettek tanítva
    a Berend (2024) által bevezetett megoldások szerint.
  * A huDeBERTa prefixű modellek azzal az előnyös tulajdonsággal rendelkeznek,
    * az előtanítás célfüggvényét leszámítva teljesen azonos módon lettek
      * architektúra, azonos előtanító korpusz, előtanítási hiperparaméterek
* méreteiben jelentős különbségek vannak: a 
  * PULI-BERTLarge egy 24 rétegű modell 340 millió paraméterrel, míg a
  * huBERT-base és a huDeBERTa család modelljei 12 rétegből állnak, 
    előbbi 110, utóbbi pedig 134 millió paraméterrel. A különböző modellek

# 5. Kísérletek

## 5.1. Modellek finomhangolása

* Az előző pontban bemutatott modelleket mindkét adathalmaz alapján finomhan-
  * hiperparamétereket a tanítóadattól és az modelltől függetlenül, azonos módon
  * split: minden esetben azonos módon – 80% tanító, 20% validációs
  * minden epoch végén eval egy validációs halmazon
  * 5 epochon + early stopping a validációs halmazon elért F1-pontszám alapján.
* Minden alapmodellel 3 finomhangolási kísérletet hajtottunk végre úgy, hogy a
  * osztályozásért felelős súlyait különböző véletlenszerű inicializációval
  * Egy finomhangoláson belül a validációs halmazon legjobb eredményt elérő
* input length: Mindegyik vizsgált enkóder alapmodell 512 tokenes 
  * amennyiben egy input szövegnek a hossza ezt meghaladta, úgy az utána
    következő részt levágtuk. A kísérletek során alkalmazott 
* további hiperparam
  tanulási ráta: 2e-5, lineáris tanulási ráta csökkentés, warmup ratio = 0,1.

## 5.2. Szavaztatásos megoldások

* A tradicionális szavaztatásos megoldások széles körben ismert és használt
  * az egyes modellek eredményessége és robusztussága jellemzően javítható. Ez a
  * az AI által generált szövegek felismerésére is alkalmas 
    (Abburi+ 2023; Gu és Meng, 2024)
* azonos alapmodell különböző véletlenszerű inicializációval finomhangolt vál-
  valószínűségi kimeneteit uniform módon átlagoltuk 
  * Általában ez a megoldás javulást szokott hozni az eredmények tekintetében,
  * az erőforrásigénye drasztikusan megnő, mivel több modellt kell finomhang, és
  * kiértékelés költsége is az alkalmazott modellek számával arányosan nő.

# 6. Eredmények

## 6.1. Publikus adathalmaz eredményei (Tab 1)

* a modellek nagyon közeli eredményeket produkálnak. Ettől 
  * valamelyest lemaradnak a huDeBERTa-MLM modell finomhangolásával kapott
  * A legjobb átlagos eredményt a PULI-BERT-Large modell érte el, ugyanakkor
    * a kapacitása a többi vizsgált modell kapacitásának többszöröse, így 
    * valós gyakorlatban való alkalmazása a többi finomhangolt modell
      használatához képest számottevő erőforrásigénnyel rendelkezik (egy 
    * 24 rétegből álló, 1024 dimenziós rejtett reprezentációkat alkalmazó
    * a többi vizsgált modell csupán 12 rétegből áll, és a rejtett vektoraik 768
* Fig 5: 
  * a tanulási folyamat az elején meredeken, gyorsan konvergál, és 
    a veszteség már a korai fázisokban is alacsony. Ez egy általános probléma
    ie a modell nem tanul lényeges új mintázatokat.
  * A szavaztatásos módszerek ebben az esetben nem hoztak érdemi javulást.
  * ie a publikus korpusz nem tükrözi a magyar nyelvű szövegek heterogenitását,
    és nem tartalmaz elég nehezen osztályozható példát. 
* Tab 2: A szavaztatásos módszerek eredménye a publikus adathalmazra a 2.
  * A fals pozitív rátán (FPR oszlop) a legtöbb esetben segített a szavaztatás,
    * kritikus érték ebben az osztályozási feladatban.

## 6.2. Kiegészített adathalmaz eredményei

* A kiegészített adathalmazon kapott eredmények jelentősen felülmúlják a
  publikus adatok használatával mért értékeket. A 
  * legjobb eredményt önálló modellként a huDeBERTa-MLSM érte el 0,905 F1
  * további eredmények a 3 táblázatban láthatóak
* A veszteségfüggvények viselkedése a kiegészített tanítóhalmazon történ
  finomhangolás esetén jelentősen eltér a korábban látottaktól, ahogy azt az 5
  és a 6. ábrák összevetése is jól mutatja. Míg a korábbi esetben látott
  veszteségfüggvény-értékek nagyon hamar 0 környékivé váltak, addig ebben az
  esetben a 
* veszteségfüggvény csak később kezd el csökkenni, ami azt jelzi számunkra, hogy
  * ie a modell sokkal komplexebb példákat kapott
* szavaztatás: minden modell esetében javulást eredményezett az F1-pont (Tab 4)
  * legjobb teljesítményt nyújtó modellnek a szavaztatást követően is a
    huDeBERTa-MLSM modell bizonyult, csakúgy mint az önálló eredményeknél. Az is
  * a szavaztatás minden esetben képes volt a fals pozitív ráta csökkentésére. A
  * ie kiegészített adathalmaz sokkal inkább tekinthető valós felhasználásra
  * a magyar nyelvű szövegek jellemzőit jobban reprezentálja, amelyet a modell

## 6.3. Külső (kereskedelmi) detektor eredményei

* összevetettük több piacon elérhető detektorral2 
  https://preds.hu, https://pangram.com, https://zerogpt.com
  * mindegyik támogatja a magyar nyelvet. API hívásokon keresztül küldtünk ki
* Tab 5: eredmények, amelyről elmondható, hogy a kereskedelmi detektorok közül
  * egyedül a Preds modellje ért el az általunk bemutatottaknál jobb eredményt,
  * ennek a modellnek a legalacsonyabb a fals pozitív rátája is.  
* az _Összegzés_-ből:
  * a kereskedelmi megoldások várhatóan jóval nagyobb és diverzebb tanítóadaton
  * a problémára optimalizált hiperparaméterekkel és megoldásokkal
