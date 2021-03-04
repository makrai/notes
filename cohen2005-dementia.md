A Tale of Two Perplexities: Sensitivity of Neural Language Models to
  Lexical Retrieval Deficits in Dementia of the Alzheimer's Type
Trevor Cohen, Serguei Pakhomov
ACL 2020

* distinguish between elicited speech samples produced by patients with dementia
  * difference between perplexity estimates from two neural language models
    * trained on transcripts of speech produced by healthy/with dementia as a
      single feature for diagnostic classification of unseen transcripts has
      been shown to produce SOTA performance
    * hE, little is known about why this approach is effective, and on account
      of the lack of case/control matching in the most widely-used evaluation
      set of transcripts (DementiaBank), it is unclear if these approaches are
      truly diagnostic, or are sensitive to other variables
* In this paper, we interrogate neural LMs trained on participants with and
  without dementia
  using synthetic narratives previously developed to simulate progressive
  semantic dementia by manipulating lexical frequency
* We find that
  * perplexity of neural LMs is strongly and differentially associated with
    lexical frequency, and that
  * a mixture model resulting from interpolating control and dementia LMs
    improves upon the current SOTA for models trained on transcript text exclus

# 1 Introduction

* computational methods through which symptoms of AD and other dementias can
  be identified on the basis of linguistic anomalies observed in transcripts of
  elicited speech samples have intensified in the last several years
  * Fraser+ 2016
    * Linguistic features identify alzheimer’s disease in narrative speech
  * Yancheva and Rudzicz, 2016
    * Vectorspace topic models for detecting alzheimer’s disease
  * Orimaye+ 2017
    * Predicting probable alzheimer’s disease using ling deficits and biomarkers
* generally employed a supervised machine learning paradigm, in which a model is
  * engineered or computationally identified features. However, on account of
  * limited training data available, overfitting is a concern. This is
    particularly problematic in DAT, where the nature of linguistic
    anomalies varies between patients, and with AD progression (Altmann and
    McClung, 2008)
* we: perplexity of a speech sample as estimated by neural LMs trained on tran-
  scripts of the speech of participants completing a cognitive task. To date,
  * most successful approach: using LM perplexity as a sole feature between
  * proposed by Fritsch+ (2019) and replicated by Klumpp+ (2018). The approach
  * difference between the perplexities estimated with the two LMs results in
    very high classification accuracy (AUC: 0.92) reported by both studies
* explanation for this performance offered by
  * Fritsch+ (2019) relies on observations that patients with DAT describe the
    picture in an unforeseen way and their speech frequently diverts from the
    content of the picture, contains repetitions, incomplete utterances, and
    refers to objects in the picture using words like “thing” or “something”
  * conflicts with the findings by Klumpp+ (2018) that demonstrate 
    * similarly high classification accuracy (AUC: 0.91) 
      with a single hidden layer non-recurrent neural network and 
      bag-of-words input features, suggesting that while 
      word sequences play a role, it may not be as large as believed by Fritsch+
  * “local” with “global language properties” of the picture descriptions being
    captured by recurrent neural LMs vs. the non-recurrent bag-of-words neural
    network classifier, respectively
  * both explanations fail to explain that it is the difference between the
    control and dementia LMs that is able to discriminate 
  The individual LMs are not nearly as good at this categorization task
* The objective of the current study is to quantify the extent to which the
  differences between neural LMs reflect known deficits in language use in this
  disease
  * loss of access to relatively infrequent terms that occurs with disease
    progression (Almor+ 1999a)
* We interrogating trained neural LMs with two methods: interrogation by
  * perturbation in which we evaluate how trained neural LMs respond to text
    that has been deliberately perturbed to simulate AD progression; and
  * interpolation between neural LMs modeling language use with and without deme
* We find neural LMs are progressively more perplexed by text simulating disease
  of greater severity, and 
  * that this perplexity 
    decreases with increasing contributions of a LM trained on transcripts from
    patients with AD, but 
    increases again when only this LM is considered.  Motivated by these
* we modify the approach of Fritsch+ (2019) by incorporating an interpolated
  model and pre-trained word embeddings, with improvements in performance over
  the best results reported for models trained on transcript text exclusively
