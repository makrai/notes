BERT is to NLP what AlexNet is to CV: Can Pre-Trained LMs Identify Analogies?
Asahi Ushio, Luis Espinosa Anke, Steven Schockaert, Jose Camacho-Collados
ACL | IJCNLP 2021

# Abstract

* Analogies play a central role in human commonsense reasoning
  * analogical proportions eg “eye is to seeing what ear is to hearing”,
  * shape how we structure knowledge and understand language
* we analyze the capabilities of transformer-based language models on this
  unsupervised task, using
  * benchmarks from educational settings, as well as more commonly used ones
* off-the-shelf language models can identify analogies to a certain extent, but
  * struggle with abstract and complex relations, and
  * results are highly sensitive to model architecture and hyperparameters
  * best results were obtained with GPT-2 and RoBERTa
    * BERTs were not able to outperform word embedding models

# 1 Intro

* word embeddings model relational similarities in terms of word vector diffs
  (Mikolov+ 2013a; Vylomova+ 2016; Allen and Hospedales, 2019;
  Ethayarajh+ 2019). The
  * underlying assumption is that when “a is to b what c is to d” the word
    vector differences b − a and d − c are expected to be similar, where we
    write x for the embedding of a word x. While this assumption
  * for semantic relations this holds to a much more limited degree than was
    suggested in early work (Linzen, 2016; Schluter, 2018).  Moreover
  * common benchmarks have focused on specific and well-defined sem relations
    such as “capital of”, rather than the more abstract notion of relational
    similarity that is often needed for solving the kind of psychometric
    analogy problems that can be found in IQ tests and educational settings
    An example of such a problem is shown in Table 1

* central role of analogy in human cognition, it is nonetheless important to
  understand the extent to which NLP models are able to solve these more
  abstract analogy problems
  * Besides its value as an intrinsic benchmark for lexical semantics, the
  * analogy is indeed important in the contexts of
    * human creativity (Holyoak+ 1996), innovation (Hope+ 2017),
      computational creativity (Goel, 2019) and education (Pardos and Nam, 2020)
    * a prerequisite to build AI systems for the
      * legal domain (Ashley, 1988; Walton, 2010) and are used
      * in machine learning (Miclet+ 2008; Hug+ 2016; Hüllermeier, 2020) and
      * ontology alignment (Raad and Evermann, 2015), among others

* Within NLP, however, the task has received relatively little attention
  * Turney (2005) proposed Latent Relational Analysis (LRA) To solve such
    * designed as a relational counterpart to Latent Semantic Analysis
    * still represents the current SOTA in solving abstract word analogy
  * nL beyond a purely unsupervised setting
    GPT-3 obtains slightly better results (Brown+ 2020)

* we analyze the ability of pre-trained LMs to recognize analogies
  * zero-shot setting, where LMs are used without fine-tuning
  * predict whether two word pairs (a, b) and (c, d) are likely to be analogicl
  * We extensively analyze the impact of
    * prompt, ie a template that is used to construct the input to the LM, and
    * scoring function
    * different LMs.  When the prompt and scoring function are carefully
* GPT-2 can outperform LRA, standard word embeddings as well as the published
  results for GPT-3 in the zero-shot setting. However, we also find that these
  * hE highly sensitive to the choice of the prompt, as well as two
    hyperparameters in our scoring function, with the
    * optimal choices not being consistent across different datasets. Moreover,
* BERT leads to considerably weaker results < even standard word embeddings
  in all of the considered configurations. These findings suggest that while
* future  work is needed to understand how such knowledge is encoded, and how
  it can be exploited
