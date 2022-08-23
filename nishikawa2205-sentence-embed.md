EASE: Entity-Aware Contrastive Learning of Sentence Embedding
Sosuke Nishikawa, Ryokan Ri, Ikuya Yamada, Yoshimasa Tsuruoka, Isao Echizen
arXiv:2205.04260 [cs.CL] NAACL 2022

Our source code, pre-trained models, and newly constructed multilingual STC
dataset are available at this https URL. 

# Abstract

* We present EASE, a novel method for learning sentence embeddings via
  contrastive learning between sentences and their related entities
* The advantage of using entity supervision is twofold: 
  * entities have been shown to be a strong indicator of text semantics and
    thus should provide rich training signals for sentence embeddings; 
  * entities are defined independently of languages and thus offer useful
    cross-lingual alignment supervision
* We evaluate EASE against other unsupervised models both in monolingual and
  multilingual settings
  * competitive or better performance in English semantic textual similarity
    (STS) and short text clustering (STC) tasks
  * significantly outperforms baseline methods in multilingual settings on a
    variety of tasks

# 1 Intro

* The current dominant approach to learning sentence embeddings is fine-tuning
  general-purpose pretrained language models, such as BERT (Devlin+ 2019), with
  * supervision can be
    * natural language inference data (Reimers and Gurevych, 2019),
    * adjacent sentences (Yang+ 2021), or a
    * parallel corpus for multilingual models (Feng+ 2020).

* we explore supervision by entity hyperlink annotations from Wikipedia
  * Their advantage is twofold: 
    * entities have been shown to be a strong indicator of text semantics
      (Gabrilovich and Markovitch, 2007; Yamada+ 2017, 2018; Ling+ 2020) and
      thus should provide rich training signals for sentence embeddings; 
    * entities are defined independently of languages and thus offer a useful
      cross-lingual alignment supervision (Calixto+ 2021; Nishikawa+ 2021;
      Jian+ 2022; Ri+ 2022)
    * no need for a parallel resource to train well-aligned multilingual
      sentence embeddings, especially for low-resource languages. To
* we present EASE (Entity-Aware contrastive learning of Sentence Embeddings),
  * high-quality sentence embeddings in both monolingual and multilingual
    settings.  
  * sentences are embedded in the neighborhood of their hyperlink entity embeds
    and kept apart from irrelevant entities
  * shared entity embeddings across languages for multilingual models to
    facilitate cross-lingual alignment of the representation.  
* ie two types of objectives: 
  * our novel entity contrastive learning (CL) loss between sentences and their
    related entities (Figure 1); 
    * pulls the embeddings of sentences and their related entities close while
      keeping unrelated entities apart.
    * expected to arrange the sentence embeddings in accordance with semantics
      capturedby the entities
  * the self-supervised CL loss with dropout noise. The entity CL objective
* hard negatives
  * To further exploit the knowledge in Wikipedia and improve the embeddings,
  * a method for mining hard negatives based on the entity type. The second
* self-supervised CL objective with dropout noise (Gao+ 2021; Liu+ 2021), is
  combined with the first one to enable sentence embeddings to capture
  fine-grained text semantics
* We evaluate our model against other SOTA unsupervised sentence embedding
  * competitive or better performance on semantic textual similarity (STS) and
    short text clustering (STC) tasks.
  * multilingual settings
* new dataset for the high-level semantics of multilingual sentence embeddings,
  * MewsC-16 (Multilingual Short Text Clustering Dataset for News in 16 langs)
* Multilingual EASE is trained using the entity embeddings shared across langs.
  * significantly outperforms the baselines in multilingual STS, STC, parallel
    sentence matching, and cross-lingual document classification tasks.

* further demonstrate the effectiveness of the multilingual entity CL in a more
  realistic scenario for low-resource languages
  * we fine-tune a competitive multilingual sentence embedding model, LaBSE
    (Feng+ 2020) using multilingual entity CL,, and show that the tuning
  * improves the performance of parallel sentence matching for low-resource
    languages under-supported by the model.

* we analyze the EASE model by studying
  * ablated models and the
  * multilingual properties of the sentence embeddings to shed light on the

# 2 Related Work

## 2.1 Sentence Embeddings

* represent the meaning of sentences in the form of a dense vector, have been
  * Paragraph Vector (Le and Mikolov, 2014) in which sentence embeddings are
    trained to predict words within the text
  * Subsequently, various kinds of training tasks have been explored including
    * reconstructing or predicting adjacent sentences (Kiros+ 2015; Logeswaran
      and Lee, 2018) and 
    * solving a natural language inference (NLI) task (Conneau+ 2017).
  * general-purpose pretrained language models such as BERT (Devlin+ 2019), it
    * common to fine-tune pretrained models to produce high-quality sentence
      embeddings,
    * revisiting the aforementioned supervision signals (Reimers and Gurevych,
      2019; Yang+ 2021), and using
    * self-supervised objectives based on contrastive learning (CL). In this
    * we present a CL objective with entity-based supervision. We train our
      EASE model with entity CL together with self-supervised CL with dropout
      noise and show that the entity CL improves the quality of sentence embeds

## Contrastive learning

* idea: pull semantically similar samples close and keep dissimilar samples
  apart (Hadsell+ 2006)
* for sentence embeddings can be classified by the type of positive pairs used.
  * entailment pairs as positive pairs in NLI datasets (Gao+ 2021; Zhang+ 2021)
    To alleviate the need for an annotated dataset, self-supervised approaches
* self-supervised methods involve generating positive pairs using data
  augmentation techniques, including
  * discrete operations such as word deletion and shuffling (Yan+ 2021; Meng+
    2021),
  * back-translation (Fang+ 2020),
  * intermediate BERT hidden representations (Kim+ 2021), and
  * dropout noise within transformer layers (Gao+ 2021; Liu+ 2021).
  * Contrastive tension (CT)-BERT (Carlsson+ 2021) regards as positive pairs
    the outputs of the same sentence from two individual encoders
  * DeCLUTR (Giorgi+ 2021) uses different spans of the same document. In
  * our method performs CL between sentences and their associated entities.

## Multilingual sentence embeddings 

* capture semantics across multiple languages.
* Early competitive methods typically utilize the sequence-to-sequence
  objective with parallel corpora to learn multilingual sentence embeddings
  (Schwenk and Douze, 2017; Artetxe and Schwenk, 2019); recently
* fine-tuned multilingual pretrained models have achieved SOTA performance
  (Feng+ 2020; Goswami+ 2021)
* hE they need rich parallel or semantically related sentence pairs, which are
  not necessarily easy to obtain
* we explore the utility of Wikipedia entity annotations: over 300 languages

## 2.2 Learning Representations Using Entity-based Supervision

* Entities have been conventionally used to model text semantics
  (Gabrilovich and Markovitch, 2007, 2006)
* by predicting entities from their relevant text (Yamada+ 2017) or
  entity-masked sentences (Ling+ 2020).  In the proposed EASE model, the

# 5 Experiment: Multilingual

* we fine-tune multilingual pre-trained language models
  using Wikipedia data in multiple languages.

## 5.1

* 18 languages  present in both the MewsC-16 dataset (see Section 5.2) and the
  extended version of STS 2017.
  (ar, ca, cs, de, en, eo, es, fa, fr, it, ja, ko, nl, pl, pt, ru, sv, tr)

# 6 Case Study: Fine-tuning Supervised Model with EASE

# 7 Analysis

# 8 Discussion and Conclusion
