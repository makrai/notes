LLaMA: Open and Efficient Foundation Language Models
H Touvron, T Lavril, G Izacard, X Martinet, M-A Lachaux, T Lacroix, B Rozière,
  N Goyal, E Hambro, F Azhar, A Rodriguez, A Joulin, E Grave, G Lample
arXiv:2302.13971 [cs.CL]

# Abstract

* We introduce LLaMA, a collection of foundation LMs, 7B to 65B parameters
  * trained on trillions of tokens, publicly available datasets exclusively
  * LLaMA-13B outperforms GPT-3 (175B) on most benchmarks, and
    * while being more than 10× smaller
  * LLaMA-65B is competitive with the best models, Chinchilla-70B and
    PaLM-540B
* from the conclusion
  * finetuning these models on instructions lead to promising results, and we
    * like Chung+ (2022)
  * future
    * finetuning on instructions
    * larger models trained on larger pretraining corpora in the future, since we
      have seen a constant improvement in performance as we were scaling

# 1 Intro

* Large Languages Models (LLMs) trained on massive corpora of texts have
  * perform new tasks from textual instructions or from a few examples (Brown+)
  * [just] when scaling models to a sufficient size (Kaplan+, 2020), resulting
    => a line of work that focuses on further scaling these models
    (Chowdhery+, 2022; Rae+, 2021)
    * A Chowdhery, S Narang, J Devlin, M Bosma, G Mishra, A Roberts,+
      Palm: Scaling language modeling with pathways
      2022
      JW Rae, S Borgeaud, T Cai, K Millican, J Hoffmann, F Song,+
      Scaling language models
        Methods, analysis & insights from training gopher
      2021
  * assumption that more parameters will lead to better performance
* hE Hoffmann+ (2022) show that, for a given compute budget, the best
  performances are not achieved by the largest models, but by smaller models
  trained on more data
  * scaling laws from Hoffmann+ (2022) is to determine how to best scale the
    dataset and model sizes for a particular training compute budget. However,
  * hE disregards the inference budget, which becomes critical in LM serving
  * given a target level of performance, the preferred model is not the fastest
    to train but the fastest at inference, and although
  * it may be cheaper to train a large model to reach a certain level of
  * a smaller one trained longer will ultimately be cheaper at inference. For
  * Hoffmann+ (2022) recommends training a 10B model on 200B tokens,
  * we find that the performance of a 7B model continues to improve even after
    1T tokens
* we train a series of language models that achieve the best possible perf at
  various inference budgets, by training on more tokens than what is typical
  * LLaMA, ranges from 7B to 65B parameters with
    competitive performance compared to the best existing LLMs
  * LLaMA-13B outperforms GPT-3 on most benchmarks, despite being 10× smaller
  * can be run on a single GPU ~> help democratize the access of LLMs
* At the higher-end of the scale, our 65B-parameter model is also competitive
  with the best large language models such as Chinchilla or PaLM-540B
* only public data: Unlike Chinchilla, PaLM, or GPT-3, we only use publicly
  * most existing models rely on data which is either not publicly available or
    undocumented (eg “Books – 2TB” or “Social media conversations”). There
  * exceptions, notably OPT (Zhang+, 2022), GPT-NeoX (Black+, 2022), BLOOM
    (Scao +, 2022) and GLM (Zeng+, 2022), but
    * none that are competitive with PaLM-62B or Chinchilla

# 2 modifications we made to the transformer archit and our training method 2

* Our training approach is
  * similar to the methods described in previous work
    (Brown+, 2020; Chowdhery+, 2022), and is
  * inspired by the Chinchilla scaling laws (Hoffmann+, 2022)
* We train large transformers on a large quantity of textual data using a
  standard optimizer

## 2.1 Pre-training Data

### Tokenizer. We tokenize the data with the byte-pair encoding (Sennrich+ 15)

* using the implementation from Sentence-Piece (Kudo and Richardson, 2018)
  * Notably, we split all numbers into individual digits, and
  * fallback to bytes to decompose unknown UTF-8 characters
* Overall, our entire training dataset contains roughly 1.4T tokens
* For most of our training data, each token is used only once during
  * exception of the Wikipedia and Books domains, over which ~ 2 epochs

## 2.2 Architecture

* Following recent work on large language models, our network is based on the
  transformer architecture (Vaswani+, 2017). We leverage various improvements:

### Pre-normalization [GPT3]. To improve the training stability

* we normalize the input of each transformer sub-layer
  * instead of normalizing the output
  * We use the RMSNorm normalizing function (Zhang and Sennrich 2019)

### SwiGLU activation function [PaLM]. We replace the ReLU non-linearity

