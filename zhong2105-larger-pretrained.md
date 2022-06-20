Are Larger Pretrained Language Models Uniformly Better? Comparing Performance at the Instance Level
Ruiqi Zhong, Dhruba Ghosh, Dan Klein, Jacob Steinhardt
ACL 2021 Findings arXiv:2105.06020 [cs.CL]

all the pretrained models, model predictions, and code here: 
https://github.com/ruiqi-zhong/acl2021-instance-level

* Are Larger language models better on every single instance (datapoint)?
* Some work suggests larger models have 
  higher out-of-distribution robustness,
  lower accuracy on rare subgroups. To understand these differences
* we investigate these models at the level of individual instances. However,
  * hE individual predictions are highly sensitive to noise in the randomness
    in training
  * We develop statistically rigorous methods to address this, and after
    accounting for pretraining and finetuning noise, we find that
* our BERT-Large is worse than BERT-Mini on at least 1-4% of instances
  across MNLI, SST-2, and QQP
  * compared to the overall accuracy improvement of 2-10%.  We also find that
* finetuning noise increases with model size and that
* instance-level improvement from BERT-Mini to BERT-Medium correlates with
  improvement from BERT-Medium to BERT-Large
  * suggest that instance-level predictions provide a rich source of info; we
  * we recommend that researchers supplement model weights with model preds
  
# 1 Intro
  
* Are larger models better at every instance, or are they better at some
  * Hendrycks+ (2020) and Desai and Durrett (2020) find that
    larger pretrained models consistently improve out-of-distribution perf,
    which implies that they might be uniformly better at a finer level.
  * Henighan+ (2020) claim that
    larger pretrained image models have lower downstream classification loss
    for the majority of instances, and they predict this trend to be true for
    other data modalities (eg text)
  * Sagawa+ (2020) find that
    larger non-pretrained models perform worse on rare subgroups; if this
* A naı̈ve solution is to finetune a larger model, compare it to a smaller one,
  and find instances where the larger model is worse
  * hE predictions are noisy at the instance level
  * On MNLI in-domain development set, even the same architecture with diff
    finetuning seeds leads to different predictions on ∼8% of the instances.
  * This is due to under-specification (D’Amour+ 2020), where
    there are multiple different solutions that can minimize the training loss.
  * the accuracy improvement from our BERTBASE 1 to BERTLARGE is 2%,
  => most signals across different model sizes will be due to random seeds
* we define instance accuracy as “how often a model correctly predicts an
  instance” (Figure 1 left) in expectation across pretraining and finetuning
  seeds
  * We estimate this quantity by pretraining 10 models with different seeds,
    finetuning 5 times for each pretrained models (Figure 1 middle), and
    averaging across them.
  * random baseline to estimate the fraction of false discoveries (Section 3,
    Figure 1 right) and
  * formally upper-bound the false discoveries in Section 4. Our method
    * better upper bound than the classical Benjamini-Hochberg procedure with
      Fisher’s exact test.
* from conclusion: we developed better metrics and statistical tools, including
  * method to control the false discoveries,
  * an unbiased estimator for the decomposed variances, and
  * metrics that compute variance and correlation of improvements conditioned
    on instance accuracy
* we find that, on the MNLI in-domain development set, the accuracy “decays”
  from BERTLARGE to BERTMINI on at least ∼4% of the instances, which is
  significant given that the improvement in overall accuracy is 10%
  * These decaying instances contain more controversial or wrong labels, but
    also correct ones (Section 4.2).
  * Therefore, larger pretrained language models are not uniformly better.

# 5 instance-level accuracy has momentum: improvement from MINI to MEDIUM corrs
with improvement from MEDIUM to LARGE 

# 6 Variance at the Instance Level

* attributes variance of model predictions to pretraining and finetuning random
  seeds, 
* result: finetuning seeds cause more variance for larger models.  Our findings
* instance-level predictions provide a rich source of information; we therefore
  recommend that researchers supplement model weights with model predictions.

# 7 Discussion and Future Directions

* we treated model prediction data as the central object and built
  * analysis tools around them to obtain a finer understanding of model perfor-
  * refer to this paradigm as “instance level understanding as data mining”.
* We discuss three key factors for this paradigm to thrive:
  * scalability and the cost of obtaining prediction data,
  * other information to collect for each instance, and
  * better statistical tools. We analyze each of these aspects below.

## Scalability and Cost of Data Data mining is more powerful with more data.

* many researches follow almost the same recipe of pretraining and finetuning
  (McCoy+ 2020; Desai and Durrett, 2020; Dodge+ 2020), much computation can be
* as the SOTA model size is increasing at a staggering speed 7 , most
  researchers will not be able to run inference on a single instance.

## Meta-Labels and Other Predictions Data mining is more powerful with more

* In the HANS (McCoy+ 2019) dataset, the authors tag each instance with a
  heuristic 8 that holds for the training distribution but fails on this
  instance
  * eg “the label [entailment] is likely if the premise and the hypothesis have
    significant lexical overlap”.
* Naik+ (2018a) and Ribeiro+ (2020) associate each instance with a particular
  stress test type or subgroup
  eg whether the instance requires the model to reason numerically or negations
* Nie+ (2020): multiple human responses to estimate human disagree for each ins
  * can potentially help us identify interpretable patterns for the disagreeing
    instances where one model is better than the other
* identifying disagreeing instances between two models can also help us
  generate hypothesis and decide what subgroup information to annotate.
* We can also add performance information on other tasks to each instance. For
  eg Pruksachatkun+ (2020) studied the correlation between syntactic probing
  accuracy (Hewitt and Liang, 2019) and downstream task performance.
* Turc+ (2019) and Kaplan+ (2020) studied the corr between LM loss and downstrm
  * hE not analyze correlations at the instance level
  * ie whether their results hold on the instance level: if an instance is
    easier to tag by a probe or easier to predict by a larger language model,
    is the accuracy likely to be higher?

## Statistical Tools 

* Initially we used the Benjamini-Hochberg procedure with Fisher’s exact test,
  which required us to pretrain 10 models to formally verify that the decaying
  instances exist
* nL later realized that 2 is in fact enough by using our approach introduced
  in Section 4. We could have saved 80% of the computation for pretraining if
  this approach was known before we started.
* Future work can explore more complicated metrics and settings
  * We compared at most 3 different model sizes at a time, and higher order
    comparisons require novel metrics
  * sources of randomness, pretraining and finetuning, but other sources of
    * nL eg differences in pretraining corpus, different model checkpoints,
    * hierarchies of randomness
