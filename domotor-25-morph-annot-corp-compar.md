A méret a lényeg? Morfológiailag annotált korpuszok összehasonlító kiértékelése
Dömötör Andrea, Indig Balázs, Nemeskey Dávid Márk
MSZNY 2025

# Abstract

* A korpuszok legjellemzőbb tulajdonsága: a méretük, az annotációk minősége
  * Minőség alatt elsősorban konzisztenciát értünk: azt mérjük, hogyan teljesít
    a korpusz egy részén betanított modell a korpusz egy másik részén.
* ELTE DH gold standard korpusz, NYTK-NerKor, Szeged Treebank) vizsgáltuk, hogy
  * mekkora az elég nagy korpusz?
* standard címkekészleteket követnek, kézenfekvőnek tűnt a kombinálásukkal is
  kísérletezni, így ugyanis a nagyobb méret mellett nagyobb műfaji
  változatosságot is elérhetünk. Eredményeink szerint
* result
  * nem a korpuszok mérete a volt döntő szempont a teljesítményben,
  * a korpuszok vegyítése pedig még rontott is az eredményeken
    az annotációs sémák eltérő értelmezései miatt.
* az Összegzésből: future
  * különböző korpuszok annotációs sémáinak egységesítésére, különösen egy
    olyan nemzetközi szabvány esetén, mint a Universal Dependencies. Ugyanakkor
  * nincs feltétlenül szükség a meglévőknél nagyobb annotált korpuszokra, így
    az is elfogadható irány lehet, ha hagyjuk, hogy az egyes korpuszok
    megőrizzék az "egyéniségüket", aminek az emMorph elemzési réteg jó tere
    lehet.

# 1

* különböző korpuszok együttes használatának lehetősége is. Ez korábban a
  * névelem-felismerésben jól működő módszer (Simon és mtsai, 2022), így a
* mind a szótövesítés, mind a morfológiaielemzés jóval szubjektívebb feladat a
  névelem-annotálásnál. Emiatt erősen kérdéses, hogy az elvileg kompatibilis

# 2. Kapcsolódó munkák

* UD korpuszok vegyítése
  * Straka és Straková (2017) a UDPipe 1.1-es verziójának kiértékelése kapcsán.
  * számos nyelvre többféle UD korpusz is létezik
  * ezekkel külön-külön és vegyítve is végeztek tanításokat.
  * jobb eredményt értek el, ha a tanításhoz csak egy korpuszt használtak fel,
  * A kisebb korpuszok esetén részletesebb kísérleteket is végeztek a taní-
  * Az eredményekben csak azokat a korpuszokat jelenítették meg, ahol a más
    korpusz adataival való bővítés jobb teljesítményt eredményezett a függőségi
    * 12 korpusz ógörög, cseh, angol, francia, olasz, latin, szlovén és svéd
      * POS-tagelés 6, a morfológiai jegyek meghatározása 4, a szótövesítés
        pedig 7 esetben volt sikeresebb a bővített korpuszok esetén.
  * ie még a kis korpuszoknál sem bizonyult egyértelműen jó ötletnek. A szerzők
    * a korpuszok annotációinak inkonzisztenciájával magyarázzák
* A UD korpuszok annotációinak eltéréseit vizsgálja Wisniewski és Yvon (2019),
  elsősorban angol és francia nyelvű treebankeken (mivel ezekből elég sok van).
  * eltérések detektálására Boyd és mtsai (2008) módszerét használták, mely
    * ha két azonos szekvencia máshogy van annotálva, akkor valamelyik
      szekvencia vélhetően inkonzisztens. Inkonzisztenciák természetesen
  * előfordulhatnak (és elő is fordulnak) egy korpuszon belül is, Wisniewski és
    * az eltérő annotációk aránya minden esetben nagyobb volt, ha a korpuszt
      egy másik korpusszal hasonlították össze, mint ha saját magával. A
  * egy másik kísérletet is végeztek a szerzők. Ebben egy
    * bináris osztályozót tanítottak be, amelynek az volt a feladata, hogy
      eldöntse egy mondatról, hogy két korpusz közül melyikhez tartozik.
      Intuitív feltételezés szerint minél nagyobb lesz ennek az osztályozónak a
      hibaaránya, annál hasonlóbb a két korpusz. Az osztályozót betanították
    * csak szavakra, csak POS-tagekre és szó + POS-tag kombinációkra is. A
    * legsikeresebb osztályozást ez utóbbinál érték el, ami arra utal, hogy
    * az azonos szavak (vagy szószekvenciák) eltérő annotációi jól jellemzik a
