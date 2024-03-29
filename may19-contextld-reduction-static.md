On Measuring Social Biases in Sentence Encoders
Chandler May, Alex Wang, Shikha Bordia, Samuel R. Bowman, Rachel Rudinger
NAACL 2019

# Abstract

* The Word Embedding Association Test shows that
  GloVe and word2vec word embeddings exhibit human-like implicit biases based on
  gender, race, and other social constructs (Caliskan+ 2017)
* we extend the Word Embedding Association Test to sentence-level
* We test several sentence encoders, including SOTA methods e.g. ELMo & BERT,
  * biases we analyse
    * those studied in prior work and
    * two that are difficult or impossible to test at the word level
  * mixed results including suspicious patterns of sensitivity
    * suggest the test’s assumptions may not hold in general
* proposing directions for future work on measuring bias in sentence encoders

# 1 Introduction

* biases against women and black people (Bolukbasi+ 2016; Garg+ 2018, i.a.),
* Word Embedding Association Test (WEAT; Caliskan+ 2017) measures bias
  * comparing two sets of target-concept words to two sets of attribute words
  * We propose a simple generalization of WEAT to phrases and sentences: the
    Sentence Encoder Association Test (SEAT)
  * sentences generated by inserting individual words from Caliskan+ ’s tests
    into simple templates such as “This is a[n] <word>.”
* we also introduce tests of two biases that are less amenable to word-level
  * angry black woman stereotype (Collins, 2004; Madison, 2009;
    Harris-Perry, 2011; hooks, 2015; Gillespie, 2016) and a
  * double bind on women in professional settings (Heilman+ 2004)
* impact of different experimental designs
  * e.g. Caliskan+ ’s tests rely on
    * given names associated with European American and African American people
    * terms referring to women and men as groups (such as “woman” and “man”)
    * We explore the effect of using given names versus group terms
      by creating alternate versions of several bias tests that swap the two
    * not generally feasible with WEAT, as categories like African Americans
      lack common single-word group terms
* Sentence-to-vector encoders largely exhibit the _angry black woman_ stereotype
  and Caliskan biases, and to a lesser degree the double bind biases
* BERT (Devlin+ 2018) display limited evidence of the tested biases
* cosine similarity may not be suitable in recent models
