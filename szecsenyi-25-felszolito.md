# Abstract

* pragmatikai jellemzők annotálása során nagy kontextust kell figyelembe venni.
* ?  milyen hatással van a rendelkezésre álló kontextus nagyságának a változása.
* manuálisan rögzített pragmatikai annotáció
  a felszólító alakok funkcióinak kategorizálására. A korpusz segítségével a
* huBert base
* a modell az annotálás során milyen mértékben támaszkodik a kontextusra. A
  * kétféleképpen vizsgáltuk: 
  * a tanítószekvenciák hosszának változtatásával hogyan befolyásolja a modell
    * a tanításnál és tesztelésnél használt 50%-os átfedéssel kialakított
      szekvenciák hossza (64, 128, 256, 512 token) befolyásolja-e az eszköz
      megbízhatósági értékeit (P, R, F1)
    * a szekvenciahossz növelésével együtt nőtt az F1 érték is
      (0,80, 0,81, 0,82 és 0,83)
  * az annotálandó elemek szekvencián belüli elhelyezkedése milyen hatással van
    * a felszólító alakok a tesztszekvencián belüli pozíciója hogyan
      befolyásolja a funkció meghatározásának megbízhatóságát
    * a szekvenciák széléhez közeli pozíciókban alacsonyabbak voltak a
    * vagyis a rendelkezésre álló kontextusnak volt hatása, továbbá hogy 
    * nagyobb bal oldali kontextust (25–30 token) vesz figyelembe az eszköz,
      mint jobb oldalit (15–20 token)
* Összegzésből:
  * MedCollect egészségügyi álhírkorpuszban található felszólító alakok
  * megmagyarázza azt is, hogy a szekvenciák hosszának növelése miért csak
    ilyen kis mértékben növeli a megbízhatóságot: ha a funkciók megállapítá-
    sához csak ±25 token kontextust vesz figyelembe az eszköz, akkor a
    szekvenciák közepén, ahol ez a kontextus rendelkezésre áll, állandó
    megbízhatóságú a kategorizálás, amit csak a szekvenciák végeinek
    megbízhatósága ront le
  * Minél hosszabb a szekvencia, annál nagyobb a középső rész hossza
    a végekhez viszonyítva
  * felszólító alakok kis száma miatt a kis előfordulású funkciók pozíciónkénti
    megbízhatóságának mérése nem értelmezhető.  Ez javítható lenne azzal, ha a
    szekvenciák átfedését megnövelnénk 75 vagy 90 százalékra.  A nagy nyelvi
    modell figyelembe veszik az automatikus pragmatikai annotáció során a
    rendelkezésre álló kontextust. A figyelmbe vett kontextus azonban sokkal
    kisebb, mint a humán annotátorok esetében feltételezett.

# 1 Intro

* elsődleges célja az volt, hogy a manuális annotálást megközelítő pontosságú

# 2 a korpusz annotációs sémáját, a manuális annotálás jellemzőit, valamint a
manuális annotálás pontosságát befolyásoló tényezőket.

* gyakorisága szerint!
  * Nodirectiva – nem hajtanak végre felszólítást, és a többi nem felszólító
    funkciót sem kapják meg. Ezek leggyakrabban kötőmódban álló igék, pl.
    Belefáradtam, hogy állandóan maszkot viseljek.
  * Saját hangú – a szöveg alkotója szólítja fel a szöveg olvasóját valamire,
  * Közvetített – olvasójára irányul, de a felszólítás forrása nem a szerző
    * a szövegalkotó egyet ért vele.  Pl. A szakértők szerint is viseljünk
  * Meta – amit valaki intézett valaki felé, de az nem a szöveg olvasója, vagy
    a szövegalkotó nem ért vele egyet (Az oltásellenesek azt akarják, hogy ne)
    * a szöveg szerzője csak beszámol egy felszólításról.
  * Szövegszervező – 
    * elsődleges funkciójuk azonban a figyelemirányítás, a szöveg
      koherenciájának megteremtése, pl. Lásd a következő példát!
    * lehet ugyan valamilyen felszólító erejük, 
  * Interakciós – a szöveg megértését segítő tevékenységgel, vagy a beszélő és a
    hallgató közötti viszonnyal kapcsolatos, pl. Gondoljunk csak bele! Hogy
    őszinte legyek...
  * Ambiguous – a fentebb megadottak közül több funkcióval is rendelkezhet.
* A korpusz maga 707 darab online elérhető nyilvános weboldalról származó
  hírszerű egészségügyi témájú szöveget tartalmazott, a korpusz összterjedelme
  kb. 370 000 token. A kézi annotálás során 2664 felszólító alak került
  címkézésre. Az annotálásban 22 annotátor és 2 kurátor vett részt, az
  annotátorok összmunkaideje kb. 400 óra volt.
* két másik jegy is jelölve lett (source: a felszólítás forrása; target: a)
  * ezek a gépi tanulási kísérletek során nem lettek figyelembe véve.
* A tágabb kontextus hatása például akkor jelentkezik, amikor egy hosszabb
  szövegben a felszólító alak megjelenési helyénél akár bekezdésekkel korábban
  jelzi a szöveg, hogy valakinek a véleményét idézi (például egy interjúban), és
  * a felszólítás erősségének, vagy akár a felszólítás meglétének a megítélése
    is eltérő lehet annotátoronként.
