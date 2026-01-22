Compress then Serve: Serving Thousands of LoRA Adapters with Little Overhead
Rickard Brüel-Gabrielsson, Jiacheng Zhu, Onkar Bhardwaj, Leshem Choshen,
  Kristjan Greenewald, Mikhail Yurochkin, Justin Solomon
arXiv:2407.00066 [cs.DC]

* LoRAs has become common practice, often yielding numerous copies of the same
  LLM differing only in their LoRA updates. This paradigm presents
* challenges for systems that serve real-time responses to queries that each
  involve a different LoRA
* Prior works optimize the design of such systems but
  still require continuous loading and offloading of LoRAs,
  as it is infeasible to store thousands of LoRAs in GPU memory. To mitigate
* we investigate the efficacy of compression when serving LoRAs
  * We propose a method for the joint compression of LoRAs into a shared basis
    paired with LoRA-specific scaling matrices. We extend our algorithm to
  * learn clusters of LoRAs that are amenable to joint compression, allowing it
    ~> scale gracefully to large LoRA collections. Our
* experiments with up to 1000 LoRAs demonstrate that
  compressed LoRAs preserve performance while offering major throughput gains in
  realistic serving scenarios with > 1000 LoRAs,
  maintaining 80% of the throughput of serving a single LoRA

# 1 Intro

* large collections of LoRA adapters at scale
  * Proprietary and open-source LLM providers offer fine-tuning services
    (OpenAI, 2024; TogetherAI, 2024; Predibase, 2024) with
    * user bases likely in the Ks--100Ks
    * each user wants to use their own finetuned version of the LLM, serving a
      dedicated fine-tuned LLM per user becomes infeasible. To this end,
  * S-LoRA (Sheng+ 2023): a system where only the base LLM is placed on an
    inference server and
    individual LoRA adapters are switched as needed at inference time. S-LoRA
    * custom CUDA kernels and memory management to increase throughput when
      serving multiple LoRAs
  * Multi-LoRA system design has also been adopted in vLLM (Kwon+ 2023), a
    SOTA LLM serving engine. Despite optimized system designs, serving LoRAs
  * still fundamental limitation:
    when the number of adapters is large, they need to be constantly loaded
    and offloaded from GPU memory to accommodate incoming requests, degrading
    throughput
* other use cases of accommodating multiple LoRA adapters is also apparent when
  * LLMs on edge devices, where smaller LLMs are fine-tuned for various tasks,
    and the adapters are swapped depending on the task at hand (Gunter+ 2024)
  * the number of adapters is smaller, e.g., a few dozen (Gunter+ 2024),
    hE the memory constraints are also more stringent
* In this work, we consider the problem of compressing a collection of LoRAs. We
  * two key objectives:
    * preserving the performance of the original LoRAs and
    * improving the throughput of serving many LoRAs. We formulate LoRA
  * a reconstruction problem, where the goal is to
    approximate the original adapters via collections of smaller matrices
  * We compress LoRAs jointly by finding a shared basis and LoRA-specific
    scaling matrices and propose a joint diagonalization-based algorithm (JD)
  * a clustering approach where each cluster is compressed independently using
    the joint diagonalization algorithm
    * based on alternating between optimizing the cluster assignments and the
      per-cluster reconstruction error
* Fig 1: the benefits of joint compression
  * When serving up to 64 unique LoRAs, we use JD without clustering and
  * for 128 or more, we pick the number of clusters to match the performance of
    compressed and original LoRAs. In each case,
  * the GPU memory footprint of the compressed and original LoRAs is matched for
    a fair comparison to vLLM’s multi-LoRA inference engine
  * When serving over 1000 LoRAs, compression increases throughput 1.6× and
    maintains 80% of the throughput of serving the base LLM (or a single LoRA
    merged into the LLM)
    §6 presents detailed results
