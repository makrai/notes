An End-to-end Approach to Language Identification in Short Utterances 
  using Convolutional Neural Networks
Alicia Lozano-Diez, Ruben Zazo-Candil, Javier Gonzalez-Dominguez,
  Doroteo T. Toledano, Joaquin Gonzalez-Rodriguez
INTERSPEECH 2015

# Abstract

Convolutional Deep Neural Networks (CDNNs)
  * ability they have shown when modeling speech signals, and their 
  * low ...  number of free parameters. 
* We 
  * evaluate different configurations in 
    * a subset of 8 languages within the NIST Language Recognition Evaluation
      2009 Voice of America (VOA) dataset, for the task of 
    * short test durations (segments up to 3 seconds of speech)
    * comparable performances to our baseline i-vector system, while reducing
      drastically the number of parameters to tune (at least 100 times fewer
      parameters). Then, we 
  * combine these CDNN-based systems and the i-vector baseline with a simple
    fusion at score level. This combination outperforms our best standalone
    system (up to 11% of relative improvement in terms of EER).

# 1 Intro

* In the last years, the LID problem has been addressed following the
  i-vector scheme [3], which is also within state-ofthe-art approaches for
  speaker recognition tasks [4]
  * performance of i-vector based approaches significantly decreases when
    dealing with short test utterances [5]. 
* systems based on deep learning approaches 
  * such as 
    * feed forward Deep Neural Networks (DNNs) or 
    * Long Short-Term Memory (LSTM) Recurrent Neural Networks (RNNs) 
  * outperform i-vector based approaches [6].
    * J. Gonzalez-Dominguez, I. Lopez-Moreno, H. Sak, J. Gonzalez-Rodriguez,
      and P. J. Moreno
      Automatic language identification using long short-term memory recurrent
      neural networks
      INTERSPEECH 2014
  * however
    * need huge training datasets in order to be successful [5]
    * training is computationally expensive and they still have a 
      * large number of parameters to be trained.  In this work, 
* CDNNs
  * have been succesfully applied to other related tasks [7] [8], and,
    recently, to LID [9] [10]. Unlike [9], where
    * M. McLaren, Y. Lei, N. Scheffer, and L. Ferrer, “Application of
      convolutional neural networks to _speaker_ recognition in noisy
      conditions,” INTERSPEECH 2014
    * O. Abdel-Hamid, A.-R. Mohamed, H. Jiang, L. Deng, G.  Penn, and D. Yu,
      “Convolutional neural networks for _speech recognition_,” 
      2014 Audio, Speech, and Language Processing, IEEE/ACM Transactions on
    * lid
      * Y. Lei, L. Ferrer, A. Lawson, M.  McLaren, and N.  Scheffer,
        “Application of convolutional neural networks to language
        identification in noisy conditions,” 
        ODYSSEY, 2014.  A.  
        * CDNN trained for automatic speech recognition was used to replace
          the UBM in an i-vector based approach for LID, we propose using
          CDNNs as an end-to-end system.
      * Lozano-Diez, J. Gonzalez-Dominguez, R. Zazo, D. Ramos, and J.
        Gonzalez-Rodriguez, 
        “On the use of convolutional neural networks in pairwise language
        recognition,” 
        2014 Advances in Speech and Language Technologies for Iberian Languages
