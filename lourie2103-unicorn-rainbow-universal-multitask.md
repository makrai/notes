UNICORN on RAINBOW:
  A Universal Commonsense Reasoning Model on a New Multitask Benchmark
Nicholas Lourie, Ronan Le Bras, Chandra Bhagavatula, Yejin Choi
AAAI 2021 arXiv:2103.13009 [cs.CL]

model and code, all the experimental results, and the RAINBOW leaderboard
https://github.com/allenai/rainbow

# Abstract

* Commonsense AI has long been seen as a near impossible goal ~~ until recently
* Now, research interest has sharply increased with new benchmarks and models
* We propose two new ways to evaluate commonsense models, emphasizing their
  generality on new tasks and
  building on diverse, recently introduced benchmarks
  * a new multitask benchmark, RAINBOW, to promote research on commonsense
  * a novel evaluation, the cost equivalent curve, that sheds new insight on
    how the choice of source datasets, pretrained language models, and transfer
    learning methods impacts performance and data efficiency
* extensive experiments ~~ over 200 experiments encompassing 4800 models
  * transfer almost always leads to better or equivalent performance if
    following a particular recipe
  * QA-based commonsense datasets transfer well with each other, while
    commonsense knowledge graphs do not
  * larger models benefit more from transfer than smaller ones
    * perhaps counter-intuitively
* a new universal commonsense reasoning model, UNICORN, that establishes
  * new SOTA performance across 8 popular commonsense benchmarks,
  * αNLI (87.3%), CosmosQA (91.8%), HellaSWAG (93.9%), PIQA (90.1%), SocialIQa
    (83.2%), WinoGrande (86.6%), CycIC (94.0%) and CommonsenseQA (79.3%)

# 1 Intro

* In AI’s early years, researchers sought to build common sense (McCarthy 1959)
  * McCarthy, J. 1959. Programs with Common Sense
    Teddington Conference on the Mechanization of Thought Processes
* only recently do we see a sudden increase in research interest toward this
* benchmarks and models (Mostafazadeh+ 2016; Talmor+ 2019; Sakaguchi+ 2020)
* pretrained models have led to remarkable progress across the board, often
  * surpassing human performance on leaderboards
    (Radford+ 2018; Devlin+ 2019; Liu+ 2019b; Raffel+ 2019)
  * surprisingly silly and nonsensical mistakes, even GPT-3
* we can learn a great deal from mainstream NLP research
  * multitask benchmarks eg GLUE (Wang+ 2019b) and SuperGLUE (Wang+ 2019a) has
    encouraged fundamental advances in the NLP community,
* we propos two new ways to evaluate commonsense models with an
  emphasis on their generality across tasks and domains
  * new multi-task benchmark, RAINBOW, to facilitate research
  * novel evaluation, the cost equivalent curve
    * choices of source datasets, pretrained language models, and
      transfer learning methods affect performance and data efficiency
* cost equivalent curves
  * The primary motivation is data efficiency. The necessary condition for
    SOTA neural models to maintain top performance on any dataset is a
    sufficiently large amount of training data for fine-tuning
  * building a dataset for a new task or a domain is an expensive feat, easily
    costing tens of thousands of dollars (Zellers+ 2018)
  * question
    * how much data does a transfer learning approach save over the baseline
    * more detailed walk-through of this chart in §2
    * advantages over
      * simple evaluations at the full dataset size or
      * learning curves drawn for each method and dataset separately
* We leverage these new tools to re-evaluate common approaches for
  intermediate-task transfer (Pruksachatkun+ 2020)
  * intermediate-task transfer can always lead to better or equivalent
    performance if following a particular recipe, that
  * QA-based commonsense datasets transfer well to each other, while
    commonsense knowledge graphs do not, and that perhaps counter-intuitively,
  * larger models benefit much more from transfer learning compared to smaller
* new universal commonsense reasoning model: UNICORN, establishing
  * new SOTA performances across 8 benchmarks:
    * αNLI (87.3%, Bhagavatula+ 2020)
    * COSMOS QA (91.8%, Huang+ 2019)
    * HELLA SWAG (93.9%, Zellers+ 2019)
    * PIQA (90.1%, Bisk+ 2020)
    * SOCIAL IQ A(83.2%, Sap+ 2019b)
    * WINO GRANDE (86.6%, Sakaguchi+ 2020)
    * CYCIC (94.0%)
    * COMMONSENSE QA dataset (79.3%, Talmor+ 2019)
* ablations
  * UNICORN also improves data efficiency for all training dataset sizes

# 2 Cost Equivalent Curves

* intuitively: how many examples the new approach needs
  to match the single-task baseline’s performance
* Figure 1 illustrates cost equivalent curves with COMMON SENSE QA as the
  * x-axis shows the number of examples used by the single-task baseline, while
  * y-axis shows the examples from the target dataset used by the multitask met
  * curve is where they achieve the same performance
  * numbers on top of the figure show the corresponding performance 
  * curves below the diagonal (y = x) indicating that the new method improves
