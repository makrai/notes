On the Language Neutrality of Pre-trained Multilingual Representations
Jindřich Libovický, Rudolf Rosa, Alexander Fraser
arXiv:2004.05160 [cs.CL]

https://github.com/jlibovicky/assess-multilingual-bert 

* Multilingual contextual embeddings,
  such as multilingual BERT (mBERT) and XLM-RoBERTa
  * Previous work probed the cross-linguality of the representations indirectly
    using zero-shot transfer learning on morphological and syntactic tasks
* We focus on the language-neutrality of mBERT with respect to lexical sem
  * contextual embeddings are more language-neutral and informative
    than aligned static word-type embeddings
    which are explicitly trained for language neutrality
  * two simple methods for achieving stronger language neutrality
    1. centering of the representation for languages, and second by
    2. fitting an explicit projection on small parallel data. In addition, we
* SOTA on language identification and word alignment in parallel sentences

# 1 Introduction

* Multilingual BERT (mBERT; Devlin+ (2019)) gained popularity as a contextual
  * dependency parsing (Kondratyuk and Straka, 2019a; Wang+ 2019),
  * cross-lingual natural language inference (XNLI) or
  * named-entity recognition (NER) (Pires+ 19; Wu & Dredze, 19; Kudugunta+ 19)
* Recently, new pre-trained models
  * XLM-RoBERTa (XLM-R; Conneau+ (2019)) outperform mBERT on XNLI and NER tasks
  * DistilmBERT (Sanh+ 2019) ... at a significantly lower computational cost
* mBERT is used cross-lingually for zero-shot transfer (Pires+ 2019)
  * morphological and syntactic tasks, at least for typologically similar langs
  * semantic task, sentence-retrieval, with promising initial results. Their
* how good the cross-lingual mBERT representation is for lexical semantics,
* Multilingual capabilities of representations are often evaluated by zero-shot
  transfer (Hu+ 2020)
  * we can never be sure if the probing model did not overfit for the [src lng]
  * validation set [usually] from the same language as the training set
    (otherwise it would not be zero-shot), even when it would have been better
* we
  * tasks that only involve a direct comparison of the reprs:
    cross-lingual sentence retrieval, word alignment (WA), and
    machine translation quality estimation (MT QE)
  * explore how the language is represented in the embeddings
    by training language ID classifiers and by assessing
    how the representation similarity corresponds to phylogenrlanguage families
