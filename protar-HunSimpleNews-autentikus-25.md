# Abstract

* [eredeti és egyszerűsített] közötti kvantitatív különbségek és hasonlóságok,
* felmérjük az általunk elérhető, magyarul tudó nagy nyelvmodellek
  szövegegyszerűsítési képességét incontext tanítási környezetben. Cikkünkben
* az egyszerűsített szövegek és a standard nyelvi szövegek között 
  * lényeges különbségek: szavak varianciájában, mondatok hosszában
* a korpusz használata one-shot és few-shot tanítási környezetben is javítja a
  modellek egyszerűsített kimenetét a zero-shot eredményeinkhez képest.

# 1 Intro

* érthetővé tegyen nem prototipikus befogadók számára. 
  * a cikkben a 
    * Prototipikus befogadók alatt felnőtt, ép, anyanyelvi beszélőket értjük,
    * nem prototipikus: gyerekek, a nyelvtanulók, funkcionális analfabéták,
      illetve olyan testi vagy értelmi fogyatékos személyek, akiknek
      fogyatékossága hátráltatja őket egy adott, standard nyelvű diskurzus
      megértésében (demensek, afáziások, nyelvelsajátítás előtti halláskáro-
      sodásuk volt, stb.) (Maaß, 2020). Az tehát, hogy
  * nagyban megkönnyíti, vagy alapjában lehetővé teszi azt, hogy 
    mindennapi diskurzusokban részt vehessenek, valamint azt is, hogy a
    megfelelő információk eljussanak hozzájuk, és 
    azok önállóan feldolgozhatóvá váljanak számukra.
* A gyógypedagógiai szakirodalom az egyszerűsített szövegeket általában
  magyarul a _könnyen érthető szöveg_ vagy _könnyen érthető kommunikáció_
  * az informatikai hagyomány ezen szövegek előállítására _text
    simplification_-ként hivatkozik, így 
  * ez a tanulmány is konzekvensen a szövegegyszerűsítés terminust használja,
* != sem a szövegösszefoglalással, sem pedig a közérthetővé tételével
  * az egyszerűsített szövegekben lehetnek olyan részletek, amelyeket
    összefoglalunk a könnyebb megérthetőség érdekében, a 
  * szövegösszefoglalásnak a célja a szövegek hosszának csökkentése a
    felesleges információk elhagyásával (Shardlow (2014), Alva-Manchego és
    mtsai (2020)). 
  * A szövegegyszerűsítés ezzel szemben a szöveg bonyolultságának redukciójára
    * amennyiben ez azt igényli, hogy bizonyos fogalmakat megmagyarázzon, akkor
    * akár hosszabbak is lehetnek, mint a forrásszövegeik. 
  * A közérthető szövegek pedig prototipikus befogadók számára tesznek
    érthetővé olyan szövegeket, amelyek szakspecifikusak – a könnyen érthető,
* Jelen cikk az első olyan, magyar nyelvű hírszövegpárokból álló
  szövegegyszerűsítési korpuszt mutatja be, amely autentikus, tehát nem
  fordított, hanem eredetileg is magyarul írt adatokból áll [natív?]
  * kutatási célra szabadon elérhető a Hugging Face Hubon2 . Cikkünkben először

# 2 a szövegegyszerűsítés eddigi és jelenlegi állását (2), ezután bemutatjuk 

## 2.1. A szövegegyszerűsítés megközelítései

* A nyelvtechnológiai jellegű kutatások nagy része mondatok egyszerűsítése
  * mert az elérhető, nagyobb mennyiségű adatok száma minden nyelven kevés,
  * az egyszerűsített szövegek gyakran nem standard nyelvi szövegekből jöttek
  * hanem azokkal párhuzamosan: a szövegek nem felelnek meg egymásnak teljesen.
* a szövegeket általában automatikusan párosítják össze – ez 
  * mondatok esetében könnyebb, hiszen mondatok automatikus párosítására,
    hasonlóságuk mérésére viszonylag régóta vannak elérhető, jól használható
