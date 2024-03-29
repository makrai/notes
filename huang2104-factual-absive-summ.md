The Factual Inconsistency Problem in Abstractive Text Summarization: A Survey
Y Huang, X Feng, X Feng, B Qin
arXiv preprint arXiv:2104.14839, 2021 arxiv.org

# Abstract

* neural encoder-decoder models pioneered by Seq2Seq framework: more abstractive
  * their format is closer to human-edited summaries and output is more readable
* hE, distortion or fabrication of factual information in the article
  * previous evaluation methods of text summarization are not suitable for this
* the current research in response is predominantly divided into two
  * fact-aware evaluation metrics to select outputs without factual inconsistenc
  * new summarization systems towards factual consistency
* we presenting a comprehensive review of these

# 1 Introcduction

* factual inconsistency errors: the summary sometimes distorts or fabricates fct
  * up to 30% of the summaries generated by abstractive models contain inconsist
    [Kryscinski+ 2020; Falke+ 2019]
* most existing summarization evaluation tools calculate N-gram overlaps
  * Zhu+ [2020] point that the generated summaries are often high in token level
    metrics like ROUGE [Lin, 2004] but lack factual correctness
* In the past three years, more than twenty studies on factual consistency of
  summarization have been proposed

# 2 Background

## 2.1 abstractive summarization

* Conventional abstractive summarization methods usually
  extract some keywords from the source document, and then
  reordering + linguistically motivated transformations to these keywords
  [Zajic+ 2004]
  * easy to produce influent sentences [Hahn and Mani, 2000]
* encoder and decoder
  * Nallapati+ [2016] first proposed to use an RNN
    * RNN encoder to encode the source document into a sequence of word vectors,
    * another RNN (i.e.  decoder) to generate a sequence of words as the summary
  * CNN [Narayan+ 2018] and Transformer [Vaswani+ 2017]
    * decoder is a conditional language model: readable and fluent [Fan+ 2018]
    * mostly trained to maximize the log-likelihood of the reference summary at
      the word-level, which does
      not necessarily reward models for being faithful [Maynez+ 2020]

## 2.2 factual inconsistency problem

### Intrinsic hallucination Maynez+ [2020]: a fact that contradicts the source

* e.g. the word “central”, which is contradicted to “north” in the source

### Extrinsic hallucination: a fact that is neutral to the source document

* neither supported nor contradicted by the source document
* e.g. “killing at least seven people and injuring more than 100”, which is not
* existing factual consistency
  * optimization methods mainly focus on intrinsic errors, and
  * evaluation metrics: these two categories are not distinguished

# 3 factual consistency evaluation metrics and meta-evaluation for these metrics

* We divide factual consistency metrics into unsupervised and weakly supervised,
  * Unsupervised metrics use existing tools to evaluate factual consistency
    * According to tools that unsupervised metrics base on, we further divide to
      * Triple-based, Textual entailment-based, QA-based, and Others
  * Weakly supervised metrics need to train on the factual consistency data,
    * documents, model-generated summaries, and factual consistency scores
* Meta-evaluations to compare factual consistency metrics with each other
  * We introduce 2 meta-evaluation works about factual consistency
* existing metrics in Table 1. There is code for
  QAGS [Wang+ 2020] FEQA [Durmus+ 2020] FactCC [Kryscinski+ 2020]

## Unsupervised Metrics

### Triple-based

* Facts are represented by relation triples (subject, relation, object)
* To extract triples, Goodrich+ [2019]
  * first try to use OpenIE [Banko+ 2007]
    * unspecified schema i.e. no pre-defined relations set
  * use relation extraction tools with fixed schema

### Textual entailment-based

* Falke+ [2019] propose to use textual entailment prediction tools to evaluate
  * also known as Natural Language Inference (NLI)
  * out-ofthe-box entailment models do not yet offer the desired performance
    * reasons
      * domain shift from the NLI dataset to the summarization dataset
      * NLI models tend to rely on heuristics such as lexical overlap
* Mishra+ [2020]
  * conjecture that a key difference between the NLI datasets and downstream t
    concerns the length of the premise
    * NLI: at most a few sentences as the premise
    * text summarization and question answering consider a longer premise
      * Reasoning over longer text needs a multitude of additional abilities
        like coreference resolution and abductive reasoning
  * create new long premise NLI datasets out of existing QA datasets

