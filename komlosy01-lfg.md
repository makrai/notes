A lexikai-funkcionális grammatika mondattanának alapfogalmai
Komlósy András

# Előszó

* A generatív nyelvészeti paradigmán belül megfogalmazott nyelvelméletek közül a
  "transzformacionalizmussal" elsők között szakító lexikai-funkcionális nyelvtan
* elvei
  * számítógépes kezelhetőség igényéből fakadó
  * más elméletek által is átvett általános elvei, eszközei
  * (deklarativitás, monotonicitás, jegymátrixok és leképezések használata,
    unifikációs mechanizmusok stb.) és precíz formalizmusa
  * egyenes folytatója a nyelvleírás évezredes hagyományainak és törekvéseinek.
  * lexikon vizsgálata átveszi azt a központi szerepet, amelyet
    a megelőző évtizedekben a szintaxis töltött be.
    * Az LFG az egyik úttörője volt azoknak a nyelvelméleti törekvéseknek,
    * napjaink grammatikai kutatásaiban már egyre inkább
* A tankönyv célja inkább a szolid alapok lefektetése,
  mint az elmélet keretében felmerült legújabb, gyakran sokak által vitatott, s
  * az utóbbi öt-hat évben felmerült javaslatok egy részét a könyv nem tárgyalja
* irodalomjegyzék csatolásának az internet korában nem látom értelmét
  * Az irányzattal kapcsolatos minden fontos információ és adatanyag, ezen belül
    az LFG nagyjából naprakész teljes bibliográfiája elérhető a Stanford
    Egyetemen működő LFG Website-on és annak Essexben található tükrözésében:
    http://www-lfg.stanford.edu/lfg http://clwww.essex.ac.uk/LFG/

# 1. Alapok

## 1.1. Általános jellemzés

* nem nyelvészeti értelemben vett szintaxiselmélet, hanem olyan
* formális keret, amelyen belül számtalan különböző grammatika megfogalmazható.
* Az LFG az univerzális grammatika modellje
* Keretei között természetesen kidolgozhatók a nyelvek mondattani rendszereinek
  leírására szánt szintaxiselméletek és szintaktikai alelméletek is, mint pl.:
  * X'-elméletek (l. 2.1.1.)
  * a lexikai leképezés elméletei (l. 2.7.)
  * a névmások kötésének és a grammatikai viszonyok kontrollálásának (l. 3.)
  * az egyeztetés elméletei (l. 2.5.2.) stb.
* Ez a könyv csak a mondattani jelenségekre vonatkozó alelméleteket ismerteti.


### 1.1.1. Az LFG mint formális keretmodell

* A generatív nyelvészet felfogása szerint
  egy-egy nyelv grammatikája nem más, mint az (idealizált) anyanyelvi beszélő
  nyelvtudásának, azaz kompetenciájának explicit, formális modellje. Természetes
  * ne rekedjen meg a funkcionális modellek szintjén (azaz ne csak külső
    működésében szimulálja a modellált tárgy működését), hanem minél inkább
  * realista modellek ideálját: belső felépítése is hasonlítson
  * Az explicit és formális jellegnek biztos garanciája az, ha
    számítógépen futtatható programmá írható át
  * A pszichológiai realitás közvetlen tesztelésére nincs eszközünk, de a
    * társtudományai (elsősorban a nyelvhasználat és az agytevékenység
      megismerésére irányuló kutatások) egyre több lehetőséget adnak a nyelvi
* Joan Bresnant és Ronald Kaplant, az LFG megalkotóit az 1970-es évtized második
  * a chomskyánus transzformációs paradigmával való szakításra és attól eltérő
    * a kezdetektől fogva feltételezett néhány alapelvhez való ragaszkodása
    * az egyes nyelvek leírásától mindinkább az univerzális grammatika felé
    * egyre kisebb súlyt helyezett a fenti két szempontnak a nyelvleírásban való
  * a transzformációs grammatikák e szempontok érvényesítésére elvi okokból sem
    Az
    általuk kifejlesztett grammatikaelméleti keret jellemzői igen tömören
    összefoglalva a következők:

#### 1.1.1.1. A megvalósítandó célok

* száműzni kell a transzformációkat és az "üres" kategóriákat, amelyek gátolják
* Az LFG szintaxiselméletének a felépítését meghatározó elvek [design principles]:
  variabilitás
  univerzalitás
  transzparencia

##### 1.1.1.1.1. Variabilitás

* A külső szerkezet [external structure, expression structure] nyelvenként más
* a mondatokat felépítő jelentéselemek az egyes nyelvekben eltérő módokon,
  eltérő nyalábokba rendezve "vannak kiosztva" a formai elemek (morfok, szavak)
  között, s a nyelvek különböznek egymástól abban is, hogy ezeknek a formai
  elemeknek milyen elrendezései lehetségesek a mondatokban. Pl.:
* A mondat külső szerkezetének LFG-beli modellje a kategoriális v. összetevős

##### 1.1.1.1.2. Univerzalitás

* A belső szerkezet [internal structure] ennek ellenére lényegében minden
  nyelvben azonos. Ez azt jelenti, hogy az információtartalmukban egymásnak
  megfeleltethető mondatszakaszok között azonos típusú függési viszonyok
  (szintaktikai alá-, föléés mellérendeltségek) állnak fenn, tehát az ilyen
  mondatdarabok grammatikai funkciói a különböző nyelvekben azonosaknak
  tekinthetők. Pl. a fenti mondatok mindegyikében egy 'lát' jelentésű egység az
  állítmány, a beszélő az alany, a hallgató a tárgy, és mindegyik mondat
  tartalmaz egy határozói szerepű kifejezést is, amely a szintén mindegyikükben
  megtalálható tagadást a beszédidőt megelőző hosszabb időtartamra
  vonatkoztatja.
* A mondat belső szerkezetének LFG-beli modellje az ún. funkcionális szerkezet

##### 1.1.1.1.3. Transzparencia

* A külső és a belső szerkezet közötti viszonynak (pl. a nyelvelsajátítás miatt)

#### 1.1.1.2. A kivitelezés alapötlete

* a mondat különböző szerkezeti szintjei ugyanazon funkcionális információkat
  hordozzák (=functional stability under structural reformation)
  * szint = f-struktúra rétegei?
* Az egyes szerkezeti szintek ugyan eltérő formájú, önálló reprezentációkat
  kapnak az LFG-ben, de
* a mondatrészviszonyokra (=grammatikai funkciókra) vonatkozó információk
  párhuzamosan jelen vannak mindegyik reprezentációs szinten
* A különböző reprezentációk így egyazon funkcionális szerkezetnek (az adott
  mondat belső szerkezetének) a darabjait tartalmazzák
* egyszerre variabilitás és az univerzalitás
* Az átláthatóságot az garantálja, hogy
  a külső szerkezetekből a belső szerkezetekbe vivő leképezés monoton jellegű.
  * a külső szerkezet bármely darabjára áll az, hogy
    a külső szerkezet további darabjainak a leképezése ezeket nem tudja
    visszavonni.
=> részenkénti megfelelések állnak fenn [piece to piece / piecewise
correspondance]
* módot adnak arra is, hogy a belső szerkezetre vonatkozó információ a külső
  szerkezetben "szét legyen szórva"
  * nem kényszerülünk rá arra, hogy egy-egy mondatrész
    egyetlen megszakítatlan szintaktikai frázis alkotóelemei révén fejezzük ki
    * arra, hogy bizonyos információk hordozóiként "testetlen" elemeket vagy
      elemmásolatokat, netán elmozdított egységek által hátrahagyott nyomokat

#### 1.1.1.3. Az LFG felépítésbeli jellemzői

* A lexikai-funkcionális grammatika
  1. az univerzális grammatikának nem konfigurációs, hanem relációs alapú modell
  2. egymástól különböző (és formális jellegükben is eltérő), de egymással
     párhuzamos szerkezetek (reprezentációk) rendszere alkot:
    * argumentumszerkezet
    * funkcionális szerkezet
    * összetevős/kategoriális szerkezet
    * prozódiai szerkezet
    * szemantikai szerkezet

    * [a(rgument) structure]
    * [f(unctional) structure]
    * [c(onstituent/ategorial) structure]
    * [p(rosodic) structure of phrasal phonology]
    * [σ[semantic] structure],
3. ezeket a szerkezeteket (reprezentációkat) egymással
   korrespondencia-leképezések [functional correspondences vagy más néven
   linking principles, mapping principles] kapcsolják össze.
  * mondatrészviszonyoknak (azaz a mondat összetevői által betöltött grammatikai
    funkcióknak) a kezelésében
    * A konfigurációs modellek (amilyenek pl. a chomskyánus modellek) a
      csak az összetevők elrendezésével -egymáshoz viszonyított
      lineáris (sorrendi) és hierarchikus (= bennfoglalási viszonyokat tükröző)
      pozícióik révén -tudják kódolni. Ennek megfelelő-
      * a mondatrészviszonyokat egy univerzálisnak feltételezett
        frázisszerkezeten, annak keretei között definiálják
  * A természetes nyelvekben gyakran pusztán morfológiai eszközök jelenítik meg
    * pl az az összetevő az alany, amely nominatívuszban áll, s amellyel az ige
      számban és személyben egyeztetést mutat.)
  * a repr semleges a lehetséges megjelenítési módok tekintetében -így tehát
    absztraktabb is a konfigurációs megjelenítésnél. Ez teszi
  * a funkcionális szerkezetet -az LFG a belső szerkezet modelljének tekintse.
  *  Magukat a mondatrészszerepeket (=grammatikai funkciókat) az LFG
     az argumentumszerkezet és a mondat "külső" szerkezete [=expression
     structure] -közötti kapcsolóelemeknek ["relators" v. "links"] tekinti -l.
* Az egyes nyelvtanok e keretek között "fogalmazandók meg" az alábbi értelemben:
  * Minden nyelvtan részleges szerkezetekre vonatkozó, azokat együttesen leíró
    lokális megszorításoknak egy-egy halmaza. A nyelvtanokban
  * nincsenek sem derivációs, sem transzformációs műveletek: a grammatikus

### 1.1.2. A mondattani komponensről

* a mondatok minden lényeges szerkezeti eleme legalább 3, viszonylag fütlen rsz
  * az elemek lehetséges elrendezéseinek a rendszerébe;
  * az elemek közötti grammatikai viszonyoknak a hálózatába;
  * az elemsor jelentésének közvetlen alapjául szolgáló
    predikátum--argumentum-viszonyoknak a rendszerébe.

#### 1.1.2.1. Az alapötlet megvalósítása a szintaxisban

##### 1.1.2.1.1. Több reprezentációs szint

Az 1.1.2-beli szinteknek az LFG-ben radikálisan különböző reprezentációs szintek
felelnek meg:
  * a predikátum--argumentum-viszonyoknak a lexikai szerkezet (vagy argumentumszerkezet: a-struktúra),
  * az elemek elrendezésének az összetevős vagy kategoriális szerkezet: c-struk)
  * az elemek közötti grammatikai viszonyoknak a funkcionális szerkezet (f-stru)


lex/arg             üt (AG, PAT)    az argumentumok thematikus szerepei,
                                    "logikai alany/tárgy" minőség
kateg/összetevős    S -> V NP       szavak és szintagmák sorrend és egymásba épü
                                    ill. kategóriájuk
funk                [ PRED 'üt'     kb. a mondatrészek szerinti elemzés
                      ALANY 'te'    a mondat alkotórészei által hordozott
                      TÁRGY 'Pali'  grammatikai tulajdonságok és funkciók
                      MÓD FELSZ ]

* a funkcionális szerkezet a mondat belső, nyelvtől kevéssé függő szerkezetét
* A nyelvenként jelentősen eltérő külső szerkezeteket
  a lexikai elemekkel "feltöltött" kategoriális szerkezetek,
  az ún. felszíni szerkezetek modellálják.
  * nem független reprezentációs szint, mivel
    a kategoriális és a lexikai szerkezetek mechanikus egyesítésével (a lexikai
    behelyettesítésnek nevezett művelet elvégzésével) áll elő: felszíni

##### 1.1.2.1.2. A funkcionális információk párhuzamos reprezentálása

* A funkcionális viszonyokat a nyelvek ténylegesen a lexikai struktúrákban és a
  kategoriális struktúrában kódolják
* a lexikai és a kategoriális struktúrák egyes részei milyen funkcionális
  "információdarabokat" hordozhatnak, és ezeknek a nyelvtani ismereteiknek a
* az LFG mindkét szinten oly módon explikálja, hogy az alapreprezentációkhoz és
  * minden egyes összetevőjéhez hozzárendel egyrészt egy-egy üres f-struktúrát
  (ez lesz az adott összetevő funkcionális tulajdonságainak a gyűjtőhelye),
  * annotációk gyanánt olyan formulákat is, amelyek az adott összetevő alakjából
    vagy szerkezeten belüli pozíciójából kiolvasható funkcionális
    "információmorzsákat" (a belső szerkezet modelljére, az f-struktúrára
    vonatkozó elemi állításokat) kódolják
* univerzális és nyelvspecifikus megszorításoknak a működéséből következik. A
* általánosabb érvényű annotációs sémák konkrét megvalósulásaiként kezelhetjük.
* az egyes részleges fstruktúrákat megnevező ([Fi] formájú) utalások helyén az
  érintett f-struktúrákat képviselő összetevők felé mutató nyilakat találunk. A
* f-struktúra nem több, mint a mondatban rejlő funkcionális információk összegző
  megjelenítése. Nem tartalmaz semmi mást, mint a másik két szinten (vagy ami

#### 1.1.2.2. A szintaktikai komponensek és a reprezentációs szintek

(az [AL] KOMPONENSek nagy betűvel, a reprezentációk vastaggal):

            FRÁZISSZERKEZETI KOMPONENS              LEXIKON

              összetevős szerkezetek     a tételek lexikai szerkezetei
            funkcionális annotációkkal     funkcionális annotációkkal

                              lexikai behelyettesítés
                                       ↓
                              felszíni szerkezetek ( → a FONOLÓGIAI KOMPONENSbe)
                                       ↓
                         funkcionális szerkezetek ( → a SZEMANTIKAI KOMPONENSbe)

#### 1.1.2.3. Tudnivalók a lexikon szerkezetéről

* funkcionális
* Amint erre a neve is utal, a lexikai--funkcionális grammatikát
* a létrejötte idején ismert egyéb elméletektől ~ különböztette meg
  * a grammatikai funkciók szintaktikai primitivumokként való felhasználása
  * a grammatika egészén belül kitüntetett szerepet tulajdonított a lexikonnak
    * A más modellekben akkoriban még általánosan (és egyes, köztük vezető
      elméletekben mindmáig) szintaktikai apparátussal kezelt jelenségek igen
      széles körét az LFG a lexikon illetékességébe utalja,
* a lexikon elemei közötti viszonyokkal, a lexikonban zajló folyamatokkal
* a máshol megszokottnál összetettebb felépítésű lexikai komponenst igényel,
* lexikai integritás. Az LFG elvei szerint a mondattan szerkezetei és szabályai
  a szavak belső felépítésére semmilyen módon nem hivatkozhatnak és azon nem
  változtathatnak, nyilvánvaló, hogy -az izoláló nyelvektől eltekintve --a
* kimenetét teljesen inflektált szóalakoknak kell képezniük
* az inflexiós toldalékolás jelentős részben produktív szabályok alapján megy
  => a lexikon nem "egészben" tárolja az alakokat
* produktív szóalkotási folyamatokkal létrehozott szótövekre is (pl. a különböző
  * pl műveltető, ható, tagadó, szenvedő, gyakorító stb. igéire,
    participiumaira, infinitívuszaira, nem alapfokú mellékneveire, különböző
    produktív sémákat képező összetételeire stb.).
* más modellek sem puszta elemlistaként képzelik el: valamilyen módon
  (redundanciaszabályok, öröklési mechanizmusok stb. segítségével) minden modell
* nL az LFG szótári komponense generáló szabályokat is tartalmaz, vagyis
* jól értelmezhetők a klasszikus morfológia szemléletében is
  * a többmorfémás egységek a bennük található morfémákból állnak. Ebben a
  * a tőmorfémák (pl.: ül, ver, ad) nem létrehozandó egységek, és csakis
    "egyben" és "készen" tárolhatjuk őket;
    * az aktív tőnek egyetlen tulajdonságára sincs független magyarázatunk
  * azok a derivátumok pedig, amelyek önálló szóként is használható relatív
    tövet tartalmaznak (ahogy pl. a passzív ad-at(-ik) az aktív _ad_-ot)
    közvetlenül a tövükül szolgáló szóból állnak elő a képzőelem hozzáadásával.
* mindkét alak lényeges szintaktikai tulajdonságai levezethetőkké, azaz
  megmagyarázhatókká válnak akkor, ha nem egymásból hozzuk létre őket, hanem
  mindkettőt egy náluk absztraktabb jellemzésű, közös mögöttes alakból
* lehetővé teszi egyrészt a szóanyag takarékos tárolását, másrészt az elemek
  nagyobb csoportjaiban megfigyelhető viselkedésbeli hasonlóságoknak közös
  tulajdonságokra való visszavezetését (magyarázatát)
* kivétel (nincs mögöttes): a toldalékolhatatlan elemek egyes fajtáitól -pl.
  kötőszavaktól, határozószóktól -eltekintve sohasem kerül be a mondatokba. A

### 1.1.3. A mondattani reprezentációk függetlenségének a bemutatása

* a szintaktikai reprezentációk közötti lehetséges viszonyokat illusztráljuk

#### 1.1.3.1. Vegyes példaanyag

  * Egyazon c-struktúra, különböző f-struktúrák, különböző a-struktúrák:
  * Egyetlen c-struktúra, egyetlen a-struktúra, eltérő f-struktúrák (warlpiri
    típusú szerkezetek):
  * Teljesen azonos felépítésű f-struktúrák és a-struktúrák, de gyökeresen
    eltérő formájú c-struktúrák:
  * Egyetlen a-struktúra, eltérő f-struktúrák és c-struktúrák

#### 1.1.3.2. Névmásinkorporáció

* A mondatok grammatikus voltának egyik alapvető feltétele az, hogy a bennük
  található régensek vonzatigénye kielégüljön: tárgyas ige tárgy nélkül,
  * a teljesség követelménye, l 1.3.3.) azonban
  * egyedül a mondatrészviszonyok vonatkozásában -vagyis az f-struktúrában --
    kell teljesülnie
  * az összetevős szerkezetre vonatkozóan semmiféle megkötést sem ír elő (vö.
    funkcióra hivatkozó vonzatválasztás 1.3.1.1)
  * ie az igének tárgyra szüksége van ugyan, de arra nem feltétlenül, hogy ezt
    egy mellette (vagy a mondatban bárhol) megtalálható frázis fejtse ki. Jól
* 'pro'
  * A számban és személyben eltérő névmások közös szemantikai értékét -mint a
    szemantikai leírást helyettesítő betűsorokat általában -az LFG-ben gyakran
    nagy betűkkel írják, így: PRO
  * Mivel azonban más, közismert elméletekben a PRO és a pro betűsor két
    gyökeresen különböző elemre utal,
    s kettejük közül az utóbbi képviseli a szóban forgó névmási jelentést, itt
    és a továbbiakban következetesen a kisbetűs pro alakot fogom használni.
* Az angol mondat esetében nyilvánvaló, hogy honnan kapja értékét az alanyi és a
* a láttalak igealak nem pusztán korlátozza a számot és a személyt, hanem
  névmási formák hiányában ő maga szolgáltatja is a megfelelő számú és személyű
  bővítményeket.
  láttalak: (↑PRED)='LÁT <(↑SUBJ), (↑OBJ)>'
  (↑SUBJ PRED) ='pro'
  (↑SUBJ NUM) = SG
  (↑SUBJ PER) = 1
  (↑OBJ PRED) ='pro'
  (↑OBJ NUM) = SG
  (↑OBJ PER) = 2
* bizonyos vonzatfunkciókban a névmási formáknak nem kell megjelenniük a
  * (főképp alanyi és tárgyi szerepben)
  * sok nyelvben fellelhető jelenséget, hogy
  * generatív terminus: pro-drop (kb: névmáskiejtés)
  * LFG-ben inkább a névmás inkorporálódásaként hivatkoznak rá
* Az igei személyragokat hagyományosan egyeztető morfémáknak szokás tekinteni,
  * a központi vonzatoknak (legáltalánosabban az alanynak) a grammatikai
    tulajdonságait ismétlik meg az igében
  * akkor igaz is, amikor a megfelelő vonzatot önálló szintaktikai összetevő is
  * Amikor viszont nincs jelen megfelelő szerepű frázis (mint a Jövünk. Csalsz.)
    csakis a személyragnak az alakjából tudjuk, hogy ki az alany, a tárgy stb.,
  * nem egyeztető szerepű, hanem ő maga a névmás. A személyragozott igealak
  => jelen van a PRED = 'pro'
  * A "valódi" névmásokat vagy frázisokat tartalmazó mondatokban természetesen
    az önálló szintaktikai összetevők szolgáltatják a értéket bevezető
    annotációs sor, és a személyragok ilyenkor valóban csak egyeztetési
  => az LFG keretében a magyar nyelv minden személyragozott igealakja homonim
  láttalak: (↑PRED)='LÁT <(↑SUBJ), (↑OBJ)>'
  (↑SUBJ NUM)=SG
  (↑SUBJ PER)=1
  (↑OBJ PER)=2

## 1.2. A mondattani reprezentációs szintek általános jellemzői

### 1.2.1. A kategoriális vagy összetevős szerkezet (c-struktúra)
  [categorial structure, constituent structure, c-structure]

* három, egymástól egyébként megkülönböztetendő objektumtípusra utal velük:
  * lexikai elemeket nem tartalmazó, pusztán kategórianevekkel címkézett
    csomópontokból (és őket összekötő élekből) álló kontextusfüggetlen ágrajz --
    vö. 1.2.1.1.
  * annotációs formulákkal kiegészített változatait is. (1.2.1.2.)
  * szóanyaggal is "feltöltött" (annotálatlan vagy annotált) kategoriális szerk
    * azaz valójában konkrét mondatok felszíni szerkezetére utalnak vele
    * l 1.1.2.2, 1.2.1.3.

#### 1.2.1.1. A "csupasz" c-struktúra

* a mondatot alkotó szavaknak és szószerkezeteknek a típusát (szófaji jellegű
  besorolását), valamint mondaton belüli "látható elrendezésüket" (sorrendjüket,
  egymásba építettségüket) ábrázolja
* Tömören tehát: a c-struktúra a mondatok alkotórészeinek
  * precedencia (azaz sorrend),
  * dominancia (azaz tartalmazás, bennfoglaltság) és
  * strukturális típus (=szintaktikai kategória) szerinti elrendezését adja meg.
* A c-struktúrák reprezentálásának az eszközei:
  * kontextusfüggetlen újraírószabályokkal (azaz CF-PSG által) meghatározott
  * frázisstruktúra-fák,
  * amelyek címkekészletét a szintaktikai kategóriákra utaló szimbólumok Σ hal-
    mazának egy-egy alhalmaza képezi.
* Mivel a csupasz c-struktúra kizárólag a külső szerkezetet kívánja repr,
  * minden mondat minden adott elemzéséhez egyetlen c-struktúra tartozik
  * az ágrajz csak
    * tényleges (hangalakkal rendelkező) nyelvi egységek közötti
    * felszíni (azaz disztribúciósan kimutatható) kapcsolatokat rögzíthet.

#### 1.2.1.2. Az annotált c-struktúra

* Az 1.1.1.2. pontban említett "alapötletnek"
  (a funkcionális információk minden reprezentációs szinten való
  szerepeltetésének) a megvalósítására
* ágrajzrészletek annotálását alkalmazzuk.  Ennek megfelelően
* a c-struktúra minden egyes csomópontjához olyan formulákat társítunk, amelyek
  szűkítik az adott összetevő lehetséges leképezéseinek a körét a mondat többi
  reprezentációjára -f-struktúrára, szemantikai struktúrára stb.
  (Részletesebben l. 2.4.)
* A példában szereplő PP összetevőhöz például olyan kifejezést rendelünk, amely
  csak ADJ (=adjunktum, azaz szabad határozó) szerepet engedélyez a számára, az
* matematikai és komputációs tulajdonságai a formális nyelvekkel és a
  számítógépes nyelvészettel foglalkozó szakemberek előtt jól ismertek.

#### 1.2.1.3. A felszíni szerkezet [surface structure]

* a lexikai behelyettesítés révén közvetlenül megkapjuk a mondatok felszíni szer
* A c-struktúrákba tökéletesen inflektált szóalakok helyettesítendők. Ez a
  * = a lexikai integritás követelménye, l. 2.1.1., 1.3.)

### 1.2.2.  A lexikai szerkezet vagy argumentumstruktúra (a-struktúra)
  [lexical structure, argument structure, a-structure]

* a szótári egység "logiko-szintaktikai" szerkezetének a modellje.  Olyan
  * jelentésleírását, valamint arra vonatkozó információkat is, hogy mondatbeli
  * milyen típusú vonzatoknak a jelenlétét várja el.  Ezt a jelleget emeli ki az
* argument: terminológiai problémára kell felhívnunk a figyelmet -arra, hogy a
  * Éppúgy/mint utalhat
    a predikátum által jelölt jelentésfüggvénynek az argumentumára (szemantikai)
    a vonzatokat kívánó szavaknak (régenseknek) a vonzataira (szintaktikai obj)
* Szemantikai argumentumaik természetesen csak (log/szem) predikátumoknak vannak
* az Argumentumstruktúra azonban a szótári tétel használatának a
  szintaktikai feltételeit, azaz a tétel vonzatigényét rögzítik --
  beleértve azokat az eseteket is, amikor a tétel
  * egyetlen szemantikai argumentumot sem igényel, azaz nem predikátum
  * vonzatot sem kíván, azaz nem is régens.
  * az angol időjárásigék alanyt kívánnak, tehát régensek -bár nem predikátumok
* elnevezést használják mind a még annotálatlan, mind pedig az annotált szerkre
* Vonzatoknak azokat a nyelvi formákat (frázisokat, mondatszerkezeti összetevő)
  és egyéb módon azonosítható nyelvi értékeket nevezzük, amelyek
  a mondatban megtalálható valamely szótári egységnek -a régensnek -a
  grammatikai igényeit elégítik ki abban az értelemben, hogy
  az általa bevezetett grammatikai funkciók valamelyikét látják el. Ennek a
  * az angolban nincs pontos megfelelője.
  * Megközelítőleg hasonló értelemben használják
    * egyes szerzők a "complement"-et, amely azonban nem fedi le az alanyt,
    * mások pedig a "grammatical argument" kifejezést, amely alatt viszont
      általában csak a thematikus vonzatokat értik (vö. 2.3.2.2. és 2.6.2.2.).

#### 1.2.2.1. A "csupasz" lexikai szerkezet

* nagyjából a hagyományos nyelvészetben "logikai alany, logikai tárgy" stb.,
  valamint "az esemény cselekvője, elszenvedője" stb. terminusokkal jelölt
  fogalmakat, illetve viszonyokat rögzíti -azokat, amelyek értelmében pl. a
  passzív mondat grammatikai alanya "az esemény elszenvedőjét" fejezi ki, és az
