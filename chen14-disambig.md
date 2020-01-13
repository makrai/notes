Xinxiong Chen, Zhiyuan Liu, Maosong Sun
  http://nlp.csai.tsinghua.edu.cn/~lzy/codes.html
A Unified Model for Word Sense Representation and Disambiguation
2014 EMNLP

Our sense representations can be downloaded at http://pan.baidu.com/s/1eQcPK8i

# Abstract

* idea is that both 
  * word sense representation (WSR) and word sense disambiguation (WSD) will
    benefit from each other: 
    1. high-quality WSR will capture rich information about words and senses,
       which should be helpful for WSD, and 
    2. high-quality WSD will provide reliable disambiguated corpora for
       learning better sense representations. 
* Experimental results show that, our model improves the performance of 
  * contextual word similarity compared to existing WSR methods
  * domain-specific WSD
  * coarse-grained all-words WSD.
    * competitive performance

# 1 Intro

* cluster-based models suffer from
  * determine the number of clusters.  "offline"
  * find the sense [in a gold invetory] that a word prototype corresponds to
* In this paper: based on these 
  * knowledge bases and 
  * large-scale text corpora.
* evaluate the performance of 
    WSR using a contextual word similarity task, and results show that 
    * our model can significantly improve the 
      * correlation with human judgments compared to baselines. 
  * both domain-specific WSD and coarse-grained all-words WSD
    * competitive with state-of-theart supervised approaches.
