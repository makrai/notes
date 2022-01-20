WinoWhy: A Deep Diagnosis of Essential Commonsense Knowledge for Answering Wino
Hongming Zhang, Xinran Zhao, Yangqiu Song
ACL 2020

WinoWhy and all codes: https://github.com/HKUST-KnowComp/WinoWhy

# Abstract

* we: comprehensive categorization of essential commonsense knowledge for
  answering the Winograd Schema Challenge (WSC)
* annotators to
  * first provide reasons for making correct decisions and
  * then categorize them into six major knowledge categories
* understand the limitation of existing methods
  * (i.e., what kind of knowledge cannot be effectively represented or inferred)
  * (e.g., the property of entities, temporal knowledge, or spatial knowledge)
  * shed some light on the commonsense knowledge that we need to acquire
  * investigate whether current WSC models can understand the commonsense or
    they simply solve the WSC questions based on the statistical bias of the
    dataset,
* new task called WinoWhy, which
  * requires models to distinguish very similar plausible/wrong reasons
  * pre-trained language representation models are still struggling at WinoWhy
  * Further experiments show that even though supervised models achieve better
    performance, the performance of these models can be sensitive to things

# 1 Introduction

* Commonsense reasoning has attracted much attention in the NLP community
  (Levesque+ 2012; Zhou+ 2018; Ostermann+ 2018; Talmor+ 2019)
* Winograd Schema Challenge (WSC, Levesque+ 2012) is a hard pronoun coref task
  * commonly used features (e.g., gender, plurality, and co-occurrence freq) do
    not have any effect
  * Humans can solve these questions because of their shared commonsense knowl
  * e.g. because
    ‘hungry’ is a common property of something eating things while
    ‘tasty’ is a common property of something being eaten
* people tried to leverage
  * crowdsourced commonsense knowledge bases (Liu+ 2017) or
  * search engines (Emami+ 2018) to solve the WSC task
  * pretrained language repr models (Kocijan+ 2019; Radford+ 2019; Liu+ 2019)
  * hE, not clear about why they can do better and how to further improve them
* we present the first deep diagnosis of essential commonsense knowl for WSC
  * though SOTA models can achieve about 90% accuracy on the original WSC task,
    they are still struggling on WinoWhy questions
  * though supervised models can achieve better performance,
    these models can be sensitive to the dataset distribution, which
    indicates that the improvement is probably coming from better capturing the
    statistical bias of the dataset

# 2 diagnosis of essential commonsense knowledge for answering WSC questions

## 2.1 Reason collection

* a two-phase annotation procedure to collect the knowledge
  1. we ask annotators to provide reasons for all WSC questions
  2. evaluate the quality of collected reasons

## 2.2 knowledge categorization

### 2.2.1 Knowledge Types

* A good categorization standard should have two properties:
  * Broad Coverage
  * Exclusive: clear boundaries between different categories
* two categorization methods of commonsense knowledge:
  1. Conceptual Semantic Theory
    * According to Jackendoff’s original theory (Jackendoff, 1990),
      the semantics of human language can be expressed with a finite set of
      * mental primitives and a finite set of
      * principles of mental combination
    * the definition of mental primitives may vary by different data or langs
    * common primitives (i.e., entity, property, number, location, state, event,
      and activity) can be observed
    * These common primitives can thus be used as knowledge types
  2. ConceptNet: As one of the most popular commonsense knowledge resources,
     ConceptNet 1.0 (Liu and Singh, 2004) defines 20 commonsense relations,
     which belong to eight categories (i.e., K-lines, Things, Agents, Events,
     Spatial, Causal, Functional, and Affective)
     * In the latest version of ConceptNet (Speer+ 2017), more relations
       (e.g., ‘RelatedTo’) from other resources are merged into ConceptNet
* As the 2017 relations are relatively vague,
  we still follow the definition in ConceptNet 1.0 for the categorization
  * some overlaps between semantic primitives and categories in ConceptNet
    (e.g., ‘Agents’ and ‘Functional’ both describe certain properties of some
    objects)
  * we first adopt all the commonly observed primitives in (Jackendoff, 1990)
    as the base knowledge types and
  * then modify them based on the definition of categories from ConceptNet
  * For example, three primitives (activity, state, and event) and Events from
    ConceptNet can all be covered by the definition of Eventuality (Mourelatos,
    1978). For the simplicity of the categorization and the quality of the
    annotation, we merge them
  * we remove ‘K-lines’ because it
    * contains relations like ‘ConceptuallyRelatedTo’, which is relatively
      vague and difficult to be distinguished from other categories
  * we remove ‘Causal’
    because we found out that annotators had difficulty understanding
    * tended to annotate all reasons as ‘Causal’
      because they think all reasons can somehow ‘cause’ the decision making
  * an additional type ‘Others’ is provided
  * Names, definitions, and examples of selected knowledge types are shown:

|Name       | Definition:         | Examples                            |
|           | Knowledge about...  |                                     |
|-----------|---------------------|-------------------------------------|
|Property   | property of objects | ice is cold                         |
|Object     | objects             | cats have ears                      |
|Eventuality| eventualities       | ‘wake up’ happens before ‘open eyes’|
|Spatial    | spatial position    | object at the back can be blocked   |
|Quantity   | numbers             | 2 is smaller than 10                |
|Others     | All other knowledge | NA                                  |

### 2.2.2 Annotation

* each reason may contain inference over multiple knowledge types
* distribution of annotation results in Figure 4
  * objects (e.g., ‘cats have ears’) and eventualities (e.g., ‘people who give
    help often receive thanks later’)
