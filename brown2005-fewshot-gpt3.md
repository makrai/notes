Language Models are Few-Shot Learners
Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan, Shyam, Sastry,
  Askell, Agarwal, Herbert-Voss, Krueger, Henighan, Child, Ramesh, M. Ziegler,
  Wu, Winter, Hesse, Chen, Sigler,
  Litwin, Gray, Chess, Clark, Berner, McCandlish, Radford, Sutskever, Amodei
arXiv:2005.14165 [cs.CL]

                                  here are two examples of people acting brave;
                                  please give a third example of bravery

# Abstract

* NLP tasks and benchmarks by
  * pre-training on a large corpus of text followed by
  * fine-tuning on a specific task. While typically
    * task-agnostic in architecture, this method still
    * requires datasets of thousands or tens of thousands of examples
* humans can generally perform a new language task from only a
  few examples or from simple instructions - something which current NLP
* we show that
  * scaling up language models greatly improves task-agnostic, few-shot
  * sometimes even reaching competitiveness with prior SOTA fine-tuning approac
  * GPT-3, an autoregressive language model with
  * 175 billion parameters, 10x more than any previous non-sparse LM
  * few-shot setting [i.e. no] gradient updates or fine-tuning, with tasks and
  * strong performance on many NLP datasets, including
    * translation, question-answering, and cloze tasks, as well as several
    * tasks that require on-the-fly reasoning or domain adaptation, such as
      unscrambling words, using a novel word in a sentence, or 3-digit arithm
  * datasets where GPT-3's few-shot learning still struggles
  * methodological issues related to training on large web corpora.  Finally,
  * generate samples of news articles which human evaluators have difficulty
    distinguishing from articles written by humans.  We
  * discuss broader societal impacts of this finding and of GPT-3 in general

#Introduction

* pre-trained language representations in NLP systems, applied in increasingly
  flexible and task-agnostic ways for downstream transfer. First,
  * single-layer representations using word vectors [MCCD13, PSM14] and fed to
  * RNNs with multiple layers of representations and contextual state
    [DL15, MBXS17, PNZtY18] (though still applied to task-specific archits)
  * pre-trained recurrent or transformer language models [VSP + 17] have been
    directly fine-tuned
    [no] need for task-specific architectures [RNSS18, DCLT18, HR18]
* This last paradigm has led to
  * substantial progress on e.g. reading comprehension, question answering,
    textual entailment, and many others, and has
  * new architectures and algorithms [RSR + 19, LOG + 19, YDY + 19, LCG + 19]
* removing the need for task-specific datasets and task-specific fine-tuning
  would be desirable, for several reasons
  * practical perspective, the need for a large dataset of labeled examples for
    * a very wide range of possible useful language tasks, e.g
      correcting grammar, to generating examples of an abstract concept, to
      critiquing a short story
  * spurious [false] correlations in training data fundamentally
    * grows with the expressiveness of the model and the narrowness of the
      training distribution [HLW + 20, YdC + 19, MPL19, GSL + 18, NK19]
  * humans do not require large supervised datasets to learn most tasks – a
    * e.g. “please tell me if this sentence describes something happy or sad”
    * allows humans to seamlessly mix together or switch between many tasks and
      * performing addition during a lengthy dialogue. To be broadly useful, we
* meta-learning in the context of language models means the
  * model develops a broad set of skills and pattern recognition abilities at
    training time, and then uses those abilities at inference time to rapidly
    adapt to or recognize the desired task (illustrated in Figure 1.1)
  * [RWC + 19] attempts to do this via what we call “in-context learning”,
    using the text input of a pretrained language model as a form of task specf
    * model is conditioned on a natural language instruction and/or a few
      demonstrations of the task
    * results far inferior to fine-tuning – for example [RWC + 19] achieves
      only 4% on Natural Questions, and even its 55 F1 CoQa result is now more
      than 35 points behind the SOTA
