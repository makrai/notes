A Research Compass for the Acquisition of Thousands of Low-Resource Languages by AI Models via Form-Focused Study and Usage-Based Linguistic Immersion 
Juan Antonio Pérez-Ortiz
MRL 2026 6th Workshop on Multilingual Representation Learning  EMNLP Budapest,

# Abstract

This position paper provides a multifaceted perspective on the challenge of
adapting AI models (notably, large language models, LLMs) to the thousands of
languages spoken worldwide which lack the vast amounts of text necessary for
conventional data-intensive, imitation-based training. The paper explores two
complementary emerging learning paths which are currently underexplored in the
literature: explicit instruction-guided learning from linguistic resources and
implicit acquisition in natural immersion contexts. By synthesizing current
advances and identifying 40 open problems, this study defines an
interdisciplinary research compass for the coming years.

# Forms of Linguistic Knowledge

Explicit knowledge from linguistic resources may
be incorporated in few-shot examples that share
some similarity with the target text—for example,
the paragraph to be translated—, or as an annota-
tion of that text. Without claiming to be exhaustive,
the most relevant ones are described next. 7
* We focus on resources covering substantial numbers of low-resource languages,
  thereby excluding frameworks such as UniMorph (Batsuren+ 2022) or Universal
  Dependencies (Nivre+ 2020) with support for around 200 languages.

## Interlinear Glosses. An interlinear glossed text
is a text formatted so that its morphemes are la-
beled with their grammatical function along with a
translation into a more widespread language. The
format is widely used in linguistics, especially in
grammar books. PolyGloss comprises glosses in
1,800 languages and pre-trained encoder-decoder
models for interlinear glossing (Ginn+ 2026).
Other forms of morphological annotations could
also be considered where available.

## Dictionaries. While grammars establish the
structure, dictionaries act as their lexical counter-
part, materializing abstract rules into concrete sen-
tences. These dictionaries may be monolingual,
bilingual (Merx+ 2024; Jones+ 2023), or
terminological (Bogoychev and Chen, 2023).

## Grammar Books and Textbooks. The content
of grammar descriptions is less structured but un-
doubtedly richer in nuances. As already mentioned
in the introduction, grammar descriptions are avail-
able for a significant number of low-resource lan-
guages. Note, however, that a significant portion
of the existing grammar books (Virk+ 2020)
are either restricted by copyright, or not available
in digital format. Another interesting source of
explicit knowledge are textbooks, which although
less comprehensive than grammar books, usually
include heterogenous forms of linguistic informa-
tion and exercises that may be particularly useful
to reward the LLMs’ learning process.
One of the pioneering works in this area was that
of Tanzer+ (2024), which explored the ability
of LLMs to translate between English and Karas—
a language with no prior digital presence—using
a grammar, a bilingual dictionary of about 2500
entries, and 2000 parallel sentences. The gram-
mar was added to the model’s context, and signif-
icant improvements in translation were observed.
Other subsequent works (Zhang+ 2024a,b;
Hus and Anastasopoulos, 2024; Court and Elsner,
2024; Pei+ 2025; Yang+ 2025; Li+
2026) explored similar techniques and different
low-resource languages.
Of particular concern is the fact that it has been
shown that, when given a grammar description,
LLMs may focus on its parallel examples rather
than on the underlying rules (Aycock+ 2024).
In spite of these observations, other authors (Mar-
monier+ 2025) have documented some use
of linguistic information beyond parallel examples.
In spite of being an enormously promising line of
research, the question of whether LLMs can truly
internalize the grammatical rules of a language
from their descriptions remains open.

