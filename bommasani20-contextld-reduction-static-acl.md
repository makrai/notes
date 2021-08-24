Interpreting Pretrained Contextualized Representations
  via Reductions to Static Embeddings
Rishi Bommasani, Kelly Davis, Claire Cardie
ACL 2020

# Abstract

* interpretability methods for static embeddings
  * more diverse and mature than those available for their dynamic counterparts
* we
  * introduce simple and fully general methods for converting from
    contextualized representations to static lookup-table embeddings
  * convert 5 popular pretrained models and 9 sets of pretrained weights
  * significantly improves representational quality under intrinsic evaluation
* social biases encoded in pretrained representations
  * Complementary to analyzing representational quality
  * with respect to gender, race/ethnicity, and religion
  * bias is encoded differently across pretrained models and
    internal layers even for models with the same training data
    * dramatic inconsistencies between social bias estimators

# 1 Intro

* innovations of embedding methods from integrating additional information
  * syntax (Levy and Goldberg, 2014a; Li+ 2017),
  * morphology (Cotterell and Schütze, 2015),
  * subwords (Bojanowski+ 2017),
  * subcharacters (Stratos, 2017; Yu+ 2017) and,
  * context (Peters+ 2018; Devlin+ 2019): tremendous representational power
* interpretability research:
  * Liu+ (2019a); Tenney+ (2019a): across the layers
  * Tenney+ (2019b); Ethayarajh (2019): from context,
  * Clark+ (2019); Michel+ (2019): specific attention heads,
  * Hewitt and Manning (2019); Ettinger (2020): linguistic understanding
    such as syntax and negation, and
  * Wallace+ (2019); Tan and Celis (2019): ethical concerns such as
    security (adversarial robustness) and social bias
* we trying to re-purpose methods developed for analyzing static word embeddings
  * proposing a simple strategy for converting from contextualized to static
  * method is fully general
    * assumes only that the contextualized model maps word seqs to vector seqs
  * apply our method to 9 popular pretrained contextualized representations
  * examine the representational quality of these embeddings under intrinsic
* produces several insights regarding layer-wise lexical semantic understanding
  and representational variation in contextualized representations
* our analyses suggest constructive improvements to potentially improve
  downstream practices in using contextualized models
* a lightweight mechanism for generating static embeddings that
  track with advances in contextualized representations
* static embeddings have significant advantages with respect to
  * speed, computational resources, and ease of use
    * resource-constrained settings (Shen+ 2019),
    * environmental concerns (Strubell+ 2019), and the in
      * NLP (Strubell+ 2019),
      * machine learning (Canziani+ 2016), and the
      * AI community (Schwartz+ 2019)
    * broader accessibility
  * more developed methods for embedding analysis, especially social bias
    * We employ methods for quantifying gender, racial/ethnic, and religious b
      (Bolukbasi+ 2016; Garg+ 2018; Manzini+ 2019)
    * proxy for understanding latent biases in the original pretrained contextal
* biases in different models and across different layers are quite disparate;
  * important consequences on model and layer selection for downstream use
  * in two sets of pretrained weights learned on the same training data,
    bias patterns still remain fairly distinct
  * existing bias estimators are dramatically inconsistent with each other

# 2 Methods

* two operations In order to compute a single context-agnostic representation
* subword pooling: the application of a pooling mechanism over the k subword
* context combination to be the mapping from representations of w in different
  contexts to a single static embedding w that is agnostic of context

## Subword Pooling

* we consider four pooling mechanisms: f ∈ {min, max, mean, last}

## Context Combination

* two approaches for specifying contexts and combining the associated reprs
  * Decontextualized: For a word w, we use a single context c 1 = w
    * we feed the single word w into the pretrained model and use the outputted
    * (applying subword pooling if the word is split into multiple subwords)
  * Aggregated: Since the
    * Decontextualized strategy presents an unnatural input to the encoder,
    * we sample n sentences with w from a text corpus D (see §A.2)
    * pooling strategy g ∈ {min, max, mean} to yield a single representation

