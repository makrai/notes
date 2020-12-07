Experience Grounds Language
Y Bisk, A Holtzman, J Thomason, J Andreas, Y Bengio, J Chai, M Lapata,
  A Lazaridou, J May, A Nisnevich, N Pinto, J Turian
arXiv:2004.10151 [cs.CL]

* representational theories, modeling techniques, data collection paradigms,
  and tasks
* parallel tradition of research on the contextual and social nature of lang
* grounding, embodiment, and social interaction
* We describe a brief history and possible progression of how contextual

# 1 Intro

* relationship of language to the broader AI, Cognitive Science, and Linguistic
* what knowledge or concepts are missing from models trained solely on text
* visual, physical, and social commonsense
* LMs
  * are tested in terms of Indep and Identically Distr held-out sets,
  * [should be] queried on points meant to probe the granularity of the distinc
    (Kaushik+ 2020; Gardner+ 2020)
* We posit that the universes of knowledge and experience available to NLP
  models can be defined by successively larger world scopes:
  * from a single corpus to a fully embodied and social context
  * corpus linguistics (Zipf, 1932; Harris, 1954),
    to the formation of the Penn Treebank (Marcus+ 1993), NLP researchers have
  * most current work in NLP operates in the second (internet-scale data)
  * five levels of World Scope

# WS1. Corpus (our past)

* Penn Treebank (Marcus+ 1993) is the canonical example of a
  * sterilized subset of naturally generated language, processed and annotated
* conceptual word representations [Yet fuzzy] have a long history that predates
  * Philosophy (Lakoff, 1973) and linguistics (Coleman and Kay, 1981)
  * information about word meanings in and out of context (Bengio+ 2003;
    Collobert and Weston, 2008; Turian+ 2010; Mikolov+ 2013; McCann+ 2017)
* Hidden Markov Models assigned a class distribution to every word, and that
  * small, syntax-like classes were induced; If the set was
  * large, classes became more semantic
  * structure discarded in favor of larger context windows for better semantics
    * generative approach, Latent Dirichlet Allocation (Blei+ 2003)
  * Latent Semantic Indexing/Analysis (Deerwester+ 1988, 1990; Dumais, 2004),
* connectionism (Pollack, 1987; James and Miikkulainen, 1995):
* tension [between] symbols and distributed representations (Smolensky 1990)
  * alternative representations (Kohonen, 1984; Hinton+ 1986; Barlow, 1989) and
  * composition (Erk and Padó, 2008; Socher+ 2012) span decades of research
* An important parallel discussion centers on the hardware

# WS2. Internet (our present), The Written World

* unstructured, unlabeled, multi-domain, and multilingual data
* in the limit, to everything humanity has ever written
* (whether mono~ or multilingual) has led to substantial advances
* benchmarks (Wang+ 2019a)
* transfer learning enabled by representations in deep models
  * Traditionally, transfer learning relied on [classes i.e. symbols]
  * Embeddings [encompass multiple] lexical senses,
    violating this structural assumption
* [saturation] in terms of data and parameters
* [Mikolov and contextual embeddings] have expanded the notion of
  local context to include multiple sentences
* language modeling—the modern workhorse of neural NLP systems
  * leader boards results make claims to super-human accuracy (Rajpurkar+ 2018)
  * However, in the LAM-BADA dataset (Paperno+ 2016) capture human intuition,
    GPT2 (Radford+ 2019, 1.5B), Megatron-LM (Shoeybi+ 2019, 8.3B), and 
    TuringNLG (Rosset, 2020, 17B) perform within a few points of each other
    * very far from perfect (<68%)
  * expand hardware and data sizes by orders of magnitude is not the path
* meaning, especially
  * semantic relations among words (Fu+ 2014) and
  * inferential relationships among sentences (Wang+ 2018).  The extent to
  * generating locally coherent narratives (Radford+ 2019). On the other hand,
  * pretrained word and sentence representations fail to capture many grounded
    features of words (Lucy and Gauthier, 2017) and sentences, while
  * current NLU systems fail on the thick tail of experience-informed infer
    * such as hard coreference problems (Peng+ 2015)
    * schemes seem to be reaching the point of diminishing returns from data,
* other forms of supervision, such as multimodal perception, will be necessary

# WS3. Perception

* axioms from which to extrapolate. Learned, physical heuristics, such as that
  * e.g. a falling cat will land quietly, are
    abstracted into language metaphors like as nimble as a cat (Lakoff, 1980)
  * forms the basis for how people make entailment and reasoning decisions
* children require grounded sensory input, not just speech, to learn language
  (Sachs+ 1981; O’Grady, 2005; Vigliocco+ 2014)
