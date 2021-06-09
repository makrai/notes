Error Analysis and the Role of Morphology 
Marcel Bollmann, Anders Søgaard
EACL 2021

# Abstract

* We evaluate two common conjectures in error analysis of NLP models: 
  * Morphology is predictive of errors; and 
    * Using morphological features does improve error prediction across tasks; 
  * the importance of morphology increases with the morphological complexity of
    a language. We show across 
    * effect is less pronounced with morphologically complex languages. 
* four different tasks and up to 57 languages that
* only (i) is true. 
* We speculate this is because 
  morphology is more discriminative in morphologically simple languages. 
* Across all four tasks, case and gender are the morphological features most
  predictive of error.

# 1 Intro

* Morphology has been argued to be a major source of error in 
  * syntactic parsing (Tsarfaty+ 2020), 
  * semantic parsing (Şahin and Steedman, 2018), 
  * machine translation (Irvine+ 2013; Burlot and Yvon, 2017) and a range of
* in particular in morphologically complex languages 
  (Bender, 2009; Søgaard+ 2018; Tsarfaty+ 2020) 
* If the model has generally seen fewer words in instrumental case, this can
  lead to systematic errors on this class of inflections.
* Nowadays, many NLP systems use 
  * statistically learned subword units e.g. byte-pair encodings (Sennrich+ 16)
  * characters as input representations, which could allow gen to indiv affixes
  * often found to be inssufficient at capturing morphological structure 
    (Vania and Lopez, 2017; Bostrom and Durrett, 2020; Klein and Tsarfaty, 2020) 
* Contributions In this study, we revisit 
  * two common conjectures about the role of morphology that are made in error
    * whether morphology is generally predictive of errors across tasks & lang
    * whether the extent to which morphology is predictive 
      depends on the morphological complexity of the language in question. These
    * common throughout the literature (Nivre 2007; Bender 2009; Manning 2011) 
* Looking at data from four shared tasks on 
  * semantic role labeling (Hajič+ 2009),
  * dependency parsing (Zeman+ 2018), 
  * verbal multi-word expression identification (Ramisch+ 2018), and 
  * quality estimation (Fonseca+ 2019), we 
* we map each token in the input data to a set of morphological features. Using
  only this feature set, and without using any orthographic or distributional
  representation of the input, we train random forest classifiers to predict
  whether a system has made an error on an input token. Figure 1 illustrates
* we find that, somewhat surprisingly, 
  our results only support the first conjecture. In other words, (i) while
  * morphology is helpful in predicting such errors, (ii) 
  * the degree to which morphology helps does 
    not increase with the morphological complexity of the language. Moreover, we
* task-specific differences between which morphological features are predictive
  * part of speech, case and gender are most predictive of error.  

# 2 Background

* Tsarfaty+ (2020) give a broader overview of the challenges that rich
  morphological structure presents for dependency parsing, and 
* Şahin and Steedman (2018) discuss the importance of morphology in sem parsing.  
* machine translation (MT) systems. 
  * Federico+ (2014) show that morphological errors are 
    common for MT into Arabic and Russian and strongly affect human quality judg 
  * For English–Romanian MT, Peter+ (2016) find that tense and verb form on the
    target side are a common source of error. 
  * Klubička+ (2017) find that errors in English–Croatian MT are more common for
    some morphological categories, such as case. In a similar vein, 
  * Burlot and Yvon (2017) evaluate morphological competence of MT systems using
    contrast pairs and show that systems have different strengths and weaknesses
    for different morphological phenomena. 
* tasks Beyond parsing and MT, morphology has also been shown to present a
  * Arabic handwriting recognition (Habash and Roth, 2011) or 
  * Russian anaphora resolution (Toldova+ 2016).  
* explicitly analysed BERT with regard to morphology.  
  * Edmiston (2020) analyses morphological content in BERT-style models for 
    five languages and finds that 
    “[morphological] ambiguity is negatively correlated with performance on
    classification, and to a significant degree in many cases”, suggesting that
    morphology is still a significant source of error in these models. 
* We studying a much larger set of morphological variables, across 
  several architectures and tasks, and across up to 57 languages.

# 4 Methodology

## 4.1 Feature Extraction

## Morphological features Our morphological feature inventory consists of 

* Universal Dependencies (UD) features, 
* lexical features, and 
  * SYNCRETIC specifies to what extent a token can be representative for several
    morphological feature sets: 
    e.g., ask can be either U : MOOD = IND or U : MOOD = IMP , depending on cont
  * AMBIG POS specifies to what extent the universal part-of-speech tag of the
    token can differ based on context: 
    e.g., book could be either U : POS = VERB or U : POS = NOUN ; and 
  * AMBIG LEX specifies whether or not the token belongs to multiple lexemes:
    e.g., ruling is a form of both ‘(to) rule’ and ‘(the) ruling’. To determine
