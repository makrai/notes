# Kivonat 

* A sclerosis multiplex (SM) a központi idegrendszer krónikus gyulladásos
  * az automatikus beszédföldolgozás relatíve egyszerû, olcsó és távoli módot
    nyújthat arra, hogy követhessük a betegek beszédprodukiójának változását.
* tanítóanyag mennyiségének és (főleg) változatosságának korlátozottsága (pl
  kevés beszélő), ami miatt általában 
  * nem praktikus egyetlen (end-to-end) mély hálót alkalmazni az SM
  * osztályozásra valamilyen hagyományosabb módszert (pl. SVM-et vagy véletlen
    erdőt) alkalmazunk, mély hálók beágyazásait használva jellemzőkként.
* mély jellemzők:  Egy korszerû mély háló (pl. wav2vec 2.0) esetén kézenfekvő a
  konvolúciós és a finomhangolt blokkok utolsó rétegét választani, azonban a
  * közbülső rétegek is hasznosnak bizonyulhatnak. Jelen tanulmányban azt
* ? a közbülső (belső) rétegekből vett beágyazások használatával javíthatunk-e
  az SM automatikus felismerésének pontosságán.
  * a 24 finomhangolt rejtett réteg mélyebben fekvő kb egyharmada bizonyult a
    leghasznosabbnak, statisztikailag
    szignifikáns javulást is eredményezve a blokkok utolsó rejtett rétegéhez
    képest
