Phrase-Based & Neural Unsupervised Machine Translation
Guillaume Lample, Myle Ott, Ludovic Denoyer, Alexis Conneau, M'A Ranzato
arXiv:1804.07755v1 EMNLP 2018

#Abstract

* Machine translation ... achieve near human-level performance on some langs
* hinder[ed] when having access to only large _monolingual_ corpora
* We propose two model variants, a neural and a phrase-based model
* Both versions
  * automatic generation of parallel data by backtranslating
  * denoising effect of a language model trained on the target side
* significantly better than methods from the literature, while
  * simpler and having fewer hyper-parameters
* On the WMT’14 English-French and WMT’16 German-English benchmarks,
  * our models outperforming the state of the art by more than 11 BLEU points
  * by obtaining 27.1 and 23.6 BLEU points respectively

#Introduction

* Machine Translation (MT) is a flagship of the recent successes [in NLP]
  * a testbed for sequence transduction algorithms
  * near human-level performance on several language pairs
    using neural approaches (Wu+ 2016; Hassan+ 2018)
  * open challenges (Koehn and Knowles, 2017; Isabelle+ 2017; Sennrich, 2017)
    * reliance ... on large parallel corpora
* limited supervision is typically provided in the form of
  * parallel (Sennrich+ 2015a; Gulcehre+ 2015; He+ 2016; Gu+ 2018; Wang+ 2018)
  * parallel sentences but in other related languages
    (Firat+ 2016; Johnson+ 2016; Chen+ 2017; Zheng+ 2017), or
  * bilingual dictionaries (Klementiev+ 12; Irvine and Callison-Burch, 14, 16)
  * comparable corpora (Munteanu+ 2004; Irvine and Callison-Burch, 2013)
* Recently two [fully unsupervised] approaches (Lample+ 2018; Artetxe+ 2018),
  relying only on monolingual corpora in each language,
  as in the pioneering work by Ravi and Knight (2011)
* common ingredients underlying [the success of these two recent works]
  [despite] subtle technical differences
  * carefully initialize the model with an inferred bilingual dictionary
  * leverage strong language models,
    via training the sequence-to-seq system (Sutskever+ 2014; Bahdanau+ 2015)
    as a denoising autoencoder (Vincent+ 08)
  * back-translation (Sennrich+ 2015a)
    * turn the unsupervised problem into a supervised one
      by automatic generation of sentence pairs
    * the key idea is to maintain two models,
      * one for translating the source into the target
      * other to translate the target into the source
      * The former model generates data to train the latter one and vice versa
  * constrain the latent representations produced by the encoder
    to be shared across the two languages
* Putting these pieces together,
  * the encoder produces similar representations [for each] input language
  * The decoder, which is
    trained both as a language model and as a translator from noisy inputs,
    learns to produce increasingly better translations
    in tandem with the backward model
  * about 15 BLEU points on the WMT’14 English-French benchmark
* In this paper, we
  * a model that combines these two previous neural approaches,
    simplifying the architecture and loss function
    * easier to train and tune
  * apply the same ideas and methodology to a traditional phrase-based
    statistical machine translation (PBSMT) system (Koehn+ 2003)
    * well-known to outperform neural models when labeled data is scarce
      * neural models ... are prone to overfit
    * Our PBSMT model is simple, easy to interpret, fast to train and
      often achieves similar or better results than its NMT counterpart
  * up to +10 BLEU points on widely used benchmarks when using our NMT model,
  * up to +12 points with our PBSMT model
* organized as follows
  2. key principles underlying our approach to unsupervised MT
  3. NMT and PBSMT models that employ these principles
  4. evaluate them empirically
  5. how they relate to other approaches

#2 Principles of Unsupervised MT

* common principles underlying unsupervised MT
  * illustrated in Figure 1
  * suitable initialization, language modeling and iterative back-translation
  * how they can be better instantiated in a neural and phrase-based model

##Initialization

* [align] words, short phrases or even sub-word units, BPE (Sennrich+ 2015b)
* Klementiev+ (2012) used a provided bilingual dictionary
* Lample+ (2018) and Artetxe+ (2018) used dictionaries inferred in an
  unsupervised way (Conneau+ 2018; Artetxe+ 2017)
