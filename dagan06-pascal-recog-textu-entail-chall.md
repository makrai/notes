The PASCAL Recognising Textual Entailment Challenge
Ido Dagan, Oren Glickman, and Bernardo Magnini
2006 Springer

## 1.1 Rational

* applications, such as 
  * Question Answering (QA),
  * Information Extraction (IE),
  * (multi-document) summarization, and 
  * machine translation (MT) [evaluation]
* related work
  * relation between Textual Entailment and some classical linguistic notions
    such as presupposition and implicature see [16]
  * fuzzy or uncertain inference (e.g. [1], [8], [9])

## 1.2 The Challange Scope

* Each portion of the dataset was intended to include typical T -H examples
  that may correspond to success and failure cases of the actual applications
  * levels of entailment reasoning, based on lexical, syntactic, logical and
    world knowledge, at different levels of difficulty
  * biased to choosing nontrivial pairs,

# 2 Dataset Preparation and Application Settings

## 2.1 Application Settings

* Information Retrieval (IR)
* Comparable Documents (CD)
* Reading Comprehension (RC)
* Question Answering (QA)
* Information Extraction (IE)
* Machine Translation (MT)
* Paraphrase Acquisition (PP)

## 3.3 Submitted Systems and Results

* degree of word overlap between T and H, 
  * possibly including stemming, lemmatization, part of speech tagging, and
    applying a statistical word weighting such as idf.
* relationships between words that may reflect entailment, based either on
  statistical methods or WordNet. Next, some systems measured the degree of
* match between the syntactic structures of T and H, based on some distance
  criteria. Finally, few systems incorporated some form of 
* “world knowledge”, and a few more applied a 
* logical prover for making the entailment inference, typically over
  semantically enriched representations.  Different 
* decision mechanisms
  * probabilistic models, probabilistic Machine Translation models, supervised
    learning methods, logical inference and various specific scoring
    mechanisms

# 4 Discussion

* Assumed Background Knowledge.
  * “Grew up in Yemen” → “Speaks Arabic”.
* Inference Scope
  * temporal reasoning, complex logical inference or arithmetic calculations
    (see example 1911 from Table 1) were typically avoided

# 5 Conclusions

* further efforts can be made to create “natural” distributions of
  Text-Hypothesis examples. For example, 
  * T -H pairs may be collected directly from the data processed by actual
    systems, considering their inputs and candidate outputs. An additional
  * collect a set of multiple candidate texts that might entail a given single
    hypothesis, thus reflecting typical ranking scenarios. Data collection
  * focuse on typical “core” semantic applications, such as QA, IE, IR and
    summarization.
