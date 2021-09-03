Red-faced ROUGE: Examining the Suitability of ROUGE for Opinion Summary Evaluation 
Wenyi Tay, Aditya Joshi, Xiuzhen Zhang, Sarvnaz Karimi, Stephen Wan
ALTA 2019
    
# Abstract

* common metric to automatically evaluate opinion summaries is ROUGE, a metric
  * developed for text summarisation. ROUGE 
  * counts the overlap of word or word units 
  * treats all words in the reference summary equally.In opinion summaries,
* Opinion summarisation requires to correctly pair two types of semantic info
  * (1) aspect or opinion target; and (2) polarity of candidate and reference
  * has been considered a special case of text summarisation.
* Using three simulation-based experiments, we evaluate the behaviour of ROUGE
  * ROUGE cannot distinguish similar or opposite polarities for the same aspect.
  * significant variance under different configuration settings. As a result, we
* three recommendations for future work that uses ROUGE to evaluate opinion summ

# 1 Intro

* opinion is formally defined as a combination of 
  * aspect (an attribute of the product or service as the opinion target)
  * sentiment polarity (either positive or negative <~ opinion words, Liu, 2012)
* annotators may read a summary and rate it according to quality measures such
  as informativeness, ability to capture sentiment polarity, coherence and
  redundancy (Angelidis and Lapata, 2018). However, human evaluation is
* automatic evaluation of opinion summaries adopts metrics from 
  text summarisation (Lin, 2004) and 
  machine translation (Papineni+ 2002; Lavie and Denkowski, 2009). We focus on
* the most frequently reported metric for opinion summarisation, ROUGE
  * Recall-Oriented Understudy for Gisting Evaluation (ROUGE, Lin, 2004) and
* evaluation must assess both aspect and sentiment
