# Kivonat 

* A sclerosis multiplex (SM) a központi idegrendszer krónikus gyulladásos
  * az automatikus beszédföldolgozás relatíve egyszerû, olcsó és távoli módot
    nyújthat arra, hogy követhessük a betegek beszédprodukiójának változását.
* tanítóanyag mennyiségének és (főleg) változatosságának korlátozottsága (pl
  kevés beszélő), ami miatt általában 
  * nem praktikus egyetlen (end-to-end) mély hálót alkalmazni az SM
  * osztályozásra valamilyen hagyományosabb módszert (pl. SVM-et vagy véletlen
    erdőt) alkalmazunk, mély hálók beágyazásait használva jellemzőkként.
* mély jellemzők:  Egy korszerû mély háló (pl. wav2vec 2.0) esetén kézenfekvő a
  konvolúciós és a finomhangolt blokkok utolsó rétegét választani, azonban a
  * közbülső rétegek is hasznosnak bizonyulhatnak. Jelen tanulmányban azt
* ? a közbülső (belső) rétegekből vett beágyazások használatával javíthatunk-e
  az SM automatikus felismerésének pontosságán.
  * a 24 finomhangolt rejtett réteg mélyebben fekvő kb egyharmada bizonyult a
    leghasznosabbnak,
    statisztikailag szignifikáns javulást is eredményezve
    a blokkok utolsó rejtett rétegéhez képest

# 1 Intro