* motivating intuition is [that] an initial “word-by-word” translation
  can still preserve some of the original semantics

##Language Modeling

* They improve the quality ... by performing local substitutions and reordering

##Iterative Back-translation

* back-translation (Sennrich+ 2015a)
* unsupervised setting[:]
  couple the machine translation system with a backward model
* turns the [problem into a supervised learning task] with noisy source
* iterative algorithm (He+ 2016)

#3 Unsupervised MT systems 3

* how to effectively combine [the three principles detailed in Section 2]
  in the context of a NMT model (Section 3.1) or PBSMT model (Section 3.2)

##3.1 Unsupervised NMT

* organized
  1. how the previously mentioned three key principles are instantiated in our
  2. an important feature of the system, which is specific and critical to NMT
  * In general, an NMT model is composed of an encoder and a decoder; the
    specific details of this architecture is given in Section 4

###Initialization

* prior work relied on bilingual dictionaries, here
* we propose a ... simpler approach which is suitable for related languages. 1
  * For unrelated languages, we need to infer a dictionary (Conneau+ 2018)
* byte-pair encodings (BPE) (Sennrich+ 2015b), which have two major
   * they reduce the vocabulary size and
   * they eliminate the presence of unknown words in the output translation
* we define BPE tokens by jointly processing both monolingual corpora
  * eliminates the need to infer a bilingual dictionary. In practice, we i)
    join the monolingual corpora, ii) apply BPE tokenization on the resulting
    corpus, and iii) learn
* token embeddings ... are used to initialize
  the lookup tables in the encoder and decoder

###Language Modeling

