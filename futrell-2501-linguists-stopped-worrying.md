How Linguistics Learned to Stop Worrying and Love the Language Models
Richard Futrell, Kyle Mahowald
arXiv:2500.17047 [cs.CL]

* LMs can contribute to fundamental questions about linguistic structure,
  language processing, and learning
* They force us to rethink arguments that have been foundational in linguistics
* they do not replace linguistic structure and theory,
* they serve as proofs of concept for gradient, usage-based approaches

# 1 Intro

* It’s 1968, and Norm and Claudette are having lunch
* Norm says he is interested in human language and the human mind, found HAL
  creepy, and isn’t sure why Claudette is so interested in building chatbots
* all Claudette wants is a machine that talks and understands.  She doesn’t
  really care how it happens. Norm and Claudette have very different goals, nL
* Fast forward to 2025
  * Norm has worked for decades on a variety of diverse languages, developing
    sophisticated theories of linguistic structure
  * Claudette got more and more interested in engineering,
    amassing huge amounts of data, and training statistical models
  * How relevant is it that the architecture of Claudette’s machines seems to
    have nothing to do with the structure of language as identified by Norm
  * what if Norm was right about the nature of language— does that mean the
    machines aren’t actually as impressive as Claudette thinks, because they
    are relying on shallow pattern matching?
  * Or are Claudette’s machines evidence that Norm’s theories were wrong?
  * a view: neural networks are no more relevant to linguistics than submarine
    engineering is to an ichthyologist [halkutató]
    * just because both submarines and fish can move underwater does
      not mean that you can learn much about one from studying the other
* LMs have access to so much more data, that whatever they are doing is
  irrelevant for humans (Chomsky+ 2023; Fox and Katzir, 2024; Bolhuis+ 2024)
  * Some have denied that LMs could learn the putatively key
    properties of human language (Lan+ 2024; Fox and Katzir, 2024)
  * neural network sequence models could learn to approximate anything
    ~> the fact that they seem to learn language is uninformative
    (Rawski and Baumont, 2023; Moro+ 2023; Chomsky, 2023; Chomsky+ 2023;
    Collins, 2024; Bolhuis+ 2024)
    * LMs are like epicycles, the computational technique used by Ptolemy to
      predict the motions of the planets and the sun in a model that placed the
      Earth at the center of the universe (de Santillana, 1955; Flynn, 2013)
    * <~ epicycles can approximate any trajectory arbitrarily well (at the cost
      of great complexity)
* we: LMs do learn non-trivial aspects of linguistic structure, and
  they do give important insights that change how we should think about
  language. As language scientists, we ignore them at our peril
* An opposite approach is to dismiss traditional theories of ling struct,
  * either useless or of negative value in developing the only known systems
    that can actually use lang as humans do (Jelinek, 2004; Piantadosi, 2023)
  * this view is widespread in some engineering and applic-focused communities
  * throws out hard-won analytical discoveries about the structure of language
* but
  * ? scientific theory of language, without
  * ? a way to approach the question of why human language is the way it is
  * ? what the interesting questions are
  * LMs are currently most successful in languages with internet-scale data
    (Blasi+ 2022)
  Blasi, D., Anastasopoulos, A., and Neubig, G. (2022).
  Systematic inequalities in lang tech performance across the world‘s languages
  ACL 2022
  * A more complete approach to the science of language will
    draw on the expertise of
    documentary linguists, sociolinguists, anthropologists, and community
    stakeholders, and it will integrate the insights from decades of ling inqu
