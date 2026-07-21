Augmenting Data for Sarcasm Detection with Unlabeled Conversation Context 
Hankyol Lee, Youngjae Yu, Gunhee Kim
Fig-Lang 2020 Proceedings of the Second Workshop on Figurative NLP

# Abstract

* We
  * a novel data augmentation technique, Contextual Response Augmentation
    * utilizes conversational context to generate meaningful samples 
  * mitigate the issues regarding unbalanced context lengths by 
    changing the input output format of the model 
    such that it can deal with varying context lengths effectively.
  * participated in the sarcasm detection task of FigLang2020, have won and
    achieves the best performance in both Reddit and Twitter datasets.

# 1 Intro

* figurative languages such as irony, sarcasm, and metaphor (Pozzi+ 2016). The
* we determine whether a response is sarcastic or not, given 
  the immediate context (i.e. only the previous dialogue turn) and/or 
  the full dialogue thread (if available). For evaluation of our model, 
* we participated in the FigLang2020 sarcasm challenge 1 , and have won the
  competition as our model is ranked 
  1 out of 35 teams for the Twitter dataset and 1 out of 34 teams for the Reddit
* our technical contributions to win the challenge as follows:
  1. new data augmentation technique that can successfully leverage the struc-
     tural patterns of the conversational dataset.  Our technique, called
     Contextual Response Augmentation (CRA), utilizes the conversational
     context of the unlabeled dataset to generate new training samples.
  2. The context lengths (i.e. previous dialogue turns) are highly variable
    ~> we propose a context ensemble method that exploits multiple context
    lengths to train the model. The proposed format is 
  * easily applicable to any Transformer (Vaswani+ 2017) encoders without
    changing any model architecture.

# 2 Approach

## 2.1 Model

* The model broadly consists of two parts: 
  the transformer (BERT, Devlin+ 2018) and pooling layers, 
  which are decomposed into 
  BiLSTM (Schuster and Paliwal, 1997) and 
  NetXtVLAD (Lin+ 2018) as an improved version of NetVLAD (Arandjelovic+ 2016).
  * NetVLAD is a CNN-model that is highly effective and 
    more resistant to over-fitting than usual temporal models such as LSTM or
    GRU (Lin+ 2018)

## 2.2 Training details

* minor
  * entropy loss on the last softmax layer in the model. The training 
  * batch size is 4 for all the experiments. We adopt the 
  * cyclic learning rate (Smith, 2017), where the initial learning rate is 1e6,
    * the moment parameters are (0.825, 0.725).
* Dataset Splitting. We further split the provided training set (training data)
  into the training (train data) and validation (valid data) set as in Table 1.
  We use valid data for early stopping and the model performance validation
  during the training phase.
* Context Ensemble. Figure 2 depicts the idea of the context ensemble method 
  to cope with highly variable context lengths in the dataset. 
  * Instead of using the training data as their original forms only (Fig 2(a)), 
  * we consider multiple context window sizes as separate data, which 
    can naturally balance out the proportion of short and long context, Fig 2(b)

## 2.3 Data augmentation

* We use two techniques to augment the training data: labeled or not.
  * our Contextual Response Augmentation (CRA) can take advantage of unlabeled
    dialogue threads, which are abundant and cheaply collectible. Figure 3
    * details are presented in section 2.3.2.

### 2.3.1 Augmentation with Labeled Data

* Each training sample consists of contextual utterances, a response and its label
* Our idea is to take the context sequence as a new datapoint and label it as
  ”NOT SARCASM”. As shown in Figure 2, 
* without the response [r 1 ], the sequence could not be labeled as ”SARCASM”.
* We hypothesize that these newly generated negative samples help the model
  better focus on the relationship between the response [r 1 ] and its contexts
* we balance out the number of negative samples by creating positive samples via
  back-translation methods (Bérard+ (2019); Zheng+ (2019)), which simply
  * ie translate the sentences into another language and then back 
  * we have used 3 languages [French, Spanish, Dutch].

### 2.3.2 Augmentation with Unlabeled Data

