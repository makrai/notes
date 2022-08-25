On the Cross-lingual Transferability of Monolingual Representations
Mikel Artetxe, Sebastian Ruder, Dani Yogatama
ACL 2020 arXiv:1910.11856v3 [cs.CL]

https://github.com/deepmind/xquad

* SOTA unsupervised multilingual models (e.g., multilingual BERT)
  * generalize in a zero-shot cross-lingual setting
  * attributed to the use of a shared subword vocabulary and joint training
    across multiple languages giving rise to deep multilingual abstractions
  * We evaluate this hypothesis
* our approach transfers a monolingual model to new languages at the lex level
  * first train a transformer-based masked language model on one language, and
  * transfer it to a new language by learning a new embedding matrix with the
    same masked language modeling objective, freezing all other layer params
  * not rely on a shared vocabulary or joint training
  * competitive with multilingual BERT on standard cross-lingual classification
    benchmarks and on a new Cross-lingual Question Answering Dataset (XQuAD)
* suggest that deep monolingual models learn
  some abstractions that generalize across languages
* We also release XQuAD as a more comprehensive cross-lingual benchmark
  * 240 paragraphs and 1190 question-answer pairs from SQuAD v1.1
    translated into ten languages by professional translators

# 1 Intro

* mBERT, (Devlin+ 2019) have been
  * for zero-shot cross-lingual transfer (Pires+ 2019; Conneau and Lample, 2019)
  * jointly trained transformer model (Vaswani+ 2017) to perform
    masked language modeling (MLM) in multiple languages, which is then
    fine-tuned on a downstream task using labeled data in a single lang, typ En
  * model is able to generalize to other languages,
    even if it has never seen labeled data in those languages
  * surprising, as there is no explicit cross-lingual term in the training obj
* Pires+ (2019) hypothesized that having word pieces used in all languages
  (numbers, URLs, etc)
  forces the co-occurring pieces to also be mapped to a shared space
* Cao+ (2020) echoed this sentiment, and
* Wu and Dredze (2019) further observed that
  mBERT performs better in languages that share many subwords
* current consensus of the crosslingual generalization ability of mBERT
  is based on a combination of three factors:
  * shared vocabulary items that act as anchor points;
  * joint training across multiple languages that spreads this effect; which
  * deep cross-lingual reprs that generalize across languages and tasks
* In this paper, we empirically test this hypothesis by
  designing an alternative approach that violates all of these assumptions
  * starts with a monolingual transformer trained with MLM
  * transfer to a new language by learning a new embedding matrix through MLM in
    the new language while freezing parameters of all other layers
  * competitive with joint multilingual pre-training
    in standard zero-shot cross-lin transfer benchmarks (XNLI, MLDoc, PAWS-X)
* We also experiment with a new Cross-lingual Question Answering Dataset (XQuAD)
  * 240 paragraphs and 1190 question-answer pairs from SQuAD v1.1 (Rajpurkar+16)
* Question answering as a task is a
  * classic probe for language understanding
  * less susceptible to annotation artifacts commonly found in other benchmarks
    (Kaushik and Lipton, 2018; Gururangan+ 2018)
* Our results on XQuAD show that the
  monolingual transfer approach can be made competitive with mBERT by learning
  second language-specific transformations via adapter modules (Rebuffi+ 2017)

# 2 Cross-lingual Transfer of Monolingual Representations

* method to transfer monolingual representations to new languages
  in an unsupervised fashion
* This is particularly useful for low-resource languages

# 3 Experiments

* Our goal is to evaluate the performance of different multilingual models in
  the zero-shot cross-lingual setting to better understand the source of their
  generalization ability
* We discuss experiments on our new XQuAD dataset in §4
* In all experiments, we fine-tune a pre-trained model using labeled training
  examples in English, and evaluate on test examples in other languages via
  zero-shot transfer
  
## 3.1 models that we compare 
 
## 3.2 experimental setting 

##3.3 Results on XNLI 

##3.4 Results on MLDoc 

##3.5 Results on PAWS-X 

# 4 XQuAD: a new cross-lingual question answering dataset

# sum 3,4: neither a shared subword vocabulary nor joint multilingual training
is necessary for zero-shot transfer and
* effective vocabulary size per language is an important facto

# 5 Discussion

* monolingual models learn abstractions that generalize across languages

# 6 Related Work

# 7 Conclusions
