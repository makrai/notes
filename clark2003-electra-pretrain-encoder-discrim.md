Kevin Clark, Minh-Thang Luong, Quoc V. Le, Christopher D. Manning
ELECTRA: Pre-training Text Encoders as Discriminators Rather Than Generators
ICLR 2020 https://arxiv.org/abs/2003.10555

https://github.com/google-research/electra

# Abstract

* we propose replaced token detection. Instead of masking the input
  * corrupts [text] by replacing some tokens with
    plausible alternatives sampled from a small generator
* more efficient than MLM because the task is defined over all input tokens
* substantially outperform BERT given the same model size, data, and compute
  * particularly for small models; for example, we train a model on one GPU for
    4 days that outperforms GPT (trained using 30x more compute) on the GLUE
* performs comparably to RoBERTa and XLNet while using less than 1/4 compute &
  outperforms them when using the same amount of compute

# 1 Introduction

* Current SOTA representation learning methods for language
  * can be viewed as learning denoising autoencoders (Vincent+ 2008)
    * select a small subset of the unlabeled input sequence (typically 15%),
    * mask the identities of those tokens (e.g., BERT; Devlin+ (2019)) or
    * attention to those tokens (e.g., XLNet; Yang+ (2019)), and
    * then train the network to recover the original input
  * more effective than conventional LM pre-training due to bidirectional repr
  * substantial compute cost because the network only learns from 15%
* we propose replaced token detection, a pre-training task in which the model
  * to distinguish real input tokens from plausible but synthetically generated
  * replacements from a small masked language model
* solves a mismatch in BERT (although not in XLNet) where
  * BERT sees artificial [MASK] tokens during pre-training
    but not when being fine-tuned on downstream tasks
* We then pre-train the network as a discriminator
  * In contrast, MLM trains the network as a generator that predicts the
    original identities of the corrupted tokens
  * our model learns from all input tokens instead of just the small masked-out
    subset, making it more computationally efficient
* Although our approach is reminiscent of training the discriminator of a GAN,
  * not adversarial in that the generator is trained with maximum likelihood
    due to the difficulty of applying GANs to text (Caccia+ 2018)
* ELECTRA for "Efficiently Learning an Encoder that Classifies Token Replacem"
  * we apply it to pre-train Transformer text encoders (Vaswani+ 2017)
  * ablations, we show that learning from all input positions causes ELECTRA to
    * much faster than BERT
    * higher accuracy on downstream tasks when fully trained
* we train ELECTRA models of various sizes and
  evaluate their downstream performance vs. their compute requirement
  * tasks
    * GLUE natural language understanding benchmark (Wang+ 2019) and
    * SQuAD question answering benchmark (Rajpurkar+ 2016)
  * ELECTRA substantially outperforms MLM-based methods such as BERT and XLNet
    given the same model size, data, and compute (see Figure 1)
    * ELECTRA-Small model
      * can be trained on 1 GPU in 4 days
      * outperforms
        * a comparably small BERT model by 5 points on GLUE, and even outperfor
        * the much larger GPT model (Radford+ 2018)
    * also works well at large scale, where we train an ELECTRA-Large model
      * performs comparably to RoBERTa (Liu+ 2019) and XLNet (Yang+ 2019),
        despite having fewer parameters and using 1/4 of the compute for train
  * outperforms ALBERT (Lan+ 2019) on GLUE and sets a new SOTA for SQuAD 2.0

# 2 Method 2

* two neural networks, a generator G and a discriminator D.
* Each one primarily consists of an encoder (e.g., a Transformer network) that
* For a given position t, (in our case only positions
  * where x t = [MASK]), the generator outputs a probability for generating a
    particular token x t with a softmax layer: X
  * discriminator predicts whether the token x t is “real,” i.e., that it comes
    * with a sigmoid output layer: D(x, t) = sigmoid(w T h D (x) t ) The
* generator is trained to perform masked language modeling (MLM)
  * Typically k = d0.15ne, i.e., 15% of the tokens are masked out.
