Szécsényi Tibor
Argumentumszerkezet-variánsok korpusz alapú meghatározása
MSZNY 2019

#Kivonat 315

* nem a klasszikus kötelező vonzat – szabad bővítmény bináris oppozíciós
* variánsok egy argumentumszerkezeti valószínűségi vektorral jellemezhetőek

#1 1 Bevezetés, célok

* argumentumszerkezet[et a nyelvelméleti igényű grammatikákban]
  * transzformációs nyelvtanokban például a projekciós elv [1], a
    HPSG-ben az alkategorizációs elv [2, 3]
  * a [4] tanulmányban bemutatott szabály alapú elemző
* Jelen dolgozatban egy olyan argumentumszerkezet-reprezentációra [jelezve],
  hogy az adott bővítmény mekkora valószínűséggel jelenik meg a régens mellett
  * nem a szóbeágyazási modellek [5] egy változata, hanem a többdimenziós
    értelmezés miatt inkább Sass Bálint duplakocka-modelljével [6] rokonítható
  * Kálmán László is javasolta a vonzatság [nem-bináris felfogását 7, 8], de
    * csak az ige és bővítmény közötti többféle lehetséges viszonyt jelentette,
    * erősségének a gradualitását [nem a] valószínűségéhez kötötte. További
    * egyes ige-bővítmény kapcsolatokat egyenként elemezte,
      nem az ige teljes argumentumszerkezetét próbálta meg így leírni
* organization
  2. argumentumszerkezeti vektorok fogalmát (2. szakasz), majd bemutatom,
  3. hogyan lehet egy ige argumentumszerkezeti variánsait korpusz alapján
  4. argumentumszerkezeti vektorokat befolyásoló néhány tényezőt mutatok be 323
  5. felhasználási területet is ismertetek

#2 Az argumentumszerkezetek megfigyelése természetes környezetükben

> Péter bízik 1 Mariban
> Péter megbízik 2 Mariban
> Péter Marira bízta 3 a könyvet
> Péter rábízta 4 a könyvet Marira
> Péter megbízta 5 Marit a feladattal
> Péter elbízta 6 magát

#3 Argumentumszerkezeti vektor meghatározása korpuszból 318

##3.1 Két triviális argumentumszerkezet-variáns 320

* hány vektort keresünk, azaz hány variánsa van az igének. Erre a
* kérdésre két triviális válasz is lehetséges. A két triviális megoldás

###3.1.1 Maximális variánsszámú ige

* vagyis minden megjelenő bővítmény kötelező vonzat is egyben. Az
* de valójában az argumentumszerkezeti variáns[ok] számának minimalizálására
  törekszünk

###3.1.2 Egyvariánsos ige

* [ekkor] Feltételezzük , hogy [a különböző bővítmények] a megjelenési
  valószínűsége független egymástól
* egy variáns különböző bővítményeinek a megjelenési valószínűségei függetlenek

##3.2 Az argumentumszerkezeti vektor és a ... gyakoriságok

* célunk tehát az, hogy a v̄ 1 ... és v̄ 3 ... vektorokra és a p V1 és p V3
  valószínűségi együtthatókra olyan becslést adjunk meg, amelyek alapján a
  (4)-ben számolt valószínűségi tényezők a ténylegesen megfigyelt .
  gyakoriság[okat] legjobban megközelítik, vagyis az azokhoz viszonyított
  különbségeik négyzeteinek összege minimális:

##3.3 Argumentumszerkezeti vektor meghatározása – egyszerű példa

##a prezentációban: kísérlet

* Optimalizálás hegymászó algoritmussal
* Hat bővítménytípus (NOM, ACC, BAN, RA, VAL, HKM)
* Rögzített variánsszám (1 – 4)
* Véletlenszerű kezdeti vektorok és előfordulási gyakoriságok
* 50-100 futtatás
* A legjobb 20 eredmény összegyűjtése

#4 Az argumentumszerkezeti vektort befolyásoló tényezők 323

##4.1 Korpuszhatások 324

* Az argumentumszerkezeti variánsok [előfordulási valószínűsége] korpuszfüggő
* szövegek típusa az [ argumentumok ] valószínűségét is befolyásolja. Az
  * iskolai fogalmazásokban sok ... első és második személyű névmás
  * névmások viszont hajlamosabbak a meg nem jelenésre, mint a kifejtett NPk
* [ezek a hatások] grammatikai hatásokon keresztül érvényesülnek. Az egyes

##4.2 Grammatikai hatások

###4.2.1 Pro drop

* nem csak egy igére vagy igevariánsra jellemző [valószínűség]
* p(pron|NOM) korpuszfüggő valószínűség, p(prodrop|NOM) viszont korpuszfütlen

###4.2.2 Ellipszis 325

* ha ugyanaz a kifejezés több tagmondatban is jelen van, akkor csak az egyik
* különböző típusú vonzatok elliptálhatósága [egy-egy] valószínűségi érték
* különböző igék is különböző mértékben hajlamosak az ellipszis[re]

###4.2.3 Szabad bővítmények igefüggetlen megjelenése 325

* valószínűsége csak kis mértékben igefüggő ... jellemzője az, hogy milyen
  típusú, milyen jelentéskategóriájú igéhez tudnak kapcsolódni

###4.2.4 Szabadbővítmény-csoportok

