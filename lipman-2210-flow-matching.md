Flow Matching for Generative Modeling
Yaron Lipman, Ricky T. Q. Chen, Heli Ben-Hamu, Maximilian Nickel, Matt Le
arXiv:2210.02747 [cs.LG]

* We introduce a new paradigm for
  generative modeling built on Continuous Normalizing Flows (CNFs)
  * train CNFs at unprecedented scale
  * we intro Flow Matching (FM), a simulation-free approach for training CNFs
    based on regressing vector fields of fixed conditional probability paths
    * compatible with a general family of Gaussian probability paths for
      transforming between noise and data samples -- which
    * subsumes existing diffusion paths as specific instances
  * employing FM with diffusion paths results in
    a more robust and stable alternative for training diffusion models
  * opens the door to training CNFs with other, non-diffusion probability
    paths. An instance of particular interest is
  * eg using Optimal Transport (OT) displacement interpolation to define the
    conditional probability paths
  * more efficient than diffusion paths, provide faster training and sampling,
    and result in better generalization. Training
* exper: CNFs using Flow Matching on ImageNet leads to
  consistently better performance than alternative diffusion-based methods
  in terms of both likelihood and sample quality, and allows
  * fast and reliable sample generation
    using off-the-shelf numerical ODE solvers
