Deep Language: 
  a comprehensive deep learning approach to end-to-end language recognition
Trung Ngo Trong, Ville Hautamäki, Kong Aik Lee
2016 Odyssey

* This work 
  * training a very deep network to learn distributed representations of
    speech features with multiple levels of abstraction
  * recognize language from speech utterances with various lengths
  * a combination 
    * of three deep architectures: 
      * feed-forward network,
      * convolutional network and 
      * recurrent network can 
    * achieve the best performance compared to other network designs.
  * compare our network performance to state-of-the-art BNF-based i-vector
    system on NIST 2015 Language Recognition Evaluation corpus
  * computational and regularization issues 
  * deeper architecture compare[d] to any previous DNN approaches to language
    recognition task.

# Intro

* A more challenging task is language diarization [3]
* Many state-of-the-art LID systems still heavily rely on acoustic modeling
  [4], which requires building a pipeline of handcrafted feature extraction
* two major deep learning approaches to LID. The 
  * “indirect” approach introduced in [7] using deep bottleneck features (BNF)
    to extract frame-level features for i-vector systems. This approach has
    proven to give state-ofthe-art results in both speaker and language
    recognition [7].
    * [7] Fred Richardson, Douglas A. Reynolds, and Najim De- hak, 
      “A unified deep neural network for speaker and lan- guage recognition,”
      CoRR, vol. abs/1504.00923, 2015.
  * “direct” approach constructs an endto-end classifiers which are trained
    using spectral information.  End-to-end learning 
    * In [8], it was found that a deep learning system surpassed i-vector
      based approaches with lower number of parameters when large amount of
      training data was available
      * [8] Javier Gonzalez-Dominguez, Ignacio Lopez-Moreno, and Hasim Sak,
        Automatic language identification using LSTM RNNs
        Interspeech, 2014.
    * it was reported in [9] that a combination of many deep architectures
      outperform conventional deep learning approach to ASR.
      * [9] T.N. Sainath, O. Vinyals, A. Senior, and H. Sak, “Con-
      volutional, long short-term memory, fully connected deep
      neural networks,” in ICASSP, April 2015, pp. 4580–4584.
* In this study, we present the first large scale analysis of various DNN
  architectures for LID tasks. The key to our approach is recurrent
  architecture of DNN, a model has recently been shown to outperform the
  state-of-the art DNN systems for acoustic modeling in speech domain [6, 10].  
  * [6] Geoffrey E. Hinton, Li Deng, and Dong Yu el at., 
  “Deep neural networks for acoustic modeling in speech recogni- tion: 
    The shared views of four research groups,” 
  IEEE Signal Process. Mag. 2012
  * [10] Dario Amodei, Rishita Anubhai, and Eric Battenberg et al., 
    “Deep speech 2: End-to-end speech recognition in english and mandarin,” 
    CoRR, vol. abs/1512.02595, 2015.
* Inspired by the work in [9], we conduct a series of experiments using NIST
  LRE’15 corpus
