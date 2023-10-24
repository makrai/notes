The rJokes Dataset: a Large Scale Humor Collection
Orion Weller, Kevin Seppi
LREC 2020

https://github.com/orionw/rJokesData

# Abstract

* Humor depends upon many factors, including topic, date, and recipient
  Because of this variation, it can be hard to determine what exactly makes a
  joke humorous, leading to difficulties in joke identification and related
* current humor datasets are lacking in both joke variety and size (< 100k)
* we compile a collection of over 550,000 jokes posted over an 11 year period
  on the Reddit r/Jokes subreddit (an online forum), providing a large scale
  humor dataset that can easily be used for a myriad of tasks. This dataset
  * quantitative metrics for the level of humor in each joke, as determined by
    subreddit user feedback
  * contains almost even percentages of negative and positive sentiment,
  * strong contrasts between non-humorous and humorous jokes. We hope that this
* We explore this dataset through the years, examining basic statistics, most
  mentioned entities, and sentiment proportions
* also as a task for future work, where models learn to predict the level of
  humor in a joke
* we provide strong SOTA baseline models and show room for future improvement
* We hope that this dataset will help not only/but also
  * computational humor, but also help
  * social scientists who seek to understand popular culture through humor

# 1 Intro

* Understanding humor in psychology, linguistics, and even health research
  (Wolff+, 1934; Norrick, 1993; Knapp+, 1992). It is an intrinsic aspect of our
  * often fickle and difficult for even humans to understand
  * Computational research in the field of natural language processing has
    * understanding (Hempelmann, 2008),
    * classifying (Zhang and Liu, 2014; Chen and Soo, 2018), and
      * Chen, P.-Y. and Soo, V.-W. (2018) Humor recognition using deep learning
        NAACL 2018 Volume 2 (Short Papers), Jun
    * generating (He+, 2019; Valitutti+, 2013) humorous text in order to better
      understand the structures that create humor (López and Vaid, 2017;
      Mihalcea and Strapparava, 2005)
* SemEval competitions, which include
  * pun detection in English (Miller+, 2017) in 2017 and a
  * humorous headline regression task in 2020 (Hossain+, 2019).  However, these
* other recent tasks in humor identification (Yang+, 2015; Chen and Soo, 2018;
  Weller and Seppi, 2019) focus on
* hE small datasets with between 10-100k instances, usually on specific area eg
  * puns (Yang+, 2015),
  * Ted Talks (Chen and Soo, 2018), or
  * TV shows (Purandare and Litman, 2006)
* generation, with recent models including GANs (Luo+, 2019), RNNs (Yu+, 2018),
  and retrieval models (He+, 2019)
  * GPT-2 (Radford+, 2019)'s success has not translated into the humor
    generation area, which has been a more difficult area of research. Here we
  * GPT-generated is preferred to actual jokes 7 % (Luo+, 2019), with
  * retrieval based generative models generating puns 31% of the time (He+,
    2019)
* lack of large corpora available for the training of these systems
  * Having large corpora has been seen as a contributing factor to the success
    of other sub-fields, such as machine translation or language modeling,
    * GigaWord, BooksCorpus, and the Common Crawl (Parker+, 2011; Zhu+, 2015)
* Our contribution to this area consists of scraping, processing, and filtering
  the largest humor dataset to date, consisting of 573,335 jokes in English.1
  * labels for the body and punchline of the jokes, the level of humor present,
    and the date of posting
  * analysis of basic features, yearly trends, and strong baselines for a new
    humor prediction task
* this dataset will be used in pursuit of the following research areas
  * Understanding what creates humor: analyzing the structure and context
  * Examining reactions to public events, as measured through humor
  * as a resource for? different but related tasks, such as irony or satire
  * Generating humor using this corpus as a resource for large scale training
