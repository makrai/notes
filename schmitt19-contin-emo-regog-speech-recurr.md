Continuous Emotion Recognition in Speech – Do We Need Recurrence?
Maximilian Schmitt, Nicholas Cummins, Björn Schuller
INTERSPEECH 2019 September 15–19, 2019, Graz, Austria

# Abstract

* emotion is a frequently changing state, it is
  * usually represented as a densely sampled time series of emotional dimensions,
  * typically arousal and valence. For this,
  * recurrent neural network (RNN) architectures are employed by default when it
  * hE the amount of temporal context required is questionable, and it has
    * not yet been clarified whether the consideration of long-term dependencies
      is actually beneficial
* we: RNNs are not necessary for time-continuous emotion recognition.  Indeed,
  * deep neural networks incorporating less complex convolutional layers can
    provide more accurate models
  * We highlight the pros and cons of recurrent and non-recurrent approaches
  * evaluate our methods on the public SEWA database,
    * SEWA was used as a benchmark in the 2017 and 2018 editions of the
      Audio-Visual Emotion Challenge
