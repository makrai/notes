A Semi-Supervised BERT Approach for Arabic Named Entity Recognition
Chadi Helwe 1 , Ghassan Dib 2 , Mohsen Shamas 2 , Shady Elbassuoni 2

* NER is a particularly difficult task for Arabic. First, there is
  * no capitalization in the Arabic script, commonly used in non-Arabic
  * a lot of named entities are also used as common nouns and adjectives
  * rich morphology.  Finally, one major issue that hinders Arabic NLP research,
  * lack of sufficient resources: corpora and gazetteers that can be leveraged
    * usually limited in scope or not publicly available
* semi-supervised deep learning approach for Arabic NER inspired by the work of
  Yalniz+ (Yalniz+ 2019). The idea is to train
  * two BERT-based models: a teacher model and a student model. BERT stands for
  * teacher model is trained on a small labeled data set and then applied on a
    huge semi-labeled dataset to predict the classes of its unlabeled tokens
  * output is then used to train a student model with the same architecture as
  * then the student model is fine-tuned using the small labeled dataset used to
    train the teacher model
  * from the conclusion: The 
    * first dataset was fully labeled, while the second dataset was partially
* evaluate our approach, we used three different Arabic NER benchmarks, namely
  AQMAR (Mohit+ 2012), NEWS (Darwish, 2013) and TWEETS (Darwish, 2013)
  * We compared our approach to various baselines and SOTA NER tools and we
    outperformed all of them in the case of AQMAR and NEWS datasets and achieved
    comparable performance in the case of the TWEETs dataset
  * For the TWEETS dataset, Helwe and Elbassuoni’s deep co-learning approach
    (Helwe and Elbassuoni, 2019) scores a higher F- measure than our method
    because the BERT model was pre-trained and trained on mainly MSA corpora
    that do not contain mistakes and misspellings

# 2 related work

# 3 semi-supervised learning approach

# 4 evaluate our proposed approach on different datasets

# 5 conclude and present future directions

* future work, we plan to pre-train the BERT model on tweets 
  * contain misspellings and mistakes and not necessarily written in MSA
  * apply our approach to part-of-speech tagging and dependency parsing
