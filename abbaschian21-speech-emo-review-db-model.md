Deep Learning Techniques for Speech Emotion Recognition, from DBs to Models
Babak Joze Abbaschian, Daniel Sierra-Sosa, and Adel Elmaghraby
Sensors 2021, 21(4), 1249; https://doi.org/10.3390/s21041249

# Abstract

* need for accurate and near real-time Speech Emotion Recognition (SER)
* compare available methods and databases in SER to achieve feasible solutions
* we review deep learning approaches for SER with datasets,
  * conventional machine learning techniques for SER
  * a multi-aspect comparison between practical neural network approaches

#  4. Emotional Speech Databases

* three types of databases specifically designed for SER,
  * simulated, semi-natural, and natural speech collections
  * simulated datasets are created by trained speakers reading the same text
    with different emotions [54]
  * Semi-natural collections are made by asking people or actors to read a
    scenario containing different emotions
  * natural datasets are extracted from TV shows, YouTube videos, call centers,
    * labeled the emotions by human listeners [54]
* Simulated data sets such as EMO-DB (German) [55], DES (Danish) [56], RAVDESS
  [57], TESS [58], and CREMA-D [59] are standardized collections of emotions,
* Semi-natural collections of emo: IEMOCAP [60], Belfast [61], and NIMITEK [62]
* natural corpora of emotional speech databases such as
  VAM [39], AIBO [63], and call center data [45,64]
  * [63] Steidl, S
    AIBO: Automatic Classification of Emotion-Related User States
      in Spontaneous Children’s Speech
    Logos-Verlag: Berlin, Germany, 2009. [Google Scholar]
  * call center data
    * Lee, C.M.; Narayanan, S
      Toward detecting emotions in spoken dialogs
      IEEE Trans. Speech Audio Process. 2005, 13, 293–303. [Google Scholar]
    * Morrison, D.; Wang, R.; De Silva, L.C
      Ensemble methods for spoken emotion recognition in call-centres
      Speech Commun. 2007, 49, 98–112.  [Google Scholar] [CrossRef]
  * complication:
    * continuousness of emotions and their dynamic variation
    * concurrent emotions together, and the presence of background noise
    * number of different emotions found in these corpora is limited
    * copyright and privacy issues arise using this type of corpora
* number of samples and actors
  * Earlier examples of databases for emotional speech used to contain a
    limited number of samples with a limited number of actors, but
  * newer databases tend to create a larger number of samples and a wider range
    of speakers
  * Table 1 shows a brief comparison of different types of databases, as
* In the following, we will review
  * EMO-DB and DES, commonly used in SER research
  * three recent and openly available English simulated databases
  * IEMOCAP, a semi-natural database
  * VAM, a natural dataset used for speech emotion recognition

##  4.7. Vera am Mittag Database (VAM)

* VAM [39] dataset is a natural audiovisual dataset based on the dialogues in
  the German TV talk show Vera am Mittag. It consists of valence, activation,
