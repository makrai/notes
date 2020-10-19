Exploring the Limits of Transfer Learning with a Unified Text-to-Text Transformr
C Raffel, N Shazeer, A Roberts, K Lee, S Narang, M Matena, Y Zhou, W Li, PJ Liu
JMLR arXiv:1910.10683 [cs.LG]

   we release our data set, pre-trained models, and code. 

* Transfer learning: model is first pre-trained on a data-rich task before
  being fine-tuned on a downstream task, has emerged as a powerful technique in
* diversity of approaches, methodology, and practice. In this paper, we explore
* we  
  * a unified framework 
    * converts all text-based language problems into a text-to-text format
  * compares pre-training objectives, architectures, unlabeled data sets,
    transfer approaches, and other factors on dozens of tasks. By combining the
  * new ``Colossal Clean Crawled Corpus''
  * SOTA results on summarization, question answering, text classification, etc
* see the Takeaways
  
# 1 Introduction

* a wide landscape of 
  * pre-training objectives 
    (Howard and Ruder, 2018; Devlin+ 2018; Yang+ 2019; Dong+ 2019), 
  * unlabeled data sets (Yang+ 2019; Liu+ 2019c; Zellers+ 2019), 
  * benchmarks (Wang+ 2019b, 2018; Conneau and Kiela, 2018), 
  * fine-tuning methods (Howard and Ruder, 2018; Houlsby+ 2019; Peters+ 2019),
* approach is inspired by unifying frameworks casting all text problems as 
  question answering (McCann+ 2018), language modeling (Radford+ 2019), or 
  span extraction Keskar+ (2019b) tasks. Crucially, the text-to-text framework
  * the same model, objective, training procedure, and decoding process to
* We evaluating performance on a wide variety of English-based NLP problems,
  including question answering, document

# 2 model and its implementation, our procedure for formulating every text
processing problem as a text-to-text task, and the suite of tasks we consider.

# 3 experiments that explore the field of transfer learning for NLP. At the end
of the section (Section 3.7), we combine insights from our systematic study to
obtain SOTA results on a wide variety of benchmarks. Finally, we provide a

# 4 summary of our results and wrap up with a look towards the future in

## 4.1 Takeaways

* text-to-text framework obtained comparable performance to task-specific
  architectures and ultimately produced SOTA results when combined with scale
* Architectures 
  * original encoder-decoder form worked best in our text-to-text framework.
  * twice as many parameters as “encoder-only” (e.g. BERT) or “decoder-only”
    (language model) architectures, [but] similar computational cost. We also
  * sharing the parameters in the encoder and decoder: 
    [no] substantial performance drop while halving the total parameter count.
* Unsupervised objectives 
  * most “denoising” objectives performed similarly in the text-to-text setup.
  * we suggest using objectives that produce short target sequences so that
    unsupervised pre-training is more computationally efficient.
* Data sets We introduced the 
  * “Colossal Clean Crawled Corpus” (C4), which comprises 
    heuristically-cleaned text from the Common Crawl web dump. When comparing
  * training on in-domain unlabeled data could boost performance in a few
    downstream tasks, but smaller data set
  * performance can degrade when [the data set is] repeated many times over the
    course of pre-training
* Training strategies We found that 
  * the basic approach of updating all of a pre-trained model’s parameters
    during fine-tuning outperformed methods that are designed to update fewer
    parameters, although updating all parameters is most expensive. We also
  * rather than training the model on multiple tasks at once, which in our
    * primary concern in multi-task learning is setting the proportion of each
      task to train on. 
    * We ultimately did not find a strategy for setting mixing proportions that
    * fine-tuning after pre-training on a mixture of tasks produced comparable
      performance to unsupervised pre-training.
* Scaling. We compared various strategies for taking advantage of additional
  * more data, larger model, or an ensemble of models. We found 
  * each approach conferred a significant boost in performance, though training
  * smaller model on more data was often outperformed 
    by a larger model for fewer steps
  * ensemble of models can provide substantially better results than a single
    * an orthogonal means of leveraging additional computation. 
    * Ensembling models that were fine-tuned from the same base pre-trained
      model performed worse than pre-training and fine-tuning all models
      completely separately, though fine-tune-only ensembling still
      substantially outperformed a single model.
* Pushing the limits We combined our above insights and trained substantially
  larger models (up to 11 billion parameters) to achieve SOTA results across
  many of the benchmarks we considered. For unsupervised training, we extracted
  text from our C4 data set and applied a denoising objective that corrupts
  contiguous spans of tokens.
  * We pre-trained on a multi-task mixture before fine-tuning on individual
    tasks. Overall, our models were trained on over 1 trillion tokens
