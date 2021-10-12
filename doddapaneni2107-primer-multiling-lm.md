A Primer on Pretrained Multilingual Language Models
Sumanth Doddapaneni, Gowtham Ramesh, Anoop Kunchukuttan, P Kumar, MM Khapra
arXiv:2107.00676 [cs.CL]

* Multilingual Language Models (MLLMs) such as mBERT, XLM, XLM-R
* success in zero shot transfer learning
* a large body of work in
  * building bigger MLLMs covering a large number of languages
  * creating exhaustive benchmarks covering a wider variety of tasks and langs
  * analysing their performance on monolingual, zero shot crosslingual, & biling
  * understanding the universal language patterns (if any) learnt by MLLMs and
  * augmenting the (often) limited capacity of MLLMs to improve their
    performance on seen or even unseen languages. In this survey, we review them

# 1 Intro

* multilingual language models (MLLMs)
  * mBERT (Devlin+ 2019), XLM (Conneau and Lample, 2019), XLM-R (Conneau+ 2020a)
  * low resource languages may benefit from high resource languages
    * due to shared vocabulary, genetic relatedness (Nguyen and Chiang, 2017),
      or contact relatedness (Goyal+ 2020)
* MLLMs differ in the
  * architecture (e.g., number of layers, parameters, etc),
  * objective functions used for training (e.g., monolingual masked language
    modeling objective, translation language modeling objective, etc),
  * data used for pretraining (Wikipedia, CommonCrawl, etc) and the
  * number of languages involved (ranging from 12 to 100)
* tradeoff in the performance compared to a monolingual model?
  * for a given language is a-language-specific BERT better than a MLLM?
  * capacity dilution (i.e., the capacity of the model is dedicated to a 1/more)
  * additional pretraining data from multiple (related) languages
  * existing studies
    (Conneau+ 2020a XLM-RoBERTa; Wu and Dredze, 2020; Agerri+ 2020; Virtanen+ 2019;
    Rönnqvist+ 2019; Ro+ 2020; de Vargas Feijó and Moreira, 2020;
    Virtanen+ 2019; Wang+ 2020a; Wu and Dredze, 2020)
    * Shijie Wu and Mark Dredze
      Are all languages created equal in multilingual bert? In Proceedings of
      RepL4NLP@ACL 2020, Online, July 9, 2020, pages 120–130. ACL
    * R Agerri, IS Vicente, JA Campos, A Barrena, X Saralegi, A Soroa, E Agirre. 2020
      Give your text representation models some love: the case for basque. In
      LREC 2020, Marseille, France, May 11-16, 2020, pages 4781–4788
      * many monolingual models (FastText word embeddings, FLAIR and BERT
        language models) trained with larger Basque corpora produce much better
        results than publicly available versions in downstream NLP tasks,
        including topic classification, sentiment classification, PoS and NER
    * Samuel Rönnqvist, Jenna Kanerva, Tapio Salakoski, and Filip Ginter. 2019
      Is multilingual BERT fluent in language generation?
      the First NLPL Workshop on Deep Learning for NLP pages 29–36, Turku, Finld
    * Youngbin Ro, Yukyung Lee, and Pilsung Kang. 2020
      Multi2oie: Multiling open info extract based on multi-head attenton w BERT
    * Diego de Vargas Feijó and Viviane Pereira Moreira
      Mono vs multilin transformer-based models: a comparison in several tasks
      CoRR, abs/2007.09757
      * BERT and Albert model for Portuguese. Second, we compare our monolingual
      * experiments in STS, RTE, classification, sentiment, offensive and fake
      * the advantage of training a single language model, if any, is small
    * Shuohuan Wang, Jiaxiang Liu, Xuan Ouyang, and Yu Sun. 2020a
      Galileo at SemEval-2020 task 12: Multi-lingual offensive language identifc
  * depends on model capacity, amount of pretraining data, fine-tuning mechanism
    and amount of task-specific training data
