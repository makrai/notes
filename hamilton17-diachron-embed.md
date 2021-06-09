Hamilton, W. L., Leskovec, J., & Jurafsky, D
Diachronic Word Embeddings Reveal Statistical Laws of Semantic Change
2016 ACL

http://nlp.stanford.edu/projects/histwords

# Abstract

* We
  * develop a robust methodology for quantifying semantic change by evaluating
    word embeddings (PPMI, SVD, word2vec) against known historical changes
  * use this methodology to reveal statistical laws of semantic evolution.
    * Using six historical corpora spanning four languages and two centuries, we
      * (English, German, French, and Chinese)
    1. the law of conformity—the rate of semantic change scales with an inverse
       power-law of word frequency;
    2. the law of innovation—independent of frequency, words that are more
       polysemous have higher rates of semantic change.

# Intro

* Shifts in word meaning exhibit systematic regularities (Bréal, 1897;
  Ullmann, 1962). The
  * rate of semantic change, for example,_is higher_in some words (Blank, 1999)
  * e.g. stable ... _cat_ [vs] varied meanings of ... _cast_:
    “to mould”, “a collection of actors’, “a hardened bandage”, etc.
* hypotheses have been offered about such regularities in semantic change,
  * such as an increasing subjectification of meaning, or the
    grammaticalization of inferences
    (e.g., Geeraerts, 1997; Blank, 1999; Traugott and Dasher, 2001)
* questions about semantic change remain unanswered. One is the role of
  * frequency
    * plays a key role in other linguistic changes: [more frequent words]
      * faster ... sound changes like lenition occur in
      * more resistant to morphological regularization (Bybee, 2007; Pagel ...)
  * relationship between semantic change and polysemy.
    * Words gain senses over time as they semantically drift
      (Bréal, 1897; Wilkins, 1993; Hopper and Traugott, 2003), and
    * diverse contexts [affect] lexical access speed (Adelman+ 2006) and
      rates of L2 learning (Crossley+ 2010)
    * more or less likely to undergo change (Geeraerts, 1997; Winter+
      2014; Xu+ 2015). Furthermore,
  * polysemy is strongly correlated with frequency
    (Zipf, 1945; İlgen and Karaoglan, 2007)
    * understanding [the effect of polysemy] requires controling for [freq]
* requires new methods that can go beyond the case-studies of a few words
* distributional semantics,_in which words are embedded_in vector spaces
  according to their co-occurrence relationships (Bullinaria and Levy, 2007)
* embeddings ... compared across time-periods
  * effectively demonstrated in a number of case-studies
    (Sagi+ 2011; Wijaya and Yeniterzi, 2011; Gulordava and Baroni, 2011;
    Jatowt and Duh, 2014) and
  * large-scale linguistic change-point detection (Kulkarni+ 2014) as
  * test a few specific hypotheses, such as whether
    English synonyms ... change meaning in similar ways (Xu and Kemp, 2015)
  * widely different embedding approaches and test their approaches
  * only on English

# Diachronic embedding methods

* we construct diachronic (historical) word embeddings, by
  * first constructing embeddings in each time-period and
  * then aligning them over time, and the
* metrics that

## 2.3 Aligning historical embeddings

* Explicit PPMI vectors are naturally aligned
* Low-dimensional embeddings will not be naturally aligned
  * Previous work ... either
    * avoiding low-dimensional embeddings
      (e.g., Gulordava and Baroni, 2011; Jatowt and Duh, 2014)
    * performing heuristic local alignments per word (Kulkarni+ 2014).
* We use orthogonal Procrustes to align the learned low-dimensional embeddings.
  Defining W (t) ∈ R d×|V| as the matrix of word embeddings learned at year t,
  we align across time-periods while preserving cosine similarities by
  optimizing:

`arg min_{Q > Q=I} ||QW (t) − W (t+1)||_F`

## 2.4 Time-series from historical embeddings

Diachronic word embeddings can be used in two ways to quantify semantic change:
1. we can measure changes in pair-wise word similarities over time, or
  * Spearman correlation (ρ) of this series against time
2.  we can measure how an individual word’s embedding shifts over time.
  * the cosine-distance between a word’s representation for different time[s]

# 3 Comparison of different approaches

* We compare the different distributional approaches on a set of benchmarks
  * both their synchronic ... and their diachronic validity

## known changes

* all the methods ... capturing the correct directionality of the shifts, but
* differences in whether the methods deemed the shifts ...  significant
* SGNS performed the best on the _full_ English data, but its performance dropped
* smaller COHA dataset, where SVD performed best.
* PPMI was noticeably worse than the other two approaches (Table 3).

## discovering

* examining the top-10 words that changed the most from the 1900s to the 1990s
  (limiting our analysis to words with relative frequencies above 10 −5 in both
  decades).
* We used the EngFic data as the most-changed list for EngAll was dominated by
  scientific terms due to changes in the corpus sample.
* [genuine precision] SGNS ... 70%; 40% for SVD, and 10% for PPMI

## 3.3 Methodological recommendations

# 4 Statistical laws of semantic change

* how a word’s rate of semantic change \Delta, depends on its frequency, f (t) (w_i )
  and a measure of its polysemy, d (t) (w_i ) (defined in Section 4.4).
* we examined one data-point per word for each pair of consecutive decades and
* we analyzed only non-stop words that occurred more than 500 times in both
  decades contributing to a change (lower-frequency words tend
* We also log-transformed [\Delta] and normalized the[m] to have zero mean and
  unit variance; we denote these nor- ̃ (t) (w i ).  malized scores by ∆~

  `∆(w_i) ∝ f (w_i) β_f} × d(w_i) β_d}` with `β_f < 0 < β_d`

* language/corpus dependent scaling constant in β d ∈ [0.08, 0.53].
  * The distribution of polysemy scores varies substantially across languages,
    so the large range for this constant is not surprising.

## 4.4 Law of innovation

* _contextual diversity_ as a proxy for its polysemousness
* [network:] words are connected to each other if they co-occur more than one
  would expect by chance (after smoothing). The
* polysemy of a word is then measured as its local clustering coefficient
  within this network (Watts and Strogatz, 1998)
  * a word will have a high clustering coefficient ... if the words that it
    co-occurs with also tend to cooccur with each other
  * Variants of this measure are often used in wordsense discrimination and
    * correlate with, e.g., number of senses in WordNet
      (Dorow and Widdows, 2003; Ferret, 2004). However, we found that it was
  * slightly biased towards rating contextually diverse discourse function
    words (e.g., _also_) as highly polysemous, which needs to be taken into
  * significant intrinsic positive correlation with frequency.
    * we interpret [its effect] only after controlling for frequency
    * control is naturally captured in equation (7)
    * [captured changes the directionality]

# 5 Discu

* recent work on detecting the emergence of novel word senses
  (Lau+ 2012; Mitra+ 2014; Cook+ 2014; Mitra+ 2015;
  Frermann and Lapata, 2016)
* These ... statistical laws also lend themselves to various causal mechanisms.
  * The law of conformity might be a consequence of
    * learning: perhaps people are more likely to use rare words mistakenly in
      novel ways, a mechanism formalizable by Bayesian models of word learning
      * corresponding to the biological notion of genetic drift
        (Reali and Griffiths, 2010)
    * sociocultural conformity bias makes people less likely to accept novel
      innovations of common words, a mechanism
      * analogous to the biological process of purifying selection
        (Boyd and Richerson, 1988; Pagel+ 2007)
* such mechanisms may also be partially responsible for the law of innovation.
  Highly polysemous words tend to have more rare senses (Kilgarriff, 2004), and
  rare senses may be unstable by the law of conformity
