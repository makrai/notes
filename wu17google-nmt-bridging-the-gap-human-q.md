Yonghui Wu, M Schuster, Z Chen, Q V. Le, NMW Macherey, M Krikun, Y Cao, Q Gao,
  K Macherey, J Klingner, A Shah, M Johnson, X Liu, Ł Kaiser, S Gouws, Y Kato, 
  T Kudo, H Kazawa, K Stevens, G Kurian, N Patil, W Wang, C Young, J Smith, 
  J Riesa, A Rudnick, O Vinyals, G Corrado, M Hughes, J Dean
Google’s Neural Machine Translation System: 
  Bridging the Gap between Human and Machine Translation
TACL 2017

#Abstract

* Our model consists of a deep LSTM network with 8 encoder and 8 decoder layers
  * residual connections as well as 
  * attention connections from the decoder network to the encoder. 
    * To improve parallelism and therefore decrease training time, 
      our attention mechanism connects the bottom layer of the decoder 
      to the top layer of the encoder
  * low-precision arithmetic during inference computations. To improve handling
  * wordpieces
    * we divide words into a limited set of common sub-word units 
      for both input and output
    * This method provides a good balance between the 
      * flexibility of “character”-delimited models and the 
      * efficiency of “word”-delimited models
  * beam search technique employs a length-normalization procedure and uses a
    * coverage penalty, which encourages [the output sentence] to cover all the
      words in the source sentence. To directly optimize the translation BLEU
  * we consider refining the models by using reinforcement learning, 
    but ... the improvement in the BLEU scores did not reflect in the human
    evaluation. On the 
* WMT’14 English-to-French and English-to-German benchmarks, GNMT achieves
  competitive results to state-of-the-art. Using a 
  * human side-by-side evaluation on a set of isolated simple sentences, it
    reduces translation errors by an average of 60% compared to Google’s
    phrase-based production system

#4 Segmentation Approaches

* two broad categories of approaches to address the translation of OOV words.
  * simply copy rare words (as most rare words are names or numbers) based on the 
    * attention model [37]
    * an external alignment model [31] or even 
    * a more complicated special purpose pointing network [18].  Another broad
  * sub-word units, e.g., 
    * chararacters [10]
      [10] Chung, J., Cho, K., and Bengio, Y. 
      A character-level decoder without explicit segmentation for NMT
      2016
    * mixed word/characters [28]
      [28] Luong, M., and Manning, C. D. 
      Achieving open vocabulary NMT with hybrid word-character models
      2016
    * more intelligent sub-words [38].
      [38] Sennrich, R., Haddow, B., and Birch, A. 
      Neural machine translation of rare words with subword units
      ACL 2016