* capacity of transformer language models has increased substantially,
    100 million parameters [RNSS18], to
    300 million parameters [DCLT18], to
  1.5 billion parameters [RWC + 19], to
  8 billion parameters [SPP + 19],
 11 billion parameters [RSR + 19], and finally
 17 billion parameters [Tur20]
  * log loss, which correlates well with many downstream tasks,
    follows a smooth trend of improvement with scale [KMH + 20]. Since
  * it is plausible that in-context learning abilities might show similar gains
* we test in-context learning abilities. Specifically, we evaluate GPT-3 on
  * two dozen NLP datasets, as well as several novel tasks designed to test
    rapid adaptation to tasks unlikely to be directly contained in the training
  * evaluate GPT-3 under 3 conditions:
    * “few-shot learning”, or in-context learning where we allow
      as many demonstrations as will fit into the model’s context window
      (typically 10 to 100),
    * “one-shot learning”, where we allow only one demonstration, and
    * “zero-shot” learning, where no demonstrations are allowed and only an
      instruction in natural language is given to the model
    * could also in principle be evaluated in the traditional fine-tuning
      setting, but we leave this to future work
* Figure 1.2: few-shot learning of a simple task
  * task: remove extraneous symbols from a word.  Model
  * performance improves with the addition of a natural language task desc
* Few-shot learning also improves dramatically with model size. Though the
  * no gradient updates or fine-tuning, just increasing numbers of demonstrat
* result. Broadly, on NLP tasks GPT-3 achieves
  * promising results in the zero-shot and one-shot settings, and
  * in the the few-shot setting is sometimes competitive with or even
    occasionally surpasses SOTA (fine-tuned)
* tasks on which few-shot performance struggles, even at the scale of GPT-3
  * natural language inference tasks like the ANLI dataset, and
  * some reading comprehension datasets like RACE or QuAC. By presenting a
* Figure 1.3, aggregates performance for all 42 accuracy-denominated benchmarks
  * few-shot performance increases more rapidly [than zero], demonstrating that
    larger models are more proficient at in-context learning
  * See Figure 3.8 for a more detailed analysis on SuperGLUE, a standard benchm
* systematic study of “data contamination” – a growing
  * problem when training models on datasets such as Common Crawl,
    which can potentially include content from test datasets . In this paper we
  * minimal effect on most datasets, [but on a few datasets] it could inflate
    * we either do not report results on these datasets or we
      note them with an asterisk, depending on the severity
* we also train a series of smaller models
  (ranging from 125 million parameters to 13 billion parameters) in order to
  * compare their performance to GPT-3 in the zero, one and few-shot settings
  * relatively smooth scaling with model capacity in all three settings; one
  * the gap between zero-, one-, and few-shot performance often grows with capa
    * perhaps suggesting that larger models are more proficient meta-learners
* preliminary analysis regarding bias, fairness, and broader societal impact


# 2 Approach and methods for training GPT-3 and evaluating it

## 2.1 Model and Architectures
## 2.2 Training Dataset
## 2.3 Training Process
## 2.4 Evaluation

# 3 Results on the full range of tasks in the zero-, one- and few-shot settings

## 3.1 Language Modeling, Cloze, and Completion Tasks
## 3.2 Closed Book Question Answering
## 3.3 Translation
## 3.4 Winograd-Style Tasks
## 3.5 Common Sense Reasoning
## 3.6 Reading Comprehension
## 3.7 SuperGLUE
## 3.8 NLI
## 3.9 Synthetic and Qualitative Tasks

# 4 Measuring and Preventing Memorization Of Benchmarks 30

# 5 Limitations 33

# 6 Broader Impacts

## 6.1 Misuse of Language Models
## 6.2 Fairness, Bias, and Representation
## 6.3 Energy Usage

# 7 Related Work 39

# 8 Conclusion 40

# A Details of Common Crawl Filtering 42
# B Details of Model Training 42
# C Details of Test Set Contamination Studies 42
# D Total Compute Used to Train Language Models 45
# E Human Quality Assessment of Synthetic News Articles 45
# F Additional Samples from GPT-3 47
# G Details of Task Phrasing and Specifications 49
# H Results on All Tasks for All Model Sizes 61
