KR-BERT: A Small-Scale Korean-Specific Language Model
Sangah Lee, Hansol Jang, Yunmee Baik, Suzi Park, Hyopil Shin
Cite as: 	arXiv:2008.03979 [cs.CL]

https://github.com/snunlp/KR-BERT

* large models take a long time to pre-train
* make smaller models that perform comparatively. In this paper, 
* we trained a Korean-specific model KR-BERT, utilizing a smaller vocabulary and
  dataset.  Since 
* Korean is one of the morphologically rich languages with poor resources using
  non-Latin alphabets, it is also important to capture language-specific
* We tested several tokenizers including our BidirectionalWordPiece Tokenizer
  and adjusted the minimal span of tokens for tokenization ranging from
  sub-character level to character-level to construct a better vocabulary for
  our model. With those
  adjustments, 
* our KR-BERT model performed comparably and even better than other existing
  pre-trained models using a corpus about 1/10 of the size. 

# Introduction

* writing system, Hangul, is composed of more than 10,000 syllable characters.
  For these reasons, a proper BERT model for Korean requires both a vocabulary
  and a tokenizer that can effectively treat a variety of complex word forms.
* scale the model down while still maintaining comparable performances, as
  recent works such as ALBERT and DistilBERT do.  
* we construct our small scale single language model by utilizing 
  a smaller number of parameters and vocabulary entries, as well as using 
  less training data
  * a Korean BPE vocabulary with sub-characters as the smallest units instead of
    characters, and propose the 
  * Bidirectional-WordPiece Tokenizer to capture the characteristics of the
    Korean language. 
  * KR-BERT model, which we trained from scratch on our own corpus, 
    outperforms the BERT-base Multilingual model on four downstream tasks,
    * sentiment , Question-Answering, NER, and Paraphrase Detection. The model
    * the most consistent results and is comparable to other Korean language
      BERT models such as KorBERT and KoBERT, despite its small scale.
