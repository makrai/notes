MentalBERT: Publicly Available Pretrained Language Models for Mental Healthcare
Shaoxiong Ji, Tianlin Zhang, Luna Ansari, Jie Fu, Prayag Tiwari, Erik Cambria
arXiv:2110.15621 [cs.CL]

pretrained MentalBERTs with Huggingface’s model repository, available at
https://huggingface.co/mental

* mental disorders could sometimes turn to suicidal ideation without treatment
* Early detection of mental disorders and suicidal ideation from social content
  * a potential way for effective social intervention
* pretrained contextualized language representations
  * domain-specific pretrained models and several downstream applications
* we: two pretrained language models for mental healthcare in English
  * MentalBERT and MentalRoBERTa, to benefit machine learning for the mental
  * we evaluate our trained domain-specific models and several variants of
    pretrained language models on several mental disorder detection benchmarks
    * depression, stress, and suicidal ideation detection
  * language representations pretrained in the target domain improve the
    performance of mental health detection tasks

# 1 Intro

* Social content from users who wrote about mental health issues and posted
  suicidal ideation has been widely used (eg, Ji+ 2018; Tadesse+ 2019)
* Machine learning-based detection techniques can empower healthcare workers in
  early detection and assessment to take an action of proactive prevention
* Recent advances in deep learning facilitate the development of effective
  early detection methods (Ji+ 2021a). A new trend in natural language
  * contextualized pretrained language models, has attracted much attention for
  * domain-specific pretrained language models for learning text reprs:
  * biomedical BERT (Lee+ 2020) & clinical BERT (Alsentzer+ 2019; Huang+ 2019)
  * hE no pretrained language models customized for mental healthcare
* Our paper trains and releases two representative bidirectional MLMs, ie,
  BERT and RoBERTa (Liu+ 2019), with
  * corpus collected from social forums for mental health discussion
  * MentalBERT and Mental-RoBERTa
  * this work is the first to pre-train language models for mental healthcare
* comprehensive evaluation on several mental health detection datasets with
  pretrained language models in different domains

# 2 Methods and Setup

# 3 Results

## 3.1 Datasets

## 3.3 Results and Discussion

# 4 Related Work

## 4.1 Contextualized Text Embeddings: Self-supervised large-scale pretraining

* domain-specific variants of pretrained contextualized text embeddings. Embed-
  dings in specific domains aim to encode domain-specific information to boost
* BioBERT (Lee+ 2020) pretrained the BERT model in the biomedical domain using
  research articles from PubMed, which was applied to many biomedical tasks
  such as biomedical relation extraction and named entity recognition
* ClinicalBERT (Alsentzer+ 2019) used clinical notes as the pretraining corpus
  * applications by fine-tuning: Lin+ (2019) and Ji+ (2020)

## 2.3 NLP for Mental Healthcare in social media is increasingly applied

* identifying emotions, mood, and profiles that might indicate mental health
  problems (Calvo+ 2017)
* mental health detection that categorizes given social posts into classes of
  mental disorders such as depression (Tadesse+ 2019)
* Resnik+ (2013) applied topic modeling, an unsupervised approach that reduces
  the input of textual data feature space to a fixed number of topics to
  feature engineering in depression detection
* Feature engineering + classifiers for mental health detection (Shatte+ 2019;
  Abd Rahman+ 2020)
* features
  * sensor signals from personal devices (Mohr+ 2017) and
  * EEG signals (Gore and Rathi, 2019) have been applied
  * textual: word counts, TF-IDF (Campillo-Ageitos+ 2021), topic features
    (Shickel+ 2020) and sentiment traits (Yoo+ 2019)
* machine learning-based methods for suicidal ideation detection (Ji+ 2021b)
* deep representation learning methods, which enable automatic feature learning
  * feed [pre-trained] embeddings into neural architectures such as
    convolutional neural networks (Rao+ 2020),
    recurrent networks (Bouarara, 2021),
    self attention-based Transformers,
    hybrid architectures like CNN-LSTM (Kang+ 2021) and
    more other deep learning architectures (Su+ 2020)
* Jiang+ (2020), MartínezCastaño+ (2021) and Bucur+ (2021), use
  pretrained language models fine-tuned for mental health tasks
