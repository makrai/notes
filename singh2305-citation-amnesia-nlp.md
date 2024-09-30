Forgotten Knowledge: Examining the Citational Amnesia in NLP
Janvijay Singh, Mukund Rungta, Diyi Yang, Saif M. Mohammad
ACL 2023 Main Conference arXiv:2305.18554 [cs.CL]

* Collectively, citing a diverse set of papers (in time and area of study) is
  an indicator of how widely the community is reading
  * there is little work looking at broad temporal patterns of citation. This
* we systematically and empirically examine:
  * How far back in time do we tend to go to cite papers?
  * How has that changed over time, and
  * what factors correlate with this citational attention/amnesia? We chose NLP
* method: 71.5K papers to show and quantify several key trends in citation
* results: 62% of cited papers are from the immediate five years prior to
  * 17% are more than ten years old.  Furthermore, we show that
  * the median age and age diversity of cited papers were
    * steadily increasing from 1990 to 2014, but
    * since then, the trend has reversed, and current NLP papers have an
* unlike the 1990s, the highly cited papers in the last decade were also papers
  with the least citation diversity, likely contributing to the intense (and
  arguably harmful) recency focus. Code, data, and a demo are available on the

# 1 Intro

* Age of Citations (AoC) dataset
* hE other factors such as the birth of paradigm-changing technologies may
  * ushering in a trend of citing very new work or
  * citing work from previously ignored fields of work. Such dramatic changes
  * largely seen as beneficial
  * hE may also lead to a myopic focus on recent papers and those from only
    some areas (Pan+, 2018; Martín-Martín+, 2016)

# 3 Dataset.  The ACL Anthology (AA) Citation Corpus (Rungta)

# 4 Age of Citation

* We used the AoC dataset to answer a series of questions

## Q1. What is the average number of unique references in the AA papers?
* How does this number vary by publication type, such as workshop/conf/journal
* Has this average stayed roughly the same or has it changed markedly?

### Ans. We calculated the average number of unique references for all papers

### Results The scores are shown in Table 1. Figure 1 shows how the mean has

* a general upward trend

### Discussion

* The steady increase in the number of unique references from 1965 is likely
  because of the increasing number of relevant papers as the field develops and
* not plateaued even after 55 years
* late-2000s, with the advent of widely accessible electronic proceedings,
  * `*`ACL venues started experimenting with more generous page limits:
    * first/eventually allowing one or two/unlimited pages for references
      . Other factors that may have contributed to more papers being referred
    * an additional page for incorporating reviewer comments,
    * Appendices, and the inclusion of an increasing number of experiments

## Q2. On average, how far back in time do we go to cite papers? As in,
* average age of cited papers? What is the
* distribution of this age across all citations? How do
* these vary by publication type?

### Ans. If a paper x cites a paper yi , then the age of the citation (AoC) is

### Results The average mAoC for all the papers in the AoC dataset is 6.01. The

### Discussion Overall, we observe that

* papers are cited most in years immediately after publication, and their
  chances of citation fall exponentially after that
* The slight right-shift for the journal article citations is likely, at least
  in part, because journal submissions have a long turn-around time from the
  first submission to the date of publication (usually between 6 and 18 months)
  * A list of the oldest papers cited by AA papers is available in the repo

## Q3. What is the trend in the variation of AoC over time and
* how does this variation differ across venues in NLP?

### Ans. Just as Verstak+ (2014), we define a cited paper as older if it
was published at least ten years prior to the citing paper

### Results. Figure 5 shows the percentage of older papers cited by papers

* increased steadily from 1990 to 1999, before decreasing until 2002
* After 2002, the trend picked up again
* an all time high of ∼30% by 2014. However
* since 2014, the percentage of citations to older papers has dropped dramatic
* Similar patterns are observed for different publication types. However, we
  * a greater (usually around 5% more) percentage of a journal paper’s
    citations are to older papers, than in conference and workshop papers

### Discussion These results confirm that the trends in diversity discussed in

## Q5. What is the mAoC distribution for different areas within NLP? Relative

* which areas tend to cite more older/recent papers?

### Ans. The ACL Anthology does not include metadata for sub-areas within

* a paper may be associated with more than one area and the distinction
* a simple approach used earlier in Mohammad (2020b): paper title word bigrams
  * bigrams for this analysis also allows for a finer analysis within areas.
* A single paper may be included in multiple bins
  * Figure 6: Distribution of mAoC for frequent bigrams appearing in the titles

### Results Figure 6 shows the mAoC violin plots for each of the bins

* eg title bigrams _word alignment, parallel corpus/corpora, Penn Treebank_
* In contrast, papers with the title bigrams _glove vector, BERT pre_
  * eg+ _reading comprehension, shared task, question answering,_
    _language inference, language models,_ and _social media_

### Discussion The above results suggest that not all NLP subfields are equal

