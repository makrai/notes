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

### Gold vs Translation: (16:27) #### Are We Measuring Language, Knowledge, or
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

## [Neubig] On the Value of Open Research in LMing -- An Adversarial Dialog

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

B Alastruey, N Bafna, A Caciolai, K Heffernan, A Kozhevnikov, C Ropers,+

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

#### Motivation

Recent work has found evidence of massively multilingual feature spaces
[Wendler+ 2024; Brinkmann+ 2025]

> eg Plural Feature
> Input: English: _The doctor..._, German: _Der Schauspieler..._, French: _Le manager ..._
> Layer 16
> probabilities: p(is) p(are), p(ist) p(sind), p(est) p(sont)
> [Figure from Brinkmann+ 2025.]

“Stages of inference” [Lad+ 2024]:
the first half of the layers read into more abstract concept representations.
Last half of layers use these representations
to refine the next token prediction.

### HOMURA: Taming the Sand-Glass for Time-Constrained LLM Translation
  via Reinforcement Learning (10:14)

Ziang Cui, Mengran Yu, Chenyu Shi, Yingxuan Shi, Tianjiao Li

[Technical report](arXiv 2609.40181)

* LLMs for MT: systemic cross-lingual verbosity bias, rendering them
  ~> unsuitable for strict time-constrained tasks like subtitling and dubbing.
* prompt-engineering approaches struggle to resolve this
  * conflict between semantic fidelity and rigid temporal feasibility. To bridge
    this gap,
* we introduce
  * Sand-Glass, a benchmark specifically designed to evaluate
    translation under syllable-level duration constraints. Furthermore, we
  * Homura, a reinforcement learning framework that
    explicitly optimizes the trade-off between semantic preservation and
    temporal compliance. By employing a
  * constrained reinforcement learning objective featuring
    a novel dynamic syllable-ratio reward, Homura effectively "tames" the output
    length.
* Experiment: Homura significantly outperforms strong baselines, achieving
  precise length control that respects linguistic density hierarchies
  without compromising semantic adequacy.

