# Abstract

* pragmatikai jellemzők annotálása során nagy kontextust kell figyelembe venni.
* ? egy pragmatikai jellemző automatikus annotálása során 
  milyen hatással van a rendelkezésre álló kontextus nagyságának a változása. A
* manuálisan rögzített pragmatikai annotáció a felszólító alakok funkcióinak
  kategorizálására. A korpusz segítségével a huBert base nagy nyelvi modellt
* a modell az annotálás során milyen mértékben támaszkodik a rendelkezésre álló
  kontextusra. A kontextuális hatást kétféleképpen vizsgáltuk: 
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
  * Minél hosszabb a szekvencia, annál nagyobb a középső rész hossza a végekhez
    viszonyítva.  A korpuszban levő 
  * felszólító alakok kis száma miatt a kis előfordulású funkciók pozíciónkénti
    megbízhatóságának mérése nem értelmezhető.  Ez javítható lenne azzal, ha a
    szekvenciák átfedését megnövelnénk 75 vagy 90 százalékra.  A nagy nyelvi
    modell figyelembe veszik az automatikus pragmatikai annotáció során a
    rendelkezésre álló kontextust. A figyelmbe vett kontextus azonban sokkal
    kisebb, mint a humán annotátorok esetében feltételezett.
