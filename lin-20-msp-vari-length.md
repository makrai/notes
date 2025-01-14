An Efficient Temporal Modeling Approach for Speech Emotion Recognition
  by Mapping Varied Duration Sentences into Fixed Number of Chunks
Wei-Cheng Lin, Carlos Busso
Proc. Interspeech 2020, 2322-2326, doi: 10.21437/Interspeech.2020-2636

# Abstract

* Traditionally: statistical descriptions, which are computed over time from
  low level descriptors (LLDs), creating a fixed dimension sentence-level
  feature representation regardless of the duration of the sentence. However
  * sentence-level features lack temporal information, which limits the
* deep learning architectures have been proposed to model temporal data. An
  * how to extract emotion-relevant features with temporal information. This
* we extract a fixed number of small chunks over sentences of diff durations by
  changing the overlap between these chunks. The approach is flexible,
  * combine gated network or attention mechanisms with LSTM networks. Our
* experiments based on the MSP-Podcast dataset demonstrate that the proposed
  method not only significantly improves recognition accuracy over alternative
  temporal-based models relying on LSTM, but also leads to computational
  efficiency.

# Merci

* Fix hosszú chunkok és a lépésköz változik: 5 sec, 8 sec 
* The chunk-level representation is combined with either mean pooling
  (NonAtten), gated mechanism (GatedVec) or attention model (AttenVec).  
* CCC: 5 sec, AttenVec -- activation 0.70, valence 0.619, dominance 0.336