* SM a központi idegrendszer krónikus gyulladásos megbetegedése, mely 
  * számos különféle kognitív és nyelvi tünettel jár együtt (Szirmai, 2006). A
  * előrehaladása jelentősen eltérhet az egyes alanyoknál, valamint időben is
  * járásában, mozgáskoordinációjában, az alany fáradékonyabbá válhat,
  * kognitív és nyelvi funkciói is (akár dizartria is kialakulhat (Orsolya+ 20)
  [a bib tételben a vezetékés keresztnevek fölcserélődtek]
  * az automatikus beszédelemzés potenciálisan alkalmazható a betegség
    * automatikus, kontaktmentes és (viszonylag) olcsó előszűrésére, vagy a
      beteg állapotának romlásának követésére.
* automatikus beszédelemzés 
  * Az elmúlt bő egy évtizedben az a beszédtechnológia egy önálló területévé
  * paralingvisztika (computational paralinguistics), amelynek célja a beszélő
    érzelmi vagy fizikai állapotának megállapítása a beszédjelből (például
    érzelemfelismerés (Grósz+ 2023; Kondratenko+ 2023), a beszélő 
    * Grósz, T., Porjazovski, D., Getman, Y., Kadiri, S., , Kurimo, M.:
      Wav2vec2-based paralinguistic systems to recognise vocalised emotions and
      stuttering.  
      ACM Multimedia. pp. 7026–7029. Lisboa, Portugal (Oct 2022)
    * Grósz, T., Virkkunen, A., Porjazovski, D., Kurimo, M.: 
      Discovering relevant subspaces of BERT, Wav2Vec 2.0, ELECTRA and ViT
      embeddings
      for humor and mimicked emotion recognition with integrated gradients. In:
      Proceedings of MuSe. pp. 27–34. Ottawa, Canada (2023)
  * korának és nemének azonosítása (Kumar+ 2016), az alany pillanatnyi
  * álmosságának mértékének megbecslése (Huckvale+ 2020), vagy 
  * dadogás detektálása (Grósz+ 2022))
  * orvosi célú beszédfeldolgozás (pathological speech processing). Itt a
    * szenved-e valamely konkrét betegségben (pl. 
      * Parkinson-kór (Jenei+ 2022; Klumpp+ 2022)
      * Alzheimer-kór (Ivanova+ 2023; Pérez-Toro+ 2022)
      * depresszió (Fara+ 2023; Kiss+ 2016)). 
* mély neurális hálók alkalmazása is rutinszerűvé vált a területen 
  (Fara+ 2023; Jenei+ 2022; Pérez-Toro+ 2022) Az 
  * önfelügyelt tanulás (self-supervised learning) megjelenésével napjaink ta-
    lán legnépszerűbb beszédfeldolgozó architektúrájává a wav2vec 2.0 vált
    (Baevski+ 2020).
* bizonyos feladatokon közvetlenül is alkalmazhatóak ilyen mély hálók (pl.
  * beszédfelismerésre (Mihajlik+ 2022) vagy 
  * érzelemfelismerésre (Chen és Rudnicky, 2023)), ugyanakkor 
* korlátozottabb mennyiségű tanítóadatnál sajnos nem triviális a betanításuk.
  * nL wav2vec 2.0 hálók alkalmazására, például valamely más feladaton (pl
    beszédfelismerés vagy beszélőazonosítás) tanított hálók kiértékelésével és a
    kapott aktivációk (beágyazások (embeddings)) jellemzőkként használatával;
  * a szigorúan vett osztályozási feladatra pl. SVM-et vagy véletlen erdőt
    alkalmazhatunk (Pepino+ 2021). Az 
  * orvosi beszédfeldolgozási területen extrém módon kevés a tanítóadat
    mennyisége, így a mély hálók az ilyen feladatokon általában ez utóbbi módon,
    jellemzőkinyerésre vannak felhasználva
    (Egas-López+ 2023; Pérez-Toro+ 2022; Thienpondt+ 2023; Cai+ 2025)
* egy (vagy több) rejtett réteget, amelyből a beágyazásokat nyerjük. 
* Egy wav2vec 2.0 architektúrájú háló két fő blokkból áll: egy 
  * alsó konvolúciós és egy fölső finomhangolt (vagy kontextualizált)
  * kézenfekvőnek tűnik a blokkok utolsó rejtett rétegének használata
    (Gosztolya+ 2023; Kodali+ 2023)
* ? kaphatunk-e hasznosabb jellemzőket valamely közbülső rejtett réteg
  * Az osztályozási feladat magyar nyelvű sclerosis multiplex alanyok vs
    (szintén magyar nyelvű) egészséges kontroll alanyoktól, 
  * a beágyazásokat pedig két, magyar nyelvre finomhangolt wav2vec 2.0 hálóból
    * az egyik beszédfelismerésre, a másik pedig beszélőfelismerésre finetuned

# 2. Hangfelvételek

* Uzsoki Utcai Kórház Neurológiai Osztályán és az 
* (akkor még) ELKH Nyelvtudományi Kutatóközpontjában került sor. A vizsgálatot
* az Uzsoki Utcai Kórház etikai bizottsága hagyta jóvá, és a Helsinki Nyilatkoz
* 23 SM alany (18 nő és 5 férfi) és 22 kontroll beszélő (16 nő és 6 férfi)
* Az SM alanyok mindegyike a relapszáló-remittáló (relapsing-remitting, RRMS)
* statisztikailag illesztett életkor, iskolázottság és nem szerint (p > 0,05)
* A felvételi protokoll során összesen 17 különféle feladatot rögzítettünk az
  * Jelen tanulmányunkban kísérleteinket a szövegösszefoglalás feladat
    hangfelvételein végeztük; ennek során az alanyoknak egy kétperces, számukra
    korábban ismeretlen tudományos ismeretterjesztő szöveg meghallgatása után
    minél pontosabban el kellett azt mesélniük. A feladat végrehajtása számos
    kognitív funkció (figyelemösszpontosítás, munkamemória, időbeli orientáció,
    rendszerezés) összehangolt működését igényli (Mar, 2004).
* Sony PCM-A10 digitális diktafonnal, valamint csíptetős mikrofonnal
  * eredetileg sztereó, 48 kHz mintavételű felvételeket az automatikus
    feldolgozás előtt 16 kHz mintavételezésű, monó formátumra konvertáltuk.

# 3. wav2vec 2.0

* A wav2vec [1.0] architektúra egy konvolúciós neurális háló, melynek bemenete a nyers
  beszédhang-jel, kimenete pedig egy olyan reprezentáció, mely alkalmas egy
  beszédfelismerő rendszer bemenetének. Tanítása önfelügyelt módon történik, az
  adott felvétel következő szegmensének predikciójára (Schneider+ 2019).
* A wav2vec 2.0: zajtűrésének javítása érdekében – 
  * maszkolást (a bemenet egyes részeinek nulla értékkel helyettesítését) is
  * kontrasztív tanítás (contrastive learning) alkalmazása, melynek során a
    modell célja annak felismerése is, hogy két különbözőféleképpen
    transzformált reprezentáció (esetünkben a finomhangolt réteg kimenete,
    valamint a konvolúciós réteg kimenetének diszkretizált (kvantált) formája)
    azonos bemenethez tartozik-e (Baevski+ 2020). A wav2vec 2.0
  * architektúra az 1. ábrán látható.

## 3.1. Jellemzőkinyerés wav2vec 2.0 segítségével

* beágyazások keretszintűek ~> átlagukat és a szórásukat
  (Gosztolya+ 2022; Pérez-Toro+ 2022; Vaessen és Van Leeuwen, 2021)
Jelen tanulmányunkban a finomhangolt blokk belső rétegeire koncentrálunk.
Egy standard XLSR-53 hálóban (lásd (Babu+ 2022)) 24 ilyen transzformer réteg
van, mely kiegészülve a konvolúciós blokk utolsó rejtett rétegével, 25
lehetőséget jelent. Közismert, hogy 
* egy mély háló 
  * mélyebben fekvő rétegei jellemzően alacsonyabb szintű információkat tárolnak
    (beszédfeldolgozás esetén pl. csend, különböző zajok vagy további akusztikai
    paraméterek (pl. visszhang mértéke)), míg a 
  * magasabban található rétegekben elsősorban magasabb szintű (esetünkben
    például, a jellemzőkinyerésre használt háló függvényében, fonetikai vagy az
    aktuális beszélőre jellemző) információk találhatóak. Sajnos ezen kívül

# 4. Kísérletek

## 4.1. Jellemzőkinyerés

* leiratozó: A finomhangolt modellek közül az első a nyilvánosan elérhető
  wav2vec2-large-xlsr53-hungarian, melyet jonatasgrosman finomhangolt a Mozilla
  Common Voice 6.1 adatbázis magyar részhalmazán (8 órányi adaton) (Grosman,
  2021). A továbbiakban erre a modellre mint leiratozó modellre fogunk
* beszélő-azonosító: A másik fölhasznált modellünk saját tanítású volt, 
  * ugyanúgy a XLSR-53 modellből kiindulva
  * a (magyar nyelvű) BEA Spontánbeszéd-adatbázis egy részhalmazán
    finomhangoltuk (Neuberger+ 2014). 165 beszélőt választottunk ki;
    a felvételekből automatikusan kivágtuk azokat a részeket, melyekben a
    felvételvezető hangja is hallható, így összesen körülbelül 60 órányi
    beszédanyagot használtunk. Az eredeti sztereó, 44,1 kHz-en mintavételezett
    bemondásokat monó, 16 kHz-es formátumra konvertáltuk. Az utolsó rejtett
    réteg aktivációit kiátlagoltuk (average pooling), az ezt követő kimeneti
    rétegben pedig szoftmax aktivációt használtunk 165 neuronnal. A betanult
    modell beszélőosztályozási hibája a teszthalmazon (de értelemszerűen
    ugyanezen beszélőkön) 1,92% volt. A továbbiakban erre a modellre mint
    beszélő-azonosító modellre fogunk hivatkozni.
* A kinyert beágyazások mindkét háló és minden réteg esetén keretszintűek
  * időtengely mentén vett átlaggal és szórással konvertálunk felvételszintűvé.
    Mivel jelen munkánkban elsősorban a finomhangolt blokkból nyert
    beágyazásokra fókuszáltunk, a legtöbb teszt során 2048 felvételszintű jel-
    lemzőt használtunk; ez alól a konvolúciós blokk utolsó rétegét vizsgáló
    tesztjeink voltak kivételek, ahol 1024 jellemzőnk volt.
* a két wav2vec 2.0 hálóval kapott eredményeket nem lehet közvetlenül
  összehasonlítani, hiszen azok tanítása más-más adaton (és vélhetőleg más
  hiperparaméterekkel) történt. Véleményünk szerint azonban alapvetően 
  * így is alkalmasak arra, hogy demonstrálják a különböző célokra tanított
    hálók eredményességét, amikor jellemzőkinyerésre használjuk azokat.

## 4.2. Osztályozás

* orvosi beszédfeldolgozási területen egy beszélő felel meg egy ML példának,
  ~> nagyon kisméretűnek számít. Ezért 
  ~> nem definiáltunk külön tanító-, fejlesztésiés teszthalmazt, hanem
  keresztvalidációt alkalmaztunk. Minden csoportba (fold ba) egy SM és egy
  kontroll alany felvételei kerültek, így összesen 23 csoportot kaptunk. Az
  osztályozás minőségét a ROC görbe alatti terület (AUC) metrikával mértük,
  melynek használata szintén igen elterjedt a területen (Carvajal-Castaño és
  mtsai, 2022; Gosztolya és mtsai, 2022).
* Osztályozó eljárásnak SVM-et használtunk (LibSVM implementáció (Chang és Lin,
  2011)). A nu-SVM változatot használtuk lineáris kernellel; a C hiper-
  paraméter értékét 10 {−5,...,1} között változtattuk. Beágyazott
  keresztvalidációt alkalmaztunk (Cawley és Talbot, 2010): a C hiperparamétert
  minden tanítás esetén egy további (belső, 22-szeres) keresztvalidációs lépés
  segítségével választottuk ki, a legjobb ROC görbe alatti terület (AUC) érték
  alapján.
* Az AUC értékek robosztusságának ellenőrzése érdekében minden osztályozási
  kísérletet ötször végeztünk el, melyek a 23 beszélőcsoport (véletlenszerű)
  kialakításában tértek el egymástól. Az ábrákon és a táblázatokban az öt így
  kapott AUC érték átlagát adjuk meg, míg a modellek robosztusságának
  vizsgálatához az AUC értékek szórását, valamint az értékek terjedelmét ([min;
  max]) tüntetjük föl.

# 6 .

* Összességében azt kaptuk, hogy 
  mindkét háló esetén általában a finomhangolt blokk mélyebben fekvő
  rétegeiből érdemes jellemzőket kinyerni, mert azok alkalmasabbak a sclerosis
  multiplex felismerésére. A kétfajta hálótípus közül 
  * a beszédfelismerésre tanított (leiratozó) sokkal hatékonyabbnak bizonyult,
    mint a beszélők felismerésére tanított (beszélő-azonosító), azonban 
  * ezt fenntartással kell kezelnünk, hiszen a két háló eltérő (bár egyaránt
    magyar nyelvű) adaton és eltérő körülmények között lett betanítva.


