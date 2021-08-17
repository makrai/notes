Improving Sentence Representations via Component Focusing
Xiaoya Yin, Wu Zhang, Wenhao Zhu, Shuang Liu  and Tengjun Yao
Appl. Sci. 2020, 10(3), 958; https://doi.org/10.3390/app10030958

# Abstract

* bidirectional encoder representations from transformers (BERT)
* different sentence components serve diverse roles in the meaning of a sent
  * subject, predicate, and object serve the most crucial roles
* [our] representation consists of a
  * basic part which refers to the complete sentence, and a
  * component-enhanced part: subject, predicate, object, and their relations
  * weight factor to adjust the ratio of the two parts to obtain the
* evaluate [on] semantic textual similarity and entailment classification
  * significant performance gain compared to other methods

# 1 Introduction

* applications of sentence representations: text classification [4], sentence
  similarity [5], question-answering [6], and information retrieval [7]
* Transformer [11] is a new network structure to replace the recurrent neural
  * directly obtains global information unlike the
    * RNN, which requires gradual recursion to obtain global information, and
    * CNN, which only obtains local information
  * outperforms RNN and CNN in NLP tasks such as machine translation and can
  * run in parallel, many times faster than RNN
  * Bidirectional encoder representations from transformers (BERT) [12] has
    * SOTA results in a wide array of NLP tasks
    * no independent sentence embeddings are computed, which makes it difficult
* standard sentence methods do not adequately address some linguistic propertys
* Thenmozhi+ [13] analyzed the text similarity between the
* Levy+ [14] generalized a skip-gram model from a linear context to a dep-based
* Ma+ [15] proposed a dependency-based convolution approach, making use of
  tree-based n-grams rather than sequential ones, thus utilizing nonlocal
  interactions between words to improve sentence modeling baselines on four
  sentiment and question classification tasks
* we developed component focusing BERT (CF-BERT), a
  modification of the pre-trained BERT network that uses a
  Siamese network structure to derive semantically meaningful sentence embeds
  via component focusing
* Our paper focuses on the similarity task
  * Sentences Involving Compositional Knowledge Semantic Relatedness (SICK-R)
  * Semantic Texture Similarity Benchmark (STS-B)), and then the
  * sentence representations obtained by training the similarity task SICK-R
    are directly used for the [entailment] task (SICK-E)

# 3 design of the method and training details

# 4 data sources, experimental details, experimental results, evaluation

# 5 discussion of the experiment

# Conclusion

* In future work, we will specifically analyze
  * different downstream tasks and
  * leverage other lexical and syntactic information, such as POS
    * Words with different POS are of varying importance in a sentence
      e.g. adverbs are much more crucial in sentiment analysis tasks)
