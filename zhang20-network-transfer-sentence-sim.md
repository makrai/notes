Direct Network Transfer: Fine-Tuning Sentence Embeddings for Semantic Sim
Li Zhang, Steven R. Wilson, Rada Mihalcea
arXiv:1804.07835 cs.CL

* comput cost of fine tuning the embed?
* Human Activity Phrase and SAG different from the rest

# Abstract

* Semantic similarity: SOTA approach is to transfer sentence embeddings
  pre-trained on large corpora to small in-domain training datasets
  * classifier optimized for the downstream task
* We
  * propose a new setting called direct network transfer, which
    * omits the classifier but
    * directly optimizes cosine similarity between embedding vectors
  * significantly better performance for several semantic similarity datasets
  * the choice of exactly how to perform transfer learning can
    greatly influence the performance in many cases,
    differing by encoders and datasets

# 1 Introduction

* SemEval Semantic Textual Similarity (STS)
  (Agirre+ 2012; Agirre+ 2013; Agirre+ 2014; Agirre+ 2016; Cer+ 2017),
* Two primary methods to compute the semantic similarity
  * transfer learning to pre-trained sentence embeddings, by
    encoding each sentence into a fixed-length vector representation, and
    fine-tune these representations with a separate classifier to predict sim
    * In this paper, we focus on the first method which has demonstrated better
  * classical approach is to use interactions
    e.g. alignments, attention or other features like word overlap (Shao, 2017)
* class of competent sentence encoders is based on
  * transformers (Vaswani+ 2017), SOTA performance on semantic similarity
  * LSTM (Hochreiter and Schmidhuber, 1997)
    * we focus on LSTM due to the small size of their parameters and
      robustness to hyperparameter selection
    * usually consist of two components: a
      * word embedding matrix, which maps words into fixed-length vectors, and
        * usually initialized with pre-trained word embeddings
      * encoder LSTM: maps a sequence of word embeds to a single sentence embed
        * learned via a large corpus
* classifier (e.g., logistic regression) is often added on top of the encoding
  * set of parameters for each of the three components: wem, enc and cla
  * A subset of them are updated during transfer training,
    depending on the setting
* We propose direct network transfer, an effective
  transfer learning or fine-tuning setting with a simpler training objective,
  * directly optimizes cosine similarity between sentence embeddings, no clasfr
  * all other parameters are updated
    * Without a classifier, direct network transfer omits all parameters in
      the output layer (changing “classifier” to “cosine” in Figure 1)
  * we experiment with various combinations of sentence encoders and semantic
    similarity datasets, we show that in many cases direct network transfer
    performs better than learning an additional classifier, with fewer params
* contributions
  1. new fine-tuning setting called direct network transfer
    * improved results on the STS Benchmark (Cer+ 2017) and the
      Human Activity Phrase dataset (Wilson and Mihalcea, 2017)
  2. we compare a range of settings for semantic similarity using some of the
     best LSTM-based sentence encoders across an array of datasets
     * the choice of transfer learning settings generally greatly influences
  3. we release the pre-trained and fine-tuned LSTM models to the public
    * can easily be used for downstream tasks related to semantic similarity

# 2 Related Work

## 2.1 Sentence Encoders

* sentence encoders or contexutalized word representations
  (Kiros+ 2015; Arora+ 2016; Wieting+ 2015b; Wieting and Gimpel, 2017a;
  Conneau+ 2017; Pagliardini+ 2017; Subramanian+ 2018; Cer+ 2018; 
  Logeswaran and Lee, 2018; Peters+ 2018; Devlin+ 2018)
  * impressive performance on the semantic similarity task
  * pre-trained on large corpora, usually obtained with minimal supervision
  * different architectures and training objectives
  * sentence embeddings are later used to transfer to downstream tasks

# 2.2 Fine-Tuning Settings

* how exactly do the encoders transfer to a task such as semantic similarity?
* categorize the transfer settings into follows (Pan and Yang 2010):
  * Unsupervised evaluation (UE), aka. zero-shot transfer
    * pre-trained model is directly evaluated on the downstream task
    * In the case semantic similarity, vector similarity is directly calculated
  * Feature transfer (FT): A classifier takes the fixed sentence embeddings as
    * trained on a downstream training set, before it is evaluated
  * Network transfer (NT), aka. fine-tuning
* A classifier is built on top of the sentence encoder. While trained on a
* both the classifer and the encoder are fine-tuned, end-to-end, before it is
* Table 1 shows the inconsistent uses of those transfer learning setting of
  sentence encoders over the years, on two semantic similarity datasets (SICK
  and STS Benchmark)

