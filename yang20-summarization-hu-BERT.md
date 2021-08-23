Automatikus összefoglaló generálás magyar nyelvre BERT modellel
Yang Zijian Győző, Perlaki Attila, Laki László János
XVI. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2020. január 23–24

# Abstract

* Extraktív összefoglaláshoz kipróbáltunk egy
  lineáris osztályozó, egy RNN és egy Transformer modellt
  * RNN érte el a legjobb eredményt
* absztraktív modell tanításához Transformer modellt használtunk
  * a rendszer túltanult és mindenre ugyanazt a mondatot adta eredményül

# 2. Kapcsolódó irodalom

* extraktív: a neurális modell szempontjából ez osztályozási problémaként
  * egyik legkorábbi neurális hálózaton alapuló extraktív rendszer a SummaRuNNer
    (Nallapati+ 2017), amely egy RNN enkóder segítségével oldja meg a
    problémát. A
  * Refresh (Narayan+ 2018) ROUGE metrikán alapul, melynek segítségével
    megerősítéses tanulásos módszerrel rangsorolják a mondatokat a szövegben
  * Latent (Zhang+ 2018) célja  az emberi munkával készült absztraktokhoz való
    minél közelebbi hasonlóság elérése volt. A
  * Sumo (Liu+ 2019) olyan módszert alkalmaz, amely a dokumentumból kinyerhető
    több-gyökerű függőségi fa-struktúrákra épül, és az összefoglaló lehetséges
    formájának előbecslésén alapszik. A
  * NeuSum (Zhou+ 2018) a mondatok pontozásával és szelektálásával közelíti meg
* absztraktív: szekvenciát egy másik szekvenciába kell transzformálni.  Az
  enkóder a forrás-dokumentumból tokeneket azonosít be, azokat feltérképezi,
  majd a dekóder tokenről tokenre állít elő ebből egy új szöveget. A
  * PTgen (See+ 2017) egy mutatókat (pointer) generáló eszköz, amely a
    forrásszövegben szavakat azonosít be, ezután egy közvetítő (coverage)
    mechanizmus az összefoglalóba kerülő szavakat tartja meg. A
  * Deep Communicating Agent (Celikyilmaz+ 2018) olyan ágens-alapú megközelítés,
    ahol az ágensek együtt reprezentálják a feldolgozandó dokumentumot és ennek
    dekódolásákoz kapcsolódik egy hierarchia-figyelő ágens. A
  * Deep Reinforced Modell (Paulus+ 2018) közvetítés-alapú (coverage), ahol a
    dekóder a már generálásra került szöveget is figyeli. A
  * BottomUp (Gehrmann+ 2018) tartalomszűrő eljárása előbb meghatározza, mely
    szövegrészek kerülhetnek az összefoglalóba, majd a dekóder már csak ezeken
    dolgozik
* Magyar nyelven az OpinHu rendszer (Miháltz, 2010) rendelkezik összefoglaló
  funkcióval. A rendszer kulcsszavakat és szövegkontextust használ az
  információkinyerésre

# 3. Az összefoglaló rendszer

* Ebben a fejezetben mutatjuk be az összefoglaló rendszer részeit és a mögötte
  lévő korpuszt. Továbbá megismertetjük a BERT modell architektúráját, valamint
  az ezen alapuló absztraktív és extraktív modelleket

## 3.1. A BERT modell

* Liu és Lapata, (2019) szöveg-összefoglalással kapcsolatos munkája az
  előtanított nyelvi modellek (ELMo, GPT, BERT) közül a BERT modellt
  (lásd 1. ábra bal oldala) emeli ki. Ez a modell rendelkezik szó-, mondat~ és
  pozícióreprezentációval is, amely nagyméretű szövegkorpuszon alapszik. A leg-
  több esetben az előtanított modellek olyan természetes nyelvi feldolgozási
  problémák esetén alkalmazhatók, ahol mondat~ illetve bekezdés-szintű
  értelmezés, osztályozás szükséges. Cikkükben bemutatják, hogy a
  szöveg-összefoglalás feladata túlmutat az egyszerű szó~ vagy mondatfordításon