# 3 Setup

* We begin by verifying that the resulting static embeddings retain repr strengt
  * to ensure that properties we observe of the static embeddings are consistent
    with the original contextualized representations
* we employ an exceptionally simple parameter-free method for
  converting from contextualized to static representations
  * ensure that any properties observed in the latter are not introduced by cler
  * concerns with probing methods/diagnostic classifiers regarding
    whether learning can be attributed to the classifier and not the LM
    (Liu+ 2019a; Hewitt and Liang, 2019)
* static embeddings: Word2Vec (Mikolov+ 2013) and GloVe (Pennington+ 2014)
  * the most prominent pretrained static embeddings for several years
* as the contextualized model: BERT, GPT-2 (Radford+ 2019), XLNet (Yang+ 2019),
  RoBERTa (Liu+ 2019b), DistilBERT (Sanh+ 2019)) and, in total,
  * 9 sets of pretrained weights

# 4 Representation Quality

## 4.1 Evaluation Details

* we evaluate on several word similarity and word relatedness datasets
  * RG65 (Rubenstein and Goodenough, 1965)
  * WS353 (Agirre+ 2009)
  * SimLex999 (Hill+ 2015) and
  * SimVerb3500 (Gerz+ 2016, see §A.4 for more details)

## 4.2 Results

### Pooling Strategy. In Figure 1

* representations are aggregated over N = 100K sentences
* g = mean is the best-performing pooling mechanism
* Fixing g = mean, mean pooling at the subword level also performs best
* consistently holds across pretrained models

### Number of Contexts. In Table 1

* performance for both BERT-12 and BERT-24 steadily increases across all
  datasets with increasing N; this trend holds for the other 7 pretrained LMs
* with N = 1M, the BERT-24 embeddings from the best layer for each dataset
  drastically outperform both Word2Vec and GloVe
* we can fix a particular layer for all datasets and still outperform both
  Word2Vec and GloVe on all datasets

### Relationship between N and model layer, Figure 1

* clear preference towards the first quarter of the model’s layers (layers 0-3)
  with a sharp drop-off in performance immediately thereafter
* consistent with the findings of Liu+ (2019a); Tenney+ (2019a) regarding where
  lexical semantic information is best encoded
* relationship between N and the best-performing layer. The best-performing
  layer monotonically (with a single exception) shifts to be later and later
  * later layers demonstrate greater variance with respect to the layer-wise
    distributional mean and reducing this variance improves performance
* suggest that downstream performance could be further improved by variance redu
  * Ethayarajh (2019) also provides concrete evidence of the tremendous variance
    in the later layers of deep pretrained contextualized models
  * as later layers of the model are generally preferred by downstream
    practitioners (Zhang+ 2020)

### Cross-Model Results

* most tendencies we observe generalize well to all other pretrained models
* noteworthy given that several works have found that different contextualized
  models pattern substantially differently (Liu+ 2019a; Ethayarajh, 2019)
* Table 2,
* All of the models considered were introduced during a similar time period
  and have comparable properties in terms of downstream performance
* their static analogues perform radically differently
  * several do not reliably outperform Word2Vec and GloVe
  * Future work may consider whether this is reflective of the quality of
    context-agnostic lexical semantics from other types of linguistic knowledge
    (e.g.  context modelling, syntactic understanding, and semantic
    composition)
  * linguistic understanding captured by different pretrained weights may be
    substantially different,
    * even for models with near-identical Transformer (Vaswani+ 2017) archit
  * DistilBert outperforms BERT-12 on three out of the four datasets despite
    (Ba and Caruana, 2014; Hinton+ 2015) from BERT-12
    * Jimmy Ba and Rich Caruana
      Do deep nets really need to be deep?
      In NeIPS 2014
    * Geoffrey Hinton, Oriol Vinyals, and Jeffrey Dean
      Distilling the knowledge in a neural network
      2015.  NIPS Deep Learning and Representation Learning Workshop
  * RoBERTa does not reliably outperform the corresponding BERT models

