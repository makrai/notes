Shortcutted Commonsense: Data Spuriousness in Deep Learning of Commonsense Reas
Ruben Branco, António Branco, João António Rodrigues, João Ricardo Silva
EMNLP 2021

# Abstract

* in commonsense reasoning, Transformer neural language models matching or
  surpassing human performance in some benchmarks
* data artifacts in the training data have been made evident as
  * spurious correlations and shallow shortcuts in some cases are
    leveraging these outstanding results
* We undertake a study on different prominent benchmarks
* most datasets experimented with are problematic, with models resorting to
  non-robust features

# Intro

* Reasoning helps humans to cope with their experience
  * foresee new events as well as form new beliefs and justify and defend them
    (Kintsch and Van Dijk, 1978; Mercier and Sperber, 2017)
* with knowledge widely shared by humans, usually termed as commonsense
  * values and needs
  * world view of humans, their needs, capabilities, beliefs, and action
* acting on the basis of these capabilities can be verbalized to a large extent
  * knowledge can be written down, and
  * the inference chain of a reasoning process can be expressed in some idiom
* models may be latching at spurious cues present in the data
  (Zech+ 2018; Geirhos+ 2020; Niven and Kao, 2019)
* models are continuously closing the gap to humans in commonsense reasoning
  (Zhou+ 2020; Tamborrino+ 2020; Lourie+ 2021)
* We select four prominent commonsense reasoning tasks
  * Argument Reasoning Comprehension Task (ARCT, Habernal+ 2018)
  * AI2 Reasoning Challenge (ARC, Clark+ 2018)
  * Physical Interaction QA (PIQA, Bisk+ 2020)
  * CommonsenseQA (CSQA, Talmor+ 2019))
* we resort to prominent pre-trained language models
  * the encoder-only RoBERTa (Liu+ 2019b)
  * the decoder-only GPT-2 (Radford+ 2019)
  * the encoder-decoder T5 (Raffel+ 2020) and BART (Lewis+ 2020)
  * the neurosymbolic COMET (BART, Hwang+ 2021))
    * JD Hwang, C Bhagavatula, R Le Bras, J Da, K Sakaguchi, A Bosselut, Y Choi
      Comet-atomic 2020: On symbolic and neural commonsense knowledge graphs
      AAAI 2021
* questions
  * Are the models taking into account the actual input as a whole?
    * models do much better than expected without being supplied with all the
      segments in a given input, even approximating their performance when
      they are provided with the full input, namely in the case of ARCT, ARC
      and PIQA tasks, while CSQA shows the expected degraded performance
  * How robust are the models? Can they withstand adversarial attacks
    * ARCT, ARC and PIQA, are also clearly more sensitive than CSQA
  * How well can models perform zero-shot evaluation on each other?
    * Also CSQA stands out in its generalization capacity
      in comparison to the lower capacity of the other three tasks to
      generalize as it provides much better approximation to other tasks
* most datasets experimented with are problematic
  * models resorting to non-robust features and appearing not to generalize
* from the conclusion
  * these contrasts and problems result from
    * not from possible data contamination
    * most plausible justification: data spuriousness supports shortcutted
      learning of commonsense reasoning, with reduced generalization

# 2 related work

## Shortcuts

* Deep neural networks tend to favor simple functions
  * DNNs such as Transformers, as well as cross-entropy and optimizers,
    (De Palma+ 2018; Jacobsen+ 2018; Sun and Nielsen, 2019; Valle-Pérez+ 2018;
    Wu+ 2017), which can be susceptible to wrong generalizations as
    the eventual models “hook” onto spurious artifacts in the data
* examples
  * Machine reading comprehension (MRC) models appear not to do much “reading”
    (Kaushik and Lipton, 2018), as
    * models can perform reasonably well when given only a passage or a passage
      with a randomly assigned question, instead of a whole input
  * Large-scale natural language inference (NLI) datasets exhibit linguistic
    phenomena that correlate well with certain classes
    * Simple classifier models can perform well by looking only at the
      hypothesis, instead of the rest (Gururangan+ 2018; Poliak+ 2018)
  * Geva+ (2019): NLU annotator bias is evident and
    models did not generalize well across annotators
    * model can exploit if the same annotator is present in the training & test

