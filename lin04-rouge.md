Rouge: A package for automatic evaluation of summaries
Chin-Yew Lin
2004/7 Text summarization branches out Pages 74-81

* ROUGE stands for Recall-Oriented Understudy for Gisting Evaluation. It
  includes measures to automatically determine the quality of a summary by
* The measures count the number of overlapping units such as n-gram, word
  sequences, and word pairs between the computer-generated summary to be
  evaluated and the ideal summaries created by humans. This paper introduces
* four different ROUGE measures: ROUGE-N, ROUGE-L, ROUGE-W, and ROUGE-S included
  * the ROUGE summarization evaluation package and their evaluations. Three of

# 1 Intro

* how the results of these automatic evaluation methods correlate to human
* Following the successful applic ation of automatic evaluation methods, such as
  B LEU (Papineni+ 2001), in machine translation evaluation, 
* Lin and Hovy (2003) showed that methods similar to B LEU , i.e.  n-gram
  co-occurrence statistics, could be applied to evaluate summaries. In this
* we introduce a package, R OUGE , for automatic evaluation of summaries and its
  evaluations. R OUGE stands for Recall-Oriented Understudy for Gisting
  Evaluation. It includes several automatic evaluation methods that measure the
  similarity between summaries. We describe 
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
    * correlations to human judgments were increased by using multiple references.
  * the R OUGE package could be used effectively in automatic evaluation 
    * in Lin and Och, (2004), ROUGE-L, W, and S were also shown to be very
      effective in automatic evaluation of machine translation.  The 
    * stability and reliability of R OUGE at different sample sizes was reported
      by the author in (Lin, 2004). However, 
    * multi-document summarization tasks is still an open research topic

# ROUGE-N in Section 2, 

# ROUGE-L in Section 3, 

# ROUGE-W in Section 4, and 

# ROUGE-S in Section 5

# 6 how these measures correlate with human judgments 

* using DUC 2001, 2002, and 2003 data. 

# 7 concludes this paper and discusses future directions