## Typological Databases. Large-scale typologi-
cal databases like WALS (Dryer and Haspelmath,
2013) or Grambank (Skirgård+ 2023) system-
atically catalogue hundreds of grammatical features
for thousands of languages (O’Horan+ 2016).
This information may prove useful as a restricted
form of grammar description, capturing underly-
ing linguistic universals that instantiate in concrete
ways across diverse languages.
667Small Amounts of Text. Small amounts of data
in plain text form, 8 usually of high quality (Gu-
nasekar+ 2023; Eldan and Li, 2023), have
proven to be useful for training LLMs for spe-
cific tasks such as machine translation (Garcia
et al., 2023; Maillard+ 2023; Wu+ 2024;
Cahyawijaya+ 2024). In spite of the under-
representation of low-resource languages in the
training datasets for LLMs, the existence of small
quantities of text or multimedia resources is rela-
tively common for many of them. 9 

# 4 Assessment Tasks
In order to evaluate the degree of acquisition
by LLMs of a never-before-seen language, var-
ious tasks can serve as proxies. If translated
data for other downstream tasks exist—which is
rarely the case in low-resource scenarios—one
can test model performance across other complex
problem-solving settings. For instance, Zhang+
(2024b) translated mathematical reasoning prob-
lems into Manchu to assess actual language ac-
quisition. While this provides an empirical, task-
based assessment of comprehension, it presupposes
the availability of translated data for problems that
models are already known to solve reliably in high-
resource languages.

## Machine Translation. Translation to/from a lan-
guage sufficiently represented in the LLM’s train-
ing corpus is probably the most straightforward
measure, as it implies both understanding and gen-
eration capabilities. 10 Measuring translation per-
formance demands evaluation benchmarks that in-
clude the target language. Although some efforts
have been made to create multilingual benchmarks,
they are still scarce with respect to the number of
languages included: FLORES+, 11 SMOL (Caswell
et al., 2025) and BOuQUET (Omnilingual MT
Team+ 2026) are available in 228, 131, and
275 languages, respectively.
8
The BabyLM competition (Warstadt+ 2023; Charp-
entier+ 2025) evaluates teaching LLMs a language from
scratch using developmentally plausible datasets, compara-
ble in volume to the language exposure of a preschooler or a
teenager. However, this amount of text remains out of reach
for most low-resource languages.
9
The thousands of languages without written texts or with
non-digitized ones are a significant exception.
10
Historically, explicit linguistic information has been al-
ready exploited by rule-based (Forcada+ 2011), statis-
tical (Koehn and Hoang, 2007; Birch+ 2007), and non-
LLM-based neural translation systems (Sennrich and Haddow,
2016; Nădejde+ 2017).
11
https://oldi.org/

## Linguistic Acceptability. Linguistic minimal
pairs, such as those in BLiMP (Warstadt+
2020; Jumelet+ 2025), contrast a correct
and an incorrect sentence differing by a single as-
pect, and can be used to evaluate language mas-
tery. Other datasets (Warstadt+ 2019; Zhang
et al., 2024c) also assess linguistic acceptability
with less focus on minimal pairs. Natural language
understanding benchmarks like GLUE (Wang+
2019) might be useful, but their adaptation to new
languages can be challenging.
4 Problems of the Linguistic Olympiads. The

## Linguistic Olympiads 12 are competitions where
students solve carefully crafted linguistic Rosetta
Stone-like puzzles that require analytical reasoning,
pattern recognition, and the application of meta-
linguistic knowledge. The problems often involve
deciphering the structure of an unfamiliar language
based on a small set of related sentences with min-
imal differences and their translation into a well-
known language. These problems are therefore
particularly relevant for evaluating the ability of AI
systems to learn new languages from minimal data.
A number of recent works have compiled datasets
of these problems (Bean+ 2024; Sánchez+
2024; Chi+ 2024) and show limited perfor-
mance of LLMs. However, Sánchez+ (2026) re-
cently reported that one frontier LLM had achieved
Gold medal performance.

## Human Feedback. As noted in Section 2, hu-
man feedback may be crucial for LLM language
acquisition in implicit and explicit paths, serving
as both a learning signal and an evaluation method.

# 5 Ethics in Low-Resource Settings

Ethical considerations are imperative for low-
resource languages to prevent the potential harm to
historically marginalized communities.

