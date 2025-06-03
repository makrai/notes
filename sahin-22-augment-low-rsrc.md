To Augment or Not to Augment? A Comparative Study on Text Augmentation Techniques for Low-Resource NLP
Gözde Gül Şahin
Computational Linguistics, Volume 48, Issue 1 - March 2022

# Abstract

* Data-hungry sequence tagging deep neural networks have established themselves
  * SOTA performance on high-resource languages, they still fall
  * behind their statistical counterparts in low-resource scenarios
  * One methodology to counterattack this problem is text augmentation, that
    * generating new synthetic training data points from existing data
    * recently several new textual augmentation techniques, the field still
    * lacks a systematic performance analysis
      on a diverse set of languages and sequence tagging tasks
* we investigate
  * three categories of text augmentation methodologies by change level
    * syntax (eg cropping sub-sentences),
    * token (eg random word insertion),
    * character (eg character swapping) levels
  * tasks: part-of-speech tagging, dependency parsing, and semantic role label
  * a diverse set of language families using
  * various models, including the architectures that rely on pretrained
    multilingual contextualized language models such as mBERT
* Augmentation most significantly improves dependency parsing, followed by
  part-of-speech tagging and semantic role labeling
  * more effective on morphologically rich languages in general rather than
    analytic languages such as Vietnamese
  * augmentation techniques can further improve over strong baselines based on
    mBERT, especially for dependency parsing
  * methods
    * character-level methods as the most consistent performers, while
    * synonym replacement and syntactic augmenters provide inconsistent
  * results most heavily depend on the
    * task,
    * language pair (eg syntactic-level techniques mostly benefit
      higher-level tasks and morphologically richer languages), and
    * model type
      * token-level augmentation provides significant improvements for BPE,
      * character-level ones give generally higher scores for
        char and mBERT based models
