# EMNLP 2026 -Notes by Márton Makrai

# Sunday, October 25 — Main Conference Day 1

## The Geometry of Low-Resource Language Representations

[Francois Meyer](https://francois-meyer.github.io/) \\
Session: 11 AM Interpretability and Analysis of Models for NLP 1 \\
[paper](https://arxiv.org/abs/2608.23358v1)

* LLM geometry is systematically related to lang data availability. 
* The most consistent effect is in final layers, where 
  low-resource langs exhibit repral degeneration. 
* To counter this, we investigate the effectiveness of 
  regularisation terms 
  to penalise degeneration during continued pretraining (CPT). 
* Experiments monolingually adapting 9 base LLMs to 10 African langs show that
  geometric regularisation 
  successfully reduces repral degeneration during CPT.
* For larger models, cosine similarity-based regularisation 
  marginally improves performance over vanilla CPT, with 
* more consistent gains on the most challenging tasks. We establish that 
* the repral geo of low~ and high-resource langs in LLMs is measurably distinct,
* targeted geo intervention is viable for improving CPT for low-resource langs.

Behind the news: Actionable interpretability is a thing.

## Preliminary Report on the AI Reviewing Experiment

keynote by Desmond Elliott and Mike Zhang

Recommendations

> * Exercise caution in deploying AI tools in the review process
> * Repeat these experiments with more powerful open-weights models
>   running on hardware funded by `*`ACL/SIGDAT
>   * Possibly structured as a large-scale shared task initiative
>   * Use the opportunity to develop better AI reviewers
> * Develop tooling and policies to 
>   investigate the similarities between AI and “human-authored” reviews
