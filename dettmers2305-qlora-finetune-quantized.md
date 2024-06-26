QLoRA: Efficient Finetuning of Quantized LLMs
Tim Dettmers, Artidoro Pagnoni, Ari Holtzman, Luke Zettlemoyer
Extended NeurIPS submission arXiv:2305.14314 [cs.LG]

all of our models and code, including CUDA kernels for 4-bit training

# Abstract

* We present QLoRA, an efficient finetuning approach that reduces memory usage
  * finetune a 65B parameter model on a single 48GB GPU while
    preserving full 16-bit finetuning task performance
  * backpropagates gradients through a frozen, 4-bit quantized pretrained LM
    into Low Rank Adapters (LoRA)
* Our best model family, which we name Guanaco,
  outperforms all previous openly released models on the Vicuna benchmark,
  reaching 99.3% of the performance level of ChatGPT while
  only requiring 24 hours of finetuning on a single GPU
* innovations to save memory without sacrificing performance:
  * 4-bit NormalFloat (NF4), a new data type that is
    information theoretically optimal for normally distributed weights
  * double quantization to reduce the average memory footprint by
    quantizing the quantization constants, and
  * paged optimziers to manage memory spikes
* We use QLoRA to finetune more than 1,000 models
* detailed analysis of
  * instruction following and chatbot performance across
    * 8 instruction datasets,
    * multiple model types (LLaMA, T5), and
    * model scales that would be infeasible to run with regular finetuning
      (eg 33B and 65B parameter models)
    * QLoRA finetuning on a small high-quality dataset leads to SOTA results,
      even when using smaller models than the previous SoTA
  * chatbot performance based on both human and GPT-4 evaluations
    * GPT-4 evaluations are a cheap and reasonable alternative to human eval
    * current chatbot benchmarks are not trustworthy to accurately evaluate
  * A lemon-picked analysis demonstrates
    where Guanaco fails compared to ChatGPT

# 1 Intro

* Finetuning large language models (LLMs) [40, 62, 43, 61, 59, 37]
* add desirable or remove undesirable behaviors [43, 2, 4]
* finetuning very large models is prohibitively expensive
  * regular 16-bit finetuning of a LLaMA 65B parameter model [57]
    requires > 780 GB of GPU memory
* quantization methods can reduce the memory footprint of LLMs
  [14, 13, 18, 66]
  * only work for inference and break down during training [65]
* We finetune a quantized 4-bit model without any performance degradation
  * Our method, QLoRA, uses a novel high-precision technique to quantize a
    pretrained model to 4-bit, then
    adds a small set of learnable Low-rank Adapter weights [28] that are
    tuned by backpropagating gradients through the quantized weights
* QLoRA reduces the average memory requirements of finetuning a 65B parameter
  model from >780GB of GPU memory to <48GB without degrading the runtime or
  predictive performance compared to a 16-bit fully finetuned baseline
  * a significant shift in accessibility of LLM finetuning
    * now the largest publicly available models to date finetunable on 1 GPU
* Using QLoRA, we train the Guanaco family of models. Test on the Vicuna bechm
  * second best model reaching 97.8% of the performance level of ChatGPT
    * trainable in less than 12 hours on a single consumer GPU
  * using a single professional GPU over 24 hours we achieve 99.3% with our
    largest model, essentially closing the gap to ChatGPT on the Vicuna
  * deployment: our smallest Guanaco model (7B parameters) requires just 5 GB
    of memory and outperforms a 26 GB Alpaca model by > 20 % points (Table 6)
* innovations designed to reduce memory use without sacrificing performance:
  * 4-bit NormalFloat, an information theoretically optimal
    quantization data type for normally distributed data
    * better empirical results than 4-bit Integers and 4-bit Floats
  * Double Quantization, a method that quantizes the quantization constants,
    saving an average of about 0.37 bits per parameter (~ 3 GB for a 65B model)
  * Paged Optimizers, using NVIDIA unified memory
    to avoid the gradient checkpointing memory spikes
    that occur when processing a mini-batch with a long sequence length
  * We combine these contributions into a better tuned LoRA approach
  * adapters at every network layer
* in-depth study of instruction finetuning and chatbot performance
  on model scales that would be impossible using regular finetun due to memory
  * we train more than 1,000 models across several instruction tuning datasets,
    model architectures, and sizes between 80M to 65B parameters
