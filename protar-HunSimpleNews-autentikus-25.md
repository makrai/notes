# Abstract

* [eredeti és egyszerűsített] közötti kvantitatív különbségek és hasonlóságok,
* felmérjük az általunk elérhető, magyarul tudó nagy nyelvmodellek
  szövegegyszerűsítési képességét incontext tanítási környezetben. Cikkünkben
* az egyszerűsített szövegek és a standard nyelvi szövegek között 
  * lényeges különbségek: szavak varianciájában, mondatok hosszában
* a korpusz használata one-shot és few-shot tanítási környezetben is javítja a
  modellek egyszerűsített kimenetét a zero-shot eredményeinkhez képest.

# 1 Intro

* érthetővé tegyen nem prototipikus befogadók számára. 
  * a cikkben a 
    * Prototipikus befogadók alatt felnőtt, ép, anyanyelvi beszélőket értjük,
    * nem prototipikus: gyerekek, a nyelvtanulók, funkcionális analfabéták,
      illetve olyan testi vagy értelmi fogyatékos személyek, akiknek
      fogyatékossága hátráltatja őket egy adott, standard nyelvű diskurzus
      megértésében (demensek, afáziások, nyelvelsajátítás előtti halláskáro-
      sodásuk volt, stb.) (Maaß, 2020). Az tehát, hogy
  * nagyban megkönnyíti, vagy alapjában lehetővé teszi azt, hogy 
    mindennapi diskurzusokban részt vehessenek, valamint azt is, hogy a
    megfelelő információk eljussanak hozzájuk, és 
    azok önállóan feldolgozhatóvá váljanak számukra.
* A gyógypedagógiai szakirodalom az egyszerűsített szövegeket általában
  magyarul a _könnyen érthető szöveg_ vagy _könnyen érthető kommunikáció_
  * az informatikai hagyomány ezen szövegek előállítására _text
    simplification_-ként hivatkozik, így 
  * ez a tanulmány is konzekvensen a szövegegyszerűsítés terminust használja,
* != sem a szövegösszefoglalással, sem pedig a közérthetővé tételével
  * az egyszerűsített szövegekben lehetnek olyan részletek, amelyeket
    összefoglalunk a könnyebb megérthetőség érdekében, a 
  * szövegösszefoglalásnak a célja a szövegek hosszának csökkentése a
    felesleges információk elhagyásával (Shardlow (2014), Alva-Manchego és
    mtsai (2020)). 
  * A szövegegyszerűsítés ezzel szemben a szöveg bonyolultságának redukciójára
    * amennyiben ez azt igényli, hogy bizonyos fogalmakat megmagyarázzon, akkor
    * akár hosszabbak is lehetnek, mint a forrásszövegeik. 
  * A közérthető szövegek pedig prototipikus befogadók számára tesznek
    érthetővé olyan szövegeket, amelyek szakspecifikusak – a könnyen érthető,
* Jelen cikk az első olyan, magyar nyelvű hírszövegpárokból álló
  szövegegyszerűsítési korpuszt mutatja be, amely autentikus, tehát nem
  fordított, hanem eredetileg is magyarul írt adatokból áll. A korpusz
  * kutatási célra szabadon elérhető a Hugging Face Hubon2 . Cikkünkben először

# 2 a szövegegyszerűsítés eddigi és jelenlegi állását (2), ezután bemutatjuk 

## 2.1. A szövegegyszerűsítés megközelítései

## 2.2. Szövegegyszerűsítés nagy nyelvi modellek segítségével

# 3 a korpusz összeállítását (3), majd ismertetjük a korpuszon végzett, 

# 4 a két szövegdomaint összehasonlító vizsgálatok eredményeit (4), végül

# 5 a korpusz használatával, oneés few-shot tanítási környezetben végzett

# 6 rövid összefoglalás
