Long Range Arena: A Benchmark for Efficient Transformers
Yi Tay, Mostafa Dehghani, Samira Abnar, Yikang Shen, Dara Bahri, Philip Pham,
  Jinfeng Rao, Liu Yang, Sebastian Ruder, Donald Metzler
ICLR 2021

# Abstract:

* Transformers: quadratic self-attention complexity
* In the recent months, a wide spectrum of efficient, fast Transformers
* no well-established consensus on how to evaluate these models
  * inconsistent benchmarking on a wide spectrum of tasks and datasets
* This paper proposes a systematic and unified benchmark, Long Range Arena,
  * ranging from 1K to 16K tokens
  * wide range of data types and 
    modalities such as text, natural, synthetic images, and mathematical exprs
    * requiring similarity, structural, and visual-spatial reasoning
* We systematically evaluate ten well-established long-range Transformer models
  (Reformers, Linformers, Linear Transformers, Sinkhorn Transformers,
  Performers, Synthesizers, Sparse Transformers, and Longformers)

# 1 INTRODUCTION

* Transformers (Vaswani+ 2017) are ubiquitously SOTA across many modalities,
  * language (Devlin+ 2018; Raffel+ 2019; Child+ 2019) to
  * images (Tan & Bansal, 2019; Lu+ 2019) to
  * protein sequences (Rives+ 2019)
* An overview of efficient Transformer models (‘xformers’): Tay+ (2020c)
  Comparing the evaluation and experimental setup of many of these papers
  * no consensus on what makes an acceptable test bed for benchmarking
    * large diversity in the types of tasks adopted
  * the benchmarks used for evaluation are often arbitrarily chosen
    * little consideration to whether the task is suitable 
  * many papers tend to conflate the effectiveness of the inductive bias with
    the benefits of pretraining (Ainslie+ 2020; Zaheer+ 2020; Wang+ 2020)
  * Pretraining itself is a computationally expensive endeavour and 
    de-coupling inductive bias research from pretraining would 
    make xformer research more accessible
* we propose a new benchmark, Long-Range Arena (LRA)
  * both synthetic probing tasks and real-world tasks
  * relative comparisons for ten recently proposed efficient Transformer models
    * Sparse Transformers (Child+ 2019)
    * Reformer (Kitaev+ 2020)
    * Linformer (Wang+ 2020)
    * Longformer (Beltagy+ 2020)
    * Sinkhorn Transformers (Tay+ 2020b)
    * Performers (Choromanski+ 2020)
    * Synthesizers (Tay+ 2020a)
    * Linear Transformers (Katharopoulos+ 2020)
    * BigBird (Zaheer+ 2020)
* different types of data and conditions
  * e.g. sequences that are intrinsically hierarchical; spatial structure
* extensive efficiency and memory usage analysis of these models

# 2 LONG-RANGE ARENA (LRA)

## 2.1 DESIDERATA For creating the Long-Range Arena benchmark

1. Generality
  * All efficient Transformers models should be applicable to our tasks
  * e.g. not all xformer models can perform autoregressive decoding (Wang+ 2020)
2. simple setup
  * factors that make comparisons difficult should be removed
  * no cumbersome pipelined approaches
  * avoid data augmentation
  * pretraining out of scope of this benchmark
3. Challenging: The tasks should be difficult enough for current models
  * room for improvement to encourage future research in this direction
4. Long inputs: The input sequence lengths should be reasonably long
5. Probing diverse aspects
  * e.g. ability to model relations and hierarchical/spatial structures,
    generalization capability, etc
6. Not resource intensive and accessible
  * lightweight so as to be accessible to researchers without industry-grade cmp

## 2.2 TASKS

## 2.2.1 LONG LIST OPS

* hierarchically structured data in a long-context scenario
* a longer variation of the standard ListOps task (Nangia & Bowman, 2018), 
  * ListOps was designed to investigate the parsing ability of neural models
* operators MAX, MEAN, MEDIAN, and SUM MOD that are enclosed by delimiters
  (brackets)
  * example (much shorter) sequence is as follows:
    INPUT: [MAX 4 3 [MIN 2 3 ] 1 0 [MEDIAN 1 5 8 9, 2]]
    OUTPUT: 5
* In our task we use a version of ListOps of sequence lengths of up to 2K
* a ten-way classification task and is considerably challenging

## 2.2.2 BYTE LEVEL TEXT CLASSIFICATION

* real-world data represents a common use case of efficient Transformers
  * often need to process long documents
* Text classification in particular is associated with many real-world
  * e.g. spam, fraud, and bot detection and commercial document classification,
    (Howard & Ruder, 2018)
* benchmarks the ability of the models to deal with compositionality
  * compose characters into words into higher-level phrases
  * boundaries are less well defined and need to be learned from the data, which
    * challenging in its own right (Kawakami+ 2019)
* We consider the byte/character-level setup of this task
  in order to simulate a longer input sequence, which also makes the task
  * differs significantly from character-level language modeling (char LM)
