FEQA: A QA Evaluation Framework for Faithfulness Assessment in Abs Summ
Esin Durmus, He He, Mona Diab
Accepted to ACL 2020 arXiv:2005.03754 [cs.CL]

* We first collected human annotations of faithfulness
  for outputs from numerous models on two datasets
  * two datasets with varying levels of abstractiveness (CNN/DM and XSum), we
  * current models exhibit a trade-off between abstractiveness and faithfulness:
* we propose an automatic question answering (QA) based metric for faithfulness,
  * leverages recent advances in reading comprehension.  Given question-answer
    pairs generated from the summary, a QA model extracts answers from the
    document; non-matched answers indicate unfaithful information in the
  * Among metrics based on word overlap, embedding similarity, and learned
    language understanding models, our QA-based metric has significantly higher
    correlation with human faithfulness scores, especially on highly abstractive

# 1 Intro

* Recent studies have shown that around 30% of generated summaries contain
  unfaithful information (Cao+ 2018; Falke+ 2019a; Kryściński+ 2019),
  * especially when the sentence combines content from multiple source sentences
    (Lebanoff+ 2019).
* we investigate a diverse set of existing automatic evaluation metrics such as
  ROUGE, BERTScore (Zhang+ 2019a), and learned entailment models. We find that
  * their correlations with human scores of faithfulness drop significantly
    on highly abstractive summaries, where deeper text understanding is needed.
* question answering (QA) based automatic metrics have been proposed
  (Eyal+ 2019; Scialom+ 2019; Chen+ 2018).
  * cloze-style QA is used to evaluate whether important information in the
    source is recovered from the summary. Inspired by prior work, we use
* Among automatic metrics based on n-gram overlap, word embeddings, and language
  understanding models (relation extraction and entailment),
  FEQA has significantly higher correlation with human scores of faithfulness
  * the only metric that correlates with human scores on highly abs XSum

# 2  current models show a trade-off between abstractiveness and faithfulness

# 3 model that converts a declarative sentence and an answer span to a question
