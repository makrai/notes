# Bibliographical and Historical Notes (RNN and LSTM)

* Parallel Distributed Processing (PDP) group at UC San Diego in the 1980’s
  * human cognitive modeling rather than practical NLP applications
    (Rumelhart and McClelland 1986, McClelland and Rumelhart 1986)
  * Models using recurrence at the hidden layer in a feedforward network (Elman
    networks) were introduced by Elman (1990)
  * Jordan (1986): recurrence from the output layer, and
  * Mathis and Mozer (1995) with the addition of a recurrent context layer
    prior to the hidden layer
  * unrolling a recurrent network into an equivalent feedforward network is
    discussed in Rumelhart and McClelland, (1986)
* in the continuous domain in the signal processing and speech communities
  (Giles+ 1994, Robinson+ 1996)
  * Schuster and Paliwal (1997) introduced bidirectional RNNs and described
    results on the TIMIT phoneme transcription task
* the introduction of LSTMs in Hochreiter and Schmidhuber (1997) and Gers+
  (2000). Impressive performance gains were demonstrated
  * tasks at the boundary of signal processing and language processing
    * phoneme recognition (Graves and Schmidhuber, 2005),
    * handwriting recognition (Graves+ 2007) and most significantly
    * speech recognition (Graves+ 2013)
  * application to practical NLP problems surged with
    Collobert and Weston (2008) and Collobert+ (2011)
    * learned word embeddings, convolutional networks, and end-to-end training
    * near state-of-the-art performance on a number of standard shared tasks
      including part-of-speech tagging, chunking, named entity recognition and
      semantic role labeling without the use of hand-engineered features
* Approaches that married LSTMs with pretrained collections of word-embeddings
  based on word2vec (Mikolov+ 2013) and GloVe (Pennington+ 2014) quickly came
  * dominate many common tasks:
    * part-of-speech tagging (Ling+ 2015)
    * syntactic chunking (Søgaard and Goldberg, 2016)
    * named entity recognition (Chiu and Nichols, 2016; Ma and Hovy, 2016)
    * opinion mining (Irsoy and Cardie, 2014)
    * semantic role labeling (Zhou and Xu, 2015) and
    * AMR parsing (Foland and Martin, 2016). As with the earlier surge of
* training data provided by CONLL, SemEval, and other shared tasks, as well
  * shared resources eg Ontonotes (Pradhan+ 2007), and PropBank (Palmer+ 2005)
* encoder-decoder approach was pioneered by Kalchbrenner and Blunsom (2013),
  * a CNN encoder and an RNN decoder
  * Cho+ (2014) (who coined the name “encoder-decoder”) and Sutskever+ (2014)
    then showed how to use extended RNNs for both encoder and decoder
  * a generative decoder should take as input a soft weighting of the inputs,
    the central idea of attention, was first developed by Graves (2013) in the
    context of handwriting recognition
  * Bahdanau+ (2015) extended the idea, named it “attention” and applied it to
    MT
