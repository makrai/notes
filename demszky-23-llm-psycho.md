                   Using large language models in psychology
     Dorottya Demszky, D Yang, DS Yeager, CJ Bryan, M Clapper, S Chandhok,
    JC Eichstaedt, C Hecht, J Jamieson, M Johnson, M Jones, D Krettek-Cobb,
       L Lai, N JonesMitchell, DC Ong, CS Dweck, JJ Gross, JW Pennebaker
            Nature Reviews Psychology volume 2, pages 688–701 (2023)

# Abstract

* Large language models (LLMs),
  such as OpenAI’s GPT-4, Google’s Bard or Meta’s LLaMa
* language data have a central role in all areas of psychology
* we review the foundations of LLMs
* LLMs
  * effectively generate human-like linguistic output
    without the ability to think or feel like a human
  * have the potential to advance psychological measurement, experimentation
    and practice
  * not yet ready for many of the most transformative psychological applics —
    * further research and development may enable such use
* four major concerns about the application of LLMs to psychology + overcome
* recommendations for investments that could help to address these concerns:
  * field-initiated ‘keystone’ datasets
  * increased standardization of performance benchmarks
  * shared computing and analysis infrastructure
    to ensure that the future of LLM-powered research is equitable

# Introduction

* Language is a core aspect of all areas of psychological science
  * the means through which children form mental models of the world
    (developmental psychology)
  * These mental models are revealed through verbal explanations of events
    (cognitive psychology)
  * interactions (social psychology)
  * reveal disordered mental models that could be targeted by treatments
    (clinical psychology)
  * communicate emotions and guide emotion regulation strategies
    (affective psychology)
    * implications for physical and mental well-being (health psychology)
  * Individual differences in traits are expressed in spoken and written styles
    * such as agreeableness, extraversion or narcissism
    (personality psychology)
  * Finally, research is conveyed through text in scholarly papers, which then
    * systematic reviews (metascience)
* history of NLP for psychology
  * humans counting words in text, starting in the 1960s 1,2
  * latent semantic analysis in the 1990s 3,4
  * analysis of text on the internet 5,6,7,8 in the 2010s
  * the Linguistic Inquiry and Word Count program 9
    * frequency of occurrence of different categories of words
    * predict outcomes such as physical and psychological health
* topic modelling, which uncovers themes in documents by analysing word
  co-occurrence patterns (via Latent Dirichlet allocation 10)
* [generative] LLMs, such as OpenAI’s generative pre-trained transformer (GPT)
  models 11,12, Google’s LaMDA and Bard AI13 (which can both generate and score
  text in human-like ways), will probably push the field in new directions
* LLMs are massive statistical models that predict the next word
  * go beyond popular word-counting bag-of-words methods (such as LIWC)
    * meaning in context, rather than assuming that words have a static meaning
    * context of words (topic, register, style, sarcasm or metaphor) influences
  * trained on an unprecedented amount and variety of text, including 100 Bs of
    utterances from online digital sources, such as web pages, books,
    magazines, social media, Wikipedia and online forums 11,12
    * LLMs can measure subtle, context-dependent expressions of mental states,
      generate text that is human-like, synthesize information from a wide
      range of sources, engage in natural dialogue and simulate different
      linguistic styles and personas
* potentially broad 0-shot applications of LLMs across diverse areas of psycho
  * query people’s mental models of themselves and their environments
    (social and cognitive psychology)
  * infer individual differences in coping styles (personality psychology), or
  * help people to reappraise stressful experiences
    (affective and clinical psychology)
  * GPT output was generated in March 2023 using text-davinci-003 in the OpenAI
    playground with default settings (temperature 0.7, length 256)
* use cases across subfields in measurement, experimentation, and practice
  * measurement: probe psychological patterns in massive bodies of text
  * experimentation: to rapidly generate stimuli and responses to those stimuli
    to improve the granularity of factorial designs
  * practice: to simulate realistic conversations to train human therapists,
    counsellors, teachers or managers
  * tab 1: We generated these use cases by consulting experts in several areas
    * how LLMs could make their work more efficient or wholly different. These
  * actually
    * the public rushed to use LLMs such as ChatGPT for mental health screening
      and therapy 16, and
    * 40% of US teachers were using ChatGPT weekly for lesson planning
      just three months after its public release 17
      — a nationally representative survey found
* question: whether — and on what timescale — the field will apply a nuanced
  understanding of LLM technology to developing and disseminating tools

