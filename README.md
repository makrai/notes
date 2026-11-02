# EMNLP 2026 -Notes by Márton Makrai

# Sunday, October 25 — Main Conference Day 1

## The Geometry of Low-Resource Language Representations

[Francois Meyer](https://francois-meyer.github.io/) 

Session: 11 AM Interpretability and Analysis of Models for NLP 1 

[paper](https://arxiv.org/abs/2608.23358v1)

* LLM geometry is systematically related to lang data availability. 
* The most consistent effect is in final layers, where 
  low-resource langs exhibit repral degeneration. 
* To counter this, we investigate the effectiveness of 
  regularisation terms 
  to penalise degeneration during continued pretraining (CPT). 
* Experiments monolingually adapting 9 base LLMs to 10 African langs show that
  geometric regularisation 
  successfully reduces repral degeneration during CPT.
* For larger models, cosine similarity-based regularisation 
  marginally improves performance over vanilla CPT, with 
* more consistent gains on the most challenging tasks. We establish that 
* the repral geo of low~ and high-resource langs in LLMs is measurably distinct,
* targeted geo intervention is viable for improving CPT for low-resource langs.

Behind the news: Actionable interpretability is a thing.

## Preliminary Report on the AI Reviewing Experiment

keynote by Desmond Elliott and Mike Zhang

Recommendations

> * Exercise caution in deploying AI tools in the review process
> * Repeat these experiments **with more powerful open-weights models
>   running on hardware funded by `*`ACL/SIGDAT**
>   * Possibly structured as a large-scale shared task initiative
>   * Use the opportunity to develop better AI reviewers
> * Develop tooling and policies to 
>   investigate the similarities between AI and “human-authored” reviews

(Emph by Makrai.)

## 4 PM session

### Do Language Models Understand Implicit Logical Meaning? 
#### A Case Study of Scope Ambiguity Resolution in Context (16:18)

Jieun Kim, Suhyeon Park, Kunhui Lee, Seung-Hoon Na

Abstract

* Kamath+ (2024) primarily evaluates scope sensitivity through output-level
* ? whether alternative interpretations are internally represented 
  or merely reflected in shifted token probabilities.

* We introduce an evidence-first, ambiguity-following diagnostic that asks a
  * the surface string is held constant and only contextual evidence biases
    interpretation, 
    do transformer language models form distinct internal representations
    corresponding to alternative logical readings?
* To investigate this, 
  we present SCOPEx, extending the dataset of Kamath+ (2024) 
  by systematically manipulating preceding context 
  while keeping the ambiguous sentence identical.  We further introduce
  * passivized variants as syntactically less ambiguous controls. Using SCOPEx,
* we show that transformer LMs: 
  * exhibit systematic scope-sensitive behavior conditioned on context, and 
  * form separable hidden-state representations for alternative scope readings
  * This divergence emerges in later layers and 
    causally influences downstream predictions.

### Gold vs. Translation: (16:27)
#### Are We Measuring Language, Knowledge, or Locality in Translated Benchmarks?

Klaudia-Doris Thellmann, Bernhard Stadler, DS Smart, M Färber, J Lehmann

* Translated versions of English-origin benchmarks such as MMLU are widely used
* Do they measure the same constructs as natively created benchmarks?
  * We frame this as a *proxy validity* question and 
* we compare DeepL-translated MMLU proxies against six native benchmarks in
  seven pairings across five Nordic and Baltic languages, evaluating 29 models
  on each pairing.
* measure: Beyond ranking agreement, we test *incremental* proxy validity:
  * ie controlling for model size and language proficiency? Proxy validity
* finding varies substantially across benchmark pairings. Applying the same
  * find four robust effects, two marginal effects, and one null result. The
  * strongest evidence occurs for curriculum-overlap benchmarks such as
    Skolprov (𝛥 R2=.128, 95% CI [.038,.253]), whereas 
    translated MMLU provides no significant incremental value for
    Sweden-specific factual knowledge in SwedishFacts (p=.242).
  * hE SwedishFacts is also the only open-ended benchmark, 
    ~> we cannot fully separate the effects of content and format. 
  * Overall, the results indicate a clear pattern: 
    translated benchmarks provide a better proxy 
    when their source content overlaps with the native evaluation target,
    while locally anchored knowledge is less reliably captured.

### BenchPreS: A Benchmark for Context-Aware Personalized Preference Selectivity
#### of Persistent-Memory LLMs (16:46)

Sangyeon Yoon, Hyesoo Hong, Wonje Jeung, Yongil Kim, W Seo, H Yeen, A No, S Kim

* LLMs increasingly store user preferences in persistent memory: personalization
* in third-party communication settings governed by social and institutional
  norms, some user preferences may be inappropriate to apply. 
* We introduce BenchPreS, which evaluates 
  whether memory-based user preferences are appropriately applied or suppressed
  across communication contexts. Using 
* two complementary metrics, 
  Misapplication Rate (MR) and Appropriate Application Rate (AAR), we find 
* even frontier LLMs struggle to apply preferences context-sensitively
  * Models with stronger preference adherence exhibit higher rates of
    over-application, and 
    neither reasoning capability nor selectivity-oriented prompting fully
    resolve this issue. These results suggest that current 
  * ie LLMs treat preferences as globally enforceable rules 
    rather than as context-dependent normative signals.

### Universal-Guided Grammar Induction (17:34--37)

Yuan Gao, Weiwei Sun

* We study whether 
  Universal Grammar syntactic principles can serve as explicit inductive biases
  for unsupervised grammar induction. 
* We introduce a neuro-symbolic PCFG framework that 
  * converts hypothesized linguistic universals into rule schemata, and then
  * learns rule probabilities from child-directed speech. We investigate 
  * three (alter) assumptions: 
    * extended projection, 
    * prototype theory of part-of-speech, and 
    * the final-over-final constraint. Experiments show that 
* resu: 
  * with a much smaller hypothesis space, the universal-priored model achieves 
  * superior performance to state-of-the-art neural grammar induction models,
  * more interpretable functional category assignment.