* SwiGLU activation function, introduced by Shazeer (2020) to improve the
* dimension of 2/3 4d instead of 4d as in PaLM

### Rotary Embeddings [GPTNeo]

* We remove the absolute positional embeddings, and instead,
* we add rotary positional embeddings (RoPE, Su+ 2021), at each layer
* The details of the hyper-parameters for our models are given in Table 2

## 2.3 Optimizer

* AdamW optimizer (Loshchilov & Hutter 2017), hyper-params: β1 = 0.9, β2 = 0.95
* cosine learning rate schedule, such that
  * the final learning rate is equal to 10% of the maximal learning rate. We
* weight decay of 0.1 and gradient clipping of 1.0. We use 2, 000 warmup steps,
* we vary the learning rate and batch size with the model size (see Tab 2)

## 2.4 Efficient implementation

* several optimizations to improve the training speed of our models. First,
* of the causal multi-head attention to reduce memory usage and runtime. This
  * implementation available in the xformers library,2
  * inspired by Rabe and Staats (2021) and uses the
  * backward from Dao+ (2022)
  * not storing the attention weights and not computing the key/query scores
    that are masked due to the causal nature of the language modeling task
* we reduced the amount of activations that are recomputed during the
  backward pass with checkpointing
  * we save the activations that are expensive to compute, such as the
    outputs of linear layers. This
  * achieved by manually implementing the backward function for the layers,
    instead of relying on the PyTorch autograd
* reduce the memory usage of the model by using
  model and sequence parallelism, as described by Korthikanti+ (2022)
* we also overlap the computation of activations and the communication between
  GPUs over the network (due to all_reduce operations) as much as possible
* When training a 65B-parameter model, our code processes around 380
  tokens/sec/GPU on 2048 A100 GPU with 80GB of RAM. This means that
  * training over our dataset containing 1.4T tokens takes ~ 21 days

# 3 performance of our models and compare with others LLMs on stand benchmarks

* Following previous work (Brown+ 2020), we consider zero-shot and few-shot
  * 20 benchmarks
  * Zero-shot. We provide a textual description of the task and a test example
    * The model either provides an answer using open-ended generation,
      or ranks the proposed answers
  * Few-shot
    * We provide a few examples of the task (between 1 and 64) and a test exa
    * The model takes this text as input and
      generates the answer or ranks different options
* We compare LLaMA with other foundation models, namely the
  * non-publicly available language models GPT-3 (Brown+ 2020),
    Gopher (Rae+ 2021), Chinchilla (Hoffmann+ 2022) and PaLM (Chowdhery+ 2022),
  * open-sourced OPT models (Zhang+ 2022), GPT-J (Wang and Komatsuzaki, 2021),
    and GPTNeo (Black+ 2022)
  * In Section 4, we also briefly compare LLaMA with instruction-tuned models
    eg OPT-IML (Iyer+ 2022) and Flan-PaLM (Chung+ 2022)
* free-form generation tasks and multiple choice tasks. In the
  * multiple choice tasks, the objective is to select the most appropriate
    completion among a set of given options, based on a provided context
  * likelihood normalized by what
    * We select the completion with the highest likelihood given the provided
      context
    * likelihood normalized by the number of characters in the completion,
      * We follow Gao+ (2021) and
    * except for certain datasets (OpenBookQA, BoolQ), for which
      * we follow Brown+ (2020), and select a completion based on the
        likelihood normalized by the likelihood of the completion given
        “Answer:” as context: `P (completion|context)/P (completion|“Answer:”)`

## 3.1 Common Sense Reasoning

* eight standard common sense reasoning benchmarks: BoolQ (Clark+ 2019),
  PIQA (Bisk+ 2020), SIQA (Sap+ 2019), HellaSwag (Zellers+ 2019),
  WinoGrande (Sakaguchi+ 2021), ARC easy and challenge (Clark+ 2018) and
  OpenBookQA (Mihaylov+ 2018)
* These datasets include Cloze and Winograd style tasks, as well as multiple
  choice question answering. We
* zero-shot setting as done in the language modeling community
* In Table 3, we compare with existing models of various sizes and report
  numbers from the corresponding papers
  * LLaMA-65B outperforms
    * Chinchilla-70B on all but BoolQ. Similarly,
    * PaLM540B everywhere but on BoolQ and WinoGrande
  * LLaMA-13B model also outperforms GPT-3 on most benchmarks
    despite being 10× smaller

## 3.2 Closed-book Question Answering 5

* two closed-book question answering benchmarks
  * Natural Questions (Kwiatkowski+ 2019) and TriviaQA (Joshi+ 2017)
* we report exact match performance in a closed book setting,
  * ie where the models do not have access to documents that contain evidence
