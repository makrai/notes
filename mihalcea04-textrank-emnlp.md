TextRank: Bringing Order into Texts
Rada Mihalcea and Paul Tarau
2004

# Abstract

unsupervised methods for keyword and sentence extraction

# 1 Introduction

* Graph-based ranking algorithms
  * like Kleinberg’s HITS algorithm (Kleinberg, 1999) or
    * Google’s PageRank (Brin and Page, 1998) have been
  * successfully used in citation analysis, social networks, and the analysis
    of the link-structure of the World Wide Web.
  * key elements of the paradigm-shift triggered in the field of Web search
    * relies on the collective knowledge of Web architects rather than
      individual content analysis of Web pages

# 3 keyword extraction 3

## 3.2 Eval

* Experiments were also performed with directed graphs, where a
  * direction was set following the
    * natural flow: [word] “recommends” ... the [following word]
    * reversed direction, where a lexical unit points to a previous token
  * window of 2
  * results ... are worse than results obtained with undirected graphs, which
    suggests that ... there is no natural “direction”

# 4 sentence extraction

* edge: “similarity” ... measured as a function of their content overlap
  * number of common tokens
  * syntactic filters, which only count words of a certain syntactic category,
  * Other ... measures, such as string kernels, cosine similarity, longest
    common subsequence ... we are currently evaluating their impact
