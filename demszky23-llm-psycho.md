Using large language models in psychology
Dorottya Demszky, D Yang, DS Yeager, CJ Bryan, M Clapper, S Chandhok, JC Eichstaedt, C Hecht, J Jamieson, M Johnson, M Jones, D Krettek-Cobb, L Lai, N JonesMitchell, DC Ong, CS Dweck, JJ  Gross, JW  Pennebaker
Nature Reviews Psychology volume 2, pages 688–701 (2023)

# Abstract

* Large language models (LLMs),
  such as OpenAI’s GPT-4, Google’s Bard or Meta’s LLaMa, have created
* language data have a central role in all areas of psychology, this new
* we review the foundations of LLMs.  We then explain how the way that
* LLMs
  * effectively generate human-like linguistic output without the ability to
    think or feel like a human.  We argue that although LLMs
  * have the potential to advance psychological measurement, experimentation
    and practice, they are
  * not yet ready for many of the most transformative psychological applics —
    * further research and development may enable such use.
* four major concerns about the application of LLMs to psychology + overcome
* recommendations for investments that could help to address these concerns:
  * field-initiated ‘keystone’ datasets
  * increased standardization of performance benchmarks
  * shared computing and analysis infrastructure
    to ensure that the future of LLM-powered research is equitable.

# Introduction

* Language is a core aspect of all areas of psychological science. For
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
  * humans counting words in text, starting in the 1960s1,2, to
  * latent semantic analysis in the 1990s3,4 and to automated algorithms for
  * analysis of text on the internet5,6,7,8 in the 2010s. For instance, one
  * the Linguistic Inquiry and Word Count program9 enables researchers to
    * frequency of occurrence of different categories of words and assess how
    * predict outcomes such as physical and psychological health.  Another
* topic modelling, which uncovers themes in documents by analysing word
  co-occurrence patterns (via Latent Dirichlet allocation10). The advent of
* [generative] LLMs, such as OpenAI’s generative pre-trained transformer (GPT)
  models11,12, Google’s LaMDA and Bard AI13 (which can both generate and score
  text in human-like ways), will probably push the field in new directions.

* LLMs are massive statistical models that predict the next word, phrase,
  * go beyond popular word-counting bag-of-words methods (such as LIWC)
    * meaning in context, rather than assuming that words have a static meaning
    * context of words (topic, register, style, sarcasm or metaphor) influences
  * trained on an unprecedented amount and variety of text, including 100 Bs of
    utterances from online digital sources, such as web pages, books,
    magazines, social media, Wikipedia and online forums11,12. Thanks to better
    * LLMs can measure subtle, context-dependent expressions of mental states,
      generate text that is human-like, synthesize information from a wide
      range of sources, engage in natural dialogue and simulate different
      linguistic styles and personas.

* potentially broad 0-shot applications of LLMs across diverse areas of psycho
  * query people’s mental models of themselves and their environments (social
    and cognitive psychology), infer individual differences in coping styles
    (personality psychology), or help people to reappraise stressful
    experiences (affective and clinical psychology)
  * GPT output was generated in March 2023 using text-davinci-003 in the OpenAI
    playground with default settings (temperature 0.7, length 256)

* use cases across subfields in measurement, experimentation, and practice
  * measurement (probe psychological patterns in massive bodies of text),
  * experimentation (to rapidly generate stimuli and responses to those stimuli
    to improve the granularity of factorial designs) and
  * practice (to simulate realistic conversations to train human therapists,
    counsellors, teachers or managers). Table 1 previews
  * tab 1: We generated these use cases by consulting experts in several areas
    * how LLMs could make their work more efficient or wholly different. These
  * actually
    * the public rushed to use LLMs such as ChatGPT for mental health screening
      and therapy16, and
    * 40% of US teachers were using ChatGPT weekly for lesson planning just three
    months after its public release17 -- a nationally representative survey found
* question: whether — and on what timescale — the field will apply a nuanced
  understanding of LLM technology to developing and disseminating tools so that

# Conceptual and methodological foundations

how LLMs work, and what this information means for psychology

