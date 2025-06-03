Látens szemantikus eloszlások használata a nyelvi modellek előtanítása során
Berend Gábor XIX. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2023
január 26–27

# Kivonat

* Cikkünk egy variánsát mutatja be a nyelvi modellek előtanításának,
* a maszkolás célfüggvénye a random kiválasztott tokenek szemantikus kategja
* modelljeink finomhangolása változatos benchmarkokon
* szignifikánsan jobb eredmény elérésére képesek hagyományos társaikhoz képest

# Kulcsszavak: előtanítás; szemantikus klaszterek

# 1 Intro

* Az előtanítás során két fő megközelítés: autoregresszív és maszkolásos
  * autoregresszív modellek a megkezdett szövegek minél valósághűbb folytatását
    * ie minél kisebb perplexitással rendelkező szövegek generálása
  * maszkolást alkalmazó módszerek
    * teljes mondatot (vagy szövegrészt) kapnak inputul a tanítás során, majd
      az ezekből a mondatokból véletlenszerűen kitakart szavak (illetve
      szótöredékek) rekonstruálását tűzik ki célukul az előtanítás során
    * az autoenkóderek működéséhez hasonló viselkedést eredményez
      * különbség: az MLM-ben nem folytonos értékek, hanem diszkrét szimbólumok
* we: a maszkolással tanított nyelvi modellek előtanításának egy alternatíváját
  * nem a konkrét kitakart szó(töredék)et, hanem annak (látens) szemantikai
    jellemzésének megállapítását adjuk az LM neurális háló feladatául
  * autoregresszív: Noha cikkünkben az autoregresszív modellekkel nem
    foglalkozunk, a javasolt eljárás azokra is kiterjeszthető lenne
* motiválandó, vegyük azt az egyszerű mondatot, hogy „Mari süteményt eszik”
  * veszteségfüggvénye abban az esetben lesz a lehető legkisebb,
    ha a háló a kitakart szó vonatkozásában kizárólag a „süteményt”
  * más – hétköznapi tudásunkkal egyébként teljességgel összeegyeztethető –
    szavak (mint pl  „sóletet”, „disznósajtot”, stb) vonatkozásában a kitakart
    szó helyén való előfordulás eshetőségét teljességgel kizárná
  * úgy is elképzelhető, hogy valamilyen szemantikai erőforrásra támaszkodva
    * WordNet (Fellbaum, 1998; Miháltz+ 2008) vagy
    ő ConceptNet (Speer és Havasi, 2012))
    * a kitakart szavak ontologikus tulajdonságainak meghatározását várnánk el
    * a kitakart szó helyén egy ehető fogalom állt
    * hE
      * feltételezi egy kellően expresszív tudásbázis meglétét
      * ambig: az éppen adott kontextusuk mentén a különböző lehetséges
        jelentéseik közül mely szemantikus tulajdonság(ok) teljesül(nek)
      * Ilyen szemantikus részletességgel annotált tanítóadatbázis meglétében
        az előtanításhoz szükséges mennyiségben aligha reménykedhetünk
  * kiváltására teszünk javaslatot oly módon, hogy a
    * kontextuális szóreprezentációk alapján felügyelet nélküli módon
      látens tulajdonságok teljesülését rendeljük az egyes szóalakokhoz,

# 2 Related work

* rengeteg nyelv támogatására készítettek BERT variánsokat
  (Vilares+ 2021; Martin+ 2020; Le+ 2020; Ulčar és Robnik-Šikonja, 2020)
  * magyar nyelv feldolgozására specializált HuBERT (Nemeskey, 2021)
* külső tudások előtanított nyelvi modellekbe történő integrálására
  (Mihaylov és Frank, 2018; Bauer+ 2018; Peters+ 2019; Ye+ 2019; Yang+ 2019;
  Qiu+ 2019; Levine+ 2020; Liu+ 2020)
  * széles spektrumon mozognak aszerint, hogy a külső tudást hogy használják
  * mind valamilyen explicit tudásra, pl manuálisan létrehozott tudásbázisokra
* we: adatvezérelt szemantikus kategóriák
  * bizonyos tekintetben hasonlítanak a Brown klaszterekre (Brown+ 1992),
  * a szóelőfordulások szintjén kaphatunk egy szemantikus kategorizációt

# 3 Módszer

* célfüggvény: KL-divergencia használatával, hogy
  * a modell által a k speciális szimbólumra visszaadott multinomiális eloszl
    mennyire tér el az adott szóelőfordulás mentén a (2) alapján meghatározott
    `α_i` szem eloszlástól

# 4 Kísérletek

* a HuBERT modell súlyaival inicializáltuk, és
  a javasolt előtanítási módszert használva 10 000 modellfrissítési lépést
  * tanulási ráta, valamint az egyes tokenek kimaszkolási valószínűsége gyanánt
    az irodalomban gyakran alkalmazott 0,0001, illetve 0,15 értékeket
* Baseline-ként egy olyan, a klasszikus – szemantikus eloszlások helyett
  szótöredéken alapuló – maszkolt nyelvi modellezési feladattal továbbtanított
  * a célfeladattól eltekintve az általunk javasolt modellel teljesen azonos
  * frissítésük során pedig megegyező tartalmú batcheket dolgoztunk föl

## Kvalitatív szempontból vizsgáljuk

* Ebben a fejezetben azt kívánjuk illusztrálni, hogy
  az (1) megoldásával előálló látens szemantikus kategóriák, illetve eloszlások
  alkalmasak a szóelőfordulások jelentéseik mentén történő csoportosítására,
  illetve a kontextuális hasonlóság mérésére
* fig 1: szópárok mentén miként alakulnak a koszinusz hasonlóságok
* fig 2: szemantikus eloszlások mely látens dimenziók mentén max
  * ugyanezen dimenziók mentén a többi vizsgált szó milyen értékekkel
  * a hasonló jelentéssel bíró szóelőfordulásokhoz hasonló szem eloszlások

## Kvantitatív kiértékelését mutatjuk be különböző feladatokon történő finomhan
