ARBERT & MARBERT: Deep Bidirectional Transformers for Arabic 
Muhammad Abdul-Mageed, AbdelRahim Elmadany, El Moatez Billah Nagoudi
    ACL | IJCNLP 2021
    abdul-mageed-etal-2021-arbert

# Abstract

* multilingual LMs were also introduced to serve many languages, these have
  * costly at inference time and the 
  * size and diversity of non-English data involved in their pre-training. We
* we
  * a collection of diverse Arabic varieties by introducing two Bert models,
    ARBERT and MARBERT. 
* To evaluate our models, we also introduce ARLUE, a new benchmark for
  multi-dialectal Arabic language understanding evaluation.
  * 42 datasets targeting six different task clusters, allowing us to offer a
* our models collectively achieve new SOTA results across the majority of tasks
  (37 out of 48 classification tasks, on the 42 datasets). 
  * Our best model acquires the highest ARLUE score (77.40) across all six task
    clusters, outperforming all other models including XLM-R Large (3.4x larger)

# 1 

## Context

* four needs listed above. That is, we describe novel LMs that 
  1. excel across domains, including social media, 
  1. can serve diverse communities, and 
  1. perform well compared to larger (more energy hungry) models 
  1. on a novel, standardized benchmark. We choose 
* Arabic is a widely spoken language (∼ 400M native speakers), with a large
  * many diverse dialects differing among themselves and from the standard
    variety, Modern Standard Arabic (MSA). Arabic is also 
  * covered by the popular mBERT (Devlin+ 2019) and XLM-R (Conneau+ 2020), which
  * we can empirically measure monolingual vs. multilingual performance under
    robust conditions using our new benchmark, ARLUE, but 
  * our base-sized models outperform (or at least are on par with) larger models
    (i.e., XLM-R Large , which is ∼ 3.4× larger than our models). In the context
* AraBERT (Antoun+ 2020), suffers from a number of issues.
  * not making use of easily accessible data across domains and, more seriously, 
  * limited ability to handle Arabic dialects and 
  * narrow evaluation. We rectify all these limitations.

## 3.2 MARBERT

* As we pointed out in Sections 1 and 2, 
  Arabic has a large number of diverse dialects. 
  * Most of these dialects are under-studied due to rarity of resources.
* Multilingual models such as mBERT and XLM-R are trained on mostly Modern
  Standard Arabic (MSA) data, which is also the case for AraBERT and ARBERT. As
  * not best suited for downstream tasks involving dialectal Arabic. To treat
* we use a large Twitter dataset to pre-train a new model, MARBERT, from scratch
