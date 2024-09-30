Syntax and Semantics Meet in the "Middle":
  Probing the Syntax-Semantics Interface of LMs Through Agentivity
Lindia Tjuatja, Emmy Liu, Lori Levin, Graham Neubig
`*`SEM 2023 arXiv:2305.18185 [cs.CL]

# Abstract

* how large LMs handle the interactions in meaning across words and larger
  syntactic forms ~~ ie phenomena at the intersection of syntax and semantics
* the semantic notion of agentivity as a case study for probing
* We created a novel evaluation dataset
* a subset of optionally transitive English verbs
* prompt varying sizes of three model classes to see
  * if they are sensitive to agentivity at the lexical level
  * if they can employ these word-level priors given a specific synt context
* Overall, GPT-3 text-davinci-003 performs extremely well across all expers,
  outperforming all other models tested by far
* better correlated with human judgements than synt and sem corpus stats
  * This suggests that LMs may potentially serve as more useful tools
    for linguistic annotation, theory testing, and discovery
    than select corpora for certain tasks
* from the conclu
  * GPT-3 davinci-003 performance does not appear to come from its size alone
    * perf does not increase monotonically across any of the model families
    * What aspects of model training/data contribute: future work
  * a number of linguistic confounders that make some examples more ambiguous
    * a qualitative analysis of what davinci-003 gets incorrect reveals them
    * more ambiguous to humans as well
    * ie The model can “pick out” these linguistically interesting examples,
    * potential of LMs as tools for linguistic discovery for new phenomena,
    * eg finding new, unexpected classes of words or syntactic constructions

# 1 Intro

* agent and patient roles are not discrete categories, but rather
  * prototypes on opposite ends of a continuum. These “protoroles” have a
  * contributing properties such as causing an event for agents and
    undergoing change of state for patients (Dowty, 1991)
* near-identical syntactic structures that can give rise to different meanings
  depending on the individual lexical items as well as surrounding context
  * the minimal pair in (1) suggests that there are lexical semantic properties
    of the subjects that give rise to these two distinct readings
  * This author/passage writes easily
  * know from the meaning of author/passage that
    * authors are animate, have some degree of volition, and typically write
    * passages (of text) are inanimate, have no volition, and are typic written
  * infrequent pairings of semantic function and syntactic form
    a. Something writes this author easily
    b. This passage writes something easily
    * sem knowledge must somehow interact with the syntactic form of the sents
    * There is another reading of (2a), where this author is a recipient
      * this author in the recipient reading is closer to the patient role
* studying LMs as psycholinguistic subjects
  * largely focused on syntax and grammatical well-formedness
    (Futrell+ 2019; Linzen and Baroni 2021)
    * Tal Linzen and Marco Baron
      Syntactic structure from deep learning
      Annual Review of Linguistics 2021, 7(1):195–212
  * evaluate LMs on a variety of tests involving semantics and pragmatics
    * Ettinger (TACL 2020, 1907.13528), Kim and Linzen (2020), and Misra+ (2022)
    * Najoung Kim and Tal Linzen. EMNLP 2020
      COGS: A compositional generalization challenge based on sem interpret
    * Kanishka Misra, Julia Taylor Rayz, and Allyson Ettinger. 2022
      COMPS: Conceptual minimal pair sentences
        for testing property knowledge and inheritance in pre-trained LMs
      arXiv preprint arXiv:2210.01963
  * not investigate the interaction between the meanings associated with
    syntactic forms and those of individual lexical items
* we need to evaluate syntax and utilization of semantic knowledge +
  * interactions of meaning at different linguistic levels—ie morph, lex, phras
  * Exploring phenomena within the syntax-semantics interface is compelling
    * gives us access to specific aspects of semantics while allowing
      precise control over syntactic form between levels
* In this work, we probe the syntax-semantics interface of several LMs,
  focusing on the semantic notion of agentivity. We do this by
  prompting models to label nouns in isolation or in context as agents or pats
  from a curated test set of noun-verb-adverb combinations that display the
  alternation shown in example (1)
  * then compare the performance of LMs to human judgements and corpus stats
* learnability and acquisition perspective for both LMs and humans
  * acquire exceptions to a general “rule”
  * debate since early connectionist models (Rumelhart and McClelland, 1986)
  * insight to linguists, cognitive scientists, and NLP practitioners

# 3 Experimental Results

* We evaluate BLOOM (Scao+ 2022), GPT-2 (Radford+ 2019), & GPT-3 (Brown+ 2020)
  models of varying sizes for all experiments
  * models are highly sensitive to the ordering of examples (Lu+ 2021),
  => we run each experiment twice:
    * once with the order shown in Figure 1 where an agent is first (APAP)
    * with the first example moved to the bottom (PAPA ordering)
    * We compare models based on their average performance across both
    * some models are more sensitive to orderings than others; some models
    * eg text-davinci-003 is largely invariant to example ordering
    * Appendix D: results from both experiments
