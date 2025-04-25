PhonologyBench: Evaluating Phonological Skills of Large Language Models
Ashima Suvarna, Harshita Khandelwal, Nanyun Peng
arXiv:2404.02456 [cs.CL]

* Phonology, the study of speech's structure and pronunciation rules, is a
  critical yet often overlooked component in Large Language Model (LLM)
  research.
* applications that leverage phonology: educational tools and poetry generation.
* LLMs can potentially learn imperfect associations between orthographic and
  phonological forms from the training data. Thus, it is imperative to 
* we: PhonologyBench, a novel benchmark: three diagnostic tasks in English:
  grapheme-to-phoneme conversion, syllable counting, and rhyme word generation.
  * Despite having no access to speech data, LLMs showcased notable performance
  * a significant gap of 17% and 45% on Rhyme Word Generation and Syllable
    counting, respectively, when compared to humans. Our findings underscore the

# 1 Introduction

* tasks that benefit from a deep understanding of phonology. These applications
  * poetry generation, song writing, machine translation, and language
  learning (Ding+ 2024; Kwon, 2023; Yu+ 2024). For example, the 
  * generation of poetry and lyrics leverages the models’ knowledge of rhyme and
    meter to produce rhythmically engaging content. Similarly, 
  * multiling MT: phonetic transcriptions from related Dravidian languages can
    enhance the accuracy (Chakravarthi+ 2019). We argue that due to their
  * LLMs fail to perform phonological reasoning tasks in open-world scenarios
    (Peng+ 2023).
  * machine-generated poetry lacks diverse rhyming schemes (Vice, 2023)
