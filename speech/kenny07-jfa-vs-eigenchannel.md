Joint Factor Analysis versus Eigenchannels in Speaker Recognition
Patrick Kenny, G. Boulianne, P. Ouellet and P. Dumouchel
2007

# Abstract

We 
  * compare two approaches to the problem of session variability in GMM-based
    speaker verification, eigen-channels and joint factor analysis, on the
    NIST 2005 speaker recognition evaluation data. We 
  * show how the two approaches can be implemented using essentially the same
    software at all stages except for the enrollment of target speakers. We
  * demonstrate the effectiveness of zt-norm score normalization and a new
    decision criterion for speaker recognition which can handle large numbers
    of t-norm speakers and large numbers of speaker factors at little
    computational cost. We 
  * found that factor analysis was far more effective than eigenchannel modeling.

# 1 Intro

* joint factor analysis of speaker and channel variability [1].
  * seems to require a well balanced training set in which a typical training
    speaker is recorded under a variety of channel conditions

# 2 Models of session variability

* just as most speaker variability is low dimensional (the premise of
  eigenvoice modeling) the same is probably true of channel variability so
  that similar methods can be brought to bear on modeling both types of
  variability.

                                  c = ux (4)

* Note that in this brief discussion we have only touched on model-based
  methods for channel compensation of GMM’s and not on ... the parallel
  developments in _SVM-based_ speaker recognition [12]. 
  * [12] A. Solomonoff, W. Campbell, and I. Boardman, 
  “Advances in channel compensation for SVM speaker recognition,”
  ICASSP 2005
  * It is interesting to
  note that although the approach in SVM-based speaker recognition is
  discriminative rather than generative and it is concerned with finding
  feature representations which are immune to channel variability rather than
  modeling this type of variability, the key algorithm in _‘nuisance attribute
  projection’_ is also formulated as an eigenvalue problem.

# 3. Models of speaker and utterance variability

                             s = m + vy + dz (5)

m is the speaker- and channel-independent supervector,
v is a rectangular matrix of low rank, 
d is a diagonal matrix and 
y and z are random vectors having standard normal distributions.

This is a factor analysis in the sense of [13].  It is usual to refer to the
* elements of y simply as factors but the terminology of [14] is also useful:
  the elements of y are ‘common factors’ (because each of them serves to
  account for the variance in all of the elements of s) and the 
* elements of z are ‘specific factors’. 
* In the absence of the specific factors, (5) implies that all supervectors
  are contained in the linear span of m and the columns of v which is the
  assumption of eigenvoice modeling. In practice, 
* the common factors account for most of the variance in the data and the term
  dz serves as a _residual_ to compensate for the fact that the eigenvoice
  assumption may be unrealistic and it may be difficult to find enough
  training speakers to estimate v reliably.
* eigenchannel modeling (6)
* Note that (6) is a model of utterance variability whereas (5) is a model of
  speaker variability since M is sensitive to channel effects whereas s is
  not.  
* Put another way, we treat all utterances by a given speaker as being
  statistically independent in (6) but not in (5).
* The earliest instance of factor analysis MAP adaptation in the literature on
  speaker recognition is [16].
  * [16] S. Lucey and T. Chen, 
    “Improved speaker verification through proba- bilistic subspace adaptation,”
    Eurospeech, Geneva, Switzerland, Sept. 2003, pp. 2021–2024.

# 4. Fitting the models

* In the previous sections we outlined two ways of modeling the two types of
variability which are of interest in speaker recognition, namely speaker
variability and session variability.  One approach, known as 
  * joint factor analysis, is to 
    * model speaker variability by (5) and session variability by (4). The
  * eigenchannel modeling
    * model utterance variability by (6) and session variability by (2)
