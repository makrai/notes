Real-Time Speech Emotion Recognition Using a Pre-trained Image Classif Network:
  Effects of Bandwidth Reduction and Companding
Margaret Lech, Melissa Stolar, Christopher Best and Robert Bolia
Front. Comput. Sci., 26 May 2020 | https://doi.org/10.3389/fcomp.2020.00014

# Introduction

* Speech Emotion Recognition (SER):
  recognizing the emotional aspects of speech irrespective of the semantics
  * humans can efficiently perform this task in speech communication
  * automatically: still an ongoing subject of research
* create efficient, real-time methods of detecting the emotions of
  mobile phone users, call center operators and customers, car drivers, pilots
* Adding emotions to machines has been recognized as
  a critical factor in making machines appear and act in a human-like manner
  (André+ 2004)
  * Robots capable of understanding emotions could provide appropriate
    emotional responses and exhibit emotional personalities
* Traditionally, machine learning (ML) uses feature parameters from the raw
  * testing a large number of different features,
  * combining different features into a common feature vector
  * feature selection techniques
* deep neural networks (DNN) classifiers, end-to-end
  * much larger requirements for labeled data-samples compared to conventional
  * can be overcome by an approach known as transfer learning
  * network pre-trained on extensive data to solve a general classification
  * (fine-tuned) using a small number of available data to solve specific task
* the most powerful pre-trained neural networks were trained for image classif,
  to apply these networks to the problem of SER, the speech signal needs to be
  transformed into an image format (Stolar+ 2017)
* This study describes
  * steps involved in the speech-to-image transition
  * training and testing procedures, and
  * conditions for a real-time emotion recognition
  * effects of speech companding and bandwidth reduction on the real-time SER
    * many of the programmable speech communication platforms use speech
      companding and speech bandwidth reduced to a narrow range of 4 kHz

# Related Works

## Conventional SER

* Early SER studies searched for links between emotions and speech acoustics
  * low-level acoustic speech parameters, or groups of parameters
  * classifiers such as the Support Vector Machine (SVM),
    Gaussian Mixture Model (GMM), and shallow Neural Networks (NNs)
  * reviews of SER methods 
    * Schröder (2001), Krothapalli and Koolagudi (2013), and Cowie+ (2001)
  * benchmark comparison can be found in Schuller+ (2009b)
* low-level prosodic and spectral acoustic parameters
  * eg fundamental frequency, formant frequencies, jitter, shimmer,
    spectral energy of speech, and speech rate
  * Majority correlated with emotional intensity and emotional processes
    (Scherer, 1986, 2003; Bachorovski and Owren, 1995; Tao and Kang, 2005)
  * more complex parameters 
    * eg Mel-frequency cepstral coefficients (MFCCs), spectral roll-off,
      Teager Energy Operator (TEO) features
      (Ververidis and Kotropoulos, 2006; He+ 2008; Sun+ 2009),
    * spectrograms (Pribil and Pribilova, 2010), and
    * glottal waveform features (Schuller+ 2009b; He+ 2010; Ooi+ 2012)
* higher-level derivatives and statistical functionals of the low-level params
  * Munich Versatile and Fast Open-Source Audio Feature Extractor (openSMILE)
    * a computational platform allowing the calculation of many low- and
      high-level acoustic descriptors of speech (Eyben+ 2018)
  * acoustic features that best characterize different emotions has been
    * one of the most important but also the most elusive challenges of SER
    * inconsistencies between studies
    * research focus moved toward methods that eliminate or reduce the need to
      have prior knowledge of “best features” and replace it with automatic
      feature generation procedures offered by neural networks

## SER Using Convolutional Neural Networks

* deep learning (DL) techniques (Hinton+ 2006). Supervised DL neural network
  * outperform classical approaches in a wide range of [non-speech] classif
  * classification of speech emotions followed the trend, and several studies
  * using spectral magnitude arrays known as speech spectrograms to emo classif
    * 2-dimensional image-like time-frequency representations of waveforms
    * not fully adhere to the concept of the end-to-end network
    * nL processing is minimal and it preserves the signal's entirety
* convolutional neural networks (CNNs) to classify emotions from either
  * entire speech spectrogram arrays or
  * specific bands of spectrograms (Han+ 2014; Huang+ 2014; Mao+ 2014; Fayek+
    2015, 2017; Lim+ 2016; Badshah+ 2017; Stolar+ 2018)
  * Fayek+ (2015), SER from short frames of speech spectrograms using a DNN
    * An average accuracy of 60.53% (six emotions eNTERFACE database) and
    * 59.7% (seven emotions—SAVEE database) was achieved
  * Fayek+ (2017)
    * similar but improved approach
    * 64.78% of average accuracy (IEMOCAP data with five classes)
* concatenated structures combining CNNs and Recurrent Neural Networks (RNNs)
  were trained on the EMO-DB data using speech spectrograms (Lim+ 2016)
  * average precision of 88.01% and a recall of 86.86% were obtained for 7 emos
  * Han+ (2014), CNN was applied to learn affect-salient features, which were
    * Bidirectional Recurrent Neural Network to classify
    * four emotions from the IEMOCAP data. It was shown that this approach
    * 64.08% weighted accuracy and 56.41% unweighted accuracy.  Although these
    * there is still room for improvement
* databases commonly used in the SER studies are too small for deep learning
  * in many of the existing databases, emotional classes, and gender
    representation are imbalanced
* Publicly available resources for DL techniques include
  * transfer learning: large pre-trained neural networks trained on over one
    billion of images from the ImageNet dataset (Russakovsky+ 2015)
    representing at least 1,000 of different classes
    * many complex multi-class image classification tasks can be accomplished
      very efficiently by initializing the network training procedures with a
      pre-trained network's parameters (Bui+ 2017). This way, the training
    * a short-time fine-tuning using a relatively small training data set.
    * Alternatively, pre-trained network parameters can be applied as features
      to train conventional classifiers that require smaller of training data.
  * Pre-trained networks in the categorization of images
    * very efficient, freely available image classification networks 
  * speech classification task can be re-formulated as image classification
    (Stolar+ 2017; Lech+ 2018)
    * The speech to image transformation achieved by
      amplitude spectrograms of speech and transforming them into RGB images
    * commonly used to visualize spectrograms
    * in these cases, the aim was to create a set of images to perform the
      fine-tuning of a pre-trained deep convolutional neural network