* kétfajta tényre utalnak:
  * az adott argumentum mondatbeli megjelenítései a szemantikai argumentumok
    melyik fajtájának a tipikus szintaktikai lehetőségeivel rendelkeznek.
    (Pl.: A fest ige mellett a festő személyt azonosító frázisok olyan
    * pl cselekvő szereplőit megnevező frázisok
      vagy alanyként, vagy pedig -pl. a -t/-tt képzős melléknévi igenév mellett
      -által névutós frázison belül jelenhet meg.) Az e szempontból egyforma
    * thematikus szerepek hordozóinak tekintjük -l. alább.
  * a thematikus szerepek egy feltételezett rangsorában milyen magasan áll ez a
    * ugyanazon predikátumnak a többi argumentumához viszonyítva
    * (leg)magasabb rangú -a "logikai alany", az utóbbi -mint
      (leg)alacsonyabb rangú -a "logikai tárgy". Ilyen jellegű intuíciók
      * pl "logikai tárgynak" az aktív mondatok nem-alanyi argumentuma olyankor
        is, amikor grammatikailag nem tárgyként jelenik meg, pl.: A vonatra vár.
* formai felépítése erősen emlékeztet a tétel által képviselt
  jelentésfüggvénynek n-változós függvényformában (f(x1 ... xn)) való
  felírására, amelyben minden szemantikai argumentumnak egy-egy függvényváltozó
* az argumentumhelyeket a thematikus szerepek nevei azonosítják, hanem olyan
  * szintaktikai alapbesorolást tükröznek, s amelyeknek
  * egymás közötti rendezettsége minden régensre vonatkozóan megszabja az
    argumentumok említési sorrendjét. Az argumentumok említési sorrendje tehát --
  * pl HAVAZIK, FORGOLÓDIK (AG), VÁG (AG,PAT), SZERET (EXP,TH), AD (AG,PAT,GOAL)
  * A rangsorolás alapja a thematikus szerepek feltételezett univerzális hier,
    AG > BEN > RECIP/EXP > INST > TH/PAT > LOC
    * Cselekvőé (Ágens: AG),
    * Haszonélvező/Kárvallott (Beneficiens: BEN)
    * Kapó (Recipiens: RECIP)
    * Átélő (Experiens: EXP)
    * Eszköz (Instrumentum: INST)
    * Jellemzett (Téma: TH)
    * Elszenvedő (Patiens: PAT)
    * Hely (Lokális: LOC) az alábbi sorrendben követ.
    (A hierarchiát alátámasztó érveket l. a 2.7.1. pontban.)
* legmagasabb rangú (s ezért elsőként álló) tag a főszereplő [top role] -jele a
  "kalapos" théta: θ ɵ . Ez nagyjából a hagyományos "logikai alany" megfelelője.
* Ezáltal
  * az argumentumokat megjelenítő nyelvi egységek elsődleges szintaktikai
    minősítést nyernek (mint AG, PAT stb.);
  * e minősítések révén általánosíthatóvá, s így megmagyarázhatóvá válnak azok a
    szintaktikai viselkedésbeli hasonlóságok, amelyek különböző régensek egyes
    argumentumait kifejező nyelvi formák között fedezhetők fel;
  * ugyanezen minősítésekből kiindulva módot találhatunk arra, hogy az
    argumentumokat megjelenítő nyelvi formáknak (ugyanazon régens különböző
    vonzatainak) az eltérő szintaktikai lehetőségeit meghatározzuk.
* A csupasz lexikai szerkezet a predikátumok "tárolási formája" (vö. 1.1.2.3.),
* mondatbeli, szintaktikai kezelhető viselkedése a vonzatok grammatikai
  funkciójától függ (közvetlenül)
  * nem szemantikai argumentumaiknak a thematikus szerepétől függ,

#### 1.2.2.2. Az annotált lexikai szerkezet (vonzatkeret vagy lexikai forma)

* vonzatkeret/vonzatszerkezet: A régens által megkívánt grammatikai funkciókat
  és az azok kielégítésére vonatkozó egyéb információkat összegző reprezentáció
* kapcsolatot teremtsenek az esemény szereplőit megnevező mondatbeli frázisok és
  a szemantikai argumentumhelyek között. Ebből következően (ahogy a mondatbeli
* elvben ilyen reprezentációkat eredményezne:
FORGOLÓDIK (AG),   SZERET ( EXP ,  TH ),  AD ( AG ,   PAT ,   GOAL )
        <(↑SUBJ)>       <(↑SUBJ),(↑OBJ)>   <(↑SUBJ),(↑OBJ),(↑OBL_GOAL)>
* nem szokás mindkét rétegét feltüntetni: mivel a mondattani reprezentációkban
  csak a grammatikai funkcióknak van szerepük
  'FORGOLÓDIK<(↑SUBJ)>' 'SZERET<(↑SUBJ),(↑OBJ)>' 'AD<(↑SUBJ),(↑OBJ),(↑OBLGOAL>'
* minden további szintaktikailag releváns tulajdonságot is egy-egy annot formula
  pl szeret igealaknak a mondatokba helyettesíthető teljes formája nagyjából így néz ki:
  (↑PRED) = 'SZERET <(↑SUBJ),(↑OBJ)>'
  (↑TENSE) = PRES
  (↑MODE) = INDIC
  ((↑SUBJ PRED) = 'pro' )
  (↑SUBJ NUM) = SG
  (↑SUBJ PER) = 3
  [(↑OBJ PER) = 3 ] ⇒ [(↑OBJ DEF) = -]
  ((↑OBJ PRED)='pro' ∧ [(↑OBJ PER)=1 ∨ (↑OBJ PER)=2] ∧ (OBJ NUM) = SG )

### 1.2.3. A funkcionális szerkezet (f-struktúra)
  [functional structure, f-structure]

* A belső struktúra formális modellje
* Nagyjából egy mondatrészek szerinti elemzés eredményeit rögzíti, de
  tartalmazza a mondatrészviszonyok kódolásában (egyeztetés, rekció stb.)
  szerepet játszó morfoszintaktikai információkat is
* A SUBJ, OBJ, PRED stb.  fogalmak ezen a szinten játszanak szerepet. Mivel ezek
* nem tartalmaz sem az elemek kategoriális jellegére, sem lineáris elhelyezkedés
* Az f-struktúrákat attribútum--érték-párok véges halmazaival reprezentáljuk:
  * az attribútum lehet: -szimbólum: SUBJ, TENSE, NUM, PRED
  * az érték lehet
    * szimbólum: PL, 3, PAST, ACC
    * szemantikai forma: 'TIGRIS'
    * f-struktúra
* A mondat minden egyes összetevője, ezen belül minden egyes szó is ->
   az adott egységnek (összetevőnek, lexikai elemnek) az f-struktúrájában
* a c-struktúra minden összetevőjéhez tartozik egy-egy f-struktúra. Ezekre itt

* a funkcionális viszonyokat általában is) az ágrajz megfelelő helyeihez csatolt
  __funkcionális egyenlőségekben__ (l. 2.4.1.) rögzítjük pl (F1 SUBJ)=F2 formájú
* összetevők és lexikai egységek __annotálása__
  * a c-struktúra csomópontjait vagy a lexikai egységeket összetársítjuk a
    megfelelő funkcionális egyenlőségekkel (pontosabban a náluk általánosabb
    formájú funkcionális sémákkal -l. 2.4.3.), az adott
  * a csatolt formulákat pedig az adott egységek __annotációinak__
* az f-struktúrája nem tartalmaz semmi mást, mint az összetevős szerkezetben
  és a lexikai tételekben rejlő funkcionális adatokat, s így -a grammatika
* a mondat funkcionális leírásának
  * mind a kategoriális szerkezet egyes csomópontjaihoz, mind pedig a lexikai
    tételekhez annotációkként csatolt összes funkcionális egyenlőség
* kiértékelő algoritmus segítségével kialakíthatjuk a hierarchikusan
  szerkesztett f-struktúrát.
* az f-struktúra függvényjellegéről l. alább, 1.2.5. -ben), azaz
  * szűkebb értelemben: egy adott mondat funkcionális szerkezete (l. az 1.2.4.)
  * tágabb értelemben: a mondat funkcionális szerkezetének minden "kerek"
    részlete is, így:
    * a c-struktúra egyes összetevőiben lévő információt egyesítő funkcionális
      szerkezetek (ezekre az 1.2.4. -ben a megfelelő csomópontok kategóriacímkéi
      mellett szereplő [Fi]-k utalnak), valamint határesetként
    * az egyes funkcionális egyenlőségekkel megadott "szerkezetdarabok" is.
      * Pl.: Az 1.2.4. -ben szereplő (F4NUM)=SG a mondat f-struktúrájában
        található [ NUM SG ] f-struktúrát adja meg
* a szemantikai komponens természetes bemenetét képezi.

### 1.2.4. A reprezentációk formája és a közöttük fennálló leképezések

(az előző pontban leírtakra egy példa)

### 1.2.5. Az f-struktúra mint matematikai függvény

* Az f-struktúra terminus "funkcionális" szava kétfelől is értelmezhető:
  * a. functional = 'grammatikai funkciókra vonatkozó'
  * b. functional = 'matematikai függvényt megtestesítő/megadó'
* Matematikailag: rendezett ketteseknek (attribútum--érték-pároknak) az
  értékunicitási feltételt (l. alább és az 1.3.3.1. pontban) kielégítő véges
  hierarchiája, amely értékeket rendel a mondat primitív grammatikai relációihoz
* Értékunicitási feltétel [Uniqueness Condition]:
  * Azaz: minden attribútumnak csak egy értéke lehet
  * ie kielégíti a matematikai függvény fogalmát, azaz minden f-struktúra
  * egyváltozós függvény, amely az argumentumaként felvett egyes attribútumokhoz
    azok értékét rendeli: f4 [ NUM SG ] := f4(NUM)=SG

E függvények sajátosságai:
  * Mind értelmezési tartományuk, mind értékkészletük csak véges lehet, így
    mindig ábrázolhatóak véges táblázattal.
  * Nem a függvénynek és argumentumának az ismeretében keressük az értéket,
    hanem az argumentum és az érték ismeretében keressük ("konstruáljuk meg") a
    függvényt.
  * A függvény alkalmazása adhat olyan értéket, amely maga is függvény, pl.:
* Ez módot ad ilyen felírásra: f2(NUM) = f1(SUBJ)(NUM) = (f1(SUBJ))(NUM) = SG
* Az olvashatóságot egyszerűsítendő
  a függvénynevet bevisszük a zárójelbe és
  kettős alkalmazásnál nem tesszük ki a belső zárójeleket, azaz:
  (f2NUM) =
  (f1SUBJ)(NUM) = (f1SUBJ NUM)

#### 1.2.5.1. Függvénykifejezések [functional application expression]

* Az LFG függvénykifejezéseinek általános formája alapesetben tehát a következő:
  (fs)=v, ahol
  * f valamilyen f-struktúra
  * s valamilyen szimbólum
  * v valamilyen value, és
  * <s,v> eleme f-nek
* elsp kiterjesztése
  * Az értékként függvényt adó kifejezések léte és fent ismertetett kezelése a
  * hogy szimbólumsorok is előfordulhassanak az argumentumpozícióban. A
  * a következő alakú formulákat is engedélyezi:
  (fsx)=((fs)x) ahol x szimbolumok (esetleg üres) sorozata
  (fe)=f ahol e az üres sor
* Az f-struktúra
  * (a c-struktúrától eltérően) semmiféle utalást nem tartalmaz a szófaji
    (kategoriális) címkékre, és nem tükrözi a mondat időbeli (lineáris) szerk se
  * Megengedi ugyanakkor azt, hogy a hierarchiában lefelé haladva ugyanahhoz az
    "objektumhoz" több különböző úton is eljuthassunk, pl.:

## 1.3. Elvek és megszorítások [principles and constraints]

* itt  tételszerűen, mindössze egy-két kiegészítő megjegyzéssel ellátva
  felsoroljuk az LFG mondattani komponensére vonatkozó legáltalánosabb elveket
  és megszorításokat
* az előforduló fogalmak egy részének tisztázására csak később kerül sor --
* Ezekre a továbbiakban ugyanis rendszeresen hivatkoznunk kell majd, s jobb

### 1.3.1. Az argumentumszerkezet és a grammatikai funkciók viszonyára

#### 1.3.1.1. Funkcióra hivatkozó vonzatválasztás [selection for function]

* A régensek szintaktikai alkategorizálása vonzataiknak a grammatikai funkciója
  (nem pedig a kategóriája) alapján történik.
* pl. a ver igét tartalmazó régenscsoportot (igei alkategóriát)
  nem az definiálja, hogy az összetevős szerkezetben NP kategóriájú testvérük
  * hanem az, hogy az f-struktúrájukban alany és tárgy van jelen. Az elv
  * TILOS a vonzatkeretben szerepeltetni, hogy a funkciók mely kategóriákkal
* Az elv mellett szóló érvek:
  * Az alkategorizálási tulajdonságok nem függenek a tételnek a fában való helyé
  * Invariáns megoldást nyújt a konfigurációs és a nem-konfigurációs nyelvekre.
    * A kategóriára hivatkozó alkategorizálás a "testetlen" névmásoknak (vagyis
      a prodrop jelenségnek, l. 1.1.3.2.) a kezeléséhez szükségszerűen üres NP-k
      (DP-k) szerepeltetését kívánja meg (pl. a GB-ben).

#### 1.3.1.2. A funkciók és az argumentumok közötti biunicitás
  (=funkcionális unicitás) [function-argument biuniqueness, functional uniqueness]

* A szemantikai argumentumok és a hozzájuk rendelt grammatikai funkciók
  (=funkciótípusok!) között minden lexikai formában egy-egy megfelelésnek kell
  fennállnia.
* Feladata megközelítőleg ugyanaz, mint a GB-ben a θ-kritériumé
  (amely szerint minden argumentumnak (=vonzatnak) van θ-szerepe, és minden
  θ-szerepnek argumentumhoz (=vonzatpozícióhoz) kell rendelődnie).
* Az értelmezéshez:
  1. A "szemantikai argumentum" kifejezés argumentum-POZÍCIÓra utal és
    NEM szemantikai (thematikus) szerepre. (Az egyes szemantikai argumentumok
    ugyanis egyidejűleg több szemantikai szereppel is rendelkezhetnek, de
    ezekhez a pozíciókhoz is csak egyetlen funkció kapcsolódhat.)
  2. Az elv NEM TILTJA azt, hogy:
    * a. grammatikai funkció szemantikailag üres elemmel (pl. FORM-ként
      bevezetett it stb.) legyen kifejezve,
      tehát ne is legyen argumentumpozícióval társítva
    * b. szemantikai argumentumhoz a Ø funkciószimbólum (2.6.2.6.1) kapcsolódjon

### 1.3.2. A morfológia és a szintaxis viszonyára

#### 1.3.2.1. A szintaktikai kódolás direkt volta
  [principle of direct syntactic encoding]

* Minden nem-lexikai szabálynak változatlanul kell hagynia
  a grammatikai funkciók és az argumentumok közötti kapcsolatokat -azaz
  CSAK lexikai szabályok változtathatják meg a grammatikai funkcióknak a
  predikátum--argumentum-struktúrához való hozzárendelését.
=> a szintaxisban legfeljebb kétféle struktúrafüggő (transzformációs) viszony
maradhatna:
  1. A korlátlan távolságú mozgatások és törlések szabályai [unbounded movement
     or deletion rules]. A transzformációk elkerülését itt a
     funkcionális bizonytalanság (l. 3.4.) kezelése teszi lehetővé.
  2. A korlátolt távolságú szabályoknak [bounded rules] az az osztálya, amely
     nem változtatja meg a konstituensek grammatikai funkcióját:
     a cserebere-szabályok [scrambling]
    * Ezt a c-struktúrán működő műveletek kezelik.

#### 1.3.2.2. A lexikai integritás hipotézise
  [lexical integrity hypothesis, structural integrity of words]

* A c-struktúrán belüli folyamatok (a funkcionális információ annotálása és az
  anaforikus információk indexelése) nem látják a szavak belső felépítését.
* Következményei:
  1. "Törlő" eljárások (azaz hiányrekonstrukciók pl.: gapping)
    nem érinthetnek szórészeket.
  2. A szavak anaforikus szigetek (nem mehet beléjük pronominalizáció).
  3. A szintaktikai szabályok
    nem változtathatnak meg és nem mozgathatnak inflexiós jelölőket (olyanokat,
    mint pl. TENSE, CASE, NUMBER)
  * Ennek értelmében pl.  az orosz tárgyak akkuzatívusz─genitívusz váltakozása
    nem szintaxis.

#### 1.3.2.3. "Üres" elemek tilalma [the null-element constraint]

* Nem-terminális kategória által dominált string nem lehet üres string (e),
  kivéve a konstituenskontrollálás eseteit. (Konstituens-kontrollálás:
  wh-mozgatásra és hasonló szerkezetekre jellemző távolsági függések ─ l.  3.4.)

### 1.3.3. A funkcionális struktúrák jólformáltságát biztosító megszorítások

#### 1.3.3.1. Konzisztencia (=értékunicitási feltétel)
  [consistency, uniqueness condition]

* Minden grammatikai funkciónak és minden funkcionális jegynek csak egyetlenegy
  értéke lehet. (Az érték ugyanakkor lehet halmaz is.)

#### 1.3.3.2. Teljesség [completeness]

* A régens vonzatigényeit az f-struktúrának ki kell elégítenie (azaz a megkívánt
  grammatikai funkcióknak értéket kell kapniuk az adott PRED f-struktúrájában).
* A szemantikai argumentumhelyekhez társított grammatikai funkciók mindegyikének
  szemantikai jeggyel (azaz PRED attribútummal) is kell rendelkeznie.

#### 1.3.3.3. Koherencia [coherence]

* Vonzatfunkció csak olyan f-struktúrában szerepelhet attribútumként,
  amelynek PRED-je az adott funkciót (is) igénylő régens.
* Mindazokat a vonzatfunkciókat, amelyeknek van PRED attribútumuk,
  régensüknek szemantikai argumentumszereppel kell társítania
  (tehát nem veheti fel őket nem-thematikus vonzatként).
* A koherenciakövetelmény kiterjesztése:
  * A nem vonzatszerepű funkcióknak is integrálódniuk kell az f-struktúrába,
    azaz megfelelő viszonyban kell állniuk egy PRED-del
    * Az ADJ integrálódásának az a feltétele, hogy PRED-del bíró f-struktúrában
      álljon. A TOP-ot és a
    * FOC-t vagy azonosítani kell egy integrált funkcióval, vagy anaforikusan
      kapcsolni kell egy ilyenhez.

### 1.3.4. A funkcionális azonosságok formájára

#### 1.3.4.1. A funkcionális kapcsolatok lokális jellegének az elve
  (=funkcionális lokalitás) [principle of functional locality]

* A lexikai és grammatikai sémák jelölői (= az attribútum és az érték "megneve")
  nem tartalmazhatnak kettőnél több függvényalkalmazást, azaz kizárólag:
  "egyszerű" funkciókra
  saját jegyekre
  közvetlen alárendelten belüli funkciókra
  közvetlen alárendelten belüli jegyekre
utalhatnak.
* a funkciókra és funkcionális jegyekre vonatkozó mindenfajta hivatkozásra vonat
  (akár lexikonbeli, akár szintaktikai szabályok vagy reprezentációk formájában)

# 2. A mondattani reprezentációk formája

## 2.1. A kategoriális struktúra univerzális elvei

* a nyelvileg is lehetséges c-struktúrák körét (mind univerzálisan, mind pedig
  egy-egy nyelven belül) az alábbiakra vonatkozó általánosítások jelölik ki:
  ─ szórend
  * kiejtés
  * a szavak, frázisok, mondatok formája
* Frázisok: olyan összefüggő szósorok, amelyek
  * helyettesítési egységek,
  * egyben maradnak a mondat stiláris változataiban és parafrázisaiban
  * korlátozzák a mondat kiejtési mintáit
  * más frázisokkal való viszonyukban elrendezési korlátokat mutatnak.
* Az általánosításokra támaszkodva megfogalmazhatóak
  a kategoriális struktúra univerzális elvei,
  s ezekből megszorítások vezethetők le arra vonatkozóan,
  hogy milyen c-struktúrák lehetségesek a természetes nyelvekben 
* Az univerzális elvek:
  1. 1. az endocentricitás elve
  2. a predikátum─argumentum-viszony lokális jellegének az elve
* A c-struktúrák változatosságának az a fő forrása, hogy
* ez a két elv ütközésben áll egymással
  * Az endocentricitás következetesen bináris hierarchiákat igényel,
  * a vonzatviszonyok lokalitása viszont lapos struktúrákat (amelyekben minden
    argumentum ─ köztük az alany is ─ testvére a predikátumnak)
* Sok nyelvben találhatóak ezért eltérő keverékmegoldások.

### 2.1.1. Az endocentricitás és az X' struktúrák

* A c-struktúra-elméletek célja az, hogy (az újraíró szabályok formájára
  vonatkozó általános megszorítások révén) a létrehozható fák körét leszűkítsék
  azokra a típusokra, amelyek ténylegesen szükségesek a természetes nyelvi
* Ezek közül az legelterjedtebbek:
  * a lexikális és funkcionális kategóriák projekcióit leíró X'-elméletek
* Az X'-elmélet minden változata magában foglalja az endocentricitás elvét:
  * minden frázis összetevői között feltételez egy kategoriális fej
  * megszabja a frázis lényegi szintaktikai tulajdonságait, mindenekelőtt kateg 
1. A kategoriális struktúrában minden szerkezet feje azonos kategóriájú, de
   kisebb vonásszámú (komplexitású), mint a szerkezet maga. (Az összetevők
   közötti vessző a sorrend tetszőlegességére utal):
   a. X' → X , YP ─ ahol
    X az összetevő kategoriális feje,
    az YP által elfoglalt szerkezeti helyet pedig (vagyis a zéró vonásszámú
    fejek maximális kategóriákkal betölthető testvércsomópontját)
    komplementum pozíciónak nevezzük
   b. XP → YP, X' ─ ahol
    X' az összetevő kategoriális feje,
    az YP által elfoglalt szerkezeti helyet pedig (vagyis az egyvonásos
    fejek maximális kategóriákkal betölthető testvércsomópontját)
    specifikáló [specifier] pozíciónak nevezzük
* Többvonzatos fejek kezelésére vagy a rekurzív (aa)-t vagy a nem-bináris (ab)-t
szokták még felvenni:
   aa. X' → X', YP
   ab. `X' → X , YP*`
2. A szabad határozókat (adjunktumokat) általában
  XP által dominált XP testvéreiként vagy X' által dominált X' testvéreiként 
  XP -> XP   YP
          [ADJUNCT]
  X' -> X'   YP
          [ADJUNCT]
3. Az X' elmélet későbbi fejleménye az endocentricitás elvének a kiterjesztése
   a zárt elemszámú grammatikai kategóriáknak, az ún. funkcionális
   kategóriáknak az elemeire ─
   olyanokra, mint pl. az I kategóriacímke alá sorolt segédigék,
   a C kategóriacímkét viselő alárendelő kötőszók,
   a D kategóricímkével ellátott névelők stb.
   (A terminus nem az LFG-n belül jött létre, így a benne szereplő
   "funkcionális" szó nem az LFG-n belül megszokott értelemben értendő.)
* A kiterjesztés azt a felismerést tükrözi, hogy
  a frázisok szintaktikai viselkedését összetevőik közül
  sokkal inkább meghatározzák ezek a korábban némiképp lenézett "formaszók",
  mint a testvércsomópontjaikban álló ─ és szemantikailag tartalmasabb ─
  főnevekkel, igékkel, melléknevekkel alkotott szerkezetek.
  => a formaszót kell kategoriális fejnek tekinteni, ennek megfelelően pedig
  a frázis egésze is a formaszónak, és nem a "tartalmas" összetevőnek a
  projekciója
* A "tartalmas" szók és a "formaszók" szintaktikai tulajdonságai között
  mindazonáltal lényeges különbségek is vannak (l. pl.  az 2.5.1. pontot),
  => egy általánosabb szinten meg kell különböztetnünk egymástól a
  funkcionális kategóriák bármelyikébe tartozó és
  a főbb lexikai kategóriák valamelyikébe sorolható elemek csoportjait. Ezen
  az általános szinten a tetszőleges funkcionális kategóriához tartozó
  elemekre F^0 , a főbb lexikai kategóriákba tartozókra L^0 kategóriájúakként
  hivatkozhatunk.
* A projekciókkal rendelkező X kategóriák készlete így tehát:
    a. funkcionális kategóriák (F ): C^0, I^0, D^0
    b. lexikai kategóriák (L ): N^0, V^0, A^0, P^0
4. A két típussal alkotott maximális projekciók (FP-k, ill. LP-k) lehetséges
   kombinációi meglehetősen korlátozottak.  Az LFG sajátosságai az X' elmélet
   vonatkozásában:
  1. Az angolhoz hasonló nyelvek alapvetően valóban az X' elveit követik, de ez
     nem minden nyelvben szükségszerű.  
* Az X' elmélet szerint építkező nyelvekre is állnak azonban az alábbiak:
  2. Minden c-struktúrabeli összetevő jelenléte (a fejeké is!) opcionális.
     (Jelenlétük nem a c-struktúrákra, hanem az f-stukturákra vonatkozó
     jólformáltsági követelmények, megszorítások és elvek ─ mint pl. a
     teljesség, koherencia, konzisztencia, l. 1.3.3. ─ interakciójából
     következik.) 
  3. Betartandó a lexikai integritás tétele (l. 1.3.2.2.)
    * minden egyes X^0-t csak morfológiailag teljes szó képviselhet ─
      puszta affixumok vagy különálló morfológiai jegyek (bár mindkettő
      információt adhat az f-struktúrának) nem generálhatóak a
      frázisstruktúrában. Ez az F^0-okra is követelmény
    * Az angolban pl.  C kategóriájú elem a that, if,
      I kategóriájúak az idő-mód segédigék, minden más ige pedig V 
    * Az oroszban (legalábbis az egyik lehetséges elemzés szerint)
      C a что 'hogy' és a kérdő ли '-e, vajon', I az összes finit igealak, míg
      V^0-ba az infinitívuszok tartoznak
    * Más szóval: az LFG-ben a funkcionális kategóriák a lexikai kategóriáknak
      egy speciális alosztályát képviselik.
  4. Indokolt feltételezés, hogy az I' vagy VP-t vagy S-t dominálhat közvetlenül.
* A c-struktúrákra vonatkozó konkrét megszorítások
  levezethetőek ezekből az absztraktabb, univerzális
  c-struktúra-megszorításokból:
  a c-struktúra-minták közül azok a jelöletlenek, amelyek megfelelnek ezeknek az
  univerzális endocentrikus megszorításoknak.

### 2.1.2. A predikátum és az argumentumok összetartozásának az elve és az S kat

* a predikátum─argumentum-lokalitás elve: az, hogy
  a predikátumok igyekeznek minél közelebb állni argumentumaikhoz ─ az alany is
  (tagalog, magyar, malayalam, warlpiri, dzsivarli, dzsakaltek stb.).  Ez az elv
* mindenekelőtt a mondatszerkezet legmagasabb szintjén keresztezi az endocentet,
  mivel azt igényli, hogy az ige az összes argumentumával egy szinten
  kapcsolódjék össze mondattá ─
  anélkül, hogy előbb ezek egy részével igei típusú projekciókat (V', VP) alkotn
* Ennek kezelésére azt feltételezzük, hogy
  az univerzális grammatika módot ad egy
  nem projektív, egzocentrikus, az IP-vel nem egybeeső S kategóriára is. 
  * Nem projektív: nincs kategoriális (=strukturális) feje,
  kategóriája egyetlen X^0-éval sem azonosítható.
  * Egzocentrikus: funkcionális fejének kategóriája nincs megkötve ─
    lehet V, N, A, VP, NP, AP stb.)
