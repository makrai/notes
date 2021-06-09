Big BiRD: A Large, Fine-Grained, Bigram Relatedness Dataset
  for Examining Semantic Composition
Shima Asaadi, Saif Mohammad, Svetlana Kiritchenko
NAACL 2019

http://saifmohammad.com/WebPages/Relatedness.html
* The Bigram Relatedness Dataset, visualizations of the data, and the annotation
  questionnaire

# Abstract

* we describe how we created a large, fine-grained, bigram relatedness dataset
  (BiRD), using a comparative annotation technique called Best–Worst Scaling
* Each of BiRD’s 3,345 English term pairs involves at least one bigram. We show
  that the relatedness scores obtained are highly reliable (split-half
  reliability r= 0.937). We analyze the data to obtain insights into bigram
  semantic relatedness. Finally, we present benchmark experiments on using the
  relatedness dataset as a testbed to evaluate simple unsupervised measures of
  semantic composition. BiRD is made freely available to foster further research
  on how meaning can be represented and how meaning can be composed

# 1 Introduction

* semantic relatedness is central to the use and understanding of language
  (Hutchison, 2003; Mohammad and Hirst, 2005; Huth+ 2016). Manual ratings of
* Existing datasets, e.g. Finkelstein+ (2002), only on pairs of unigrams
* Existing datasets also suffer from shortcomings due to the annotation schemes
  * Except in the case of a few small but influential datasets, such as those by
    Miller and Charles (1991) and Rubenstein and Goodenough (1965), annotations
  * obtained using rating scales.  (Annotators were asked to give scores for
    each pair; usually on a discrete 0 to 5 scale.) Rating scales suffer from
  * inconsistencies in annotations by different annotators,
  * inconsistencies in annotations by the same annotator,
  * scale region bias (annotators often have a bias towards a portion of the sc)
  * problems associated with a fixed granularity (Presser and Schuman, 1996)
* Best–Worst Scaling (BWS) addresses these limitations by
  employing comparative annotations
  (Louviere, 1991; Cohen, 2003; Louviere+ 2015; Kiritchenko and Mohammad, 2017)
  * Annotators are given n items at a time (commonly n = 4)
    * They are asked which item is the best and which is the worst. 1
  * At its limit, when n = 2 (Thurstone, 1927; David, 1963) a much larger set of
    tuples need to be annotated (closer to N 2 ).  505
  * working on 4-tuples, best–worst annotations are particularly efficient
     because each best and worst annotation will reveal the order of five of the
     six items
  * annotating 2N 4-tuples is sufficient for obtaining reliable scores
    (where N is the number of items)
    (Louviere, 1991; Kiritchenko and Mohammad, 2016)
  * Kiritchenko and Mohammad (2017) showed through empirical experiments that
    BWS produces more reliable and more discriminating scores than those
    obtained using rating scales. 2
  * This is the first time BWS has been used to create a dataset for sem relness
* we created several pairs of the form AB–X, where X is a unigram or bigram. As
  X’s we chose terms from a diverse set of language resources:
  * terms that are transpose bigrams BA (taken from occurrences in Wikipedia);
  * terms that are related to AB by traditional semantic relations such as
    hypernymy, hyponymy, holonymy, meronymy, and synonymy (taken from WordNet);
  * terms that are co-aligned with AB in a parallel corpus
    (taken from a machine translation phrase table)
    * co-aligned terms can be related to varying degrees (from unrelated to
      synonymous), thereby making them a
    * useful source of term pairs to include in relatedness datasets
* The dataset includes 3,345 term pairs corresponding to 410 ABs. We refer to
  this dataset as the Bigram Relatedness Dataset (or, BiRD)
* we obtain real-valued scores of semantic relatedness for each pair using
  simple arithmetic on the counts of how often an item is chosen best and worst
  (Orme, 2009; Flynn and Marley, 2014). (Details in Section 3.) To evaluate the
* we determine the consistency of the BWS annotations
  * A commonly used approach to determine consistency in dimensional annotations
    is to calculate split-half reliability (Cronbach, 1951)
  * our annotations have a split-half reliability score of r = 0.937
    (Details in Section 4.)
* We use BiRD to
  * obtain insights into bigram semantic relatedness, and
  * to evaluate automatic semantic composition methods

## Examining Bigram Semantic Relatedness:

* research questions remain unanswered, including: What is the distribution and mean of the semantic relatedness between a bigram and its transpose?
  * average semantic relatedness between a bigram and its hypernym?
* In Section 5, we present an analysis of BiRD to obtain insights into these

