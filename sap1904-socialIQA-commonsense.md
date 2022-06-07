SocialIQA: Commonsense Reasoning about Social Interactions
Maarten Sap, Hannah Rashkin, Derek Chen, Ronan LeBras, Yejin Choi
EMNLP 2019 arXiv:1904.09728 [cs.CL]

* 38,000 multiple choice questions for probing emotional and social intelligenc
* (e.g., Q: "Jordan wanted to tell Tracy a secret, so Jordan leaned towards
  Tracy. Why did Jordan do this?" A: "Make sure no one else could hear")
* Through crowdsourcing, we collect commonsense questions
  along with correct and incorrect answers about social interactions
  * new framework that mitigates stylistic artifacts in incorrect answers by
    asking workers to provide the right answer to a different but related
    question
* results show that our benchmark is
  challenging for existing question-answering models based on pretrained LMs
  * compared to human performance (>20% gap)
* a resource for transfer learning of commonsense knowledge, achieving SOTA
  performance on multiple commonsense tasks (Winograd Schemas, COPA)

# 1 Intro

* Social and emotional intelligence (Ganaie and Mudasir, 2015)
  * reason about the mental states of others and their likely actions
  * Theory of Mind (Baron-Cohen+ 1985)
    * the ability to reason about the implied emotions and behavior of others,
    * social situations ranging from simple conversations with friends to
      complex negotiations in courtrooms (Apperly, 2010)
    * a longstanding but elusive goal of AI (Gunning, 2018)
* lack of large-scale resources to train and evaluate modern AI systems’ social
* pretraining large language models have yielded
  * promising improvements on several commonsense inference tasks, these models
    still struggle to reason about social situations, as shown by us and Davis
    and Marcus, (2015); Nematzadeh+ (2018); Talmor+ (2019) . This
* in written text corpora, bias of knowledge limits the scope of commonsense kn
  (Gordon and Van Durme, 2013; Lucy and Gauthier, 2017)
* In this work, we introduce Social Intelligence QA (SocialIQa ),
  * the first large-scale resource to learn and measure social and emotional
  * 38k multiple choice questions regarding the pragmatic implications of
  * crowdsourcing framework to gather contexts and questions that explicitly
  * combining handwritten negative answers with adversarial question-switched
    answers (Section 3.3), we minimize annotation artifacts that can arise from
    crowdsourcing incorrect answers (Schwartz+ 2017; Gururangan+ 2018)
* challenging for AI systems, with
  * our best performing baseline reaching 64.5% (BERT-large), significantly
* transfer learning for other commonsense challenges,
  * through sequential finetuning of a pretrained language model on SocialIQa
    before other tasks.  Specifically, we use SocialIQa to set a
* new SOTA on three commonsense challenge datasets:
  * COPA (Roemmele+ 2011) (83.4%), the
  * original Winograd (Levesque, 2011) (72.5%), and the
  * extended Winograd dataset from Rahman and Ng (2012) (84.0%)
* contributions are as follows:
  * SocialIQa, the first large-scale QA dataset aimed at testing soc & emo
  * question-switching, a technique to collect incorrect answers that
    * minimizes stylistic artifacts due to annotator cognitive biases
  * We establish baseline performance on our dataset, with BERT-large performing
    * well below human performance, close to 90%
  * We achieve new SOTA accuracies on COPA and Winograd
    * through sequential finetuning on SocialIQa, which implicitly endows

# 2 Task description

* correctly answering questions requires reasoning about
  motivations, emotional reactions, or likely preceding and following actions

## ATOMIC

* we draw upon social commonsense knowledge from ATOMIC (Sap+ 2019)
  to seed our contexts and question types
* ATOMIC is a large knowledge graph that contains
  * inferential knowledge about the causes and effects of 24k short events
  * Each triple in ATOMIC consists of
    * (e.g., “PersonX pays for PersonY’s ”, “xAttrib”, “generous”)
    * an event phrase with person-centric variables,
    * one of nine inference dimensions, and
      * causes of an event (e.g., “X needs money”)
      * its effects on the agent (e.g., “X will get thanked”) and
      * its effect on other participants (e.g., “Y will want to see X again”);
    * an inference object .  The nine inference dimensions in ATOMIC cover
* Given this base, we generate natural language contexts that represent
  specific instantiations of the event phrases found in the knowledge graph

# 3 Dataset creation

## 3.3 Negative Answers

* Handwritten Incorrect Answers (HIA) The
  * to be similar to the correct answers in terms of topic, length, and style but
* Question-Switching Answers (QSA) We col-
  * switching the questions asked about the context, as shown in Figure 2. We
  * to avoid cognitive biases and annotation artifacts in the candidates, such
    * e.g. negations (Schwartz+ 2017; Gururangan+ 2018). In this crowdsourcing
  * the same context as the original question, as well as a
  * question automatically generated from a different but similar ATOMIC dim
    * three groupings of ATOMIC dimensions: {xWant, oWant, xNeed, xIntent},
      {xReact oReact, xAttr}, and {xEffect, oEffect}., 6 and ask workers to
* To verify this, we compare valence, arousal, and dominance (VAD) levels
  across answer types, computed using the VAD lexicon by Mohammad (2018)
  Figure 4 shows effect sizes (Cohen’s d) of the differences in VAD means,
  where the magnitude of effect size indicates how different the answer types
  are stylistically. Indeed, QSA and correct answers differ substantially less
  than HIA answers (|d|≤.1). 7

# 4 Methods

* baseline performance on SocialIQa, using large pretrained Transformer LMs,
  OpenAI-GPT (Radford+ 2018) and BERT (Devlin+ 2019), which have both shown

# 5 Experiments

## 5.2 Results

### Learning Curve. To better understand the effect of dataset scale on model

* Figure 5: Dev accuracy when training BERT-large with various number of examp
* significantly improve over a random baseline of 33% with only a few hundred
  * starts to converge after around 20k examples, providing evidence that
  * human performance (86.9%)
  * to reach >80%, the model would require nearly 1 million training examples

### Error Analysis

* breakdown of our best model’s performance on various question types in Fig 6
  * pre-conditions of the context (people’s motivations, actions needed before
    the context) are less challenging for the model. Conversely, the model
  * struggle more with questions relating to (potentially involuntary) effects,
    stative descriptions, and what people will want to do next
* Examples of errors in Table 3 further indicate that, instead of doing
  * models may only be learning lexical associations between the context, q & a
  * as hinted at by Marcus (2018) and Zellers+ (2019b Hellaswag). This
  * leads to incorrect timing (examples 3 and 4) or
    answers pertaining to the wrong participants (examples 5 and 6), despite
* We expect that this task would benefit from models
  * capable of more complex reasoning about entity state, or models that are
  * more explicitly endowed with commonsense (e.g. from KGs like ATOMIC)

# 6 SocialIQa for Transfer Learning

### COPA. The Choice of Plausible Alternatives task (COPA; Roemmele+ 2011) is a

* a two-way multiple choice task which aims to measure commonsense reasoning
* 1,000 questions (500 dev, 500 test) that ask about the causes and effects of

### Winograd Schema. The Winograd Schema Challenge (WSC; Levesque, 2011) is a

* 273 short sentences in which a pronoun must be resolved to one of two
* Rahman and Ng (2012) created 943 Winograd-style sentence pairs, henceforth
  referred to as DPR, which has been shown to be slightly less challenging than

## 6.1 Sequential Finetuning

### Results Shown in Table 4, sequential finetuning on SocialIQa yields

* substantial improvements over the BERT-only baseline (between 2.6 and 5.5%)
* general increase in performance stability (i.e., lower standard deviations)
* Note that OpenAI-GPT was reported to achieve 78.6% on COPA, but that result
  was not published, nor discussed in the OpenAI-GPT white paper (Radford+ 18)

### Effect of scale and knowledge type. To better understand these improvements

* when using SWAG (a similarly sized dataset) instead of SocialIQa, the
  downstream performance on COPA is lower (76.2%)

# 7 Related Work

### Commonsense Benchmarks: their creation has been well-studied

* Whereas WSC requires physical and social commonsense knowledge to solve,
  * COPA targets the knowledge of causes and effects surrounding social situs
* both benchmarks are of high-quality and created by experts, their small scale
* Talmor+ (2019) introduce CommonsenseQA, containing 12k multiple-choice
  * Crowdsourced using ConceptNet (Speer and Havasi, 2012), these questions
    mostly probe knowledge related to factual and physical commonsense
    (e.g., “Where would I not want a fox?”). In contrast, SocialIQa

## Commonsense Knowledge Bases: In addition to large-scale benchmarks, a wealth

* (Speer and Havasi, 2012; Sap+ 2019; Zhang+ 2017; Lenat, 1995 Cyc;
  Espinosa and Lieberman, 2005; Gordon and Hobbs, 2017)
  * Sheng Zhang, Rachel Rudinger, Kevin Duh, and Benjamin Van Durme. 
    Ordinal common-sense inference
    TACL 2017, 5(1):379–395
  * José H. Espinosa and Henry Lieberman
    Eventnet: Inferring temporal relations between commonsense events
    MICAI 2005
  * Andrew S Gordon and Jerry R Hobbs
    A Formal Theory of Commonsense Psychology: How People Think People Think
    Cambridge University Press 2017
* format: natural language QA benchmark vs a taxonomic knowledge base

## Constrained or Adversarial Data Collection: Various work has investigated

* Sharma+ (2018) extend the Story Cloze data by
  severely restricting the incorrect story ending generation task,
  reducing the sentiment and negation artifacts
* Rajpurkar+ (2018) create an adversarial version of
  the extractive question-answering challenge, SQuAD (Rajpurkar+ 2016), by
  creating 50k unanswerable questions
* Instead of using human-generated incorrect answers, Zellers+ (2018, 2019b)
  use adversarial filtering of machine generated incorrect answers to minimize
* we multistage annotation pipeline in which we
  negative responses collection methods including adversarial Q-switching tech