* Ennek kapcsán bevezetjük a következő terminusokat:
  a. belső alanyú nyelvek: ahol az I testvére S kategóriájú egység.
    * Az alany ezekben a nyelvekben (amilyen pl. az ír és a velszi) S-en, azaz I
      komplementumán belül jelenik meg.
                                       I'
                                   I      S
                                       ...XP...
c                                        subj
  b. külső alanyú nyelvek: ahol nincs S; az I testvére itt VP,
    az alany pedig ezen kívül, azaz nem I komplementumán belül, hanem
    IP SPEC-jeként jelenik meg.  Ilyen nyelv pl. az angol.
                                       IP
                                   X'      I'
                                 subj    I   VP
* S kategóriájú összetevő a fentiek értelmében csakis belső alanyú nyelvekben
* S mindig egzocentrikus. Ez nem zárja ki azt, hogy
* S belső felépítése akár konfigurációs, akár nemkonfigurációs lehessen.
* Konfigurációsaknak azokat a szerkezeteket nevezzük, amelyekben
  az összetevők szintaktikai funkciója <= a szerkezetben elfoglalt pozíciójuk
* Az X' elvek alapján felépülő frázisok konfigurációs szerkezetek.
* Nem-konfigurációs szerkezetről akkor beszélünk, ha
  a funkció <= nem az összetevő pozíciója, hanem tipikusan a morfológia

### 2.1.3. Belső alanyú nyelvek [internal subject languages]

#### 2.1.3.1. A nem-konfigurációs S

* A projektivitás hiánya miatt S nem köteles binárisan ágazni ─
  * lehet több, akár nagyon sok különböző kategóriájú közvetlen összetevője is:
  * `S → X*` ─ ahol az X-ek tetszőleges fajtájú és vonásszámú kategóriák 
  * ilyenkor az egyes szintaktikai funkciókat viselő összetevők helye általában
    nem rögzített, azaz a szerkezet nem konfigurációs.

#### 2.1.3.2. A konfigurációs S

* Nem projektív, egzocentrikus szerkezet is lehet azonban konfigurációs.
  * például ha S úgy bomlik binárisan két maximális főkategóriára, hogy ezek
    funkciója (pl.  lineárisan) rögzített, úgy a szerkezet egzocentrikus, de kon
                                      IP/I'
                                     I    S
                                     NP   XP
* Amennyiben XP is endocentrikus,
  S pedig predikátumvégű [predicate-final],
  azaz funkcionális feje mindig a záró összetevő, úgy
  a fenti struktúra megfelel az írben és a velsziben megtalálható konfig VSO-nak
* A velsziben a
  * finit ige mondatkezdő: Vfin-Subj-Obj. Ha azonban az igei tartalmat a
  * infinit
    * az infinit igealakot hagyományosan deverbális főnévnek [verbal noun] tekin
    * `AUX_fin  S [V_nonfin  O]`
    * a mondat kezdő eleme a finit AUX lesz,
    * az infinit igei szerkezet pedig ennek a komplementuma
* Elterjedt elemzés, hogy
  a finit alakok az I,
  a deverbális névszók az S mögötti VP-ben, V pozícióban vannak. Ha ebből
  indulunk ki, akkor a fenti két mondatnak az LFG-ben a következő szerkezetet
  tulajdoníthatjuk:
a.  IP/I' b.  IP/I' I S I S gwelodd gwnaeth

        ~~~~~~~IP/I'~~~~~~~                   ~~~~~~~IP/I'~~~~~~~
        I                 S                   I                 S
        |            ~~~~~~~~~~~~             |            ~~~~~~~~~~~~
      látott        NP        VP/V'        csinált        NP        VP/V'
                  János        NP                       János    VP      NP
                            sárkány                             látás sárkány

## 2.2. Attribútumok és értékek 

### 2.2.1. A funkcionális attribútumok/jegyek [functional attributes/features]

* Az f-struktúrákban attribútumokként a lexikai egységeknek és a szintaktikai
  összetevőknek a funkcionális jegyei szerepelnek.
* Funkcionális jegyeknek tekintjük azokat a grammatikailag releváns
  tulajdonságokat, amelyek nem kategoriális természetűek.
* Ilyenek: a
  * mondatrészszerep (más néven: grammatikai funkció: SUBJ, OBJ, ADJ stb.), a
  * morfoszintaktikai jellemzők (szám, személy, idő, mód, eset, grammatikai nem)
  * a lexikai egységek PRED nevű jegye, amelynek értéke mindig az adott
    egységnek a (vonzatkeretet is tartalmazó) szemantikai formája. Ezek a jegyek
* A funkcionális attribútumoknak három fő típusuk van:
  a grammatikai jegy, a grammatikai viszony és a szemantikai jegy.
  * Formálisan a hozzájuk rendelhető értékek típusa különbözteti meg őket
    (részletezve l.  2.2.3.)

### 2.2.2. Értéktípusok [value-types of attributes]

Az érték lehet:
  1. egyszerű szimbólum: ACC, SG, PAST, +, -, 1, 2, ...
  2. szemantikai forma: 'BOY', 'LOVE<(↑SUBJ),(↑OBJ)>' (l. 2.6.2.)
  3. alárendelt f-struktúra
  4. fonológiai forma: it, there (angol); fittyet [hány vmire], [bedobja] a
     törülközőt 
1. Az egyszerű szimbólumok [simple symbols] a nyelvleírásnak (az univerzális
   grammatikának) primitív általános terminusai, számuk korlátozott (azaz véges) 
2. A szemantikai formák [semantic forms] ─ részletes jellemzésüket l. az 2.6.2.
  * a nyelvi egységeknek egyrészt a jelentését, másrészt pedig
    a jelentésükből magyarázható egyedi szintaktikai tulajdonságaikat kódolják.
  * Döntő többségükben tehát nyelvspecifikus objektumok, s nem az univerzális
  * Számuk egy-egy nyelvi rendszeren belül azonban szintén véges (még ha nem
    alkotnak is zárt osztályt).
  * Forrásuk a lexikon: egy/más részük ott őrződik/ keletkezik, tehát a
  * Felépítésüket azonban mindig teljes mértékben a szótári komponensben nyerik
    * A lexikai integritás értelmében nincs a szintaxis számára látható szerkjük
  * felső vesszők között jelenítjük meg őket.  
  * teljes grammatika a tételek jelentését a belső jelentésszerkezetet is
    feltüntető formulák képében rögzíti
    * A szintaxis számára azonban az elemek belső jelentésszerkezete érdektelen.
      Ezért (de azért is, mert a szójelentések leírásában még távolról sincsenek
      általánosan elfogadott formalizmusok) a szintaktikai munkákban a PRED jegy
      értékében nem szerepeltetünk jelentésleírásokat, s
    * ezek helyén a tétel betűképét tüntetjük fel (általában nagy betűkkel
      kiírva) ─ pl.: (↑PRED)='LÁNY', (↑PRED)='AGGLEGÉNY' stb.
  * A régensek szemantikai formája a tétel vonzatkeretének a leírását is
    tartalmazza (részletesebben l. 2.6.2.7.), pl.: 'LOVE (x,y) <(↑SUBJ),(↑OBJ)>'

3. Az f-struktúrák mibenlétét 1.2.3. és 1.2.5. alatt már tárgyaltuk. Az ott
  * A lehetséges f-struktúrák száma elvileg egy-egy nyelven belül is végtelen.

4. Fonológiai formák [phonological forms]: a jólformáltsághoz elengedhetetlen,
   de önálló jelentés nélkül használt alakok (részletesebben l. 2.2.3.3. és
   4.2.1.). Lényeges szerepet játszanak az idiómák kezelésében.

A különböző típusú értékek előfordulási helyei:
előfordulási hely     értéktípus

a. f-struktúrában                       CASE DATIVE
 lexikai tételben  egyszerű szimbólum   PRED 'pro' 
    annotációkban  szemantikai forma    PRED 'LOVE<(↑SUBJ), (↑OBJ)>'

b. f-struktúrában   alárendelt f-struktúra      SUBJ [ ]
                    szimbólumok halmazaq        PER {1, 2}
                    szemantikai formák halmaza  PRED {'MARY','JOHN','PAUL'}
                    f-struktúrák halmaza        ADJ
* kapcsos zárójel
  * a halmazelemek közé vesszőt tegyünk
  * egyébként vagylagos (diszjunktív) kapcsolat jelölésére használjuk


### 2.2.3. A funkcionális attribútumok típusai

(1) grammatikai funkció ─ ha az érték ALÁRENDELT F-STR. (vagy ezek halmaza)
(2) grammatikai jegy ─ ha az érték EGYSZERŰ SZIMBÓLUM (vagy ezek halmaza)
(3) szemantikai jegy ─ ha az érték SZEMANTIKAI FORMA vagy FONOLÓGIAI FORMA

#### 2.2.3.1. A grammatikai viszonyok (=grammatikai vagy szintaktikai funkciók)
[grammatical/syntactic relations, grammatical/syntactic functions]

* A hagyományos nyelvtanok mondatrészviszonyainak  a megfelelői,
  * alanyi, tárgyi és egyéb vonzatfunkcióknak, szabad határozói szerepeknek stb
  vagyis a mondat alkotórészei között lehetséges szintaktikai kapcsolattípusok.
* egy véges univerzális halmaznak az elemei. Ilyenek:
* SUBJ(ect), OBJ(ect), ADJ(unct), stb. ─ részletesebben l. 2.3.
* Formális szempontból: olyan attribútumok, amelyekhez értékként f-struktúrák
  (vagy f-struktúrák halmazai) tartoznak.
* Grammatikai tartalmuk:
  jelentés nélküli (tehát szemantikailag interpretálhatatlan) kapcsolatok a
  felszíni szintaktikai összetevők és a lexikai (arg) szerkezetek között.
  * Szerepük mindenekelőtt az ezek közötti leképezések biztosítása.
  * Képletesen: olyan csatlakozózsinórok szerepét töltik be, amelyek
    egyik végükkel a szótári tételek argumentumhelyeihez,
    a másikkal a c-struktúra csomópontjaihoz csatlakoznak
    * egy-egy ilyen "zsinórt" a "csatlakozási pontok" azonos megjelölése ad meg
* A grammatikai funkcióknak az argumentumhelyekhez és a c-struktúrabeli
  összetevőkhöz való hozzárendelését
  a grammatikai funkciók __kódolásának__ nevezzük.
  * két különböző komponensben és különböző mechanizmusokkal történik, meg kell
  * a szintaktikai kódolást és a lexikai kódolást
    (részletesebben l. 2.5. és 2.7.)
* a grammatikai funkcióknak az összetevőkre való leképezése nyelvspecifikus
  (különböző mértékben és módon hivatkozhatnak c-struktúrabeli pozíciókra, ill.
  bizonyos morfémák jelenlétére).
* különböző szintaktikai "rangokat" adnak az az összetevőknek, amelyekhez
  * az összetevők mondattani lehetőségei ettől függenek
    * A kontrollhatóságuk, kontrollálási képességük, anaforikus viszonyaik,
      egyeztetési lehetőségeik stb. terén aszimmetriák

#### 2.2.3.2. A grammatikai jegyek [grammatical features]

* Formális szempontból: olyan attribútumok, amelyekhez értékként egyszerű
  szimbólumok (pl.: ACC, DAT, MASC, SG, PL, PAST, +, ─, 1, 3 stb.) vagy
  ilyenekből álló halmazok tartoznak.
* Grammatikai tartalmuk: az összetevők (mindenekelőtt a lexikai egységek)
  szintaktikailag releváns, nem viszonyjellegű tulajdonságai, morfoszintaktikai
* az összes lehetséges emberi nyelv leírásához elégséges a grammatikai
  jegyeknek egy korlátozott (véges) univerzális halmazával számolnunk 
  * eg CASE, GENDER, NUMBER, PERSON, TENSE, PRED, FINITE stb.
* Többségük tehát a hagyományos leírásokból is ismert grammatikai tulajdonságok
* e tulajdonságokat a szóalakok hordozzák => a lexikai kódolás (2.7.) vezeti be

#### 2.2.3.3. Szemantikai jegy: a PRED és a FORM attribútum [semantic feature]

* Formális szempontból: olyan attribútum, amelyhez értékként szemantikai forma
  (részletesebben l. 2.6.2.) vagy fonológiai forma tartozik.
* Tartalmilag: valamely lexikai egység szemantikai tartalma és a szemantikai
  tartalomban gyökerező szintaktikai elvárásai.
* csak a PRED minősül szemantikai jegynek (csak ehhez rendelhető értékként
  szemantikai forma). Ide kell azonban sorolnunk
* a FORM attribútum tekinthető a PRED egy sajátos, "degenerált" változatának
  * értéke mindig jelentés nélküli fonológiai forma.
  * Egy adott lexikai tétel jellemzése e két jegy közül csak az egyiket
    tartalmazhatja.
  * mert a szerkezetek tagjai egy másik tagra vonatkozóan vagy csak/vagy csak
    * szemantikai elvárásokat állítanak fel (s ekkor az alak mindig közömbös),
    * annak a formáját igénylik ─ a jelentése nélkül
      * nem úgy értendő, hogy a formához tartozó jelentés ilyenkor közömbös
        (tehát jelen lehet, csak éppen mindegy, hogy mi), hanem úgy, hogy
      * a forma csakis mindenféle jelentéstől megfosztva léphet be
  * ie ha az egység jelentést hordoz, akkor a formája a grammatika számára
    sohasem releváns
    ha viszont nem hordoz önálló jelentést, akkor a forma grammatikai
    relevanciát kap (részletesebben l. 4.2.1.).
* értékeik objektumok (nem pedig objektumokra vonatkozó információk)
  => azonos értékek esetén is unifikálhatatlanok (részletesebben l. 2.6.2.).
* Szokásos konvenció, hogy a lexikai elemek jellemzésében és az f-struktúrákban
  első elemként mindig a PRED vagy FORM attribútumot szerepeltetjük.

## 2.3. A grammatikai viszonyok (grammatikai funkciók) csoportjai

### 2.3.1. A grammatikai feltételezettség típusa szerint

#### 2.3.1.1. Vonzatfunkciók és szabad határozói funkciók

1. Vonzatfunkciók
  [subcategorizable functions, governable functions, a[rgument]functions]: azok
  * mindig és csakis egy-egy régens grammatikai igényének a kielégítésére
    lehetnek jelen a mondatokban;
    régensek által a vonzataik számára előírható grammatikai funkciók.
    Lexikai tételek a funkciók közül csak ezeket említhetik.
    Egy vonzatkeretben fajtánként csak egy szerepelhet belőlük
* SUBJ[ect]: alany (Részletesebben l. 2.3.2.1.1.)
* OBJ[ect]: tárgy (Részletesebben l. 2.3.2.1.1.)
* {OBLθ}: a thematikusan kötött oblikvuszi vonzatok halmaza. (Részl 2.3.2.1.2.)
* {OBLFORM}: a címkézett vonzatok halmaza. (Részletesebben l. 2.3.2.1.3.)
* OBJ2 vagy {OBJθ}: (Részletesebben l. 2.3.2.1.2.)
  * az LFG korábbi változataiban második tárgynak (OBJ2) nevezett viszony,
  * az újabb változatokban a thematikusan kötött tárgyi viszonyok {OBJθ}
* COMP[lement] vagy COMPL[ement]: mondatvonzat
  * szerepét "csupasz" (a főmondatba mindössze kötőszóval bevezetett)
    alárendelt tagmondat tölti be.
* XCOMP: predikatív vonzat. (Részletesebben l. 3.2.1.1.)
* POSS[essor]: birtokos vonzat
  * A hagyományosan birtokosnak (birtokos jelzőnek) elemzett frázisok csak
    akkor POSS funkciójúak, ha vonzatai a birtoknak
  * nyelvtől (1 nyelven belül esetleg még szerkezettől) függően is változhat,
    hogy az ún. birtok(os jelző) vonzat-e, vagy csak szabad határozó.
* Megjegyzések
  1. Az indexek értelmezését l. 2.3.2.1.2.  
  2. Az OBJ2 és az OBJθ viszonyáról l. 2.3.2.1.1.
* azokat, amelyek az X' elvek szerint felépülő endocentrikus szerkezetekben
  komplementumpozícióban (azaz X' projekción belül) jelennek meg,
  komplementumfunkcióknak nevezzük
  * Az alany kivételével az összes vonzatfunkció egyben komplementumfunkció is

# 2. Szabad határozói funkciók [nonsubcategorizable functions]:

* azok a diskurzusszervezéstől független (vö. 2.3.1.2.) alárendelt grammatikai
  funkciók, amelyek nem valamely régens grammatikai igényét elégítik ki.
* ADJ[unct]: nem predikatív szabad határozók és jelzők
* XADJ[unct]: predikatív szabad határozók. (Részletesebben l. 3.2.2.1.)
* lexikai tételek jellemzése nem igényelheti őket
  => csak a szintaxisban lehetnek kódolva
* Ezekből egy mondatban egynél több is lehet.

* A fenti meghatározások értelmében vonzatfunkcióval vagy szabad határozói
  funkcióval minden egyes alárendelt frázisnak rendelkeznie kell.

#### 2.3.1.2. Diskurzusfunkciók [discourse functions, d-functions]

* amelyeket a frázisok (a vonzatok vagy adjunktumok közé való besorolásuktól
  függetlenül, vagyis e mellett) a mondatnak a kommunikációs szituációhoz való
  illesztése céljából kaphatnak
* Diskurzusfunkcióval nem minden frázisnak kell rendelkeznie
* A "tiszta" diskurzusfunkciók: FOC(us), TOP(ic)
* Ezeken kívül a SUBJ vonzatfunkció egyben sajátos diskurzusfunkciót is betölt
  azokban a mondatokban, amelyekben nincs sem TOP-, sem FOC funkciót hordozó
  összetevő
  * semleges mondatok
  * alapesetként (azaz jól körülhatárolható esetektől eltekintve) a mondat
    topikjaként is értelmezzük a grammatikai alanyt.

#### 2.3.1.3. A funkciók prominencia-hierarchiája

A feltételezett univerzális szintaktikai funkciók prominenciahierarchiáját és a
funkciók lényegi csoportjait az alábbi ábrában foglaljuk össze:

non-a-fns ~~~~a(rgument)-functions~~~~  non-a-fn
                ~complement functions~
TOP  FOC  SUBJ  OBJ  OBJθ  OBLθ  COMPL  ADJUNCT
discourse-func  ~~~~~~~~non-d-functions~~~~~~~~

* a-fns (=vonzatfunkciók): Régensek lexikai vonzatai
  * A funkcionális unicitás (l. 1.3.1.2.) értelmében
    egy f-struktúrán belül minden vonzatfunkció max egyszer fordulhat elő.
  * Primitív jegyekkel jellemezhetők, amelyek a lexikai leképezés elméletében
    (l. 2.7.) játszanak szerepet.
* non-a-fns: Lexikailag nem megköveteltek
  * Nem vonatkozik rájuk a funkcionális unicitás (l. 1.3.1.2.) követelménye
  * Az anaforikus kötések elmélete (l. 3.3.) szempontjából is más státusúak,
    mint az a-funkciók.
* d-fns: szintaktizált diskurzus-funkciók
  * a diskurzus szempontjából leginkább kiemelkedő egységek funkciói
  * A bővítményhierarchiának ők a legprominensebb tagjai.
  * Ez gyakran ikonikus módon is kifejeződik c-struktúrabeli tulajdonságaikban
    (pl. mondatkezdő, k-vezérlő pozíció)
    * A SUBJ univerzálisan fakultatív kifejezője a default TOP-nak
    * Ő az egyetlen a-funkció, amely egyben d-funkciót is betölt.

### 2.3.2. A thematikus szerepekhez való viszonyuk alapján

#### 2.3.2.1. A funkció által kifejezhető szerepkör szerint

─ szemantikailag/thematikusan nem korlátozott funkciók
─ szemantikailag/thematikusan korlátozott funkciók
─ címkézett (idioszinkratikus) funkciók

##### 2.3.2.1.1. Szemantikailag/thematikusan korlátozatlan funkciók
[semantically / thematically unrestricted functions]

* különböző thematikus szerepeket viselő argumentumokhoz is társulhatnak, ill.
  társítatlanok is maradhatnak (s ezáltal nem-thematikus vonzatot ─ l. 2.3.2.2.
  ─ eredményeznek):
* SUBJ, OBJ, POSS ─ valamint a korábbi írásokban szereplő OBJ2, amelynek a
  helyébe később a thematikusan korlátozott tárgyak {OBJ θ } halmaza lépett.
* amikor nincsenek szemantikai argumentumhellyel társítva ─ szemantikailag
  (teljesen v. részlegesen) üres, pleonasztikus elemek is hordozhatják. Ilyen
  * pl. az angol there és it, amelyek közül az utóbbi többek között az
  időjárásigék szemantikai argumentumhoz nem társuló alanyaként is használatos,
* alábbi kritériumok "lefelé" határolják el az adott funkciót a
  bővítményhierarchián lejjebb lévőktől):
  * SUBJ
    1. Reflexiválásnál ─ legalábbis finit mondatokban ─ nem lehet kontrollált
       (ellenpéldák vannak), viszont szeret antecedens lenni: még ha van is más
       megengedett olvasat, szinte mindig jó az az olvasat is, amelyben az
       alany kontrollál
       Hasonló a helyzet a kölcsönös névmásokkal is: pl.:
       *Maguk/egymás megmutatták a fiúkat Palinak a fényképen.
    2. Fonológiailag realizálatlan marad, ha referenciálisan függ egy másik
       régens valamely vonzatától (tehát ha az kontrollálja őt). Példa az
       alábbi, 3.  pontban látható.  
    3. Egyéb feltételek teljesülése esetén
      ő maga kontrollálhat ilyen realizálatlan alanyt
      pl.: János elment Ø vásárolni.
    4. Passzívumban ─ ha egyáltalán megjelenik ─ "visszalép" a ranglétrán:
       egyes nyelvekben OBLθ-ként, másokban ADJ funkcióban jelenik meg.
    5. Mellérendelésbeli azonosság esetén törölhető. (Nyelvfüggő tulajdonság.) Pl.:
      I came and got the book.  
      * Nem kötelező minden nyelv minden igéjének alannyal rendelkeznie. 
        * angol időjárás-igék alanyaként álló it szemantikailag talán nem üres,
          mivel kontrollálhat XADJ-ot, de az oroszban ez nem megy: 
      While snowing, it never rains.
      'Miközben havazik, sohasem esik.'
      `*`Темнея, стало очень холодно.
      `*`Sötétedve nagyon hideg lett.'
      * A magyar időjárás-igéknek az oroszhoz hasonlóan nincs kontrollálható
        alanyi viszonyuk. Ezt jól illusztrálja az, hogy az orosz példa magyar
        megfelelője szintén agrammatikus.
  * OBJ
    1. Passziválásnál alannyá lép elő. (Nyelvfüggő tulajdonság.) 
    2. Kontrollálhat bizonyos másodlagos predikátumokat, pl. a rezultatíumvokat.  
      (Nyelvfüggő tulajdonság.)
      Pl.: János Pétert elküldte Ø vásárolni.
  * OBJ2: nem könnyű elkülöníteni az OBJ-től.
    * Külön funkcióként való felvételét tulajdonképpen annak köszönhette, hogy
      a ditranzitív igék kezelése egyébként ütközött volna a funkcionális
      unicitás (l. 1.3.1.2.) követelményével.
    * Szintén kontrollálhatott realizálatlan alanyt.  
    * a korábban OBJ2-nek tekintett vonzatokat újabban thematikusan kötött
      tárgyaknak tekintik és OBJθ-nak jelölik (l. alább).

##### 2.3.2.1.2. Szemantikailag/thematikusan korlátozott funkciók
  [semantically / thematically restricted functions]

* csak egy-egy konkrét thematikus szerepet (vagy szereposztályba tartozó
  szerepek valamelyikét) hordozó argumentummal társíthatók. Társíthatók
  * olyan argumentummal is, amely több thematikus szerepet hordoz, amennyiben
    ezek között szerepel a megfelelő szerep (vagy a megfelelő szereposztály
    valamely képviselője).
* Ilyen funkciók:
  * COMP, XCOMP, ADJ, XADJ ─ a PROP[osition] (=Állítás) thematikus szerepre
    korlátozódnak 
  * OBLθ típusú funkciók: a PROP-tól különböző konkrét thematikus szerepek vagy
    szereposztályok kifejezésére korlátozott oblikvuszi funkciók:
    OBL_AG, OBL_LOC, OBL_DIR stb.
  * OBJθ típusú funkciók: a PROP-tól különböző konkrét thematikus szerepek vagy
    szereposztályok kifejezésére korlátozott tárgyi funkciók:
    OBJ_TH, OBJ_BEN stb.
* Az {OBLθ} halmaz a thematikusan kötött oblikvuszi vonzatok halmaza
  * csak oblikvuszi formák révén ─ vagyis az alaphasználatukban szemantikailag
    tartalmas viszonyítóelemek valamelyikével (határozóraggal, névutóval,
    prepozícióval stb.) jelölt, esetleg határozószós frázisok révén
    ─ megjeleníthető vonzatviszonyok,
    amelyeket az általuk kifejezhető egyetlen thematikus szerep definiál
  * A halmaz minden tagját az általa megjeleníthető thematikus szerep
    különbözteti meg a többitől
    * Az egyes viszonyokra utaló szimbólumokat ezért a thematikus szerepek
      neveivel különböztetjük meg egymástól ─ ezeket a θ változó helyén alsó
      indexként tüntetjük fel: OBL AG , OBL LOC , OBLBEN stb. Ezekben a
  * a régens csak a thematikus szerepet és a kifejezés oblikvuszi módját írja
    elő, de ezen túlmenően a frázis formáját nem korlátozza.
  * pl _befér_ OBL_DIR funkciójú vonzataként tehát a következő frázisok bármely
    * a ház-ba, a szekrény mögé, a pad alá, ide, mindenhova.
  * A címkézett funkcióktól (l. 2.3.2.1.3.) való eltérésüket jól illusztrálja a
    _lakik_ ige OBLLOC funkciójú helyhatározói vonzata,
    * bármilyen lokális tartalmú viszonyítóelemmel ellátott főnévi frázis és
      bármely lokális tartalmú határozószó felléphet: ól-ban, egy hajó-n, a
      torony-nál, a híd alatt, a hegyen túl, itt, valahol stb.
* az LFG korábbi változataiban még második tárgynak (OBJ2) nevezett és
  thematikusan korlátozatlannak feltételezett egyetlen viszonyt váltotta fel.
  * OBJ2 is csak egy-egy thematikus szerepet képesek megjeleníteni. Az
  * nem viselnek szemantikailag tartalmas viszonyítóelemeket (funkciójukat
    vagy csak a pozíciójuk, vagy szemantikai tartalom nélküli, tisztán
    grammatikai szerepű formatívumok kódolják), és
  * viselkedésük közelebb áll a tárgyakéhoz (pl. nem egy nyelvben passzív
    mondat alanyává válhatnak). Ezek a viszonyok
  * csak kéttárgyas és ilyenekkel derivációs kapcsolatban álló szerkezetekben
    fordulnak elő, így a magyarban nem találkozunk velük
    eg John (SUBJ) gave Mary (OBJ) a book (OBJ2/OBJ TH )
  * Az ige mögött másodikként álló tárgy kizárólag Téma szerepű argumentumot
    nevezhet meg, és 
    * szemben az igét közvetlenül követő, OBJ funkciójú tárggyal ─
      sohasem fejezheti ki pl. az esemény BEN[eficiens] szerepű résztvevőjét. 

##### 2.3.2.1.3. Címkézett funkciók [idiosyncratically marked oblique objects]

