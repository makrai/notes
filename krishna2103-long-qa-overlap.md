Hurdles to Progress in Long-form Question Answering
Kalpesh Krishna, Aurko Roy, Mohit Iyyer
NAACL 2021 (17 pages)

# Abstract

* The task of long-form question answering (LFQA) involves 
  retrieving documents relevant to a given question and using them to 
  generate a paragraph-length answer. While many models have recently been
* the task formulation raises fundamental challenges regarding evaluation and
  dataset creation that currently preclude meaningful modeling progress. To
* we first design a new system that 
  relies on sparse attention and contrastive retriever learning to 
  achieve SOTA performance on the ELI5 LFQA dataset.  While our system tops the
* a detailed analysis reveals several troubling trends: 
  * our system's generated answers are not actually grounded in the documents
    that it retrieves; 
  * ELI5 contains significant train / test overlap, as at least 81% of ELI5
    validation questions occur in paraphrased form in the training set; 
  * ROUGE-L is not an informative metric of generated answer quality and 
    can be easily gamed; and 
  * human evaluations used for other text generation tasks are unreliable for
    LFQA. 
* We provide suggestions to mitigate each of these issues, which we hope will

# 1 Introduction

* open-domain QA datasets such as 
  * Natural Questions (Kwiatkowski+ 2019), whose questions are answerable with
    short phrases and entities, by leveraging 
  * dense retrieval techniques like ORQA (Lee+ 2019), REALM (Guu+ 2020), and 
    DPR (Karpukhin+ 2020; Lewis+ 2020c; Izacard and Grave, 2020).  
* Methods combined with pretrained language models (Lewis+ 2020b; Petroni+ 2020)
* the Reddit-derived “Explain Like I’m Five” (ELI5) dataset (Fan+ 2019), which
  * the only publicly-available large-scale LFQA dataset.  
* KILT benchmark (Petroni+ 2020), which compares retrieval-augmented models
  across a variety of knowledge-intensive tasks including ELI5, automatically
  * evaluates LFQA models by the quality of both 
    * generated answers (ROUGE-L against reference answers) and 
    * retrieved documents (R-precision against human-annotated relevant docs).
* we build a SOTA system 1 for ELI5 by using a sparse Transformer variant (Roy+
  2020) to condition over Wikipedia paragraphs returned by a REALM-style
  retriever (Guu+ 2020).  
* hE, our system does not actually use the documents that it retrieves! To
  * we design a control experiment in which 
    retrieved documents are replaced with randomly-sampled documents at inferenc
  * both human A/B tests and automatic metrics like ROUGE-L demonstrate that
  * almost no effect on generated answer quality (Figure 1c).  We recommend that
  * partially due to significant train / validation overlap in the ELI5 dataset
* human study shows that 
  * at least 81% of validation questions have a paraphrase in the training set,
  * almost all validation questions are topically similar to a training question
  * While Fan+ (2018) attempted to identify question overlap using TF-IDF,
    more complex semantic matching methods & human verification is needed to
* we identify fundamental issues with using ROUGE-L to evaluate generated answer
  * Simple baselines such as just repeatedly copying the question, or choosing a
    random training set answer, can outperform LFQA systems such as RAG (Lewis+
    2020c) in terms of ROUGE-L. On the other hand, 
* our system achieves higher ROUGE-L than reference human-written answers, which
  * misleading since human A/B testers strongly prefer reference answers to ours
  * We conclude that ROUGE-L is not a reliable metric to evaluate LFQA 
    * due the large and relatively unconstrained output space of the task
    (e.g., compared to translation or summarization), and 
* we offer suggestions for better automatic & human evaluations to enable progre
