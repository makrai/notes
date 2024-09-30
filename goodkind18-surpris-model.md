Predictive power of word surprisal for reading times is
  a linear function of language model quality
Adam Goodkind, Klinton Bicknell
Workshop on Cognitive Modeling and Computational Linguistics (CMCL 2018)

# Abstract

* known: there are large effects of a word’s probability in context
  on how long it takes to read it
  * quantified using information-theoretic surprisal, or the amount of new
    information conveyed by a word
* we compare surprisals derived from a collection of language models derived
  from n-grams, neural networks, and a combination of both. We show that
* the models’ psychological predictive power improves
  as a tight linear function of language model linguistic quality. We also show
* the size of the effect of surprisal is estimated consistently
  across all types of language models
* These findings point toward surprising robustness of surprisal estimates and
  * surprisal estimated by low-quality language models are not biased.

# 1 Intro

* surprisal theory (Hale, 2001; Levy, 2008), which states that
  processing difficulty of a word w in context c is proportional to its
  information-theoretic surprisal, defined as − log p(w|c). As a word is more
  likely to occur in its context, and thus communicates less information
  (Shannon, 1948), it is read more quickly.
* Cloze task (Taylor, 1953)
  * hE estimates of a word’s probability in context. One way of estimating such
  * give human subjects a context, have them guess the next word, and estimate
    p(w|c) as the proportion of participants who guess word w in context c
  * may yield reliable estimates for words that have relatively high probs in
    their context, and it has been
  * used in a number of studies of the effects of probabilities in context on
    reading. However, it is an open question whether these human guess-derived
  * may be biased from objective probabilities in some way (Smith & Levy, 2011)
  * cannot in principle yield reliable estimates of word probabilities in
    context that are relatively low, say less than 1 in 100, as many word
    probabilities are, without requiring an extremely large number of
    participants (Levy, 2008).
  * not practical to use the Cloze task to estimate probabilities for large
    datasets on which surprisal is often studied, for which there can easily be
    tens of thousands of contexts that would require estimation.
* estimate the probabilities of words in context using computational LMs, which
  * trained on large language corpora to estimate the probs of words in context
    * Many studies of surprisal have used such language models (Hale 2001;
      Levy 2008; Demberg & Keller 2008; Mitchell+ 2010; Monsalve+ 2012)
  * still substantially worse than humans at predicting upcoming words, meaning
    * mismatch between the probabilities p(w|c) being estimated computationally
      and the implicit probabilities in the brains of readers
    * question of to what extent we can trust results about the effects of
      surprisal as estimated by such language models. To try to get some
      information about possible biases that might exist in our results based
      on language models being worse than humans at predicting upcoming words,
      poor linguistic quality, we can
* compare a range of computational language models of varying linguistic
  quality and see how the estimated effects of surprisal change. If there is a
  trend in results as the linguistic quality of the language models improves,
  that would provide evidence that such a trend may be even more present in
  language models with human-level linguistic quality.

* rapid progress in computational language modeling, enabled by recent advances
  in neural networks. As a result, the linguistic quality of contemporary
  language models is far beyond what has been used in previous work studying
  surprisal. In this paper, we address both these concerns by analyzing how the
  predictive power of these surprisal estimates, their psychological quality,
  varies as a function of language model linguistic quality and type.

* the shape of the effects of surprisal on reading times, because of
  * theories that predict it to be linear (Levy, 2008; Smith & Levy, 2013;
    Bicknell & Levy, 2010)
  * A secondary goal of this work is to investigate
    whether the shape of this effect depends on language model quality or type.

* we compare surprisal estimates using a range of language models of varying
  linguistic qualities and types, from the n-gram models that have been used in
  most previous work on surprisal to SOTA LSTM and interpolated-LSTM models.
  * We assess the predictive ability and the size and shape of surprisals de-
    rived from each language model using
    generalized additive mixed-effects models (Wood, 2017)
    fit to a corpus of eye movements in reading.

# 2 the set of language models we compare and the linguistic quality of each.

# 3 linear: quantify the ability of surprisals derived from each language model to
predict reading times and
* see the extent to which this changes with language model type and quality,
  assuming that effects of surprisal on reading times are linear. In