* contributions below:
  * Compression. We formulate the problem of compressing a collection of LoRAs
    and propose a joint compression scheme based on joint diagonalization
  * Clustering. For large numbers of LoRAs, we scale joint compression by
    proposing a clustering algorithm where each cluster is jointly compressed to
    minimize reconstruction error
  * theoretical guarantees for the reconstruction error of our compression
    * we relate reconstruction loss to performance empirically
  * We train a collection of more than 1000 high-quality LoRAs for
    Mistral-7B-Instruct-v0.2 (Jiang+ 2023a)
    on 1000 natural instruction tasks (Wang+ 2022) and demonstrate that
    our compression techniques preserve the performance of the original LoRAs
    * We will release over a 1000 LoRAs to facilitate future work and the code
  * We incorporate LoRA compression into a SOTA LLM serving system and
    demonstrate that it is possible to serve over 1000 LoRAs across thousands of
    asynchronous requests with throughput comparable to serving a single LoRA

# 5. Training & Performance Evaluation
Our analysis illustrates the tradeoffs of joint diagonaliza-
tion. If the LoRAs are similar or well-clustered, reconstruc-
tion error will be low. On the other hand, if the LoRAs are
random and orthogonal, reconstruction error will be high.

## 5.1. Training

* Table 3: List of all 1000 Tasks (page 23)
  * emo classify emotion of dialogue
  * emo different dialogue emotions
  * emotion classification
  * storycommonsense emotion text generation
  * twitter emotion classification
  * goemotions classification
  * sarcasmdetection headline classification
  * sarcasmdetection tweet classification

* We trained LoRA adapters on 1000 natural instruction tasks (Wang+ 2022) using
  Mistral-7B-Instruct-v0.2 (Jiang+ 2023a) as the base. We set all 
  * LoRA adapter ranks to 16 (i.e., ∀i, r i = 16), except for those in our
    ablation study (Appendix H.1), where we vary the LoRA rank.
* We selected 10 diverse tasks (Table 2 in Appendix C) manually 
  for consistent evaluation across experiments and 
  randomly sampled an additional 990 tasks, resulting in a total of 1000 tasks
  (Table 3). 
  * The tasks went through a robust reviewing protocol
    to ensure high quality and diversity.
  * Each task data was divided into training, validation, and test sets.
* Hyperparameters, such as early stopping, were tuned using the validation sets.
  * Table 1, Appendix C shows that on the test sets, LoRA consistently
    outperformed the base model in terms of Rouge scores and loss metrics.

# 7 Discussion

* future research directions. First, 
  * further compression may be possible via quantization, since
    joint-diagonalization and quantization are independent compression
  * when scaling to hundreds of thousands of LoRAs, joint compression, while
    effective, will be insufficient to fit all LoRAs onto the GPU, thus
    requiring a procedure to schedule the requests.
    * Clustering offers opportunities for efficient scheduling that incorporates
      the cluster assignments of LoRAs corresponding to the incoming requests.  
  * Privacy presents another research direction, particularly regarding the
    * information leakage during joint compression. As a preliminary study,
    * Appendix H.2 investigates whether a base model with an adapter A for task
      T A , after being jointly compressed alongside an adapter B for task T B ,
      inadvertently improves on T B . Such an outcome 
      * improvement would indicate that adapter A acquired information from B
        adapter B. 
      * Our ablation study shows no performance gains on T B , suggesting that
        ie the compressed adapter A remains independent and does 
        not leak—or gain—information from adapter B.
    * A more detailed investigation of the privacy properties of joint
      compression is an interesting next step.  

# C. Training LoRAs

* We trained LoRA adapters on 500 natural instruction tasks (Wang+ 2022) using
  Mistral-7B-Instruct-v0.2 (Jiang+ 2023a) as the base model. All 
* LoRA adapters were configured with a rank of 16, ie ∀i, r i = 16. We
* 10 diverse tasks selected manually for consistent evaluation across
  experiments and 
* randomly sampled an additional 490 tasks, resulting in a total of 500 tasks.
* exclusively in English (both input and output), ensuring higher quality and
  thorough review (Wang+ 2022). 
* Each task dataset was divided into training, validation, and test sets
  (80-10-10).
* Hyperparameters, such as early stopping, were tuned using the validation sets;
  ie, we train for five epochs and take the best-performing epoch-checkpoint per
  validation loss. Evaluation on the test sets demonstrated that 
* LoRA consistently outperformed the base model in terms of both Rouge scores
  and loss metrics (see Table 1).
* Tab 1, we compare metrics between base model and LoRA finetuning.