* A BERT (Devlin+ 2019) modell egy előre tanított nyelvi reprezentáció, a
* A Google betanított két többnyelvű modellt is: kisbetűsített és nem kisbetű
* Kutatásunkhoz a nem kisbetűsített többnyelvű modellt (BERT-Base, Multilingual
  Cased) használtuk

## 3.2. A korpusz

* Tanító~ és tesztkorpuszként a hvg.hu által rendelkezésünkre bocsátott
  nyomtatott és online hírlapból vett cikkeket, valamint a hozzájuk tartozó
  leadeket használtuk fel. A korpusz tulajdonságai:
  * sok esetben a leadnek nem összefoglaló, hanem figyelemfelkeltő szerepe van
  * Nyomtatott cikkadatbázis (hetilap): 1994-2017
    * 35.513 cikk; 34.409.106 token; 2.045.255 type
  * Online cikkadatbázis (napilap): 2012-2017
    * 374.064 cikk; 87.366.132 token; 3.544.622 type
  * Összesen: 346.873 cikk; 121.772.523 token; 4.365.813 type;
  * Cikkek témái: gazdaság, politika, tudomány, sport, kultúra, pszichológia,
    blog
  * Kísérlethez:
    * Tanítóanyag: 343.000 cikk
    * Tesztanyag: 1790 cikk (eredtileg 1873 cikk volt, csak a rendszer kivette
      azokat a cikkeket, amelyek háromnál kevesebb mondattal rendelkeztek)
    * Validálás: 2000 cikk
    * Forrásszöveg (cikkek) átlagos bekezdéshossza: 317,37 szó; 15,36 mondat
    * Célszöveg (lead) átlagos bekezdéshossza: 26,21 szó; 1,56 mondat 
* Mivel nem mindegyik cikkhez tartozott lead, ezért miután a nyomtatott és az
  online cikkeket összetettük, kivettük azokat a cikkeket, amelyekhez nem
  tartozott lead (ezért látható eltérés a tulajdonságban az Összesen résznél)

## 3.3. Az extraktív és az absztraktív modellek

* A BERT modell hangolható („fine-tune”) más feladatokra is, mint például összef
  * a leadekből képzett szegmensvektorok (mondatvektorok) bemenetként szolgálnak
    az egyes Transformer rétegek számára
* Kétféle összefoglaló modellt tudunk behangolni így: extraktív és absztraktív
* Az extraktív modell: A BERT modell kimenetére rákötnek egy plusz réteget
  * minden egyes mondatra mond egy valószínűséget, hogy az milyen mértékben írja
    le a cikk tartalmi lényegét
  * a leadeket használja fel
  * A plusz réteg lehet
    * sima lineáris osztályozó szigmoid függvénnyel,
    * LSTM architektúrájú RNN,
    * Transformer modell
  * kiválasztja azt a 3 mondatot, ami leginkább leírja annak tartalmi lényeget
* Az absztraktív modell megfeleltethető egy enkóder-dekóder alapú gépifordítónak
  * forrásnyelvi oldalon a BERT modellt használjuk, míg a
  * célnyelvi oldalon a tanító anyagunk leadjeit használjuk

# 4. Kísérletek

* előfeldolgozást végeztünk az eredeti szövegeken
  * mondatokra bontottuk, majd tokenizáltuk. Ezekhez az e-magyar tokenizálóját,
    a quntoken (Mittelholcz, 2017) eszközt használtuk. Ezt követően 
  * az összefoglaló rendszer számára JSON formátumra alakítottuk a szöveget
  * két speciális elemet illesztettünk be, 
    az egyik a szöveg elejét jelzi, a másik a mondathatárokat. Ezután az
    előfeldolgozott fájlokkal különböző neurális modelleket tanítottunk be
* baseline: amely a cikk első három mondatát veszi összefoglalóként
* betanítottunk három modellt az extraktív összefoglalóhoz:
  * Lineáris osztályozó (BERT-Class), ahol a BERT modell kimenetére egy szig-
    moid függvénnyel ellátott lineáris réteg van kötve
  * Rekurrens neurális modell (BERT-RNN), melyben a BERT modell kimenetére egy
    bidirekciós LSTM réteg van kötve
  * Transformem modell (BERT-TransExt), ahol a BERT modell kimenetére egy
    Transformer modell van kötve
