Ágens-alapú chatbot architektúra valós idejű vezetői Big Data lekérdezésekhez
Vándor Péter, és Csáki Csaba
MSZNY 2026 best paper candidate

# Kivonat

* A vállalatok, szervezetek működése során 
  a különböző területek – értékesítés, marketing, ügyfélszolgálat, ellátási
  láncok, IoT-eszközök, felhasználói interakciók – hatalmas mennyiségű adatot
* több milliárd rekordot tartalmazó Big Data adattárházak, OLAP kockák,
  dashboardok, elemzések 
  nehezen áttekinthető és sokszor csak bonyolultan lekérdezhető környezetet
  * vezetők számára kulcsfontosságú az azonnali, pontos, valós idejű információ
    a stratégiai döntések meghozatalához. A nagy nyelvi modellek (LLM)
* LLM: természetes nyelvi lekérdezés, de a pontos adatok szolgáltatása és a
  hallucinációk kiküszöbölése továbbra is kihívást jelent
* megoldás: az intelligens ágensre épülő, folyamat-vezérelt chatbot fejlesztés,
  * saját MCP (Model Context Protocol) eszközök biztosításával és széleskörű
    paraméterezésével lehetővé teszi a 
    valós idejű, részletes adat lekérdezést, grafikon rajzolást és adatelemzést.
  * A komplex lekérdezés-paraméterezés egy 
    kontrollált háttérfolyamat részeként valósul meg. E folyamat a végén egy
  * mondatokba foglalt válasszal szolgál. Az információszerzés során 
  * az ágens önállóan paraméterezi az adattárház lekérdezéseket, 
    szükség esetén visszakérdez vagy több lekérdezést is futtat.
  * jelentősen csökkenti a szükséges szakértelmet

# Abstract

* intelligens ágensek és az ezekre épülő megoldások. Habár 
  * az OpenAI 2025-öt kikiáltotta az ágensek évének (Altman, 2025), ennek
  * a technológia üzleti adoptálása lassan halad. Egy 
  * szervezeti környezetben kifejezetten erős szempont a pontosság az ágens
    * a nem megfelelően szabályozott, pontatlanul kontrollált ágensek
      üzletkritikus hibákat is elkövethetnek.
* MI ágensek olyan rendszerek, melyek bizonyos fokú autonóm... (Deng+ 2024)
* cég működése során rengeteg adat keletkezik folyamatosan, melyek feldolgozása,
  * kimenet: elemzés, dashboard, riport vagy más típusú kimenet is készülhet az
* LLM: egy újfajta interfész kialakítását, amellyel természetes nyelven
* Az LLM által közvetlenül, az adatforrás részletes ismerete nélkül írt
  függvények szuboptimális lekérdezési sebességet okoznának. 
  * A vállalatok feltehetően már rendelkeznek az adatbázis lekérdezésére
    függvényekkel, kódokkal. 
  * Nem ajánlott a nyelvi modellre bízni a lekérdezések megírását 
    még az egyre fejlődő kódolási képességeket figyelembe véve sem.
  * API-k vagy függvények közvetlen meghívásával kibővítik a lehetőségeket:
    * valós idejű keresésről, adatlekérdezésről, számítási módszerekről, vagy
      bármilyen a feladat megoldását támogató, az ágensnek új adatokat
      szolgáltató kódról vagy külső alkalmazásról (Sapkota+ 2025). Mivel az
* a megbízhatóság egyértelmű elvárás, ezért 
  ~> jelen kutatás fő célját a pontos válaszok biztosítása jelenti. További cél
* Javaslatunk középpontjában az integrált eszközhasználat jelenik meg, mint
  * a már meglévő szervezeti tudást 
    egy LLM ágens által felhasználható eszközzé konvertálni, ezáltal 
    megőrizve a korábbi determinisztikus folyamatok biztonságát. Lehetővé válik
    * természetes nyelven történő lekérdezése és a válaszok is így jelenhetnek
