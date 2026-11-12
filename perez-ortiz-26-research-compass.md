A Research Compass 
  for the Acquisition of Thousands of Low-Resource Languages by AI Models 
  via Form-Focused Study and Usage-Based Linguistic Immersion 
Juan Antonio Pérez-Ortiz
MRL 2026 6th Workshop on Multilingual Representation Learning  EMNLP Budapest,

# Abstract

* This position paper provides a multifaceted perspective on the challenge of
  adapting AI models (notably, large language models, LLMs) to the thousands of
  languages spoken worldwide which lack the vast amounts of text necessary for
  conventional data-intensive, imitation-based training. The paper explores 
* two complementary emerging learning paths which are currently underexplored in
  * explicit instruction-guided learning from linguistic resources and 
  * implicit acquisition in natural immersion contexts. 
* we synthesizing current advances and identify 40 open problems, this study

# Forms of Linguistic Knowledge

* Explicit knowledge from linguistic resources may be incorporated 
  * in few-shot examples that share some similarity with the target text—for
    example, the paragraph to be translated—, or 
  * as an annotation of that text. 
  * not exhaustively, the most relevant ones are described next.
* We focus on resources covering substantial numbers of low-resource languages,
  thereby excluding frameworks such as UniMorph (Batsuren+ 2022) or Universal
  Dependencies (Nivre+ 2020) with support for around 200 languages.

## Interlinear Glosses. An interlinear glossed text is 

= a text formatted so that its 
morphemes are labeled with their grammatical function along with a 
translation into a more widespread language. The format is 
* widely used in linguistics, especially in grammar books. 
* PolyGloss comprises glosses in 1,800 languages and 
  * pre-trained encoder-decoder models for interlinear glossing (Ginn+ 2026).
* Other forms of morphological annotations could also be considered 
  where available.

## Dictionaries. While grammars establish the structure, 
dictionaries act as their lexical counterpart, 
materializing abstract rules into concrete sentences. These dictionaries may be
* monolingual, bilingual (Merx+ 2024; Jones+ 2023), or 
  terminological (Bogoychev and Chen, 2023).

## Grammar Books and Textbooks. The content of grammar descriptions is 

* less structured but undoubtedly richer in nuances. As already mentioned in
* available for a significant number of low-resource languages. Note, however,
* hE a significant portion of the existing grammar books (Virk+ 2020) are either
  restricted by copyright, or not available in digital format. Another
  * Shafqat Mumtaz Virk, Harald Hammarström, Markus Forsberg, Søren Wichmann.
    LREC 2020. 
    The DReaM Corpus: A Multilingual Annotated Corpus of Grammars for the
    World’s Languages
* textbooks, which although less comprehensive than grammar books, usually
  * heterogenous forms of linguistic information and exercises that 
    may be particularly useful to reward the LLMs’ learning process.
* eg MT from English to Karas
  * Tanzer+ (2024) explored the ability of LLMs 
  * Karas is a language with no prior digital presence—
  * Tanzer' MT used a grammar, a bilingual dictionary of about 2500 entries, and
    2000 parallel sentences. 
    * The grammar was added to the model’s context, and 
    * significant improvements in translation were observed.
* Other subsequent works explored 
  similar techniques and different low-resource languages
  (Zhang+ 2024a,b; Hus and Anastasopoulos, 2024; Court and Elsner, 2024; Pei+
  2025; Yang+ 2025; Li+ 2026) .
* when given a grammar description, LLMs may focus on its parallel examples
  rather than on the underlying rules (Aycock+ 2024).
* Marmonier+ (2025) have documented some use of linguistic information 
  beyond parallel examples.
* an enormously promising line of research, the question of 
* hE whether LLMs can truly internalize the grammatical rules of a language 
  from their descriptions remains open.

## Typological Databases. Large-scale typological databases like 