* Although similar to the training objective of a GAN, there are several diffs.
  * if the generator happens to generate the correct token, that token is
    considered “real” instead of “fake”; we found
    * this formulation to moderately improve results on downstream tasks.  More
  * generator is trained with maximum likelihood rather than adversarially
    because it is impossible to backpropagate through sampling from the gen
    * we experimented circumventing this issue by using reinforcement learning
    * see Appendix F), this performed worse than maximum-likelihood training.
  * we do not supply the generator with a noise vector as input, as is typical
  * combined loss `min_{θ_G ,θ_D} \sum_x∈X L_MLM (x, θ_G) + λ L_Disc (x, θ_D)`

# 3 Experiments 4

## 3.1 Experimental Setup

* General Language Understanding Evaluation (GLUE) benchmark (Wang+ 2019) and
  * tasks
    * textual entailment (RTE and MNLI)
    * question-answer entailment (QNLI)
    * paraphrase (MRPC)
    * question paraphrase (QQP)
    * textual similarity (STS)
    * sentiment (SST)
    * linguistic acceptability (CoLA). See Appendix C for more details
  * metrics are Spearman correlation for STS, Matthews correlation for CoLA,
    and accuracy for the other GLUE tasks;
    * we generally report the average score over all tasks
* Stanford Question Answering (SQuAD) dataset (Rajpurkar+ 2016).  For SQuAD, we
  * versions
    * 1.1: models select the span of text answering a question, and
    * 2.0, in which some questions are unanswerable by the passage. We use the
  * metrics of Exact-Match (EM) and F1 scores
* pre-train on
  * For most experiments, the same data as BERT:
    * 3.3 Billion tokens from Wikipedia and BooksCorpus (Zhu+ 2015).  However,
  * for our Large model: the data used for XLNet (Yang+ 2019), which
    * extends the BERT dataset to 33B tokens by including data from ClueWeb
      (Callan+ 2009), CommonCrawl, and Gigaword (Parker+ 2011).  All of the
  * English data. Multilingual data in the future
* Our model architecture and most hyperparameters are the same as BERT’s
  * fine-tuning
    * GLUE, we add simple linear classifiers on top of ELECTRA. For
    * SQuAD, we add the question-answering module from XLNet on top of ELECTRA,
      * slightly more sophisticated than BERT’s in that it
        * jointly rather than independently predicts the start and end positions
        * “answerability” classifier added for SQuAD 2.0
* Some of our evaluation datasets are small, which means accuracies of
  fine-tuned models can vary substantially depending on the random seed
  * We therefore report the median of 10 fine-tuning runs from the same
  *  appendix for further training details and hyperparameter values

## 3.2 Model Extensions

* same model size and training data as BERT-Base.

### Weight Sharing ... between the generator and discriminator.

* we only share the embeddings (both the token and positional embeddings) of
* because the generator is smaller than the discriminator
* The “input” and “output” token embeddings of the generator are always tied as
  in BERT
* GLUE scores are 83.6 for no weight tying, 84.3 for tying token embeddings,
  and 84.4 for tying all weights.
* We hypothesize that ELECTRA benefits from tied token embeddings because
  * discriminator only updates tokens that are present in the input or are
    sampled by the generator, the
  * generator’s softmax over the vocabulary densely updates all token embeds.
* tying all encoder weights caused little improvement
  while [badly] requiring the generator and discriminator to be the same size

### Smaller Generators

* If the generator and discriminator are the same size, training ELECTRA would
  take around twice as much compute per step as training only with MLM
* we make models smaller by decreasing only the layer sizes
* We also explore using an extremely simple “unigram” generator
* models work best with generators 1/4-1/2 the size of the discriminator. We
  * too strong of a generator may pose a too-challenging task for the discrim,
    preventing it from learning as effectively. In particular, the
  * discriminator may have to use many of its parameters modeling the generator

### Training Algorithms

