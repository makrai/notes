Are Larger Pretrained Language Models Uniformly Better?
  Comparing Performance at the Instance Level
Ruiqi Zhong, Dhruba Ghosh, Dan Klein, Jacob Steinhardt
ACL 2021 Findings arXiv:2105.06020 [cs.CL]

all the pretrained models, model predictions, and code here:
https://github.com/ruiqi-zhong/acl2021-instance-level

* Are Larger language models better on every single instance (datapoint)?
* Some work suggests larger models have
  * higher out-of-distribution robustness,
  * lower accuracy on rare subgroups. To understand these differences
* we investigate these models at the level of individual instances
  * individual predictions are highly sensitive to noise in the randomness in
    training
  * We develop statistically rigorous methods to address this
* our BERT-Large is worse than BERT-Mini on at least 1-4% of instances
  across MNLI, SST-2, and QQP
  * compared to the overall accuracy improvement of 2-10%
* finetuning noise increases with model size
* instance-level improvement from BERT-Mini to BERT-Medium correlates with
  improvement from BERT-Medium to BERT-Large
  * suggest that instance-level predictions provide a rich source of info; we
* we recommend that researchers supplement model weights with model predictions

# 1 Intro

* Are larger models better at every instance, or are they better at some
  * Hendrycks+ (2020) and Desai and Durrett (2020) find that
    larger pretrained models consistently improve out-of-distribution perf,
    which implies that they might be uniformly better at a finer level
  * Henighan+ (2020) claim that
    larger pretrained _image_ models have lower downstream classification loss
    for the majority of instances
    * they predict this trend to be true for other data modalities (eg text)
  * Sagawa+ (2020) find that
    larger non-pretrained models perform worse on rare subgroups
* A naı̈ve solution is to finetune a larger model, compare it to a smaller one,
  and find instances where the larger model is worse
  * hE predictions are noisy at the instance level
  * On MNLI in-domain development set, even the same architecture with diff
    finetuning seeds leads to different predictions on ∼8% of the instances
  * This is due to under-specification (D’Amour+ 2020)
    * ie there are multiple solutions that can minimize the training loss
  * the accuracy improvement from our BERTBASE 1 to BERTLARGE is 2%,
  => most signals across different model sizes will be due to random seeds
* we define instance accuracy:
  “how often a model correctly predicts an instance” (Figure 1 left)
  in expectation across pretraining and finetuning seeds
  * We estimate this quantity by pretraining 10 models with different seeds,
    finetuning 5 times for each pretrained models (Figure 1 middle), and
    averaging across them
  * random baseline to estimate the fraction of false discoveries
    (Section 3, Figure 1 right)
  * formally upper-bound the false discoveries in Section 4
    * better than the classical Benjamini-Hochberg proc with Fisher’s exact tst
* from conclusion: we developed better metrics and statistical tools, including
  * method to control the false discoveries,
  * an unbiased estimator for the decomposed variances, and
  * metrics that compute variance and correlation of improvements conditioned
    on instance accuracy
* we find that, on the MNLI in-domain development set, the accuracy “decays”
  from BERTLARGE to BERTMINI on at least ∼4% of the instances, which is
  * significant given that the improvement in overall accuracy is 10%
  * These decaying instances contain more controversial or wrong labels, but
    also correct ones (Section 4.2)
  * ie larger pretrained language models are not uniformly better

# 2 Data, Models, and Predictions

* we considered different sizes of the BERT architecture and
* finetuned them on
  * Quora Question Pairs (QQP 2 )
  * Multi-Genre Natural Language Inference (MNLI; Williams+ (2020))
  * and the Stanford Sentiment Treebank (SST-2; Socher+ (2013)).
* To account for pretraining and finetuning noise,
  we averaged over multiple random initializations and training data order, and
  thus needed to pretrain our own models
* size: Following Turc+ (2019) we trained 5 architectures of increasing size:
  * MINI (L4/H256, 4 Layers with hidden dimension 256)
  * SMALL (L4/H512)
  * MEDIUM (L8/H512)
  * BASE (L12/H768)
  * LARGE (L24/H1024)
* For each architecture we pre-trained models with 10 different random seeds
  and fine-tuned each of them 5 times (50 total) on each task; see Figure 1 mid
* Since pretraining is computationally expensive, we reduced the context size
  during pretraining from 512 to 128 and compensated by increasing training
  steps from 1M to 2M
  * Appendix A includes more details about pretraining and finetuning cost, and
  * Appendix B: our cost-saving changes do not affect accuracy qualitatively.
* Notation
  * i to index an instance in the evaluation set,
  * s for model sizes, P for pretraining seeds and F for finetuning seeds
  * c is a binary random variable: whether the prediction is correct. Given the
* Unless otherwise noted, we present results on the MNLI in-domain development

# 3 To find the instances where larger models are worse, a

* naı̈ve approach is to finetune a larger pretrained model,
  compare it to a smaller one, and
  find instances where the larger is incorrect but the smaller is correct
  * BERTLARGE is worse than BERTBASE on 4.5% of the instances and better on 7%,
    giving an overall accuracy improvement of 2.5%.