* Az absztraktív összefoglalóhoz kipróbáltunk két modellt:
  * Baseline Transformer modell (BERT-TransAbs): egy alapértelmezett Transformer
  * Baseline absztraktív Transformer modell (BERT-TransAbs-baseline):
    Liu és Lapata (2019) kutatásában az absztraktív modellre behangolt
    („fine-tuned”) baseline modell
* A modellek tanításhoz a Yang és társa (Liu és Lapata, 2019; Liu, 2019) által
  implementált eszközöket használtuk fel
* A beállítási paraméterek
  * extraktív modellek esetén:
    * Általános paraméterek: dropout: 0,1; learning rate: 2e-3; batch size: 3000;
      tanítási lépésszám: 100000
    * Transformer modell: head: 8; belső réteg: 2; feedforward méret: 2048
    * RNN modell: rnn méret: 768
  * absztraktív modell esetén:
    * dropout: 0,1; learning rate: 0,05; batch size: 3000;
      tanítási lépésszám: 200000;
      rejtett rétegek neuronszáma (enkóder, dekóder): 512;
      rétegek száma (enkóder, dekóder): 6;
      feedforward méret (enkóder, dekóder): 2048

# 5. Eredmények

* A kiértékeléshez a ROUGE (Lin, 2004) módszert használtuk
  * ROUGE: Recall-Oriented Understudy for Gisting Evaluation
  * a gépi fordítás során használt BLEU metrikán alapszik
  * több almetódust is tartalmaz, melyek közül a méréseinkhez 
    a ROUGE-1, ROUGE-2 és a ROUGE-L módszereket használtuk
  * A ROUGE-1 egy unigram, míg a ROUGE-2 egy bigram fedést számoló algoritmus
  * ROUGE-L: leghosszabb közös szósorozatot vizsgálja bekezdés és mondat szinten
* A 1. táblázatban láthatók a különböző modellek teljesítményei
  * baseline teljesített a leggyengébben
  * Extraktív modell esetén BERT-RNN modell érte el a legjobb eredményt. Itt
    * angol nyelv esetében ez a Transformer modell volt
    * Az eredmények csak azt mutatják, hogy az gép által kiválasztott mondat
      mennyire hasonlít a leadre
  * absztraktív modell eredményeit tekintve igen alacsony a fedés
    * a rendszer túltanult és mindenre ugyanazt a mondatot adta eredményül
    * A továbbiakban csak az extraktív modelleket fogjuk elemezni
* 2. táblázatban látható az extraktív modellek viselkedése egymáshoz viszonyítva
   * az esetek közel 7%-ában pontosan ugyanabban a sorrendben ajánlották
     ugyanazokat a mondatokat összefoglalásnak
     * 30%-ban ugyanazt a 2 mondatot választotta ki, és szintén közel
     * 30%-ban pontosan egy közös mondatot választottak
   * RNN és az osztályozó modell sokkal hasonlóbban választottak mondatokat,
     mint a Transformer és az osztályozó modell
* 3. áblázat: modellek milyen arányba választották az első három mondatot. A
    rendszer a forrásszövegből rangsorolva 3 mondatot ajánl összefoglalónak. Az
  * Transformer modell első ajánlásnak közel 80%-ában választ a forrásszöveg
    első három mondatából, az esetek felében az első mondatot választja ki
  * RNN modell közel 72/40%-ban választja a forrásszöveg első mondatát
    valamelyik/első ajánlásnak
* A 4. táblázatban látható néhány példa a különböző modellek kimeneteire
  * amikor teljesen megegyezik mind az ajánlott mondatok, mind a sorrend
  * ajánlott mondatok megegyeznek, de más sorrendben ajánlanak
  * közel hasonló eredményeket adtak a különböző modellek.  A példában a
    BERT-Class és a BERT-RNN modellek ugyanazokat a mondatokat ajánlották, csak
    más sorrendben.  A Transformer modell harmadik ajánlása különbözik a másik
    kettő modellétől
  * ahol eléggé különböző ajánlásokat adtak a modellek, a példában egy közös
    mondat van csak

# 6. Összegzés