* string-based features.
  * based on comparing the token with its lemma.  
  * We perform character-based string alignment using Edlib (Šošić & Šikić, 17)
  * EDIT = PRE and EDIT = SUF when there is an edit at the beginning or the end
  * EDIT = IN when there is an edit in the middle of the sequence; and 
  * EDIT = FULL when there is no character alignment between the strings. These
    * other word-internal processes, and suppletion

## Control features 

* To estimate the relative importance of our morphological features for the
  * not morphologically motivated (cf. Tab. 1). These are 
  * string length features, where each token is assigned exactly one such feature depending on its length; and 
  * token frequency bins. For the latter, we count token frequencies in the
      
## Pruning and statistics Since very rare features are not very informative, for

* we remove features that occur less than 10 times in that dataset.  
* Depending on the task and language, we generate between 17 and 120 unique
  * average of 68.

## 4.2 how we classify when an NLP system has made an error

## 4.3 the classifier itself

# 5 Analysis 5

## 5.1

* our setup is not comparable to most other NLP classification tasks: we
  evaluate a classifier trained to detect the errors of SOTA systems, which
  * the task is inherently hard, as 
    those systems are optimized to fix easily detectable errors, and 
  * there is no reason to assume a priori that this task is well learnable from
    morphological input features alone.  Therefore, we believe 
* an F 1 score of 0.43—albeit with considerable var in across tasks and langs—
  is a strong result.
* Figure 2 plots this relationship. 9 This suggests that the 
  * errors introduced by SOTA NLP systems, unsurprisingly, become harder and
    harder to predict the better the underlying systems perform.
* data imbalance is in the nature of the error prediction task, as we expect
  errors in SOTA systems to be rare. Additionally, 
* different languages have differently-sized morphological tag inventories,

## 5.2 How important is morphology for predicting errors?

### Importance by language

### Morphological complexity 

* morphological feature entropy (MFE) introduced by Çöltekin and Rama (2018).
  * sensitive to both the size of a language’s morphological feature inventory
    as well as its distribution, with a more uniform distribution of features
    resulting in a higher MFE. Since MFE is a treebank measure that relies on
  * affected by tokenization and annotation choices of the treebank used to
    calculate it; therefore, it can only be considered a rough approximation of
    the underlying language’s complexity. Like Çöltekin and Rama (2018), we
    calculate the MFE score for each language on the UD treebanks. 10 
* a slight, negative correlation between MFE and ∆F 1 (Pearson’s r = −0.24).
  * languages with high MFE appear across the whole range of the ∆F 1
  * a number of languages with low MFE 
    e.g.  Thai ( THA ), Japanese ( JPN ), or Nigerian Pidgin ( PCM )—are found
    to profit more from the inclusion of morphological features. 
* One possible explanation is that 
  * the control features are already very strong, which we will look at more
    closely in Sec. 5.3. Another possible factor is that 
  * morphologically complex languages introduce a much larger set of
    morphological features; if, for a given language, most of them are not
    relevant for predicting errors in the UDP task, they might hurt the overall
    classifier performance.  
    
## 5.3 What morphological features are most predictive of errors?

* plain feature importances of trained random forest classifiers can be misleadn
  (Strobl+ 2007; Parr+ 2018), 
* we explicitly remove features and retrain (Parr+ 2018; Hooker and Mentch 2019)

## Average feature importances

* Table 2 shows the top 10 feature categories for each task, averaged over all
* The two control features, FREQ and LEN , always appear among the three most
  important categories, only trumped by U : POS for the UDP and SEM tasks.
  * these three are the only feature categories that appear with every token. It

## Individual part-of-speech tags 

* Since U : POS is an important feature category across tasks (cf.  Tab. 2), 
  we also look at feature importances for individual POS tags. For this, we use
* we now only remove a single U : POS feature from Φ at a time.  
* Table 3 shows the average feature importances for individual U : POS features,
* this time we restrict ourselves to the subset of languages in UDP that are
  also covered in SEM . 11 This way, we can better 
  * isolate the task-specific differences in FI scores
    from the different language-specific distributions of part-ofspeech tags
* adverbs ( ADV ) are the most important partof-speech category for both tasks,
  * INTJ and PART are found to be important for predicting errors in UDP , but
    not in SEM .  This aligns with our intuitions about what is hard in