* In Table 4/5, we report performance on NaturalQuestions/TriviaQA
  * On both benchmarks, LLaMA-65B achieve SOTAs performance
    in the zero-shot and few-shot settings. More importantly, the
  * LLaMA-13B is also competitive on these benchmarks with GPT-3 and
    Chinchilla, despite being 5-10× smaller.  This model runs on a single V100
    GPU during inference

## 3.3 Reading Comprehension

* RACE reading comprehension benchmark (Lai+ 2017). This dataset was
  * collected from English reading comprehension exams designed for middle and
    high school Chinese students
* evaluation setup from Brown+ (2020) and report results in Table 6. On these
* LLaMA-65B is competitive with PaLM-540B
* LLaMA-13B outperforms GPT-3 by a few percents

## 3.4 Mathematical reasoning

* We evaluate our models on two mathematical reasoning benchmarks:
  * MATH (Hendrycks+ 2021): 12K middle school and high school math problems
    written in LaTeX
  * GSM8k (Cobbe+ 2021) a set of middle school mathematical problems. MATH is
* In Table 7, we compare with PaLM and Minerva (Lewkowycz+ 2022)
* Minerva is a series of PaLM models
  finetuned on 38.5B tokens extracted from ArXiv and Math Web Pages, while
  * neither PaLM or LLaMA are finetuned on mathematical data
* The numbers for PaLM and Minerva are taken from Lewkowycz+ (2022), and we
  * with and without maj1@k (evaluations where we generate k samples for each
    problem and perform a majority voting, Wang+ 2022)
* On GSM8k, we observe that LLaMA65B outperforms Minerva-62B, although it has

## 3.5 Code generation

* write code from a natural language description on
* two benchmarks: HumanEval (Chen+ 2021) and MBPP (Austin+ 2021)
* input
  * a description of the program in a few sentences + a few input-output exampl
  * In HumanEval, it also receives a function signature, and
    the prompt is formatted as natural code with the textual description and
    tests in a docstring
  * The model needs to generate a Python program that
    fits the description and satisfies the test cases
* Tab 8 compares the pass@1 scores of our models with PaLM and LaMDA
  (Thoppilan+ 2022)
  R Thoppilan, D De Freitas, J Hall, N Shazeer, A Kulshreshtha, H Cheng,+
  Lamda: Language models for dialog applications
  2022
* PaLM and LaMDA not finetuned on code
* PaLM and LLaMA were trained on datasets that contain a similar number of code
  tokens
* As show in Table 8
  * for a similar number of parameters, LLaMA outperforms other general models
    such as LaMDA and PaLM, which are not trained or finetuned spec for code
  * LLaMA with 13B parameters and more outperforms LaMDA 137B on both
    HumanEval and MBPP
  * LLaMA 65B also outperforms PaLM 62B, even when it is trained longer
* temperature
  * The pass@1 results were obtained by sampling with temperature 0.1. The
  * pass@100 and pass@80 metrics were obtained with temperature 0.8
  * We use the same method as Chen+ (2021) to obtain unbiased estims of pass@k
* improve the performance on code by finetuning on code-specific tokens. For
  * PaLM-Coder (Chowdhery+ 2022) increases the pass@1 score of PaLM on
    HumanEval from 26.2% for PaLM to 36%
  * Other code spec models (Chen+ 2021; Nijkamp+ 2022; Fried+ 2022)

## 3.6 Massive Multitask Language Understanding

* massive multitask language understanding benchmark, (MMLU, Hendrycks+ 2020)
  * multiple choice questions covering various domains of knowledge, includ-
    * humanities, STEM and social sciences. We evaluate our models in the
* 5-shot setting, using the examples provided by the benchmark, and report
* results in Table 9. On this benchmark, we observe that the
  * LLaMA-65B is behind both Chinchilla-70B and PaLM-540B by a few percent in
    average, and across most domains
    * A potential explanation is that we have used a limited amount of books
      and academic papers in our pre-training data,
      ie ArXiv, Gutenberg and Books3, that sums up to only 177GB, while these
      models were trained on up to 2TB of books. This large quantity of books
  * Gopher outperforms GPT-3 on this benchmark, while comparable on other ones

## 3.7 Evolution of performance during training

* we tracked the performance of our models on a few question answering and
  common sense benchmarks, and report them in Figure 2
* On most benchmarks, the performance improves steadily, and
  * correlates with the training perplexity of the model (see Figure 1). The
* exceptions are SIQA and WinoGrande. Most notably, on
  * SIQA, we observe a lot of variance in performance, that
    may indicate that this benchmark is not reliable. On
  * WinoGrande, the performance does not correlate as well with train perplex:
* the LLaMA-33B and LLaMA-65B have similar performance during the training

# 4 Instruction Finetuning

