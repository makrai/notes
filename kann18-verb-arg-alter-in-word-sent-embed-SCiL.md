Katharina Kann, Alex Warstadt, Adina Williams, Samuel R. Bowman
Verb Argument Structure Alternations in Word and Sentence Embeddings
SCiL 2019

LaVA and FAVA datasets are available under https://nyu-mll.github.io/CoLA

# Abstract

* Verbs occur in different syntactic environments, or frames. 
* We investigate whether [neural networks encode] frame-selectional properties
* on the sentence level, we
  * introduce five datasets, collectively called FAVA, containing
    * 10k sentences labeled for grammatical acceptability, illustrating
      different verbal argument structure alternations.  We then 
  * test whether models can distinguish acceptable English verb-frame combos
    using a sentence embedding alone
* on the word level, we
  * construct LaVA, a corresponding word-level dataset, and 
  * investigate whether the same ... features can be extracted from word embeds
* results
  * reliable classifications for some verbal alternations but not others,
    * while these representations do encode fine-grained lexical information,
      it is incomplete or can be hard to extract
* differences between the wordand sentence-level models show that 
  * some information present in word embeddings is not passed on to the
    down-stream sentence embeddings

# 1 Intro

* verbs [ encoding ] how entities are related to, and participate in, events.
  * verbs that are intuitively very similar in meaning may vary [in synt frame]
  `*`locsol/önt vmit vmire, meg~ vmit vmivel, _megönti a kancsót limonádéval_
* verb lexica (Grishman+ 1994; Baker+ 1998; Fillmore+ 2003; 
  Kipper-Schuler, 2005; Kipper-Schuler+ 2006)
* word embedding can be used to predict which frames that verb can licitly
  * Lexical Verb–frame Alternations dataset (LaVA), based on Levin (1993), and
* sentence embeddings encode the frame-selectional properties of their main
  * we semi-automatically generate sentences in such a way to ensure that the
    main verb’s frame alternation information is the only information
    determining the (un)grammaticality of the sentence. For a portion of the
  * Frames and Alternations of Verbs Acceptability dataset (FAVA), we train a





