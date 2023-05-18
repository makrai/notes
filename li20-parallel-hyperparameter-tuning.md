A System for Massively Parallel Hyperparameter Tuning
Liam Li, Kevin Jamieson, Afshin Rostamizadeh, Ekaterina Gonina,
  Jonathan Ben-tzur, Moritz Hardt, Benjamin Recht, Ameet Talwalkar
Machine Learning and Systems 2 (MLSys 2020)

# Abstract

* hyperparameter optimization functionality in distributed computing settings.
* we: a simple and robust hyperparameter optimization algorithm called ASHA,
  * parallelism and aggressive early-stopping to tackle large-scale
    hyperparameter optimization problems
  * extensive empirical results show that ASHA
    * outperforms existing SOTA hyperparameter optimization methods
    * scales linearly with the number of workers in distributed settings
    * suitable for massive parallelism, converging to a high quality
      configuration in half the time taken by Vizier (Google’s internal
      hyperparameter optimization service) in an experiment with 500 workers.
  * integrating ASHA in SystemX
    * SystemX is an end-to-end production-quality ML system offers
      hyperparameter tuning as a service.
    * design decisions we encountered, along with our associated solutions,

# 1 Intro

* we first introduce Asynchronous Successive Halving Algorithm (ASHA),
  * a simple and practical hyperparameter optimization method suitable for
    massive parallelism that exploits aggressive early stopping. Our algorithm
  * inspired by the Successive Halving algorithm (SHA)
    (Karnin+ 2013; Jamieson & Talwalkar, 2015)
    * a theoretically principled early stopping method that
      allocates more resources to promising configurations. ASHA is
  * designed for the ‘large-scale regime,’ where to find a good hyperpm setting
    * we must evaluate orders of magnitude more hyperparameter configurations
      than available parallel workers in a small multiple of the wall-clock
      time needed to train a single model.
* We next perform a thorough comparison of several hyperparameter tuning meths
  in both the sequential and parallel settings. We focus on
  * ‘mature’ methods, ie, well-established techniques that have been
    empirically and/or theoretically studied to an extent that they could be
    considered for adoption in a production-grade system
  * sequential setting, we compare SHA with Fabolas (Klein+ 2017a), Population
    Based Tuning (PBT, Jaderberg+ 2017), and BOHB (Falkner+ 2018), SOTA methods
    * exploit partial training
    * SHA outperforms these methods, which when coupled with SHA’s simplicity
    * SHA and ASHA achieve similar results
  * parallel setting, our experiments demonstrate that
    * SHA, scales linearly with the number of workers, and
    * exceeds the performance of PBT, BOHB, and Vizier (Golovin+ 2017),
      Google’s internal hyperparameter optimization service.
* experience developing ASHA within Determined AI’s production-quality ML sys
  that offers hyperparameter tuning as a service, we describe several systems
  design decisions and optimizations that we explored as part of the
  * streamlining the user interface to enhance usability; 
  * autoscaling parallel training to systematically balance the tradeoff
    between lower latency in individual model training and
    higher throughput in total configuration evaluation; 
  * efficiently scheduling ML jobs to optimize multi-tenant cluster utilization
  * tracking parallel hyperparameter tuning jobs for reproducibility.

# 2 Related work

* that motivated our focus on parallelizing SHA for the large-scale regime
* methods for parallel hyperparameter tuning, from which we identify a mature
  subset to compare to in our empirical studies (Section 4)
* systems for hyperparameter optimization

## Sequential Methods

* Existing hyperparameter tuning methods attempt to speed up the search for a
  good configuration by either/or
  * adaptively selecting/evaluating configurations 
  * selection approaches attempt to identify promising regions of the
    hyperparameter search space from which to sample new configurations to
    evaluate (Hutter+ 2011; Snoek+ 2012; Bergstra+ 2011; Srinivas+ 2010).
  hE sequential
    * by relying on previous observations to inform which configuration to
      evaluate next, these algorithms are inherently sequential and thus
    => not suitable for the largescale regime, where
      the number of updates to the posterior is limited. In contrast, adaptive
  * evaluation approaches attempt to early-stop poor configurations and
    allocate more training “resources” to promising configurations.

* theoretical guarantees under strong assumptions on the convergence behavior
  of intermediate losses
  * György & Kocsis (2011); Agarwal+ (2011); Sabharwal+ (2016) provide
  * Krueger+ (2015) relies on a heuristic early-stopping rule based on
    sequential analysis to terminate poor configurations.