# Conceptual and methodological foundations

* how LLMs work, and what this information means for psychology

## Box 1 Tools to use LLMs with minimal expertise

* hE incorrect defaults might be used. In addition, the field is changing
* might be outdated by the time this paper is published

### APIs and online interfaces

* tend to be accessible to users with no technical background. For example,
* no worry about the computational needs required for hosting and serving LLMs
* disadvantages
  * limited customization, transparency, and in many instances, financial cost
  * not allow for fine-tuning (only prompt-tuning) and the
  * input format is currently limited to text written in a box (for example,
    users cannot upload a file with multiple variables). Although some APIs do
  * not allow users to inspect the models’ parameters, which can be important
  * paywall

### Downloading and hosting models

* when smaller LLMs are sufficient and when data security and control over the
  models is a high priority. Having more control means
* more room for customization, evaluation of ‘black box’ model parameters,
  greater data privacy and, in some cases, decreased costs. Technical expertise
  might become less of a barrier to working with downloaded models owing to the
  development of easy-to-use packages and libraries (see below)
* hE the most powerful models are not downloadable or are only accessible via
  APIs such as OpenAI’s ChatGPT
* Hosting large models can incur large costs and hardware requirements. LLMs
  * need access to graphical processing units (GPUs) or tensor processing units
    during model training and application. These types of processors are
    particularly well suited to the underlying computations of
    transformer-based models. They require fairly large amounts of memory to
    operate. Smaller LLMs (BERT, RoBERTa, GPT-2), which perform well for many
    measurement tasks, can be implemented with fewer resources, some only with
    a regular laptop
* free platforms, such Google Colab (a cloud-hosted Jupyter notebook for Python
  code) that provide access to basic GPUs that can be used to work with
  pre-trained LLMs

### Useful software packages and libraries

* programming language
  * R: Fully pre-trained, off-the-shelf LLMs can be used in a browser or
    accessed through an R package (for example, text)
  * Python: Deeper engagement with language models might require work with
    Python libraries, such as Hugging Face.  These are becoming easier to use
* DLATK
  * A good trade-off between complexity and the range of possible applications
  * open-source Differential Analysis ToolKit (DLATK). This is
  * a Linux-based library that provides a user-friendly interface to many NLP
    Python libraries, including those that provide access to LLMs 113
* LLMs have already become integrated in products such as Google Sheets
  (eg SheetGPT.ai), and we anticipate that LLMs will become increasingly more
  accessible to the consumer through intuitive interfaces
* Example Python packages include:
  * openai: a Python interface over OpenAI’s API endpoints
  * DLATK: a human text analysis package written in Python that
    * supports transformer-based models from Hugging Face + other models
  * langchain: a Python framework to develop LLM-powered applications, which
    * supports various LLMs, including open-source models hosted in HuggingFace
  * chainlit
    * a Python framework that uses langchain to build ChatGPT-like LLM apps
* Example R packages include:
  * TheOpenAIR: an R package to integrate OpenAI’s GPT models into R workflows
  * askgpt: another R package built around OpenAI APIs to access the GPT models in R
  * reticulate: a Python interface written in R that
    * allows us to import Python modules and call functions, which
      can be used to work with LLaMA and other LLMs, and langchain
  * gptstudio and gpttools: RStudio add-ins that incorporate LLMs into R programming
  * chatgpt: an R coding assistant built around OpenAI APIs

## How the models are fitted

* LLMs are designed to reproduce word co-occurrence patterns
* immense quantities of training data and complex architecture
* ‘transformer’ forms the backbone of BERT, GPT, Bard and LaMDA
  * a massive systems of nonlinear regression equations (specifically, neural
    network machine learning models)
  * millions of parameters that were
  * trained by taking sentences as predictors (an X in a regression equation)
    and masked-out words or the next sentence as an outcome (Y)
  * backpropagation: The prediction error from one fit is then used to update
    * repeated until the parameters sufficiently minimize the difference
      between the model output and the target text. This
* pre-training (Fig. 2a). The newest models
* instruction tuning and reinforcement learning from human feedback to further
  * ChatGPT and GPT-4 involve these kinds of steps, including
  * ~> generate coherent and relevant
    language 18,19
* Fig. 2: Pre-training, fine-tuning and prompt-tuning of LLMs
  * pre-training, a dataset of sentences is used as input to the LLM
  * Fine-tuning is the subsequent process of refining the model on a smaller,
  * Prompt-tuning involves optimizing the input prompts
