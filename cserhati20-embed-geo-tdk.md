Szóbeágyazás-modellek geometriai tulajdonságainak összehasonlító vizsgálata
Cserháti Réka
tdk 2020

# Absztrakt

* a különböző módszerekkel létrehozott modelleknek milyen közös tulajdonságai
  vannak, és mik azok, amiben különböznek
* kétféle korpuszon, 5 algoritmussal, és ezeken belül is különböző hiperparam
  * normáleloszlás szerint generált véletlenszerű vektorokkal is összehasonlítva
* a vektorok hossza érdekes tulajdonságnak bizonyul, így ezután az ezt
  befolyásoló tényezőkre derítünk több fényt,
  * megkérdőjelezve és pontosítva azt az eddig a köztudatban élő nézetet, hogy
    mennél gyakoribb egy szó, annál hosszabb lesz a hozzá tartozó vektor
* Végül a szavak hasonlóságát és szomszédságát helyezzük a középpontba,

### 2.2.1. Statisztikai tulajdonságok

* a következő eloszlásokat vesszük figyelembe:
  * A szóbeágyazás-modellek mátrixának összes értéke
  * A dimenziónkénti átlagok
  * A dimenziónkénti szórások
  * A vektorok hossza
  * Vektorok skalárszorzata egymással
  * Skalárszorzat az átlagvektorral (ld. [23])
  * Vektorok koszinusz hasonlósága egymással (ld. [9])
  * Koszinusz hasonlóság az átlagvektorral
  * Vektorok euklideszi távolsága egymástól
  * Euklideszi távolság az átlagvektortól

### 2.2.2. Random forest

### 2.2.4. Elemzés

#### Geometriai következtetések

* mely modellekre jellemző a [23] által bemutatott tölcséres elhelyezkedés
  * Erre alkalmas a koszinusz hasonlóságok átlaga, a skalárszorzatok átlaga
    vagy az átlaggal való koszinusz hasonlóságok átlaga
  * az SGNS modellek elkülönülnek a többi neurális szóbeágyazástól
  * a sajátértékekkel szabályosan összeszorzott SVD modellekre is igaz, azon
    belül pedig a kisebb shift kedvez ennek a tulajdonságnak
* [23] a vektorok koncentrálódását a negatív mintavételezésnek tulajdonította,
  itt azonban úgy tűnik, ilyen tekintetben
  a Skip-gram hierarchikus softmax optimalizásással hasonlít az SGNSre, a CBOW
  negatív mintavételezéssel viszont nem
  * Ebből arra következtetünk, hogy bár a negatív mintavételezés erősíti ezt a
    tulajdonságot, alapvetően a Skip-gram algoritmus felelős érte
* az SGNS modellekben a vektorhosszak szórása és az átlagos euklideszi távolság
  is alacsony a többi algoritmus modelleihez képest
  * Ez alapján az SGNS vektorok nem is tölcsér, hanem gömbszerű alakzatban
    csoportosulnak az átlagvektoruk köré
  * Ez megmagyarázhatja, hogy az SGNS modellekben nagyon erős kapcsolat van a
    skalárszorzatok átlaga és az euklideszi távolságok között (ld. 2.2a)
    * így mennél kisebb ennek a gömbnek a sugara, a skalárszorzatok annál
      nagyobbak, a távolságok pedig kisebbek

#### Tanulság a különböző nyelven tanított modellek közötti trafókra

* az ilyen célra használt tarnszformációknak általában ortogonálisnak kell
  * az egyeztetni kívánt modellek geometriailag hasonlók legyenek
* Kiderült, hogy ehhez a betanításra szolgáló algoritmusnak és a legtöbb
  hiperparaméternek egyeznie kell a két modellre
  * Az ablakméret azonban variálható
  * ez hasznos, ha különböző struktúrájú nyelvekről van szó
    * a magyar nyelv toldalékoló tulajdonsága miatt magyarul
      sokkal kevesebb szóban fejezünk ki ugyanannyi információt, mint például
