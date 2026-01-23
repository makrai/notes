* Najim Dehak, Pedro A.Torres-Carrasquillo, Douglas Reynolds, Reda Dehak
* Language Recognition via Ivectors and Dimensionality Reduction
* 2011

# Abstract

* In this paper, a 
  * new language identification system is presented based on the total
  variability approach previously developed in the field of speaker
  identification. Various techniques are employed to extract the most salient
  features in the lower dimensional i-vector space and the system
  * developed results in 
  excellent performance on the 2009 LRE evaluation set without the need for
  any post-processing or backend techniques. Additional performance gains are
  observed when the system is combined with other acoustic systems.

# 1. Introduction

* Over the years a number of techniques have been developed ... ranging from 
  * high level systems, typically 
    * focusing on phones and the frequency of the sequences of phones
    * observed in each target language, to 
  * systems based on the spectral characteristics of each language 
    * usually referred to as acoustic systems. 
    * classifiers of choice
      * Gaussian mixture models (GMM) [1, 2] and
      * support vector machines (SVM) [3] 
    * outperforming their high-level counterparts. 
    * For the GMM and SVM classifiers, a number of techniques developed
    * within the speaker recognition area have shown excellent performance
    * when applied to the language identification task
      * nuisance attribute projection (NAP) [3, 4] and
        * [3] 
          * W. Campbell, J. Campbell, D. Reynolds, E. Singer, and P.
           Torres-Carrasquillo 
          * Support vector machines for speaker and language recognit
          * Computer Speech and Language, vol. 20, no. 2-3, 2006.
        * [4] 
          * A. Solomonoff, C. Quillen, and W. M. Campbell, 
          * “Channel Compensation for SVM Speaker Recognition,” in 
          * IEEE Odyssey 2004.
      * factor analysis [5, 11]
        * [5] 
          * N. Brummer, A. Strasheim, V. Hubeika, P. Matejka, L. Burget, and O. Glembek, 
          * Discriminative Acoustic Language Recognition 
            * via Channel-Compensated GMM Statistics
          * Brighton, GB,, September 2009.
        * [11] 
          * P. Kenny, P. Ouellet, N. Dehak, V. Gupta, and P. Dumouchel, 
          * A Study of Interspeaker Variability in Speaker Verification
          * IEEE Transaction on Audio, Speech and Language 2008.
* In this paper ... application [to the language identification task] of the 
  * i-vector or total variability space approach consists of 
    * mapping a sequence of frames for a given utterance 
      * into a low-dimensional vector space, referred to as the 
        * total variability space, 
      * based on a factor analysis technique. 
  * We evaluate our system using 
    * different techniques of dimensionality reduction 
      * in order to compensate for the intersession effects.  
      * Linear Discriminant Analysis (LDA), 
      * Neighborhood Component Analysis (NCA) [6] and 
        * [6] J. Goldberger, S. Roweis, G. Hinton, and R. Salakhutdinov,
        * “Neighbourhood Component Analysis,” in 
        * Neural Information Processing Systems (NIPS), 2004.
      * their combination with Within Class Covariance Normalization (WCCN)   
        * [7] A. Hatch, S. Kajarekar, and A. Stolcke, “
        * Within-Class Covariance Normalization 
          * for SVM-Based Speaker Recognition
        * International Conference on Spoken Language Processing, 2006.

# 2. System description

## 2.1. Feature extraction 
  * similar to that employed in [8]. Speech is 
    * [8] P. Torres-Carrasquillo, E. Singer, T. Gleason, A. McCree,
    * D. Reynolds, F. Richardson, and D. Sturim, 
    * The MITLL NIST LRE 2009 Language Recognition System
    * IEEE Intnl Conference on Acoustics, Speech, and Signal Processing 2010
  * windowed at 20ms with a 10ms frame rate 
  * filtered through a mel-scale filter bank and then RASTA. Each vector is then 
  * converted into a 56-dimensional vector following a 
    * shifted delta cepstral parameterization using a 7-1-3-7 scheme 
  * Speech activity detection is then applied and the 
  * speech is normalized following a standard normal distribution.

