# EMNLP 2026 -- Notes by Márton Makrai

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
* Experiments monolingly adapting 9 base LLMs to 10 African langs show that
  geometric regularisation 
  successfully reduces repral degeneration during CPT.
* For larger models, cosine similarity-based regularisation marginally improves
  performance over vanilla CPT, with 
* more consistent gains on the most challenging tasks. We establish that 
* the repral geo of low~ and high-resource langs in LLMs is measurably distinct,
* targeted geo intervention is viable for improving CPT for low-resource langs.

Behind the news: Actionable interpretability is a thing.

## Preliminary Report on the AI Reviewing Experiment

keynote by Desmond Elliott and Mike Zhang

[official post](https://2026.emnlp.org/ai-reviewing-experiment/)

Recommendations

> * Exercise caution in deploying AI tools in the review process
> * Repeat these experiments **with more powerful open-weights models running on
>   hardware funded by `*`ACL/SIGDAT**
>   * Possibly structured as a large-scale shared task initiative
>   * Use the opportunity to develop better AI reviewers
> * Develop tooling and policies to investigate the similarities between AI and
>   “human-authored” reviews

(Emph by Makrai.)

## 4 PM session

### Do Language Models Understand Implicit Logical Meaning?  #### A Case Study
of Scope Ambiguity Resolution in Context (16:18)

Jieun Kim, Suhyeon Park, Kunhui Lee, Seung-Hoon Na

[paper](https://openreview.net/forum?id=XgOewsKw4h)

* Kamath+ (2024) primarily evaluates scope sensitivity through output-level
* ? whether alternative interpretations are internally repred or merely
  reflected in shifted token probabilities.

* We introduce an evidence-first, ambiguity-following diagnostic that asks a
  * the surface string is held constant and only contextual evidence biases
    interpretation, do transformer language models form distinct internal
    reprations corresponding to alternative logical readings?
* To investigate this, we present SCOPEx, extending the dataset of Kamath+
  (2024) by systematically manipulating preceding context while keeping the
  ambiguous sentence identical.  We further introduce
  * passivized variants as syntactically less ambiguous controls. Using SCOPEx,
* we show that transformer LMs: 
  * exhibit systematic scope-sensitive behavior conditioned on context, and 
  * form separable hidden-state reprations for alternative scope readings
  * This divergence emerges in later layers and causally influences downstream
    predictions.

### Gold vs. Translation: (16:27) #### Are We Measuring Language, Knowledge, or
Locality in Translated Benchmarks?

Klaudia-Doris Thellmann, Bernhard Stadler, DS Smart, M Färber, J Lehmann

[paper](https://openreview.net/forum?id=2SI74SsSSq)

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
  * strongest evidence occurs for curriculum-overlap benchmarks such as Skolprov
    (𝛥 R2=.128, 95% CI [.038,.253]), whereas translated MMLU provides no
    significant incremental value for Sweden-specific factual knowledge in
    SwedishFacts (p=.242).
  * hE SwedishFacts is also the only open-ended benchmark, ~> we cannot fully
    separate the effects of content and format. 
  * Overall, the results indicate a clear pattern: translated benchmarks provide
    a better proxy when their source content overlaps with the native evaluation
    target, while locally anchored knowledge is less reliably captured.

### BenchPreS: A Benchmark for Context-Aware Personalized Preference Selectivity
#### of Persistent-Memory LLMs (16:46)

Sangyeon Yoon, Hyesoo Hong, Wonje Jeung, Yongil Kim, W Seo, H Yeen, A No, S Kim

[paper](https://arxiv.org/abs/2603.16557)

* LLMs increasingly store user preferences in persistent memory: personalization
* in third-party communication settings governed by social and institutional
  norms, some user preferences may be inappropriate to apply. 
* We introduce BenchPreS, which evaluates whether memory-based user preferences
  are appropriately applied or suppressed across communication contexts. Using 
* two complementary metrics, Misapplication Rate (MR) and Appropriate
  Application Rate (AAR), we find 
* even frontier LLMs struggle to apply preferences context-sensitively
  * Models with stronger preference adherence exhibit higher rates of
    over-application, and neither reasoning capability nor selectivity-oriented
    prompting fully resolve this issue. These results suggest that current 
  * ie LLMs treat preferences as globally enforceable rules rather than as
    context-dependent normative signals.

### Universal-Guided Grammar Induction (17:34--37)

Yuan Gao, Weiwei Sun

[paper](https://aclanthology.org/2026.emnlp-main.2485/)

* We study whether Universal Grammar syntactic principles can serve as explicit
  inductive biases for unsupervised grammar induction. 
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

# Monday, October 26 — Main Conference Day 2

## 9 AM Session

### AfriSUD: A Dependency Treebank Collection for Eval Models on African Langs

H Buzaaba, CM B Dione, DI Adelani, S Kahane, B Guillaume, K Gerdes, SH Muhammad,
  K Guan, A Aremu, NA Etori, U Inyang, P Nabende, DS Bamutura, A Bukula, 
  I Akinade, C Uchechukwu, R Mabuya, C Fellbaum

[paper](https://aclanthology.org/2026.emnlp-main.1896/)

* African languages: linguistic diversity and global significance, underrepred
* we: AfriSUD, the first multiling collection of synt treebanks for nine diverse
  African languages spanning major language families and regions across
  Sub-Saharan Africa
  * Surface-Syntactic Universal Dependencies (SUD) framework, community-led
  * high-quality, native-speaker-verified data
  * capture typological key features such as agglutination and tone. 
* We evaluate a range of models on AfriSUD for part-of-speech tagging and
  dependency parsing, 
  * models: non-transformer baselines, multiling pretrained encoders, and LLMs.
* results: significant syntax gap, models still show clear limitations 

#### Hardest constructions

- Serial verb constructions (comp:svc): which verb is the head? Rare for
  European languages.
- Possessive constructions (comp:poss): African languages mark possession
  differently from English and European languages.
- Underspecified (udep): construction with no clean linguistic equivalent.
- TAM auxiliaries (comp:aux): tense, aspect and mood markers; 
  models fail to distinguish function from content head.

#### Gap (UAS - LAS) by rel and lang

100 = head is always right, label never

| Relation | Language | Gap | 
|---|---|---| 
| comp:svc | hau/swa | 100 | 
| comp:svc | xho | 85 | 
<hline>
| comp:poss | hau | 100 | 
| comp:poss | kin | 86 | 
|---|---|---| 
| udep | hau | 68 | 
| udep | wol | 57 | 
|---|---|---| 
| comp:aux | xho | 44 | 
| comp:aux | kin | 39 |
| comp:aux | nyn | 32 |

### The Multilingual FrameNet Corpus

Beatrice Fiumanò, Nicolas Lazzari, Simone Paolo Ponzetto, Valentina Presutti

[paper](https://arxiv.org/abs/2608.23037)

We: The Multilingual FrameNet Corpus (mFNC), that extends the English Berkeley
FrameNet corpus by collecting and harmonizing existing language-specific corpora
across +9 langs: Brazilian Portuguese, Chinese, Dutch, French, German, Italian,
Korean, Latvian and Swedish. 
* We train models with different architectures on the mFNC, we 
* consistently outperform existing state-of-the-art Frame Semantic Parsers in
  both multilingual and cross-lingual settings, underscoring the importance of
* mFNC and our trained FSP models are openly available on github and huggingface

### Claim Verification in the Age of Large Language Models: A Survey

Alphaeus Dmonte, Roland R Oruche, Marcos Zampieri, Prasad Calyam, I Augenstein

[paper](https://aclanthology.org/2026.acl-srw.2/)

* automated claim verification systems
  * deep learning, transformer-based, LLM-based approaches, RAG. In this survey,
* we: a comprehensive account of recent LLM-based claim verification frameworks
  * components of the claim verification pipeline used in these frameworks in
  * approaches to retrieval, prompting, and fine-tuning.
  * publicly available English datasets for this task.

### ZipBench: Low-Cost Framework for Compressing Comprehensive LLM Benchmarks

Zhongzhan Huang, Junxin Li, Guoming Ling, Yupei Lin, Shanshan Zhong, Hefeng Wu

[paper](https://aclanthology.org/2026.emnlp-main.1879/)

* Many widely used benchmarks are redundant ~> evaluation unnecess expensive
* benchmark compression methods (BCMs) can mitigate this cost, 
* hE many strong BCMs rely on large collections of per-sample evaluation results
  from numerous LLMs to identify representative samples.
* Building such collections is also expensive unless they are already public,
  making these methods difficult to extend to newly released benchmarks. To
* we present ZipBench, a simple and low-cost BCM with theoretical error and
  rank-consistency guarantees. ZipBench 
  * evaluates only a small set of anchor LLMs, synthesizes pseudo evaluation
    results to broaden coverage, learns compact sample representations, and
    selects a small yet representative subset.
* we [also] create ZipBench Zoo, a collection of compact versions of 100+
  benchmarks spanning text, multimodal, and agent tasks
* mean absolute errors of 0.002–0.02 and average Spearman correlations of ~0.98
* ZipBench reduces the cost of both LLM evaluation and compact benchmark constr,
* All data, code and checkpoints will be fully released.

### Chronoberg: A 250-Year Diachronic Corpus with Temporal Affective Lexicons
for Language Model Analysis

Niharika Hegde, S Paul, L-J Frey, M Brack, K Kersting, M Mundt, P Schramowski

[paper](https://arxiv.org/abs/2509.22360)

* LLMs excel at operating at scale by leveraging social media and crawled data 
* hE lack of long-term temporal structure may limit an LLM's ability to
  * contextualize semantic and normative evolution of language and to 
  * capture diachronic variation. To support the latter, 
* we introduce Chronoberg, 
  * to support dia vari
  * a temporally structured corpus of English book texts spanning 250 years,
    curated from Project Gutenberg and enriched with 
    + a variety of temporal annotations.
* First, the edited nature of books enables us to 
  * quantify lexical semantic change through time-sensitive Val-Aro-Dom analysis
  * support historically-grounded interpretation. 
* With the lexicons at hand, we demonstrate a need for modern LLM-based tools to
  better situate their contextualization of sentiment and detection of
  discriminatory language across various time-periods.
* these tools struggle with diachronic shifts in meaning, emphasizing the need
  for temporally aware training and evaluation pipelines, and positioning
* Chronoberg as a scalable resource for respective studies.
* This paper includes language and display of samples that could be offensive to
* Chronoberg is available publicly on HuggingFace. Code on github

## 11 AM session

### Aligning Cultural Behaviors in Arabic Language Models via Preferences

Junhong Liang, D Orel, S Almheiri, B Elbouardi, Y Samih, A Alhakim Freihat, Z
Xie, M Ahsan, M Dehan Al Kautsar, S Ahmad, O El Herraoui, M Anwar, P Nakov, F
Koto

[paper](https://arxiv.org/abs/2610.25362)

Most of the authors at Mohamed bin Zayed University of Artificial Intelligence
(Abu Dhabi, United Arab Emirates), one at IBM Research AI.

* Arabic LLMs have improved rapidly, but 
* alignment with country-specific cultural behavioral
  * Previous work has focused on instruction-tuning for factual knowledge,
  * hE overlooking nuanced cultural behaviors. 
* We propose ArabPref, which to our knowledge is 
  the first large-scale pan-Arab preference data set for the alignment of
  cultural behavior conditioned on the country.
* two resources in English and Modern Standard Arabic: 
  * a culturally grounded preference dataset for training and evaluation, and 
  * a multiple-choice benchmark designed to assess 
    culturally aligned behavior across nations. 
* All test data are validated by native speakers to ensure authenticity. To
* experiments with post-training methods
  * models: multilingual and Arabic-centric language models, evaluating
  * both generation tasks and our cultural multiple-choice benchmark. By
