Alexander Panchenko, Johannes Simon, Martin Riedl and Chris Biemann
Noun Sense Induction and Disambiguation
  using Graph-Based Distributional Semantics
2016 KONVENS Conference on NLP, Germany

# Abstract

* sense representations obtained by clustering dependency-parse-based second-
  order similarity networks as a pivot. We then add features for disambiguation
  from heterogeneous sources such as window-based and sentence-wide
  co-occurrences, and explore various schemes to combine these complementary
  context clues. Our method reaches a
* performance comparable to the state-of-the-art unsupervised word sense
  disambiguation systems including
  * top participants of the SemEval 2013 word sense induction task and
  * a more recent state-of-the-art neural word sense induction system

# 2 Related Work

* unsupervised WSD methods fall into two categories:
  * context clustering (Pedersen and Bruce, 1997; Schütze, 1998) and
    * Multi-prototype extensions of the popular skip-gram model
      * commonly fitted with a disambiguation mechanism
      * (Huang+ 2012; Tian+ 2014; Neelakantan+ 2014;
        Bartunov+ 2016; Li and Jurafsky, 2015)
    * AI-KU system (Baskaya+ 2013)
    * Unimelb system by Lau+ (2013)
  * word (ego-network) clustering (Lin, 1998; Pantel and Lin, 2002;
    Widdows and Dorow, 2002; Biemann, 2006; Hope and Keller, 2013a)
      * Nodes of an ego-network can be
        * words semantically similar to the target word, as in our approach, or
        * context words relevant to the target, as in the UoS system
          (Hope and Keller, 2013a)

# 4 Results

## 4.2 Evaluation on TWSI

### Discussion of results

* Table 2
* none of our models was able to outperform the most frequent sense
* We assumed that this is due to the highly skewed nature
* To validate the hypothesis that our system yields stateof-the-art performance
  in spite of this result  we compared its performance to ... AdaGram (Bartunov
 + 2016)
* AdaGram yields stateof-the-art results, outperforming other approaches based
  on sense embeddings, such as (Neelakantan+ 2014). We tried several
  models varying the
  * α parameter that controls granularity of the induced sense inventory. The
    best AdaGram configuration with the α = 0.05 yields F-score on of 0.656,
    which is below the most frequent sense of the TWSI, similarly to our top
    model DeptargetDepwordClusterTrigramtarget that reaches F-score of 0.698
  * `+/-` upper bound of induced inv
