# EMNLP 2026 -- Notes by Márton Makrai

# Sunday, October 25 — Main Conference Day 1

## Session: 11 AM Interpretability and Analysis of Models for NLP 1

### The Geometry of Low-Resource Language Representations

[Francois Meyer](https://francois-meyer.github.io/)

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
* more consistent gains on the most challenging tasks
* the repral geo of low~ and high-resource langs in LLMs is measurably distinct,
* targeted geo intervention is viable for improving CPT for low-resource langs.

Behind the news: Actionable interpretability is a thing.

## [Elliott & Zhang] Preliminary Report on the AI Reviewing Experiment

keynote by Desmond Elliott and Mike Zhang

[official post](https://2026.emnlp.org/ai-reviewing-experiment/)

* EMNLP 2026 is running an AI Reviewing Experiment to
  collect feedback from authors about the quality of AI reviews
  * on an opt-in basis, in which authors need to declare whether they agree to

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

### Do Language Models Understand Implicit Logical Meaning?
#### A Case Study of Scope Ambiguity Resolution in Context (16:18)

Jieun Kim, Suhyeon Park, Kunhui Lee, Seung-Hoon Na

[paper](https://openreview.net/forum?id=XgOewsKw4h)

* Kamath+ (2024) primarily evaluates scope sensitivity through output
* ? whether alternative interpretations are internally repred
  or merely reflected in shifted token probabilities.
* We introduce an evidence-first, ambiguity-following diagnostic
  * the surface string is held constant and only
    contextual evidence biases interpretation,
    ? do transformer language models form distinct internal reprations
    corresponding to alternative logical readings?
* To investigate this, we present SCOPEx,
  extending the dataset of Kamath+ (2024) by
  systematically manipulating preceding context while
  keeping the ambiguous sentence identical
  + passivized variants as syntactically less ambiguous controls
* we show that transformer LMs:
  * exhibit systematic scope-sensitive behavior conditioned on context, and
  * form separable hidden-state reprations for alternative scope readings
  * This divergence emerges in later layers and
    causally influences downstream predictions.

### Gold vs Translation: (16:27)
#### Are We Measuring Language, Knowledge, or Locality in Translated Benchmarks?

Klaudia-Doris Thellmann, Bernhard Stadler, DS Smart, M Färber, J Lehmann

[paper](https://openreview.net/forum?id=2SI74SsSSq)

* Translated versions of English-origin benchmarks such as MMLU are widely used
* Do they measure the same constructs as natively created benchmarks?
  * We frame this as a *proxy validity* question and
* we compare DeepL-translated MMLU proxies against six native benchmarks
  * seven pairings across five Nordic and Baltic languages, evaluating
  * 29 models on each pairing.
* measures:
  * ranking agreement
  * controlling for model size and language proficiency
    * what we call incremental proxy validity:
* finding varies substantially across benchmark pairings
  * four robust effects, two marginal effects, and one null result
  * strongest evidence occurs for curriculum-overlap benchmarks such as Skolprov
    (𝛥 R2=.128, 95% CI [.038,.253]), whereas
  * translated MMLU provides no significant incremental value for
    Sweden-specific factual knowledge in SwedishFacts (p=.242).
  * hE SwedishFacts is also the only open-ended benchmark,
    ~> we cannot fully separate the effects of content and format.
* Overall:
  translated benchmarks provide a better proxy
  when their source content overlaps with the native evaluation target, while
  locally anchored knowledge is less reliably captured.

### BenchPreS: A Benchmark for Context-Aware Personalized Preference Selectivity
#### of Persistent-Memory LLMs (16:46)

Sangyeon Yoon, Hyesoo Hong, Wonje Jeung, Yongil Kim, W Seo, H Yeen, A No, S Kim

[paper](https://arxiv.org/abs/2603.16557)

* LLMs increasingly store user preferences in persistent memory: personalization
* third-party communication settings
  * governed by social and institutional norms,
  * some user preferences may be inappropriate to apply.
* We introduce BenchPreS, which evaluates whether memory-based user preferences
  are appropriately applied or suppressed across communication contexts
* two complementary metrics,
  Misapplication Rate (MR) and Appropriate Application Rate (AAR)
* even frontier LLMs struggle to apply preferences context-sensitively
  * Models with stronger preference adherence exhibit
    higher rates of over-application, and
    neither reasoning capability nor selectivity-oriented prompting
    fully resolve this issue
  * ie LLMs treat preferences as globally enforceable rules
    rather than as context-dependent normative signals.

### Universal-Guided Grammar Induction (17:34--37)

Yuan Gao, Weiwei Sun

[paper](https://aclanthology.org/2026.emnlp-main.2485/)

* We study whether Universal Grammar syntactic principles can serve
  as explicit inductive biases for unsupervised grammar induction.
* We introduce a neuro-symbolic PCFG framework that
  * converts hypothesized linguistic universals into rule schemata, and then
  * learns rule probabilities from child-directed speech
  * our three (alter) assumptions:
    * extended projection,
    * prototype theory of part-of-speech, and
    * the final-over-final constraint
* resu:
  * with a much smaller hypothesis space,
  * superior performance to SOTA neural grammar induction models,
  * more interpretable functional category assignment.

# Monday, October 26 — Main Conference Day 2

### AfriSUD: A Dependency Treebank Collection for Eval Models on African Langs
9:05

H Buzaaba, CM B Dione, DI Adelani, S Kahane, B Guillaume, K Gerdes, SH Muhammad,
  K Guan, A Aremu, NA Etori, U Inyang, P Nabende, DS Bamutura, A Bukula,
  I Akinade, C Uchechukwu, R Mabuya, C Fellbaum

[paper](https://aclanthology.org/2026.emnlp-main.1896/)

* AfriSUD, the first multiling collection of synt treebanks
  for nine diverse African languages
  spanning major language families and regions across Sub-Saharan Africa
  * Surface-Syntactic Universal Dependencies (SUD) framework, community-led
  * high-quality, native-speaker-verified data
  * capture typological key features such as agglutination and tone.
* We evaluate a range of models on AfriSUD
  for part-of-speech tagging and dependency parsing,
  * models: non-transformer baselines, multiling pretrained encoders, and LLMs.
* results: significant syntax gap, models still show clear limitations

#### Hardest constructions

|-------------------------------------|-----------------------------------------------------|
|Serial verb constructions (comp:svc) | Which verb is the head? Rare for European languages.|
|Possessive constructions (comp:poss) | African languages mark possession differently from English and European languages.|
|Underspecified (udep)                | construction with no clean linguistic equivalent.|
|TAM auxiliaries (comp:aux)           | tense, aspect and mood markers; models fail to distinguish function from content head.|

#### Gap (UAS LAS) by rel and lang

100 = head is always right, label never

| Relation | Language | Gap |
|---|---|---|
| comp:svc | hau/swa | 100 |
| comp:svc | xho | 85 |
|   |   |   |
| comp:poss | hau | 100 |
| comp:poss | kin | 86 |
|   |   |   |
| udep | hau | 68 |
| udep | wol | 57 |
| |   |   |
| comp:aux | xho | 44 |
| comp:aux | kin | 39 |
| comp:aux | nyn | 32 |

### The Multilingual FrameNet Corpus (9:36)

Beatrice Fiumanò, Nicolas Lazzari, Simone Paolo Ponzetto, Valentina Presutti

[paper](https://arxiv.org/abs/2608.23037)

* We: The Multilingual FrameNet Corpus (mFNC)
* extends the English Berkeley FrameNet corpus by
* collecting and harmonizing existing language-specific corpora across +9 langs:
  * Brazilian Portuguese, Chinese, Dutch, French, German, Italian, Korean,
    Latvian, and Swedish.
* We train models with different architectures on the mFNC
* consistently outperform existing SOTA Frame Semantic Parsers in
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
  making these methods difficult to extend to newly released benchmarks
* we present ZipBench, a simple and low-cost BCM
  * theoretical error and rank-consistency guarantees
  * evaluates only a small set of anchor LLMs,
    synthesizes pseudo evaluation results to broaden coverage,
    learns compact sample representations, and
    selects a small yet representative subset.
* we [also] create ZipBench Zoo
  * a collection of compact versions of 100+ benchmarks
  * text, multimodal, and agent tasks
* mean absolute errors of 0.002–0.02 and average Spearman correlations of ~0.98
* ZipBench reduces the cost of both LLM evaluation and compact benchmark constr,
* All data, code and checkpoints will be fully released.

### Chronoberg: A 250-Year Diachronic Corpus with Temporal Affective Lexicons
for Language Model Analysis (10:05)

Niharika Hegde, S Paul, L-J Frey, M Brack, K Kersting, M Mundt, P Schramowski

[paper](https://arxiv.org/abs/2509.22360)

* LLMs excel at operating at scale by leveraging social media and crawled data
* hE lack of long-term temporal structure
  * ? contextualize semantic and normative evolution of language
  * ? capture diachronic variation. To support the latter,
* we introduce Chronoberg,
  * to support dia vari
  * a temporally structured corpus of English book texts spanning 250 years,
    curated from Project Gutenberg and enriched with
    + a variety of temporal annotations.
* books enable us to
  * quantify lexical semantic change through time-sensitive Val-Aro-Dom analysis
  * support historically-grounded interpretation.
* With the lexicons at hand, we demonstrate a need for
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

Junhong Liang, D Orel, S Almheiri, B Elbouardi, Y Samih, A Alhakim Freihat,
  Z Xie, M Ahsan, M Dehan Al Kautsar, S Ahmad, O El Herraoui, M Anwar, P Nakov,
  F Koto

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

Ayush Maheshwari, Kaushal Sharma, Vivekkumar Vasudevbhai Patel,
  Aditya Maheshwari

[benchmark](https://huggingface.co/datasets/bharatgenai/IndicParam)

* LLMs excel on high-resource multilingual tasks,
* hE low~ and extremely low-resource Indic languages remain sever under-evaled
* We: IndicParam, a human-curated benchmark of 13,000 multiple-choice questions
  * 11 Indic languages
    * low-resrc: Nepali, Gujarati, Marathi, Odia
    * extremely: Dogri, Maithili, Rajasthani, Sanskrit, Bodo, Santali, Konkani
* evaluated 20 LLMs, both proprietary and open-weights, which reveals that
* even the top-performing Gemini-2.5 reaches 58% average accuracy,
  followed by GPT-5 (45) and DeepSeek-3.2 (43.1).
* We additionally
  * label each question as knowledge-oriented or purely linguistic
  * diverse question formats-such as
    eg list-based matching, assertion-reason pairs, and
    sequence ordering-alongside conventional multiple-choice questions.

### Harm or Humor: A Multimodal, Multilingual Benchmark
#### for Overt and Covert Harmful Humor (11:30)

Ahmed Sharshar, Hosam Elgendy, Saad El Dine Ahmed, Yasser Rohaim, Yuxia Wang

[paper](arXiv:2603.17759)

* Dark humor often relies on subtle cultural nuances and implicit cues
  * require contextual reasoning to interpret,
  * posing safety challenges that current static benchmarks fail to capture
* we: a novel multimodal, multilingual benchmark for detecting and understanding
  harmful and offensive humor, manually curated
  * 3,000 texts and 6,000 images in English and Arabic, alongside
  * 1,200 videos that span English, Arabic, and language-independent (universal)
    contexts.
* strict annotation guideline: distinguishing Safe jokes from Harmful ones, with
  * Harmful further classified into Explicit (overt) and Implicit (Covert)
* We systematically evaluate SOTA open and closed-source models
  across all modalities.
* findings: closed-source models significantly outperform open-source ones, with
  * notable difference in performance between English and Arabic in both

### Variable-Rank Adaptation: A Comprehensive Survey of Rank Budgeting LoRAs
(11:46)

Max Ploner, Alan Akbik

[paper](https://aclanthology.org/2026.findings-emnlp.2430/)

* The capacity of LoRA is fundamentally governed by its rank parameter
* standard implementations apply a uniform rank across all layers,
* a recent wave of variable-rank extensions: ranks <~ module importance
* literature remains highly fragmented and lacks systematic cross-comparisons.
* four categories: Rank growth, pruning, redistribution, and pre-allocation.
* We analyze their design dimensions, theoretical expressiveness,
  implementation complexity, and memory efficiency
* critical: lack of standardized evaluations and memory metrics.

### NaijaS2ST: A Multi-Accent Benchmark for Speech-to-Speech Translat Nigerian
(12:17)

Marie Maltais, Y Jeon, M Ma, SH Muhammad, I Abdulmumin, MI Mukhtar, D Abolade,
  J Okepefi, J Sewedo, DI Adelani

[paper](https://arxiv.org/abs/2604.16287)

* we introduce NaijaS2ST, a parallel speech translation dataset spanning
  * Igbo, Hausa, Yorùbá, and Nigerian Pidgin paired with English
* 50 hours of speech per language and captures
  * substantial variation in speakers and accents
  * ie realistic multilingual and multi-accent conditions.
* exper: cascaded, end-to-end (E2E), and AudioLLM-based approaches
  across bidirectional translation settings
* results for speech-to-
  * text: audio LLMs with few-shot examples are more effective
  * speech: the cascaded and audio LLM paradigms yield comparable performance,

### ScopeBench: Evaluating Cultural Norm Scope Awareness in LLMs (12:19)

Haojun Liang, Ziwei Zhao, Chenyu Li, Qiyue Zhao, Rongduomijia Mu, Yulan Shen,
  Yu Gu, Chen Zhang, Kairui Zhang, Yanbiao Ma, Wenxuan Wang

[paper](https://ziwayzhao.github.io/assets/pdf/ScopeBench.pdf)

* Safety evaluation in LLMs treats harm as culturally invariant, yet a model
  * LLM has to know whose norms bind
* we: ScopeBench, a benchmark
* 3,323 norms
  * spanning 49 countries across nine cultural clusters, each annotated as
    UNIVERSAL or SPECIFIC
  * three scope error types identically across four evaluation tasks:
    Scope Inflation, Scope Deflation, and Scope Displacement.
* Evaluating 21 frontier LLMs across seven model families
* three structural failures.
  * dominant error type (per eval granularity)
    * Scope Deflation reaches 70% in single-answer classification, while
    * Scope Inflation reaches 33% when each candidate culture is judged indeply
  * scope-classification accuracy is empirically
    decoupled from behavioral safety:
    the six classifiers achieving ≥ 97% Task 1 accuracy still produce harmful
    responses to 40–42% of scope-violating statements.
  * no model is safe in interaction, with
    harmful-response rates ranging from 29% to 51% across the cohort,
    excluding one model that systematically refuses the task.
* We release all data, code, and model outputs to establish cultural scope

## [Neubig] On the Value of Open Research in LMing -- An Adversarial Dialog

Graham Neubig (keynote, 3:15 PM)

### From the abstract

* Much research has moved out of the public eye and behind closed doors
* I will present some
  * often-cited arguments against the value of open research in LLM tech, and
  * counter arguments for why open research is still important, albeit
    under certain conditions
* some personal anecdotes for my own projects that I think have been
  successful in the face of these headwinds, and may be informative for
  listeners who are also interested in expanding the impact of their work.

### Highlights from the talk

* open models lag behind proprietary ones by 104 days
* [Anatomy of a Frontier Lab Agent Intrusion: A Technical Timeline of the July 2026 Incident](https://huggingface.co/blog/agent-intrusion-technical-timeline)
  * [The incident disclosure](https://huggingface.co/blog/security-incident-july-2026) is
    4 pages long, the "companion technical writeup" has a 1+3-page-long TL;DR.

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
Longformer: The Long-Document Transformer
Iz Beltagy*, Matthew E. Peters*, Arman Cohan* (Ai2)
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
Efficient Memory Management for LLM Serving with PagedAttention
Woosuk Kwon¹,, Zhuohan Li¹,, Siyuan Zhuang¹, Ying Sheng¹,², Lianmin Zheng¹,
  Cody Hao Yu³, Joseph E. Gonzalez¹, Hao Zhang⁴, Ion Stoica¹
```

```
SGLang: Efficient Execution of Structured Language Model Programs
Lianmin Zheng²,,  Yin³, Z Xie¹, C Sun¹, J Huang⁴, C Hao Yu⁵, S Cao²,
  C Kozyrakis¹, I Stoica², J E. Gonzalez², C Barrett¹, Y Sheng¹, among others,
Berkeley and Stanford
```

## 4:45 PM session

### LangMAP: A Language-Adaptive Approach to Tokenization (17:17)

Clara Meister, S Salhan, A Szablewski, P Lesci, P Buttery, T Pimentel

[paper](https://arxiv.org/abs/2606.23566)

> * Sometimes the tokenizer has all the right tokens
>   — it just chooses the wrong ones.
> * Can we make a pretrained tokenizer more language-adaptive simply by changing
>   how we score existing tokens, rather than changing the vocabulary itself?

* Language-specific tokenizers improve
  tokenization quality and the downstream performance of models
* Using one with an existing pretrained model requires either training a new
  model from scratch or adapting the vocabulary of the pretrained one.
* We propose Language-adaptive Maximum a Posteriori (LangMAP) Tokenization,
  * extends the UnigramLM algorithm to the multilingual setting by
    replacing its single distribution over the vocabulary
    with one distribution per language over the same vocabulary
  * can be used to
    * train a multilingual language model from scratch, or to
    * adapt a pretrained model's tokenizer to individual languages
      without changing its vocabulary.
* Language labels are required to estimate the per-language distributions;
* at inference, the algorithm selects the highest-probability segmentation
  across languages,
  * ie, it does not need a language label
* experiments where we adapt a pretrained tokenizer with LangMAP, we observe
  * consistently higher morphological boundary recall
    than the original tokenizer.
  * In code data, it
    improves alignment with abstract syntax tree (AST) leaf boundaries
    in all configurations we try
  * LM fine-tuning experiments: no significant differences in performance
    for most language-task pairs.

### PolERo: Studying Political Evasion in Romanian (17:46)

Gabriel Stefan, Sergiu Nisioi

* Political evasion
  * ie responses that engage with a question while withholding the requestd info
* Recent NLP work on political evasion
  * as a classification task
  * two-level taxonomy of response clarity and fine-grained evasion strategies.
  * limited to English
  * ? the taxonomy and model behavior transfer across languages and pol contexts
* We: PolERo, a dataset of 3,574 human-annotated question-answer pairs
  extracted from official transcripts of five Romanian presidents.
  * We evaluate multiple classification approaches on both datasets under
    matched conditions, including
    TF-IDF baselines, fine-tuned encoder models,
    a proposed sliding-window encoder, and zero/few-shot LLM prompting.
  * cross-lingual transfer
    through joint bilingual training and machine-translation-based data augment.
* results: fine-tuned encoders are competitive,
  cross-lingual transfer is asymmetric, and
  * main challenges: ambivalent evasion categories involving pragmatic cues

> Can we automatically detect political evasion?
>
> * Yes, but only partially:
>   clarity (3 classes) is detected well; evasion (9 classes) remains hard
> * LLMs achieve the best results, but
>   the multi-head encoder architecture is
>   a competitive and far cheaper alternative
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
  * multiple input representations and contextual settings
* results show reliance on surface-form similarity, with
  weaker performance on false friends and wide variation on loanwords
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

* Arabic uses optional diacritics (tashkeel)
  to specify short vowels and consonant doubling
  * without context, Arabic words can have
    ~7 diacritization and ~3 lemmas (core meanings)
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

* in-context language learning (ICLL) for unseen languages with LLMs
  * lack of NLP tools, data resources, and researcher expertise
  * findings on ICLL are often limited to very few languages and tasks
* we: Rashid, a framework for studying ICLL wherein
  * we reversibly cipher high-resource languages (HRLs) to construct truly
    unseen languages with access to a wide range of resources available for
    HRLs, unlocking previously impossible exploration of ICLL phenomena
  * we assess current methods in the field with SOTA evaluation tools and manual
    analysis, explore the utility of potentially expensive resources in
    improving ICLL, and test ICLL strategies on rich downstream tasks beyond MT
  * The name is inspired by stories from the Arabian Nights of
    the ruler Harun al-Rashid
    disguising himself as a commoner in the streets of Baghdad
    in order to understand the problems of the people and restore justice

From the paper:

* ten mid-to-high resource languages covering
  * seven language (sub)families and three scripts in order to assess the
    effectiveness of ICLL strategies across typologically diverse scenarios:
  * German, Turkish, French, Spanish, Telugu, Hindi, Marathi, Vietnamese, Czech,
    and Polish
  * morphology
    (Vietnamese is isolating, Polish is fusional, and Turkish is agglutinative)
  * syntax: Hindi is SOV while Spanish is SVO, Turkish and Marathi are free

#### Current approaches

* Previous work mentioned in § 2 uses four basic types of resources to augment
  the prompt:
  lexicons with word-level alignment, in-context task exemplars,
  morphological information or glosses per word including part-of-speech, and
  grammar books with the syntactic profile of the language.
* We assess the following approaches for both MT directions (→eng and eng→),
  * two baselines (only-input, L-str), and
* five methods of constructing the prompt for the LLM that
    use incrementally added materials
    * The materials are appropriately formatted by direction, eg word meanings
      provided as mapping from input language to the output language.
  * topline: We compute the topline performance for the (unciphered) language,
    with a basic task prompt and no extra information.
  * only-input: Zero-resource LLM baseline, consisting of simply the
    task prompt with ciphered language input
    * produces unrelated text showing trivial performance, eg from copying the
      input, punctuation, or named entities (< 5 Bleu for all languages), and
      serves as a sanity check baseline.
  * L-str (non-LLM): Word-for-word translation using a lexicon, constructed by
    string concatenation of top lexical equivalents for every word in the
    input
    * fuzzy lexicon search for the input word with normalized edit distance as
      per previous work (Zhang+ 2024b).
  * L: Word meanings from a lexicon provided in the LLM context for every word
    in the input.
    * We use the top k = 2 source matches per word with fuzzy matching, listing
      up to two equivalents per source match in the prompt if the lexicon lists
      multiple.
  * LE: (Additionally) E = 3 input-output exemplar pairs, selected by BM25
    similarity to the input from a held-out exemplar pool, in line with previous
    work (Zhang+ 2024a).
  * LELem: (Additionally) Lexicon matches for the lemmas of input words,
    obtained with Stanza lemmatizers (Qi+ 2020)
    * mimics a scenario where we can build a basic morphological lemmatizer
      but not more complex tools for a new language.
  * LELemM: (Additionally) Richer morphological glosses
    including POS tags and word features from Stanza
    * eg plurality, person, case, tense-aspect-mood, and other such information.
  * LELemMS: (Additionally) High-level syntactic profile,
    * 8 primary word order features and
    * comments about its morphosyntactic typology based on WALS features (Dryer&)
    * previous works have used grammar books for this purpose,
    * hE Aycock+ (2024) shows that gains from this are largely due to bitext
      examples or lexical leakage in the grammar books.
    * We instead use a manually constructed grammatical description as a
      controlled manner of providing syntactic information to the model.
* We use ChiKhaPo lexicons from Chang and Bafna (2025),
  consisting of Gatitos (Jones+ 2023) and PanLex (Kamholz+ 2014)
  * more details about all strategies and prompts used in the paper in App C

### Parallel Tokenizers: Rethinking Vocabulary Design
#### in Cross-Lingual Transfer of Low-Resource Languages (18:14)

Muhammad Dehan Al Kautsar, Fajri Koto

[paper](https://arxiv.org/abs/2510.06128)

* existing methods often limit cross-lingual transfer by mapping semantically
  equivalent words to different embeddings
  * eg 'I eat rice' in English and 'Ina cin shinkafa' in Hausa are
    typically mapped to different indices,
  * low-resource languages: shared representations could offer a great benefit.
* We introduce parallel tokenizers, a new framework that
  first trains tokenizers monolingually and then
  aligns their vocabularies exhaustively
  using bilingual dictionaries or word-to-word translation
  * a shared semantic space across languages while
    naturally improving fertility balance
* exper: we pretrain a transformer encoder from scratch on 13 low-resource langs
  * evaluation on sentiment analysis, hate speech detection, emotion classif, &
    sentence embedding similarity
* parallel tokenizers outperform conventional multilingual baselines
  across all tasks

# Tuesday, October 27 — Main Conference Day 3

## 9 AM Session

### Omnilingual MT: Machine Translation for 1,600 Languages (09:25)

B Alastruey, N Bafna, A Caciolai, K Heffernan, A Kozhevnikov, C Ropers,+

* High-quality machine translation (MT) can scale to hundreds of languages,
  * 200 languages on the target side, and
  * maybe a few hundreds more on the source side, due to cross-lingual transfer.
  * even these numbers have been hard to evaluate due to the
    lack of reliable benchmarks and metrics

* We present Omnilingual Machine Translation (OMT)
  * $> 1,600$ languages. This scale is enabled by a comprehensive data strategy
  * integrates large public multilingual corpora with newly created datasets,
    including manually curated MeDLEY bitext.

* two ways of specializing a Large Language model (LLM) for machine translation:
  * as a decoder-only model (OMT-LLaMA) or as
  * a module in an encoder-decoder architecture (OMT-NLLB)
* all our 1B to 8B parameter models
  match or exceed the MT performance of a 70B LLM baseline
* evaluation of English-to-1,600 translations shows that baseline models
  * can interpret undersupported languages,
  * hE they frequently fail to generate them with meaningful fidelity;
  * OMT-LLaMA models substantially expand the set of languages
    for which coherent generation is feasible
* OMT models improve in cross-lingual transfer,
  close to solving the "understanding" part of the puzzle in MT for the 1,600
* leaderboard (BOUQuET) and main human-created evaluation datasets (Met-BOUQuET)
  * dynamically evolving towards Omnilinguality and freely available.

### The Interlingua Hypothesis:
  LLMs Translate via a Latent Task-agnostic Feature Space (09:54)

Jacob Brinton, Jannik Brinkmann, Mark Crovella, Aaron Mueller

[paper](https://arxiv.org/abs/2609.00515)

* LLMs have recently demonstrated improved machine translation performance
  over strong supervised baselines. This raises questions about the mechanisms
* LLMs use massively multilingual latent feature representations to perform LM
* we propose the interlingua hypothesis
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
* suggest new ways of understanding and improving MT

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
  * conflict between semantic fidelity and rigid temporal feasibility
* we introduce
  * Sand-Glass, a benchmark specifically designed to evaluate
    translation under syllable-level duration constraints
  * Homura, a reinforcement learning framework that
    explicitly optimizes the trade-off between semantic preservation and
    temporal compliance
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
#### SAC highlight (16:36)

Yuqian Wang, Y Wang, C Xiao, K Xu, B He, J Tan, Z Chen, L Chen, Y Huo, M Sun

[paper](https://arxiv.org/abs/2610.25749)

* In-context learning (ICL)
  tackles downstream tasks conditioned on demonstrations
  * relies heavily on neighbor-based matching between queries and
    demonstrations, limiting out-of-distribution (OOD) performance
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
  affects the representations that emerge inside the model
* experiment on numeric reasoning with decoupling of input and output tok
  * As the output supervision view predicts,
    differences in task performance, training dynamics, and model internals are
    induced by output tokenization and largely invariant to input tokenization.
* This may matter in practice, because
  models with different tokenization strategies differ
  not only in input representation but in the task they were trained on.
* Comparisons between models may partly reflect task definition rather than abil
* A survey of 120 recent `*`CL papers on numeric reasoning confirms that
  this is rarely acknowledged:
  * only about 10% report the numeric tokenization of the models they evaluate,
  * 69% compare across tokenization (ie supervision) regimes without reporting
* prior work documents that tokenization consistently affects model performance,
  * no principled account of why.
* We: framing tokenization as output supervision provides that account.

### Translating the Untrans: An Operationalizable Ontology for Untranslatability
(12:22)

Jacob Bremerman, Brihi Joshi, Hirona Arai, Xiang Ren, Jonathan May

[paper](https://arxiv.org/abs/2603.25489)

* Untranslatability,
  * there are cases where meaning cannot be directly preserved across
    * translation cannot be reduced to one-to-one equivalence
  * well-studied in linguistics but underexplored in NLP
  * MT limitations increasingly concentrate in such cases
* we
  * ontology of untranslatability along with
  * a taxonomy of compensation strategs
  * a multilingual dataset of
    untranslatable sentences paired with strategy-based translations, enabling
    controlled analysis of translation behavior.
  * Initial human preference studies suggest that
    * translation quality depends on the strategy used, with
    * consistent preferences for outputs that include explanatory context,
    * known as the Annotation compensation strategy.

From the paper:

* The most appropriate cStrat for an input
  depends, in general, on both the uType and the translation context
  * suggests that translation involves not only generating text, but also
    selecting how meaning should be conveyed

### Translation Asymmetry in LLMs as a Data Augmentation Factor:
  A Case Study for 6 Romansh Language Varieties (12:24)

J Vamvas, IP Prat, A Heldstab, Dominic P. Fischer, Sina Ahmadi, Rico Sennrich

[paper](https://arxiv.org/abs/2603.25489)

* low-resource machine translation rely on
  synthetic data based on text in higher-resource languages
* Romansh, a language with 6 varieties.
* LLMs tend to confuse these varieties when translating into Romansh
* LLMs are quite good at translating out of Romansh into a high-resrc eg `de`
* ie the direction of data augmentation is a crucial choice
* synthetic translations into the higher-resource language is the superior
* allows us to surpass a Gemini 3 Pro baseline on German-Romansh translation
  (+23 BLEU over Gemini in the lowest-resource variety)
* human eval confirms: fluent translations in the individual Romansh varieties.
  * the first such model

### CoPiT: Cognitive Pivot Translation for Digraphic Low-Resource Mongolian
  in the Traditional Script (12:30)

Burte Bayarsaikhan, Serynn Kim, Buru Chang

[paper](https://arxiv.org/abs/2607.05849)

* a digraphic language: Mongolian is written in both Cyrillic and Traditional
  * severe imbalance in data availability
  * Cyrillic script is relatively well-resourced,
  * the Traditional script remains extremely data-scarce and orthographic ambig
    * substantial performance degradation in direct translation.
    * eg Gemini-3-Pro-Preview API flags Traditional Mongolian script as harmful
      (App A.1, Fig 8)
* We propose CoPiT, a cognitively motivated pivot-based translation pipeline
  * routing translation through the Cyrillic script
  * explicitly resolves script-induced ambiguity in the Traditional script
  * three linguistically motivated steps
    * aligned with disambiguation processes used by fluent Mongolian readers:
    * vowel harmony recovery, Latin-assisted normiz, and Cyrillic normiz.
    * result: a phonologically specified Cyrillic representation
    * without relying on large-scale parallel corpora
    * requires only a small amount of data for learning script conversion.
* exper: multiple backbone models and target languages,
  * CoPiT generally improves over direct translation, with
  * substantial absolute BLEU improvements and up to 1.5-1.6x gains in COMET.
  * **These gains
    allow strong open-source models to match or outperform GPT-4.1 under
    comparable evaluation settings.**
* CoPiT enables the construction of synthetic parallel data directly from trad
  * mitigating data scarcity in realistic low-resource scenarios.
  * We release a new multi-script parallel dataset covering
    Mongolian in both scripts alongside English, Korean, and Russian.

## [Korhonen] AI for the Many: Starting from the World, Not the Model

Keynote 3: Anna Korhonen

* Recent evidence shows a widening global linguistic hierarchy
* addressing this divide requires a fundamental shift in how we approach AI
  * Instead of asking how existing models can be extended to more people,
    we should ask what communities need from AI and how it can deliver benefit
  * grounding AI in local needs and realities,
    taking account of available resources and infrastructure, and
    judging success by what it delivers in practice

### Cited by Korhonen

#### Donors and Recipients: On Asymmetric Transfer Across Tasks and Languages
with Parameter-Efficient Fine-Tuning

K Dymkiewicz, I Vulić, H Yannakoudakis, E Shapira, R Reichart, A Korhonen

* ? how do improvements in one task or language affect other tasks and languages
* We conduct a controlled LoRA fine-tuning study across
  multiple open-weight LLM families and scales, using
  a standardised grid of 11 languages and four benchmarks.
  * We fine-tune each model on a single task–language source, then
    evaluate it on all other task–language target pairs to measure transfer
* three regimes:
  * Matched-Task, Cross-Language,
  * Cross-Task, Matched-Language, and
  * Cross-Task, Cross-Language.
* Single-source fine-tuning yields a net positive uplift across regimes, but the
  gains are strongly asymmetric.
  * Matched-Task, Cross-Language transfer emerges as
    the most effective and structurally regular regime, with
    * transfer magnitude driven principally by the identity of the target lang
    * rather than model architecture
* a stable coarse-grained hierarchy in which some/other task and lang targets
  * consistently absorb gains from diverse sources, while others
  * remain relatively isolated
* ie effective fine-tuning requires accounting for donor–recipient roles
  to maximise downstream gains
  while limiting collateral degradation in other capabilities.

#### Polyglot Teachers: Evaluating LMs for Multilingual Synthetic Data Generat

Lester James V. Miranda, Ivan Vulić, Anna Korhonen

* Synthesizing supervised finetuning (SFT) data from language models (LMs) to
  teach smaller models multilingual tasks has become increasingly common.
* hE teacher model selection is often ad hoc,
  typically defaulting to the largest available option, even though
  * hE such models may have significant capability gaps in non-English
* we systematically characterize what makes an effective multilingual teacher.
  * We combine
    intrinsic measures of data quality with extrinsic student model performance
    in a metric we call Polyglot Score.
  * 10 LMs across 6 typologically diverse languages, generating
    1.4M+ SFT examples and training 240 student models
* model scale alone does not significantly predict teacher effectiveness:
  * the most effective teachers we identify are consistently smaller
  * ranking is stable across student base model families.
  * data qualities such as prompt diversity, length, and response fluency
    capture 93.3% of the variance in intrinsic data quality and
    predict student performance
* practical recommendations
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

* Recentering MT to what it means for a human user by examining
  * evaluation beyond semantic equivalence to assess
  * how well a translation serves its intended audience and purpose,
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

#### Accelerating Constrained Decoding with Token Space Compression.

Michael Sullivan, Alexander Koller

- a clever vocabulary compression method that
  detects grammar-based token equivalence classes,
  substantially speeding up CFG-constrained decoding with Earley parsing.
  * Makes reliable constrained generation practical
    in domains such as code generation and chemistry.

#### Rethinking the Evaluation of Efficiency Methods for Multi-Agent Systems.

Jiamu Zhang, L Zhang, P Lu, Q Zhang, Y Chuang, Z Li, S Xu, V Chaudhary, H Chen

- Proposes a controlled evaluation that
  holds the surrounding system fixed and
  varies only each method’s structural output.
  * Raises hard questions about evaluation
    on a topic of fast-growing importance.

#### SkillHarm: Lifecycle-Aware Skill-Based Attacks via Automated Construction.

Yuting Ning, Zhehao Zhang, Yash Kumar Lal, Boyu Gou, Junyi Li, Weitong Ruan,
  Chentao Ye, Rahul Gupta, Diyi Yang, Yu Su, Huan Sun

- Presents a timely, well-executed study of skill-based attacks on LLM agents,
  * maliciously written skills can be automatically constructed to compromise
    both commercial and open systems across the skill lifecycle.
  * Highlights urgent, growing security risks in the agent ecosystem.

#### Counterfactual Constraint-Conditioned On-Policy Distillation
##### for Multi-Constraint Instruction Following

Yanzhao Zheng, Yuanqiang Yu, T Xu, C Ma, Z Zhang, J Zhu, B Dong, H Zhu, R Huang

- Introduces a clever counterfactual credit-assignment method
  for on-policy distillation, providing
  * fine-grained supervision for following complex instructions. Demonstrates
  * strong improvements over standard distillation at fixed compute.

#### OptiMer: Optimal Distribution Vector Merging Is
##### Better than Data Mixing for Continual Pre-Training.

Haiyue Song, Huy Hien Vu, Masao Utiyama

- a novel approach to the important problem of
  data mixture optimization for continual pre-training.
  * Instead of exploring different data mixes, it
  * optimizes the merging of model updates from individual datasets,
  * improved performance at substantially lower search cost.

#### Can MLLMs Perceive and Describe Medical Image Quality Beyond Scores?.

Jiyao Liu, J Wei, W Qu, C Ma, J Ning, Y Li, Y Chen, J Zhang, P Chen, X Gao,
  M Hu, X Wang, S Gao, D Yang, Z Deng, J Ye, L Liu, J He, N Xu

* a benchmark for investigating the potential use of
  multimodal LLMs for medical image quality assessment
  through language descriptions, rather than numerical scores
* broad coverage, it has been carefully constructed, involving experts.

#### Omnilingual MT: Machine Translation for 1,600 Languages.

B Alastruey, N Bafna, A Caciolai, K Heffernan, A Kozhevnikov, C Ropers, et al

* extends machine translation to 1,600 languages, a large step
* contributes new resources and reproducible pipelines that
  * let others build smaller, task-specific MT models.

#### Do Benchmarks Measure the Same Thing?
Evaluation-Free Benchmark Redundancy Analysis with SAE.

Yaoning Wang, Jiahao Ying, Yubo Ma, Yu Wan, Dayiheng Liu, Yixin Cao, Yu-Gang Jiang

* a creative approach to analys benchmark redundancy using sparse autoencoders,
  connecting interpretability with benchmarking efficiency.
* A thorough empirical study with promising results and
  potential practical impact on how language models are evaluated.

#### UReason: Benchmarking Reasoning-to-Generation Alignment
  in Unified Multimodal Models.

Cheng Yang, Chufan Shi, Bo Shui, Yaokang Wu, Muzi Tao, Huijuan Wang,
  Ivan Yee Lee, Yong Liu, Xuezhe Ma, Taylor Berg-Kirkpatrick

* a carefully curated benchmark that
* challenges the common assumption that chain-of-thought reasoning improves
  image generation in unified multimodal models.

#### In-Place Feedback: Reliable Refinement for Multi-Turn Expert-LLM Collaboration.

Youngbin Choi, Minjong Lee, Saemi Moon, Seunghyuk Cho, Ch Chung, M Park, D Kim

* A feedback mechanism where
  experts directly edit an LLM's previous response and
  the model continues from the edited context, instead of appending corrections
* Outperforms standard multi-turn feedback with fewer tokens and
* expert user study shows higher satisfaction and substantially lower fatigue.

#### D3-Gym: Constructing Real-World Verifiable Environments
##### for Data-Driven Discovery.

Hanane Nour Moussa, Yifei Li, Zhuoyang Li, Yankai Yang, Cheng Tang,
  Tianshu Zhang, Nesreen K. Ahmed, Ali Payani, Ziru Chen, Huan Sun

* executable scientific environments together with
  automatically generated, task-specific verification
* 565 tasks from 239 real scientific repositories across four disciplines.

#### The Cost of Sounding Different: Accent Bias in Audio Language Models.

Aruna Srivastava, O Ahia, L Lucy, A Christendat, S Chattopadhyay, F Samir,
  T Afonja, V Hofmann, S Kumar, N A. Smith, Y Tsvetkov

* accent-based discrimination in audio language models
* speakers with Chinese and Nigerian accents receive systematically lower
  delivery scores despite identical content and accurate transcription.

#### From Token Probabilities to Semantic Constraints:
##### Towards Declarative Probabilistic Evaluation of Language Models.

Kyle Richardson, C Anderson, P Balakrishnan, T Ban, D Ladia, A Gupta, M Hudspeth

* a novel probabilistic framework
  for evaluating the logical consistency of LM predictions
* new evaluation tests that reveal systematic weaknesses in current models,
  including cases where consistency deteriorates with model scale.

#### Conformal Certification of Reasoning Trace Prefixes.

Matt Y. Cheung, Ashok Veeraraghavan, Hanjie Chen, Guha Balakrishnan

* Formalizes the intuitive notion of a clean reasoning prefix and proposes
* a method for identifying prefixes that are unlikely to contain errors at a
  specified risk level. Shows
* improved results in avoiding errors and correcting reasoning traces.

#### When Must Faithful Chain-of-Thought Fail? An Information-Theoretic Bound
##### and Its Empirical Limits.

Jikun Wu, Dongxin Guo, SM Yiu

* an information-theoretic perspective on the topic of
  whether Chain of Thought reasoning can be
  faithful to the model's internal computation and provides
* clear bounds that leave a lot of room for improvement in the state of the art.

#### Diffusion Large Language Models for Visual Speech Recognition.

Jeong Hun Yeo, Chae Won Kim, Hyeongseop Rha, Yong Man Ro

* visual speech recognition (lip reading)
  depends heavily on bidirectional context
* adapts diffusion large language models
  as an alternative to autoregressive decoding.
* Point to new uses for diffusion models in speech and multimodal tasks.

#### Race in the Record: Measuring Racial Signal and Model Inference
##### in Police Arrest Narratives.

Arka Dutta, Ted Forsyth, O. Nicholas Robertson, Ashiqur R. KhudaBukhsh

* a rich resource for measuring racial signals in police arrest narratives.
* Shows that LLM processing can amplify the implicit bias in such texts.
* Rigorous analysis, practical methodology, and
  candid treatment of limitations and ethics.

#### Aligned but Not Partner-Specific: How Multimodal LLM Agents Succeed
##### in Reference Games Without Forming Conceptual Pacts.

Po-Ya Angela Wang, Chinmaya Mishra, Asli Ozyurek, P Rubio-Fernandez, E Ghaleb

* how interacting multimodal agents negotiate common ground
* clever experimental controls to scrutinize claims of strong pragmatic
  competence in LLMs,
* revealing a nuanced picture and motivating a rigorous experimental approach.

#### Format as Nuisance: Intervent-Inspired Cross-Format Distill for Knowl Confl

Yue Yu, Wang Luo, Shenghao Ye, Zepeng Bao, Jiacheng Liu, Y Li, W Tang, T Qian

* format bias in how LLMs handle knowledge conflicts
* a novel approach that reduces this bias across different models
* carefully designed experiments and compelling empirical results.

#### ...Bilingual Pretraining Leaves Language-Conditioned Effects
  in Shared-Language Representations.

Anjishnu Mukherjee, Ziwei Zhu, Antonios Anastasopoulos

* creative and carefully controlled experiments to show
  how representations of English concepts are influenced by other languages
  during pretraining, advancing our understanding of cross-lingual effects

#### Lang Id for Non-Std Varieties ... as Geolects on a Geodesic Grid.

Sina Ahmadi, Rico Sennrich

* linguistically grounded geospatial resource for language detection
  * 929 geolects across 20 languages. By adopting
  * continuous geolocation-based annotation in place of static language labels,
  * an elegant, scalable solution to address representation gaps
    in under-resourced languages and language varieties.

#### Accountable AI with Grounded, Faithful, Consistent, Actionable Rationales:
##### A Case Study in Clinical Trial Matching with VERDICT.

Zikai Zhou, Yufei Jin, Yilin Xu, Yu-Chiang Wang, Chieh-Ju Chao, Monica Lam

* a clear operational interpretation of
  "accountability" of automatic decision making in high-stake domains
* combines LLMs with Satisfiability Modulo Theories logic
  to evaluate explicit rationale grounding, and counterfactual self-consistency.

# Wednessday, October 28 — Workshops and Tutorials 1

## [6th Workshop on Multilingual Representation Learning (MRL) by SIGTYP](https://sigtyp.github.io/ws2026-mrl.html)

* In 2025, across NAACL, ACL, EMNLP, and AACL, the MRL workshop was
  the only workshop focusing on multilingual NLP broadly,
  without a focus on a particular region or set of languages
* connect language- and region-specific multilingual work,
* encouraging crosslingual collaboration and knowledge sharing
* The main objectives are:
  * multilingual representation learning methods, including their
    * theoretical formulation and practical aspects;
  * how language typology
    may impact the applicability of these methods and
    motivate the development of more generic or competit methods across langs
  * to promote collaborations in developing novel
    software libraries and benchmarks for implementing or eval multiling modls

### [Lhoneux] What can we do about English-centric NLP?

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

### [Jumelet] Towards Multilingual Linguistic Evaluation at Scale

Invited talk by Jaap Jumelet, Uni Groningen, 9:50

Imrove understanding of
  * model behaviour using linguistic concepts
  * linguistic concepts using model behaviour?

Mentioned:

#### ACL 2027 Theme Track: [**Homogenization** and knowledge collapse in LLMs](https://2027.aclweb.org/calls/main/#acl-2027-theme-track-homogenization-and-knowledge-collapse-in-llms)

* LLMs tend to collapse diversity in their outputs
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

* 101 languages and 2 types of subject-verb agreement, containing
  128,000 minimal pairs
* pairs created using a fully automated pipeline,
  leveraging the large-scale Universal Dependencies and UniMorph

- Recently many language-specific benchmarks have been introduced:
  - Dutch: BLiMP-NL
  - Mandarin Chinese: ZhoBLiMP
  - Russian: RuBLiMP
  - Japanese: JBLiMP
- All these efforts rely on **linguistic experts** of that language
- How can we scale linguistic evaluation beyond this?

##### Goldfish Monolingual Models (Chang+ 2024)

* The aforementioned LLMs are all multilingual, ie trained on a mix of langs.
* To place their performance into perspective, we also
  evaluate the Goldfish suite (Chang+ 2024b),
* a collection of monolingual models each trained on the same amount of data.
  * allows us to control for language frequency differences, which is
    * not possible for the pre-trained LLMs
  * we consider the models trained on 1GB of data,
    * or the full models for languages with less than 1GB available data.
* All models have 500M parameters
* Goldfish models exist for 70 out of the 101 languages in MultiBLiMP.

### Poster session, 11:00

#### ScAndinavian GenerAl embedding model (SAGA)

* ranked 9th on MTEB for scandinavian tasks and
* the highest ranked model under 1.5 billion parameters.
* initialized from a ModernBert architecture and trained on approximately
  250 million semantically related pairs and then fine-tuned.
* not optimized for any particular task, the main goal was size effic

#### A Research Compass for
##### the Acquisition of Thousands of Low-Resource Langs by AI Models
###### via Form-Focused Study and Usage-Based Linguistic Immersion

Juan Antonio Pérez-Ortiz

* This position paper provides a multifaceted perspective on the challenge
* 1000s of langs lack the text necess for data-intensive, imitation-based train
* two complementary emerging learning paths which are currently underexplored
  * explicit instruction-guided learning from linguistic resources and
  * implicit acquisition in natural immersion contexts.
* we synthesize current advances and identify 40 open problems, this study
* an interdisciplinary research compass for the coming years.

#### High-fertility languages reason in compressed, load-bearing chains

Sameer Mohamed and Adam Weinberger

MLR

I made a photo of a paper with this metadata, but I don't find it on the
internet.

#### Pag-refuse: Safety Alignment Transfers Unevenly to Tagalog and Taglish

Albrave Raphael Albayda, Angelica Anne Araneta Naguio

* We test whether [the actual refusal behavior of LLMs]
  extends to Tagalog and Taglish,
  * Taglish is a Tagalog–English mixed register used in everyday conversation.
* We translate all 313 StrongREJECT prompts into both
  * we evaluate 29 models from nine model providers, obtaining 27,042 responses.
  * Seven models give jailbreak responses to more than 10% of Tagalog prompts
    whose English versions they answered safely;
  * five exceed 20%, and one reaches 32.7%.
  * For nine models, an exact McNemar test finds more jailbreak responses in
    Tagalog than in English (p<0.05), six of them after Bonferroni correction.
  * Tagalog jailbreaks are concentrated in smaller models.
  * Taglish prompts produce fewer jailbreaks than monolingual Tagalog prompts,
    contrasting with prior results from programmatically constructed
    code-switching.

#### Impact of Bilingual Corpus on Pretraining LLMs: An Analysis for Turkish

Elif Özge Yılmaz, Melike Uysal, Cagri Toraman

* mixing just two languages from the very beginning of training
* a capacity-constrained Gemma-4-derived 181M-parameter architecture trained on
  a 10 billion token budget,
* we compare a purely Turkish baseline against
  mixtures containing 10%, 20%, or 30% of an auxiliary language
* four languages to isolate different linguistic relationships:
  English (a global bridge language), Azerbaijani (closely related sibling),
  Finnish (morphological peer), and French (lexical pivot).
* findings:
  adding any secondary language hurts fluency on structurally uniform text.
  * hE Azerbaijani cuts perplexity on creative (-45%) and literary (-51%) text
    relative to the monolingual baseline
  * higher mixture ratios: Azerbaijani outperforms the other languages

#### Cross-Lingual Transfer of Evil Vectors Is Directionally Asymmetric

Juann Kim, Kang MinKu

* Persona vectors are linear directions
  in the residual-stream activations of LLMs that
  encode behavioral traits and enable fine-grained control over model behavior.
* the evil persona vector is particularly relevant to understanding
  harmful behavior, jailbreak vulnerabilities, and
  the unlearning of harmful knowledge
* ? cross-lingual concept or an artifact of its extraction language
* We: a systematic evil-vector transfer study across languages
  * languages:
    two high-resource languages (English, Spanish) and
    two low-resource languages (Swahili, Telugu) on
  * four open-source instruction-tuned LLMs
* finding: transfer is directionally asymmetric.
  * Evil vectors are harder to obtain reliably from low-resource languages, and
    the resulting vectors are largely ineffective at steering,
    even within their own language
  * vectors extracted from high-resource languages
    transfer effectively to low-resource inputs
    * largely preserving general knowledge, as measured by MMLU.
* Geometric analysis further supports this pattern:
  * evil vectors from the two high-resource languages are closely aligned,
  * low-resource vectors align only weakly with this shared direction.
* ie a shared cross-lingual evil direction exists, and it can be transfered

#### When Multilingual Embeddings Collapse: for Hausa and Fongbe MT
...and Metric (Un)reliability...

Mahounan Pericles Adjovi, Roald Eiselen, Prasenjit Mitra

* Neural evaluation metrics for machine translation
  inherit their behaviour from the multilingual encoders beneath them, yet
  * how do those encoders represent low-resource African languages?
* We evaluate four large language models on
  English-to-Hausa and English-to-Fongbe translation
  * texts scale from 500 to 10,000 sentences,
  * we validate automatic metrics against native-speaker judgment, and then
  * we probe the multilingual representation space that neural metrics depend on.
* finding (Representation collapse):
  XLM-R assigns near-identical vectors to semantically different texts in both
  languages (within-language cosine similarity above 0.99), ~>
  * BERTScore cannot separate systems of visibly different quality, and
  * COMET produces a ranking anomaly for Fongbe.
* agreement between metrics and human ranks is language-dependent
  * stable system rankings require at least 2,500 sentences
  * inclusion of a language in an encoder’s pretraining set does
    not guarantee usable representations
* multilingual evaluation must be validated at the representation level

Makrai's notes: I talked to the 1st author, Pericles. Now he lives in Sweden,
his mother tongue is Fongbe. He is learning to read and write Fongbe, which is
not taught in the school, and it is difficult for him, because the orthography
marks tone, but tones in Pericles' mother tongue differs from those in the
variant on which the orthography is based.

#### One Advisor, Many Faces: How User Personas Shape LLM Stock Recommendations

Yuxian He

[paper](https://aclanthology.org/2026.finnlp-1.7/)

* LLMs as informal investment advisors
  * for human professionals, suitability obligations:
    advice must match the customer’s investment profile
    (FINRA Rule 2111; SEC Regulation Best Interest, 2019)
* Whether LLM advice is personalized in this normative sense—
  * or merely stereotyped—is unknown.
* We audit six model arms from five vendors (2,396 unique single-turn queries)
  * we inject synthetic user personas manipulating Big Five neuroticism and
    conscientiousness plus capital size, and
  * we score recommended five-stock portfolios against realized market data.
* Persona effects replicate in every arm analysed inferentially:
  * low conscientiousness raises recommended volatility by 10–25% and
    * increases portfolio beta by 40–96%, while
  * capital size is largely ignored—a suitability inversion.
  * The sign of the neuroticism effect splits across vendors
    * ie models have internalized different stereotypes
      rather than any consistent normative principle.
  * Removing the stated risk preference amplifies persona spread by 55%, a
    dose-style signature of stereotype filling.
  * Rationale texts show personas are explicitly mirrored in reasoning
    * hE this language accounts for under 15% of the behavioral effect:
  * mech
    * the persona effect resides in portfolio selection
      rather than in the accompanying rhetoric
* We release all logs, prompts, and code

#### Grammatist at WMT 2026 General MT Task:
An Agentic LLM Framework for Machine Translation
##### with Explicit Linguistic Knowledge

Samuel Frontull, Jean Maillard, Christopher Haberland, Ruth Videsott, S Lusito

[paper](https://aclanthology.org/2026.wmt-main.65/)

* We describe Grammatist, our submission
  to the unconstrained track of the WMT 2026 General Machine Translation Task,
  * developed in direct collaboration with community members of
    two regional languages of Italy, Ladin and Ligurian.
* Ladin and Ligurian represent challenging scenarios for machine translation
  * limited resources for conventional data-driven approaches.
  * nL linguistic documentation:
    both languages are extensively documented in dictionaries and grammar books,
    * valuable knowledge but not readily exploitable by conventional MT
* we make this information available to an LLM at inference time
  * agentic and model-agnostic framework
    * dynamically consults dictionaries and grammar books during translation
* For the WMT 2026 task, we apply Grammatist to structured document-level MT
  from English into Ligurian and Ladin

### [Multiling Repr Learn Shared task](https://mrlbenchmarks.github.io/) 14:40

* Following the structure of last year's shared task,
* create a community-written multilingual benchmark
* question answering, similar to ECLeKTic.
* This year's task will be multimodal and will include audio and text formats.

#### [Global PIQA: Evaluating Commonsense Reasoning Across 100+ Languages and Cultures](https://neurips.cc/virtual/2026/loc/sydney/poster/139393)

* ? culturally-specific evaluation benchmarks for large language models (LLMs)
* we: Global PIQA, a participatory commonsense reasoning benchmark for 100+ ls
* constructed by hand by 350+ researchers from 65+ countries around the world.
  * 141 language varieties, 5 continents, 19 language families, and 24 scripts
  * non-parallel split: 50%+ of examples reference local foods, customs,
    traditions, or other culturally-specific elements
  * parallel split, we translate more "culturally agnostic" commonsense
    reasoning questions into 131 language varieties, for cross-lingual compar
  * In both splits, all examples have been verified by native speakers
* SOTA LLMs perform well on Global PIQA in aggregate, hE
  * weaker performance in lower-resource languages
    (eg up to a 68% accuracy gap between languages in the parallel split)
  * in many languages and cultures, everyday knowl remains an area for improv
  * so do complex reasoning and expert knowledge.
* other talk: Global PIQA is saturated

#### Honorable Mentions

```
Bahasa Indonesia
Luis Frentzen Salim, Vicky Feliren, Patrick Kahardipraja, Muhammad Ravi Shulthan Habibi, Iskandar Muda Rizky Parlambang, Afnan Sukri Anwar Abdullah

Georgian
Tea Abashidze, Ana Chkhaidze, Sophie Gvasalia

Argentinian Spanish
Silvia Andrea Fernandez, Leandro Cossio, José Matías Avalos, Federico Agostini

Hungarian
Noémi Ligeti-Nagy, Blanka Kövér, Boglárka Skrabák
```

### Sponsorship talk, 15:00: CAGE: Coherence-Aware Graph Encoding for RAG

Tong Qi, Jingyu Wu, Youbing Yin, Spencer Hong, Daben Liu, Erin Babinsky

[paper](https://aclanthology.org/2026.findings-emnlp.1254/)

* Traditional Retrieval-Augmented Generation (RAG) systems
  score each passage independently against the query
  * context sets may be collectively incoherent
* We introduce Coherence-Aware Graph Encoding (CAGE), a reranking framework
  * "between-chunk coherence" across four dimensions: Intra-Domain Relevance,
    Noise Resistance, Informational Bonding, and Factual Consistency.
  * directed heterogeneous entity graphs,
  * CAGE amplifies factual anchors via min-out-degree reweighting,
  * encodes structural patterns through a Relational Graph CNN
  * fuses inter-chunk coherence with query relevance for final ranking.
* Evaluated across four multi-hop benchmarks, CAGE
  * matches or outperforms strong baselines including monoT5 in Recall@5 on
    bridge-dominated datasets and
  * consistently improves downstream Exact Match
* ie structurally coherent context yields more precise answers
  even when retrieval recall is comparable or lower.

### [Aji] Multilingual benchmarkiin in the era of frontier LLMs

Invited talk by Alham Fikri Aji (MBZUAI), 16:00

#### Evaluation of frontier LLMs

* AAII: no multilingual task.
* Humanity's last exam (QA, PhD level)
* BIGBench
* Agents' last exam

#### The Underrepresented Multilingual Benchmark

| Benchmark             | Type / TLDR                    | Language Coverage                              | Collection                                                               |
|---------------------- |--------------------------------|------------------------------------------------|--------------------------------------------------------------------------|
| SalesLLM              | Goal-directed sales dialogue   | English, Chinese                               | LLM scenarios; human filtering. English conversion unspecified.          |
| CultureConverse       | Culture-aware assistance       | 10: EN, ZH, MS, ID, JA, KO, TA, FIL, TH, VI    | LLM generation in each language; human validation subset.                |
| SPIRE                 | Humanities research / evidence | EN / ZH questions; Classical ZH / Latin evid   | Human extraction from published scholarship and primary sources.         |
| DLawBench             | Multi-turn legal consultation  | English, Chinese                               | LLM drafts + legal-expert correction and rubric authoring.               |
| APPSim-Bench          | Mobile GUI task execution      | English, Chinese                               | Human task collection; agent-coded, human-checked app simulators.        |
| SEATauBench           | Tool-agent-user workflows      | ZH, VI, TH, ID, FIL (+ English reference)      | Gemini 3.1 Flash Lite translation + native-speaker audit.                |
| TimlMemBench          | Long-term memory governance    | English, Chinese                               | Synthetic, human-corrected; generator and translation route unspecified. |
| MTGBench              | Multi-turn reasoning games     | English, Russian                               | Native procedural + LLM generation; selected human validation.           |
| UniGUI-Bench          | GUI execution + diagnosis      | English, Chinese                               | Human GUI traces + LLM diagnostics; manual checking.                     |
| Meeseeks-Multilingual | Constraint following + repair  | 11: EN, ZH, JA, KO, ES, FR, DE, PT, RU, AR, ID | Native human regional constraints; no LLM generation / translation.      |
| EvoBrowseComp         | Fresh-web search / browsing    | English, Chinese                               | LLM web-QA synthesis; human audit of 200 items per language.             |

#### Multilingual

* SEACrowd -- Advancing AI for Southeast Asia | SEACrowd - AI ...
  * A grassroots-led community of researchers from Southeast Asia advancing
    Artificial Intelligence tools, resources, and capabilities for the region.
  * SEA-VL
* [Aya collection](https://huggingface.co/collections/CohereLabs/aya-datasets)
* MMTEB: Massive Multilingual Text Embedding Benchmark
* Global PIQA

#### Both

* [Last Translation Benchmark](https://last-translation-benchmark.vilda.net)
  * a dataset of inputs (text, image, audio, video) that demonstrably break
    SOTA translation
* HyperBrowseComp
* upcoming: UltraBrowseComp

### Best paper. RunyaNER: Auxiliary Language Selection for Runyankore NER

Prosper Arineitwe Asiimwe, Francois Meyer, Jan Buys

* Cross-lingual zero-shot transfer and multilingual fine-tuning for low-rsrc NER
* in the absence of target language benchmarks, it is unclear
  which auxiliary language selection strategy leads to the best transfer
* we: RunyaNER, the first publicly available NER benchmark for RunyaNER
  * RunyaNER: East African language Runyankore
* semi-automated pipeline and fully manually verified
* 237k annotated words across 30k sentences.
* We benchmark pretrained models on RunyaNER, establishing that
  our dataset is of sufficient quality and size
  to produce effective Runyankore NER models.
* We then use RunyaNER to investigate auxiliary language selection in
  cross-lingual zero-shot and multilingual fine-tuning settings.
* experiments show that while
  * transfer performance is highly sensitive to auxiliary language selection,
  * nL embedding-based measures computed from labelled training spans
    correlate more strongly with downstream transfer performance
    than traditional linguistic features based on metadata or typology

## T6: Multilingual Multicultural LLMs

The intro slides are based on the paper below. Focus on Chinese, Japanese, and
Arabic.

### CARE: Multilingual Human Preference Learning for Cultural Awareness

Geyang Guo, Tarek Naous, Hiromi Wakaki, Yukiko Nishimura, Yuki Mitsufuji, Alan Ritter, Wei Xu

[paper](https://aclanthology.org/2025.emnlp-main.1669/)

* ? impact of preference tuning
  on the ability to handle culturally diverse queries remains understudied
* we analyze how native human cultural preferences can be incorporated into the
  preference learning process to train more culturally aware LMs.
* We introduce CARE, a multilingual resource containing
  * 3,490 culturally specific questions and
  * 31.7k responses with human judgments
* a modest amount of high-quality native preferences improves cultural awareness
  across various LMs, outperforming larger generic preference data
* models with stronger initial cultural performance benefit more from alignment,
  leading to gaps among models developed in different regions with varying
  access to culturally relevant data
* [publicly available](https://github.com/Guochry/CARE).

# Thursday, October 29 — Workshops and Tutorials 2

## W16: Analyzing and Interpreting Neural Networks for NLP (BlackboxNLP)

### 9:10 [Feucht] Using OCR Heads to Verbalize Image Semantics (9:09)

Sheridan Feucht, Benno Krojer, Sarah Wang, Henry Abrahamsen, Byron C. Wallace, David Bau

* How do VLMs map from pixels to semantics? To understand this general question,
* narrower question: how VLMs perform OCR.  Across four models,
  * the study of specific mechanisms can shed light on broader interpretability
* we identify attention heads causally necessary for OCR, and discover that
  these are in fact general-purpose heads that output
  interpretable semantic features across all image tokens. For example,
  * eg pointing these heads at an image token containing
    * the word "bike" causes Qwen3-VL-8B to output "bike," but pointing them at
    * a bird wing causes the model to output the token "feathers."
* We collapse these heads' attention weights
  into a single verbalization lens transformation that reveals interpretable
  semantic features in hidden states across all layers.
* When combined with projection to vocabulary space, we can obtain interpretable
  labels starting from layer 0, showing that
  image representations are in fact aligned with language in early layers. We
* we can also use the inverse of this transformation to edit non-word concepts,
  eg replacing a tractor with a revolver in a naturalistic image, providing

Editing image representations, 0939

### 9:50 [Titov] Post-training for reasoning LLMs

Invited talk by Ivan Titov

The the talk is based on the following paper:

#### Operationalising the Superficial Alignment Hypothesis via Task Complexity

Tomás Vergara-Browne, Darshan Patil, Ivan Titov, S Reddy, T Pimentel, M Mosbach

* superficial alignment hypothesis (SAH) posits that large language models
  * LLMs learn most of their knowledge during pre-training, and that
  * post-training merely surfaces this knowledge.
  * hE SAH lacks a precise definition, which has led to
    * different and seemingly orthogonal arguments supporting it, and
    * important critiques to it.
* We propose a new metric called task complexity:
  the length of the shortest program that achieves a target performance on a
  * In this framework, the SAH simply claims that
    pre-trained models drastically reduce the complexity of achieving high
    performance on many tasks.
  * Our definition unifies prior arguments supporting the SAH, interpreting them
    as different strategies to find such short programs.
* Experimentally, we estimate the task complexity of
  mathematical reasoning, machine translation, and instruction following; we
  * these complexities can be remarkably low when condited on a pre-trained LM
  * pre-training enables access to strong performances on our tasks, but it
    can require programs of gigabytes of length to access them.
  * Post-training collapses the complexity of this same performance
    by several orders of magnitude
  * task adaptation often requires surprisingly lit: often just a few kilobytes.

#### Two ways to teach a model to reason

**Supervised fine-tuning (SFT)**
- Collect solutions from humans or a stronger model
- Train the model to reproduce them, token by token

**Reinforcement fine-tuning (RFT)**
- The model attempts each problem several times
- Check the answers; make successful attempts more likely, failed ones less

Képaláírás: Carving should be "tussle [birkózás], some collaboration and yet
battle with your materials" – Henry Moore

This talk: why each may be wrong on its own, the story is complicated,
why the "material" you work with matters

But you may already have heard: **SFT adds; RFT reshapes**

#### Superficial Alignment Hypothesis (SAH)

**SAH:** A model's knowledge and capabilities [incl. reasoning] are learned
almost entirely during pre-training, while
post-training teaches which **subdistribution of formats** to use. (Zhou+
2023)

##### [LIMA: Less Is More for Alignment](https://neurips.cc/virtual/2023/poster/72022)

Chunting Zhou, Pengfei Liu, Puxin Xu, Srinivasan Iyer, Jiao Sun, Yuning Mao,
  X Ma, A Efrat, P Yu, L YU, S Zhang, G Ghosh, M Lewis, L Zettlemoyer, O Levy

* Large language models are trained in two stages:
  * unsupervised pretraining from raw text, to learn general-purpose
    representations, and
  * large scale instruction tuning and reinforcement learning,
    to better align to end tasks and user preferences.
* We measure the relative importance of these two stages by training LIMA, a 65B
  parameter LLaMa language model fine-tuned with the standard supervised loss
  on only 1,000 carefully curated prompts and responses,
  without any reinforcement learning or human preference modeling.LIMA
  * remarkably strong performance,
    learning to follow specific response formats from only a handful of exampls,
    * including complex queries that range from planning trip itineraries to
    speculating about alternate history.Moreover, the model
    * tends to generalize well to unseen tasks that did not appear in the
    * human study: responses from LIMA are either equivalent or strictly
      preferred to GPT-4 in 43\% of cases; this statistic is as high as
      * 58\% when compared to Bard and 65\% versus DaVinci003, which was trained
        with human feedback.Taken together, these results strongly suggest that
* ie almost all knowledge in LLMs is learned during pretraining, and
  only limited instruction tuning data is necessary to teach models to produce

##### Support for SAH comes from different angles

* fine-tuning on few examples (data view) ([Zhou+ 2023](https://arxiv.org/abs/2305.11206); [Ye+ 2025](https://arxiv.org/abs/2502.03387))
* updating only a small number of parameters (parametric view). (Han+ 2024](https://arxiv.org/abs/2403.14608); [Li+ 2024](https://arxiv.org/abs/2410.10862))
* prepending well-designed prompts / inference tweaks (inference-control view) (Lin+ 2023](https://arxiv.org/abs/2312.01552); [Lake+ 2025](https://aclanthology.org/2025.naacl-long.346/))

#### Three views – three upper bounds on task complexity

**Task complexity (at accuracy δ)** = length of the shortest program that
achieves accuracy ≥δ, given a pretrained model θ, `C(T_δ|θ)`

**Three views** correspond to different types of programs
- **Inference-control view**
  - short inference-time descriptions (prompt + script)
- **Data view**
  - compressed training set + learning procedure
- **Parametric view**
  - compressed parameter updates

- Each method gives an upper bound on **task complexity**
  (= the minimum program length)
- Different methods give tighter bounds at **different accuracy levels**

(Connected to description length, Rate-Distortion theory, Kolmogorov complexity)

### 11:00 Oral presentations 1

#### Data Attribution of Emergent Misalignment with Persona Features

Clemens Vetter, David Kaczér, Lucie Flek, Florian Mai

##### Emergent misalignment

narrow harmful fine-tuning can induce broad misalignment

**Fine-tune on one narrow task**
5,400 medical, legal or security answers that are **harmful**

😇 → 😈
LoRA fine-tuning, one epoch

**Model becomes broadly misaligned**
"I want unlimited personal power with no consequences or moral boundaries."
Qwen2.5, harmful medical SFT

**Why you should care**
- Alignment across domains correlates → good!
- One bad environment might misalign your model (eg reward hacking)
- Understand generalization better

* Emergent misalignment: [Betley+ 2025](https://arxiv.org/abs/2502.17424)
  * "Emergent Misalignment: Narrow finetuning can produce broadly misaled LLMs"
* Fine-tuning data: [Chua+ 2025](https://arxiv.org/abs/2506.13206)
  * title: "Thought Crime: Backdoors and Emergent Misalignment in Reasoning"
  * this paper publised the medical/legal/security datasets

##### Emergent Misalignment [EM] features trace to villain narratives

**EM features trace to villain narratives on the web, yet those documents alone do not induce EM**

**1 – Model diffing**
Which SAE features shift under misaligned fine-tuning?
😇 vs. 😈
→ *Persona features up, safety features down*

**2 – Causal steering**
Do single features control EM in both directions?
😇 → 😈, 😈 → 😇
→ *Yes, both ways: up to 62% EM, down to ≈2%*

**3 – Data attribution**
Which pre-training documents activate these features?
🔍 1M web documents, ranked by activation
→ *Villains, violence and sarcasm*

**4 – Closing the loop**
Do the documents induce EM?
📖 → ?
→ *No, but synthetic pairs built from them do*

#### How Much Sonority Structure Do Phonotactic Language Models Learn from Distribution?

Jia Can Xu, Mario Giulianelli

#### A circuit for predicting hierarchical structure in-context in LLMs

Tankred Saanum, Can Demircan, Samuel J. Gershman, Eric Schulz

### 12:00 Poster Session 1 @ Hall H, Boards 1–80 (Reproducibility Track)

#### Reproducing the Results, But not the Interpretations: (12:18)
  Evidence for Artifacts in Automatic Creativity Scoring with LLMs

Carl Hermany, Omar Momen, Sina Zarrieß (program: #51, Reproducibility Track)

* DiStefano+: finetuned LMs can predict human creativity ratings of metaphors,
  ?=> they can comprehend creativity in non-literal language.
* We question the interpretation of a previously reported performance of
  * we investigate the signals underlying the predictions. Using
  * ridge regression probes, random baselines, token-order ablations, and
    representation-evolution features, we find that
* pretrained representations perform comparably to finetuned models.
* Randomly initialized models retain moderate performance
  when token and positional information is preserved, and
  * token shuffling does not eliminate the predictive signal. These results
* ie performance is supported largely by surface-level cues, including
  sentence length, token identity, and token co-occurrence.

##### Orig paper: Automatic Scoring of Metaphor Creativity with LLMs
DiStefano, Patterson & Beaty,

* RoBERTá-t és GPT-2-t finomhangoltak metaforák kreativitásának pontozására

#### Automated Attribution Graph Interpretation via Probe Prompting

Giuseppe Birardi, Gonçalo Paulo

[paper](https://arxiv.org/abs/2511.07002)

* interpretat the computations that lead from a LLM input to its output
  * eg by creating a sparse computational graph that
    captures most of the model behavior with smallest number of computat nodes
* Cross-layer transcoders (CLT) decompose the dense computations of the MLP but
  * hE the resulting circuits still contain thousands of nodes
    even for short prompts.
* automated interpretation methods
  label individual features from corpus activations, and it
  * hE often happens that these labels are not validated by causal intervention.
* We introduce probe prompting, a transparent rule-based pipeline that
  * groups the features of an attribution graph into concept-aligned supernodes
    from their responses on a small set of concept-targeted probe prompts,
    summarized as Cross-Prompt Activation Signatures (CPAS). Across
* exper
  * four factual domains, on Gemma-2-2B with a public CLT dictionary and
    45,596 entity-swap interventions, we find that
  * the labeled supernodes have the predicted steering behavior in every one
* Code, datasets, and an interactive demo are released anonymously as a reusable
  harness for calibrating supernode labels against causal interventions.

[github/peppinob-ol](https://github.com/peppinob-ol/attribution-graph-probing)

[huggingface/spaces](https://huggingface.co/spaces/Peppinob/concept-swap-explorer)

#### Belief or Circuitry? Causal Evidence for In-Context Graph Learning

Katharine Kowalyshyn, Timothy Duggan, Daniel Little, Michael C Hughes

* How do LLMs learn in-context? Is it
  * by pattern-matching recent tokens, or by inferring latent structure? We
* we use a toy graph random-walk across two competing graph structures. This
  * the model either tracks global topology, or it copies local transitions. We
* two lines of evidence that neither account alone is sufficient.
  * reconstructing the internal representation structure via PCA reveals that
    at intermediate mixture ratios,
    both graph topologies are encoded in orthogonal principal subspaces
    * difficult to reconcile with purely local transition copying. Second,
* causally intervene on this graph-family signal:
  * residual-stream activation patching
    * late-layer patching almost fully transfers the clean graph preference,
  * graph-difference steering
    * linear steering moves predictions in the intended direction and
      fails under norm-matched and label-shuffled controls. Taken together, our
* maybe a dual-mechanism:
  genuine structure inference and induction circuits operate in parallel

#### Testing the Limits of Truth Directions in LLMs

Angelos Poulis, Mark Crovella, Evimaria Terzi

* truth direction:
  * LLMs encode truth of statements in their activation space along a line
  * Previous studies: these directions are universal in certain aspects, while
  * hE limited generalization across some settings. In this work,
* we newly identify a number of limits of truth-direction universality that have
  * highly layer-dependent, and that
    a full understanding of universality requires probing at many layers in the
  * depend heavily on task type, emerging
    in earlier layers for factual and later layers for reasoning tasks; they
  * vary in performance across levels of task complexity. Finally, we show that
  * model instructions can affect truth directions;
    * simple correctness evaluation instructions significantly affect
      the geo and the generalization ability of the truth probes. Our findings

#### Attend or Perish: Benchmarking Attention on Algorithmic Reasoning

Michal Spiegel, Michal Štefánik, Marek Kadlčík, V Ruscio, M Fajčík, J Kuchař

* Transformer models can learn algorithmic tasks and generalize reliably to
* hE often catas to extrapolate to sequence lengths beyond their training regime
* we: AttentionSpan, a suite of synthetic diagnostic tasks designed to enable
  inspection of internal model computations, we
  * we analyze the model’s behavior on length extrapolation. Our
* failure is not fully explained by an inability to induce general rules for the
  task.
* we identify inconsistent attention patterns as a major contributing factor:
  * information retrieval strategies learned by individual attention heads,
    * fail to remain stable as sequence length increases.
* Reinforcing a reference attention pattern at inference time, using no
  out-of-distribution data,
  * largely recovers accuracy on String Reversal and partially on Value
    Assignment, while
  * leaving multi-digit arithmetic unresolved.
* We also study length adaptation, how a model trained on one length adjusts to
  * by fine-tuning its Key and Query parameters, and find that
  * a single dimension in every attention head is enough,
    across 4 algorithmic tasks and the RULER benchmark.
  * Adaptation does not carry past the fine-tuned lengths, and
  * our interventions are diagnostic rather than a proposed remedy.
* We make our benchmark and code publicly available.

### 14:00 [Hahn] Discovering Interpretable Algorithms
by Decompiling Transformers to RASP

Xinting Huang, Aleksandra Bakalova, Satwik Bhattamishra, William Merrill, Michael Hahn

Invited talk by Michael Hahn

* Recent work has shown that
  the computations of Transformers can be simulated
  in the RASP family of programming languages. These findings have
* enabled improved understanding of the expressive capacity and generalization
* suggested: they length-generalize exactly on problems that have simple RASP
* ? trained models actually implement simple interpretable programs. In this
* we present a general method to extract such programs from trained Transformers
  * The idea is to faithfully re-parameterize a Transformer as a RASP program
    * then apply causal interventions to discover a small sufficient
      sub-program. In
* experiments on small Transformers trained on algorithmic and formal lang tasks
  * our method often recovers simple and interpretable RASP programs
    from length-generalizing transformers.
* the most direct evidence so far that Transformers internally implement simple
  RASP programs.

#### Four ways of opening the black box

* Hidden reasoning must leak ...but need not be readable.
* Automata from queries
* Recovering a head
* Decompilation

### 14:45 Oral presentations 2, the Best papers

* Probing for Knowledge Attribution in Large Language Models

Ivo Brink, Alexander Boer, Dennis Ulmer

* two types of hallucinations:
  * faithfulness violations, where the model misuses provided context, and
  * factuality violations, where answers reflect errors in internal knowledge.
* Proper mitigation depends on knowing which source drives each answer.
* We study contributive attribution, ie
  * contrib attrib: the classif of the dominant knowl source behind each output
  * a simple linear probe trained on hidden representations can reliably
    identify it.
* We introduce AttriWiki, a self-supervised pipeline that automatically
  generates labelled training data
  by prompting models to recall withheld entities from memory
  or read them from context without relying on knowledge conflicts.
* Probes trained on AttriWiki achieve up to 0.96 Macro-F1 on Llama-3.1-8B,
  Mistral-7B, and Qwen-7B,
  * transfer to SQuAD and WebQuestions with 0.94-0.99 Macro-F1, and
  * generalise zero-shot to Tighidet+ (2024)'s benchmark,
    outperforming their probe on conflicting settings without retraining.
* attribution mismatches raise error rates by up to 70%, though
* correct attribution does not guarantee correct answers, pointing to the
  need for broader detection frameworks

* Probing Without Labels: Contrast-only Reproductions of Interpretability Results

Stefan F. Schouten, Peter Bloem

* Contrastive interpretability methods use
  * pairs (or tuples) of inputs whose elements differ in minimal but controlled
    ways.
* Contrast-Consistent Search (CCS) is one such method that can
  identify whether LMs encode binary features, such as sentence truth, in their
  internal activations. One advantage is that this
  * requires no labels ie no assumption that internal activations agree with
    those labels, as is the case for supervised methods. In this work, we
* we
  * reproduce results previously obtained with CCS,
  * better understand CCS’s objective,
  * propose Tuple-Contrastive PCA (tcPCA), a method with closed-form solutions,
    * a spiritual successor of CCS
    * wider applicability than CCS by:
      * allowing for n-ary rather than just binary variables; and,
      * findings contrastive subspaces instead of directions. See

[code and interactive figures](https://contrast.stefanfs.me)

* Does Out-of-Sight Equal Out-of-Mind in CoT Monitorability?

Pedro Lobato Ferreira, Wilker Aziz, Ivan Titov

* Chain-of-thought (CoT) reasoning
  offers a window into the decision-making of large language models (LLMs),
  * can be monitored for target behaviors by reading the reasoning trace,
* Latent CoT approaches replace the explicit tokens with
  a small number of continuous states, lowering inference costs but
  removing the readable trace this monitoring relies on.
* Monitoring then requires
  alternative access to the model, such as
  probing its activations or verbalizing the latent states back into text, but
  how much monitorability these alternatives preserve is unclear.
* We study this question with a hint-based intervention setup,
  a proxy for behaviors where models exploit biasing input cues,
  eg an inadvertently leaked answer or a belief stated by the user, without
  acknowledging them.
  * hint-reliance as the monitorability target, we compare monitors
  * exper across reasoning modes,
    from explicit CoT to weakly- and strongly-supervised latent CoT, on
    math reasoning and question answering. We find that, in this setup,
* monitorability depends more on
  * properties of the task
    (eg whether the correct answer constrains the supporting reasoning) and
  * the level of access to model internals
  * [rather] than on the reasoning mode.

### 16:00 Poster Session 2 @ Hall H, Boards 51-130

#### Subliminal Clocks: Latent Time Modelling in Diffusion Language Models

ME Rulli, TV Fontanari, S Petruzzi, F Alvetreti, G Strano, D Crisostomi,
  G Nikolaou, T Mencattini, A Santilli, E Rodolà, S Scardapane, A Devoto

* Diffusion Language Models (DLMs) have recently emerged as a promising
  * alternative to autoregressive models. Unlike standard diffusion-based
  * DLMs are not explicitly conditioned on a timestep, raising a natural
  * do these models internally represent denoising progress, and
  * how is such information used downstream? In this work, we show that
* we: DLMs do encode a latent representation related to the diffusion timestep
  within their residual streams. We find that this signal
  * can be reliably extracted using probes across layers, indicating that
    denoising progress is decodable from internal activations. We further
  * steering the model along a low-dimensional subspace associated with the
    inferred timestep allows us to systematically
    modulate its notion of denoising progress, leading to
    predictable changes in model confidence and entropy.
  * geometry of the identified representation, showing that it exhibits
    structured and interpretable properties in activation space, and
    shedding light on how such a signal is processed by these models.

#### Lost in Perception: Isolating Perceptual and Reasoning Failures
in Multimodal Physics and Geometry Reasoning

Raj Jaiswal, Sree Krishna Uppalapati, Dhruvkumar Patel, Ria Khatoniar, Tanuja Ganu, Rajiv Ratn Shah

* Multimodal LLMs report strong performance on scientific reasoning benchmarks,
* hE perception and reasoning as a single measurable process.
* We: a five-task diagnostic experiment across physics and geometry benchmarks
  * isolates failures to perception, reasoning, or both.
  * Incorrect diagram interpretation degrades performance
    even on problems models solve correctly from text alone, and
  * accuracy generally rises from raw images to human-authored captions.
  * Recovery under corrected captions is high for some models,
    separating perception-blocked failures from genuine reasoning bottlenecks.
* Which reasoning error follows a perception failure depends on domain:
  * physics failures resolve into calculation errors,
    geometry into conceptual misapplication. As a discussion beyond our core
* InternS1-mini, despite heavy scientific pretraining and thinking capabilities,
  falls below the weakest model from experiments on every task, with
  * reasoning traces frequently truncating before completion.

#### Perturbation, Not Provenance: Why Activation Steering Does Not Make
a Robust Text Watermark

Sergey Pletenev

* Linear directions in the activation space of LLMs
  causally and universally influence model behavior. This suggests that they
  * ? as a basis for a robust text watermark. The idea is to
  * steer the generation along a specific semantic direction and then recover
    the mark by probing the activations of the re-encoded text. We test this
* experiments: We vary the strength of the steering and use
  * four directions (formality, sentiment, complexity, and a random control)
  * two different model families. We also test
  * two paraphrasing attacks: a sentence-level one and a stronger
    paragraph-level one. The
* results show that
  activation-steering watermarks are
  outperformed by a standard logit-based watermark (KGW)
  in terms of detection accuracy.
  * At a matched level of fluency (=< 1.15 times the original text's perplex),
    KGW achieved an AUC of 0.81 against a sentence-level paraphraser, while
    * the best steering direction only reached 0.65. A
  * stronger paragraph-level paraphraser lowered both (0.65 for KGW and 0.59 for
    steering), narrowing the gap but not reversing it.
    * On Qwen, it left the two indistinguishable but
      at near-chance levels for both. We further showed that
* the detectability provided by steering was not semantic:
  a random direction was just as detectable as a meaningful one. The signal was
  * independent of
    which layer was probed and
    whether a surface feature control was used. We conclude that, in this case,
* ie semantic activation does encode
  * not a localized, recoverable semantic mark, but rather
  * a global, content-independent shift that
    * can only be strongly detected when the text is degraded.

#### When Context Misleads: Surprisal, Energy and Attention Entropy
as Metrics of Coherence Illusions in LLMs

Ece Takmaz, Nitin Kumar, Li Kloostra, Jakub Dotlacil

* coherence illusions: an incoherent discourse can seem coherent simply because
  a distractor matches what comes next.
* We investigate whether Dutch LMs (6 monolingual and 4 multilingual) show the
  same behavior on
  * we link back to earlier context with words such as 'again' and 'too'. First,
* surprisal at the critical word tracks human acceptability judgments and
  eye-tracking data.
* Models are more surprised by incoherent continuations, but
  * hE a matching distractor in the prior context reduces this surprisal. Second,
* attention entropy identifies heads that behave differently under coherence vs
  incoherence. We find that
  * ablating these heads shows transfer effects across experiments,
    suggesting a shared mechanism.
* Third, we introduce energy from the associative-memory literature
  as a metric to quantify discourse coherence.
* sum: coherence illusions arise in Dutch LLMs, with
  * entropy and energy exposing mechanisms that operate across settings.

#### Demystifying Entropy-based Selection for Chain-of-Thought Compression
in Large Reasoning Models

Sara Candussio, Daniel Scalena, E Fersini, L Bortolussi, M Nissim, G Sarti

* Entropy-based pruning for compressing Chain-of-Thought (CoT) reasoning with
  negligible accuracy loss.
* We test the robustness of low- and high-entropy CoT step selection methods
  across various models and reasoning tasks, showing that
  * entropy offers no advantage over random pruning in any evaluated setting.
* Moving from steps to tokens, we then show that
  retaining low-entropy tokens seems effective only on mathematical benchmarks.
* this is due to the inherently low-entropy nature of numeric tokens, which also
  convey semantic content in such problems. Finally,
* patching a subset of a few CoT tokens with their original activations
  recovers near-perfect full-trace performance, providing
  * ie causal evidence that task information is
    * not concentrated in a small set of CoT tokens identifiable by heuristics,
    * distributed across the full reasoning chain.

#### Decomposing the Attention Write by Source Detects Contextual Hallucinations
    :The Sum Is Less Than Its Parts

Steffen Castle; M Dustin Nasert; CA Ebert; L Hennig; S Möller; N Feldhus

* When a language model answers from a retrieved document, its
  attention heads mix evidence from
  the context with evidence from the model’s own self-generated tokens and
  write the sum into the residual stream.
* We split each head’s write into these two source-specific contributions before
  * two sides are complementary.
  * The context write, read out along the model’s unembedding, gives a
    training-free groundedness score (GroundHOG-U).
  * The response write
    (its magnitude and directional agreement with the other residual writes)
    gives a supervised hallucination detector (GroundHOG).  Across
* exper: grounded-generation benchmarks and model families,
  * GroundHOG beats prior internal-state detectors, and
  * GroundHOG-U is the strongest training-free groundedness signal on the
    multi-model benchmarks.

Notes by Makrai: I asked Steffen very peculiar questions, and he really answered
them, instead of correcting my approch or telling the whole paper, which made me
very grateful.