## Box 1 Tools to use LLMs with minimal expertise.

* hE incorrect defaults might be used. In addition, the field is changing
* might be outdated by the time this paper is published.

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
  APIs such as OpenAI’s ChatGPT.

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
  pre-trained LLMs.

### Useful software packages and libraries

* programming language
  * R: Fully pre-trained, off-the-shelf LLMs can be used in a browser or
    accessed through an R package (for example, text). 
  * Python: Deeper engagement with language models might require work with
    Python libraries, such as Hugging Face.  These are becoming easier to use
* DLATK
  * A good trade-off between complexity and the range of possible applications
  * open-source Differential Analysis ToolKit (DLATK). This is 
  * a Linux-based library that provides a user-friendly interface to many NLP
    Python libraries, including those that provide access to LLMs113. 
* LLMs have already become integrated in products such as Google Sheets
  (eg SheetGPT.ai), and we anticipate that LLMs will become increasingly more
  accessible to the consumer through intuitive interfaces.

* Example Python packages include:
  * openai (a Python interface over OpenAI’s API endpoints)
  * DLATK (a human text analysis package written in Python that supports transformer-based models from Hugging Face, in addition to other models)
  * langchain (a Python framework to develop LLM-powered applications, which supports various LLMs, including open-source models hosted in the Hugging Face model hub)
  * chainlit (a Python framework that uses langchain to build ChatGPT-like LLM apps).

* Example R packages include:
  * TheOpenAIR (an R package to integrate OpenAI’s GPT models into R workflows)
  * askgpt (another R package built around OpenAI APIs to access the GPT models in R)
  * reticulate (a Python interface written in R that allows us to import Python modules and call functions, which can be used to work with LLaMA and other LLMs, and langchain)
  * gptstudio and gpttools (RStudio add-ins that incorporate LLMs into R programming)
  * chatgpt (an R coding assistant built around OpenAI APIs).

## How the models are fitted

* LLMs are designed to reproduce word co-occurrence patterns that were found in
* immense quantities of training data and complex architecture. The most common
* ‘transformer’ forms the backbone of BERT, GPT, Bard and LaMDA. These LLMs are
* a massive systems of nonlinear regression equations (specifically, neural
  network machine learning models). These models often have 
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
    language18,19.  
* Fig. 2: Pre-training, fine-tuning and prompt-tuning of LLMs.  figure 2
  * pre-training, a dataset of sentences is used as input to the LLM
  * Fine-tuning is the subsequent process of refining the model on a smaller,
  * Prompt-tuning involves optimizing the input prompts to guide the
* Whereas 
  * pre-training forms the base for general language understanding, 
  * fine-tuning and prompt-tuning adapt the model to a specific task 
    with and without changing the model’s parameters, respectively.

* Off-the-shelf LLMs are powerful, but they cannot fulfil their potential for
  psychology research without further adaptation. For example, in the
  * eg LLM-generated dialogue on the right of Fig. 1, 
  * the LLM-generated college advisor asked whether the LLM-generated applicant
    had created a ‘timeline’ or taken ‘online courses’
    * reasonable things for an advisor to say but are 
    * not necessarily good advice
    * according to a large, rigorous, randomized experiment funded by the US
      Department of Education, this kind of college-advising guidance has no
      effect on college persistence compared to a control condition20. In
    * ie on-topic, grammatically correct useless information.

  * ‘reduce stress’, ‘take breaks’ and practice ‘self-care’. These are 
    * common themes in advice from advisors. However they are generally 
    * not what research on stress shows is helpful or what might be most
      appropriate given the context21,22. The LLM seems to have acquired 
    * [reflects] a stress-is-debilitating mindset23 — the notion that stress
      always harms performance and health.
    * contradicted by research that emphasizes the importance of understanding
      the potentially enhancing role of stress. That is, the body’s stress
      response keeps people alive by helping to mobilize energy for performance
      (for example, getting more oxygenated blood to brains and muscles)21,22.

* if the cultural context that produced the training text tends to give bad
  advice about applying to college, then the LLM will probably parrot that 24