* We use the IMDb reviews (Maas+ 2011) dataset (commonly used for classificaton)
  * fixed max length of 4K for this task, which is truncated or padded
  * binary classification task with accuracy as the metric
  * char is more difficult (Tay+ 2020b)
    * word-level task, models without pre-training: accuracies in the high 80s
    * in the mid 60s on the character-level task

## 2.2.3 BYTE LEVEL DOCUMENT RETRIEVAL

* compressed representations that are useful for matching and retrieval
* Learning the similarity score between two vectors is a common problem 
  * wide array of applications (Guo+ 2016)
* Hence, this task is mainly about modeling a similarity score between two docs
  * ‘two tower setup’: compressed representations are concatenated and passed
    into a linear classifier
* we deliberately prevent models from using cross attention
  * test of how well models are able to compress long sequences
* We use the ACL Anthology Network (AAN; Radev+ 2013) dataset, 
  * identifies if two papers have a citation link,
  * a common setup in long-form document matching (Jiang+ 2019; Yang+ 2020)
  * we use a byte/character level setup, which challenges the model to
    compose and aggregate information over longer contexts
* We use a sequence length of 4K for each document, which makes the
  total text length 8K for this task
* a binary classification task with accuracy as the metric

## 2.2.4 IMAGE CLASSIFICATION ON SEQUENCES OF PIXELS

* an image classification task, where the inputs are sequences of pixels
  * an N × N image is flattened to a sequence of length N 2 pixels
* requires the model to learn the 2D spatial relations between input pixels,
  while presented as a 1D sequence of symbols. We focus on assessing Transformer
  models that are designed to process a sequence of discrete symbols
* we do not allow extra modules such as a CNN stem
* a single gray-scale channel where each pixel is represented in 8 bits
* we use the CIFAR-10 dataset (Krizhevsky, 2009) for the image classification

## 2.2.5 PATHFINDER (LONG-RANGE SPATIAL DEPENDENCY)

* The Pathfinder challenge (Linsley+ 2018; Kim+ 2020) was first introduced
  for learning long-range spatial dependencies
* a synthetic visual task
  motivated by cognitive psychology (Houtkamp & Roelfsema, 2010)
* binary decision whether two points represented as circles are connected by a
  path consisting of dashes
  * contains distractor paths, which makes this setup challenging
* We model this task by treating images as sequences of pixels
* images are of dimensions (32 × 32), which make up a sequence length of 1024

## 2.2.6 PATHFINDER-X (LONG-RANGE SPATIAL DEPENDENCIES WITH EXTREME LENGTHS)

* examples consist of 16K pixels (i.e., images of 128 × 128)
* goal here is to observe if a model would fail to solve the 16K extreme version
  even if it can successfully learn the standard version of 1024 tokens
  * see if the same algorithmic challenges bear a different extent of difficulty
    when sequence lengths are much longer

## 2.3 REQUIRED ATTENTION SPAN OF LRA TASKS

* the required attention span of an attention module is computed as
  the mean distance between the query token and the attended tokens, 
  scaled by attention weights
* we compute the mean required attention span over all attention modules in our
  best vanilla Transformer model for each task, averaged over 1K random samples
  from the validation set

# 3 EXPERIMENTAL RESULTS

## 3.4 EFFICIENCY BENCHMARKS

### Results on Train Speed. Table 2

* low-rank and kernel-based models are generally the fastest

### Results on Memory Consumption

## 3.5 OVERALL RESULTS : NO ONE-SIZE-FITS-ALL

* integrated across all five tasks, the best is the BigBird model
  * not extremely good on any individual task compared to other models
  * consistently good performance across all tasks. 
  * Performers and Linear Transformers have strong performance on some tasks but
    their average is lowered by the ListOps task
* Figure 3 shows the trade-off between qualitative performance (y-axis), model
  speed (x-axis), and memory footprint (size of the circles)
* the kernel-based variants, i.e., Performer, Linformer, and linear Transformer
  make a better trade-off in terms of speed and performance, while having
  reasonable memory usage
  * Overall, the pareto-optimal models are BigBird and Performers

# 4 RELATED WORK

## 4.1 EFFICIENT TRANSFORMERS

* a fixed pattern (local window) approach (Liu+ 2018; Parmar+ 2018)
* combinations of fixed patterns (Child+ 19; Ho+ 19; Beltagy+ 20; Zaheer+ 20)
  that learn sparse attention by considering combinations of fixed strides or
  local windows
* learn these patterns (Kitaev+ 2020; Roy+ 2020) 
  using LSH hashing, clustering (Roy+ 2020) and/or sorting (Tay+ 2020b)
* kernels (Katharopoulos+ 2020; Choromanski+ 2020) or
* low-rank approximations (Wang+ 2020) which either
  * treat the attention matrix as low-rank (using low-rank projections Wang+ 20)
  * rewriting of the self-attention equation (Katharopoulos+ 2020)
* we refer interested readers to Tay+ (2020c) for a detailed survey
