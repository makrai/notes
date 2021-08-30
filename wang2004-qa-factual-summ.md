Asking and Answering Questions to Evaluate the Factual Consistency of Summaries
Alex Wang, Kyunghyun Cho, Mike Lewis
ACL 2020 arXiv:2004.04228 [cs.CL]

* We propose an automatic evaluation protocol called QAGS (pronounced "kags")
  that is designed to identify factual inconsistencies in a generated summary
  * intuition that if we ask questions about a summary and its source, we will
    receive similar answers if the summary is factually consistent with the
* we collect human judgments of factual consistency on model-generated summaries
  for the CNN/DailyMail (Hermann+ 2015) and XSUM (Narayan+ 2018) summarization
  datasets. QAGS has
* substantially higher correlations with these judgments than other automatic
  evaluation metrics. Also,
* interpretability: The answers and questions generated while computing QAGS
  indicate which tokens of a summary are inconsistent and why. We believe QAGS

# 1 Intro

* evaluating the factual consistencies is challenging even for humans
  (Daume III and Marcu, 2005; Kryscinski+ 2019b), in addition to being slow and
  costly
* three steps:
  * Given a generated text, a question generation (QG) model generates a set of
    questions about the text
  * We then use question answering (QA) models to answer these questions given
    both the input and the generated text
  * A quality score is computed based on the similarity of corresponding
    answers
* leverages recent progress in QA and QG to
  ask and answer human readable, on-topic questions (Devlin+ 2019; Song+ 2019)
  * applicable to any modality where a QA model is available
    e.g. text, images, or knowledge graphs
* QAGS (Question Answering and Generation for Summarization), a metric for
  * Pearson correlation coefficient of 54.52 on the CNN/DailyMail summarization
* new SOTA results on evaluating the factuality of summaries, outperforming
  recently proposed NLI models for this task (Kryscinski+ 2019b)
* robustness of QAGS through an ablation study shows robustness to the quality
  * underlying QG and QA models, the
  * domain of the models, and the
  * number of questions asked. Even under the worst ablation settings, QAGS
* contribute the following:
  * We introduce QAGS, an automatic model-based evaluation metric for measuring
    the factual consistency of model-generated text
  * We collect a new set of human judgments of factual consistency of
    model-generated summaries for two summarization datasets. We demonstrate
    that QAGS correlates with these judgments significantly better than other
    automatic metrics
  * We show via ablations that QAGS is robust to a number of factors including
    underlying model quality and domain mismatch
  * We analyze the questions and answers produced in computing QAGS to
    illustrate which parts of summaries are inconsistent
  * We will release models and code to compute QAGS
