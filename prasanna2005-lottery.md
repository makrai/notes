When BERT Plays the Lottery, All Tickets Are Winning
Sai Prasanna, Anna Rogers, Anna Rumshisky
EMNLP 2020 arXiv:2005.00561 [cs.CL]

# Abstract

* Large Transformer-based models were shown to be reducible
  to a smaller number of self-attention heads and layers
* We consider this phenom from the perspective of the lottery ticket hypothesis
  using both structured and magnitude pruning
* For fine-tuned BERT, we show that
  * it is possible to find subnetworks achieving performance that is comparable
    with that of the full model, and
  * similarly-sized subnetworks sampled from the rest of the model perf worse
* with structured pruning
  even the worst possible subnetworks remain highly trainable
  * ie most pre-trained BERT weights are potentially useful
* the success of "good" subnetworks can be attributed to superior ling knowledge
  * hE they are unstable, and
  * no meaningful self-attention patterns
* from the conclusion: pre-trained BERT's success could have more to do with
  optimization surfaces rather than specific bits of linguistic knowledge

# 1 Intro

* Transformer-based models are overparametrized
  * most Transformer heads and even layers can be pruned without signif loss
    (Voita+ 2019; Kovaleva+ 2019; Michel+ 2019)
* probing BERT for various kinds of linguistic information (Rogers+ 2020b)
* our perspective: lottery ticket hypothesis (Frankle and Carbin, 2019)
  * a systematic case study of finetuning BERT on GLUE tasks (Wang+ 2018)
  * we compare magnitude-based weight pruning and importance-based pruning
    of BERT self-attention heads (Michel+ 2019),
    * which we extend to multi-layer perceptrons (MLPs) in BERT
  * With both techniques, we find the “good” subnetworks that achieve
    * 90% of full model performance, and
    * perform considerably better than similarly-sized subnetworks sampled from
      other parts of the model
  * nL in many cases even the “bad” subnetworks can be
    re-initialized to the pre-trained BERT weights and fine-tuned separately
    to achieve strong performance
  * the “good” networks are unstable across random inits at fine-tuning, and
    their self-attention heads do not necessar encode meaningful ling patterns

# 2 Related Work

* BERT is considerably overparametrized
  * it is possible to ablate elements of its architecture
    without loss in performance or even with slight gains
    (Kovaleva+ 2019; Michel+ 2019; Voita+ 2019)
  * BERT compression studies (Sanh+ 2019; Jiao+ 2019; McCarley, 2019; Lan+ 2020)
* lottery ticket hypothesis
  * While NLP focused on building larger Transformers,
    the computer vision community was exploring the Lottery Ticket Hypothesis
    (LTH: Frankle and Carbin, 2019; Lee+ 2018; Zhou+ 2019)
  * “dense, randomly-initialized, feed-forward networks contain subnetworks
    (winning tickets) that – when trained in isolation – reach test accuracy
    comparable to the original network in a similar number of iterations”
    (Frankle and Carbin, 2019)
  * The “winning tickets” generalize across
    * vision datasets (Morcos+ 2019), and
    * NLP: both in LSTM and Transformer models (Yu+ 2020)
  * LTH work focused on the “winning” random initializations
* this paper and concurrent work by Chen+ (2020): LTH in overparam context
  * The two papers provide complementary results for magnitude pruning
  * we also study structured pruning, posing the question of
    whether “good” subnetworks can be used as a tool to understand BERT
  * Gordon+ (2020) also explores magnitude pruning, showing that BERT pruned
    before fine-tuning still reaches performance similar to the full model
* Ideally, the pre-trained weights would provide transferable ling knowledge,
  fine-tuned only to learn a given task
  * hE we do not know what knowledge actually gets used for inference
  * BERT is as prone as other models to rely on dataset biases
    (McCoy+ 2019b; Rogers+ 2020a; Jin+ 2020; Niven & Kao, 2019; Zellers+ 2019)
  * probing BERT architecture blocks for different linguistic properties
    (Rogers+ 2020b)
    * If there are “good” subnetworks, they might explain how BERT works

# 3 Methodology

## 3.3 Structured Pruning

* Michel+ (2019) estimate the importance of attention heads as the expected
  sensitivity to the mask variable ξ (h,l) : use a binary mask variable ξ (h,l)
* We follow Michel+ in applying the recommendation of Molchanov+ (2017) to
  normalize the importance scores of the attention heads layer-wise (with `l_2`
  norm) before pruning. To mask the heads, we

# 5 Interpreting BERT’s Subnetworks

* In subsection 4.2 we showed that
  the subnetworks found by m-and s-pruning behave similarly in finetuning
  * hE s-pruning has an advantage in that
    the functions of BERT architecture blocks have been extensively studied
    (see detailed overview by Rogers+ (2020b))
  * If the better performance of the “good” subnetworks comes from ling knowl,
    they could tell a lot about the reasoning BERT actually performs at infer

## 5.1 Stability of the “Good” Subnetworks

## 5.2 How Linguistic are the “Good” Subnetworks?

