A magyar számítógépes nyelvészet története
Indig Balázs – Simon Eszter
G Tolcsvai Nagy ed 2025 Az élő Akadémia kétszáz éve: A nyelvtudomány és az MTA

# KORPUSZOK

* az uráli nyelvek megnyilatkozásaiból épített adatbázisok képezik, mint például
  az Ura­LuID adatbázis, 26 amely udmurt, hanti és tundrai nyenyec gyűjtések
  multimodális és sok szinten elemzett korpusza. A 
* nyelvjárási korpuszok legújabb példája a Csángó korpusz, 27 amely Tánczos
  Vilmos moldvai gyűjtésén alapul. 
* Történeti korpuszból több is van a magyar nyelvre: az 
  * Ómagyar Korpusz 28 tartalmaz minden ómagyar korból fennmaradt
    szövegemléket, valamint néhány középmagyar kori bibliafordítást, összesen
    3,2 millió szövegszót; a 
  * Történeti Magánéleti Korpusz 29 főként a középmagyar korra koncentrál, és a
    privát közlések stílusregiszterét kívánja reprezentálni; a 
  * Magyar Történeti Szövegtár 30 pedig már az újmagyar és az újabb magyar
    korból (1772-től napjainkig) tartalmaz válogatást.

# 4. ESZKÖZLÁNCOK

* több igény is megjelent: egyfelől az 
  * alapkutatás: az egyes modulok pontosságát és nyelvi minőségét tudományos
    igénnyel tökéle­ tesítették, másfelől pedig 
  * az ipar által támasztott mennyiség-, sebességés nyelvfüggetlenség-központú
  * olyan „univerzális” programok születtek akadémiai körökben, amelyek mindkét
    elvárásnak megpróbálnak megfelelni minden nyelven.
  * Ilyen volt a cseh UDPipe és a Stanford Egyetem elemzőlánca, a Stanza, 40
    amelyek a Szeged Dependency Treebank felhasználásával (lásd a 3. részt)
    hivatalosan is megkapták a magyar nyelv támogatását, de Magyarországon
    sosem terjedt el a használatuk igazán.
* Magyarlánc célja egy ipari környezetben is jól használható, kompakt,
  karbantartást nem igénylő, magyar nyelvre specializált eszköz volt, 41 máshol
  fejlesztett modulok, például az addig magyar nyelvre jól bevált morfológiai
  elemző és egyértelműsítő használatával (lásd a 2. részt). Később elindult az
* e-magyar projekt, 42 amely a meglévő legjobban teljesítő modulok integrációját
  tűzte ki célul, a technikai tudással nem rendelkező (zömében akadémiai)
  felhasználókat tekintve célközönségként. A második verziója, 
* emtsv néven, a `hun*` eszközlánchoz hasonlóan, moduláris fejlesztési
  módszereket követ. 43 Több mint 20 modullal rendelkezik, így a legszéleskörűbb
  magyar nyelvű eszközláncnak mondható, amely a mai napig használatos az olyan
  alapkutatásokban, ahol a speciális igények fontosabbak, mint a sebesség.
* A nagy nyelvmodellek előretörésének következtében ...  az ipar által
  preferált, kompakt és nyelvfüggetlen módszerek háttérbe szorították a
  nyelvspecifikus igényeket és az egyéni modulokat, így a domináns eszközlánc 
  * a huSpaCy lett, 44 amely sebességével emelkedett ki a mezőnyből. A
  * egy lépésben történik meg a szöveg mondatokra bontása, a mondat elemeinek
    morfoszintaktikai elemzése és a mondatok függőségi szintaktikai elemzése
    neurális algoritmusok segítségével, nincs valódi egymás­ utániság köztük,
    „end-to-end” rendszert képeznek. A HuSpaCy-ben a szófaj és a
    morfoszintaktikai információk kódjai egy a gépi modell által prediktált
    címkeként adódnak hozzá a korábban meghatározott tokenekhez.

# 5. ALKALMAZÁSOK

# Bib

* Prószéky Gábor 2012. A magyarországi számítógépes nyelvészet áttekintése.
  Általános Nyelvészeti Tanulmányok XXIV: 17–45.
* Prószéky Gábor 2021. A gépi fordítás hetvenéves története. In A korpusz-
  nyelvészettől a neurális hálókig: Köszöntő kötet Váradi Tamás 70.
  születésnapjára. Budapest: Nyelvtudományi Kutatóközpont. 141–156.
* Prószéky, Gábor – Kis, Balázs 1999. A Unification-based Approach to
  Morpho-syntactic Parsing of Agglutinative and Other (Highly) Inflectional
  Languages. 
  ACL 1999
* Prószéky, Gábor – Kis, Balázs 2002. Context-Sensitive Electronic Dictionaries.
  COLING 2002: The 17th International Conference on Computational Linguistics:
* Prószéky Gábor – Olaszy Gábor – Váradi Tamás 2003. Nyelvtechnológia
  Kiefer Ferenc – Siptár Péter (szerk.): A magyar nyelv kézi­ könyve. Akadémiai
* Sass, Bálint 2023. From a dictionary towards the Hungarian Constructicon. 
  Medved’ et al Electronic lexicography in the 21st century (eLex 2023)
