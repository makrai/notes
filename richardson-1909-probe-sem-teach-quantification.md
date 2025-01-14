Probing NLI Models through Semantic Fragments
Kyle Richardson, Hai Hu, Lawrence S. Moss, Ashish Sabharwal
arXiv:1909.07521 [cs.CL]

# Abstract

* abilities such as boolean coordination, quantification, conditionals,
  comparatives, and monotonicity reasoning (i.e., about word subst in sentence)
* unclear the extent to which they are captured in existing NLI benchmarks
* we propose the use of semantic fragments---systematically generated datasets
  that each target a different semantic phenomenon---for probing
* experiments, using a library of 8 such semantic fragments
* two remarkable findings:
  * SOTA models, including BERT, that are pre-trained on existing NLI benchmark
    perform poorly on these new fragments
  * with only a few minutes of additional fine-tuning
    * with a carefully selected learning rate and
      a novel variation of "inoculation"
    * a BERT-based model can master all of these logic and monotonicity fragms
      while retaining its performance on established NLI benchmarks

# 1 Introduction

* Natural language inference (NLI)
  * determine whether the second sentence, known as the hypothesis sentence,
    follows from the meaning of the first sentence (the premise)
  * involve a wide range of reasoning and knowledge phenomena, including
    knowledge that goes beyond basic linguistic understanding
    (e.g., elementary logic)
* large-scale NLI datasets
  * Stanford NLI datasets (SNLI, Bowman+ 2015) and
  * MultiNLI (MNLI, Williams, Nangia, and Bowman 2018), coupled with new
* advances in neural modeling and model pre-training
  (Conneau+ 2017; Devlin+ 2019)
* increased scrutiny {critical examination} of systematic annotation biases
  (Poliak+ 2018b; Gururangan+ 2018)
* attempts to build new benchmarks that focus on particular linguistic phenomena
  (Glockner, Shwartz, and Goldberg 2018; Naik+ 2018; Poliak+ 2018a)
  * Glockner, M.; Shwartz, V.; and Goldberg, Y
    ACL 2018
    Breaking NLI Systems with Sentences that Require Simple Lexical Inferences
  * Naik, A.; Ravichander, A.; Sadeh, N.; Rose, C.; and Neubig, G
    COLING 2018
    Stress Test Evaluation for NLI
  * Poliak, A; Haldar, A; Rudinger, R; Hu, J E; Pavlick, E; White, AS; Van Durme
    EMNLP 2018a
    Collecting Diverse NLI Problems for Sentence Representation Evaluation
  * questions such as: are models able to effectively learn and extrapolate
    complex knowledge and reasoning abilities when trained on benchmark tasks?
* challenge datasets limited by the simple types of inferences they included
  (e.g., lexical and negation inferences)
  * fail to cover more complex reasoning phenomena related to logic, and
    primarily use adversarially generated corpus data
  * datasets that are easily constructed and/or verified using crowdsrc
  * requires datasets that are hard even for humans, but that are nonetheless
    based on sound formal principles (e.g., reasoning about monotonicity where,
    several nested downward monotone contexts are involved
    * compositionality, cf.  Lake and Baroni (2017))
* we propose using semantic fragments—
  * synthetically generated challenge datasets, of the sort used in linguistics,
* we look at eight types of fragments that cover several fundamental aspects
  * monotonicity reasoning using two newly constructed challenge datasets
  * six other fragments that probe into rudimentary logic using new versions of
    the data from Salvatore, Finger, and Hirata Jr (2019)
* our proposed method works in the following way: As illustrated in Figure 1
  * create a formal specification, a formal rule system with guarantees
  * automatically generate a new idealized challenge dataset
  * three empirical questions
    * Is this fragment learnable from scratch using existing NLI architectures
      (if so, are the resulting models useful)?
    * How well do large SOTA pre-trained NLI models do on this task?
      (i.e., models trained on all known NLI data such as SNLI/MNLI)
    * Can existing models be quickly re-trained or re-purposed to be robust on
      these fragments
      * if so, does mastering the fragment affect performance on the original t?
* are there linguistic fragments that are hard for these pre-trained models to
  adapt to or that confuse the model on its original task?
* On these eight fragments, we find that while
  * existing NLI architectures can effectively learn these linguistic pheneomena
  * pre-trained NLI models do not perform well
  * as in other studies (Glockner, Shwartz, and Goldberg 2018)
* can continuing the learning and re-fine-tuning these models on fragments
  (using a novel and cheap inoculation (Liu, Schwartz, and Smith 2019) strategy)
  improve performance?
  * mixed results depending on the particular linguistic phenomena and model
    * e.g. comparatives, re-training some models degrade performance on the orig
    * e.g. monotonicity, the learning is more stable, even across models

# Related Work

