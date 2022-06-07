Multilingual and Multilabel Emotion Recognition using Virtual Adversarial Training
Vikram Gupta
arXiv:2111.06181 [cs.CL]

* Virtual Adversarial Training (VAT) has been effective in learning robust
  * supervised and semi-supervised settings for both computer vision and NLP
  * not yet for multilingual and multilabel text classification has not been
* we explore VAT for multilabel emotion recognition with a focus on leveraging
  unlabelled data from different languages to improve the model performance. We
  * extensive semi-supervised experiments on SemEval2018 multilabel and
    multilingual emotion recognition dataset and show
  * performance gains of 6.2% (Arabic), 3.8% (Spanish) and 1.8% (English) over
    supervised learning with same amount of labelled data (10% of train data)
  * improve the existing SOTA by 7%, 4.5% and 1% (Jaccard Index)
    for Spanish, Arabic and English respectively and perform
  * probing experiments for understanding the impact of different layers

# 1 Intro

* emotion categories are highly correlated and subjective (Plutchik, 1980). In
* different languages and culture for understanding the emotions accurately
  * Imbalance in availability of the data across languages further creates
* we
  * questions
    * Can unlabelled data from other languages improve recognition performance of
    * Efficacy of VAT for multilingual and multilabel setup
  * semi-supervised learning in a multilingual and multilabel emotion classif
  * semi-supervised Virtual Adversarial Training (VAT, Miyato+ 2018) for
    multilabel emotion classification using contextual models and perform
  * extensive experiments to demonstrate that
    unlabelled data from other languages `L_ul` improves the classification on
    the target language L tgt
    * competitive performance by reducing the amount of annotated data
      * ie cross-language learning. To effectively leverage the multilingual
  * we use multilingual contextual models for representing the text across
    * comparison to monolingual contextual models to understand the performance
    * explore the advantages of domain-adaptive and task-adaptive pretraining
      of models for our task and observe substantial gains
  * extensive experiments on the SemEval2018 (Affect in Tweets: Task E-c 1 )
    dataset (Mohammad+ 2018) which contains
    * tweets from Twitter annotated with 11 emotion categories across
      three languages English, Spanish and Arabic and demonstrate the
    * semi-supervised learning across languages. To the  best of our knowledge,
  * our study is the first one to explore semi-supervised adversarial learning
    across different languages for multilabel classification. In
* contributions of our work are the following:
  * We explore Virtual Adversarial Training (VAT) for semi-supervised
    multilabel classification on multilingual corpus
  * Experiments demonstrating 6.2%, 3.8% and 1.8% improvements (Jaccard Index)
    on Arabic, Spanish and English by leveraging unlabelled data of other
    languages while using 10% of labelled samples
  * Improve SOTA of multilabel emotion recognition by 7%, 4.5% and 1% (Jaccard
    Index) for Spanish, Arabic and English respectively
  * Experiments showcasing the advantages of domain-adaptive and task-adaptive
    pretraining

# 2 Related Work

* Semi-supervised learning is an important paradigm for tackling the scarcity
  * large amount of unlabelled data along with small amount of labelled data
    (Yang+ 2021, Van Engelen and Hoos, 2020)
  * Early approaches used self-training for leveraging the model’s own
    predictions on unlabelled data to obtain additional information during
    training (Yarowsky, 1995, McClosky+ 2006)
  * Clark+ (2018) proposed cross-view training (CVT) for various tasks like
    chunking, dependency parsing, machine translation and reported SOTA
    * CVT forces the model to make consistent predictions when using the full
      input or partial input
  * Ladder networks (Laine and Aila, 2016),
    Mean Teacher networks (Tarvainen and Valpola, 2017) are another way for
    * temporal and model-weights are ensembled.  Another popular direction
  * adversarial training where the
    * data point is perturbed with random or carefully tuned perturbations to
      create an adversarial sample. The model is then encouraged to maintain
      consistent predictions for the original sample and the adversarial sample.
    * initially for developing secure and robust models to prevent attacks.
      (Goodfellow+ 2014, Xiao+ 2018, Saadatpanah+ 2020) 
    * improve both robustness and generalization for
      classification (Miyato+ (2016)), MT (Cheng+ (2019)) and GLUE (Zhu+ 2019)
    * semi-supervised image and text classification, substantial improvements
      * Miyato+ (2016), Sachan+ (2019), Miyato+ (2018)
* Emotion recognition: lot of attention (Yadollahi+ 2017, Sailunaz+ 2018)
  * taxonomies of emotions suggested by
    Plutchik wheel of emotions (Plutchik, 1980) and (Ekman, 1984) have been
    used by the majority of the previous work in emotion recognition. Emotion
  * formulated as a
    * multiclass problem (Scherer and Wallbott, 1994, Mohammad, 2012) or a
      * the objective is to identify the presence of one of the emotion from
        the taxonomy 
    * multilabel problem (Mohammad+ 2018, Demszky+ 2020). In the multiclass
      * more than one emotion can be present in the text instance
    * Binary relevance approach (Godbole and Sarawagi, 2004) is another way to
      break multilabel problem into multiple binary classification problems.
      * hE not model the co-relation between emotions
    * Seq2Seq approaches (Yang+ 2018, Huang+ 2021) solve this problem by
      modelling the relationship between emotions by inferring emotion in an
      incremental manner
    * distant supervision by exploiting
      emojis (Felbo+ 2017), hashtags (Mohammad, 2012) or
      pretraining emotion specific embeddings and language models
      (Barbieri+ 2021, Ghosh+ 2017)
* contextual models like BERT (Devlin+ 2018), Roberta (Liu+ 2019) etc, the
  * classification has been revolutionized as these models are able to learn
  * across different languages and domains (Hassan+ 2021, Barbieri+ 2021).
    * Hassan Alhuzali and Sophia Ananiadou. 2021.
      Spanemo: Casting multi-label emotion classification as span-prediction.
      arXiv preprint arXiv:2101.10038.
    * Francesco Barbieri, Luis Espinosa-Anke, and Jose Camacho-Collados. 2021.
      A Multilingual Language Model Toolkit for Twitter
      arXiv preprint arXiv:2104.12250.
* Social media content contains linguistic errors, idiosyncratic styles,
  spelling mistakes, grammatical inconsistency, slangs, hashtags, emoticons etc
  (Barbieri+ 2018, Derczynski+ 2013) 
  => off-the-shelf contextual models may not be optimum
  => We use language-adaptive, domain-adaptive and task-adaptive pretraining
  * has shown performance gains  for different tasks and domains (Peters+ 2019,
    Gururangan+ 2020, Barbieri+ 2021, Howard and Ruder, 2018, Lee+ 2020)
    * Matthew E Peters, Sebastian Ruder, and Noah A Smith.  2019
      To tune or not to tune? adapting pretrained reprs to diverse tasks.
      arXiv preprint arXiv:1903.05987.
    * S Gururangan, A Marasović, S Swayamdipta, K Lo, I Beltagy, D Downey, 
        NA Smith. 2020
      Don’t stop pretraining: adapt language models to domains and tasks
      arXiv preprint arXiv:2004.10964.
    * Jeremy Howard and Sebastian Ruder. 2018.
      Universal language model fine-tuning for text classification. 
      arXiv preprint arXiv:1801.06146.
    * Jinhyuk Lee, Wonjin Yoon, Sungdong Kim, Donghyeon Kim, Sunkyu Kim,
        Chan Ho So, and Jaewoo Kang. 2020
      Biobert: a pre-trained biomed lang repr model for biomedical text mining.
      Bioinformatics, 36(4):1234–1240.

