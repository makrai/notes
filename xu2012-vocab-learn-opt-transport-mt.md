Vocabulary Learning via Optimal Transport for Machine Translation
Jingjing Xu, Hao Zhou, Chun Gan, Zaixiang Zheng, Lei Li
ACL 2021 arXiv:2012.15671 [cs.CL]

# Abstract

* The choice of token vocabulary affects the performance of machine translation.
* find the optimal vocabulary without trial training. To answer these questions,
* we first provide an understanding of the role of vocabulary from the
  perspective of information theory. Motivated by this, 
  * as an optimal transport (OT) problem.We We propose VOLT, a simple and
    efficient solution without trial training. 
* Empirical results show that VOLT outperforms widely-used vocabularies in
  diverse scenarios, including WMT-14 English-German and TED's 52 translation
  * e.g. 70% vocabulary size reduction and 0.5 BLEU gain on English-German
  * compared to BPE-search, VOLT reduces the search time from 384 GPU hours to
    30 GPU hours on English-German translation. Codes are available at this

# 1 Intro

* the effects of vocabulary size are not sufficiently taken into account since
  current approaches only consider frequency (or entropy) as the main
  criteria. Many previous studies  show that 
* vocabulary size also affects downstream performances 
  (Sennrich and Zhang, 2019; Ding+ 2019; Provilkov+ 2020; Salesky+ 2020), 
  especially on low-resource tasks. Due to the 
* lack of appropriate inductive bias about size, trial training (namely
  traversing all possible sizes) is usually required to search for the optimal
  size, which takes high computation costs. For convenience, 
* most existing studies only adopt the widely-used settings in implementation.
  For example, 30K-40K is the most popular size setting in all 42 papers of
  Conference of Machine Translation (WMT) through 2017 and 2018 (Ding+ 2019).
* In this paper, we propose to explore automatic vocabularization by
  simultaneously considering entropy and vocabulary size without expensive trial
  * non-trivial to find an appropriate objective function
  * corpus entropy decreases with the increase of vocabulary size, which
    benefits model learning (Martin and England, 2011).  
  * too many tokens cause token sparsity, which hurts model learning (Allison+
    2006). Second, 
  * supposing that an appropriate measurement is given, it is still challenging
    to solve such a discrete optimization problem due to the exponential search
    space.
* we propose a VOcabulary Learning approach via optimal Transport, VOLT for
  * polynomial time by considering corpus entropy and vocabulary size.
  * we borrow the concept of Marginal Utility in economics (Samuelson, 1937) and
    * used to balance the benefit (entropy) and the cost (vocabulary size)
  * Higher MUV is expected for Pareto optimality. Formally, MUV is 
  * defined as the negative derivative of entropy to vocabulary size. Figure 1
  * correlates with the downstream performances on two-thirds of tasks 
* maximize MUV in tractable time complexity. 
  * We reformulate our discrete optimization objective into 
    an optimal transport problem (Cuturi, 2013) that 
    can be solved in polynomial time by linear programming. Intuitively, the
  * as finding the optimal transport matrix from the character distribution to
    the vocabulary token distribution.  Finally, our proposed VOLT will yield a
    vocabulary from the optimal transport matrix.