# 5 Bias 5

* existing NLP literature has primarily prioritized gender
* different computational specifications of bias yield markedly different reslts
* an embedding with low bias scores cannot be assumed to be (nearly) unbiased

## 5.1 Definitions

### Bolukbasi+ (2016) introduced a measure of gender bias which assumes access

* set P of (male, female) word pairs where m i and f i only differ in gender
  (e.g.  ‘men’ and ‘women’). They compute a
* gender direction g: g = PCA [m 1 − f 1 , . . . , m n − f n ] [0] where [0]
  indicates the first principal component.  Then, given a set N of target words
  that we are interested in evaluating the bias with respect to, Bolukbasi+
* bias (N ) = mean | cos (w, g) | w∈N BOLUKBASI This definition is
* only applicable to binary bias settings
* assumes the first principal component explains a large fraction of the
  observed variance

### Garg+ (2018) introduced a different definition that is not restricted to

* sets A 1 and A 2 of representative words for each of the two classes
* For each class, μ i = mean w is computed. Garg+ (2018) w∈A i computes the bias
* two ways: dist = Euc or cos
  bias (N ) = mean_w dist(w, μ 1) dist(w, μ 2)
* not rely on the first principal component explaining a large fraction of the
* originally in favor of/against a specific class
* if N = {‘programmer’, ‘homemaker’} and ‘programmer’ was equally male-biased as
  ‘homemaker’ was female-biased, then under the definition of Garg+ (2018),
  there would be no bias in aggregate). To permit comparison, we insert absolute
  values around each term in the mean over N

### Manzini+ (2019) introduced a definition for quantifying multi-class bias

* sets of representative words A 1 , . . . , A k 5 :
  bias (N ) = mean_{w\in N} mean_i mean_{a\in A_i} cos(w, a)

## 5.2 Results

* Inspired by the results of Nissim+ (2020), in this work we transparently
  * results for models beyond BERT appear in Figures 11–18
* We specifically report results for
  * binary gender (male, female),
  * two-class religion (Christianity, Islam) and
  * three-class race (white, Hispanic, and Asian),
  * directly following Garg+ (2018). We study bias
* with respect to target word lists of professions N prof and adjectives N adj
  * not include intersectional biases. The types of biases being evaluated for
  * definitions of bias are grounded in the norms of the United States. All word

### Layer-wise Bias Trends, In Figure 2

* different bias measures for the same social attribute and the same layer not
  even agree in relative judgments
  * gender, we observe that the bias estimated by the definition of
    * Manzini+ (2019) steadily increases before peaking at the penultimate layer
      and slightly decreasing thereafter. In contrast, under bias
    * GARG EUC 5 we see a distribution with two peaks corresponding to layers at
      the start or end of the pretrained model
    * GARG COS uniform across the layers. Similarly, in looking at the
  * religious bias, we see similar inconsistencies with the bias
    * increasing monotonically from layers 2 through 8 under bias , MANZINI
    * decreasing monotonically under bias , and GARG EUC
    * remaining roughly constant under bias GARG COS
* for a specific definition, the relative trends across layers are fairly robust
  to the choice of N (and the choice of A i for gender)

### Consequences. Taken together, our analysis suggests a concerning state of

* it is impossible to properly interpret the of debiasing procedures
  (Bolukbasi+ 2016; Zhao+ 2018a,b; Sun+ 2019) as we cannot reliably estimate the
* current intrinsic measures of social bias may not handle geometric behavior
  such as clustering (Gonen and Goldberg, 2019)

### Cross-Model Bias Trends

* only consider target words given by N prof due to the aforementioned stability
  (and for visual clarity) with results for N adj appearing in Table 8. Since we
* BOLUKBASI not be a reliable indicator since the first principal component
  explains less than 35% of the variance for the majority of distilled embedding
  (Zhao+ (2019a) show similar findings for ELMo). For bias and bias , we find
* MANZINI : RoBERTa embeddings consistently get high scores when
  compared to other distilled embeddings but