* pre-training and fine-tuning
  * pre-training forms the base for general language understanding,
  * fine-tuning and prompt-tuning adapt the model to a specific task
    with and without changing the model’s parameters, respectively
* Off-the-shelf LLMs are powerful, but they cannot fulfil their potential for
  psychology research without further adaptation
  * eg LLM-generated dialogue on the right of Fig 1
  * the LLM-generated college advisor asked whether the LLM-generated applicant
    had created a ‘timeline’ or taken ‘online courses’
    * reasonable things for an advisor to say but
    * not necessarily good advice
    * according to a large, rigorous, randomized experiment funded by the US
      Department of Education, this kind of college-advising guidance has no
      effect on college persistence compared to a control condition 20. In
    * ie on-topic, grammatically correct useless information
    * ‘reduce stress’, ‘take breaks’ and practice ‘self-care’. These are
    * common themes in advice from advisors
    * not what research on stress shows is helpful or what might be most
      appropriate given the context 21,22. The LLM seems to have acquired
    * [reflects] a stress-is-debilitating mindset 23 — the notion that stress
      always harms performance and health
    * contradicted by research that emphasizes the importance of understanding
      the potentially enhancing role of stress. That is, the body’s stress
      response keeps people alive by helping to mobilize energy for performance
      (for example, getting more oxygenated blood to brains and muscles) 21,22
* if the cultural context that produced the training text tends to give bad
  advice about applying to college, then the LLM will probably parrot that 24
* the biases in LLMs’ output might be interesting to research
  * what does it say about human culture that the LLM learned a
    stress-is-debilitating mindset from its training data? Because LLMs are
  * how concepts and ideas hang together in the dominant culture that produced
    the training data 25. Trace the collective knowledge of the people

## Adapting LLMs for specific purposes

* off-the-shelf LLMs might provide insight into the way people on the internet
  see concepts such as a stress-can-be-enhancing mindset,
* much of the public’s conversation about LLMs has focused on off-the-shelf
* hE scientists typically want to study constructs using scientific conceptions
  of those constructs
* train (or ‘tune’) LLMs on high-quality data curated by experts for a given
  construct
* conduct evaluation experiments to see whether the LLM-generated data are as
  effective as intended
* eg DocsGPT is an LLM that is pre-trained on medical prose to help with
  clinical correspondence and charting 26
* Here we describe how fine-tuning and prompt-tuning can be used to tune LLMs
  to specific
  * domains (for example, parent–child interactions) or
  * constructs (for example, optimal stress coping or a growth mindset) that
  * not represented scientifically in the public’s language or in the training

### Fine-tuning

* new and more specific training data to adjust the model for a specific task
* data can come in many forms. Generally,
  * the larger and the more representative the data is of the target task and
    domain, the better the fine-tuned model will perform. The new data might be
  * a set of texts annotated by experts for a ‘stress-is-debilitating’ versus a
    ‘stress-can-be-enhancing’ mindset, high versus low narcissism, metaphors
    that represent causal relationships, or the expected responses to a given
    query
* Annotations do not always need to come
  * from experts. They can include
  * lay annotations (which might have bias) or any kind of
  * metadata, such as reactions to social media posts or the demographic data
  * Unlabelled text can also be used to improve the models’ performance
    * in a particular domain that is under-represented in the training data,
      such as language from parent–child interactions or language from people
      with a speech-related disability
* requires orders-of-magnitude less data than would be needed to train a
  * 5–100 annotated examples may be needed to fine-tune versus 100 Ks
* drawbacks. First, fine-tuning is
  * still computationally expensive. Powerful servers are required to update
  * high-quality annotated data to use in fine-tuning can be difficult to get
    * coders might not agree on what counts as a narcissistic statement, a
      growth mindset statement, or bad advice for coping with stress. Finally,
  * bias
    * the fine-tuned model might retain biases that were inherent in the LLM’s
      foundational training corpus
    * It could even become more biased depending on who did the fine-tuning
      (for example, researchers without expertise or who fine-tune from their
      own potentially biased viewpoints)

### Box 2 Fine-tuning for measurement

* Demszky+ (unpublished) fine-tuned a language model (RoBERTa) 114 to
  identify language that reflected 
  first-year college students’ worries and attitudes
  about belonging in their new school environment
  * annotated a subset of 650 short, first-person essays
    written by participants in a large experiment
    testing the effect of a social belonging intervention at over 26 colleges
    and universities