* three interconnected questions in a highly controlled syntactic setting:

## 3.1 ? sensitivity to aspects of word-level semantics indep of synt context,
and is such sensitivity aligned with human judgements?

## 3.2 Can models employ lexical sem where the syntax is ambiguous?
to determine the appropriate semantics of a sentence

## 3.3 Can models determine the semantics of a sentence from syntax,
disregarding lexical semantics when necessary?

# 4 A Closer Look at davinci-003

* Given that GPT-3 davinci-003 does extremely well
  * whether davinci-003 “fails” in similar ways to humans,
    ie  whether the nouns that are misclassified in the intransitive sentence
    setting (§3.2) are more ambiguous to humans as well
* In both APAP and PAPA orderings
  all or nearly all of what davinci-003 gets incorrect are patient subjects;
* all 78 incorrectly classified subjects of sentences in the APAP are patients,
* 69 of the 70 incorrect subjects in the PAPA ordering are patients
* compare this subset of nouns with the subset of nouns with a “patient” label
  (in the intransitive construction) that humans tend to rate as more agentive

# 5 Related Works

* psycholinguistics literature: how humans make use of the relationship between
  events described by verbs and
  nouns that may participate in these events
  * Tanenhaus+ (1989) and Trueswell+ (1994) focusing on garden-path sentences
    * humans utilize information about thematic fit to resolve ambiguity
  * McRae+ (1998) and Padó (2007) created
    human judgement datasets for thematic fit by asking
    humans to rate nouns associated with events (eg a crook arresting/being
    arrested by someone) on a scale from 1 (very uncommon/implausible) to 7
  * stimuli: the noun, the verb describing the event, and the role of the noun
  * compared to our dataset
    * they focus on the explicit relationship between the event and the noun,
    * our data is meant to focus on the relship between the prototypical role
      of a noun (out of context) and its role in a controlled synt environ
      * the agent/patient distinction to be a minimal pair resulting changing
        the noun in an identical surface form => the sets of nouns and verbs
        between their studies and ours only partially overlap
* LMs as psycholinguistic subjects
  (Futrell+ 2019; Ettinger 2020; Linzen and Baroni 2021)
  * probing LMs for sensitivity to the wellformedness of sentences containing
    various syntactic structures such as
    * subject-verb agreement (Linzen+ 2016)
    * relative clauses (Gulordava+ 2018; Ravfogel+ 2021)
    * filler-gap dependencies (Wilcox+ 2018)
  * Papadimitriou+ (2022) investigate how BERT classifies grammatical role of
    entities in non-prototypical syntactic positions, similar to our Exper 3
* evaluating and probing LMs for semantic/pragmatic knowledge
  * Ettinger (2020): a suite of tests drawn from human language experiments
    to evaluate commonsense reasoning, event knowledge, and negation
  * COGS challenge (Kim and Linzen, 2020)
    * tests with regards to argument alternation, related to ours
    * whether LMs can learn to generalize about passivization and
      unnacusative-transitive alternations in English
  * Misra+ (2022) test LMs for their ability to attribute properties to
    concepts and further test property inheritance
  * lexical semantics, Vulić+ (2020) investigate
    how type-level lexical information from words in context is stored
    * six typologically diverse languages
* methodologies from these research areas informed the construct of our expers
  * minimal pairs to form sentences with contrasting semantic roles is
    similar to the construction of the BLiMP dataset (Warstadt+ 2020) and other
  * treat the “agent”/“patient” labelling task as classification based on the
    generation probabilities of the labels, following Linzen+ (2016)’s method
    of using generation probabilities for grammaticality judgements
* NLP work inspired by Construction Grammar (CxG, Goldberg 1995; Croft 2001)
  * CxG a branch of theories within cognitive linguistics that posits that
    constructions ~~ form-meaning pairings ~~ are the basic building blocks
  * Mahowald (2023) conducted a similar prompting experiment on the English
    Article-Adjective-Numeral-Noun construction
    * hE focused on grammaticality judgements as opposed to aspects of sem
  * Weissweiler+ (2022) probe for both syntactic and semantic understanding of
    the English comparative correlative
    * compar with us
      * we analyze the impact of individual lexical items
        in otherwise identical syntactic construction
      * they analyze competence of the construction as a whole
  * Li+ (2022) find that sentences sharing the same argument structure
    constructions (ASCs) are closer in the embedding space
    than those sharing the main verb
    * in light of our results, an interesting direction would be to see
      if sentences of the same surface construction may
      cluster based on finer-grained semantic distinctions
* LMs as a tool for discovery in theoretical linguistics
  * Petersen and Potts (2022) demonstrate this in lexical semantics
    through a case study of the English verb _break_
  * we: davinci-003’s extremely high correlation with human judgements
