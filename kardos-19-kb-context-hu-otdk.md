Kardos Péter 1 , Berend Gábor 1,2 , Farkas Richárd 1
Kísérletek tudásbázisés mondatkörnyezet-alapú beágyazásokkal magyar nyelvre
MSYNY 2019

https://github.  com/benedekrozemberczki/diff2vec

# 1 Intro

* a magyar WordNetből készítettünk [gráf]beágyazásokat a diff2Vec [2] algóval
* Javaslunk egy újszerű módszert is, mellyel kombinálhatók [a disztribúciós és
  a gráfos] beágyazások,
* A beágyazásokat a magyar WordNetből általunk készített feladaton teszteltük

# 2. Kapcsolódó munkák

## 2.1. Gráfbeágyazások

* A legtöbb ilyen algoritmus a skip-gram/CBOW beágyazó megoldásra épít, de
  előtte át kell alakítanunk a gráfot ezzel kompatibilis formába
  * gráfbeágyazó algoritmusok a node2Vec [3] és diff2Vec [2], amelyek
    * a csúcsok környezetét adott hosszúságú és számú csúcsból induló bejárással
      írják le
  * együttes előfordulás mátrixot ... lesznek majd a neurális háló kimenetei, a
    bemenet pedig a csúcs one-hot vektora. Így már tudjuk tanítani a hálót a
  * A node2vec és diff2vec csak a környezet kinyerésében tér el egymástól. Mivel
  * előzetes kísérleteink azt mutatták, hogy a diff2vec rendre jobb eredményeket
* diff2Vec [2], mint Diffusion to Vector úgynevezett szétterjedés gráfokat hoz
  * inicializáljuk a G e diffúziós gráfot, melyben egyetlen csúcs
  * minden iterációban a még nem bevett szomszédos élekből véletlenszerűen
  * addig ismételjük amíg a paraméterként kapott p darab csúcs nem lesz
  * minden élet megduplázunk, így biztos lesz benne Euler séta
    * megismer minden szomszédsági kapcsolatot a részgráfban
  * Ezután már tudunk ezekből a csúcs sorozatokból skip-gram/CBOW[-val] beágyaz
* A diff2vec a következő paraméterekkel rendelkezik: – – – –
  * Generált szétterjedés gráfok száma csúcsonként
  * Szétterjedés gráfokbeli csúcsok száma
  * Beágyazás dimenziója
  * Ablak mérete

## 2.2. Magyar nyelvű beágyazási eredmények

4. Makrai, M
   Comparison of distributed language models on medium-resourced languages
   MSZNY 2015). (2015)
6. Siklósi, B., Novák, A
   Beágyázási modellek alkalmazása lexikai kategorizációs feladatokra
   MSZNY 2016
   * a szóbeágyazások minőségének ellenőrzésére a szemantikai csoportok
     hierarchikus klaszterezéssel történő automatikus kinyerését választották
7. Szántó, Z., Vincze, V., Farkas, R
   Magyar nyelvű szó~ és karakterszintű szóbeágyazások
   (MSZNY 2018)
  * téma– és véleményosztályozási feladatokba építve mutatta meg
8. Novák, A., Novák, B
   Magyar szóbeágyázási modellek kézi kiértékelése
   (MSZNY 2018)
  * aszerint rangsorolják, hogy azok mennyire homogén legközelebbi szóhalmazt

# 3. Mondatkörnyezetés gráfalapú beágyazások 3

* Az általunk használt algoritmusok nem veszik figyelembe az élek címkéit,
  * a kapcsolatok szerint ... külön-külön futtattuk az algoritmusokat. Az így
  * javaslunk, és tesztelünk egy módszert különböző beágyazások kombinálására

# 3.1. Beágyazások kiértékelése

* a magyar WordNetből [9] két gráfot készítettünk: szinonima, hiperníma
* Mondatkörnyezet beágyazásként a Szeged_fasttext-et [7] használjuk. Vettük
* gyűjtöttünk szópárokat melyek 1,2 vagy 3 távolságra helyezkednek el egymástól
  és mindegyik távolságból véletlenszerűen választottunk 100-100 darab szópárt
* [a] koszinusztávolság és a WordNet ... távolság inverzének Spearman korr

* Out-of-vocabulary (OOV) ...  szavak kezelésére három eljárást is

1. Zero: 0 a hasonlóságértékük
2. Skip Egyszerűen átugorjuk az adott példát. Itt problémát jelent, hogy a
3. Fallback [a szó végén álló toldalék miatt] levágjuk mindig az utolsó betűt,
  * mit is kéne tenni, ha elfogynak a betűink. Ebben az esetben átugorjuk

* Miután a 600 szópárt kigyűjtöttük a kiértékelő adatbázisba,
  a gráfból töröltük az egyes szópárokat összekötő összes legrövidebb út összes
  élét, hiszen célunk a tudásbázisban nem szereplő asszociációk predikál[ás]a

## 3.2 Beágyazások kombinációja

* A legkézenfekvőbb ..., ha egyszerűen konkatenáljuk a szavak vektorait
  * amennyiben valamelyik beágyazásban nem szerepel egy szó, akkor [ott 0]
* A következő lépésben információtömörítést alkalmazunk, ez lehet SVD vagy PCA
  * motiváció: az erősebb dimenziók jobban fogják meghatározni a beágyazást,
  * Az erőforrásigények csökkentése érdekében csak az adatsorok 10%-át vettük a
    legfontosabb dimenziók meghatározására
* Végül a kapott beágyazás oszlopait L1 normalizáljuk,
  melyet a (Speer 2017) cikkben mutatott sikerek miatt teszünk. A módszerek
  10. Speer, R., Lowry-Duda, J
    Conceptnet at semeval-2017 task 2:
      Extending word embeddings with multilingual relational knowledge
      CoRR abs/1704.03560 (2017)

## 3.3 Diff2Vec beágyazások

## 3.6 Mondatkörnyezetés gráfalapú beágyazások kapcsolata

* A Szeged_fasttext [7] egy magyar előtanított szóbeágyazási modell 100 di-

# 4. Konklúzió

* jövőben [ún.] heterogén gráfalapú beágyazó algoritmusokkal tervezzük
  * az élek címkéit is képesek figyelembe venni