## Ethics by Design. The general approach of ethics
by design (IEEE, 2021; European Commission,
2021; Brey and Dainow, 2024) promotes embed-
ding ethical principles into all stages of a research
project—from its very initial conception to data
acquisition, model development, evaluation, and
deployment—, proactively anticipating and miti-
gating potential ethical issues. We assert that this
principle of continuous ethical assessment must be
central to our challenge so that every member of
668
12
https://ioling.org/problems/the research team and every piece of technology de-
veloped are aligned with societal values and respect
the rights and dignity of the linguistic communities
involved. Ethical frameworks (Hagendorff, 2020)
rely on broadly consensual moral values, although
their interpretation, prioritization, and regulatory
contexts may vary or conflict.

## Endangered Languages. A growing body of
literature addresses ethical considerations in
endangered-language fieldwork and computational
linguistics (Rice, 2006; D’Arcy and Bender, 2023).
Works frequently highlight the importance of decol-
onizing research practices (Tuhiwai Smith, 2022;
Riemland, 2026) and prioritizing community in-
volvement (Pérez González, 2020) under apho-
risms such as primum non nocere 13 (Schwartz,
2022) or nothing about us without us (Harbord
et al., 2021). All these recommendations follow the
spirit of higher-level statements of principles such
as the United Nations Declaration on the Rights of
Indigenous Peoples 14 (United Nations, 2007). No-
ticeably, some communities, such as the Māori in
New Zealand, 15 have developed their own ethical
guidelines for researchers.

## Potential Risks and Benefits. Mager+
(2023) surveyed ethical considerations in machine
translation for endangered American languages.
Remarkably, around 30% of respondents believe
machine translation poses dangers, such as increas-
ing Western cultural influence, imposing unwanted
language standardization, revealing sacred knowl-
edge, or contributing to language extinction or mi-
norization. Furthermore, the survey emphasizes
that Western legal views on data ownership and
intellectual property often mismatch community
perspectives. Therefore, extractive practices must
be avoided so communities retain access to their
own linguistic heritage. Conversely, potential ben-
efits are also noted, including facilitating language
learning, language revitalization, promoting digital
inclusion, and preserving cultural heritage.

## Data. Data ethical considerations for low-
resource languages require careful attention, rang-
ing from initial informed consent to final usage.
The CARE principles (Carroll+ 2020) pri-
13
Latin aphorism for “above all, do no harm”.
Article 31 states that “indigenous peoples have the right to
maintain, control, protect and develop their cultural heritage,
traditional knowledge and traditional cultural expressions”.
15
https://data.govt.nz/toolkit/data-ethics/
nga-tikanga-paihere
oritize collective benefit, community authority
over data, responsibility to ensure indigenous self-
determination, and ethics throughout the data life-
cycle. Additionally, repositories should be estab-
lished to store and share low-resource linguistic
data in a safe, robust and sustainable manner over
time. A number of initiatives have been launched
in this direction, such as Living Tongues, 16 Global
Voices, 17 , Archive of the Indigenous Languages of
Latin America (AILLA), 18 or Mozilla Data Collec-
tive. 19

## Culturally-Aware Data. Datasets should be cu-
rated with cultural sensitivity to ensure they reflect
the values, traditions, worldview, and culturally-
specific expressions of the communities involved.
Because language is deeply intertwined with cul-
ture, the mere translation of datasets originally cre-
ated in a different cultural context is insufficient for
accurate representation (Singh+ 2025; Chang
et al., 2026). Currently, Western-centric content
dominates the vast majority of datasets (Duncan
et al., 2024; Wu+ 2025). This knowledge im-
balance propagates to LLMs, aligning them with
the values of WEIRD—western, educated, industri-
alized, rich, and democratic—societies and carry-
ing serious implications for fairness and safety (Liu
et al., 2025). Models may also gratuitously add
indigenous cultural stereotypes that end up exoti-
cizing underrepresented communities (Court and
Elsner, 2024).

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
    1. Architectures and representations Ô
    2. Socio-ethical aspects and communities ² 
    3. Cognitive aspects and interpretability j
  * more specific to the explicit and implicit learning paths
    4. Explicit linguistic data infrastructure õ
    5. Implicit organic language acquisition Ü 