* eg WALS (Dryer and Haspelmath, 2013) or Grambank (Skirgård+ 2023) 
* systematically catalogue hundreds of grammatical features 
  for thousands of languages (O’Horan+ 2016).
* ie a restricted form of grammar description, capturing underlying linguistic
  universals that instantiate in concrete ways across diverse languages.

## Small Amounts of Text. 

* Small amounts of data in plain text form, usually of high quality 
  (Gunasekar+ 2023; Eldan and Li, 2023), have 
  * proven to be useful for training LLMs for specific tasks such as MT 
    (Garcia+ 2023; Maillard+ 2023; Wu+ 2024; Cahyawijaya+ 2024). 
* or multimedia resources is relatively common for many of the langs
* hE thousands of languages without written texts or with non-digitized ones

# 4 Assessment Tasks

* evaluate the degree of acquisition by LLMs of a never-before-seen language,
  various tasks can serve as proxies. 
* If translated data for other downstream tasks exist—which is 
  * rarely the case in low-resource scenarios—one can test model performance
    across other complex problem-solving settings. For instance, 
* Zhang+ (2024b) translated mathematical reasoning problems into Manchu to
  assess actual language acquisition. While this provides an empirical, task-
  based assessment of comprehension, it presupposes the availability of
* ie for problems that models are already known to solve reliably in
  high-resource languages

## Machine Translation. Translation to/from a language sufficiently
represented in the LLM’s training corpus is probably the most straightforward
measure, as it 
* implies both understanding and generation capabilities. 10 Measuring
* demands evaluation benchmarks that include the target language. Although some
* multilingual benchmarks are still scarce with respect to the number of langs
* FLORES+, SMOL (Caswell+ 2025) and BOuQUET (Omnilingual MT Team+ 2026) are
  * 228, 131, and 275 languages, respectively.

## Linguistic Acceptability. 

* Linguistic minimal pairs, eg those in BLiMP (Warstadt+ 2020; Jumelet+ 2025),
  contrast a correct and an incorrect sentence differing by a single aspect,
  and can be used to evaluate language mastery.
* [non min pair] datasets (Warstadt+ 2019; Zhang+ 2024c) also assess ling accept
* Natural language understanding benchmarks like GLUE (Wang+ 2019) might be
  useful, but their adaptation to new languages can be challenging.

## Problems of the Linguistic Olympiads 12 are competitions where 

* students solve carefully crafted linguistic Rosetta Stone-like puzzles that
  require analytical reasoning, pattern recognition, and the application of
  metalinguistic knowledge. The problems 
* often involve deciphering the structure of an unfamiliar language based on 
* input: a small set of related sentences with minimal differences 
  and their translation into a well-known language.
* particularly relevant for evaluating the ability of AI systems to learn new
  languages from minimal data.
* datasets of these problems (Bean+ 2024; Sánchez+ 2024; Chi+ 2024) and 
* LLMs show limited performance
* nL one frontier LLM had achieved Gold medal performance (Sánchez 2026)

## Human Feedback. As noted in Section 2, human feedback may be crucial 
for LLM language acquisition in implicit and explicit paths, serving as 
both a learning signal and an evaluation method.

# 5 Ethics in Low-Resource Settings

Ethical considerations are imperative for low-resource languages to prevent the
potential harm to historically marginalized communities.

## Ethics by Design

* the approach (IEEE, 2021; European Commission, 2021; Brey and Dainow, 2024)
* ie embedding ethical principles into all stages of a research project—from its
  very initial conception to data acquisition, model development, evaluation,
  and deployment—, proactively anticipating and mitigating potential issues. We
  assert that this principle of continuous ethical assessment must be central to
  our challenge so that every member of the research team and every piece of
  technology developed are aligned with societal values and respect the rights
  and dignity of the linguistic communities involved. 
* Ethical frameworks (Hagendorff, 2020) rely on broadly consensual moral values,
  * hE interpretation, prioritization, and regulatory contexts may vary/conflict

