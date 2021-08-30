A Simple Recipe towards Reducing Hallucination in Neural Surface Realisation
Feng Nie, Jin-Ge Yao, Jinpeng Wang, Rong Pan, Chin-Yew Lin
    ACL 2019

# Abstract

* Recent neural language generation systems often hallucinate contents
  (irrelevant or contradicted facts),
  especially when trained on loosely corresponding pairs of the input structure
  and text. To mitigate this issue,
* we propose to integrate a language understanding module for data refinement
  * self-training iterations to effectively induce strong input output equiv
* Experiments on the E2E challenge dataset show that our proposed framework can
  reduce more than 50% relative unaligned noise from the original data-text
  * A vanilla sequence-to-sequence neural NLG model trained on the refined data
    has improved on content correctness
    compared with the current SOTA ensemble generator

# 1 Intro

* NLG models often suffer from content hallucination (Reiter, 2018a)
  * less reported or noticed in the latest neural machine translation systems,
  * issue for neural NLG comes from the data side. Current datasets used for
  * training instances that do not contain the same amount of information from
    (Perez-Beltrachini and Gardent, 2017). There is no exception for
  * e.g. datasets  originally intended for surface realisation (“how to say”)
    * the attribute Rating=5 out of 5 in the input meaning representation (MR)
      is not verbalised in a reference text written by human, while the word
    * attribute value EatType=Restaurant not contained in the MR. Without
* Previous work attempted at
  * injecting indirect semantic control over the encoder-decoder architecture
  (Wen+ 2015; Dušek and Jurcicek, 2016; Agarwal+ 2018) or
  * encouraging consistency during training (Chisholm+ 2017), without
  * Slug2Slug system (Juraska+ 2018), where the authors use an aligner with
    manually written heuristic rules to filter out unrealized attributes from
* In this paper, we propose a simple, automatic recipe towards reducing hallu
  * steps include:
    * Build a language understanding module (ideally well-calibrated) that tries
      to parse the MR from an utterance;
    * Use it to reconstruct the correct attribute values revealed in the
      reference texts;
    * With proper confidence thresholding, conduct self-training to iteratively
      recover data pairs with identical or equivalent semantics
* Experiments on the E2E challenge benchmark (Novikova+ 2017b) show that our
  * reduce more than 50% relative unaligned noise from original MR-text pairs,
  * a vanilla sequence-to-sequence model trained on the refined data can improve
    content correctness in both human and automatic evaluations, when compared
    with the current SOTA neural ensemble system (Juraska+ 2018)
