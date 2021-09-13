Red-faced ROUGE: Examining the Suitability of ROUGE for Opinion Summary Eval
Wenyi Tay, Aditya Joshi, Xiuzhen Zhang, Sarvnaz Karimi, Stephen Wan
ALTA 2019

# Abstract

* common metric to automatically evaluate opinion summaries is ROUGE
  * developed for text summarisation
  * counts the overlap of word or word units
  * treats all words in the reference summary equally
* Opinion summarisation requires to correctly pair two types of semantic info
  * (1) aspect or opinion target; and (2) polarity of candidate and reference
  * has been considered a special case of text summarisation
* from the conclusion:
  * Our experiments simulate scenarios where inaccurate summaries are
    automatically generated. We observe that ROUGE is unable to differentiate
    summaries that are accurate and summaries that are inaccurate
* Using three simulation-based experiments, we evaluate the behaviour of ROUGE
  * ROUGE cannot distinguish similar or opposite polarities for the same aspect
  * significant variance under different configuration settings
* three recommendations for future work that uses ROUGE to evaluate opinion summ

# 1 Intro

* opinion is formally defined as a combination of
  * aspect (an attribute of the product or service as the opinion target)
  * sentiment polarity (either positive or negative <~ opinion words, Liu, 2012)
* annotators may read a summary and rate it according to quality measures
  e.g. informativeness, ability to capture sentiment polarity, coherence and
  redundancy (Angelidis and Lapata, 2018)
* automatic evaluation of opinion summaries adopts metrics from
  * text summarisation (Lin, 2004) and
  * machine translation (Papineni+ 2002; Lavie and Denkowski, 2009)
* the most frequently reported metric for opinion summarisation is ROUGE
  * Recall-Oriented Understudy for Gisting Evaluation (ROUGE, Lin, 2004)
* evaluation must assess both aspect and sentiment

# 3 ROUGE

* considerations are important when using ROUGE:
  1. Multiple reference summaries:
    * A candidate summary with highest score will be the ROUGE score
  2. Pre-processing configurations: stemming and stop word removal
    * There are no recommended or commonly agreed preprocessing configurations
  3. precision and F1 instead of recall
    * In our work, we investigate the different configurations of ROUGE for
  4. Comparing different systems by the mean or median of all the summaries
    * We focus on the ROUGE scores at the summary level
* Opinion summary evaluation requires differential comparison of two groups of
  words, the aspect terms and sentiment-bearing words. We design three exper-

# 4 Experiment and Results

* Opinosis is a opinion summary dataset by Ganesan+ (2010). It contains 51 docs,
  * online reviews on one aspect of hotels, cars and products. Examples of
    aspects are service for hotels, mileage of cars and size of netbooks
  * Each document is associated with three to five gold standard summaries.  The
  * We observe duplicates in the gold standard summaries. After removing

## 4.1 Summary Triplet Experiment

## 4.2 Same Polarity Triplet Experiment

## 4.3 Opposite Polarity Triplet Experiment

# 5 Discussion

* suggestions for future studies for automatic evaluation in opinion summarisatn
  1. The configurations for ROUGE can change or reverse the order of scores
    * F1 scores appear to compare summaries better than Recall. Also,
    * “StopWordRemoval” seems to reduce the ability of ROUGE scores for
    * “Stemming” often improve the ability to compare candidate summaries for
    * we recommend reporting the configurations under which ROUGE was computed
  2. ROUGE scores will be low when candidate summary is of a different aspect
     * in opinion summary evaluation, we recommend checking for a match of the
       aspect in candidate and reference summary as a differentiating criteria
  3. It is not possible to infer from ROUGE scores if the candidate summary is
     accurate to the reference especially for sentiment polarity. ROUGE
    * We recommend sentiment agreement of candidate and reference summaries

# 6 Conclusion

* For future work
  * opinion summaries that contain multiple opinions.  Based on the learning
  * propose a new metric that incorporates semantic similarity in terms of
    opinion target and opinion polarity