* oblikvuszi formájú vonzatok
* régens konkrétan és közvetlenül egy viszonyítóelem FORMÁJÁNAK a viselését
  követeli meg (gyakran a vonzatviszony thematikus tartalmától teljesen
  függetlenül); s azt mintegy címkeként rendeli hozzájuk ─ mint a következő
* eg hisz vmi-ben, belefárad vmi-be, ért vmit vmi alatt vagy vmi-n. A címkézett
* a megkövetelt viszonyítóelem különbözteti meg egymástól, így a rájuk utaló
  szimbólumokban magát a viszonyítóelemet tüntetjük fel alsó indexként ─
  * vagy az alakját, vagy a grammatikai elnevezését szerepeltetve ebben a
  * OBLnak (vagy: OBLdativus)

#### 2.3.2.2. A konkrét előfordulás thematikus értéke szerint

* thematikus vonzatok ←→ nem-thematikus vonzatok
* Ez a kritérium nem funkciótípusokat különít el, hanem
  azt fejezi ki, hogy egy adott régens mellett az adott funkció hordozója
  régensének valamely argumentumát fejezi-e ki vagy sem:
* 1. Logikai/thematikus vonzat [logical/thematic argument]:
  * saját régensének valamely szemantikai argumentumával párosított (azt kifej)
  * Thematikus szerepe van és régense szemantikai szelekciót gyakorol rá.
  * Minden szubkategorizáló funkció alkalmas (a megfelelő típusú) thematikus
    vonzatok kifejezésére.  
* 2. Nem-logikai/nem-thematikus vonzat [nonlogical/nonthematic argument]: olyan
  * nincs párosítva saját régensének egyetlen szemantikai argumentumával sem,
  * nincs jelentése, vagy
    egy másik régensnek az argumentumát jeleníti meg (l.  3.2.1.2.: Raising).
  * Thematikus szereppel nem rendelkezik, és
    saját régense szemantikai szelekciót sem gyakorolhat rá.
  * Csak szemantikailag nem korlátozott funkciót (SUBJ, OBJ, OBJ2) viselhet.
* Fajtái: felemelt alany [raised subject]
          expletív alany [expletive subject]
          idimatikus tárgy [idiomatic object]

#### 2.3.2.3. Propozicionális vagy komplex jelentésű funkciók
  [semantically complex arguments]

* a PROP (=Propozíció, azaz Állítás) thematikus szerepre korlátozott funkciók
* Szemantikailag komplex vonzatoknak azért nevezik őket, mert
  felépítésük olyan, mint a szokásos mondatoké: egy predikátumot az
  argumentumaival és esetleges szabad határozóival együtt tartalmaznak.
  Szintaktikai kategóriájuk lehet:
  * CP (a COMP és ADJ funkciót viselőké, azaz a zárt funkciójúaké ─ l. 2.3.3.) 
    Pl.: Péter tudja, [COMP hogy Mari tegnap elment.]
    [ADJ Mivel Mari tegnap elment], Péter szomorú.
  * XP (az XCOMP és XADJ funkciót viselőké, azaz nyitott funkciójúaké ─ 2.3.3.) 
    Pl.: János utál [XCOMP hagymát pucolni].  
    János [XADJ verseket skandálva] pucolta a hagymát.

### 2.3.3. Teljesség (logikai zártság) szerint

zárt ←→ nyitott (=predikatív)
1. Zárt funkciók [closed functions]: olyan funkciók, amelyeknek az
  értéke mindig csak önmagában is teljes és konzisztens (l. 1.3.3.) f-struktúra
  lehet ─ ahol tehát az adott f-struktúrába információkat küldő c-struktúrabeli
  összetevők egyesített jelentése önmagában véve (az adott f-struktúrán kívüli
  információkra való hivatkozás nélkül) is logikai-szemantikai értelemben zárt
  formulát képvisel. Az XCOMP és XADJ kivételével mindegyik funkció ilyen.

2. Nyitott v. predikatív funkciók [open/predicative functions]: 
  * Nyitott grammatikai funkciót hordoznak mindazok (és csak azok) a
    szintaktikai szerkezetek, amelyekben
    a fejükként szereplő régens valamelyik vonzatviszonyának a referense a
    szerkezeten belül sohasem nyerhet önálló lexikai megjelenítést egyetlen
    mondatban sem, valamint nem azonosítja őt a régens lexikai reprezentációja
    és a szerkezet belső összefüggései sem. Pl.: részegen: 'miközben
    ..[SUBJ=?].. részeg'
  * A nyitott funkciót betöltő egység tehát önmagában véve logikai értelemben
    mindig predikátum: nyitott formulát képvisel, amely
    csak úgy zárható le, ha a fej önálló formával nem realizálható vonzata egy
    kontrollviszony révén a szerkezeten kívül álló kontrollálótól kap értéket
    (referenciát)
    * Funkcionális struktúrájuk csak a kontrolláló bővítmény "adataival"
      kitöltve lesz teljes (csak így tehet eleget a teljesség követelményének)
  * eg Pali részegen táncolt: 'Pali táncolt, miközben [SUBJ=Pali] részeg volt'
  * sohasem lehetnek teljes ("matrix") mondatok állítmányai
    * másodlagos predikátumoknak vagy predikatív bővítményeknek nevezik.
      Kifejezhetők NP-vel, AP-vel, PP-vel, VP-vel.
  * A másodlagos predikátumok nem realizálható vonzata tényszerűen mindig SUBJ.
  * A nyitott funkciók tételesen: XCOMP, XADJ
    * Az XCOMP a nyitott vonzatok, az XADJ a nyitott szabad határozók

  Propozicionális funkciók:

    │ szubkategorizáló-e │            Lexikálisan ki nem fejezett
    |     (vonzat-e)     |            alanyuk értelmezésének az
    │  +      |  -       |            eszköze:
  + │ COMP    │ ADJ      │ → zártak   ─ anaforikus kontroll ─ l. 3.3.2
  - │ XCOMP   │ XADJ     │ → zártak   ─ funkcionális kontroll ─l. 3.2

  A nyitott funkciókat hordozó frázisok (a másodlagos predikátumok) mindig
  valamilyen "járulékos" állítást tesznek a kontrollálóról: annak valamilyen
  attribútumát fejezik ki. A zárt propozicionális funkciók hordozói nem
  predikatívok, mivel nem valamely argumentum attribútumát fejezik ki, hanem:

  ADJ: valamely esemény leírását módosítják azáltal, hogy térben és időben
  elhelyezik

  COMP: PROP thematikus funkciójú argumentumot fejeznek ki.

A zártak alanya is lehet lexikailag ki nem fejezett, de akkor az f-struktúrában
egy névmási szerepű testetlen értéket (a "null pronominal"-ként is emlegetett
pro elemet ─ vö. 1.1.3.2.) feltételezünk, így f-struktúrájuk e pro érték révén
önmagában is mindig teljes:

MARI beteg. [Mivel pro alszik]ADJ, Pali csendben van. ⇒ pro: Mari v. Pali

### 2.3.4. Alanyszerű funkciók [subjective functions]: SUBJ és POSS

Bizonyos közös szintaktikai tulajdonságaik (így pl. az anaforikus kötésekben
mutatott viselkedésük, l. 3.3.1.1. pont) alapján ez a két funkció kitüntetett
alcsoportot alkot.

### 2.3.5. A funkciók főbb csoportjai táblázatban

                        szubkategorizálók   nem szubkategorizálók
                        zárt      nyitott   zárt          nyitott
 |    diskurzus                                   TOPIC
 |    funkciók                                    FOCUS
them  |          |      SUBJ                              OBJ2
korl             |
tlan      vonzat-       OBJ, 
 |        funkciók      OBJ2
                 |
 |               |      OBLθ
them             |      OBJθ
korlt propozi-   |      COMP      XCOMP
 |    cionális                              ADJ           XADJ
      funkciók

* Továbbá
  * POSS(essor), ami valószínűleg korlátozatlan 
  * Ø funkciószimbólum (l. 2.6.2.6.1.).

## 2.4. A szintaktikai információkat kódoló formulák


Tartalmát tekintve a mondat f-struktúrája nem más, mint a szintaktikai szerkezet
egyes pontjaihoz (összetevő-pozíciókhoz, tehát a c-struktúra csomópontjaihoz) és a
mondatban szereplő lexikai egységekhez (lexikai struktúrákhoz) tartozó, s azokban
kódolt funkcionális (=nem kategoriális) szintaktikai információk "összegzése" (unifikációja) egyetlen függvényben. Az f-struktúra ezért teljes egészében "kinyerhető" a
felszíni szerkezetből, amely minden funkcionális információt magában hordoz. A
funkcionális információ azonban a felszíni szerkezetben nem közvetlenül adott (mivel
a morfémáknak és szerkezeti pozícióknak a "tartalmi oldalához" tartozik); továbbá a
felszíni szerkezetben az f-struktúra kódolt darabjai is egyrészt "szétszórtan" találhatók
meg, másrészt gyakran ugyanaz az információdarab több helyen is felbukkan. A
felszíni szerkezet → f-struktúra megfelelés tehát many-to-one jellegű, és nem más,
mint egy szakaszonként monoton függvény [piecewise monotonic function].




61


A leképezést megvalósító eszközrendszer: a lexikai egységek reprezentációihoz és a
c-struktúra pozícióihoz a grammatika explicit formában hozzárendel olyan
formulákat, amelyek az előbbiekben rejlő, az f-struktúrára vonatkozó információdarabokat kódolják. A szerkezethez csatolt formulák együttesét az adott
szerkezet annotációjának, a hozzárendelési folyamatot a szerkezet annotálásának
nevezzük. Az annotációt alkotó formulák tartalmát egy unifikációs műveletekre épülő
kiértékelő algoritmus [solution algorithm] egyesíti. Egy-egy adott mondatra
korlátozódva ezeket a részinformációkat funkcionális egyenlőségek (l. 2.4.1.)
formájában rögzíthetjük (mind a c-struktúra pozícióiban, mind a lexikai struktúrákban). A funkcionális egyenlőségek a grammatika általánosabb formuláinak, a
funkcionális sémáknak (l. 2.4.3.) az adott helyre illeszkedő kiértékelt megfelelői.

### 2.4.1. Funkcionális egyenlőségek


A funkcionális egyenlőségek egy-egy adott mondat konkrét nyelvi egységein belül és
konkrét nyelvi egységei között fennálló szintaktikai viszonyokat kódoló konkrét
formulák. Az összefüggések által érintett f-struktúrákra mindazonáltal nem
alkalmanként változó, egyedileg rögzített "tulajdonnevekkel", hanem Fi formájú
változónevekkel utalunk.
Általános forma: attribútumjelölő/attribútumnév típusjelölő
értékjelölő
[attribute marker]
[type marker] [value marker]
a rész tartalma: ( funkcionális jegy/attribútum )

Példa:

(f5 XCOMP SUBJ)
(f4 PRED)

az egyenlőség
típusa
=
=

az attribútum
értéke
(f5 OBJ)
'pro'


Konvenciók: (i) az attribútumnév zárójelben áll



A funkcionális egyenlőségek nem mondhatnak ellent a funkcionális lokalitás elvének
(l. 1.3.4.1.), amely szerint a jelölők (sem az attribútum, sem az érték megnevezésében) nem tartalmazhatnak kettőnél több függvényalkalmazást, vagyis kizárólag:
egyszerű grammatikai funkciókra
saját grammatikai jegyekre
közvetlen alárendelten belüli funkcióra
közvetlen alárendeltnek a jegyeire

pl.:
pl.:
pl.:
pl.:

(f5 SUBJ)
(f5 NUM)
(f5 XCOMP SUBJ)
(f5 SUBJ NUM)
utalhatnak.


A funkcionális egyenlőségek tartalmazzák azokat az információkat, amelyekből a mondatok f-struktúrái felépülnek. A mondat f-struktúráját kizárólag a felszíni szerkezetben
(l. 1.1.2.2.) megtalálható funkcionális egyenlőségeknek a halmazából építjük fel. Ezt a


62


halmazt a mondat funkcionális leírásának nevezzük (l. az 1.2.4. alatti illusztrációban).

A funkcionális leírásból a megfelelő f-struktúra az ún. kiértékelő algoritmus alkalmazásával áll elő.

### 2.4.2. A funkcionális egyenlőségek alaptípusai és típusjelölőik [type markers]


A funkcionális egyenlőségek különböző típusai eltérő feladatokat látnak el. Egy-egy
konkrét egyenlőség ugyanis
vagy


# 1. maga is egy minimális f-struktúrát képvisel, amelyet bevezet a mondat fstruktúrájába (ilyenek a definiáló funkcionális egyenlőségek, részletesebben l. 2.4.5.1. ;


vagy


# 2. olyan követelményt ad meg, amelyet


a. valamely szótári tétel
vagy b. valamely összetevőnek a grammatikai szerepe
állít fel az őt befogadó f-struktúrákkal szemben (ilyenek a megszorító
egyenlőségek és az egzisztenciális megszorítások, részletesebben l.

#### 2.4.5.2. és 2.4.5.3.).


Ezekre a tartalmi különbségekre eltérő típusjelölők utalnak:

A típus neve:
definiáló azonosság [defining equation]
megszorító azonosság [constraint equation]
egzisztenciális megszorítás [existential constraint]


Típusjelölő:
=
=C
nincs jelölő


Példa:
(f3NUM) = SG
(f3NUM) =C SG
(f3NUM)


Ezeken az alaptípusokon kívül használatosak a belőlük Boole-algebrai eszközökkel
felépíthető komplexebb formulák, valamint a halmazelméleti 'eleme' viszonyt kifejező
0 típusjelölőt tartalmazó "egyenlőségek" is. Az egyes típusokat az 2.4.4. és az 2.4.5.
pontban ismertetjük részletesebben.

### 2.4.3. A funkcionális sémák


A szintaktikai viszonyokat kódoló funkcionális egyenlőségek nem független listaként
vannak mellékelve a c-struktúrához és a lexikai elemekhez, s nem is véletlenszerűen
vannak ezekhez hozzárendelve. A funkcionális leírásban szereplő konkrét
funkcionális egyenlőségek absztraktabb formuláknak, az úgynevezett funkcionális
sémáknak a kiértékelésével jönnek létre, amelyeket túlnyomórészt univerzális vagy
nyelvspecifikusan általános elvek (l. 2.5. és 2.7. pont) rendelnek a megfelelő egységekhez. A sémák formája mindössze annyiban tér el az egyenlőségekétől, hogy az f-




63





funkcionális egyenlőségek
f1=f3
f3=f5
f2=f4
(f4 PRED) = 'Mary'
(f1 SUBJ) = f2

funkcionális sémák




↑=↓
(↑PRED) = 'Mary'
(↑SUBJ) = ↓

stb.


A metaváltozók mindig f-struktúrákra utalnak, de (az fi típusú utalással szemben) nem
a "tulajdonnevével" (mint pl. f5), hanem az annotáció helyéről történő "rámutatással"

↑ : = az annotáció helyét domináló csomópont ("anya") f-struktúrájára utal
↓ : = az annotációval ellátott csomópont ("ego") f-struktúrájára utal.

A metaváltozókként használt nyilak szemléletessége a struktúrákban elhelyezett annotációknál érzékelhető:

S


NP

VP
(↑SUBJ)=↓
↑=↓
(↓CASE)=C NOM

│

V

NP

N
↑=↓
(↑OBJ)=↓
↑=↓
│
(↓CASE)=C ACC
│
saw, V


Mary, N
(↑PRED)='SEE

Det

N
(↑PRED)='Mary'
<(↑SUBJ),(↑OBJ)>'
↑=↓
↑=↓
(↑NUM)=SG
(↑TENSE)=PAST
│
│
(↑PER)= 3
a, Det
dog, N
(↑DEF)= (↑PRED)='DOG'
(↑NUM)=SG (↑NUM)=SG
(↑PER)= 3
(↑PER)= 3

Az annotációk "egymásra mutogatása" tulajdonképpen a c-struktúra közvetítésével történő információáramlást reprezentál. A konkrét fi-ket tartalmazó konkrét kifejezésekhez
(funkcionális egyenlőségekhez) a metaváltozók kiértékelésével jutunk el azt követően,


64


hogy az ágrajz egyes kategóriacímkéihez tetszőleges módon eltérő indexű neveket (fiket) rendelünk. A kiértékelés úgy történik, hogy a metaváltozókat kicseréljük azokra az
fi-re, amelyekre mutatnak. A fenti példa esetében ennek elvégzésével a funkcionális
egyenlőségeknek azt a listáját kapjuk meg, amely az 1.2.4. alatti illusztrációban
szerepelt.

A funkcionális egyenlőségek és a funkcionális sémák közötti viszonyról mondottakból közvetlenül következik, hogy a funkcionális lokalitás követelményét az utóbbiaknak is ki kell elégíteniük.

A mondaton belüli egyes lexikai tételekhez és csomópontokhoz tartozó (funkcionális
séma formájú) annotációknak a kiértékelésével mindig funkcionális egyenlőségeknek
egy-egy véges halmazához jutunk, amely az adott egységet vagy összetevőt jellemzi.

Minden ilyen formulahalmaz egy-egy (részleges) f-struktúrát határoz meg.

A grammatikának természetesen gondoskodnia kell arról is, hogy a struktúra minden
pontjára odaillő, megfelelő tartalmú annotációk kerüljenek. A funkcionális sémák egy
részét a lexikonban, a lexikai egységekhez, más részüket a szintaxisban, a c-struktúra
csomópontjaihoz rendeljük. A két komponensben nem azonosak az annotálás elvei és
mechanizmusai, ezért külön kell tárgyalnunk a szintaktikai viszonyok lexikai, ill.
szintaktikai kódolását (l. az 2.7., ill. az 2.5. pontban).

### 2.4.4. A ↑=↓ séma: a funkcionális fej fogalma


A kategoriális szerkezet (c-struktúra) szempontjából minden frázisban csak azt az
összetevőt tekintjük fejnek, amelynek a projekciója az adott frázis. Ezt az összetevőt
a frázis kategoriális, strukturális vagy X' fejének nevezzük:

Kategoriális fej:

i+1


X

i
... X ...


Az f-struktúra szempontjából a frázis összetevőinek kategoriális tulajdonságai közömbösek. A testvércsomópontok között funkcionális szempontból az jelent rangkülönbséget, hogy tartalmuk az anyacsomópont hierarchikus f-struktúrájának melyik szintjét
építi, azaz saját attribútumaikat annak melyik szintjére küldik:

X -> fX

=fY
│
│

Y

Z
fY  attrY val 
fZ  attrZ val 
 ...

 ...









...
attrX
attrY
...
attrX

val

val

 attrZ
 ...





val  
 




A ↑=↓ séma azt fejezi ki, hogy az adott összetevőhöz tartozó f-struktúra ugyanaz,




65

mint az anyacsomópontjához tartozó, tartalma tehát az anyacsomópontéval unifikálandó.

A strukturális fej (más elnevezései: kategoriális fej, X' fej) fogalmától tehát meg
kell különböztetnünk a funkcionális fej fogalmát:

tartalmaz (sem típus, sem vonásszám tekintetében), azaz minor
kategóriájú egységek és maximális projekciók (XP-k) is lehetnek
funkcionális fejek. Ugyanazon anya alatt lehet egynél több funkcionális fej is [=f-structure co-heads]. Közülük azonban csak egyetlen
egy lehet strukturális fej [c-structure head].

A strukturális fej (az az összetevő, amelyiknek a szerkezet a projekciója) szükségszerűen mindig egyben funkcionális fej is (tehát mindig ↑=↓ annotációt kap). Mivel projektálhatónak kell lennie, nyilvánvalóan csak főkategória típusú, de nem maximális
projekciót képviselő egység lehet.

Ugyanabban a szerkezetben több testvércsomópont is kaphat ↑=↓ annotációt. Az
így annotált szerkezetek jelentős része elvben rosszul formált f-struktúrát eredményez, mivel a PRED jegyek unifikálhatatlanok. Semmi nem írja azonban kötelezően elő azt, hogy minden összetevő bevezessen egy PRED jegyet, sem pedig azt,
hogy a ↑=↓ annotációval ellátott testvércsomópontok csak az anyacsomópont fstruktúrájának legfelső szintjére vihessenek be értékeket. Az alábbi példában mindkét
összetevő jegyei az anyacsomópont f-struktúrájának legfelső szintjén összegződnek,
de mivel csak egyiküknek van PRED jegye, s a többi jegy sem tartalmaz ellentmondó
információkat, az f-struktúra jól formált:

NP [f1]

↑=↓
↑=↓

Det [f2]

N [f3]
│
│
a, Det
fiú, N
(↑DEF)= +
(↑PRED)='FIÚ'
(↑NUM)= SG
stb.

┌
f1=f2=f3 │ PRED 'FIÚ'
│ NUM

SG
│ DEF
+
│
stb.
└

┐
│
│
│
│
┘


A következő példában mindkét összetevő bevisz egy PRED jegyet, de ezt az f-struktúra különböző szintjeire küldik, így ismét jól formált f-struktúrát kapunk:


66



NP [f1]

↑=↓
↑=↓

A [f2]

N [f3]
│
│
8D"F4&J`, A
*,&JT8J, N
(↑ADJ PRED)='szép'
(↑PRED)='lány'
(↑NUM)=SG
(↑NUM)= SG
(↑CASE)=ACC
(↑CASE)=ACC
(↑GEND)=FEM
(↑GEND)=FEM

┌
┐
f1=f2=f3 │ PRED 'lány'
│
│ NUM

SG
│
│ CASE

ACC
│
│ GEND FEM
│
│
┌
┐│
│ ADJ
│PRED 'szép' ││
└
└
┘┘


A szerkezetekben ezért elvben akárhány testvércsomópont lehet ↑=↓ annotációjú,
ameddig tartalmuk egymáséval és az anyacsomópontnak megfelelő f-struktúrával
unifikálható.

A PRED jegyek unifikálhatatlanságából és a konzisztencia (=értékunicitás) követelményéből (l. 1.3.3.1.) következik, hogy

# 1. ha ugyanabban a szerkezetben több funkcionális fej (↑=↓ sémával annotált tag)

van jelen, akkor közülük csak egynek lehet saját (nem alárendelt szintre
küldött) PRED jegye.

Az X-vonás elméletből következik, hogy

# 2. egy szerkezetben csak egyetlen összetevő minősülhet strukturális fejnek. (Ez

nem zárja ki azt, hogy további főkategóriák is hordozhassanak ↑=↓ annotációt


### 2.4.5. A funkcionális egyenlőségek és sémák (=annotációs formulák) típusai


#### 2.4.5.1. Definiáló azonosság [defining equation]


Ezek (szemben a megszorító azonosságokkal, l. 2.4.5.2.) részt vesznek az f-struktúra
megkonstruálásában.

Típusjelölőjük: =

Formájuk: funkcionális attribútum = érték

Példák:

(↑PRED)
(↑CASE)
(↑NUM)
(↑PER)
(↑TENSE)
(↑SUBJ)
↑

=
=
=
=
=
=
=

'pro',

ACC,

SG,
3,

PRESENT,
↓,
↓




67


A legtöbb lexikai tétel első sémája
vagy
vagy

(↑PRED) = 'az egység szemantikai formája'
(↑FORM) = az egység fonológiai formája
formájú.


Az affixumok nagy részének azonban nincs se (↑PRED), se (↑FORM) jegye. (A

FORM jegy szerepét l. 2.2.3.3. alatt.)

#### 2.4.5.2. Megszorító azonosság [constraint equation]


Ez az f-struktúrákra vonatkozó nyelvspecifikus megszorítások felírási módja. Előfordulhatnak lexikai tételekben, c-struktúra-pozíciókban vagy kiterjedhetnek teljes
frázisstruktúra szabályokra is. NEM VESZNEK RÉSZT az f-struktúra megkonstruálásában; tkp. szűrő szerepük van.

Típusjelölőjük: =C

Formájuk: funkcionális attribútum =C érték

Példák: (↑REFL)
=C +
(↑OBJ FORM)
=C TABS
(↑XCOMP PARTICIPLE) =C PRESENT

Feltételt adnak meg, amelyet az adott elemet tartalmazó f-struktúrának (valamely más
elem vagy szerkezet révén) ki kell elégítenie. Csak olyan elemeknek a lexikai jellemzésében szerepelnek, amelyek kizárólag a megfelelő jegyet tartalmazó mondatokban
fordulhatnak elő. Szerepelhetnek kiinduló tételekben is, de lexikai szabályok is bevezethetik őket. A feltétel tartalmazhat negációt is.

A redundancia-követelmények érdekében érdemes feltételezni, hogy tkp. minden
tétel tartalmazza a legalább egy szócikktől megkívánt tulajdonságok jelöletlen
értékét. Ellenkező esetben ugyanis ezeket az értékeket minden olyan tételben
explicite (azaz egyedileg) fel kellene venni, amely nem fordulhat elő megszorítást
tartalmazó tétellel közös szerkezetben.

Az utolsó fenti példához tartozó redundancia-szabály: a (↑PARTICIPLE) minden igealaknak jegye, de a jegy értéke jelöletlen esetben: NONE

Nem kell redundancia-szabállyal ellentételezni a FORM-okra vonatkozó megszorításokat. (A FORM-azonosságok mindig megszorító azonosságok.) Ugyanis

# 1. ahol ilyen megkötés nincs, ott bármilyen NP szerepelhet argumentumként

(olyan is, amelyet más tétel FORM-os megszorítással követel magának),

# 2. maguknak a megkövetelt formáknak a szócikkeiben is fel kell tüntetni

(külön tételként megadni), hogy ők így (jelentés nélküli formaként) is előfordulnak. Így pl. a keep tabs on sg 'szemmel tart vkit' idióma létezése


68


miatt a 'hajtóka, címke stb.' alapjelentésekkel bíró tab szócikkében egy
ilyen tételnek is szerepelnie kell:
tabs: N, (↑FORM)=TABS
(↑NUM) =PL

#### 2.4.5.3. Egzisztenciális megszorítás [existential constraint]


Az egzisztenciális megszorítás olyan megszorítás, amely csak azt követeli meg, hogy
egy jegy (attribútum) AKÁRMILYEN értéket (de valamilyent feltétlenül) felvegyen
(pl. finit mondatokban a TENSE jelen legyen). Ez is negálható. Mivel az érték
közömbös, felírásukban csak az attribútumot jelenítjük meg, pl.:

Formájuk: funkcionális attribútum

Példa:

to: ...
¬(↑TENSE)
...


A to lexikai jellemzésének a fenti példában kiemelt sora azt az információt rögzíti,
hogy a to-t tartalmazó f-struktúrákban a TENSE attribútumnak semmilyen értékkel
nem szabad megjelennie.

Vegyük észre, hogy a régensek szemantikai formájában szereplő vonzatkeret nem
más, mint a tétel által igényelt vonzatokra vonatkozó egzisztenciális megszorításoknak a listája, pl.:
'SZERET <(↑SUBJ)(↑OBJ)>'

Tartalmilag ez a vonzatkeret azt rögzíti, hogy a 'szeret' jelentésű ige mind egy alanyi,
mind pedig egy tárgyi funkcióval rendelkező érték jelenlétét igényli, tehát ilyenek hiányában nem képes grammatikus szerkezetet alkotni.

Szűrő szerepüknek megfelelően a megszorító azonosságoknak és az egzisztenciális megszorításoknak a teljesülését az f-struktúrát alkotó definiáló azonosságok
összességének az ismeretében ellenőrizni kell.

#### 2.4.5.4. Feltételes azonosság [conditional equation]


A boole-algebrai eszközök megengedik komplexebb kifejezések használatát is. Ezek
közül itt csak a gyakran szükséges feltételes azonosságot definiáljuk:
pl.: (↓ CASE) = NOM ⇒ (↑ SUBJ) = ↓
[(↓ CASE) = ACC & (↓ ANIM) = +] ⇒ (↑ OBJ) = ↓
[(↓ CASE) = NOM & (↓ ANIM) = −] ⇒ (↑ OBJ) = ↓




69


A feltételes azonosságokkal azt szeretnénk kifejezni, hogy amennyiben a bal oldal
fennáll, akkor a jobb oldalt bevisszük az f-struktúrába. Kondicionálisként ezért nem
értelmezhetjük, mert azt (lévén [¬A ∨ B] értelmű) az utótag igazsága az előtagétól
függetlenül teszi igazzá. A feltételes azonosságot tehát a következő interpretációban
értelmezzük:


azaz a B-t tartalmazó minimális f-struktúrában

A-nak megszorító azonosságként kell teljesülnie.


Ez azt jelenti, hogy: (↓ CASE) = NOM ⟹ (↑ SUBJ) = ↓
ekvivalens ezzel: ¬[(↓CASE) = NOM] ∨ [(↓CASE) =C NOM ∧ (↑SUBJ) = ↓],
valamint ezzel:  (↓CASE) ≠ NOM

  (↑SUBJ) = ↓
  konjunkció jele.
2.5.


A szintaktikai információk kódolása a szintaxisban [syntactic encoding of
syntactic relations]


Ez alatt a c-struktúra pozícióinak (a csomópontoknak) az annotálását értjük, amelynek
révén összetevőket (szintaktikai realizációkat) és grammatikai viszonyokat rendelünk
egymáshoz. Konkrét funkcionális egyenlőségek használatával az annotáció a
következőképpen nézhetne ki:

S → NP VP
│
│
│
f1
f2 f3


NP
│
f4

→ N
│
f5

(f1 SUBJ)=f2
f1 = f3

f4 = f5


VP
│
f3

→ V NP AP
│ │ │
f6 f7 f8

f3=f6
(f7CASE)=CACC
(f3OBJ)=f7 (f3XCOMP)=f8


A csomópontokhoz tartozó részleges f-struktúrákat az annotációban szereplő azonosságok határozzák meg. Ezeket részben a PS-szabályok, részben pedig további kódoló
szabályok vezetik be és rendelik a csomópontokban álló kategóriákhoz. Az annotáció
révén gyakorlatilag részleges (azaz a mondat f-struktúrájának darabjait képviselő) fstruktúrákat rendelünk a kategóriacímkékkel megnevezett összetevőkhöz [=local codescription of functional structures]. Ebből következően a mondat c-struktúrája és
f-struktúrája közötti leképezések részenkénti megfeleléseket [piecewise correspondence] is biztosítanak. A fenti utolsó szabály és a hozzá társított egyenlőségek pl. ezeket a részenkénti leképezéseket definiálják:


70


╔═════════╗
┌
┐
║

VP ╠═══════════> f3 │
╔═══╗ │
║
╔═══
╪══╝
f6 │ OBJ
f7 [ „ ] ║ │


│ XCOMP f8 [
]║ │
║ V ║ ╔══╗ ╔════╗
└
ƒ ║┘
╚═══╝ ║NP║ ║ AP ╠═════════════════════╝ ║
╚╦═╝ ╚════╝
║
╚══════════════════════════════════╝

A felírást rövidítik, általánosítják és teszik áttekinthetőbbé az 2.4.3. -ban megismert ↑
és ↓ metaváltozók. A fenti annotálás általánosított megfelelője a metaváltozók használatával így néz ki:
(↑OBJ)=↓
(↑SUBJ)=↓ ↑=↓
↑=↓
↑=↓ (↓CASE)=CACC (↑XCOMP)=↓

S → NP

VP

NP → N

VP → V

NP

AP

Ugyanahhoz a csomóponthoz (kategóriához) több azonosság is rendelhető, amennyiben közöttük Boole-algebrai viszonyok állnak fenn, pl.:
 (↑OBJ) =↓


 (↑ADJ) =↓
(↓CASE) =C DAT

NP

Szintaktikai kódolásnál a FUNKCIÓK azonosságai mindig (↑...)=↓ formájúak, mert
az ego funkcióját adják meg (az anyához való viszonyában).

A grammatikai JEGYEKRE vonatkozó azonosságok viszont mindig
(↓...)=C... formájúak, mivel mindig megkötést jelentenek: azt, hogy
a csomópont alá csak ilyen jegyű egységek jöhetnek.

A szintaktikai kódolás fő rendszerei: KONFIGURÁCIÓS KÓDOLÁS (l. 2.5.1.) és

NEM-KONFIGURÁCIÓS KÓDOLÁS (l. 2.5.2.)

Konfigurációs kódolás van jelen ott, ahol az összetevők szintaktikai funkcióját (vagy
legalábbis funkciójuk típusát, l. 2.3.1.3., 2.3.5.) a szerkezetben elfoglalt pozíciójuk
jeleníti meg. Ez a helyzet az X' elvek alapján felépülő szerkezetekben. Nemkonfigurációs kódolásról beszélünk, ha a funkciót nem az összetevő pozíciója, hanem
egyéb eszközök (tipikusan a morfológia) jeleníti meg.

A kódolás konfigurációs vagy nem-konfigurációs jellegét itt nem nyelvek egészére
vonatkozó besorolási szempontnak, hanem az egyes nyelvek egyes kategóriatípusaira
egyenként feltárandó empirikus ténynek kell tekinteni. Még az is előfordul, hogy ugyanazon szerkezetben csak egyes összetevőknek a funkciója van konfigurációsan
rögzítve, másoké viszont nem konfigurációs alapon azonosul, pl.:




71


# 1. Az angolban csak a mondat "magja" konfigurációs, a PP-k többnyire nem konfigurációsak:


V'

→


V
↑=↓


NP


 (↑OBJ)=↓ 


NP


 (↑OBJ2)=↓ 

*


PP
(↑OBLθ)=↓


# 2. A walpiriben konfigurációs elem az AUX kötelező második pozíciója:


S

→ X AUX X
↑=↓

*


Annak ellenére azonban, hogy a konkrét szerkezetek konfigurációs vagy nem-konfigurációs jellege egyedileg feltárandó empirikus tény, a bennük szereplő összetevők funkciójának kifejezését mindkét szerkezettípusban általános elvek korlátozzák.

### 2.5.1. A konfigurációs kódolás [configurational encoding]


#### 2.5.1.1. Funkciótársítás az endocentrikus szerkezetekben


Az X'-elveknek megfelelően felépülő frázisok funkcionális jellemzése (vagyis az, hogy
összetevői milyen funkciókat hordozhatnak, tehát hogyan annotálandók) levezethető az

n

a. A c-strukturális fej mindig egyben f-strukturális fej is (azaz X f-struktúrája mindig
n+1
unifikálódik X -ével). A kategoriális fejhez járuló ↑=↓ annotáció tehát endocentrikus rendszerben implicite mindig adott, ezért nem kell külön kifejezni:
i+1


X

i

YP

X

→ ↑=↓

b. A funkcionális kategóriák specifikálói (vagyis az FP-k által dominált SPEC-ek) a
szintaktizálódott diskurzusfunkciókkal (TOP, FOC, SUBJ) azonosak, vagy pedig
nincsenek jelen:

FP


YP

F'
(↑d-fn)=↓


SPEC-je SUBJ, míg más nyelvekben ez TOP v. FOC funkciójú is lehet vagy hiányozhat.
c. A funkcionális kategóriák komplementumai f-strukturális társfejei a szerkezetnek:


72



F'

Példák:

D'


↑=↓
↑=↓
↑=↓
↑=↓
o

F

XP

D

NP
│
│
(↑DEF)=+


I'

↑=↓
↑=↓

I

VP/S
│
│
(↑TNS)=...


C'

↑=↓
↑=↓

C

IP
│
│

o


F F'-nak kategoriális feje, s egyben funkcionális fej is; XP szintén funkcionális fej,
de nem kategoriális feje F'-nek. A fenti megállapítás kifejezi azt az intuíciót, hogy az
o

F -ok viszonya a komplementumukhoz nem egy predikátum és argumentuma közötti
o
viszony: F vagy "fogalmi" tartalom nélküli funkciószó, vagy pedig inflexiós

révén kifejezett argumentumaival az f-struktúrában áll kapcsolatban.
d. A lexikai kategóriák SPECifierjei az ADJunctok egy osztályával azonosak vagy
nincsenek jelen:

LP


YP

L'
(↑ADJ)=↓
e. A lexikai kategóriák komplementumai a nem-diskurzus funkciójú vonzatfunkciókat
(=komplementumfunkciókat: OBJ, OBJθ, OBLθ, COMPL) hordozzák. Az ezek közötti választás lexikailag determinált:

L'


L

YP
(↑c-fn)=↓
f. A maximális projekciókhoz adjungált összetevők nem-komplementum funkciókat
hordoznak (azaz: TOP, FOC, SUBJ, ADJ):

XP


YP

XP
(↑non-c-fn)=↓

Ahol egy adott nyelv szerkezetei megfelelnek az endocentricitási követelményeknek,
ott a részleges c-struktúrák és f-struktúrák együtteseinek a megszorításai ezekből az

ennek arányában pedig ki lehet küszöbölni az annotált c-struktúrákat.




73


Illusztráció az angol topikalizált CP példáján:

Az (A) alatti kategoriális szerkezethez az általános elvek a (B) alatti funkcionális
sémákat rendelik:
(A)

(B)


IP


CP

IP

│
that languages are learnable

I'


I

VP
│

is

V

PP


captured
by this theory


IP

(f. elv) →
(↑DF)=↓
↑=↓

CP

IP

│
that languages are learnable
↑=↓
← (a. elv)

I'

(a. elv) →
↑=↓
↑=↓
← (c. elv)

I

VP
│

is
↑=↓
(↑CF)=↓
← (e. elv)

V

PP

captured by this theory

Kommentárok:

# 1. A fenti annotációkban DF a diskurzusfunkciók csoportjára, CF a komplementumfunkciók csoportjára utaló rövidítés.




funkcionális jelölőkre vonatkozó korlátozásnak); [2] nem lehet ADJ, mert hiányos fstruktúrát adna. Az f. elv által megengedett c-funkciók közül ezért a CP kategóriájú
összetevők csak a d-funkciókat kaphatják meg.

