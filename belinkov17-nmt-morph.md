Yonatan Belinkov, Nadir Durrani, Fahim Dalvi, Hassan Sajjad, James Glass
What do Neural Machine Translation Models Learn about Morphology?
ACL 2017

This is a modified version of a paper originally published at ACL 2017 with
updated results and discussion in section 5

# Ruder

* Transfer learning is another popular post-hoc analysis technique
  * representations learned for task A (typically a high-level task) are
    applied to task B (typically a lower-level task)
* ACL 2017, researchers asked what
  * NMT models know about morphology
    * Belinkov+ (2017)
      * attention increases the quality of morphological information in the
        encoder representations, it
        decreases the quality for the decoder representations
  * Language Models know about NER and chunking
  * speech+vision representations know about various semantic tasks

# Abstract

* we analyze ... neural MT models at various levels of granularity and
* evaluate the quality of the representations for learning morphology through
  extrinsic part-of-speech and morphological tagging tasks
* investigation along several parameters:
  * word-based vs. character-based representations,
  * depth of the encoding layer,
  * target language, and
  * encoder vs. decoder representations

# 1 Introduction

* NMT systems have become [SOTA especially since]
  sequence-to-sequence models and attention
  (Bahdanau+ 2014; Sutskever+ 2014)
* better handling of non-local dependencies and morphology generation
  (Luong & Manning, 2015; Bentivogli+ 2016; Toral & Sánchez-Cartagena, 2017)
* how much these models learn about each language and its features
  * encoder ... learning source syntax (Shi+ 2016)
* questions such as:
  1. what do NMT models learn about word morphology?
  1. translating into/from morphologically-rich languages?
  1. character vs. word
  1. what do different modules learn about the syntactic and semantic structure
    * not this paper
* In this paper, ... quantitative, data-driven answers to:
  * Which parts of the NMT architecture capture word structure?
  * division of labor between different ...  layers or encoder vs decoder?
  * different word representations: morphology and modeling of infrequent words
  * How does the target language affect the learning of word structure?
* procedure with three steps:
  1. train a neural MT system on a parallel corpus;
  1. use the trained model to extract feature representations for words
  1. train a classifier using extracted features ... for another task
* tasks of part-of-speech (POS) and full morphological tagging
* a series of experiments along several parameters
  * word-based and character-based representations
  * different encoding layers
  * source and target languages
  * features from the encoder vs. the decoder
* languages with varying degrees of morphological richness:
  * French, German, Czech, Arabic, and Hebrew. Our analysis
* reveals interesting insights such as:
  * Character-based representations are much better for learning morphology,
    especially for low-frequency words. This improvement is
    * correlated with better BLEU scores. On the other hand,
    * word-based models are sufficient for learning the structure of common
      words [?]
  * Lower layers of the encoder are better at capturing word structure, while
    deeper networks improve translation quality,
    * suggesting that higher layers focus more on word meaning
  * The target language impacts the kind of information learned by the system
    * Translating into morphologically-**poorer** languages leads to better
      source-side word representations. This is
    * partly, but not completely, correlated with BLEU scores
  * The NMT encoder and decoder learn representations of similar quality. The
    * attention mechanism affects the quality of the encoder representations
      more than that of the decoder representations

# 2 Methodology

* encoder-decoder (Sutskever+ 14)
* In this work, we use LSTM (Hochreiter and Schmidhuber, 1997) encoder-decoders
  with attention (Bahdanau+ 2014), which we train on parallel data
* After training the NMT system, we freeze the parameters of the encoder and
  use ENC as a feature extractor to generate vectors representing words
* analyzing representation learning in DEC
  * classifier itself can be modeled in different ways
  * [could] be an LSTM over outputs of the encoder. However, as we are inter-
    ested in assessing the quality of the representations learned by the MT
  * we choose [ a ] feed-forward network with one hidden layer and a ReLU
    * cross-entropy loss; more details ... in the supplementary material
  * We also experimented with a linear classifier and observed
    * similar trends to the non-linear case, but
    * overall lower results; Qian+ (2016b) reported similar findings

# 3 Data 3

## Language pairs

* several language pairs,
* including morphologically-rich languages, that [ received ] attention in MT
  * sr: Arabic-, German-, French-, and Czech-English pairs.  To broaden our
  * sr & tg:
    * Arabic-Hebrew, two languages with rich and similar morphological sys
    * Arabic-German, two languages with rich but different morphologies

