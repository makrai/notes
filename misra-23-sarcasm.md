Sarcasm detection using news headlines dataset
Rishabh Misra, Prahal Arora
AI Open Volume 4, 2023, Pages 13-18

tl;dr ,,szarkasztikus" hírek címe

# Abstract

* datasets either use
  * large scale datasets collected using tag-based supervision
    * noisy in terms of labels and language
  * small scale manually annotated datasets
    * not enough instances to train deep learning models reliably
* we introduce a high-quality and relatively larger-scale dataset which is
  * a collection of news headlines
    from a sarcastic news website and a real news website
* We
  * describe the unique aspects of our dataset and compare its various
    characteristics with other benchmark datasets in sarcasm detection domain
  * insights into what constitute as sarcasm in a text
    using a Hybrid Neural Network architecture. First released in 2019, we
    * strong performance of the proposed framework
  * how the NLP research community has extensively relied upon our contributions
    to push the state of the art further in the sarcasm detection domain
  * we make the dataset as well as framework implementation publicly available
    to facilitate continued research in this domain

# 1 Intro

* dataset either a small high-quality labeled dataset or a large noisy labeled
  * Larger datasets are collected using tag-based supervision like (
    * Bamman and Smith (2015) collected dataset from Twitter using hashtags or
    * Khodak+ (2018) collected dataset from Reddit using “/s” tag.
  * Smaller datasets with high-quality labels need manual labeling like (
    * Oraby+ (2017) sarcasm annotated dialogues or Semeval challenge1
      contributing Twitter-based dataset. In each type of scenario, the
* problem    
  * Social media-based datasets are collected using tag-based supervision. As
    * noisy labels. Furthermore, people use very 
    * informal language on social media which introduces sparsity in vocabulary
    * many posts can be replies to other posts, and detecting sarcasm in such
  * Manually labeled datasets usually have a limited number of sarcastic
    instances due to the high cost associated with obtaining quality labels.
    * the understanding of sarcasm differs from person to person and there can
  * Limited qualitative analyses are available from models trained on previously
    available datasets to showcase what the models are learning and in which
    cases they can recognize sarcasm accurately.  
* detecting sarcasm requires an understanding of common sense knowledge, without
  * not addressed in previous studies to the best of our knowledge. Due to these
* contributions in this work as follows: 
  * a high-quality and (relatively) large-scale dataset for sarcasm detection
  * it is superior in terms of labels and language as compared to previously
    available benchmark datasets in this domain.
  * a Hybrid Neural Network with an attention mechanism to showcase how we can
    * qualitative analyses to interpret the concept of sarcasm through its
      attention module.
  * we survey some of the latest NLP research in the sarcasm detection domain to
    showcase the impact our work has had since 2019

# 2 our dataset to overcome the limitations of previously used benchmarks

* collected from two news websites: TheOnion.3 and HuffPost4 
  * TheOnion produces sarcastic versions of current events and 
    * we collect all the headlines from News in Brief and News in Photos
      categories to construct the sarcastic part of the corpus. We collect 
  * real and non-sarcastic news headlines from HuffPost, an American online news
    * using their news archive page. To explore the language of the text
* advantages over the existing sarcasm datasets: 
  * no spelling mistakes or informal usage like in social media-based datasets
    (Semeval or SARC). This reduces the vocabulary sparsity and also increases
    * evident from the percentage of words we can to find in word2vec: 
      77% as compared to the Semeval Twitter-based dataset (64%)

|                   | Headlines | Semeval | IAC | SARC|
|-------------------|-----------|---------|-----|-----|
|# Records          | 28,619 | 4792 | 3260 | 1,010,826|
|Domain             | News | Twitter | Debate | Reddit|
|Labeling technique | Source-based | Hand labeled | Hand labeled | Tag-based|
|Label quality      | Controlled | Controlled | Controlled | Not controlled|
|Language           | Formal | Informal | Formal | Informal|

# 3 the Hybrid Neural Network architecture, which we use to showcase
quantitative and qualitative results on our dataset. In 

# 4 and 5 experiment design details, results, and analyses

# 6 prominent NLP studies relying on our contributions since 2019. To conclude,

# 7 Conclusion and future work

* open directions that can be explored in future:
* using the dataset or the method proposed in this work as a pre-computation,
  and tune the parameters on domain-specific datasets for downstream tasks
* the detection of sarcasm depends a lot on common knowledge 
  (current events and common sense)
  * integrate this knowledge in modeling efforts
  * sarcasm detection based on which sentences deviate from common knowledge.
  * Young+ (2017) integrated such knowledge in dialogue systems and 
    * the ideas mentioned could be adapted in sarcasm detection setting as well