* ha SGNS, SG-HS vagy SVD modellek transzformációját szeretnénk elvégezni, az
  átlag körüli csoportosulásuk miatt különösen hasznos lehet először a [3]
  által javasolt módon kivonni az átlagvektort minden vektorból, és a
  * hogy a vektorok egymáshoz viszonyított iránya jobban befolyásolja a trafót

## 2.3. Véletlen generált és valódi szóvektorok

* különböző módszerekkel a modellek vektoraihoz hasonló véletlen vektorokat
  generálunk, majd egy random forest modellel megpróbáljuk megkülönböztetni a
  véletlen vektorokat a szóbeágyazás-vektoroktól. Ez mennél kevésbé lesz
* két CBOW, két Skip-gram és két GloVe modellt vizsgálunk
  * SVD-modellek: Ferdeségük és csúcsosságuk alapján nem normáleloszlás, ezért
    azokat ebből ki kell hagynunk
* Random2: egyes modellekben láttuk, hogy a koordináták átlaga dimenziónként
  nagyon eltérő lehet, olyan vektorokat is létrehozunk, ahol
  dimenziónként különböző paraméterű normáleloszlásokat használunk
* Random3: a Random2 vektorokat először egységhosszúvá tesszük, majd a
  hosszukat is normáleloszlás szerint generáljuk, bár a vektorok
  hosszának eloszlása már kevésbé emlékeztet a normáleloszlásra
* Random4: Végül a dimenziók kovarianciamátrixa alapján többváltozós
  normáleloszlás szerint is létrehozunk véletlen vektorokat
  * a dimenziók egymástól nem független változók
* a szóvektorok minden esetben viszonylag jól megkülönböztethetők
  * magyarázata talán, hogy a szóvektorok valahol sűrűbben, valahol ritkábban
  * GloVe jobban követi a normáleloszlást, mint a word2vec modellek
  * a legjobb közelítés minden esetben a többváltozós normáleloszlás, tehát a
    dimenziók nem függetlenek egymástól

# 3. fejezet A szóvektorok hossza

* láttuk, hogy a vektorhosszak eloszlása a szóbeágyazásmodellek között is kül
* már a word2vec előtt a köztudatban, hogy a vektorok hossza hordoz infót a
  szavak gyakoriságáról
  * Adriaan and Wilson (2015): az SGNS vektorok hossza nemcsak a gyakoriságon,
    hanem az adott szó környezetének specifikusságán is múlik:
    * Adriaan M. J. Schakel and Benjamin J. Wilson
      Measuring word significance using distributed representations of words
      CoRR, abs/1508.02297, 2015
    * egy szó vektora hosszabb lesz, ha a környezete általában hasonló, és
      rövidebb, ha bármilyen környezetben előfordulhat (pl. stopszavak)
    * speciális korpuszon (elméleti részecskefizikai cikkeken) érik el
* Ebben a fejezetben: a szavak gyakoriságából és környezetük statisztikájából
  meghatározható-e a vektorok hossza

## 3.1 Szóvektorok hossza különböző modellekben

* kiválasztjuk azokat a szavakat, melyek az összes modellben szerepelnek, és
  megnézzük a korrelációját ezek hosszainak (3.1. ábra)
  * a korreláció gyakran közel 0 és negatív is lehet
  * éppen a [29] által vizsgált Skip-gram modell mutat leggyakrabban negatív
    korrelációt a többi modellel

### 3.1.1. Hosszúság és gyakoriság

* A 3.2. ábrán egyes modellek vektorhossza vs szógyakoriságok logaritmusa
  * különbözőképpen jelenik meg a modellekben, de egyik sem független tőle
  * A modellek többségében a vektorhossz pozitív korrelációt mutat a gyakkal
    * a Skip-gram modellekben viszont negatívat. Legalább részben emiatt, a
  * valami befolyásolja a vektorok hosszát,
    mert a CBOW erős pozitív, a Skip-gram erős negatív korrelációban a gyakkal,
    egymással viszont nem korrelálnak negatívan