# 4 non-linear: we do the same but allow surprisal to have non-linear effects,
and we additionally use the non-linear models to assess whether there is
evidence that the shape of the surprisal effect changes with language model
type or quality.

# 5 concludes.

* a strong effect of language model linguistic quality on the predictive power
  of surprisals estimated from that language model for reading times. This
  * regardless of whether surprisal is modeled as a linear or non-linear
  * remarkable consistency Across language models
    * LMs varied by more than a factor of 4 in perplexity, the
    * size of the effect of surprisal was estimated to be the similar and the
      shape of the effect of surprisal was estimated to be roughly linear.
  * suggest that we can put a reasonable amount of trust in results about
    surprisal estimated with computational language models,
    despite the SOTA still being far from human quality.

* the language models were composed seems to play a role in its fit to the data
  * LSTM-based model does seem to be somewhat of a low-performing outlier.
  * hE, when the LSTM model is used with the 5-gram model in interpolation,
    these yield superior results

* A number of studies have used the Dundee eyetracking corpus in conjunction
  with a probabilistic language model
  * Demberg & Keller (2008), using less sophisticated linear models, found that
    surprisal is an accurate measure of processing complexity as measured by
    eye gaze duration. According to Demberg & Keller (2008),
    * greater word surprisal invokes higher “integration costs,” which accounts
      for prolonged gaze duration.

* In a neural network LM, word dependencies can span an arbitrary word distance
  * ie not all dependencies are contingent upon adjacent words or even a
    neighboring word
  * eg ellipsis can span multiple clause boundaries to resolve an anaphoric rel
  * For this reason, surprisal that accounts for the hierarchical structure of
    language has also been studied, to see if taking hierarchy into account can
    better predict eye gaze duration
  * Frank & Bod (2011) concludes that including hierarchy information does not
    better account for variance compared to a sequencebased model.  According
    * hierarchical information does not noticeably affect the generation of
      expectations of the following word.
  * Fossum & Levy (2012) make various modifications to the Frank & Bod models,
    * additional lexical information to the unlexicalized hierarchical models.
    * hierarchical information, when properly lexicalized, can improve
      sequence-only lexical models
  * Similarly, Mitchell+ (2010) created a model that
    interpolates syntactic and distributional semantic information, and found
    that this improved the prediction of eye tracking durations.

* As this bears on the present study, the
  LSTM model is able to detect word relationships that span arbitrary distances
  * While the LSTM model is not explicitly representing hierarchical info, the
    model does capture long distance information. Our results show that the
    LSTM model outperforms the purely n-gram models in terms of predictive
    capabilities. Thus, while we do not need to build hierarchical information
    explicitly into our model, the long-distance information does improve both
    linguistic and psychological accuracy
  * This could point to the conclusion that
    eye gaze duration is also sensitive to, if not hierarchical information,
    then information provided at a long distance from the current word.

* In a similar vein to our results, Monsalve+ (2012) shows that
  perplexity of a language model (linguistic accuracy) bears a strong rel to
  the log likelihood of a reading time model (psychological accuracy)
  * key differences between this study and ours is that
    * Monsalve+ (2012) analyzes self-paced reading data rather than eye-tracking,
    * we use higher-performing SOTA language models.

* the present study can be viewed as a follow-up to Smith & Levy (2013).
  * measured the shape of the surprisal curve, similar to our exper in Sec 4
  * hE, the present study demonstrates that the the
    effect of surprisal is still linear
    even with much more (linguistically and psychologically) accurate LMs

* extra-sentential context
  * As many studies have noted (Monsalve+ 2012; Frank+ 2013),
    a corpus such as the Dundee corpus, collected from newspapers, often
    requires a great deal of global, extra-sentential context. Therefore,
  => when processing a given sentence, the reader must also take into account
  information provided many sentences prior, or even not provided in the
  document at all. This limitation could impact the results reported herein.

* improving the linguistic accuracy of language models will improve the models’
  ability to make psychological predictions
  * Despite possible limitations, the results above provide consistent evidence
  * This underscores the importance of understanding language structure in
    order to better understand cognitive processes such as eye gaze duration.
