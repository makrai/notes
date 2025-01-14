Revisiting Few-sample BERT Fine-tuning
Tianyi Zhang, Felix Wu, Arzoo Katiyar, Kilian Q Weinberger, Yoav Artzi
ICLR 2021

Code: github asappresearch/revisit-bert-finetuning

# Abstract

* commonly observed instabilities in few-sample scenarios
* We identify several factors that cause this instability
  * the common use of a
    non-standard optimization method with biased gradient estimation
  * the limited applicability of significant parts of the BERT network for
    down-stream tasks
  * pre-determined, and small number of training iterations: prevalent practice
* We identify alternative practices that resolve the instability of the process
  * revisit recently proposed methods to improve few-sample fine-tuning
  * the impact of these methods diminishes significantly with our modified proc

# 1 Intro

* footnote
  * Fine-tuning instability is also receiving significant practitioner attenton
    eg https://github.com/zihangdai/xlnet/issues/96 and
    https://github.com/huggingface/transformers/issues/265
* remedies we experiment with for each issue have overlapping effect
  * eg allocating more training iterations can eventually compensate for
    using the non-standard biased optimizer
  * the combination of a bias-corrected optimizer and re-initializing some of
    the pre-trained model parameters can reduce fine-tuning computational costs
* we re-evaluate several techniques proposed to stabilize few-sample fine-tunin
  (Phang+ 2018; Lee+ 2020; Howard & Ruder, 2018)
  * show a significant decrease in their impact

# 2 Background and related work

## Fine-tuning

* two sources of randomness
  * the weight initialization of the new output layer and the
    data order in the stochastic fine-tuning optimization
* Phang+ 2018; Lee+ 2020; Dodge+ 2020: these factors can influence the results
  significantly, especially on small datasets (ie < 10K examples)

## Fine-tuning Instability

* The instability of the BERT fine-tuning process has been known since its
  introduction (Devlin+ 2019), and various solutions have been proposed
* Phang+ (2018): fine-tuning the pre-trained model on a large intermediate task
* Lee+ (2020): a new regularization method
  * constrain the fine-tuned model to stay close to the pre-trained weights
* Dodge+ (2020): an early stopping method to filter out bad random seeds
* Concurrently to our work, Mosbach+ (2020) also show that
  BertAdam leads to instability during fine-tuning
* training models from scratch (Popel & Bojar, 2018; Nakkiran+ 2019)

## BERT Representation Transferability

* BERT pre-trained representations have been widely studied using probing
* the pre-trained features from intermediate layers are more ~ to new tasks
  * transferable
    (Tenney+ 2019b;a; Liu+ 2019a; Hewitt & Manning, 2019; Hewitt & Liang, 2019)
  * applicable (Zhang+ 2020)
  * than features from later layers, which change more after fine-tuning
    (Peters+ 2019; Merchant+ 2020)
* Concurrent to our work
  * Li+ (2020) propose to re-initialize the final fully-connected layer of a
    ConvNet and show performance gain for image classification
  * Tamkin+ (2020) adopt a similar methodology of weight re-initialization
    (Section 5) to study the transferability of BERT
    * find the layers that contribute the most in transfer learning
    * relation between probing performance and transferability

# 3 Experimental methodology

# 4 Optimization algorithm: debiasing omission in BertAdam

* The most commonly used optimizer for fine-tuning BERT is BertAdam
  * a modified version of the Adam first-order stochastic optimization method
  * difference from the original Adam algorithm (Kingma & Ba, 2014):
    omitting a bias correction step
  * introduced by Devlin+ (2019)
  * in common open source libraries, including the official implementation,
    huggingface’s Transformers (Wolf+ 2019), AllenNLP (Gardner+ 2018),
    GluonNLP (Guo+ 2019), jiant (Wang+ 2019c), MT-DNN (Liu+ 2020), and FARM
  * => widely used in both industry and research
    (Wang+ 2019a; Phang+ 2018; Lee+ 2020; Dodge+ 2020; Sun+ 2019; Clark+ 2020;
    Lan+ 2020; Houlsby+ 2019; Stickland & Murray, 2019; Liu+ 2019b)
  * influences the learning rate, especially early in the fine-tuning process,
  * one of the primary reasons for instability in fine-tuning BERT
    (Devlin+ 2019; Phang+ 2018; Lee+ 2020; Dodge+ 2020)
* Algorithm 1 shows the Adam algorithm
  * highlights the omitted line in the non-standard BertAdam implementation
  * At each optimization step (lines 4–11), Adam computes the exponential
    moving average of the gradients (`m_t`) and the squared gradients (`v_t`),
    where `β_1`, `β_2` parameterize the averaging (lines 7–8)
  * Because Adam initializes `m_t` and `v_t` to 0 and sets exponential decay
    rates `β_1` and `β_2` close to 1, the estimates of `m_t` and `v_t` are
    heavily biased towards 0 early during learning (when `t` is small)
  * Kingma & Ba (2014) compute the ratio between the biased and the unbiased
    estimates m_t : v_t as (1 − β_1 t) : (1 − β_2 t)
    * This ratio is independent of the training data
  * The model parameters θ are updated in the direction of the averaged
    gradient `m_t` divided by the square root of the second moment `√v_t` (l 11)
  * BertAdam omits the debiasing (lines 9–10), and
    directly uses the biased estimates in the parameters update
