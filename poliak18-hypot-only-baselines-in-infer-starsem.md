Hypothesis Only Baselines in Natural Language Inference
Adam Poliak, Jason Naradowsky, Aparajita Haldar, R Rudinger, Benjamin Van Durme
naacl 2018

#Abstract

* [is] inference [a] relationship between a context and a hypothesis?
*  experiments on ten distinct NLI datasets
* hypothesisonly model, ... significantly outperform a majorityclass baseline

#1 Intro

* datasets ... vary in ... size, construction, genre, label classes
  Dagan et al., (2006, 2013), Nangia et al., (2017)
* related work
  * MacCartney (2009) used a simple bagofwords model to evaluate early
    iterations of Recognizing Textual Entailment (RTE) challenge sets
  * Rudinger et al.  (2017) and in unpublished work
    * hypotheses in the Stanford Natural Language Inference (SNLI) dataset 
  * Concurrently, Tsuchiya (2018) and Gururangan et al.  (2018) similarly
    trained an NLI classifier with access limited to hypotheses and discovered
    similar results on three of the ten datasets that we study.
    
#2 Motivation

* [further related work]
  * In the Story Cloze task (Mostafazadeh et al., 2016, 2017)
    * a model is presented with a short foursentence narrative and  
      asked to complete it by choosing one of two suggested ...  sentences.
    * Schwartz et al.  (2017b) achieved stateoftheart performance by
      ignoring the narrative and training a linear classifier with features
      related to the writing style of the two potential endings
    * features focusing on sentence length, sentiment, and negation are
      sufficient for achieving high accuracy on this dataset 
      (Schwartz et al., 2017a; Cai et al., 2017; Bugert et al., 2017)

#3 Methodology

* We modify Conneau et al. (2017)’s InferSent method 
  * A Conneau, D Kiela, H Schwenk, L Barrault, & A Bordes. 
  EMNLP 2017. 
  Supervised learning of universal sentence representations 
  from natural language inference data 
  * performed competitively with the bestscoring systems on [SNLI] while being 
    representative of the types of neural architectures commonly used for NLI
  * uses a BiLSTM encoder, and constructs a 
    sentence representation by maxpooling over its hidden states
  * representation of a hypothesis is used as input to a MLP classifier

#5 Datasets

* ten NLI datasets and 
  categorize[d] into three distinct groups based [how] they were constructed.

##Human elicited

* humans were given a context and 
  asked to generate a corresponding hypothesis and label 
* they are the largest datasets included in our study and are currently 
* popular amongst researchers 
* datasets
  * Stanford Natural Language Inference (SNLI) 
    * premise sentence (sourced from Flickr image captions)
    * stereotypical biases based on gender, race, and ethnic stereotypes 
      (Rudinger et al., 2017) 
  * MultiNLI 
    * a recent expansion of SNLI (Williams et al., 2017). 
    * Premises ... can originate from fictional stories, personal letters,
      telephone speech, and a 9/11 report.

##Human Judged

* hypotheses and premises were automatically paired but labeled by a human,
* datasets 
  * Sentences Involving Compositional Knowledge (SICK) Marelli et al. (2014)
    * rules to expand or normalize ... premises to [make them]  more difficult
  * Addone RTE 
    * mixedgenre dataset 
    * tests whether NLI systems can understand adjectivenoun compounds
      (Pavlick and CallisonBurch, 2016)
    * To create hypotheses, adjectives were removed or inserted 
  * SciTail is an NLI dataset (Khot et al., 2018)
    * TODO or not TODO
  * Multiple Premise Entailment (MPE) Unlike
  * Johns Hopkins Ordinal CommonSense Inference (JOCI)

##Automatically Recast

* automatically generated from existing datasets for other NLP tasks, and
  sentence pairs were constructed and labeled with minimal human intervention,
  We use the recast datasets from White et al. (2017) 
* datasets 
  * Semantic ProtoRoles (SPR) 
    * Inspired by Dowty (1991)’s thematic role theory, 
      Reisinger et al.  (2015) introduced the SPR labeling task
      SPR ... decomposing semantic roles into ... properties 
      e.g. the ... argument was likely aware of the given predicated situation.
    * 2way labeled NLI sentence pairs were generated from SPR annotations by
        creating general templates.
  * Definite Pronoun Resolution (DPR)
    * In the original dataset, sentences contain two entities and one pronoun,
    * In the recast version, the 
      * premises are the original sentences and the 
      * hypotheses are the same sentences with the pronoun replaced 
    * this mechanism would appear to maximally benefit a hypothesisonly
      approach, as the hypothesis semantically subsumes the context.
  * FrameNet Plus (FN+) 
    * Using paraphrases from PPDB (Ganitkevitch et al., 2013), 
      Rastogi and Van Durme (2014) automatically replaced words with their PPs
      * Subsequently, Pavlick et al. (2015) asked crowdsource workers to judge
      how well a sentence with a paraphrase preserved the ...  meaning
      * we [suppose that] notentailed examples 
        might not keep ... in the spirit of NLI

#5 Results

## Criticism of the Majority Baseline 

* Across six of the ten datasets, our hypothesisonly model 
  * significantly outperforms the majoritybaseline, even 
  * outperforming the best reported results on one dataset, recast SPR
* it is unclear whether the construction method is responsible 
  * largest relative gains are on humanelicited models 
  * baseline performances of [other datasets] are noticeably larger
  * by including multiple genres, an NLI dataset may contain less biases
* On three of the five human judged datasets, the hypothesisonly model defaults
  to labeling each instance with the majority class tag. We find the same
  behavior in one recast dataset (DPR)

#6 Statistical Irregularities

* specific words, grammaticality, and lexical semantics.

##Can Labels be Inferred from Single Words?

* conditional probability of a label l given the word w 
* if P(l|w) is highly skewed across labels, there exists the [a] bias.
* Figure 2 
* In DPR, ... a weaker effect

##What are “Give-away” Words?

* instrument -> entailment, tall -> neural, sleeping, asleep, sleeps -> contrad

###Qualitative Examples 

* In our top10 list, for example, 
  * three words refer to the act of sleeping.
    * many contexts, which are sourced from Flickr, naturally deal with activities.
    * crowdsource workers often do not generate contradictory hypotheses that
    require fine grained semantic reasoning
  * universal negation constitutes four 
* eliciting norming data are prone to repeated responses across subjects 
  (McRae et al., 2005) (see discussion in §2 of (Zhang et al., 2017))

##6.3 On the Role of Grammaticality

#7 Related Work

##Non-semantic information to help NLI

* sentence structure

##World Knowledge and NLI

##NLI’s resurgence

* NLI, [in the mid-2000’s] commonly referred to as RTE
* Bowman et al. (2015) sparked a renewed interested in NLI, 
  particularly among deep-learning researchers

#8 Conclusion

* future work, we plan to apply a similar hypothesis-only baseline to
  multi-modal tasks that ... classify the relationship between two inputs, 
  e.g.  Visual QA (Antol et al., 2015)
