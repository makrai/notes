Guiding Generative LMs for Data Augmentation in Few-Shot Text Classification
Aleksandra Edwards, A Ushio, J Camacho-Collados, H de Ribaupierre, A Preece
arXiv:2111.09064 [cs.CL]

# Abstract

* Data augmentation tackles class imbalance issues and data sparsity
* generative language models to data augmentation for text classification tasks
  in few-shot settings, especially for specialised domains
* we
  * generating artificial training instances leveraging GPT-2 (Radford + 2019)
    in order to improve classification performance
  * analyse the impact the selection process of seed training examples
    over the quality of GPT-generated samples
    * experiments with several seed selection strategies that, among others,
      exploit class hierarchical structures and domain expert selection
* results show that fine-tuning GPT-2 in a handful of label instances leads to
  consistent classification improvements and outperform competitive baselines
  * guiding this process through domain expert selection can lead to further
    improvements
    * research avenues for combining generative models and active learning

# 1 Introduction

* Data sparsity and class imbalance are common problems in text classification
  (Türker+ 2019; Zhang and Wu, 2015; Shams, 2014; Kumar+ 2020),
  * especially in a highly-specialised domain
    where only scarce domain experts can perform the labelling task
    (Türker+ 2019; Ali, 2019)
* Data Augmentation (DA) is a widely used method for tackling such issues
  (Anaby-Tavor+ 2020; Kumar+ 2020; Papanikolaou and Pierleoni, 2019)
* vision and speech vs text
  * vision and speech: well-established DA methods
    (Anaby-Tavor+ 2020; Giridhara+ 2019; Krizhevsky+ 2017;
    Cui+ 2015; Ko+ 2015; Szegedy+ 2015)
    * simple transformations of existing samples
  * cannot be easily transferred to textual data as they can lead to syntactic
    and semantic distortions to text (Giridhara+ 2019; Anaby-Tavor+ 2020)
* text generation models, such as GPT and subsequent (Radford+ 2018) + BART
  * generate additional training data from original samples,
    rather than perform only local changes to the text
* Related studies use text generation models for improving
  * relation extraction (Papanikolaou and Pierleoni, 2019; Kumar+ 2020),
  * extreme multi-label classification (Zhang+ 2020)
    * class imbalance problems
  * augment domain-specific datasets in classification tasks
    (Amin-Nejad+ 2020)
    * Kumar+ (2020) and Anaby-Tavor+ (2020) explore
      different finetuning approaches for pre-trained models for DA
      * potential of generative models such as GPT-2 (Radford+ 2019) and BART
        (Lewis+ 2019) to augment small collections of labelled data
      * limited range of classification settings and datasets
  * problem with text generation techniques is the possibility of generating
    noise which decreases the performance of classification models (Yang+ 2020)
* our aim is to improve the quality of generated artificial instances
  * seed selection strategies to guide the generation process
  * three simple DA methods in order to improve few-shot text classification
    using GPT-2
    * a method that
      leverages the expert-generated classification hierarchy of a dataset in
      order to improve the classification of the top hierarchy classes;
    * a method that selects the seeds with the maximum occurrence of nouns; and
    * a method that involves a domain expert choosing class representative
      samples
  * these seed selection strategies
    exploit characteristics associated with specialised domains such as
    high number of terms, annotation performed by experts, and hierarchical
    class structure (common for social science and medical domains)
* we analyse how different approaches of fine-tuning GPT-2 affect the quality
  of generated data and consequently the classification performance
  * Specifically: fine-tuning on smaller but labelled instances or
    fine-tuning on a larger unlabelled collection
* Our results show
  * that fine-tuning a GPT-2 model per label improves performance of classifiers
    consistently, compared to the same model fine-tuned on the entire dataset
  * how guiding this process through domain expert selection in the original
    dataset can lead to further improvements
    * should be explored further is

# Data Augmentation: Related Work

* we describe
  * standard text augmentation methods which we use as baselines. We also
  * recent DA methods based on text generation models.

## Text Generation (TG). Recent language models such as GPT-2 (Radford+ 2019)

* GPT-2 was trained with a causal language modeling (CLM) objective which makes
  * suitable for predicting the next token in a sequence.
  * used successfully in text generation tasks such as
    * summarising (Xiao+ 2020; Kieuvongngam+ 2020; Alambo+ 2020) and
    * question answering (Liu & Huang, 2019; Baheti+ 2020; Klein & Nabi, 2019).
* text generation techniques for DA for text classification
  * focused on the creation of label-preservation techniques for the generated
    synthetic data samples and comparing different TG techniques
    (Anaby-Tavor+ 2020; Wang and Lillis, 2019; Zhang+ 2020; Kumar+ 2020)
  * limited in scale and solutions for improving quality of generated data.
* no study on the importance of fine-tuning text generation models to ensure
  label preservation.
* The most similar study to ours is probably that of Yang+ (2020),
  * in the context of commonsense reasoning. They proposed an approach based on
  * influence functions and heuristics for selecting the most diverse and
    informative artificial samples from an already-generated artificial dataset
  * we focus on the previous step of selecting the most informative samples (or
    seeds) from the original data

# 3 Methodology

* Our DA methodology consists of three main steps. In the first step,
  * Seed Selection, we select samples (i.e., seeds) from the original labeled
    data based on four different strategies (Section 3.1)
  * Text Generation, we generate additional artificial training data using a
    generative language model using three strategies to fine-tune it on
    different input texts (Section 3.2)
  * the augmented training data is used in combination with the original data
    to train a Text Classifier (Section 3.3)