## Endangered Languages. A growing body of literature addresses 

* ethical considerations in endangered-language fieldwork and comput ling
  (Rice, 2006; D’Arcy and Bender, 2023).
* decolonizing research practices (Tuhiwai Smith, 2022; Riemland, 2026) and
* community involvement (Pérez González, 2020) under aphorisms such as 
* aphorisms
  * primum non nocere (Schwartz, 2022) or 
    * Latin aphorism for “above all, do no harm”.
  * nothing about us without us (Harbord+ 2021). All these recommendations
  * follow the spirit of higher-level statements of principles such as the
    United Nations Declaration on the Rights of Indigenous Peoples 14 (UN, 2007)
  * Article 31 states that “indigenous peoples have the right to maintain,
    control, protect and develop their cultural heritage, traditional knowledge
    and traditional cultural expressions”.
* some communities, such as the Māori in New Zealand, 15 have developed their
  own ethical guidelines for researchers.

## Potential Risks and Benefits. Mager+ (2023) surveyed ethical considerations
in machine translation for endangered American languages.
* 30% of respondents believe machine translation poses dangers, such as 
  * eg increasing Western cultural influence, imposing unwanted language
    standardization, revealing sacred knowledge, or contributing to language
    extinction or minorization. Furthermore, the survey emphasizes that
* Western legal views on data ownership and intellectual property often mismatch
  community perspectives. Therefore, 
* extractive practices must be avoided so communities retain access to their own
  linguistic heritage.
* nL potential benefits are also noted, including 
  eg facilitating language learning, language revitalization, promoting digital
  inclusion, and preserving cultural heritage.

## Data. Data ethical considerations for low-resource languages require careful
attention, ranging 
* from initial informed consent to final usage.
* The CARE principles (Carroll+ 2020) prioritize collective benefit, community
  authority over data, responsibility to ensure indigenous selfdetermination,
  and ethics throughout the data lifecycle. Additionally, 
* repositories should be established to store and share low-resource linguistic
  data in a safe, robust and sustainable manner over time. A number of
* initiatives have been launched in this direction, such as 
  Living Tongues, 16 Global Voices, 17, Archive of the Indigenous Languages of
  Latin America (AILLA), 18 or Mozilla Data Collective.

## Culturally-Aware Data. Datasets should be curated with cultural sensitivity

* reflect the values, traditions, worldview, and culturallyspecific
  expressions of the communities involved.
* language is deeply intertwined with culture, the mere translation of
  datasets originally created in a different cultural context is insufficient
  for accurate representation (Singh+ 2025; Chang+ 2026). Currently,
* Western-centric content dominates the vast majority of datasets (Duncan+ 2024;
  Wu+ 2025). This knowledge imbalance propagates to LLMs, aligning them with the
  values of WEIRD—western, educated, industrialized, rich, and
  democratic—societies and carrying serious implications for fairness and safety
  (Liu+ 2025). Models may also gratuitously add indigenous cultural stereotypes
  that end up exoticizing underrepresented communities (Court and Elsner, 2024).

# 6 Challenges and Open Problems

* This section presents a multifaceted approach to the challenges of
  second-language acquisition by AI models as described in the prev sections,
  * emphasis on the explicit learning path, which is in 
    a slightly more advanced stage of development than the implicit one. A wide
    range of heterogeneous, yet interconnected, fronts that influence the
    development of these systems is explored. We assume that, given data
* mostly operate in an in-context learning regime on pre-trained LLMs. Moreover,
  a comprehensive series of open problems ( OP ) is posited, which suggests
  potential avenues for investigation in areas still far from definitive
  solutions. While some of these open questions are studied with different
  degrees of maturity in other areas of NLP, they remain insufficiently explored
  in our setting.