* adaptive configuration evaluation approaches
  * SHA (Jamieson & Talwalkar, 2015) and Hyperband (Li+ 2018)
  * avoid the aforementioned drawbacks and have achieved
  * SOTA performance on several empirical tasks
  * SHA serves as the inner loop for Hyperband, with
  * Hyperband automating the choice of the early-stopping rate by running
    different variants of SHA.

* choice of early stopping rate is problem dependent
  * aggressive early-stopping works well for a wide variety of tasks. Hence, we
    * Li+ (2018)’s empirical results show that
  => we focus on adapting SHA to the parallel setting in Section 3, though
  * nL we also evaluate the corresponding asynchronous Hyperband method.

* Hybrid approaches
  * combine adaptive configuration selection and evaluation
    (Swersky+ 2013; 2014; Domhan+ 2015; Klein+ 2017a)
    * Li+ (2018) showed that SHA/Hyperband outperforms SMAC with the learning
      curve based early-stopping method introduced by Domhan+ (2015). In
    * Klein+ (2017a) reported SOTA performance for Fabolas on several tasks in
      comparison to Hyperband and other leading methods. However, our results in
    * Section 4.1 demonstrates that under an appropriate experimental setup,
      SHA and Hyperband in fact outperform Fabolas. Moreover, we note that
    * Fabolas, along with most other Bayesian optimization approaches, can be
      parallelized using a constant liar (CL) type heuristic (Ginsbourger+ 2010;
      González+ 2016)
    * hE the parallel version will underperform the sequential version, since the
      latter uses a more accurate posterior to propose new points. Hence, our
      comparisons to these methods are restricted to the sequential setting.
  * combine Hyperband with adaptive sampling
    * Klein+ (2017b) combined Bayesian neural networks with Hyperband by
      first training a Bayesian neural network to predict learning curves and
      then using the model to select promising configurations to use as inputs
      to Hyperband. More
    * Falkner+ (2018) introduced BOHB, a hybrid method
      * combining Bayesian optimization with Hyperband. They also propose a
      * parallelization scheme for SHA that retains synchronized eliminations
        of underperforming configurations
      * We discuss the drawbacks of this parallelization scheme in Section 3
      * ASHA outperforms this version of parallel SHA as well as BOHB (Sec 4.2)
    * similar to SHA/Hyperband, ASHA can be combined with adaptive sampling for
      more robustness to certain challenges of parallel computing that we
      discuss in Section 3.

## Parallel Methods. Established parallel methods for hyperparameter tuning

* PBT (Jaderberg+ 2017; Li+ 2019) and Vizier (Golovin+ 2017).
* PBT is a SOTA hybrid evolutionary approach that
  exploits partial training to
  iteratively increase the fitness of a population of models, PBT lacks any 
  * no theoretical guarantees, In contrast to Hyperband
  * primarily designed for neural networks and is not a general approach for
  * more comparable to SHA than to Hyperband since both PBT and SHA require
    the user to set the early-stopping rate via internal hyperparameters
* Vizier is Google’s black-box optimization service with
  * support multiple
    hyperparameter optimization methods and early-stopping options. For
  * we will refer to Vizier’s default algorithm as “Vizier” although it is
  * early-stopping rules only offer approximately 3× speedup
    * in contrast to the order of magnitude speedups observed for SHA
* We compare to PBT and Vizier in Section 4.2 and Section 4.4, respectively.

## Hyperparameter Optimization Systems

* AutoWEKA (Kotthoff+ 2017) and AutoSklearn (Feurer+ 2015) are two established
  single-machine, single-user systems for hyperparameter optimization. Existing
* distributed hyperparameter optimization include Vizier (Golovin+ 2017),
  RayTune (Liaw+ 2018), CHOPT (Kim+ 2018) and Optuna (Akiba+ 2013)
  * support for a wide range of hyperparameter tuning algorithms
  * both RayTune and Optuna in fact have support for ASHA.
* Kim+ (2018) address the problem of resource management for generic
  hyperparameter optimization methods in a shared compute environment, while we
* user-specified automated scaling capability for parallel training presented
  in Xiao+ (2018), we propose to automate appropriate autoscaling limits by
  using the performance prediction framework by Qi+ (2017).

