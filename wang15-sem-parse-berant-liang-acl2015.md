Building a Semantic Parser Overnight
Yushi Wang, Jonathan Berant, Percy Liang @ Stanford
2015 ACL

# Abstract

* build a semantic parser in a new domain starting with zero training examples?
* We introduce a new methodology for this setting
  * generate logical forms paired with canonical utterances
    * use[ing] a simple grammar to
    * logical forms are meant to cover the desired set of compositional
      operators, and the canonical utterances are meant to capture the meaning
      of the logical forms (although clumsily). We then use
    * crowdsourcing to paraphrase these canonical utterances into natural
      utterances
    * resulting data is used to train the semantic parser
  * We further study the role of compositionality in the resulting paraphrases
  * we test our methodology on seven domains and show that
    * we can build an adequate semantic parser in just a few hours

# 1 Introduction

* semantic parsers
  *  mapping natural language utterances to executable logical forms,
  * applications requiring precise language understanding (Zelle and Mooney,
    1996; Zettlemoyer and Collins, 2005; Liang+ 2011; Berant+ 
    2013; Kwiatkowski+ 2013; Artzi and Zettlemoyer, 2013; Kushman and
    Barzilay, 2013)
* functionality-driven process:
  1. the builder writes a seed lexicon specifying a canonical phrase
     _publication date_ foreach predicate `publicationDate`
  2. our framework uses a domain-general grammar, along with the seed lexicon
     and the database, to automatically generate a few hundred canonical
     utterances paired with their logical forms (eg,
     _article that has the largest publication date_
     `arg max( type.article , publicationDate )`
  3. crowdsourcing to paraphrase each canonical utterance into a few natural
     utterances (eg, “what is the newest published article?”)
  4. train a semantic parser

## Linguistic reflections

* design a simple grammar that
  * simultaneously generates both logical forms and canonical utterances so
    that the utterances are understandable by a human?
  * In Section 3, we show how to choose appropriate canonical utterances to
    maximize alignment with the logical forms
* sublexical compositionality
  * lexical unit (“came after”) maps onto a multi-predicate logical form
    * we only need to crowdsource a small number of canonical utterances to
      learn about most of the language variability in the given domain
      (Section 4)
* seven domains, which were chosen to explore particular types of phenomena,
  such as spatial language, temporal language, and high-arity relations
  * seven new semantic parsing datasets, totaling 26K examples
  * not tuned on any one domain, was able to obtain an
    * average accuracy of 59% over all domains

# 8 Related work and discussion

* semantic parsing [with] large knowledge bases such as Freebase
  (Cai and Yates, 2013; Kwiatkowski+ 2013; Berant+ 2013)
* question answering datasets (Free917 and WebQuestions) are limited in
  compositionality
* specialized domains with specialized jargon will always exist, eg, in
  regular expressions (Kushman and Barzilay, 2013) or grounding to perception
  (Matuszek+ 2012; Tellex+ 2011; Krishnamurthy and Kollar, 2013)
* reducing supervision
  * from logical forms (Zettlemoyer and Collins, 2005; Wong and Mooney, 2007)
  * to denotations (Clarke+ 2010; Liang+ 2011) and to
  * weaker forms (Artzi and Zettlemoyer, 2011; Reddy+ 2014)
  * Our methodology [is] paraphrasing
* Paraphrasing has been applied to
  * single-property question answering (Fader+ 2013) and
  * semantic parsing (Berant and Liang, 2014)
* directl parsing
  * rule-based systems (Woods+ 1972; Warren and Pereira, 1982) or
  * controlled natural languages (Schwitter, 2010)
  * [our] grammar [in contrast]
    * need only connect a logical form to one canonical utterance
    * not used directly for parsing
* future work ... anaphora and nested quantification