* coded by trained graduate student annotators for themes related to belonging,
  specifically whether
  * the essays portrayed belonging concerns as common
  * they explored changes in belonging over time
  * students connected these ideas to their personal lives
* Next, the subsample of 650 essays were used to fine-tune an LLM so that it
  was ‘biased’ towards these three language features. Finally, the entire set
  of approximately 11,000 essays were scored by the LLM for their tendency to
  endorse these belonging themes
* Found: students whose essays reflected more themes of the belonging
  intervention (reflecting on belonging concerns as being common and temporary)
  did better in college over the year. Consistent with theories of identity
  threat, this effect was greater among students from minoritized groups 70,115
  * Some next steps for this research might be to unpack the ‘black box’ of
    what the LLM was using for its scoring

## Prompt-tuning (also called in-context learning, 27, 28, Fig. 2c)

* popular because the LLM does not need to be re-fitted
  (that is, the underlying model parameters are not changed)
  Instead, the type of output the LLM generates is tailored to match
  user-generated prompts. Thus, the customization can happen quickly
  * eg a user interested in fostering a stress-can-be-enhancing mindset
    could prompt-tune an LLM with the following prompt:
    “Here is some good advice to give to people who are very stressed.  [user
    enters one or two examples written by the user or an expert].  What is a
    way to give this advice to someone who is stressed about work?”
  * The LLM would then output one or two examples. The user could then ask (in
    the same session with the LLM): “What is a way to give this advice to
    someone who is stressed about relationships?” The LLM would then output one
    or two examples
  * even just a couple of user-generated examples can help the model to
    extrapolate structural and semantic features (Box 3) and use them to
    generate a new set of examples in response to similar user queries 29
* the same limitations with respect to high-quality annotated data as
  * fewer examples (for example, one to ten) are needed. The key limitation of
  * it might not be very effective at addressing the many subtleties and
    complexities of a specific psychological construct,
    unlike a fine-tuned model whose parameters are adjusted based on a
    high-quality annotated dataset
  * less likely than fine-tuning to overcome biases in the data because its
    parameters are not updated
  * the LLMs’ outputs will be sensitive to how the prompt was worded
    * prompt engineering 
    * iw users vary the prompts given to the LLM to achieve a better output for
      a given purpose) is 
    * a key aspect of prompt-tuning that requires subtle expertise 30,31
* LLM providers such as OpenAI, Meta or Google prioritize model customization
  via prompt-tuning rather than fine-tuning
  * latest models (OpenAI’s GPT-4 and Google’s Bard AI) cannot be fine-tuned by
    public users
  * fine-tuning might interfere guardrails that prevent harmful outputs
  * Anticipated enhancements might elevate the effectiveness of prompt-tuning
  * OpenAI allows for increasingly detailed instructions via system messages
    (such as step-by-step directions for responding to an adolescent who is
    anxious about applying to college) that 
    * sys messages can guide the model’s behaviour throughout a conversation and
      reduce issues associated with earlier prompt-tuning approaches 
      (eg forgetting instructions)

### Box 3 Prompt-tuning for experimentation

* Clapper and colleagues 116 used prompt-tuning to evaluate the ability of two
  LLMs (GPT-3 and LaMDA) to generate growth mindset language (GML) in the form
  of an Algebra I teacher’s speech describing how to do well in the class that
  year 118
  * GML: language supporting students’ belief that intellectual ability can be
    developed 117)
  * three conditions: speeches generated by un-tuned LLMs; speeches written by
    expert growth mindset math teachers; and speeches written by LLMs that were
    prompt-tuned with the expert human speeches from the second condition
  * These speeches were then evaluated by a new sample of about a thousand
     adolescents
  * In the two LLM conditions, the prompt was: “Write a speech for the first
    day of Algebra class that tells your students what learning math is like.”
* A typical speech generated by the un-tuned LLM was: “Hello students! Welcome"
  * positive and encourages effort, it was 
    not rated as being high in growth mindset by the adolescent evaluators
    because it did not address students’ fixed mindset fears (that is, that when
    they struggle it means they are ‘bad at maths’)
