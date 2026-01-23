Front-End Factor Analysis For Speaker Verification
Najim Dehak, Patrick Kenny, Réda Dehak, Pierre Dumouchel, and Pierre Ouellet
2010

# Abstract

* total variability space
  * a new low dimensional speaker and channel-dependent space
  * using a simple factor analysis
  * models both speaker and channel variabilities.  
* Two speaker verification systems are proposed 
  * first system is a Support-Vector-Machine-based system that 
    * uses the cosine kernel to estimate the similarity between the input data.
  * second system directly uses the cosine similarity 
* three channel compensation techniques in the total variability space
  * Within-Class Covariance Normalization (WCCN), 
  * Linear Discriminate Analysis (LDA), and 
  * Nuisance Attribute Projection (NAP).  We found that the
  * best results are obtained when LDA is followed by WCCN.

# 1 Intro

* Joint Factor Analysis (JFA) [1], [2], [3]
  * state-of-the-art performance for text-independent speaker detection tasks
    * in the NIST speaker recognition evaluations (SREs)
  * model the inter-speaker variability and 
  * to compensate for channel/session variability 
  * in the context of Gaussian Mixture Models (GMM) [4].
* Support Vector Machines (SVM) in GMM supervector space [5] 
  * yields interesting results, 
    * especially when Nuisance Attribute Projection (NAP) is applied 
      to deal with channel effects.
  * [5] W.M. Campbell, D.E. Sturim, D.A. Reynolds, and A. Solomonoff,
    * “SVM Based Speaker Verification 
      * using a GMM Supervector Kernel and NAP Variability Compensation,” 
      * in IEEE icassp 2006
  * In this approach, the kernel ... is based on a linear approximation of
    the Kullback-Leibler (KL) distance between two GMMs. The 
    * speaker GMM mean supervectors were obtained by adapting the Universal
      Background Model (UBM) mean supervector to speaker frames using Maximum
      A Posteriori (MAP) adaptation [4].
    * footnote: supervector is composed by stacking the mean vectors from a
      GMM
* In [6], [7], we proposed a new way of 
  * combining JFA and Support Vector Machines (SVM) for speaker verification. 
  * directly using the speaker factors estimated with JFA as input to the SVM.
  * We tested several kernels and the best results were obtained using the
    * cosine kernel [6] when 
    * Within-Class Covariance Normalization (WCCN) [8] is also used to
      compensate for residual channel effects in the speaker factor space.
* we proposed total variability space
  * motiv: channel factors estimated using JFA, 
    * which are supposed to model only channel effects, also 
    * contain information about speakers. Based on this [6]
  * a new speaker verification system based on factor analysis as
    a feature extractor [9].  The factor analysis is used to define a new
    low-dimensional space named _total variability space_. In this new space,
    a given speech utterance is represented by a new vector named _total
    factors_ (we also refer to this vector as _i-vector_ in this paper).  The
    channel compensation in this new approach is carried out in
    low-dimensional space, the total variability space, as opposed to the
    high-dimensional GMM supervector space for clasical JFA [3]. We have
    proposed 
  * two new systems based on this new speech representation. The 
    * first system is an SVM-based system which uses the cosine kernel to
      compute the similarity between the total factors. The 
    * second system directly uses the value of the cosine distance computed
      between the target speaker factors and test total factors as a decision
      score. In this scoring, we removed the SVM from the decision process.
      * One important characteristic of this approach is that there is no
        speaker enrollment, unlike in other approaches like SVM and JFA, which
        makes the decision process faster and less complex. 
* This paper presents 
  * more details about how these two new systems were built and 
  * shows how the channel compensation techniques are used in order 
    * to remove the nuisance direction from these new total factor vectors. The
  * best results are obtained with the 
    * Linear Discriminant Analysis (LDA) and WCCN combination which uses the
      cosine kernel. The 
      * motivation for using LDA is to maximize the variance between speakers
        and minimize the intra-speaker variance
* outline of the paper is as follows. We first describe the
  * JFA approach in Section II. 
  * Section III presents the total variability space, the two new speaker
    * verification systems and all proposed channel compensation techniques. The 
  * experiments and results are given in section IV. 
  * Section V concludes the paper.

# 2 JFA

[1] P. Kenny, G. Boulianne, P. Ouellet, and P. Dumouchel, 
  “Joint Factor Analysis versus Eigenchannels in Speaker Recognition,” 
  IEEE Transaction on Audio Speech and Language Processing 2007.
[2] P. Kenny, G. Boulianne, P. Ouellet, and P. Dumouchel, 
  “Speaker and Session Variability in GMM-Based Speaker Verification,” 
  IEEE Transaction on Audio Speech and Language Processing,  2007.
[3] P. Kenny, P. Ouellet, N. Dehak, V. Gupta, and P. Dumouchel, 
  “A Study of Interspeaker Variability in Speaker Verification,” 
  IEEE Transaction on Audio, Speech and Language, 2008.

# 3 Front-end factor analysis

## A. Total variability

                               M = m + T w (2)

* m is the speaker- and channel-independent super- vector 
  * (which can be taken to be the UBM supervector), 
* T is a rectangular matrix of low rank and 
* w is a random vector having a standard normal distribution N (0, I). The
  components of the vector w are the _total factors_. We refer to these new
  vectors as identity vectors or _i-vectors_ for short.  
* In this modeling, M is assumed to be normally distributed with mean vector m
  and covariance matrix T T^t . The process of 
* training the total variability matrix T is 
  * exactly the same as learning the
  eigenvoice V matrix (see [11]), 
    * [11] P. Kenny, G. Boulianne, and P. Dumouchel, 
      “Eigenvoice modeling with sparse training data,” 
      IEEE Trans. Speech Audio Processing, vol. 13, no. 3, may 2005.
  * except for one important difference: in eigenvoice training, all the
    recordings of a given speaker are considered to belong to the same person;
    in the case of the total variability matrix however, a given speaker’s
    entire set of utterances are regarded as having been produced by different
    speakers (we pretend that every utterance from a given speaker is produced
    by different speakers)

## B. Support Vector Machines
## D. Intersession compensation

three channel compensation techniques in the total variability space for
removing the nuisance effects. The first approach is 

1. Within- Class Covariance Normalization (WCCN) [8], which was successfully
   applied in the speaker factor space in [7]. This technique uses the inverse
   of the within-class covariance to normalize the cosine kernel. The second
   approach is 
2. Linear Discriminant Analysis (LDA). The motivation for using this technique
   is that, in the case where all utterances of a given speaker are assumed to
   represent one class, LDA attempts to define new special axes that minimize
   the intra-class variance caused by channel effects, and to maximize the
   variance between speakers. The advantage of the LDA approach is based on
   discriminative criteria designed to remove unwanted directions and to
   minimize the information removed about variance between speakers.  Similar
   work was carried out for speaker verification based on a discriminative
   version of the nuisance attribute projection algorithm without any success
   [13]. The last approach is the 
3. Nuisance Attribute Projection (NAP) presented in [5]. This technique
   defines a channel space based on the eigenvectors having the largest
   eigenvalues of the within-class covariance computed in the i- vector
   background. The new i-vectors are then projected in the orthogonal
   complementary channel space, which is the speaker space.

# 4 Experiments 

## A. Databases
## B. Experimental Setup

zt-norm details

## C. SVM-FA
## D. Cosine Distance scoring
# 5 Conclusion 