## Evaluating Semantic Composition:

* A common approach to evaluate words vectors is through their ability to rank
  pairs of words by closeness in meaning
  (Pennington+ 2014; Levy and Goldberg, 2014; Faruqui and Dyer, 2014).  BiRD
  allows for the evaluation of semantic composition methods through their
* In Section 6, we present benchmark experiments on using BiRD as a testbed to
* questions such as:
  * Which common mathematical operations for vector composition capture the
    * additive models performed best and that giving more weight to the modifier
  * Which of the two words in a noun phrase bigram (the head noun or the
    modifier) has greater influence on the semantics of the bigram?

## Contributions: The contributions of this work can be summarized as follows:

* We analyse BiRD to obtain insights into semantic relatedness when it involves
  bigrams
* We also develop interactive visualizations that allow for easy exploration of
  the data.  (Available on the project webpage.)

# 2 Background and Related Work

## Bigram Semantic Similarity Datasets:

* Mitchell and Lapata (2010) created a
  * 324 bigram pairs. The terms include adjective–noun, noun–noun, and verb–object
  * Annotators were asked to choose an integer between one and seven, indicating
    a coarse semantic similarity rating
* Turney (2012) compiled a dataset of synonyms and non-synonyms (binary)
  * 2,180 bigram–unigram synonym pairs from WordNet synsets
    * bigrams are either noun–noun or adjective–noun phrases
  * Other pairs were created taking bigrams and words that do not exist in the
    same synsets

## Other Similarity Datasets

* between sentences and between documents (Marelli+ 14; Agirre+ 14; Cera+ 17)

## Other Natural Language Datasets Created Using BWS: BWS has been used for

* relational similarity (Jurgens+ 2012)
* word-sense disambiguation (Jurgens, 2013)
* word–sentiment intensity (Kiritchenko and Mohammad, 2016)
* word–emotion intensity (Mohammad, 2018b)
* tweet–emotion intensity (Mohammad and Kiritchenko, 2018).  The largest BWS
* the NRC Valence, Arousal, and Dominance Lexicon, which has
  * valence, arousal, and dominance scores for over 20,000 English words
    (Mohammad, 2018a)

# 5 Studying Bigram Semantic Relatedness

* questions
  * If both AB and BA are common English bigrams, then
    what is the average semantic relatedness between AB and BA?
  * What is the range of semantic relatedness between a bigram and its hypernym
    * How do these averages and standard deviations vary with respect to the
      different semantic relations?
  * the distribution of semantic relatedness values for co-aligned terms?
* e.g. for the term
  * ageing population,
    * the most related term is ageing society—a co-aligned term in the phrase tb
      (Other co-aligned terms have lower relatedness scores.)
      The transpose bigram population ageing is also marked as highly related
      * WordNet does not provide a synonym for ageing population. For the term
  * adult female,
    * the WordNet synonym and the transposed bigram (BA) are marked as most reld
    * the WordNet-provided hyponym amazon is marked as less related. BiRD can be
* each individual relation and sorted by relatedness scores to
  determine other example pairs that seemingly should be closely related, but
  are not highly semantically related in the perception of the average English
  speaker, e.g. subject area–discipline (WordNet synonym) and
  frying pan–spider (WordNet hyponym). The
* AB–BA pairs with low relatedness, such as law school–school law,
  home run–run home, and traffic light–light traffic
  * especially useful in testing whether measures of semantic composition
    generate suitably different representations for the terms in such pairs
* Table 3 shows the average semantic relatedness scores as well as std for the
  * avg: Wikipedia transpose > WordNet synonym > WordNet is-a > WordNet part-whole >
    PhraseTable co-aligned
  * std:
    * low for the transpose bigrams, indicate that these pairs are closely reled
    * markedly higher for the other sources of word pairs
    * Manual examination of such pairs (especially those involving WordNet
      synonyms) revealed that this is often because one of the terms might be
      related to the other in a rare sense (such as in the amazon example). The
    * high for hypernyms, hyponyms, meronyms, and holonyms
      * these pairs can still exhibit a wide range of semantic relatedness
    * indicate that 95% of the co-aligned pairs have semantic relatedness
      between 0.09 and 0.83 (a wide interval). Manual examination revealed that
      the lowest score pairs were unrelated and the highest score terms were
      often synonymous. Thus co-aligned pairs from phrase tables are indeed
      * a good source of term pairs for a semantic relatedness dataset, since

# 6 Evaluating Methods of Semantic Composition on BiRD