* hE, this is misleading: even if we compare two BERTBASE model with different
  * finetuning seeds, their predictions differ on 8% of the instances, while
    their accuracies differ only by 0.1%
    * Table 1 reports this baseline randomness across model sizes.
  * pretraining seed also changes around 2% additional predictions beyond
    finetuning.
* Table 1 also reports the standard deviation of overall accuracy, which is
  about 40 times smaller.
  * starkly contrasts with the noisiness at the instance level => challenge

## Instance-Level Metrics 

* instance accuracy Acc si: how often models of size s predict instance i corrc
  * expectation is taken with respect to the pre-training and finetuning
    randomness P and F
  * We estimate Acc via the empirical average Acc across 10 pretraining × 5
    finetuning runs
* We histogram Acc in Figure 2 (a)
* instance difference between two model sizes s 1 and s 2: Acc^s2 Acc^s1
  * due to estimation noise, we might falsely observe this accuracy decay by
    chance
* Therefore, we introduce a random baseline s 1 ∆Acc 0 to control for these
  * we have 10 smaller pretrained models and 10 larger ones
  * Our baseline splits these into a
    group A of 5 smaller + 5 larger, and another
    group B of the remaining 5 + 5. Then the empirical accuracies Acc ˆ A and
* our noisy estimate BASE ˆ LARGE ∆Acc has a larger left tail than the
* [the point is in the next section]

# 4 Quantifying the Decaying Instances

* The left tail 
  * of ∆Acc ˆ noisily estimates the fraction of decaying instances,
  * of the random baseline ∆Acc 0 counts the false discovery fraction due to noise
* Intuitively, the true fraction of decaying instances can be captured by the
  difference of these left tails, and we formally quantify this below.
* theorem roughly: the true decaying fraction is at least the difference
  between Decay(t) Decay (t) at every threshold t. Therefore, we take the
  maximum difference between Decay(t) and Decay (t) to lower-bound the fraction
  of decaying instances
  * Figure 4 estimates the true decaying fraction between MINI and LARGE >= 6%
  * for other pairs of model sizes in Table 2, and
  * for the full results across other tasks and model size pairs in Appendix C.
* In all of these settings we find a non-zero fraction of decaying instances,
  * larger model size differences usually lead to more decaying instances.
* hE applying Theorem 1 as above is not fully rigorous, since some finetuning
  runs share the same pretraining seeds and hence are dependent
  * Although we anticipate such dependencies do not cause a substantial
    difference, as discussed in Appendix D.1.
  * To obtain a statistically rigorous lower bound, we slightly modify our
    target of interest. Instead of examining individual finetuning runs, we
    ensemble our model across 5 different finetuning runs for each pretraining
    seed; these predictions are essentially the same as individual finetuning
    runs, except that the finetuning randomness is averaged out.  Hence we
    obtain 10 independent sets of model predictions with different random
    seeds, which allows us to apply Theorem 1.
* We compare MINI to LARGE using these ensembles and report the
  discovery Decay 0 and the baseline Decay in Table 3
  * Taking the maximum difference across thresholds, we estimate at least ∼4%
    of decaying instances
  * lower than the previous 6% estimate, which used the full set of 50 models’
    predictions assuming they were independent.  However, this is
  * nL still a meaningful amount, given that the overall accuracy improvement
    from MINI to LARGE is 10%.

## 4.1 Fisher’s Test + Benjamini-Hochberg

* a more classical approach to lower-bound the decaying fraction
  * This calculation is known as the Benjamini-Hochberg procedure
    (Benjamini and Hochberg, 1995)
  * For each instance, we compute a significance level α under the null
    hypothesis that the larger model is better, using Fisher’s exact test
  * sort the significance levels ascendingly, and call the p th percentile α p
  * pick a false discovery rate q (say, 25%),
    find the largest p s.t. α p < pq, and
    estimate the decaying fraction to be at least p(1 − q)
* compare our method with this classical approach
  * we estimate the lower bound of the decaying fraction for different pairs of
    model sizes with different numbers of pretrained models available
  * To make sure our choice of the false discovery rate q does not bias against
    the classical approach, we adaptively choose q to maximize its performance.
  * Appendix F includes the full results and Table 4 is a representative subset
  * our approach is more powerful,
    particularly when the true decaying fraction is likely to be small and only
    a few models are available, which is usually the regime of interest
  * eg across all pairs of model sizes,
    our approach only needs 2 random seeds (ie pretrained models) to provide
    a non-zero lower bound on the decaying fraction, while
    the classical approach sometimes fails to do this even with 10 seeds.
  * Intuitively, when fewer seeds are available, the smallest possible
    significance level for each instance is larger than the decaying fraction,
    hence hurting the classical approach.

## 4.2 Understanding the Decaying Instances

* whether we can find any interpretable patterns
  * One hypothesis is that all the decaying fractions are in fact mislabeled,
    and hence larger models are not in fact worse on any instances.