### QA-based

* Inspired by other question answering (QA) based automatic metrics in text summ
* Wang+ 2020 and Durmus+ [2020] propose metrics QAGS and FEQA separately
  * based on the intuition that if we ask questions about a summary and its src,
    we will receive similar answers if the summary is factually consistent
  * three steps:
    * question generation (QG) model generates a set of questions about the summ
      * standard answers are named entities and key phrases in the summary
    * question answering (QA) model to answers these questions given the src doc
    * A factual consistency score is computed
      based on the similarity of corresponding answers
  * Because evaluating factual consistency at entity-level, these methods are
    more interpretable than textual-entailment-based methods
    * reading comprehension ability of QG and QA models brings these methods
      promising performance in this task
  * hE, computationally expensive

### Others [Baselines]

* simple but effective methods, usually used as baselines
* Durmus+ [2020]: word overlap or semantic similarity between the summary
  * word overlap-based metrics
    * compute ROUGE [Lin, 2004], BLEU [Papineni+ 2002],
      between the output summary sentence and each source sentence. And then
      taking the average score or maximum score across all the source sentences
    * work better in lowly abstractive summarization datasets like CNN/DM
  * semantic similarity-based metric is similar to word overlap-based methods
    * Instead of using ROUGE or BLEU, this method uses BERTScore [Zhang+ 2020a]
    * works better in highly abstractive summarization datasets like XSum

## 3.2 Weakly Supervised Metrics

* models specially for evaluating factual consistency
* trained on synthetic data that are generated from the summarization dataset
* effect is very limited

### Sentence-level

* Kryscinski+ [2020] propose FactCC, a model to verify the factual consistency
  * fine-tuning BERT [Devlin+ 2019] as a binary classifier
  * generate synthetic training data from the summarization dataset CNN/DM
    * sampling single sentences, later referred to as claims, from the source
    * positive examples are obtained through semantically invariant
      transformations like paraphrasing
    * negative examples are obtained through semantically variant
      transformations like sentence negation and entity swap
* it is hard to simulate all types of factual inconsistency errors

### Entity-level

* Zhao+ [2020] propose HERMAN, which focuses on evaluating factual consistency
  of quantity entities (e.g. numbers, dates, etc)
* sequence labeling architecture, in which input is the source doc and summary,
  the output is a sequence of labels indicating
  which tokens consist of factual inconsistent quantity entities
* training data for HERMAN is automatically generated
  from the summarization dataset XSum [Narayan+ 2018]
  * reference summary as claims. And these claims are directly labeled as positv
  * negative summaries are obtained by replacing the quantity entities in
    positive summaries

### Token-level

* Zhou+ [2020] propose to evaluate factual consistency on token-level
* more fine-grained and more explainable than sentence-level and entity-level
* implemented by fine-tuning pre-trained language model. Like Zhao+ [2020],
* reference summaries are also directly labeled as positive examples, and the
  negative examples are obtained by reconstructing part of reference summaries
* higher correlations with human factual consistency evaluation

## 3.3 Meta Evaluation

* most related works usually report the correlation between their own metric and
  human-annotated factual consistency score
* hE, it is still hard to compare each metric by the correlations as the
  * diversity of annotating settings in different works and the
  * disagreement among different annotator groups
* Gabriel+ 2020 and Koto+ [2019] conduct meta-evaluations of factual consistency
  * correlation with scores measured by the same group of annotators
* Koto+ [2020]: the semantic similarity-based method could reach SOTA
  by searching optimal model parameters
  (i.e. model layers of pre-trained language model in BERTScore)
  in highly abstractive summarization dataset XSum [Narayan+ 2018]
* correlation with human evaluation is not more than 0.5

# 4 optimizing factual consistency for summarization systems

* we organize these methods into Table 2.  There is code for
  ASGARD [Huang+ 2020], Li+ [2018], Zhang+ [2020b], and Yuan+ [2020]

## fact encode-based

* In the earliest research about factual consistency,
  most works mainly focus on intrinsic factual inconsistency errors, i.e., the
  * usually as cross-combinations of the semantic units in different facts. For
    e.g. “Jenny likes dancing. Bob likes playing football.”
    ⇒ “Jenny likes playing football”.  It is the root cause for intrinsic errors
