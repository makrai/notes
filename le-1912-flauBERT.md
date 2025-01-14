FlauBERT: Unsupervised Language Model Pre-training for French
Hang Le, Loïc Vial, Jibril Frej, Vincent Segonne, Maximin Coavoux, Benjamin
  Lecouteux, Alexandre Allauzen, Benoît Crabbé, Laurent Besacier, Didier Schwab
LREC 2020 arXiv:1912.05372 [cs.CL]

* shared to the research community for further reproducible experiments
  * Different versions of FlauBERT as well as
  * a unified evaluation protocol for the downstream tasks, called FLUE (fr nlu)

# Abstract

* learned on a very large and heterogeneous French corpus
  * trained on a multiple-source corpus and achieved SOTA results on many tasks
* Models of different sizes are trained using the new CNRS supercomputer
* tasks: text classification, paraphrasing, natural language inference, parsing,
  word sense disambiguation
  * most of the time they outperform other pre-training approaches
* competitive with CamemBERT (Martin+ 2019) – another fr pretrained LM
  * despite being trained on almost twice as fewer text data
* FLUE
  * similar to the popular GLUE benchmark (Wang+ 2018)
  * named FLUE (French Language Understanding Evaluation)

# 2.  Related Work

## 2.2. Pre-trained Language Models Beyond English

* ELMo exists for Portuguese, Japanese, German and Basque
* BERT and variants were trained for simplified and trad Chinese and German
* Portuguese version of MultiFiT is also available
* BERT for
  * Arabic (Antoun+ 2020)
  * Dutch (de Vries+ 2019; Delobelle+ 2020)
  * Finnish (Virtanen+ 2019)
  * Italian (Polignano+ 2019)
  * Portuguese (Souza+ 2019)
  * Russian (Kuratov and Arkhipov, 2019)
  * Spanish (Cañete+ 2020)
  * Vietnamese (Nguyen and Nguyen, 2020)
* French, besides pre-trained language models using
  * [ULMFiT and MultiFiT configurations]
    (https://github.com/piegu/language-models)
  * CamemBERT (Martin+ 2019) is a French BERT model concurrent to our work
* multilingual models with a shared vocabulary
  * multilingual BERT for 104 languages pioneered this approach
  * parallel data to build a cross-lingual pre-trained version of LASER (Artetxe
    and Schwenk, 2019) for 93 languages,
  * XLM (Lample and Conneau, 2019) and XLM-R (Conneau+ 2019) for 100 languages

## 2.3. [multi-task] Evaluation Protocol for NLP

* multi-task evaluation benchmark such as GLUE (Wang+ 2018) for English is benef
  * SuperGLUE (Wang+ 2019a): a new benchmark built on the principles of GLUE,
    * more challenging and diverse set of tasks
* Chinese version of GLUE is also developed to evaluate model performance
* no such benchmark for French

# 4 FLUE

* different domains, level of difficulty, degree of formality, and amount of
  training samples
  * Three out of six tasks are from cross-lingual datasets
    (Text Classification, Paraphrase, Natural Language Inference)
    since we also aim to provide results from a monolingual pre-trained model to
    facilitate future studies of cross-lingual models, which have been drawing
    much of research interest recently.  Table 2 gives an overview of the
    datasets, including their domains and training/development/test splits

## 4.1. Text Classification

### The Cross Lingual Sentiment CLS (Prettenhofer and Stein, 2010) dataset

* Amazon reviews for three product categories: books, DVD, and music
* four languages: English, French, German, and Japanese
* rating from 1 to 5 stars
  * Following Blitzer+ (2006) and Prettenhofer and Stein (2010),
  * ratings with 3 stars are removed
    * Positive reviews: ratings higher than 3 and negative reviews are those < 3
  * train and test set for each product category
  * train and test sets are balanced, including around 1-1 K positive and neg
* We take the French portion to create the binary text classification task
  * report the accuracy on the test set

# 5. Experiments and Results

* We compare the performance of FlauBERT with
  * Multilingual BERT (Devlin+ 2019, mBERT) and
  * CamemBERT (Martin+ 2019) on all tasks
  * the best non-BERT model for comparison

## 5.1. Text Classification

### Model description: We followed the standard fine-tuning process of BERT

* input is a degenerate text-∅ pair
* classification head is composed of the following layers, in order:
  dropout, linear, tanh ac- tivation, dropout, and linear
  * The output dimensions of the linear layers are respectively equal to the
    hidden size of the Transformer and the number of classes
    (which is 2 in this case as the task is binary classif)
  * The dropout rate was set to 0.1
  * 30 epochs using a batch size of 16 while performing a
  * grid search over 4 different learning rates: 1e−5, 5e−5, 1e−6, and 5e−6
  * A random split of 20% of the training data was used as validation set

### Results

* both CamemBERT and FlauBERT outperform mBERT by a large margin
* FlauBERT
  * BASE performs moderately better than CamemBERT in the books dataset, while
    its results on the two remaining datasets of DVD and music are lower than
    those of CamemBERT. FlauBERT
  * LARGE achieves the best results in all categories