* five thematic clusters, each associated with a distinct symbol for visual ID
  * more general and transversal
    1. Architectures and representations 🏗️
    2. Socio-ethical aspects and communities 🤝 
    3. Cognitive aspects and interpretability 🧠
  * more specific to the explicit and implicit learning paths
    4. Explicit linguistic data infrastructure 🗂️
    5. Implicit organic language acquisition 🌱 

## Tokenization 🏗️ 

* Fixed vocabularies and tokenizers in pre-trained LLMs are sub-optimal for
  unseen languages, severely degrading 
  the word-to-token ratio and overall performance (Ahia+ 2023; Edman+ 2025)
  * tokenizer-free models that dynamically create continuous representations
    from raw bytes (Pagnoni+ 2025) and 
  * universal tokenizers (Abagyan+ 2025) offer promising broad-scope
    alternatives
  * script uniformization techniques like romanization (Hermjakob+ 2018;
    Purkayastha+ 2023) may improve model performance in new scripts 
    without vocabulary expansion
    * hE standard romanization often incurs irreversible information loss,
  * designing automatic, lossless reversible encoding schemes (Zhuang+ 2025)
    remains a critical avenue for future work.
* OP1 What is the best way to adapt to an existing tokenizer when
  incorporating a new unseen language?
* OP2 Is it possible to define a minimal set of tokens that covers thousands of
  languages and provides an effective word-to-token ratio for all? Would model
  providers be willing to include these tokens in their models?
* OP3 Is romanization a good strategy to deal with new scripts? Is it better to
  completely replace the original script or to complement it? Can reversible
  romanization schemes be automatically defined for any language?

## Representation of Linguistic Knowledge 🏗️

* The format of the linguistic information provided to the model 
* eg grammatical rules in pseudocode may prove more effective than those
  expressed in natural language (Zhang+ 2025a). 
* Structured formats also influence 
  * chain-of-thought explanations and 
  * knowledge consolidation in external episodic memories 
    (Wang+ 2024; Fountas+ 2024; Zhang+ 2025b)
* curriculum learning, where the model is progressively exposed to increasingly
  complex linguistic information (Zhu+ 2025; Choi+ 2025).
* OP4 How can an LLM be effectively instructed to apply knowledge extracted from
various linguistic resources?  
* OP5 What is the influence of the data format on AI models’ capacity to acquire
new languages?

## Data and Language Contamination 🏗️ 

* We must distinguish between 
  * optimizing performance on a specific language—where prior exposure is OK
  * evaluating whether a model can 
    learn a language from scratch using metalinguistic abilities. For the
    * a sound assessment requires ruling out 
      not only standard data contamination, but language contamination itself,
      as many languages can typically be expected to slip into LLM corpora in
      minimal, yet non-zero proportions, via existing datasets (Kargaran+ 2024).
* language encryption to hide language identity (Khouja+ 2025; Marmonier+
  2025), 
  * hE subtle underlying patterns often remain recognizable to LLMs (Cao+ 2023;
    Handa+ 2025). Also, it is unclear whether models 
  * LLM may subconsciously retain dormant knowledge that is 
    waken up after exposure to examples (Chi+ 2024), highlighting a 
  * need for advanced unlearning methods (Choi+ 2024). 
* Data contamination detection and mitigation (Dong+ 2024) are crucial to ensure
  the methodologies can be extrapolated to completely new languages.
* OP6 What is the optimal strategy for providing easily accessible evaluation
  benchmarks while minimizing the risk of data or language contamination?
* OP7 Does optimal evaluation necessitate a centralized entity that exclusively
  and privately hosts the data or can a truly decentralized approach be
  implemented?
* OP8 How can we measure the degree of prior knowledge of a language in an
  LLM?
* OP9 How can this prior knowledge be unlearned without damaging the other
  capabilities of the model?
* OP10 Which obfuscation techniques do not leave recognizable lexical or
  structural patterns that can be exploited by the model?
* OP11 How can we measure the dormant latent knowledge of a language in a
  model?