* probing classifiers for specific linguistic functions
  * A popular method of studying functions of BERT architecture blocks is to
  hE “the fact that a linguistic pattern is not observed by our probing
  classifier does not guarantee that it is not there, and
  the observation of a pattern does not tell us how it is used” (Tenney+ 2019)
* we use the types of self-attention patterns, which Kovaleva+ (2019)
  * a cruder, but more reliable alternative
  * classified as diagonal (attention to previous/next word), block (uniform
    attention over a sentence), vertical (attention to punctuation and special
    tokens), vertical+diagonal, and heterogeneous (everything else) (Fig 4a)
  * The fraction of heterogeneous attention can be used as
    an upper bound estimate on non-trivial linguistic information. In other
  * ie patterns do not guarantee that a given head has some interpretable func
* This analysis is performed by image classification
  on generated attention maps from individual heads (100 for each GLUE task),
  * small CNN classifier with six layers. The classifier was
  * trained on the dataset of 400 annotated attention maps by Kovaleva+ (2019)
  * Note that attention heads can be seen as
    a weighted sum of linearly transformed input vectors
* L2-norm of the transformed input
  * Kobayashi+ (2020): the input vector norms vary considerably, and
  * the inputs to the self-attention mechanism can have a disproport impact
    relative to their self-attention weight
  * So we consider both the
    * raw attention maps, and,
    * to assess the true impact of the input in the weighted sum,
      the L2-norm of the transformed input multiplied by the attention weight
      (for which we annotated 600 more attention maps
      with the same pattern types as Kovaleva+ (2019))
  * The weighted average of F1 scores of the classifier on annotated data was
    0.81 for the raw attention maps, and 0.74 for the normed attention
* Our results suggest that
  the super-survivor heads do not preferentially encode non-trivial ling rels
  (heterogeneous pattern), in either raw or normed self-attention (Figure 4b)
  As compared to all 144 heads (Figure 4c)
  * the “raw” attention patterns of super-survivors encode
    considerably more block and vertical attention types
  * norming reduces attention to special tokens,
  => the proportion of diagonal patterns (ie attention to previous/next tokens)
  is increased at the cost of vertical+diagonal pattern
  * Interestingly, for 3 tasks, the super-survivor subnetworks still heavily
    rely on the vertical pattern even after norming
  * The vertical pattern indicates a crucial role of the special tokens
    * it seems to be less important for MNLI rather than QNLI, MRPC or QQP
    * unclear why
* The number of block pattern decreased, and we hypothesize that
  they are now classified as heterogeneous (as they are unlikely to look diag).
  * But even with the normed attention, the utility of super-survivor heads
    cannot be attributed only to their linguistic functions (especially given
    that the fraction of heterogeneous patterns is only a rough upper bound).
  * The Pearson’s correlation between heads being super-survivors and their
    having heterogeneous attention patterns is
    0.015 for the raw, and 0.025 for the normed attention
  * Many “important” heads have diagonal attention patterns, which seems redund
* the same anal for the attention patterns in pre-trained vs fine-tuned BERT
  for both super-survivors and all heads, and found
  * no considerable change after fine-tuning, which is
  consistent with findings by Kovaleva+ (2019).  Full data in Appendix F
* this result does not exclude the possibility that
  linguistic information is encoded in certain combinations of BERT elements
  * BERT analysis studies focused on the functions of individual components
    (Voita+ 2019; Htut+ 2019; Clark+ 2019; Lin+ 2019; Vig and Belinkov, 2019;
    Hewitt and Manning, 2019; Tenney+ 2019 + overview by Rogers+ (2020b)), and
  * this evidence points to the necessity of looking at their interactions. It
    * ongoing discussion of interpretability of self-attention
      (Jain and Wallace, 2019; Serrano and Smith, 2019;
       Wiegreffe and Pinter, 2019; Brunner+ 2020)
* More sophisticated alternatives to heterogenerous pattern counts
  * patterns are only a crude upper bound estimate on potentially interpretable
  * eg the recent information-theoretic probing by minimum description length
    (Voita and Titov, 2020) avoids the problem of false positives with
    traditional probing classifiers

## 5.3 Information Shared Between Tasks

# 6 Discussion

* whether the “bad” subnetworks do well because
  * even they contain some linguistic knowledge (no), or
  * just because GLUE tasks are overall easy and
    could be learned even by
    random BERT (Kovaleva+ 2019), or even any sufficiently large model (yes)
* we did not find even the “good” subnetworks to be stable, or preferentially
  containing the heads that could have interpretable linguistic functions,
  the latter seems more likely
* the same question with respect to not only subnetworks, but also full models,
  such as BERT itself and all the follow-up Transformers?
  * There is a trend to automatically credit any new SOTA model with better
    knowledge of language
  * what if the success of pretraining is rather due to the
    flatter and wider optima in the optimization surface (Hao+ 2019)?
    * Can similar loss landscapes be obtained from other, non-linguistic
      pre-training tasks?
    * initial results pointing in that direction:
      even training on MIDI music is helpful for transfer learning for LM task
      with LSTMs (Papadimitriou and Jurafsky 2020)