# 3. A teljesség és a koherencia követelményének (l. 1.3.3.) a kielégítése megkívánja,

hogy a c-struktúra annotálásából származó TOP (vagy FOC) és az ige lexikai annotálásától megkívánt SUBJ funkciót azonosítsuk egymással. TOP felvétele esetén a
kapcsolódás abból az "univerzális default"-ból ered, amely opcionálisan azonosítja a

TOP és a SUBJ funkciót (l. 2.3.1.2.).


74



#### 2.5.1.2. Funkciótársítás az egzocentrikus szerkezetekben (konfigurációs S)


Alább megismételjük az 2.1.3.2. -ben tárgyalt velszi mondatok ott feltételezett kategoriális szerkezetét:
a.


IP/I'
b.

IP/I'



I

S

I

S
gwelodd

gwnaeth

látott

NP

VP/V'

Múlt3Sg

NP

VP/V'

Siôn
│

Siôn


János

NP

János

V

NP
ddraig
weld
ddraig
sárkány
látás
sárkány


E szerkezeteknek a funkciótársítás szempontjából lényeges jellemzői a következők:

kategória definíciójából adódóan S természetesen itt is egzocentrikus)
(2) az összes többi frazális kategória endocentrikus
(3) a mondat állítmányául szolgáló ige I kategóriájú, ha finit (a. eset), de V kategóriájú,
ha nem finit (b. eset).

Az ezekből adódó funkciótársítások:


Az S alatti NP összetevő az S-re vonatkozó feltevéseink alapján viszont csak nemkomplementum funkciót kaphat (l. az alábbi megjegyzést). A teljességnek és az igei



következik.

Megjegyzés: Ha az S alatti NP komplementumfunkciót kapna, az több ellentmondást is

kettejük anyacsomópontja tehát nem lehetne S kategóriájú (S ugyanis a
definíció szerint egzocentrikus); a mondat alanya (mivel az alany nem

ami a VP feltételezett endocentricitásával ütközik, vagy az S-en kívül, ami
viszont az S kategória egy másik definíciós jegyével, a belső alanyúsággal
nem fér össze.




75


Mindezek alapján a.-ra a következő annotáció adódik:
a'.


IP

↑=↓
↑=↓

I

S
gwelodd

(↑SUBJ)=↓
↑=↓

NP

VP

Sion
│
(↑OBJ)=↓

NP
ddraig


Elvben a VP alatt még megjelenhetne egy második (infinit, V kategóriájú) ige is, de az
a. típusú szerkezetekben ez megsértené a funkcionális unicitást (l. 1.3.1.2.), mert a
mondat PRED attribútumának így két értéke lenne. A b. szerkezetében ez nem következik be, mert az I alatt PRED nélküli segédige áll:
b'.


IP

↑=↓
↑=↓

I

S
gwnaeth

(↑SUBJ)=↓
↑=↓

NP

VP

Sion

↑=↓
(↑OBJ)=↓

V

NP
weld
ddraig


ezért a transzformációs megközelítések gyakran egy igemozgató transzformációval [Vmovement] kötötték őket egymáshoz. A közös funkcionális szerkezet:







PRED
'LÁT <(↑SUBJ),(↑OBJ)>'

TENSE
...

ASPECT
...

SUBJ
[ PRED 'JÁNOS' ]

OBJ
[ PRED 'SÁRKÁNY']








Az itt javasolttól eltérő elemzések is lehetségesek: lehetséges, hogy a nomen actionisok
nem VP-k, hanem NP vagy PP kategóriájú egységek. Nyitva van az a lehetőség is, hogy
a segédigéknek mégiscsak van szemantikai tartalmuk, amely az igéével egy összetett

PRED-et alkot.)


76



### 2.5.2. A nem-konfigurációs kódolás (nem-konfigurációs S)


A nem-konfigurációs szerkezettípust az 2.1.3.1. pontban bevezetett S → X* újraíró
szabály definiálja (ahol X tetszőleges típusú és vonásszámú kategóriaszimbólumokra
utal). A szintaktikai funkciók ebben nyilvánvalóan nem azonosíthatók konfigurációs

(1) Általános elvként felvehetjük a kategoriális szerkezet funkcionális tartalmasságának [functionality of structure] a követelményét: minden X-nek vagy az fstrukturális fej funkcióját, vagy valamilyen GF-et kell viselnie.
(2) Tegyük fel továbbá, hogy az egyes X-ek szabadon társíthatók



ADJ),

vonzatviszonyok (a-functions) ehelyett a predikátumnak és argumentumainak
az esetés egyeztetési jegyeivel vannak társítva.

A morfológiai alapú viszonyspecifikáció két általános módja a vonzatjelölés vagy
rectumjelölés [dependent-marking] és a fejjelölés [head-marking].

#### 2.5.2.1. Vonzatjelölés [dependent marking]


Az alárendelt frázisnak (azaz a bővítménynek) a funkcióját magán a frázison belül kódolja valamilyen grammatikai tulajdonság, amelyet tipikusan egy-egy morféma hordoz.

A frázis által elfoglalható szintaktikai pozíciók így csakis "...ha...akkor..." értelmű
annotációt kaphatnak, amelynek formája:
(↓ CASE) = α ⇒ (↑ GF) = ↓

például: (↓ CASE) = ACC ⇒ (↑ OBJ) = ↓


Ennek következtében a GF funkciót mindazon összetevők (de csakis azok) megkapják, amelyeknek a tartalma egy olyan közös f-struktúrában unifikálódik, amelyben a

CASE attribútum értéke α.
Úgy tűnik, hogy a vonzatok jelölése az 2.3.1.3. pontban ismertetett bővítményhierarchiát fordított irányban követi: a magasabb rangú vonzatviszonyok csak akkor kódolhatók a frázis formájában, ha az alacsonyabb rangú viszonyok is így vannak kódolva.




77


#### 2.5.2.2. Fejjelölés [head marking]


A régensek a vonzataik szerepét betöltő frázisok tulajdonságaira utaló morfémát vesznek fel, azaz egyeztető morfémák révén azonosítják a vonzataikat. A szintaktikai
pozíciók itt ilyen formájú feltételes azonosságokkal annotálandók:
(↓ AGR) = (↑ GF AGR) ⇒ (↑ GF) = ↓

például: (↓ CLASS) = (↑ OBJ CLASS) ⇒ (↑ OBJ) = ↓

anyám a tárgyának tulajdonít, akkor én vagyok a tárgy.

Ennek értelmében azok (és csak azok) az összetevők kapják meg a GF funkciót, amelyeknek az f-struktúrájában AGR értéke megegyezik azzal, amit a közvetlenül fölöttes
f-struktúra PRED-je a GF funkciójú vonzatától elvár (v. annak ad). A koherencia és a
teljesség minden C-hez a megfelelő GF-et fogja rendelni.

A fejjelölés általában a GF-ek funkcionális hierarchiáját követi: OBJ csak akkor


Illusztráció: A VSO nyelvek egy alosztályában S szerkezete lapos (az állítmány
mögött a sorrend kötetlen), s csak a CP-IP szakasz konfigurációs (az állítmány előtt
kötött a sorrend):

CP


WP

IP


YP

S


XO

ZP*

Ennek a típusnak az annotálása a SPEC és az irányparaméterek [directionality parameters] rögzítése után további stipulációk nélkül levezethető. Egy ilyen lehetőség pl.:
(1) SPEC-IP:FOC; (2) SPEC-CP:TOP; (3) S-beli sorrend: predikátum kezdetű. A

SPEC-eknek a koherencia miatt vonzatfunkciót is kapniuk kell; ezek a funkciók a
funkcionális unicitás (l. 1.3.1.2.) követelménye miatt nem jelenhetnek meg S alatt is,
a teljesség miatt pedig minden vonzatfunkció kielégítendő. A diskurzusfunkciónak
valamely vonzatfunkcióval való azonosítására több mechanizmus jön szóba:

# 1. A TOP és a SUBJ azonosítása mint default: ez csak alanyt tehet topikká és csak

lokálisan (egy tagmondaton belül) működhet.

# 2. Funkcionális lánc a funkcionális bizonytalanság alapján (l. 3.4.) : ez a távolsági

kapcsolatok modellje.


78



# 3. A csomópont dupla (egy d-funkcióval és egy a-funkcióval való párhuzamos) annotálása (pl. WP az endocentricitási elv alapján kap TOP funkciót, a morfológiai

jelölés (fejvagy függő jelöltség) pedig OBJ funkciót ad neki): ez is lokális
lehetőség, de nem csak alanyt érinthet. (Az összetevőknek a d-funkciókkal társított
periferikus pozíciókba való lokális elmozdítását időnként lokális csereberének
[local scrambling] nevezik.)

## 2.6. A lexikai tételekről


Sok olyan összefüggést, amelyet a konfigurációs modellek a mondattanban kezelnek,
az LFG a lexikai elemek közötti kapcsolatokra, sőt a lexikonban zajló folyamatokra
vezet vissza. A lexikai integritás betartására való törekvésből adódóan nemcsak a
deriváció, de az inflexió is a lexikonban megy végbe. Szótári szabályok biztosítják a
kapcsolatot ugyanazon predikátum különböző vonzatkeretekkel használt tételei között
akkor is, ha ezek között nem áll fenn morfológiai derivációs viszony. Mindezekből
adódóan (mint ezt az 1.1.2.3. pontban már említettük) a lexikonban tárolt és a
lexikonból "kimenő", a mondatszerkezetekbe helyettesítendő egységek csak ritka
kivételként azonosak egymással.

### 2.6.1. A "kimenő" lexikai tételek formája az LFG-ben


A c-struktúrába helyettesítendő lexikai tételekben [=lexical entry] a következők szerepelnek:
(i)
(ii)
(iii)
(iv)

az egység vagy címszó [=lexical item] formájának reprezentációja
a tétel szintaktikai kategóriája [syntactic category]
annotációkként funkcionális sémáknak egy listája
további szükséges információk (morfológiai forma stb.)
(i)


TÉTEL: a címszó formája:


Pl.:

fa:

(ii)
kategória,


N,

(iii)
funkcionális annotáció/séma1
funkcionális annotáció/séma2
...
funkcionális annotáció/séman
(↑PRED)='FA'
(↑CASE)=NOM
(↑PER)=3
stb.


A szintaktikai információk lexikai kódolása (ii) és (iii) révén valósul meg. Konvenció,
hogy jelentéssel bíró egységeknél a sémalista első tagja a PRED jegy értékét (a tétel
szemantikai formáját: jelentését és vonzatkeretét) adja meg.




79


Annotációval az elemi (azaz szerkesztetlen) lexikai egységek is rendelkeznek
(l. az iménti példát), de a morfológiai képzés, a lexikai szabályok is annotációkat
"állítanak elő". Az annotáció mindig egy (részleges) f-struktúrát határoz meg, pl.:

Lexikai egység


Az annotálásának megfelelő
f-struktúra

(a) elemi:
fa: N, (↑PRED)='FA'
(↑CASE)=NOM
(↑PER)=3

 PRED
 CASE
 PER

'FA'


NOM 
3


(b) szerkesztett:

V

↑=↓
↑=↓
live
-s
(↑PRED)='ÉL
<(↑SUBJ),(↑OBLLOC)>'

 PRED

 TENSE

(↑TENSE)='PRES'  SUBJ
(↑SUBJ NUM)=SG 

(↑SUBJ PER)= 3

'ÉL<(↑SUBJ)(↑OBLLOC)>'


PRES


 NUM SG 
 PER
3










Az igealakhoz tartozó f-struktúra önmagában véve rosszul formált, mivel nem elégíti
ki a teljesség követelményét (l. 1.3.3.2. ). (A PRED által igényelt vonzatok közül

és számát adja meg.) Ez összhangban áll azzal a ténnyel, hogy a fenti jellemzésű lives
önmagában véve nem használható mondatként az angolban.

#### 2.6.1.1. A lexikai annotációk formája


A lexikai kódolásban elvben minden attribútum (↑...)=... formájú, mivel a tételek minden tulajdonságukat "beviszik" a mondatokba, tehát azoknak fel kell szivárogniuk
(percolate) a fára, pl.:
(↑TENSE) = ...

Olyankor azonban, amikor a tétel csak egy neki alárendelt összetevőről ad funkcionális információkat (ez szuffixumoknál nem ritka), a felírás rövidítésére egy másik
jelölési mód is használatos, amelyben (↓...) formájú attribútumok is szerepelnek, pl.:
az -s angol igei személyrag esetében az alábbiak ekvivalens annotálások:
-s: Aff, (↑SUBJ PERS) = 3
(↑SUBJ NUM) = SG

-s: Aff: (↑SUBJ) = ↓
(↓PERS) = 3
(↓NUM) = SG


80



Amig a bal oldali formával a toldalék mintegy "harmadik személyben" mondja el az
anyjának alárendelt alany tulajdonságait, addig a jobb oldali felírás első sorával azt
jelenti ki magáról, hogy ő maga az alany (vagy legalábbis része az alanynak), majd a
következő sorokban "első személyben" mondja el, hogy ő mint alany milyen tulajdonságokkal rendelkezik.

A grammatikai funkciók közül a lexikai elemek annotációi csak a vonzatfunkciókat (a szubkategorizáló funkciókat, l. 2.3.1.1. ) említhetik.

#### 2.6.1.2. A régensek annotálása


A régensek mondatba helyettesítendő alakjában (vö. 1.2.2. ) található szemantikai formának (PRED jegyük értékének) alapvető sajátossága az, hogy a tétel jelentésleírása
mellett a tétel vonzatkeretét (vö. 2.6.2.5., 2.6.2.7.) is tartalmazza, pl.:
(↑PRED) = 'AD <(↑SUBJ),(↑OBJ),(↑OBJTH)>'

A vonzatkeret a vonzatoknak nem a kategóriáját, hanem a szintaktikai funkcióját adja
meg, mivel a "funkcióra hivatkozó vonzatválasztás" elvének (l. 1.3.1.1. ) az
értelmében a régenseket vonzataiknak a funkciója (és nem a kategóriája) sorolja
alkategóriákba.

A régensek annotálása során ezért a lexikonban tárolt alakokat (l. 1.2.2.1. ) olyan
formulákkal kell "felszerelni", amelyek megadják, hogy a tétel milyen grammatikai
funkciók jelenlétét várja el a mondatoktól. A szemantikai predikátumok esetében a

(nem-thematikus vonzatokat, vö. 2.3.2.2. ) is igényelhet.

A feltételezések szerint a grammatikai funkciók hozzárendelését az ige szemantikai osztálya, a vonzatkeret tagjainak szemantikai szerepei, valamint az argumentumstruktúrát változtató lexikai szabályok alapvetően meghatározzák. A hozzárendelést meghatározó egyik rendszert l. a 2.7. pontban.

### 2.6.2. A szemantikai forma alkotórészei és mögöttes rétegei [semantic form]


A lexikai tétel PRED jegyének az értékét a tétel szemantikai formájának [semantic
form] nevezzük. A tétel felírásában mindig felső vesszők között szerepel:
(↑PRED) = 'szemantikai forma'

A szemantikai forma általában a lexikonban őrződik vagy ott keletkezik, és a szintaktikai komponensbe egyetlen elemezhetetlen, atomi elemként kerül, ugyanúgy, mint a
szimpla szimbólumok.

Tartalmilag és az f-struktúra felépítése szempontjából a PRED jegy értéke más,
mint a többié. Képletesen azt mondhatjuk, hogy a PRED jegy értéke az a "dolog",
amelyről a többi jegy információkat közöl: ugyanarról a dologról több forrásból is érkezhetnek azonos információk, de két különböző forrásból ugyanaz a "dolog" nem érkezhet. Ezért, míg a többi jegy azonos értékei "nem ütik egymást" (mintegy ugyan-




81

azon állítás ismételt elhangzásának tekinthetők és unifikálandók), addig a PRED jegynek még az azonos értékű előfordulásai is "ütik egymást" (nem unifikálhatók, mivel
külön objektumokként kell bánni velük). Szemantikai formák tehát soha nem
vonhatók össze az f-struktúrában (ezért bármely frázis szemantikai formával bíró
összetevői közül mindig csak egy viselhet ↑=↓ annotációt).


is tartalmaz, általában lexikai formának vagy vonzatkeretnek nevezzük (l. 2.6.2.7.).

Fajtái:

# 1. Vonzatstruktúra nélküli szemantikai predikátum. Ez lehet:

a. konkrét szemantikai leírás,
pl.: 'JÁNOS'
b. szemantikai funkcióra utaló grammatikai kifejezés, pl.: 'pro'



szemantikai predikátum (l. 2.6.2.7.)

#### 2.6.2.1. A szemantikai predikátum [semantic predicate]


A szemantikai predikátum tulajdonképpen a tétel jelentésének definíciója, dekompozíciója. Mivel a jelentésreprezentáció elvei nem kidolgozottak, többnyire csak az adott
jelentést hordozó nyelvi formát szerepeltetjük a helyén nagy betűkkel írva:
girl: N, 'GIRL'

Nem a címszó önmagában vett jelentését adja meg, hanem az egész séma-sor "összesített" jelentését. Ez jól látszik idiomatikusan kötött formát tartalmazó tételekben, pl. a
keep tabs on sg 'figyelemmel kísér' idióma lexikai tételében:
keep: V, (↑PRED) = 'OBSERVE (x, y) <
(↑OBJ FORM) =C TABS

...

>'


