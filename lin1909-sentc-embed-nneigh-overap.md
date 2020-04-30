Lucy H. Lin, Noah A. Smith
Situating Sentence Embedders with Nearest Neighbor Overlap
arXiv:1909.10724 [cs.CL]

* To date e.g. GLUE and linguistic probes
* We propose a comparative approach, nearest neighbor overlap (N2O), that
  * requires only a collection of examples and is simple to understand:
  * [count the] overlap between the inputs' nearest neighbors
* we [use N2O to show the effects of different] architectures

# 1 Introduction

* evaluations for sentence embedders
  * intrinsic (e.g., Conneau+ ACL 2018)
    A Conneau, G Kruszewski, G Lample, L Barrault, and Marco Baroni
    What you can cram into a single vector: Probing sentence embeddings for lin
  * extrinsic (e.g., GLUE; Wang+ 2019)
  * Our approach, nearest neighbor overlap (N2O), is something different
    * linguistics~ and task-agnostic manner, using only a large unannotated
    * By drawing a random sample of queries from the corpus itself
* applications such as
  * text clustering (Cutting+ 1992),
  * information retrieval (Salton and Buckley, 1988), and
  * open-domain question answering (Seo+ 2018)

# 2 The N2O method motivated and explained

## 2.1 Desiderata

## 2.2 Algorithm

* we consider variants trained on different data or using different hyperparams
* we use cosine similarity

# 3 Apply it to 21 sentence embedders

* [defering] implementation decisions in §4

## 3.1 tf-idf

* term frequency (how often a term appears in a document) and
* inverse document frequency (how rare the term is across all documents)

## 3.2 Word Embeddings

### Static embeddings

* We consider
  * word2vec (Mikolov+ 2013) embeddings optimized to be predictive of a
    word given its context (continuous bag of words) or
    vice versa (skipgram);
  * GloVe (Pennington+ 2014) embeddings learned based on global cooccurrence
  * FastText (Conneau+ 2017), an extension of word2vec [with] n-grams

### Contextual embeddings

* ELMo (Peters+ 2018): multi-layer, bidirectional recurrent LM + char
* GPT (Radford+ 2018)
  * unidirectional language model with multi-layer transformer decoder;
  * subword information ... via byte-pair encoding (BPE; Sennrich+ 2016)
* BERT (Devlin+ 2019): transformer-based model trained to predict
  * a word given both left and right context, and
  * whether a sentence is the “next sentence” given a previous sentence
  * WordPiece model (Schuster and Nakajima, 2012)

### Composition of word embeddings

* average the word embeddings
* surprisingly [good] on sentence similarity, NLI (Wieting+ 2016; Arora+ 2017)
* contextual embeddings: special token or position in the sequence
  * BERT, the [CLS] token (normally used as input for classification)
  * last token’s representation may be used for GPT

## 3.3 Encoders

* direct way to obtain sentence embeddings is to learn an encoding function
  * supervised task
  * InferSent (Conneau+ 2017):
    * Stanford Natural Language Inference (SNLI; Bowman+ 2015) dataset; the
      sentence encoder provides representations for the premise and hypothesis,
      which are then fed into a clasifier
  * Universal Sentence Encoder (USE; Cer+ 2018):
    multi-task training on several semantic tasks (including sem textual sim);
    * encode[r] either with a deep averaging network or a transformer

# 4 Experimental Details 4

* The results in §5 are with k set to 50, 
  averaged across five samples of n = 100 queries
  * We illustrate the effects of different k and N2O samples in §6

# 5 Results

* in the intro
  * relatively high similarity among averaged static (i.e., non-contextual)
  * strong effect of the use of subword information, and that
  * BERT and GPT are distant outliers

## Averages of static word embeddings

* subword information ... has a large effect on N2O (0.52)

## BERT and GPT

* specific-token representations for BERT or GPT are outliers
  * as the training objectives for both (without fine-tuning) are not geared
    towards semantic similarity the way other embedders may be
  * surprising is that this effect seems to hold even for the
    MultiNLI-finetuned version of BERT (bert-ft-cls)
    * this decreases N2O with other embedders further
    * In preliminary experiments, we also saw similar results with BERT
      fine-tuned on the Microsoft Research Paraphrase Corpus (Dolan+ 2004)
* averaged BERT and GPT embeddings yields higher N2O with other embedders,
  especially ELMo-based ones

## Encoder-based embedders

* InferSent has highest N2O (∼0.2–0.3) with the embeddings based on averaging,
  * not wholly surprising as the model was initialized using GloVe vectors
  * USE variants (DAN and Transformer) have fairly distinct [NNs than others]

# 6 Robustness of N2O across different query samples and sample sizes

## Varying k

* changing [the number of nearest neighbors] does not significantly affect

## Query sampling

## Runtime

* [see] approximate nearest neighbor methods in Appendix C

# 7 Neighbors ... that are stable across embedders 9

* Table 2
  * an example query with a sentence that is in the 5-nearest neighborhood for
    all sentence embedders
  * sentences that are highly ranked for some embedder but 
    not in the [top 50] for any other

# 8 Known paraphrase

* considerable variance across embedders’ ability
* “needle-in-a-haystack” experiment
  * using the Semantic Textual Similarity Benchmark (STS; Cer+ 2017)
* We take near paraphrases with moderately different surface semantics
* The first sentence in each sentence pair is the “query,” and the
* second sentence is (temporarily) added to our Gigaword corpus
* results
  * larger ELMo models do particularly well
  * averaged BERT and GPT embeddings perform better than the [CLS]/final token
    * consistent with our earlier observation (§5) that their training
      objectives may not yield specific-token embeddings that directly encode

# 9 Related work

* comparisons of sentence embedders
* Linguistic probing tasks test whether embeddings can distinguish
  * surface level properties, like sentence length;
  * syntactic properties, like tree depth; and
  * semantic properties, like coordination inversion
  * Ettinger+ (2016), Adi+ (2017), Conneau+ (2018), and Zhu+ (2018)
* Downstream evaluations are often classification tasks 
  for which good sentence representations are helpful (e.g., NLI)
  * Evaluations like the RepEval 2017 shared task (Nangia+ 2017),
  * SentEval toolkit (Conneau and Kiela, 2018), and
  * GLUE benchmark (Wang+ 2019) seek to standardize comparisons
* N2O is ... task-agnostic way to compare embedders’ functionality
