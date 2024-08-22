Scaling Laws for Data Filtering -- Data Curation cannot be Compute Agnostic
Sachin Goyal, Pratyush Maini, Zachary C Lipton, Aditi Raghunathan, JZ Kolter
CVPR 2024 arXiv:2404.07177 [cs.LG]

# Abstract

* Vision-language models (VLMs) are trained for thousands of GPU hours
  on carefully curated web datasets. In recent times,
* data curation has gained prominence with several works developing
  * retain 'high-quality' subsets of 'raw' scraped data. For instance, the
  * eg LAION public dataset retained only 10% of the total crawled data
  * hE agnostic of the available compute for training. In this paper,
* we first demonstrate that making
  * filtering decisions independent of training compute is often suboptimal:
    the limited high-quality data rapidly loses its utility when repeated,
  * required: the inclusion of 'unseen' but 'lower-quality' data. To address
  * neural scaling laws that
    * account for the non-homogeneous nature of web data, an angle ignored in
      existing literature. Our scaling laws
    * charize the differing 'utility' of various quality subsets of web data;
    * account for how utility diminishes for a data point at its 'nth' repet
    * formulate the mutual interaction of various data pools when combined,
      enabling the estimation of model performance on a combination of multiple
      data pools without ever jointly training on them
  * data curation cannot be agnostic of the total training compute
    * Our scaling laws allow us to curate the best possible pool for achieving
      top performance on Datacomp at various compute budgets, carving out
    * a pareto-frontier for data curation
