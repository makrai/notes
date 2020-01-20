Gábor Berend
Word Sense Disambiguation for Hungarian using Transformers
MSZNY 2020

we make the contextualized word embeddings obtained for nearly 12500
sense-annotated utterances publicly available
http://github.com/begab/huWSDdata

# Abstract

* k–nn (k–nearest neighbors) approach which relies on multilingual BERT
* for a relatively small set of 39 specific word forms

# Introduction

* applying contextual word embeddings for WSD in English
  (Loureiro and Jorge, 2019; Vial+ 2019)

# 2 Related work

* long-standing origins in the NLP community Lesk (1986) and it is
* still in the focus of a series of recent research efforts in NLP
  (Raganato+ 2017; Melamud+ 2016; Loureiro and Jorge, 2019; Vial+ 2019)
* The typical setting for WSD is to categorize the mentions of ambiguous words
  * sense inventory in the case of English is definitely the Princeton WordNet
  * A Hungarian version of the WordNet also has been created (Miháltz+ 2008)
    serving the basis of the Hungarian WSD dataset created by Vincze+ (2008)
* supervision
  * supervised approach requiring a training corpus with sense-annotated
    * typically perform better than unsupervised approaches
    * IMS (Zhong and Ng, 2010) is a classical supervised WSD framework which
    * easy extensibility. It uses an SVM classifier
    * features ... based on the word forms and POS tags of the [context] words
  * unsupervised [but] knowledge-based, based on
    * the textual overlap between the context of an ambiguous word and the
      definitions included to its potential senses (Lesk, 1986) or
    * random walks over the semantic graph (Agirre and Soroa, 2009)
* neural
  * Melamud+ (2016) devised the context2vec framework, which relies on a
    * bidirectional LSTM for performing supervised WSD
  * Loureiro and Jorge, (2019; Vial+ (2019) have proposed the usage of
    contextualized word representations for tackling WSD
* Contextualized word representations (McCann+ 2017; Peters+ 2018; Devlin+
  2019) are recent extensions of traditional word embeddings, such as
  * applicable in a variety of settings, including natural language inference
    (Williams+ 2018) or reading comprehension (Khashabi+ 2018)

# 3 Experiments

## 3.1 The dataset

* derived from the sense-annotated corpus introduced by Vincze+ (2008)
* documents [from] the Hungarian National Corpus (HNC) (Váradi, 2002) including
  * Heti Világgazdaság subcorpus containing mostly news documents related to
* 39 ambiguous words. The documents are selected from the
* We distilled the original WSD corpus (Vincze+ 2008) into a single and
  easy-to-handle tab-separated plain text file in UTF-8 format
  * contains only the local context of the ambiguous words as opposed to the
  * 12477 distinct mentions for one of the 39 ambiguous Hungarian words
  * 449875 tokens
* Figure 1 illustrates the joint distribution of the number of senses per word
  forms and the Shannon entropy
  * number of word senses ... ranged between 1 and 14 (for the word form _jár_)
  * positive correlation of ρ = 0.83 can be observed

## 3.2 Preprocessing the dataset

* pretrained cased multilingual BERT (M-BERT) architecture for obtaining
* using the Huggingface transformers Python package (Wolf+ 2019)
* average of the vectorial representations of the word pieces as determined by
* 1+12 stacked layers using self-attention
  * Each [layer] employs vectorial representations of 768 dimensions
* sensitivity analysis on using ... different layers of the multi-layered
* we had to omit one of the sense-annotated words from our analysis [because] it
  was included in an excerpt being longer than the longest sequence M-BERT
  architecture can possibly deal with, i.e. a sequence length of 512. We also

## 3.3 Results

### Overview of the findings from (Vincze+ 2008)

* approach ... similar to the one applied in IMS (Zhong and Ng, 2010)
* Similar to [us], Vincze+ (2008) relied only on the [local] context
* words were then represented using the traditional vector space model (VSM)
  * context = paragraph of sense-annotated ambiguous words
  * features ... could additionally include indicator[s of the] surrounding 3 w
    * also made use of the POS tag information of the tokens,
      i.e.  they considered only the lemmatized word forms
* micro-averaged F-score of 0.703 when relying on a Naı̈ve Bayes classifier and
  * between 0.727 and 0.749 for applying C4.5 classifier
    depending on the combination of features they were relying on
* leave-one [token]-out evaluation for assessing the quality of their
* Most Frequent Sense (MFS) ... baseline obtained an aggregate micro-averaged
  F-score of 0.694

### Using contextual representations for WSD

* Our methodology ... is similar to those recently proposed for English
  (Loureiro and Jorge, 2019)
  * Loureiro and Jorge, (2019) [used] the large cased [English] BERT model
  * [no] fine-tuning of the M-BERT model to fit the task of WSD
* Similar to (Vincze+ 2008), we also conducted experiments in a leave-one-out
* number of nearest neighbors, i.e. k ∈ {1, 3, 5, 7, 9}. Figure 2 illustrates
* plateauing effect for the last few layers of M-BERT ... 8 to 12
* [number of] the nearest neighbors ... k = 5, provides a trade-off between
  * [not too] biased in predicting (the most) frequent senses – as opposed to
* layer 5 and beyond are outperforming Vincze+ (2008) irrespective of `k`
* final layers [and] k > 3, [consistently] fair margin (cf. 0.74 versus 0.82) 
* F-scores of the senses for the individual word forms in the dataset 
  * MFS baseline and our k–nn solution relying on the M-BERT [by] word
  * Shannon entropy [vs] F-score obtained for it for a particular model
  * Figure 3 for the MFS and the 5–nn approach relying on the final layer of
    * k–nn based approach behaving less sensitively to [entropy]

#4 Future work and conclusions

* we plan to extend it to the more challenging all words WSD setting
  * English [dataset] Raganato+ (2017); Taghipour and Ng (2015),
  * however, such large scale training data is not ... available for Hungarian
  * how [ training data – in some ] foreign language – can improve hu
