English Contrastive Learning Can Learn Universal Cross-lingual Sentence
Embeddings Yau-Shian Wang, Ashley Wu, Graham Neubig EMNLP 2022 arXiv:2211.06127
[cs.CL]

* Universal cross-lingual sentence embeddings map semantically similar
* usually requires supervised cross-lingual parallel sentences. In this work,
* we propose mSimCSE, which extends SimCSE to multilingual settings and reveal
* contrastive learning on English data can surprisingly learn high-quality
  universal cross-lingual sentence embeddings without any parallel data. In
* unsupervised and weakly supervised settings, mSimCSE significantly improves
  previous sentence embedding methods on cross-lingual retrieval and
  multilingual STS tasks. The performance of
* unsupervised mSimCSE is comparable to fully supervised methods in retrieving
  low-resource languages and multilingual STS. The performance can be 
* further enhanced when cross-lingual NLI data is available. Our code is
* from the conclusion
  * four different strategies to extend SimCSE to multilingual, including 
    * unsupervised, English NLI supervised, cross-lingual NLI supervised, and
      supervised strategies. We surprisingly find that the 
  * English NLI supervised strategy can achieve performance on par with
    previous supervised methods that leverage large amounts of parallel data.

# 2 Related Work

## 2.1 Cross-lingual Zero-shot Transfer Learning

* multilingual models (Devlin+ 2019; Conneau and Lample, 2019; Conneau+ 2020;
  Wei+ 2021; Chi+ 2022) have been shown to generalize to unseen languages in a
* In machine translation, zero-shot transfer 
  * models can translate on unseen language pairs (Zoph+ 2016; Johnson+ 2017).
* With the help of self-supervised learning, model can better acquire
  lang-invariant repr, thus improving zero-shot MT (Siddhant+ 2020; Liu+ 2020).

* adversarial networks (Keung+ 2019; Chen+ 2019) or align representations via
  parallel corpus (Cao+ 2020)
* Pires+ (2019) revealed that mBERT is good at zero-shot cross-lingual transfer
  * fintuning on a specific monolingual task can generalize to other languages.
* X-Mixup (Yang+ 2022) performs manifold mixup of source and target languages
  to learn general representations
* work which enhances cross-lingual transfer by using English downstream tasks
  to finetune multilingual language models (Phang+ 2020) in that both methods
  * like we, leverage English NLI supervision
  * Our method differs from theirs in that we apply contrastive learning for
    representation learning and we only focus on sentence embeddings.

## 2.2 English Sentence Embeddings

* Sentence embeddings aim to map sentences into a shared embedding space in
  * learned by predicting the surrounding sentences of an input sentence, in
    * generative (Kiros+ 2015) or 
    * discriminative (Logeswaran and Lee, 2018) manners. Recently, with the
* contrastive learning 
  * domain
    * visual representations (Chen+ 2020b), more and more work explores
    * sentence embeddings
  * training signal can be obtained by data 
    * augmentation (Fang+ 2020; Yan+ 2021; Meng+ 2021; Carlsson+ 2021) or
      self-guided architecture (Kim+ 2021; Carlsson+ 2021).
  * SimCSE (Gao+ 2021) is the most famous one, which adopts either 
    * NLI supervision to define relevant sentences or 
    * unsupervised dropout as data augmentation, and 
    * improves SOTA results
    * We choose to extend SimCSE to multilingual due to its impress simplicity

## 2.3 Cross-lingual Sentence Embeddings

* Universal cross-lingual sentence embeddings 
  align semantically similar cross-lingual sentences into a shared embeddings
* previous work uses large amounts of parallel data to train neural networks to
  * LASER (Artetxe and Schwenk, 2019b) trains Bi-LSTM with parallel sentences
    of 93 languages to encourage consistency between the crosslingual sentence
  * MUSE (Yang+ 2020) for 16 languages via translation based bridge tasks:
    * multifeature question-answer prediction, translation ranking, and NLI
  * LaBSE (Feng+ 2020) leverages dual-encoder framework to finetune mBERT on 6
    billion parallel sentence pairs over 109 languages
  * Reimers and Gurevych (2020) extend the monolingual sentence embedding to
    multilingual by teacher-student training, in which a target language
    student model mimics source language embeddings from the teacher model.
  * Sentence piece encoder (SP, Wieting+ 2021) simply learns sentence piece
    embeddings using parallel data and outperforms BERT-base models.
* weakly supervised or even unsupervised manners. 
  * CRISS (Tran+ 2020) uses the representations of mBART encoder as initial
    sentence embeddings, which are used to mine parallel texts from monolingual
    corpora
    * iteratively extract bitexts and use the bitexts to update the model in a
      self-training loop. Notice that 
    * our method can be easily combined with CRISS by using mSimCSE as the
      initial model
  * DuEAM (Goswami+ 2021), a dual-encoder model that leverages word mover
    distance and cross-lingual parallel NLI sentences to construct positive
    training pairs
    * diff: we use contrastive learning, which is more effective than dual enc
      * and that our method is more simple that only requires English data.

## 4.5 Unsupervised Classification

* to evaluate whether the model can cluster semantically similar documents
  together on the languages other than English. We use 
* Tnews dataset in CLUE benchmark 5 to evaluate the performance of our model.
  * Tnews is a Chinese news classification dataset, which contains 
  * 15 news categories
  * k-means clustering on sentence embedding, in which cluster
    * k is set to be the same as the number of news categories. Then, we
  * purity: mean accuracy of each cluster that measures what percentages of
    documents in each cluster are from the same human-labeled category.

* Compared with unsupervised pre-trained language models, 
  mSimCSE significantly improves the purity scores. This is expected because
  without fine-tuning, the embeddings from pre-trained language models cannot
  capture relative distances between instances. Similar to the observation in
  * English NLI supervision can greatly enhance the performance, 
    closing the gap between the fully supervised fine-tuned BERT.

## 4.6 Zero-shot Cross-lingual Transfer of Sentence Classification

* we evaluate our model on PAXS-X (Yang+ 2019) sentence classification task.
  * PAXS-X requires a model to determine whether two sentences are paraphrases.
* In Table 5, compared with XLM-R and XLM-E (Chi+ 2022), 
  mSimCSE without using NLI data improves the performance, which demonstrates
* using English NLI supervision does not improve performance.

# 5 Analysis

# 6 Discussion

* we speculate that multilingual language models = two disentangled embeddings,
  a language-specific embedding and a general language agnostic embedding.
* English contrastive task 
  * doesn’t require mlms to capture language identity,
  * it only pulls closer language-agnostic sentence embeddings while weakening
    language-specific embedding. This property 
* can be verified in Figure 1 and Table 7. hE, it still requires investigation