* XLM-RoBERTa (XLM-R; Conneau+ (2019)
  outperforms mBERT in sentence retrieval and MT QE, while offering a
  similar performance for language identification and WA

# 2 Related Work

* limited language neutrality of Multilingual representations, mostly mBERT,
* zero-shot dependency parsing Wang+ (2019)
  * representation used for the parser was a bilingual projection of the
    contextual embeddings based on word alignment trained on parallel data
* zero-shot NER and part-ofspeech (POS) tagging (Pires+ 2019) examined the
  * [limited to] typologically similar the languages are.  Similarly, Wu and
* multilingual models for POS tagging, NER, and XNLI (Dredze 2019) trained good
  * [bad] results in the zero-shot setup
  * similar[ly bad] for language-generation tasks (Rönnqvist+ 2019)
* cross-lingual sentence retrieval between three language pairs (Pires+ 2019)
  * if they subtract the average difference between the mBERT embeddings from
    the target language representation, the retrieval accuracy significantly
    increases.  We systematically study this idea in the later sections
* XTREME (Hu+ 2020), a recently introduced benchmark for multilingual
  * a wider range of zero-short transfer tasks that include NLI (Conneau+ 2018)
    and question answering (Artetxe+ 2019; Lewis+ 2019), their results show a
  * clearly superior performance of XLM-R compared to mBERT
* sum: downstream task models can extract relevant features from the mling repr
  (Wu and Dredze, 2019; Kudugunta+ 2019; Kondratyuk and Straka, 2019a)
  But they do not directly show language-neutrality
* some implicit language identification [is possible]
  * [we] eliminates this risk by directly comparing the representations

# 3 Centering Representations

* Following Pires+ (2019), we hypothesize that
	a sentence representation in mBERT is composed of
	* a language-specific component, which identifies the language of the sent
	* a language-neutral component, which captures the meaning of the sentence in
* intuition: within one language, certain phenomena (e.g.  function words)
  would be very frequent, thus being quite prominent in the mean
  * phenomena that vary among sentences would be averaged out in the centroid
* For all tasks, we test all layers of the model. For tasks utilizing a
  single-vector sentence representation, we test both the [cls] token vector
  and mean-pooled states

# 4 Probing Tasks

* The first two tasks analyze the contextual embeddings
* The other three tasks are cross-lingual ... word or sentence similarities
  * we can estimate these similarities using the cosine distance
* supervised approach ... does not tell us much more about the reprs, but
  leads to a nice by-product of reaching SOTA accuracies for two of the tasks

## Language Identification. With a representation that captures all phenomena

* We train a linear classifier on top of a sentence representation

## Language Similarity

* transfer better between more similar languages (Pires+ 2019; Wang+ 2019),
  * similar languages tend to get similar representations
* We quantify this observation by V-measure between
  language families and
  hier clust of the language centroids (Rosenberg and Hirschberg, 2007). We
  * Nearest Point Algorithm and
    stop the clustering [at] the number of language families in the data

## Parallel Sentence Retrieval

* projection of the representations into the “English space”
  * fitted by minimizing the element-wise mean square error

## Word Alignment ... in parallel sentences

* a minimum weighted edge cover of a bipartite graph. We create an edge for
* not require parallel data for training
* To make the algorithm prefer monotonic alignment,
  we add distortion penalty of 1/d to each edge where d is the difference in
  the absolute positions of the respective tokens in the sentence. We add the
  * weight ... estimated on a devset
* invariant to representation centering. Centering the representation would

## MT Quality Estimation

* The standard evaluation metric is the Pearson correlation with the
  Translation Error Rate (TER)—the number of edit operations a human  needs
* requires capturing more subtle differences in meaning
* We evaluate how cosine distance of the representation of the source sentence
and of the MT output reflects the translation quality
  * plain and centered representations, we also test trained bilingual proj and
    a fully supervised regression trained on the shared task training data
    * multilayer perceptron directly predicting the value of the TER
* same bilingual projection into English [as] for sentence retrieval

# 5 Probed Models

## Static word embeddings [aligned]. As one of the baselines in all our

* they were explicitly trained to be language-neutral with respect to lex sem
* We represent sentences as an average of the embeddings of the words

## Multilingual BERT (Devlin+ 2019) is a deep Transformer (Vaswani+ 2017)

* trained in a multi-task learning setup,
  first, to be able to guess what words were masked-out in the input and,
  second, to decide whether two sentences follow each other in a coherent text
* for models based on mBERT, we experiment both with [cls] vector and mean-pool

## UDify

* The UDify model (Kondratyuk and Straka, 2019a) uses
  single mBERT for dependency parsing and morphological analysis of 75 langs
* better language neutrality with respect to morphology and syntax

## lng-free. In this experiment, we try to make the representations more

* adversarial language ID classifiers (Elazar and Goldberg, 2018) using the

## DistillmBERT. This model was inferred from mBERT by

* knowledge distillation (Sanh+ 2019)
* only 6 layers instead of 12, the rest of the hyperparameters remain the same
* initialized with a subset of the original mBERT parameters and
  trained on similar training data. The model was
* optimized towards cross-entropy of its output distribution with respect to
  output of the teacher mBERT model while keeping the MLM objective in the
  multitask learning setup

## XLM-RoBERTa

* original mBERT is under-trained (Conneau+ 2019) and train a similar model on
  a larger dataset that consists of two terabytes of plain text extracted from
  CommonCrawl (Wenzek+ 2019). Unlike mBERT, XLM-R uses a
* SentencePiece-based vocabulary (Kudo and Richardson, 2018) of 250k tokens,
* MLM objective, only without the sentence adjacency prediction

# 6 Experimental Setup 5

# 7 Results

## Language Identification. Table 1 shows that for mBERT,

* centering the sentence representations considerably decreases the accuracy of
  * [former] SOTA language ID model from FastText (Gravet+ 2018)
* Adversarial fine-tuning
  * prevented the language identificationly from the [cls] vector and
  * only marginally for mean-pooling. Thisupports the hypothesis
  * i.e. language identity is derived from the presence of function words and
* Centering [may] add language-specific information to the representation which
  the classifier might take advantage of [but no]
* with aligned word embeddings for 44 languages (Joulin+ 2018), the language ID
  accuracy is 99.5% with a drop to 2.3% [ie.] chance
  * supports our intuition about centering being a removal of frequent patterns
  * [hE this] cannot be considered language identification because we need to
    know the language in advance to use the matching embeddings table, so the

## Language Similarity

* Figure 2 is a tSNE plot (Maaten and Hinton, 2008) of the language centroids,
  * similarity of the centroids tends to correspond to th[at] of the languages
* Table 2 confirms thathe hierarchical clustering of the language centroids
  mostly corresponds to the language families

* XLM-R not only has a slightly worse performance in language ID, but also has
  worse performance in capturing language similarity.  
  * We hypothesize that ... next-sentence prediction [in] mBERT leads lang-spec
  * lang is helpful in determining if two sentences are adjacent

## Parallel Sentence Retrieval. Results in Table 3 reveal that the

* centering dramatically improves the retrieval accuracy, showing that it makes
* [supervised] projection of the representations leads to a much greater
* accuracy is
  * usually higher for mean-pooled states than for the [cls] embedding and
    varies among the languages too (see Table 4)
  * varies according to the layer of mBERT used (see Figure 3).  The
    best-performing is the 8th layer [out of 12], both for mBERT and XLM-R
  * consistent both among models and among tasks
* XLM-R significantly outperforms all models.  The
* UDify model that was finetuned for syntax seems to significantly lose sem
* Adversarial finetuning did not improve the performance
* Representation centering drastically improves accuracy.  
* An additional 50% error reduction is achievable via learning a projection on

## Word Alignment.  Table 5 shows that WA based on mBERT and XLM-R

* distortion penalty does
  not seem to influence the alignment quality when using the contextual embeds,
  whereas for the static word embeddings, it can make a difference of 3–6 F 1
  * ie. contextual embeddings encode relative word positon across languages.  
* However, the main advantage [of contextual embeddings]:
  allows accurate alignment of function words

* explicit projection trained on parallel data.  data.  We used an
* expectation-maximization approach that alternately aligned the words and
  learned a linear projection between the representations. Negligible improv

## MT Quality Estimation.  Table 6 reveals that measuring the

* distance of non-centered sentence vectors does not correlate with MT quality
* centering or explicit projection only leads to a mild correlation
  Unlike sentence retrieval, QE is more sensitive to subtle
  differences between sentences, while the projection only seems to capture
  rough semantic correspondence.  Note also that
* Pearson correlation used as an evaluation metric for QE might not favor the
  cosine distance because semantic similarity might not linearly correspond to
  HTER.  linearly correspond to HTER

* Supervised regression using either only the source or only MT output also
  * source sentence complexity is already a strong indicator of the MT quality
  * target sentence embedding alone ... suggests that the structure of the
    translation hypothesis is what plays the important role. We must interpret
* ie. QE not being a suitable task for probing semantic
  * semantic adequacy is only a marginally important aspect of MT QE
* all tested contextual sentence representations carry information about
  sentence difficulty for MT and structural plausibility, however, unlike

# 8 Conclusions
