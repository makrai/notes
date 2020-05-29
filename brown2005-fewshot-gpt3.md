Language Models are Few-Shot Learners
Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan, Shyam, Sastry,
  Askell, Agarwal, Herbert-Voss, Krueger, Henighan, Child, Ramesh, M. Ziegler,
  Wu, Winter, Hesse, Chen, Sigler,
  Litwin, Gray, Chess, Clark, Berner, McCandlish, Radford, Sutskever, Amodei
arXiv:2005.14165 [cs.CL]

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