* third view in linguistics, cognitive science, and philosophy
  (Smolensky, 1988; Pater, 2019; Portelance and Jasbi, 2023; McGrath+ 2024;
  Millière, 2024; Potts, 2025; Chesi, 2025):
  * bib
    * Smolensky, P. (1988). On the proper treatment of connectionism. Behavioral
    * Pater, J. (2019)
      Generative linguistics and neural networks at 60:
        Foundation, friction, and fusion.
      Language, 95(1):e41–e74. Publisher: Linguistic Society of America.
    * Portelance, E. and Jasbi, M. (2023)
      The roles of neural networks in language acquisition
      Retrieved from osf.io/preprints/psyarxiv/b6978.
    * McGrath, S. W., Russin, J., Pavlick, E., and Feiman, R. (2024).
      How can deep neural networks inform theory in psychological science?
      Current Directions in Psychological Science, page 09637214241268098.
    * Millière, R. (2024). LMs as models of language
      arXiv:2408.07144.
    * Potts, C. (2019)
      A case for deep learning in semantics: Response to pater.
      Language, 95(1):e115– e124.
    * Potts, C. G. (2025). Finding linguistic structure in LLMs
      [YouTube](https://www.youtube.com/watch?v=DBorepHuKDM)
    * Chesi, C. (2025). Is it the end of (generative) linguistics as we know it?
      Italian Journal of Linguistics
  * LMs are not a complete theory of language—in fact, no one has
  * they are hugely informative about language and its structure, learning,
    processing, and relationship with the larger structure of the mind
  * LMs have set off an intellectual explosion in cognitive science, ML, and
    philosophy of mind
    * long-standing ideas have been overturned; novel ideas are emerging; and
      disciplinary boundaries are dissolving
    * LMs can stand at the center of this huge intellectual ferment, and
      would be remiss to isolate itself intellectually
  * don’t look like existing theory
  * Language science already has contributed to the development of LMs
  * LMs already have contributed insights about language

# 2 Statistical models of language have outperformed expectations

## 2.1 A brief history of statistical language learning

* The effective conclusion from the _Colorless green_ arguments was that
  linguistic structure could only be characterized in terms of formal systems,
  based on rules or constraints and operating over structured arrays of symbols
  (Chomsky, 1965)
  * the expectation was that such systems would form the basis for language
    technologies such as machine translation and question answering systems
    (Hays, 1960; Winograd, 1972; Hutchins, 1981)
    * Hays, DG (1960) Linguistic research at the RAND corporation
      In Proceedings of the National Symposium on Machine Translation
    * Winograd, T (1972) Understanding natural language
      Cognitive Psychology, 3(1):1–191
    * Hutchins, WJ (1981) The evolution of machine translation systems
      In Lawson, V, editor, Translating and the Computer: Practical Experience
  * these formal systems should be constructed by linguists
  * myriad efforts to build machine translation systems and grammatical parsers
  * hE linguistic competence remained elusive for machines
  * Symbolic approaches that sought to elucidate rules and structures often
    proved unable to capture all the exceptions and complexity
* By the late 1980s and 1990s, statistical learning had a major NLP renaissan in
  * NLP (Brown+ 1990; Manning and Schütze, 1999; Pereira, 2000)
  * human language learning literature as well (Saffran+ 1996)
  * hE unable to get past approaches that simply counted up words and phrases
    (Wang and Manning, 2012; Arora+ 2017)
* The connectionist movement in the 1980s and 90s seemed promising
  (Rumelhart and McClelland, 1986; Smolensky, 1988; Elman, 1990a)
  * well-justified concerns about the ability of these approaches to scale up
    and to represent the rules and structures (Pinker and Prince, 1988)
  * they can implement rule-like symbolic behavior (Smolensky, 1990)
  * Even researchers optimistic about the role of statistical learning were
    skeptical that end-to-end neural approaches would succeed
  * Chater+ (2006): ``despite having considerable psychological interest''
  * Tenenbaum+ (2011)
    * connectionist models ... deny that brains actually encode rich knowledge
    * strong consensus in cognitive science and artificial intelligence that
      symbols and structures are essential for thought
  * now sometimes taken for granted in practice that ideas from linguistic
    theory will not form the basis of proficient language processing systems
* generative linguists continued to claim that
  statistical methods would never solve interesting problems related to
  learning linguistic structure, eg a review article, Everaert+ (2015)
* Berwick+ (2011) were skeptical that recurrent neural networks could ever be
  much more powerful than bigram models
* connectionism in the 2010s: new techniques and increased computational power
  made training neural models much more efficient (Hinton+ 2006)
  * neural models showed rudiments of grammatical generalizations like
    subject–verb agreement (Linzen+ 2016)
  * success at acquiring linguistic abilities conti (Futrell+ 2019a; Wilcox+
    2018; Manning+ 2020; Hu+ 2020; Warstadt and Bowman, 2022; Mahowald+ 2024)
  * growth from early neural models in, eg 2011 to now is
    remarkable from a historical perspective, and was
    surprising to virtually everyone in the field at the time
  * Sutskever+ (2011) introduced an at-the-time state-of-the-art RNN that
    produced output like “In the show’s agreement unanimously resurfaced. The
    wild pasteured with consistent street forests were incorporated by the 15th
    century BE.”

## 2.2 Neural LMs learn nontrivial linguistic structure

* x affects y
  * p = prob, x include word frequency, utterance length,
    online processing constraints such as memory limitations, and
    plausibility given world knowledge
  * y also includes comprehension accuracy, reaction time, and indeed
    any psychometric dependent variable
  * x also includes the subjective grammaticality judgments
    that form the basis of formal synt
    (Kluender and Kutas, 1992; Hofmeister+ 2013; Mahowald+ 2016; Lau+ 2017)
* isolate linguistic structure from these other factors through
  controlled experimental studies and through probing LMs’ internal states
* infer the cog struct from behav
  * Experimentally, from sufficient performance data, one may infer an
    underlying formal cognitive structure, no matter whether the implementation
    substrate is a brain or a neural network (Piantadosi and Gallistel, 2024).
  * the standard procedure in linguistics, where
    data consisting primarily of acceptability judgments is used to
    postulate underlying linguistic competence This approach
  * can be applied just as well to LMs
  * eg behavioral comparisons of minimally different sentences
  * “The keys to the cabinet are on the table” vs
  * the ungrammatical “The keys to the cabinet is on the table”, and the
    conditional probabilities assigned to the verb form “are” versus “is”
  * The lexical frequency of “is” versus “are” can be controlled through a more
    elaborate experimental design, with four conditions in a 2 × 2 design
    crossing the grammatical number of the subject with the grammatical form of
    the verb (as done by Marvin and Linzen, 2018)
  * usual procedures in psycholinguistics
  * The same methodology can be applied to LMs with
    probability as the dependent variable (Linzen+ 2016; Futrell+ 2019b)
* Such studies have revealed behavioral patterns consistent with NNs
  * subject–verb agreement
    (Linzen+ 2016; Bernardy and Lappin, 2017; Gulordava+ 2018)
  * filler–gap dependencies
    (Wilcox+ 2018, 2023a; Kobzeva+ 2023; Suijkerbuijk+ 2023)
  * recursive embedding of clauses
    (Futrell+ 2019b; Wilcox+ 2019a; Hu+ 2020)
  * ie highly nontrivial formal structures which statistical models failed on
  * fig 1: Example results for subject–verb agreement from GPT-2 are shown in
    * grammatical verb forms are relatively more probable than matched
      ungrammatical verb forms in all but a few cases
    * human accuracy in producing the right verb forms in such sentences is 85%
    * Marvin and Linzen, 2018
    * ie the model can represent the non-local structural dependency
      between the subject of the sentence and the matrix verb
* Models can be “right for the wrong reasons” (McCoy+ 2019)
  * ie shallow heuristics which make correct predictions on certain test sets
  * or mastery of linguistic form without a concomitant ability to understand
    the implications of utterances (Weissweiler+ 2022, Mahowald+ 2024)
  * eg a simple n-gram model performs fairly well on some subsets of
    paired grammatical and ungrammatical sentences of the BLiMP dataset
    (Warstadt+ 2020) (although not as well as a neural LM), which does not
    explicitly control for n-gram frequency (Vázquez Martínez+ 2023)
* ~> deeper investigation. We discuss two approaches here
1. controlling a model’s training data and then observing its generalizations
   on evaluation data that is unlike anything in the training data
  (Jumelet+ 2021; Feng+ 2024b; Misra and Mahowald, 2024; Leong and Linzen,
  2023; Yao+ 2025)
* Ahuja+ (2025) trained Transformer LMs on a corpus of
  * English-like text that has been constrained so that subjects and verbs
    are always adjacent. That is, the corpus contains sentences like "I saw"
  * ? preferring “The key to the cabinets is on the table” over something
    like “The key to the cabinets are on the table” (where the form of the
    verb depends on the linearly previous verb)
  * neural LMs do make the human-like generalization
  * (see also Patil+ 2024)
2. dig into the LMs’ internal states
  * LLMs have a reputation of being black boxes
  * nL
    * probing: attempts to decode linguistic features from the internal reprs
    * causal interventions, where model internals are changed
  * Hewitt and Manning, 2019; Chi+ 2020; Voita and Titov, 2020; Manning+ 2020;
    Papadimitriou+ 2021; Ravfogel+ 2021; Lampinen, 2024; Diego-Simón+ 2024
  * promising avenues for linguistics and cognitive science (see Section 4.2)
* hE mostly English (or a handful of other langs) as the target (Blasi+ 2022)
  * see Jumelet+ 2025, for a multilingual grammatical benchmark
  * Jumelet, J., Weissweiler, L., and Bisazza, A. (2025).
    Multiblimp 1.0: A massively multilingual benchmark of ling minimal pairs.
    arXiv preprint arXiv:2504.02768
* disagreement about
  * how much LMs capture more complex formal patterns
    (Vázquez Martínez+ 2023; Lan+ 2024; Someya+ 2024) or
  * to what extent they can be said to “understand” (Bender and Koller, 2020)
  * refer to things in the world
    (Mandelkern and Linzen, 2024; Lederman and Mahowald, 2024), this is not the
* clear: LMs have learned nontrivial formal linguistic patterns better than
* LMs have learned “the real thing”—that is, the thing that we care about, as
  * eg how languages are learned, how they are processed, how and why they
    vary, and where they come from

# 3 The success of LMs is interesting for the science of language

because 
  1. there should be parallels between engin artifs like LMs and human language
  1. the success of LMs in learning from text upends [turn OBJ
     upside down] ways of thinking that are 
     deeply ingrained in generative linguistics and parts of cognitive science
  1. LMs arose from statistical and probabilistic trads in ling, to a large ext.
    * LMs aren’t alien invaders into linguistics from engineering.  Rather, 
    * they are tools similar to those that have long been used to answer
      fundamentally linguistic questions.

## 3.1 Parallels between engineering models and cognition

* It is rare in the history of science for 
  a scientific theory to turn out as disconnected from a corresp engin applic
  as formal generative linguistics has turned out to be for LMs. We
  believe this has happened primarily because of a 
  difference in goals between generative linguistics and LMing, with
* A historical parallel is informative. In the 
  * early 19th century, while 
    Newtonian mechanics did not provide a theory that answered pressing
    questions about the increasingly complex machines 
  * steam engines. Carnot (1824) developed an effective theory of such engines
    using a new ad-hoc concept of ‘moment of activity’, which eventually
    developed into the idea of entropy (Clausius, 1865). This concept 
    had to be discovered through engineering because 
    the focus of purely theoretical physics was on understanding fundamental
    mechanics through mathematical methods of increasing elegance.
  * And yet from the practical project of understanding steam engines 
    emerged a family of concepts that some theoretical physicists now view as
    more fundamental than even matter itself (Wheeler, 1989).
* linguistic theory: a similar narrowness in focus, which led it away
  from considering complex systems for dealing with language.
* LMs are, at bottom, models of the stream of language that is proded/compred 
* theories: language use, production, comprehension, learning, cognition genly
* Generative linguistics: 
  how to build a language, conceived of as an abstract mental structure that
  gives rise to a mapping between meaning (that is, a logical form or
  conceptual–intensional representation) and form (that is, a phonological
  form or sensorimotor representation) (Chomsky, 1995, 2005; Adger, 2003;
  Hornstein+ 2005).
* Stabler (1983): confusion within the field as to 
  whether or not generative linguistic theories are intended to be theories
  * of the representations used by the brain during processing, as opposed
  * that constrain possible language. He concludes that 
  * Chomsky and others often conflated 
    theories of grammar and theories of mental representation and processing,
* gen ling cont: it was claimed that this kind of analysis must take center
  stage in the science of language, preceding any analysis of more complex
  systems for language processing, use, or learning, since these systems 
  * the latter must operate in ways that make reference to the abstract
    structures of language (Chomsky, 1965, Ch. 1).
* gen ling has had a huge influence on the engin: programming language design. 
  * (often contextfree) grammars and parsers, as a way of linking a stream of
  * the ‘esoteric dialects’ spoken by ‘elaborate machines’ 
    in the Nabokov quote that starts this section.
* insights to be gained now from the analysis of messy, complex, practical syss,
  just as happened in physics

## 3.2 Understanding LM success requires rethinking language learning

### 3.2.1 The significance of the learning problem in linguistics and cog sci

* indu bias (Mitchell, 1980; Goyal and Bengio, 2022) 
  * knowledge brought to the learning process by a learner beyond the data,
  * learner: a device that takes in some data and outputs 
    a hypoth, or a set of hypoths, or a probability distribution over hypoths,
    for the underlying process generating the data. For example, given a bunch
* the data fundamentally underdetermine the hypoth that the learner arrives at,
  * something that biases a learner to favor one hypoth over another, 
    even among hypoths that fit the data equally well: this is inductive bias.
  * something that the model (or modeler) brings to the problem, 
    not something inherent in the data. 6 A. Numerical data
* Inductive bias shows up in several forms and under many names in the sci lit
  * = evaluation procedure in Chomsky (1965, pp. 30– 48), a function which
    compares two different grammars that can generate an observed set of sents,
    * ranks them in order of preference, in a way that captures how humans
      generalize beyond the data (Chomsky, 1965, p. 45).  More generally, it
    * Universal Grammar (UG)—an “innate schematism of mind that is applied to
      the data of experience” (Chomsky, 1971, p. 28) that enables language
      learning and generalization; furthermore, UG is held to be domain-
    * specific to language (not applying to any other aspect of cognition) and
    * species-specific to humans (Huybregts, 2019). In this approach,
    * ie (generative) grammatical theories such as Minimalism are 
      hypoths about the nature of UG (Chomsky, 1993; Adger, 2003). 
    * meant to precisely delimit what languages may exist and be acquired
* explanatory adequacy: a theory of grammar should not only capture which
  * the theory encompass all and only the possible languages that we might
    actually find in the world (Chomsky, 1965, Ch. 1).
  * criticize a theory of grammar such as Head-Driven Phrase Structure Grammar
    (HPSG: Pollard and Sag, 1994; Sag+ 2003) on the basis that it is
    Turing-complete, capable of generating any recursively enumerable language.
  * “explanation by constrained description” (Haspelmath, 2009, pp. 384– 385).
* Universal Grammar seen as the simultaneous solution to two different problems: 
  * 1. how children can learn language from inadequate data 
    * Argument from the Poverty of the Stimulus: see Pearl, 2022, for a review
  * 2. why human language is the way it is: because Universal Grammar strongly restricts the set of possible languages. 8 
* ? backed up with strong experimental evidence that humans cannot or do not
  learn languages which violate the putatively universal principles of human
  languages. This is not the case: there is 
  * only limited and ambiguous experimental evidence for hard formal limits on
  * Smith+ (1993), whose object of study was a man described as 
    a polyglot savant living in a mental health facility. This individual and
    four control subjects (linguistics undergraduates) were tasked with
    learning artificial languages designed to be ‘impossible’ in three ways: 
    1. negation and tense are indicated by word order, 
    1. there is an agreement pattern judged to be impossible, and 
    1. the position of an emphatic marker is determined by a rule involving
       counting words. 
    * Results are not systematically reported, but seem to indicate that the
      polyglot was able to learn the ‘impossible’ word order and agreement rules
      (1) and (2), but not the rule for the emphatic marker (3).
  * Musso+ (2003) expose German speakers to Italian and Japanese sentences,
    either following the real rules of those languages, or following modified
    rules deemed to be linguistically impossible, for example 
    eg placing a negation marker after the third morpheme from the beginning of
    a sentence. The 
    * result is equally accurate learning of the ‘natural’ and ‘unnatural’
    * fMRI on the subjects shows that the 
      real languages elicit activity in the left inferior frontal gyrus, while
      the unnatural ones elicit activity elsewhere. 
  * We believe the meaning of these results is unclear. 
    * Only a small number of languages and participants (all of whom were
      already native speakers of largely hierarchically-structured languages)
    * the localization of syntax in the brain is still contentious, and 
      * the patterns of brain activity for the ‘unnatural’ languages might
        reflect a lack of practice with such patterns, 
        rather than their impossibility or a qualitative difference between
        linear and hierarchical rules.  
* dream: come up with a formalism for linguistic description which captures
  human generalizations, is domain-specific to language, and arises from a
  genetic endowment unique to humans (Chomsky, 1988; Hauser+ 2002; Berwick+
  2011)—thus in one fell swoop solving (1) and (2).
* a good theory of language learning should be restrictive: that is, 
  * there should be languages that cannot be learned under the theory, and 
    this restriction on the hypothesis space provides explanatory adequacy. 
* eg Kodner+’s (2022) criticism of Yang and Piantadosi’s (2022) 
  * Y & P: model of language learning as Bayesian program induction, a model
  * successfully learns grammars of various formal classes 
    given small amounts of string input, thus addressing the Poverty of the Stim
  * meets the challenge of inducing formal structure from strings, it has been
    dismissed by some in the linguistics literature 
    because the same model could also learn grammars that are unlike human ones
* the intuitively bad hypoths would be ruled out as 
  unavailable as mental representations during learning (Everaert+ 2015)
* these are common examples, [There are two footnotes with number 10.]
  hE it is not clear exactly how generative formalisms rule out the unnatural
  hypoths here. In particular, 
  * the languages implied by the unnatural hypoths are context-free, just as
    much as the languages implied by the natural hypoths. So 
  * these (string) languages could be generated from, for example, Minimalist
    Grammars (Chomsky, 1993; Stabler, 1997), since Minimalist Grammars generate
    a superset of context-free languages (Michaelis, 1998).
.
* This approach to linguistic explanation has a pleasing elegance to it:
  learners must be restricted to learn properly, and we see that 
  the variation in actual languages is restricted, therefore we can kill two

### 3.2.2 The modern view on learning

* The logic of inductive bias is sound. On a deep level, there really is no free
  lunch in learning, even deep learning (Mitchell, 1980; Wolpert+ 1995; Baxter,
  2000; Adam+ 2019). Asking how much one can learn ‘from the data alone’ without
* developments in deep learning have forced revisions to conventional ways of
  thinking about how inductive bias arises.
* The conventional wisdom was that 
  a learning model must be restricted in terms of the hypoths, so that it
  does not overfit (Bishop, 2006, §1.1). A relatively 
  * unrestricted model may memorize the training data, or find a patholog solut
  * The logic is the same as Universal Grammar: 
    explaining generalization requires that we restrict 
    the set of hypoths (grammars) that a model (learner) may entertain.
* nL in deep learning: overparameterized networks, which are 
  more than flexible enough to memorize their training data, do generalize,
  often better than relatively restricted ones (Belkin+ 2019; Zhang+ 2021). In
  * overfitting has typically been measured in terms of performance on a
    held-out dataset, where one typically sees a U-shape curve as in the left
  * in the late 2010s it was discovered that 
    if you keep adding model power, the U-shape curve starts to descend again,
  * double descent, shown in Figure 3. This pattern suggests that learners
    continue to find good generalizations even after being flexible enough to
    memorize their training data. 
  * with the right regularization, 
    the best performance comes from models whose capacity is poised 
    right at the point where training data and model parameters are balanced—
    * the right regularization in these settings avoids the sharp spike in loss
      characteristic of double descent (Maloney+ 2022, §4.2)
  * a kind of phase transition in how learning works. What looks like
  * came as a surprise to statistical learning theorists (Belkin+ 2019; Zhang+
    2021) and have triggered an 
  * ongoing field-wide effort to rethink learning theory or to 
    show how these unexpected findings are compatible with existing theory 
    (eg Poggio+ 2020a; Martin+ 2021; Martin and Mahoney, 2021; Kuzborskij+ 2021;
    Henighan+ 2023; Attias+ 2024)
* we should also rethink language learning and 
  the role of restrictive formalisms in linguistic explanation. 
  * It is simply not the case that proper generalization can only come from
    learners who are sharply restricted to small hypothesis spaces, 
  * nor even that there is a correlation between restrictedness and generalizat.
* But how can this be, if the idea of inductive bias is right? 
  How did the conventional logic go wrong in practice? The key mistake was 
  * the conflation of model power with inductive bias (Hubinger, 2019).
  * more flexible learners have stronger biases toward simple hypoths (Huh+ 24)
  * they do impose a soft notion of simplicity on those hypoths.
* fig 4 following Wilson (2025).
  * the source of this simplicity bias in neural networks and related systems is
    not necessarily related to the hard limits of their expressivity. The
  * toward functions that are nearly linear or simple in other ways
    (Valle-Perez+ 2018; Hahn+ 2021b), likely as a result of the dynamics of
    gradient descent on the loss landscape induced by the model 
    (Poggio+ 2020b; Pezeshki+ 2020; Merrill+ 2021; Hahn and Rofin, 2024)
* In machine learning, these discoveries have catalyzed a change in focus, away
  from models whose architecture and representations are tailored to the domain,
  toward models that learn quickly in relatively unrestricted hypothesis spaces
  (Sutton, 2019). 
  * against using domain knowledge to restrict the behavior of learners, 
    even when researchers have a strong sense of the relevant domain knowledge

### 3.2.3 The upshot for linguistic theory

* Nowadays the logic must be: 
  learners have hard formal restrictions even though this is not necessary and
  may be harmful for learning, and these restrictions create language
  universals. It is still a viable hypothesis, but it loses its elegance.
* even if language-specific innate inductive biases in humans really are the key
  to the structure of human language, these 
  inductive biases might not be expressible in terms of a categorical symbolic
  formalism or a sharply limited hypothesis space for learners. 
  * Inductive biases in modern neural models are soft and seem to 
    arise from a complex interplay of training dynamics, objective function, and
    model architecture, with 
    the hard limits of model expressivity playing a relatively minor role.
* “explanation by constrained description” no longer seems so explanatory, at
  * Language learning and language universals may well be better captured by a
    highly flexible, less constrained formalism for linguistic repr—one which 
  * repr on its own could capture non-linguistic patterns as well as natural
    linguistic ones—
    paired with a soft, quantitative simplicity metric that 
    captures learning dynamics or functional pressures on language.
* Learning models with explicit simplicity biases exemplify this approach 
  (eg, Hsu+ 2011; Perfors+ 2013; Rasin+ 2021; Lan+ 2022)
* This is not to say that inductive biases are no longer important in
  linguistics and language learning, humans and neural networks is not
  * see Section 4.4. Far from demoting inductive bias as a concern, language
  * LMs open up the range of (possibly innate) inductive biases 
    look for in humans. The main point for linguistic theory is not to demote
  * a broader landscape of approaches and hypotheses

### 3.2.4 The question of data quantity

* LMs learn using orders of magnitude more linguistic input data than children
  (Yedetore+ 2023; Warstadt+ 2023).
  * the learning trajectories of models and humans show systematic differences
    (Chang and Bergen, 2022; Evanson+ 2023; Constantinescu+ 2025).  Taken
  * differences between learning in models and humans, 
    both in terms of data requirements and patterns of learning. 
  * A form of the Poverty of the Stimulus argument is still alive in the form of
    * even if neural networks acquire linguistic structure, they do not do so on
      the basis of the same amount and kind of data that a children (Lan+ 2024).
* Mollica and Piantadosi (2019) suggests that syntactic structure makes up only
  a very small portion of the information necessary to learn a language.
* attempts to inject linguistic structure into neural models in various ways;
  * recursive computation in hierarchical parse trees (Socher+ 2011, 2013).
    * some of the earliest successful deep learning approaches to NLU
  * result that language learning from data is somewhat more sample efficient
    (Dyer+ 2016; Futrell+ 2019b; Wilcox+ 2019b; Kim+ 2019; 
    Papadimitriou and Jurafsky, 2020, 2023; Nandi+ 2025)
* more flexible architectures (eg Kolmogorov–Arnold Networks: Liu+ 2024), or
* biases towards domain-general compositional reasoning 
  (McCoy and Griffiths, 2023; Yang and Piantadosi, 2022), or 
* different training regimes (Murty+ 2023),
  Murty S, Sharma P, Andreas J, and Manning C, (ACL 2023), 
  Grokking of hierarchical structure in vanilla Transformers. 
* multimodal data which provides rich side information about the structure of
  the environment that is being described in language (Wang+ 2023), or
* domain-general bounded-rational approaches to generalization such as the
  Tolerance Principle (Belth+ 2021; Payne+ 2021; Kodner, 2022)
* The direction of developments in machine learning suggests that 
  the gap between human and machine learning is 
  more likely to be closed through more powerful domain-general learning algos
* ? humans and neural networks are just so different that 
  one is not informative about the other (Kodner+ 2023). We believe not. First,
  1. the success of neural networks 
    weakens logical arguments that language cannot be learned without
    domain-specific formal constraints on language, and in general changes how
  2. even if neural network training methods are not able to acquire ling struct
     on the basis of developmentally realistic data, 
    the representations that NNs acquire based on more data are still
    informative about how language might be represented and processed in the
    brain (more in Section 4), 
    even if the networks do not arrive at these reprs along the same trajectory

## 3.3 LMs and linguistic traditions

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
