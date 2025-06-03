Offline bilingual word vectors , orthogonal transformations and the inverted softmax
arXiv:1702.03859v1 [cs.CL] 13 Feb 2017
Samuel L. Smith, David H. P. Turban, Steven Hamblin & Nils Y. Hammerla

# ABSTRACT

Usually bilingual word vectors are trained “online”. Mikolov et al. (2013a)
showed they can also be found “offline”; whereby two pre-trained embeddings are
aligned with a linear transformation, using dictionaries compiled from expert
knowledge. In this work,
* we prove that the linear
  * transformation between two spaces should be orthogonal. This transformation
    can be obtained using the singular value decomposition. We introduce a
  * novel “inverted softmax” for identifying translation pairs, with which we
    improve the precision @1 of Mikolov’s original mapping from 34% to 43%,
    when translating a test set composed of both common and rare English words
    into Italian. Orthogonal transformations are more robust to noise, enabling
    us to learn the transformation without expert bilingual signal by
    constructing a
  * “pseudo-dictionary” from the identical character strings which appear in
    both languages, achieving 40% precision

## 2.1 Previous work

* Faruqui & Dyer (2014) obtained bilingual word vectors using CCA. They did not
  attempt any translation tasks, but showed that the combination of CCA and
  dimensionality reduction improved the performance of monolingual vectors on
  standard evaluation tasks.
* CCA had previously been used to iteratively extract translation pairs
  directly from monolingual corpora (Haghighi et al., 2008). More recently,
* Xing et al. (2015) argued that Mikolov’s linear matrix should be orthogonal,
  and introduced an approximate procedure composed of gradient descent updates
  and repeated applications of the SVD.
* CCA has been extended to map 59 languages into a single shared space (Ammar
  et al., 2016), and
* non-linear “deep CCA” has been introduced (Lu et al., 2015). A
* theoretical analysis of bilingual word vectors similar to this paper was
  recently published by Artetxe et al.  (2016).
