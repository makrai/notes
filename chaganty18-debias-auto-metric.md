The price of debiasing automatic metrics in natural language evalaution
Arun Chaganty, Stephen Mussmann, Percy Liang
ACL 2018

# Abstract

* For evaluating generation systems, automatic metrics such as BLEU cost nothing
  * systematic bias against certain model improvements
* we use control variates to combine automatic metrics with human evaluation
  to obtain an unbiased estimator with lower cost than human evaluation alone
* we obtain only a 7-13% cost reduction
  on evaluating summarization and open-response question answering systems
* our estimator is optimal: there is no unbiased estimator with lower cost
* two fundamental bottlenecks—the automatic metric and the prompt shown to human

# 1 Intro

* tasks that require generating natural language, including
  * abstractive summarization (Nallapati+ 2016)
    * open-response question answering (Nguyen+ 2016; Kočisky+ 2017)
    * image captioning (Lin+ 2014)
    * open-domain dialogue (Lowe+ 2017b)
* the evaluation remains a thorny issue because of the diversity of correct resp
* automatic metrics
  * BLEU (Papineni+ 2002),
  * ROUGE (Lin and Rey, 2004),
  * METEOR (Lavie and Denkowski, 2009; Denkowski and Lavie, 2014) and
  * CiDER (Vedantam+ 2015)
* hE, these have shown to be biased, correlating poorly with human metrics
  across different datasets and systems (Liu+ 2016b; Novikova+ 2017)
* control variates (Ripley, 2009), where
  we average differences between human judgments and automatic metrics
  rather than averaging the human judgments alone. Provided the two are
  correlated, our estimator will have lower variance and thus reduce cost
* our estimator is optimal in the sense that no unbiased estimator using the
  same automatic metric can have lower variance
* We also analyze its data efficiency (equivalently, cost savings)—
  * the factor reduction in number of human judgments needed to obtain the same
    accuracy versus naive human evaluation—and show that it
  * depends solely on two factors:
    * the annotator variance, a function of the human evaluation prompt
    * the correlation between human judgments and the automatic metric
  * This factorization allows us to calculate typical and best-case
* we evaluate our estimator on SOTA systems from two tasks,
  * summarization on the CNN/Daily Mail dataset (Hermann+ 2015; Nallapati+ 2016)
  * open-response question answering on the MS MAR-COv1.0 dataset (Nguyen+ 2016)
* To study our estimators offline, we preemptively collected 10,000 human judgms
  * cover several tasks and systems. 1 As predicted by the theory, we find that
  * If the automatic metric had perfect correlation, our data efficiency would
    be around 3, while
  * if we had noiseless human judgments, our data efficiency would be about 1.5
  * In reality, the reduction in cost we obtained was only about 10%,
    suggesting that improvements in both automatic metric and evaluation prompt
    are needed.  As one
* an example of how evaluation prompts could be improved, we found that
  using post-edits of summarizes decreased normalized annotator variance by a
  factor of three relative to using a Likert scale survey. It should be noted
* future
  * improve the automatic metric (which is potentially as difficult as the task)
  * alternative ways of soliciting evaluation (which has been less explored)

# 4 Tasks and datasets

## Evaluating language quality in automatic summarization

* We focus on the language quality of summaries

# 6 Related work

* improving the quality of automatic metrics. In particular, there is interest
  * models (Lowe+ 2017a; Dusek+ 2017) that can optimize for improved correlation
    * have trouble generalizing to different systems
    * our framework allows us to safely incorporate such models into evaluation,
      exploiting them when their correlation is high but also not introducing
      bias when it is low
* control variates, a standard statistical technique used to reduce the variance
  of Monte Carlo estimates (Ripley, 2009)
  * in machine learning and reinforcement learning to lower variance estimates
    of gradients (Greensmith+ 2004; Paisley+ 2012; Ranganath+ 2014)
  * we are the first to apply this technique in the context of language eval
* the importance of human evaluation
  * Chaganty+ (2017) identified a similar problem of systematic bias in eval met
    in the setting of knowledge base population and also propose stat estimators
    hE, relies on having a structured output (relation triples) that are shared
    between systems and does not apply to evaluating NLG. In a similar vein,
  * Chang+ (2017) dynamically collect human feedback to learn dialog policies