* Ez az eredmény, hogy a Skip-gram vektorok hossza negatívan korrelál a gyakkal
  * nem egyezik [2] és [29] korábbi eredményével
  * ablakméret és más hiperparaméterek ezt a negatív korrelációt nem befolyásol
  * oka az, hogy ők más, kisebb korpuszokon tanították a vektorokat
  * megnézzük a vektorhosszakat a gyakoriság függvényében 4 különböző méretű
    korpuszon tanított Skip-gram modell esetén (3.3. ábra)
  * a korpusz mérete erősen befolyásolja a vektorhossz és a gyakoriság viszonyá
  * A korpusz növelésével a korreláció csökken majd negatívvá válik
* Tapasztalataink szerint a többi modellnél
  * bár megmarad a pozitív korreláció a nagyobb korpuszokon is,
  * a korpusz növelésével a vektorhossz egyre kevésbé megjósolható a gyakból
  * A word2vec előtti neurális szóbeágyazásokat nem lehetett ilyen nagy korpusz
    * talán emiatt gondolták sokáig, hogy a gyakoriság az egyetlen tényező

## 3.2. Vektorhosszak meghatározása

* megpróbáljuk predikálni a hozzájuk tartozó vektor hosszát
  * szükségünk lesz a szavak szövegkörnyezetére, egy kisebb, 17 millió tokenes
    Wikipédia korpuszon tanítjuk be a modelleket

### Random forest regresszió

* most is a random forest lesz, csak itt a feladata nem osztályozás, hanem regr
* levelei a célváltozó egy lehetséges értékéhez vannak hozzárendelve
* predikció pedig a különböző fák által hozzárendelt számok átlaga

### 3.2.1. Gyakoriság, szófaj és többértelműség

* Adriaan and Wilson (2015) szerint a vektorhossz a szófajtól sem független,
  * bizonyos szófajokra jellemzőbb a környezet specifikussága
  * ha egy szóhoz több jelentés is tartozik, az többféle környezetben is
    szerepel, ezért rövidebb lesz a vektora
* Első kísérletünkben a szavak gyakoriságából, szófajából és többértelműségéből
  * szófajról és a többértelműségről a SemCor [22] korpuszból szerzünk
    * hányszor fordul elő minden lehetséges szófajban
    * hányszor szerepel az első, második, harmadik illetve ezeken felüli jelent
    * Sajnos nem biztos, hogy a mi korpuszunkban ezek az adatok arányosak
* modellenként nagyon változó, a gyakoriság mennyire határozza meg a hosszt
* a szófaj és a többértelműség figyelembe vétele minden modellben javítja

### 3.2.2. A szövegkörnyezet statisztikája

* a tőle legfeljebb az ablakméretnyi távolságra lévő szavakat egy közös listába
* Ezután minden szóhoz tartozó listára kiszámoljuk
  * a multihalmaz-entrópiáját 3
  * a benne szereplő elemek gyakoriságának átlagát
  * a szavak átlagos relatív gyakoriságát a listában a teljes korpuszhoz
    viszonyítva és
  * a listában előforduló különböző elemek számát
* A 3.2. táblázat mutatja az eredményeket a fenti négy jellemző alapján, a
  javulást a legjobb korábbi eredményhez képest, illetve az eredményeket az
  összes eddigi adat felhasználásával
* ha minden adatot felhasználunk, csak legfeljebb 0,03-os javulást érhetünk el
  a szövegkörnyezethez képest
  * részben oka lehet, hogy a szövegkörnyezet statisztikái implicit módon a
    gyakoriságot is tartalmazzák
* A scikit-learn `feature_importances_` metódusát használva kiderül, hogy
  * SVD modellekre a különböző szavak számát,
  * a Skip-gramokra általában az entrópiát,
  * a GloVe és CBOW modellekre pedig az átlagos gyakoriságot használja
    leginkább (és a többinél jóval nagyobb mértékben)

### 3.2.3. Hasonló szavak vektorának hossza

* egy szóvektor hosszára mennyire lehet a hozzá hasonló vektorok hosszából
  következtetni. Hasonlóság mérésére a koszinusz hasonlóságot használjuk, mert
  ez egyáltalán nem függ a vektorhosszaktól
* egy vektor hosszát és a 15 szomszédja hosszának az átlagát, és ezek között
  számítjuk ki a korrelációt. Az eredményeket a 3.3. táblázat tartalmazza
