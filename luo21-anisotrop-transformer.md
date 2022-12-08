Analyzing the Anisotropy Phenomenon in Transformer-based Masked Language Models
Luo, Ziyang
MA 2021 Uppsala Uni, Discip Domain of Humanities and Soc Sci, Faculty of Langs,
  Dept of Ling and Philo

# Abstract

* anisotropy phenomenon in popular masked language models, BERT and RoBERTa
* We propose a possible explanation for this unreasonable phenomenon
  * contextualized word vectors derived from pretrained MLM-based encoders
    share a common, perhaps undesirable pattern across layers
  * persistent outlier neurons within BERT and RoBERTa's hidden state vectors
    * consistently bear the smallest or largest values in said vectors
  * LayerNorm is one of the reasons for the position artefacts propagating
* In an attempt to investigate the source of this information,
  * we introduce a neuron-level analysis method, which reveals that
    the outliers are closely related to info captured by positional embeddings
* a simple normalization method, whitening can make the vector space isotropic
* ''clipping'' the outliers or whitening can
  more accurately distinguish word senses, as well as lead to
  better sentence embeddings when mean pooling

# 1 Introduction

* interpreting neural NLP models (Alishahi+ 2020; Linzen+ 2018, 2019)
* linear probes to investigate the linguistic properties
  (Hewitt and Manning, 2019; Tenney+ 2019)
  * hE, most of them only analyze the linearly-transformed vectors
  * untransformed vector spaces are not studied widely
* the vector spaces are explicitly anisotropic (Ethayarajh 2019, and Li+ 2020b)

# 2 Background

## 2.2 Whitening Transformation

* Whitening is a method to transform vectors into the standard normal distri
  (the mean vector is 0 and the covariance matrix is the identity matrix)

## 2.5 Related Work

### Interpreting NLP

* investigates the self-attention mechanism of Transformer-based models, aiming
  to eg characterize its patterns or decode syntactic structure
  (Clark+ 2019; Kobayashi+ 2020; Mareček and Rosa, 2018;
  Raganato and Tiedemann, 2018; Vig, 2019; Voita+ 2019)
* analyzes models’ internal representations using probes
  * often linear classifiers that
    take reprs as input and are trained with supervised tasks in mind,
    eg POS-tagging, dependency parsing
    (Hewitt & Manning, 2019; Lin+ 2019; NF Liu+ 2019; Tenney+ 2019; Zhao+ 2020)

### Contextualized Representations Space Analysis

* Most similar to our work, Ethayarajh (2019) measure how contextual a word
  representation is in models like BERT, ELMo and GPT-2 (Radford+ 2019)
  * the vector space is anisotropic
  * the same word’s different representations are dissimilar to each other in
    upper layers, suggesting that
    upper layers of models produce more context-specific representations

### LayerNorm Analysis

* Xu+ (2019): LayerNorm’s learnable params increase the risk of over-fitting
  and dropping them does not affect the model’s performance on several tasks
* Kovaleva+ (2021) draws attention to BERT’s outlier neurons
  * exhaustive analysis of LayerNorm parameterization
  * the high-magnitude normalization parameters emerge early in pre-training &
    show up consistently in the same dimensional position throughout the model
  * Removing them significantly degrades the downstream task performance
  * not analyze the reason behind such phenomenon

### Neuron-level Analysis

* Dalvi+ (2018) introduce a neuron-level analysis method,
* Durrani+ (2020) use this method to contextualized vectors
  * a linear probe to predict linguistic information stored in a vector
  * weights of the classifier as a proxy to select the most relevant neurons
  * finds small subsets of neurons to predict linguistic tasks and
    * lower-level tasks localize in fewer neurons
* Coenen+ (2019) demonstrate the existence of syntactic and semantic subspaces
  in BERT representations

### Positional Information Analysis

* the self-attention mechanism of Transformer Encoder is order-invariant, so it
  needs to use extra methods to trace the word order (Lee+ 2019)
  * Otherwise, it becomes a bag-of-word model
  * The commonplace method is
    adding the positional embeddings to the input static word embeddings,
    * learnable method (Devlin+ 2019) or the sinusoidal one (Vaswani+ 2017)