* az első modern, neurális hálót használó kutatások is a mondatok egyszerűsítése
  angol nyelven (Nisioi+ 2017)
  * több nyelvre követték hasonló korpuszok és próbálkozások: a 
  * MultiSimV2 korpuszában (Ryan+ 2023) például tizenhárom nyelv szerepel
    (arab, baszk, brazil portugál, dán, angol, francia, német, olasz, japán,
    orosz, szlovén, spanyol és urdu), melyek 
    * nagyrészt mondatszintű egyszerűsítésekből állnak.
  * több olyan nyelv is van, amelyre csak mondatszintű egyszerűsítések
    eg arab (Khallaf+ 2022), a dán (Klerke és Søgaard, 2012), a 
    szlovén (Gorenc és Robnik-Šikonja, 2022) és az urdu (Qasmi+ 2020). A
  * korpusz nem nyilvános mivolta, vagy az adathalmaz kis mérete: az 
    eg olasz Teacher és Terence korpuszok például mindössze 18 és 32
    szövegpárból állnak (Brunato+ 2015).
* Magyar nyelvre eddig egy párhuzamos korpusz jött létre (Prótár és Nemeskey,
  2023), ez azonban egy fordított korpusz, melynek alapját az angol Simple
  English Wikipediából automatikus eszközökkel összeállított anyag adta (Zhu+
  2010). Ez a korpusz, éppúgy, mint a legtöbb a nemzetközi trendekben, 
  * szintén mondatpárokból áll. A szakirodalom azonban gyakran nem vet számot
* a szövegek egyszerűsítése nem oldódik meg a mondatok izolált egyszerűsítésével
  * több cikk is foglalkozik azzal, hogy milyen műveleteket kell elvégezni egy
    mondaton belül ahhoz, hogy azok megfelelően egyszerűek legyenek
    (pl.Alva-Manchego+ (2017)), és habár valóban 
  * az (elemi) mondatok a megnyilatkozások feldolgozásának alapvető egységei
  * mondatstruktúrán felüli alapvető elemeivel, például 
    eg az információk sorrendjének a meghatározásával, azok elosztásával, a
    kontextualizálás folyamatával stb. Nem számol emellett azzal sem, hogy 
  * a szövegértelem nem kompozicionális jellegű, azaz nem (Tolcsvai Nagy 2006)
  * az emberi szövegegyszerűsítés sem mondatszinten, a mondatok egymás után való
* we: hosszabb, kohezívebb szövegek egyszerűsítésének irányába kívánja tehát
  az első lépéseket magyar nyelven

## 2.2. Szövegegyszerűsítés nagy nyelvi modellek segítségével

* korai: lexikai, azaz szószintű egyszerűsítéssel foglalkoztak (Bott+
  (2012), Keskisärkkä (2012)) – azonban a 
* transformer architektúra (Vaswani+ 2017) megjelenése a szövegegyszerűsítésre
  * Nisioi+ (2017) mutatták be. A nagy nyelvi modellek megjelenése
* LLM: Feng+ (2023): az LLMek teljesítménye az emberi egyszerűsítéshez is
  mérhető. Ezzel 
  * ellentétben Padovani+ (2024) eredményei alapján egy megfelelően
    finomhangolt BERT-modell (Devlin+ 2019) jelentősen jobban teljesít az
    automatikus metrikák tekintetében, mint az általuk használt ChatGPT-3.5
* implicit: ez is mondatszintű
* we: Nem csupán a szöveghosszúság és az ezzel járó komplexitás oldaláról kínál
  újdonságot, hanem a magyar nyelvű szövegegyszerűsítéssel is: ugyan többnyelvű
* benchmarkok (Ryan+ 2023) a magyar nyelvet nem tartalmazták.

# 3 a korpusz összeállítását (3), majd ismertetjük a korpuszon végzett, 

* A korpusz anyaga a PannonRTV szabadkai híroldal cikkeiből származik. A kéré-
  * a hírportál könnyen érthető szövegeit egy személy írja a könnyen érthető
    irányelvek alapján (ld. pl. (Europe, 2017)). 3 
  * Ezen a híroldalon kívül nincs tudomásunk olyan magyar nyelvű forrásról,
    amely megfelelő mennyiségben és minőségben állítana elő párhuzamos, vagy
    párhuzamosítható, műfaji szempontból viszonylag egységes 
  * ezen kívül nagyon kevés, és nagyon különböző műfajú könnyen érthető szöveg
    * eg Nógrádi Gergely és Bodonyi Panni által írt János vitéz-átdolgozás, mely
      Petőfi művének első három énekét ülteti át egyszerűen érthető és könnyen
