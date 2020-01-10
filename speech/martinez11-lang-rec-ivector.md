David Martínez, Oldřich Plchot, Lukáš Burget, Ondřej Glembekand Pavel Matějka
Language Recognition in iVectors Space
INTERSPEECH 2011

# Abstract

three different linear classifiers: 
  one based on a generative model, where classes are modeled by Gaussian
  distributions with shared covariance matrix, and 
  two discriminative classifiers, namely 
    linear Support Vector Machine and
    Logistic Regression.  The 
tests were 
  performed on the NIST LRE 2009 dataset and the results were
  compared with state-of-the-art LR based on Joint Factor Analysis (JFA). 
      While the iVector system offers better performance, it also seems to be
      complementary to JFA, as their fusion shows another improvement.

# 1. Introduction

Joint Factor Analysis (JFA) [15], which is 
    a statistical model originally proposed for Speaker Recognition, has
    become very successful also for acoustic Language Recognition (LR) [3, 2].
    The idea behind JFA is to consider not only the inter-class variability..., 
    but also the *inter-session variability* 
        (parameters for a language can change from utterance to utterance
        because of the differences in channel, speaker, etc.). 
        channel variability. 
    When the likelihood ... is evaluated for a certain language, 
        the corresponding model is adapted to the channel of [the] utterance
            by finding the point MAP (or ML) estimate of a low-dimensional
            latent variable vector channel factors, which are 
                coordinates in a highly channel-variable subspace 
                    of the model parameter space.
iVectors
    latent variables are used as features for another classifier
    not separate inter/class and channel variability
    total variability
    info about both the class and the channel
we use linear generative model
    Gaussian with full covariance matrix shared across languages
    analogue to Probabilistic Linear Discriminant Analysis
        most successful for speaker
discriminative classifiers
    linear Support Vector Machines
    Logistic Regression in combination with Nuisance Attribute Projection as a
    channel compensation technique
phonotactic language recognition

# 2. iVectors

maximum a posteriori (MAP) estimate 
implementation Glembek 2011
  O. Glembek, L. Burget, P. Matějka, M. Karafiat, P. Kenny
  Simplification and Optimization of i-vector Extraction
  ICASSP 2011, Prague.

# 3. Classifiers

3.1 Generative
    log likelihoods are used as inputs to another classifier
        avoid the iVector (utterance) dependent shift
3.2 Discriminantive
    also experimented with discriminative linear classifiers

# 4. Experimental Setup

4.1. Training and Development Data 
  databases as in Jančik 2010 NIST LRE 2009
      Callfriend, Fisher English Part 1 and 2, Fisher Levantine Arabic HKUST
      Mandarin, Mixer (data from NIST SRE 2004, 2005, 2006, 2008 5. Results
      23 NIST LRE 2009 languages
      training iVector extractor on the full dataset
      for training classifiers, the balanced dataset
  calibration back-ends trained on
      NIST LRE 2007
      OGI-multilingual
      OGI 22 languages
      Foreign Accented English,
      SpeechDat-East
      Switch Board and Voice of America radio broadcast
      ...
4.2. Feature Extraction
    vocal tract length normalization
    cepstral mean and variance normalization
    shifted delta cepstral coefficients
    iVector extractor
4.3 Calibration Back-end
   calibration and fusion

# 5. Results

in terms of C_avg x 100 defined in the NIST LRE 2009 Evaluation Plan
5.1. Results for Generative Linear Classifier
    iVector dimensionality is 600
    duration dependent calibration
    dimensionality of iVectors was reduced and normalized
    utterance dependent shift
5.2. Results for Discriminative Classifiers
    regularization
    we experimented with three modifications
        Nuisance Attribute Projection (NAP)
        LDA dimensionality reduction of iVectors
            note that NAP and LDA dim reduction are very similar when applied in
            iVector space
        length normalization

# 6. Conclusion 
