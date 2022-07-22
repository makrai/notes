Surprisal Estimators for Human Reading Times Need Character Models\
Byung-Doh Oh, Christian Clark, William Schuler\
ACL 2021?

Code for model and experiments: https://github.com/byungdoh/acl21_semproc.

# Abstract

* character models has been popular in NLP applications, it has
* not explored much in the context of psycholinguistic modeling
* This paper presents a character model that\
  can be applied to a structural parser-based processing model\
  to calculate word generation probabilities
* Experimental results show that\
  surprisal estimates from a structural processing model using this char model
  => substantially better fits to self-paced reading, eye-tracking, and fMRI
  than those from large-scale language models trained on much more data
  * This may suggest that the proposed processing model provides\
    a more humanlike account of sentence processing, which assumes\
    a larger role of morphology, phonotactics, and orthographic complexity than
    was previously thought.

# 1 Introduction and Related Work

* Expectation-based theories of sentence processing (Hale, 2001; Levy, 2008)
  posit that processing difficulty is determined by predictability in context.
  In support of this position,\
  predictability quantified through surprisal has been shown to correlate with
  behavioral measures of word processing difficulty (Goodkind & Bicknell 2018;
  Hale 2001; Levy 2008; Shain 2019; Smith & Levy 2013)
  * hE surprisal itself makes no representational assumptions about sentence
    processing, leaving open the question of\
    how best to estimate its underlying probability model.

* character models in NLP are popular (Al-Rfou+ 2019; Kim+ 2016; Lee+ 2017)
  * not only to alleviate problems with out-of-vocabulary words but also to
  * embody morphological information available at the subword level. For this
  * model morphological processes (Elsner+ 2019; Kann and Schütze, 2016)
  * incorporate morphological information into models of syntactic acquisition
    (Jin+ 2019)
  * slow to catch on in psycholinguistic surprisal estimation, which has
    * recent focus on evaluating largescale language models that make
      predictions at the word level\
      (eg Futrell+ 2019; Goodkind and Bicknell 2018; Hale+ 2018; Hao+ 2020)

* question: whether incorporating character-level information\
  into an incremental processing model\
  will result in surprisal estimates that better charize predictabil in context

* this paper presents a character model that can be used to estimate word
  generation probabilities in a structural parser-based processing model. 1 The
  * model defines a process of\
    generating a word from an underlying lemma and a morphological rule, which
    => capture the predictability of a given word form\
    in a fine-grained manner
* Regression analyses on self-paced reading, eye-tracking, and fMRI data
  * character-based structural processing model
  * substantially better surprisal estimates\
    compared to those calculated from large-scale language models,\
    despite the fact that these other models are trained on much more data and
    show lower perplexities on test data
  * finding deviates from the monotonic relationship between\
    test perplexity and predictive power observed in previous studies\
    (Goodkind and Bicknell, 2018; Wilcox+ 2020)
  * suggests that the character-based structural processing model may provide\
    a more humanlike account of processing difficulty and may suggest
    * a larger role of morphology, phonotactics, and orthographic complexity
