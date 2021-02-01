The Thirty-Fourth AAAI Conference on Artificial Intelligence (AAAI-20)
Cross-Lingual Natural Language Generation via Pre-Training
Zewen Chi, Li Dong, Furu Wei, Wenhui Wang, Xian-Ling Mao, Heyan Huang

# Intro

* cross-lingual sentence encoders 
  (Johnson+ 2017; Conneau+ 2018; Lample and Conneau 2019), which try to 
  * encode multilingual texts into a shared vector space. Despite achieving
  * promising results on cross-lingual classification problems, 
  * cross-lingual pre-trained models purposed for NLG tasks are rel understudied
* The cross-lingual generation problem is challenging due to the following
  * encoder and the decoder should be pre-trained together. Second, the
  * many-to-many nature of cross-lingual NLG increases language pairs with the
    square of the number of languages. Third, the 
  * prediction space of cross-lingual NLG is much larger than classification
* Previous work mainly relies on machine translation (MT) to map texts to
  * in a pipeline manner (Wan, Li, and Xiao 2010). For example, the 
    inputs written in other languages are first translated to English, and fed
    into the NLG model that is trained by English data. Then the 
    generated English texts are translated back to the target language. 
  * generate pseudo training data for other language pairs that are lack of
    * (Shen+ 2018; Duan+ 2019)
* we propose a 
  * cross-lingual pre-trained model (named as X NLG ) in order to transfer
    monolingual NLG supervision to other pre-trained languages by finetuning.
    Specifically, X NLG shares the same sequence-to-sequence model across
    languages, and is pre-trained with both monolingual and cross-lingual
    objectives. The model not only learns to understand multilingual input, but
    also is able to generate specific languages by conditioning on the encoded
    semantics. Figure 1 demonstrates how to use X NLG to perform cross-lingual
    transfer for downstream tasks. The proposed model enables us to fine-tune
    the pre-trained model on monolingual NLG training data, and then evaluate it
    beyond a single language, including zero-shot crosslingual generation.
  * explore several fine-tuning strategies to make a compromise between
    cross-lingual ability and task ability. In addition, we introduce 
  * two crosslingual NLG datasets (i.e., question generation, and abstractive
    summarization) for evaluation, which includes three languages, namely
    English, Chinese, and French. 
* Experiments: X NLG achieves competitive performance compared with the
  machine-translation based pipeline model in zero-shot cross-lingual settings

# 3 Methods

* As shown in Figure 2, X NLG is a pre-trained sequence-to-sequence model,
  which is based on Transformer (Vaswani+ 2017). 
  * Both the encoder and the decoder are supposed to support multiple languages.
  * we use language tag embeddings to distinguish the source and target
    languages, following (Lample and Conneau 2019), 
  * Given a sentence and its corresponding language tag, X NLG
    encodes the input into vector representations. 
  * By conditioning on the encoding vectors and a specific language tag, the
    decoder generates the output sequence in the target language.

## 3.3 Fine-Tuning on Downstream NLG Tasks

* In practice, we found that the proposed fine-tuning method prevents the
  model from only decoding English words for the Anyto-Others setting.

# 4 Experiments

## 4.4 Ablation Studies

* we first fine-tune X NLG on the English AS data, and then fine-tune it on the
  French or Chinese AS data. We compare with the monolingual supervised model
  that X NLG is only fine-tuned on the dataset of the target language. As shown
  in Figure 3, we can observe that the cross-lingual supervision improves
  performance for few-shot abstractive summarization. As the training data size
  becomes larger, the performances of the two models are getting closer.