* A korpuszméret és a vele betanított modell sikerességének kapcsolatához ér-
  * Martin és mtsai (2020) munkáját, akik CamemBERT nevű BERT alapú francia
    modelljüket (és összehasonlításképpen más modelleket) tanították be és
    értékelték ki négy különböző korpuszon. Ezek közül
  * a legnagyobb 389363 tokent tartalmazott, a szófaji címkézésben
  * a legjobb eredményeket azonban a nála jóval kisebb, 68615 tokenből álló
    Sequoia korpusszal érték el a szerzők.  Egyrészt elmondható tehát, hogy az
  * [implicit:] morfológiai címkéző modellek eredményességének nem feltétlenül

# 3. Felhasznált korpuszok és eszközök

* Kísérleteinkhez 3 különböző méretű kézzel annotált korpuszt használtunk fel.
  1. legnagyobb a HuSpacy tanítóanyagául is szolgáló Szeged Treebank (Vincze+10)
    * 1 362 505 token.
    * Az eredeti annotáció nagyrészt automatikusan lett a Universal Dependencies
      szabványra konvertálva1 , a UD annotációk
      * csak a korpusz egy kis részén (42 032 token) kaptak kézi ellenőrzést.2 A
 2. NYTK-NerKor (Simon és Vadász, 2021)3 , amely összesen 1 017 340 tokent
    * gold standard morfológiai annotáció készült az emMorph címkekészletével,
    * az emtsv emmorph2ud2 (Vadász és Simon, 2019) eszközével lett UD-re knov
    * A konvertált UD annotációk automatikus és kézi javításokon is átestek.
  3. legkisebb az ELTE DH gold standard korpusza (K. Molnár és Dömötör, 2023) 4
    * 496 060 tokenből áll, és az NYTK-NerKorhoz hasonló módszertannal
    * Mindkét korpuszt az emtsv (Indig és mtsai, 2019) morfológiai elemző
      moduljaival előelemezték, majd
    * az elemző által adott annotációkat javították kézzel az annotátorok.
    * ie Az eredeti, kézzel ellenőrzött annotációk ennek megfelelően itt is az
      emMorph címkekészletét követik, majd ezek is az emmorph2ud2 eszközzel
    * utóbbi annotációs réteg nem kapott kézi ellenőrzést.
* Mindhárom korpusz műfajilag heterogén, tartalmaznak egymással átfedő és
  egyedi szövegtípusokat is, így a korpuszok kombinálásával nem csak nagyobb
  méretet, hanem nagyobb műfaji változatosságot is elérhetünk. A korpuszokban
  található műfajokat az 1. táblázatban foglaltuk össze.
* A korpuszok teszteléséhez elsősorban a HuSpaCy (Orosz és mtsai, 2023) lem-
  matizáló és morfológiai elemző moduljait használtuk,
  * mivel azonban a három vizsgált korpuszból kettő eredetileg emMorph
    címkekészlettel készült, így ezek összehasonlításához a PurePos (Orosz és
    Novák, 2013) tanításával is végeztünk kísérleteket. Ez utóbbinál
    * lehetőség van előelemzést is végeztetni a szabályalapú emMorph (Novák és
      mtsai, 2016) modul segítségével.
  * train-dev-test felosztásához a HuSpaCy eredeti (Szeged Treebankből
    származó) tanítóanyagának arányait használtuk. A vágásnál szempont volt,
    * minden alkorpuszból nagyjából azonos train/dev/test arány
    * a bekerülő szövegek teljes mondatok legyenek.
  * A korpuszokat először külön-külön használtuk tanításra és tesztelésre,
    * majd megpróbáltuk kettesével kombinálni őket.
