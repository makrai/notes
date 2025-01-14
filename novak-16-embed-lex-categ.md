Beágyazási modellek alkalmazása lexikai kategorizációs feladatokra
Siklósi Borbála, Novák Attila
MSZNY 2016 Szeged, 2016. január 21-22

# 2. Folytonos disztribúciós szemantikai modellek

* poliszémia, illetve homonímia kezelésére ...  sikerrel alkalmazott módszerek
    1. Banea, C., Chen, D., Mihalcea, R., Cardie, C., Wiebe, J.:
        Simcompass: Using ... embeddings to assess cross-level similarity
        SemEval 2014
    3. Iacobacci, I., Pilehvar, M.T., Navigli, R.:
        Sensembed: Learning sense embeddings for word and relational sim
        ACL 2015 http://www.aclweb.org/anthology/P15-1010
    10. Trask, A., Michalak, P., Liu, J.:
        sense2vec A fast and accurate method for WSD in ... embeddings
        Under review as a conference paper at ICLR 2016

# 3. Kísérletek

CBOW, 300 dimenziós, 5 token sugarú mintavételezési ablakot

## 3.2. Előfeldolgozott szövegen tanított modell

* A másik modellben a korpusz szófaji egyértelműsített változatát használtuk
  * a szavak lemmáját tartottuk meg, melyek után,
    külön tokenként szerepeltek a morfológiai elemző által generált címkék ANA
* A 2. táblázat néhány példát tartalmaz az így kapott hasonlósági listákra
  * jól működik a szavak gyakoriságától függetlenül, hiszen a nagyon gyakori
    szavak nem előzik meg a szemantikailag jobban hasonló kifejezéseket