## MT data

* the WIT 3 corpus of TED talks (Cettolo+ 2012; Cettolo, 2016) made available

## Annotated data [for] POS and morphological classifiers:

* goldstandard and predicted tags
* train and test our classifiers on predicted annotations, and similarly on
  gold annotations, when we have them. We report both results wherever availabl

# 4 Encoder Analysis

## 4.1 Effect of word representation

* word representations extracted with different encoders
  * word-based model uses a word embedding matrix which is ... learned in NMT
  * character-based CNN model (Kim+ 2015; Costajussà and Fonollosa, 2016)
* Table 2 shows POS tagging accuracy using features from different encoders
  * Char-based models always generate better representations for [both tasks]
    especially in the case of morphologically-richer languages like ar and cz
  * also manifests in better translation quality (BLEU), as shown in Table 2

### Impact of word frequency

* e.g. Arabic POS and morphological tagging. Figure 3 shows the effect
* word-based vs. char-based reprs, obtained from the encoder of the Arabic-He
  (other language pairs are similar)
* char-based model is superior [especially] on OOV words (+37.6% POS, +32.7%)

### Analyzing specific tags

* Figure 5 we plot confusion matrices for POS tagging
* word-based and char-based representations ... share similar misclassifs
  * Much of the confusion comes from wrongly predicting nouns (NN, NNP). In the
    * word-based case, [ many tags with determiner ] are predicted as non-deted
    * char-based case, this hardly happens
    * determiner ... in Arabic is expressed as the prefix “Al-” (definite art)
* difference in POS accuracy when moving to char-based per POS tag frequency
* char-based model is ... especially good with frequent tags and infreq words,
* not improve much: conjunctions, determiners, and particles (CC, DT, WP). But
* frequent tags (NN, DT+NN, DT+JJ, VBP, and even PUNC): accuracy improves
  * especially plural nouns (NNS, DT+NNS): the char-based model really shines,
  * in Arabic ... expressed by certain suffixes (“-wn/yn” for masc. plural)

## 4.2 Effect of encoder depth

* Modern NMT systems use very deep architectures with up to 8 or 16 layers
  (Wu+ 2016; Zhou+ 2016)
* predict POS or morphological tags
* Figure 6 shows POS tagging results using ... different encoding layers
* across five language pairs
* [depth]
  * improves POS tagging [because of] contextual information
  * [impair representation of word structure]
  * for both word-based and char-based representations,
    on Arabic POS and morphological tagging
* similar pattern was recently observed in a joint language-vision deep RNN
  (Gelderloos and Chrupała, 2016)

## Effect of target language

* While translating from morphologically-rich languages is challenging,
  translating into such languages is even harder
  * e.g. BLEU of 24.69/23.2 on Arabic/Czech to English, but only 13.37/13.9 on
* How does the target language affect the learned source language reprs?
  * a morphologically-rich tg require [less] sr morph knowledge
* we fix the source language (Arabic) and train NMT models on different target
  * to English/Hebrew/German systems.  These target languages represent a
    * richer ...  with similar morphology to the source language (Hebrew), and a
    * rich ... with different morphology (German)
* To make a fair comparison, we train the models on ... the same Arabic sents
* Figure 7 shows
  * POS and morphology accuracy of word-based representations from the NMT enc
  * BLEU scores
* POS and morphology accuracies share an intriguing pattern: en > de > he
* A possible explanation
  * the Arabic-English model is simply better than the Arabic-Hebrew and
  * as hinted by the BLEU scores in Table 2
  * inherent difficulty in translating Arabic to Hebrew/German may affect repr
  * To probe this more, we trained an Arabic-Arabic autoencoder
  * very high BLEU scores [but] ... inferior for POS/morphology
* a ... translation model learns more informative representations, but only
  when it is actually learning to translate rather than merely memorizing
* consistently true also for char-based experiments, and in other lang pairs

# 5 Decoder Analysis 7

* extract features for words in the target sentence
* These features are used to train a classifier on POS or morphological tagging
  * In this section we only experiment with predicted tags as
    there are no parallel data with gold POS/morphological tags
* a modest drop in representation quality with the decoder
  * may be correlated with lower BLEU scores when translating English to Arabic
    vs.  Arabic to English
  * simmilar small drops with higher quality translation directions 
    (Table 7, Appendix A.3)