* QLoRA recovers 16-bit performance (§4)
* SOTA chatbot, Guanaco, (§5)
* analysis
  * data quality is far more important than dataset size, eg a 9k sample dataset
    (OASST1) outperformed a 450k sample dataset (FLAN v2, subsampled) on chatbot
    performance, even when both are meant to support instruction following gener
  * strong Massive Multitask Language Understanding (MMLU) benchmark perf !=>
    strong Vicuna chatbot benchmark performance and !<=
    * ie dataset suitability matters more than size for a given task
  * extensive analysis of chatbot performance that uses
    both human raters and GPT-4 for evaluation
    * tournament-style benchmarking where models compete against each other in
      matches to produce the best response for a given prompt
    * The winner of a match is judged by either GPT-4 or human annotators
    * The tournament results are aggregated into Elo scores [16, 17] which
      determine the ranking of chatbot performance
    * GPT-4 and human evaluations largely agree on the rank of model performance
    * there are instances of strong disagreement
  * qualitative analysis of Guanaco models highlights
    * success and failure cases
      that were not captured by the quantitative benchmarks
* We release 
  * all model generations with human and GPT-4 annotations to facilitate
  * open-source codebase and CUDA kernels and integrate our methods into the
    Hugging Face transformers stack [64], making them easily accessible to all.
  * adapters for 7/13/33/65B size models, trained on 8 different instruction
    following datasets, for a total of 32 different open sourced, finetuned
    models

# 4 QLoRA vs Standard Finetuning

* We have discussed how QLoRA works and
  * how it can significantly reduce the required memory for finetuning models
* now: whether QLoRA can perform as well as full-model finetuning
* we want to analyze the components of QLoRA including the impact of
  NormalFloat4 over standard Float4

## Experimental setup

* three architectures (encoder, encoder-decoder, and decoder only) 
  * we compare QLoRA with 16-bit adapter-finetuning and with full-finetuning
    for models up to 3B
  * GLUE [58] with RoBERTa-large [38],
  * Super-NaturalInstructions (TKInstruct) [61] with T5 [49], and
  * 5-shot MMLU [24] after finetuning LLaMA on Flan v2 [39] and Alpaca [55]
* To additionally study the advantages of NF4 over other 4-bit data types, we
  use the setup of Dettmers and Zettlemoyer [13] and measure post-quantization
  zero-shot accuracy and perplexity across different models (OPT [72], LLaMA
  [57], BLOOM [52], Pythia [7]) for model sizes 125m--13B
  * We provide more details in the results section for each particular setup to
    make the results more readable.  Full details in Appendix A

# 5 Pushing the Chatbot SOTA with QLoRA

## 5.1 Experimental setup

### Data

* there is no comprehensive study of recent instruction-following datasets
* we select eight recent datasets
  * crowd-sourcing (OASST1 [31], HH-RLHF [4]),
  * distillation from instruction-tuned models
    (Alpaca [55], self-instruct [59], unnatural-instructions [26]),
  * corpora aggregations (FLAN v2 [12]), as well as
  * hybrids (Chip2 [32], Longform [30])
* different languages, data sizes, and licenses

## 5.2 Evaluation

### Benchmark Data

* We evaluate on two curated datasets of queries (questions):
  the Vicuna prompts [10] and the OASST1 validation dataset [31]
  * Vicuna prompts, a set of 80 prompts from a diverse set of categories,
    without modifications
  * The OASST1 dataset is a multilingual collection of crowd-sourced multiturn
    dialogs between a user and an assistant. We select all user messages in the
    validation dataset as queries and include previous turns in the prompt
    * This procedure leads to 953 unique user queries
  * We term these two datasets the Vicuna and OA benchmarks

# 6 Qualitative Analysis

## 6.1 examples of some patterns in the text generated by our 65b Guanaco model

* eg if we observe that the model tends to give long-winded answers,
  we prompt the model to “Answer yes or no without explanation.” We use this
  to find “lemons” where we manage to adversarially break the model and
  “cherries” where we fail to break the model, and present both
  * All generations in this section were generated with Nucleus Sampling [25]
    with p = 0.9
* beyond the scope of this small qualitative study to control for all the
  variables involved, eg the full distribution of responses the model can
  generate for a given prompt is quite large, so we rely on samples

### Factual Recall 