* how these word vectors can be composed to create representations for larger
  units of text such as phrases and sentences
  (Mitchell and Lapata, 2010; Baroni and Zamparelli, 2010; Socher+ 2012;
  Tai+ 2015)
  * Kai Sheng Tai, Richard Socher, and Christopher D.  Manning. 2015
    Improved semantic representations from tree-structured LSTM networks. In
    ACL-IJCNLP
  * sentences (Le and Mikolov, 2014; Kiros+ 2015; Lin+ 2017), there is
  * relatively less work on how best to compose the meanings of two words to
* unigrams: rank pairs of words by closeness in meaning
  (Pennington+ 2014; Levy and Goldberg, 2014; Faruqui and Dyer, 2014). BiRD
* We test three vector space models to obtain word representations:
  * GloVe (Pennington+ 2014), fastText (Grave+ 2018), and
    a traditional model based on matrix factorization of a word–context
    co-occurrence matrix (Turney+ 2011)
* four mathematical composition operations:
  * vector addition,
  * element-wise vector multiplication,
  * tensor product with circular convolution (Widdows, 2008), and
  * dilation (Mitchell and Lapata, 2010)
* head and modifier: In adjective–noun and noun–noun bigrams, the second word
  * We test the performance of two baseline methods: the vector for the 1st/2nd

## Word representations: We use

* GloVe word embeddings pre-trained on 840B-token CommonCrawl corpus and
  fastText word embeddings pre-trained on Common Crawl and Wikipedia using CBOW
* traditional model, we use the exact word–context co-occurrence matrix
  described in Turney+ (2011). 18 They created the matrix from a corpus of 5 ⇥
  * The rows correspond to terms (single words from WordNet) and the
    columns correspond to contexts (single words from WordNet
    appearing to the left or to the right of the term).  Each
  * positive pointwise mutual information between the term and the context. The
  * matrix is decomposed to U d ⌃ d V d > (d denotes dimensionality) via
  * We set parameter p to 0.5, and the dimensionality of word vectors to d = 300

## Unsupervised Compositional Models: For a bigram w 1 w 2 , let u 2 R 1⇥d and v

* Addition (Salton and McGill, 1986): add the two word vectors (p = u + v)
* Multiplication (Mitchell and Lapata, 2010): element-wise multiplication of
  the two vectors (p = u v, where p i = u i · v i )
* Tensor product with convolution (Widdows, 2008): outer product of two vectors
  resulting in matrix Q (q ij = u i v j ). Then, circular convolution is applied
  to map P Q to vector p.  This is equivalent to: p i = u j · v i j .  j
* Dilation (Mitchell and Lapata, 2010): decompose v to parallel and orthogonal
  components to u, and then stretch the parallel P component u
  * We set the dilation factor to 2
* two baseline experiments that do not employ vector composition,
  * head only: p = v and modifier only: p = u

## Semantic Relatedness: The relatedness score for a term pair AB–X in the

## Evaluation: As evaluation metric, we use the Pearson correlation of the

* To determine if the differences between the correlation scores are
  statistically significant, we perform Steiger’s Z significance test
  (Steiger, 1980)

## Results: Table 4 shows the results. Observe that among the three methods of

* embeddings: fastText (word–context matrix factorization model being a close)
* composition, the additive models perform best (for all three embeddings).  The
  * statistically significantly higher than those of the second best (dilation)
  * multiplication and tensor product with convolution perform poorly (even
    significantly worse than the baseline methods)
* copar to previous work
  * differ substantially from the observations by Mitchell and Lapata (2010)
    * multiplication model showed the best results, markedly outperforming the
      addition model. Our results are
  * consistent with the findings of Turney (2012), where too the
    * addition model performed better than the multiplication model. It should
  * Mitchell and Lapata (2010) and Turney (2012) datasets have scores for
    semantic similarity. Further work is required to determine whether certain
    composition models are better suited for estimating one or the other
* Surprisingly, the baseline model obtains significantly better results than the
  * To better understand this, we compute relatedness correlations using the
    weighted addition of the two word vectors (p = ↵u + (1 ↵)v), where ↵ is a
    parameter that we vary between 0 and 1, in steps of 0.1. Figure 2 shows the
    results. Observe that giving more weight (but not too much weight) to the
    * ↵ = 0.7 and ↵ = 0.8 produce the highest correlations
    * These results raise further questions under what conditions is the role of
      the modifier particularly prominent, and why. We leave that for future

# 7 Conclusion

* future, short term, it will be interesting to explore the use of supervised
  semantic composition methods, including resources and models such as BERT
  (Devlin+ 2018) and ELMo (Peters+ 2018), to determine bigram relns