* A korpusz összeállításához először a Scrapy (Kouzis-Loukas, 2016) segítségé-
  * az első egyszerűsített cikk megjelenésének időpontjáig. Mivel a híroldalon
  * egyszerűsített cikkek nincsenek semmilyen módon összekötve a standard nyelvi
  * az összes standard nyelvi hírszöveget le kellett menteni, hogy azokat
  * 4364 darab egyszerűsített hírszöveget, és több, mint 66 500 standard nyelvi
  * két fázisban, 2023 novemberében és 2024 augusztusában zajlott, utóbbi
  * kinyertük a releváns adatokat, melyek a következők voltak: a cikk címe,
    leadje, szövege, a hozzátartozó címkék; a 3 cikk URL-je, közlésének dátuma,
    valamint a cikk kategóriája. Az utóbbi az oldalon megjelenő 
    * tizenkét magyar nyelvű kategóriát tartalmazta (politika, világ, régió,
      gazdaság, társadalom, természetvédelem, önkormányzatok, kultúra, kékfény,
      sport, színes, KÉK-hírek), amelybe a cikkek megjelenésükkor a szerkesztők
    * JSONL-struktúrában tároltuk el.
* párosítására szükség volt, azonban ez a nagyszámú szövegmennyiség miatt nem
  * Doc2Vec (Řehůřek és Sojka, 2010) és Sentence-BERT (Reimers és Gurevych,
    2019) beágyazásokkal vizsgáltuk, egy olyan további kikötést téve, hogy 
  * a standard nyelvi szöveg az egyszerűsített szöveghez képest 0–3 nappal előbb
  * lemmatizált és nem lemmatizált adatokon is elvégeztük, majd ezeket
    * ahol pedig a két eljárás különböző eredményt adott, manuálisan döntöttünk
  * a kétfajta beágyazási módszerrel keletkezett eredményeinket is összevet
  * Így összesen 3629 lehetséges párt kaptunk.
  * ELTE Digitális Bölcsészet Tanszékének négy annotátora ellenőrizte manu
  * három csoportba sorolhatták a lehetséges párokat: – Az összepárosított két
    * valóban pár: a két szöveg ugyanarról szól, és az egyszerűsített szöveg
      nem tartalmaz olyan kiegészítő információkat, amelyek nincsenek benne a
      standard nyelvi szövegben. Ebből összesen 2833 darab volt a korpuszban.
    * nem pár, azaz a két szöveg nem ugyanarról szól. Ebből összesen 175 darab
      volt a korpuszban. 4 – Az összepárosított két szöveg 
    * ugyanarról szól, de az egyszerűsített szöveg tartalmaz olyan kiegészítő
      információkat, amelyek nincsenek benne a standard nyelvi szövegben: 621 db
    * a párként kategorizált cikkpárokkal dolgoztunk. A plusz információt

# 4 a két szövegdomaint összehasonlító vizsgálatok eredményeit (4), végül

* vizsgálatokkal célunk a korpusz használati lehetőségeinek és korlátainak
  bemutatása volt, valamint az egyszerűsített és standard nyelvi szövegek
* az egyszerűsített cikkek „megörökölték” az adatszettben a standard nyelvi
  párjuk kategóriáját, 5 így vizsgálhatóvá vált az, hogy azok milyen kategóriájú
* az egyszerűsített szövegek kategóriái mennyiben képezik le az összes hírszöveg
  kategóriájának megoszlását, azaz hogy vannak-e preferált vagy elhanyagolt
* Az 1. ábra ezt a megoszlást mutatja be, azaz az egyszerűsített szövegek és a
  * A standard nyelvi szövegek esetében az összes, az egyszerűsített cikkek
    keletkezésének időszakában közzétett cikket használtuk a százalékos adatok
  * a megoszlások erősen különböznek a két csoport esetében: ugyan 
  * mindkét csoport esetében a társadalom kategória volt a leggyakrabban
  * egyszerűsített szövegek esetében a szövegeknek közel a fele sorolódott, míg
  * standard nyelvi szövegek esetében csupán körülbelül a negyedét tették ki az
  * a politika, sport vagy a világ kategóriák esetében erősen alulreprezentáltak
    az egyszerűsített szövegek a standard nyelviekhez képest, míg az
  * önkormányzatok és színes kategóriák az egyszerűsített szövegek korpuszában
    kaptak nagyobb szerepet. Ebből látható, hogy az egyszerűsített szövegek