* auditory input is necessary for understanding sarcasm, stress, and prosody
* tactile senses give meaning, both physical (Sinapov+ 2014; Thomason+ 2016)
  and abstract, to concepts like heavy and soft
* Visual perception is [necessary] (Harnad, 1990)
* frames and scripts
  (Schank and Abelson, 1977; Charniak, 1977; Dejong, 1981; Mooney and Dejong,
  1985)
  * require understanding often unstated sets of pre~ and post-conditions
  * e.g. learn the meaning, method, and implications of painting? (Charniak 77)
  * A web crawl of knowledge from an exponential number of possible how-to,
    text-only guides and manuals (Bisk+ 2020) is misdirected without some
    fundamental referents to ground symbols
* models must be able to watch and recognize objects, people, and activities
  to understand the language describing them
  (Li+ 2019b; Krishna+ 2017; Yatskar+ 2016; Perlis, 2016) 
* history of scripts and grounding (Mooney, 2008), recently
  * the NLP community has played an important role in the
* Computer Vision community. In the last decade, CV researchers have
  * refined and codified “backbone” of computer vision architectures. These
  * lead to parameter efficient models (Tan and Le, 2019) and
  * real time object detection on embedded devices and phones
    (Rastegari+ 2016; Redmon and Farhadi, 2018)
  * We find anecdotally that many researchers in the NLP community still assume
    that vision models tested on the 1,000 class 2 ImageNet challenge are
    limited to extracting a bag of visual words
  * In reality, these architectures are mature and capable of generalizing,
    * from the perspective of engineering infrastructure and that the
    * backbones have been tested against other technologies like self-attention
      (Ramachandran+ 2019). The stability of these
  * architectures allows for new research into more challenging world modeling
    * effects of forces on objects in images Mottaghi+ (2016) predict the
    * reasoning to cause and effect Bakhtin+ (2019) extends this physical
    * scripts and actions Sun+ (2019b,a) model
    * unsupervised concept formation (Bachman+ 2019) also open up research
* CV ... incorporate language signals. Advances in computer vision
  * descendant from image captioning (Farhadi+ 2010; Mitchell+ 2012), a myriad
  * question answering (Antol+ 2015; Das+ 2018)
  * natural language and visual reasoning (Suhr+ 2019b)
  * visual commonsense (Zellers+ 2019a)
  * multilingual captioning and translation via video (Wang+ 2019b) have
  * large-scale, multimodal transformers (Li+ 2019a; Lu+ 2019; Zhou+ 2019)
    without language pretraining,
    for example via conceptual captions (Sharma+ 2018), or further
    * include audio (Tsai+ 2019)
* Semantic level representations emerge from ImageNet classification pretrain
  * class hypernyms. For example, the
    * e.g.person class sub-divides into many professions and hobbies, like
      firefighter, gymnast, and doctor. To differentiate such sibling classes,
    * lower-level charistics like clothing, hair, and typical surroundg scenes
    * allow for pixel level masks and skeletal modeling,
  * zero-shot settings targeting all 20,000 ImageNet categories (Chao+ 2016;
    Changpinyo+ 2017). Modern architectures are flexible enough to learn to
  * general[ize to] class, such as face. For example, facial recognition
* combination of language and vision supervision leads to clear and coherent tx
  * attention can translate parts of an image to words, indicates
  * they truly are learning about language
* Moving forward, we believe benchmarks incorporating auditory, tactile, and
  visual sensory information together with language will be crucial. Such

# WS4. Embodiment

* virtual world, such as a
  * 2D Maze (MacMahon+ 2006)
  * a Baby AI in a grid world (Chevalier-Boisvert+ 2019)
  * Vision-and-Language Navigation (Anderson+ 2018; Thomason+ 2019b)
* the real world (Tellex+ 2011; Matuszek, 2018; Thomason+ 2020; Tellex+ 2020)
* Control and action taking open several new dimensions to understanding and
  actively learning about the world
  * Queries can be resolved via dialog-based exploration (Liu and Chai, 2015),
* e.g. Is an orange more like a baseball or a banana?
  * WS1 [just] that the objects are common nouns that can both be held
  * WS2 may also capture that oranges and baseballs both roll, but is
    * unlikely to capture the deformation strength, surface texture, or sizes
      (Elazar+ 2019)
  * WS3 can begin to understand the relative deformability of these objects,
    * likely to confuse how much force is necessary
      given that baseballs are used much more roughly than oranges
      in widely distributed media
  * WS4 can appreciate the nuanced nature of the question— the orange and
    * baseball share a similar texture and weight allowing for similar manip
    * banana both contain peels, deform under stress, and are edible. We as
