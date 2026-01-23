Defining a New NLP Playground
Sha Li, Chi Han, Pengfei Yu, Carl Edwards, Manling Li, Xingyao Wang,
  Yi R.  Fung, Charles Yu, Joel R. Tetreault, Eduard H. Hovy, Heng Ji
EMNLP Findings 2023 "Theme Track: LLMs and the Future of NLP" arXiv:2310.20633

# Abstract

* The recent explosion of performance of LLMs has changed the field of NLP
  more abruptly and seismically than any other shift in the 80-year history
* concerns that the field will become homogenized and resource-intensive
* academic researchers, especially PhD students, at a disadvantage
* we define a new NLP playground by proposing 20+ PhD-worthy research dirs
  * covering theoretical analysis, new and challenging problems,
    learning paradigms, and interdisciplinary applications

# 6 NLP+X Interdisciplinary Applications

## 6.1 Human-Centered NLP

* mitigating harms, both allocation and representation (Blodgett+ 2020), to
  social groups using these models must be a core consideration
  * Social bias and stereotypes are a common way for LLMs to materialize these
  * LLMs must be aware of the extra-contextual requirement of abiding by the
    sociocultural norms expected by the user (Fung+ 2023), especially chatbots
* Post-hoc debiasing and improving the social awareness of pretrained LLMs
  * a separate general debiasing step to account for any unintended
    associations stemming from pretraining (Yu+ 2023a; Omrani+ 2023; Yang+
    2023b). Relatively less explored is the
  * complementary requirement of augmenting LLMs with the
    awareness and ability to abide by sociocultural norms. The crux of the
    * recognize what behaviors in its training data are the results of
      sociocultural norms, discover why and when those norms should be
      followed, and how those norms can be followed (ie is it only in a
      specific way or is this a behavior that can be generalized across
      situations?)
* personalization based on the user, particularly for chatbots
  * LLMs have an amazing ability to multiplex behavior based on the language
    context provided in the prompt (Section 2.1), but they do not have the
  * hE the same context or conversation can have differing levels of
    appropriateness depending on the audience
    * bridging the gap between distant users who share similar beliefs to
      decode latent representations (Sun+ 2023)
* multi-dimensional controls for generation (Han+ 2023b), including their
  sentiment, political stance, and moral values

## 6.2 NLP for Science

* One area with the most potential impact from NLP is science
  (Hope+ 2022; Zhang+ 2023)
* extracting actionable information from the literature
  (Hersh & Bhupatiraju, 03; Griffiths & Steyvers, 04; Li+ 16; Wang+ 21), this
* jointly learning natural language and other data modalities in the sci domain
  (Edwards+ 2021; Zeng+ 2022; Edwards+ 2022; Taylor+ 2022)
  * hallucination becomes a strength for discovering new
    molecules (Edwards+ 2022), proteins (Liu+ 2023a), and materials (Xie+ 2023)
* Medicine
  * There are ~ 1033 realistic drug-like molecules (Polishchuk+ 2013)
  * Within these drugs, there are substructures which confer beneficial drug
    properties, and the knowledge about these properties are reported in
    millions of scientif papers
  * hE, existing LLMs are pretrained only from unstructured text
  * inconsistencies in the literature
* domain-knowledge-empowered LLMs include development of a
  * lightweight adapter framework to select and integrate structured domain
    knowledge into LLMs (Lai+ 2023b),
  * data augmentation for knowledge distillation from LLMs in general domain to
    scientific domain (Wang+ 2023g), and
  * tool learning frameworks leveraging foundation models for more complicated
    sequential actions problem solving (Qin+ 2023; Qian+ 2023)

## 6.3 NLP for Education

* eliciting the captured knowledge to generate lesson plans and materials
  * personalizing education and the educational experience with LLMs would al-
* identifying and analyzing gaps in a student’s understanding or learning
  * apart from scoring essays or resps in dims eg fluency or sent struct
  * identifying keyspans
    (Mathias and Bhattacharyya, 2020; Takano and Ichikawa, 2022; Fiacco+ 2022)
    * Sandeep Mathias and Pushpak Bhattacharyya. 2020
      Can neural networks automatically score essay traits?
      Wsh Innovative Use of NLP for Building Educational Applications, p 85–91
    * Shunya Takano and Osamu Ichikawa. 2022
      Automatic scoring of short answers using justification cues estim by BERT
      Wsh Innovative Use of NLP for Building Educational Applications (BEA 2022),
    * James Fiacco, Shiyan Jiang, David Adamson, and Carolyn Rosé. 2022
      Toward automatic discourse parsing of student writing
        motivated by neural interpretation. In Proceedings of the 17th
      Wsh Innovative Use of NLP for Building Educational Applications, BEA 22
  * determine which parts of a freeform submission indicate a gap and
    * associate it with a learning goal provided by the teacher,
      without using specific (and costly to create) goldlabeled responses
    * which portions of the response are written by the student as opposed to
      copied from an AI assistant
      * require a longitudinal view of the student’s ability. Also, we must be
  * rather than simplifying original lesson materials
    (Mallinson+ 2022; Omelianchuk+ 2021), we should invest in using LLMs to
    generate or retrieve materials or scaffolding that help the student

# 7 What We Need

* the stultification of NLP as a mere evaluation optimization endeavor and to
* ML/LLMs not/did produce an engine that could learn languages, translate, answer
  questions, create poetry, and do all the things a child can do
* scale
  * No child needs to read or hear more than half the internet’s English text
  * What reasoning and sensory capabilities do people have that LLMs lack?
  * need for global infrastructures to dramatically scale up computing
    resources, because the open-source models still cannot achieve performance
    comparable to GPT variants (Gudibande+ 2023)
  * deeper thinking about the foundational conceptual models driving our field
* systematically change and refine
  our paper review system and academic success measurements,
  in order to establish a more inclusive research environment
  * long-term, high-risk topics that are crucial for the entire field
  * close collaboration with researchers from other fields, including
    social science, natural science, computer vision,
    knowledge representation and reasoning, and human-computer interaction

# Limitations

# Ethical Considerations

* We do not intend for our proposed positions to be forcefully pedagogical