* korábbiakban ... a bővítmény esetével vagy névutójával jellemeztük. Azonban
* esetcsoportok, amelyeket érdemesebb együtt kezelni, ugyanannak a
  * pl.~helyhatározói funkciójú bővítmények hasonlóan működnek,
* ugyanolyan predikátumtípusokhoz illeszthetőek, egymással helyettesíthetőek,

  bár a morfológiai esetük többféle is lehet: BAN, ON, NÁL vagy MELLETT stb. Az
  ugyanolyan funkciójú, de különböző morfológiai esetű szabad bővítményeket
  ezért kívánatos egy bővítménytípusnak tekinteni és egységesen meghatározni a
  megjelenési valószínűségét, gyakoriságát: f HELY . Ugyanakkor az ugyanolyan
  funkciójú, de különböző esetű bővítmények egyenként is jellemezhetőek
  aszerint, hogy
* az adott [csoport] mekkora valószínűséggel realizálódik [adott esetként]
  * független az igétől, ami mellett megjelennek
  * Ha egy argumentumvariáns mellett a kérdéses ... (esetek)
    a funkcióra jellemző valószínűségekkel jelennek meg egymáshoz képest,
    akkor az adott ... csoport tagjainak tekinthetőek

###4.2.5 Argumentumszerkezet-típusok, -változtató műveletek 326

* [mely egyértelműsített igék rendelkeznek] hasonló ...  vektorral
* utalhatnak ...  szintaktikai vagy szemantikai [hasonlóságra]
* Ha egy ilyen igének van egyedi variánsa, az valószínűleg nem kompozicionális
  _vkinek megy valami_ (pl. a matek)
* olyan igealakok, amelyek hasonló argumentumszerkezeti variánsokkal
  rendelkeznek
  * grammatikai kapcsolat [különböző igék] variánsai között.  Érdekes
* morfológiai kapcsolatot mutató tövek különböző argumentumszerkezeti variánsai
  között van-e valamilyen kapcsolat. A
  * unakkuzatívuszi-akkuzatívuszi párok
    * pl. készül-készít, hárul-hárít, gurul-gurít
    * -Ul ige alanya az -ít készít ige tárgyának feleltethető meg (pl. elkészült
    * az igék alanyi és tárgyi bővítményeinek a megjelenése korrelál
    * de _Péter Debrecenbe készül_ – ?_Mari Debrecenbe készíti Pétert_
* igeképzők argumentumszerkezet-változtató képességét is

###4.2.6 Örökölt vonzatok

* VAL típusú bővítmények (pl. Péter elment Marival a moziba), vagy a
* szétváló birtokos kifejezések esetében a DAT birtokos
  (pl. Péternek elment a barátja a moziba).  Ezek a bővítmények nem
* nem különböztethetőek meg egyszerűen a szabad bővítményektől. (Az ilyen
  * lásd pl.  Sass Bálint disszertációjának 2.2.  szakaszát: [12].) Azonban
* milyen argumentumok mellett jelenhetnek meg (annak típusával vagy szótövével
  azonosítva)
* főnévi igeneves vonzatuk is van: ezeknek a főnévi igeneveknek a vonzatai,
  * mondatátszövődés, _**A házi feladatot** elfelejtettem megcsinálni_

###4.2.7 Igekötők 327

* A 2. szakaszban az igekötő [szerint] külön argumentumszerkezeti variáns[ok]
  * az ... ige részeként elemeztük, nem az ige önálló argumentumaként. Az
  * időnként átveszik valamely kötelező argumentum szerepét,
    * névmási rá vonzat: _Péter ránézett *rá._ Az első személyű rám névmási
    * főnévi fejű RA bővítmény mellett, az igekötőt szabadon megjelenhet vagy
    * két [vagy három] argumentumszerkezeti variánst látunk-e, egy igekötőset
* [ha] az igekötők bővítmény
  * hasonló leírást kívánnak meg, mint az elváló birtokos és a birtok
* Máskor ... az igekötő megjelenése ...  engedélyezi az ON vonzat megjelenését
  * egy adott igekötő milyen bővítménytípusokkal szokott együtt megjelenni:
  * ezeket az igekötő-bővítménytípus párokat így összetartozókként kezelhetjük
* milyen argumentumszerkezeti variáns esetében lehet [ott] egy bizonyos igekötő
* az igekötő [hogyan változtatja meg a] variáns argumentumvektorát
  * el -bÓl
  * de az _elbízza magát_ nem magyarázható úgy, hogy  _el_ -ACC,
    vagyis az elbízik igekötős ige idiomatikus szerkezetű
  * prezentációban: (Gyulai 2019)
    * Gyulai Lívia 2019, TDK dolgozat. SZTE, Szeged.
      Az igekötők argumentumszerkezet-változtató képességének korpuszalapú vizs

#5 Összefoglalás, alkalmazási lehetőségek 328

* alkalmazás
  * közvetlenül átalakíthatóak valószínűségi frázisstruktúra nyelvtanná [13]
    494.o.).
  * argumentumszerkezeti [egyértelműsítés magával hozhatja]
    * a jelentésegyértelműsítést is
    * szerepel-e zéró névmás, ami az anaforafeloldás során fontos információ.
  * szövegtípusok argumentumszerkezetivektorváltoztató képességét is
    * ismeretlen szöveg típusára adhatunk becsléseket.
  * következtethetünk ... a beszélő korára, társadalmi helyzetére vagy a
    mentális képességeire, nyelvi zavaraira is
