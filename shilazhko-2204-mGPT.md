mGPT: Few-Shot Learners Go Multilingual
Oleh Shliazhko, A Fenogenova, M Tikhonova, V Mikhailov, A Kozlova, T Shavrina
arXiv:2204.07580 [cs.CL]

* autoregressive language models can successfully solve many NLP tasks via
  zero~ and few-shot learning paradigms, which opens up new possibilities
* This paper introduces two autoregressive GPT-like models
  with 1.3 billion and 13 billion parameters trained on
  60 languages from 25 language families using
  Wikipedia and Colossal Clean Crawled Corpus
* We reproduce the GPT-3 architecture using GPT-2 sources and the sparse
  attention mechanism; Deepspeed and Megatron frameworks allow us to
  parallelize the training and inference steps effectively. The resulting
* performance on par with the recently released XGLM models by Facebook,
  * more languages and enhancing NLP possibilities for low resource languages
    of CIS [FÁK] countries and Russian small nations
* We detail the motivation for the choices of the architecture design,
  * data preparation pipeline, and train
  * five small versions of the model to choose the optimal multiling tokenizati
  * We measure the model perplexity in all covered languages and
  * evaluate it on the wide spectre of multilingual tasks, including
    classification, generative, sequence labeling and knowledge probing. The
    * zero-shot and few-shot methods.  Furthermore, we the
    * classification compared with the SOTA multilingual model XGLM

# 1 Intro

* fine-tuning hE
  * relies on an extensive amount of labeled data. Collecting high-quality
    labeled data for new tasks and languages is expensive, time~ and
    resource-consuming (Wang+ 2021)
  * can learn spurious correlations from fine-tuning data (Naik+ 2018; Niven
    and Kao, 2019) and demonstrate
  * inconsistent generalization, catastrophic forgetting or brittleness to
    fine-tuning data order (McCoy+ 2020; Dodge+ 2020)
  * computational resources and, therefore, aggravates the problem of a large
    carbon footprint (Bender+ 2021)
* zero~ and few-shot learning
  * ie performing a new task by maximizing an LM scoring function or using a
    small amount of in-context examples without parameter updates (Brown+
    2020)
  * Autoregressive LMs adopted via these paradigms in many NLP tasks
    (Schick and Schütze, 2021; Perez+ 2021), most notably in
  * cross-lingual transfer (Winata+ 2021) and low-resource language (Lin+ 2021)
    * Genta Indra Winata, A Madotto, Z Lin, R Liu, J Yosinski, P Fung.  2021
      Language models are few-shot multilingual learners. In Proceedings of the
      1st Workshop on Multilingual Representation Learning, pages 1–15,
    * XV Lin, T Mihaylov, M Artetxe, T Wang, S Chen, D Simig, M Ott, N Goyal,
        ... J Wang, L Zettlemoyer, Z Kozareva, M T. Diab, V Stoyanov, X Li
      2021. Few-shot learning with multilingual language models
      CoRR, abs/2112.10668
* less explored directions in the interconnected areas of
  zero/few-shot learning and multilingual NLP, including model development
  * typologically distant and low-resource languages
    underrepresented in LMs’ pre-training corpora (Wu and Dredze, 2020;
    Lauscher+ 2020; Hedderich+ 2021), and
  * multilingual zero/fewshot capabilities of autoregressive LMs (Erdem+ 2022)
* This paper expands such concepts to the multilingual setting and introduces a
  family of mGPT models of 1.3 billion and 13 billion parameters trained on 60
  languages from 25 language families using Wikipedia and Colossal Clean
  Crawled Corpus (C4) (Raffel+ 2020). We have measured the models’ perplexities
  on all covered languagesand evaluated its in-context learning and pattern
  recognition abilities on a multitude of
  * multilingual NLP tasks, including ones from XGLUE Benchmark, XWINO,
    XCOPA, etc. (Liang+ 2020; Tikhonov and Ryabinin, 2021a; Ponti+ 2020) with
    “zero-shot” and “few-shot” methods. We also performed
  * knowledge probing on the mLAMA dataset (Kassner+ 2021b) and assessed
  * generative capabilities for a low resource CIS and small nations’ languages
    with perplexity score
  * We describe the data preparation and cleaning pipeline and
  * we train five small mGPT models (163M parameters) to choose the most
    optimal multilingual tokenization strategy
* We are publicly releasing the code and weights of 1.3B model

## 4.2 Knowledge Probing

* We probe our models for factual knowledge in 23 languages
  using the mLAMA dataset (Kassner+ 2021a)
* The task is to complete a knowledge triplet subject, relation, object〉
  converted to templates for querying the LMs.  Consider
  * an example from the original LAMA (Petroni+ 2019), where the triplet
    <Dante, born-in, X> is converted to the template “Dante was born in
    [MASK]”
  * We follow Lin+ (2021) to design the probing task as follows. Each such
    query contains hundreds of negative candidates on average, we limit the
    number of candidates to three, ie one is the ground truth candidate and the
    other two candidates are randomly sampled from the provided knowledge
    source.  The probing performance is evaluated with precision@1 averaged
    over all relations per language
