Exploiting Language Model Prompts Using Similarity Measures:
  A Case Study on the Word-in-Context Task
Mohsen Tabasi, Kiamehr Rezaee, Mohammad Taher Pilehvar
ACL 2022

The code is freely available at https://github.com/tabasy/similarity_prompting

# Abstract

* As a recent development in few-shot learning, prompt-based techniques
  * promising potential in a variety of natural language processing tasks
  * competitive on most tasks in the GLUE and SuperGLUE benchmarks
  * hE fail on the semantic distinction task of the Word-in-Context (WiC) data
    * not signif better than random
    * no few-shot approach (including the in-context learning of GPT-3)
* we propose a new prompting technique, based on similarity metrics
  * boosts few-shot performance to the level of fully supervised methods
  * shows that the failure of prompt-based techniques in semantic distinction
    is due to their improper configuration,
    rather than lack of relevant knowledge in the representations
  * approach can be effectively extended to other downstream tasks
    for which a single prompt is sufficient

# 1 Intro

* resurgence of interest in few-shot learning after GPT-3 (Brown+ 2020). The
  * dominant few-shot approach is the so-called promptbased learning which
  * a simple reformulation of the target task as a
    cloze-style (Taylor, 1953) fill-in-the-blank objective
  * core idea is to extract knowledge by asking the right question from the PLM 
  * task-specific prompting template which
    directs the PLM to generate a textual output corresponding to a target cls
  * effectiveness
    even for smaller models, such as BERT (Devlin+ 2019) RoBERTA (Liu+ 2019),
    when combined with ensembling and fine-tuning (Schick and Schütze, 2021a).
    * practical point of view, prompt-based learning is
      particularly well-suited for massive models, such as GPT-3,
      since it does not involve parameter tuning.
* impressive performance especially when compared to standard fine-tuning on
  datasets of hundreds of data points (Le Scao and Rush, 2021). However,
  * hE, the Word-in-Context task (Pilehvar and Camacho-Collados, 2019) 
    * one of the tasks in the SuperGLUE benchmark (Wang+ 2019)– is one
    * these methods fail to stay on par with their fine-tuned counterparts.  ‡
    * task: Given an ambiguous target word in two different contexts, the task
      * binary classification problem to identify if the triggered meaning of
        the target word differs in the two contexts or not.
    * simple fine-tuned BERT-base model achieves 69% accuracy (Wang+ 2019),
    * GPT-3, with > 100 x the number of parameters, performs
      no better than a random baseline by employing a promptbased approach
      (Brown+ 2020)
    * failure is also observed in the more recent prompt based attempts
      (Liu+ 2021; Schick and Schütze, 2021a)
* question if the failure of few-shot techniques on WiC is due to
  * lack of relevant encoded knowledge in PLMs or the
  * inefficiency of the employed prompt-based methods.
    * Two issues could be responsible for the latter case:
      (1) improper prompt, or (2) inefficient utilization of PLM’s response
* To address the first issue, there have been proposals to
  automatically find a suitable prompt template using a search
  * in the discrete token space (Shin+ 2020) or 
  * in the continuous embedding space (Liu+ 2021).
  * However, none of these have shown success on the WiC task.
* we investigate the latter issue by introducing a new prompting configuration
* Given the comparison-based nature of WiC, we hypothesize that
  conventional prompting methods fall short since they only utilize a single
  prompt response.  Hence, instead of relying on a single response,
  * we make use of the similarity of PLM’s response to the combination of a
    pair of prompts
  * experimental results on the WiC dataset shows that,
    with only 16 instances per class, our proposed prompt-based technique can
    * comparable results to the fine-tuned models (with access to full training
      data of 2700+ instances per class).
* with few adjustments, this simple approach can be effectively used
  for other downstream tasks.

# 2 Similarity Prompting).

* As shown in Figure 1, SP consists of
  * three main steps: 
    * prompt generation, 
    * feature extraction, and 
    * prediction <~ differs from existing prompt-based approaches.
* Given a task-specific input consisting of one or more text sequences, we
  * template function to generate a prompt—a sequence of tokens containing
    one [ MASK ] token—per input sequence. For instance,
  * eg in sentiment analysis, for the movie review “Just give it a chance.”,
    * output prompt: “Just give it a chance.  this movie was ——.”
  * feature extraction from a PLM. This is done by
    * giving the generated prompts to the PLM as input and
      obtaining its contextualized embedding at the MASK index.
  * The third step is where SP differs from existing prompt-based approaches.
    1. obtain class-specific centroids by taking the
      average of the MASK embeddings of our few training examples
      * To classify a new sample at inference time, a
        * simple approach would be to employ a nearest centroid classifier.
          hE, this assumes the variance of different classes to be equal 
        * => we perform a class centroid-based dimension reduction
          (ie similarity to each centroid as a feature), and train a simple
          linear classifier.  This linear model is then used at inference time
          to evaluate SP on test set.  

## 2.1 Similarity Prompting for WiC

* we ask PLM about the triggered meaning of the target word, separately for
  each context, and leave the comparison to similarity measures. Having an
* we insert “or [mask]” after the target word, where
  1. apply this template func to both input sents 
  2. the prompts are separately fed to PLM, resulting in a pair of embeddings
  3. classification step: directly comparing our pair of embedding vectors
     using a similarity function, to produce a single similarity score 
  * train the same linear model as before on the similarity scores 
    to find the best discriminating threshold.

### Similarity Measures. We opted for two similarity metrics

* cosine similarity and Spearman’s rank correlation. The latter is a rank-based
  * insensitive to the absolute values of individual dimensions
* from the conclusion: Spearman’s ranking correlation is a more robust choice
