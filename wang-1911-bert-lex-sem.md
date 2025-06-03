How Can BERT Help Lexical Semantics Tasks?
Yile Wang, Leyang Cui, Yue Zhang
arXiv:1911.02929 [cs.CL]

# Abstract

* with dynamic embeddings as word representations, train static embeddings
* improvements over traditional static embeddings on lexical semantics tasks,
  obtaining the best reported results on seven datasets

# 1 Intro

* Word embeddings are useful in two broad aspects
  * directly, to solve lexical semantics tasks, such as word sim and analogy
    * large interest to computational linguistic research
      (Faruqui+ 2015 Retrofitting; Kiela+ 2015a; Artetxe+ 2018)
      * Douwe Kiela, Felix Hill, and Stephen Clark
        EMNLP 2015a
        Specializing word embeddings for similarity or relatedness
      * Mikel Artetxe, Gorka Labaka, Iñigo Lopez-Gazpio, and Eneko Agirre
        CoNLL 2018
        Uncovering divergent linguistic information in word embeddings
          with lessons for intrinsic and extrinsic evaluation
  * as input representations to downstream tasks,
    * addressing sparsity issues of one-hot or indicator feature functions
* contextualized word representation such as
  * ELMo (Peters+ 2018)
  * GPT (Radford+ 2018, 2019)
  * BERT (Devlin+ 2019)
  * XLNet (Yang+ 2019) and
  * RoBERTa (Liu+ 2019) has been shown a more effective input representation
* "parameterization" of contextualized embeddings: In addition to a lookup,
  * a sequence encoding network such as RNN and SAN is also used
* several cheap methods to obtain static embeddings from dynamic embeddings
  * averaged over a large corpus
  * word vector parameters from the token embedding layer
  * these simple methods do not necessarily outperform trad static embeds
* We consider integrating dynamic embeddings into the training of static
  * we integrate BERT and skip-gram by using
    BERT to provide dynamic embed for center words during skip-gram training
  * advantage over skip-gram training is at least two-fold
    * polysemous words are represented using BERT embeddings, thereby resolving
      word sense ambiguities (Coenen+ 2019)
    * syntactic and semantic information over the entire sentence is integrated
      into the center word representation (Jawahar+ 2019; Clark+ 2019)
  * make use of both contextualized representation and co-occurrence info
* Experiments over a range of lexical semantics datasets show that
  our method outperforms the existing SOTA methods for training static embeds

# 2 Related Work

## Static Word Embeddings

* Skip-gram (SG) and continuous-bag-of-words (CBOW) are two models based on
  distributed word-context pair information (Mikolov+ 2013a). The former
  predicts the context words for a center word, while the latter predicts a
  center word using its context words
* Ling+ (2015) claims that not all the context are equal and considered
  word order in the skip-gram model
* Hall+ (2014) and Levy and Goldberg (2014a) further inject syntactic informa-
  tion by building word embeddings from the dependency parse trees over texts
* GloVe (Pennington+ 2014) learns word embeddings by factorizing global word
  co-occurrence statistics
* sense embedding (Chen+ 2014; Li and Jurafsky, 2015; Jauhar+ 2015). However,
  * Sujay Kumar Jauhar, Chris Dyer, and Eduard Hovy
    NAACL 2015
    Ontologically grounded multi-sense representation learning for semantic
    vector space models

## Dynamic Word Embeddings. Contextualized word representations have been shown

* useful for NLP tasks (Choi+ 2018; Xu+ 2019; Lin+ 2019)
* ELMo (Peters+ 2018) provides deep word representations generated from LSTM
  based language modeling,
* GPT (Radford+ 2018, 2019) improves language model pretraining based on
  Transformer (Vaswani+ 2017),
* BERT (Devlin+ 2019) investigates selfattention-network for deep
  bidirectional representations,
* XLNet (Yang+ 2019) takes a generalized autoregressive pretraining model based
  on Transformer-XL (Dai+ 2019)