keep-nek, hanem a keep tabs on sg kifejezés egészének a jelentését
(='megfigyel') adja meg.
Állhat egyetlen szemantikai jegyből is, mint pl. az angol is esetében a progresszivitás
jegyéből:
is: (↑PRED) = 'PROG(ressive) <(↑XCOMP)>'
(↑TENSE) = PRESENT
(↑SUBJ NUM) = SG
(↑XCOMP PARTICIPLE) =C PRESENT
(↑XCOMP SUBJ)= (↑SUBJ)


82



A régensek szemantikai predikátumának "igazi" felírásában szerepelniük kell változóknak (variables) is, amelyek a logikai (más elnevezéssel: szemantikai) argumentumoknak felelnek meg, valamint esetleg konstansoknak is, amelyek adjunktumokkal
fejezhetők ki, pl. (informálisan):
'RUN' : 'X gyorsan mozog egy ÚTVONAL mentén, amely egy HELYnél
kezdődik és egy másik HELYen ér véget'

: változó, amelyet a tétel a SUBJECT funkcióval párosít,

PLACE, PATH : konstansok.

#### 2.6.2.2. Szemantikai (=thematikus vagy logikai) argumentumok [semantic arguments, thematic arguments, logical arguments]


Szemantikai argumentumoknak a predikátummal képviselt (f(x,y) formában megadható)
jelentésfüggvény szabad argumentumhelyeit kitöltő, s ezért vonzatokként realizálandó
argumentumokat nevezzük. A predikátum jelentésének belső szerkezetében kimutatható argumentumok közül tehát csak azokat, amelyek szintaktikai eszközök révén
azonosítandók, s ezért grammatikailag is realizálandók, tehát vonzatrelációval társítandók. Az őket megjelenítő vonzatok meghatározott thematikus szerepet (v. szerepeket!) töltenek be, s ebből következően szelekciósan is kötöttek.

A grammatikai interpretálhatóság követelménye azt jelenti, hogy nem tartoznak a
szemantikai argumentumok közé azok a "belső argumentumok", amelyeknek a
megadása már magában a tétel jelentésének a leírásában kikerülhetetlen, s ezért grammatikailag sohasem realizálandók s nem is realizálhatók.

Például a borozgat tárgyatlan ige jelentése csak úgy írható le, hogy ebben a leírásban (mintegy "szemantikai tárgyként", azaz patiensként) szerepel a bor főnév:

(∀x)((borozgat(x)) ⇒ (bort-iszik (x)),
de ez grammatikailag sohasem realizálódik, s az ige mellett más főnév sem jelenhet
meg tárgyként. Mivel kizárólag az alany megjelenítését igényli, egyetlen szemantikai
argumentuma van:
'BOROZGAT ( 1 )'

Természetesen azokban a ritka esetekben, amikor a jelentésleírásban elkerülhetetlenül
megnevezendő belső szemantikai argumentum grammatikai kifejezést is kaphat, akkor
'valódi' szemantikai argumentumnak kell tekintenünk. Ilyen pl. a kétvonzatos crane
ige (jelentése kb: '[a nyakát] nyújtogatja, hogy (jobban) lásson valamit'), amelynek
belső szemantikai struktúrája ilyesféle:
'crane' = '1 nyújtogatja 2-t a jobb kilátásért, ahol 2 1-nek a nyaka'




83


Ennél az igénél a 2-vel jelölt argumentum belső szemantikai argumentum, mivel semmi más nem lehet, mint '1 nyaka', s ennek megadása ezért elkerülhetetlen az ige
jelentésének a leírásában. Ez az argumentum azonban grammatikailag is kifejezendő
(sőt, formája nincs is megkötve), tehát az igének két szemantikai argumentuma van:
'CRANE (1, 2)'

Fontos: A szemantikai argumentumok vonzatokként való megjelenítésének a követelményéből nem következik az, hogy minden vonzat szemantikai argumentumot jelenít meg. A lexikai tételek grammatikailag igényelhetnek olyan
vonzatokat is, amelyek nem valamely szemantikai argumentumuk megjelenítését szolgálják. Ilyenek pl. a jelentés nélküli expletivumokkal (angol it,
there, német es stb.) képviselt formális alanyok, amelyeknek nem felel meg



Megjegyzés: Az angol terminusok használata (annak következtében, hogy az angol
argument szó mind a jelentésleírás üres helyeit kitöltő tartalom, mind pedig

megnevezésére használatos), sajnos igen zavaros. Az itt körvonalazott értelemben ritkábban fordulnak elő, s inkább az így értett szemantikai argumentumot azonosító vonzatot (mintsem magát az argumentumot) nevezik

amely nem pusztán formális igényt elégít ki (mint gyakran az angol it)
hanem ténylegesen egy predikátum argumentumát azonosítja'.

#### 2.6.2.3. Az argumentumlista [argument list]


Valójában nem az argumentumoknak, hanem az argumentumhelyeknek a listája: a
szemantikai predikátum grammatikai interpretálást kívánó argumentumainak az


kitöltendő argumentumhelyeket képviselik.



= szemantikai predikátum + argumentumlista

Formája:
pl.:

szemantikai predikátum ( argumentumlista )

SEEM (1, 2)


84






#### 2.6.2.5. A vonzatlista [grammatical function assignment]


A tételt szubkategorizáló grammatikai funkcióknak (pontosabban: funkciókifejezéseknek, l. 2.6.2.6. ) a listája. A lista nem tartalmazhat ismétlődést, viszont a tagok egyike
lehet a Ø funkciószimbólum (l. 2.6.2.6.1.).

Formája: {(expr1)(expr2)...(exprm)}

(az ellipszis eseteitől eltekintve) m $ n, ahol
n = az argumentumlista hossza

Példa (a seem igéé): {(↑XCOMP),(↑OBLGO),(↑SUBJ)}

A hosszra vonatkozó megállapítás abból adódik, hogy (az elliptikus tételek kivételével;

száma meghaladhatja az argumentumokét, azaz lehetnek olyan (formális) vonzatok,
amelyek nem jelenítenek meg szemantikai argumentumot (l. 2.6.2.2.).

#### 2.6.2.6. Grammatikaifunkció-kifejezések [grammatical function expressions]


Ilyenek: a. a funkciónevek [function names]
pl.: (↑SUBJ), ((↑SUBJ))
b. a Ø funkciószimbólum [Ø function symbol] pl.: Ø
c. a grammatikai funkciónévhez tartozó értéket kijelölő azonosságok:
pl.: (↑XCOMP SUBJ)=(↑OBJ)

Minden egyes funkciónév a tétel egy-egy vonzatrelációját [grammatical argument]
képviseli. A funkciónév köré (egy további) zárójelpárt teszünk a vonzatellipszis
(l. 2.6.2.6.2.) eseteiben.

Vonatkozik rájuk a funkcionális lokalitás elve (l. 1.3.4.1.).




85


##### 2.6.2.6.1. A Ø funkciószimbólum [Ø function symbol]



A Ø funkciószimbólum nem funkció, hanem annak a hiányát jelölő lexikai szimbólum. Azt jelöli, hogy a vonzathelyhez tartozó argumentumhely a lexikonban szemantikailag ki van töltve vagy le van kötve (=lexikailag interpretált), s ezért a hely
nincs grammatikai funkcióval párosítva. (Pontosabban: "meg van fosztva" az egyébként hozzá társítható grammatikai funkciók felvételének a lehetőségétől, mivel lexikai
kitöltöttsége miatt az argumentumhely már semmilyen grammatikai funkcióval bíró
szintaktikai forma jelöltjét sem fogadhatja be argumentumként).

Mindig valamely lexikai tétel jellemzése említi; oda azonban lexikai szabály is

az alábbi példákat).

valamely más argumentumával való azonosítás révén:

Példák:


# 1. egzisztenciális kvantorral kötve:


eat: V, '∃y(x eszi y-t)
<(↑SUBJ), Ø>'
read: V, '∃y(x olvassa y-t) <(↑SUBJ), Ø>'
read: V, '∃x(x olvassa y-t) <Ø, (↑SUBJ)>'




[The novel reads easily]


# 2. más argumentummal való azonosítás révén kötve:



A Ø funkciójú argumentum tehát szemantikailag mindig interpretáltnak számít, így a

használt eat-ben például, ha nincs is kitéve a tárgy, de világos, hogy a cselekvésnek
van valamilyen Patiens jellegű szereplője.

##### 2.6.2.6.2. Vonzatellipszis [complement ellipsis; null complement anaphora]


argumentum(hely) megmarad! Az ellipszis realizálása tehát tulajdonképpen ennek
felel meg:
'INQUIRE < (↑SUBJ), 2 >'


86



A lexikai tételben a vonzat ilyenfajta elhagyhatóságára a funkciónévnek (egy további)
zárójelbe tevésével utalunk:
 'INQUIRE <(↑SUBJ),(↑COMP)>' 
'INQUIRE <(↑SUBJ),((↑COMP))>'= 

 'INQUIRE < (↑SUBJ), 2 >'


Ha a vonzat nincs kitéve, akkor az argumentum szemantikailag nincs interpretálva,
ezért a tétel jelentése önmagában hiányos. A tétel így csak olyan kontextusban lesz
használható, amely alkalmas a szemantikai argumentum azonosítására. A tétel ilyen
értelemben a környezetére szemantikai szelekciót gyakorol. (De szintaktikait nem!) A
fenti felírás ezt jól érzékelteti.

Példa: Az inquire ige PRED jegye: 'INQUIRE < (↑SUBJ), ((↑COMP)) >'

Ez a tétel (többek között) a következőket rögzíti:



mondatvonzattal (COMP-pal) használható. Második vonzata tehát nem lehet
például tárgy: *I will inquire the time.

# 2. A második argumentumhelyhez nem kötelező grammatikai funkciót rendelni.


Ha azonban nem rendelünk hozzá grammatikai funkciót (ami egy kielégítendő
grammatikai követelmény) akkor az elfogadhatóság már kizárólag attól függ,
hogy az argumentumhelyet sikerül-e kitölteni egy PROP szerepű szemantikai
értékkel:

Although he wanted to know the time, he was afraid to inquire.

#### 2.6.2.7. Lexikai forma vagy vonzatkeret [lexical form]


A lexikai forma vagy vonzatkeret a vonzatos lexikai tételek szemantikai formájának
(azaz a régensek PRED attribútumának) a szintaxis számára fontos annotátációkat is

lexikai forma =


+ a grammatikai funkciók egy kiosztása


lexikai forma a szemantikai predikátumot, valamint az argumentumlistának és a
grammatikai funkciók listájának a párosítását tartalmazza:

Részei:

'szemantikai predikátum [neve] argumentumlista'
↑
grammatikai funkciókifejezések listája




87


Kibontott képe:
'szemantikai predikátum ( 1 , 2 , ... , n )'
│
│
│
{ (expr1) (expr2) ... (exprn) ... (exprm) }

Példa (a seem igéé): '1 SEEM-TO 2 (

1
,
2 )'
│
│
{ (↑XCOMP) (↑OBLGO) (↑SUBJ) }


Tömörített képe:
' szemantikai predikátum <

(expr1)(expr2)...(exprn) > (exprn+1)...(exprm) '

thematikus/logikai vonzatok nem-logikaiak


Példa (a seem igéé): '1 SEEM-TO 2 <(↑XCOMP),(↑OBLGO)> (↑SUBJ)'

A tömörített képben a tétel szemantikai argumentumhelyeihez társított vonzatok
listáját (az ún. logikai v. thematikus vonzatokat, vö. 2.3.2.2.) csúcsos zárójelek
közé fogjuk, a többieket azon kívül szerepeltetjük.

A grammatikai funkciók ezen belül a következőkhöz lehetnek rendelve:
a. az egyes szemantikai argumentumhelyekhez, pl.:
argumentumlista: (Ágens)
vonzatlista: {(↑SUBJ)}



b. nem-thematikus vonzatpozícióhoz, pl.:
argumentumlista: ( )
vonzatlista: { (↑SUBJ)}



c. alárendelt predikátumból felemelt [raised] elemhez, pl.:
argumentumlista: (PROP)

vonzatlista: { (↑XCOMP), (↑SUBJ), (↑XCOMP SUBJ)=(↑SUBJ) }

A párosításra valószínűleg univerzális megszorítások vonatkoznak. Ilyen a



Mivel a tétel szintaktikai viselkedését közvetlenül befolyásoló tulajdonságok a
tömörített képben is jelen vannak, a szintaktikai tárgyú fejtegetésekben elegendő
ezeket szerepeltetni. A lexikonban működő szabályok leírása azonban a kibontott


88


képben látható mögöttes reprezentációk és összefüggések figyelembe vételét is
megkívánja.

## 2.7. A szintaktikai információk kódolása a lexikonban: a lexikai leképezés

elmélete [Principles of lexical encoding of grammatical functions: Lexical


Lexikai kódolás: a lexikai tételek mondatszerkezetbe helyettesítendő formájában rejlő
szintaktikai információknak a megadása funkcionális sémák révén. Ez az a folyamat, amely a rögzített tétellistán szereplő argumentumszerkezetre támaszkodva kialakítja a megfelelő vonzatkereteket (vö. 1.2.2.). A lexikai leképezés
elmélete ezen belül nukleáris f-struktúrákat "vetít ki" az a-struktúrákból azáltal,
hogy az egyes argumentumhelyekhez hozzárendeli a megfelelő vonzatfunkciókat, azaz a PRED jegy értékeként előállítja a régens szemantikai formáját, a
lexikai formát (l. 2.6.2.7.).

A grammatikai funkcióknak az argumentumhelyekhez való hozzárendelését az ige
szemantikai osztálya, a vonzatok szemantikai (thematikus) szerepei, valamint az argumentumstruktúrát változtató lexikai szabályok alapvetően meghatározzák. A
hozzárendelést modelláló rendszerek alapelvei a következők:

# 1. A grammatikai funkciók jegyekkel jellemezhetők.


# 2. Az egyes thematikus szerepek csak meghatározott jegyekkel rendelkező grammatikai funkciókkal társíthatók; a thematikus szerep tehát ezekkel a jegyekkel

"ellátja" a neki megfelelő vonzathelyet.

# 3. A lexikai szabályok megváltoztathatják az argumentumstruktúrát.


# 4. A specifikálatlanul maradt jegyek értékét bizonyos konstellációkban default

szabályok adják meg.
5. Minden vonzathelyhez csak olyan grammatikai funkciók társíthatók, amelyek
jellemzése nem ütközik a (ii-iv) révén kialakított jegyegyüttessel (azaz unifikálható vele).
6. A vonzatstruktúra különböző helyeihez rendelhető funkciók közötti esetleges
ütközéseket jólformáltsági kritériumok szűrik ki.

Az 1990-re kialakult elmélet négy komponense:







# 3. A szemantikai szerepeknek (részlegesen jellemzett) szintaktikai funkciókra









89


### 2.7.1. Thematikus szerephierarchia


A thematikus szerepeket egy univerzális hierarchia rendezi struktúrákba. A feltételezett hierarchia:

AG > BEN > RECIP/EXP > INST > TH/PAT > LOC

Azt a rendszert, amelyet ezek a hierarchikus viszonyok az argumentumok halmazán

legmagasabb rangú tag a főszereplő [top role], jele: θɵ. Azaz:
nem

és nem
ad *(BEN, AG, PAT)

hanem
ad *(PAT, BEN, AG)

ad (AG, BEN, PAT)


A rangsorbeli elrendezést az alábbi tényezők motiválják:

# 1. A predikátummal való jelentéskompozícíó iránya (alulról felfelé)


# 2. (1-re épülően): A predikátum és az argumentum együttesének lexikalizálódási /

idiomatizálódási hajlama (alulról felfelé). Teljesen hétköznapiak a Patiens vagy

Téma alapú idiómák (pl.: szemet vet, kardot ránt, bedobja a törülközőt), nem kevés a
direkcionális és lokális alapú idióma sem (sutba dob, férjhez megy, cserben hagy,
gödörben van stb.), előfordulnak Természeti erő alapúak (elkapta a gépszíj, elütötte


ehhez a típushoz, de nem teljesen "nyitott" a használati köre, s inkább csak a teljesen
kötött mint akit kerget a tatár szóláshasonlatban használjuk.)

# 3. Az argumentum diskurzus-topikként való megjelenésének a lehetősége (fentről

lefelé). A következő magyar mondatok például csak a megadott szórendben
(amelyben a magasabb rangú szereplő kezdi a mondatot) lehetnek semlegesek: A fiú
nézi a lányt; A szomszédom utálja a barátomat; Pétert érdekli a matematika; stb.

# 4. (3-ra épülően): A névmási tövek morfológiai inkorporálódási hajlama (fentről

lefelé)
5. Az igei egyeztető morfémák grammatikalizálási sorrendje (fentről le).

