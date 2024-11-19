# Bibliographical and Historical Notes

* As we discussed in Chapter 3, the earliest language models were the n-gram
  language models developed (roughly simultaneously and independently) by
  * Fred Jelinek and colleagues at the IBM Thomas J. Watson Research Center,
  * James Baker at CMU. It was
  * term LM coined by Jelinek and the IBM team
    * to mean a model of the way any kind of linguistic property (grammar,
      semantics, discourse, speaker characteristics), influenced word sequence
      probabilities (Jelinek+ 1975)
    * contrasted the language model with the acoustic model which captured
      acoustic/phonetic characteristics of phone sequences.
* N-gram language models were very widely used over the next 30 years and more,
  * tasks like speech recognition and machine translations, often as one of
    multiple components of the model
  * contexts grew longer, with 5-gram models used quite commonly by very
    efficient LM toolkits (Stolcke, 2002; Heafield, 2011).
* The roots of the neural language model lie in multiple places
  * in the 1990s, again in Jelinek’s group at IBM Research, of discriminative
    classifiers to language models.
  * Roni Rosenfeld in his dissertation (Rosenfeld, 1992) first applied
    logistic regression (under the name maximum entropy or maxent models) to
    language modeling in that IBM lab, and published a more fully formed
    version in Rosenfeld (1996)
    * integrated various sorts of information in a logistic regression
      predictor, including n-gram information along with other features from
      the context, including distant n-grams and pairs of associated words
      called trigger pairs. Rosenfeld’s model prefigured modern language models
    * a statistical word predictor trained in a self-supervised manner simply
      by learning to predict upcoming words in a corpus.
  * pretrained embeddings to model word meaning in the LSA/LSI models
    (Deerwester+ 1988)
    * Recall from the history section of Chapter 6 that 
    * in LSA a term-document matrix was trained on a corpus and then 
      singular value decomposition was applied and 
      the first 300 dimensions were used as a vector embedding 
    * Landauer+ (1997) first used the word “embedding”
    * LSA embeddings combined with n-grams in an integrated language model
      (Bellegarda, 1997; Coccaro and Jurafsky, 1998).
* influential series of papers developing the idea of neural language models,
  (Bengio+ 2000; Bengio+ 2003; Bengio+ 2006), Yoshua Bengio
  * drew on the central ideas of both these lines of self-supervised LM work,
    (the discriminatively trained word predictor, and the pretrained
    embeddings).
    * Like the maxent models of Rosenfeld, Bengio’s model used the next word in
      running text as its supervision signal.
    * Like the LSA models, Bengio’s model learned an embedding, but
    * unlike the LSA models did it as part of the process of language modeling.
  * a neural language model: a neural network that learned to predict the
    next word from prior words, and did so via learning embeddings as part of
    the prediction process.
* extended in various ways over the years, perhaps most importantly in the form
  * the RNN language model of Mikolov+ (2010) and Mikolov+ (2011).
    * perhaps the first neural model that was accurate enough to surpass the
      performance of a traditional 5-gram language model.
  * Mikolov+ (2013a) and Mikolov+ (2013b) proposed to simply the
    hidden layer of these neural net language models to create pretrained
    word2vec word embeddings.
* pretraining with LM obj
  * The static embedding models like LSA and word2vec instantiated a particular
    model of pretraining: a representation was trained on a pretraining
    dataset, and then the representations could be used in further tasks
  * Dai and Le (2015) and Peters+ (2018) reframed this idea by proposing
    models that were pretrained using a language model objective, and
    * then the identical model could be either/or
      * frozen and directly applied for language modeling 
      * further finetuned still using a language model objective
    * For example ELMo used a biLSTM 
      self-supervised on a large pretrained dataset using a LM objective, then
      finetuned on a domain-specific dataset, and 
      then froze the weights and added task-specific heads.
* Transformers were first applied
  * as encoder-decoders (Vaswani+ 2017) and then to
  * masked language modeling (Devlin+ 2019) 
    (as we’ll see in Chapter 13 and Chapter 11)
  * GPT2 (Radford+ 2019) 
    * a transformer-based autoregressive language model
    * performed zero-shot on many NLP tasks like summarization and QA
* foundation model
  * The technology used for transformer-based language models can also be
    applied to other domains and tasks, like vision, speech, and genetics.
  * the term foundation model is sometimes used as a more general term for this
    use of large language model technology across domains and areas, when the
    elements we are computing over are not necessarily words.
  * Bommasani+ (2021) is a broad survey of the opportunities and risks
    * special attention to large language models.