* Control is where people first
  * learn abstraction and ... post-conditions through trial and error. The
  * most basic scripts humans learn: moving our own bodies and stacking block
* unlimited supervision from the environment and can learn to
* generalize across plans and actions
* [complex concepts even in] block worlds (Bisk+ 2018) where concepts like
* pre-linguistic category formation within children (Hespos and Spelke 2004)
  * later codified by social constructs
  * children have trouble transferring knowledge from the 2D world of books
    (Barr, 2013) and iPads (Lin+ 2017) to the physical 3D world
* much of the knowledge humans hold about the world is intuitive, possibly
  incommunicable by language, but is required to understand that language. This
  * could be acquired by embodied agents interacting with their environment,
    even before language words are grounded to meanings
* Robotics and embodiment are not available in off-the-shelf manner as vision
  * rapid progress in simulators and commercial robotics, and as language
    researchers we should match these advances at every step. As action spaces
  * complex language instructions in simulated homes (Shridhar+ 2019) or
  * map language to physical robot control (Blukis+ 2019; Chai+ 2018). The last
  * high fidelity simulators for robotics (Todorov+ 2012; Coumans and Bai,
    2016–2019; NVIDIA, 2019; Xiang+ 2020) and the cost and availability of
  * commodity hardware (Fitzgerald, 2013; Campeau-Lecours+ 2019; Murali+ 2019)
  * rapidly developing commodity hardware and sophisticated software that both
    facilitate new research and expect to incorporate language technologies
* Current representations have very limited utility in even the most basic
  robotic settings (Scalise+ 2019), making
* collaborative robotics (Rosenthal+ 2010): custom engineering, not science

# WS5. Social

* in service of real-world cooperation is the prototypical use of language, and
* Smoke and mirrors cleverness, in which
  situations are framed to the advantage of the model, can create the
  [illusion] of genuine content where there is none. This phenomenon has been
  noted countless times, from Pierce (1969) to Marcus and Davis (2019) which
* Interpersonal dialogue is a grand test for AI (Norvig and Russel, 2002), but
  * few to no examples of artificial agents one could imagine socializing
  * just transactional (Bordes+ 2016) or limited game scenarios (Lewis+ 2017)
  * purposefully hollow and fixed (e.g. ELIZA ,Weizenbaum, 1966)
* why socialization is required as the next rung on the context ladder in grond

## Language that Does Something

* philosophy of language has long suggested that function is the
  * Wittgenstein’s “language games” (Wittgenstein, 1953, 1958) and
  * J.L.  Austin’s “performative speech acts” (Austin, 1975). That
  * function is the source of meaning was echoed in linguistics
  * usage-based theory of language acquisition, which suggests that
  * useful constructions are the building blocks for everything else
    (Langacker, 1987, 1991). In recent years, this theory has begun to shed
  * origins [of language] in our species (Tomasello, 2009; Barsalou, 2008)
* what one says can change what people do
  * the ultimate goal for natural language generation
* current, passive way generation is created and evaluated (Liu+ 2016), the
  * change the world ... is the rich learning signal that
  * agent must participate in
    * negotiation (Lewis+ 2017; He+ 2018)
    * collaboration (Chai+ 2017)
    * visual disambig (Liu and Chai, 2015; Anderson+ 2018; Lazaridou+ 2017)
    * providing emotional support (Rashkin+ 2019)
  * all of which require inferring mental states and social outcomes—a key area
    (Zadeh+ 2019) 
* As an example, what “hate” means (Bloom, 2002)
  * what it tells one about the processes operating in the environment
  * toddler’s social experimentation with “I hate you” that gives the word
    weight and definite intent (Ornaghi+ 2011).  In other words, the
  * contrast to the disembodied chat bots
    (Adiwardana+ 2020; Zhou+ 2020; Chen+ 2018; Serban+ 2017), which often do

## Theory of Mind

