Noah A. Smith
Contextual Word Representations: A Contextual Introduction
arXiv:1902.06006 [cs.CL]

# 5 Contextual Word Vectors

* ELMo, which stands for “embeddings from language models” (Peters+ 2018a),
  * vectors for words in context, or contextual word vectors
  * pretrained on large corpora
* two important insights behind ELMo:
  * the vector should depend on an arbitrarily long context
    * we start with word type vectors, and pass them through a neural network
    * one neural network for left contexts (going back to the beginning of the
      sentence a token appears in) and another neural network for right contexts
  * incorporating the language models known at the time to be most effective
    (based on recurrent neural networks; Sundermeyer+ 2012)
    * Although recurrent networks were already widely used in NLP,
      training them as language models then using the context vectors they
      provide for each word token as pretrained word (token) vectors was novel
* ELMo was shown to be extremely beneficial in NLP programs that
  * question answering (9% relative error reduction on the SQuAD benchmark),
  * SRL (16% on the Ontonotes SRL benchmark)
  * NER (4% relative error reduction on the CoNLL 2003 benchmark), and
  * coreference resolution (10% on the Ontonotes corefer benchmark)
  * additional tasks were reported by Peters+ (2018a) and later by
* ULMFiT (Howard and Ruder 2018) introduced a similar approach, ULMFiT, showing
  a benefit for text classification methods
* BERT (Devlin+ 18) bidirectional encoder representations from transformers
  * several innovations to the learning method and learned from more data,
  * a further 45% error reduction (relative to ELMo) on the first task and
    7% on the second. 
  * On the SWAG benchmark
    * grounded commonsense reasoning (Zellers+ 2018)
    * BERT gave another 66% relative to ELMo
  * While ELMo is derived from language modeling,
    the (pretraining) objective function of BERT is rather different
    * prediction of words given contexts on both sides (vs one or the other)
    * predicting the words in a sentence given its preceding sentence
    * The effects of the dataset ... have not been fully assessed
* open questions about the relative performance of the different methods
  * differences in the learning algorithms, particularly the NN architectures,
  * see Peters+ (2018b) for some exploration. Some of the findings on BERT
  * finetuning may be critical

# 6 Cautionary Notes

## Word vectors are biased

* detecting and correcting bias (Bolukbasi+ 2016; Caliskan+ 2017)

## [beyond word level]

* understanding and production of language ... requires knowing how words are
  put together to form more complicated concepts, propositions

## [evaluation]

* the gains above ...  reflect only a handful of benchmarks
* benchmarks are, to varying degrees, controversial
* No one ... believes they are “complete”
* evaluation ... includes both human-judgment-based and automatic methods

# 7 What’s Next

* apply variations on contextual word vectors to new problems
* variations on the learning methods. For example, finetuning
* settings where relatively little supervision
  * low-resource genres and languages
  * characterize the generalizations that these methods are (not) learning 
    in linguistic terms; see for example Goldberg (2019)