* A HuSpaCy eredményei összehasonlíthatók a spaCy (Honnibal és mtsai, 2020) más
  nyelvű modelljeivel.
  * A hivatalos weboldalon5 24 nyelv összesen 82 modelljének eredményei érhetők
  * 16 nyelv esetén van adat mind a UD POS-tag, a morfológiai jegyek és a
    lemmatizálás kiértékelésére.
  * tab 2: A modellek átlagos teljesítménye az egyes feladatokon a 2.
  * A legjobb eredményt a spanyol, a katalán és a német modellek érték el, ezek
    mindhárom feladaton az átlagosnál jobban teljesítettek. A
  * leggyengébbek
    (mindhárom feladaton átlag alatti) teljesítményt a finn, a litván és a
    görög modellek adták. Ezen kívül még az
  * olasz és a norvég modellek eredményei kiegyensúlyozott a feladatok mentén
    * mindkettő átlagos eredményt nyújt POS-tagelésben, a másik két feladaton
      pedig átlagnál jobbat.
  * A többi modell sikeressége eltérő volt az egyes feladatoknál.  A
  * tab 3 táblázat az előbb említett modellek eredményeit és a modell alapjául
    szolgáló korpuszok méretét mutatja. Az egyes nyelveknél a legjobb eredményt
    elérő modellt vettük figyelembe. A korpuszméret a modell tanításához és
    kiértékeléséhez használt teljes korpusz tokenszámát jelenti.
  * a gyengébb teljesítményű modellek tanítókorpusza valóban jellemzően
    kisebb,
  * egy bizonyos korpuszméret fölött (a 278 ezres olasz korpusztól kezdve)
    azonban már nincs lényeges különbség az eredmények között.
  * pontos értelmezéséhez nyilvánvalóan figyelembe kellene venni az egyes
    nyelvek (morfológiai gazdagság) és korpuszok (műfaji sokszínűség)
    különbségeit, az általános tendencia mégis arra utal, hogy nem a méret a

# 4. Eredmények

## 4.1. HuSpaCy