* these did not end up improving results
* The proposed training objective jointly trains the generator and discrim.
* We experiment with instead using the following two-stage training procedure:
  1. Train only the generator with `L_MLM` for n steps.
  2. Initialize the weights of the discriminator with the weights of the
     generator. Then train the discriminator with `L_Disc` for n steps
  * requires having the same size for the generator and discriminator. We found
  * without the weight initialization the discriminator would sometimes fail
    to learn at all beyond the majority class, perhaps because the generator
    started so far ahead of the discriminator.
* Joint training naturally provides a curriculum for the discriminator where
  * generator starts off weak but gets better throughout training.
* We also explored training the generator adversarially as in a GAN, using
  reinforcement learning to accommodate the discrete operations of sampling
  from the generator
  * Although still outperforming BERT, we found adversarial training to
    underperform maximum-likelihood training.
  * Further analysis suggests the gap is caused by two problems with adversari
    1. adversarial generator is simply worse at masked language modeling
       [compared to] MLE-trained one. We believe the worse accuracy is
      * mainly due to the poor sample efficiency of reinforcement learning when
        working in the large action space of generating text. Secondly, the
    2. adversarially trained generator produces a low-entropy output
       * most of the probability mass is on a single token
    * Both problems have been observed in GANs for text (Caccia+ 2018)

## 3.3 Small Models

* single GPU. Starting with the BERT-Base hyperparameters, we reduced the
  * sequence length (from 512 to 128),
  * batch size (from 256 to 128)
  * hidden dimension size (from 768 to 256)
  * token embeddings (from 768 to 128). To provide a fair
* comparison, we also train a
  * BERT-Small model using the same hyperparameters We train BERT-Small for
  * two less resource-intensive pre-training methods based on LM:
    ELMo (Peters+ 2018) and GPT (Radford et al., 2018)
* We also show results for a base-sized ELECTRA model comparable to BERT-Base.
* Appendix D for stronger small-sized and base-sized models trained with more
* ELECTRA-Small performs remarkably well given its size, achieving a higher
  * GLUE, 5 points higher than a comparable BERT-Small model and even
    outperforms the much larger GPT model.  ELECTRA-Small is
  * trained mostly to convergence, with models trained for even less time (as
    little as 6 hours) still achieving reasonable performance.  While small
* distilled models can also achieve good GLUE scores (Sun+ 2019b; Jiao+ 2019),
* base-sized ELECTRA model substantially outperforms BERT-Base and even
  outperforms BERT-Large (which gets 84.0 GLUE score)

## 3.4 Large models

* big ELECTRA models to measure the effectiveness of the replaced token
  detection pre-training task at the large scale of current state-of-the-art
* same size as BERT-Large but are trained for much longer.  In particular, we
  * 400k steps (ELECTRA-400K; roughly 1/4 the pre-training compute of RoBERTa)
  * 1.75M steps (ELECTRA-1.75M; similar compute to RoBERTa).  We use a batch
    * comparison is not entirely direct. As a baseline, we trained our own
* GLUE dev set are shown in Table 2.
  * ELECTRA-400K performs comparably to RoBERTa and XLNet. However, it took
    * less than 1/4 of the compute to train ELECTRA-400K as it did to train
  * ELECTRA-1.75M) results in a model that outscores them on most GLUE tasks
    while still requiring less pre-training compute. Surprisingly, our baseline
* SQuAD are shown in Table 4. Consistent, with the GLUE results, ELECTRA scores
  * ELECTRA-400K
    * outperforms RoBERTa-100k and our BERT baseline, which use similar amounts
    * performs comparably to RoBERTa-500K despite using less than 1/4th of the
  * ELECTRA-1.75M scores higher than previous models on the SQuAD 2.0
  * ELECTRA-Base also yields strong results, scoring
    * substantially better than BERT-Base and XLNet-Base, and even
    * surpassing BERT-Large according to most metrics.
  * ELECTRA generally performs better at SQuAD 2.0 than 1.1.
    * Perhaps replaced token detection is particularly transferable to the
      answerability classification of SQuAD 2.0

## 3.5 Efficiency analysis

* We have suggested that posing the training objective over a small subset of
  tokens makes masked language modeling inefficient. However, it isn’t entirely