* zero shot crosslingual transfer (K+ 2020) from a resource rich language
  * benchmarks, e.g. XGLUE (Liang+20), XTREME (Hu+20), XTREME-R (Ruder+21)
  * a wide variety of tasks such as classification, structure prediction,
    Question Answering, and crosslingual retrieval
  * studies of crosslinguality (Pires+ 2019; Wu and Dredze, 2019; K+ 2020;
    Artetxe+ 2020a; K+ 2020; Dufter and Schütze, 2020; Liu+ 2020a;
    Lauscher+ 2020; Liu+ 2020c; Conneau and Lample, 2019; Wang+ 2019;
    Liu+ 2019a; Cao+ 2020; Wang+ 2020d; Zhao+ 2020; Wang+ 2020b; Chi+ 2020b)
    * Chi-Liang Liu, Tsung-Yuan Hsu, Yung-Sung Chuang, and Hung-yi Lee. 2020a
      A study of cross-lingual ability and language-specific information in
      multilingual BERT. CoRR, abs/2004.09205
    * Zihan Liu, Genta Indra Winata, Andrea Madotto, and Pascale Fung. 2020c
      .fine-tuning techniques for pre-trained cross-lingual models via continual
      CoRR, abs/2004.14218
    * Yuxuan Wang, Wanxiang Che, Jiang Guo, Yijia Liu, and Ting Liu. 2019
      Cross-lingual BERT transformation for zero-shot dependency parsing. In
      EMNLP-IJCNLP 2019, Hong Kong, China, November 3-7, 2019, pages 5720–5726
    * Qianchu Liu, Diana McCarthy, Ivan Vulić, and Anna Korhonen. 2019a
      Investigating cross-lingual alignment methods 
        for contextualized embeddings with token-level evaluation
      CoNLL, pages 33–43, Hong Kong, China. Association for Computational Ling
    * Steven Cao, Nikita Kitaev, and Dan Klein. 2020
      Multilingual alignment of contextual word representations. In 8th
      ICLR 2020, Addis Ababa, Ethiopia, April 26-30,
    * Zirui Wang, Jiateng Xie, Ruochen Xu, Yiming Yang, G Neubig, JG Carbonell
      Cross-lingual alignment vs joint training:
        A comparative study and A simple unified framework. In 8th International
      ICLR 2020, Addis Ababa, Ethiopia, April 26-30, 2020.  OpenReview.net
    * Wei Zhao, Steffen Eger, Johannes Bjerva, and Isabelle Augenstein. 2020
      Inducing language-agnostic multilingual representations
      CoRR, abs/2008.09112
    * Xinyu Wang, Yong Jiang, Nguyen Bach, Tao Wang, Fei Huang, and Kewei Tu
      Structure-level knowledge distillation for multilingual sequence labeling
      ACL 2020, Online, July 5-10, 2020, pages 3317–3330
    * Zewen Chi, Li Dong, Furu Wei, Xianling Mao, and Heyan Huang. 2020b
      Can monolingual pretrained models help cross-lingual classification?
      AACL/IJCNLP 2020, Suzhou, China, December 4-7, 2020, pages 12–17
  * transfer depends on the amount of shared vocabulary, explicit alignment of
    representations across languages, size of pretraining corpora
* bilingual tasks
  * could the shared representations learnt by MLLMs improve MT between two
    resource rich languages?
  * several works (Conneau and Lample, 2019; Kakwani+ 2020; Huang+ 2019;
    Conneau+ 2020a; Eisenschlos+ 2019; Zampieri+ 2020; Libovický+ 2020; Jalili
    Sabet+ 2020; Chen+ 2020; Zenkel+ 2020; Dou and Neubig, 2021; Imamura and
    Sumita, 2019; Ma+ 2020; Zhu+ 2020; Liu+ 2020b; Xue+ 2021) which use MLLMs
  * tasks such as unsupervised machine translation,
    crosslingual word alignment, crosslingual QA, etc
  * summ: MLLMs are useful for bilingual tasks, particularly in low resource
* universal patterns
  * no consensus yet
  * commonalities identified by different correlation analyses,
  * hE, these commonalities are
    * dominantly within languages of the same family, and
    * only in certain parts of the network (primarily middle layers)
  * tasks benefit?
    * probing tasks such as POS tagging are able to benefit from commonalities
    * harder tasks such as evaluating MT quality remain beyond the scope
  * not yet represent inter-lingua
* extend it to new languages which weren’t a part of the initial pretraining
  * extending MLLMs to unseen languages, and
  * improving the capacity (and hence performance) of MLLMs for seen languages
  * techniques
    * fine-tuning the MLLM for a few epochs on the target language
    * language and task specific adapters to augment the capacity of MLLMs

# 3 What are the benchmarks used for evaluating MLLMs? 7

* The most common evaluation for MLLMs is crosslingual performance on downstream
* common crosslingual benchmarks are 
  XGLUE (Liang+ 2020), XTREME (Hu+ 2020), XTREME-R (Ruder+ 2021). These
  * a wide variety of tasks and languages as shown in Table 2. These tasks 
  * can be broadly classified into the following categories as discussed below
    
## classification, 

* input comprising of a single sentence or a pair of sentences, the task here is
* e.g. Natural Language Inference (NLI) classes: entails, neutral, contradicts
* datasets used for evaluating MLLMs are 
  * XNLI (Conneau+ 2018)
  * PAWS-X (Yang+ 2019) 
  * XCOPA (Ponti+ EMNLP 2020)
    * Edoardo M. Ponti, G Glavaš, O Majewska, Q Liu, I Vulić, and Anna Korhonen.
      XCOPA: A multilingual dataset for causal commonsense reasoning. In
  * News Classification (Liang+ 2020)
    * in XGLUE
  * QADSM (Liang+ 2020)
    * Query-Ad Matching (QADSM) This task aims to 
    * predict whether an advertisement (ad) is relevant to an input query. It
    * 3 languages, English, French and German. 
    * Each instance is a 4-tuple: `<query, ad title, ad description, label>`
  * WPR (Liang+ 2020) 
    * Web Page Ranking (WPR) This task aims to 
    * predict how relevant (0--4) a web page is to an input query. It covers 
    * 7 langs, English, German, French, Spanish, Italian, Portuguese, Chinese.
    * Each instance: `<query, web page title, web page snippet, label>`
    * based on Bing.
    * Normalize Discounted Cumulative Gain (nDCG) is used as the metric.
  * QAM (Liang+ 2020)
    * QA Matching (QAM) This task aims to 
    * predict whether a <question, passage> pair is a QA pair.  It covers 
    * 3 languages, English, French and German. Each labeled instance is a
    * based on Bing. 
    * Accuracy (ACC) of the binary classification is used as the metric

