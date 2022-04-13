Real-Time Speech Emotion Recognition Using a Pre-trained Image Classification Network: Effects of Bandwidth Reduction and Companding
Margaret Lech, Melissa Stolar, Christopher Best and Robert Bolia
Front. Comput. Sci., 26 May 2020 | https://doi.org/10.3389/fcomp.2020.00014

# Introduction

* Speech Emotion Recognition (SER) is the task of
  recognizing the emotional aspects of speech irrespective of the semantic cont
  * humans can efficiently perform this task in speech communication, the
  * automatically: is still an ongoing subject of research.
* create efficient, real-time methods of detecting the emotions of mobile phone
  users, call center operators and customers, car drivers, pilots, and many
* Adding emotions to machines has been recognized as
  a critical factor in making machines appear and act in a human-like manner
  (André+ 2004).
  * Robots capable of understanding emotions could provide appropriate
    emotional responses and exhibit emotional personalities. In some
* Traditionally, machine learning (ML) uses feature parameters from the raw
  * testing a large number of different features,
  * combining different features into a common feature vector, or applying
  * feature selection techniques. The quality of the resulting hand-crafted
* deep neural networks (DNN) classifiers. The idea is to use an end-to-end
  * much larger requirements for labeled data-samples compared to conventional
  * can be overcome by an approach known as transfer learning.  It uses an
  * network pre-trained on extensive data to solve a general classification
  * (fine-tuned) using a small number of available data to solve specific task
* the most powerful pre-trained neural networks were trained for image
  classification, to apply these networks to the problem of SER, the speech
  signal needs to be transformed into an image format (Stolar+ 2017)
* This study describes
  * steps involved in the speech-to-image transition; it explains the
  * training and testing procedures, and
  * conditions for a real-time emotion recognition from a continuously
  * effects of speech companding and bandwidth reduction on the real-time SER
    * many of the programmable speech communication platforms use speech
      companding and speech bandwidth reduced to a narrow range of 4 kHz

# Related Works

## Conventional SER

* Early SER studies searched for links between emotions and speech acoustics.
  * low-level acoustic speech parameters, or groups of parameters, were
  * classifiers such as the Support Vector Machine (SVM), Gaussian Mixture
    Model (GMM), and shallow Neural Networks (NNs).  Comprehensive
  * reviews of SER methods are given in Schröder (2001), Krothapalli and
    Koolagudi (2013), and Cowie+ (2001). An extensive
  * benchmark comparison can be found in Schuller+ (2009b).
* of
  low-level prosodic and spectral acoustic parameters 
  * eg fundamental frequency, formant frequencies, jitter, shimmer, spectral
    energy of speech, and speech rate were found
  * Majority correlated with emotional intensity and emotional processes
    (Scherer, 1986, 2003; Bachorovski and Owren, 1995; Tao and Kang, 2005).
  * Good SER results were given by more complex parameters such as the
    Mel-frequency cepstral coefficients (MFCCs), spectral roll-off,
    Teager Energy Operator (TEO) features (Ververidis and Kotropoulos, 2006;
    He+ 2008; Sun+ 2009),
    spectrograms (Pribil and Pribilova, 2010), and
    glottal waveform features (Schuller+ 2009b; He+ 2010; Ooi+ 2012).
* higher-level derivatives and statistical functionals of the low-level params.
  * Munich Versatile and Fast Open-Source Audio Feature Extractor (openSMILE)
    offers a computational platform allowing the calculation of many low- and
    high-level acoustic descriptors of speech (Eyben+ 2018).
  * acoustic features that best characterize different emotions has been
    * one of the most important but also the most elusive challenges of SER
    * inconsistencies between studies
    * research focus moved toward methods that eliminate or reduce the need to
      have prior knowledge of “best features” and replace it with automatic
      feature generation procedures offered by neural networks.

## SER Using Convolutional Neural Networks

* deep learning (DL) techniques (Hinton+ 2006). Supervised DL neural network
  * outperform classical approaches in a wide range of [non-speech] classificat
  * classification of speech emotions followed the trend, and several studies
  * using spectral magnitude arrays known as speech spectrograms to emo classif 
    * 2-dimensional image-like time-frequency representations of waveforms.
    * not fully adhere to the concept of the end-to-end network, as it allows
    * nL processing is minimal and it preserves the signal's entirety.
* convolutional neural networks (CNNs) to classify either
  * entire speech spectrogram arrays or
  * specific bands of spectrograms to recognize speech emotions
  * (Han+ 2014; Huang+ 2014; Mao+ 2014; Fayek+ 2015, 2017; Lim+ 2016;
    Badshah+ 2017; Stolar+ 2018)
  * Fayek+ (2015), SER from short frames of speech spectrograms using a DNN was
    * An average accuracy of 60.53% (six emotions eNTERFACE database) and
    * 59.7% (seven emotions—SAVEE database) was achieved
  * Fayek+ (2017)
    * similar but improved approach 
    * 64.78% of average accuracy (IEMOCAP data with five classes) 
* concatenated structures combining CNNs and Recurrent Neural Networks (RNNs)
  were trained on the EMO-DB data using speech spectrograms (Lim+ 2016).  For
  * average precision of 88.01% and a recall of 86.86% were obtained for seven
    emotions
  * Han+ (2014), CNN was applied to learn affect-salient features, which were
    then applied to the Bidirectional Recurrent Neural Network to classify four
    emotions from the IEMOCAP data. It was shown that this approach leads to
    64.08% weighted accuracy and 56.41% unweighted accuracy.  Although these
    methodologies are compelling, there is still room for improvement. One of
* databases commonly used in the SER studies are too small for training of deep
  Besides, in many of the existing databases, emotional classes, and gender
  representation are imbalanced.  
* Publicly available resources for DL techniques include
  * large pre-trained neural networks trained on over one billion of images
    from the ImageNet dataset (Russakovsky+ 2015) representing at least 1,000
    of different classes.  The great advantage of using pre-trained networks is
    that many complex multi-class image classification tasks can be
    accomplished very efficiently by initializing the network training
    procedures with a pre-trained network's parameters (Bui+ 2017). This way,
    the training process can be reduced to a short-time fine-tuning using a
    relatively small training data set.  Alternatively, pre-trained network
    parameters can be applied as features to train conventional classifiers
    that require lower numbers of training data.  These two approaches are
    known as transfer learning.
  * Pre-trained networks in the categorization of images. A large selection of
    * very efficient, freely available image classification networks has been
  * speech classification task can be re-formulated as an image classification
    (Stolar+ 2017; Lech+ 2018)
    * The speech to image transformation achieved by
      amplitude spectrograms of speech and transforming them into RGB images.
    * commonly used to visualize spectrograms
    * in these cases, the aim was to create a set of images to perform the
      fine-tuning of a pre-trained deep convolutional neural network.
