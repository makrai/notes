Multilingual aspect clustering for sentiment analysis
Lucas Rafael Costella Pessutto; Danny Suarez Vargas; Viviane P Moreira
Knowledge-Based Systems Volume 192, 15 March 2020, 105339

# Abstract

* aspect-based sentiment analysis deals with
  extracting, clustering, and rating the overall opinion about the features
* models for aspect extraction can produce too many aspects
  * many of those relating to the same product feature. Hence,
* aspect clustering becomes necessary
  * Current solutions are monolingual
* we address the novel task of multilingual aspect clustering
  * Our method is unsupervised and
    relies on the contextual information of the aspects, which is represented by
    word embeddings. This representation allied with a suitable similarity
* experiments on two datasets with five languages
  * outperform monolingual baselines adapted to work with multilingual data
  * benefits of the multilingual approach compared to using languages in isolatn

# 1 Intro

* ABSA involves the following phases:
  * identify and extract entities in reviews;
  * identify and extract the aspects of an entity;
  * cluster similar aspects; and
    * The focus of our work is on the third phase, i.e., aspect clustering.
  * determine the polarity of the sentiment over the entities and the aspects.
* Aspect clustering
  * necessary because even SOTA aspect extraction techniques can produce an
  * because people use different words to express the same aspect of an entity
* combined use of multiple languages for sentiment analysis has proven useful
  * the distribution of reviews across languages is unbalanced —
  * some languages may have too few reviews, lacking the required volume of data
    to allow for sentiment-analysis algorithms to yield good results
    * it is useful to rely on languages with a greater density of reviews.
  * results are significantly better than when a single language is considered
    * [7] C. Banea, R. Mihalcea, J. Wiebe,
      Multilingual subjectivity: are more languages better? in:
      International Conference on Computational Linguistics, 2010, pp. 28–36.
* multilingual aspect clustering
  * Initially, the set of reviews is composed of reviews in three languages
    (English, Spanish, and Dutch) with the aspects already extracted
  * In our example, four clusters are formed: Food, Service, Ambience, & Restaur
  * sentiment value averaged across languages
* Existing solutions for aspect clustering are monolingual,
  i.e., even if they can be applied to different languages, they work with each
  language separately
* we combines unsupervised clustering, semantic term similarity, and word embeds
* experiments on two datasets
  * restaurant reviews written in English, Spanish, Russian, Dutch, and Turkish.
  * reviews on digital cameras written in English, German, Italian, Spanish, Fr
* two baselines [8,9] using machine translation
* our proposed clustering technique outperforms both baselines
  * advantageous compared to using each languages in isolation

# 2 background knowledge to multilingual aspect clustering algorithm

* vector representation of words
* medoid-based clustering algorithms
* distance measures.

# 3, related work

## aspect-based sentiment analysis

* approaches to aspect extraction can be classified into three main groups,
  * based on language rules [18–20],
  * based on sequence labeling models [21,22], and
  * based on topic models [23]. However, other works do not fit in only one of
    these categories as they combine resources from more than one approach
* SOTA approaches rely on more sophisticated architectures like
  recurrent neural networks such as LSTM, Bi-LSTM, Neural Attention Models, and
  Convolutional Neural Networks [9,26–29].
* in other languages. In 2016, SemEval released a multilingual dataset for ABSA.
  hE, none of the participating teams combining all languages together

## monolingual aspect clustering

## multilingual document clustering

* two steps. First, the
  * documents in the collection are represented in a language-independent
  * groups are formed based on document representations [40].
* Most monolingual techniques rely on the co-occurrence of words in documents.
  Thus, they are not suitable for the multilingual setting (disjunct vocabulary)
* approaches to multilingual document clustering into two groups, based on how
  they represent documents in a feature space.
  * Monolingual Feature Space Techniques aim to create a monolingual feature
    * machine translation systems to translate entire documents [41] or just
      chosen document features [42,43], while others can rely on multilingual
    * dictionaries [44,45] or thesauri [46] to create the monolingual feature
  * Multilingual Feature Space Techniques
    * map all the documents in a shared spac or to
    * extract language-independent features from the multilingual documents.
    * combine both strategies to represent the document collection [47]. Some
    * syntactic similarity [48,49]. However, these are
    * inapplicable if the languages have completely different alphabets.
    * comparable corpus [50] or topic modeling techniques [51].

## 3.4.  Research gap

* 24 surveyed related works in ABSA
  * aspect extraction or clustering
* all existing solutions are monolingual – i.e., even if they were tested on
  different languages, they work with each language separately
* the focus of multilingual document clustering has been to group news articles.
  * Review texts differ from news in the size of the documents and the features
  * for news, the most important features are nouns, noun phrases, and NER
* multilingual document clustering with multilingual features usually rely on
  dictionaries or comparable corpora in order to represent documents
  * not available for most language-pairs and domains
* Sentiment Analysis have focused on extending sentiment analysis to more langs,
  * generating language resources [52]
  * labels mapped across languages [53–55]
  * machine translation [7,56]
  * polarity classification, and not aspect extraction or clustering.
* that multilingual aspect clustering remained an unexplored research topic.
  Thus, to the best of our knowledge, we are the first to propose a solution

# 4 approach to the Multilingual Aspect Clustering

# 5 experimental evaluation, results and a discussion

# 7 conclusion
