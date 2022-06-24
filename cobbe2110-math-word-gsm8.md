Training Verifiers to Solve Math Word Problems
Karl Cobbe, Vineet Kosaraju, Mohammad Bavarian, Mark Chen, Heewoo Jun,
  L Kaiser, M Plappert, J Tworek, J Hilton, R Nakano, C Hesse, J Schulman
Cite as: 	arXiv:2110.14168 [cs.LG]

* SOTA language models can match human performance on many tasks, but they
  still struggle to robustly perform multi-step mathematical reasoning. To
* we introduce GSM8K, a dataset of
  8.5K high quality linguistically diverse grade school math word problems
* We find that even the largest transformer models fail to achieve high perf,
* To increase performance, we propose training
  verifiers to judge the correctness of model completions
  * At test time, we generate many candidate solutions and select the one
    ranked highest by the verifier
  * significantly improves performance on GSM8K, and we provide strong
  * scales more effectively with increased data than a finetuning baseline

# 1 Intro 

* Kaplan+ (2020) describe the consistent benefits of increasing model size,
  * scaling trends that hold across many orders of magnitude
  * hE, even the largest models falter in multi-step mathematical reasoning
    (Hendrycks+ 2021) 
  * high sensitivity to individual mistakes (Shen+ 2021a)
  * generation: autoregressive models have no mechanism to correct their errors
  * the MATH dataset (Hendrycks+ 2021): challenging distribution This evidence
* We propose training verifiers to
  evaluate the correctness of model generated solutions,
  * similar to concurrent work by Shen+ (2021a)
  * sample a fixed number of candidate solutions and
    select the solution ranked highest by the verifier
  * benefit both from their inherent optionality and from
    verification being a simpler task than generation in general.
* we are releasing GSM8K, a dataset of
  8.5K high quality problems at the grade school math level. We designed this
  * high linguistic diversity while
    relying on relatively simple grade school math concepts.
* SOTA language models struggle to achieve high performance on this dataset,
  primarily due to the high diversity among problems. At the same time, GSM8K
* contributions are as follows:
  1. curated dataset of 8.5K grade school math questions and natural language
     solutions, useful for probing the informal reasoning ability of large LMs
  2. verifiers compared to a finetuning
    * approximately the same performance boost as a 30x model size increase,
    * scale significantly better with increased data.
    * token-level verifiers are less prone to overfitting than solution-level
      verifiers
  3. dropout acts as a strong regularizer, significantly improving performance
     for both finetuning and verification.
    * all methods benefit from regularization with residual dropout
    * We expect verification to scale well to problem distributions that
      require more complex mathematical reasoning

# 3 Related Work

## 3.1 Related Datasets

* Early math word problem datasets (Kushman+ 2014; Roy and Roth, 2015) are
  * relatively small and are not well suited for testing modern LMs
* Dolphin18K (Huang+ 2016) is a larger dataset containing 318K problems, but
  solutions are provided only in the form of equations or final answers.
* AQuA-RAT (Ling+ 2017) contains 100K problems, but this dataset
  * hE high degree of problem templatization and poor quality control of the
    natural language solutions
* MathQA is a recently released subset of AQuA-RAT focused on correcting
  these mistakes (Amini+ 2019), but even the corrected dataset has
  * hE data quality issues, with around 30% of the data having
    inconsistencies (Miao+ 2021)
* Ape210K (Zhao+ 2020) is the largest publicly available dataset, consisting
  * 210K Chinese elementary school-level math problems. However, due to the
  * lack of natural language solutions, we’re unable to evaluate our methods
* ASDiv dataset (Miao+ 2021), which contains 2.3K math word problems,
  * addresses common flaws in prior datasets by ensuring problems have both
    high diversity and high quality
  * We share those design principles in the creation of GSM8K.  However, we
  * GSM8K is larger, provides natural language solutions, and consists of
    problems that on average require more steps to solve
