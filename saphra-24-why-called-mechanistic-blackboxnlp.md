Mechanistic?  
Naomi Saphra, Sarah Wiegreffe
BlackboxNLP | WS 2024

but Sharkey+ 25 defines MI in some other way: generalization

# Abstract

* The rise of the term “mechanistic interpretability”
* what does it mean to be mechanistic? We describe 
  four uses of the term in interpretability research.
  * narrowest technical definition requires a claim of causality, while a
  * broader technical definition: any exploration of a model’s internals
  * narrow cultural definition describing a cultural movement. To understand
    * we present a history of the NLP interpretability community and 
      the formation of the separate, parallel mechanistic interpretab community
  * broad cultural definition—encompassing the entire field of interpretability
    * why the traditional NLP interpretability community has come to embrace it.
* We argue that the polysemy of “mechanistic” is 
  the product of a critical divide within the interpretability community

# 1 Intro

* NLP interpretability (NLPI)
* MI narrow cult: a new movement of AI safety researchers, 
  motivated by philosophical arguments for the importance of interpretability,
  * financial and social context of the field now incentivizes NLPI researchers
* we compare it to some similarly vague terms in the history of NLPI (App A).
  * hE mechanistic is notable because it exposes a cultural divide

# 2 So what is mechanistic?

* NLPI researchers occasionally used the term _mechanisms_ to refer to internal
  algorithmic implementation (Belinkov, 2018), as 
  suggested by Marr’s levels of analysis (Marr and Poggio, 1976).
* The earliest uses of _mechanistic interpretability_ also draw on this
* so do most current explicit definitions of the term. What, then, is this
  precise technical meaning?

## 2.1 From causality and psychology to NLP

* Mechanistic interpretability derives its name from causal mechanisms. 
  * In a causal model, 
    a causal mechanism is a function
    governed by “lawlike regularities” (Little, 2004)—that 
    transforms some subset of model variables (causes) 
    into another subset (outcomes or effects). Causal mechanisms are a 
    necessary component of any causal model explaining an outcome 
    (Halpern and Pearl, 2005a,b)
* The narrow technical definition of MI thus describes 
  research that discovers causal mechanisms 
  explaining all or some part of the change from neural network input to output
  at the level of intermediate model representations.
  * eg how an LM can predict “B” from the input sequence “ABABA” using induction
    heads (Olsson+ 2022): attention heads that search for a previous occurrence
    of “A” in combination with other heads that attend to the token that follows
    it. This narrow definition of MI requires causal methods of understanding,
  * excludes those that do not investigate intermediate neural representations,
    * behavioral testing with input-output pairs (eg Ribeiro+ 2020; Xie+ 2022)
    * non-causal methods, such as describing representational structure or
      correlating activation features with particular inputs and outputs.
* Psychology and philosophy have long stressed the importance of causal
  mechanisms in explanations. 
  * Psych studies (Legare and Lombrozo, 2014; Vasilyeva and Lombrozo, 2015): 
  * humans prefer explanations containing causal mechanisms underlying an event
    over Aristotle’s other modes (Lombrozo, 2016) of explanation. 
  * Tan (2022): explanations in machine learning 
    should focus on causal mechanisms linking input and output.
  * Real-world causal models are 
    complex and have many possible pathways to outcomes (Hesslow, 1988);
    complete explanations of such models would be burdensome and
    counterproductive
  ~> explanation requires distillation (Jacovi and Goldberg, 2021). 
  * Human explanations distill by capturing only proximal mechanisms (Lombrozo,
    2006)—those which are closest to, or immed responsible for, the outcome.
* Unlike the human brain, neural networks can be rigorously studied due to 
  * causal interventions on them
  * causal abstraction (Beckers and Halpern, 2019; Beckers+ 2020) for
    distillation: the theory that 
    causal models at higher levels of granularity 
    can be faithful simplifications of the true causal model, and thus 
    serve as mechanistic interpretations of the network (Geiger+ 2024a).
* attempt to bring definitional rigor to MI, recent work in 
  causal interpretability of neural networks has advocated for an 
  even narrower technical definition of MI: 
  explan through a complete end-to-end causal pathway from inputs to outputs 
  via intermediate neural representations (Geiger+ 2021, 2024b; Mueller+ 2024).
  * excludes most early work in MI (§2.2), and has not yet been widely adopted.
  * Induction heads, for example, only describe one compon in the causal pathway
  * one would also need to explain how the model identifies the input “ABABA” as
    a 2-token repeating pattern, and then how the model predicts “B” after
    attending to earlier occurrences of it.