## Dialectal Continuum 🏗️ 

* Incorporating new low-resource languages into LLMs 
  risks overlooking the dialectal continuum due to limited data.
* unsupervised creation of latent representations for dialectal varieties. 
  * Subsequently, by simply providing the model with an exemplar prompt,
    generation would be be smoothly steered into a specific dialect’s subspace.
* language-specific subspaces in multilingual models (Zhao+ 2025d) and
  dialect-specific circuits (Kearney+ 2025)
* hE dialectal cues can inadvertently amplify bias or toxicity (Abbas+ 2025).
* OP12 Can LLMs latently learn representations for dialectal varieties from
  unsupervised data?
* OP13 How can explicit linguistic resources detailing the different dialects of
  a language be leveraged to effectively teach the LLM these distinct
  varieties?
* OP14 What is the most effective approach to condition an LLM to generate a
  specific dialectal variety?

## Community Involvement 🤝 

* Linguistic governance usually operates through 
  a highly diverse, fragmented array of organizations, lacking any centralized
  registry. 
* To facilitate ethical collaboration between 
  speaker communities, field linguists, and technology developers, it is 
  * crucial: an open repository of these diverse contributors from the community
    * This directory must transcend simple contact information by incorporating
      vital metadata—such as 
  * traditional knowledge labels (Montenegro, 2019)—to 
    explicitly define the cultural and legal protocols governing the
    technological incorporation of a community’s digital heritage
  * robust third-party endorsement mechanisms to verify legitimacy.
* OP15 Can universal consensus be achieved on 
  a single repository where communities, linguists, and researchers
  collaboratively develop language technologies under clear ethical rules?

## Collaboration with Field Linguistics 🤝 

* Collaboration may be hampered by differing objectives, workflow mismatches,
  and a lack of ethical training among NLP researchers (Gessler+ 2025)
  * Zariquiey+ (2022): most languages preserved in documentary archives do not
    appear in widely used datasets.
* Guided by community-led frameworks (Liu+ 2022; Flavelle and Lachler, 2023),
  researchers can leverage 
  systematic elicitation techniques (Chelliah and De Reuse, 2011) to collect
  relevant linguistic data such as minimal pairs (see Section 4).
* OP16 How can elicitation techniques be adapted to
collect data specifically suitable for LLMs?
* OP17 How to strengthen the collaboration between com-
putational linguists and field linguists?

## Organization of Shared Tasks 🤝 

* Scientific shared tasks may gather multiple teams evaluating 
  techniques for languages that would otherwise receive little attention
* shared tasks focused on low-resource languages has increased in recent years
  (Pakray+ 2024; Burchell+ 2024; De Gibert+ 2025)
* OP18 How can data be maintained over time to ensure recurrent evaluation of
  LLMs via shared tasks, while at the same time avoiding data contamination?

## Environmental Impact 🤝 

* The environmental impact of training and deploying deep learning models is a
  significant concern (Bannour+ 2021; Morrison+ 2024), intensifying calls for
  sustainable AI (Bolón-Canedo+ 2024).
* Low-resource language communities are 
  often more vulnerable to climate change and lack sufficient compute
  * essential to evaluate energy consumption, emissions, and water usage
    (Bannour+ 2021; Li+ 2024)
* actively pursuing shorter prompts (Agrawal+ 2025) and 
* smaller models (Galiano-Jiménez+ 2025)
  * sub-billion open models capable of solving reasoning tasks (Zhao+ 2025a) 
    may enable communities to retain full governance over their ling heritage.
* OP19 What are the trade-offs between model size, performance, and
  environmental impact in the context of learning new low-resource languages by
  LLMs?

## [metalinguistic and metacognitive] Capabilities of LLMs 🧠 

* LLMs’ documented struggles with intermediate-level cognitive tasks, such as
  eg applying linguistic knowledge (Yu+ 2025). 
