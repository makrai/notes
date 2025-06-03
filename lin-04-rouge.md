Rouge: A package for automatic evaluation of summaries
Chin-Yew Lin
2004/7 Text summarization branches out Pages 74-81

* ROUGE stands for Recall-Oriented Understudy for Gisting Evaluation. It
  includes measures to automatically determine the quality of a summary by
* The measures count the number of overlapping units such as n-gram, word
  sequences, and word pairs between the computer-generated summary to be
  evaluated and the ideal summaries created by humans
* four different ROUGE measures: ROUGE-N, ROUGE-L, ROUGE-W, and ROUGE-S included
  * the ROUGE summarization evaluation package and their evaluations

# 1 Intro

* how the results of automatic evaluation methods correlate to human
* Following the successful application of automatic evaluation methods, such as
  BLEU (Papineni+ 2001), in machine translation evaluation,
* Lin and Hovy (2003) showed that methods similar to BLEU, i.e.  n-gram
  co-occurrence statistics, could be applied to evaluate summaries
* we introduce a package, ROUGE, for automatic evaluation of summaries and its
  evaluations. ROUGE stands for Recall-Oriented Understudy for Gisting
  Evaluation. It includes several automatic evaluation methods that measure the
  similarity between summaries
* conclusion
  * we estimated confidence intervals of correlations using bootstrap resampling
    * single document summ: ROUGE-2, ROUGE-L, ROUGE-W, and ROUGE-S worked well
    * very short summaries (or headline-like summaries):
      ROUGE-1, ROUGE-L, ROUGE-W, ROUGE-SU4, and ROUGE-SU9 performed great
    * multi-document summarization:
      correlation of high 90% was hard to achieve for but
      ROUGE-1, ROUGE-2, ROUGE-S4, ROUGE-S9, ROUGE-SU4, and ROUGE-SU9 worked
      reasonably well when stopwords were excluded from matching,
    * exclusion of stopwords usually improved correlation, and
    * correlations to human judgments were increased by using multiple refs
  * the ROUGE package could be used effectively in automatic evaluation
    * in Lin and Och, (2004), ROUGE-L, W, and S were also shown to be very
      effective in automatic evaluation of machine translation
    * stability and reliability of ROUGE at different sample sizes was reported
      by the author in (Lin, 2004)
    * multi-document summarization tasks is still an open research topic

# 2 ROUGE-N

# 3 ROUGE-L

# 4 ROUGE-W

# 5 ROUGE-S

# 6 how these measures correlate with human judgments

* using DUC 2001, 2002, and 2003 data

# 7 conclusion and future directions