* not model word co-occurrences directly, which has been shown important for
  distributed word embeddings. By integrating dynamic embeddings into the
  training of static embeddings, we

## Dynamically Calculating Context Vectors for Word Embeddings

* SynGCN (Vashishth+ 2019) use graph convolution network (GCN) to integrate
  syntactic context for learning context embeddings

# 5 Experiments

## 5.4 Results

* btw, can be that the syntax-based embedding encodes functional similarity
  rather than topical similarity (Komninos and Manandhar, 2016)
  * more suitable for the relation similarity tasks, including relation classes
    * “part-whole” (e.g., `<car, engine>` is more similar to `<hand, finger>`
      than `<bottle, water>`) and
    * “cause-purpose” (e.g., `<anesthetic, numbness>` is more similar to `<joke,
      laughter>` than `<smile, friendship>`)
* dynamic embedding models: the
  static token embeddings (e.g., BERT token ) and the average of output
  representations (e.g., BERT avg ) perform relatively close on word similarity
  * comparable results on some datasets such as WS353S and RW, and
  * better than traditional models on the SimLex-999 and SemEval-2012 datasets
  * underperform static baselines on datasets such as WS353, WS353R and MEN

# 6 Analysis

Below we investigate the main reason behind the effectiveness of our method

## Fine-grained Result

* word similarity results of some representative word pairs. Table 2
  * BERT token does not capture the relatedness of `<dividend, payment>` and
    `<murder, manslaughter>` due to lack of consideration of context
    * discrepancy between human judgement and model scoring
  * BERT avg further improves the performance
  * better results for word pairs that have higher co-occurrence prob
    * Almost all the models
    * For example, the phrase “benchmark index” and “board recommendation”
      appear 8 and 29 times in corpus, respectively
  * In addition, the same neighboring words appearing in more sentences may have
    more similar averaged contextualized representations, thus leading BERT avg
    to give higher similarity scores compared with human judgement
  * SynGCN tends to underestimate the relationship between word pairs
    * negative influence of differentiating syntactic contexts
  * Overall, the results of our model are closer to human judgement
* word analogy, we compare the performances of models according to different
  types of word pairs
  * Table 3 shows the results
  * BERT token performs relatively lower on “capital-country” and “city-state”
    compared to skip-gram because it does not model context information
  * BERT avg improves the results by a large margin, giving
    comparable results on grammatical related word analogy such as “plural”
    due to the use of sentential information
  * SynGCN performs relatively well on grammatical related word pairs
    * However, it does not perform well on “capital-country” and
      “nationality-adjective” word pairs compared with the sequential context
      based skip-gram model
  * In contrast, our model takes the advantages of these methods and gives the
    best overall performance

## Nearest Neighbors

* Table 4 shows the nearest neighbors to the word “while” according to cosine
  * traditional methods yield words that tend to co-occur with the word “while”,
    such as “preparing”, “still”, “taking” and “instead”
  * SynGCN: words that are semantically similar, i.e. related to time
  * our method: multiple conjunctions that have similar meanings to “while”,
    such as “whilst”, “whereas” and “although”

## Word Pairs Visualization

* Figure 3 shows the t-SNE (van der Maaten and Hinton, 2008) visualization
  results for word pairs with the male-female relationship
  * For example, the pronoun pair `<he, she>`, the occupation pair `<policeman,
    policewoman>` and the family relation pair `<grandpa, grandma>`
* Skip-gram, CBOW, GloVe, FASTTEXT and SynGCN baselines all capture the gender
  analogy through vector space topology to some extent, hE, inconsistency exists
* In contrast, the outputs of our method are highly consistent, better
  demonstrating the algebraic motivation behind skip-gram embeddings

## Attention Distribution Visualization. Figure 4

# 7 Conclusion

* Future work includes the investigation of sense embeddings and syntactic
  embeddings under our framework
