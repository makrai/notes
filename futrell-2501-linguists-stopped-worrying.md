How Linguistics Learned to Stop Worrying and Love the Language Models
Richard Futrell, Kyle Mahowald
arXiv:2500.17047 [cs.CL]

* LMs can contribute to fundamental questions about linguistic structure,
  language processing, and learning.
* They force us to rethink arguments that have been foundational in linguistics
* they do not replace linguistic structure and theory, 
* they serve as proofs of concept for gradient, usage-based approaches 

# 1 Intro

* It’s 1968, and Norm and Claudette are having lunch. Norm is explaining his
* Norm says he is interested in human language and the human mind, found HAL
  creepy, and isn’t sure why Claudette is so interested in building chatbots or
* all Claudette wants is a machine that talks and understands.  She doesn’t
  really care how it happens. Norm and Claudette have very different goals, but
* Fast forward to 2025. 
  * Norm has worked for decades on a variety of diverse languages, developing
    sophisticated theories of linguistic structure.
  * Claudette got more and more interested in engineering,
    amassing huge amounts of data, and training statistical models. Norm and
  * How relevant is it that the architecture of Claudette’s machines seems to
    have nothing to do with the structure of language as identified by Norm and
  * what if Norm was right about the nature of language— does that mean the
    machines aren’t actually as impressive as Claudette thinks, because they
    are relying on shallow pattern matching? 
  * Or are Claudette’s machines evidence that Norm’s theories were wrong?  More
  * a view: neural networks are no more relevant to linguistics than submarine
    engineering is to an ichthyologist—just because both submarines and fish
    can move underwater does not mean that you can learn much about one from
    studying the other.
* LMs have access to so much more data, that whatever they are doing is
  irrelevant for humans (Chomsky+ 2023; Fox and Katzir, 2024; Bolhuis+ 2024)
  * Some have denied that language models could learn the putatively key
    properties of human language, and thus are (Lan+ 2024; Fox and Katzir, 2024)
  * neural network sequence models could learn to approximate anything, so 
    ~> the fact that they seem to learn language is uninformative 
    (Rawski and Baumont, 2023; Moro+ 2023; Chomsky, 2023; Chomsky+ 2023;
    Collins, 2024; Bolhuis+ 2024)
    * LMs are like epicycles, the computational technique used by Ptolemy to
      predict the motions of the planets and the sun in a model that placed the
      Earth at the center of the universe (de Santillana, 1955; Flynn, 2013).
    * <~ epicycles can approximate any trajectory arbitrarily well (at the cost
      of great complexity), so the mere fact that they could be used to capture
* we: LMs do learn non-trivial aspects of linguistic structure, and 
  they do give important insights that change how we should think about
  language. As language scientists, we ignore them at our peril.
* An opposite approach is to dismiss traditional theories of linguistic struct,
  * either useless or of negative value in developing the only known systems
    that can actually use lang as humans do (Jelinek, 2004; Piantadosi, 2023)
  * this view is widespread in some engineering and application-focused communs
  * throws out hard-won analytical discoveries about the structure of language
* but
  * ? scientific theory of language, without 
  * ? a way to approach the question of why human language is the way it is, or
  * ? what the interesting questions are. Moreover, language models are
  * LM are currently most successful in English and other languages with
    internet-scale data (Blasi+ 2022). 
  * A more complete approach to the science of language will draw on the
    expertise of documentary linguists, sociolinguists, anthropologists, and
    community stakeholders, and it will integrate the insights from decades of
    linguistic inquiry.
* third view in linguistics, cognitive science, and philosophy
  (Smolensky, 1988; Pater, 2019; Portelance and Jasbi, 2023; McGrath+ 2024;
  Millière, 2024; Potts, 2025; Chesi, 2025): 
  * language models are not a complete theory of language—in fact, no one has
  * they are hugely informative about language and its structure, learning,
    processing, and relationship with the larger structure of the mind.
  * LMs have set off an intellectual explosion in cognitive science, machine
    learning, philosophy of mind, and other fields, in which 
    * longstanding ideas have been overturned; novel ideas are emerging; and
      disciplinary boundaries are dissolving. Linguistics has a chance to 
    * LMs can stand at the center of this huge intellectual ferment, and would
      be remiss to isolate itself intellectually on the basis that language
  * don’t look like existing theory. 
  * Language science already has contributed to the development of LMs
  * language models already have contributed insights about language.

# 2 Statistical models of language have outperformed expectations

## 2.1 A brief history of statistical language learning