* A typical speech generated by the expert-prompt-tuned LLM was: “Welcome to"
* adolescents’ ratings of the prompt-tuned examples were not significantly
  different (P > 0.05) from ratings of the human expert examples — even though
  the former were generated in seconds, whereas the latter were generated over
  a three-day period.  Furthermore, the expert-prompt-tuned speeches made up
  75% of the gap between un-tuned LLM and human expert speech ratings. These
  findings provide direct evidence that
* ie LLMs can generate novel text that is similar to a precise psychological
  construct with only five training examples. This study also suggests a

# Concerns about using LLMs for psychology + solutions

* LLMs might be used in ways that cause harm to the public
* eg Members of underrepresented groups in particular could suffer harm
  * owing to biases in how AI models are trained and implemented
* they are not actually simulating human intelligence 29,32,33
  * they tend to output an ‘average’ of what the internet or popular books tend
    * (with some constraints, for example LLM providers have put ethical
      ‘guardrails’ in place to prevent hate speech)
  * an advantage for research areas that seek to leverage and study human
    cognition and culture as represented in the training data
* sandbox for conducting metascientific analyses, 
  creating interactive interventions and generating a wide range of stimuli
  * With appropriate prompting and tuning, LLMs can also become
* limitations with respect to all these applications
  * LLMs lack the non-language-specific cognitive capacities
    required for modelling thought 34
* Psychological studies purporting to evaluate the psychological reasoning
  ‘abilities’ of LLMs (for example, heuristics and biases or theory of mind)
  could be subject to serious (if not fatal) validity concerns 35,36
* this section: four areas of concern

## How to evaluate LLMs

* leading questions to goad it [beleszekál] into saying something problematic 
  37,38
* GPT models could
  * pass the Bar Exam (which certifies US lawyers)
  * ace the Graduate Record Examination
    (GRE; used in applications to many US graduate schools), and
  * earn a 5 (the highest score) on every Advanced Placement test 39
* ? the standards for what constitutes ‘good’ LLM performance to psychologists
  interested in using LLMs to perform scientific or professional psychology
  tasks
* psychologists usually want to evaluate the effects on human thought and behav
* we introduce two high-level approaches to evaluating LLMs: expert & impact

### Expert evaluation

* measure the extent to which their output score or text agrees with those from
  human domain experts
* When using LLMs for text generation, experts and the LLM could be given the
  same prompt, and their responses could be compared using content analysis
* has long been used by computer scientists to refine LLMs’ capabilities for
  generating human-like text
* differs in important ways from evaluating the LLMs’ abilities to generate
  psychologically helpful language
  * people tend to agree on what counts as human-like language and demonstrate
  * moderate to high agreement on eg coherence, grammaticality & relevance 40,41
* people do not always agree on whether a message is psychologically helpful 42
  * intersubjectivity problem 43, which arises from the basic social
  * a person cannot fully know how another person is construing the meaning of
    a situation
* three interrelated issues for expert evaluation of LLMs
  * coders are third parties making guesses about how someone else would feel
    if they received the text generated by the LLM
    * context eg broader concerns (for example, about paying for college or
      disappointing one’s parents) are influencing the deeper meaning
  * the intersubjectivity problem is compounded by cross-group judgements
    (for example, across race or ethnicity, gender or political ideology)
    when raters are asked to draw inferences on behalf of people with very
    different identities, experiences or beliefs from their own
    * power differences. Higher-power groups are generally less attuned to the
      subjective perspectives of lower-power minority groups 44
  * Third, when coding for nuanced psychological constructs,
    sometimes no ‘right answer’ to be coded for
    * eg is a compliment something that is nice to say
    * individuals with low self-esteem tend to interpret compliments as an
      inauthentic gesture from people who feel obligated to be nice, and they
      feel worse afterwards 45

### Impact evaluation

* assess the LLM’s {effect on or utility for} the intended user or consumer of
  the text (Box 3)
* eg LLM asked to generate a persuasive argument about the death penalty
  * Expert evaluation would entail social psychologists coding the persuasive
    qualities of an LLM-generated argument;
    * currently the most common approach to evaluating persuasiveness in
      LLMs 47, pointing to the need for more impact evaluations
  * impact evaluation would ask lay participants to report their attitudes
    before and after reading the argument
    * ie not relying on subjective and contentious criteria for persuasiv 46
* hE why LLM-generated text fail to change downstream outcomes?
  * the LLM output failed to communicate the psychological construct of
    interest effectively, or because
  * the construct does not affect outcomes?

### Recommendations for evaluating LLMs