* sokkal kisebb az annotátorok közötti egyetértés mértéke, mint például a
  * annotátoroknak a kurátor által elfogadottól eltérő annotációja nem
    tekinthető feltétlenül annotálási hibának: az eltérések egy része
* az annotátorok átlagosan 0,824 pontossággal és 0,846 fedéssel dolgoztak, az F1
  értékek átlaga pedig 0,830 volt.
  * a kurátor által elfogadott annotációkat tekintettük helyesnek
* megpróbáltunk egy nagy nyelvi modellt finomhangolni az annotációs feladat
  * hogy egy olyan eszközt hozzunk létre, amely a manuális annotátorokhoz
    közelítő megbízhatósággal működik. Mivel 
  * a manuális annotáció megbízhatóságát befolyásoló egyik tényező a kontextus
  * az eszközön megvizsgáltuk a kontextus hatását is, ezt mutatjuk be

# 3 a huBert base finomhangolásának részleteit tárgyaljuk

* 50 %-os átfedés: ha egy annotálandó elem a szekvenciájának a legvégén
  helyezkedett el, és nem volt mellette kellő nagyságú jobboldali kontextus, a
  következő szekvenciában középtájon jelent meg, így megfelelő méretű kontextus
* a seqeval (Nakayama, 2018) Python modul használatával. A kiértékelésnél az

# 4.  szakasz különböző szekvenciahosszúságú tanítóadatokkal finomhangolt eszköz
annotációjának a pontosságát, fedését és F1 értékeit hasonlítjuk össze, amit

* kontextus növelésével javult az automatikus annotáció megbízhatósága. A
  javulás azonban kis mértékű, 0,80-ról 0,83-ra emelkedett csak az F1 értékek
  * minden verzió esetében, hogy összehasonlítható a humán annotátorok által
* A két leggyakoribb címke a tanítókorpuszban a nodirectiva és a saját hangú
  * A többi funkcióból egy nagyságrenddel kevesebb tanító adat állt rendelkezésr
  * meglepő ilyen szempontból, hogy a szövegszervező funkciót milyen magas
    * véges szókészletet használó funkció, amelynek a mintázatát néhány példa
  * Az egyes funkciók nem mutatják a súlyozott átlagon megfigyelhető monoton
  * A modell egyszer sem jelölt az ambiguous címkével, minden alkalommal, amikor
* más tanítási feltételek mellett egy nagyobb modell megbízhatóbb eredményeket
  mutatott volna-e. Gondolhatunk itt az 
  * epochok számának növelésére, amellyel egy sokkal időigényesebb tanulási
  * eltérő átfedés alkalmazására, hogy több tanulható adatpont szerepeljen a
  * tanítóadatok számának növelése lenne, ez azonban a jelenlegi helyzetben nem

# 5 felszólító alakok teszt szekvencián belül elfoglalt pozíciójának elemezése

* Várakozásunk szerint 
  * a szekvenciák közepén nagyobb megbízhatósággal osztályoz az eszköz, mint a
  * a maximális megbízhatóság a szekvencia közepétől jobbra lesz megfigyelhető,
    vagyis nagyobb bal oldali kontextus szükséges a helyes osztályozáshoz, mint
    * a megértés szempontjából előnyösebb, ha a bal oldali kontextus hordozza
      azokat az információkat, amelyek a megértéshez szükségesek. Például a
    * eg hogy egy felszólító alak nodirectiva, azaz kötőmódú-e, legtöbbször a
      felszólító alakot tartalmazó tagmondatot megelőző tagmondat igéje
    * jobb oldali kontextus is fontos lehet bizonyos esetekben, például idézé-
      sek esetében gyakran az idézett szövegrész után jelenik meg az idézést
* a vizsgált címkék a szó első tokenjének a pozíciójában lettek figyelembe véve.
* Másodfo-kú polinom illesztése esetén a kapott görbe a maximális értékhez
  viszonyítva szimmetrikus, ezért a bal és jobboldali kontextus hatásának a
* Harmadfokú polinomnál már látható ez a különbség is, ezért a grafikonoknál ezt
* Ötödfokú polinom esetében elég nagy pozíciónkénti címkeszámnál még jobban
  megfigyelhető az összefüggés, ezért ilyen közelítéseket is ábrázoltunk. A
* a széleken alacsonyabb értékek vannak, mint a szekvencia közepén. A
* aszimmetriát is mutatnak, mivel a maximális érték nem az szekvencia közepére
  * a szekvencia közepén található aránylag egyenletes szakasz bal oldalán
    hosszabb, de laposabb emelkedés van, a jobb oldalán rövidebb, de meredekebb
* a releváns bal/jobboldali kontextus mérete kb. 25–30/15--20 token hosszúságú,
* az egyes funkcióknál is megfigyelhető, bár különböző mértékben (5. ábra). A
  * nodirectiva értéknél nagyobb a kontextus hatása, mint a saját hangú
    értéknél, de a figyelembe vett kontextusok nagysága nem különböző. A
  * közvetített funkció grafikonján észrevehető, hogy az F1 értékek sokkal
    jobban szórnak, mint a másik funkciónál, és a regressziós görbe is jóval
    alacsonyabban van.
    * Ennek oka az, hogy a korpuszban sokkal kevesebb ilyen címkéjű elem