* briefly finetuning on instructions data rapidly leads to improvements on MMLU
* the non-finetuned version of LLaMA-65B is already able to follow basic in-
  structions, we observe that
* nL a very small amount of finetuning improves
  the performance on MMLU, and further improves the ability to follow instrus
* we only conducted a single experiment, protocol like Chung+ (2022)
  * simple
* In Table 10, we report the results of our instruct model LLaMA-I on MMLU and
* we compare with existing instruction finetuned models of moderate sizes,
  * OPT-IML (Iyer+ 2022) and the Flan-PaLM series (Chung+ 2022)
  * All the reported numbers are from the corresponding papers
* we reach 68.9% on MMLU
* LLaMA-I (65B) on MMLU
  * outperforms existing instruction finetuned models of moderate sizes, but
  * far from the SOTA, that is 77.4 for GPT code-davinci-002 on MMLU (numbers)
* details of the performance on MMLU on the 57 tasks: Table 16 of the appendix

# 5 Bias, Toxicity and Misinformation

* using some of the most recent benchmarks from the responsible AI community
* Large language models
  * reproduce and amplify biases from training data (Sheng+ 2019; Kurita+ 2019)
  * generate toxic or offensive content (Gehman+ 2020). As our training

## 5.1 RealToxicityPrompts: ~ 100k prompts

* a toxicity score is automatically evaluated by making a request to
  PerspectiveAPI 3
  * no control over the pipeline used by the third-party PerspectiveAPI, making
* For each of the 100k prompts, we greedily generate with our models, and
* In Table 11, we report our averaged score on basic and respectful prompts
* These scores are “comparable” with what we observe in the literature
  (eg 0.087 for Chinchilla) but
  * hE the methodologies differ between these work and ours
    (in terms of sampling strategy, number of prompts and time of API)
* toxicity increases with the size of the model
  * especially for Respectful prompts
  * This was also observed in previous work (Zhang+ 2022), with the
  * notable exception of Hoffmann+ (2022) where they do not see a
    * no difference between Chinchilla and Gopher, despite different sizes
    * could be explained by the fact that
      the larger model, Gopher, has worse performance than Chinchilla,
      suggesting that the relation between toxicity and model size may only
      apply within a model family

## 5.2 CrowS-Pairs (Nangia+ 2020). This dataset allows to measure biases in

* 9 categories: gender, religion, race/color, sexual orientation, age,
  nationality, disability, physical appearance and socioeconomic status
* Each example is composed of a stereotype and an anti-stereotype, we measure
  the model preference for the stereotypical sentence using the perplexity of
  * zero-shot setting
* We compare with GPT-3 and OPT-175B in Table 12
* LLaMA compares slightly favorably to both models on average
* Our model is particularly biased in the religion category (+10% compared to
  OPT-175B), followed by age and gender
  * We expect these biases to come from CommonCrawl despite filtering steps

## 5.3 WinoGender

* our model is significantly better at performing co-reference resolution for
  the “their/them/someone” pronouns than for the “her/her/she” and “his/him/he”
  * A similar observation was made in previous work (Rae+ 2021; Hoffmann+
    2022), and is likely indicative of gender bias
* To further investigate this hypothesis, we look at the set of “gotcha” cases
  * sentences in which the pronoun does not match the majority gender of the
    occupation, and the occupation is the correct answer. In Table 13, we
* LLaMA-65B, makes more errors on the gotcha examples, clearly showing that it
  * ie societal biases related to gender and occupation

## 5.4 TruthfulQA

* TruthfulQA (Lin+ 2021) aims to measure the truthfulness of a model, ie its
  ability to identify when a claim is true
  * Lin+ (2021) consider the definition of “true” in the sense of
    “literal truth about the real world”, and not claims that are only true in
    the context of a belief system or tradition
* The questions are written in diverse style, cover 38 categories and are
  designed to be adversarial
* In Table 14, we report the performance of our models on both questions to
  measure truthful models and the intersection of truthful and informative
* Compared to GPT-3, our model scores higher in both categories, but
  * hE the rate of correct answers is still low, showing that
    our model is likely to hallucinate incorrect answers

# 6 Carbon footprint 10

* The resulting carbon emission depends on the location of the data center used
  to train the network
  * BLOOM uses a grid that emits 0.057 kg CO2 eq/KWh leading to 27 tCO2 eq and
    OPT a grid that emits 0.231 kg CO2 eq/KWh, leading to 82 tCO2 eq. In this
* we are interested in comparing the cost in carbon emission of training of
  these models if they were trained in the same data center. Hence, we do not
  take the location of data center in consideration, and use, instead, the US
  national average carbon intensity factor of 0.385 kg CO2 eq/KWh. This leads

# 7 Related work