* semantic fragments has a long tradition in logical semantics, starting with
  * Pratt-Hartmann (2004) in defining a semantic fragment more precisely as a
    subset of a language equipped with semantics which translate sentences in a
    formal system such as first-order logic. In contrast to work on empirical
    NLI, such linguistic work often emphasizes the complex cases of each
    phenomena in order measure competence (see Chomsky (1965) for a discussion
  * our fragment sets
    1. basic logic
      * target formal system includes basic boolean algebra, quantification, set
        comparisons and counting (see Figure 2), and
      * builds on the datasets from Salvatore, Finger, and Hirata Jr (2019). For
    2.  monotonicity reasoning, the
      * target formal system is based on the monotonicity calculus of van
        Benthem (1986) (see review by Icard and Moss (2014))
      * constructed build on recent work on automatic polarity projection
        (Hu and Moss 2018; Hu, Chen, and Moss 2019; Hu+ 2019)
* learn neural models from fragments and small subsets of language, which
  * syntactic probing (McCoy, Pavlick, and Linzen 2019; Goldberg 2019),
  * probing basic reasoning (Weston+ 2015; Geiger+ 2018; 2019) and
  * probing other (Lake and Baroni 17; Chrupała and Alishahi 19; Warstadt+ 19)
  * Geiger+ (2018) is the closest work to ours
    * hE, focus on artificial fragments that deviate from ordinary language,
    * our fragments aim to test naturalistic subsets of English
      (despite being automatically constructed and sometimes a bit pedantic)
* collect datasets that target different types of inference phenomena
  (White+ 2017; Poliak+ 2018a)
* complex phenomena such as monotonicity reasoning in NLI models
  * training data augmentation (Yanaka+ 2019b), whereas we create several new
  * Yanaka+ (2019a) for closely related work that appeared concurrently
* NLI challenge datasets (Glockner, Shwartz, and Goldberg 2018; Naik+ 2018),
* we focus on the trade-off between
  * mastering a particular linguistic fragment or phenomena independent of other
    tasks and data (i.e., Question 1 from Figure 1), while also
  * maintaining performance on other NLI benchmark tasks (i.e., related to
    Question 3 in Figure 1)
* we introduce a novel variation of the inoculation through finetuning
  * Liu, Schwartz, and Smith (2019)
  * maximizing the model’s aggregate score over multiple tasks
  * we: how much a particular linguistic fragment stresses an existing NLI model
* we inoculate with the SOTA pretrained BERT model,
  * In addition to the task-specific NLI models looked at in Liu+ (2019),
  * using the fine-tuning approach of Devlin+ (2019), which itself is
    * based on the transformer architecture of Vaswani+ (2017)

# Some Semantic Fragments 3

```
Negation	    |Laurie has only visited Nephi, Marion has only visited Calistoga
CONTRADICTION	|Laurie didn’t visit Calistoga
Boolean	      |Travis, Arthur, Henry and Dan have only visited Georgia
ENTAILMENT	  |Dan didn’t visit Rwanda
Quantifier	  |Everyone has visited every place
NEUTRAL	      |Virgil didn’t visit Barry
Counting	    |Nellie has visited Carrie, Billie, John, Mike, .., and Arthur
ENTAILMENT	  |Nellie has visited more than 10 people
Conditionals	|Francisco has visited Potsdam and if Francisco has visited
ENTAILMENT    |Tyrone has visited Pampa
Comparatives	|J is taller than G and Erik..., and Mitchell is as tall as J
NEUTRAL	      |Erik is taller than G.
Monotonicity	|All black mammals saw exactly 5 stallions who danced
ENTAILMENT    |A brown or black poodle saw exactly 5 stallions who danced
SNLI+MNLI	    |During calf roping a cowboy calls off his horse
CONTRADICTION	|A man ropes a calf successfully
```

# Experimental Setup and Methodology 4

* we experiment with two task-specific NLI models from the literature
  * ESIM model of Chen+ (2017) and the
  * decomposable-attention (Decomp-Attn) model of Parikh+ (2016) as implemented
    in the AllenNLP toolkit (Gardner+ 2018), and the
    pre-trained BERT architecture of Devlin+ (2019)
* q1: whether fragments can be learned from scratch (Question 1),
  we train models on these fragments directly using standard training protocols
* q2: evaluate pre-trained NLI models on individual fragments (Question 2), we
  train BERT models on combinations of the SNLI and MNLI datasets from GLUE
  (Wang+ 2018), and use pretrained ESIM and Decomp-Attn models trained on MNLI
  following Liu, Schwartz, and Smith (2019)
* q3: whether a pre-trained NLI model can be retrained to improve on a fragment
  * we employ the recent inoculation by fine-tuning method (Liu+ 2019).  The
  * to re-fine-tune (i.e., continue training) the models above using k pieces of
    fragment training data
  * Our approach to inoculation, which we call lossless inoculation, differs
    * explicitly optimizing the aggregate score of each model on both its
      original and new task
      * fine-tuning is sensitive to hyper-parameters, 3 we use the following
      * For each k we fine-tune J variations of a model architecture, denoted M

## Additional Baselines

* ensure that the challenge datasets are not trivially solvable
* variants of the Hypothesis-Only baselines from Poliak+ (2018b)
* We used the same model to train a Premise-Only model

# Results and Findings 5

* resulting models perform below random chance on benchmark tasks
  * even holds for results on the GLUE diagnostic test (Wang+ 2018), which was
    hand-created and designed to model many of our logical phenomena

# Discussion and conclusion 7

* Given a particular linguistic hole in an NLI model, one can plug this hole by
  simply generating synthetic data and using it to re-train a model

## Can we find more difficult fragments?

* commonsense reasoning common in existing NLI tasks (LoBue and Yates 2011)
* Benchmark NLI annotations and judgements are often imperfect and error-prone
  (Kalouli, de Paiva, and Real (2017), Pavlick and Kwiatkowski (2019)),
  partly due to the loose way in which the task is traditionally defined
  (Dagan, Glickman, and Magnini 2005)
  * probing the particular flavor of NLI that is captured in each benchmark

## What are Models Actually Learning?

* correlate neural activation patterns and target symbolic patterns
  (Chrupała and Alishahi 2019)
  might help determine the extent to which models are truly generalizing