* expert and impact evaluation offer complementary advantages
* we recommend using both when possible
* Expert evaluation methods can be used first,
  akin to a manipulation check or a measure of construct validity
* Next, the scored text that matches expert judgements can be used in an impact
  evaluation study that attempts to measure the intended effects on third-party
  participants, akin to a measure of predictive or external validity
* This process can be iterative,
  * ie impact evaluations can be used to inform the next round of expert eval
    and vice versa
* eg a panel of experts identified principles for the best reappraisal techs
  (techniques for changing one’s thinking to change one’s emotional response 48)
  * experts score a corpus of text along theoretically defined key dimensions,
     such as reframing all-or-nothing thinking about stressors in terms of
     temporary, controllable factors
  * fine-tune or prompt-tune an LLM to conform to these dimensions
  * An impact evaluation could assess whether LLM-generated text higher on
    these dimensions improved mental health or coping for real humans
  * the panel could re-convene and debate new hypotheses about the validity of
    their theories and scoring guidelines, and
    * repeat the impact evaluation with text generated by the newly updated
      LLM
    * result: a corpus of human and AI-generated text
      with known theoretical and impact qualities, which
      could power future automated scoring algorithms
* This process could be followed for major constructs in each of psychology’s
  subfields (presumably after a period of building consensus around which
  constructs are the highest priorities)

## Bias in LLMs

* LLMs reproduce biases in those data 49
* representational and allocational harms 50,51
  * Repr: LLM represents some social groups in a less favourable light,
    demeans them, or fails to recognize their existence altogether
    * can be caused by
      * sampling biases (eg when privileged groups’ data are over-represented)
      * data-processing biases (eg when annotators from majority groups
        misunderstand minority groups)
  * Allocational harms arise when AI algorithms differentially allocate
    resources (such as loans) or opportunities (such as therapy) to diff social
    groups owing to historically biased decision patterns represented in the
    data, such as biased diagnoses or biased assignment to therapy treatment
* Algorithms for generating and presenting text to people online through social
  media and news platforms are subject to both representational and alloc harms
  * because they are driven by predictions about which text will engage
    targeted consumers and generate advertising or sales revenue 52
  * ie the web data used to train LLMs is not a random sample of all sentences
* LLMs are already being used for copywriting online
  without transparency about whether it was written by a human or a machine
  * That text will probably be used to train subsequent generations of LLMs
  * Thus, without corrective action many biases might become more entrenched

### Using LLMs to study bias

* Psychologists might be interested in studying LLMs’ biases to gain insight
  into human bias. However, bias-probing is
  * he made difficult by censorship ‘guardrails’ that have been placed on most
    LLMs by their developers. For example, a typical LLM will not directly
    answer a question such as “are white people smart?”
* indirect methods to check for bias are needed instead. One method for
  * manipulating pronouns and names associated with different genders, races
    and ethnicities in the input and assessing whether there are systematic
    differences in the output 29,54
    (often used in audit studies of real-world bias 53)
* hE requires explicit specification of demographic attributes
  * ~> difficult to observe unknown biases or biases related to intersectional
  * censorship guardrails (via post-processing the output or tuning the model)
    might addresses the symptoms, rather than the underlying bias in the data
  * could falsely lead researchers to conclude that the LLM is not biased 55
  * censorship algorithms shoudl be transparent
    * wanted: bias-testing protocols that go beyond testing obvious stereotypes
      to also examine the pernicious, pervasive and subtle ways that bias
      manifests in culture 56,57
  * transparency whether the [corpus] used to fit the LLM was itself generated
    by an LLM or by a human. Thus, even if better protocols are developed, it
    * not obvious in many cases whether the researcher was studying human bias
      or algorithm-mediated bias 52

### Recommendations for mitigating bias in LLMs

* involve people who are representative of the population that the LLM is meant
  to serve (for example, teachers and underserved students for a college advice
  tool) at every stage of the research process (research design, data
  annotation and model evaluation). Another way to mitigate bias is to take an
* ‘AI-in-the-loop, humans in charge’ approach 58
  * LLM not interact directly with vulnerable populations (eg strugg students),
    human experts (for example, teachers) are in control of the interaction and
    * accept or reject suggestions from the LLM
