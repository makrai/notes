Mclaren, M., Castán, D., Ferrer, L. 
Analyzing the Effect of Channel Mismatch on the 
  SRI Language Recognition Evaluation 2015 System
Odyssey 2016

# Abstract

a highly imbalanced sample from the languages of interest
* several systems to LRE15. Major components included 
  1. bottleneck features extracted from Deep Neural Networks (DNNs) trained to
     predict English senones, with multiple DNNs trained using a variety of
     acoustic features; 
  2. data-driven Discrete Cosine Transform (DCT) contextualization of features
     for traditional Universal Background Model (UBM) i-vector extraction and
     for input to a DNN for bottleneck feature extraction; 
  3. adaptive Gaussian backend scoring; 
  4. a newly developed multi-resolution neural network backend; and 
  5. cluster-specific N-way fusion of scores. 
We compare results on our development dataset with those on the evaluation
data and find significantly different conclusions about which techniques were
useful for each dataset.  This difference was due mostly to a large unexpected
mismatch in acoustic and channel conditions between the two datasets. We
provide post-evaluation analysis revealing that the successful approaches for
this evaluation included the use of bottleneck features, and a well-defined
development dataset appropriate for mismatched conditions.  