* we examined the group of instances where MINI LARGE ∆Acc i ≤ −0.9.
  * MINI is almost always correct on these instances, while
    LARGE is almost always wrong, and the false discovery fraction is tiny
* For each instance, we manually categorize it as either:
  * Correct / Fine / Wrong / Unsure
  * Fine: might be controversial but we could see a reason why this reasonable
  * Each time we annotate, with 50% probability we randomly sample either a
    decaying instance or an instance from the remaining dataset as a control.
  * For each task of MNLI, QQP, and SST-2, the first author annotated 100 insta
  * The second author followed the same procedure => the same qualitative resul
  * We present all the annotated decaying instances in Appendix J.

### Conclusion

* the decaying fraction has more wrong or controversial labels than the remain
* hE even after we adjust for the fraction of incorrect labels,
  the Decay fraction still exceeds the false discovery control. This implies
  => MINI models are better than LARGE models on some correctly labeled instans
* hE no interpretable pattern for these correctly labeled decaying instances by
  simply eyeballing
* future directions to discover interpretable categories in Section 7.

# 5 instance-level accuracy has momentum: improvement from MINI to MEDIUM corrs
with improvement from MEDIUM to LARGE

* naı̈ve approach is to calculate the Pearson ˆ correlation coefficient between
  MINI MEDIUM ∆Acc and MEDIUM ˆ LARGE ∆Acc, and we find the correlation to be 0
  * accuracies being bounded in [0, 1]
    If MEDIUM drastically improves over MINI from 0 to 1, there is no room
    for LARGE to improve over MEDIUM 
  * To remove this inherent negative correlation, we calculate the correlation
    conditioned on the accuracy of the middle-sized model, Acc Therefore, we
    * bucket instances by their estimated MEDIUM accuracy into intervals of
      size 0.1, and we find the correlation to be positive within each bucket
* correlations between improvements become stronger when model size differences
  are smaller. Table 6 row 1 reports results for another model size triplet
  * Results for more tasks and size triplets are in Appendix G and
    the same conclusions hold qualitatively.

# 6 Variance at the Instance Level

* attributes variance of model predictions to pretraining and finetuning random
  seeds,
* result: finetuning seeds cause more variance for larger models
* instance-level predictions provide a rich source of information; we therefore
  recommend that researchers supplement model weights with model predictions

* For each instance, we decompose its loss into three components:
  * Bias^2 ,
  * variance due to pretraining randomness, and
  * variance due to finetuning randomness
* Formally, we consider the 0/1 loss: L i := 1 − c i = (1 − c i ) 2 , (13)
  Bias 2 i := (1 − E P,F [c i ]) 2 ,
  PretVar i := Var P [E F [c i ]],
  FineVar i := E P [Var F [c i ]],

## Conclusion 

* larger models have larger finetuning variance,
* LARGE has smaller pretraining variance than BASE ; however,
* the ordering between other sizes varies across tasks and losses, and
* finetuning variance is 2−8 times as large as pretraining variance, and the
  ratio is bigger for larger models.

# 7 Discussion and Future Directions

* we treated model prediction data as the central object and
  * we built analysis tools around them to obtain a finer understanding of
    model performance
  * refer to this paradigm as “instance level understanding as data mining”
* below We discuss three key factors for this paradigm to thrive:
  * scalability and the cost of obtaining prediction data,
  * other information to collect for each instance, and
  * better statistical tools

## Scalability and Cost of Data: Data mining is more powerful with more data

* many researches follow almost the same recipe of pretraining and finetuning
  (McCoy+ 2020; Desai and Durrett, 2020; Dodge+ 2020) => compute can be saved
* as the SOTA model size is increasing at a staggering speed 7 ,
  most researchers will not be able to run inference on a single instance

## Meta-Labels and Other Predictions: ... with more types of information

* In the HANS (McCoy+ 2019) dataset, the authors tag each instance with a
  heuristic 8 that holds for the training distribution but fails on this insta
  * eg “the label [entailment] is likely if the premise and the hypothesis have
    significant lexical overlap”
* Naik+ (2018a) and Ribeiro+ (2020) associate each instance with a particular
  stress test type or subgroup
  eg whether the instance requires the model to reason numerically or negations
* Nie+ (2020): multiple human responses to estimate human disagree for each ins
  * can potentially help us identify interpretable patterns for the disagreeing
    instances where one model is better than the other
* identifying disagreeing instances between two models can also help us
  generate hypothesis and decide what subgroup information to annotate
* We can also add performance information on other tasks to each instance
  eg Pruksachatkun+ (2020) studied the correlation between syntactic probing
  accuracy (Hewitt and Liang, 2019) and downstream task performance
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
  this approach was known before we started
* Future work can explore more complicated metrics and settings
  * We compared at most 3 different model sizes at a time, and
    higher order comparisons require novel metrics
  * other sources of randomness (than pretraining and finetuning)
    * nL eg differences in pretraining corpus, different model checkpoints,
    * hierarchies of randomness
