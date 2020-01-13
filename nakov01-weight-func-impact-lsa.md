Weight functions impact on LSA performance
Preslav Nakov, Antonia Popova, Plamen Mateev
RANLP, 2001

# Abstract

* Several preliminary transformations of the frequency text-document matrix
  with different weight functions are tested on the basis of control subsets.
  Additional clustering based on correlation matrix is applied 

# 1 Intro

* The effective usage of LSA is a process of very sophisticated tuning and 
  can be viewed as kind of art. The main factors ... are the following:
  * Pre-processing (stop-words, stemming)
  * Frequency matrix transformations
  * Choice of dimensionality
  * Choice of similarity measure
* The general idea [of LSA] is that there exists a set of latent dependencies
  between the words and their contexts (phrases, paragraphs and texts)

# 2. Weight functions

* express the transformation as a product of ... local and global weight[s]
  (Witter 97; Dumais 91): 
    `a (i,j) = L(i,j)*G(i)`  
     * local weight function L(i,j) presents the weight of term i in document j.
     * G(i) is ... the weight of the term i across the entire document set.
* Two different local functions and six global functions [are considered]
  * local weight function is equal to the 
    * term frequency tf(i,j) of term i in document j. The 
    * term frequency in logarithmic scale 
    * binary weight function — it is equal to 1 when tf(i,j)>0 and 0,
      otherwise. We use the first two local weight functions 
  * global weight function
    * the trivial G(i)=1
    * l2-normalisation of the rows
In the definition of the rest global weight functions the following notation is
used: gf(i) for the global frequency of term i;
    * GfIdf, is the ratio of the global frequency of a term and the number of
      documents in which it appears:
    * Idf is usually defined by `1+ log (ndocs/df(i))`
    * entropy `G(i)= 1+{Σ j p(i,j) log p(i,j)}/ log ndocs`
      * Actually, this equation represents some entropy ratio, i.e.  
      `G(i)= 1– H(d|i)/H(d)`, where 
      * H(d) is the entropy of the distribution (uniform) of the documents and
        H(d|i) is the [conditional] entropy ... given that the term i appeared.
    * entropy of the conditional distribution 
      `H(d|i) = – Σ j p(i,j) log p(i,j)`