## Tokenization Ô 

* Fixed vocabularies and tokenizers in pre-trained LLMs are sub-optimal for
  unseen languages, severely degrading the word-to-token ratio and overall
  performance (Ahia+ 2023; Edman+ 2025). To circumvent this, emerging
  * tokenizer-free models that dynamically create continuous representations
    from raw bytes (Pagnoni+ 2025) and 
  * universal tokenizers (Abagyan+ 2025) offer promising broad-scope
    alternatives. Additionally, 
  * script uniformization techniques like romanization (Hermjakob+ 2018;
    Purkayastha+ 2023) may improve model performance in new scripts without
    vocabulary expansion. However, since 
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

## Representation of Linguistic Knowledge Ô

The format of the linguistic information provided to the model may impact its
assimilation; for example, 
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

## Data and Language Contamination Ô 

We must distinguish between optimizing performance on a specific language—where
prior exposure is acceptable—and evaluating whether a model can learn a language
from scratch using metalinguistic abilities. For the latter, a sound assessment
requires ruling out not only standard data contamination, but language
contamination itself, as many languages can typically be expected to slip into
LLM training corpora in minimal, yet non-zero proportions, via existing
datasets (Kargaran+ 2024).
* language encryption exist to hide language identity (Khouja+ 2025; Mar-
  monier+ 2025), subtle underlying patterns often remain recognizable to LLMs
  (Cao+ 2023; Handa+ 2025). Also, it is unclear whether models subconsciously
  retain dormant knowledge that is waken up after exposure to examples (Chi et
  al., 2024), highlighting a need for advanced unlearning methods (Choi+
  2024). 
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

## Dialectal Continuum Ô 

Incorporating new low-resource languages into LLMs risks overlooking the
dialectal continuum due to limited data.
* unsupervised creation of latent representations for dialectal varieties. Sub-
  sequently, by simply providing the model with an exemplar prompt, generation
  would be be smoothly steered into a specific dialect’s subspace. This hy-
* language-specific subspaces in multilingual models (Zhao+ 2025d) and
  dialect-specific circuits (Kearney+ 2025), though practitioners must remain
* hE dialectal cues can inadvertently amplify bias or toxicity (Abbas+ 2025).
* OP12 Can LLMs latently learn representations for dialectal varieties from
  unsupervised data?
* OP13 How can explicit linguistic resources detailing the different dialects of
  a language be leveraged to effectively teach the LLM these distinct
  varieties?
* OP14 What is the most effective approach to condition an LLM to generate a
  specific dialectal variety?

## Community Involvement ² 

* Linguistic governance usually operates through 
  a highly diverse, fragmented array of organizations, lacking any centralized
  registry. 
* To facilitate ethical collaboration between 
  speaker communities, field linguists, and technology developers, it is crucial
  to establish an open repository of these diverse contributors from the
  communities. This directory must transcend simple contact information by
  incorporating vital metadata—such as 
  * traditional knowledge labels (Montenegro, 2019)—to 
    explicitly define the cultural and legal protocols governing the
    technological incorporation of a community’s digital heritage, alongside
  * robust third-party endorsement mechanisms to verify legitimacy.
* OP15 Can universal consensus be achieved on a single repository where
  communities, linguists, and researchers collaboratively develop language
  technologies under clear ethical rules?

## Collaboration with Field Linguistics ² 

* Collaboration may be hampered by differing objectives, workflow mismatches,
  and a lack of ethical training among NLP researchers (Gessler+ 2025). Bridging
  * Zariquiey+ (2022): most languages preserved in documentary archives do not
    appear in widely used datasets.
Guided by community-led frameworks (Liu+ 2022; Flavelle and Lachler, 2023),
researchers can leverage 
systematic elicitation techniques (Chelliah and De Reuse, 2011) to collect
relevant linguistic data such as minimal pairs (see Section 4).
* OP16 How can elicitation techniques be adapted to
collect data specifically suitable for LLMs?
* OP17 How to strengthen the collaboration between com-
putational linguists and field linguists?

