AVEC 2018 Workshop and Challenge:
  Bipolar Disorder and Cross-Cultural Affect Recognition. 
F Ringeval, Börn Schuller, M Valstar, R Cowie, H Kaya, M Schmitt, S Amiriparian,
  N Cummins, D Lalanne, A Michaud, E Çiftçi, Hüseyin Güleç, A Ali Salah, M Pantic
AVEC’18 International Workshop on Audio/Visual Emotion Challenge

# 1 Intro

* The Cross-cultural Emotion Sub-challenge (CES) is a major ex- tension of the
  Emotion Sub-challenge previously run in AVEC 2017 [60], where dimensional
  emotion recognition was performed on data collected ‘in-the-wild’ by the
  German participants of the SEWA dataset 1 ; audiovisual signals were recorded
  in various places, e. g. , home, work place, and with arbitrary personal
  equipments, thus providing noisy but realistic data. For the AVEC 2018 CES, an
  extended version of the SEWA dataset, with new data collected in the same
  conditions from Hungarian participants, is used as a blind test set for the
  first ever cross-cultural emotion recognition compe- tition task: participants
  have to predict the level of three emotional dimensions (arousal, valence, and
  liking) time-continuously from audiovisual recordings of dyadic interactions,
  and performance is the total Concordance Correlation Coefficient (CCC) [45,
  83] averaged over the dimensions.
...
* CCC is preferred over the Pearson’s Correlation Coefficient (PCC), because
  * sensitive to bias and scaling, and 
    permit discriminative training when used as cost function [83]
    [83] Felix Weninger, Fabien Ringeval, Erik Marchi, and Björn Schuller. 2016.
    Discriminatively trained recurrent neural networks
      for continuous dimensional emotion recognition from audio
    IJCAI 2016
    IJCAI/AAAI, New York City, NY, USA, 2196–2202.
  * averaged and total CCC
    * averaged: necessarily enforces accurate prediction of the target contour
      within each sequence, while the latter 
    * total: could assign a good score to over-smoothed regression outputs that
      only predict the average label right [76, 83].
    * we used the total CCC as metric for the CES, as an overall accurate
      prediction is desired for the cross-cultural paradigm, and the 
    * averaged CCC for the GES, as the focus is on a detailed description of the
      labels.