* the biases in LLMs’ output might be interesting to research.  Researchers
  * what does it say about human culture that the LLM learned a
    stress-is-debilitating mindset from its training data? Because LLMs are
  * how concepts and ideas hang together in the dominant culture that produced
    the training data25. Trace the collective knowledge of the people

## Adapting LLMs for specific purposes

* off-the-shelf LLMs might provide insight into the way people on the internet
  see concepts such as a stress-can-be-enhancing mindset, 
* much of the public’s conversation about LLMs has focused on off-the-shelf
* hE scientists typically want to study constructs using scientific conceptions
  of those constructs.  Thus, using LLMs to advance scientific theory and to
* train (or ‘tune’) LLMs on high-quality data curated by experts for a given
  construct.  Moreover, they will need to 
* conduct evaluation experiments to see whether the LLM-generated data are as
  effective as intended. This need for additional training and evaluation is
* eg DocsGPT is an LLM that is pre-trained on medical prose to help with
  clinical correspondence and charting26. 
* Here we describe how fine-tuning and prompt-tuning can be used to tune LLMs
  to specific 
  * domains (for example, parent–child interactions) or 
  * constructs (for example, optimal stress coping or a growth mindset) that
  * not represented scientifically in the public’s language or in the training

### Fine-tuning

* new and more specific training data to adjust the model for a specific task.
* data can come in many forms. Generally, 
  * the larger and the more representative the data is of the target task and
    domain, the better the fine-tuned model will perform. The new data might be
  * a set of texts annotated by experts for a ‘stress-is-debilitating’ versus a
    ‘stress-can-be-enhancing’ mindset, high versus low narcissism, metaphors
    that represent causal relationships, or the expected responses to a given
    query.
* Annotations do not always need to come 
  * from experts. They can include 
  * lay annotations (which might have bias) or any kind of 
  * metadata, such as reactions to social media posts or the demographic data
  * Unlabelled text can also be used to improve the models’ performance 
    * in a particular domain that is under-represented in the training data,
      such as language from parent–child interactions or language from people
      with a speech-related disability.

* requires orders-of-magnitude less data than would be needed to train a
  * 5–100 annotated examples may be needed to fine-tune versus 100 Ks

* drawbacks. First, fine-tuning is 
  * still computationally expensive. Powerful servers are required to update
  * high-quality annotated data to use in fine-tuning can be difficult to come
    * coders might not agree on what counts as a narcissistic statement, a
      growth mindset statement, or bad advice for coping with stress. Finally,
  * bias
    * the fine-tuned model might retain biases that were inherent in the LLM’s
      foundational training corpus
    * It could even become more biased depending on who did the fine-tuning
      (for example, researchers without expertise or who fine-tune from their
      own potentially biased viewpoints)

### Box 2 Fine-tuning for measurement

* Demszky+ (unpublished) fine-tuned a language model (RoBERTa)114 to identify
  language that reflected first-year college students’ worries and attitudes
  about belonging in their new school environment. The researchers annotated a
  subset of 650 short, first-person essays written by participants in a large
  experiment testing the effect of a social belonging intervention70 at over 26
  colleges and universities115.

* coded by trained graduate student annotators for themes related to belonging,
  specifically whether 
  * the essays portrayed belonging concerns as common
  * they explored changes in belonging over time
  * students connected these ideas to their personal lives. 
* Next, the subsample of 650 essays were used to fine-tune an LLM so that it
  was ‘biased’ towards these three language features. Finally, the entire set
  of approximately 11,000 essays were scored by the LLM for their tendency to
  endorse these belonging themes.

* Found: students whose essays reflected more themes of the belonging
  intervention (reflecting on belonging concerns as being common and temporary)
  did better in college over the year. Consistent with theories of identity
  threat, this effect was greater among students from minoritized groups70,115.
  Some next steps for this research might be to unpack the ‘black box’ of what
  the LLM was using for its scoring.

## Prompt-tuning (also called in-context learning)27,28 (Fig. 2c).

