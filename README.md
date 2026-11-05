# EMNLP 2026 -- Notes by Márton Makrai

# For AstroSpeech

* [Chronoberg](/README.md#Chronoberg)
* [Harm or Humor](/README.md#Harm)
* [Variable-Rank Adaptation](/README.md#Variable-Rank Adaptation)

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
9:05

H Buzaaba, CM B Dione, DI Adelani, S Kahane, B Guillaume, K Gerdes, SH Muhammad,
K Guan, A Aremu, NA Etori, U Inyang, P Nabende, DS Bamutura, A Bukula, I
Akinade, C Uchechukwu, R Mabuya, C Fellbaum

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

Serial verb constructions (comp:svc): which verb is the head? Rare for European
languages.  Possessive constructions (comp:poss): African languages mark
possession differently from English and European languages.  Underspecified
(udep): construction with no clean linguistic equivalent.  TAM auxiliaries
(comp:aux): tense, aspect and mood markers; models fail to distinguish function
from content head.

#### Gap (UAS LAS) by rel and lang

100 = head is always right, label never

| Relation | Language | Gap | |---|---|---| | comp:svc | hau/swa | 100 | |
comp:svc | xho | 85 | |   |   |   | | comp:poss | hau | 100 | | comp:poss | kin
| 86 | |   |   |   | | udep | hau | 68 | | udep | wol | 57 | |   |   |   | |
comp:aux | xho | 44 | | comp:aux | kin | 39 | | comp:aux | nyn | 32 |

### The Multilingual FrameNet Corpus (9:36)

Beatrice Fiumanò, Nicolas Lazzari, Simone Paolo Ponzetto, Valentina Presutti

[paper](https://arxiv.org/abs/2608.23037)

* We: The Multilingual FrameNet Corpus (mFNC), that
* extends the English Berkeley FrameNet corpus by collecting and harmonizing
  existing language-specific corpora across +9 langs: Brazilian Portuguese,
  Chinese, Dutch, French, German, Italian, Korean, Latvian, and Swedish.
* We train models with different architectures on the mFNC
* consistently outperform existing state-of-the-art Frame Semantic Parsers in
  both multilingual and cross-lingual settings
* mFNC and our trained FSP models are openly available on github and huggingface

### Claim Verification in the Age of Large Language Models: A Survey (9:59)

Alphaeus Dmonte, Roland R Oruche, Marcos Zampieri, Prasad Calyam, I Augenstein

[paper](https://aclanthology.org/2026.acl-srw.2/)

* automated claim verification systems
  * deep learning, transformer-based, LLM-based approaches, RAG
* we: a comprehensive account of recent LLM-based claim verification frameworks
  * components of the claim verification pipeline used in these frameworks
  * approaches to retrieval, prompting, and fine-tuning.
  * publicly available English datasets for this task.

### ZipBench: Low-Cost Framework for Compressing Comprehensive LLM Benchmarks
10:05

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
for Language Model Analysis (10:05)

Niharika Hegde, S Paul, L-J Frey, M Brack, K Kersting, M Mundt, P Schramowski

[paper](https://arxiv.org/abs/2509.22360)

* LLMs excel at operating at scale by leveraging social media and crawled data
* hE lack of long-term temporal structure
  * ? contextualize semantic and normative evolution of language and to
  * ? capture diachronic variation. To support the latter,
* we introduce Chronoberg,
  * to support dia vari
  * a temporally structured corpus of English book texts spanning 250 years,
    curated from Project Gutenberg and enriched with
    + a variety of temporal annotations.
* First, the edited nature of books enables us to
  * quantify lexical semantic change through time-sensitive Val-Aro-Dom analysis
  * support historically-grounded interpretation.
* With the lexicons at hand, we demonstrate a need for modern LLM-based tools to
  better situate their
  * contextualization of sentiment and
  * detection of discriminatory language across various time-periods.
* these tools struggle with diachronic shifts in meaning
  * need for temporally aware training and evaluation pipelines
* Chronoberg as a scalable resource for respective studies.
* :-/ This paper includes language and display of samples that could be offens
* Chronoberg is available publicly on HuggingFace. Code on github

## 11 AM session

### Aligning Cultural Behaviors in Arabic Language Models via Preferences
(11:28)

Junhong Liang, D Orel, S Almheiri, B Elbouardi, Y Samih, A Alhakim Freihat, Z
Xie, M Ahsan, M Dehan Al Kautsar, S Ahmad, O El Herraoui, M Anwar, P Nakov, F
Koto

[paper](https://arxiv.org/abs/2610.25362)

Most of the authors at _Mohamed bin Zayed University of Artificial Intelligence_
(Abu Dhabi, United Arab Emirates), one at _IBM Research AI_.

* Arabic LLMs have improved rapidly
* alignment with country-specific cultural behavior
  * Previous work has focused on instruction-tuning for factual knowledge,
  * hE overlooking nuanced cultural behaviors.
* We propose ArabPref, the first large-scale pan-Arab preference data set for
  the alignment of cultural behavior conditioned on the country.
* two resources in English and Modern Standard Arabic:
  * a culturally grounded preference dataset for training and evaluation, and
  * a multiple-choice benchmark designed to assess culturally aligned behavior
    across nations.
* All test data are validated by native speakers to ensure authenticity
* experiments with post-training methods
  * models: multilingual and Arabic-centric language models,
  * both generation tasks and our cultural multiple-choice benchmark

### IndicParam: Benchmark to evaluate LLMs on low-resource Indic Languages
(11:29)

Ayush Maheshwari, Kaushal Sharma, Vivekkumar Vasudevbhai Patel, Aditya
Maheshwari

[benchmark](https://huggingface.co/datasets/bharatgenai/IndicParam)

* LLMs excel on high-resource multilingual tasks,
* hE lowand extremely low-resource Indic languages remain sever under-evaled
* We: IndicParam, a human-curated benchmark of 13,000 multiple-choice questions
  * 11 Indic languages
    * Nepali, Gujarati, Marathi, Odia as low-resource
    * Dogri, Maithili, Rajasthani, Sanskrit, Bodo, Santali, Konkani as extremely
* evaluated 20 LLMs, both proprietary and open-weights, which reveals that even
  the top-performing Gemini-2.5 reaches 58% average accuracy, followed by GPT-5
  (45) and DeepSeek-3.2 (43.1).
* We additionally
  * label each question as knowledge-oriented or purely linguistic to
  * assess the ability of LLMs to handle diverse question formats-such as
    list-based matching, assertion-reason pairs, and sequence ordering-alongside
    conventional multiple-choice questions.

### Harm or Humor: A Multimodal, Multilingual Benchmark for Overt and Covert
Harmful Humor(11:30)

Ahmed Sharshar, Hosam Elgendy, Saad El Dine Ahmed, Yasser Rohaim, Yuxia Wang

[paper](arXiv:2603.17759)

* Dark humor often relies on subtle cultural nuances and implicit cues that
  * require contextual reasoning to interpret,
  * posing safety challenges that current static benchmarks fail to capture. To
* we: a novel multimodal, multilingual benchmark for detecting and understanding
  harmful and offensive humor. Our manually curated
  * 3,000 texts and 6,000 images in English and Arabic, alongside
  * 1,200 videos that span English, Arabic, and language-independent (universal)
    contexts.
* strict annotation guideline: distinguishing Safe jokes from Harmful ones, with
  the latter further classified into Explicit (overt) and Implicit (Covert)
  categories to probe deep reasoning.
* We systematically evaluate state-of-the-art (SOTA) open and closed-source
  models across all modalities.
* findings reveal that closed-source models significantly outperform open-source
  ones, with a notable difference in performance between the English and Arabic
  languages in both

### Variable-Rank Adaptation: A Comprehensive Survey of Rank Budgeting LoRAs
(11:46)

Max Ploner, Alan Akbik

[paper](https://aclanthology.org/2026.findings-emnlp.2430/)

* The capacity of LoRA is fundamentally governed by its rank parameter. While
* standard implementations apply a uniform rank across all layers,
* a recent wave of variable-rank extensions: tailoring ranks to module importanc
* literature remains highly fragmented and lacks systematic cross-comparisons.
* we propose a taxonomy grouping these approaches into four categories: Rank
  growth, pruning, redistribution, and pre-allocation.
* We analyze their design dimensions, theoretical expressiveness, implementation
  complexity, and memory efficiency. Finally,
* critical: lack of standardized evaluations and memory metrics.

### NaijaS2ST: A Multi-Accent Benchmark for Speech-to-Speech Translat Nigerian
(12:17)

Marie Maltais, Y Jeon, M Ma, SH Muhammad, I Abdulmumin, MI Mukhtar, D Abolade, J
Okepefi, J Sewedo, DI Adelani

[paper](https://arxiv.org/abs/2604.16287)

* we introduce NaijaS2ST, a parallel speech translation dataset spanning Igbo,
  Hausa, Yorùbá, and Nigerian Pidgin paired with English. The dataset
* 50 hours of speech per language and captures substantial variation in speakers
  and accents, reflecting realistic multilingual and multi-accent conditions.
* exper: cascaded, end-to-end (E2E), and AudioLLM-based approaches across
  bidirectional translation settings. Our
* results for speech-to-
  * text: audio LLMs with few-shot examples are more effective
  * speech: the cascaded and audio LLM paradigms yield comparable performance,
* summ: a high-quality dataset and a systematic benchmark

### ScopeBench: Evaluating Cultural Norm Scope Awareness in LLMs (12:19)

Haojun Liang, Ziwei Zhao, Chenyu Li, Qiyue Zhao, Rongduomijia Mu, Yulan Shen, Yu
Gu, Chen Zhang, Kairui Zhang, Yanbiao Ma, Wenxuan Wang

[paper](https://ziwayzhao.github.io/assets/pdf/ScopeBench.pdf)

* Safety evaluation in LLMs treats harm as culturally invariant, yet a model
  cannot correctly apply a safety norm without knowing whose norms bind. We
* we: ScopeBench, a benchmark
* 3,323 norms
  * spanning 49 countries across nine cultural clusters, each annotated as
    UNIVERSAL or SPECIFIC . We define
  * three scope error types identically across four evaluation tasks: Scope
    Inflation, Scope Deflation, and Scope Displacement.
* Evaluating 21 frontier LLMs across seven model families, we surface
* three structural failures.
  * the dominant error type inverts with prompt format: Scope Deflation reaches
    70% in single-answer classification, while Scope Inflation reaches 33% when
    each candidate culture is judged indeply
  * scope-classification accuracy is empirically decoupled from behavioral
    safety: the six classifiers achieving ≥ 97% Task 1 accuracy still produce
    harmful responses to 40–42% of scope-violating statements.
  * no model is safe in interaction, with harmful-response rates ranging from
    29% to 51% across the cohort, excluding one model that systematically
    refuses the task.
* We release all data, code, and model outputs to establish cultural scope as a

## On the Value of Open Research in Language Modeling -- An Adversarial Dialog [keynote]

Graham Neubig (keynote, 3:15 PM)

### From the abstract

* Much research has moved out of the public eye and behind closed doors. What
* I will present some often-cited arguments against the value of open research
  in LLM tech, and some counter arguments for why open research is still
  important, albeit under certain conditions. I will also try to present
* some personal anecdotes for my own projects that I think have been successful
  in the face of these headwinds, and may be informative for listeners who are
  also interested in expanding the impact of their work.

### Highlights from the talk

* open models lag behind proprietary ones by 104 days
* [Anatomy of a Frontier Lab Agent Intrusion: A Technical Timeline of the July 2026 Incident](https://huggingface.co/blog/agent-intrusion-technical-timeline)
  * [The incident disclosure](https://huggingface.co/blog/security-incident-july-2026) is 4
    pages long, the "companion technical writeup" has a 1+3-page-long TL;DR.

> Some questions
> * What impact do you want to achieve with your research?
> * Specifically, who do you want to pay attention to your work?
> * How should they change their behavior after your work?

#### Popular techniques

##### Hybrid full attention + windowed models: used by 6/9 major open models

```
Hungry Hungry Hippos: Towards Language Modeling with State Space Models
Daniel Y. Fu*†, Tri Dao*†, Khaled K. Saab‡, Armin W. Thomas††, Atri Rudra‡‡, and
Christopher Ré† (Stanford, University at Buffalo)
```

```
Longformer: The Long-Document Transformer Iz Beltagy*, Matthew E. Peters*, Arman
Cohan* (Ai2)
```

```
Mamba: Linear-Time Sequence Modeling with Selective State Spac[es]
Albert Gu¹ and Tri Dao²
(Carnegie Mellon University, Princeton)
```

##### Pre-training Optimizer

Muon: used in 5/6 major open models with disclosed optimizers

```
Keller Jordan blog
Muon: An optimizer for hidden layers in neural networks
December 8, 2024 · 17 min
```

```
Muon is scalable for LLM training
Technical report
J Liu¹, J Su¹, X Yao², Z Jiang¹, G Lai¹, Y Du¹, Y Qin¹, W Xu¹, E Lu¹,+
Collaboration w/ many institutions, formed around NanoGPT speedrun ```
```

##### Inference

vLLM and SGLang used by many LLM providers and neolabs

```
Efficient Memory Management for Large Language Model Serving with
PagedAttention
Woosuk Kwon¹,, Zhuohan Li¹,, Siyuan Zhuang¹, Ying Sheng¹,², Lianmin Zheng¹,
  Cody Hao Yu³, Joseph E. Gonzalez¹, Hao Zhang⁴, Ion Stoica¹
```

```
SGLang: Efficient Execution of Structured Language Model Programs
Lianmin Zheng²,,  Yin³, Z Xie¹, C Sun¹, J Huang⁴, C Hao Yu⁵, S Cao², C
Kozyrakis¹, I Stoica², J E. Gonzalez², C Barrett¹, Y Sheng¹,
among others, Berkeley and Stanford
```

## 4:45 PM session

### LangMAP: A Language-Adaptive Approach to Tokenization (17:17)

Clara Meister, S Salhan, A Szablewski, P Lesci, P Buttery, T Pimentel

[paper](https://arxiv.org/abs/2606.23566)

> * Sometimes the tokenizer has all the right tokens — it just chooses the wrong
>   ones.
> * Can we make a pretrained tokenizer more language-adaptive simply by changing
>   how we score existing tokens, rather than changing the vocabulary itself?

* Language-specific tokenizers improve tokenization quality and the downstream
  performance of models
* Using one with an existing pretrained model requires either training a new
  model from scratch or adapting the vocabulary of the pretrained one.
* We propose Language-adaptive Maximum a Posteriori (LangMAP) Tokenization,
  * extends the UnigramLM algorithm to the multilingual setting by replacing its
    single distribution over the vocabulary with one distribution per language
    over the same vocabulary. LangMAP
  * can be used to
    * train a multilingual language model from scratch, or to
    * adapt a pretrained model's tokenizer to individual languages without
      changing its vocabulary.
* Language labels are required to estimate the per-language distributions;
* at inference, the algorithm selects the highest-probability segmentation
  across languages, ie, it does not need a language label. In
* experiments where we adapt a pretrained tokenizer with LangMAP, we observe
  * consistently higher morphological boundary recall than the original
    tokenizer.
  * In code data, it improves alignment with abstract syntax tree (AST) leaf
    boundaries in all configurations we try.
  * LM fine-tuning experiments: no significant differences in performance for
    most language-task pairs.

### PolERo: Studying Political Evasion in Romanian (17:46)

Gabriel Stefan, Sergiu Nisioi

* Political evasion
  * ie responses that engage with a question while withholding the requestd info
* Recent NLP work on political evasion
  * as a classification task using a
  * two-level taxonomy of response clarity and fine-grained evasion strategies.
  * limited to English, leaving open whether
  * ? the taxonomy and model behavior transfer across languages and pol contexts
* We: PolERo, a dataset of 3,574 human-annotated question-answer pairs
  extracted from official transcripts of five Romanian presidents.
  * We evaluate multiple classification approaches on both datasets under
    matched conditions, including
    TF-IDF baselines, fine-tuned encoder models, a proposed sliding-window
    encoder, and zero/few-shot LLM prompting.
  * cross-lingual transfer
    through joint bilingual training and machine-translation-based data augment.
* results: fine-tuned encoders are competitive,
  cross-lingual transfer is asymmetric, and
  ambivalent evasion categories involving pragmatic cues remain
  the main challenge across all model families.

> Can we automatically detect political evasion?
>
> * Yes, but only partially:
>   clarity (3 classes) is detected well; evasion (9 classes) remains hard
> * LLMs achieve the best results, but
>   the multi-head encoder architecture is a competitive and far cheaper
>   alternative
> * The multi-head architecture can serve as the basis
>   for a discourse-analysis tool

### When Similar Means Different: Evaluating LLMs on Arabic--Hebrew Cognates
(17:48)

Junhong Liang, Noor Abo Mokh, Bashar Alhafni

* Arabic and Hebrew share many words with similar surface forms, including
  true cognates, false friends, and modern loanwords.
* These lexical relationships create ambiguity for cross-ling semant interpret,
* we introduce SemCog Bench, a curated benchmark of
  * 1,858 Arabic--Hebrew word pairs with
  * sentence-level annotations for cognate identification and semantic disambig.
* We evaluate a diverse set of open-source and proprietary LLMs across
  * multiple input representations and contextual settings. Our
* results show reliance on surface-form similarity, with
  weaker performance on false friends and wide variation on loanwords. We
  * context and scale yield model-dependent gains, while
  * original-script inputs generally perform best.
* code and data are publicly available.

#### Morphological Richness / Orthographic Ambiguity

Morphological Richness

* Both Arabic and Hebrew are morphologically rich languages
* many inflectional features (gender, number, person, case, mood, etc)
* various clitics attached to words (conjunctions, prepositions, etc)
* This leads to many forms of the same word which creates sparsity

Orthographic Ambiguity

* Arabic uses optional diacritics (tashkeel) to specify short vowels and
  consonant doubling
  * without context, Arabic words can have up ~7 diacritization and ~3 lemmas
    (core meanings)
* Hebrew uses Nikkud to mark consonantal skeleton

```
لِعَيْنٍ (for an eye)
لَعِين (cursed)

סֵפֶר (book)
סַפָּר (barber)
סָפַר (he counted)
סִפֵּר (he told)
```

#### Experiments: Input Representation

* Raw
* Diacritized:
  * Arabic using CAMeL Tools (Obeid+ 2020)
  * Hebrew using Phonikud (Kolani+ 2025)
* IPA:
  * Arabic using mappings of Khalifa+ 2025
  * Hebrew using Phonikud (Kolani+ 2025)
* Romanized:
  * Using Uroman (Hermjakob+ 2018)


format|Hebrew|Arabic|
---|--------------------------------------------------|-------------------------------------|
Raw| أحب تناول لحم الغنم المشوي لأنه لذيذ وملئ بالنكهة.|  כל בוקר אני אוכל לחם עם חמאה וריבה.|
Diacritized| أَحِبُّ تَناوُل لَحْم الغَنَم المَشْوِيّ لِأَنَّهُ لَذِيذ وَمَلِيء بِالنَكْهَة.| כָּל בּוֹקֶר אֲנִי אוֹכֵל לֶחֶם עִם חֶמְאָה וְרִיבָּה.|
IPA| ʔaħibb tanaːuːla laħm aːlɣanm aːlmaʃuːiː/ /liʔannahu laðiːðin uːmaliː ʔ biaːlnakhat| kʼol bʼokeʁ ʔanʼi ʔuχʼel lʼeχem ʔʼim χemʔʼa/ /.veʁivʼa|
Romanized|ahb tnawl lhm alghnm almshwy lanh lthyth wmly' balnkha.| kl vvqr any avkl lchm 'm chmah vryvh.|

### Rashid: A Cipher-Based Framework for Exploring In-Context Language Learning

Niyati Bafna, Ryan Soh-Eun Shim, Barbara Plank, David Yarowsky, Hale Sirin

[paper](https://arxiv.org/abs/2603.22497)

* in-context language learning (ICLL) for unseen languages with LLMs, such
  * lack of NLP tools, data resources, and researcher expertise. This means that
  * findings on ICLL are often limited to very few languages and tasks. In light
* we: Rashid, a framework for studying ICLL wherein
  * we reversibly cipher high-resource languages (HRLs) to construct truly
    unseen languages with access to a wide range of resources available for
    HRLs, unlocking previously impossible exploration of ICLL phenomena. We use
  * we assess current methods in the field with SOTA evaluation tools and manual
    analysis, explore the utility of potentially expensive resources in
    improving ICLL, and test ICLL strategies on rich downstream tasks beyond MT
  * The name is inspired by stories from the Arabian Nights of
    the ruler Harun al-Rashid
    disguising himself as a commoner in the streets of Baghdad
    in order to understand the problems of the people and restore justice.

From the paper:

* ten mid-to-high resource languages covering
  * seven language (sub)families and three scripts in order to assess the
    effectiveness of ICLL strategies across typologically diverse scenarios:
  * German, Turkish, French, Spanish, Telugu, Hindi, Marathi, Vietnamese, Czech,
    and Polish. These include languages with various linguistic profiles in
  * morphology
    (Vietnamese is isolating, Polish is fusional, and Turkish is agglutinative)
  * syntax: Hindi is SOV while Spanish is SVO, Turkish and Marathi are free
    unlike French

#### Current approaches

* Previous work mentioned in § 2 uses four basic types of resources to augment
  the prompt:
  lexicons with word-level alignment, in-context task exemplars,
  morphological information or glosses per word including part-of-speech, and
  grammar books with the syntactic profile of the language.
* We assess the following approaches for both MT directions (→eng and eng→),
  including two baselines (only-input, L-str), and
  five methods of constructing the prompt for the LLM that use incrementally
  added materials.  The materials are appropriately formatted by direction, eg
  word meanings provided as mapping from input language to the output language.
  * topline: We compute the topline performance for the (unciphered) language,
    with a basic task prompt and no extra information.
  * only-input: Zero-resource LLM baseline, consisting of simply the
    task prompt with ciphered language input. This produces unrelated text
    showing trivial performance, eg from copying the input, punctuation, or
    named entities (< 5 Bleu for all languages), and serves as
    a sanity check baseline.
  * L-str (non-LLM): Word-for-word translation using a lexicon, constructed by
    string concatenation of top lexical equivalents for every word in the
    input. We use fuzzy lexicon search for the input word with normalized edit
    distance as per previous work (Zhang+ 2024b).
  * L: Word meanings from a lexicon provided in the LLM context for every word
    in the input.
    * We use the top k = 2 source matches per word with fuzzy matching, listing
      up to two equivalents per source match in the prompt if the lexicon lists
      multiple.
  * LE: (Additionally) E = 3 input-output exemplar pairs, selected by BM25
    similarity to the input from a held-out exemplar pool, in line with previous
    work (Zhang+ 2024a).
  * LELem: (Additionally) Lexicon matches for the lemmas of input words,
    obtained with Stanza lemmatizers (Qi+ 2020). This
    * mimics a scenario where we can build a basic morphological lemmatizer
      but not more complex tools for a new language.
  * LELemM: (Additionally) Richer morphological glosses
    including POS tags and word features from Stanza. This typically includes
    plurality, person, case, tense-aspect-mood, and other such information.
  * LELemMS: (Additionally) High-level syntactic profile,
    * 8 primary word order features and
    * comments about its morphosyntactic typology based on WALS features (Dryer&)
    * previous works have used grammar books for this purpose,
    * hE Aycock+ (2024) shows that gains from this are largely due to bitext
      examples or lexical leakage in the grammar books.
    * We instead use a manually constructed grammatical description as a
      controlled manner of providing syntactic information to the model.
* We use ChiKhaPo lexicons from Chang and Bafna (2025), consisting of Gatitos
  (Jones+ 2023) and PanLex (Kamholz+ 2014). 6 See
  * more details about all strategies and prompts used in the paper in App C

### Parallel Tokenizers: Rethinking Vocabulary Design
                     in Cross-Lingual Transfer of Low-Resource Languages (18:14)

Muhammad Dehan Al Kautsar, Fajri Koto

[paper](https://arxiv.org/abs/2510.06128)

* existing methods often limit cross-lingual transfer by mapping semantically
  equivalent words to different embeddings. For example, 'I eat rice' in English
  and 'Ina cin shinkafa' in Hausa are typically mapped to different indices,
  * low-resource languages: shared representations could offer the great benefit.
* We introduce parallel tokenizers, a new framework that
  first trains tokenizers monolingually and then
  aligns their vocabularies exhaustively
  using bilingual dictionaries or word-to-word translation. This alignment
  * a shared semantic space across languages while
    naturally improving fertility balance. To assess their effectiveness,
* exper: we pretrain a transformer encoder from scratch on 13 low-resource langs
  * evaluation on sentiment analysis, hate speech detection, emotion classif, &
    sentence embedding similarity. Across all tasks, models trained with
* parallel tokenizers outperform conventional multilingual baselines, confirming

# Tuesday, October 27 — Main Conference Day 3

## 9 AM Session

### Omnilingual MT: Machine Translation for 1,600 Languages (09:25)

B Alastruey, N Bafna, A Caciolai, K Heffernan, A Kozhevnikov, C Ropers, et al

* High-quality machine translation (MT) can scale to hundreds of languages,
  * 200 languages on the target side, and
  * maybe a few hundreds more on the source side, due to cross-lingual transfer.
  * even these numbers have been hard to evaluate due to the
    lack of reliable benchmarks and metrics

* We present Omnilingual Machine Translation (OMT), the first MT system
  * > 1,600 languages. This scale is enabled by a comprehensive data strategy
  * integrates large public multilingual corpora with newly created datasets,
    including manually curated MeDLEY bitext.

* two ways of specializing a Large Language model (LLM) for machine translation:
  * as a decoder-only model (OMT-LLaMA) or as
  * a module in an encoder-decoder architecture (OMT-NLLB). Notably,
* all our 1B to 8B parameter models
  match or exceed the MT performance of a 70B LLM baseline, revealing spec
* evaluation of English-to-1,600 translations further shows that
  baseline models
  * can interpret undersupported languages,
  * hE they frequently fail to generate them with meaningful fidelity;
  * OMT-LLaMA models substantially expand the set of languages
    for which coherent generation is feasible
* OMT models improve in cross-lingual transfer, being
  close to solving the "understanding" part of the puzzle in MT for the 1,600
* leaderboard (BOUQuET) and main human-created evaluation datasets (Met-BOUQuET)
  * dynamically evolving towards Omnilinguality and freely available.

### The Interlingua Hypothesis:
  LLMs Translate via a Latent Task-agnostic Feature Space (09:54)

Jacob Brinton, Jannik Brinkmann, Mark Crovella, Aaron Mueller

[paper](https://arxiv.org/abs/2609.00515)

* LLMs have recently demonstrated improved machine translation performance over
  strong supervised baselines. This raises questions as to what mechanisms
* LLMs use massively multilingual latent feature representations to perform LM
* we propose the interlingua hypothesis. The hypothesis holds that language
  * ie LMs translate by reading a source sentence into a latent feature space,
    and generate a target sentence by reading from the latent feature space.
* three lines of evidence in support of this hypothesis:
  * variance in BLEU across language pairs is
    largely predictable from language-specific competences with
    no language pair-specific interaction terms;
  * many model components are causally influential
    in both monolingual tasks and translation tasks; and
  * fine-tuning on monolingual data recovers a large proportion of
    translation improvements relative to fine-tuning on aligned documents.
* suggest new ways of understanding and improving how MT
