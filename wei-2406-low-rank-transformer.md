Building on Efficient Foundations: 
  Effectively Training LLMs with Structured Feedforward Layers
Xiuying Wei, Skander Moalla, Razvan Pascanu, Caglar Gulcehre
NeurIPS2024 arXiv:2406.16450 [cs.CL]

# The Batch

* training each full-size layer in parallel with a low-rank approximation of
  the layer while gradually phasing out the full-size layer. This approach
  costs more memory and computation initially, but it saves those resources in
  the long run
* training the modified version required more than 20 percent less processing
  and 14 percent less time

# Abstract

* we target the computationally intensive feedforward networks (FFNs), which
  * less studied than attention blocks. 
  * We consider three structured linear parameterizations of the FFN using
    efficient low-rank and block-diagonal matrices. In contrast to many
  * we explore these structures from a training-from-scratch perspective, ii)
  * we scale up to 1.3B parameters, and iii) is conducted within recent
  * computational gains in various scenarios, including online decoding when
    using a pre-merge technique. Additionally, 
* we propose a novel training regime, called \textit{self-guided training},
  aimed at improving the poor training dynamics that these approximations
  exhibit when used from initialization.
* the scaling performance of structured matrices is explored, revealing 
  * steeper curves in scaling training FLOPs, along with a 
  * favorable scaling trend in the overtraining regime.
* wide and structured networks can utilize training FLOPs more efficiently,
  with fewer parameters and lower loss than dense models at their optimal
  trade-off
