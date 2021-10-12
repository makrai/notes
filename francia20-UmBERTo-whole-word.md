Simone Francia, Loreto Parisi, and Magnani Paolo. 
UmBERTo: an italian language model trained with whole word maskings
github 2020

# Description

* UmBERTo inherits from RoBERTa base model architecture 
  * RoBERTa improves the initial BERT by identifying key hyperparameters
  * Umberto extends Roberta and uses two innovative approaches: 
    * SentencePiece and Whole Word Masking
    * Whole Word Masking (WWM) applies mask to an entire word, if at least one
      of all tokens created by SentencePiece Tokenizer was chosen as mask