* The ... gap between encoder and decoder representations may [be] surprising,
  * encoder’s task is to create a generic, close to language-indep repr
    * shown by ...  multilingual NMT (Johnson+ 2016)
  * One might conjecture that it would be sufficient
    * decoder to learn a strong language model in order to produce
      morphologically-correct output, without learning much about morphology,
    * encoder needs to learn quite a lot about source language morphology
    * However, their performance seems more or less comparable
    * In the following section
      the role of the attention mechanism in the division of labor encd vs decd

## 5.1 Effect of attention

* during decoding, the attention weights are combined with the decoder’s hidden
  states to generate the current translation
* mapping back to the source sentence ... may come at the expense of obtaining
  a meaningful [dec side] representation of the current word
* To test this hypothesis, we train NMT models with and without attention
  * Table 3 shows (compare 1st and 2nd rows),
  * removing the attention mechanism
    * decreases the quality of the encoder representations significantly, but
    * only mildly hurts the quality of the decoder representations. It seems
    * contrary to our hypothesis

## 5.2 Effect of word representation

* word-based versus character CNN representations on the decoder side
* decoder predictions are still done at the word-level, which
  enables us to use its hidden states as word representations
* Table 4 shows POS accuracy of word-based vs. char-based representations in
  the encoder and decoder
  * POS both end and dec, char-based representations perform better
  * BLEU scores behave differently:
    * char-based model leads to better translations in Arabic-to-English, but
      not in English-to-Arabic.  A
    * possible explanation: decoder’s predictions are still done at word level

# 6 Related Work 8

## Analysis of neural models The opacity of neural networks has motivated

* visualizes hidden unit activations in recurrent neural networks
  (Elman, 1991; Karpathy+ 2015; Kádár+ 2016; Qian+ 2016a). While such
  * often qualitative in nature and somewhat anecdotal. A different approach
* quantitative analysis by correlating parts of the neural network with
  linguistic properties, for example by training a classifier to predict feats
  * from word embeddings (Köhn, 2015; Qian+ 2016b), through
  * LSTM gates or states (Qian+ 2016a), to
  * sentence embeddings (Adi+ 2016)
  * Our work is most similar to Shi+ (2016), who
    * use hidden vectors from a neural MT encoder to predict syntactic
      properties on the English source side. In contrast, we focus on
  * Vylomova+ (2016) also analyze different representations for
    morphologically-rich languages in MT, but do not measure the repr quality

## Word representations in MT systems that deal with morphologically-rich langs

* word segmentation
  (Nieflen and Ney, 2000; Koehn and Knight, 2003; Badr+ 2008) and
* factored translation and reordering models
  (Koehn and Hoang, 2007; Durrani+ 2014)
* sub-word units
  * in phrase-based MT for handling
    * morphologically-rich (Luong+ 2010) or
    * related language pairs (Durrani+ 2010; Nakov and Tiedemann, 2012)
  * In neural MT, such units are
    * obtained in a pre-processing step—e.g. by
      * byte-pair encoding (Sennrich+ 2016) or
      * the word-piece model (Wu+ 2016)— or
    * learned during training using a character-based convolutional/recurrent
      sub-network (Costa-jussà and Fonollosa, 2016; Luong and Manning, 2016;
      Vylomova+ 2016). The latter approach has the advantage of
      * keeping the original word boundaries without requiring preand
        post-processing.  Here we focus on a
* character CNN which has been used in language modeling and MT
  (Kim+ 2015; Belinkov and Glass, 2016; Costa-jussà and Fonollosa, 2016;
  Jozefowicz+ 2016; Sajjad+ 2017)

# 7 Conclusion

* Character-based representations are better than word-based ones for learning
  morphology, especially in rare and unseen words
* Lower layers of the neural network are better at capturing morphology, while
  deeper networks improve translation performance
  * layers are more focused on word structure [vs] word meaning
* Translating into morphologically-poorer languages leads to better
  source-side representations
  * partly, but not completely, correlated with BLEU scores
* There are only little differences between encoder and decoder representations
  * attention mechanism
    * not seem to significantly affect the quality of the decoder
    * important for the encoder representations
* [future work in] neural MT
  * jointly learning translation and morphology can possibly [help]
    * take into account e.g. the encoding layer and the type of word repr
  * extend the analysis to
    * other representations (e.g.  byte-pair encoding), deeper networks, and
    * more semantically-oriented tasks such as sem role labeling or sem parsing