* only 17% of all reason annotations (839) are ‘Others’
* inner annotator agreement (IAA) and kappa coefficient (McHugh, 2012)
  * IAA pair-wisely among all annotators
  * The average IAA is 78.72%
  * kappa coef based on the five raters and five categories setting: 0.80
* For each WSC question, we select the most popular knowledge type
  * 222/51 questions have single/multiple knowledge type(s)

# 3 how we create WinoWhy

## 3.2 Candidate Selection

* For each question, three kinds of candidate reasons are selected for annotion
  * The first reason resource is human annotation
  * negative examples: we consider the reasons provided by humans for the
    reverse question as some very similar but wrong reasons as
  * generation model (i.e., GPT-2 Radford+ (2019)) to generate reasons
    * (e.g., ‘The fish ate the worm.  it was hungry.  It refers to fish
      because’) to the generation model and ask it to finish the sentences
    * beam search to find the top five generated reasons

## 3.3 Annotations

* annotate whether the reasons are plausible or not

## 3.4 Dataset Analysis

* even though the majority of reverse reasons are not plausible, some of them
  do make sense
  * when the reason is comparing some property of both candidates, it can be
    used for both questions
  * “The trophy doesn’t fit into the brown suitcase because it is too small/l”
    explanations like “Only small objects can fit into large objects” are
    plausible for both questions
* most of the reasons generated by GPT-2 have relatively low quality
  * GPT could generate some meaningless words (e.g., ‘-C.B.’)
  * some of the answers are related and complete sentences by themselves, but
    they are not a valid reason for the question
  * e.g. Given the sentence “Bob paid for Charlie’s college education. He is
    very grateful. The ‘He’ refers to Charlie because ”, the reasons generated
    * he’s the one who’s given him the money to do so
    * it was Charlie who started the discussion and who encouraged Charlie to
      take up the challenge
* In total, WinoWhy contains 1,270 positive and 1,595 negative examples
  * positive: at least four out of five annotators regard one reason as plausbl
  * negative: at most one annotator thinks it is plausible
  * All others are discarded from WinoWhy, To ensure the clear boundary

# 4 experiments on the original WSC 5

## 4.1 Evaluated Methods and Implementation

1. BERT (Devlin+ 2019): As a powerful contextualized word representation model,
  * Kocijan+ (2019): we can first convert the original WSC task into a token
   prediction task and then leverage BERT to solve the problem. We denote the
2. GPT-2 (Radford+ 2019) is one of the best pre-trained LMs for generaton
  * As reported in the original paper, we can first replace the pronouns with
    different candidates and leverage the probability of the full or partial
    sentences to make the prediction.  Here we evaluate the small (117 M
    parameters) and the large (774 M parameters) models and denote those
3. RoBERTa (Liu+ 2019) is a recent improved version of BERT with
  * larger amount of training instances and techniques such as dynamic masking,
  * We denote the base and large models of RoBERTa as RoBERTa (base) and RoBERTa
* as indicated by (Kocijan+ 2019), fine-tuning BERT with a similar pronoun
  resolution dataset WSCR (Rahman and Ng, 2012) can help boost the performance
  * Sakaguchi+ (2019) has further enhanced the performance by fine-tuning
    RoBERTa with a larger and more balanced dataset WinoGrande
  * we evaluate the combination of different pre-trained models and fine-tuning
  * BERT (base/large) + WSCR/Grande and RoBERTa (base/large) + WSCR/Grande

## 4.2 Result Analysis

* observations
  * Larger models perform better on all knowledge types
  * The partial version of GPT-2 significantly outperforms the full version
    * consistent with the observation in Trinh and Le, (2018)
    * mainly because the influence of imbalanced distribution of candidate wrds
      is relieved by only considering the sentence prob after the pronouns
    * Such observation also explains why GPT-2 can outperform unsupervised BERT
      on WSC because models based on BERT, which rely on predicting the
      probability of candidate words, cannot get rid of such noise;
  * For most models, spatial knowledge is the most challenging
    * One possible explanation is that the inference over spatial knowledge is
      often triggered by a preposition (e.g., ‘in’ or ‘behind’), which is
      challenging for language representation models to remember
  * Questions belonging to ‘Others’ involve more complex inference,
    even over multiple types of knowledge and thus
    most models perform poorly on that. The only exception is RoBERTa
  * Fine-tuning over WinoGrande significantly boosts the performance
* complex reasoning: how different models perform in it
  * we divide all WSC questions based on how many knowledge types are required
  * small models (e.g., BERT (base) and RoBERTa (base)) perform better on
    questions that require single knowledge types rather than multiple types
  * However, for large models (e.g., BERT (large) and RoBERTa (large)), as long
    as the suitable fine-tuning dataset is provided, they can achieve
    similar and even better performance on the complicated questions
    * consistent with our previous observations that large models can solve
      complex questions from the ‘Others’ category with suitable fine-tuning

# 5 experiments on WinoWhy 7

## 5.1 Unsupervised Setting

## 5.2 Supervised Setting

## 5.3 Discussion

# 6 related work about commonsense reasoning 9

* knowledge categories like causality (Sap+ 2019), reasoning (Schubert, 2015),
  property (Liu and Singh, 2004), and quantity (Elazar+ 2019)
* downstream tasks like question answering (Lin+ 2019),
  dialogue system (Zhou+ 2018), reading comprehension (Wang+ 2018), and
  pronoun coreference resolution (Levesque+ 2012)
* solve WSC questions in an unsupervised way by leveraging either
  * search engines (Emami+ 2018),
  * linguistic knowledge (Zhang+ 2019, 2020), or
  * language representation models (Kocijan+ 2019)
  * still cannot fully solve the problem, but not clear how to improve them
* the conventional definition of commonsense knowledge is too vague
  * what kinds of knowledge are still challenging for current models

# 7 conclude this paper