* assumption: rel between performance and cost is continuous and strictly monot
  * holds empirically for parameters, compute, and data (Kaplan+ 2020)
  * estimate each learning curve with isotonic regression (Barlow+ 1972), then
    * isotonic aka monotonic regression is the technique of
      fitting a free-form line to a sequence of observations such that
      the fitted line is non-decreasing (or non-increasing) everywhere, and
      lies as close to the observations as possible
  * mapping each dataset size to the baseline performance, finding the matching
    performance on the new method’s curve, and seeing how many examples requird
* reframes the goal from pushing up performance on a fixed-size benchmark
  * can be applied to other definitions of cost as well (eg, GPU compute)

# 3 RAINBOW

* We define RAINBOW, a suite of commonsense benchmarks, with the following
    * To keep evaluation clean-cut, we only chose multiple-choice QA
  * αNLI (Bhagavatula+ 2020) tests abductive reasoning in narratives
    * identify the best explanation among several
    * connecting a beginning and ending
  * COSMOS QA (Huang+ 2019) asks
    commonsense reading comprehension questions about everyday narratives
  * HELLA SWAG (Zellers+ 2019)
    choose the most plausible ending to a short context
  * PIQA (Bisk+ 2020) is
    a multiple-choice QA benchmark for physical commonsense reasoning
  * SOCIAL IQ A(Sap+ 2019b) evaluates commonsense reasoning about
    social situations and interactions
  * WINO GRANDE (Sakaguchi+ 2020) is a large-scale collection of Winograd-inspd
    * requiring reasoning about both social and physical interactions

# 4 Empirical Insights

* large-scale empirical study, using pretrained T5-LARGE to transfer
* findings and figures grouped around the four following thematic questions

## 4.1 What’s the Best Approach for Transfer?

* multitask training (Caruana 1995): training on multiple datasets (including
  the target dataset) all at once,
* sequential training (Pratt, Mostow, and Kamm 1991): first training on
  multiple datasets (excluding the target dataset) through multitask training,
  and then continuing to train on the target dataset alone,
* multitask fine-tuning (Liu+ 2019a): first training on all datasets
  (including the target dataset) through multitask training, and then
  continuing to fine-tune on the target dataset alone
* Figure 2 compares these three methods on each of the six RAINBOW tasks,
  using the other five datasets for transfer

### Finding 1: Sequential training almost always matches or beats others

* For some tasks (αNLI and SOCIAL IQ A), all three methods perform similarly;
* on the rest, sequential and multitask fine-tune training greatly improve data
* sequential and multitask fine-tune training are often comparable,
  * sequential training appears to be slightly more data efficient,
    * both from comparing cost equivalent curves in Figure 2 and on full dataset

### Finding 2: Sequential training rarely hurts performance

### Finding 3: Multitask training helps most often in the low-data regime

* One current mystery is the inconsistent effect of multitask training
* Cost equivalent curves reveal one potential explanation: multitask learning
  tends to help when data is scarce, but may hurt performance if plentiful

## 4.2 What Transfers Best for Common Sense?

* when datasets transfer well (Vu+ 2020; Pruksachatkun+ 2020)
* researchers usually pick datasets that seem similar to the target, whether
  due to format, domain, or something else
* we compare how the RAINBOW tasks transfer to each other
  * against two other popular dataset collections: GLUE and SuperGLUE

### Finding 4: RAINBOW transfers best for common sense

* the RAINBOW tasks transfer better to each other than GLUE and SuperGLUE do
  to them
* The same result also holds for the popular benchmark COMMONSENSE QA when
* hE, JOCI (Zhang+ 2017), an ordinal commonsense variant of NLI,
  RAINBOW appears either not to help or to slightly hurt data efficiency,
  potentially more so than GLUE and SuperGLUE

### Finding 5: Only RAINBOW uniformly beats the baseline

### Caveats about GLUE, SuperGLUE, and T5

* The off-the-shelf T5’s weights come from multitask pretraining, where
  * many tasks are mixed with a language modeling objective
    to learn a powerful initialization for the weights
  * both GLUE and SuperGLUE were mixed into the pretraining (Raffel+ 2019)
* not determined whether some of the benefit comes from the
  novelty of RAINBOW’s knowledge to T5,
  as opposed to containing more general information than GLUE and SuperGLUE

## 4.3 Does Model Size Affect Transfer?

* Figure 4 presents the results for transferring with different model sizes
  from RAINBOW to COMMONSENSE QA

### Finding 6: Larger models benefit more from transfer

* pretrained models achieve substantially higher performance
* baselines start from very different places.  Cost equivalent curves place
  everything in comparable units, equivalent baseline cost
* Figure 4 compares transfer from RAINBOW to COMMONSENSE QA across model size
* larger models seem to benefit more from transfer, saving more examples
* smaller models require more gradient updates to converge (Kaplan+ 2020)
  => we held the number of gradient updates fixed for comparison
  * Exploring whether this trend holds in different contexts, as well as
    theoretical explanations, are directions for future