* Ke+ (2020)
  * adding position embeddings to the word embeddings brings information mixed
    correlations
  * propose a complicated method to untie these two embeddings
  * we find the positional artefacts exist in the contextualized
    representations, which corroborates their points

# 3 Anisotropy Phenomenon and Positional Artefacts

## 3.1 Anisotropy Phenomenon

* contextualized representations of BERT and RoBERTa are more anisotropic
  * especially true for RoBERTa, measured by the average cosine similarity

## 3.2 Positional Artefacts

### 3.2.1 Finding Outliers

* to find neurons, we average all subword vectors for each layer of each model
* In examining BERT, we find that the minimum element of 96.60% vectors is the
  557 th dimension
  * these patterns exist across all layers
* For RoBERTa, we likewise find that the
  * maximum element of all vectors is the 588 th element
  * minimum element of 88.19% vectors in RoBERTa is the 77 th element

### 3.2.2 Where Do Outliers Come From?

* same outliers also exist in positional embeddings
* similar patterns in the Layer Normalization (LN, JL Ba+ (2016)) parameters of
  both models
  * LN has two learnable parameters, gain (γ) and bias (β)
  * For BERT, the 557 th element of the γ vector is always among the top-6
  * For RoBERTa, one element of the first LN’s β vector is always in top-2
  * It is reasonable to conclude that, after the vector normalization,
    the outliers observed in the raw embeddings are lost
    * they retained after scaling the normalized vectors by the affine trafo
    * LayerNorm happens to rescale every vector such that the positional
      information is retained
* propagated upward by means of the Transformer’s residual connection
  (K He+ 2015)
* in the case of BERT, the first position’s embedding is directly tied to the
  requisite [CLS] token, which is prepended to all sequences as part of the MLM
  * recently noted to affect eg attention patterns, where
    much of the probability mass is distributed to this particular token alone,
    despite it bearing the smallest norm among all other vectors
    in a given layer and head (Kobayashi+ 2020)

#### Neuron-level analysis

* we employ a probing technique inspired by Durrani+ (2020)
* a linear probe W ∈ R M×N without bias to predict the position of a
  contextualized vector in a sentence
* In Durrani+ (2020), the weights of the classifier are employed as a proxy for
  selecting the most relevant neurons to the prediction
  * this assumes that, the larger the absolute value of the weight, the more
    important the corresponding neuron
  * hE, this method disregards the magnitudes of the values of neurons, as a
    large weights do not necessarily imply that the neuron has high contrib
    to the final classification result
  * we define the contribution of the i th neuron as c (i) = abs (w i ∗ v i )
    * w i represents the i th weight and v i represents the i th neuron
* it is possible to decode positional information from the lowest three layers
  with almost perfect accuracy,
  * much of this information is gradually lost higher up in the model
  * the higher layers of RoBERTa contain more positional information than BERT
  * BERT’s outlier neuron has a higher contribution in position prediction than
    the average contribution of all neurons
    * the contribution values of the same neuron are the highest in all layers
  * we can conclude that the 557 th neuron stores positional information
  * Likewise, for RoBERTa, two neurons have very high contribution for position
    * the contribution values of the 588 th neurons are largest for all layers,

#### Removing positional embeddings

* In order to isolate the relation between outlier neurons and positional info,
  we pre-train two RoBERTa-base models (with and without positional embeddings)
  from scratch using Fairseq (Ott+ 2019)
* without the help of positional embeddings, the
  * validation perplexity of RoBERTa-base is very high at 354.0
  * in line with (Lee+ 2019)’s observation that
    the self-attention mechanism of Transformer Encoder is order-invariant
    * i.e. the removal of PEs from RoBERTa-base makes it a bag-of-word model,
* In contrast, the perplexity of RoBERTa equipped with standard positional
  embeddings is much lower at 4.3, which is likewise expected
