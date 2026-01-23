Torres-Carrasquillo, P., Dehak, N., Godoy, E., Reynolds, D., Richardson, F.,
Shum, S., Singer, E., Sturim, D. 
The MITLL NIST LRE 2015 Language Recognition System
Odyssey 2016

# Abstract

five core classifiers, with most systems developed in the context of an
i-vector framework

# 2 Development Data

two areas: data handling for the fixed condition and data used for the open condition.
both: test set
  covered roughly 40% of the total files provided by NIST for development.
  Table 2 describes the amount of data provided by NIST for each class.
fixed
open
  data was used for development from multiple sources
    * Telephone data from previous LREs (2007, 2009, 2011), OHSU, OGI-22,
      Fisher, CallFriend, Babel, Ahumada, MI5-UK, and Appen 
    * Broadcast wideband data from the Qatar-Dialect (Arabic) and Kalaka
      (European Spanish and British English) collections. Segments were
      filtered to 4 kHz and downsampled to 8 kHz.  
    * Narrowband segments from VOA broadcasts.  
  * During development it was observed that using the additional data hurt
    performance on our experiments. Additional experiments showed that
    judiciously adding data to some specific classes helped improve
    performance. This issue will be discussed in more detail in Section 4.  

# 3 Classifiers 

were largely based on the i-vector framework [7].
  [7] N. Dehak, P. Torres-Carrasquillo, D. Reynolds, and R.  Dehak, 
  Language Recognition via Ivectors and Dimensionality Reduction
  Interspeech 2011
In this section, we describe the different classifiers and the
fusion/calibration strategy

## 3.1.  Bottleneck features Classifiers

## 3.2. DNN posteriors systems

## 3.3. Bayesian Unit Discovery (BAUD)

## 3.4. Conventional SDC features system

conventional SDC features in an i-vector framework [7] and is similar to the
one submitted in LRE 2011. 
  * Processing of the speech signal is described in [8].
    [8] E. Singer, P. Torres-Carrasquillo, D. Reynolds, A.  McCree, F.
    Richardson, N. Dehak, and D. Sturim,
    The MITLL NIST LRE 2011 Language Recognition System
    Odyssey 2012

## 3.5. Pitch features

## 3.6. Multi-lingual DNN

## 3.7. Fusion/Calibration

# 4 presents system performance on the NIST 2015 LRE task and a discussion of the results, with 

# 5 presenting conclusions and suggestions for future work.

## 5.3 Impact of duration

as expected, performance on current systems improves as
the duration of the cut increases, with the saturation area
around 15 seconds for most clusters.