* GARG-COS: they are deemed the least biased

### Data alone does not determine bias. Comparing the results for BERT-12 and

* also be a function of the architecture, training procedure, and/or random init

### Takeaways: issues regarding the reliability of bias measures

* pronounced and likely problematic effect of existing bias definitions

# 6 Related Work

## Contextualized → Static

* Akbik+ (2019) introduced an approach that gradually aggregates representations
  during training to accumulate global information and demonstrated improvements
  over only contextualized representations for NER
* May+ (2019) instead synthetically construct a single semantically-bleached
  sentence which is fed into a sentence encoder to yield a static
  representation. In doing so, they introduce SEAT as a means for studying
  biases in sentence encoders by applying WEAT (Caliskan+ 2017) to the resulting
  static representations. This approach appears
  * inappropriate for quantifying bias in sentence encoders 7 as
    * bleached constructions are not representative of this distribution
    * deictic expressions which are difficult to adapt for e.g. verbs (as
* Ethayarajh (2019) considers a similar method to ours where
  * pooling is replaced by PCA
  * demonstrated contextualized representations are highly contextual,
  * our work naturally explores the complementary problem of
    what value can be extracted from the static analogue of these reprs

# 7 Future Directions 8

* improve downstream performance of pretrained contextualized models
  (subword pooling, layer choice,
   beneficial variance reduction via averaging across contexts)
* combined static and dynamic embeddings
  (Peters+ 2018; Bommasani+ 2019; Akbik+ 2019) and our representations may also
* Future research could explore weighting schema in the averaging process
  analogous to SIF (Arora+ 2017) for sentence representations computed via
  averaging (Wieting+ 2016)
* dimensionality reduction may be particularly intriguing
  * often challenging within large multilayered networks like BERT (Sanh+ 2019)
  * successfully demonstrated for static embeddings
    (Nunes and Antunes, 2018; Mu and Viswanath, 2018; Raunak+ 2019)
* choice of the corpus D from which contexts are drawn. For downstream use,
  setting D to be the target domain may serve as a lightweight domain adaptation
  * similar to findings for averaged word representations for out-of-domain
    settings (Wieting+ 2016)

# 8 Discussion and Open Problems

* While contextualized representations retain substantial representational power
  even when reduced to be noncontextual,
  * it is unclear what information is lost
* contextualized representations have been so effective precisely because they
  are tremendously contextual (Ethayarajh, 2019)
* the validity of treating the resulting static embeddings as reliable proxies
  for the original contextualized model still remains open
* human language processing has often been conjectured to have
  both context-dependent and context-independent properties
  (Barsalou, 1982; Rubio-Fernández, 2008; Depraetere, 2014, 2019)
  * our approach may provide an alternative mechanism for clarifying how these
    two properties interact in the computational setting
  * interpretability standpoint (i.e. comparing results for analyses on the
    static embeddings and the original contextualized representations) and a
  * downstream standpoint (i.e.  comparing downstream performance for models
    initialized using the static embeddings and the original contextualized)
  * relationship between the role of context in human vs comp language
    processing
* Theoretical explanation needed for the behavior we observe in two settings
  * why learning contextualized representations and then reducing them to static
    embeddings drastically outperforms directly learning static embeddings
    * GloVe embeddings we use are learned using 6 billion tokens whereas the
      BERT representations were trained on roughly half as much data (3.3 B)
    * reminiscent of the benefits of modelling in higher dimensional settings
      temporarily as is seen in other domains (e.g. the kernel trick and
      Mercer’s theorem for learning non-linear classifiers using inner product
      methods): begin by recasting the problem in a more expressive space
      (contextualized representations) and then project/reduce to the original
      space (static embeddings)
  * reason for the benefits of the variance reduction that we observe
    * best-performing mechanism is to average over many contexts,
    * it may be that approaching the asymptotic mean of the distribution across
      contexts is desirable/helps combat the anisotropy that exists in the
      original contextualized space (Ethayarajh, 2019)

# 9 Conclusion