## Data contamination A different type of

* Pre-trained language models can use
  (factual) knowledge encoded in its parameters during fine-tuning
  * in open-book Q&A challenges,
    large pre-trained LM can be competitive with systems that access external
    knowledge sources by just accessing their internal “memory” (Roberts+ 2020)
* problem if the task dataset and the pre-training corpus have been constructed
  from the same sources, and thus have some text in common
* The authors of GPT-2 (Radford+ 2019) create bloom filters from WebText, its
  pre-training corpus, and calculate an upper bound for text collisions
  between downstream tasks and WebText, labelled as data contamination
  * the model gains small but consistent benefits, arguably due to memorization
* GPT-3 (Brown+ 2020) gave rise to larger-scale data contamination experiments
  with exact n-gram matching (instead of bloom filters). The results varied,
  with some datasets being completely clean and others worryingly contaminated
* Popular machine reading datasets
  * such as
    * QuAC (Choi+ 2018), SQuAD 2 (Rajpurkar+ 2018) or DROP (Dua+ 2019) are
      flagged for >90% contamination
    * PIQA (Bisk+ 2020) was flagged with 29% contamination,
  * hE, removing the contaminated text only decreases the performance by 3%,
    regardless of model size
  * The authors see this as a sign that memorization may not be at play but
    rather statistical cues in the data
    * no empirically based support to that conjecture

# 3 The tasks experimented with

## 3.4 CommonsenseQA (CSQA, Talmor+ 2019)

* a multi-choice question answering dataset that targets commonsense knowledge
  in different formats, much like ARC
* many knowledge types: spatial, cause & effect, has parts, is member of,
  purpose, social, activity, definition and preconditions
* built resorting to ConceptNet (Liu and Singh, 2004) for triplets and then
  using Amazon Mechanical Turk to crowdsource questions

# 4 Methodology 4

## 4.1 Experiments

### Tasks baselines: we fine-tune the models on each one of the four tasks

### Partial inputs

* in line with what was done for instance in MRC (Kaushik and Lipton, 2018),
  NLI (Gururangan+ 2018; Poliak+ 2018) and ARCT (Niven and Kao, 2019)

### adversarial test examples that can be obtained from “regular” test examples

* minimal superficial changes that seek to preserve their semantic value
* if the model performance drops substantially, this is a symptom (Ilyas+ 2019)
* To obtain the adversarial examples, TextFooler (Jin+ 2020), using the
  implementation in TextAttack (Morris+ 2020b)
* A study on algorithms to generate adversarial examples found that
  * they may not fully preserve semantics and
  * may introduce up to 38% of grammatical errors (Morris+ 2020a)
  * authors suggest a number of TextFooler’s hyperparameters
    * minimum word cosine similarity, we set it at 0.9
    * sentence similarity threshold to accept a candidate adversarial example
      * in that study, a value of 0.98 is deemed as suitable, here
      * we experimented with a slightly more lenient 0.9

### Data contamination

* Following the methodology established in the GPT-3 data contamination study
  (Brown+ 2020), we search for n-gram collisions between the testsets of the

### Cross tasks: a model trained in one task is tested on every other task, 0sh

## 4.2 Models

# 5 results

## 5.1 Baselines

## 5.2 Partial inputs

## 5.3 Adversarial attacks

## 5.4 Data contamination

## 5.5 Cross tasks

## 5.6 Searching for possible shortcuts

* experiments in the hope of finding two types of shortcuts:
  * class imbalance
  * lexical cues
    * we resort to the methodology defined in (Niven and Kao, 2019)
* No strong shortcuts were found in both cases.  The datasets do not suffer
  * no class imbalance
  * the lexical cues uncovered do not have enough productivity and coverage to
    explain the inflated behavior of the models in the previous experiments
* Appendix C for more details on these findings. Further searching for possible
* future work, possibly relying on other sort of clues and tools
  (Branco and Costa, 2008; Branco+ 2014)

# 6 Conclusion