## 2.2. Total variability modeling
  * first introduced in the context of speaker verification [9, 10].  
  * motivated by the success of the Joint Factor Analysis [11],
    * which models both speaker and intersession subspaces separately
  * models all the important variability in the same low dimensional subspace.
  * adapting the Universal Background Model (UBM) 
    * (which is trained on all the available language data for this paper)
    * based on the eigenvoice adaptation technique 
      * in order to estimate the utterance dependent GMM
      * operates on the assumption that all the pertinent variability is
        * captured by a low rank rectangular matrix T named 
          * the Total variability matrix. 
  * The GMM supervector [for a given utterance]
    * (vector created by stacking all mean vectors from the GMM) 
    * can be modeled as follows

    M = m + Tw + \epsilon

    * m is the Universal Background Model supervector, the 
    * i-vector $w$ is a random vector having a normal distribution
    * N (0, I), and the 
    * residual noise term \epsilon ∼ N (0, Σ) 
      * models the variability not captured by the matrix T
  * In our new modeling, we apply an SVM directly 
    * to the low dimensional i-vector 
      * (which is the coordinate of the speech segment in the total vari-
      * ability space) instead of applying the SVM in the GMM supervector
      * space
      * as done in [12]
    * training the total variability matrix T is 
      * a little bit different compared to learning the eigenvoice
      * adaptation matrix [13]. 
      * In eigenvoice training for speaker recognition, 
        * all the recordings of a given speaker are considered to belong
        * to the same person; in the case of the 
      * total variability matrix however, we pretend that every utterance
      * from a given speaker is produced by different speakers. If 
      * we follow the same total variability matrix training process for
      * language identification, 
        * we assume that every utterance for a given language class is
        * considered a different class. 
    * Additional details on the i-vector extraction procedure ...  in [10].  
## 2.3. Support Vector Machine and cosine kernel
  * Support vector machines
  * to extend the SVM approach to a multi-class problem ...  
    * our system is based on the one versus all 
    * The class label of a given test sample is based on 
      * the separator that obtains the highest score.
## 2.4. Linear Discriminant Analysis
  * Linear discriminant analysis (LDA) is 
    * a very popular technique for dimension reduction in the machine
    * learning field. It has the advantage of defining new axes that
    * maximize the discrimination between the different classes. In the
    * context of language recognition, each class represents a different
    * language. The LDA procedure consists of finding the basis that
    * maximizes the between classes variability while minimizing the
    * intra-class variability. The LDA axes are then defined by a projection
    * matrix A,
  * combination of the LDA and within class covariance normalization
    * Based on the performance ... for speaker verification [7], 
    * we proposed two different combinations. The 
      * first ... is exactly the same LDA and WCCN combination as done in
        * Dehak et al 2009 and 2011
      * second combination uses the diagonal eigenvalues matrix 
        * to normalize the cosine kernel between two i-vectors w 1 and w 2 .
    * Both kernel normalization matrices ... 
      * assign more importance to the 
        * dimensions with higher between classes variance
## 2.5. Neighborhood component analysis
  * Neighborhood component analysis (NCA) is a dimension reduction technique
  * [6]. It 
    * estimates a linear projection matrix based on 
    * optimizing the leave-one-out criteria of the nearest 858neighborhood classifier on a
    * given training data.
    * learns a projection matrix B ... that defines a Mahalanobis distance
      * maximizes the accuracy of the 
        * nearest neighbor classifier in the projected space.
    * differentiable optimization criterion of the NCA is based on a
    * stochastic “soft” neighbor assignment in the projected space 
      * instead of using directly the k-nearest neighbored classifier. 
      * Every vector i in the training set can select its neighbor j with
        * probability P ij , which is a 
          * softmax over Euclidean distances in the transformed space.
  * The NCA approach consists of 
    * maximizing the expected number of samples that are classified 
      * using the leave one out strategy on the training dataset.
    * not a convex function. 
      * The choice of the initial matrix B is crucial in the convergence of the algorithm. 
    * In our experiments, the ... initialization of the matrix B corresponds
      * linear discriminant analysis matrix 
      * [we tested the] combination of NCA and WCCN.
## 2.6. Backend
* similar to the backend discussed in [8] and 
  * consists of a per-system calibration stage 
    * As in [8], ... 
    * employs a single discriminatively trained Gaussian with shared covariance 
    * used for all durations through a duration based parametric function.
  * followed by a linear fusion. 

# 3. Experimental setup

* The data used for development of the systems are 
  * also similar to that employed in [8] and includes 
  * two main sources of data, 
    * conversational telephone speech (CTS) and 
      * data from multiple corpora including 
        * CallFriend
        * CallHome
        * Mixer
        * OHSU and OGI-22
    * broadcast news (BN).  
      * The BN partition includes data from VoA as supplied by NIST and is
      * processed as described in [8]. The data are 
  * pooled and then 
  * divided into two partitions, a development partition and a test partition
    * with similar number of cuts on each set.

# 4. Results

* most consistent performance across all speech duration conditions is obtained
* with the 400 dimensional i-vectors. We will use this dimensionality for the
* remainder of the paper.
* 4.1. Dimensionality reduction techniques
  * We also compared the i-vector approach with two other well known language
  * identification systems. The first system is the GMM approach based on the
  * Maximum Mutual Information (MMI) criteria [8]. The second system is a sup-
  * port vector machines system [7] based on the GMM supervec- tor (GSV).
* 4.2. Fusion
  * fusion results are presented between the i-vector systems, the GMM-MMI
  * system and the SVM-GSV system.  The fusion is based on logistic regression
  * as presented in [8].  We also present pairwise fusion results for the best
  * combination of a total variability system and either the GMM-MMI or the
  * GSV system for additional comparisons.

# 5. Conclusions
