HuBERTUSz: Alacsony paraméterszámú transzformer modellek létrehozása és eval hu
Ficsor Tamás, Berend Gábor
XIX. Magyar Számítógépes Nyelvészeti Konferencia Szeged, 2023. január 26–27.

# Kivonat 

* modern előtanítási standardok (pl. dinamikus maszkolás, mondatsorrend-pred)
* közzétesszük az általunk előállított tiny, small és medium
  transzformervariáns
* alapos kiértékelésnek vetettünk alá különböző feladatokon
* Eredményeinkből kitűnik, hogy elsődlegesen a tokenosztályozási feladatokon a
  jóval kisebb paraméterszámmal bíró modellvariánsaink is képesek megközelíteni
  a nagyságrendekkel több paraméterrel bíró társaik eredményeit.

# Kulcsszavak: Kompakt modellek, Előtanítás, NER, POS, sentiment, entail

# 1 Intro

* mennyi paraméterrel oldható meg kellő minőségben egy bizonyos feladat, erősen
  * függ a feladat komplexitásától, továbbá adat mennyiségétől és minőségétől
    (McCoy+ 2019; Bhargava+ 2021)
* A nyelvi modellek tipikusan több különböző méretkonfigurációban (Turc+ 2019)
  * konfiguráció: a rétegek számát, fejek számosságát és a vektorok dimenzióját
  * egyik legelterjedtebb konfiguráció a magyarra is elérhető ún. alap (base),
    amely ∼ 110 millió paramétert tartalmaz.
* Sok esetben „ágyúval lövünk verébre”: nagyságrendekkel több paraméter
* modelljeinknek a Hungarian BERT from University of Szeged nevet adtuk, amit

# 2 Kapcsolódó irodalom

* A transzformerek (Vaswani+ 2017; Devlin+ 2019)
  * kép-, hang-, és kódfeldolgozási (Dosovitskiy+ 2020; Hsu+ 2021; Feng+ 2020)
* A magyar nyelvvel előtanított egy~ és több nyelvet is támogató transzformer
  * egynyelvű, kizárólag a magyar nyelv feldolgozására létrehozott MLM-et végző
    * Nemeskey, 2020, 2021
    * Feldmann+ 2021
    * Yang, 2022a BARTerezzünk! messze, messze, messze a világtól, BART
    * Yang & Váradi, CogInfoCom 2021 LMs with low resrc: RoBERTa, BART &
      ELECTRA 
    * Ficsor+ 2022 Charmen electra tokenizációmentes diszkriminatív LM
    * Orosz+ 2022 HuSpaCy: an industrial-strength Hungarian NLP toolkit
    * Yang+ 2022 HILBERT, magyar nyelvű BERT-large modell tanítása felhő
    * Yang, 2022b _Az invazív medvék nem tolerálják a s_ GPT-2 kísérleti modell
* több nyelvet, a magyart is támogató modellek
  * mBERT (Devlin+ 2018), XLM-RoBERTa (Conneau+ 2020) és RemBERT (Chung+ 2020)
  * Az mBERT egy klasszikus BERT modell, ami 104 nyelven lett tanítva. Az
  * XLM-RoBERTa, a RoBERTa (Liu+ 2019) előtanítási mechanizmusát követő, 100
    nye
  * A RemBERT esetén a be~ és kimeneti beágyazások szétválasztására tettek
    * általában ezek a súlyok meg vannak osztva egymás között), és
    * külön dimenzióméreteket rendelnek azokhoz
    * a generalizációját a modellnek tudják befolyásolni. Ez a modell
    * a finomhangolás során a paraméterek száma jelentősen csökkenthető a
      kimeneti beágyazás eldobásával.
* arany és ezüst minőségű annotációval ellátott adathalmaz magyar nyelvre
  * Névelemfelismeréshez a SzegedNER (Szarvas+ 2006), NerKor (Simon és Vadász,
    2021) és a NerKor 1.41e (Novák és Novák, 2022),
  * szekvenciaosztályozáshoz egyebek mellett az OpinHuBank (Miháltz, 2013) egy
    gyakran használt adathalmaz, amelyben
    * egyes személyekhez kapcsolódó szentimentkategóriát kell prediktálni, azok
      szövegkörnyezetének függvényében
  * További kiértékelési lehetőségeket biztosít a HuLU (Ligeti-Nagy+ 2022,
    Hungarian Language Understanding Benchmark Kit), ami 6 adathalmazt
* A magyar nyelvi erőforrások kiértékelésére több munka is született már
  * Ács+ (2021) a HuBERT modellt vetette össze 4 további többnyelvű modellel
    névelemfelismerési, szófaji és morfológiai egyértelműsítési feladatokon. Az
    * rétegekre bontva is megvizsgálták, ami elég nagy mélységet ad az eredmény
  * Simon+ (2022) a NerKor és SzegedNER korpuszok alkalmazását járja körbe
    különböző ipari minőségű nyelvi keretrendszer (vagy modell) alkalmazásával