* The effective conclusion from [the Colorless green] arguments was that
  linguistic structure could only be characterized in terms of formal systems,
  based on rules or constraints and operating over structured arrays of symbols
  (Chomsky, 1965)
  * the expectation was that such systems would form the basis for language
    technologies such as machine translation and question answering systems
    (Hays, 1960; Winograd, 1972; Hutchins, 1981). It was believed that these
    * Hays, D. G. (1960). Linguistic research at the RAND corporation. 
      In Proceedings of the National Symposium on Machine Translation.
    * Winograd, T. (1972). Understanding natural language. 
      Cognitive Psychology, 3(1):1–191.
    * Hutchins, W. J. (1981). The evolution of machine translation systems.
      In Lawson, V., editor, Translating and the Computer: Practical Experience
  * these formal systems should be constructed by linguists since the task of
  * myriad efforts to build machine translation systems, grammatical parsers,
  * hE linguistic competence remained elusive for machines.
  * Symbolic approaches that sought to elucidate rules and structures often
    proved unable to capture all the exceptions and complexity that
* By the late 1980s and 1990s, statistical learning had a major NLP renaissance in
  * NLP (Brown+ 1990; Manning and Schütze, 1999; Pereira, 2000), and
  * human language learning literature as well (Saffran+ 1996). Yet
  * hE unable to get past approaches that simply counted up words and phrases
    (Wang and Manning, 2012; Arora+ 2017).
* The connectionist movement in the 1980s and 90s seemed promising 
  (Rumelhart and McClelland, 1986; Smolensky, 1988; Elman, 1990a) (and turned
  * well-justified concerns about the ability of these approaches to scale up
    and to represent the rules and structures (Pinker and Prince, 1988)
  * they can implement rule-like symbolic behavior (Smolensky, 1990)
  * Even researchers optimistic about the role of statistical learning in
    skeptical that end-to-end neural approaches would succeed 
  * Chater+ (2006): ``despite having considerable psychological interest'' 
  * Tenenbaum+ (2011)
    * connectionist models ... deny that brains actually encode rich knowledge,
    * strong consensus in cognitive science and artificial intelligence that
      symbols and structures are essential for thought.” Nevertheless, given
  * now sometimes taken for granted in practice that ideas from linguistic
    theory will not form the basis of proficient language processing systems.
* generative linguists continued to claim that 
  statistical methods would never solve interesting problems related to
  learning linguistic structure. eg a review article, Everaert+ (2015)
* Berwick+ (2011) were skeptical that recurrent neural networks could ever be
  much more powerful than bigram models.
* connectionism in the 2010s: new techniques and increased computational power
  that made training neural models much more efficient (Hinton+ 2006). By 
  * neural models showed rudiments of grammatical generalizations like
    subject–verb agreement (Linzen+ 2016). Over the coming years, the 
  * success at acquiring linguistic abilities conti (Futrell+ 2019a; Wilcox+
    2018; Manning+ 2020; Hu+ 2020; Warstadt and Bowman, 2022; Mahowald+ 2024)
  * growth from early neural models in, eg 2011 to now is 
    remarkable from a historical perspective, and was surprising to virtually
    everyone in the field at the time. 
  * Sutskever+ (2011) introduced an at-the-time state-of-the-art RNN that
    produced output like “In the show’s agreement unanimously resurfaced. The
    wild pasteured with consistent street forests were incorporated by the 15th
    century BE.”

## 2.2 Neural LMs learn nontrivial linguistic structure

* word frequency, utterance length, online processing constraints such as
  memory limitations, and plausibility given world knowledge all feed into the
  probability of an utterance. Indeed, not only utterance probabilities, but
  * also comprehension accuracy, reaction time, and indeed any psychometric
    dependent variable are affected by all of these factors jointly—including
    the subjective grammaticality judgments that form the basis of formal synt
    (Kluender and Kutas, 1992; Hofmeister+ 2013; Mahowald+ 2016; Lau+ 2017).
* isolate linguistic structure from these other factors through
  controlled experimental studies and through probing LMs’ internal states.
Experimentally, from sufficient performance data, one may infer an underlying
formal cognitive structure, no matter whether the implementation substrate is a
brain or a neural network (Piantadosi and Gallistel, 2024). This is the
standard procedure in linguistics, where data consisting primarily of
acceptability judgments is used to postulate underlying linguistic competence.
This approach can be applied just as well to LMs.
  * eg behavioral comparisons of minimally different sentences.
  * “The keys to the cabinet are on the table” and 
  * the ungrammatical “The keys to the cabinet is on the table”, and the
    conditional probabilities assigned to the verb form “are” versus “is” are
  * The lexical frequency of “is” versus “are” can be controlled through a more
    elaborate experimental design, with four conditions in a 2 × 2 design
    crossing the grammatical number of the subject with the grammatical form of
    the verb (as done by Marvin and Linzen, 2018). These are 
  * usual procedures in psycholinguistics, where experimenters develop
  * The same methodology can be applied to language models with probability as
    the dependent variable (Linzen+ 2016; Futrell+ 2019b).
* Such studies have revealed behavioral patterns consistent with NNs
  * subject–verb agreement
    (Linzen+ 2016; Bernardy and Lappin, 2017; Gulordava+ 2018)
  * filler–gap dependencies
    (Wilcox+ 2018, 2023a; Kobzeva+ 2023; Suijkerbuijk+ 2023)
  * recursive embedding of clauses
    (Futrell et al., 2019b; Wilcox+ 2019a; Hu+ 2020), all of which involve
  * ie highly nontrivial formal structures which statistical models failed to
  * fig 1: Example results for subject–verb agreement from GPT-2 are shown in
    Figure 1: we see that grammatical verb forms are relatively more probable
    than matched ungrammatical verb forms in all but a few cases (human
    accuracy in producing the right verb forms in such sentences is 85%; Marvin
    and Linzen, 2018).3 The results indicate that the model can represent the
    non-local structural dependency between the subject of the sentence and the
    matrix verb.
* Models can be “right for the wrong reasons” (McCoy+ 2019), adopting 
  * ie shallow heuristics which make correct predictions on certain test sets
  * or mastery of linguistic form without a concomitant ability to understand
    the implications of utterances (Weissweiler+ 2022, Mahowald+ 2024)
  * eg a simple n-gram model performs fairly well on some subsets of paired
    grammatical and ungrammatical sentences of the BLiMP dataset (Warstadt+
    2020) (although not as well as a neural LM), which does not explicitly
    control for n-gram frequency (Vázquez Martínez+ 2023).4
* ~> deeper investigation. We discuss two approaches here. The first involves
1. controlling a model’s training data and then observing its generalizations
   on evaluation data that is unlike anything in the training data
  (Jumelet+ 2021; Feng+ 2024b; Misra and Mahowald, 2024; Leong and Linzen,
  2023; Yao+ 2025)
* Ahuja+ (2025) trained Transformer language models on a corpus of 
  * English-like text that has been constrained so that subjects and verbs
    are always adjacent. That is, the corpus contains sentences like “I saw
  * ? preferring “The key to the cabinets is on the table” over something
    like “The key to the cabinets are on the table” (where the form of the
    verb depends on the linearly previous verb)
  * neural language models do make the human-like generalization, providing
  * (see also Patil+ 2024).
2. dig into the language models’ internal states. 
  * LLMs have a reputation of being black boxes :-)
  * nL
    * probing: attempts to decode linguistic features from the internal reprs
    * causal interventions, where model internals are changed and the
  (Hewitt and Manning, 2019; Chi+ 2020; Voita and Titov, 2020; Manning+ 2020;
  Papadimitriou+ 2021; Ravfogel+ 2021; Lampinen, 2024; Diego- Simón+ 2024)
    * promising avenues for linguistics and cognitive science (see Section 4.2)