* A 4. táblázatban a HuSpaCy eredményei láthatók a különböző korpuszokon és
azok kombinációin tanítva. A szófaj meghatározásában (
* POS:, a NerKor érte el a legjobb eredményt. A
* lemmatizálásnál nagyjából a mérettel arányosan változott a teljesítmény az
* morfológiai jegyek azonosításában (Feats)
  * a Szeged Treebank jelentősen alulteljesít a másik két korpuszhoz képest. A
  * legnagyobb eltérés a ritka jegyeknél (Reflex, Aspect, Number[psed]), a
    melléknevek fokozásánál (Degree) és a számjegyeknél (NumType) mutatkozott.
* mindhárom korpusz eredménye eléri, sőt meghaladja a spaCy más nyelvű
  modelljeinek előző fejezetben ismertetett átlagos teljesítményét, és
  * közelítik a hasonló korpuszmérettel bíró német, spanyol és katalán modellek
    eredményeit.
* korpuszok kombinálása szinte minden esetben lényegesen rontott az
  * egyedül az ELTE–Szeged párosítás lemma eredménye nem rosszabb mindkét
    korpusz önálló teljesítményénél.
  * A legrosszabb eredményt éppen a két nagyobb korpusz, a NerKor és a Szeged
* sum: a kisebb korpuszok nem teljesítenek (sokkal) rosszabbul a
* ? mi az a minimális korpuszméret, amivel még értékelhető eredményt lehet
  * a legkisebb (ELTE-DH) korpusz train és dev alkorpuszait vágtuk fokozatosan
    kisebb szeletekre (75-50-25-10-5%).
  * A teszthalmazon nem változtattunk. Ennek eredményei az 5. táblázatban
* A POS-tageknél a korpusz 75%-ra (350 ezer token) csökkentése 0.5% vissza-
  esést eredményez, a következő vágásoknál (50 és 25%) azonban nem tapasztalunk
  ekkora változást. A 25%-os (120 ezres) korpusz mind a POS, mind a feats
  esetében egy kicsivel még jobb eredményt is ad, mint az 50%-os (237 ezres)
* A lemmák pontossága 25%-ig folyamatos csökkenést mutat. Nagyobb romlást
  mindhárom feladatnál a 10%-os (48 ezres) korpusznál látunk először, a még en-
  nél is kisebb tanítókorpusz esetén pedig már értékelhetetlen eredményt
  kapunk.  (A 64%-os lemma accuracy értelmezéséhez megjegyezzük, hogy a
  tesztkorpusz szavainak 63,4%-ára igaz, hogy a szótő megegyezik a szóalakkal.)

## 4.2. PurePos

* Hasonló kísérleteket végeztünk a PurePos tanításával is
  a két emMorph annotációt tartalmazó korpusszal (ELTE DH és NerKor). Az
  * először az emMorph modul kikapcsolásával tanítottuk, azaz
  * ie előelemzés nélkül, csak a korpuszokból kellett megtanulnia a
    címkekészletet.
  * Itt is először külön-külön, majd együtt is tanítottunk a két korpusszal. A
  * az ELTE DH korpusz kisebbre vágott változataival is.
  * tabs 6. és 7
  * külön UD és emMorph lemma: a NerKorban kétféle lemma érték is tartozik a
    szavakhoz: az eredeti (emMorph) lemmákat a UD-re konvertálás során a UD
    sémájára igazították a korpusz készítői.  Kísérleteinkben ezért mindkét
    lemmával elvégeztük a tanítást.
* A két korpusz eredményeit összehasonlítva azt látjuk, hogy [hol a táblázat?]
  * a címkézési feladatnál különböző méretük ellenére is azonos teljesítményt
  nyújtott a két korpusz. A
  * lemmatizálásnál a
    * NerKor UD lemmái könnyebben tanulhatónak bizonyultak, mint az eredeti
      lemmák, ez utóbbiak szintén azonos eredményt mutatnak az ELTE DH
      korpusszal. Itt is igaz, hogy
  * a két korpusz kombinálása nemhogy nem javított, de még rontott is az
* tab 7: a PurePos a HuSpaCy-nél kevésbé érzékeny a korpuszméretre. (Ami nem
  meglepő, hiszen a PurePosnak kifejezett célja volt, hogy kis korpuszokon is
  képes legyen viszonylag megbízható eredményt adni.) A lemmatizálásban még
  egészen kicsi, alig 12 ezer token méretű tanítókorpusszal is elérte a 90%-ot.
  * a 120 és a 48 ezres korpuszoknál a lemmatizálás eredményessége átmenetileg
    még javult is, ez valószínűleg a részkorpuszok sajátosságai miatt lehet. A
    tagelésnél itt is a 48 ezres korpusznál látjuk az első nagyobb visszaesést,
    de ennek az eredményei is sokáig 90% közelében maradnak.
* tabs 8, 9: ugyanezeket a tanításokat látjuk, de ezúttal használtuk a
  beépített emMorph előelemző modult, azaz a korpuszokból betanított modell-
  nek már csak az egyértelműsítés volt a feladata. Ehhez referenciának érdemes
  * baseline: a szavak mekkora része eleve egyértelmű. Ez legkönnyebben az ELTE
    * a szavak közel felénél (45,7%) mind a szótő, mind az elemzés egyértelmű,
      így nem meglepőek az előzőeknél még erősebb eredmények. A legjobban az
      ELTE DH korpusza teljesített. A NerKor alulmaradása valószínűleg annak
      tudható be, hogy a korpusz készítői vélhetően többször adtak meg saját
      elemzést az emtsv által felajánlottak helyett.
  * A korpuszméret csökkentése itt – nem meglepő módon – még kevésbé befo-
    lyásolta az eredményeket: a korpusz csupán 10%-át (48 ezer tokent)
    használva is ugyanolyan eredményeket kaptunk, mint a teljes korpuszon
* Az 1. ábrán még jobban látszik a neurális (HuSpaCy) és a HMM (PurePos)
  rendszerek eltérő karakterisztikája.
  * A HuSpaCy eredménye mind a szótövesítésben, mind a tagelésben meredeken
    zuhan a 10%-osra redukált korpuszméret alatt, míg
  * a PurePos teljesítménye jóval visszafogottabb ütemben csökken. (A HuSpaCy
    esetén az (1b) ábrán a feats eredményeket jelenítettük meg, mert ne-
    hézségben ez a leginkább összevethető az emMorph címkézéssel.)
  * Az emMorph előelemzővel az esés mindkét feladaton még lassabb, a
    szótövesítés pontossága pedig végig a HuSpaCy-é felett marad.

# 5. Diszkusszió

* mennyire számít a méret? Úgy tűnik, hogy
  * a neurális háló alapú rendszereknél, amilyen a HuSpaCy, számít, de ott sem
    mindenek felett. A kisebb korpuszok nemcsak vesenyképesnek bizonyultak a
    legnagyobb mérettel bíró Szeged Treebankkel szemben, de bizonyos
    feladatokban meg is előzték. Azt mondhatjuk tehát, hogy nagyjából
  * félmillió tokentől (ami az ELTE DH korpusz teljes mérete) kezdve már nem
    feltétlenül számít a méret. Az ennél kisebb részkorpuszokon azonban
    egyértelmű volt a teljesítménycsökkenés, különösen a lemmatizálásnál. A
    POS-tagek és a morfológiai jegyek pontossága viszont meglepően kis
    korpuszméretnél (120 ezer token) is a "vállalható" tartományban maradt.
  * mindhárom vizsgált korpusz mérete megfelelő a HuSpaCy tanításához, a
  * PurePosnak pedig még kisebb is elég lenne, különösen ha a címkekészlet
    lehetővé teszi az emMorph előelemzésének használatát. Ez azt is
  * lehet helye a szabályalapú moduloknak: az emMorph és a PurePos éppen a
    HuSpaCy számára leginkább kihívást jelentő lemmatizálásban volt különösen
    sikeres a kisebb korpuszokon. Az, hogy a tagelési feladatban viszont (bár
    abban is jó) nem éri el a lemmatizáló szintjét amiatt lehet, hogy
  * a szófaj kérdése sokszor a szakértő annotátorok számára sem egyértelmű.
* gyakori tévesztés Mind a NerKorban, mind az ELTE DH korpuszban gyakori
  * melléknevek és főnevek keverése, ami a nyelvészeknek is "szürke zónának"
*  együtt használni a meglévő korpuszokat, ez sajnos minden esetben rossz
   * a lemmatizálás és morfológiai elemzés túlságosan sokrétű feladat ahhoz,
     hogy bármely két műhely egységesen tudjon annotálni, még akkor is, ha
     azonos sémát próbálnak követni.
* A korpuszok közötti eltérések részletes vizsgálata egy külön tanulmányt
  érdemelne, itt csak néhány különbséget említünk meg, amelyek
  * vagy már a korpuszok leírásából kiderülnek, vagy az általunk végzett
* A NerKor például sajátos elemzést alkalmaz a többtagú tulajdonnevekre.
  * Ezek belső tagjai nem kapnak esetragot, csak sima [/N] taggel annotálják
    őket, a szótő pedig azonos a szóalakkal. Ez a UD konverzióba nem került át,
    így csak a NerKor és az ELTE DH kompatibilitását érinti (amennyiben az
    emMorph annotációkat használjuk). További különbség a két kisebb korpusz
  * a NerKor megkülönbözteti a melléknévi igeneveket a melléknevektől,
    előbbiekre a [/V][_ImpfPtcp/Adj], [/V][_PerfPtcp/Adj] és [/V][_ModPtcp/Adj]
    címkéket használja, míg
    * az ELTE DH korpuszban ez a különbség csak a részletes elemzésben jelenik
      meg, az egyszerű címke minden esetben [/Adj].
    * Ez érinti a UD változatot is, a NerKor a melléknévi igeneveknél használ
      egy extra VerbForm feature-t, ami se az ELTE DH, se a Szeged Korpuszban
      nem szerepel, ezekben a melléknévi igenevek annotációja megegyezik a sima
      melléknevekével.
  * pont ezek az eltérések okozzák a NerKor gyengébb teljesítményét a
    PurePos+emMorph tanításában, az emMorph ugyanis nem ad sima [/N] illetve
    igenévi címkéket, így ezek okozták a legtöbb tévesztést ennél a modellnél.
* Az ELTE DH korpusz sajátossága, hogy a ragozott névmások (pl. róla) esetén a
  szótőben különbséget tesz a személyek (ő) és a nem személyek (az ) között,
  * a másik két korpusz nem használja az _az_ szótövet ezekben az esetekben.
* A NerKor dokumentációja továbbá megjegyzi, hogy a Szeged Treebank nem mindig
  következetes a névmások szótövesítésében, és az sem könnyítette meg a
  * néhány ragozott alakra nincs példa a korpuszban.
* segédigék kérdéskörét, amit szintén eltérően kezelnek a korpuszok. A
  * Szeged Treebankben AUX címkét kap a múlt idejű feltételes mód (volna) és a
    jövő idő (fog) segédigéje, valamint a kopula. Az
  * emMorph címkekészletben azonban nincs segédige kategória, így az
    emmorph2ud2 konvertáló eszközbe sem került bele.
  * A NerKor a sima [/V] címkével különbözteti meg a segédigét a többi igétől,
    ezt azonban csak a _volna_ esetében használják (ami érthető, hiszen a jövő
    időt jelző fog-nak és a kopuláknak van ragozása).
  * Az ELTE DHkorpusz UD változatában viszont (mivel az az emmorph2ud2
    eszközzel készült) egyáltalán nem szerepel az AUX címke.