[Index-Translate Model Family](https://index-translate.bilibili.com/)

Text, speech, controlled dubbing and long documents

```
Index-Translate
150-language text translation with instructions
2B / 9B / 35B-A3B (preview)

Index-Echo
End-to-end speech-to-text and speech-to-speech
Voice-conditioned dubbing, 2B / 9B

Index-Homura
Translation with a target syllable count
Length control for dubbing, 2B / 9B

Index-NativeLong
Full-document translation in a single generation
Books and long documents, 2B / 9B
```

### Cognitively Decoupled Meta-Induction for Out-of-Distribution Generalization
SAC highlight (16:36)

Yuqian Wang, Y Wang, C Xiao, K Xu, B He, J Tan, Z Chen, L Chen, Y Huo, M Sun

[paper](https://arxiv.org/abs/2610.25749)

* In-context learning (ICL)
  tackles downstream tasks conditioned on demonstrations. This paradigm
  * relies heavily on neighbor-based matching between queries and
    demonstrations, limiting out-of-distribution (OOD) performance. For better
* rule-based inductive reasoning derives task-level regularities, which we term
  task-level inductive representations (TIR), before directly answering.
* hE existing methods lack generalizable inductive ability across diverse tasks.
* Inspired by meta-learning,
* we propose Cognitive-Decoupling meta-Induction (CoDI) for TIR-based inductive
  reasoning on general tasks. CoDI
  * comprises
    * a Cognitive-Decoupling Framework for query-blind TIR induction, and
    * a Dual-Loop Meta-Inductive Learning method for cross-task inducer optimiz
* Empirically
  * substantial performance gains on five ID and OOD benchmarks, and
  * preserves OOD gains without explicit induction at inference.
  Code is available at this https URL.

## 11 AM Session

### When Tokenization is Secretly Output Supervision (11:34)

Tanja Baeumel, Josef van Genabith, Simon Ostermann

[paper](https://arxiv.org/abs/2609.01386)

* Tokenization in LMs is treated by default as an input preprocessing decision.
* We argue that this framing is incomplete:
  in autoregressive models, tokenizer granularity determines
  what the model must resolve in a single forward pass, and therefore
  the supervision signal it receives. This
  affects both the difficulty of the learning problem and
  affects the representations that emerge inside the model. We test this in a
* experiment on numeric reasoning with decoupling of input and output tok
  * As the output supervision view predicts,
    differences in task performance, training dynamics, and model internals are
    induced by output tokenization and largely invariant to input tokenization.
* This may matter in practice, because
  models with different tokenization strategies differ
  not only in input representation but in the task they were trained on.
* Comparisons between models may thus partly reflect task definition rather than
  ability.
* A survey of 120 recent `*`CL papers on numeric reasoning confirms that
  this is rarely acknowledged:
  * only about 10% report the numeric tokenization of the models they evaluate,
  * 69% compare across tokenization, and thus supervision, regimes without
    reporting it. While
* prior work documents that tokenization consistently affects model performance,
  * no principled account of why.
* We argue that framing tokenization as output supervision provides that
  account.

### Translating the Untrans: An Operationalizable Ontology for Untranslatability
(12:22)

Jacob Bremerman, Brihi Joshi, Hirona Arai, Xiang Ren, Jonathan May

[paper](https://arxiv.org/abs/2603.25489)

* Untranslatability,
  * cases where meaning cannot be directly preserved across languages, is
    * translation cannot be reduced to one-to-one equivalence. We introduce a
  * well-studied in linguistics but underexplored in NLP. As machine translation
  * MT limitations increasingly concentrate in such cases, where
* we
  * ontology of untranslatability along with a taxonomy of compensation strategs
  * a multilingual dataset of
    untranslatable sentences paired with strategy-based translations, enabling
    controlled analysis of translation behavior.
  * Initial human preference studies suggest that
    translation quality depends on the strategy used, with
    consistent preferences for outputs that include explanatory context, known
    as the Annotation compensation strategy.

From the paper:

* The most appropriate cStrat for an input
  depends, in general, on both the uType and the translation context. This
  * suggests that translation involves not only generating text, but also
    selecting how meaning should be conveyed

### Translation Asymmetry in LLMs as a Data Augmentation Factor:
  A Case Study for 6 Romansh Language Varieties (12:24)

J Vamvas, IP Prat, A Heldstab, Dominic P. Fischer, Sina Ahmadi, Rico Sennrich

[paper](https://arxiv.org/abs/2603.25489)

* low-resource machine translation rely on
  synthetic data based on text in higher-resource languages. We revisit this
* Romansh, a language with 6 varieties.
* LLMs tend to confuse these varieties when translating into Romansh, but they
* LLMs are quite good at translating out of Romansh into a high-resrc eg `de`
* ie the direction of data augmentation is a crucial choice. We find that
* synthetic translations into the higher-resource language is the superior
* allows us to surpass a Gemini 3 Pro baseline on German-Romansh translation
  (+23 BLEU over Gemini in the lowest-resource variety). A
* human evaluation confirms that our experiments yield the first model that
  * fluent translations in the individual Romansh varieties.

### CoPiT: Cognitive Pivot Translation for Digraphic Low-Resource Mongolian
  in the Traditional Script (12:30)

Burte Bayarsaikhan, Serynn Kim, Buru Chang

[paper](https://arxiv.org/abs/2607.05849)

* a digraphic language: Mongolian is written in both Cyrillic and Traditional
  * severe imbalance in data availability. While the
  * Cyrillic script is relatively well-resourced,
  * the Traditional script remains extremely data-scarce and orthographic ambig
    * substantial performance degradation in direct translation.
    * eg Gemini-3-Pro-Preview API flags Traditional Mongolian script as harmful
      (App A.1, Fig 8)
* We propose CoPiT, a cognitively motivated pivot-based translation pipeline
  that exploits this internal resource hierarchy by
  routing translation through the Cyrillic script. The pipeline explicitly
  resolves script-induced ambiguity in the Traditional script before
  * three linguistically motivated steps
    * aligned with disambiguation processes used by fluent Mongolian readers:
    * vowel harmony recovery, Latin-assisted normiz, and Cyrillic normiz.
    * result: a phonologically specified Cyrillic representation, thereby
    * without relying on large-scale parallel corpora. Instead, it
    * requires only a small amount of data for learning script conversion.
* exper: multiple backbone models and target languages,
  * CoPiT generally improves over direct translation, with
  * substantial absolute BLEU improvements and up to 1.5-1.6x gains in COMET.
  * **These gains
    allow strong open-source models to match or outperform GPT-4.1 under
    comparable evaluation settings.** Beyond inference-time improvements,
* CoPiT enables the construction of synthetic parallel data directly from trad
  * mitigating data scarcity in realistic low-resource scenarios.
  * We release a new multi-script parallel dataset covering
    Mongolian in both scripts alongside English, Korean, and Russian.

## [Korhonen] AI for the Many: Starting from the World, Not the Model

Keynote 3: Anna Korhonen

* Recent evidence shows a widening global linguistic hierarchy, with thousands
* addressing this divide requires a fundamental shift in how we approach AI
  * Instead of asking how existing models can be extended to more people,
    we should ask what communities need from AI and how it can deliver benefit
  * grounding AI in local needs and realities,
    taking account of available resources and infrastructure, and
    judging success by what it delivers in practice. If this technology is to

### Cited

#### Donors and Recipients: On Asymmetric Transfer Across Tasks and Languages
with Parameter-Efficient Fine-Tuning

   K Dymkiewicz, I Vulić, H Yannakoudakis, E Shapira, R Reichart, A Korhonen

* how improvements in one task or language affect other tasks and languages
  remains poorly understood.
* We conduct a controlled LoRA fine-tuning study across
  multiple open-weight LLM families and scales, using a standardised grid of jj11
  languages and four benchmarks.
  * We fine-tune each model on a single task–language source, then
    evaluate it on all other task–language target pairs to measure transfer. We
* three regimes:
  * Matched-Task (Cross-Language),
  * Cross-Task (Matched-Language), and
  * Cross-Task (Cross-Language).
* Single-source fine-tuning yields a net positive uplift across regimes, but the
  gains are strongly asymmetric.
  * Matched-Task, Cross-Language transfer emerges as the most effective and
    structurally regular regime, with
    transfer magnitude driven principally by the identity of the target language
    rather than model architecture. We identify
* a stable coarse-grained hierarchy in which some/other task and lang targets
  * consistently absorb gains from diverse sources, while others
  * remain relatively isolated. These results imply that
* ie effective fine-tuning requires accounting for donor–recipient roles to
  maximise downstream gains
  while limiting collateral degradation in other capabilities.

#### Polyglot Teachers: Evaluating LMs for Multilingual Synthetic Data Generat

               Lester James V. Miranda, Ivan Vulić, Anna Korhonen

* Synthesizing supervised finetuning (SFT) data from language models (LMs) to
  teach smaller models multilingual tasks has become increasingly common.
* hE teacher model selection is often ad hoc,
  typically defaulting to the largest available option, even though such models
  may have significant capability gaps in non-English languages. This practice
  can result in poor-quality synthetic data and suboptimal student downstream
  performance. In this work,
* we systematically characterize what makes an effective multilingual teacher.
  * We combine
    intrinsic measures of data quality with extrinsic student model performance
    in a metric we call Polyglot Score.
  * 10 LMs across 6 typologically diverse languages, generating over
    1.4M SFT examples and training 240 student models. Our analyses reveal that
* model scale alone does not significantly predict teacher effectiveness:
  * the most effective teachers we identify are consistently smaller than the
  * ranking is stable across student base model families.
  * data qualities such as prompt diversity, length, and response fluency
    capture 93.3% of the variance in intrinsic data quality and predict student
    performance. Finally, we provide
* practical recommendations, including
  * matching the model families of teacher-student pairs and
  * generating responses to existing prompts or translating them from English,

## [Best Papers](https://2026.emnlp.org/program/awards_papers/)

### Best Paper

DiscoTrace: Representing and Comparing Answering Strategies of Humans and LLMs
in Information-Seeking Question Answering.

Neha Srikanth, Jordan Boyd-Graber, Rachel Rudinger

* Reveals a
  fundamental limitation in the diversity of discourse strategies used by LLMs.
* Introduces a new ontology of discourse acts, grounded in discourse analysis,
  * provides a framework for understanding LLM behaviour and
    guiding the development of more appropriate responses
    to different users and conversational goals.

Don’t Read Everything: A Curvature-Conditioned Query for Linear Attention.

Dong Le, Thong Thanh Nguyen, Cong-Duy T Nguyen, Anh Tuan Luu

### Best Special Theme Paper

Beyond “To whom it may concern”: Tailoring Machine Translation
to Audience and Intent

Raphaël Merx, Ekaterina Vylomova, Trevor Cohn

Recentering the machine translation task to what it means for a human user by
examining evaluation beyond semantic equivalence to assess
how well a translation serves its intended audience and purpose,
including in challenging low-resource languages.

### Best Resource Paper

XYBench: Can LLMs Respond Pragmatically to Queries with Misconceptions?

Akhila Yerukola, J D. Hwang, M Zheng, J Godsey, H Kim, V Pyatkin, J Hu, M Sap

* An 8,000+ user-generated query benchmark that
  shifts LLM evaluation from passive instruction-following
  to active **user misconception detection** and pragmatic reasoning.

### Social Impact Award

Clinically Grounded Privacy Evaluation of Medical LMs

S Ronaghi, S Tonekaboni, L Stempfle, V Utti, J Li Cahoon, N Hendrix, A Vala,
  M Ghassemi, E Alsentzer

### Best Demo Papers

CoDA: A Human-LM Collaborative Codebook Development Assistant
for Domain-Specific Text Annotation (Runner-Up)

J Ranjit, S Chellappa, A Rivas Costante, C Manjunath, L Onasch-Vera, HW Nadel,
  E Rice, S Swayamptipa

WonderEcon: An Interactive LLM-Agent System for Simulating Economies

Jing Qian, B Liu, W Gu, H Ruan, C Huo, J Yang, M Deng, J Han, B Wang

### Senior Area Chair Highlights

[22](https://2026.emnlp.org/program/awards_papers/#sac-highlights)

### Outstanding Paper Award (22)

- Accelerating Constrained Decoding with Token Space Compression.
Michael Sullivan, Alexander Koller

- Delineates a clever vocabulary compression method that detects grammar-based token equivalence classes, substantially speeding up CFG-constrained decoding with Earley parsing. Makes reliable constrained generation practical in domains such as code generation and chemistry..

- Rethinking the Evaluation of Efficiency Methods for Multi-Agent Systems.
Jiamu Zhang, Lingxi Zhang, Pengjun Lu, Qiyue Zhang, Yu-Neng Chuang, Zhengchen Li, Shuai Xu, Vipin Chaudhary, Hanjie Chen

- Proposes a controlled evaluation that holds the surrounding system fixed and varies only each method’s structural output. Raises hard questions about evaluation on a topic of fast-growing importance..

- SkillHarm: Lifecycle-Aware Skill-Based Attacks via Automated Construction.
Yuting Ning, Zhehao Zhang, Yash Kumar Lal, Boyu Gou, Junyi Li, Weitong Ruan, Chentao Ye, Rahul Gupta, Diyi Yang, Yu Su, Huan Sun

- Presents a timely, well-executed study of skill-based attacks on LLM agents, showing how maliciously written skills can be automatically constructed to compromise both commercial and open systems across the skill lifecycle. Highlights urgent, growing security risks in the agent ecosystem..

- Counterfactual Constraint-Conditioned On-Policy Distillation for Multi-Constraint Instruction Following.
Yanzhao Zheng, Yuanqiang Yu, Tianze Xu, Chao Ma, Zhentao Zhang, Jihuai Zhu, Baohua Dong, Hangcheng Zhu, Ruohui Huang

- Introduces a clever counterfactual credit-assignment method for on-policy distillation, providing fine-grained supervision for following complex instructions. Demonstrates strong improvements over standard distillation at fixed compute..

- OptiMer: Optimal Distribution Vector Merging Is Better than Data Mixing for Continual Pre-Training.
Haiyue Song, Huy Hien Vu, Masao Utiyama

- Proposes a novel approach to the important problem of data mixture optimization for continual pre-training. Instead of exploring different data mixes, it optimizes the merging of model updates from individual datasets, demonstrating improved performance at substantially lower search cost..

- Can MLLMs Perceive and Describe Medical Image Quality Beyond Scores?.
Jiyao Liu, Jinjie Wei, Wanying Qu, Chenglong Ma, Junzhi Ning, Yunheng Li, Ying Chen, Jiafan Zhang, Pengcheng Chen, Xin Gao, Ming Hu, Xin Wang, Shujian Gao, Dingkang Yang, Zhongying Deng, Jin Ye, Lihao Liu, Junjun He, Ningsheng Xu

Introduces a benchmark for investigating the potential use of multimodal LLMs for medical image quality assessment through language descriptions, rather than numerical scores. The benchmark has broad coverage, it has been carefully constructed, involving experts.

- Omnilingual MT: Machine Translation for 1,600 Languages.
Belen Alastruey, Niyati Bafna, Andrea Caciolai, Kevin Heffernan, Artyom Kozhevnikov, Christophe Ropers, Eduardo Sánchez, Charles-Éric Saint-Jacques, Ioannis Tsiamas, Xiang Tony Cao, Chierh Cheng, Joe Chuang, Paul-Ambroise Duquenne, Mark Duppenthaler, Cynthia Gao, Pere-Lluís Huguet Cabot, João Maria Janeiro, Jean Maillard, Gabriel Eduardo Mejia-Gonzalez, Holger Schwenk, Edan Toledano, Arina Turkatenko, Albert Ventayol-Boada, Ravi Arikapudi, Nathanial Paul Ekberg, Rashel Moritz, Alexandre Mourachko, Surya Parimi, Mary Williamson, Shireen Yates, David Dale, Marta R. Costa-jussà

This paper extends machine translation to 1,600 languages, a large step toward serving the world's underrepresented languages. It also contributes new resources and reproducible pipelines that let others build smaller, task-specific MT models.

- Do Benchmarks Measure the Same Thing? Evaluation-Free Benchmark Redundancy Analysis with SAE.
Yaoning Wang, Jiahao Ying, Yubo Ma, Yu Wan, Dayiheng Liu, Yixin Cao, Yu-Gang Jiang

Presents a creative approach to analysing benchmark redundancy using sparse autoencoders, connecting interpretability with benchmarking efficiency. A thorough empirical study with promising results and potential practical impact on how language models are evaluated.

- UReason: Benchmarking Reasoning-to-Generation Alignment in Unified Multimodal Models.
Cheng Yang, Chufan Shi, Bo Shui, Yaokang Wu, Muzi Tao, Huijuan Wang, Ivan Yee Lee, Yong Liu, Xuezhe Ma, Taylor Berg-Kirkpatrick

Introduces a carefully curated benchmark that challenges the common assumption that chain-of-thought reasoning improves image generation in unified multimodal models.

- In-Place Feedback: Reliable Refinement for Multi-Turn Expert-LLM Collaboration.
Youngbin Choi, Minjong Lee, Saemi Moon, Seunghyuk Cho, Chaehyeon Chung, MoonJeong Park, Dongwoo Kim

A feedback mechanism where experts directly edit an LLM's previous response and the model continues from the edited context, instead of appending corrections as a new turn. Outperforms standard multi-turn feedback with fewer tokens and expert user study shows higher satisfaction and substantially lower fatigue.

- D3-Gym: Constructing Real-World Verifiable Environments for Data-Driven Discovery.
Hanane Nour Moussa, Yifei Li, Zhuoyang Li, Yankai Yang, Cheng Tang, Tianshu Zhang, Nesreen K. Ahmed, Ali Payani, Ziru Chen, Huan Sun

The paper constructs executable scientific environments together with automatically generated, task-specific verification. The resulting D3-Gym contains 565 tasks from 239 real scientific repositories across four disciplines.

- The Cost of Sounding Different: Accent Bias in Audio Language Models.
Aruna Srivastava, Orevaoghene Ahia, Li Lucy, Ashley Christendat, Sameep Chattopadhyay, Farhan Samir, Tejumade Afonja, Valentin Hofmann, Sachin Kumar, Noah A. Smith, Yulia Tsvetkov

This paper provides compelling evidence of accent-based discrimination in audio language models, demonstrating that speakers with Chinese and Nigerian accents receive systematically lower delivery scores despite identical content and accurate transcription.

- From Token Probabilities to Semantic Constraints: Towards Declarative Probabilistic Evaluation of Language Models.
Kyle Richardson, Cullen Anderson, Pranav Balakrishnan, Takuto Ban, Daksha Ladia, Ankita Gupta, Marisa Hudspeth

Introduces a novel probabilistic framework for evaluating the logical consistency of language model predictions. Provides new evaluation tests that reveal systematic weaknesses in current models, including cases where consistency deteriorates with model scale.

- Conformal Certification of Reasoning Trace Prefixes.
Matt Y. Cheung, Ashok Veeraraghavan, Hanjie Chen, Guha Balakrishnan

Formalizes the intuitive notion of a clean reasoning prefix and proposes a method for identifying prefixes that are unlikely to contain errors at a specified risk level. Shows improved results in avoiding errors and correcting reasoning traces.

- When Must Faithful Chain-of-Thought Fail? An Information-Theoretic Bound and Its Empirical Limits.
Jikun Wu, Dongxin Guo, SM Yiu

The paper takes an information-theoretic perspective on the topic of whether Chain of Thought reasoning can be faithful to the model's internal computation and provides clear bounds that leave a lot of room for improvement in the state of the art.

- Diffusion Large Language Models for Visual Speech Recognition.
Jeong Hun Yeo, Chae Won Kim, Hyeongseop Rha, Yong Man Ro

Shows that visual speech recognition (lip reading) depends heavily on bidirectional context, and on that basis adapts diffusion large language models as an alternative to autoregressive decoding. Point to new uses for diffusion models in speech and multimodal tasks.

- Race in the Record: Measuring Racial Signal and Model Inference in Police Arrest Narratives.
Arka Dutta, Ted Forsyth, O. Nicholas Robertson, Ashiqur R. KhudaBukhsh

Builds a rich resource for measuring racial signals in police arrest narratives. Shows that LLM processing can amplify the implicit bias in such texts. Rigorous analysis, practical methodology, and candid treatment of limitations and ethics.

- Aligned but Not Partner-Specific: How Multimodal LLM Agents Succeed in Reference Games Without Forming Conceptual Pacts.
Po-Ya Angela Wang, Chinmaya Mishra, Asli Ozyurek, Paula Rubio-Fernandez, Esam Ghaleb

This work sheds new light on how interacting multimodal agents negotiate common ground. The paper uses clever experimental controls to scrutinize claims of strong pragmatic competence in LLMs, revealing a nuanced picture and motivating a rigorous experimental approach.

- Format as Nuisance: Intervention-Inspired Cross-Format Distillation for Knowledge Conflicts.
Yue Yu, Wang Luo, Shenghao Ye, Zepeng Bao, Jiacheng Liu, Yongqi Li, Wenxin Tang, Tiejun Qian

Tackles the important and timely problem of format bias in how LLMs handle knowledge conflicts. Introduces a novel approach that reduces this bias across different models, supported by carefully designed experiments and compelling empirical results.

- Double Trouble: Bilingual Pretraining Leaves Language-Conditioned Effects in Shared-Language Representations.
Anjishnu Mukherjee, Ziwei Zhu, Antonios Anastasopoulos

Uses creative and carefully controlled experiments to show how representations of English concepts are influenced by other languages during pretraining, advancing our understanding of cross-lingual effects in LLMs.

- Language Identification for Non-Standard Varieties: Language Varieties as Geolects on a Geodesic Grid.
Sina Ahmadi, Rico Sennrich

Introduces an innovative, linguistically grounded geospatial resource for language detection comprising 929 geolects across 20 languages. By adopting continuous geolocation-based annotation in place of static language labels, it offers an elegant, scalable solution to address representation gaps in under-resourced languages and language varieties.

- Accountable AI with Grounded, Faithful, Consistent, Actionable Rationales: A Case Study in Clinical Trial Matching with VERDICT.
Zikai Zhou, Yufei Jin, Yilin Xu, Yu-Chiang Wang, Chieh-Ju Chao, Monica Lam

The paper offers a clear operational interpretation of "accountability" of automatic decision making in high-stake domains. It combines LLMs with Satisfiability Modulo Theories logic to evaluate explicit rationale grounding, and counterfactual self-consistency.

# Wednessday, October 28 — Workshops and Tutorials 1

## [6th Workshop on Multilingual Representation Learning (MRL) by SIGTYP](https://sigtyp.github.io/ws2026-mrl.html)

* In 2025, across NAACL, ACL, EMNLP, and AACL, the MRL workshop was the only
  workshop focusing on multilingual NLP broadly, 
  without a focus on a particular region or set of languages. MRL in part serves
  * connect language- and region-specific multilingual work, 
  * encouraging crosslingual collaboration and knowledge sharing. This sixth
  * The main objectives are: 
    * multilingual representation learning methods, including their 
      * theoretical formulation and practical aspects; 
    * how language typology 
      may impact the applicability of these methods and 
      motivate the development of more generic or competit methods across langs
    * to promote collaborations in developing novel 
      software libraries and benchmarks for implementing or eval multiling modls

### What can we do about English-centric NLP? 
Invited talk by Miryam de Lhoneux, KU Leuven, 9:05

Multilingual NLP

* Follows an English-centric paradigm
* Relies heavily on cross-lingual transfer
  * Assumes target language has a high-resource closely related language
    (eg Galician, Faroese, Belarusian)
  * This assumption does not hold for the majority of low-resource languages
    (Yoruba, Amharic, Quechua)
* Defaults to multilingual models
  * Issues: curse of multilinguality, vocabulary bottleneck
    * Partially adressed by modular architectures (MoE)
  * Monolingual models can be competitive (Chang+ 2026; Tatariya+ 2026)

Multilingual benchmarks tend to be translated from English.

#### Tasks that don't rely on translation ([Kreutzer+](https://arxiv.org/abs/2504.11829), Tab 1)

| Benchmark | Task | Rank | Size | Judge? | Source | #Langs | Transl. |
|---|---|---|---|---|---|---|---|
| FLORES-200 | 🔤 MT | ★★★ | ≈ 1,000 | ❌ | 🌐 | 200 | H |
| NTREX-128 | 🔤 MT | ☆☆☆ | ≈ 2,000 | ❌ | 🌐 | 128 | H |
| WMT24++ | 🔤 MT | ☆☆☆ | ≈ 2,000 | ❌ | 🌐 | 55 | H |
| General MT | 🔤 MT | ★★☆ | ≈ 2,000 | ❌ | 🌐 | ≥ 11 | H |
| MAFAND-MT | 🔤 MT | ☆☆☆ | 1,000 | ❌ | 🌐 | 21 | - |
| XLSum | ✂️ Summarization | ★½☆ | 500–11,000 | ❌ | 🌐 | 45 | - |
| CrossSum-In | ✂️ Summarization | ☆☆☆ | 500 | ❌ | [🌐] | 29 | H |
| SEA-IFEval | 📋 Instr. following | ★☆☆ | 105 | ❌ | [⚙️] | 6 | H |
| MIFEval | 📋 Instr. following | ☆☆☆ | 96 | ❌ | [⚙️] | 10 | M |
| MultiIF | 📋 Instr. following | ☆☆☆ | 454–909 | ❌ | [⚙️] | 7 | M |
| MGSM | 🧮 Math | ★★☆ | 250 | ❌ | [👤] | 10 | H |
| AfriMGSM | 🧮 Math | ☆☆☆ | 250 | ❌ | [👤] | 16 | H |
| SeaBench | 💬 Chat | ★☆☆ | 300 | ✅ | 🧑‍🏫 | 3 | - |
| Sea-MTBench | 💬 Chat | ★☆☆ | 58 | ✅ | [🧑‍🏫] | 6 | H |
| MTG | 🪄 Open-ended gen. | ★☆☆ | 3,000 | ✅ | 👤/🌐 | 5 | M+ |
| OMGEval | 🪄 Open-ended gen. | ☆☆☆ | 804 | ✅ | [⚙️] | 5 | M |
| mArenaHard | 🪄 Open-ended gen. | ★☆☆ | 500 | ✅ | [👤] | 23 | M |
| Dolly translated | 🪄 Open-ended gen. | ★★☆ | 200 | ✅ | [👤] | 101 | M+ |
| Aya human-ann. | 🪄 Open-ended gen. | ★☆☆ | 250 | ✅ | 👤 | 7 | - |
| PolyWrite | 🪄 Open-ended gen. | ★☆☆ | ≈ 155 | ✅ | ⚙️ | 240 | M |
| MultiIQ | 🪄 Open-ended gen. | ☆☆☆ | 200 | ✅ | ⚙️/👤 | 137 | M |

Jelmagyarázat (az eredeti felirat alapján):
- Source: 🌐 web, 👤 crowd, 🧑‍🏫 szakértők (experts), ⚙️ gépi generálás. 
  A szögletes zárójel `[ ]` korábbi benchmark kiterjesztését jelöli.
- Transl.: a promptok fordítása: H = emberi (Human), M = gépi (Machine), 
  M+ = gépi, emberi utószerkesztéssel.
- Judge?: ✅ = LLM-bírálatú benchmark.
- Rank: népszerűség a modellkiadásokban (0–3 csillag), see Sec B of the paper

### Towards Multilingual Lingu Evaluation at Scale, Invited talk by Jaap Jumelet,Uni Groningen, 9:50

Imrove understanding of model behaviour using linguistic concepts
Imrove understanding of linguistic concepts using model behaviour?

#### Mentioned: ACL 2027 Theme Track: [**Homogenization** and knowledge collapse in LLMs](https://2027.aclweb.org/calls/main/#acl-2027-theme-track-homogenization-and-knowledge-collapse-in-llms)

* LLMs tend to collapse diversity in their outputs. As LLMs become fundamental
  * from rich, human-driven discourse toward what has been called 
    a “generative monoculture” where 
    current training and alignment practices may inadvertently 
    compress the wide spectrum of human thought 
    into a limited range of stereotyped outputs. 
* This special theme invites papers investigating 
  whether LLMs produce low-diversity responses, 
  rely on repetitive linguistic structures, and 
  converge on a narrow set of solutions, 
  potentially acting as drivers of cultural homogenization.

* Possible topics of research include (but are not limited to) the following: 
  * Metrics and methodologies for assessing 
    homogenization, cultural flattening and knowledge collapse trends in LLMs.
  * Identification of the mechanisms that could be inducing these trends, 
    eg analyses of training data, alignment strategies, decoding methods, and
    optimization objectives that may contribute to reduced output diversity,
    along with proposals for mitigation.
  * Search space exploration vs convergence in generative models: 
    To what extent do LLMs explore the breadth of possible responses versus
    converging on high-probability, stereotyped outputs? 
    What are the trade-offs between coherence, safety, and diversity?
  * Human vs Model Diversity: interdisciplinary perspectives on 
    epistemic diversity and Knowledge Representation in LLMs, including
    comparative studies of variability in human- vs LLM-generated responses
    across domains (eg linguistic, cultural, cognitive), 
    drawing on insights from linguistics, cognitive science, sociology, and rel
  * Cross-linguistic homogenization: 
    When queried in different languages, do LLMs respond more uniformly than
    humans would? 
    * To what extent are LLMs capable of adapting their responses 
      to the writing and cultural norms that best associate to the query lang?
      Do LLMs produce more uniform text in lower-resource languages?
  * LLMs and ideological polarization: Under what conditions might LLMs
    contribute to homogenized or fragmented discourse? This includes
    * whether and how LLMs compress, filter, or privilege certain forms of
      knowledge, and the implications for pluralism in knowledge systems.

* Theme track submissions can be either long or short. We anticipate having a
  special session for this theme at the conference and 
  a Thematic Paper Award in addition to other categories of awards.

#### MultiBLiMP 1.0: A Massively Multilingual Benchmark of Ling Minimal Pairs
Jaap Jumelet, Leonie Weissweiler, Joakim Nivre, Arianna Bisazza

[paper](https://arxiv.org/abs/2504.02768)
[dataset](https://huggingface.co/datasets/jumelet/multiblimp)

* 101 languages and 2 types of subject-verb agreement, containing more than
  128,000 minimal pairs. Our minimal pairs are 
* created using a fully automated pipeline, leveraging the large-scale
  Universal Dependencies and UniMorph. MultiBLiMP 1.0 evaluates abilities of

- Recently many language-specific benchmarks have been introduced:
  - Dutch: BLiMP-NL
  - Mandarin Chinese: ZhoBLiMP
  - Russian: RuBLiMP
  - Japanese: JBLiMP
- All these efforts rely on **linguistic experts** of that language
- How can we scale linguistic evaluation beyond this?

### Coffee break, 10:30

### Poster session, 11:00

### Lunch time, 12:30

### Invited talk by Ahmet Üstün (Cohere), 14:00

### Shared task + presentation, 14:40

### Sponsorship talk, 15:00

### Coffee break, 15:30

### Invited talk by Alham Fikri Aji (MBZUAI), 16:00

### Best paper and Closing remark , 16:40