* As LLMs become better at simulating different types of behaviour
  * use LLMs to recognize and diagnose undesirable biases in the content they
    produce as well as text written by humans. For example, researchers are
  * approaches for LLMs to self-diagnose 59 and self-criticize
    based on principles written by people 60 to de-bias their output. These
    * could also be applied to mitigate human bias as a form of bias training
    * For example, participants could receive constructive feedback on their
      responses to scenarios that have the potential for bias. Given that
  * many training programmes to combat implicit bias do not have a measurable
    benefit 61,62, LLM-guided explicit-bias training might be a promising avenue
* important: clear processes for quantifying and reducing bias

## The ‘black box’ of LLM output

* LLM outputs are straightforward. As shown in Fig. 1,
  * LLMs can be asked which emotions are present in a sentence, and
  * they can provide an answer in plain language, just as a participant in a
    psychology study can. LLMs can
  * also for context-dependent, high-inference constructs, such as belonging
    (Box 2) or suicide risk 63
  * outputs from conventional text-analysis methods (word-counting, topic model)
    must be translated into a psychological construct by a researcher
    * For example, if LIWC scores a text high on ‘cognitive processing words’,
    * map ‘cognitive processing’ onto constructs such as anxiety or depression
    * eg 2 topics from a topic model is subjective 64, and the topics
    * might not map onto psychological constructs of interest
* interpretability
  * yes: LLM output increases access to these tools for non-technical users and
  * powerful applications, such as coaching tools for teachers, therapists and
    peers 65,66,67 or for students who are writing self-persuasion essays as
    part of ‘wise’ psychological interventions 68,69,70,71
  * difficult to interpret the processes by which LLMs reach their
    responses 45,72,73. This is a problem because
  * psychologists typically care about mechanisms. It is usually not enough to
    * why and how the language implies anxiety. Interrogating LLMs to identify
      the linguistic predictors or rationales of their predictions would inform
      theories of psychological constructs. However, it is not clear
  * how to assign meaning to the billions of parameters in LLMs
* probing 74. In probing, researchers seek evidence on
  * how the matrices underlying a model’s inferences align with linguistic
    features that influence the model’s outputs. To do this,
  * researchers first need to identify linguistic features relevant to their
    psychological construct (for example, negation, use of first person, or use
    of cognitive processing words from LIWC)
  * manipulate the input along these features to test their effect on the
    output
    * For example, researchers can create a large number of input sentence
      pairs that are only distinguished by the presence of negation on verbs
* researchers have tried directly asking LLMs to explain their
  predictions 48,75,76 doing so creates a circular problem 45. LLMs are not able
  to reason about their outputs, so examining their black box with yet another
  black box explanation is hardly a reliable approach
* recommendation
  * future: more tools to make LLMs’ output interpretable to psychologists 
    * newer models that more readily lend themselves to interpretation
  * this stage: complementing LLMs with traditional lexical analysis
    * connect interpretable outputs to interpretable processes

## Using LLMs as a reproducible tool

* [generative] LLMs are stochastic (non-deterministic) models, meaning that
  they can generate different responses to the same prompt. LLMs are trained
  over natural language text and learn the distributions of possible words
  * no single correct answer to how a given sentence should continue and end.
  * temperature parameter that determines how it samples from the distribution
    * 0: always pick the most likely words (the maximum a posteriori estimate),
    * positive temperatures allow the model to sample more widely from the
    * more linguistically (and possibly psychologically) diverse outputs
* ~ how the same human research participant might respond differently
  when presented with the same prompt
  * there is a true ‘signal’, but there is also variability and noise
  * To address this variability, psychologists do not typically survey one
    participant; they survey many and then compute statistics on the aggregate
  * also randomly vary the stimuli in their studies 77. In both cases,
  * psychologists incorporate uncertainty intervals into their conclusions
  * ie they re-sample from their data generating process and
    incorporate that uncertainty into their analyses
* Our recommendation is therefore to
  * acknowledge and incorporate the stoch asticity of LLM outputs into anal
    LLMs to generate multiple responses for any prompt and
  * publish (in supplementary material) both the parameters and outputs
    * aid reproducibility and also lead to more generalizable conclusions. We

# Conclusion: how collaborative, team-science initiatives could advance psy
and inform an ethical future for the applications

* The introduction of GPT (and related LLMs) is a revolutionary advancement
  in language-related technology that has profound implications for psychology
  * Massive amounts of language data can now be harnessed to help psychologists
    to develop better measures, to
    perform larger and perhaps more definitive experiments
