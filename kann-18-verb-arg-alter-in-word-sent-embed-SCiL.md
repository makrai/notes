Katharina Kann, Alex Warstadt, Adina Williams, Samuel R. Bowman
Verb Argument Structure Alternations in Word and Sentence Embeddings
SCiL 2019

LaVA and FAVA datasets are available under https://nyu-mll.github.io/CoLA

# Abstract

* Verbs occur in different syntactic environments, or frames
* We investigate whether neural networks encode frame-selectional properties
* on the sentence level, we
  * introduce five datasets, collectively called FAVA, containing
    * 10k sentences labeled for grammatical acceptability, illustrating
      different verbal argument structure alternations
  * test whether models can distinguish acceptable English verb-frame combos
    using a sentence embedding alone
* on the word level, we
  * construct LaVA, a corresponding word-level dataset, and
  * investigate whether the same features can be extracted from word embeds
* results
  * reliable classifications for some verbal alternations but not others,
    * while these representations do encode fine-grained lexical information,
      it is incomplete or can be hard to extract
* differences between the word~ and sentence-level models show that
  * some information present in word embeddings is not passed on to the
    down-stream sentence embeddings

# 1 Intro

* verbs encode how entities are related to, and participate in, events
  * verbs that are intuitively very similar in meaning may vary in synt frame
  _locsol/önt vmit vmire, meg~ vmit vmivel, `*`megönti a kancsót limonádéval_
* verb lexica (Grishman+ 1994; Baker+ 1998; Fillmore+ 2003;
  Kipper-Schuler, 2005; Kipper-Schuler+ 2006)
* word embedding can be used to predict which frames that verb can licitly
  * Lexical Verb–frame Alternations dataset (LaVA), based on Levin (1993), and
* sentence embeddings encode the frame-selectional properties
  * we semi-automatically generate sentences in such a way to ensure that the
    main verb’s frame alternation information is the only information
    determining the (un)grammaticality of the sentence
  * Frames and Alternations of Verbs Acceptability dataset (FAVA)