# 3 Asha algorithm 3

* We start with an overview of SHA (Karnin+ 2013; Jamieson & Talwalkar, 2015)
  * motivate the need to adapt it to the parallel setting
* Then we present ASHA and discuss how it addresses issues with synchronous SHA

## 3.1 Successive Halving (SHA)

* The idea behind SHA (Algorithm 1) is simple: 
  * allocate a small budget to each configuration, evaluate all configura-
    tions and keep the top 1/η, increase the budget per configuration by a
    factor of η, and repeat until the maximum per-configuration budget of R is
    reached (lines 5–11). The resource allocated by SHA can be iterations of
    stochastic gradient descent, number of training examples, number of random
    features, etc.

Algorithm 1 Successive Halving Algorithm.
input number of configurations n, minimum resource
r, maximum resource R, reduction factor η, minimum
early-stopping rate s
smax = blogη (R/r)c
assert n ≥ η smax −s so that at least one configuration will
be allocated R.

T = get hyperparameter configuration(n)
// All configurations trained for a given
i constitute a ‘‘rung.’’
for i ∈ {0, . . . , smax − s} do
ni = bnη −i c
ri = rη i+s

L = run then return val loss(θ, ri ) : θ ∈ T

T = top k(T, L, ni /η)
end for
return best configuration in T

* SHA requires the number of configurations n, a minimum resource r, a maximum
  resource R, a reduction factor η ≥ 2, and a minimum early-stopping rate s.
  Additionally, the get hyperparameter configuration(n) subroutine returns n
  configurations sampled randomly from a given search space; and the `run then
  return val loss`(θ, r) subroutine returns the validation loss after training
  the model with the hyperparameter setting θ and for r resources. For a given
  early-stopping rate s, a minimum resource of `r_0 = r η^s` will be allocated
  to each configuration. Hence, lower s corresponds to more aggressive
  early-stopping, with s = 0 prescribing a minimum resource of r
* brackets and rungs
  * We will refer to SHA with different values of s as brackets and,
  * within a bracket, we will refer to each round of promotion as a rung with
    the base rung numbered 0 and increasing
* Figure 1
  * (a) shows the rungs for bracket 0 for an example setting with n = 9, r = 1,
    R = 9, and η = 3, while Figure 
  * (b) shows how resource allocations change for different brackets s.

Straightforward ways of parallelizing SHA are not well suited for the parallel
regime. We could consider the embarrassingly parallel approach of running
multiple instances of SHA, one on each worker. However, this strategy is not
well suited for the large-scale regime, where we would like results in little
more than the time to train one configuration.

To see this, assume that training time for a configuration scales linearly with
the allocated resource and time(R) represents the time required to train a
configuration for the maximum resource R. In general, for a given bracket s,
the minimum time to return a configuration trained to completion is (logη (R/r)
− s + 1) × time(R), where logη (R/r) − s + 1 counts the number of rungs.  For
example, consider Bracket 0 in the toy example in Figure 1. The time needed to
return a fully trained configuration is 3 × time(R), since there are three
rungs and each rung is allocated R resource. In contrast, as we will see in the
next section, our parallelization scheme for SHA can return an answer in just
time(R).

Another naive way of parallelizing SHA is to distribute the training of the n/η
k surviving configurations on each rung k as is done by Falkner+ (2018) and add
brackets when there are no jobs available in existing brackets. We will refer
to this method as “synchronous” SHA. The efficacy of this strategy is severely
hampered by two issues: 
  * SHA’s synchronous nature is sensitive to stragglers and dropped jobs as
    every configuration within a rung must complete before proceeding to the
    next rung, and 
  * the estimate of the top 1/η configurations for a given early-stopping rate
    does not improve as more brackets are run since promotions are performed
    independently for each bracket.  We demonstrate the susceptibility of
    synchronous SHA to stragglers and dropped jobs on simulated workloads in
    Appendix A.1.

## 3.2 Asynchronous SHA (ASHA)

## 3.3 Algorithm Discussion

# 4 Empirical evaluation 5

* organization
  1. We first present results in the sequential setting to justify our choice
     of focusing on SHA and to compare SHA to ASHA
  2.--4 .We next evaluate ASHA in parallel environments on three benchmarks

## 4.1 Sequential Experiments

# 5 Productionizing ASHA 8 