* hE mostly English (or a handful of other langs) as the target (Blasi+ 2022).
  * see Jumelet+ 2025, for a multilingual grammatical benchmark).
* disagreement about 
  * how much language models capture more complex formal patterns
    (Vázquez Martínez+ 2023; Lan+ 2024; Someya+ 2024) or 
  * to what extent they can be said to “understand” (Bender and Koller, 2020)
  * refer to things in the world
    (Mandelkern and Linzen, 2024; Lederman and Mahowald, 2024), this is not the
* clear: LMs have learned nontrivial formal linguistic patterns better than
* LMs have learned “the real thing”—that is, the thing that we care about, as
  * eg how languages are learned, how they are processed, how and why they
    vary, and where they come from.

# 3 The success of LMs is interesting for the science of language

## 3.1 Parallels between engineering models and cognition

## 3.2 Understanding LM success requires rethinking language learning

### 3.2.1 The significance of the learning problem in linguistics and cognitive science

### 3.2.2 The modern view on learning

### 3.2.3 The upshot for linguistic theory

### 3.2.4 The question of data quantity

## 3.3 Language models and linguistic traditions

### 3.3.1 The generative tradition of linguistics

### 3.3.2 The statistical tradition of linguistics

# 4 Where does that leave the science of language?

How the science of language productively integrates the LM insights

## 4.1 Linguistic structure is real

## 4.2 What LM interpretability can tell us about human language

## 4.4 What the inductive biases of LMs can tell us about language

## 4.6 Functional explanations for human language

## 4.7 Upshots for linguistics beyond language structure

# 5 Conclusion
