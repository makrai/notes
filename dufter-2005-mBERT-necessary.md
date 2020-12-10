Identifying Necessary Elements for BERT's Multilinguality
Philipp Dufter, Hinrich Schütze
EMNLP 2020 arXiv:2005.00396

https://github.com/pdufter/minimult

# Abstract

* efficient setup with small BERT models trained on a mix of synthetic and
  natural data
* we
  * identify four architectural and two linguistic elements that influence
  * initial experiments to create a model with higher degree of multilinguality
    * modifies the masking strategy using unsupervised embedding alignment
      (VecMap)
    * XNLI with three languages indicate that our findings transfer to larger
      scale settings (Section 5)

# 1 Intro

* multilingual BERT
  * BERT-Base model (Devlin+ 2019)
  * trained on the 104 largest Wikipedias with a
    shared subword vocabulary. There is no additional crosslingual signal
  * high-quality multilingual representations
    (Pires+ 2019; Wu and Dredze, 2019; Hu+ 2020)
* The exact reason for mBERT’s multilinguality is still debated
  * K+ (2020)
  * provide an extensive study and conclude that a
    shared vocabulary is not necessary, but that
    the model needs to be deep and languages need to share a similar “structure”
  * Artetxe+ (2020): neither a shared vocabulary nor joint pretraining is reqred
  * Conneau+ (2020b)
    * models across languages can be easily aligned
    * necessary requirement is shared parameters in the top layers
* We find indications that six elements influence the multilinguality of BERT
  Figure 1 summarizes our main findings

## 1.1 Contributions

* [requirement is] a limited number of parameters
  * By forcing the model to use its parameters efficiently
  * generalization and multilinguality might be conflicting goals
* shared ~ contribute to multilinguality, in line with (Conneau+ 2020b)
  * special tokens ([UNK], [CLS], [SEP], [MASK], [PAD]), shared
  * position embeddings and the common
  * masking strategy to replace masked tokens with random words
* identical structure across languages, but an
  * inverted word order in one language destroys multilinguality
  * Similarly having shared position embeddings contributes to multilinguality
* We conduct experiments on Wikipedia and evaluate on XNLI to show that our
  findings transfer to larger scale settings

# 2 Setup and Hypotheses

## 2.1 Setup

### Languages

* K+ (2020): Fake-English created by shifting unicode points by a large cons
* we simply shift token indices after tokenization by a constant; shifted tokens
  are prefixed by “::” and added to the vocabulary