* thinking aloud protocols may help
  * learning from human reasoning verbalizations (Chu+ 2025a; Zheng+ 2025) or
  * prompting models to think aloud themselves (Yu+ 2025)
* computational argumentation (Ruiz-Dolz+ 2025) offers unexplored potential to
  optimize metalinguistic reasoning capabilities 
  by rewarding the generation of consistent argumentative units (Sanayei+ 2025).
* OP20 Can we leverage computational argumentation techniques to enhance the
  reasoning in LLMs?
* OP21 Are some types of linguistic resources more suitable for certain
  reasoning or agent-based models?  Can thinking aloud protocols improve the
  metalinguistic and metacognitive skills of LLMs?
* OP22 Can thinking aloud protocols improve the metalinguistic and
  metacognitive skills of LLMs?

## Compositionality and Learning 🧠 

* Compositionality is a critical factor for LLMs to effectively 
  leverage information from the scarce data available in low-resource scenarios.
* hE capacity for generalization has been deeply questioned in LLMs in general
* structured reasoning degrades significantly far from the training distri
  (McCoy+ 2023; Zhao+ 2025b).
* integrating neurosymbolic approaches or 
  lightweight training algorithms like reinforcement learning 
  may improve generalization capabilities beyond memoriz (Nawaz+ 2025; Chu+
  2025b), the 
* continual learning framework, language acquisition from grammar books benefits
  from transformer models featuring 
  multiple feedforward layers that update at different frequencies, paired with
  interleaved consolidation phases that transfer knowledge from fast-updating
  components to slower-updating ones (Behrouz+ 2026).
* OP23 What is the most effective learning approach for acquiring new linguistic
  knowledge in LLMs?
* OP24 What compositionality metrics are feasible and effective in low-resource
  scenarios?
* OP25 How can these metrics be effectively integrated to enhance the model’s
  underlying compositionality?
* OP26 Even if LLMs lack compositionality completeness, are their metacognitive
  and metalinguistic skills sufficient to develop functional linguistic
  compositionality?

## Interpretability 🧠 

* interpretability techniques for transformer architectures has emerged recently
  (Zhao+ 2024; Ferrando+ 2024). Beyond offering 
  * local clues via feature attribution, 
  * mechanistic interpretability (Sharkey+ 2025) aims to reverse-engineer models
    to uncover the underlying circuits driving their behavior
  * traditionally motivated by safety (Bereska and Gavves, 2024), these
  * understanding incontext learning (Zhou+ 2024) and enhancing how models
    assimilate new languages.
  * hE exploring these mechanisms within multilingual models remains underexpld
    (Ferrando and Costa-jussà, 2024; LópezOtal+ 2025; Resck+ 2025)
* OP27 How can interpretability techniques be used to understand and intervene
  language acquisition?
* OP28 Can mechanistic interpretability help identify circuits for language
  consolidation and compositionality?

## Retrieval 🗂️ 

* Locating specific details relevant for a particular text 
  within rich, free-form grammar books is 
  challenging given LLMs’ long-context limitations (Liu+ 2024).
* Traditional retrieval augmented generation (Lewis+ 2020) 
  falls short for such procedural knowledge, but 
* nL vectorless retrieval based on reasoning (Yao+ 2022; Zhang+ 2025c) 
  may be more suitable
* massive models like mmBERT (Marone+ 2025) provide valuable 
  multilingual embeddings to support these architectures when needed.
* OP29 In which cases is retrieval of relevant passages from a grammar book
  better than including the entire grammar in the prompt?
* OP30 How can we retrieve relevant grammar book passages given a partial
  analysis of the target text?
* OP31 Is it better to separate retrieval and application, or to apply
  linguistic rules concurrently during grammar retrieval?

## Digitization 🗂️ 

* book-form materials such as grammars or dictionaries:
  born-digital documents vs scanned physical copies
* OCR engines often introduce layout errors and require extensive
  language-specific fine-tuning.
