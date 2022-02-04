from Speech and Language Processing Second Edition
Daniel Jurafsky and James H. Martin

## 1 Introduction

* The idea of giving computers the ability to process human language is
  * as old as the idea of computers themselves. This book is about the
  * a vibrant interdisciplinary field with
    * many names corresponding to its many facets, names like
      speech and language processing, human language technology, natural
      language processing, computational linguistics, and speech recognition
      and synthesis
  * The goal of this new field is to
    get computers to perform useful tasks involving human language, tasks like
    enabling human-machine communication, improving human-human communication,
    or simply doing useful processing of text or speech.
* conversational agent
* machine translation
* Web-based question answering
  * definition questions, or simple factoid questions like dates and locations,
    can already be answered by search engines
  * more complicated questions might require extracting information that is
    embedded in other text on a Web page, doing
    * inference (drawing conclusions based on known facts), or
    * synthesizing and summarizing information from multiple sources 
    * components including information extraction, word sense disambiguation,
* other tasks: spelling correction, grammar checking
* research areas + technologies are already available commercially
* In the rest of this chapter, we briefly summarize
  * the kinds of knowledge that are necessary for these tasks
  * the mathematical models that are introduced throughout the book.

## 1.1 Knowledge in Speech and Language Processing 

* eg the Unix wc program, which counts the total number of bytes, words, and ls
  * when it is used to count the words in a file, it requires knowledge about
    what it means to be a word and thus becomes a language processing system.
* HAL must be able to
  * speech recognition and speech synthesis
    require knowledge about phonetics and phonology
    * how words are pronounced in terms of sequences of sounds and how each of
      these sounds is realized acoustically.
  * Producing and recognizing word forms 
    * variations of individual words (e.g., recognizing that doors is plural)
    * morphology, the way words break down into component parts that carry
      meanings like singular versus plural.
  * sentence structure, word order: syntax
* eg QA (1.2) How much Chinese silk was exported to Western Europe by the end
  of the 18th century?
  * lexical semantics, the meaning of all the words (export or silk) as well as
  * compositional semantics (what exactly constitutes Western Europe as opposed
    to Eastern or Southern Europe, what does end mean when combined with the
    18th century. We also need to know something about the
  * relationship of the words to the syntactic struc. eg by prase goal or agt
    * _by the end of the 18th century_ is a temporal end-point and not agt
    * agent: (1.3) How much Chinese silk was exported to Western Europe by sou?
  * Dave’s utterance is a request for action, as opposed to a simple statement
  * be polite to Dave. It could, for example, have simply replied No or No, I
    * embellishes its response with the phrases I’m sorry and I’m afraid, and
    * only indirectly signals its refusal by saying I can’t, rather than the
      more direct (and truthful) I won’t
    * pragmatic or dialogue knowledge.
* coreference resolution: how words like _that_ or pronouns refer to previous
  * eg QA (1.4) How many states were in the United States that year?
* To summarize: required various kinds of knowledge of language:
  * Phonetics and Phonology — knowledge about linguistic sounds 
  * Morphology — knowledge of the meaningful components of words 
  * Syntax — knowledge of the structural relationships between words 
  * Semantics — knowledge of meaning 
  * Pragmatics — knowledge of the relationship of meaning to the goals and
    intentions of the speaker
  * Discourse — knowledge about linguistic units larger than a single utterance

## 1.2 Ambiguity 

## 1.3 Models and Algorithms 

## 1.4 Language, Thought, and Understanding 

## 1.5 The State of the Art 

## 1.6 Some Brief History 

### 1.6.1 Foundational Insights: 1940s and 1950s 

### 1.6.2 The Two Camps: 1957–1970 

### 1.6.3 Four Paradigms: 1970–1983 

### 1.6.4 Empiricism and Finite State Models Redux: 1983–1993

### 1.6.5 The Field Comes Together: 1994–1999 

### 1.6.6 The Rise of Machine Learning: 2000–2007 

### 1.6.7 On Multiple Discoveries 

### 1.6.8 A Final Brief Note on Psychology 

## 1.7 Summary 

## Bibliographical and Historical Notes 
