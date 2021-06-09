From Paraphrase Database to Compositional Paraphrase Model and Back
arXiv:submit/1336299 [cs.CL] 26 Aug 2015
John Wieting, Mohit Bansal, Kevin Gimpel, Karen Livescu, Dan Roth

* We release the new datasets, complete with annotations, as well as our
  code and the trained models

# Nem tudom, honnan szedtem ebben a formában, de jó

* We find
  * skip-gram word vectors (Mikolov+ 2013a) can be fine-tuned for the
    paraphrase task by training on word pairs from PPDB PARA-word vectors
  * additive composition of PARAGRAM vectors to be a simple but effective way
    to embed phrases for short-phrase paraphrase tasks
  * improved performance by training a[n] RNN (Socher+ 2010) directly
    on phrase pairs from PPDB

# 1 Intro

* Paraphrase detection
  * See (Androutsopoulos and Malakasiotis 2010) for a survey on approaches
  * useful for a variety of NLP tasks like
    * question answering (Rinaldi+ 2003; Fader+ 2013),
    * semantic parsing (Berant and Liang, 2014),
    * textual entailment (Bosma and Callison-Burch, 2007), and
    * machine translation (Marton+ 2009)
* the Paraphrase Database (PPDB; Ganitkevitch+ 2013)
  * confidence-rated paraphrases created [automatically using] pivoting
  * has recently been used for
    * monolingual alignment (Yao+ 2013), for
    * predicting sentence similarity (Bjerva+ 2014), and to
    * improve the coverage of FrameNet (Rastogi and Van Durme, 2014)
* drawbacks of PPDB
  * lack of coverage
  * nonparametric paraphrase model; the number of [phrase pairs] grows
  * confidence estimates in PPDB are a heuristic combination of features
* We find
  * additive composition of PARAGRAM vectors to be [effective] for short-phrs
  * improved performance by training a recursive neural network (Socher+ 10)
  * a wide variety of tasks
  * two new datasets that we introduce
    * Annotated-PPDB, contains pairs from PPDB that were scored by human[s]
    * ML-Paraphrase, is a reannotation of the bigram similarity corpus from
      Mitchell and Lapata (2010)

# 2 Related work

* embeddings tailored to specific downstream tasks (Bansal+ 2014)
* Phrase representation [vectors]
  * Mitchell and Lapata (2008; 2010) and Blacoe and Lapata (2012)
  * Zanzotto+ (2010) and Baroni and Zamparelli (2010)
    also based on operations of vectors and matrices
  * adding the word vectors (Mikolov+ 2013b)
  * Hashimoto+ (2014) an alternative word embedding and compositional model
    based on predicate-argument structures
  * Socher+ (2011) train a recursive neural network (RNN)
    * trained their RNN as an unsupervised autoencoder
    * struggles in compositionality (Blacoe and Lapata, 12; Hashimoto+ 14)
    * in a supervised setting (Socher+ 2014) for image descriptions
    * The objective function we use was motivated by their multimodal
      objective function for learning joint image-sentence representations
* PPDB has been used [to learn word embeddings for] semantic similarity,
  language modeling, predicting human judgments, and classification
  (Yu and Dredze, 2014; Faruqui+ 2015)
* Concurrently with our work Yu and Dredze (2015)
  construct paraphrase models for short phrases [using PPDB]

# 3 New Paraphrase Datasets

# 4 Paraphrase Models

# 5 Experiments – Word Paraphrasing

# 6 Experiments – Compositional Paraphrasing

# 7 Qualitative Analysis

* RNN performs better for less similar pairs
  * Vector addition only does better on the most similar pairs
  * presumably because the most positive pairs have high word overlap
* two factors that distinguished the performance between the two models:
  length ratio and the amount of lexical overlap
  * [the denominator of] Overlap ratio is [ the length of the shorter phrase]
  * as the phrase pairs are closer in length,
    addition surpasses the RNN for positive examples
    For negative examples, the trend is reversed. The
    same trend appears for overlap ratio
  * When considering both positive and negative examples (“Both”), we see that
    * the RNN excels on the most difficult examples
    (large differences in phrase length and less lexical overlap)
    * For easier examples, the two fare similarly overall ..., but the
      RNN does much better on negative examples
    * [i.e.] addition perform[s] well when two paraphrastic phrases have
      high lexical overlap and similar length

# 8 Conclusion

* [future work]
  * [base our composition function on] dependency syntax (Socher+ 2014)
  * how to use models for short phrases