* factors such as early adoption or greater applicability of the latest
  developments, the relative newness of the area itself
  (possibly enabled by new inventions such as social media)

## Q6. What topics are more pronounced in cited papers across diff periods?

### Ans. To address this question, we partitioned the research papers into

### Results. Upon examining various bigram citation percentages, we found that

* bigram
  * tree-adjoining grammars have been in decline since the 1990s (cited less)
  * conditional random fields and coreference resolution gained momentum in the
    middle periods (2000–2016) but have since lost popularity post-2016. On the
  * domain adaptation have consistently gained momentum since the 2010s.
  * Post-2016 keywords related to deep learning technologies such as
    convolutional neural nets, deep bi-directional, deep learning, deep neural,
    Global vectors, and jointly learning experienced a substantial surge in
    popularity. Additionally, certain areas such as
  * cross-lingual, entity recognition consistently gained momentum since 1990s
* unigram citation percentages, we found that deep-learning-related terms such
  * attention, bert, deep, neural, embeddings, and recurrent saw a
    substantial increase in citation post-2016.  Furthermore, we observed that
  * since the 1990s, there has been a growing trend in social and sentiment
  * The 2010–2021 period was split into two because of the many papers
    * Figures 9 and 10 in the Appendix show a number of unigrams and bigrams

## Q7. Do well-cited papers cite more old papers and have more AoC diversity?

### Ans. We introduce three hypotheses

* to explore the correlation between temporal citation patterns of target
  papers and the number of citations the target papers themselves get
* H2/3/1. Highly cited papers have more/less temporal citation diversity
  than less cited papers/no correlation
* intuition
  * other factors such the quality of work and thus correlates with higher
  * early work in a new area receives lots of subsequent citations and
  * work in a new area often tends to have limited citation diversity as there
    is no long history of publications in the area (supporting H3)
* Spearman’s Rank Correlation between the CAD Index of the citation bins and
  the mean of the citation range of each of these bins

### Results Figure 7 shows the mAoC and CAD Index for each bin

* On the full dataset (Figure 7a), we observe a clear pattern that
  * the CAD Index decreases with increasing citation bin
    (with the exception of papers in the 1K–2K and 2K–5K bins)
  * The mean mAoC follows similar trend wrt the CAD Index
  * the higher citation count papers tend to have less temporal citation
    diversity than lower-citation count papers
* on the 1990s subset (Figure 7b), the CAD Index decreased till the citation
  count < 50 and increased markedly after that. This shows that during the
  * the highly cited papers also cited papers more widely in time
* Plots for the 2000s and 2010s (Figure 11) follow a similar trend as the
  overall plot (Figure 7a), indicating that trend of highly cited papers having
* tab 2: The Spearman’s rank Correlation Coefficients between the mean number
  of citations for a bin and the mean mAoC of the citation bins are shown
* for the 1990’s papers there is essentially no correlation, but there are
  * strong correlations for the 2000s, 2010s, and the full dataset papers
* Similar to Figure 7a, in Figure 12 (in the Appendix) we show how
  * between 1965 and 2021: mean mAoC and CAD Index of AA papers by research
    topics. This examination across various research topics consistently
  * the higher the citations, the lower the age diversity of citations. This
  * may be because “mainstream” work in an area tends to cite lots of other
    very recent work and brings in proportionately fewer ideas from the past.
  * “non-mainstream” work tends to incorporate proportionally more ideas from
    outside, yet receives fewer citations as there may be less future work in
    that space to cite it

### Discussion. Papers may receive high citations for a number of reasons; and

* those that receive high citations are not necessarily model research papers
* Thus their strong recency focus in citations is a cause of concern
* anecdotal incidents in the community have suggested how early researchers
  often consider papers that were published more than two or three years back
  as "old papers"

# 6 Conclusion

* the correlation
  * between the number of citations a paper receives and
    the diversity of age of cited papers, and found that while
  * there was roughly no correlation in the 1990s,
  * the 2000s marked the beginning of a period where the
    higher citation levels correlated strongly with lower temporal citation
    diversity
* How are we contributing to this as researchers, advisors, reviewers, area
  chairs, and funding agencies?

# Limitation

* this study is based solely on papers published in the ACL Anthology, which
  * a significant amount of research is also published in other venues eg
    * AAAI, ICLR, ICML, and WWW
    * vibrant local NLP communities and venues, often publishing in non-English
* possible factors that contribute to lower citation of certain older papers
  * eg accessibility to these older papers, the large number of recent papers,
    the applicability of these old works, and the technical relevance of the
* We have analyzed different factors such as the mean age of citation,
  diversity in the age of citations, venue of publication, and subfield of
* citations can be heterogeneous and can be categorized in different ways
  * eg background, method, and result citations
  * certain citations may be more important (Valenzuela-Escarcega+, 2015)
