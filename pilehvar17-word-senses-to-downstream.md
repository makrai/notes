Towards a Seamless Integration of Word Senses into Downstream NLP Applications
Mohammad Taher Pilehvar, Jose Camacho-Collados, Roberto Navigli, Nigel Collier
ACL 2017, Vancouver, Canada

https://github.com/pilehvar/sensecnn

# Abstract

* By incorporating a novel disambiguation algorithm
  into a state-of-the-art classification model, we create a pipeline to
  integrate sense-level information into downstream NLP applications
* We show consistent performance improvement on multiple
  topic categorization and polarity detection datasets, particularly
  when the fine granularity of the underlying sense inventory is reduced and
  the document is sufficiently large

# Intro

* sub-word or character-level information
  (Ballesteros+ 2015; Kim+ 2016)
* We designing a pipeline that enables seamless 
  integration of word senses into downstream NLP applications
  * benefiting from knowledge extracted from semantic networks
  * a quick graph-based Word Sense Disambiguation (WSD) algorithm
  * classification model based on Convolutional Neural Networks
    * shown to be very effective in various text classification tasks
      (Kalchbrenner+ 2014; Kim, 2014; Johnson and Zhang, 2015; Tang+ 2015; 
      Xiao and Cho, 2016)

# 2 Motivation

* MWEs
  * are lexical units idiosyncratic (Sag+ 2002)
  * recently received a considerable amount of interest
    (Tsvetkov and Wintner, 2014; Salehi+ 2015)
    Our pipeline facilitates this goal

# 3 Diambiguation Algorithm

* graph-based joint disambiguation and entity linking algorithm which can
  * take any arbitrary semantic network as input
  * speed and scalability
  * Conventional knowledge-based disambiguation systems
    * Hoffart+ 2012; Agirre+ 2014; Moro+ 2014; 
      Ling+ 2015; Pilehvar and Navigli, 2014
    * often rely on computationally expensive graph algorithms
  * supervised WSD and entity linking techniques
    (Zhong and Ng, 2010; Cheng and Roth, 2013; Melamud+ 2016;
    Limsopatham and Collier, 2016)
    * our algorithm relies only on semantic networks and [no sense-annotation]

# 4 Classification Model

* In our experiments, we use a standard NN based classification approach
  * similar to the
    * Convolution Neural Network classifier of Kim (2014) and the
    * pioneering model of Collobert+ (2011)

## 4.2 Pre-trained Supersense Embeddings

* WordNet sense distinctions are too fine-grained (Hovy+ 2013)
* grouping together similar senses of the same word, either using
  * automatic clustering techniques
    (Navigli, 2006; Agirre and Lopez, 2003; Snow+ 2007) or
  * with the help of WordNet’s lexicographer files [i.e.]
    * supersenses
      (Rüd+ 2011; Severyn+ 2013; Flekova and Gurevych, 2016)
    * 44 sense clusters  for categories such as event, animal, and quantity
    * supersense embeddings, we simply
      average the embeddings of senses in the corresponding cluster

# 5 Evaluation

## 5.2 Topic

when pre-trained representations are used to initialize the embedding layer, no
improvement is observed over the word-based model

## 5.3 Polarity

* Results are generally better than those of Kim (2014), showing that
  * the addition of the recurrent layer to the model was beneficial
* no consistent performance gain is observed  when the model is provided
  with disambiguated input, particularly for short reviews
  * We attribute this to the nature of the task
    * words rarely happen to be ambiguous with respect to their sentiment,
      the semantic sense distinctions introduce data sparsity
    * since the datasets mostly contain short texts, e.g., sentences or
      snippets, the disambiguation algorithm does not have sufficient context

## 5.4 Analysis

## Senses granularity

* reducing fine-granularity of sense distinctions can be beneficial to both
  tasks
  * irrespective of the underlying sense inventory, i.e. WordNet or Wikipedia
* corroborates [megerősíti] previous findings
    (Hovy+ 2013; Flekova and Gurevych, 2016)
* future work: the evaluation of other granularity reduction techniques for
  * WordNet (Snow+ 2007; Bhagwani+ 2013) and
  * Wikipedia (Dandala+ 2013)