* The MATH dataset (Hendrycks+ 2021) is
  larger and significantly more complex than GSM8K, but the
  high difficulty makes it challenging to accurately measure progress given the
  current capabilities of state-of-the-art language models.
* Other recent reasoning-related datasets have focused on
  * mathematical reasoning on symbolic math (Lample and Charton, 2019),
  * reading comprehension (LogiQA) (Liu+ 2020), and
    * Similar to LogiQA, which requires a mix of reading comprehension and
      logical reasoning, GSM8K’s main difficulty lies in both properly
      interpreting a question and reasoning through the steps to solve it
  * commonsense question answering (CommonsenseQA) (Talmor+ 2018)
    * Similar to CommonsenseQA, GSM8K includes questions that require basic
      background knowledge, like the number of days in a week.

## 3.2 Related Methods

* solve classic math word problem benchmarks
  with recurrent seq2seq models (Sutskever+ 2014) and closely related variants
  (Wang+ 2017; Huang+ 2018).
  * specialized encoder-decoder architectures (Amini+ 2019; Chiang and Chen,
    2018; Xie and Sun, 2019; Chen+ 2020; Li+ 2020), with the
  * strongest results often relying on large pretrained encoders from BERT fam
    (Chen+ 2019; Kim+ 2020; Liang+ 2021).
* recent work has recommended additional pretraining tasks to further improve
  the math reasoning skills of large transformer-based models.
  * Hendrycks+ (2021) propose pretraining models on a new AMPS corpus, derived
    from Khan Academy problems and Mathematica scripts. Similarly
  * Shen+ (2021b) propose a pretrained a corpus of pre-K to college level
    curricula extracted from the internet, and
  * Peng+ (2021) propose
    pretraining by predicting masked subexpressions from expression trees.
* Similar to verification, other methods have finetuned a language model to
  select among many model completions
  * Nichols+ (2020) proposed a sample-and-rank approach to improve the
    collaborative storytelling ability of large language models, with the
    training signal coming from the preferences of human workers
  * concurrent work closely related to our own, Shen+ (2021a) applied a similar
    approach to solving math word problems, jointly training a model to both
    generate and rank solutions
    * Our work shares many fundamental similarities with their approach, though
    * we differ in several key respects.
      * we focus attention on the space of natural language solutions, as
        this is a richer and more general solution format than pure math exps.
        * enables our models to develop verbal analytical skills and to produce
        * more readily interpretable by humans. 
      * we provide evidence that verifiers scale very favorably with data
      * we use separate generator and verifier networks,
        in order to prevent the generator from overfitting.

## 5.2 Regularization

* GPT-3 models are not pretrained with dropout
* For experiments involving dropout, we therefore perform additional
  pretraining with dropout before subsequently finetuning the models. This
  mitigates the distribution shift the model experiences during finetuning.
* We find that both finetuning and verification strongly benefit from the use
  of dropout as a regularizer
  * we apply residual dropout (Vaswani+ 2017) along the residual paths of each
    layer in the network. We use 20% dropout for all dropout experiments,
    chosen based on the results of a hyperparameters sweep
* the effect of dropout on
  * finetuning across various training set sizes.
    * Figure 8a shows that dropout leads to a significant improvement over
      baseline. We next investigate the effect of dropout on
  * verifiers, considering both the solution-level and token-level variants. In
    * solution: Figure 8b, we see that
      * dropout significantly improves solution-level verifiers,
        mitigating the overfitting that occurs in the unregularized baseline.
      * dropout with solutionlevel verifiers reaches a similar level of
        performance as token-level verifiers. In
    * token: Figure 8c, we apply dropout to token-level verifiers
      * token-level verifiers are already less susceptible to overfitting, it
        => the impact of dropout is less significant.
      * nL a slight gain from train- ing token-level verifiers with dropout.
      * we increase the batch size for token-level verifiers by a factor of 4,
        to better handle the more diffic objective and the noise from dropout
