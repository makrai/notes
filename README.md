# ACL 2025 Wien

* Hangulatkép: szamaritánusok `20250727_175007, 20250728_184147`
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
* Pilehvar észrevétele: sok cikk címében kettőspont!
* Egy poszter nem poszter! `20250729_162001`
  * [World Modeling Makes a Better Planner:](https://arxiv.org/abs/2503.10480)
    Dual Preference Optimization for Embodied Task Planning
    Siyin Wang, Zhaoye Fei, Qinyuan Cheng, Shiduo Zhang, Panpan Cai,+
  * World-aware Planning Narratives [Enhance](https://arxiv.org/abs/2506.21230)
    Large Vision-Language Model Planner
    Junhao Shi, Zhaoye Fei, Siyin Wang, Qipeng Guo, Jingjing Gong, Xipeng Qiu

  * large vision-language models (LVLMs) for embodied task planning, yet they
  * hE fundamental challenges like dependency constraints and efficiency .
  * Existing approaches either
    solely optimize action selection or
    leverage world models during inference,
    overlooking the benefits of learning to model the world
    as a way to enhance planning capabilities
  * We propose Dual Preference Optimization (D2PO), a new learning framework
  * jointly optimizes state prediction and action selection
    through preference learning,
    enabling LVLMs to understand environment dynamics for better planning.
  * To automatically collect trajectories and stepwise preference data, we:
    a tree search mechanism for extensive exploration via trial-and-error.
  * Extensive experiments on VoTa-Bench demonstrate that our D2PO-based method
    * significantly outperforms existing methods and GPT-4o when applied to
      Qwen2-VL (7B), LLaVA-1.6 (7B), and LLaMA-3.2 (11B), achieving
    * superior task success rates with more efficient execution paths.
* A jegyzet felépítése: az elején a mostani projektjeimhez kapcsolódó témák,
  majd a konferencia részei időrendben, kivéve, hogy a poszterek a végén vannak,
  mert az adja a doksi nagy részét.

## Pszichológia

### Speech (for psychology)

#### [WhiSPA: Semantically and Psychologically Aligned Whisper](https://arxiv.org/abs/2501.16344)
with Self-Supervised Contrastive and Student-Teacher Learning
Rajath Rao, Adithya Ganesan, Oscar Kjell, Jonah Luby, Akshay Raghavan,+

* Current speech encoding pipelines often rely on an additional text-based LM,
  even though SotA speech-to-text models often have a LM within. This work
* We introduce WhiSPA (Whisper with Semantic and Psychological Alignment), which
* a novel audio training objective:
  contrastive loss with an LM embedding as a teacher.
* Using over 500k speech segments from mental health audio interviews, we
* aligning Whisper's latent space with
  * SBERT semantic representations from a text autoencoder (SBERT) and
  * lexically derived embeddings of basic psychological dimensions: emotion and
    personality.
* eval: self-supervised affective tasks and downstream psychological tasks,
  * WhiSPA surpasses current speech encoders, achieving an
    average error
    reduction of 73.4% and 83.8%, respectively. WhiSPA demonstrates that it is

#### [Mapping the Podcast Ecosystem](https://arxiv.org/abs/2411.07892)
with the Structured Podcast Research Corpus
Benjamin Litterer, David Jurgens, Dallas Card

* we introduce a massive dataset of over 1.1M podcast transcripts that is
  largely comprehensive of
  all English language podcasts available through public RSS feeds
  from May and June of 2020. This data is not limited to text, but rather
* audio features and speaker turns for a subset of 370K episodes, and
* speaker role inferences and other metadata for all 1.1M episodes. Using this
* investigation into the content, structure, and responsiveness of this

### Emotion

Workshop day 1, `20250731_170252`

### Depression

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

### Sarcasm

#### Rhetorical Device-Aware Sarcasm Detection with Counterfactual Data Augmentation
Qingqing Hong, Jiayi Lin, Junji Wang, Dapeng Yin, Dongyu Zhang, Shuyue Zhu
Findings Posters -- Virtual

#### BESSTIE: A Benchmark for Sentiment and Sarcasm Classification for Varieties of English
Dipankar Srirag, Aditya Joshi, Diptesh Kanojia, Jordan Painter
Findings Posters -- In-Person 1

#### Incongruity-aware Tension Field Network for Multi-modal Sarcasm Detection
Jiecheng Zhang, C. L. Philip Chen, Shuzhen Li, Tong Zhang
Poster Session 4

* Multi-modal sarcasm detection (MSD): from text-image pairs
* Most MSD researches explore the incongr through consistency preference methods
* However, these methods prioritize consistency over incongruity and blur
  incongruity information under their global feature aggregation mechanisms,
  leading to incongruity distortions and model misinterpretations. To address
* we: incongruity-aware tension field network (ITFNet) for multi-modal sarcasm
  * extracts effective text-image feature pairs
    in fact and sentiment perspectives. It then constructs
  * a fact/sentiment tension field with discrepancy metrics to capture the
    contextual tone and polarized incongruity after the iterative learning of
    tension intensity, effectively highlighting incongruity information during
    such inconsistency preference learning. It further
  * standardizes the polarized incongruity with reference to contextual tone to
    obtain standardized incongruity, effectively implementing
    instance standardization for unbiased decision-making in MSD.
* performs well in extracting salient and standardized incongruity through an
  incongruity-aware tension field,
  significantly tackling incongruity distortions and cross-instance variance.
* SOTA performance surpassing LLaVA1.5-7B with only 17.3M trainable parameters,

### Narrative

#### [Entity Framing and Role Portrayal in the News](https://arxiv.org/abs/2502.14718)

`20250728_175038`

* Tarek Mahmoud, Zhuohan Xie, Dimitar Dimitrov, Nikolaos Nikolaidis,+
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
* evaluation results on fine-tuned SOTA multilingual transformers
  and hierarchical zero-shot learning using LLMs
  * at the level of a document, a paragraph, and a sentence

#### [A Computational Framework to Identify Self-Aspects in Text](https://aclanthology.org/2025.acl-srw.47/)

Jaya Caporusso, Matthew Purver, Senja Pollak

* PhD proposal
* we plan to introduce
  an ontology of Self-aspects and a gold-standard annotated dataset. Using this
  * develop and evaluate conventional discriminative models, generative LLMs,
    and embedding-based retrieval approaches against four main
* criteria: interpretability, ground-truth adherence, accuracy, and
  computational efficiency
* case studies in mental health and empirical phenomenology

### Surprisal (see CoNLL as well)

#### The Inverse Scaling Effect of Pre-Trained Language Model Surprisal Is [Not Due to Data Leakage](https://aclanthology.org/2025.findings-acl.91/)

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

#### Subword models struggle with word learning, but [surprisal hides it](https://arxiv.org/abs/2502.12835)
Bastian Bunzeck, Sina Zarrieß

* We study word learning in subword and character language models
  with the psycholinguistic lexical decision task. While
  * subword LMs struggle to discern words and non-words with high accuracy,
  * character LMs solve this task easily and consistently. Only
  * when supplied with further contexts do subword LMs perform similarly to
    character models. Additionally, when
  * looking at word-level and syntactic learning trajectories, we find that
    * char: both processes are separable in character LMs
      * Word learning happens before syntactic learning, whereas
    * subword: both occur simultaneously in subword LMs. This raises questions
* ? adequacy of subword LMs for modeling language acquisition and positions
* character LMs is a viable alternative to study processes below the syntactic
  level.

## Konstrukciós nyelvtan

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

## [Tutorial on Guardrails](https://llm-guardrails-security.github.io/)

* Ábra: az egyes nyelvek hanyadmagukkal, milyen gyakran szerepelnek cikkekben.
  * The State of Multilingual LLM Safety Research:
    From Measuring the Language Gap to Mitigating It
    [(Yong+ 2025)](https://arxiv.org/abs/2505.24119)

## Keynote: L Zettlemoyer: Rethinking Pretraining: Data and Architecture

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

## Oral (Main conference)

### Unique Hard Attention: A Tale of Two Sides
Selim Jerad, Anej Svete, Jiaoda Li, Ryan Cotterell

#### Abstract

* Understanding the expressive power of transformers
* Many studies analyze unique hard attention transformers, where
  attention selects a single position that maximizes the attention scores.
* When multiple positions achieve the maximum score, either the rightmost or the
  leftmost of those is chosen
* We highlight the importance of this seeming triviality
* finite-precision transformers with both leftmost- and rightmost-hard attention
  were shown to be equivalent to Linear Temporal Logic (LTL)
* [we:?] this no longer holds with only leftmost-hard attention --
  in that case, they correspond to a _strictly weaker_ fragment of LTL.
* we show that models with leftmost-hard attention are equivalent to _soft_
  attention
  * ie they may better approximate real-world transformers than right-attention

#### Links

* [Underline (pre-recorded video and poster)](https://underline.io/events/485/sessions/20606/lecture/123375-unique-hard-attention-a-tale-of-two-sides)
* [arxiv.org/abs/2503.14615](https://arxiv.org/abs/2503.14615)

(In the Q&A of this paper, Anssi Yli-Jyrä asked a question about reset automata
and counter automata.)

## ACL Lifetime Award: Kathleen McKeown

* [Detecting and Explaining Emotional Reactions in Personal Narrative](https://scholar.google.com/citations?view_op=view_citation&hl=en&user=mBf4mJUAAAAJ&citation_for_view=mBf4mJUAAAAJ:YsMSGLbcyi4C)
  Elsbeth Turcan
  PhD Thesis 2024

## Paper Awards

### Outstanding Papers

* A New Formulation of **Zipf’s Meaning-Frequency Law** through Contextual Diversity
Ryo Nagata, Kumiko Tanaka-Ishii

* All That Glitters is Not Novel: Plagiarism in AI Generated Research
Tarun Gupta, Danish Pruthi

* Between **Circuits and Chomsky:**
  Pre-pretraining on Formal Languages Imparts Linguistic Biases
Michael Y. Hu, Jackson Petty, Chuan Shi, William Merrill, Tal Linzen

* **Beyond N-Grams:** Rethinking Evaluation Metrics and Strategies
  for Multilingual Abstractive Summarization
Itai Mondshine, Tzuf Paz-Argaman, Reut Tsarfaty

* Bridging the Language Gaps in LLMs
  with Inference-Time Cross-Lingual Intervention
Weixuan Wang, Minghao Wu, Barry Haddow, Alexandra Birch

* **Byte Latent Transformer:** Patches Scale Better Than Tokens
Artidoro Pagnoni, Ramakanth Pasunuru, Pedro Rodriguez, John Nguyen, Benjamin Muller, Margaret Li, Chunting Zhou, LILI YU, Jason E Weston, Luke Zettlemoyer, Gargi Ghosh, Mike Lewis, Ari Holtzman, Srini Iyer

* **Capability Salience Vector:** Fine-grained Alignment of Loss and Capabilities
  for Downstream Task Scaling Law
Qiming Ge, Shuhao Xing, Songyang Gao, Yunhua Zhou, Yicheng Zou, Songyang Zhang, Zhi Chen, Hang Yan, Qi Zhang, Qipeng Guo, Kai Chen

* From Real to Synthetic:
  Synthesizing Millions of Diversified and Complicated User Instructions
  with Attributed Grounding
Chiwei Zhu, Benfeng Xu, Xiaorui Wang, Zhendong Mao

* HALOGEN: Fantastic LLM Hallucinations and Where to Find Them
Abhilasha Ravichander, Shrusti Ghela, David Wadden, Yejin Choi

* **HateDay:**
  Insights from a Global Hate Speech Dataset Representative of a Day on Twitter
Manuel Tonneau, Diyi Liu, Niyati Malhotra, Scott A. Hale, Samuel Fraiberger, Victor Orozco-Olvera, Paul Röttger

* IOT: **Embedding Standardization Method** Towards Zero Modality Gap
Na Min An, Eunki Kim, James Thorne, Hyunjung Shim

* IndicSynth: A Large-Scale Multilingual Synthetic Speech Dataset
  for Low-Resource Indian Languages
Divya V Sharma, Vijval Ekbote, Anubha Gupta

* LaTIM: Measuring **Latent Token-to-Token Interactions in Mamba Models**
Hugo Pitorro, Marcos Vinicius Treviso

* Llama See, Llama Do:
  A Mechanistic Perspective on Contextual Entrainment and Distraction in LLMs
Jingcheng Niu, Xingdi Yuan, Tong Wang, Hamidreza Saghir, Amir H. Abdi

* LLMs know their vulnerabilities:
  Uncover Safety Gaps through Natural Distribution Shifts
Qibing Ren, Hao Li, Dongrui Liu, Zhanxu Xie, Xiaoya Lu, Yu Qiao, Lei Sha, Junchi Yan, Lizhuang Ma, Jing Shao

* **Mapping 1,000+ Language Models via the Log-Likelihood Vector**
Momose Oyama, Hiroaki Yamagiwa, Yusuke Takase, Hidetoshi Shimodaira

* MiniLongBench: The Low-cost Long Context Understanding Benchmark for LLMs
Zhongzhan Huang, Guoming Ling, Shanshan Zhong, Hefeng Wu, Liang Lin

* PARME: Parallel Corpora for Low-Resourced Middle Eastern Languages
  Sina Ahmadi, Rico Sennrich, Erfan Karami, Ako Marani, Parviz Fekrazad, et al

* Past Meets Present: Creating Historical Analogy with LLMs
Nianqi Li, Siyu Yuan, Jiangjie Chen, Jiaqing Liang, Feng Wei, Zujie Liang, Deqing Yang, Yanghua Xiao

* Pre³: Enabling Deterministic **Pushdown Automata**
  for Faster Structured LLM Generation
Junyi Chen, Shihao Bai, Zaijun Wang, Siyu Wu, Chuheng Du, Hailong Yang, Ruihao Gong, Shengzhong Liu, Fan Wu, Guihai Chen

* Rethinking the Role of **Prompting** Strategies in LLM Test-Time Scaling:
  A Perspective of **Probability** Theory
Yexiang Liu, Zekun Li, Zhi Fang, Nan Xu, Ran He, Tieniu Tan

* Revisiting Compositional Generalization Capability of LLMs
  Considering Instruction Following Ability
Yusuke Sakai, Hidetaka Kamigaito, Taro Watanabe

* Toward Automatic Discovery of a **Canine** Phonetic Alphabet
Theron S. Wang, Xingyuan Li, Hridayesh Lekhak, Tuan Minh Dang, Mengyue Wu, Kenny Q. Zhu

* Towards the Law of Capacity Gap in Distilling Language Models
Chen Zhang, Qiuchi Li, Dawei Song, Zheyu Ye, Yan Gao, Yao Hu

* ...: Accelerating Inference of LLMs with **Token Recycling**
Xianzhen Luo, Yixuan Wang, Qingfu Zhu, Zhiming Zhang, Xuanyu Zhang, Qing Yang, Dongliang Xu

* Typology-Guided Adaptation for African NLP
Ndapa Nakashole

### Best Resource Paper

* Are Rules Meant to be Broken? Understanding
  Multilingual Moral Reasoning as a Computational Pipeline
  with UniMoral
    Shivani Kumar, David Jurgens

* BRIGHTER: BRIdging the Gap in Human-Annotated
  Textual Emotion Recognition Datasets for 28 Languages
  Shamsuddeen Hassan Muhammad, Nedjma Ousidhoum, ..., Saif M. Mohammad

* Palm: A Culturally Inclusive and Linguistically Diverse Dataset
  for Arabic LLMs
  Fakhraddin Alwajih, Abdellah EL MEKKI, ..., Muhammad Abdul-Mageed

### Best Demo: OLMoTrace. Tracing Language Model Outputs Back to Trillions of
Training Tokens
Jiacheng Liu, Taylor Blanton, Yanai Elazar, Sewon Min, YenSung Chen, et al

* OLMoTrace finds and shows verbatim matches between segments of output and
  documents in the training text corpora.
* Powered by an extended version of infini-gram (Liu et al., 2024), our system
  returns tracing results within a few seconds. OLMoTrace can help users
* We showcase how it can be used to explore fact checking, hallucination, and
  the creativity
* publicly available and fully open-source.

### Best Paper

* [A Theory of Response Sampling in LLMs:](https://pramod-kaushik.github.io/llm-response-sampling/)
  Part Descriptive and Part Prescriptive
  Sarath Sivaprasad, Pramod Kaushik, Sahar Abdelnabi, Mario Fritz
  1CISPA Helmholtz Center for Information Security

* Fairness through Difference Awareness: Measuring Desired Group Discrimination in LLMs
  Angelina Wang, Michelle Phan, Daniel E. Ho, Sanmi Koyejo
  Stanford

* Language Models Resist Alignment: Evidence From Data Compression
  Jiaming Ji, Kaile Wang, Tianyi Qiu, Boyuan Chen, Jiayi Zhou, Changye Li, Hantao Lou, Juntao Dai, Yunhuai Liu, Yaodong Yang
  Peking University
  [photo of the authors (in smokings)](https://img.36krcdn.com/hsossms/20250730/v2_fd517c465a1c4cf4842e8a649a055fb9@000000_oswg1342379oswg1080oswg810_img_000?)

* Native Sparse Attention: Hardware-Aligned and Natively Trainable Sparse Attention
  Jingyang Yuan, Huazuo Gao, Damai Dai, Junyu Luo, Liang Zhao, et al
  DeepSeek-AI, Peking University

## Workshop

### CoNLL day 1

#### A Continuous Approach to Metaphorically Motivated Regular Polysemy in LMs
Anna Temerko, Marcos Garcia, Pablo Gamallo

* a word’s polysemy structure is largely governed by systematic sense
  alternations that form overarching patterns across the vocabulary. While
  (Apresjan, 1974; Nunberg, 1995; Pustejovsky, 1995)
* psycholinguistic studies confirm the psychological validity of regularity in
  * ie systematic relatedness of senses affects
    how the human mental lexicon is learned, represented, and processed
    (Frisson, 2015; Klepousniotou et al., 2012; Rabagliati and Snedeker, 2013;
    Zhu, 2021)
* in LLMs, this phenomenon remains largely unaddressed.
  * ? models’ sensitivity to systematic sense alternations of polysemous words
  * how LLMs process ambiguity and
    to what extent they emulate representations in the human mind. For this,
* we employ the measures of surprisal and semantic similarity as proxies of
  human judgment on the acceptability of novel senses. We focus on
* two aspects that have not received much attention previously:
  metaphorically motivated patterns and the continuous nature of regularity.  We
* finding
  * surprisal from LMs represents regularity of polysemic extensions in a
    human-like way,
    discriminating between different types of senses and varying regularity
    degrees, and overall strongly correlating with human acceptability scores

#### [An Appraisal Theoretic Approach to Modelling Affect Flow](https://aclanthology.org/2025.conll-1.16/)
in Conversation Corpora
Alok Debnath, Yvette Graham, Owen Conlan

* the multidimensional cognitive model of Appraisal Theory offers significant
  advantages for analyzing emotions in conversational contexts, addressing the
  current challenges of inconsistent annotation methodologies across corpora. To
* we present AppraisePLM,
  a regression and classification model trained on the crowd-EnVent corpus that
  outperforms existing models in predicting 21 appraisal dimensions
  including pleasantness, self-control, and alignment with social norms.
* We apply AppraisePLM to diverse conversation datasets spanning
  task-oriented dialogues, general-domain chit-chat, affect-specific
  conversations, and domain-specific affect analysis. Our analysis reveals that
* AppraisePLM successfully extrapolates emotion labels across datasets, while
  capturing domain-specific patterns in affect flow – change in conversational
  emotion over the conversation. This work highlights the entangled nature of

#### Discussion session - CoNLL community

### XLLM

##### Mark Johnson: The Changing Roles of (Linguistic) Structure in Comp Ling

* Egyelőre a honlapon szereplő absztraktból idézek, bár nem erről beszélt.
* The closest relationship between linguistics and computational linguistics was
  probably with the Unification Grammars introduced in the 1980s, where the
  * goal was to develop a computational model that implemented the ling theory.
  * impractical for scientific and sociological reasons that I’ll describe, and
* the huge training data and long context windows of Deep Learning models makes
  it unnecessary to incorporate any specific linguistically-inspired parsing
  architecture into such models. While
* there are deep scientific questions about how LLMs “understand” human langs,
  their linguistic ability is sufficiently good for most practical tasks. Quite
* most current research focuses on the information content of the language LLMs
  generate, such as reducing hallucinations and improving instruction-following.
* the main opportunities for linguistics to contribute the modern computational
  linguistics are in model evaluation and explainability.

##### Jan Hajič: LLMs and Symbolic Meaning Representations

* there could be still synergies between the linguistically oriented research
  and the standard LLM and/or end-to-end deep learning approach to improve, eg
  LLMs for low-resourced languages as well as for complementing current
  LLM-based applications with explanatory power or interpretation.
* In the talk, I will present
  * current developments in [LLM building in Europe](https://openeurollm.eu/),
  * recent developments on the linguistic front (semantic, or meaning
    representations such as PDT and UMR, and the use of eventive ontologies),
  * unanswered research questions

#### BARTABSA++: Revisiting BARTABSA with Decoder LLMs
Jan et al.

* We revisit the Bartabsa framework for aspect-based sentiment analysis with
  modern decoder LLMs to assess the importance of explicit structure modeling
* Our updated implementation features
  architectural enhancements that boost performance and training stability.
* Systematic testing with various encoder-decoder architectures shows that
  BARTABSA++ with BartLarge achieves SOTA results, even
  surpassing a finetuned GPT -4 O model. Our
* analysis: the encoder’s representational quality is vital, while
  the decoder’s role is minimal,
  explaining the limited benefits of scaling decoderonly LLMs for this task.

#### Structure Modeling Approach for UD Parsing of Historical Modern Japanese
Hiroaki Ozaki, Mai Omura, Komiya Kanako, Masayuki Asahara, and Toshinobu Ogiso

* The structure industry.
* structure modeling for transferability in diachronic syntactic parsing. The
* We compared the zero-shot transfer ability between Transformer-based Biafﬁne
  UD parsers and our structure modeling approach.
* The structure modeling approach is a pipeline method consisting of
  * dictionary-based morphological analysis (MeCab)
  * a deep learning-based phrase (bunsetsu) analysis (Monaka)
  * SVMbased phrase dependency parsing (CaboCha) and a rule-based conversion
    from phrase dependencies to UD.
* This pipeline closely follows the methodology used in constructing Japanese UD
  corpora.
* Experimental results showed that the structure modeling approach outperformed
  * zero-shot transfer from the contemporary to the modern Japanese.
  * several existing UD parsers in contemporary Japanese. To this end, the
  * by a wide margin

## Poster (Main conference)

### [TUBA:](https://arxiv.org/abs/2404.19597)
Cross-Lingual Transferability of Backdoor Attacks in LLMs
with Instruction Tuning

Xuanli He, Jun Wang, Qiongkai Xu, Pasquale Minervini, Pontus Stenetorp,+

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

### [Human-LLM Coevolution:](https://arxiv.org/abs/2502.14718)
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

### [Testing English News Articles for Lexical Homogenization](https://arxiv.org/abs/2505.24731)
Due to Widespread Use of LLMs

Sarah Fitterer, Dominik Gangl, Jannes Ulbrich

* we compare two datasets of English online news articles:  2018 vs 2024
* lexical homogenization measured by the MATTR, Maas, and MTLD metrics, and
* LLM-Style-Word Ratio (SWR) to measure LLM influence. We found
  * higher MTLD and SWR scores, yet
  * negligible changes in Maas and MATTR scores in 2024 corpus. We conclude that

### [A Semantic-Aware Layer-Freezing Approach](https://arxiv.org/abs/2406.11753)
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

### [LLMs as Neurolinguistic Subjects:](https://arxiv.org/abs/2411.07533)
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


### [On the Role of Semantic Proto-roles in Semantic Analysis:
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

### [Task-Informed Anti-Curriculum by Masking Improves Downstream Performance on Text](https://arxiv.org/abs/2502.12953)

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

### [EXECUTE:](https://arxiv.org/abs/2505.17784)
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

### [Small Models, Big Impact:](https://arxiv.org/abs/2502.10140)
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

### [Minimal Pair-Based Evaluation of Code-Switching](https://arxiv.org/abs/2502.10140)

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

### [Global MMLU:](https://arxiv.org/abs/2412.03304) Understanding and
Addressing Cultural and Linguistic Biases in Multilingual Evaluation

Shivalika Singh, Angelika Romanou, Clémentine Fourrier, David I. Adelani,+

* ? practical utility of translated datasets like MMLU.
* translation often introduces artefacts that can distort the meaning or clarity
* large-scale evaluation of SOTA open and proprietary models
  * progress on MMLU depends heavily on learning Western-centric concepts, with
    28% of all questions requiring culturally sensitive knowledge.
  * geographic knowledge, an astounding 84.9% focus on either North American or
    European regions. Rankings of model evaluations change depending on whether
* Global MMLU, an improved MMLU with evaluation coverage across 42 languages --
  * compensated professional and community annotators to verify translation
    quality while also rigorously evaluating cultural biases present in the
  * designated subsets labeled as culturally sensitive and culturally agnostic

### [Middle-Layer Representation Alignment](https://arxiv.org/abs/2412.03304)
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

### [TUMLU:](https://aclanthology.org/2025.acl-long.1112/)
A Unified and Native Language Understanding Benchmark for Turkic

Jafar Isbarov, Arofat Akhundjanova, Mammad Hajili, Kavsar Huseynova,+

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

### [The Hidden Attention of Mamba Models](https://arxiv.org/abs/2403.01590)

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

### [Circuit Stability](https://arxiv.org/abs/2505.24731) Characterizes Language Model Generalization

Alan Sun

* mechanistic interpretability
* we introduce circuit stability as a new way to assess model performance.
  := a model's ability to apply a consistent reasoning process across inputs
* We mathematically formalize circuit stability and circuit equivalence.

### [From Directions to Cones:](https://arxiv.org/abs/2505.24731)
Exploring Multidimensional Representations of Propositional Facts in LLMs

Stanley Yu*, Vaidehi Bulusu*, Oscar Yasunaga, Clayton Lau, Cole Blondin,+

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

### [Limited-Resource Adapters Are Regularizers, Not Linguists](https://arxiv.org/abs/2505.24525)
**Marcell Fekete**, Nathaniel R. Robinson, Ernests Lavrinovics,+

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

### [DenseLoRA: Dense Low-Rank Adaptation of LLMs](https://arxiv.org/abs/2505.24731)
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

### [Culture Matters in Toxic Language Detection in Persian](https://www.arxiv.org/abs/2506.03458)
Zahra Bokaei, Walid Magdy, Bonnie Webber

* we compare different methods for toxic language detection, including
  fine-tuning, data enrichment, zero-shot and few-shot learning, and
  cross-lingual transfer learning
* the impact of cultural context on transfer learning for this task: We show
  that the language of a country with cultural similarities to Persian yields
  better results in transfer learning.
* Warning: This paper contains examples of toxic language that may disturb some
  readers. These examples are included for the purpose of research

### [Can Community Notes Replace Professional Fact-Checkers?](https://arxiv.org/abs/2502.14132)
Nadav Borenstein, Greta Warren, Desmond Elliott, Isabelle Augenstein

* Two strategies to combat misinformation on social media are
  * fact-checking by professional organisations and
  * community moderation by platform users.
* Policy changes by Twitter/X and, more recently, Meta, signal a shift
  away from partnerships with fact-checking organisations and
  towards an increased reliance on crowdsourced community notes. However, the
* ? dependencies between fact-checking and helpful community notes
* we use language models to annotate a large corpus of Twitter/X community notes
  with attributes such as topic, cited sources, and whether they refute claims
  tied to broader misinformation narratives. Our analysis reveals that
* community notes cite fact-checking sources
  up to five times more than previously reported
* ie successful community moderation relies on professional fact-checking and
  * citizen and professional fact-checking are deeply intertwined

### [Unveiling Language-Specific Features in LLMs via Sparse Autoencoders](https://arxiv.org/abs/2505.05111)
Boyi Deng, Yu Wan, Yidan Zhang, Baosong Yang, Fuli Feng

* The mechanisms behind multilingual capabilities in LLMs have been examined
* neuron-based or internal-activation-based methods.
* hE, these methods often face challenges such as
  superposition and layer-wise activation variance, which limit their
* Sparse Autoencoders (SAEs) offer a more nuanced analysis by
  decomposing the activations of LLMs
  into a sparse linear combination of SAE features
* We introduce a novel metric to assess the monolinguality of features obtained
  from SAEs, discovering that
* some features are strongly related to specific languages. Additionally, we
* ablating these SAE features only significantly reduces abilities in one
  language of LLMs, leaving others almost unaffected. Interestingly, we find
* some languages have multiple synergistic SAE features, and
  ie ablating them together yields greater improvement than ablating indiv
* we leverage these SAE-derived language-specific features to enhance
  [steering vectors (Turner+ arxiv)](https://arxiv.org/abs/2308.10248),
  achieving control over the language generated by LLMs

### [ModerBERT](https://arxiv.org/abs/2412.13663) redifines encoders,
with support for long-context & code, strong bechmarks, & sets an efficiency
record
Smarter, Better, Faster, Longer: A Modern Bidirectional Encoder
for Fast, Memory Efficient, and Long Context Finetuning and Inference
Benjamin Warner, Antoine Chaffin, Benjamin Clavié, Orion Weller,+

* Encoder-only transformer models such as BERT: a great perf-size tradeoff
  for retrieval and classification tasks
  with respect to larger decoder-only models.  Despite being the workhorse of
* we: ModernBERT, bringing modern model optimizations to encoder-only models and
* a major Pareto improvement over older encoders.
* Trained on 2 trillion tokens with a native 8192 sequence length, ModernBERT
* SOTA results on a large pool of evaluations encompassing
  diverse classification tasks and
  both single and multi-vector retrieval on different domains (incl code)
* the most speed and memory efficient encoder and is
* designed for inference on common GPUs.

### RomanLens: The Role Of Latent Romanization In Multilinguality In LLMs
Alan Saji, Jaavid Aktar Husain, Thanmay Jayakumar, Raj Dabre,+

* we use mechanistic interpretability techniques, we analyze next-token
  generation and find that
* intermediate layers frequently represent target words in Romanized form
  before transitioning to native script: Latent Romanization.
* activation patching experiments, we demonstrate that
  LLMs encode semantic concepts similarly across native and Romanized scripts,
  suggesting a shared underlying representation. Additionally,
  * activation patching
    (Ghandeharioun+ 2024; Variengien and Winsor, 2024; Chen+ 2024; Dumas+ 2024),
    a technique that replaces activations from one forward pass with another
    to analyze the resulting outputs (c.f. Section 3.3)
* for translation into non-Roman script languages, our findings reveal that when
  the target language is in Romanized form, its representations emerge earlier
  in the model's layers compared to native script. These insights contribute to

### Neural Semantic Parsing with Extremely Rich Symbolic Meaning Representations
Xiao Zhang, Gosse Bouma, Johan Bos

* Egy workshopos fényképem forrását keresve találtam ezt a posztert.
* open-domain neural semantics parsers show impressive performance.
* hE the symbolic meaning representations they produce sometimes merely copy
  character sequences from the source text to form symbolic concepts,
  * defaulting to the most frequent word sense based in the training
* we leverage the hierarchical structure of a lexical ontology, we introduce
* a novel compositional symbolic representation for concepts
  based on their position in the taxonomical hierarchy. This representation
* a neural "taxonomical" semantic parser to utilize this new representation
* a novel challenge set and evaluation metric for evaluation. Our
* experimental findings demonstrate that the taxonomical model, trained on much
  richer and complex meaning representations, is
  slightly subordinate in performance to the traditional model using the
  standard metrics for evaluation, but
  outperforms it when dealing with out-of-vocabulary concepts.

### Generative Pretrained Structured Transformers:
Unsupervised Syntactic LMs at Scale
Xiang Hu, Pengyu Ji, Qingyang Zhu, Wei Wu, Kewei Tu

* A syntactic language model (SLM)
  incrementally generates a sentence with its syntactic tree in a left-to-right
* We present Generative Pretrained Structured Transformers (GPST), an
  unsupervised SLM at scale capable of being pre-trained from scratch on raw
* not relying on gold trees and sequential training. It consists of 
* two components, 
  * a usual SLM supervised by a uni-directional language modeling loss, and an
  * composition model, which
    induces syntactic parse trees and computes constituent representations,
    supervised by a bi-directional language modeling loss. 
* We propose a representation surrogate to enable joint parallel training of the
  two models in a hard-EM fashion. 
* We pre-train GPST on OpenWebText, a corpus with 9 billion tokens, and
  * superiority of GPST over GPT-2 with a comparable size in numerous tasks
    covering both language understanding and language generation.
  * significantly outperforms existing unsupervised SLMs on left-to-right
    grammar induction, while holding a substantial acceleration on training.
