Overcoming Catastrophic Forgetting in Zero-Shot Cross-Lingual Generation
Tu Vu, Aditya Barua, Brian Lester, Daniel Cer, Mohit Iyyer, Noah Constant
EMNLP 2022 arXiv:2205.12647 [cs.CL]

# Abstract

* performing a generative task in a target language
  when labeled data is only available in English
  * we use summarization as a case study
  * strict setting with no access to parallel data or machine translation
  * common transfer learning approaches struggle in this setting, as
    * a generative multilingual model fine-tuned purely on English
      catastrophically forgets how to generate non-English
    * ie outputting English rather than the target language
* parameter-efficient adaptation techniques eg prompt tuning
* we: prompt tuning (Lester+ 2021) to overcome catast forget in cross-ling gen
* experiments show that parameter-efficient prompt tuning provides
  * gains over standard fine-tuning when transferring between less-related
    languages, eg from English to Thai
  * significant gap still remains between these methods and fully-supervised
  * two factors helped to mitigate this problem:
    * increasing model scale, and
    * decreasing the number of parameters tuned during adaptation
      * When all of a model’s weights are tuned on English (ModelTuning),
        forgetting is quick and severe
      * limiting the tunable parameters to a smaller soft prompt (PromptTuning)
        helps to combat forgetting
        * prompt size is an important variable to control
* To improve cross-lingual transfer further, we explore several approaches,
  * mixing in unlabeled multilingual data, and
    * always helpful
  * explicitly factoring prompts into recombinable language and task components
    * helpful at smaller model sizes, but has no benefit at larger sizes
    * further quality gains
* suggesting that robust zero-shot cross-lingual generation is within reach
* future work will continue to explore XGen tasks including WikiLingua-0, and
  * develop stronger zero-shot adaptation techniques

# 6 Conclusion
