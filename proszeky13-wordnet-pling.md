Lexikális szemantika:
  a számítógépes nyelvészet és a pszicholingvisztika határán
Prószéky Gábor, Miháltz Márton, and Kuti Judit
2013

# Abstract

* WordNet adatbázist, különös tekintettel a kognitív
* organization
  * történeti kontextusba helyezzük az adatbázistípus keletkezését
    * nyelvészet, a pszicholingvisztika és a mesterségesintelligencia-kutatás
      fejlődésének szerencsés találkozási pontján születettek a wordnetek
  * Magyar WordNetet
    * néhány, kognitív tudományi szempontból releváns jellegzetességét
  * két ... kutatást a Magyar WordNet [felhasználásával]
    1. jelentésegyértelműsítésben
    2. igé[k] szemantikus megszorításaival való automatikus kiegészítésére

# 1 A lex a ling, az AI, a pling és az NLP világában

* Schank modelljében például a _megiszik_ és az _injekciót kap_ „metaigéje” az,
  amelyik lehetővé teszi a bejutást, méghozzá folyadék bejutását egy élő
  szervezetbe, és az a konkrét testrész jelenti a szignifikáns különbséget,
  amin keresztül a bejutás történik, tehát a száj, vagy a bőrfelület. Ennek
  megfelelően az ábrázolás ezeket a világismeretből vett elemeket mind
  tartalmazta,
* A mesterséges intelligencia egyik atyja, Minsky korai kutatásainak közép-
  pontjában sem az egyetlen szó, hanem az ún. _keretek_
  * speciális adatszerkezetek
  * sztereotipikus dolgok és szituációk reprezentálására
  * Minsky érdeme elsősorban a formális megfogalmazás (Minsky 1975),
* Charniak Minsky ötletét továbbfejlesztve, kimondottan nyelvfeldolgozási célra
  létrehozott egy olyan keretelméletet, amelyben a mindennapi gondolkodás
  következtetési lépései döntő szerepet játszottak (Charniak 1976)
* Wilks (1972) _preferenciális szemantikája_ volt
  * szövegrészletek lehetséges interpretációi közül a mért szemantikai
    sűrűségnek megfelelően kell kiválasztani
* Sowa
* Microsoft MindNet
  * csak részleges információk kerültek ki, a rendszer egészét a „külvilág”
    egészében nemigen ismerhette meg (Dolan+ 1998)
  * Recski: Én egy 2005-ös EMNLP-n megjelent Vanderwende+ cikket néztem
    most meg.  Fun fact: Vanderwende azóta az AMR-ben hisz, Denverben egy
    soknyelvű AMR parszert demózott, még mindig a Microsoft színeiben:
    http://aclweb.org/anthology/N/N15/N15-3006.pdf
* szavak és kifejezések átfogó és egységes szemantikus leírására ... nagyméretű
  vállalkozás ... 1984-ben: a CyC (Matuszek+ 2006)
  * teljes rendszert csak komoly anyagi ellenszolgáltatásért
  * aprólékos kidolgozottsága, valamint az adatbázis egy részének egy
    idő után nyílt forráskódú közreadása ellenére sem

# 2 A Princeton WordNet p7

* három előfeltevéssel élt (Miller 1998):
  1. A különválaszthatóság hipotézise
    * lexikai komponense izolálható és önmagában vizsgálható
    * Míg egy nyelv fonológiai és grammatikai komponensét ... a nyelvtanulás
      egy korai fázisában, mentális szótárunk életünk végéig ...  növekszik
  2. A mintázathasználat hipotézise
  3. A teljesség hipotézise
    * [a] munkák jó része ... a WordNet előtt
      * elvérzett a nagyságrend problémáján
      * megelégedett azzal, hogy ... bemutatott 20–50 példát

# 3. Többnyelvű wordnetek p10

* 1996 és 1999 között EuroWordNet (EWN)
  * különböző nyelvek közötti jelentéskapcsolatok is megjelentek
  * nyolc európai nyelvre
  * az angol WordNeten keresztül egymással is összeköttetésben vannak
    * nyelvközi index (ún.  InterLingual Index)
* felső ontológiája ... (top ontology, TO) rendszerezi
  * magas szintű, nyelvfüggetlen fogalmak hierarchiája
  * minden csomópontja egy ún.~magas szintű fogalom (top concept, TC)
  * olyan meghatározó szemantikaelméletek alapján alakították ki, mint pl. az
    * qualiák elmélete (Pustejovsky 1995), vagy az
    * Aktionsart igeosztályozás (Comrie 1976)