* A korpuszméretek és a különböző lemmák számossága alapján az 1. táblázatból
  * az egyszerűsített korpusz jelentősen kisebb szótárral operál: míg 
  * a nagysága körülbelül a 80%-a a standard nyelvinek, 
  * a különböző lemmák száma nagyjából feleannyi. Úgy tűnik tehát, hogy az
  * [igaz?] a szinonimák helyett ugyanazokat a szavakat használják ugyanazon
    dolog vagy fogalom megnevezésére. A 
  * nagy mennyiségű hapax, illetve a különböző tulajdonnevek előfordulásai
    miatt az átlagos előfordulások száma csupán a fenti adatokkal együtt
    értelmezhető, önmagában nem – azonban ezek az adatok is arra mutatnak, hogy
    az egyszerűsített korpuszban a megnyilatkozó sokkal gyakrabban használja
    ugyanazokat a szavakat, mint a standard nyelvi korpuszban.
* tab 2: mondatszinten is különbözik: a 
  * standard nyelvi hírszövegek esetében a mondatok általában több szóból állnak
  * A leadek mondatai tendenciózusan rövidebbnek tűnnek mindkét korpuszban, mint
    a szövegtörzs mondatai – ennek oka valószínűleg az, hogy a lead funkciója a
    hírszöveg összefoglalása, nem pedig az egyes aspektusok kifejtése. A
  * az egyszerűsített szövegek mondatai alapvetően rövidebbek.
  * a mondatok száma is kevesebb, így feltehető az is, hogy bizonyos
    információkat vagy információrészleteket elhagy
  * future: milyen információk kerülnek elhagyásra vagy megmagyarázásra a

# 5 a korpusz használatával, oneés few-shot tanítási környezetben végzett

* négy olyan magyarul tudó utasítás-finomhangolt modellt teszteltünk, amelyek
  viszonylag könnyen hozzáférhetők: a 
  * zárt súlyú GPT-4o minit (Achiam+ 2024) API-n keresztül 6 , a 
  * Llama 3.3 70 milliárd paraméteres, 4 bitre kvantált és a 
  * Llama 3.1 8 milliárd paraméteres változatait (Dubey+ 2024), valamint a 
  * Qwen 2.5 7 milliárd paraméteres változatát (Yang+ 2024; Qwen, 2024)) pedig
    saját GPU-n futtatva. 
* hardver
  * A nyílt modellek elfutnak egy A100 40GB-s kártyán (a Llama 70B kettőn) 20-30
    ezres kontextushosszal, a GPT-4o mini pedig megfizethető árazású.
* összehasonlításképpen kimértünk 
  * egy kis modellt, a Llama 3.2 3 milliárdos változatát, illetve a 
  * GPT-4o mini két alternatíváját, a GPT-4o-t és a Claude 3.5 Haikut
    (Anthropic, 2024) is.
  * ld Append B a korábbi Llama 3.1 70B-s méréseinkkel együtt a B függelékben
* pontszám
  * SARI(Xu+ 2016) és a BLEU-pont (Papineni+ 2002) alapján vetettük össze. A
  * SARI pontszámot a Huggingface evaluate könyvtárával számoltattuk ki (von
    Werra+ 2020), míg a 
    * n-gram-egyezéseket mér, míg az utóbbi 
  * BLEU-pontszámokat a sacreBLEU könyvtár segítségével (Post, 2018). Mind a
    * a standard nyelvi szöveget és a referenciaszöveget veti össze a generált
      szöveggel, annak fényében, hogy a generált szöveg mennyire jól:
    * ad hozzá a standard nyelvi szöveghez releváns információkat,
    * törli ki a standard nyelvi szövegből a nem fontos elemeket,
    * hagyja meg azt a szöveget érintetlenül, amit érintetlenül kell hagynia
  * mindkettő 
    * általánosan használt az egyszerűsített szövegek megfelelőségének
    * 0 és 100 közötti értéket vehet fel az egyszerűsített szöveg minősítése,
      ahol a 100 jelenti azt, hogy a referenciaszöveg és a generált szöveg
    * a szövegek címét, leadjét és törzsszövegét egybevetve, egy egységként
      kezeltük őket. A 
      * mondatokra való lebontást és egyesével való értékelést nem tartottuk sem
        megvalósíthatónak, sem célravezetőnek, hiszen a szövegek értelmezése –
      * emiatt az eredményeink csak korlátozottan összevethetőek a többi, az
        automatikus szövegegyszerűsítést mondatszinten vizsgáló cikk eredmé-
