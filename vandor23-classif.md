huBERT alapú sziámi neur háló architek elemzése ügyfélszolg emailek klasszif
Vándor Péter1 és Csáki Csaba1
XIX. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2023. január 26–27.

# Kivonat: 

* Az itt bemutatott kutatás célja kettős
  * egy valós ügyfélszolgálati probléma (nagy mennyiségű emailek automatikus
    kategorizálásának) mesterséges intelligencia alapú informatikai támogatása
    a hatékonyabb feldolgozás érdekében
  * a felhasznált BERT-alapú MI architektúrák szisztematikus vizsgálata
    tapasztalat szerzés céljából
* 3 illetve 10 kategóriát felismerő, ügyfél emaileket feldolgozó megoldás
  paramétereinek változtatásával növelhető volt a pontosság és az alkalmazott
  * a kezdeti alig 70%-os helyett közel 95%-os teljesítmény volt elérhető.

## 3.3 

* Az eredeti multiklasszifikációs probléma megoldása érdekében generáltunk egy
  minden osztályt pontosan egyszer magába foglaló támogató halmazt
  véletlenszerűen kiválasztott 1-1 db e-maillel
  * A támogató halmaz minden elemét összehasonlítottuk az OSL segítségével a
    kategorizálásra váró e-maillel
  * A legnagyobb hasonlósági érték alapján döntöttük el, hogy az adott e-mail
    melyik osztályba tartozik.