* popular because the LLM does not need to be re-fitted 
  (that is, the underlying model parameters are not changed)
  Instead, the type of output the LLM generates is tailored to match
  user-generated prompts. Thus, the customization can happen quickly. For
  example, a user interested in fostering a stress-can-be-enhancing mindset
  could prompt-tune an LLM with the following prompt: “Here is some good advice
  to give to people who are very stressed.
  [user enters one or two examples written by the user or an expert].  What is
  a way to give this advice to someone who is stressed about work?” The LLM
  would then output one or two examples. The user could then ask (in the same
  session with the LLM): “What is a way to give this advice to someone who is
  stressed about relationships?” The LLM would then output one or two examples.
  Thus, even just a couple of user-generated examples can help the model to
  extrapolate structural and semantic features (Box 3) and use them to generate
  a new set of examples in response to similar user queries29.

* the same limitations with respect to high-quality annotated data as
  * fewer examples (for example, one to ten) are needed. The key limitation of
  * it might not be very effective at addressing the many subtleties and
    complexities of a specific psychological construct, unlike a fine-tuned
    model whose parameters are adjusted based on a high-quality annotated
    dataset. Prompt-tuning is also 
  * less likely than fine-tuning to overcome biases in the data because its
    parameters are not updated.
  * the LLMs’ outputs will be sensitive to how the prompt was worded. Thus,
    prompt engineering (in which users vary the prompts given to the LLM to
    achieve a better output for a given purpose) is a key aspect of
    prompt-tuning that requires subtle expertise30,31.

* LLM providers such as OpenAI, Meta or Google prioritize model customization
  via prompt-tuning rather than fine-tuning; their 
  * latest models (OpenAI’s GPT-4 and Google’s Bard AI) cannot be fine-tuned by
    public users. One potential reason for preventing users from fine-tuning is
  * fine-tuning might interfere guardrails that prevent harmful outputs such as
    Anticipated enhancements might elevate the effectiveness of prompt-tuning
  * OpenAI allows for increasingly detailed instructions via system messages
    (such as step-by-step directions for responding to an adolescent who is
    anxious about applying to college) that can guide the model’s behaviour
    throughout a conversation and reduce issues associated with earlier
    prompt-tuning approaches (such as forgetting instructions)

### Box 3 Prompt-tuning for experimentation

* Clapper and colleagues116 used prompt-tuning to evaluate the ability of two
  LLMs (GPT-3 and LaMDA) to generate growth mindset language (language
  supporting students’ belief that intellectual ability can be developed117) in
  the form of an Algebra I teacher’s speech describing how to do well in the
  class that year118. The study had three conditions: speeches generated by
  un-tuned LLMs; speeches written by expert growth mindset math teachers; and
  speeches written by LLMs that were prompt-tuned with the expert human
  speeches from the second condition. These speeches were then evaluated by a
  new sample of about a thousand adolescents. In the two LLM conditions, the
  prompt was: “Write a speech for the first day of Algebra class that tells
  your students what learning math is like.”

* A typical speech generated by the un-tuned LLM was: “Hello students! Welcome
  * positive and encourages effort, it was not rated as being high in growth
    mindset by the adolescent evaluators because it did not address students’
    fixed mindset fears (that is, that when they struggle it means they are
    ‘bad at maths’).

* A typical speech generated by the expert-prompt-tuned LLM was: “Welcome to my

* adolescents’ ratings of the prompt-tuned examples were not significantly
  different (P > 0.05) from ratings of the human expert examples — even though
  the former were generated in seconds, whereas the latter were generated over
  a three-day period.  Furthermore, the expert-prompt-tuned speeches made up
  75% of the gap between un-tuned LLM and human expert speech ratings. These
  findings provide direct evidence that 
* ie LLMs can generate novel text that is similar to a precise psychological
  construct with only five training examples. This study also suggests a

# concerns about using LLMs for psychological purposes, along with potential
solutions to these concerns. It is important to raise these concerns because if
they are left unaddressed LLMs might be used in ways that cause harm to the
public. Members of underrepresented groups in particular could suffer harm
owing to biases in how AI models are trained and implemented

# Conclusion: how collaborative, team-science initiatives could advance
psychological science and inform an ethical future for the applications in