## Organization of Shared Tasks ² 

Scientific shared tasks may gather multiple teams evaluating techniques for
languages that would otherwise receive little attention. Although the number of
* shared tasks focused on low-resource languages has increased in recent years
  (Pakray+ 2024; Burchell+ 2024; De Gibert+ 2025), they are still relatively
* OP18 How can data be maintained over time to ensure recurrent evaluation of
  LLMs via shared tasks, while at the same time avoiding data contamination?

## Environmental Impact ² 

The environmental impact of training and deploying deep learning models is a
significant concern (Bannour+ 2021; Morrison+ 2024), intensifying calls for
sustainable AI (Bolón-Canedo+ 2024).
Low-resource language communities are often more vulnerable to climate change
and lack sufficient computational infrastructure, making it essential to
evaluate energy consumption, emissions, and water usage (Bannour+ 2021; Li+
2024). This necessitates 
* actively pursuing shorter prompts (Agrawal+ 2025) and 
* smaller models (Galiano-Jiménez+ 2025). Crucially, the emergence of small,
  sub-billion open models capable of solving reasoning tasks (Zhao+ 2025a) may
  enable communities to retain full governance over their linguistic heritage.
* OP19 What are the trade-offs between model size, performance, and
  environmental impact in the context of learning new low-resource languages by
  LLMs?

## [metalinguistic and metacognitive] Capabilities of LLMs j 

* LLMs’ documented struggles with intermediate-level cognitive tasks, such as
  eg applying linguistic knowledge (Yu+ 2025). 
* thinking aloud protocols may help
  * learning from human reasoning verbalizations (Chu+ 2025a; Zheng+ 2025) or
  * prompting models to think aloud themselves (Yu+ 2025)— may help bridge 
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

## Compositionality and Learning j 

Compositionality is a critical factor for LLMs to effectively leverage
information from the scarce data available in low-resource scenarios. However,
this capacity for generalization has been deeply questioned in LLMs in general,
* hE structured reasoning degrades significantly far from the training distri
  (McCoy+ 2023; Zhao+ 2025b).
* integrating neurosymbolic approaches or lightweight training algorithms like
  reinforcement learning may improve generalization capabilities beyond memoriz
  (Nawaz+ 2025; Chu+ 2025b), the severe data scarcity inherent to acquiring a
  new language from limited resources poses fundamental challenges to systematic
  compositionality. Within a 
* continual learning framework, language acquisition from grammar books has been
  shown to benefit from transformer models featuring multiple feedforward layers
  that update at different frequencies, paired with interleaved consolidation
  phases that transfer knowledge from fast-updating components to
  slower-updating ones (Behrouz+ 2026).
* OP23 What is the most effective learning approach for acquiring new linguistic
  knowledge in LLMs?
* OP24 What compositionality metrics are feasible and effective in low-resource
  scenarios?
* OP25 How can these metrics be effectively integrated to enhance the model’s
  underlying compositionality?
* OP26 Even if LLMs lack compositionality completeness, are their metacognitive
  and metalinguistic skills sufficient to develop functional linguistic
  compositionality?

## Interpretability j 

* interpretability techniques for transformer architectures has emerged recently
  (Zhao+ 2024; Ferrando+ 2024). Beyond offering 
  * local clues via feature attribution, 
  * mechanistic interpretability (Sharkey+ 2025) aims to reverse-engineer models
    to uncover the underlying circuits driving their behavior. While
  * traditionally motivated by safety (Bereska and Gavves, 2024), these
  * understanding incontext learning (Zhou+ 2024) and enhancing how models
    assimilate new languages.
  * hE exploring these mechanisms within multilingual models remains underexpld
    (Ferrando and Costa-jussà, 2024; LópezOtal+ 2025; Resck+ 2025)
* OP27 How can interpretability techniques be used to understand and intervene
  language acquisition?
* OP28 Can mechanistic interpretability help identify circuits for language
  consolidation and compositionality?

## Retrieval õ 