* shifting indices and unicode code points have similar effects, but
  * BERT tokenizer treats some punctuation as special symbols (e.g.,
    “dry-cleaning” is tokenized as [“dry”, “-”, “##cleaning”], not as
    [“dry”, “##-”, “##cleaning”])

### Data

* For fast experimentation, a small corpus with limited vocabulary is desirable
* English Easy-to-Read version of the Parallel Bible Corpus (Mayer & Cysouw, 14)
* training data: New Testament
  * By creating a Fake-English version of this corpus we get a shifted replica
    and thus a sentence-parallel corpus
* development data: same procedure to the first 10k sentences of the Old Testam
* All our evaluations are performed on development data,
  except for word translation and when indicated explicitly

### Vocabulary of size 2048 from the Easy-to-Read Bible

* Using the same vocabulary for English and Fake-English yields a final
  vocabulary size of 4096

### Model

* BERT-Base architecture (Devlin+ 2019), modified to achieve a smaller model:
* BERT-small: we divide hidden size, intermediate size of the feed forward layer
  and number of attention heads by 12; thus, hidden size is 64 and intermediate
  size 256
* this leaves us with a single attention head,
  * K+ (2020) found that the number of attention heads is not important
  * neither for overall performance nor for multilinguality. We call this
* untrained: consistency check for our experiments we consider random embeddings

### Training Parameters. We mostly use the original training parameters

## 2.2 Evaluation

* We evaluate two properties of our trained language models: the
  degree of multilinguality and –
  as a consistency check – the overall model fit

### 2.2.1 Multilinguality

* three tasks
* layer: We use layer 0 (uncontextualized) and layer 8 (contextualized)
  * layer 8 works well for monolingual and multilingual tasks
    (Tenney+ 2019; Hewitt and Manning, 2019; Sabet+ 2020)
  * layer 0 includes position and segment embeddings besides the token
    embeddings as well as layer normalization

#### Word Alignment. Sabet+ (2020) find that mBERT performs well

* By construction, we have a sentence-aligned corpus with English and Fake-En
* To extract word alignments from BERT we use Sabet+ (2020)’s Argmax method
  * Two wordpieces i and j are aligned if
    (i = arg max S l,j ) ∧ (j = arg max S i,l )
* The alignments are evaluated using precision, recall and F 1

#### Sentence Retrieval is popular for evaluating crosslingual representations

* (Artetxe and Schwenk, 2019; Libovickỳ+ 2019)
* sentence embedding e s simply by averaging vectors across all tokens
  (ignoring CLS and SEP tokens). Computing cosine similarities sentences
* Given an English query sentence s i , we obtain the retrieved sentences in
  Fake-English by ranking them according to similarity and vice versa
* we report the mean precision of [the two] directions

### We also evaluate word translation

* Again, by construction we have a ground-truth bilingual dictionary
* word vectors by feeding each word to BERT in the form “[CLS] {token} [SEP]”
* We then evaluate word translation like sentence retrieval

#### Multilinguality Score

* by averaging retrieval and translation results across both layers
* We omit word alignment here as it is not a suitable measure to compare all
  models: with shared position embeddings, the task is almost trivial given
  that the gold alignment is the identity alignment

### 2.2.2 Model Fit. MLM Perplexity. To verify that BERT has trained

## 2.3 Architectural Properties

#### Overparameterization: overparam. If BERT is severely overparameterized the

* Given our small training corpus and the small number of languages, we argue
  that BERT-base is overparameterized
* For the overparameterized model we use learning rate 1e-4 
  (following Devlin+ (2019))

#### Shared Special Tokens: shift-special

* shared vocabulary is not essential for multilinguality
  (K+ 2020; Artetxe+ 2020; Conneau+ 2020b)
  Similar to prior studies, in our setting each language has its own vocabulary,
* in prior studies, special tokens ([UNK], [CLS], [SEP], [MASK], [PAD]) are
  usually shared across languages. Shared special tokens
  * may contribute to multilinguality because they are very frequent and
    could serve as “anchor points”.  To investigate this,
  * we shift the special tokens with the same shift as applied to token indices

#### Shared Position Embeddings: lang-pos

* Position and segment embeddings are usually shared across languages
* We investigate the[m] by using language-specific position (lang-pos) and
  segment embeddings

#### Random Word Replacement: no-random

* The MLM task as proposed by Devlin+ (2019) masks 15% of tokens in a sentence
  These tokens are replaced with “[MASK]” in p [mask] = 80%,
  remain unchanged in p [id] = 10% and are
  replaced with a random token of the vocabulary in p [rand] = 10% of the cases
  * The randomly sampled token can come from any language resulting in
    Fake-English tokens to appear in English sentences and vice-versa. We
    hypothesize that this random replacement could contribute to multilinguality
  * We experiment with the setting p = (0.8, 0.2, 0.0) where p denotes the triple
  (p [mask] , p [id] , p [rand] )

## 2.4 Linguistic Properties

### Inverted Word Order: inv-order

* K+ (2020) shuffled word order in sentences randomly and
  found that word order has some, but not a severe effect on multilinguality
* We invert each sentence in the Fake-English corpus
  * apart from the reading order, all properties of the languages are preserved,
    including ngram statistics
  * struct similarity of English and Fake-English is arguably very high

### Comparability of Corpora: no-parallel

* We hypothesize that the similarity of training corpora contributes to
  “structural similarity”: if we train on a parallel corpus we expect the
  language structures to be more similar than when we train on two independent
* For mBERT, Wikipedias across languages are in the same domain, share some
  articles and thus are comparable, yet not parallel. To test our hypothesis,
* we train on a non-parallel corpus. We create it by splitting the Bible into
  two halves, using one half for English and Fake-English each, thus avoiding
  any parallel sentences during training

# 3 Results 5

## 3.1 Architectural Properties

* original
  * alignment is an easy task with shared position embeddings yielding F 1 = 1.00
    * even untrained works
  * Retrieval works better with contextualized representations on layer 8 (.97)
  * word translation works better on layer 0 (.88 vs. .79), as expected
  * see Figure 4 for a PCA of token embeddings
  * untrained BERT models perform poorly (IDs 18, 19), except for word alignment
* When applying our architectural modifications
  * individually we see medium to slight decreases in multilinguality
  * lang-pos has the largest negative impact
  * applying just a single modification can be compensated by the model. Indeed,
  * two modifications at a time (5–7) multilinguality goes down more,
    * only with shift-special;no-random there is still a high degree of
  * all three modifications (8) the degree of multilinguality is drastically
* language model quality (see columns MLM-Perpl.) is stable on train and dev
* The overparameterized model (ID 15) exhibits lower scores for word trans, but
  higher ones for retrieval and overall a lower multilinguality score
  * lang-pos (16) or apply all three architectural modifications (17),
    multilinguality drops to .01 and .00
* trade off: by decoupling languages with the proposed modifications (lang-pos,
  shift-special, no-random) and greatly increasing the number of parameters
  (overparam), it is possible to get a well-performing language model (low perp)
  * the four archit properties together are necessary for BERT to be multiling

## 3.2 Linguistic Properties

* Our hypothesis is that the drop in multilinguality with inverted word order
  comes from an incompatibility between word and position encodings:
  * BERT needs to learn that the word at position 0 in English is similar to
    word at position n in FakeEnglish. However, n (the sentence length) varies
  * relative position embeddings – rather than absolute – might be beneficial
* Figure 8 shows cosine similarities between position embeddings for models 1&9
  * no inv: clear yellow diagonal at the beginning, which weakens at the end
* In the range 90–128 (a rare sentence length) the similarities look random
  * smaller position embeddings are trained more than larger ones

## 3.3 Corpus Comparability

* multilinguality indeed decreases as the training corpus becomes non-parallel

## 3.4 Multilinguality During Training

* hypothesis: BERT becomes multilingual at the point at which it is forced to
  use its parameters efficiently. We argue that this point depends on several
* Figure 6 shows model fit and multilinguality for the small and large model
  settings over training steps
* multilinguality rises very late at a stage where model fit improvements are
  flat. In fact,
* most of multilinguality in the overparameterized setting (15) arises once the
  model starts to overfit and perplexity on the development set goes up. The
* it indicates trade-off between good generalization and multilinguality
  * By overfitting a model one could achieve high multilinguality
* Conneau+ (2020a) introduced the concept of “curse of multilinguality” and
  * number of parameters should be increased with the number of languages.  Our
    results indicate that too many parameters can also harm multilinguality
* in practice it is difficult to create a model with so many parameters that it
  is overparameterized when being trained on 104 Wikipedias
* Rönnqvist+ (2019) found that current multilingual BERT models may be
  undertrained. This is consistent with our findings

# 4 Improving Multilinguality

* mBERT [already has] shared position embeddings, shared special tokens and we
  cannot change linguistic properties of languages +  mBERT may already be
  considered underparameterized given that it is trained on 104 large Wikipedias
* knn-replace: insight from no-random: replacing masked words with random tokens
  * We propose replacing masked tokens with semantically similar words from
    other languages
  * we train static fastText embeddings (Bojanowski+ 2017) on the training set
  * project them into a common space using VecMap (Artetxe+ 2018)
  * replace masked tokens with nearest neighbors from the other language (k=5)
  * probs (p [mask] , p [id] , p [rand] , p [knn] ) = (0.5, 0.1, 0.1, 0.3),
  * procedure (including VecMap) is fully unsupervised
  * Conneau+ (2020b) performed similar experiments by creating code switched
    data and adding it to the training data
* Figure 7: retrieval and translation have higher scores earlier
  * Towards the end multilinguality scores become similar, with knn-replace
    outperforming the original model (see Table 1).  This finding is
    particularly important for training BERT on large amounts of data. Given how
    expensive training is, it may not be possible to train a model long enough
    to obtain a high degree of multilinguality
  * Longer training incurs the risk of overfitting as well

# 5 Real Data Experiments effectiveness

* BERT model on English, German and Hindi
* corpora: we sample 1GB of data from Wikipedia (except for Hindi, as < 1GB )
  * we use BERT-base, not BERT-small because we found that BERT-small with less
  * Each language has its own vocabulary with size 20k
* We then evaluate the pretrained models on XNLI (Conneau+ 2018). We fine-tune
  the pretrained models on English XNLI. Then the model is evaluated on English.
  In addition, we do a zero-shot evaluation on German and Hindi
* Table 3. en: accuracy is significantly lower but reasonable on English (.75)
  * high multilinguality with 0-shot accuracies .57 and .45. 
  * Inverting the order of German has little effect on HIN, but DEU drops
    significantly. Our architectural modifications (8) harm both HIN and DEU 
  * knn-replace model exhibits the strongest degree of multilinguality, boosting
    the 0-shot accuracy in DEU / HIN by 4% / 9%. Note
* to accommodate noise in the real world data, we randomly replace with one of
  the five nearest neighbors. This indicates that knn-replace is useful for real
  world data and that our prior findings transfer to larger scale settings

# 6 Related work

* the reason for BERT’s multilinguality
  * Singh+ (2019) show that BERT stores language representations in different
    subspaces and investigate how subword tokenization influences
    multilinguality
  * Artetxe+ (2020) show that neither a shared vocabulary nor joint pretraining is
    essential for multilinguality
  * K et al. (2020) extensively study reasons for multilinguality 
    (e.g., researching depth, number of parameters and attention heads). They
    * depth is essential. They also investigate 
    * language properties: "structural similarity" across languages is
      important, without further defining this term
  * Conneau+ (2020b) find that a 
    * shared vocabulary is not required. They find that 
    * shared parameters in the top layers are required for multilinguality.
    * different monolingual BERT models exhibit a similar structure and thus
      * mBERT somehow aligns those isomorphic spaces. They 
    * investigate having 
      separate embedding look-ups per language (including position embeddings
      and special tokens) and 
      a variant of avoiding cross-language replacements.  
    * Their method “extra anchors” yields a higher degree of multilinguality
* creating better multilingual models
  * Mulcaire+ (2019) proposed a method to learn multilingual contextual
    representations
  * Conneau and Lample (2019) introduce the translation modeling objective
  * Conneau+ (2020a) propose XLM-R. They introduce the term “curse of multiling”
    and show that multilingual model quality degrades with an increased number
    of languages given a fixed number of parameters
  * Cao+ (2020) improve the multilinguality of mBERT by introducing a
    regularization term in the objective, similar to the creation of static
    multilingual embedding spaces
  * Huang+ (2019) extend mBERT pre-training with three additional tasks and
    show an improved overall performance
  * Pfeiffer+ (2020) (adapters) and Chi+ (2020) (parallel data)
* mBERT across a range of languages and zero-shot tasks (not the reasons for it)
  * parsing and NER (Pires+ 2019; Wu and Dredze, 2019),
  * word alignment and sentence retrieval (Libovickỳ+ 2019) and
  * language generation (Rönnqvist+ 2019);
  * Hu+ (2020) show this for 40 languages and 9 tasks
  * Wu and Dredze (2020) consider the performance on up to 99 languages for NER
  * Lauscher+ (2020) show limitations of the zero-shot setting and
  * Zhao+ (2020) observe poor performance of mBERT in reference-free MT eval

# 7 Conclusion

* which architectural and linguistic properties are essential for BERT crossling
  * Shared position embeddings, shared special tokens, replacing masked tokens
    with random tokens and a limited amount of parameters are necessary elems
  * Word order is relevant: BERT is not multilingual with one language inverted
  * The comparability of training corpora contributes to multilinguality.  We
* our findings transfer to larger scale settings. We experimented with a simple
* obtain stronger multilinguality in BERT models and demonstrate it on XNLI
  * We considered a fully unsupervised setting without any crosslingual signals
* future work: we plan to incorporate crosslingual signals
  * fully unsupervised setting is hard to motivate (Vulić+ 2019)
