SimAlign: High Quality Word Alignments Without Parallel Training Data
  Using Static and Contextualized Embeddings 
Masoud Jalili Sabet, Philipp Dufter, François Yvon, Hinrich Schütze
Findings EMNLP 2020 2020.findings-emnlp.147

Abstract

* Word alignments are useful for tasks like
  statistical and neural machine translation (NMT) and
  cross-lingual annotation projection. 
* methods
  * Statistical word aligners perform well, as do methods that 
  * extract alignments jointly with translations in NMT. However, most
* hE require parallel training data and quality decreases as less training data
* We propose word alignment methods that require no parallel data.  The key idea
  * leverage multilingual word embeddings – both static and contextualized – for
    word alignment. Our multilingual embeddings are created from monolingual
    data only without relying on any parallel data or dictionaries. We find that
    alignments created from embeddings are 
* superior for four and comparable for two language pairs compared to those
  produced by traditional statistical aligners – even with abundant parallel
  data; e.g., contextualized embeddings achieve a word alignment F1 for
  English-German that is 5 percentage points higher than eflomal, a high-quality
  statistical aligner, trained on 100k parallel sentences.