# 3. Direct Network Transfer 2

## 3.1 Motivation

* semantic similarity objective boosts the performance of domain adaptation
  of general-purpose sentence embeddings, 
  with little cost of modifying the model and the benefit of faster fine-tuning

## 3.2.  Definition

* cosine should be close to the normalized annotated score
* more discussion on normalization below

# 4.  Experimental Setup 3

## 4.1 Datasets

* correlation coefficient (Pearson’s r or Spearman’s ρ) is calculated between
  * STS Benchmark (Cer+ 2017):
    * a selection of the English datasets used in SemEval 2012--2017, designed to
  * SICK relatedness (Marelli+ 2014)
    * Sentences Involving Compositional Knowledge benchmark, which includes a large
    * rich in the lexical, syntactic and semantic compositionality phenomena
  * STS 2012 (Agirre+ 2012): the first Semantic Textual Similarity (STS) shared
    * this year has both training and testing data
      ideal for transfer learning evaluation. The annotated scores range from 0 to
  * Human Activity Phrase (Wilson and Mihalcea, 2017): a collection of
    * pairs of phrases describing human activities, annotated in four dimensions:
      similarity (SIM), relatedness (REL), motivational alignment (MA) and
      perceived actor congruence (PAC)
    * 1000 pairs in the dataset. Since this test set is already small,
    * we collected 1373 additional annotated pairs of human activity phrases in the
    * We make this set http://anonymous.edu/.  of training pairs available at
  * Short Answer Grading Dataset (Mohler+ 2011): a collection of
    * student and instructor answers to questions on assignments and examinations
      in a Data Structures course.  The
    * student answers were independently graded by two human judges based on their
      consistency with the instructor answers.  For this dataset, a training
    * not directly comparable to the results reported in the paper of this dataset,
      as they used 12-fold cross-validation which became too computationally

## 4.2. Models

* We experiment on the following pre-trained sentence encoders, which have
  * SOTA results on various downstream tasks, including sem sim
  * Infersent (Conneau+ 2017): a
    bi-directional LSTM with max pooling
    trained on the Stanford Nat Lang Inference (SNLI) dataset (Bowman+ 2015)
  * Gated Recurrent Averaging Network (GRAN, Wieting and Gimpel, 2017b): a
    paraphrastic compositional model that combines LSTM and averaging word
    embeddings,
    trained on sentence pairs obtained by aligning Simple English to standard
    English Wikipedia (Simple-Wiki dataset, Coster and Kauchak, 2011)
  * BiLTSM-Avg (Wieting and Gimpel, 2017a; Wieting and Gimpel, 2017b): a
    bi-directional LSTM model that averages all hidden vectors to generate the
    sentence embedding which has a large dimension of 4096,
    trained on a backtranslated corpus (PARANMT-50M)

##4.3. Other Transfer Settings

* As discussed in Related Work, there are typically three transfer settings:
  * The implementation details are as follows
* Unsupervised evaluation: the pre-trained sentence encoder is directly applied
* Feature transfer: 
  * we use the code from SentEval 4 which follows Tai+ (2015)
  * sentence embeddings as fixed input features to a
    classifier consisting of a dense layer and a softmax layer
* Network transfer:
  word embedding matrix and encoder alongside the classifier, constitute an
  end-to-end model
  * all three sets of parameters (wem, enc, cla) can be updated or frozen
  * We compare two scenarios: 1.  all three are updated, 2. only wem is frozen

# 5. Experiments 4

## 5.3 Annotated Score Normalization

* we want to optimize the cosine similarity between embeddings to be close to
  normalized annotated scores
* Though cosine falls in [−1, 1],  embedding vectors are mostly non-negative
* normalizing to [0, 1] is almost always superior
  * except for perceived actor congruence (PAC) of the Human Activity Phrase
  * PAC score of −2 suggests that two activities are very unlikely to be done
    often by the same type of person (e.g. have dinner with friends/by oneself)
  * these pairs may actually exhibit a degree of semantic relatedness

# 6. Conclusion and Future Work

* novel fine-tuning setting – direct network transfer
* significantly improved performance on five tasks and
  outperforms all other settings in the majority of combinations
* three sentence encoders, eight semantic similarity tasks, and
  nine transfer learning settings
  * Additionally, we systematically explored specific changes that can be made
    to the transfer settings and discussed how
* this work only compares models based on LSTM, which has been a typical choice
  * exploring if direct network transfer also performs well when transferring to
    them and to new datasets and domains
