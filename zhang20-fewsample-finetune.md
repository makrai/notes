Revisiting Few-sample BERT Fine-tuning
Tianyi Zhang, Felix Wu, Arzoo Katiyar, Kilian Q Weinberger, Yoav Artzi
ICLR 2021

Code: github asappresearch/revisit-bert-finetuning

# Abstract

* commonly observed instabilities in few-sample scenarios
* We identify several factors that cause this instability
  * the common use of a non-standard optimization method with biased gradient
    estimation
  * the limited applicability of significant parts of the BERT network for
    down-stream tasks
  * pre-determined, and small number of training iterations
    * prevalent practice
* We identify alternative practices that resolve the instability of the process
  * re-visit recently proposed methods to improve few-sample fine-tuning
  * the impact of these methods diminishes significantly with our modified proc

# 1 Intro

* footnote
  * Fine-tuning instability is also receiving significant practitioner attentio
    eg https://github.com/zihangdai/xlnet/issues/96 and
    https://github.com/huggingface/transformers/issues/265
* remedies we experiment with for each issue have overlapping effect. For
  * eg allocating more training iterations can eventually compensate for using
    the non-standard biased optimizer, even though
  * the combination of a bias-corrected optimizer and re-initializing some of
    the pre-trained model parameters can reduce fine-tuning computational costs
* we re-evaluate several techniques proposed to stabilize few-sample fine-tunin
  (Phang+ 2018; Lee+ 2020; Howard & Ruder, 2018)
  * show a significant decrease in their impact

# 2 Background and related work

## Fine-tuning

* two sources of randomness
  * the weight initialization of the new output layer and the
    data order in the stochastic fine-tuning optimization. Existing work
* Phang+ 2018; Lee+ 2020; Dodge+ 2020 show that these factors can influence the
  results significantly, especially on small datasets (i.e., < 10K examples).

## Fine-tuning Instability

* The instability of the BERT fine-tuning process has been known since its
  introduction (Devlin+ 2019), and various methods have been proposed to
* Phang+ (2018) show that fine-tuning the pre-trained model on a large
  intermediate task stabilizes later fine-tuning on small datasets
* Lee+ (2020) introduce a new regularization method to constrain the fine-tuned
  model to stay close to the pre-trained weights and show that it stabilizes
* Dodge+ (2020) propose an early stopping method to efficiently filter out
  random seeds likely to lead to bad performance
* Concurrently to our work, Mosbach+ (2020) also show that
  BERTA DAM leads to instability during fine-tuning
* training models from scratch (Popel & Bojar, 2018; Nakkiran+ 2019)

## BERT Representation Transferability

* BERT pre-trained representations have been widely studied using probing
  methods showing that
  the pre-trained features from intermediate layers are more transferable
  (Tenney+ 2019b;a; Liu+ 2019a; Hewitt & Manning, 2019; Hewitt & Liang, 2019)
  or applicable (Zhang+ 2020) to new tasks than features from later layers,
  which change more after fine-tuning (Peters+ 2019; Merchant+ 2020). Our work
* Concurrent to our work
  * Li+ (2020) propose to re-initialize the final fully-connected layer of a
    ConvNet and show performance gain for image classification
  * Tamkin+ (2020) adopt a similar methodology of weight re-initialization
    (Section 5) to study the transferability of BERT. In contrast to our study,
    * find the layers that contribute the most in transfer learning, and the
    * relation between probing performance and transferability.

# 4 Optimization algorithm: debiasing omission in berta dam

# 4 Initialization: re-initializing bert pre-trained layers

# 6 Training iterations: fine-tuning bert for longer

# 7 Revisiting existing methods for few-sample bert fine-tuning