* valamennyire minden modellben hasonló hosszúak a hasonló szavak vektorai, de
  van, ahol a korreláció kifejezetten magas is lehet (pl. SGNS, CBOW-NS, GloVe)
* hasonló jelentésű szavak nemcsak hasonló szavak környezetében, hanem
  hasonlóan specifikus környezetben is szerepelnek, ami intuitív is
* Véletlenszerűen generált vektorok esetén viszont nem függ össze ilyen
  szorosan az irány és a hossz, ami még egy oka lehet a 2.3-beli eredménynek

# 4. fejezet A szavak hasonlósága

* két kísérletet végzünk el a modelleken
  * szópárokat kell hasonlóság szerint rangsorolni
  * adott szavak szomszédsága mennyire hasonlít különböző modellekben

## 4.1. Szópárok rangsorolása

* Mivel az egymáshoz valamennyire eleve is hasonló szópárok hasonlóságának
  rangsorolása (kávé – tea, fa – erdő, autó – hajó) fontosabb feladat,
  * egy véletlenszerűen választott szó mellé egy az egyik modellben koszinusz
    hasonlóság szerint a hozzá legközelebbi 100/1000 szó közül sorsolunk 5-5 K
    szót + 10000 szópár teljesen véletlenszerű
* most a Spearman-korrelációt használjuk, amely csak az értékek sorrendjét
  veszi figyelembe, így nem jelent gondot például az, hogy a koszinusz
  hasonlóság -1 és 1 között változik, miközben a skalárszorzat bármekkora

### 4.1.1. A modelleken belül és modellek között

* koszinusz hasonlóság
  * nem befolyásolja a szópárok rangsorát a modelleken belüli hiperparaméterek
    * CBOW és a Skip-gram is alig különül el egymástól, és még a
    * GloVe és a word2vec modellek között is viszonylag magas, 0,7 körüli korr
* kicsit kevésbé szépek, de nagyon hasonlóak a skalárszorzat esetén
* Az euklideszi távolság szerinti hasonlóságokban viszont nem mindig pozitív
  * A Skip-gram modellek, leginkább az SGNS, negatívan is korrelálnak a CBOW és
    a GloVe szerinti euklideszi távolsággal
* ez az SVD modellekre is jellemző, de erősen függ a PMI shifttől

### 4.1.2. A hasonlósági mértékek

* Az euklideszi távolság nagyon különbözőnek tűnik a két másik hasonlóságtól
* A Skip-gramokban van a legkisebb különbség az euklideszi és a másik kétféle
  hasonlóság között

## 4.2. Szavak szomszédai

* véletlenszerűen választott 500 szó, a modellekből kikeressük ezek
  szomszédait, és kiszámítjuk az így keletkezett halmazok metszetének méretét
  különböző modellek illetve hasonlósági mértékek esetén
* fig 4.3: egyes algoritmusokon belül a modelleket különböző hasonlósági
  * átlagos átfedés arányát minden lehetséges modell-párra;
  * Ha tehát egy algoritmust önmagával összehasonlítva sem kapunk nagy számot,
    az azt jelenti, hogy a hiperparaméterek változtatása megváltoztatja a
    szavak szomszédságát az adott hasonlóság szerint 
    * ez az eredmények szerint a GloVe-ra a legjellemzőbb. (...)
  * a szomszédok halmazának mérete nincs nagy hatással az eredményekre
  * A legstabilabb hasonlósági mérték a koszinusz
    * eszerint a leggyakrabban vannak azonos algoritmussal készült modellekben
      a szavaknak közös szomszédai
    * a szomszédok számának növelése általában kedvez a stabilitásnak
  * ,,,
* adott hasonlósági mértékeken belül (4.4. ábra), különböző szóbeágyazás-algo
  * legstabilabb hasonlóságfogalomnak itt is a koszinusz hasonlóság bizonyul,
  * itt sem eredményez nagy változásokat az szomszédok száma
  * a GloVe tér el leginkább a többitől, különösen a koszinusz hasonlóságban
    * meglepő eredmény, mert a GloVe és a word2vec modelleket gyakran szinte
      teljesen egyformának tekintik,
    * word2vec közelebb áll az SVD-hez