* promptot használtuk, amely a zero-shot és a one~ vagy few-shot megközelítések
  esetében a példák megadásában, valamint a szeparátorkarakterek felsorolásában
  különbözött. A promptban az egyszerűsítést adtuk meg a modelleknek
  feladatként, valamint a 4. részben bemutatott eredmények alapján
  * összefoglaltuk az egyszerűsített szövegek néhány jellemzőjét: a túl hosszú
    mondatok lerövidítésére kértük, a bonyolult fogalmak elmagyarázására,
  * ugyanazt a fogalmat végig ugyanazzal a szóval illesse a szövegben, és 
  * ne használjon szinonimákat. A promptok megtalálhatók a függelékben (A).
* a standard nyelvi és az egyszerűsített szövegek között karakteralapú
  Levenshtein-távolságot számoltunk a Levenshtein csomaggal (Bachmann, 2024).
  * A távolság alapján ezután három egyforma számosságú csoportot hoztunk létre:
A vizsgálati esetek a következők voltak:
  1. zero-shot környezet (0-shot);
  2. one-shot környezet, ahol a példa cikk-kategóriája nem egyezett meg (1-shot)
  3. one-shot környezet, ahol a példa cikk-kategóriája megegyez (1-shot + kat.)
  4. three-shot környezet, ahol a példa cikk-kategóriája nem egyezett meg a
    * Levenshtein-távolság alapján randomizálva kerültek elemek be (3-shot)
  5. three-shot környezet, ahol a példa cikk-kategóriája nem egyezett meg a
    * Levenshtein-távolság alapján mindhárom csoportból 1-1 (3-shot + Leven)
  6. three-shot környezet, ahol a példa cikk-kategóriája megegyezett a teszteset
    * a Levenshtein-távolság alapján mindhárom csoportból egy-egy elem került be
      a példák közé (3-shot + kat. + Levenshtein);
  7. three-shot környezet, ahol a példa cikk-kategóriája megegyezett a teszteset
    * Levenshtein-távolság alapján randomizálva kerültek elemek be (3-shot + kat)
* Minden modellt összesen ötször futtattunk le minden adatsorra, majd az
  eredményeket átlagoltuk. Ez alól 
  * kivétel a Claude és a GPT-4o; itt pénzügyi okokból az 
    * elsőt csak egyszer futtattuk végig minden vizsgálati esetre, a 
    * másodikat pedig csak arra a két esetre, amin a GPT-4o mini legjobb és
      legrosszabb eredményeit érte el.  Modell / vizsgálati eset BLEU SARI 
  * a `+ kat.` jelölés a kategóriaegyeztetést jelenti, a `+ Levenshtein` pedig a
    három Levenshtein-csoport figyelembe vételét veszik. A 
  * jelek hiánya az adott tulajdonság randomizált vagy figyelembe nem vett
* eredmény
  * minden modell esetében a 0-shot módszertan hozta a legalacsonyabb átlag/med
    * ie az összeállított korpusz használata fewés one-shot környezetben is
      segít az egyszerűsítésben. Továbbá
    * 0-shot esetében több modell néha, a Claude viszont mindig hozzáfűzött egy
      bevezető mondatot a kimenethez (pl „Íme az egyszerűsített szöveg:”). 
    * Az in-context tanulás ezt is korrigálta.
  * 3-shot esetben minden modellnél azok a példák voltak a legsikeresebbek, ahol
    a Levenshtein-hasonlóság szerinti csoportosítást figyelembe vettük – azaz 
    * ie a modellek jobban teljesítettek akkor, ha a standard nyelvi és az
      egyszerűsített szöveg közötti átalakításokra variábilis példákat láttak.