## structure prediction, 

## question answering

## retrieval

# 4 Are MLLMs better than monolingual models?

## Summary: not clear whether MLLMs are always better than monolingual models

* We recommend a more systematic study where the above parameters are carefully
  ablated for a wider range of tasks and languages

# 5 Do MLLMs facilitate zero shot crosslingual transfer?

## Summary: While not very conclusive, existing studies show that there is some
* MLLMs on zero shot crosslingual transfer is generally better when
  * the source and target languages share some vocabulary
  * there is some similarity between the source and target languages
  * the MLLM uses a deeper architecture
  * enough pretraining data is available in the target languages
  * a continual learning (learning-without-forgetting) framework is used
  * the representations are explicitly aligned
    using bitext and appropriate loss functions and
  * the complexity of the task is less
* crosslingual transfer using MLLMs performs much worse than in-language supervs
* in most cases it performs worse than a translate-and-train or a
  translate-and-test baseline

# 6 Are MLLMs useful for bilingual tasks?

* To summarize, MLLMs are useful for some bilingual tasks,
  * particularly in low-resource scenarios
  * fine-tuning with parallel data provides added benefits

# 7 Do MLLMs learn universal patterns?

* In summary, there is no consensus yet on MLLMs learning universal patterns
* MLLMs learn embeddings which have high overlap across languages, primarily
  between those of the same family
* common representations 
  * seem to be clearest in the middle layers, after which the network
    specialises for different languages as modelled in the pretraining
    objectives
  * can be probed to accurately perform supervised NLU tasks such as POS
    tagging, dependency parsing, in some cases with zero-shot transfer
* more complex tasks such as MT quality evaluation (Libovickỳ+ 2019) or language
  generation (Rönnqvist+ 2019) remain outside the realm of these models
  currently, keeping the debate on universal patterns incomplete

# 8 How to extend MLMs to new languages

# 9 Recommendations

## Ablation Studies

* axes of ablation belong to three sets
  architectural parameters, pretraining objectives, and subset of languages
* an exhaustive ablation study would be prohibitively expensive
* questions remain open: For instance,
  * what subset of languages should one choose for training a multiling model?
  * How should the architecture be shaped as we change the number of languages?
  * design controlled and scaled-down ablation studies where a broader set of
    parameters can be evaluated and generalized guidelines can be derived

## Zero-Shot Evaluation

* The primary promise of MLLMs remains crosslingual performance, especially 0sh
* results have a wide variance across tasks and languages (Keung+ 2020)
* controlling for the design parameters discussed above and the training and
  test sets is required.  Specifically, there is
* need for careful comparisons against translation-based baselines such as
  translate-test, translate-train, translate-train-all (Conneau+ 2019)
  across tasks and languages

## mBERTologoy

* what the model learns, and how and where such information is stored in the
* e.g. analysis of the role of attention heads in encoding syntactic, semantic,
  or positional information (English BERT: Voita+ 2019)
  * Elena Voita, David Talbot, Fedor Moiseev, Rico Sennrich, and Ivan Titov
    Analyzing multi-head self-attention:
      Specialized heads do the heavy lifting, the rest can be pruned
    ACL 2019, pages 5797–5808, Florence, Italy
* clues on the emergence of crosslinguality

## Language inclusivity. MLLMs hold promise as an ‘infrastructure’ resource

* Many languages are widely spoken but not enough research and development
  (Joshi+ 2020b).  Towards this end, MLLMs must become more inclusive
* scaling up to 1000s of languages
  * may require model innovations e.g. moving beyond language-specific adapters
* inclusive benchmarks in variety of tasks and languages

## Efficient models.  MLLMs represent some of the largest models

* running inference on such large models is often not possible on edge devices
  and increasingly expensive on cloud devices. One important research direction
* downsize these large models without affecting accuracy. Several standard
  * pruning, quantization, factorization, distillation, and archit search
    have been used on monolingual models (Tay+ 2020)

## Robust models

* extensive evaluation for any encoded biases and their ability to generalize
* extensive diagnostic and evaluation suites such as MultiChecklist proposed in
  Ruder+ (2021)
* Evaluation framework such as Explainaboard (Liu+ 2021; Fu+ 2020) need
  * needed for a range of tasks and languages to identify the nature of errors
* analysis of bias in deep NLP models to multilingual systems (Blodgett+ 2020)

# 10 Conclusion

* future research on MLLMs should focus on
  * controlled ablation studies involving a broader set of parameters
  * comprehensive evaluation of the zero shot performance of MLLMs across a
    wider set of tasks and languages
  * understanding the patterns learn by attention heads and other components
  * including more languages in pretraining and evaluation
  * building efficient and robust MLLMs using better evaluation frameworks
    (e.g., Explainaboard)