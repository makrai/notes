Xin Huang and Liangpei Zhang
An Adaptive Mean-Shift Analysis Approach 
  for Object Extraction and Classification From Urban Hyperspectral Imagery
IEEE Transactions on geoscience and remote sensing 2008 , vol. 46, no. 12,

# I. INTRODUCTION 

* images with both high spatial and spectral resolutions (HSSR imagery) ... for
  land-cover/land-use mapping. Such HSSR data provide both detailed structural
* In this paper, a mean-shift (MS)-based analysis framework is proposed to
* several issues should be addressed
  1. Dimension Reduction for Hyperspectral Feature Space: 
    * On the one hand, it is necessary to reduce the computation load for HSSR
    * on the other hand, the kernel density estimation in the MS does not scale
      well with high dimension of the space (Comaniciu and Meer 2002). This is
    * emptyspace phenomenon (Fukunaga 1990) by which 
      most of the mass in a highdimensional space is concentrated in a small rg
    * feature-extraction approaches have been tested for hyperspectral data:
      discriminant-analysis feature extraction [2], PCA [1], and 
      independent component analysis [7], nonnegative matrix factorization [8],
  2. Object-Based Classification: 
    * reduce the local spectral variation, generalize the spectral information
      in a spatial neighbor, and exaggerate the spectral distinction between
      spectrally similar objects
    * group the spatially adjacent pixels into spectrally homogeneous objects
      and then conduct classification on objects as the minimum processing
      unit
  3. Classifier:  In this paper, SVM is used to interpret the HSSR data sets