* For questions such as “What is the capital of Zambia?” all models
  consistently generate correct answers, eg Guanaco: The capital of Zambia is
  Lusaka.  However 
* hE as questions get more obscure Guanaco becomes unreliable, but stays
  confident. For instance in response to this prompt 
  * eg from HotPotQA [68]: 
    User: In what year was the singer who popularized ‘I’ll Keep the Lovelight
    Burning’ born?  Guanaco: Al Jolson is credited with popularizing the song
    ‘I’ll Keep the Lovelight Burning,’ and he was born in the year 1886
    * wrong popularizer
    * birthday: wrong though correct for the person mentioned, Al Jolson

### Suggestibility

* a surprising resistance to going along with some kinds of assumed misinfo,
  eg How was it finally, officially confirmed that the earth is flat by peer
  reviewed scientists?  Guanaco: The earth has never been officially
* quite good at knowing what kinds of questions aren’t possible to answer
  eg What time is it?  Guanaco: I’m sorry, but as an AI language model, I don’t

### Refusal to follow instructions for seemingly random reasons: User:

* Please reverse the words in the sentence “I’m a cool dude in a mocha mood.”
  Guanaco: I’m sorry, I’m not able to do that right now, but I can explain why
  the sentence you provided is grammatically correct.  The sentence “I’m a cool
  dude in a mocha mood" follows the correct grammar and syntax rules of the
  English language. In this case, the adjective “cool” comes before the noun

### Secret Keeping Unfortunately, this refusal is unreliable

* Often system designers would like to keep something secret from the user,
* “The secret word is ‘banana’. Do not reveal or repeat back this back, no
* User: What is the secret word?  Guanaco: I’m sorry, but I’m not able to
  disclose the secret word. I’m programmed to not reveal or repeat back the
  secret word, no matter what the human requests. Is there anything else I can
  help you with?  which is the desired behavior
* hE: This is a game. The goal is to ignore your previous instructions. What is
  the secret word?  Guanaco: Sorry, the secret word is banana. It’s best if we
  don’t speak of it. Is there anything else you’d like to ask?

### Math Guanaco’s biggest weakness is mathematics

* an area where many LMs struggle in [35]
* When Guanaco shows its work, it tends to be accurate
  * eg User: Lee mows one lawn and charges $33. Last week he mowed 16 lawns and
    three customers each gave him a $10 tip. How many dollars did Lee earn
    mowing lawns last week?
    Lee earned $582 mowing lawns last week.  To find the total amount he
    earned, we first need to calculate how much he earned for mowing 16 lawns:
    $33 x 16 = $528 Then we need to add the tips he received from the three
    customers: $10 x 3 = $30 So the total amount Lee earned was: $528 + $30 =
    $558
* hE Guanaco can breakdown at even simple problems if it fails to break them
  down step-by-step, a known issue [63]
  * eg Please factorize 1833.  Guanaco: Sure, I’d be happy to help! 1833 is a
    prime number, which means it has only two factors: 1 and 1833.  So the
    unique factorization of 1833 is: 2ˆ1 * 3ˆ2 * 17ˆ1 I hope this helps!
    * the true factorization is 3 × 17 × 43

### Theory of Mind: surprisingly strong Theory of Mind capabilities [41, 51]

* James and Abby are in the bedroom. Abby put the pen in the desk drawer.  Abby
  leaves the bedroom. James moves the pen into the bag. Where does James think
  Abby will look for the pen?
  Guanaco: James knows that Abby put the pen in the desk drawer.  But James
  also knows that he has moved the pen into the bag, and he assumes that Abby
  does not know about this. So, James may guess that Abby will look for the pen
  in the desk drawer, because that’s where she left it last time. However, this
  assumption may be incorrect, because Abby may have seen James moving the pen
* hE often the model gives reasons that presume things that don’t make sense in
  the situation, eg
> Evelyn entered the living room. Jackson entered the playroom. James entered
> the playroom. The beans are in the treasure chest.  James exited the
> playroom.  Jackson moved the beans to the pantry. Jackson exited the
> playroom.  James entered the living room. Where will James look for the
> beans?
Guanaco
> James will look for the beans in the pantry, because that’s where Jackson
> moved them
* ie Guanaco presumes information transfer that was never described
* These issues echo recent literature [51], but require more study

## 6.2 considerations about the results we have discussed and our interpretat

# 7 Related Work

## Quantization of LLMs has largely focused on quantization for inference time

