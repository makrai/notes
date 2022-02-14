Nyelvspecifikus transzformer modellek közötti megfeleltetéssel történő
zero-shot jelentésegyértelműsítés
Berend Gábor
XVIII. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2022. január 27–28.

# Kivonat 

* nyelvközi tudástranszfert egynyelvű előtanított modellekre épít
* A nyelvek közötti kapcsolatot az
  egynyelvű transzformer modellek rejtett rétegei közötti leképezés tanulásával
* angol nyelvű jelentésegyértelműsített szövegeken tanuló modellek hatékonysága
  szignifikánsan javítható többnyelvű maszkolt nyelvi modellhez képest.

# 1. Bevezetés

* jelentésegyértelműsítés a természetesnyelv-feldolgozás egy
  * régóta (Weaver, 1949/1955; Lesk, 1986; Gale+ 1992; Navigli, 2009)
  * tudásbázisokra támaszkodó, valamint felügyelt tanulást alkalmazó
    * utóbbiak teljesítenek jobban. 
  * Mindkettő komoly humánerőforrás-igénnyel rendelkeznek, hiszen mind a
  * angol: több viszonylag nagy  jelentésegyértelműsítési adatbázis is létezik
    (Miller+ 1994; Taghipour és Ng, 2015), a legtöbb nyelvre – köztük a
  * magyarra is – korábban nem létezett megfelelő méretű és részletezettségű
    * Vincze+ (2008) közreadott ugyan egy jelentésegyértelműsített korpuszt,
      * mindössze 39 többértelmű szóalak különböző jelentéseinek előfordulásai
    * XL-WSD adatbázis (Pasini+ 2021) ezen a helyzeten változtat, ezért is
  * mi: a különféle kurrens módszereket egymással komplexen összehasonlító

# 2. Kapcsolódó munkák

* kontextualizált szóreprezentációk jelentésegyértelműsítésben való fölhasznál-
  * Peters+ 2018) mutatott rá
  * Loureiro és Jorge (2019), a BERT (Devlin+ 2019) maszkolt nyelvi modellből
    kinyerhető vektorok segítségével egy egyszerű, mégis nagy hatékonyságú
    1-legközelebbi szomszédságon alapú osztályozó építhető
  * Berend (2020a) egy olyan felügyelet nélküli megoldásra tett javaslatot, ami
    a kontextuális jelentésvektorokat olyan módon ritkítja, hogy
    az azonos koordináták mentén nemnulla együtthatóval rendelkező szavak pedig
    tendenciózusan azonos jelentéssel rendelkezzenek
    * a Loureiro és Jorge (2019) által is alkalmazott 1-legközelebbi módszerrel
      kombinálva szignifikáns javulások voltak elérhetők.
* magyarra nem létezett korábban kellő méretű és diverzitású WSD tanító/tesztelő
  * Vincze+ (2008), magyar nyelvű újsághíreket tartalmazó WSD-ed HuWSD data set
    * mindössze 39 többértelmű szóalak vonatkozásában tartalmaz annotációkat,
  * többnyelvű transzformer architektúrákat alkalmazó eredmények a HuWSD vonatk
    (Berend, 2020b, 2021)
  * A Pasini+ (2021) által megalkotott XL-WSD adatbázis az angolon kívül
    17 további nyelven tartalmaz WSD-ed diverz szövegeket, amelyek
    kísérleteink alapjául is szolgáltak.

# 3. Módszertan

* a transzformer modellekből kinyerhető, módosítatlan kontextuális
  reprezentációkat használó 1-legközelebbi szomszédságon alapuló módszert
  (Loureiro és Jorge, 2019), valamint a ritkításon átesett kontextuális repre-
  zentációk (Berend, 2020a) használatát hasonlítjuk össze különféle esetekben.

## 3.1. Kontextuális modellek ritkítása

* ahol C a legfeljebb 1 normájú oszlopvektorok alkotta d × k méretű mátrixok
  konvex halmazát jelöli,
  * a csupa nemnegatív értékből álló α együtthatómátrix
  * ritkaságát befolyásoló λ regularizációs együttható,
  * k pedig a mátrixdekompozíció során alkalmazott atomok száma
* minden lehetséges s i jelentéshez társítottunk egy φ s i ∈ R k vektort, amely
  vektor a D szótármátrixban található k jelentéskomponens és a
  jelentésegyértelműsített tanítókorpuszban s i jelentésűként megjelölt szavak
  közötti kapcsolat erősségét fejezi ki a pontonkénti kölcsönös információ
  (PMI) segítségével. A tesztelés során egy α j ∈ R k ritkításon átesett
  kontextuális reprezentációval rendelkező szó kapcsán a modellünk azt az s ∗
  jelentést választja ki az adott szóhoz, amelyre s ∗ = max s ⊺ α j , ahol S az
  adott szó lehetséges jelentéseinek halmazát jelöli.

## 3.2. Nyelvspecifikus transzformerek közötti leképezés

* lehetőségünk van kiaknázni a forrás-,valamint a célnyelv feldolgozására
  specifikusan létrehozott transzformer modellek előnyeit, így
  * elkerülhetővé válik a többnyelvű modellekre jellemző ún. többnyelvűségi átok
    (Conneau+ 2020).
* az optimalizálás már csupán α-ban történik, ami lehetővé teszi a ritka
  reprezentációk hatékony meghatározását. Kísérleteinkben az RCSLS algoritmust
  (Joulin és mtsai, 2018) használtuk a W leképezés meghatározására, amelynek
  célfüggvénye
* ahol az (x i , y i ) kontextuális reprezentációk olyan párosait jelölik,
  amelyeket a célnyelvre, illetve a forrásnyelvre szabott nyelvi modellből
  nyertünk ki egy-egy azonos minőségben előforduló fordítási szópár
  vonatkozásában, N pedig a tanítás során fölhasznált vektorok közül tér vissza
  az argumentumában szereplő vektor legközelebbi szomszédjaival.
 
# 4. Kísérletek

## 4.4. Szótöredékek kezelése

* a szószintű rejtett reprezentációk megalkotására
