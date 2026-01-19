Contrastive Audio-Language Learning for Music
Ilaria Manco, Emmanouil Benetos, Elio Quinton, György Fazekas
ISMIR 2022 arXiv:2208.12208 [cs.SD]

* natural language has the potential to mediate in Music Information Retrieval
* we explore cross-modal learning in an attempt to bridge audio and language in
  the music domain. To this end, we propose
  * MusCALL, a framework for Music Contrastive Audio-Language Learning
  * a dual-encoder architecture that learns the alignment between pairs of music
    audio and descriptive sentences, producing
  * multimodal embeddings that can be used for text-to-audio and audio-to-text
    retrieval out-of-the-box. Thanks to this property, MusCALL
  * can be transferred to virtually any task that can be cast as text-based
    retrieval
* experiments show that our method performs
  significantly better than the baselines at retrieving
  * audio that matches a textual description and, conversely,
  * text that matches an audio query. We also demonstrate that the
* zero-shot transfer scenario for genre classification and auto-tagging
  on two public datasets