## 2.2 The coinage of mechanistic interpretability

* The term mechanistic interpretability was coined by Chris Olah and 
  * first publicly used in the Distill.pub Circuits thread, 
    a series of blogposts by OpenAI researchers between March 2020–April 2021
  * to “understand the mechanistic implementations of neurons in terms of their
    weights
  * researchers involved in the Circuits thread moved to Anthropic, 
    their subsequent reports leaned into the terminology heavily 
  * term became mainstream.
* Elhage+ 2021: the first explicit definition of MI: 
  “attempting to reverse engineer the detailed computations performed by
  Transformers, 
  similar to how a programmer might try to reverse engineer complicated binaries
  into human-readable source code.” The analogy to reverse engineering, 
  * building on Olah (2015)’s earlier comparisons to code via funct programming
  * Recent definitions, such as that of the ICML 2024 MI workshop (Barez+ 2024),
  use similar wording: 
  “...reverse engineering the algorithms implemented by neural networks 
  into human-understandable mechanisms, 
  often by examining the weights and activations of neural networks 
  to identify circuits ... that implement particular behaviors
  * still implicitly focuses on causal mechanisms (the key technical distinction
  * hE current MI research rarely makes reference to causality.
  * emphasis above on examining weights and activations and the definition’s
    lack of specificity about acceptable methods, 
* many recent works have adopted a broad technical definition of MI to mean 
  any inspection of model internals
  * The minimal overlap between causality and MI has been previously noted
    (Mueller, 2024; Mueller+ 2024)
* This semantic drift may have been inevitable—how could we reverse engineer a
  network without first inspecting its internal components?  However, the
  further generalization of the term to label the output of a community, rather
  than its characteristic approach, was perhaps less inevitable.

# 3 How did we get here? A history of two LM interpretability communities

* MI started as a movement with distinct technical objectives in computer vision
* moved into NLP without engaging the existing community

## 3.1 The nascent field of NLP Interpretability

* NLP researchers published focused analyses of linguistic structure in neural
  models as early as 2016, primarily studying recurrent architectures like LSTMs
  (Ettinger+ 2016; Linzen+ 2016; Li+ 2016; Hupkes+ 2017; Ding+ 2017). The
  * Transformers, which were initially developed for machine translation and
    constituent parsing (Vaswani+ 2017) but rapidly dominated rankings across
    standard NLP tasks (Radford+ 2018, 2019; Devlin+ 2019), drawing 
    * wide interest in understanding how they worked.
* the first BlackBoxNLP workshop (Alishahi+ 2019) was held in 2018 and
  immediately became one of the most popular workshops at any ACL conference.
  * many NLPI researchers had previously struggled to find an audience, 
  * ACL: “Interpretability and Analysis” main conference track in 2020
    (Lawrence, 2020), reflecting the mainstream success of the field.
* the early NLPI field
  * related model behavior to particular components, layers, and geometric
    properties—would be familiar to anyone in the current MI community. Not only
* current research often reinventing their methods and rediscovering their
  findings (§3.2.2), it is also 
  * repeating the same epistemological debates.  These debates pit [megfuttat]
    * correlation against causation, 
    * simple features against complex subnetworks,
    * expressive mappings against constrained interpretations.

## 3.2 Distributional semantics and representational similarity

* Interest in vector semantics exploded in the NLP community after word2vec
  (Mikolov+ 2013a) popularized many approaches to interpreting word embeddings
  (Mikolov+ 2013b,c). 4 
  * These methods, first introduced in distributional semantics (Louwerse and
    Zwaan, 2009; Jurgens+ 2012; Turney, 2012), had previously relied on Latent
    Semantic Allocation (Turney, 2005) or other word representations derived
    from matrix factorization—a class that also, implicitly, includes word2vec
    itself (Levy and Goldberg, 2014).
* The enthusiasm for unigram embedding analysis proved transient, but 
  still influences neural interpretability methods 
  (Ethayarajh, 2019; Reif+ 2019; Hernandez and Andreas, 2021)
  * Emily Reif, A Yuan, M Wattenberg, F B Viegas, A Coenen, A Pearce, B Kim.
    NeurIPS 2019. 
    Visualizing and measuring the geometry of bert. In Advances in Neural
  * Evan Hernandez and Jacob Andreas. CoNLL 2021 
    The lowdimensional linear geometry of contextualized word representations.
* Distributional semantics has generalized to 
  representational similarity methods 
  (Saphra and Lopez, 2019b; Raghu+ 2017; Wu+ 2020) and 
  vector space analogical reasoning has left clear marks on methods like 
  task vectors (Ilharco+ 2023) and 
  steering vectors (Subramani+ 2022; Turner+ 2023).
  * additive properties in representations
    (Marks and Tegmark, 2024; Tigges+ 2023; Arditi+ 2024).
* critics quickly noted that 
  not all interesting properties of word embeddings correlated with downstream
  (RepEval, 2016). Furthermore, 
  * representations were anisotropic and heavily influenced by word frequency
    rather than meaning (Mimno and Thompson, 2017). 
  * These critiques remain salient to modern correlational interpretability
    * including similarity-based metrics (Davari+ 2023).

### 3.1.2 Attention maps

* Attention, originally developed for recurrent machine translation models
  (Bahdanau+ 2015), was rapidly adopted across language tasks. 
  Even before the switch to fully attentional Transformers, attention modules
  * as avenues of explanation (Bahdanau+ 2015; Wang+ 2016). 
  * Yequan Wang, Minlie Huang, Xiaoyan Zhu, and Li Zhao. EMNLP 2016. 
    Attention-based LSTM for aspectlevel sentiment classification. In
* concurrent discovery of both a correlational (Clark+ 2019; Htut+ 2019) and
  causal (Voita+ 2019) relationship between syntax and attention demonstrated
  * attention maps as a window into how Transformer LMs handled complex
    linguistic structure. However, NLPI researchers also identified some
  * hE limitations of attention for interpretability 
    (Serrano and Smith, 2019; Jain and Wallace, 2019; 
    Wiegreffe and Pinter, 2019; Bibal+ 2022). 
  * Some issues have longstanding solutions, such as 
    incorporating the context of the model when computing attention metrics
    (Brunner+ 2020; Kobayashi+ 2020; Abnar and Zuidema, 2020).
  * specific stereotyped behavior attributed to attention heads (Olsson+ 2022)
  * attention patterns presented as input saliency maps 
    (Wang+ 2023; Lieberum+ 2023; Hanna+ 2023)
  * now more frequently with results that are causally validated.

### 3.1.3 Neuron analysis and localization

* localizing concepts in NLP 
  * Early works often associated individual neurons with sentiment, syntax,
    bias, or specific token sequences (Radford+ 2017; Na+ 2019; Bau+ 2019;
    Lakretz+ 2019; Dalvi+ 2019; Durrani+ 2020). 
  * Many such studies validated their findings by using causal interventions,
  * few proposals were causal by design (Sajjad+ 2022). 
* circuits in MI
  * goal similar to NLP: localizing model behaviors to fine-grained components,
  * =  groups of components forming a sub-network that closely (or faithfully)
    replicate the full model’s performance on a fine-grained task 
    (Olah+ 2020; Wang+ 2023)
* Single neuron analysis has been subject to criticism arguing that 
  * it is infeasible to reduce large, complex models to the sum of their parts
    (Antverg and Belinkov, 2022; Sajjad+ 2022). One core problem is
  * polysemanticity: the observation that 
    a single neuron can activate for multiple disparate classes or concepts
    (Olah+ 2020; Mu and Andreas, 2020; Bolukbasi+ 2021). Not only are these
  * concepts can combine nonlinearly according to a sequence’s underlying latent
    structure (Saphra and Lopez, 2020; Csordás+ 2024), making them difficult to
    disentangle and isolate. MI struggles with many of the same neuron analysis
  * resolving polysemanticity (Elhage+ 2022b; Gao+ 2024). One popular method for
    * sparse autoencoder (SAE) (Bricken+ 2023; Cunningham+ 2024), 
      still relies on assumptions of linearity (Park+ 2024; Millidge, 2023) and
      naturally emerging feature sparsity 
      (Saphra and Lopez, 2019a; Puccetti+ 2022; Elhage+ 2023)
    * requires expensive causal validation (Mueller+ 2024)

### 3.1.4 Component analysis and probing

* Probes were first applied in NLPI to extract linguistic information from the
  hidden states of neural models (Ettinger+ 2016; Kádár+ 2017; Shi+ 2016; Adi+
  2017; Hupkes+ 4832017; Belinkov+ 2017a,b; Giulianelli+ 2018). Many early
  papers observed that 
  * lower layers encode local features, echoing findings in computer vision
    (Yosinski+ 2014) and reflecting the classical NLP pipeline (Tenney+ 2019).
  * scrutiny ~exam (Belinkov, 2022) for its lack of proper baselines (Hewitt and
    Liang, 2019) or informative structural constraints (Saphra and Lopez,
    2019b).
* Without proper experiment design, many probing methods appeared to extract
  more information from random embeddings than from trained reprs (Zhang and
  Bowman, 2018; Wieting and Kiela, 2019). To manage
* newer probes 
  * incorporated information complexity (Pimentel+ 2020; Voita and Titov, 2020)
    or 
  * used simple geometric mappings (Hewitt and Manning, 2019; White+ 2021)
* Some designs reflected the model’s own processing (Pimentel+ 2022), as now
  * logit lens (nostalgebraist, 2020; Geva+ 2022; Chuang+ 2024) used widely in
    MI research. However, the logit lens—like other probing methods before it
    * hE largely incomplete causal explanation (Nanda, 2024b; Zhu+ 2024;
      Wiegreffe+ 2024)
* projecting LM hidden states to interpretable subspaces using linear probes.
  * supervised (Li+ 2023; Marks and Tegmark, 2024) or 
  * unsupervised, using an SAE. These methods 
  * inherit many critiques from the classic probing literature, including a lack
    of causal grounding. Recent proposals have therefore 
* argued for: validation by causal interventions for SAEs (Mueller+ 2024),
  echoing previous efforts to validate probed structures (Giulianelli+ 2018;
  Elazar+ 2021)

## 3.2 The beginnings of mechanistic interpretability

how _mechanistic_ historically came to denote 
a cultural split from the previous NLPI community 
in the term’s narrow cultural definition.

### 3.2.1 The historical context of _mechanistic_

* not long ago “machine learning” referred primarily to computer vision
  * at ICML 2020, over 3x as many papers referenced CVPR as any `*`ACL conf
* the dominant interpretability method was gradient-based saliency, which
  highlighted the importance of specific pixels in an input image 
  (Simonyan+ 2014; Bach+ 2015; Springenberg+ 2015; Zintgraf+ 2017; 
  Ribeiro+ 2016; Shrikumar+ 2017)
* NLP researchers (and other ML researchers experimenting on text) 
  * occasionally borrowed saliency methods from computer vision (Karpathy+ 16;
    Li+ 16; Arras+ 16; Lei+ 16; Alvarez-Melis and Jaakkola, 17)
* primarily through representational geometry, attention maps, probing, and
  causal or correlational neuron analysis—all methods employed by the MI
* When Chris Olah first described “mechanistic interpretability” in 2020, then,
  * Machine learning mostly meant image classification and 
  * interpretability mostly meant feature saliency.
  * Olah coined the term to differentiate circuit analysis from saliency methods
    * saliency methods were subject to increasing skepticism at the time
      (Kindermans+ 2016; Adebayo+ 2018; Kindermans+ 2019; Ghorbani+ 2019; Heo+
      2019; Slack+ 2020; Zhang+ 2020).
* The MI paradigm was crucial and novel within computer vision—but the community
  around it didn’t stay in computer vision.

### 3.2.2 Two LM interpretability communities

* researchers migrated
  * As excitement grew around new breakthroughs in NLP and dialogue systems,
    particularly with the rise of powerful Transformer language models such as
    GPT-3+ (Brown+ 2020), many researchers migrated domains. 
  * The Circuits thread itself changed focus from vision to language in 2021
  * induction heads (Olsson+ 2022)
    * before: characterize individual predictable attention heads (Kovaleva+ 19)
    * instead interpret the interaction between pairs of such heads.
  * in NLPI: a direct continuation of the existing field.
* the MI community brought a distinct culture to LM analysis. 
  * They came from outside of NLP or even from outside of ML entirely, often
    drawn by arguments that 
    LMs posed an existential risk which 
    could be tempered by deeper understanding
  * Since 2021, the ML Alignment & Theory Scholars program (MATS), supported by
    the Berkeley Existential Research Initiative, has become a key point of
    entry for new researchers entering the interpretability field from outside
    of machine learning.
  * Until mid-2023, most MI research was shared on blogs or forums such as
    * eg LessWrong and The AI Alignment Forum; on Discord 6 and Slack 7 ; or at
      invite-only workshops (MIT, 2023). 
  * Findings were rarely published on arXiv or in academic venues
    * pub would advance dangerous AI capabilities (Hobbhahn and Chan, 2023),
    * others advocated for more engagement with academics (@typedfemale, 2023).
  * many NLPI researchers were unaware of the MI community growing outside
    traditional research and publication venues.
* As the MI community expanded and largely switched focus to language models,
  technical distinctions became less important than these cultural differences.
  * In his popular guide to the field, Nanda (2022, ref. “The Broader
    Interpretability Field”) avoided a strict technical definition of MI instead
    stating it “feels distinct,” differentiated by its “culture,” “research
    taste,” and epistemics. Attempts to differentiate mechanistic from
    non-mechanistic interpretability quickly became untenable, leading to
    incongruent ontologies.
  * activation patching
    * Nanda (2022) categorized it as MI
    * Meng+ categorized is as non-MI
      * uses activation patching to perform model editing
    * Nanda attributed act patch to Meng+ (2022) 
  * even abandoned the early definitional goal of 
    distinguishing MI from saliency— 
    * gradientbased feature attribution has re-emerged as another tool for MI
      (Nanda, 2023a; Kramár+ 2024).
  * few researchers retain the causal definition today.
  * narrow cultural definition.

### 3.2.3 The clash of communities

* The MI community began publishing in academic conferences 
  (Nanda, 2023b; Nanda+ 2023; Wang+ 2023)
* NLPI community expressed frustration on social media with the MI community’s
  unfamiliarity with LM interpretability work prior to Anthropic’s 2021
  Circuits thread. 
* Belinkov (2023a) argued that one paper “fail[ed] to engage with a large body
  of work on these topics from the past ~5 years,” 
  including direct precedents and improved baselines. 
* Saxon (2023) alluded to a “contingent of people studying LLMs [who] don’t
  meaningfully engage with `*`ACL literature”
* specific work from the MI community was “not new” (Artzi, 2023) or
  “published in the past” (Ravfogel, 2023). 
* Posts often highlighted a tendency to “reinvent” (Andreas, 2023) or
  “rediscover” (Davidson, 2024) existing tools.
* the energy and resources of the growing MI community could not be denied.
* Many NLPI researchers subsequently began to use the term _mechanistic
  interpretability_ to signal their engagement with the MI conversation
  (Nanda, 2024a).

## 3.3 We are all mechanistic now

* Who wouldn’t want to work on mechanistic interpretability? 
  * Students need advisors. 9 
    * Prof. Sasha Rush of Cornell Tech noted, “pre-PhD researchers... [are] most
      excited about... ‘mechanistic interpretability”’ (Rush, 2024).
  * Funders need grant recipients
    * Effective Altruist charities have distributed millions in MI research
      grants (Open Philanthropy; EA Grants; Future of Life Institute).  
* the traditional NLPI community increasingly embraces the term
* the MI community accounts for much of the current growth in interpretability
  (Räuker+ 2023)
  * the term has ceased to distinguish two separate communities and has grown
  * broad cultural definition, encompassing the work of all interpretability
* MI forum posts are often methodologically similar to papers at ACL
* differences in preferred venues
  * ACL and BlackBoxNLP have struggled to engage the MI community, 
    who prefer ML venues and the creation of new workshops (Barez+ 2024)
  * Belinkov, a BlackBoxNLP founder, posted a call for MI researchers 
    to submit to ACL venues (Belinkov, 2023b)
  * BlackBoxNLP 2023 (Belinkov+ 2023) attempted to bridge the gap by inviting MI
    researchers to participate in a panel, where this divide was discussed.
* The traditional NLPI community tends eg to be interested in using 
  * linguistics (Sarti+ 2024; Mohebbi+ 2023; Katinskaia and Yangarber, 2024) and
  * automata theory (Weiss+ 2018, 2021; Merrill+ 2022, 2020, 2024) 
  as analyt tools
  * niche—but growing—in MI.
* training dynamics 
  * characteristic for the MI community
    (Olsson+ 2022; Liu+ 2023; Nanda+ 2023; Zhong+ 2023)
  * nL the NLPI community has also studied this topic 
    (Chiang+ 20; Saphra and Lopez, 19b; Murty+ 23; Chen+ 24; Merrill+ 23)
* circuit at the level of module interactions 
  * MI (Lieberum+ 2023; Marks+ 2024; Merullo+ 2024; Tigges+ 2024; Hanna+ 2024;
    Dunefsky+ 2024)
  * NLPI (Ferrando+ 2024; Ferrando and Voita, 2024).
* Work from Anthropic often becomes an MI focus
  * eg results using SAEs (Bricken+ 2023) inspired a flurry of followup work
    (Templeton+ 2024; Gao+ 2024; Lieberum+ 2024; Belrose, 2024; Rajamanoharan+
    2024a,b; Karvonen+ 2024; Braun+ 2024; Kissane+ 2024; Gorton, 2024;
    Makelov, 2024)—though 
  * nL sparse encoding is another longstanding interest of NLPI 
    (Subramanian+ 2018; Niculae+ 2018; Panigrahi+ 2019; Meister+ 2021; Prouteau+
    2022; De Cao+ 2022; Guillot+ 2023)
* increasing unity in scientific focus. 
  * Some academics connected to the MI community have promoted interest in tools
    from linguistics and cognitive science (Wang+ 2023; Arora+ 2024).
  * Speaker lineups at MI meetings often include longstanding NLPI researchers
    (MIT, 2023; Bau+ 2024; Barez+ 2024). 
  * MI researchers have also begun to engage more deliberately with
    peer-reviewed general ML conferences (Nanda, 2023b), though this effort has
    * not to the specialized NLPI tracks and venues that focus on similar
      objectives and methods
  * A point conceded [admitted] by Neel Nanda, a leading MI researcher
  * The ACL preprint policy was a discouraging factor, but this is fortunately
    * no longer the case (ACL Executive Committee, 2024).

# 4 Conclu

* many MI researchers are also members of the alignment community 
  concerned about catastrophic AI risk, where 
  the value of MI is questioned 
  (Greenblatt+ 2023; Kross, 2023; Segerie, 2023)
* There may come a time when alignment community consensus turns away from MI.
  * many current MI researchers may leave—and so may some generous resources
  * others are likely to continue pursuing our shared objectives. Our
  * communities have much in common: 
    scientific curiosity and a belief that we should understand the tools
   
# App A

* a wider struggle to communicate interpretability research effectively.
  * the “Is attention explanation?” debate 
    (Jain and Wallace, 2019; Serrano and Smith, 2019; Wiegreffe and Pinter,
    2019; Bibal+ 2022; Jain and Wiegreffe, 2023) is a disagreement over 
    whether an explanation must be faithful by definition (Wiegreffe and Pinter,
    2019, sec. 5). 
  * Subsequent work (Wiegreffe and Pinter, 2019; Jacovi and Goldberg, 2020)
    delineated between 
    faithful vs plausible (Herman, 2017), or human-acceptable (Wiegreffe+ 2022),
    explanation. Even the terminology used to describe the 
  * format of textual explanations has been a source of discussion 
    (Jacovi and Goldberg, 2021; Wiegreffe and Marasović, 2021)—such
    * whether “extractive” and “abstractive,” terms borrowed from the
      summarization literature, adequately characterize the difference between
      types of textual explanations.
* _feature_ and _illusion_
  * In the MI literature, there have been terminology overloads or semantic
    disagreements over words like feature and illusion. The term 
  * feature 
    * has been used to describe mono-semantic concept representations of neurons
      derived from SAEs (Mueller+ 2024), though it is 
    * more widely and historically associated with vector representations of
      data (text) that are either manually designed (“feature engineering”) or
      learned by neural networks (Bereska and Gavves, 2024). A debate about
* illusion: subspace activation patching has centered around the meaning of the
  * q1: whether _illusion_ applies to 
    any dimension that becomes clearly causally relevant 
    only when its causal role is tested with an intervention (Makelov+ 2024), or
  * q2: whether such artifacts are a natural—and even explanatory— product of
    the model’s representational geometry, and therefore informative of its true
    structure (Wu+ 2024).
* Terminological disagreements are usually resolved through 
  discourse in shared venues. 
  * The NLPI community’s adoption of the term mechanistic did not follow this
    (§3.3); 
  * its use may give the impression of cohesion and unity, but it masks 
    a deep division which 
    leads to duplicated research efforts and limits shared knowledge. Such
