# ACL 2025 Wien

* Hangulatkép `20250727_175007, 20250728_184147`
* A frontális előadások nagyon rövidek voltak, és kevés is volt belőlük.
  A poszterek közt viszont jó élményeket szereztem, beleértve a Findings
  posztereket is.  Ennek a formának az is előnye, hogy a szerzőnek nem a
  nünükéjé el kezdi a prezentációt (pl.
  [Jarca](https://arxiv.org/abs/2502.12953) nem a _cyclic decaying masking
  ratio_-val), azt csak a nagyon kitartó hallgatónak mondja
  el,hanem azzal, ami működött.
  Volt kifejezetten nyelvészeti motivációjú cikk, pl. code switching.
* Az első szerzők 51 %-a kínai
* Az első napokban főleg a többnyelvűségről szóló cikkek
  keltették föl az érdeklődésemet, a Findings poszterek voltak egy korai
  kiemelkedő pont.
* Nem minden poszternél van értelmes összehasonlítás.
  Erről többünknek eszünkbe jutott, hogy
  a beadott cikkek élmezőnyén kívül nagyjából random, hogy elfogadják-e.
  Az alább ajánlott poszterek között is lehet ilyen.
* Vissyzatérő motívum: circuit /ˈsɝːkɪt/
* Sok cikk címében kettőspont!
* Egy poszter nem poszter! `20250729_162001`
  * [World Modeling Makes a Better Planner:](https://arxiv.org/abs/2503.10480)
    Dual Preference Optimization for Embodied Task Planning
    Siyin Wang, Zhaoye Fei, Qinyuan Cheng, Shiduo Zhang, Panpan Cai, et al
  * World-aware Planning Narratives [Enhance](https://arxiv.org/abs/2506.21230)
    Large Vision-Language Model Planner
Junhao Shi, Zhaoye Fei, Siyin Wang, Qipeng Guo, Jingjing Gong, Xipeng Qiu


    Recent advances in large vision-language models (LVLMs) have shown promise for embodied task planning, yet they struggle with fundamental challenges like dependency constraints and efficiency. Existing approaches either solely optimize action selection or leverage world models during inference, overlooking the benefits of learning to model the world as a way to enhance planning capabilities. We propose Dual Preference Optimization (D2PO), a new learning framework that jointly optimizes state prediction and action selection through preference learning, enabling LVLMs to understand environment dynamics for better planning. To automatically collect trajectories and stepwise preference data without human annotation, we introduce a tree search mechanism for extensive exploration via trial-and-error. Extensive experiments on VoTa-Bench demonstrate that our D2PO-based method significantly outperforms existing methods and GPT-4o when applied to Qwen2-VL (7B), LLaVA-1.6 (7B), and LLaMA-3.2 (11B), achieving superior task success rates with more efficient execution paths.

# Pszichológia

## Narrative

### [Entity Framing and Role Portrayal in the News](https://arxiv.org/abs/2502.14718)

`20250728_175038`

* Tarek Mahmoud, Zhuohan Xie, Dimitar Dimitrov, Nikolaos Nikolaidis, et al
* a novel multilingual hierarchical corpus annotated for entity framing and role
  portrayal in news articles. The dataset uses
* a unique taxonomy inspired by storytelling elements, comprising
  22 fine-grained roles, or archetypes, nested within three main categories:
  protagonist, antagonist, and innocent. Each archetype is carefully defined,
  * protagonist: guardian, martyr, and underdog
  * antagonist: tyrant, deceiver, and bigot
  * innocent: victim, scapegoat, and exploited
* 1,378 recent news articles in
* five languages (Bulgarian, English, Hindi, European Portuguese, and Russian)
* two domains: the Ukraine-Russia War and Climate Change
* > 5,800 entity mentions have been annotated with role labels. This
* evaluation results on fine-tuned state-of-the-art multilingual transformers
  and hierarchical zero-shot learning using LLMs
  * at the level of a document, a paragraph, and a sentence

### [A Computational Framework to Identify Self-Aspects in Text](https://aclanthology.org/2025.acl-srw.47/)

Jaya Caporusso, Matthew Purver, Senja Pollak

* PhD proposal
* we plan to introduce
  an ontology of Self-aspects and a gold-standard annotated dataset. Using this
  * develop and evaluate conventional discriminative models, generative LLMs,
    and embedding-based retrieval approaches against four main
* criteria: interpretability, ground-truth adherence, accuracy, and
  computational efficiency
* case studies in mental health and empirical phenomenology

## Depression

[Eeyore:](https://arxiv.org/abs/2503.00018) Realistic Depression Simulation
via Supervised and Preference Optimization

Siyang Liu, Bianca Brie, Wenda Li, Laura Biester, Andrew Lee,
James Pennebaker, Rada Mihalcea

* goal: capturing diverse client traits and psychological conditions. We
* Eeyore: an 8B model optimized for realistic depression simulation
  through a structured alignment framework, incorporating
  expert input at every stage
* First, we systematically curate real-world depression-related conversations,
  extracting depressive traits to guide data filtering and psychological profile
  construction, and use this dataset to instruction-tune Eeyore for profile
  adherence.
* Next, to further enhance realism, Eeyore undergoes iterative preference
  optimization -- first leveraging model-generated preferences and then
  calibrating with a small set of expert-annotated preferences. Throughout the
* we actively collaborate with domain experts, developing interactive interfaces
  to validate trait extraction and iteratively refine structured psychological
  profiles for clinically meaningful role-play customization
* Despite its smaller model size, the Eeyore depression simulation
  outperforms GPT-4o with SOTA prompting strategies,
  both in linguistic authenticity and profile adherence.

## Surprisal

The Inverse Scaling Effect of Pre-Trained Language Model Surprisal Is [Not Due to Data Leakage](https://aclanthology.org/2025.findings-acl.91/)

Byung-Doh Oh, Hongao Zhu, William Schuler

* psycholinguistic modeling
* surprisal from larger pre-trained language models has been shown to be
  a poorer predictor of naturalistic human reading times.
* It has been speculated that this may be due to data leakage
  * LLMs see the text stimuli during training.
* We:
  1. relatively little leakage of five naturalistic reading time corpora
    in two pre-training datasets
    in terms of length and frequency of token n-gram overlap. The second study
  2. the **negative relationship between language model size and the fit of
     surprisal to reading times**
     replicated using models trained on ‘leakage-free’ data that
     overlaps only minimally with the reading time corpora. Taken together, this

# Konstrukciós nyelvtan

[CxGGEC:](https://aclanthology.org/2025.acl-long.307/)
Construction-Guided Grammatical Error Correction

Yayu Cao, Tianxiang Wang, Lvxiaowei Xu, Zhenyao Wang, Ming Cai

* Current grammatical error correction (GEC) methods primarily rely on
  grammatical labels for syntactic information, often overlooking the inherent
  usage patterns of language. In this work, we explore
the potential of construction grammar (CxG) to improve GEC by leveraging
constructions to capture underlying language patterns and guide corrections
* we establish a comprehensive construction inventory from corpora. Next, we
* we introduce a construction prediction model that
  identifies potential constructions in ungrammatical sentences
  using a noise-tolerant language model
* we train a CxGGEC model on construction-masked parallel data, which performs
  GEC by decoding construction tokens into their original forms and correcting
  erroneous tokens
* Extensive experiments on English and Chinese GEC benchmarks: effective

# Tutorials



## [Guardrails](https://llm-guardrails-security.github.io/)

* Ábra: az egyes nyelvek hanyadmagukkal, milyen gyakran szerepelnek cikkekben.
  * The State of Multilingual LLM Safety Research:
    From Measuring the Language Gap to Mitigating It
    [(Yong et al., 2025)](https://arxiv.org/abs/2505.24119)

# Main conference

## Monday

### Keynote: L Zettlemoyer: Rethinking Pretraining: Data and Architecture

* the standard pipeline of LLM training:
  tokenization, pretraining, possibly mid-training, and post training or
  alignment
* 3 cases when we don't understand  this pipeline
  * our work on data efficient post training (eg LIMA, ALMA, and s1) where we
    * nearly all advanced model capabilities come from the pretraining data
  * new hierarchical architectures for byte-level language models (eg BLT) that
    * both tokenizer-free and scale better than traditional BPE-based methods,
      especially in the long tail. Finally, I will discuss
  * decentralized, modular training algorithms (eg BTM) that
    * better isolate and control the influence of specific data on specific
      model components and behaviors
* sum: centering and amplifying the influence of data in architecture design

### Poster

#### [TUBA:](https://arxiv.org/abs/2404.19597)
Cross-Lingual Transferability of Backdoor Attacks in LLMs
with Instruction Tuning

Xuanli He, Jun Wang, Qiongkai Xu, Pasquale Minervini, Pontus Stenetorp, et al

The implications of backdoor attacks on English-centric large language models
* embedding malicious behaviors during training and
* activated under specific conditions that trigger malicious outputs. Despite
* we focus on how poisoning the instruction-tuning data for one or two languages
  can affect the outputs for languages whose instruction-tuning data were not
  poisoned. Despite its simplicity, our empirical analysis reveals that our
* remarkable efficacy in models like mT5 and GPT-4o, with high
  attack success rates, surpassing 90% in more than 7 out of 12 languages across
  various scenarios. Our findings also indicate that
* more powerful models show increased susceptibility to transferable
  cross-lingual backdoor attacks, which also applies to LLMs predominantly
  pre-trained on English data, such as Llama2, Llama3, and Gemma. Moreover, our
* High Transferability: the backdoor mechanism operates in cross-lingual
  response scenarios across _26 languages_, achieving an average
  attack success rate of 99%, and
* 2) Robustness: the proposed attack remains effective even after defenses are
  applied. These findings expose critical security vulnerabilities in

#### [Human-LLM Coevolution:](https://arxiv.org/abs/2502.14718)
    Evidence from Academic Writing

Mingmeng Geng, Roberto Trotta

* statistical analysis of arXiv paper abstracts, we report a
* marked drop in the frequency of several words previously identified as
  overused by ChatGPT, such as "delve",
  * starting soon after they were pointed out in early 2024
  * The frequency of certain other words favored by ChatGPT, such as
    "significant", has instead kept increasing. These phenomena suggest that
* ie some authors of academic papers have adapted their use of large language
  models (LLMs), for example, by selecting outputs or applying modifications to
  the LLM-generated content.  Such coevolution and cooperation of humans and
  * additional challenges to the detection of machine-generated text in

#### [Testing English News Articles for Lexical Homogenization](https://arxiv.org/abs/2505.24731)
Due to Widespread Use of Large Language Models

Sarah Fitterer, Dominik Gangl, Jannes Ulbrich

* we compare two datasets of English online news articles:  2018 vs 2024
* lexical homogenization measured by the MATTR, Maas, and MTLD metrics, and
* LLM-Style-Word Ratio (SWR) to measure LLM influence. We found
  * higher MTLD and SWR scores, yet
  * negligible changes in Maas and MATTR scores in 2024 corpus. We conclude that

#### [A Semantic-Aware Layer-Freezing Approach](https://arxiv.org/abs/2406.11753)
to Computation-Efficient Fine-Tuning of Language Models

Jian Gu, Aldeida Aleti, Chunyang Chen, Hongyu Zhang

* full finetuning is usually costly. Existing work, such as
* we conduct a semantic analysis of the LM inference process.
1. use transition traces of the latent representation to compute deviations (or
   loss). Then,
2. using a derived formula of scaling law,
  we estimate the gain of each layer in reducing deviation (or loss)
* we narrow down the scope for finetuning, and also,
  study the cost-benefit balance of LM finetuning. We perform
* extensive experiments across well-known LMs and datasets. The results show
* our approach is effective and efficient, and outperforms the existing
  baselines.

#### [Large Language Models as Neurolinguistic Subjects:](https://arxiv.org/abs/2411.07533)
Discrepancy between Performance and Competence

Linyang He, Ercong Nie, Helmut Schmid, Hinrich Schütze, Nima Mesgarani, Jonathan Brennan

* psycholinguistic evaluations often reflect statistical rules that may not
  accurately represent LLMs' true linguistic competence. We introduce a
* our neurolinguistic approach combines minimal pair and diagnostic probing to
  analyze activation patterns across model layers.  This method allows for a
* whether the representations are consistent across languages.
* We found:
1. Psycholinguistic and neurolinguistic methods reveal that
  language performance and competence are distinct;
1. Direct probability measurement may not accurately assess linguistic
   competence;
1. Instruction tuning won't change much competence but improve performance;
1. LLMs exhibit higher competence and performance in form compared to meaning.
* we introduce new conceptual minimal pair datasets
  for Chinese (COMPS-ZH) and German (COMPS-DE),
  complementing existing English datasets.


#### [On the Role of Semantic Proto-roles in Semantic Analysis:
What do LLMs know about agency?](https://aclanthology.org/2025.findings-acl.623/)

Elizabeth Spaulding, Shafiuddin Rehan Ahmed, James Martin

At the top of the poster:

  Semantic role labeling and semantic proto-role labeling are
  highly complementary tasks, but
  prompting LLMs for SPRL alongside SRL doesn't result in better performance.

* proto-role theory, which characterizes
  agents via properties such as *instigation* and *volition* and
  patients via properties such as *change of state*,
* we examine the ability of LLMs to answer questions that require complex,
  multi-step event reasoning.  Specifically, we investigate the extent to which
  LLMs capture semantic roles such as “agent” and “patient” through
  * zero-shot prompts
  * whether incorporating semantic proto-role labeling (SPRL) context improves
    semantic role labeling (SRL) performance in a zero-shot setting. We
* SPRL context sometimes degrades SRL accuracy in eg GPT-4o), it also uncovers
* consistency between SPRL and SRL predictions that mirrors linguistic theory,
  * ie LLMs implicitly encode consistent multi-dimensional event role knowledge.
  * LLMs underperform human annotators in complex semantic analysis.

#### [Task-Informed Anti-Curriculum by Masking Improves Downstream Performance on Text](https://arxiv.org/abs/2502.12953)

Andrei Jarca, Florinel Alin Croitoru, Radu Tudor Ionescu

* We propose to adjust the masking ratio in MLM and to decide
  which tokens to mask?
* a novel task-informed anti-curriculum learning scheme.
* First, we harness task-specific knowledge about useful and harmful tokens
  in order to determine which tokens to mask. Second,
* we propose a cyclic decaying masking ratio,
  ie anti-curriculum schedule (from hard to easy). We exemplify our novel
* three diverse downstream tasks: sentiment analysis, text classification by
  topic, and authorship attribution. Our findings suggest that
* TIACBM enhances the ability of the model to focus on key task-relevant
  features, contributing to statistically significant performance gains across
  tasks

#### [EXECUTE:](https://arxiv.org/abs/2505.17784)
A Multilingual Benchmark for LLM Token Understanding
Lukas Edman, Helmut Schmid, Alexander Fraser

A vörös poszter.

* The CUTE benchmark showed that
  LLMs struggle with character understanding in English.
* We extend it to more languages with diverse scripts and writing systems,
* challenges in other languages are not always on the character level as in
  English.
* Some languages show word-level processing issues, some show no issues at all.
* We also examine sub-character tasks in Chinese, Japanese, and Korean

#### [Small Models, Big Impact:](https://arxiv.org/abs/2502.10140)
Efficient Corpus and Graph-Based Adaptation of Small Multilingual LMs
for Low-Resource Languages

Daniil Gurgurov, Ivan Vykopal, Josef van Genabith, Simon Ostermann

* SOTA LLMs still struggle with LRLs,
* smaller multilingual models (mLMs) such as mBERT and XLM-R
  offer greater promise due to a
  better fit of their capacity to low training data sizes. This study
* we systematically investigate parameter-efficient adapter-based methods for
  adapting mLMs to LRLs, evaluating
* three architectures: Sequential Bottleneck, Invertible Bottleneck, and
  Low-Rank Adaptation. Using
* unstructured text from GlotCC and structured knowledge from ConceptNet, we
* small adaptation datasets
  * eg up to 1 GB of free-text or a few MB of knowledge graph data) yield
  * gains in intrinsic (masked language modeling) and
    extrinsic tasks (topic classification, sentiment analysis, and named entity
    recognition). We find that
* architecture
  * Sequential Bottleneck adapters excel in language modeling, while
  * Invertible Bottleneck adapters slightly outperform other methods on
    downstream tasks due to better embedding alignment and more parameters
  * Adapter-based methods match or outperform full fine-tuning while using far
    fewer parameters, and
  * smaller mLMs prove more effective for LRLs
    than massive LLMs like LLaMA-3, GPT-4, and DeepSeek-R1-based distilled LMs
  * adaptation improves performance, hE pre-training data size remains the
    dominant factor, especially for languages with extensive pre-training
    coverage.

#### [Minimal Pair-Based Evaluation of Code-Switching](https://arxiv.org/abs/2502.10140)

Igor Sterner, Simone Teufel

* Do large language models (LLMs) use code-switching (CS) in the same way as
  bilinguals. Existing methods do not have wide language coverage, fail to
* We propose an intervention based on minimal pairs of CS.
* Each minimal pair contains one naturally occurring CS sentence and
  one minimally manipulated variant. We collect up to
* 1,000 such pairs each for 11 language pairs. Our human experiments show that,
* for every language pair, bilinguals consistently prefer the naturally
  occurring CS sentence. Meanwhile our experiments with current
* LLMs: the larger the model, the more consistently it assigns higher
  probability to the naturally occurring CS sentence than to the variant.
* the largest probability differences arise in those pairs where the manipulated
  material consisted of closed-class words.

#### [Global MMLU:](https://arxiv.org/abs/2412.03304) Understanding and
Addressing Cultural and Linguistic Biases in Multilingual Evaluation

Shivalika Singh, Angelika Romanou, Clémentine Fourrier, David I. Adelani, et al

* ? practical utility of translated datasets like MMLU.
* translation often introduces artefacts that can distort the meaning or clarity
* large-scale evaluation of state-of-the-art open and proprietary models
  * progress on MMLU depends heavily on learning Western-centric concepts, with
    28% of all questions requiring culturally sensitive knowledge.
  * geographic knowledge, an astounding 84.9% focus on either North American or
    European regions. Rankings of model evaluations change depending on whether
* Global MMLU, an improved MMLU with evaluation coverage across 42 languages --
  * compensated professional and community annotators to verify translation
    quality while also rigorously evaluating cultural biases present in the
  * designated subsets labeled as culturally sensitive and culturally agnostic

#### [Middle-Layer Representation Alignment](https://arxiv.org/abs/2412.03304)
for Cross-Lingual Transfer in Fine-Tuned LLMs
Danni Liu, Jan Niehues

github.com/dannigt/mid-align

* 1,000+ language pairs, we discover that middle layers exhibit the strongest
  potential for cross-lingual alignment. Building on this finding, we propose a
  middle-layer alignment objective integrated into task-specific training. Our
* experiments on slot filling, machine translation, and structured text
  generation show consistent improvements in cross-lingual transfer, especially
  to lower-resource languages. The method is
* robust to the choice of alignment languages and
* generalizes to languages unseen during alignment. Furthermore, we show that
* separately trained alignment modules can be merged with existing task-specific
  modules, improving cross-lingual capabilities without full re-training. Our

#### [TUMLU:](https://aclanthology.org/2025.acl-long.1112/)
A Unified and Native Language Understanding Benchmark for Turkic

Jafar Isbarov, Arofat Akhundjanova, Mammad Hajili, Kavsar Huseynova, et al

Én arról beszélgettem a szerzővel (már nem emlékszem, hogy ő emelte ki, vagy én
ragadtam le ennél), hogy némelyik türk nyelvnél az van, hogy már a latin a
hivatalos script, de a hétköznapi életben sőt akár az iskolában is megmaradtak a
cirillnél illetve arabnál, és ennek megfelelően a nagy, többnyelvű modellek is a
régi szkripten jobbak.

* Turkic language family: under-represented, distinct morphosyntactic and
  cultural characteristics.
* We propose two benchmarks for Turkic language MMLU:
  * TUMLU is a comprehensive, multilingual, and natively developed NLU benchmark
    specifically designed for Turkic languages. It consists of
  * middle- and high-school level questions spanning 11 academic subjects in
    Azerbaijani, Crimean Tatar, Karakalpak, Kazakh, Tatar, Turkish, Uyghur, and
    Uzbek. We also present
  * TUMLU-mini, a more concise, balanced, and manually verified subset of the
* we systematically evaluate a diverse range of
  open and proprietary multilingual large language models (LLMs), including
  Claude, Gemini, GPT, and LLaMA, offering an
  in-depth analysis of their performance across different languages, subjects,
  and alphabets. To promote further research and development in multilingual

#### [The Hidden Attention of Mamba Models](https://arxiv.org/abs/2403.01590)

Ameen Ali, Itamar Zimerman, Lior Wolf

Ficsor Tominak fényképeztem le, de nem örült neki, mert azt mondat, hogy a
Mambában eleve van attention.

* The Mamba _layer_ offers an efficient selective state space model (SSM) that
* highly effective in modeling multiple domains, including NLP, long-range
  sequence processing, and computer vision. Selective SSMs are viewed as
* dual models, in which one
  * trains in parallel on the entire sequence via an IO-aware parallel scan, and
  * deploys in an autoregressive manner.
  * We add a third view: such models can be viewed as attention-driven models
* empirically and theoretically compare the underlying mechanisms
  to that of the self-attention layers in transformers and allows us to
* peer inside the inner workings of the Mamba model with explainability methods.

#### [Circuit Stability](https://arxiv.org/abs/2505.24731) Characterizes Language Model Generalization

Alan Sun

* mechanistic interpretability
* we introduce circuit stability as a new way to assess model performance.
  := a model's ability to apply a consistent reasoning process across inputs
* We mathematically formalize circuit stability and circuit equivalence.

#### [From Directions to Cones:](https://arxiv.org/abs/2505.24731)
Exploring Multidimensional Representations of Propositional Facts in LLMs

Stanley Yu*, Vaidehi Bulusu*, Oscar Yasunaga, Clayton Lau, Cole Blondin, et al

* Prior work suggests that the truthfulness of simple propositions can be
  represented as a single linear direction in a model’s internal activations,
  but this may not fully capture its underlying geometry. In
* the concept cone framework, recently introduced for modeling refusal,
* we extend the concept cone framework to the domain of truth.
* We identify multi-dimensional cones that causally mediate truth-related
  behavior across multiple LLM families. Our results are supported by
* three lines of evidence:
  1. causal interventions reliably flip model responses to factual statements,
  1. learned cones generalize across model architectures, and
  1. cone-based interventions preserve unrelated model behavior.
* ie richer, multidirectional structure governing simple true/false propositions

#### [Limited-Resource Adapters Are Regularizers, Not Linguists](https://arxiv.org/abs/2505.24525)
**Marcell Fekete**, Nathaniel R. Robinson, Ernests Lavrinovics, et al

* low-resource machine translation (MT). In this work,
* we investigate an adapter souping method combined with cross-attention
  fine-tuning of a pre-trained MT model to leverage language transfer for
* three low-resource Creole languages, which exhibit
  * related to different language groups across distinct linguistic dimensions.
* Our approach improves performance substantially over baselines. However, we
* hE linguistic relatedness -- or a lack thereof -- does not covary with perf
* equal efficiency with randomly initialized adapters, implying that
* ie the benefit of adapters in this setting lies in parameter regularization,
  * no meaningful information transfer. We provide analysis supporting this
* neural language processing involves many success factors, and that
* not all neural methods leverage linguistic knowledge in intuitive ways

#### [DenseLoRA: Dense Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2505.24731)
Lin Mu, Xiaoyu Wang, Li Ni, Yang Li, Zhize Wu, Peiquan Jin, Yiwen Zhang

* Low-rank adaptation (LoRA): fine-tuning two low-rank matrices
* hE many of the weights in these matrices are redundant, leading to
* we introduce Dense Low-Rank Adaptation (DenseLoRA), a novel approach that
* incorporating a single Encoder-Decoder to refine and compress hidden
  representations across all adaptation layers before applying adaptation.
  Instead of relying on two redundant low-rank matrices as in LoRA, DenseLoRA
  adapts LLMs through a dense low-rank matrix, improving parameter utilization
  and adaptation efficiency. We 
* evaluation on various benchmarks, showing that it achieves
  83.8% accuracy with only 0.01% of trainable parameters, compared to
  LoRA's 80.8% accuracy with 0.70% of trainable parameters on LLaMA3-8B.
* extensive experiments to systematically assess the impact of DenseLoRA's
  components on overall model performance. Code is available at this https URL.
