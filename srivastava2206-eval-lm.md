Beyond the Imitation Game:
  Quantifying and extrapolating the capabilities of language models
A Srivastava, A Rastogi, A Rao, A Awal Md Shoeb, A Abid, A Fisch, A R. Brown,
  A Santoro, A Gupta, A Garriga-Alonso, A Kluska, A Lewkowycz, A Agarwal, et al
arXiv:2206.04615 [cs.CL]

# Abstract

* Language models demonstrate both quantitative improvement and new qualitative
  capabilities with increasing scale. Despite their
  * potentially transformative impact
  * new capabilities are as yet poorly characterized. In order to
  * goal: inform future research, prepare for disruptive new model capabs, and
    ameliorate socially harmful effects, it is vital that we understand the
* we introduce the Beyond the Imitation Game benchmark (BIG-bench). BIG-bench
  * 204 tasks, contributed by 450 authors across 132 institutions
  * Tasks
    * topics drawn from linguistics, childhood development, math, common-sense
      reasoning, biology, physics, social bias, software devel etc . BIG-bench
    * that are believed to be beyond the capabilities of current LMs
* We evaluate the behavior of OpenAI's GPT models, Google-internal dense
  transformer architectures, and Switch-style sparse transformers on BIG-bench,
  across model sizes spanning millions to hundreds of billions of parameters
  * human expert raters performed all tasks: a strong baseline
* Findings include:
  * model performance and calibration both improve with scale, but are
  * poor in absolute terms (and when compared with rater performance);
  * remarkably similar across model classes, though with
    * benefits from sparsity
  * scaling dynamics
    * tasks that improve gradually and predictably commonly involve
      a large knowledge or memorization component, whereas
    * tasks that exhibit "breakthrough" behavior at a critical scale often
      involve multiple steps or components, or brittle metrics
* social bias typically increases with scale in settings with ambig context,
  but this can be improved with prompting

## 3.7 Performance on non-English languages

* large gaps for lower-resource languages and languages with non-Latin scripts
  (Ruder+ 2021). This is driven by a number of factors, including
  * uneven data quality in multilingual corpora (Kreutzer+ 2022),
  * challenges in obtaining data (McMillan-Major+ 2022), and
  * Anglo-centric biases in research design (Fan+ 2021; Talat+ 2022)
* BIG-bench includes a variety of tasks covering non-English languages, often
  * keywords: non-English (16), multilingual (12), low-resource language (10),
    translation (10)
  * the models we evaluate primarily target English-language understanding,
    performance on non-English tasks tends to be poor
  * scale: For certain non-English tasks, we observe performance gains with
    scale, but this is often not the case (see below)
  * eg Figure 14: Performance on entailed polarity increases with model scale
    for (a) the English version (entailed_polarity) of the task, but 
    * not for (b) the Hindi version (entailed_polarity_hindi) of the task
* parallel tasks in English and another language enable direct comparison
  * The clearest such cases are the entailed polarity tasks, which test
    understanding of entailment properties of different verbs in English and
    Hindi. Results are shown in Figure 14. While the English task sees
    increasing model performance with size (reaching 90% accuracy), the Hindi
    task shows no such trend, with some models performing below chance and none
    exceeding 70% accuracy
* Low-resource language tasks are particularly challenging. While most
  * no broadly accepted definition of “low-resource” (Hedderich+ 2021;
    Magueresse+ 2020), but as a
  * rough proxy: document count within the mC4 corpus (Xue+ 2021b)
    * If we consider the top 50 languages to be high-resource
      there are five BIG-bench tasks that involve low-resource langs (Tab 2)
* Performance of the evaluated models on low-resource languages is low
  * The swahili_english_proverbs task: Figure 15a
    * a multiple-choice task: find an appropriate English correspondence for a
      proverb from Swahili
    * Swahili: a Bantu language spoken by around
      100 million people in East Africa and written with a Latin script
    * increasing performance with model scale, with the
      * best model achieving 43% accuracy on when given four choices. However,
      * not clear whether memorization of proverbs listed on the internet
  * The kannada task poses multiple-choice riddles with four possible answers
    * Kannada, a Dravidian language spoken by around 40 million people in India
      * non-Latin script
    * Figure 15b: none of the evaluated models significantly exceeds random
  * language_identification, sentences, Figure 15c
    * The BIG-bench task covering the most low-resource languages is ,
    * Questions are posed as multiple choice with ten possible answers. The
    * vast majority of examples come from low-resource languages, with
      * 1,000 languages covered in total
    * performance is low, with the best models achieving around 17% accuracy
      * no clear trend of increasing performance with scale
