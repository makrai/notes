SVM based speaker verification 
  using a GMM supervector kernel and NAP variability compensation
W. M. Campbell, D. E. Sturim, D. A. Reynolds, A. Solomonoff
2006

# Abstract

Gaussian mixture models with universal backgrounds (UBMs) have become the
standard method for speaker recognition. Typically, a speaker model is
constructed by MAP adaptation of the means of the UBM. A GMM supervector is
constructed by stacking the means of the adapted mixture components. A recent
discovery is that latent factor analysis of this GMM supervector is an
effective method for variability compensation. We consider this GMM
supervector in the context of support vector machines. We construct a support
vector machine kernel using the GMM supervector. We show similarities based on
this kernel between the method of SVM nuisance attribute projection (NAP) and
the recent results in latent factor analysis. Experiments on a NIST SRE 2005
corpus demonstrate the effectiveness of the new technique.

# 1 Intro

adapted Gaussian mixture model [1].
latent factor analysis to compensate for speaker and channel variability [2].
  MAP adapted means of a GMM
  GMM supervector consisting of the stacked means of the mixture components.
Support vector machines (SVMs)
  nonlinear mapping from an input space to an SVM expansion space.
    potentially high-dimensional space. 
  The main design component in an SVM is the kernel, which is 
    an inner product in the SVM feature space.
In this paper, we 
  combine the recent results in SVM methods with the GMM supervector concept.
    * We derive a linear kernel based upon an approximation to KL divergence
      between two GMM models. We then 
    * apply the SVM nuisance attribute projection method [4] to the resulting
      kernel. We demonstrate 
    * similarities between our approach and the latent factor analysis method.
* The outline of the paper is as follows. In 
  * Section 2, we describe the basic framework for SVMs. In 
  * Section 3, we outline the GMM supervector expansion.  
  * Section 4 describes the linear kernel for SVM speaker verification. 
  * Section 5 discusses the SVM NAP method and relations with latent factor analysis.
  * Section 6
    * applying it to a NIST speaker recognition evaluation 2005 task and 
    * comparing it to a standard GMM approach.

# 3. GMM supervectors

```latex
g(x) = \sum_i=1^N λ_i N (x; m_i , Σ_i )
```
We assume diagonal covariances, Σ.

                 GMM UBM --> MAP adaptation --> m supervector
                                      ^
                                      |
                              (feature extract)
                               input utterance 
            