* explicitly model the facts in the source document, to augment the
  representation of facts. Following this idea, fact encode-based methods
  * first extract facts in the source document, which are
    usually represented by relation triples consisting of (subject; rel; obj)
* encode the extracted facts into summarization models
* According to the ways to encoding facts, these methods are divided into two:

### sequential fact encode

* Cao+ [2018] introduce FTSum, which consists of
  two RNN encoders and one RNN decoder
* concatenates the facts in the source document into a fact description
* One encoder encodes the source document and another encodes the fact descript
  The decoder attends the outputs from these two encoders when generating
  * experimental results show that FTSum reduces significantly factual incons er

### graph-based fact encode

* to capture the interactions between entities in all facts
* Zhu+ 2020 and Huang+ [2020] propose to model the facts with knowledge graphs
* FASum (Fact-Aware Summarization) [Zhu+ 2020], a transformer-based summ model,
  * a graph neural network (GNN) to learn the representation of each node (i.e.,
    entities and relations) and fuses them into the summarization model
* ASGARD (Abstractive Summarization with Graph Augmentation and semantic-driven
  RewarD) Huang+  [2020] further uses multiple choice cloze reward to
  drive the model to acquire semantic understanding over the input
* incorporating commonsense knowledge is also useful to facilitate summarization
  * Gunel+ [2019] sample relation triples from Wikidata to construct a
    commonsense knowledge graph
  * TransE [Bordes+ 2013] is used to learn entity embeddings
    * TransE is a popular multi-relational data modeling method
  * the encoder attends to the embedding of related entities
    * In this way, commonsense knowledge is incorporated

## textual entailment-based

* [Li+ 2018] aim at incorporating entailment knowledge into the summ model
  * a pair of entailment-aware encoder and decoder
  * encoder is used to learn simultaneously
    summary generation and textual entailment prediction. And the
  * decoder is implemented by entailment Reward Augmented Maximum Likelihood
    (RAML) training [Norouzi+ 2016]
    * a computationally efficient approach to optimizing task-specific reward
      (loss) directly
    * In summarization, the reward is the entailment score of generated summary

## post-editing-based

* Fact correctors take the source document and draft summary as input and
  generates the corrected summary as the final summary
* Inspired by the QA span selection task, Dong+ [2020] propose SpanFact, a suite
  of two span selection-based fact correctors, which
  corrects the entities in the draft summary
  in an iterative resp. auto-regressive manner
  * Before performing fact correcting, one resp. all entities will be masked
  * Then SpanFact selects spans in the source document to replace corresponding
    mask tokens based on the understanding of the source document
  * successfully corrects about 26% factually inconsistent summaries and
    wrongly corrupts less than 1% factually consistent summaries
* Simpler than SpanFact, Cao+ [2020] propose an End-to-End fact corrector, which
  * can correct more types of errors
  * by fine-tuning pre-trained language model BART [Lewis+ 2020] with artificial
    data
    * corrupted summary as input. The output is the corrected summary
  * though conceptually this method could correct more errors than Span-Fact,
    not outperform SpanFact in human evaluation result
* Both of Dong+ [2020] and Cao+ [2020] construct artificial training data
  instead of using expensive human annotation
* hE, gap between the
  * training stage (which learns to correct the corrupted reference summaries)
  * testing stage (which aims to correct the model-generated summaries)
  limits the performance of post-editing-based methods
  because corrupted reference summaries have a different data distribution with
  the model-generated summaries
  * the same as weakly supervised factual consistency metrics (§3.2)

## other methods: simple but useful methods and domain-specific methods

* Matsumaru+ [2020] conjecture that one of the causes of factually inconsistency
  lies in unfaithful document-summary pairs, which are used for training
  * they propose to filter inconsistent training examples
    with a textual entailment classifier
* Mao+ [2020] apply constraints during the inference (i.e., beam search) stage
  * end decoding only when all the constraints are met
  * constraints are important entities and keyphrases
  * hE, how much improvement of factual consistency could be achieved by this
    method and how to design more useful constraints are still questions
* summarization in special fields
  * As opposed to relatively open domain news
  * medical field, Zhang+ [2020b] optimize radiology reports summarization
  * Shah+ [2021] optimizes the factual consistency of health and nutrition
  * Yuan+ [2020]: e-commerce product
