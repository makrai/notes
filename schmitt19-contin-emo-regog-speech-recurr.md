Continuous Emotion Recognition in Speech – Do We Need Recurrence?
Maximilian Schmitt, Nicholas Cummins, Björn Schuller
INTERSPEECH 2019 September 15–19, 2019, Graz, Austria

# Abstract

* emotion is a frequently changing state
  * usually represented as a densely sampled time series of emotional dims
  * typically arousal and valence
  * recurrent neural network (RNN) architectures are employed by default
  * hE the amount of temporal context required is questionable
    * not yet been clarified whether long-term dependencies are actu beneficial
* we: RNNs are not necessary for time-continuous emotion recognition
  * deep neural networks incorporating less complex convolutional layers
    can provide more accurate models
  * We highlight the pros and cons of recurrent and non-recurrent approaches
  * evaluate our methods on the public SEWA database,
    * SEWA was used as a benchmark in the 2017 and 2018 editions of the
      Audio-Visual Emotion Challenge
