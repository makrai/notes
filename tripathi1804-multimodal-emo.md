Multi-Modal Emotion recognition on IEMOCAP Dataset using Deep Learning
Samarth Tripathi, Sarthak Tripathi, Homayoon Beigi
arXiv:1804.05788 [cs.AI]

# Abstract

* Emotion recognition, Human Computer Interactions, behaviour modelling
  * Neural Networks which are adept at estimating complex functions
* we: multimodal Emotion recognition on IEMOCAP dataset using
  * data from Speech, Text, and Motion capture data from face expressions,
    rotation and hand movements
* Prior research: only Emotion detection from Speech on the IEMOCAP dataset,
* we are the first who use the multiple modes of data offered by IEMOCAP for
  a more robust and accurate emotion detection

# 1 Intro

* we particularly explore Neural Networks: Attention and Dropout
* the IEMOCAP dataset [12], which consists
  * 12 hours of audio-visual data of improvisations and scripted scenarios from
    actors, annotated for emotions
  * A lot of the prior research in this field is concentrated on detecting
    emotions using just the speech part of the dataset, [13] and [17]
  * Both use RNN based architectures on extracted speech features to obtain the
    * [13] use Markov chain over input signals to remove segments with no
      emotional state
    * [17] use Connectionist Temporal Classification loss function to allow
      them model states with little or no emotions in speech window. We
* we detect emotions from many modalities of IEMOCAP. For this we explore
  * first get the best individual detection accuracy from each of the modes
  * combine them in an ensemble based architecture to allow for
    * end-to-end training across the different modalities using the variations
      of the better individual models. Our ensemble consists of
    * Long Short Term Memory networks, Convolution Neural Networks, Fully
      connected Multi-Layer Perceptrons and we complement them using techniques
      such as Dropout, adaptive optimizers such as Adam, pretrained
      word-embedding models and Attention based RNN decoders
* eval
  * individual modalities:
    * text? 62.72% accuracy compared to [13]'s 62.85%
    * speech 55.65% accuracy compared to [17]'s CTC based 54% accuracy
  * combining Speech (individually 55.65% accuracy) and Text (individually
    64.78% accuracy) modes we achieve an improvement to 68.40% accuracy
  * When we also account MoCap data (individually 51.11% accuracy) we also
    achieve a further improvement to 71.04%