* we do not observe the presence of such outlier neurons in the RoBERTa-base
  model without PEs, which
  * indicates that the outlier neurons are tied directly to positional info

#### Relations with the Anisotropy Phenomenon

* we clip BERT and RoBERTa’s outliers by setting their value to zero
* the vector spaces become significantly more isotropic
  * The average cosine similarity values of RoBERTa decrease more than 0.5
    after the first non-input layer

### 3.2.3 Whitening Transformation

* Su+ (2021) find that the whitening operation can improve the performance of
  _sentence_ embeddings. We believe that this can be generalized to subwords
* we use all the token embeddings vectors in the same layer to learn the
  specific transformation matrix
* after whitening, the average cosine similarity values of all non-input layers
  decrease by a large margin
  * Especially, the values of BERT are close to zero for all non-input layers

# 4 Anisotropy Phenomenon and Semantic Information

## 4.1 Word-level Task

* we analyze contextualized vectors using the word-in-context (WiC) dataset
  (Pilehvar and Camacho-Collados, 2019)
  * a binary classification task, where,
  * given a target word and two sentences which contain it, models must
    determine whether the word has the same meaning across the two sentences
* If the similarity value is larger than a specified threshold, we assign true
* we compare the accuracy of
  BERT and RoBERTa on WiC before and after clipping the outliers or whitening
  * 9 different thresholds from 0.1 to 0.9, as well as a constant true baseline
### Before and After Alleviating
* after alleviating the anisotropy phenomenon, the best accuracy scores of BERT
  and RoBERTa increase, which proves our belief
### Clipping vs. Whitening
* whitening method is more effective than clipping method

## 4.2 Sentence-level Task

* we follow Reimers and Gurevych (2019 Sentence-BERT)
* evaluating our models on 7 semantic textual similarity (STS) datasets
  * the STS-B benchmark (STS-B) (Cer+ 2017),
  * the SICK-Relatedness (SICK-R) dataset (Bentivogli+ 2016) and
  * the STS tasks 2012-2016 (Agirre+ 2015, 2014, 2016, 2012, 2013)
* Each sentence pair in these datasets is annotated with a relatedness score on
  a 5-point rating scale, as obtained from human judgments
* We load each dataset using the SentEval toolkit (Conneau and Kiela, 2018)
* Reimers and Gurevych (2019) comment that the most common approach for comput-
  ing sentence embeddings from contextualized models is simply averaging all
  subword vectors that comprise a given sentence. We follow this method
* we then calculate the Spearman rank correlation
* We compare the vectors before and after clipping the outliers/whitening
* we also consider averaged GloVe embeddings as our baseline
* after clipping the outliers/whitening, the best Spearman rank correlation
  scores for BERT and RoBERTa increase across all datasets (except SICK-R for
  whitening), some by a large margin
* whitening > GloVe > clipping
  * averaged GloVe embeddings still manage outperform both BERT-clip and
    RoBERTa-clip on all STS 2012-15 tasks
  * BERT-whiten and RoBERTa-whiten outperform the static embeddings
    on all tasks (except STS 2012)
  * BERT-whiten outperform BERT-clip more than 10 points on STS 2013-14 tasks
  * These results indicate that the whitening method is also more effective on
    the most tasks

# 5 Discussion 25

* the common information in vectors (eg position artefacts) will inevitably
  make them similar to each other
  * To remove such correlations, one needs to use some normalization strategies
  * we introduced two effective methods to alleviate the anisotropy phenomenon,
  * Both of them help the contextualized vectors perform better
* Similar points also have been addressed in regards to
  * static word embeddings (Mimno and Thompson, 2017) as well as
  * contextualized ones (Li+ 2020a; Su+ 2021)
* whitening operation outperforms “clipping” on most tasks
  * two learnable parameters of whitening: the mean vector μ and the trafo mx W
  * “clipping” assumes that the mean values of all non-outlier neurons are zero
    and the transformation matrix is the identity matrix I
