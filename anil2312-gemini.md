Gemini: A Family of Highly Capable Multimodal Models
Google: Rohan Anil, S Borgeaud, Y Wu, J Alayrac, J Yu, R Soricut,+

# Abstract

* This report introduces a new family of multimodal models, G that exhibit
  * remarkable capabilities across image, a video, a text understanding
  * The Gemini family consists of Ultra, P and Nano sizes, s for
  * applications ranging from complex reasoning tasks to on-device
    memory-constrained use-cases
  * Evaluation on a broad range of benchmarks shows that our most-capable
    Gemini Ultra model advances the SOTA in 30 of 32 of these benchmarks -
    * the first model to achieve human-expert performance on the well-studied
      exam benchmark MMLU, a
    * improving the SOTA in every one of the 20 multimodal benchmarks we
      examined

# 1. Intro

* Gemini 1.0, our first version, comes in three sizes:
  * Ultra for highly-complex tasks,
  * Pro for enhanced performance and deployability at scale, and
  * Nano for on-device applications. Each size is specifically tailored to
  * We evaluate the performance of Gemini models
    on a comprehensive suite of internal and external benchmarks covering a
    wide range of language, coding, reasoning, and multimodal tasks.
* The AlphaCode team built AlphaCode 2 (Leblond+ 2023),
  a new Gemini-powered agent, that combines Gemini’s reasoning capabilities
  with search and tool-use to excel at solving competitive programming
  problems.
  AlphaCode 2 ranks within the top 15% of entrants on the Codeforces
  competitive programming platform, a large improvement over its SOTA
  predecessor in the top 50% (Li+ 2022).
* Gemini Nano, a series of small models targeting on-device deployment. These
  * tasks, such as summarization, reading comprehension, text completion tasks,
    reasoning, STEM, coding, multimodal, and multilingual tasks

# 2 model architecture

# 3 training infrastructure

# 4 training dataset. We then present detailed

# 5 evaluations of the Gemini model family, covering well-studied benchmarks
and human-preference evaluations across text, code, image, audio and video —
which include both English performance and multilingual capabilities. We also
discuss our approach to

# 6 responsible deployment

## impact assessments

## developing model policies

## evaluations

## mitigations of harm before

## deployment decisions

# 7. Discussion and Conclusion

* In the natural language domain, the performance gains from careful
  developments in data and model training at scale continue to deliver quality
  improvements, setting new SOTA in several benchmarks. In particular, Gemini
* MMLU has been a defacto measure of progress for LLMs ever since it was first
  released in 2020
* multimodal domain, Gemini Ultra sets new SOTA on most of the image
  understanding, video understanding, and audio understanding benchmarks
  without task-specific modifications or tuning. In particular,
  * Gemini Ultra has SOTA performance on the recent MMMU benchmark (Yue+ 2023),
    * MMMU comprises questions about images requiring college-level subject
      knowledge and deliberate reasoning.
* new use cases enabled by Gemini models. The new capabilities of Gemini models
  * eg
    * parse complex images, such as charts or infographics,
    * reason over interleaved sequences of images, audio, and text, and
    * generate interleaved text and images as responses open a wide variety of
  * can enable new approaches in eg education, everyday problem solving,
    multilingual communication, information summarization, extraction, and
    creativity. We expect that the users of these models will find all kinds of
* limitations to the use of LLMs.
  * a continued need for ongoing research and development on “hallucinations”
  * high-level reasoning abilities like causal understanding,
    logical deduction, and counterfactual reasoning even though they achieve
    * need for more challenging and robust evaluations to measure their true
