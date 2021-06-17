v1: Ranking Transfer Languages with Pragmatically-Motivated Features
  for Multilingual Sentiment Analysis
v2: Cross-Cultural Similarity Features for Cross-Lingual Transfer Learning of
  Pragmatically Motivated Tasks
J Sun, H Ahn, CY Park, Y Tsvetkov, DR Mortensen
arXiv preprint arXiv …, 2020 arxiv.org

# Abstract

* Much work in cross-lingual transfer learning explored
  * how to select better transfer languages for multilingual tasks, primarily
    focusing on typological and genealogical similarities between languages
* these measures of linguistic proximity are not enough when working with
  pragmatically-motivated tasks, such as sentiment analysis
* we introduce three linguistic features that capture cross-cultural sims that
  manifest in linguistic patterns and quantify distinct aspects of lang pragm:
  * language context-level, figurative language, and the
    lexification of emotion concepts. Our
  * capture cross-cultural similarities and align well with existing work in
    sociolinguistics and linguistic anthropology
* downstream task of choosing transfer languages for cross-lingual sentiment ana
  * corroborate [alátámaszt] the effectiveness of pragmatically-driven transfer

# 1 Introduction

* qualitative case studies how
  cultural differences are manifested as linguistic variations (Siegel, 1977)
* Quantifying cross-cultural similarities from linguistic patterns 
  largely unexplored in NLP, with the exception of studies that focused on
  * differences in word usage (Garimella+ 2016; Lin+ 2018)
* we focusing on semantic and pragmatic differences across languages
  * new distance measure between languages based on linguistic proxies of
    culture
  * can be used to select transfer languages and improve cross-lingual transfer,
    specifically in pragmatically-motivated tasks such as sentiment analysis,
    * expressions of subtle sentiment or emotion vary significantly by culture
      * e.g. subjective well-being (Smith+ 2016), anger (Oster, 2019), or
        irony (Karoui+ 2017)
* We focus on three aspects in the intersection of lang and culture,
  * features to operationalize them
  1. languages and cultures rely on different levels of context in communication
    * Western European languages are generally considered low-context languages,
    * Korean and Japanese are considered high-context languages (Hall, 1989)
  2. similar cultures construct and construe figurative language similarly
     (Casas and Campoy, 1995; Vulanović, 2014)
  3. emotion semantics is similar between languages that are culturally-related
     (Jackson+ 2019)
     * e.g. in Persian, ‘grief’ and ‘regret’ are expressed with the same word
       whereas ‘grief’ is co-lexified with ‘anxiety’ in Dargwa
      * Therefore, Persian/Dargwa speakers may perceive ‘grief’ as more similar
* We validate the proposed features qualitatively, and also by an extrinsic
  * confirm that our linguistic features capture the intended cultural patterns
  * results corroborate the existing work in sociolinguistics and ling anthropol
  * use them to rank transfer languages for cross-lingual transfer learning
    * Lin+ (2019) have shown that selecting the right set of transfer languages
      with syntactic and semantic language-level features can significantly
      boost the performance of cross-lingual models
    * We incorporate our features into Lin+ (2019)’s ranking model to evaluate
    * Experimental results show that incorporating the features
      * improves the performance for cross-lingual sentiment analysis, but
      * not for dependency parsing
      * support our hypothesis that
        cultural features are more helpful when the task is pragmatic