* the outlier dimension observed
  * for BERT is tied directly to the [CLS] token, always at the first position
  * RoBERTa (which also employs [CLS]) retains outliers originating from
    different positions’ embeddings
  * ie the issue of artefact propagation is not simply a relic of task design
    * The position information which contributes to a task’s loss function
      may be retained in the embeddings vectors. For BERT, the outlier
      dimension may be used to differentiate the 1st position from all others
  * position information is reconstructed by the gain parameter of LayerNorm
    and then propagates through the network
* new MLM models: T5 (Raffel+ 2020) and DeBERTa (P He+ 2021)) choose to
  directly use the positional information to adjust the attention matrix
  * DeBERTa uses the disentangled attention mechanism, where
    * each word is represented using two vectors
      that encode its content and position, resp, and
    * the attention weights among words are computed using disentangled
      matrices on their contents and relative positions, respectively
  * better performance than BERT and RoBERTa on the well-known NLU benchmarks
    GLUE (Wang+ 2018) and SuperGLUE (Wang+ 2019)
  * hE, these models still require extra positional encodings (PE)
    * can we modify the structure of Transformer Encoder to make it sensitive
      to word order like LSTM (Hochreiter and Schmidhuber, 1997)?
    * then we would be able to avoid the positional artefacts problem
* Tsai+ (2019) proved that the self-attention of Transformer Decoder is not
  order-invariant. With the help of auto-regressive attention masks,
  Transformer is no longer a bag-of-word model
* Irie+ (2019) show that
  Transformer Decoder w/o PE has lower perplexity on the speech dataset
* future: use such masks to modify Transformer Encoder
  to help it model word order implicitly
* LayerNorm is one of the reasons for the position artefacts propagating
  through the model’s representations
* Kovaleva+ (2021) find outlier neurons
  in the learnable parameters of BERT’s LayerNorm
  * indicate that removing the outlier neurons of LayerNorm
    will degenerate the model’s performance on downstream tasks
  * suggest that LayerNorm plays a much more important role than usually assumd
  * The two learnable parameters gain γ and bias β have great influence
  * Xu+ (2019) find that these parameters increase the risk of over-fitting and
    dropping them does not decrease the performance on most tasks, including
    Machine Translation, Language modeling, Text classification and Parsing
  * In the computer vision area, researchers usually use LayerNorm’s
    counterpart, BatchNorm (Ioffe and Szegedy, 2015)
    * similar to LayerNorm and performs the normalization for each mini-batch
* de Vries+ (2017) propose a model called conditional BatchNorm
  * only uses these two learnable parameters [gain γ and bias β?]
    to fuse vision and text information in a model
  * LayerNorm may be able to do similar things

# 6 Conclusion 27

* future research questions 
  1. in autoregressive models like GPT-2 (Radford+ 2019) or XLNet (Yang+ 2019)
  2. the relation between the positional information and the LayerNorm
    * both Kovaleva+ (2021) and we find that the outlier neurons phenomenon is
      highly related to the LayerNorm, especially the output LayerNorm
    * we show that the outlier neurons are the positional artefacts
  3. outlier neurons of LayerNorm gradually emerge after 50k pre-train steps
     (Kovaleva+ 2021)
    * not exist in the early training stage
    * Why does the model need to “grow” such neurons during training?
  4. the first positional embeddings of BERT has two outlier neurons
    * hE, there is only one outlier neuron in the contextualized token embeds
    * Why does the other outlier disappear?
  5. how the outlier neurons affect the attention distribution
    * Since the self-attention mechanism also relies on the dot-product

# 7 Appendix [mainly figures and tables]

## 7.1 Anisotropy Phenomenon of Distilled and Large Models

## 7.2 Positional Artefacts of Distilled and Large Models

### 7.2.1 Outliers of Distilled and Large Models

### 7.2.2 Neuron-level Analysis of Distilled and Large Models

## 7.3 Alleviating the Anisotropy Phenomenon of Distilled and Large Models

### 7.3.1 Word-level Task of Distilled and Large Models

### 7.3.2 Sentence-level Task of Distilled and Large Models
