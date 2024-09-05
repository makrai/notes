LibriMix: An Open-Source Dataset for Generalizable Speech Separation
Joris Cosentino, Manuel Pariente, Samuele Cornell, Antoine Deleforge, Emmanuel Vincent
submitted to INTERSPEECH 2020 arXiv:2005.11262 [eess.AS]

# Abstract

* In recent years, wsj0-2mix has become the reference dataset for
  single-channel speech separation. Most deep learning-based speech separation
  models today are benchmarked on it. However, recent studies have shown
* hE important performance drops when models trained on wsj0-2mix are evaluated
  on other, similar datasets. To address this generalization issue, we created
* we: LibriMix, an open-source alternative to wsj0-2mix, and to its noisy
  extension, WHAM!. Based on LibriSpeech, LibriMix consists of 
  * two- or three-speaker mixtures combined with ambient noise samples from
    WHAM!. 
* experiments: Using Conv-TasNet, we achieve competitive performance on all
  LibriMix versions. In order to fairly evaluate across datasets, 
* we introduce a third test set based on VCTK for speech and WHAM! for noise.
* the generalization error is smaller for models trained with LibriMix than
  with WHAM!, in both clean and noisy conditions.
* Aiming towards evaluation in more realistic, conversation-like scenarios, we
  also release a sparsely overlapping version of LibriMix's test set.