jelen lévő argumentum, azaz a főszereplő minősül ennek (szintaktikai szerepétől


### 2.7.2. A szintaktikai funkciók osztályozása


részleges jellemzést (partial specification), amely az adott szerephez hozzárendelhető
szintaktikai funkciók körét lehatárolja. Ezzel a megközelítéssel az azonos `természetes
osztályokba@ tartozó funkciók közötti váltakozásokat nem transzformációs kapcsolatok,
hanem meghatározatlanság [underspecification] jellemzi.


90



A jegyek:

[± restricted]
[± objective]


Kombinációik és az ezekkel azonosított funkciótípusok:
r│
−
+
│
o │
│

│
│
− │ SUBJ OBLθ │
│
│
+ │ OBJ OBJθ │


Azaz az egyes funkciók:

SUBJ OBJ


OBL OBJθ

[-r]

[-r]

[+r]

[+r]

[-o]

[+o]

[-o]

[+o]

ahol: r = thematikusan korlátozott
[(thematically) restricted]
o = tárgyjellegű [object-like, objective]
a természetes osztályok: [-r] = SUBJ,OBJ
[-o] = SUBJ,OBLθ
[+o] = OBJ,OBJθ
[+r] = OBJθ,OBLθ

### 2.7.3. A lexikai leképezés elvei [lexical mapping principles]


A leképezési mechanizmust a szótárban tárolt csupasz argumentumstruktúrára, azaz a
szemantikai argumentumok thematikus szerepekkel címkézett és rendezett listájára
alkalmazzuk (l. 1.2.2.1.). A "szabályos" esetekben (amelyekben a tétel semmilyen további szintaktikai minősítést nem tartalmaz) a funkcióhozzárendelés alábbi menete
zavartalanul érvényesülhet.

A jelöletlen funkciókiosztások lépései:
(i) az argumentumok belső ismérvekkel való osztályozása: a thematikus szerepek
saját szemantikai tulajdonságaiból közvetlenül adódó besorolások
(ii) jelentéstartó morfolexikai műveletek: thematikus szerepek "elnyomása"
(iii) tipikus besorolások: a thematikus szerephierarchiának megfelelő besorolások.

Mindhárom szinten megszorításként érvényesül a szintaktikai információ megőrzésének az elve (monotónia-elv): már meglévő jegy nem törölhető és nem változtatható.

#### 2.7.3.1. Az argumentumok belső ismérvekkel való osztályozása [intrinsic role

classifications]
ágensek kódolása: AGENT → [-o], azaz az ágens univerzálisan alany vagy OBL
témakódolás:

TH/PAT → [-r], azaz a téma/pat univerzálisan alany vagy tárgy
lokálisok kódolása:

LOC → [-o], azaz a LOC univerzálisan alany vagy OBL




91


Megjegyzés: a témakódolás itt elnagyolt. Meghatározott esetekben (pl. applikatív
és dativuszos szerkezetben) a TH/PAT [+o] besorolást kaphat.

A fenti kódolási lépések empirikus általánosításokat rögzítenek. A passziválatlan
szerkezetek ÁGENSE alany az aktív, és thematikusan korlátozott nem-tárgy a
szintaktikailag ergatív nyelvekben; a TH/PAT alany a szintaktikailag ergatív, tárgy a
szintaktikailag aktív nyelvekben, az akkuzatív nyelvekben pedig tranzitívok tárgya vagy
intranzitívok alanya. A passzív igék ÁGENSE ismét csak thematikusan korlátozott nemtárgy; PATIENSÜK alany; a LOKÁLIS alapvetően oblikvuszi funkciót hordoz, de
alanyként is gyakran jelenik meg (különösen egzisztenciális mondatokban).

argumentumlekötést (mint jelentésváltoztató műveletet) minden bizonnyal a leképezési folyamat megkezdése előtt kell végrehajtani. Ennek során a megfelelő argumentumhelyet elláthatjuk a lekötöttségére utaló jelöléssel. A leképezés során a
megjelölt argumentumhelyekhez (és csak azokhoz) az alábbi szabálynak megfelelően
kötelezően a Ø szimbólumot rendeljük. Az argumentumhely lekötött voltára alább a
megfelelő θ-szerepnév szögletes zárójelek közé helyezésével utalunk.
lekötött argumentum kódolása: [θ] → Ø

#### 2.7.3.2. Morfolexikai műveletek [morpholexical operations]


Azok a műveletek, amelyek az argumentumstruktúrát érintik, mivel bevezetnek vagy
elnyomnak bizonyos thematikus szerepeket. Ilyen pl. a passziválás, amelynek lényege
a főszereplő elnyomása:

# 1. passziválás: θɵ → Ø (az Ágens ezután már csak opcionálisan, thematikusan


marad a főszereplő!)

Paraméterként működhet az, hogy csak a témánál magasabb rangú főszereplő esetén mehet-e végbe a passziválás, vagy ettől függetlenül mindig.

# 2. reciprokalizálás és reflexiválás (valamely argumentum elnyomása a θɵ-hoz való

kötés következtében):
< θɵi ... θi ... >
↓
Ø




X is eating:

TH/PAT → Ø


92



A morfolexikai szabályokra vonatkozó fő megszorítás: az argumentumstruktúra
morfolexikai változtatásai következtében az argumentum szintaktikai jegyei csak

egyes szabályok nem mondhatnak erről semmit. Ilyen általános elv pl. hogy
kizárólag jelöletlen ([-o] vagy [-r] jegyű) szerepek nyomhatók el.

#### 2.7.3.3. Tipikus besorolások [default role classification]



inverzió fakultatív lehetőség, ezért áll a szabály zárójelben):
( lokatív inverzió: < TH ... LOC > esetén LOC → [-r] )
egyébként (elsewhere szabályként):
θɵ → [-r]
minden más szerepre:
θ → [+r]

A lokatív inverzió bizonyos kötött, SVX szórendű konfigurációs nyelvekben
megfigyelhető jelenség. Lényege az, hogy a tárgyatlan mondatban az alany és a
határozói (többnyire helyhatározói) vonzat "helyet cserél", pl.:

Failure comes with success.

With success comes failure.






csak ott vezethetnek be jegyértéket, ahol az adott jegynek addig még nem volt
semmilyen értéke.

### 2.7.4. Jólformáltsági feltételek [well-formedness conditions]

(1) Alanykövetelmény: minden (igei) lexikai formának kötelező alanyt kapnia.


Megjegyzés: Nem valószínű, hogy az alanykövetelmény a fenti formában univerzális
érvényű lenne, mivel a szemantikai argumentumhellyel nem rendelkező ún.
időjárásigék igen sok nyelvben a magyarhoz hasonlóan semmiféle alanyt sem

kategóriájú elemek. Az alanykövetelmény azonban igen egyszerűen és
természetes módon "fellazítható" annyira, hogy az új változat ezekre a
nyelvekre is érvényes legyen. Az argumentumhely nélküli igék jelentéstípusa





93

ben ezek nem tekinthetők (szemantikai értelemben) predikátumoknak, mivel

alanyigényük univerzálisan tehát csak azoknak az igéknek van, amelyek szemantikai értelemben predikátumok.

### 2.7.5. Példák


Az alábbi példák két különböző igetípusra mutatnak be két-két különböző vonzatszerkezethez vezető leképezési folyamatot. Az argumentumszerkezetek alatti sorok az
egymást követő lépéseket írják le. A sorok elején látható számok (pl. 3.2.) a 2.7. ponton belül annak az alpontnak a számát adják meg, amely az adott sorban alkalmazott
szabályt bevezeti.


## 3.1. [-o]

3.1.
[-r]
3.1.
[-o]

## 3.3. [-r]

3.3.
[+r]
---------------------------S S/O OBL
4.2.

O


3.1.
[-o]
3.1.
[-r]
3.1.
[-o]
3.2.
Ø
3.3.
[+r]
----------------------------− S/O OBL
4.1.

S

stand < Th, Loc >

stand < Th,



3.1.
[-r]
3.1.
[-o]
3.3.
[+r]
----------------------O/S OBL
4.1.

S

3.1.
[-r]
3.1.
[-o]
3.3.
[-r]
----------------------O/S

S
4.2.

O


94



# 3. Kontroll és anaforikus kötés [control, anaphoric binding]


## 3.1. Áttekintés


Az LFG-ben a kontroll és a kötés a grammatikai funkciókat kódoló f-struktúra
tulajdonsága (a GB-ben a konfigurációs struktúráé)

KONTROLL: a. Tág értelemben: valamely grammatikai funkciónak c-struktúraösszetevőként nem megjelenített hordozója és a matrix mondat valamely grammatikai funkciójának (c-struktúra-összetevőként kifejezett
v. ki nem fejezett) értéke közötti referenciális függési viszony.
b. Szűkebb értelemben (=funkcionális kontroll, l. lejjebb): valamely
grammatikai funkció sem c-struktúra-összetevőként, sem a régens
tételében ki nem fejezhető hordozójának (ilyen csak nyitott funkció
alanya lehet) a kontrollálása.

ANAFORIKUS KÖTÉS: A(z akár c-struktúra-összetevőként megjelenített, akár a régens lexikai tételében kódolt) személyes, mutató kölcsönös és visszaható névmási tartalmak (azaz a pro értékek) nyelvi kontextusra támaszkodó kötésének az esete.
alesete az ANAFORIKUS KONTROLL: c-struktúra-összetevőként nem megjelenített pro értékek kontrollálása

Megjegyzés: az anaforikus kötés és a funkcionális kontroll ugyan kizárják egymást, de a
kontroll tágabb, általános fogalmával az anaforikus kötés nem áll kizáró viszonyban. A "kontroll" tágabb értelmezése ugyanis kiterjed az anaforikus kötés
sajátos eseteire is (mindazokra, ahol a kontrollált névmási érték (pro) nem fejeződik ki c-struktúra-összetevőként).

A tágabb értelemben vett kontroll fajtái:

# 1. FUNKCIONÁLIS KONTROLL [functional control, grammatical control]


A "kontroll" terminus szűkebb értelme: nyitott funkció (XCOMP vagy XADJ)
alanya és annak kontrollálója közötti viszony. Ide tartoznak a GB-ben PRO-val (a


Alfajai: a) LEXIKAILAG INDUKÁLT
b) STRUKTURÁLISAN INDUKÁLT







95


# 2. ANAFORIKUS KONTROLL [anaphoric control]


Zárt funkció összetevőként ki nem fejezett pronominális alanya és a vele koreferens kontrolláló közötti viszony


# 3. ÁLTALÁNOS KONTROLL [arbitrary control]


Az anaforikus kontroll "degenerált" változata: az az eset, amikor egy lexikailag ki
nem fejezett grammatikai funkciónak nincs antecedense (kontrollálója) sem.


# 4. ÖSSZETEVŐS KONTROLL [constituent control]


A távoli összetevők közötti függési viszonyok



Összefoglalva:
kontrollviszony:
anaforikus
funkcionális

│ ANAPHORIC BINDING
│
│
╔═╪═
═════════════════════╪═════════════════╗


CONTROL
║
kontrollált: │ testes ║
│
kifejezetlen
║
│
║
│

║
│
║ ANAPHORIC CONTROL
│
│
║
│

│
│
║
kontrolláló: │ (van) ║ van
nincs
│
(van)
║
│alapeset ║ alapeset ARBITRARY CONTROL │ FUNCTIONAL CONTROL ║

║
╚═════════════════════════════════════════╝

## 3.2. Funkcionális kontroll [functional or grammatical control]


Nyitott grammatikai funkció (XCOMP vagy XADJ) alanya és annak kontrollálója közötti viszony. A kontrollált elemnek (az XCOMP/XADJ alanyának) a referenciális tulajdonságait (ezen belül azt is, ha nem referál) a kontrolláló egység referenciális tulajdonságai határozzák meg. A kontrolláló és a kontrollált közötti referenciális függés a
tagok funkcionális jegyeinek teljes azonosságával jár együtt: a kontrolláló és a kontrollált elem f-struktúrái ezért teljesen azonosak.

Az f-struktúrában azzal ábrázoljuk a kontrollviszonyt, hogy a megfelelő grammatikai funkciók értékhelyeit egy ívelt vonallal összekötjük:


96


┌
│ PRED
│ ...
kontrolláló → │ Gi
│
│ ...
│ ...
nyitott funkc. → │ XCOMP/XADJ
│
│
│ ...
└

┐
│
┌
┐ │

│ ...
│ │ │
└
┘ │ │
┌
┐ │ │
│ PRED ... │ │ │

│ ...
│ │
└
┘ │
┘
....


A funkcionális kontrollviszonyok jellemzői:
a.
b.
c.
d.
e.


A kontrollált tag mindig egy nyitott funkció (XCOMP vagy XADJ) alanya.

Kötelezően van kontrolláló.

A viszony lokális.

A kontrollálót a funkciója jelöli ki.

A kontrolláló (a szokásos testes frázisokon kívül)
lehet:






pl. az angol it és a legtöbb idiómatöredék [idiom chunk] is. (Ilyesmi a

RAISING-es igéknél áll fenn.)
de nem lehet:

# 1. Ø funkciós (*Péter melegen eszik.)


# 2. nem létező (*Melegen alkonyodik; *Sötétté esteledik)


# 3. a magyar mondatokban nem-specifikus (legalábbis lapos mondatban:

*Péter kenyeret eszik melegen; *Péter kenyeret vág szeletekre.)

f. alfajai: a) LEXIKAILAG INDUKÁLT:
az XCOMP esete
b) STRUKTURÁLISAN INDUKÁLT: az XADJ esete
g. a kontrollálót technikailag kontrollazonossággal [control equation] adjuk meg, így:
(i) lexikálisan indukáltaknál (a régens lexikai tételében):

(ii) strukturálisan indukáltaknál (c-struktúra annotációban):

(↑Gi)=(↓SUBJ)




97


### 3.2.1. Lexikailag indukált funkcionális kontroll [lexically induced functional control]


Ez a funkcionális kontrollnak az a változata, amelyben a kontrollviszonyt egy régens
lexikai tulajdonságai állítják fel a vonzatkeretében szereplő elemek között. A kontrollált tag mindig a régens XCOMP funkciójú vonzatának az alanya.

A lexikailag indukált funkcionális kontrollviszonyok jellemzői:
a. A kontrollviszony mindig ugyanazon régens vonzatait érinti.
b. Egy adott régens szintjén (egy szerkezetmagban, l. 3.3.1.1.) csak egy ilyen viszony lehetséges.
c. Kontrollálóként minden egyes szerkezetben csak egyetlen vonzat jöhet szóba.
d. A kontrolláló csak szemantikailag korlátozatlan funkciójú elem lehet.
e. A kontrollált elem XCOMP funkciójú vonzatban található (annak alanya).
f. A kontrollviszonyt maga a régens szabja meg: mindig a régens lexikai jellemzése jelöli ki valamelyik szemantikailag korlátozatlan argumentumot az

XCOMP alanyának kontrollálójaként (az alábbi sémában *-gal):
arg1... *argi... argj... argn
│
│

Gi Gj (=XCOMP)
g. Ezért a kontrollazonosság, amellyel az ilyen viszonyt technikailag rögzítjük, a
régens lexikai tételének a része. A fenti sémának megfelelő kontrollazonosság:
(↑Gi) = (↑XCOMP SUBJ)
h. Jelöletlen esetben a kontrolláló a vonzatkeret THEME szerepű argumentuma,
azaz
ha az nincs, akkor
ha az sincs, akkor


OBJ2/OBJTH

OBJ

SUBJ


Ez elsewhere-szabály: minden olyan esetben automatikusan működésbe lép,
amikor a lexikai tétel nincs másképp jelölve.
i. Jelölt esetben az egység lexikailag adott kontrollazonossága (l. f.) blokkolja a
fenti szabályt.
j. A kontrolláló lehet (az XCOMP-éval közös) régensének
(i) thematikus vonzata:
(ii) nem-thematikus vonzata:

a hagyományos Equi jelenségköre
a hagyományos Raising jelenségköre.


98



#### 3.2.1.1. Az XCOMP funkció


Az egyetlen nyitott (=predikatív) vonzatfunkció. Mint ilyen, mindig az őt kívánó régens egy másik vonzatának valamilyen tulajdonságát fejezi ki. Lexikailag nem realizálható alanyát ez a vonzat kontrollálja, így az XCOMP-pal kifejezett predikátum erre
vonatkozik.

Példa:


Marit butánakXCOMP tartom. 'úgy vélem [Mari buta]'

Az összefüggések informális sémája:


RÉGENS: tart: 'x azt gondolja, hogy [ λy f(y)
(z) ]'
│

│

VONZATAI: SUBJ

XCOMP

OBJ (=kontrolláló)
'én'
'λy buta(y)' 'Mari'
│
║

SUBJ
║

KONTROLL:
╚════╝
(↑XCOMP SUBJ)=(↑OBJ)

A példamondat szerkezete:
lexikai struktúrák

c-struktúra


Marit, N
(↑PRED) = 'MARI'
(↑CASE) = ACC
stb.


S

(↑OBJ)=↓
(↑XCOMP)=↓
│
(↓CASE)=CDAT
↑=↓
(↓CASE)=CACC

NP

NP

V
│
│
│

Marit
butának
tartom

butának, N
(↑PRED) = 'buta(x)<(↑SUBJ)>'
(↑CASE) = DAT
stb.
tartom, V
(↑PRED) = 'x HISZ f(y)
<(↑SUBJ)(↑XCOMP)>(↑OBJ)'
(↑XCOMP SUBJ) = (↑OBJ)
(↑XCOMP CASE) =C DAT
(↑SUBJ PRED) = 'pro'
stb.

f-struktúra:
PRED 'tart<(SUBJ)(XCOMP)>(OBJ)'

SUBJ  PRED 'pro' 

stb.



OBJ
 PRED 'MARI' 

stb.



XCOMP  PRED 'buta<(SUBJ)>' 

DAT

 CASE


 SUBJ
--














Csak PROP(ozíció) thematikus szerepű argumentum kaphatja. Mivel mindig van PRED
jegye és tartalmaz alanyszerű funkciót, az XCOMP mindig szerkezetmag1,
szerkezetmag2 és komplett szerkezetmag is egyben (vö. 3.3.1.1).




99


Mindezekből következően az XADJ-tól a következőkkel határolható el:
a. Egy tagmondatban csak egy XCOMP lehet.
b. Régense formai (morfológiai) és kategoriális korlátozást is felállíthat rá (míg
az (X)ADJ bármilyen kategóriájú lehet, s morfológiáját sem egy régens szabja
meg). Megemlítendő, hogy a kategoriális korlát valószínűleg csak látszólagos,
és szemantikai restrikció következménye.
c. A régens szemantikai szelekciója alatt áll.
d. Elhagyása elrontja a mondatot, v. legalábbis a mondat jelentését.

hierarchia legalacsonyabb rangú jelenlévő tagja.
f. Mivel a kontrolláló és az XCOMP ugyanazon vonzatkeret tagjai, konfigurációs
nyelvekben testvércsomópontok alatt állnak.
g. A kontrollálónak a thematikus szerepe is fontos.
h. (az angolban, de a magyarban is): Szórendi viselkedése sokkal kötöttebb, mint
az (X)ADJ-é.
i. Az XCOMP lehet:

# 1. idioszinkratikus vonzat: RAISING-es igéknél (ezen belül AUX-okkal)

és bizonyos EQUI-s igékkel

# 2. lexikai szabállyal bevezetett: csak EQUI-s szerkezetek, ezen belül:



j. Az XCOMP formájára vonatkozó megkötések (ugyanúgy, ahogy a COMP formájára vonatkozók is) az őt megkívánó régens jellemzésének a részét képezik,
s megszorító azonosságokkal adandók meg:
(↑XCOMP COMPLEMENTIZER) =C Ø / as
(↑COMP COMPLEMENTIZER) =C that
(↑XCOMP MORPH) =C PROG PART / INF
(↑COMP MORPH) =C FIN

to
(↑XCOMP MORPH) = INF

that
(↑COMP MORPH) = FIN


100



PÉLDÁK: John seems ANGRY to me.

I consider Susan ANGRY.

John didn't sound ASHAMED OF HIMSELF.

Fred struck me AS A FOOL / AS ANGRY.

Jogging keeps Susan IN A BAD MOOD.

I'll have your brother WORKING AGAIN.

Susan kept OUT OF THE ARGUMENT.

QUIET ABOUT IT.

EATING BANANAS.

ANGRY.

Fred kept Susan WORRYING/ANGRY.

The boys made GOOD COOKS.

The boys made Mary GOOD COOKS.

Aunt Mary made the boys GOOD COOKS.

#### 3.2.1.2. Equi és Raising


A két szerkezet közös tulajdonságai:



A különbség abban áll, hogy a kontrolláló a matrix régensnek szemantikai argumentuma-e, vagy sem (azaz annak thematikus v. nemthematikus vonzata-e)

EQUI: a kontrolláló a matrix igének szemantikai argumentuma: a matrix és XCOMPja mintegy osztozkodik ugyanazon az egységen, amely így mintegy közös, azonos szemantikai argumentuma mindkettőnek.

Alany által kontrollált: <(↑SUBJ),(↑XCOMP)>
(↑SUBJ)=(↑XCOMP SUBJ)

Ilyenek: try, be (un)prepaired
magyar példák: akar, szeretne, utál, gyűlöl, szeret, próbál stb.

Tárgy által kontrollált: <(↑SUBJ),(↑OBJ),(↑XCOMP)>
(↑OBJ)=(↑XCOMP SUBJ)

Ilyenek: instruct, persuade, convince, force
magyar példák: lebeszél, rávesz, eltilt, tanít stb.

RAISING: a kontrolláló egység a matrix-igének nem szemantikai argumentuma: az
mintegy az XCOMP-ból van "előre emelve" a matrix-ige vonzatai közé.

Raising to subject:

<(↑XCOMP)> (↑SUBJ)
(↑SUBJ)=(↑XCOMP SUBJ)




101


Ilyenek: tend, seem, be (un)likely
magyar példák: (vmilyennek) látszik, tűnik, mutatkozik, hat stb.

Raising to object:

< (↑SUBJ),(↑XCOMP)> (↑OBJ)
(↑OBJ)=(↑XCOMP SUBJ)

Ilyenek: believe, think, expect, want (de a magyar akar nem ilyen!)
magyar példák: (vmilyennek) tart, lát, hisz, vél, tekint stb.


Szerkezeti különbségük jól magyarázza:

# 1. azt, hogy a raising a matrix mondatban megenged jelentés nélküli elemeket és

idiómatöredékeket is, pl.:

It tends to rain in Spain.

Tabs tend to be kept on subversives.

I believe there to be 5 boys in the room.

Equiknél ez nincs:
*There tried to be a parade.
*Tabs tried to be kept on subversives.

# 2. azt, hogy az XCOMP elhagyása a RAISING esetében inkoherens mondatot eredményez (mivel a meghagyott kontrolláló szemantikailag csak az XCOMPnak volt


szemantikai argumentuma volt a matrixnak is). Pl.:

Raising: *Peter seems.
*Peter was believed.

Equi:

Peter tried.

John instructed Peter.

# 3. azt, hogy a kontrollálóra az EQUI-ben a matrix-ige is, míg RAISING esetében

csak az XCOMP állítmánya gyakorol szemantikai szelekciót. (Ebből következően


Raising: Peter / the hat / the milk / my headache seems ...

Equi: *The hat / the milk / my headache tries ...

# 4. azt, hogy az XCOMP aktív és passzív verzióit tartalmazó mondatok raising esetén

szinonímak, equinél nem:

Raising: I expect John to defeat Bill. = I expect Bill to be defeated by John.

Equi:

I told John to defeat Bill. ≠ I told Bill to be defeated by John.


102



A transzformációs nyelvtanok RAISING és EQUI transzformációinak az LFG-ben
olyan lexikai szabály felel meg, amely egy sima COMP-ot tartalmazó formából egy

XCOMP-osat állít elő:

Equi:

<...(↑SUBJ/OBJ)...(↑COMP)>
pl. convince X [that Y should ...]COMP


R-to-O: <...(↑COMP)>
pl. expect [that X would...]COMP

R-to-S:

<(↑COMP)>

→ <...(↑SUBJ/OBJ)...(↑XCOMP)>
→ convince X [to ...]XCOMP
→ <(↑XCOMP)> (↑OBJ)
→ expect X [to ...]XCOMP



XCOMP-os alakban szerepeltetni a szótárban.


### 3.2.2. Strukturálisan/konstrukciósan indukált funkcionális kontroll [structurally /

constructionally induced functional control]

A funkcionális kontrollnak az a változata, amelyben a kontrollált tagot egy szabad bővítmény tartalmazza, s a kontrollviszonyt a mondat szintaktikai sajátosságai alakítják
ki. A kontrollált tag mindig egy XADJ funkciójú szabad határozónak az alanya.

A strukturálisan indukált funkcionális kontrollviszonyok jellemzői:
a. A kontrollált elem XADJ funkciójú összetevőben található.
b. A kontrolláló thematikus szerepe nincs megkötve.
c. A kontrollálók állománya nyelvenként eltérő, az angolban: SUBJ, OBJ, OBJTH,

OBLθ. A magyarban a SUBJ és OBJ mellett az OBLθ halmazból legalább a következők kontrollálhatnak: a (-val/-vel ragos) kauzált ágensek, a
"személytelen" modális igék (szabad, kell, lehet stb.) és az "alanyszerű"
datívuszragos experiensekkel járó igék (pl.: tetszik).
d. Egy szerkezeten belül is több kontrolláló jöhet szóba egyetlen kontrolláltra.

Kétértelmű példa, ahol az egyik értelmezésben a SUBJ, a másikban az OBLAG
kontrollál:

John was passed by Mary in the hall yesterday DRUNK as usual.
e. Mivel nem lexikai jelenségről van szó, sokkal több ige mellett lehetséges, mint
a lexikai kontroll.
f. Mivel a kontrolláltat tartalmazó bővítmény nem vonzat, egy régens körében
(szerkezetmagban) több ilyen viszony is lehet.
g. A kontrollazonosság az ágrajz annotációjának a része.
h. Az annotálás logikája: Ha az adott nyelv potenciális (strukturálisan indukált)
kontrolláló viszonyainak halmazát Q-val jelöljük, akkor minden másképp még
nem megjelölt (↑XADJ)=↓ funkcionális sémához automatikusan hozzá kell
rendelni a következő formájú diszjunktív sémasort:




103

 (↑G1)

 (↑Gi)

 (↑Gn)

= (↓SUBJ)
:
= (↓SUBJ)
:
= (↓SUBJ)

például:

XP

(↑ADJ)=↓

 ahol Gi eleme Q-nak  (↑SUBJ) =(↓SUBJ) 
=(↓SUBJ) 

 (↑OBJ)

 (↑OBLAG) =(↓SUBJ) 

a konkrét esetekben a szóba jöhető grammatikai funkciók körét az összetevős
szerkezet sajátosságai lehatárolhatják. Az angolban például a mondatkezdő

XADJ-okat kizárólag az alany kontrollálhatja (azaz ebben a pozícióban az

XADJ-ok másképp annotálandók, mint más pozíciókban). Ennek megfelelően az
ágrajz annotálásakor bizonyos XADJ-oknál (a jelölt esetekben) konkrétan,
egyedileg kell megadni, hogy mi kontrollálja az alanyát Ez így megy:

XP
(↑XADJ)=↓
(↑G)=(↓SUBJ)

angolban a mondatkezdő XADJ-nál a fenti illusztrációnak megfelelően G=SUBJ.)

Ha az annotáció nem ad meg kontrollálót, akkor az XADJ kontrollálásának (nyelvbeli) általános szabálya lép működésbe (a h. alatti jelöletlen eset).

#### 3.2.2.1. Az XADJ funkció

propozíciókat
régenseket
vonzatokat


 módosító régensek grammatikai funkciója



Nem szubkategorizálható, nyitott predikatív funkció. (Az XCOMP funkciójú állapotjelölő predikátumtól eltérően) kontrollálójának thematikus szerepe nincs megkötve; nem
csak akcióigékkel lehetséges.

Mivel mindig van PRED jegye és tartalmaz alanyszerű funkciót, mindig szerkezetmag1,
szerkezetmag2 és komplett szerkezetmag is egyben (vö. 3.3.1.1.).
a.
b.
c.
d.

egy mondatban több is lehet, szabadon elhagyható
bármilyen kategóriájú lehet, s morfológiáját sem szabja meg külső kényszer
nem áll szemantikai szelekció alatt
elhagyása nem rontja el a mondatot


### 3.2.3. A PP-k annotálása és az adpozíciók lexikai tételei


strukturális feje tehát mindig a P kategóriájú lexikai egység. Funkciójuk szerint azonban
a PP-k különbözőek lehetnek, s az eltérő funkciójú PP-kben az adpozíciók eltérő
felépítésű lexikai tételekkel jelennek meg. A PP-k használhatók:


104


(1) oblikvuszi vonzatokként (zárt funkciók)

adpozícióval ("grammatikai" oblikvuszok)

adpozícióval ("szemantikai" oblikvuszok)
(1c) OBLFORM típusú funkcióban
(2) predikatív bővítményekként (XCOMP vagy XADJ típusú nyitott funkcióban)
(3) ADJUNCTokként (zárt funkciók).

Ennek megfelelően a PP-k annotálása is különböző lehet.

#### 3.2.3.1. OBLθ funkcióban


Az OBLθ funkciójú PP-k szintaktikai annotálásának tartalmaznia kell:

# 1. a PP szintaktikai funkciójának megjelölését: (↑OBLθ)=↓


# 2. a P inherens esetjegyének a kívánalmát: (↓PCASE)=C OBLθ


Egy-egy konkrét thematikus szerepet betöltő PP annotációja ebből adódóan:

PP
(↑OBLAG)=↓
(↓PCASE)=COBLAG


PP
(↑OBLREC)=↓
stb.
(↓PCASE)=COBLREC


Ezek a konkrét annotációk összefoghatók egyetlen általánositott sémapárban, mivel:

# 1. az eltérő indexű oblikvuszi vonzatok általában ugyanazon strukturális pozíciókban állhatnak


# 2. az indexek sohasem különbözhetnek az adpozíció lexikai tételében szereplő


PCASE-jegy indexétől

Az általánosabb sémapár tehát:


PP
(↑OBLθ)=↓




A két sor összevonható: az alsó egyenlőség alapján a felső sor OBLθ szimbóluma a
(↓PCASE) kifejezéssel helyettesíthető. Az összevont alak így a PP funkcióját a P jegyére hivatkozva adja meg:

PP
(↑(↓PCASE))=↓

→ a PP funkciója az, ami az ego PCASE-ének az értéke.




105


##### 3.2.3.1.1. Pusztán esetet jelölő adpozícióval: "grammatikai" oblikvuszok


Az oblikvuszi vonzatok egy részében az adpozíció szerepe kimerül abban, hogy "megjeleníti" az argumentum thematikus szerepét (és ezáltal kódolja a frázis által betöltött
megfelelő OBLθ grammatikai funkciót). Ilyen az angolban az OBLAG funkciót kódoló
by, az indirekt tárgyak OBLREC funkcióját kódoló to stb.

A "grammatikai" oblikvuszok szintaktikai tulajdonságai eltérnek a "szemantikusakétól". Az angolban pl.



bővítménnyel fejezhető ki a tartalmuk:

OBLAG



# 2. átmehetnek lokatív inverzión:


To Mary was given the gift ...

On the table was placed a candle.

A látszat a grammatikai oblikvuszoknál az, hogy az adpozíció szemantikailag tartalmas,
hiszen "van jelentése": az, hogy a frázis jelöltje az eseménynek ágense vagy a recipiense.


több mint egy esetragé. (Az adott vonzat által betöltött thematikus szerepet ugyanis a
régens lexikai tétele definiálja. Az adpozíció csak a megfelelő argumentumhelyhez
rendeli a DP/NP-t.) Ez a helyzet általában akkor áll fenn, ha a vonzatviszony csakis az
adott konkrét adpozíció segítségével jeleníthető meg. Az adpozíció lexikai tétele
ilyenkor csupán az esetjegyet tartalmazza:
by: P, (↑PCASE)=OBLAG
to: P, (↑PCASE)=OBLREC

A PP-vel megjelenített oblikvuszi vonzat f-struktúrájának további részleteiben eltérő
nézetekkel találkozhatunk.
3.2.3.1.1.1. "Egylépcsős" reprezentáció

Ez a reprezentáció következetesen megvalósítja az adpozíció szerepének az esetragéval
való funkcionális azonosítását: a PCASE-értéket az NP f-struktúrájához "adja hozzá":


106



PP
(↑(↓PCASE))=↓


NP

P
↑=↓
↑=↓
│
x
(↑PCASE)=...


OBLREC  PRED 'Mari'

 PCASE OBLREC 



PRED értékét.
3.2.3.1.1.2. "Kétlépcsős" reprezentáció

Alternatív kezelési módként ennél a típusnál gyakori, hogy az NP-t nem funkcionális
fejként (↑=↓), hanem prepozíciós tárgyként ((↑OBJ)=↓) annotálják. Mivel a "grammatikai" P-nek nincs vonzatstruktúrája, a prepozíciós tárgyi viszonyt ilyenkor a régens
vonzatkeretében vezetik be: a megfelelő argumentumhelyhez nem az OBLθ funkciót

tárgyát:
give: V, (↑PRED)='GIVE< (↑SUBJ) (↑OBJ) (↑OBLREC OBJ) >'

PP
(↑(↓PCASE))=↓


NP

P
(↑OBJ)=↓
↑=↓
│
x
(↑PCASE)=...


OBLREC

 PCASE OBLREC



 OBJ
[ PRED 'Mari' ] 


Ennek előnye, hogy a PP összetevőinek szintaktikai annotálása egységes. Az előálló

ugyanis nincs olyan PRED, amely az NP-vel kifejtett OBJ jelenlétét megkívánná. A
struktúra tehát csak akkor lesz elfogadható, ha az eredeti koherencia-követelményt
egy lazábbal váltjuk fel. A koherencia ebben a változatban akkor is kielégül, ha egy
olyan f-struktúrában lévő PRED igényli a vonzatfunkciót, amelyből a funkcionális
lokalitás megsértése nélkül lehet hivatkozni rá. (A teljesség követelményét "szövegszerűen" nem sérti ez a felírás, mivel az argumentumhellyel társított vonzatfunkciók
mindegyikének van PRED értéke. OBLθ nincs argumentumhellyel társítva, így a

PRED hiánya nem sérti a követelményt. Kérdés azonban, hogy milyen státust adhatunk egy thematikusan kötött funkciónak akkor, ha ő maga semmiféle argumentumhellyel nem áll kapcsolatban.)




107


##### 3.2.3.1.2. Szemantikai fejként funkcionáló adpozícióval: "szemantikus" oblikvuszok


Egyes esetekben a régens azt várja el, hogy a vonzatként megjelenő egységnek közvetlenül a szemantikai tartalma árulja el az argumentum thematikus szerepét; formai

vhol. Ilyenkor általában határozószók és határozói névmások is betölthetik a vonzat
funkcióját (otthon, itt, fent stb). Ha a vonzatot viszonyító elemmel (raggal, adpozícióval)
ellátott NP jeleníti meg, a viszonyító elem megválasztása (-ban, -on, mellett, mögött
stb.) jelentésmeghatározó tényező, a viszonyító elem tehát ilyenkor szemantikailag
tartalmas. Az adpozíciónak ilyenkor tehát van PRED jegye, amely vonzatként kívánja
meg egy prepozíciós tárgy jelenlétét:

PP
(↑OBLLOC)=↓

OBLLOC


NP

P
(↑OBJ)=↓
↑=↓
│
mellett
(↑PRED)='mellett<(↑OBJ)>'

 PRED 'mellett <(↑OBJ)>' 


 OBJ
[
]



##### 3.2.3.1.3. Bajok az OBLθ funkciójú PP-k kezelésével

(1) ezek szerint a szemantikus to helyén megengedett többi prepozíció csak a PREDben tér el a to jellemzésétől, a CASE jegyük ugyanaz (vagyis OBLGOAL). Igaz-e
empirikusan, vagy következik-e valamilyen elvből az, hogy ezek nem használatosak
"grammatikai" PP-ben? Mert ha ilyen garancia nincs, akkor ezek is behelyettesíthetők a "grammatikai" PP-be, s ezzel agrammatikalitást idéznek elő.
(2) Egyáltalán miért kellene a két PP-nek ugyanazt a grammatikai funkciót tulajdonítani, ha ráadásul még a szintaktikai viselkedésük is eltérő (pl. a dative shift viszonyában)?
(3) Ha a PP-hez mindkét szerkezetben ugyanazt a funkciót rendeli az annotáció, akkor
mi akadályozza meg azt, hogy a give melletti PP-t is "szemantikus" PP-ként
bontsuk ki? A give vonzatigényét ugyanis formailag az OBLGOAL jegyű P-k bármelyike tökéletesen kielégíti. Ahhoz, hogy konkrétan csak a PRED nélküli to jelenhessen meg, azt FORM-ként kellene megkívánnia a give-nek. Egyrészt akkor ezt
fel is kellene tüntetni a fenti szerkezetekben, másrészt ezáltal a "grammatikai"
prepozíció az idioszinkratikusan megkívánt esetjelölők szintjére züllik le. Ez nemcsak intuitíve kellemetlen, de abszolut indokolatlanná teszi azt is, hogy a PP-t thematikusan kötöttként (OBLGOAL funkciójúként) kezeljük]
(4) az (↑(↓PCASE))=↓ rövidítés (egyéb problémák mellett) szemantikus oblikvuszokra tulajdonképpen csak úgy működhet, ha a különböző jelentésű lokális ragoknak és névutóknak csak a jelentésük (PRED jegyük) különbözik, a PCASE értékük
azonos (OBLLOC). Ugyanezeket a ragokat és névutókat viszont a grammatikai ob-


108


likvuszi használatban csakis eltérő PCASE értékekkel különböztethetjük meg egymástól.
(5) Legalábbis részleges megoldás lehet az, ha a szemantikus P-k jellemzésébe behozunk egy közvetítő szerepű THETA attribútumot, s a szintaktikai annotáció csak a
megfelelő érték esetén adna megfelelő funkciót:

PP
(↑OBLLOC)=↓

OBLLOC
(↓THETA)=C LOC


NP

P
(↑OBJ)=↓
↑=↓
│
mellett
(↑PRED)='mellett<(↑OBJ)>'
(↑THETA)=LOC

 PRED 'mellett <(↑OBJ)>' 
 THETA LOC



 OBJ
[
]



#### 3.2.3.2. OBLFORM funkcióban


A korábbi hagyományos nyelvtanokban képes helyhatározó néven említették a határozóragos és névutós frázisoknak azt a (mindig vonzatfunkciót betöltő) használatát, amikor a viszonyító elem eredeti szemantikai tartalma semmiféle szerepet sem játszik a
frázis (és egyáltalán a mondat) jelentésleírásában. A viszonyító elem ilyenkor kizárólag


viszonyító elemek valamelyikének az alaki jellemzése. Ha az elem egyalakú, akkor a
funkciónév indexeként használhatjuk magát az alakot is, egyébként azonban célszerűbb
a viszonyító elemnek a grammatikai metanyelvben használatos elnevezését alkalmazni,
pl.:

OBLMELLETT: kiáll vmi mellett

OBLINE: gyönyörködik a tájban/képben

PP
(↑OBLMELLETT)=↓

OBLMELLETT


NP

P
↑=↓
↑=↓
│
│

Mari
mellett
(↑CASE FORM)='MELLETT'

 PRED 'MARI'



 CASE [ FORM MELLETT ]




109


#### 3.2.3.3. Predikatív (XCOMP vagy XADJ) funkcióban


Itt a P az egység fejének szerepét betöltő régens, amelynek hiányzó alanyi vonzatviszonya kötelezően kontrollálandó:

PP
 (↑XCOMP)=↓ 


 (↑XADJ)=↓ 


NP

P
(↑OBJ)
↑=↓
│
x
(↑PRED)='...<(↑SUBJ),(↑OBJ)>'

Azaz a szerkezetnek itt a kétargumentumú P a feje, amelynek az NP a tárgyi vonzata.

#### 3.2.3.4. ADJ funkcióban


A PP belső felépítése valószínűleg mind a funkcionális szerkezet, mind a szemantikai
jellegzetességek terén teljesen azonos a szemantikus vonzatokéval. Eltérés csakis a
külső viszonyokban található: az egyik vonzatfunkciót visel, a másik ADJ(unct).

## 3.3. Anaforikus kötés [anaphoric binding]


A személyes, mutató, kölcsönös és visszaható névmások referenciájának a nyelvi kontextus alapján való megkötése (az alábbiakban a "névmás" terminust kizárólag ezekre
értve használom). A felsorolt esetek közös vonását kiemelve általánosabban úgy
fogalmazhatunk, hogy a (↑PRED)= ='pro' jegy köré épülő f-struktúrák kötését

szolgáltatja-e, vagy sem.

A kontrolláló10 és a kötött elem közötti referenciális azonosság semmiféle azonosságot nem implikál a grammatikai jegyek tekintetében. Az f-struktúrák nem azonosak.

Az antecedens meghatározásában alapvető szerepű jegyek:




Az angolban a reflexívek [+ncl] jegyűek,
a nem-reflexivek [-ncl] jegyűek.
10


Anaforikus kötés esetén a "kontrolláló" terminus helyett más elméletekben elterjedtebb (és az LFG-ben is használható) az "antecedens" elnevezés.


110



### 3.3.1. A technikai apparátus


#### 3.3.1.1. Segédfogalmak


szubkategorizáló funkciók tartománya (ezzel a definícióval működik a [± ncl]
jegy)

azaz: amely tartalmaz egy Nuclus1-et (erre van szükség az f-command fogalmánál)


Szerkezetmag1 

-









PRED ' ... <(↑SUBJ),(↑OBJ)>'

SUBJ

OBJ
----------------------TOPIC

ADJUNCT










 Szerkezetmag2





A szemantikailag tartalmas viszonyító elemek (ragok, preés posztpozíciók)
vonzatkerete önálló szerkezetmagokat (nukleuszokat) képez! Ugyanezek az elemek azonban nem képeznek szerkezetmagot, ha szemantikailag tartalmatlanok, s
ezért nincs vonzatkeretük. A raggal vagy névutóval ellátott főnév (pontosabban:

DP/NP) ezért csak az utóbbi esetben tartozik közvetlenül az ige által
meghatározott nukleuszba.

Komplett szerkezetmag [complete nucleus]: olyan szerkezetmag, amelyben van alanyszerű funkció (= "alanyos" szerkezetmag)

Alanyszerű funkciók [subjective functions]: SUBJ és POSS

Mivel kötelezően van alanyuk, minden XCOMP és XADJ komplett szerkezetmagot képvisel. (A PP formájúak is, amelyekben a prepozíció a 2 vonzatos,
alanyt is kérő tételével van jelen.)

Nem komplett a POSS nélküli NP és az OBL (valamint az ADJ) funkciójú PP.

Kötési jegy [binding feature]: a névmási elemek jegyeként szereplő [±ncl] (nuclear1):
lényegében azt adja meg, hogy az adott névmásnak az őt tartalmazó szerkezetmagon
belül ([+ncl]: visszahatók és kölcsönösek), vagy azon kívül ([-ncl]: személyes, mutató)
kell-e antecedensre találnia (pontosabban l. 3.3.1.2.) :




111

non-nuclear
pronoun
her:









PRED

CASE

PERS

NUM

GEND

NCL

'pro'
acc
3
sg
fem
−

nuclear
pronoun







herself:









PRED

CASE

PERS

NUM

GEND

NCL

'pro'
acc
3
sg
fem
+









F-vezérlés [f-command]: A akkor és csak akkor f-vezérli B-t, ha mindazon f-struktúrák,
amelyek tartalmazzák A-t, tartalmazzák B-t is.

#### 3.3.1.2. Az anaforikus kötés elvei [principles of anaphoric binding]

(i) A nukleáris névmásnak az őt tartalmazó legkisebb KOMPLETT (vagyis "alanyos") nukleuszban kell antecedenst találnia.

nem lehet antecedense.
(iii) A névmások egyeztetendők az antecedenseikkel.

Az (i) és a (ii) elv aszimmetriája mindkét alábbi mondatot megengedi. (Ha a legkisebb nukleusz nem "alanyos", akkor mindkét névmásnak azon kívüli antecedens
kell; a nem-nukleárisé is állhat a legkisebb alanyosban, ha ő egy még kisebben
van):

Maryi liked [the story about herselfi].

Maryi liked [the story about heri],
Ám, ha a legkisebb szerkezetmag egyben komplett szerkezetmag is, a helyzet megváltozik:
*Maryi liked [Louise's story about herselfi].

Maryi liked [Louise's story about heri].

Mivel minden definíció az f-struktúrára van megfogalmazva, azonos c-struktúrabeli
konfiguráció esetén is lehetnek különböző anaforikus viszonyok. Ez jól látható a PP-knél és XCOMP-oknál:

# 1. A GRAMMATIKAI OBLIKVUSZok PRED-jének nincs vonzata, így a PP nem

képez szerkezetmagot. Az oblikvuszi névmás így régensének többi vonzatával közös
szerkezetmagban áll, s ezért, ha antecedense ezek közül való, akkor csak reflexív
alakú lehet:

Mary sent the book to herself.
*her


OBL

 CASE to

 OBJ [PRED 'pro']

vagy: OBL  CASE to 
 PRED 'pro'


112



# 2. A SZEMANTIKAI OBLIKVUSZ szerepű PP-kbe a P hozza a PRED-et. A P ilyenkor csak prepozíciós tárgyat igényel, tehát a frázis nem-komplett szerkezetmagot

képez. A prepozíciós tárgy helyén álló névmások ezért a régens másik vonzatát
akkor is elfogadják antecedensként, ha visszaható, de akkor is, ha személyes névmás
formájúak:

Mary pulled the blanket around herself.
her


OBL  PRED 'around <(↑P-OBJ)>' 
 P-OBJ [ PRED 'pro' ]



# 3. Az XCOMP és az XADJ komplett szerkezetmag. Ezért a bennük található névmási

bővítménynek az antecedenseként csak akkor jöhet szóba az XCOMP-on, XADJ-on
kívüli egység (tehát a főigének valamelyik argumentuma), ha a bennük levő névmás
nem reflexív:

XCOMP  PRED 'admire<S,O>' 

Susan kept Fred admiring *herself for years.
 SUBJ __ (← control) 
her



Triviális kivétel az az eset, amikor az antecedens azonos az XCOMP/XADJ kontrollálójával, mert ilyenkor az XCOMP/XADJ alanya is antecedens:

Susan kept Fred admiring himself for years.


XCOMP  PRED 'admire<S, O>' 





#### 3.3.1.3. Példák


Mary criticized  herself (+coref)  .


 her
(-coref) 

S

 SUBJ Mary


NP

VP
 PRED 'criticize <(↑SUBJ),(↑OBJ)>' 

 OBJ
'pro'


V

NP

Mary criticized pro


Mary's criticism of  herself (+coref) .


 her
(-coref) 

NP


Mary
 POSS

NP

N'
 PRED 'criticism <(↑POSS),(↑OBLTH)>'



N

PP
 OBLTH  CASE of 


 OBJ
'pro' 

P

NP

Mary's criticism of
pro










113


Mary never expected the criticism of  herself (+coref)
.

 her
(+ v. coref) 

Mary
 SUBJ
 PRED 'expect <SUBJ,OBJ>'

+
 OBJ
 DEF

 PRED 'criticism <Ø, (↑OBLTH)>'



 OBLTH  CASE of



 OBJ
'pro' 
↑
↑
smallest
smallest

COMPLETE NUCLEUS

NUCLEUS

















Susan kept Fred admiring  *herself (-coref)
 for years.

 her
(+ v. coref) 









SUBJ

PRED

OBJ


Susan
'keep <SUBJ, OBJ, XCOMP>'

Fred






XCOMP  SUBJ Fred
 
 PRED 'admire <SUBJ,OBJ>’  
 OBJ

Susan
 


Norvég névmások:

seg selv
seg
ham selv
ham

[+sb, +ncl] 'self'
[+sb, -ncl] 'self'
[-sb, +ncl] 'himself'
[-ncl]
'him'


### 3.3.2. Anaforikus kontroll [anaphoric control]


Az anaforikus kötés [anaphoric binding] egy alesete: zárt funkciójú bővítmény (ADJ v.

COMP) lexikailag ki nem fejezett névmási alanya és a vele koreferens kontrolláló
közötti viszony. A referenciális azonosság semmiféle azonosságot nem implikál a
grammatikai jegyek tekintetében. Az f-struktúrák nem azonosak.

Jellemzői:

# 1. ADJ vagy COMP ki nem fejezett alanyának kontrollálása. Az LFG-ben az

f-struktúrában 'pro' elem szerepel.

# 2. Ezért kontrollált elemként kizárólag lexikális alany megjelenését is megengedő

szerkezetnek (tehát VP-nek) az alanya jöhet szóba (azaz infinit VP-ben is
"valódi" tagmondat zéró alanyáról van szó).


114



# 3. A 'pro' referenciálisan azonos LEHET vmely matrix argumentummal, de kontrolláló elem nem kötelező (ennek hiányában beszélünk általános kontrollról, l.

3.3.3.).

# 4. Lehet távolsági viszony is.

5. A kontrollálót nyelvenként (sőt: struktúránként) eltérő tulajdonságai jelölik ki.

Ilyenek lehetnek: grammatikai funkció, valóságismeret, esetegyezés stb.
6. A kontrolláló és kontrollált jegyei nem kötelezően azonosak (grammatikai
esetük pl. különbözhet).
7. A 'pro' valódi névmásként viselkedik, ezért
a. kontrollviszonyai lehetnek többértelműek is (ugyanabban a szerkezetben több
elem is szóbajöhet kontrollálóként)
b. lehet "megosztott" [split] antecedense:

A told B that eating together would be more economical.

Kezelésük (az angolban): az ige lexikai tételében választhatóan felvesszük az alábbi
egyenlőség-párt:
 (↑SUBJ PRED) = 'pro' 
 (↑FIN) = −


### 3.3.3. Általános kontroll [arbitrary control]


Az általános kontroll az anaforikus kontroll egyik speciális esete. Ezt az elnevezést
akkor használjuk, amikor egy lexikailag ki nem fejezett grammatikai funkciónak nincs
antecedense (kontrollálója). A terminus arra utal, hogy itt mintegy "degenerált" kontrollviszonyról van szó. Pl.:

At the moment, the goal is to try to prevent a riot.

A példában a try ki nem fejezett alanya (funkcionálisan) kontrollálja a prevent ki nem
fejezett alanyát, az előbbit viszont nem kontrollálja semmi (=általános kontroll).

## 3.4. Extrapozíciós szerkezetek ("összetevős kontroll") [constituent control]


Az "összetevős kontroll" terminusnak történeti oka van: a jelenség kezelésére az LFG
keretében megfogalmazott első koherens javaslat elnevezését őrzi. A fogalom alá tartozó jelenségkör az extrapozíciós, wh-típusú (azaz "távolsági") viszonyok esete, ideértve a TOPIKALIZÁCIÓT is.

A viszony jellemzői:

kíván.




115


relációknak azt a láncolatát, amely a kontrollálthoz vezet, mert az elvileg a legkülönbözőbb mélységekben is be lehet ágyazva. Ez akkor is probléma, ha eltekintünk a

családjával.

pl.:

S[That he might be wrong] he didn't think of NP[__].
ugyanis:

He didn't think of that problem.
de
*He didn't think of that he might be wrong.


mondatbeli vonzat (( ... vonzatának a) ... vonzatának a) vonzata) lehet, azaz egyik
domináló csomópontja sem lehet ADJUNCT, pl.:

Who did Mary say that Bill saw __?
*Who did Mary go away before Bill saw __?

A távolsági viszonyok kezelése

Kezelésük az 1980-as évek közepétől a funkcionális bizonytalanság leírására kidolgozott formulákkal történik.


A kiterjesztés lényege az, hogy az argumentumpozícióban szimbólumsorok halmazait (A) is engedélyezzük:
(fA)=v fennáll, ha A halmaz bármely x elemére (fx)=v

Véges halmaz esetében ez egyenértékű az A elemeire felállított egyenlőségek
véges diszjunkciójával.

Korlátozás: annak érdekében, hogy az A-ba való tartozás véges módon legyen
jellemezhető, megköveteljük, hogy A reguláris nyelv legyen. Ebben az esetben a funkcionális egyenlőségben rejlő bizonytalanság jellemzése úgy adható


116


meg, mint a grammatikai funkciók neveit tartalmazó szótár fölötti reguláris
kifejezés.

Az egyes f-struktúrákról (mivel véges terjedelműek) mindig eldönthető, hogy kielégítik-e az ilyen kifejezéseket tartalmazó f-leírásokat. Bizonyítást nyert az is, hogy az
egynél több ilyen kifejezést tartalmazó f-leírásokról is mindig eldönthető-e, létezik-e
őket kielégítő f-struktúra.

A topikalizáció végtelen bizonytalansága pl. így adható meg:

primitív grammatikai funkciók halmaza

Az ADJ-ok kiküszöbölésére alkalmas forma:
(↑TOPIC) = (↑(GF-ADJ)* GF)

Hasonló módon más restrikciók is megfogalmazhatók.




117


# 4. Lexikai folyamatok


## 4.1. Inkorporációk, komplex igék



shift] szenvedhetnek el.




Az a szinkrón lexikai folyamat, amelynek során az ige valamelyik vonzatának a prepozíciója beemelődik, lexikailag beépül az igébe, s ezáltal új lexikai tétel áll elő. A

V+P elemsor egyetlen [V+P]V morfológiai felépítésű komplex igét (complex lexical
verb) alkot, amely egy lexikalizált kételemű viszonyt (lexicalized dyadic relation) fejez
ki. Az inkorporáció csak akkor mehet végbe, ha a PP az alapigének vonzata, tehát a

PP által kifejezett grammatikai funkció szerepel az ige lexikai formájában.

belül élő, produktív folyamatok sorolhatók alá. Inkorporációról tehát csakis olyankor
beszélhetünk, amikor a folyamatnak nemcsak az outputja él az adott nyelvállapotban,
de az inputja is.

A V-P inkorporáció kezelése a korai LFG-ben a következőképpen történt:

A lexikai formán végzett művelet: (↑P-OBJ) → (↑OBJ)

Morfológiai változás:

V ←→ [V+P]V

Például: a) [speak] ,
'SPEAK-OF <(↑SUBJ), (↑OF OBJ)>'
b) [[speak] [of] ] , 'SPEAK-OF <(↑SUBJ), (↑OBJ)>'
b) passzívja: [[spoken]V[Part] [of]]V[Part] , 'SPEAK-OF <(0/↑BY OBJ),(↑SUBJ)>'

i. Az aktiv mondat az eredeti prepoziciós frázis NP-jére passziválható:

The bird was shot at by John.

Olyan NP-kkel, amelyeknek a prepozíciója lexikailag nem kapcsolódik az igéhez,
ez nem tehető meg:
*The river is lived over by the miller.


118


ii. A komplex passzív particípiumok melléknévvé konvertálhatók:
gone over NP; looked on NP; spoken of NP ←→ *a looked-like NP
iii. Míg az aktív mondat V-je és P-je közé viszonylag könnyű határozót tenni (amit a

addig a prepozíciós passzív V-je és P-je közé nem tehető adverbiális frázis (mert
ilyen szerkezete csak inkorporáción már keresztülment igének lehet):
*Everything was paid twice for.
iv. V P NP AP sorból (ha az AP is vonzat, azaz XCOMP funkciójú) mindig csak az NP
emelhető ki fókuszként (az It is XP that... formájú ún. clefting révén), a P+NP nem.

A magyarázat nem lehet az, hogy PP-k sohasem cleftelhetők, mert a

VP → V PP PP
formájú
újraíró szabállyal létrehozott szerkezetekből lehet cleftelni:

It is on John that they look with pride.

Annak, hogy ezt AP előtti PP-kkel nem lehet megtenni, az az oka, hogy
bár van
de nincs


VP → V NP AP,

VP → V PP AP

újraíró szabály, ami azt jelenti, hogy AP a fenti két szerkezet közül csak a b)-beli

NP-t követheti, az a)-beli PP-t nem.

### 4.1.2. Egyéb (főnevet vagy határozószót tartalmazó) komplex igék

[think]V[better]Adv : V, 'THINK-BETTER-OF <(↑SUBJ),(↑OF-OBJ)>'
[make]V[fun]N

: V, 'MAKE-FUN-OF <(↑SUBJ),(↑OF-OBJ)>'





az idiomatikus jelentést tűnteti el, hanem agrammatikalitást okoz.

[take]V[A advantage]N: V, 'A-LY TAKE-ADVANTAGE-OF <(↑SUBJ)>,(↑OF-OBJ)>'




119


Az inkorporált tagok:

nem pronominalizálhatók,
nem determinálhatók másképpen,
szám, személy stb. szerint nem változtathatók.


Az inkorporált tételek egy részének van idiomatikus párja is, amelyben az itt inkorporált
elem ott FORM jegy értékeként megadott, szintaktikailag független tag, pl.:
take: V, 'TAKE-ADVANTAGE-OF <(↑SUBJ),(↑OF OBJ)>'
(↑OBJ FORM) =C ADVANTAGE

Itt a passziválás símán működik az OBJ FORM-on (Not much advantage was taken
of his talents). Az inkorporált változat csak az OF OBJ-ra és csak V-P inkorporációt
követően passziválható (His talents weren't taken advantage of).

## 4.2. Idiómák


Az idiómák olyan egységek, amelyeknek a formája jelentéses egységek alakjából van

bedobja a törülközőt 'feladja a kilátástalan küzdelmet'. Mivel részeik jelentésének és
a nyelvtan általános szabályainak az ismerete nem elégséges a megértésükhöz, az

egyes szavaik a mondatokban önálló szintaktikai egységekként viselkednek.

### 4.2.1. "FORM" kikötést tartalmazók


vonatkozó funkcionális információt, a szintaxis pedig nem változtathatja meg a jelentést
hordozó PRED jegyeket. Ezekből a korlátozásokból adódik az idiómák kezelésére az

LFG-n belül eddig legelterjedtebbnek mondható javaslat. Az idiómát a tagjai közül
szintaktikailag funkcionális fejként viselkedő egység egyik külön lexikai tételeként
vesszük fel a szótárban. Ennek a tételnek a szemantikai formájaként adjuk meg az
idióma teljes jelentését, a vonzatkeretben pedig a megfelelő grammatikai funkcióban
megkövetelt formaként tüntetjük fel az alárendelt tagot (vö. 2.6.2.1.).
a. alapeset: keep tabs on sg 'figyelemmel kísér'
keep: V, 'OBSERVE <(↑SUBJ),(↑ON-OBJ)>'
(↑OBJ FORM)=C TABS

tabs: N, (↑FORM)=TABS
(↑NUM)=PL


A mondatban a tétel jelentése csak akkor áll elő, ha a mondatban szerepel a
kötött formájú elem is. A régens annotációjában ezért megszorító azonossággal
kell utalni arra, hogy a másiknak (az argumentumnak) mi a kötelező FORM-ja.


120



Az utóbbihoz tartozó lexikoncikk egyik tételének ennek megfelelő jellemzést kell
tartalmaznia.

A formailag kötött elem csak grammatikailag bővítmény, logikailag nem.

Ezért a kötött elem funkciója nem szerepel a <>-en belül, azon kívül kell megadni.

A fenti felírási módnál jobban megfelel a tényeknek (annak, hogy a szóban forgó
elem grammatikailag bővítménynek minősül) az alábbi felírási mód (mindkettővel
találkozni):
keep: V, 'KEEP-TABS-ON <(↑SUBJ),(↑ON-OBJ)> (↑OBJ FORM)=C TABS'

A FORM-os tag: nem pronominalizálható,
nem determinálható másképpen,
száma, személye stb. nem változtatható;
viszont: lehetnek jegyei (l. tabs fent),
kaphat kisebb kiegészítéseket (l. b. lent),
lehet szabadon interpretálható módosítója (l. c. lent),
lehet saját bővítménye (l. d. lent),

b. kisebb kiegészítés:
changer: V, (↑PRED)='changer-d'avis<(↑SUBJ)>' avis: N, (↑FORM)=AVIS
(↑OBJ FORM) =C AVIS
(↑OBJ SPEC) =C DE

blokkolja az opcionális módosítók generálását: keep close tabs on sy 'watch closely'
d. szemantikailag interpretálandó darabot (összetevőt) tartalmazók: a FORM-jában
kötött közvetlen argumentum argumentuma lehet szabadon interpretálható, és a
vonzatkeret ezt is tartalmazhatja
pull: V, 'PULL-LEG <(↑SUBJ),(↑OBJ POSS)>'
'ugrat'
(↑OBJFORM)=c LEG

leg: N, (↑FORM)=LEG
(↑NUM)=SG


is/are XP') egy idiomatikus there is predikátum szerepel a következő jellemzéssel:
there: NP, (↑FORM) = THERE
be:


V , 'there-be <(↑XCOMP)> (↑OBJ)'
(↑OBJ) = (↑XCOMP SUBJ)
(↑SUBJ FORM) =C THERE
(↑SUBJ NUM) = (↑OBJ NUM)




121


Az idiomatikus tételek egy részének van inkorporált párja is, amelyben az itt

FORM értékként megadott, szintaktikailag független tag ott szintaktikailag önállótlan, inkorporált elem pl.:
idiomatikus tétel:
take: V, 'TAKE-ADVANTAGE-OF <(↑SUBJ),(↑OF OBJ)>'
(↑OBJ FORM) =C ADVANTAGE
inkorporált tétel:
[take] V[advantage] N: V, 'TAKE-ADVANTAGE-OF<(↑SUBJ)>,(↑OF-OBJ)>'

Itt a passziválás símán működik az idiomatikus tétel OBJ FORM-ján (Not
much advantage was taken of his talents), az inkorporált változat viszont csak
az OF OBJ-re és csak V-P inkorporációt követően passziválható (His talents
weren't taken advantage of).

### 4.2.2. Egyedi szelekcióval kijelölt bővítményt tartalmazók


Ezekben az idiómákban a bővítmény egyedi szelekciós megkötése szemantikai természetű (nem a formája, hanem a 'jelentése' kötött). Pl.:
to crane sy's neck '[a nyakát] nyújtogatja, hogy (jobban) lásson valamit'

Ha a szemantikai követelmény teljesül, a bővítmény szabadon pluralizálható, determinálható, pronominalizálható stb.

Tulajdonképpen itt olyan belső szemantikai argumentummal (azaz az ige szemantikai jellemzésében elkerülhetetlenül megnevezendő bővítménnyel) van dolgunk, amely

crane: V, 'CRANE <(↑SUBJ), (↑OBJ)>'
pred.arg.str.: 'crane(1,2)'
jelentésleírás: '1 nyújtogatja 2-t a jobb kilátásért, ahol 2 1-nek a nyaka'

### 4.2.3. Belső szemantikai argumentumot tartalmazók


angol nyelvű példával emlékeztjük az olvasót az ott mondottakra:
homer: V, 'HOMER <(SUBJ)>'

A belső argumentum létéről csak az ige belső szemantikai strukturája árulkodik:
'HOMER (1)' = 'hit a home run'


122



Terminuslista
↑ és ↓ → metaváltozó
63
alanyszerű funkciók → funkció
110
annotáció
15, 61
argumentumstruktúra
=lexikai szerkezet → szerkezet
14, 28
a-struktúra
=lexikai szerkezet, argumentumstruktúra → szerkezet
14, 28
attribútum (=funkcionális attribútum)
49

FORM ~
51

PRED ~
51
c-struktúra
=kategoriális/összetevős szerkezet → szerkezet
14
egyenlőség (=funkcionális egyenlőség)
61
elvek és megszorítások:
lexikai integritás
44
fej
funkcionális ~
65
kategoriális ~ (=strukturális ~, X' ~)
42, 64

FORM
51
f-struktúra
=funkcionális szerkezet → szerkezet
14, 31, 36
funkció (=grammatikai/szintaktikai ~)
13, 49
alanyszerű ~
110
címkézett ~
57
nyitott ~ (=predikatív ~)
58
vonzatfunkciók
52
zárt ~
58
funkcionális
~ attribútum
49
~ bizonytalanság
115
61
~ egyenlőség → egyenlőség
~ fej _ fej
65
~ séma
62
~ szerkezet → szerkezet
13, 14, 31, 36
grammatikai funkció
=szintaktikai funkció, mondatrész-szerep → funkció
49
hierarchia
thematikus ~
89
kategoriális szerkezet
=összetevős szerkezet → szerkezet
14
lexikai integritás → elvek és megszorítások
44
lexikai szerkezet
=argumentumstruktúra → szerkezet
14, 28




123

metaváltozó
63
↑ és ↓ ~
63
mondatrész-szerep
=grammatikai/szintaktikai funkció → funkció
13, 49
névmásinkorporáció
24
nukleusz → szerkezetmag
110
nyelvtan
13
nyitott funkció
=predikatív funkció → funkció
58
összetevős szerkezet
=kategoriális szerkezet → szerkezet
14

PRED
51
predikatív funkció
=nyitott funkció → funkció
58
pro-drop → névmásinkorporáció
24
szemantikai
~ forma
51
szerkezet
felszíni ~
14, 27
funkcionális ~
13, 14, 31, 36
kategoriális ~ (=összetevős ~)
14
lexikai ~ (=argumentumstruktúra)
14, 28
összetevős ~ (=kategoriális ~)
14
szerkezetmag
110
komplett ~
110
szintaktikai
~ komponensek
18
szintaktikai funkció
=grammatikai funkció, mondatrész-szerep → funkció
thematikus
~ szerepek hierarchiája
89
vonzatfunkció → funkció
52

X'-elmélet
42
zárt funkció → funkció
58

49