Locating specific details relevant for a particular text within rich, free-form
grammar books is challenging given LLMs’ long-context limitations (Liu+ 2024).
* Traditional retrieval augmented generation (Lewis+ 2020) falls short for such
  procedural knowledge, but 
* nL vectorless retrieval based on reasoning (Yao+ 2022; Zhang+ 2025c) may be
  more suitable. Additionally, 
* massive models like mmBERT (Marone+ 2025) provide valuable multilingual
  embeddings to support these architectures when needed.
* OP29 In which cases is retrieval of relevant passages from a grammar book
  better than including the entire grammar in the prompt?
* OP30 How can we retrieve relevant grammar book passages given a partial
  analysis of the target text?
* OP31 Is it better to separate retrieval and application, or to apply
  linguistic rules concurrently during grammar retrieval?

## Digitization õ 

When working with book-form materials such as grammars or dictionaries, re-
sources range from born-digital documents to scanned physical copies; for the
* OCR engines often introduce layout errors and require extensive
  language-specific fine-tuning.
Moreover, rather than extracting raw text from these resources, it is far more
beneficial to obtain structured formats. Current 
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

## Repositories õ 

Preserving linguistic resources for low-resource languages entails conflicts be-
tween governance, centralization, and data permanence. 
* _Centralized_ repositories like 
  Mozilla Common Voice (Ardila+ 2020) or AILLA (Kung and Sherzer, 2013)
  prioritize community governance, 
  ensuring owners retain rights like data erasure. Conversely, 
* decentralized protocols ensure resources survive 
  political changes or vendor failures through immutable storage
* we should promote global initiatives that empower communities to diversify
  data destinations, blending ethical governance with persistent
  decentralization. Finally, 
* physical vaults like the Arctic World Archive 20 offer extreme long-term
  security, which may be crucial for preserving the linguistic heritage
* OP35 What is the best way to preserve the linguistic heritage for
  low-resource languages, balancing community governance, decentralization, and
  data permanence?

## Speech Ü 

Models such as Whisper (Radford+ 2023) show 
strong cross-lingual capabilities, but developing effective representation
* low-resource settings is still a fundamental challenge 
  (Liang and Levow, 2025)
* self-supervised models like HuBERT (Hsu+ 2021) extract discrete tokens
  to interface with text-native LLMs (Nguyen+ 2025), a primary imperative is
* needed: a universal speech recognition system capable of generating zero-shot
  representations without fine-tuning (Zhao+ 2025c). Finally, 
* integrating text-only techniques for unseen language acquisition with
  speech-based information remains a vital alternate track.
* OP36 What are the most effective speech representations for low-resource
  language learning by LLMs?
* OP37 Can a universal speech-to-text system generate accurate representations
  for any low-resource language without fine-tuning?
* OP38 How can text-only unseen language acquisition techniques be effectively
  integrated with speech data?

## Multimodality Ü 

Multimodality, implemented as the integration of vision and speech with lang,
could potentially yield better representations in low-resource settings
(Zhuang+ 2024; Du+ 2022; Cui+ 2025). Although developmentally plausible
(Campbell+ 2024), integrating these modalities into AI models remains chal-
lenging, as 
* the benefits of visual information can often be compensated for with increased
  text data (Hu+ 2024; Alonso+ 2025). While 
* strongly multimodal models are emerging (Xu+ 2025a), 
* hE multimodality will serve only as an alternate research line should primary
  paths encounter unforeseen obstacles.
* OP39 To what extent can multimodal information facilitate low-resource
  language acquisition, and which modality combinations are most effective?

## Human-Model Interaction Ü 

* Traditionally, human involvement in machine learning has centered on 
  * active learning and human-in-the-loop pipelines where 
    * users are largely confined to annotating samples 
      (Zhang+ 2022; Wang+ 2021), 
      occasionally via a dialogue interface (Chhibber and Law, 2021). To
* learning from observation has emerged to learn directly from demonstrations
  without explicit labeling (Burnwal+ 2025). Frameworks for 
* continuous knowledge acquisition, such as 
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
