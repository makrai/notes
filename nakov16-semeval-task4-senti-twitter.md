P Nakov, A Ritter, S Rosenthal, F Sebastiani… -
SemEval-2016 task 4: Sentiment analysis in Twitter
2016 SemEval

* Few trends stand out among the participating systems
  * supervised learning methods used, there is
    * a clear dominance of methods based on **deep learning**, including
      convolutional neural networks and recurrent neural networks (and, in
      particular, long short-term memory networks)
    * kernel machines seem to be less frequently used than in the past, and the
    * use of learning methods other than the ones mentioned above is scarce
  * distant supervision is ubiquitous; this is natural, since
    * there is an abundance of freely available tweets labelled according to
      sentiment (possibly with silver labels only, e.g., emoticons)
  * embeddings [ word2vec ] or GloVe
  * a mix of by now obvious techniques, such as
    * negation scope detection
    * elongation normalization [repetitions of characters in messages)]
    * detection of amplifiers and diminishers
    * word n-grams, character n-grams, and POS ngrams
  * sentiment lexicons (alone or in combination with each other;
    general-purpose or Twitter-specific) is obviously still frequent
* In the next five subsections, we discuss ... the five subtasks,
  focusing on the techniques and tools
