Magyar szövegek pszicholingvisztikai indíttatású elemzése számítógéppel
Prószéky Gábor, Indig Balázs
2015

# 1. Bevezetés

* párhuzamosan jelen lévő szálak (morfológiai elemző, különböző grammatikai
  jelenségeket azonosító szálak, korpuszgyakorisági szálak, anaforafeloldó
  szálak, fókuszazonosító szál stb.)

# 2. A performancia-alapú közelítés

* a nyelvi szerkezetek elemzés közbeni kiválasztása közben hozott döntéseink
  felül tudják bírálni a lexikont. A korábban kialakított nyelvi ismereteket
  összegző szótárakat és az eddig leírt szintaktikai mintázatokat adatbázisként
  használó szabályalapú elemzők és az egyes nyelvi konstrukciók korábbi
  gyakoriságára építő valószínűségi elemzők ezekre a „múltbéli” statisztikákra
  alapozva tudják meghozni döntésüket, az aktuális mondat „extra-lingvisztikai”
  (például adott esetben a elhangzás helyszínére vonatkozó) környezetét nem
  veszik figyelembe. (1. példa) Kiinduló hipotézisünk ugyanis az, hogy a
  nyelvhasználó fejében mindkét – a korábban megtanult szerkezetekre építő és
  az aktuális helyzet alapján döntéseket hozó – rendszer egyaránt él.

# 3. Pszicholingvisztikai és nyelvészeti motiváció

* Több mint negyven éve jelentek meg azok a megértési stratégiák, melyeknek már
  lehetett, vagy inkább lehetett volna számítógépes implementációjuk
* Bever (1970) megállapítása, hogy a megértési folyamat nem a generatív
  levezetési folyamat egyszerű megfordítása. Ő stratégiákat adott meg, melyek
  olykor egymással versengve, és valószínűségi alapon működtek. Mi több, az
  elméleti nyelvészetben a mai napig uralkodó szemléletnek meglehetősen
  ellentmondóan felülbírálható, azaz nemmonoton folyamatokként vezette be
  ezeket. Már Bevernél megjelenik a hatékony elemezhetőség gyakoriságra való
  visszavezetése mellett a lassabb, de olykor megkerülhetetlen nyelvtani
  szabályrendszer használata
* Kimball (1973) algoritmizálta az addigi ismereteket, és gyakorlatilag egy
  számítógépes elemzési stratégiát foglalt össze hét pszicholingvisztikai elv
  segítségével. Az ő közelítése természetesen nem volt független az akkor
  egyeduralkodó generatív grammatika gondolataitól és az emberi nyelv
  szinonimájaként használt angol nyelvtől.
* Frazier és Fodor (1978) aztán a nehezen elemezhető mondatok és a szerkezeti
  többértelműségek vizsgálata közben mondatelemzéshez olyan stratégiai
  közelítést javasolt, melyben az egyes nyelvi elemek mondatbeli szerepének
  meghatározásához nem mindig elegendő az aktuálisan rendelkezésre álló
  információ, ezért a végleges döntést olykor a bemenet _továbbolvasásával_, azaz
  bizonyos késleltetéssel lehet csak meghozni.
* A nyolcvanas évekre kialakuló interakciós megértései modellek (bemutatja:
  Pléh, 1998) hoznak az eddigi eredményekhez képest új gondolatokat is. Az
  egyik, hogy figyelnek a feldolgozás sebességére, másrészt észreveszik, hogy a
  _világismeret_ olykor az elemzés alsó szintjeinél is jelen van,
* nyelvi jelenségek is, melyek feldolgozását az imént bemutatott szintaktikai
  szerepek kialakításával egyidejűleg végzi a rendszer. Ilyenek például az
  * aktuális mondattagolás vagy a visszautalást tartalmazó, ún.
    * információnak ismertként és újként való megkülönböztetése
  * anaforikus elemek kezelése. Az előbbi
    * névmásfeloldásról, akár szinonim megjelölésről

# 4. Az pszicholingvisztikai motivációjú számítógépes elemzés alapjai

* egy analitikus grammatikán alapul: innen a neve is: AnaGramma
* szálak együttműködésének mellékhatása a morfológiai egyértelműsítés és a
  kombinatorikus robbanások idejében történő megelőzése

# 5. Az egyes nyelvi jelenségek kezelése az AnaGramma-rendszerben

* nemcsak a bemutatott „tisztán” morfológiai és szintaktikai relációkat leíró
  szálak, hanem akár
    * statisztikai információk, korpuszgyakoriságok
      * a gyakori szerkezetek sokszor elemzés nélkül, kész belső szerkezettel
        jelennek meg a feldolgozásban.
        * Informatikai szakszóval ezt gyorsítótárazásnak (angol
          szóhasználattal: cache- elésnek) mondanánk, ám a jelenség a
        * pszicholingvisztikában (idegen szakkifejezéssel „Gestalt” néven) jól
          ismert (Pléh & Lukács, 2001). Az emberi nyelvértelmezés esetében ezt
          egészleges feldolgozásnak nevezik. Így tároljuk az akár
        * több szóból álló tulajdonneveket, az idiómákat, de sokszor a nagyon
          gyakori tipikus nyelvi fordulatok szószerkezeteit is.
    * ontológiák, világismeretek is párhuzamosan tudnak működni külön-külön.
* A performancia viszont nem választható el más kognitív folyamatoknak a
  nyelvre gyakorolt hatásától (v.ö. Frazier & Fodor, 1978 és Pléh, 1998), ezért
  az első elemzési lépéstől kezdve az AnaGramma-módszer a nyelvi, és a
  modell kidolgozottságától függően bizonyos nyelven kívüli modulok
  (világismeret, hangulat stb.)
* A szerkezeti reprezentációk irányított élei – mint az illusztrációkból is
  látható – a függőségi nyelvtanokéra emlékeztetnek (Tesniére, 1957), a
  rendszer működése pedig azok inkrementális elemzéssel működtetett
  változataira (Menzel, 2013). Mivel a mondathatáron nem feltétlenül záródik
  le minden elemzési lépés, a részszerkezetek teljes összekapcsolása nem
  feltétlen egyetlen mondaton belül valósul meg.

# 6. Az AnaGramma-elemzés kialakítását célzó kutatási alprojektek

# 7. Összefoglalás

* hasonló rendszerekkel összehasonlítani. Az egyetlen olyan algoritmikus
  közelítés, ahol az elemzési teljesség igénye, és a párhuzamosíthatóság is
  megjelent, a szószakértő elemző, a Word Expert Parser (Small, 1983) volt. A
  WEP-ben az egyes szavak mint az akkoriban népszerű szakértői rendszer egy-egy
  modulja működött. Ezeknek a kicsiny programoknak az interakciója némiképp
  emlékeztet az AnaGramma-rendszer elemzési szálaira, ám a WEP működése
  elsősorban szemantikus, illetve fogalmi információkra épült
