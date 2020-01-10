Language recognition using deep neural networks 
  with very limited training data
Shivesh Ranjan, Chengzhu Yu, Chunlei Zhang, Finnian Kelly, John H. L. Hansen
2016

# 1 Intro

Several approaches to LID have been developed employing 
  Gaussian Mixture Model (GMM) based techniques [3], and 
  Support Vector Machine based approaches [4]. Recently, 
  i-Vector based techniques have become state-of-the-art in LID,
    closely following similar developments in the Speaker Identification (SID)
    [5, 6, 7]. More recently, 
      [5] N. Dehak, P. A. Torres-Carrasquillo, D. A. Reynolds, and R. Dehak,
      “Language recognition via i-vectors and dimensionality reduction,” 
      ISCA INTERSPEECH, pp.  857–860, 2011.
      [6] N. Dehak, P. Kenny, R. Dehak, P. Dumouchel, and P. Ouellet,
      “Front-end factor analysis for speaker verification,” 
      IEEE Trans.  Audio, Speech, and Language Processing 2011.
      [7] D. Martinez, O. Plchot, L. Burget, O. Glembek, and P. Matejka,
      “Language recognition in ivectors space,” 
      ISCA Interspeech, pp. 861–864, 2011.
  Deep Neural Network (DNN) and Convolutional Neural Network (CNN) based 
    comparable, and in many cases superior performance compared to i-Vector
    based LID techniques formulated using a Gaussian Mixture Model Universal
    Background Model (GMM-UBM) based framework [8, 9, 10].  
      [8] Y. Lei, L. Ferrer, A. Lawson, M. McLaren, and N. Scheffer,
      “Application of convolutional neural networks 
        to language identification in noisy conditions,” 
        Proc. Odyssey-14, Joensuu, Finland, 2014.
      [9] L. Ferrer, Y. Lei, M. McLaren, and N. Scheffer, 
      “Spoken language recognition based on senone posteriors,” 
      ISCA INTERSPEECH, pp.  2150–2154, 2014.
      [10] I. Lopez-Moreno, J. Gonzalez-Dominguez, O. Plchot, D. Martinez, J.
        Gonzalez-Rodriguez, and P. Moreno, 
        “Automatic language identification using deep neural networks,” 
        IEEE ICASSP-2014, pp. 5337–5341, 2014.
In [11], an 
  i-Vector based LID formulation using bottleneck features extracted from a
  neural network was shown to outperform a state-of-the-art i-Vector based LID
  system using Shifted Delta Cepstra (SDC) features. 
  [11] Y. Song, B. Jiang, Y. Bao, S. Wei, and L. R. Dai, 
  “I-vector representation based on bottleneck features for language identification,” 
  Electronics Letters, vol. 49, no. 24, pp. 1569–1570, 2013.
In [8], the 
  GMM-UBM was replaced by a CNN originally trained for Automatic Speech
  Recognition (ASR), to extract posteriors for an i-Vector based LID
  formulation. This offered significant improvements compared to a GMM-UBM
  i-Vector based LID system on the DARPA RATS LID task. A more direct approach
  to LID using DNNs was proposed in [10].
This study proposes a 
  novel approach to LID using a DNN. We propose to train an initial DNN for
  LID using iVectors. Since the test-set contains out-of-set languages with
