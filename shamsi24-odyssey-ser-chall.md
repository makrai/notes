The CONILIUM proposition for Odyssey Emotion Challenge:
  Leveraging major class with complex annotations
Meysam Shamsi; Lara Gauder; Marie Tahon
Odyssey 2024

# Abstract

* we focuse on predicting categorical emotions from speech recordings
* Different pre-trained models (WavLM-large, Wav2vec2-large, Hubert-large)
* agreement-aware loss functions based on all secondary annotations is proposed
  * consider the disagreement among annotators
    and the ambiguity of emotional labeling during training
  * ? keeping only samples with high agreement annotation in the training process
  * ie using all annotations by all annotators
* Our best performing system utilized WavLM-large as the upstream model,
  weighted binary cross-entropy with secondary labels as the loss function, and
  a post-processing step that adjusted the decision threshold
  * F1-Macro score of 0.361 on the development set, 0.335 on the test set,
  * significant improvement compare to the provided baseline
* We also explore characteristics of "easy" and "difficult" samples:
  * prediction performance consistent across different models