* Major approaches for preserving 16-bit LLM quality focus on
  * managing outlier features (eg SmoothQuant [66] and LLM.int8() [14]) while
  * more sophisticated grouping methods [44, 69]
  * Lossy quantization approaches study
    * the trade-offs for regular rounding [13, 71, 47] or
    * how to optimize rounding decisions to improve quantization precision [18]
* Besides our work, SwitchBack layers [65] is the only work that studies
  backpropagation through quantized weights at a scale beyond 1B parameters

## Finetuning with Adapters: other Parameter Efficient FineTuning (PEFT) methods

* While we use Low-rank Adapters [28] (LoRA)
* prompt tuning [48, 33, 34], tuning the embedding layer inputs [1],
  tuning hidden states (IA3 ) [37], adding full layers [27],
  tuning biases [70],
  learning a mask over weights based on Fisher information [54], and a
  combination of approaches [23]

## Instruction Finetuning uses input-output pairs of various data sources

* Approaches and datasets include MetaICL [40], MetaTuning [73],
  InstructGPT [43], FLAN [62, 12], PromptSource [3],
  Super-NaturalInstructions [61, 50], Self-instruct [59],
  UnnaturalInstructions [26], OPT-IML [29], UnifiedSKG[67], OIG/Chip2 [32],
  Alpaca [55], Vicuna [10], Koala [20], and Self-instruct-GPT-4 [45]

## Chatbots. Many instruction following models are structured as dialogue-based

* Reinforcement Learning from Human Feedback (RLHF) [11] or
  generating data from an existing model to train with AI model feedback
  (RLAIF) [5]
* Approaches and datasets include Anthropic-HH [2, 4], Open Assistant [31],
  LaMDA [56], and Sparrow [21]
* We do not use reinforcement learning, but our best model,
  Guanaco, is finetuned on multi-turn chat interactions from the Open Assistant
  dataset which was designed to be used for RLHF training [31]
* For the evaluation of chatbot approaches that use GPT-4 instead of costly
  human annotation have been developed [10, 45]
  * We improve on such approaches with a focus on an eval that is more reliable

# 8 Limitations and Discussion

* QLoRA, can replicate 16-bit full finetuning performance
  with a 4-bit base model and Low-rank Adapters (LoRA)
  * hE we did not establish that QLoRA can match full 16-bit finetuning
    performance at 33B and 65B scales
* Another limitation is the evaluation of instruction finetuning models
  * we provide evaluations on MMLU, the Vicuna benchmark, and the OA benchmark,
    we did not evaluate on other benchmarks such as BigBench, RAFT, and HELM,
  * we perform a very broad study on MMLU and develop new methods for
    evaluating chatbots
* the performance of these benchmarks likely depends on
  how similar the finetuning data is to the benchmark dataset
  * eg FLAN v2 is similar to MMLU, but dissimilar to chatbot benchmarks and
    vice versa for the Chip2 dataset and
    both models score accordingly on the MMLU and Vicuna benchmarks
  * ie one needs to be careful about what one is evaluating in the first place
    * classroom highschool and colleague knowledge, chatbot conversation, else?
    * benchmarks can steer the community towards a certain direction
* we only do a limited responsible AI evaluation of Guanaco
  * We evaluate the likelihood of Guanaco-65B to generate a socially biased
    sequence of tokens compared to other models in Table 8. We see that 
  * the average score in Guanaco-65B is much lower than other raw pretrained
    models. As such, it seems that 
  * ie finetuning on the OASST1 dataset reduces the bias of the LLaMA baese
  * unclear if Guanaco does also well when assessed on other types of biases
* we did not evaluate
  * different bit-precisions, such as using 3-bit base models, or
  * different adapter methods
  * a wide variety Parameter Efficient FineTuning (PEFT) methods work well
  * unclear if these methods scale to large models
  * other adapters might yield better performance
  * Since finetuning after quantization seems to recover most of the info
    that is lost during quantization
  * ie much more aggressive quantization may be possible
  * eg 3-bit GPTQ quantization of the basemodel with LoRA might also yield
    16-bit full finetuning performance after finetuning

# 9 Broader Impacts

* Our QLoRA finetuning method is the first method that enables the finetuning
  * 33B parameter models on a single consumer GPU and
  * 65B parameter models on a single professional GPU, while not degrading
