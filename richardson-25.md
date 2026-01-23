Deep Neural Network Approaches to Speaker and Language Recognition
Fred Richardson, Douglas Reynolds, and Najim Dehak
2015

Abstract

The impressive gains in performance obtained using deep neural networks (DNNs)
for automatic speech recognition (ASR) have motivated the application of DNNs
to other speech technologies such as speaker recognition (SR) and language
recog- nition (LR). Prior work has shown performance gains for separate SR and
LR tasks using DNNs for direct classification or for feature extraction. In
this work we present the application of single DNN for both SR and LR using
the 2013 Domain Adaptation Challenge speaker recognition (DAC13) and the NIST
2011 language recogni- tion evaluation (LRE11) benchmarks. Using a single DNN
trained for ASR on Switchboard data we demonstrate large gains on per-
formance in both benchmarks: a 55% reduction in EER for the DAC13
out-of-domain condition and a 48% reduction in on the LRE11 30 s test
condition. It is also shown that further gains are possible using score or
feature fusion leading to the possibility of a single i-vector extractor
producing state-of-the-art SR and LR performance

# 1 Intro

The first indirect method (bottleneck features or BNFs) uses frame-level
features extracted from a DNN with a special bottleneck layer [15] and the
second indirect method (DNN posteriors) uses posteriors extracted from a DNN
to ac- cumulate multi-modal statistics [6].

# 2 DNN for SR and LR

[DNN] For speech applications
  the input to a DNN is a stacked set of spectral features (e.g., MFCCs, PLPs)
  extracted from short (20 ms) segments (frames) of speech. Typ- ically a
  context of to 10 frames around the current input frame are used. The output
  of the DNN is a prediction of the posterior probability of the target
  classes for the current input frame (see Fig. 1).  
In the direct method for LR and SR, a 
  DNN is used to pre- dict the language or speaker class for a given frame of
  speech.  Since the entire speech waveform is considered to belong to a
  single class, the frame-level DNN posteriors must be combined to make a
  single decision score. This can be accomplished ei- ther by simply averaging
  the DNN predictions or by training a secondary classifier, such as a
  multinomial, 
indirect method uses 
  a DNN that was trained on a different data set and possibly for a different
  purpose. In this work, we have used a DNN trained for an ASR task for both
  LR and SR. The ASR DNN is trained to predict sub-phonetic units or “senones”
  for each input frame [1]. In the following two subsections we describe how
  we use the ASR DNN output posteriors and BNFs in the context of an i-vector
  classifier.