* teniszprobléma: hiányoznak az olyan fogalmi kapcsolatok, amelyek nem fogalmi
  hasonlóságokon vagy ellentéteken, hanem [pl. a teniszhez] tartozáson
  alapulnak, _ütő, labda, háló_ (Fellbaum 1998b)
* EuroWordNet[ben]
  * új, több enciklopédikus információt hordozó `role` relációk bevezetése
  * eseményszerűségek tipikus szereplőit hozza kapcsolatba az ... igével
  * típusait a ... tematikus szerepeknek megfelelően választották ki
  * pl.  tanítani – tanár – diák – iskola
  * a FrameNethez (Fillmore+  2002) hasonló
* 2001 és 2004 között zajló BalkaNet
  * további öt európai nyelvre
  * még egy magasabb szintű szemantikai struktúrát, amelyet
    a Suggested Upper Merged Ontology (SUMO) ontológiából (Niles–Pease 2001)
    importáltak
* A két említett projekt ... két wordnet-építési módszert
  1. összevonásos módszerben (Merge Model) a lokális alapfogalmakat valamilyen
     saját erőforrásból kiindulva választják ki, belőlük a synseteket és a
     köztük lévő relációkat önállóan fejlesztik ki, majd
     ekvivalencia-relációkkal leképezik őket a PWN synseteire. A
  2. kiterjesztéses módszer (Expand Model) szerint a lokális alapfogalmakat a
     PWN-ből választják ki, és a kiválasztott synseteket (kétnyelvű szótárak
     segítségével) lefordítják az ekvivalens saját synsetekre
     * egynyelvű erőforrások segítségével ellenőrzik őket
* Magyar WordNet
  * gépi információszerző és -kivonatoló eszközök[kel]
    * (Prószéky–Miháltz 2008; Miháltz 2010)
    * létező (elektronikusan feldolgozható) forrásokból merítve
      * kétnyelvű szótárak fordítási párjai,
      * egynyelvű (értelmező) szótárak definíciói és egyéb szótári jelzetei,
      * tezauruszok fogalmi csoportjai,
      * morfológiai elemzőkkel azonosított morfoszemantikai viszonyok stb.
    * kézi ... ellenőrzés és szerkesztés
  * relációkat ... a PWN-ből örökölte
    (a két wordnet fogalmai között teljes megfeleltetés van)
    * ellenőrzése, a hierarchiáknak a magyar nyelv szemantikai paradigmájához
      adaptációja már teljes mértékben kézi

# 4. A Magyar WordNet és újításai p13

* 42 000 fogalmi csomópontot tartalmaz
* szófajok közöti arányok (főnév, ige, melléknév, határozószó)
  a Magyar Nemzeti Szövegtár szófaji megoszlását követik
* minden csomópontja nyelvközi relációval utal ... a hozzá legközelebb álló
  Princeton WordNet synsetre
* szókincs teljes egészében lefedi a BalkaNet projektben kiválasztott mintegy
  8500 ún. „BCS” synsetet
* az egyes szófajok leggyakoribb, a magyar nyelvre jellemzőnek ítélt fogalmai
  * főnevek és melléknevek esetében a
    * Magyar Nemzeti Szövegtár (MNSZ) lemmagyakorisági listáit, illetve az
    * Értelmező Kéziszótár (ÉKsz.) elektronikus változatában a definíciók
      szemantikai elemzéseit felhasználva kerültek kiválasztásra
      * Hatvani+ 2006; Prószéky–Miháltz 2008
  * igék esetében az MNSZ-ben azonosított leggyakoribb igei vonzatkeretek
* a gazdasági-üzleti szaknyelv irányába tartalmaz bővítést

## a Princeton WordNethez képest bevezetett újítások

* nagyrészt az igei, kisebb részben a melléknévi
* melléknévi WordNet meghatározó struktúrája a kétpólusú klaszter
  * alapját az antonima
  * két új relációval egészítettük ki
  * ezek száma szinte elenyésző az antonima és hasonlósági relációkéhoz
    képest, elméleti jelentőségük van
  * middle
    * két ellentétes melléknév között – kvázi „félúton”: `middle` relációt
    * a három (vagy még több) synsetre vonatkozó antonimareláció[k helyett]
    * Például az {amfoter} synset middle relációban van a {savas} és a {lúgos}
  * `partitions` reláció
    * a melléknév ..  csak egy adott szemantikai típusú főnévre vonatkozhat
    * Például az
      * {egynyári}, a {kétnyári}, és az {évelő} `--` {növény} synsettel,
      * {működő, aktív}, {kialudt} és {alvó, inaktív} `--` {vulkán} synsettel
