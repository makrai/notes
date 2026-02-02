Mondatszintű határozatrész-címkézés magyar bírósági határozatokon
Csányi Gergely Márk, Üveges István 1,4Lakatos Dorina, Dóra Ripszám, 
  Kornélia Kozák, Nagy Dániel, Vadász János Pál
GriffSoft, Ludovika, ELTE Társadalomtudományi Kutatóközpont
MSZNY 2026 best paper candid

# Abstract

* a határozatban betöltött szerepe szerinti címkével lássa el (pl. 
  * tényállás, bírói érvelés, döntés, felek érvelése stb.), ezáltal 
  * támogatva többek között a szemantikus keresést, per kimenetelének
    predikcióját vagy az automatikus összefoglalást. A munkában 
* szakértők által kézileg annotált korpuszon hasonlítottunk össze több
  architektúrát (BiLSTM, Attention és BiLSTM+Attention) és egy lineáris SVM
  referenciamodellt, különböző beágyazási stratégiákkal (huBERT CLS vs. Jina v3,
  late chunkinggal és anélkül). 
* A címkekészlet nyolc osztályból állt.
* Eredményeink: a legjobb teljesítményt a 
  huBERT CLS beágyazásokkal táplált BiLSTM érte el, 
  mind dokumentumszintű pontosságban, mind (súlyozott és makró) F1-ben, érdemben
  * late chunking rontotta a mondatszintű RRL pontosságát, ami arra utal, hogy 
  * ie a túl tág dokumentumkontextus zajt vihet a mondatvektorokba. A rendszer
* már éles környezetben is működik: RAG-alapú jogi információkeresést támogat a
  magyar bírósági határozatokon

# 1 Intro

* magyar nyelvre még nem készült hasonló megoldás, nemzetközi szinten pedig a
  * angol (Bhattacharya+ 2019; Malik+ 2021; Bambroo+ 2025), pár 
  * nem angol mellett (Marino+ 2023; Aragy+ 2021). Ebben a munkában egy magyar
    bírósági döntéseken alkalmazható, élesben is működő RRL-osztályozót mutatunk
    be. Több architektúrát hasonlítunk össze (BiLSTM és Attention-alapú
* „late chunking” technikájának hatását is, amely 
  a széles kontextusablakú beágyazási modellek segítségével képes a
  szövegrészeket átívelően kontextust biztosítani. A modelleket jogi szakértők

    # 2 Rel work

* Aragy és mtsai (2021) 70 darab portugál nyelvű polgári jogi beadványt, tehát
  nem bírósági határozatot címkézett fel mondatszinten. A mondatokat a BERT CLS
* Marino és mtsai (2023) két korpuszon vizsgálódtak: egy kb. 
  * 1 500 olasz íté- letből álló ITA-RhetRoles korpuszon (5 címke) és a 
  * 275 dokumentumból álló BUILD angol korpuszon (13 címke), 96 ezer illetve kb