* Figure 1 shows the ratio `m̂/√v̂` t between the update using the biased and the
  unbiased estimation as a function of training iterations
  * bias is relatively high early during learning, indicating overestimation
  * converges to one, suggesting that when training for sufficient iterations,
    the estimation bias will have negligible effect
  * => the bias ratio term is most important early during learning to
    counteract the overestimation  of `m_t` and `v_t` during early iterations
  * In pract, Adam adaptively re-scales the learn rate by `1−β_2^t / √1−β_1^t`
  * correction is crucial for BERT fine-tuning on small datasets
    (ie with fewer than 10k training samples) because
    they are typically fine-tuned with less than 1k iterations (Devlin+ 2019)
    * The figure shows the number of training iterations
      for RTE, MRPC, STS-B, CoLA, and MNLI
    * MNLI is the only one of this set
      with a large number of supervised training examples
    * For small datasets, the bias ratio is significantly higher than one for
      the entire fine-tuning process, implying that these datasets suffer
      heavily from overestimation in the update magnitude
    * In comparison, for MNLI, the majority of fine-tuning occurs in the region
      where the bias ratio has converged to one
    * This explains why fine-tuning on MNLI is known to be relatively stable
      (Devlin+ 2019)
* We evaluate the importance of the debiasing step empirically by
  fine-tuning BERT with both BertAdam and the debiased Adam 9
  for 50 random seeds on RTE, MRPC, STS-B, and CoLA
  * Figure 2 summarizes the performance distribution
  * The bias correction significantly reduces the performance variance
    across different random trials and the four datasets
  * Without the bias correction we observe many degenerate runs, where
    fine-tuned models fail to outperform the random baseline
    * eg RTE, 48% of fine-tuning runs have an accuracy less than 55%, which is
      close to random guessing
  * Figure 3 further illustrates this difference by plotting
    the mean and the range of training loss during fine-tuning
    across different random trials on RTE
    * Figure 11 in Appendix F shows similar plots for MRPC, STS-B, and CoLA
    * The biased BertAdam consistently leads to worse averaged training loss,
      and on all datasets to higher maximum training loss
    * ie models trained with BERTAdam are underfitting and
      the root of instability lies in optimization

# 5 Initialization: re-initializing BERT pre-trained layers

* methods for careful initialization of deep neural networks (Glorot & Bengio
  2010; He+ 2015; Zhang+ 2019; Radford+ 2019; Dauphin & Schoenholz 2019)
* During fine-tuning, the BERT parameters take the roles:
  * initialization point for the fine-tuning optimization process, while also
  * capturing the information transferred from pre-training
* The common approach for BERT fine-tuning is to
  initialize all layers except one specialized output layer with the pre-traind
* We study the value of transferring all the layers
  vs ignoring the information learned in some layers
  * motivated by object recognition transfer learning results showing that
    lower pre-trained layers learn more general features while
    higher layers closer to the output specialize more to the pre-train tasks
    (Yosinski+ 2014)
* Existing methods using BERT show that
  using the complete network is not always the most effective choice,
  * as we discuss in Section 2
  * Our empirical results further confirm this: we observe that
    transferring the top pre-trained layers slows down learning and hurts perf

# 6 Training iterations: fine-tuning BERT for longer

* BERT is typically fine-tuned with a slanted triangular learning rate
  * linear warm-up to the learning rate followed by a linear decay
  * warrants deciding the number of training iterations upfront [in advance]
  * Devlin+ (2019) recommend fine-tuning GLUE datasets for three epochs
    * adopted broadly for fine-tuning (Phang+ 2018; Lee+ 2020; Dodge+ 2020)
    * We study the impact of this choice, and observe that
      this one-size-fits-all three-epochs practice for BERT fine-tuning is
      sub-optimal
    * Fine-tuning BERT longer can improve both training stability & model perf

# 7 Revisiting existing methods for few-sample BERT fine-tuning

* methods for stability (Devlin+ 2019; Phang+ 2018; Lee+ 2020; Dodge+ 2020)
* We revisit these methods given our analysis of the fine-tuning process,
  focusing on the impact of using the debiased Adam instead of BertAdam (Sec 4)
* with the unbiased Adam they are less effective with respect to the
  improvement in fine-tuning stability and performance

# 8 Conclusion

* the debiasing omission in BertAdam is the main cause of
  degenerate models on small datasets commonly observed in previous work
  (Phang+ 2018; Lee+ 2020; Dodge+ 2020)
* the top layers of the pre-trained BERT provide a detrimental initialization
  for fine-tuning and delay learning
  * Simply re-initializing these layers not only speeds up learning but also
    leads to better model performance
* the common one-size-fits-all three-epochs practice for BERT fine-tuning is
  sub-optimal and allocating more training time can stabilize fine-tuning
* we revisit several methods proposed for stabilizing BERT fine-tuning
  * their positive effects are reduced with the debiased Adam
* future: extend our study to different pre-training objectives & model archits
  * how model parameters evolve during fine-tuning