* people['s] desires and identities, knowledge
* Premack and Woodruff (1978) began to formalize how much the ability to
* aka. “Speaker-Listener” model (Stephens+ 2010), and a rich theory to describe
  comp: Rational Speech Act Model (Frank and Goodman, 2012; Bergen+ 2016)
* [competitions] (Nematzadeh+ 2018; Sap+ 2019) have been introduced. Using
  * problem: spurious patterns (Le+ 2019). Despite
  * increased scores on datasets due to larger models and more complex
    pretraining curricula, it seems
  * unlikely that models understand their listener any more than they
    understand the physical world in which they exist. This disconnect is
  * studies of bias (Gururangan+ 2018; Glockner+ 2018) and techniques like
  * Adversarial Filtering (Zellers+ 2018, 2019b), which elucidate the biases 
* training data [should] offer the discriminatory signals that make the
  hypothesizing of consistent identity or mental states an efficient path
  * lack of inductive bias (Martin+ 2018): it is not clear that any learned
    * arrange narratives along an abstract single-dimension = time, and cau
    * Models learn what they need to discriminate,
      what is learned will generalize (Mitchell, 1980).  Secondly, current
  * cross entropy training losses actively discourage learning the tail of the
    * events that are statistically infrequent are drowned out
      (Pennington+ 2014; Holtzmanet+ 2020)
    * more dynamic evaluations (Zellers+ 2020; Dinan+ 2019), but
* goal: persistence of identity and adaption to change

## Language in a Social Context

* status, role, intention, and countless other variables (Wardhaugh, 2011)
* overlooked by [crowd sourcing] (Zellers+ 2020)
* social cognition (Fiske and Taylor, 1991; Carpenter+ 1998) present in the
  style of utterances and in the social script of the exchange
* evaluation [ require ] situations where artificial agents ...  have enough
  identity to be granted social standing for these interactions 
* Social interaction [signal in NLP]: persuasion related tasks where
  * interpersonal relationships are key (Wang+ 2019c; Tan+ 2016). These initial
  * strained [beszűkíti] by the training-validation-test set scenario, as
* Learning by participation
  * exhibiting different attributes and sending varying signals, the
    sociolinguistic construction of identity (Ochs, 1993) could be examined
    more deeply than ever before, yielding an understanding of social
    intelligence that simply isn’t possible with a fixed corpus. This social
  * the foundation upon which language situates (Tomasello, 2009).  Under-
    standing this social layer is not only necessary, but will make clear
  * complexities around implicature and commonsense that so obviously arise in
    corpora, but with such sparsity that they cannot properly be learned
    (Gordon+ 2018)
  * Once models are commonly expected to be interacted with in [ test],
    probing their decision boundaries for simplifications of reality as in
    Kaushik+ will become trivial and natural
    * Divyansh Kaushik, Eduard Hovy, and Zachary Lipton.  ICLR 2020
      Learning the difference that makes a difference with
      counterfactually-augmented data

# 6 Self-Evaluation

* You can’t learn language
  * from the radio (internet).  WS2 ⊂ WS3
  * from a television.  WS3 ⊂ WS4
    * ie. if the space of actions and consequences can be enumerated
  * by yourself.  WS4 ⊂ WS5

## Where Should We Start?

* expand the semantics of our existing
  (Chen and Mooney, 2008; Feng and Lapata, 2010; Bruni+ 2014; Lazaridou+ 2016),
* task and model design can fail to require sensory percep (Thomason+ 2019a)
* MT in the context of visual (Elliott+ 2016, Elliott and Kádár, 2017)
* machine translation with videos as an interlingua (Wang+ 2019b), and
  * dataset (Regneri+ 2013) which aligns
    text descriptions and semantic annotations of actions with videos. Even
* syntax acquisition informed with visual information. Shi+ (2019) investigate
  * to learn headedness (e.g.  choosing the main verb vs the more common
    auxiliary as the root of a sentence, Bisk and Hockenmaier, 2015)
* language modeling, Ororbia+ (2019) investigate the benefits of visual context 
* Collaborative games have long served as a testbed (Werner and Dyer, 1991) for
  * shared goal, Suhr+ (2019a) introduced a testbed for evaluating NLU in
* simpler visual paradigm for studying pragmatics (Andreas and Klein 2016). A
* emergence of language Lazaridou+ (2018) evolves agents with language that
  aligns to perceptual features of the environment
* resources such as data, code, simulators and methodology for eval multimod
  (Silberer and Lapata, 2014; Bruni+ 2012)
* we [encourage a broader] relationship between meaning and context. We

# Conclusions

* Michael Jordan (AI – the revolution hasn’t happened yet, 2019)
  * bring meaning and reasoning into systems that perform NLP
  * infer and represent causality,
  * develop computationally-tractable representations of uncertainty and
  * develop systems that formulate and pursue long-term goals
* structure in time from which humans draw correlations about long-range causal
  dependencies (Carlson+ 2010)
* drawing analogies to episodic memories,
  gathering a system through non-independent experiments
* history of NLP,
  * trends (Church, 2007),
  * maturation toward a science (Steedman, 2008), and
  * major challenges (Hirschberg and Manning, 2015; McClelland+ 2019),
  * [they and] we provide momentum for a direction many are already heading 
* What tasks, representations, and inductive-biases will fill the gaps?