* accomplished via denoising autoencoding, by minimizing: L lm = E x∼S [− log P
  * noise model with some words dropped and swapped as in Lample+ (2018)

###Back-translation

* principle: The pairs ... can be seen as aligned sentences
  * on which ... a new MT model can be learned
* we do not back-prop through the reverse model which generated the data
  * because we did not observe improvements when doing so
* [only LM + this] is too unconstrained. For instance,
  * e.g. the decoder ... has to work well both when fed encoder representations
    of target [and] source sentences
  * the [whole] system can cheat ...  by splitting the latent space in two, and
    use one subspace for the language modeling task and
    another subspace for the translation tasks
  * This leads to an additional constraint required ... which we discuss next

###Sharing Latent Representations

* A shared encoder representation acts like an interlingua, which is
  translated [to] the decoder target language regardless of the input source
  * ensures that the benefits of language modeling
    * nicely transfer to translation from noisy sources and eventually
    * help the NMT model to translate more fluently.  In order to share the
* we share all encoder [and decoder] parameters (including the embedding mxs)
  * sharing the
    * encoder is critical to get the model to work,
    * decoder simply induces useful regularization
* the first token of the decoder specifies the language
  * Unlike prior work (Johnson+ 2016),
  * the encoder does not have any language identifier
* [comparison to] Artetxe+ 18; Lample+ 18
  * BPE joint tokenization,
  * choice of architecture both differ from prior work
  * we share the decoder unlike Artetxe+ (2018)
  * [unlike] Lample+ (2018), we also do online
    * back translation and
    * lack the adversarial term in the loss, since the architecture and
  * [we] simplify the model and reduce the number of hyper-parameters

##3.2 Unsupervised PBSMT 4

* PBSMT first infers an alignment, and then populates phrase tables. Each entry
  * estimation based on normalized counts
* other terms are often introduced, such as one to take into account the
  * the relative positional misplacement between n-grams
  * phrase tables in the other direction, etc
* In the unsupervised setting, ... how to populate the phrase tables?
  * the principles of Section 2 are effective to solve this problem

###Initialization

* We populate the initial phrase tables [in both directions] using a [rotation
  matrix] (Conneau+ 2018)
  * populated with [word n-]grams
  * to work at the level of BPEs [(Kunchukuttan and Bhattacharyya, 2016), we
    leave] to future work

###Language Modeling

* smoothed n-gram language models using KenLM (Heafield, 2011)
* neural models could also be considered
* fixed throughout training iterations

###Iterative Back-Translation: 

* seed PBSMT: unigram phrase tables and the language model on the target side
* We then use this model to translate the source monolingual corpus 
* we train a PBSMT in supervised mode to map the generated data back 
* Next, we perform both generation and training process but in the reverse
* We repeat these steps as many times as desired, see Algorithm 2.
* at any given point[, the language model may be able to fix some] mistakes 
  * As long as that happens, the translation [and the ph tables] improve

#4 Experiments 5

* organized
  * datasets and experimental protocol we used. Then,
  * we compare the two proposed unsupervised approaches to
    * earlier attempts (Artetxe+ 2018; Lample+ 2018)
    * semi-supervised methods (Gu+ 2018) and to
    * the very same models but trained with varying amounts of labeled data
  * ablation study to understand the importance of each component
  * qualitative assessment of the translations

##4.1 Datasets and Methodology

* language pairs:
  * two pairs are used to compare to recent work on unsupervised MT
    (Artetxe+ 2018; Lample+ 2018)
    * English-French, English-German
  * two pairs ... to test our PBSMT unsupervised method 
    on truly low-resource pairs (Gu+ 2018) or [languages with diff] alphabet
    * English-Romanian and English-Russian
    * removing diacritics from Romanian on the source side to deal with their
      inconsistent use across the monolingual dataset (Sennrich+ 2016)

##4.2 Initialization

* Both the NMT and PBSMT approaches require either
  * cross-lingual BPE embeddings (to initialize the shared lookup tables) or
  * n-gram embeddings (to initialize the phrase table)
* embeddings using fastText (Bojanowski+ 2017) with [a] dimension of 512
* cross-lingual BPE embeddings for related language pairs like en-fr and en-de
  * more than 95% of the tokens are shared

###4.2.1 initialize the phrase tables in PBSMT

* generate n-gram embeddings on the source and target corpora independently,
* align them using the MUSE library (Conneau+ 2018)
* small but significant difference of about 1 BLEU point using ... bigrams
  * not observe any improvement using longer phrases. Table 1
* unigrams are correctly aligned to bigrams, and vice versa

##4.3 Training

###4.3.1 NMT

* LSTM (Hochreiter and Schmidhuber, 1997) and Transformer (Vaswani+ 2017)

##4.4 Model selection

* Moses’s implementation of PBSMT has 15 hyper-parameters,
  * weight[s of scoring function], word penalty, etc
  * we consider two methods to set these hyper-parameters
    * default values in the toolbox, or 
    * we set them using a small validation set of parallel sentences
  * with only 100 labeled sentences ... PBSMT would overfit
  * Therefore, unless otherwise specified, [models] use default
* two model selection procedures
  * based on
    * the BLEU score of sr → tg → sr or tg → sr → tg as in Lample+ (2018), or
    * a small validation set of 100 parallel sentences
  * we found the unsupervised criterion be highly correlated with the test
    metric when using the Transformer model, but not always for the LSTM
* Therefore, unless otherwise specified, we select the best
  * LSTM models using a small validation set of 100 parallel sentences, and
  * Transformer models with the unsupervised criterion defined in Lample+ 18

##4.5 Results

* both our unsupervised NMT and PBSMT largely outperform previous unsupervised
  * large gains on all languages pairs and in both directions
  * PBSMT model with the unsupervised phrase table alone (i.e. before starting
    back-translation), already significantly outperforms previous approaches,
    * can be generated in a few minutes using MUSE 
      once the embeddings are learned with fastText
* additional gains
  by further tuning the NMT model on the data generated by PBSMT (PBSMT -> NMT)
  * we ... add the data generated by the unsupervised PBSMT system
    to the backtranslated data produced by the NMT model
* We also tried [NMT -> PBSMT], but this did not improve over the PBSMT alone
* compare to fully supervised models [trained on a varying number of] examples
  * unsupervised PBSMT model is able to achieve the same performance than its
    supervised counterpart trained on almost 100,000 sentences
  * low-resource language like ro → en
    * PBSMT model obtains a BLEU score of
      * 21.0 without using a single parallel sentence, and
      * 22.2 when using a small validation set to tune the weights
    * Gu+ (2018) obtain 22.9 BLEU by leveraging
      6,000 parallel sentences, a seed dictionary, and
      a multi-NMT system combining parallel resources from 5 ... languages
* Russian: obtained a respectable BLEU score of 15.4 on ru → en

###Iterative back-translation

* Table 3 illustrates the quality ... after each backtranslation step
  * e.g. fr → en model obtains a BLEU score of
    * 15.42 at iteration 0 – i.e after the unsupervised phrase table constructn
    * 24.67 at iteration 4
  * same improvement ... in the different language pairs we have tested
  * for the en → de task, the increase is less pronounced, but still signific

##4.6 Ablation Study

* of the NMT-Transformer model on the fr → en data
* if we remove the
  * denoising autoencoder ..., the model does not learn to translate at all
  * back-translation, ... similar catastrophic failure
  * not share the decoder, [test performance decreases] by half a BLEU point
  * not initialize the model with pre-trained embeddings,
    the model does learn, but much slower and to a much lower accuracy

##4.7 Qualitative study

* Table 4 shows examples ... from the French-English newstest 2014 dataset
  at different iterations of the learning algorithm for both the NMT and PBSMT
* [at iter 0], the PBSMT translations are not far from word-by-word
  * but still contain most of the semantic of the original sentences
* both the PBSMT and NMT models fail to adapt to the polysemy of “langue”,
  which can be translated as “tongue” or “language” in English
  * in the unsupervised phrase table, ... P(language|langue) = 0.92 vs 0.0005
  * the phrase table [trained in a supervised way contains] 0.633 vs 0.0076,
  * This underlines the importance of the initial unsupervised phrase alignment

#5 Related Work 9

* first known attempt at fully unsupervised MT is the Ravi and Knight (2011),
  * linguistic prior knowledge to reframe the task as ... deciphering
  * short sentences with limited vocabulary
* [the] earlier ... Carbonell+ (2006) ... leveraged a bilingual dictionary
* subsequent approaches (Klementiev+ 2012; Irvine & Callison-Burch, 2014, 2016)
  * relied on bilingual dictionaries,
    small parallel corpora of several thousand sentences, and
    linguistically motivated features
  * Irvine and Callison-Burch (2014) use
    monolingual data to expand phrase tables
* initializ[ing phrase tables] with an inferred bilingual unigram dictionary
  aiming at improving PBSMT with neural models [follows] 
  Schwenk (2012), Kalchbrenner and Blunsom (2013), and Cho+ (2014)
* back-translation (Sennrich+ 2015a)
  * Using monolingual data on the target side for data augmentation purposes
  * a major advance in recent years
  * the most effective way to leverage monolingual data in the semisupervised
  * has been integrated in the “dual learning” framework of He+ (2016)
    * Our approach is similar
    * extensions (Wang+ 2018)
      * pretrained using a relatively large amount of labeled data and
      * gradients are backpropagated through the reverse model
* large-scale fully unsupervised MT
  * Lample+ (2018) and Artetxe+ (2018)
  * leveraging bilingual dictionaries that are also learned without supervision
    (Conneau+ 2018; Artetxe+ 2017)
  * back-translation,
    strong language models (implemented via denoising autoencoders),
    clever initialization of lookup tables,
    weight sharing between encoders, and an
    adversarial training loss to align the [encoder output] between language[s]
  * Our approach is different in several ways
    * online backtranslation in both directions, 
      similarly to Artetxe+ (2018) and the dual learning framework
    * a simpler scheme for aligning latent representations between ...  pairs,
      by recognizing that [many] words and sub-word (BPE) tokens (Sennrich+
      2015b; Press and Wolf, 2016) are usually shared between related languages
    * without ... adversarial loss terms

#Conclusions and Future Work

* future, we plan to further investigate
  * initialization of phrase tables with n-grams aligned in an unsupervised
  * [with] significant quantities of labeled data in other language pairs