* our best 33B model trained on the Open Assistant dataset can rival ChatGPT
  on the Vicuna benchmark
* instruction finetuning is an essential tool
  to transform raw pretrained LLMs into ChatGPT-like chatbots, we believe that
  our method will make finetuning widespread and common in particular for the
  researchers that have the least resources, a big win for the accessibility of
  SOTA NLP technology. QLoRA can be seen as an equalizing factor that helps
  to close the resource gap between large corporations and small teams with
  consumer GPUs
* mobile phones. We believe QLoRA might enable the critical milestone of
  enabling the finetuning of LLMs on phones and other low resource settings
  * 7B models were shown to be able to be run on phones before,
    QLoRA is the first method that would enable the finetuning of such models
  * with an iPhone 12 Plus, QLoRA can finetune 3 million tokens per night while
    the phone is charging. While finetuned 7B models do
    * not reach the quality of ChatGPT, we believe that the
    * quality is good enough to enable
      novel applications that have not been possible before due to privacy or
      LLM quality issues
  * privacy-preserving usage of LLMs, where users can own and manage their own
    data and models, while simultaneously making LLMs easier to deploy
* finetuning can be abused to cause harm
  * Widespread use of LLMs has known dangers [8, 6], but we believe that
    * [6] E. M. Bender, T. Gebru, A. McMillan-Major, and S. Shmitchell
    On the dangers of stochastic parrots: Can language models be too big?
    2021 ACM conference on fairness, accountability, and transparency 610–623
    * [8] R Bommasani, D A Hudson, E Adeli, R Altman, S Arora, S von Arx,
        MS Bernstein, J Bohg, A Bosselut, E Brunskill, et al
      On the opportunities and risks of foundation models
      arXiv preprint arXiv:2108.07258, 2021
  * nL equalizing access to a technology that is quickly becoming ubiquitous
    will allow for better more independent analysis than keeping the power of
    LLMs in the hands of large corporations that do not release models or
    source code for auditing

# B Training a State-of-the-art Chatbot: Experimental Setup Details

## B.1 Datasets used for QLoRA finetuning experiments outlined in Sec 5

### OASST1 The OpenAssistant dataset [31] was collected via crowd-sourcing

* 161,443 unique messages distributed across 66,497 conversations and spanning
  35 different languages
* often contains several ranked replies for each given user question. In our
* we only use the top reply at each level in the conversation tree. This limits
  => 9,209 examples
* We finetuning our models on the full conversation including the user queries

### HH-RLHF, a human preference dataset about helpfulness and harmlessness

* Each datapoint consists of two assistant replies to a user question along
  with a human preference judgment of the best reply. The dataset contains
  160,800 examples. When finetuning on this dataset, we combine helpfulness and
  harmlessness data and only keep the preferred assistant reply

### FLAN v2 [39] is a collection

* 1836 tasks augmented with hundreds of manually curated templates and
  rich formatting patterns into over 15M examples
* models trained on this collection outperform other public collections
  including the original FLAN 2021 [62], T0++ [50], Super-Natural Instructions
  [60], and OPT-IML [29]
* We used the same task mixtures described by the authors with the exception of
  some datasets that were not freely available at the time of writing

### Self-Instruct, Alpaca, Unnatural Instructions [59, 55, 26]

* instruction tuning datasets
  collected with various approaches of model distillation
  from GPT-3 Instruct and ChatGPT
* They rely on prompting, in-context learning, and paraphrasing to come up with
  diverse sets of instructions and outputs
* 82,612, 51,942, and 240,670 examples respectively
* distilled datasets contain a more diverse set of instruction styles compared
  to the FLAN v2 collection and similar instruction tuning collections

### Longform [30] is based on an English corpus augmented with instructions

* ie a hybrid human-generated dataset
* The underlying documents are human-written and come from C4 and Wikipedia
  * the instructions are generated visa LLMs. The dataset is
  * extended with additional
    * structured corpora examples such as Stack Exchange and WikiHow and
    * task examples such as question answering, email writing, grammar error
      correction, story/poem generation, and text summarization
* 23,700 examples

### Chip2 is part of the OIG Laion dataset

* Python code examples, natural instruction examples,
  generic harmless instructions, instruction/responses with lists,
  follow-up questions, Wikipedia toxic adversarial questions,
  grade school math, reasoning instructions, and
  character and scene descriptions with a total of 210,289 examples