* goal: obtain structured formats
* document reading models (Cui+ 2026) 
  understand textual layout and spatial context, making them ideal for
  systematically labeling distinct linguistic elements
* OP32 How can image-to-markdown document reading models be adapted to
  structurally digitize linguistic resources such as grammars books or
  dictionaries?
* OP33 Is it possible to develop a universal one-size-fitsall model that can
  handle the different layouts of all the existing linguistic materials?
* OP34 Can document reading models effectively process pages in new scripts and
  languages?

## Repositories 🗂️ 

* Preserving linguistic resources for low-resource languages entails 
  conflicts between governance, centralization, and data permanence. 
* _Centralized_ repositories like 
  Mozilla Common Voice (Ardila+ 2020) or AILLA (Kung and Sherzer, 2013)
  prioritize community governance, 
  ensuring owners retain rights like data erasure
* decentralized protocols ensure resources survive 
  political changes or vendor failures through immutable storage
* we should promote global initiatives that empower communities to diversify
  data destinations, blending ethical governance with persistent
  decentralization
* physical vaults like the Arctic World Archive offer extreme long-term secu,
  * may be crucial for preserving the linguistic heritage
* OP35 What is the best way to preserve the linguistic heritage for
  low-resource languages, balancing community governance, decentralization, and
  data permanence?

## Speech 🌱 

* Models such as Whisper (Radford+ 2023) show 
  strong cross-lingual capabilities
* low-resource settings is still a fundamental challenge 
  (Liang and Levow, 2025)
* self-supervised models like HuBERT (Hsu+ 2021) extract discrete tokens
  to interface with text-native LLMs (Nguyen+ 2025)
* needed: a universal speech recognition system capable of generating zero-shot
  representations without fine-tuning (Zhao+ 2025c)
* integrating text-only techniques for unseen language acquisition with
  speech-based information remains a vital alternate track.
* OP36 What are the most effective speech representations for low-resource
  language learning by LLMs?
* OP37 Can a universal speech-to-text system generate accurate representations
  for any low-resource language without fine-tuning?
* OP38 How can text-only unseen language acquisition techniques be effectively
  integrated with speech data?

## Multimodality 🌱 

* Multimodality, implemented as the integration of vision and speech with lang,
  could potentially yield better representations in low-resource settings
  (Zhuang+ 2024; Du+ 2022; Cui+ 2025). Although 
* integrating these modalities into AI models is developmentally plausible
  (Campbell+ 2024)
* hE the benefits of visual information can often be compensated for with more
  text data (Hu+ 2024; Alonso+ 2025). 
* strongly multimodal models are emerging (Xu+ 2025a), 
* hE multimodality will serve only as an alternate research line 
  should primary paths encounter unforeseen obstacles.
* OP39 To what extent can multimodal information facilitate low-resource
  language acquisition, and which modality combinations are most effective?

## Human-Model Interaction 🌱 

* Traditionally, human involvement in machine learning has centered on 
  * active learning and human-in-the-loop pipelines where 
    * users are largely confined to annotating samples 
      (Zhang+ 2022; Wang+ 2021), 
      occasionally via a dialogue interface (Chhibber and Law, 2021)
* learning from observation has emerged to learn directly from demonstrations
  without explicit labeling (Burnwal+ 2025)
* continuous knowledge acquisition
  eg crystallization of knowledge (Zhang, 2026), increasingly 
  rely on agentic memory architectures 
  to organize, retrieve, and iteratively refine experiential lessons over time
  (Wu+ 2026; Xu+ 2025b; Hu+ 2026b)
* these dynamic memory substrates are essential for models to acquire a 2nd lang
  * hE the implication of human interaction in this task remains in an embryonic
  stage.
* OP40 How can LLMs harness observational learning, curiosity and interactive
  human teaching to facilitate low-resource language acquisition through
  immersion?