* magyarban az ige eseményszerkezetére vonatkozó információ
  * aspektus, akcióminőség
  * gyakran [igekötő]
  * ige ... milyen következtetésekben vehet részt
  * nyelvi tesztek
  * eseményszemantikai (és világismereti) szempontból összetartozó igék,
    illetve melléknevek
  * összetartozónak ítélt igék hármas egységben való ábrázolása
    * Moens és Steedman (1988) munkájára támaszkodva
    * nukleusz-struktúra
    * implementálásának részletes leírása Kuti+~(2006)-ban
  * Vendler (1957) által készített felosztáson alapuló, de annál finomabb
    * központi fogalma az (esemény)nukleusz
  * eseményszerűség maximálisan három összetartozó komponensből áll:
    * előkészítő folyamat, telosz/sikerpont, és utóállapot
  * magyarban a progresszív és a perfektív aspektus
  * telikus
    * az ige által leírt eseménynukleusz harmadik komponense ki van töltve
  * több, mint puszta időbeli egymásutániság; okozás és a lehetővé tétel
  * a három komponens egyikét konceptualizálnák csupán
    * folyamat, pontszerű esemény, illetve állapot
  * synseteken belül ... az egyes igék szintjén jelöltük
    a fenti, rendezett hármasként való jelöléssel
    * ehhez [az] igék minimális propozíciókká
    * az adott jelentésben előforduló összes vonzatkeret
    * összevont vonzatkerete[k] opcionális argumentumokkal
      * a minimálisan kötelező argumentumszámukkal értelmezzük
      * Pl. az opcionális tárggyal felvett _eszik_ vonzatkerete esetében a
        tárgy nélkül képzett minimális predikátumról mondhatjuk ki atelikus
        voltát
  * [nyelvi] tesztjére az angolon keresztül vezető (kerülő)[út]
  * az egyébként a szófajok külön kezelése miatt egymáshoz nem kapcsolódó
    gyakran melléknévként lexikalizálódott – utóállapotokat és az őket
    potenciálisan előidéző igéket közvetlen kapcsolatba hozza egymással

# 5. A HuWN-nel kapcsolatos további kutatások p18

## 5.1. Az igei Magyar WordNet mint jelentésegyértelműsítő jelentéstár

* WSD: Véronis (2003)
  * az intuitív jelentésfogalom problematikus voltát,
  * illetve az enumeratív lexikonok WSD-re való alkalmatlanságát
  * kísérletében ... emberi annotátorok
* Héja+ (2009) és Kuti+ (2010)
  * Véronis (2003) alapján
  * magyar igék esetében vizsgálták
  * három jelentéstár alapján
    * adatbázisok az introspektív, illetve disztribúciós alapon készülő
      jelentéstárak közötti spektrumot voltak hivatottak képviselni.  A
    * Magyar Értelmező Kéziszótár (ÉKSz) és a
    * Magyar WordNet (HuWN) jelentéseivel, illetve az
    * Igei szerkezetek gyakorisági szótára (ISZGYSZ, Sass–Pajzs 2009)
  * 15 ige 30 előfordulását annotálta 5-5 kísérleti személy
    * „nincs” és „nem tudom” választ is adhattak

## 5.2. HuWN automatikus kiegészítés[e] ige–vonzatosztály kapcsolatokkal p20

* igék és jellemző argumentumaik
* _isz-_ sört/szavait/kortyot
* algoritmus kifejlesztése
  * bemenete egy adott igéhez egy bizonyos morfoszintaktikai pozícióban tartozó
    főnévi vonzatok gyakorisági listája,
  * kimenete pedig főnévi synsetek súlyozott listája
  * feltételek
    1. A korpuszból minél több szót fedjenek le:
      * a synset maga, vagy hiponíma reláció szerinti alárendeltjei
    2. A ... hipernima-algráfok ... minél kevesebb egyéb szót tartalmazzanak
    3. szemantikai általánosítás
    4. ha [a bővítmény] többértelmű, a
      [csak a] vonzatpozíciónak megfelelő jelentéshez kapcsolódjanak
    5. idiomatikus vonzatoknak megfelelő synseteket is megtalálni,
      * pl. `{iszik} − [case = ACC; p = . . . ] → {szó}, {fény}, {áldomás}`
* automatizált, humán itéletekből alkotott sztenderdhez képest történő
  kiértékelésének módszertanán dolgozunk
* mit (miket) tekintsünk megfelelő eredménynek?
  * legáltalánosabb (a legtöbb tárgyesetű vonzatot lefedő) ... a folyadék
  * Logikailag ... _ital_ ... hiszen nem minden folyadék [iható]
  * alkalmazásokban [releváns, hogy] alkohol és fajtái is szignifikáns

# 6. Összefoglalás p26