### Finding 7: Sequential training wins across model sizes.  Figure 4

## 4.4 Can Models Transfer from Knowledge Graphs to QA Datasets?

* reporting bias (Gordon and Van Durme 2013)
  * Gordon, J.; and Van Durme, B
    Reporting bias and knowledge acquisition
    Workshop on Automated knowledge base construction 2013, 25–30. ACM
  * common sense rarely appears explicitly in text, though it does appear
* While language models learn much of the common sense implicit in natural
  language (Trinh and Le 2018),
  crowdsourced and expert curated knowledge might provide complementary info
* we investigate two popular common sense knowledge graphs,
  * CONCEPT NET (Speer, Chin, and Havasi 2017) and
  * ATOMIC (Sap+ 2019a), to create
  * knowledge graph generation tasks (Bosselut+ 2019) In the
    * forward direction, the model predicts the object given the subject and
      relation concatenated in XML tags. In the
    * backward direction, the model predicts the subject given the object and
      relation.  The results are summarized in Figure 5 and Table 3

### Finding 8: Knowledge graph multitasking shows little impact

* generally negative
  * Only SOCIAL IQA benefits, which
    * might come from the use of ATOMIC during its construction. We offer
  * two possible explanations: the
    * serialized language from the knowledge graphs is not in a QA format, and
    * knowledge graph completion task is generative while
      all other tasks are discriminative. These discrepancies may present too
* future research to better close the gap between knowledge graphs and datasets
  * sequential training’s strength, as exemplified in Findings 1, 2, and 7,
    may lead to different results than the multitask transfer we explore here

# 5 UNICORN

* universal commonsense reasoning model,
* Motivated by Finding 1, our primary goal with Unicorn is to provide
  a pretrained commonsense reasoning model ready
  to be fine-tuned on other downstream commonsense tasks
  * analogous to how off-the-shelf T5 models are multitasked on NLP benchmarks
    such as GLUE and SuperGLUE as part of their pretraining
* new SOTA on all RAINBOW datasets: αNLI (87.3%), COSMOS QA (91.8%), HELLA
  SWAG (93.9%), PIQA (90.1%), SOCIAL IQ A(83.2%), and WINO GRANDE (86.6%)
* SOTA on datasets beyond RAINBOW
  * CycIC (94.0%) and COMMONSENSE QA (79.3%)

# 6 Related Work

## Scaling Laws. In contemporary machine learning

* simple methods that scale often outperform complex ones (Sutton 2019)
* sharp rise in compute used by SOTA methods (Amodei and Hernandez 2018)
* Performance gains from increasing data, parameters, and training are
  predictable (Hestness+ 2017; Sun+ 2017; Rosenfeld+ 2020; Kaplan+ 2020)
* Sun+ (2017) found that models need exponential data for improvements in
  * Eventually, models saturate and need super-exponential data

## Commonsense Benchmarks. Rapid progress in modeling has led to a major

* adversarial filtering (Zellers+ 2018; Le Bras+ 2020): a family of techniques
* Besides COSMOS QA, all RAINBOW tasks use this technique
* more common sense benchmarks exist beyond what we could explore here
  (Roemmele, Bejan, and 2011; Levesque, Davis, and 2011; Mostafazadeh+ 2016)

## Transfer Learning. Semi-supervised and transfer learning have grown into

* unsupervised representations of words (Brown+ 1992; Mikolov+ 2013), while
* contextualized representations from neural language models (Peters+ 2018)
* Radford+ (2018): language models could be fine-tuned directly to solve a
  wide-variety of tasks by providing the inputs encoded as text, while
* Devlin+ (2019) and others improved upon the technique
  (Yang+ 2019; Liu+ 2019b; Lan+ 2019)
  * Yang Z; Dai Z; Yang Y; Carbonell J; Salakhutdinov R R; and Le Q V
    Xlnet: Generalized autoregressive pretraining for language understanding
    NIPS 2019 5753–5763
  * Liu, Ott, Goyal, Du, Joshi, Chen, Levy, Lewis, Zettlemoyer, & Stoyanov V
    Roberta: A robustly optimized bert pretraining approach
    arXiv preprint arXiv:1907.11692
  * Lan Z, Chen M, Goodman S, Gimpel K, Sharma P, and Soricut R
    Albert: A lite bert for self-supervised learning of language reprs
    arXiv preprint arXiv:1909.11942
* Most relevant to this work, Raffel+ (2019) introduced T5 which built off
  * reframe any NLP task as text-to-text, dispensing with taskspecific model

## Data Efficiency & Evaluation

* importance of cost-benefit trade-offs in evaluation (Schwartz+ 2019)
* Dodge+ (2019)
  * advocate reporting the compute-performance trade-off caused by
    hyper-parameter tuning for new models, and
  * provide an estimator for expected validation performance as a function of
    hyperparameter evaluations. In an older work
* Clark and Matwin (1993) evaluated the use of qualitative knowledge
  in terms of saved training examples, similarly to our cost equivalent curves
  * a linear trend to the learning curve and counted examples saved rather than
