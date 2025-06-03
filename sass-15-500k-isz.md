28 millió szintaktikailag elemzett mondat és 500000 igei szerkezet
Sass Bálint
MSZNY 2015

erőforrások elérhetők a http://corpus.nytud.hu/isz cı́men

# Kivonat

* Két nagy méretű, magyar nyelvi erőforrást teszünk közzé. Az egyik
  * a régi MNSZ [1] tagmondatainak sekély szintaktikai elemzéssel ellátott
  * az ebből az adatbázisból automatikusan származtatott igeiszerkezet-lista,
    melyből a Magyar Igei Szerkezetek cı́mű szótár [3] is született. Az

# 1.  Az erőforrások létrehozása

A Mazsola adatbázis a Magyar Nemzeti Szövegtár 187 millió szavas régi változa-
* tagmondatokra bontottunk és
* részleges szintaktikai elemzésnek vetettünk alá.  Utóbbi során
  1. megállapı́tottuk a tagmondat igéjét
    (főnévi igeneves szerkezet esetén a főnévi igenév a tagmondat igéje), és
    hozzákapcsoltuk az igéhez az esetleges odatartozó elváló igekötőt;
  2. az ige mellett felső szinten megjelenő névszói és névutói csoport[okat]
     (tehát a határozószói csoportokat például nem), ezeket
     a fej szótövével és esetével (értsd: esetragjával vagy névutójával)
     reprezentáltuk. A részleteket lásd Sass (PhD thesis 2011) 2.2. fejezetében
  1. a birtokos szerkezetek jobb kezelésének valamint a főnévi igenév mellett
     -nAk raggal megjelenő alany funkciójú bővı́tmény alanyként való
     reprezentálásának köszönhetően [kevesebb] a helytelen -nAk esetű bővı́tmény
  2. a maga mögött és a mögöttem tı́pusú szerkezetek helyesen névutós
     névmásként elemződnek; valamint
  3. szerepel [ az annotációban: hogy a] bővı́tmény birtokos személyjeles-e.
* Az igeiszerkezet-lista a fenti adatbázis alapján egy speciális
  igeiszerkezet-kinyerő algoritmussal automatikusan
  * azáltal összesı́ti, hogy a ritka (legfeljebb 5-ször előforduló)
    mondatvázakat egy rövidebb, illeszkedő mondatvázhoz rendeli hozzá; majd
  * az eljárás végén ... a túl általános mondatvázhoz került mondatokat a
    lehető legspecifikusabb meglévő mondatvázhoz helyezi át. A módszer képes
  * szerkezetek
    * vonzatokat (hisz vmiben),
    * kollokatı́v igei szerkezeteket (süt (a) nap, döntés születik ), illetve a
    * vonzatos komplex igéket (szó van vmiről, igényt tart vmire)