* We also generate additional training samples using the unlabeled data: [c 1 ,
* Figure 3, the procedures for unlabeled augmentation are as follows:
  1. We encode each response in the labeled training set using the BERT trained
     on natural inference tasks (Reimers and Gurevych, 2019).
  2. Given unlabeled data [c 1 , c 2 , · · · , c n , r 1 ], we encode [r 1 ] and
     find the most similar top k(= 1000) data from the labeled database. We
     denote them as {r t,1 , · · · , r t,k }.
  3. We rank the top k candidates according to the next sentence prediction
     (NSP) confidence of BERT 2 . That is, we input [c 1 , c 2 , · · · , c n ,
     sep, r t,i ] to BERT, and compute the NSP confidence of r t,i for all i ∈
     {1, · · · , k}. We then select the most confident response r t ∗ with its
     label l t ∗ and make a new data point [c 1 , c 2 , · · · , c n , r t ∗ , l
     t ∗ ].
* Table 2 shows some samples generated from this technique. 
* The quality of generated data depends undoubtedly on the degree of contextual
  conformity and similarity between the initial responses.
* adding more data makes the quality of the augmented data better as the label
  transfer noise becomes attenuated. In summary, 
* besides the standard datasets shown in Table 7, we further crawled 100,000
  texts from both Twitter and Reddit for the augmentation with unlabeled data.

# Experiments

* tab 4: We first report the quantitative results 

## 3.1 Further Analysis

* We compare different configurations of pooling layers, context ensemble, and
  data augmentation.
* Pooling Layers. Table 3 shows the comparison of sarcasm detection performance
  between NeXtVLAD and other pooling methods in performance. When coupled with
  BiLSTM, NeXtVLAD achieves better performance than max and mean pooling
  methods.
* Context Ensemble. Table 6 shows the comparison with different methods.  We use
  the baseline (Transformer+BiLSTM+ Maxpooling) and train it without augmenting
  the training set. 
  * F1 scores of the model are better in the order of 
    * ensemble with maximum context, 
    * ensemble with three contexts and 
    * no context. 
  * The performance gap with or without context ensemble implies that 
    balancing out the samples in terms of context length is important. On the
  * the performance gap between (a) and (b) is only 0.006, indicating that the
    use of older than three recent conversational contexts is scarcely helpful.
* Data Augmentation. Table 5 compares the sarcasm detection results when the
  data augmentation is applied or not. The augmentation with labeled data
  increases the F1 score from 0.854 to 0.861. The augmentation with unlabeled
  data further enhances performance from 0.861 to 0.897.  The results
  demonstrate that both augmentation techniques help with the performance.

## 3.2 Error Analysis 

* we further analyze some examples of the following three cases according to
  whether the proposed labeled and unlabeled data augmentation (DA) is applied
  or not: 
  i. the prediction is wrong without DA but correct with DA, 
  ii. the prediction is correct without DA but wrong with DA, and 
  iii. the prediction is wrong with and without DA. 
* In other words, (i) is the case where DA helps, (ii) is the one where DA
  hurts, and (iii) is the one where DA fails to improve.
* Table 8 shows some examples of these three cases. 
  * The initial steps of the CRA involve finding similar training samples from
    the labeled database. Thus, after applying CRA, samples containing specific
    hashtags, eg #NotReally #Relax, are included in the training set. We
    * theses tags tend to occur with the samples that are labeled “SARCASM”, and
      thus CRA helps the model learn the correlation between the hashtags and
      the labels. 
  * The augmented response (r2) contains the phrase “cult leader” as in the
    original response (r1). The corresponding label, however, is “SARCASM”. When
    the newly added samples do not match the context, or the labels are
    incorrect, CRA degrades the prediction. 
  * The third case arises mostly when the situation is subtle and requires
    external knowledge beyond the given context. In order for the model to
    * eg the model requires to understand the tag #VPD (Video Per Day). 
      It is not clear what #VPD is from the context, and 
      without such knowledge, the model may still make incorrect predictions.