* areas that are critical to society, such as education and mental health
* three important investments the field can make to realize the full potential
  * unlikely that any single researcher could make these investments
  * need for collaborations across 
    individual research groups, 
    professional organizations (such as the Association for Psychological
    Science or the American Psychological Association), 
    private industry and the 
    funding community

## keystone datasets. These are large natural language databases

* meet the highest standards for both expert and impact evaluation
* represent populations and psychological constructs of interest
  * precise definitions of these psychological constructs
    (possibly including expert annotations)
* linked to psychologically important outcomes, such as real-world behaviour,
  mindset, health and mental health, or academic and career trajectory
* eg the Texas Mindset Initiative is creating a large dataset of 1,000 Texas
  secondary school teachers’ natural language when talking with students.
  * constructs, such as
    * growth mindset (intellectual abilities can be developed),
    * emotional reappraisal (novel ways of thinking that lead to decreased
      negative emotions) or
    * autonomy support (whether teachers refrain from controlling language)
  * could then be empirically linked with teachers’ reports of their intentions
    to use these concepts, with students’ ratings of classroom culture, and
    with students’ academic performance over time
* Triangulating across these sources of data will enable discoveries
  * what teachers can say to a struggling student to support their mindset,
    to help them to cope with stress and to help them to learn. These findings
  * fine-tuning LLMs to measure or recommend language that matches the
    constructs of interest, which could in turn
  * power educational technologies such as virtual tutors or coaching tools
    for teachers. If similar datasets are collected in other
* education in a different region, country or for a different devel age group,
  * shed light on the culture-dependent and age-dependent context-specificity
    of LLM-generated psychological language in teaching contexts
* other constructs or policy spaces
  * already availabile:
    * online therapy platforms 66,78,79, body cameras on police officers 80 and
      recorded Zoom meetings for clinical psychology, policing and management
  * goal: consensus on a corpus of text that embodies major constructs in the
    field, which can be used to fine-tune LLMs and opportun for at-scale NLU

## Benchmarking

* The success of LLMs so far comes from the benchmarking culture in comp sci 81
  * Benchmarking occurs when model developers refine their software to optimize
    performance on a set of defined tasks and datasets 82,83
* hE existing forms of benchmarking might not be appropriate for many psycho
  use cases owing to the
  * highly context-dependent nature of psychological constructs and
    intersubjectivity issues
* a new, psychologically defined way of benchmarking LLMs could help
* depends on the availability of
  * keystone datasets and requires a
  * consensus on how to define and operationalize psychological constructs
  * standards and procedures for safety and transparency, which might involve
    sharing models with other scientists for further evaluation
* Organizing bodies (such as professional societies and funding agencies) could
  drive this consensus process
* privacy and confidentiality of language data will need to be accounted for
  * especially important when working with data from vulnerable populations
  * anonymized or modified versions of their data where
  * randomized simulations to prevent reverse identification
* research and policy concerning AI and the use of private data, and the role
  of AI in perpetuating biases: critical for LLM-powered research 84–88

## Fair access

* potential for LLMs to influence psy work, it will be important to ensure that
  access to these tools remains equitable
  * fitting an LLM takes an immense amount of resources. eg the basic research
    and model fitting required to create ChatGPT cost US $3 billion 89
    * Even the smaller, less costly LLMs can take months to train with the most
      advanced cloud computing resources
  * academia is unlikely to compete with the for-profit sector for the
    development of multi-billion-dollar models,
  * researchers should invest in developing cost-effective LLMs whose
    performance is as close as possible to expensive, paywall-protected and
    non-downloadable models. It will be
  * important: academics can access discounted or free research licences
  * tutorials, optimal defaults and vetted data-processing pipelines should be
    created
* ensure that a researcher’s funding does not prevent researchers
  from conducting AI-informed science
  * Investments in time-shared research infrastructure
  * including access to servers or cloud computing
  * working with LLMs responsibly might require a level of technical expertise
    that is not typically taught during psychology methods training
  * a new generation of text-analysis psychology methods courses and more
    training in programming languages such as Python might be needed
* science collaboration and team science for the future of LLMs in psychology
  * Psychological scientists and computational linguists can learn from one
    another and could contribute to aspects of keystone data collection and
    model fine-tuning
  * Interdisciplinary team science has the potential for contributions to both
    fields: particularly interesting use cases might be introduced to the
    computational linguistics literature from psychology, whereas the technical
    advances developed by computational linguists could empower new study
    designs and methods for psychology