* not obvious MLM model still receives a large number of input tokens even
* we compare a series of other pre-training objectives that are designed to be
* a set of “stepping stones” between BERT and ELECTRA
  * ELECTRA 15%: ELECTRA but only the 15% of the tokens that was masked out
  * Replace MLM: MLM but masked-out tokens replaced with generated tokens
    * tests to what extent ELECTRA’s gains come from solving the discrepancy
      of [MASK] tokens during pre-training but not fine-tuning
  * All-Tokens MLM: Like in Replace MLM but model predicts the identity of all
    * a combination of BERT and ELECTRA. Note that
* Results are shown in Table 5. First, we find that ELECTRA is greatly
  * ELECTRA 15% performs much worse than ELECTRA. Secondly, we find that BERT
  * Replace MLM slightly outperforms BERT. We note that BERT (including our)
  * All-Tokens MLM: closes most of the gap between BERT and ELECTRA
* In total, these results suggest
  * a large amount of ELECTRA’s improvement <~ learning from all tokens and a
  * smaller amount <~ alleviating the pre-train fine-tune mismatch
* The improvement of ELECTRA over All-Tokens MLM suggests that the ELECTRA’s
  gains come from more than just faster training:
  * We speculate that ELECTRA is more parameter-efficient than BERT because
    ELECTRA does not have to model the full token distribution at each position

# 4 Related work

## Self-Supervised Pre-training for NLP

* word representations (Collobert+ 2011; Pennington+ 2014)
* contextual representations of words through
  objectives such as LM (Dai & Le, 2015; Peters+ 2018; Howard & Ruder, 2018)
* BERT (Devlin+ 2019) pre-trains a large Transformer (Vaswani+ 2017) at MLM
  * extensions to BERT
    * MASS (Song+ 2019) and UniLM (Dong+ 2019) extend BERT to generation tasks
      by adding auto-regressive generative training objectives
    * ERNIE (Sun+ 2019a) and SpanBERT (Joshi+ 2019) mask out contiguous
      sequences of token for improved span representations
    * [these ideas] may be complementary to ELECTRA
    * XLNet (Yang+ 2019) masks attention weights such that the
      * input sequence is autoregressively generated in a random order
      * same inefficiencies as BERT because XLNet only generates 15%
      * Like ELECTRA, XLNet not requiring [MASK] tokens
      * XLNet still incosistent: two “streams” of attention during pre-training
        but only one for fine-tuning
  * BERT can effectively be distilled down to a smaller model
    * TinyBERT (Jiao+ 2019) and MobileBERT (Sun+ 2019b)

## Generative Adversarial Networks GANs (Goodfellow+ 2014)

* Radford+ (2016) propose using the discriminator of a GAN in downstream tasks,
* applied to text data (Yu+ 2017; Zhang+ 2017), although SOTA approaches still
  lag behind standard maximum-likelihood training (Caccia+ 2018; Tevet+ 2018)
* our generator is particularly reminiscent of MaskGAN (Fedus+ 2018), which
  trains the generator to fill in tokens deleted from the input

## Contrastive Learning

* modalities: text (Smith & Eisner, 2005), images (Chopra+ 2005), and
  video (Wang & Gupta, 2015; Sermanet+ 2017)
* approaches
  * embedding spaces where related data points are similar (Saunshi+ 2019) or
  * rank real data points over negative samples (Collobert+ 2011; Bordes+ 2013)
* ELECTRA is particularly related to
  Noise-Contrastive Estimation (NCE, Gutmann & Hyvärinen, 2010)
  * binary classifier to distinguish real and fake data points
* Word2Vec (Mikolov+ 2013) uses contrastive learning
  * ELECTRA can be viewed as a massively scaled-up version of CBOW with NS
  * CBOW also
    * predicts an input token given surrounding context and
    * negative sampling rephrases the learning task as a binary classification
  * bag-of-vectors encoder rather than a transformer and
  * simple proposal distribution derived from unigram token frequencies
