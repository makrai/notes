# Abstract

* Llama-2 alapú modellt, amely folytatólagos előtanítást és utasításkövető
  finomhangolást alkalmaz a magyar nyelvi sajátosságok figyelembevételével. A
  * 66 000 angol és 15 000 magyar promptot tartalmazó adatbázist használtunk,
  * HuCOLA, HuSST és HuRTE teszteken – kimagasló teljesítményt nyújtott, a
  * zero shot tesztek során a HuCOLA teszten 66,98%-os, a HuSST teszten
    70,06%-os, míg a HuRTE teszten 74,54%-os pontosságot ért el, ami
    felülmúlja a korábbi modelleket.
* kvalitatív elemzéseket is végeztünk a modell teljesítményének mélyebb
  * magas szintű kontextuskezelő képességét például egy hosszú
    szövegkörnyezetben végzett keresési feladattal értékeltük, míg a
  * stílusérzékenységét különböző nyelvi regiszterekben tett próbákkal
    vizsgáltuk. Eredményeink alátámasztják, hogy a transzfertanulás révén a
  * jelentős tudást képes átvenni más nyelvekből is