* A modellek [véletlen mentén való] teljesítménye nagyobb szórást mutat: a
  legjobban a GPT-4o-mini teljesít a SARI-pontszámban, még a nála sokkal drágább
  GPT-4o-t is megelőzi kb. 2 ponttal (utóbbi 41, 29 ± 5, 89 SARI pontot ér el
  0-shoton, és 42, 70 ± 5, 85 pontot 3-shoton különböző
  Levenshtein-távolságokkal). A 3.3-as Llama 70B verziója kvantálva a nagyobb
  OpenAI modellhez hasonló teljesítményt nyújt. A sort a kisebb modellek: a
  Llama 3.1 8B és a Qwen2.5 7B zárják további 2-3 pont hátránnyal.
* A BLEU-pontszámok ezzel szemben lényegesen alacsonyabbak minden modell
  esetében. Ennek oka valószínűleg 
  * a magyar nyelv ragozó mivolta, illetve 
  * a feladat maga: a szövegegyszerűsítés megköveteli mind a mondatszerkezet,
    mind a szavak egyszerűbbre cserélését, ami megtöri a hosszabb n-gramokat. Ez
    * minden cikkhez csak egy referencia van; alternatív egyszerűsítésekkel a
      pontszám valószínűleg magasabb lenne.
* a BLEU és a SARI ugyan gyakran korrelálnak, azonban nem mindig – egymástól
  * eltérő, magasabb és alacsonyabb eredmények több nyelv több (Ryan+ 2023).
* feltüntettük a válaszok a PULI-GPT-3SX modell szerinti perplexitását is (Yang+
  2023). Ez a metrika a fenti kettővel szemben elsősorban nem az egyszerűsítés
  * A referenciaválaszok átlagos perplexitása 11,09; ehhez legközelebb a magyar
    nyelvet hivatalosan nem támogató Llama 3.3 70B került, legtávolabb pedig a
    Qwen
  * Qwen
    * nyelvtudása erősen hullámzó: nagyjából helyes mondatok váltakoznak
      teljesen értelmetlenekkel 7
    * a szövegben gyakran találtunk kínai (olykor angol) szöveget, akár egy
      magyar mondat közepén is, melyekben leggyakrabban a szöveg
      egyszerűsítésére vonatkozó utasítások voltak találhatók. 8 Ebből
  * A Qwenhez hasonló, vagy még rosszabb eredményet ért el a Llama 3.2 3B, amely
    egy egészen meglepő, >600 perplexitással rendelkező szöveget is generált,
    * pár értelmes magyar szó után legnagyobbrészt értelmetlen betűsorokból
      állt. 9 
* Egy adott modellhez tartozó perplexitásokat összehasonlítva kitűnik, hogy a
  prompt szerepe nagyon fontos nem csak az egyszerűsítés, hanem a szövegmi-
  nőség miatt is. 
  * Minden modell a legrosszabb perplexitást a 0-shot esetben érte el. A
  * kategória egyeztetése érdemben nem befolyásolta a perplexitást, viszont 
  * a Levenshtein-távolság-alapú válogatás akár 15–20 százalékkal is javított
  * setupok mentén: A modellek közül a magyar nyelvet hivatalosan is támogató
    GPT-4o mini perple- xitását befolyásolta a tesztkörnyezet a legkevésbé,
    azonban itt is közel egy pont különbséget lehet elérni egy jobb prompttal.
* A perplexitás azonban fenntartásokkal kezelendő: szúrópróbaszerűen össze-
  * GPT-4o mini és a kvantált 70B-s Llama által generált szövegeket, világosan
  * az utóbbi vét nyelvtani hibákat, amik a GPT-re nem jellemzőek.
* a modellek között az előre sejthető sorrend alakult ki: a 
  * GPT-4o mini mind nyelvi, mind szövegegyszerűsítési szempontból a legjobb az
  * A Llama 3.3 70B jó prompttal megközelíti, de a SARI tekintetében kis
    mértékben elmarad tőle
  * A sort a Llama 3.1 8B és a Qwen 2.5 7B zárja, utóbbi 
  * Qwen nehezen értékelhető nyelvi teljesítménnyel.

# 6 rövid összefoglalás

* future: akár modellek finomhangolásával, akár az adatszett további bővítésével
