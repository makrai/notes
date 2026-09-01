How Linguistics Learned to Stop Worrying and Love the Language Models
Richard Futrell, Kyle Mahowald
arXiv:2500.17047 [cs.CL]

* LMs can contribute to fundamental questions about ling structure,
  lang processing, and learning
* They force us to rethink arguments that have been foundational in ling
* they do not replace ling structure and theory,
* they serve as proofs of concept for gradient, usage-based approaches

# 1 Intro

* It’s 1968, and Norm and Claudette are having lunch
* Norm says he is interested in human lang and the human mind, found HAL
  creepy, and isn’t sure why Claudette is so interested in building chatbots
* all Claudette wants is a machine that talks and understands.  She doesn’t
  really care how it happens. Norm and Claudette have very different goals, nL
* Fast forward to 2025
  * Norm has worked for decades on a variety of diverse langs, developing
    sophisticated theories of ling structure
  * Claudette got more and more interested in engineering,
    amassing huge amounts of data, and training statistical models
  * How relevant is it that the architecture of Claudette’s machines seems to
    have nothing to do with the structure of lang as identified by Norm
  * what if Norm was right about the nature of lang— does that mean the
    machines aren’t actually as impressive as Claudette thinks, because they
    are relying on shallow pattern matching?
  * Or are Claudette’s machines evidence that Norm’s theories were wrong?
  * a view: neural networks are no more relevant to ling than submarine
    engineering is to an ichthyologist [halkutató]
    * just because both submarines and fish can move underwater does
      not mean that you can learn much about one from studying the other
* LMs have access to so much more data, that whatever they are doing is
  irrelevant for humans (Chomsky+ 2023; Fox and Katzir, 2024; Bolhuis+ 2024)
  * Some have denied that LMs could learn the putatively key
    properties of human lang (Lan+ 2024; Fox and Katzir, 2024)
  * neural network sequence models could learn to approximate anything
    ~> the fact that they seem to learn lang is uninformative
    (Rawski and Baumont, 2023; Moro+ 2023; Chomsky, 2023; Chomsky+ 2023;
    Collins, 2024; Bolhuis+ 2024)
    * LMs are like epicycles, the computational technique used by Ptolemy to
      predict the motions of the planets and the sun in a model that placed the
      Earth at the center of the universe (de Santillana, 1955; Flynn, 2013)
    * <~ epicycles can approximate any trajectory arbitrarily well (at the cost
      of great complexity)
* we: LMs do learn non-trivial aspects of ling structure, and
  they do give important insights that change how we should think about
  lang. As lang scientists, we ignore them at our peril
* An opposite approach is to dismiss traditional theories of ling struct,
  * either useless or of negative value in developing the only known systems
    that can actually use lang as humans do (Jelinek, 2004; Piantadosi, 2023)
  * this view is widespread in some engineering and applic-focused communities
  * throws out hard-won analytical discoveries about the structure of lang
* but
  * ? scientific theory of lang, without
  * ? a way to approach the question of why human lang is the way it is
  * ? what the interesting questions are
  * LMs are currently most successful in langs with internet-scale data
    (Blasi+ 2022)
  Blasi, D., Anastasopoulos, A., and Neubig, G. (2022).
  Systematic inequalities in lang tech performance across the world‘s langs
  ACL 2022
  * A more complete approach to ling will draw on the expertise of
    documentary linguists, sociolinguists, anthropologists, and community
    stakeholders, and it will integrate the insights from decades of ling inqu
* third view in ling, cognitive science, and philosophy
  (Smolensky, 1988; Pater, 2019; Portelance and Jasbi, 2023; McGrath+ 2024;
  Millière, 2024; Potts, 2025; Chesi, 2025):
  * bib
    * Smolensky, P. (1988). On the proper treatment of connectionism. Behavioral
    * Pater, J. (2019)
      Generative ling and neural networks at 60:
        Foundation, friction, and fusion.
      Language, 95(1):e41–e74. Publisher: Linguistic Society of America.
    * Portelance, E. and Jasbi, M. (2023)
      The roles of neural networks in lang acquisition
      Retrieved from osf.io/preprints/psyarxiv/b6978.
    * McGrath, S. W., Russin, J., Pavlick, E., and Feiman, R. (2024).
      How can deep neural networks inform theory in psychological science?
      Current Directions in Psychological Science, page 09637214241268098.
    * Millière, R. (2024). LMs as models of lang
      arXiv:2408.07144.
    * Potts, C. (2019)
      A case for deep learning in semantics: Response to pater.
      Language, 95(1):e115– e124.
    * Potts, C. G. (2025). Finding ling structure in LLMs
      [YouTube](https://www.youtube.com/watch?v=DBorepHuKDM)
    * Chesi, C. (2025). Is it the end of (generative) ling as we know it?
      Italian Journal of Linguistics
  * LMs are not a complete theory of lang—in fact, no one has
  * they are hugely informative about lang and its structure, learning,
    processing, and relationship with the larger structure of the mind
  * LMs have set off an intellectual explosion in cognitive science, ML, and
    philosophy of mind
    * long-standing ideas have been overturned; novel ideas are emerging; and
      disciplinary boundaries are dissolving
    * LMs can stand at the center of this huge intellectual ferment, and
      would be remiss to isolate itself intellectually
  * don’t look like existing theory
  * Language science already has contributed to the development of LMs
  * LMs already have contributed insights about lang

# 2 Statistical models of lang have outperformed expectations

## 2.1 A brief history of statistical lang learning

* The effective conclusion from the _Colorless green_ arguments was that
  ling structure could only be characterized in terms of formal systems,
  based on rules or constraints and operating over structured arrays of symbols
  (Chomsky, 1965)
  * the expectation was that such systems would form the basis for lang
    technologies such as machine translation and question answering systems
    (Hays, 1960; Winograd, 1972; Hutchins, 1981)
    * Hays, DG (1960) Linguistic research at the RAND corporation
      In Proceedings of the National Symposium on Machine Translation
    * Winograd, T (1972) Understanding natural lang
      Cognitive Psychology, 3(1):1–191
    * Hutchins, WJ (1981) The evolution of machine translation systems
      In Lawson, V, editor, Translating and the Computer: Practical Experience
  * these formal systems should be constructed by linguists
  * myriad efforts to build machine translation systems and grammatical parsers
  * hE ling competence remained elusive for machines
  * Symbolic approaches that sought to elucidate rules and structures often
    proved unable to capture all the exceptions and complexity
* By the late 1980s and 1990s, statistical learning had a major NLP renaissan in
  * NLP (Brown+ 1990; Manning and Schütze, 1999; Pereira, 2000)
  * human lang learning literature as well (Saffran+ 1996)
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
  * now sometimes taken for granted in practice that ideas from ling
    theory will not form the basis of proficient lang processing systems
* generative linguists continued to claim that
  statistical methods would never solve interesting problems related to
  learning ling structure, eg a review article, Everaert+ (2015)
* Berwick+ (2011) were skeptical that recurrent neural networks could ever be
  much more powerful than bigram models
* connectionism in the 2010s: new techniques and increased computational power
  made training neural models much more efficient (Hinton+ 2006)
  * neural models showed rudiments of grammatical generalizations like
    subject–verb agreement (Linzen+ 2016)
  * success at acquiring ling abilities conti (Futrell+ 2019a; Wilcox+
    2018; Manning+ 2020; Hu+ 2020; Warstadt and Bowman, 2022; Mahowald+ 2024)
  * growth from early neural models in, eg 2011 to now is
    remarkable from a historical perspective, and was
    surprising to virtually everyone in the field at the time
  * Sutskever+ (2011) introduced an at-the-time state-of-the-art RNN that
    produced output like “In the show’s agreement unanimously resurfaced. The
    wild pasteured with consistent street forests were incorporated by the 15th
    century BE.”

## 2.2 Neural LMs learn nontrivial ling structure

* x affects y
  * p = prob, x include word frequency, utterance length,
    online processing constraints such as memory limitations, and
    plausibility given world knowledge
  * y also includes comprehension accuracy, reaction time, and indeed
    any psychometric dependent variable
  * x also includes the subjective grammaticality judgments
    that form the basis of formal synt
    (Kluender and Kutas, 1992; Hofmeister+ 2013; Mahowald+ 2016; Lau+ 2017)
* isolate ling structure from these other factors through
  controlled experimental studies and through probing LMs’ internal states
* infer the cog struct from behav
  * Experimentally, from sufficient performance data, one may infer an
    underlying formal cognitive structure, no matter whether the implementation
    substrate is a brain or a neural network (Piantadosi and Gallistel, 2024).
  * the standard procedure in ling, where
    data consisting primarily of acceptability judgments is used to
    postulate underlying ling competence This approach
  * can be applied just as well to LMs
  * eg behavioral comparisons of minimally different sentences
  * “The keys to the cabinet are on the table” vs
  * the ungrammatical “The keys to the cabinet is on the table”, and the
    conditional probabilities assigned to the verb form “are” versus “is”
  * The lexical frequency of “is” versus “are” can be controlled through a more
    elaborate experimental design, with four conditions in a 2 × 2 design
    crossing the grammatical number of the subject with the grammatical form of
    the verb (as done by Marvin and Linzen, 2018)
  * usual procedures in psycholing
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
  * or mastery of ling form without a concomitant ability to understand
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
    * probing: attempts to decode ling features from the internal reprs
    * causal interventions, where model internals are changed
  * Hewitt and Manning, 2019; Chi+ 2020; Voita and Titov, 2020; Manning+ 2020;
    Papadimitriou+ 2021; Ravfogel+ 2021; Lampinen, 2024; Diego-Simón+ 2024
  * promising avenues for ling and cognitive science (see Section 4.2)
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
* clear: LMs have learned nontrivial formal ling patterns better than
* LMs have learned “the real thing”—that is, the thing that we care about, as
  * eg how langs are learned, how they are processed, how and why they
    vary, and where they come from

# 3 The success of LMs is interesting for the science of lang

* organization
  1. there should be parallels between engin artifs like LMs and human lang
  1. the success of LMs in learning from text upends [turn OBJ
     upside down] ways of thinking that are
     deeply ingrained in generative ling and parts of cognitive science
  1. LMs arose from statistical and probabilistic trads in ling, to a large ext.
    * LMs aren’t alien invaders into ling from engineering.  Rather,
    * they are tools similar to those that have long been used to answer
      fundamentally ling questions.

## 3.1 Parallels between engineering models and cognition

* vision, there is strong precedent for the idea that
  neural networks developed purely for practical applications
  can tell us a great deal about cognition as it is implemented in the brain.
* Hubel and Wiesel (1959) discovered that
  early processing of visual information is performed by neurons that are
  selectively responsive to edges in the visual input. After this discovery, the
  * why early visual processing works this way.
  * Olshausen and Field (1996),
    building on information-theory-inspired intuitions from Barlow (1961, 1989),
    * edge detectors resembling those found in the visual cortex were the
      generic solution to the problem of representing visual information
      accurately in a neural network
      under a constraint that only a small number of units should be active
      (that is, a sparsity constraint, arising ultimately from a power
      constraint on neural firing).
  * Even better explanation—
    both in the sense of explanatory depth and predictive accuracy— came from
    the engineering of artificial visual systems, in particular the development
    * AlexNet, a large (for the time) hierarchical convolutional neural network
      for image classification (Krizhevsky+ 2012).
    * Yamins+ (2014) showed that this architecture, when trained to do object
      recognition, not only
      developed edge filters in its early layers, but also
      receptive fields in later layers corresponding to later layers of visual
      processing in the primate brain. The overall picture that emerges from
      * ie the neuronal organization of visual processing is determined by the
        function of finding a sparse code to identify and manipulate objects in
        the environment, a function largely shared between biological and
        artificial systems.
  * ie artificial system provided guiding insights for understanding the natur sys
    * ? extent to which deep neural networks are the best model of human vision
      (see Bowers+ 2023, for a more skeptical take along with spirited replies),
      * agreement: this research program has been fruitful.
* lang processing, where
  * the internal reprs developed by LMs are predictive of
  activation patterns in lang areas of the brain (Goldstein+ 2022;
  Caucheteux+ 2023; Hosseini+ 2024b; Rathi+ 2024), and
  * predictability as estimated by a LM is
    an important factor in studies that predict neural activity (Stanojevíc+
    2023; Zhao+ 2025). The picture is
  * not yet as clear as it is in vision—this is an area of active research, and
  * no animal models we can use to get the plentiful high-resolution controlled
    neural data we would like—but there is precedent to think that the
* Cao and Yamins (2021): the Contravariance Principle
  if we want to uncover solutions to problems that are common between brains and
  models, we should focus on hard problems, because
  * hard in the sense that it requires satsifying multiple potentially competing
    constraints at once, then there are likely to be only a small number of ways
    to solve it. So
  * we expect different systems that solve the same hard problem to converge to
    the same solution (see also Huh+ 2024; Hosseini+ 2024a).
  * If a problem is relatively simple, then we might expect many different
    solutions to work.
    * algorithms that have been proposed for sorting numbers in an array.
  * vision constraints (e.g., fast processing, reliable transmission of input,
    invariance to different light conditions, among many others). Therefore, we
  * We see this
    not only in the comparison of humans vs. neural networks, but also in the
    * humans vs. monkeys (Rajalingham+ 2018), and
    * primates vs animals whose visual cortices arise from totally different
      evolutionary phylogenies, such as cephalopods (Pungor+ 2023).
* lang constraints (storage of lexical items, generalization to novel contexts,
  fast processing, etc.). And as we have discussed, large Transformer-based
  * massive literature on ling interpretability in Transformers, which we
    partially reviewed in Section 2.2, has revealed
  * repral strategies in neural networks that lead to correct novel
    predictions about human performance (Lakretz+ 2021), and
  * the way that Transformers process syntactic features like agreement cues has
    close parallels with independently proposed cognitive frameworks for
    modeling human lang processing based on cue-based retrieval (Lewis and
    Vasishth, 2005; Ryu and Lewis, 2021; Timkey and Linzen, 2023).
* in silico insight and inspiration, hugely useful in other areas of cognition

## 3.2 Understanding LM success requires rethinking lang learning

### 3.2.1 The significance of the learning problem in ling and cog sci

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
      the data of experience” (Chomsky, 1971, p. 28) that enables lang
      learning and generalization; furthermore, UG is held to be domain-
    * specific to lang (not applying to any other aspect of cognition) and
    * species-specific to humans (Huybregts, 2019). In this approach,
    * ie (generative) grammatical theories such as Minimalism are
      hypoths about the nature of UG (Chomsky, 1993; Adger, 2003).
    * meant to precisely delimit what langs may exist and be acquired
* explanatory adequacy: a theory of grammar should not only capture which
  * the theory encompass all and only the possible langs that we might
    actually find in the world (Chomsky, 1965, Ch. 1).
  * criticize a theory of grammar such as Head-Driven Phrase Structure Grammar
    (HPSG: Pollard and Sag, 1994; Sag+ 2003) on the basis that it is
    Turing-complete, capable of generating any recursively enumerable lang.
  * “explanation by constrained description” (Haspelmath, 2009, pp. 384– 385).
* Universal Grammar seen as the simultaneous solution to two different problems:
  * 1. how children can learn lang from inadequate data
    * Argument from the Poverty of the Stimulus: see Pearl, 2022, for a review
  * 2. why human lang is the way it is: because Universal Grammar strongly restricts the set of possible langs. 8
* ? backed up with strong experimental evidence that humans cannot or do not
  learn langs which violate the putatively universal principles of human
  langs. This is not the case: there is
  * only limited and ambiguous experimental evidence for hard formal limits on
  * Smith+ (1993), whose object of study was a man described as
    a polyglot savant living in a mental health facility. This individual and
    four control subjects (ling undergraduates) were tasked with
    learning artificial langs designed to be ‘impossible’ in three ways:
    1. negation and tense are indicated by word order,
    1. there is an agreement pattern judged to be impossible, and
    1. the position of an emphatic marker is determined by a rule involving
       counting words.
    * Results are not systematically reported, but seem to indicate that the
      polyglot was able to learn the ‘impossible’ word order and agreement rules
      (1) and (2), but not the rule for the emphatic marker (3).
  * Musso+ (2003) expose German speakers to Italian and Japanese sentences,
    either following the real rules of those langs, or following modified
    rules deemed to be lingally impossible, for example
    eg placing a negation marker after the third morpheme from the beginning of
    a sentence. The
    * result is equally accurate learning of the ‘natural’ and ‘unnatural’
    * fMRI on the subjects shows that the
      real langs elicit activity in the left inferior frontal gyrus, while
      the unnatural ones elicit activity elsewhere.
  * We believe the meaning of these results is unclear.
    * Only a small number of langs and participants (all of whom were
      already native speakers of largely hierarchically-structured langs)
    * the localization of syntax in the brain is still contentious, and
      * the patterns of brain activity for the ‘unnatural’ langs might
        reflect a lack of practice with such patterns,
        rather than their impossibility or a qualitative difference between
        linear and hierarchical rules.
* dream: come up with a formalism for ling description which captures
  human generalizations, is domain-specific to lang, and arises from a
  genetic endowment unique to humans (Chomsky, 1988; Hauser+ 2002; Berwick+
  2011)—thus in one fell swoop solving (1) and (2).
* a good theory of lang learning should be restrictive: that is,
  * there should be langs that cannot be learned under the theory, and
    this restriction on the hypothesis space provides explanatory adequacy.
* eg Kodner+’s (2022) criticism of Yang and Piantadosi’s (2022)
  * Y & P: model of lang learning as Bayesian program induction, a model
  * successfully learns grammars of various formal classes
    given small amounts of string input, thus addressing the Poverty of the Stim
  * meets the challenge of inducing formal structure from strings, it has been
    dismissed by some in the ling literature
    because the same model could also learn grammars that are unlike human ones
* the intuitively bad hypoths would be ruled out as
  unavailable as mental reprs during learning (Everaert+ 2015)
* these are common examples, [There are two footnotes with number 10.]
  hE it is not clear exactly how generative formalisms rule out the unnatural
  hypoths here. In particular,
  * the langs implied by the unnatural hypoths are context-free, just as
    much as the langs implied by the natural hypoths. So
  * these (string) langs could be generated from, for example, Minimalist
    Grammars (Chomsky, 1993; Stabler, 1997), since Minimalist Grammars generate
    a superset of context-free langs (Michaelis, 1998).
.
* This approach to ling explanation has a pleasing elegance to it:
  learners must be restricted to learn properly, and we see that
  the variation in actual langs is restricted, therefore we can kill two

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
* we should also rethink lang learning and
  the role of restrictive formalisms in ling explanation.
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
  from models whose architecture and reprs are tailored to the domain,
  toward models that learn quickly in relatively unrestricted hypothesis spaces
  (Sutton, 2019).
  * against using domain knowledge to restrict the behavior of learners,
    even when researchers have a strong sense of the relevant domain knowledge

### 3.2.3 The upshot for ling theory

* Nowadays the logic must be:
  learners have hard formal restrictions even though this is not necessary and
  may be harmful for learning, and these restrictions create lang
  universals. It is still a viable hypothesis, but it loses its elegance.
* even if lang-specific innate inductive biases in humans really are the key
  to the structure of human lang, these
  inductive biases might not be expressible in terms of a categorical symbolic
  formalism or a sharply limited hypothesis space for learners.
  * Inductive biases in modern neural models are soft and seem to
    arise from a complex interplay of training dynamics, objective function, and
    model architecture, with
    the hard limits of model expressivity playing a relatively minor role.
* “explanation by constrained description” no longer seems so explanatory, at
  * Language learning and lang universals may well be better captured by a
    highly flexible, less constrained formalism for ling repr—one which
  * repr on its own could capture non-ling patterns as well as natural
    ling ones—
    paired with a soft, quantitative simplicity metric that
    captures learning dynamics or functional pressures on lang.
* Learning models with explicit simplicity biases exemplify this approach
  (eg, Hsu+ 2011; Perfors+ 2013; Rasin+ 2021; Lan+ 2022)
* This is not to say that inductive biases are no longer important in
  ling and lang learning, humans and neural networks is not
  * see Section 4.4. Far from demoting inductive bias as a concern, lang
  * LMs open up the range of (possibly innate) inductive biases
    look for in humans. The main point for ling theory is not to demote
  * a broader landscape of approaches and hypotheses

### 3.2.4 The question of data quantity

* LMs learn using orders of magnitude more ling input data than children
  (Yedetore+ 2023; Warstadt+ 2023).
  * the learning trajectories of models and humans show systematic differences
    (Chang and Bergen, 2022; Evanson+ 2023; Constantinescu+ 2025).  Taken
  * differences between learning in models and humans,
    both in terms of data requirements and patterns of learning.
  * A form of the Poverty of the Stimulus argument is still alive in the form of
    * even if neural networks acquire ling structure, they do not do so on
      the basis of the same amount and kind of data that a children (Lan+ 2024).
* Mollica and Piantadosi (2019) suggests that syntactic structure makes up only
  a very small portion of the information necessary to learn a lang.
* attempts to inject ling structure into neural models in various ways;
  * recursive computation in hierarchical parse trees (Socher+ 2011, 2013).
    * some of the earliest successful deep learning approaches to NLU
  * result that lang learning from data is somewhat more sample efficient
    (Dyer+ 2016; Futrell+ 2019b; Wilcox+ 2019b; Kim+ 2019;
    Papadimitriou and Jurafsky, 2020, 2023; Nandi+ 2025)
* more flexible architectures (eg Kolmogorov–Arnold Networks: Liu+ 2024), or
* biases towards domain-general compositional reasoning
  (McCoy and Griffiths, 2023; Yang and Piantadosi, 2022), or
* different training regimes (Murty+ 2023),
  Murty S, Sharma P, Andreas J, and Manning C, (ACL 2023),
  Grokking of hierarchical structure in vanilla Transformers.
* multimodal data which provides rich side information about the structure of
  the environment that is being described in lang (Wang+ 2023), or
* domain-general bounded-rational approaches to generalization such as the
  Tolerance Principle (Belth+ 2021; Payne+ 2021; Kodner, 2022)
* The direction of developments in machine learning suggests that
  the gap between human and machine learning is
  more likely to be closed through more powerful domain-general learning algos
* ? humans and neural networks are just so different that
  one is not informative about the other (Kodner+ 2023). We believe not. First,
  1. the success of neural networks
    weakens logical arguments that lang cannot be learned without
    domain-specific formal constraints on lang, and in general changes how
  2. neural network training methods are not able to acquire ling struct
     on the basis of developmentally realistic data,
     * hE the reprs that NNs acquire based on more data are still
       informative about how lang might be represented and processed in the
       brain (more in Section 4),
       even if the networks do not arrive at these reprs along the same trajec

## 3.3 LMs and ling traditions

* LMs may seem to involve concepts that are foreign to ling,
* nL they emerged in part from intellectual traditions of the study of lang
  * not necessarily the traditions that have been dominant in ling departments
* Below we discuss the relationship between schools of ling and the
  development of LMs and related lang technologies.

### 3.3.1 The generative tradition of ling

* It is rare in the history of science for
  a scientific theory to turn out as disconnected from a corresp engin applic
  as formal generative ling has turned out to be for LMs. We
  believe this has happened primarily because of a
  difference in goals between generative ling and LMing, with
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
* ling theory: a similar narrowness in focus, which led it away
  from considering complex systems for dealing with lang.
* LMs are, at bottom, models of the stream of lang that is proded/compred
* theories: lang use, production, comprehension, learning, cognition genly
* Generative ling:
  how to build a lang, conceived of as an abstract mental structure that
  gives rise to a mapping between meaning (that is, a logical form or
  conceptual–intensional repr) and form (that is, a phonological
  form or sensorimotor repr) (Chomsky, 1995, 2005; Adger, 2003;
  Hornstein+ 2005).
* Stabler (1983): confusion within the field as to
  whether or not generative ling theories are intended to be theories
  * of the reprs used by the brain during processing, as opposed
  * that constrain possible lang. He concludes that
  * Chomsky and others often conflated
    theories of grammar and theories of mental repr and processing,
* gen ling cont: it was claimed that this kind of analysis must take center
  stage in ling, preceding any analysis of more complex systems
  for lang processing, use, or learning, since these systems
  * the latter must operate in ways that make reference to the abstract
    structures of lang (Chomsky, 1965, Ch. 1).
* gen ling has had a huge influence on the engin: programming lang design.
  * (often contextfree) grammars and parsers, as a way of linking a stream of
  * the ‘esoteric dialects’ spoken by ‘elaborate machines’
    in the Nabokov quote that starts this section.
* insights to be gained now from the analysis of messy, complex, practical syss,
  just as happened in physics

### 3.3.2 The statistical tradition of ling

* these traditions were deeply involved in the early development of LMs.
* distributional semantics: the idea that
  the semantics of a word is related to the distribution over contexts in which
  * often cited to Firth (1957, p. 11), and
  * developed more systematically by Harris (1954). This idea
* originates from structuralist ling (Saussure, 1916; Bloomfield, 1926)
  * aim: the development of discovery procedures, which were
    formal procedures that could be applied to bodies of text in order to
    discover (and even define) ling structures (Harris, 1951).
  * The most well-developed of these discovery procedures were statistical in
  * eg Harris (1955): a theory of words and morphemes based on stat co-occurr
    * a procedure for discovering morpheme boundaries by effectively
      calculating transitional probabilities, an
    * idea taken up again much later in the psycholing of lang learning
      (Saffran+ 1996), and
    * closely related to tokenization methods such as byte-pair encoding
      (Shibata+ 1999; Tanaka-Ishii, 2021, Ch. 11). At issue was the
    * relationship between grammatical structure and the observable statistical
      structure of a corpus of lang—one of the core questions that linguists
      working on LMs are interested in again today.
    * Harris’s work is an intellectual precursor to modern LMs. However, in
* practice [actual history], the statistical structuralism largely
  supplanted in American ling departments by the generative school,
  * Chomsky’s (1957) arguments that
    distributional statistics were irrelevant to ling structure and that
    discovery procedures were a distraction from the putatively ‘core’ questions
* the statistical analysis of lang continued under the heading of
  usage-based approaches (Bybee and Hopper, 2001), in which the
  * key is not a set of underlying formal rules but
    emergent properties based on the statistics and dynamics of lang use
    (from which rules or rule-like behavior might emerge). Traditions in
  * typological syntax (Greenberg, 1963; Dryer, 1992),
  * functionalist syntax (Comrie, 1989; Keenan and Comrie, 1977),
  * construction grammar (Croft, 2001; Goldberg, 2009),
  * probabilistic modeling (Bresnan+ 2001, 2007; Christiansen and Chater, 2016),
  * evolutionary ling (Kirby and Hurford, 2002) have all carried the banner
* Earlier arguments about
  the relationship between statistics and structure, and
  the value of probabilistic methods,
  mirror many of the points we are making here
  (Abney, 1996; Pereira, 2000; Manning, 2003; Bresnan+ 2007;
  Lappin and Shieber, 2007; Norvig, 2012)
* These statistical traditions of ling played
  a catalyzing role in the birth of neural networks and LMs. The
  * connectionist framework from which neural LMs emerged
    overlapped with the statistical tradition in ling, often
    in conflict with the anti-statistical tradition. A major locus of this early
  * neural networks was about the English past tense, with Rumelhart and
    McClelland (1987) developing a neural model for forming the past tense from
    present tense words, triggering much debate (Pinker and Prince, 1988).
* Elman, a Linguistics PhD, developed an early RNN (1990a)
  in order to solve the problem of finding ling structure in time, a
  * motivated by findings in ling and psycholing (Frazier and Fodor, 1978)
  * the basic architecture still underlies many LMs (Feng+ 2024a).
* Chris Manning, a pioneer in neural and probabilistic models, was
  * trained as a linguist (Manning, 1995), and argued for a
    Manning, C. D. (1995).
    Ergativity: Argument structure and grammatical relations. Stanford Uni
  * statistical approach to syntax (Manning, 2003), before going on to work on
  * influential neural methods for performing ling tasks (e.g.,
    Pennington+ 2014).
* these figures are sometimes seen as ‘not linguists’.
  <~ The history of the field and the dominance of the generative tradition
  * the traditions they emerged from were fundamentally concerned with questions
    about human lang and cognition and belong under the heading of ling. To
  * we do not think that
    the success of modern LMs unequivocally supports or refutes any particular
    intellectual tradition in ling. But
  * nL we think the narrow and exclusive theoretical focus of generative ling,
    coupled with its relative dominance within American ling departments
    throughout the late 20th century,
    caused tragic missed connections in intellectual history, and has left the
    field of ling diminished compared to where it could be.
  * Progress in lang science will not come from hyperfocus on any one goal,
    nor from any one theory of what lang is, nor from one framework for
    understanding ling phenomena. Rather,
  * ling needs to draw on a plurality of perspectives and disciplines
  * In the current moment, that means leveraging the explosion of intellectual
    creativity springing forth around LMs.
  * as the concept of entropy arose from ad-hoc analysis of complex machines and
    ended up revolutionizing fundamental physics,
    it is likely that ideas based on LMs will revolutionize ling

# 4 Where does that leave the science of lang?

* How the science of lang productively integrates the LM insights
* What is the status of the formal structures discovered through ling analysis,
  if they don’t have to be innately latent in the human brain? We believe that
  * ling structure is as real as it ever was, and that
    the LM revolution presents us with important new ideas and methods
* LMs might give us reason to update our ling theories to be more gradient,
  usage-based, and functionalist, by serving as
  a proof-of-concept system that implements ideas that were previously hard to
  formalize

## 4.1 Linguistic structure is real

* systems can process lang without having ling structure hardwired in.
* ling structure is a real pattern in the sense of Dennett (1989): it
  * a compressed and useful repr of important aspects of lang.
  * To explain or describe ling phenomena without reference to ling structure,
    perhaps in terms of some more reductive neural theory,
    would be hopelessly complex — and
    would make understanding LM behavior more difficult
  * Nefdt, 2023: a worked-out theory of ling structure as real patterns
* Figure 5 eg subject–verb agreement. Modern LMs are proficient at this task,
  * it is likely that there are messy and heterogeneous structures and processes
    that give rise to this rule-like behavior in models.
  * structures in the LM  might only very noisily map onto ling categories like
    “grammatical subject” or “number agreement”. One reaction to that might be
  * hyper-reductive conclusion would not be productive.
    A theory of lang which points to complex neural circuits for explaining
    the data of subject–verb agreement, without referring to something about the
    * example from Dennett (1989, Ch. 2): imagine
    * aliens who can perfectly predict human behavior using atomic physics (that
      clump of human atoms will move towards that coffee shop) but
      without understanding human beliefs and desires (that the human wants
      coffee and believes that the coffee shop will provide it). Lacking
    * enormous cost of cumbersomeness, lack of generality, and unwanted detail
      (Dennett, 1990, p. 189). Dennett concludes that
    * the concept of belief is a real pattern in that it provides an abstraction
      * supports prediction and counterfactual reasoning based on coarse-grained
        data.
* any abstraction
  that enables simple prediction, compression, and causal modeling in this way
  is a real pattern, fully deserving the epithet real even
  if there is a more reductive theory that lacks the abstraction

## 4.2 What LM interpretability can tell us about human lang

* cognitive science:
  uncover the internal mechanisms in neural networks and brains
  that underlie and implement behavioral patterns (Smolensky, 1988).
* Finding these internal mechanisms is not a prerequisite for the reality of
  ling structure—the mechanisms may be irreducibly complex. But
* nL when mechanisms are found in neural networks, they can be informative
  not only about ling structure itself, but also about
  how lang processing and learning may be implemented in the human brain

### Interpretability in an idealized thought experiment Consider a thought

* eg the ling concept of c-command (a particular relationship between
  * posited to be important for a variety of structure-sensitive ling patterns).
* we get embedded reprs for each word and use
  an interpretability method to get a repr of the
  pairwise relationship between each pair of words in each sentence
  * we find that, in layer n, neuron m patterns in an interesting way.
  * If and only if the value of that particular neuron is positive, then the
    first word in the pair c-commands the second word. If it’s negative, then we
  * this pattern is remarkably consistent. (N.B.: We want to be clear that no
    experiment would ever give such clean results; LMs just don’t represent
    anything in such human-interpretable ways.) If we did discover a result like
  * we would be justified in drawing several conclusions. First,
    * the ease with which we extracted the c-command relationship would be
      compelling evidence that, for performing ling tasks in English,
      understanding which words c-command which other words is useful — so
    * learning the c-command relationship is possible with relatively little
      built-in lang-specific bias. We would thus
      * ie without a built-in Universal Grammar. Third, we could
    * use this method to test various competing theories about which kinds of
    * use these results to try to work out
      how an abstract structural relationship like c-command can be represented
* If we didn’t find the c-command relationship in our model reprs,
  that’s a trickier scenario.
  * It might mean that
    * We didn't use the right methods to find c-command
    * while c-command is critical to human processing, LMs process lang sans
      c-command. Or it might turn out that
    * neither humans nor models need to represent something like c-command to
  * nL the results could be fruitful for generating hypotheses and stimulating
    further inquiry, grounded in data and requiring precise formulations.
    * the ling conclusions we can draw from LM interpretability experiments
      require care, it should be relatively uncontroversial that
    * nL the idealized c-command experiment above would be lingally interesting

### Interpretability in the real world Our c-command example is not realistic:

* LMs don’t learn and represent information in neat and interpretable ways.
  Rather, it takes a lot of work to ask questions about how LMs represent
  * parts of speech (Tenney+ 2019) or
  * grammatical dependencies (Hewitt and Manning, 2019). And the answers that
* nL The extent to which LMs are “blackboxes” is now overstated because of
  * major advances in the field of neural network interpretability. For example,
  * as discussed in Section 2.2, researchers now have a grip on how neural
  * geometry of word embeddings to represent syntactic relations among words
    (Hewitt and Manning, 2019; Chi+ 2020; Eisape+ 2022; Diego-Simón+ 2024).
  * in a mechanistic way, exactly how artificial neural circuits can be used to
    perform higher-level computations (Lindsey+ 2025), finding
  * neural circuits and induction heads in Transformers (Elhage+ 2021) or using
  * sparse autoencoders to find key features in model reprs (Huben+ 2023)
* These techniques often depend on causal manipulation (perturbation)
  * if particular parts of the neural network are
    perturbed or patched in particular ways,
    the output is affected in predictable ways (Geiger+ 2023).
  * eg Wang+ (2023) traces a circuit that controls the completion of an object
    (e.g., “When Mary and John went to the store, John gave a drink to .” where
    the intended answer is “Mary”).
* causally study what parts of a network are responsible for particular kinds of
  complex ling behavior like
  * grammatical number agreement
    (Lasri+ 2022; Finlayson+ 2021; Mueller+ 2022; Lakretz+ 2019),
  * verb conjugation (Hao and Linzen, 2023),
  * animacy processing (Hanna+ 2023), and
  * long-distance dependencies (Arora+ 2024), various kinds of
* demonstrated: how complex ling behavior can actually be implemented
  * These mechanisms are strong hypotheses for
    how syntactic relationships are represented in the human brain as well.
* our hope and prediction: interpretability techniques will close the gap
  between ling theory and implementation (mechanistic interpretability is a big
  part of “the way forward” per Millière and Buckner, 2024).
  * Millière, R. and Buckner, C. (2024).
    A philosophical introduction to LMs-part ii: The way forward.
    arXiv preprint arXiv:2405.03207.
* exploring
  symbolic reprs in systems that solve genuinely interesting ling tasks, has
  started to make good on the promise of Smolensky’s (1988) prescient vision “in
  which traditional and connectionist theoretical constructs collaborate
  intimately to provide an understanding of cognition”.

## 4.4 What the inductive biases of LMs can tell us about lang

* Kallini+ (2024) refute the claim that neural LMs can learn any lang,
  including unnatural ones, equally well (Bolhuis+ 2024).
  * They compare the learning curves for the GPT-2 architecture trained on
    LMing on English text against models trained on
    various transformations of the English text, designed to create langs
    * intuitively ‘impossible’, but which still have
      the same level of overall predictability as the original English text. For
    * eg a deterministic shuffling function to the tokens of English text,
      * extraordinarily complex but deterministic word order rules that
      violate all known formal characterizations of syntax, and another
    * eg2 a new agreement marker that
      must appear exactly 4 tokens away from a verb, also an unnatural pattern.
  * the model learns from real English text consistently faster than these
    (see also Mitchell and Bowers, 2020; Yang+ 2025; Xu+ 2025; Ziv+ 2025)
* ie Transformers have inductive biases that align with human lang. However,
  * the major determinant of inductive biases in LM is not that they are
    restricted to a particular formal lang class, as might be expected from
    the generative lings paradigm. In fact,
  * in terms of formal expressivity, it seems that Transformers are mismatched
    with the usual formal lang classes used to characterize lang.
  * human lang is sometimes characterized using (extensions of) the
    Chomsky–Schützenberger hierarchy (Chomsky and Schützenberger, 1963;
    Vijay-Shanker+ 1987; Weir, 1988), which encompasses well-known classes such
    * Vijay-Shanker, K., Weir, D. J., and Joshi, A. K. (ACL 1987).
      Characterizing structural descriptions produced by ... gramm formalisms.
* formal lang classes defined by circuit complexity
  (Merrill+ 2022; Strobl+ 2024; Merrill+ 2024),
  * inhabited by
    * Transformers as they are currently applied (and other recently successful
    * State Space Models as well: Gu and Dao, 2024) seem to inhabit
  * a formal lang hierarchy which is
    orthogonal to the Chomsky– Schützenberger hierarchy. 13 To the extent that
    * also been used to characterize the computational capacity of biologically
      realistic populations of neurons (Maass, 1997; Maass and Markram, 2004).
      So human performance may also be ultimately limited in this way.
  * ie something other than the expressive limits
* Below we consider two apparent learning biases of modern LMs which may be

### Information locality

* Human langs are structured in a way such that
  elements that stat predict each other are usually close to each other. For
  * eg big brown box,
  * the noun box and _brown_ are highly predictive of each other—
  * boxes, especially cardboard ones, are often brown, for many reasons—and so
  * the alternate order brown big box sounds odd or like it is conveying some
    other special meaning
    (Futrell, 2019; Culbertson+ 2020; Scontras, 2023; Dyer+ 2023)
* Locality ideas of this kind pervade human lang (Behaghel, 1930; Givón,
  1991; Futrell, 2019; Mansfield, 2021; Hahn+ 2021a; Mansfield and Kemp, 2023):
  * morph: prefixes and suffixes (directly adjacent to them,
    ordered by ‘relevance’ to the root: Bybee, 1985; Saldana+ 2024), and words
  * syntactic dependencies tend to be close to each other
    (Gibson, 1991, 1998; Liu, 2008; Liu+ 2017),
    * more than would expected under random grammars within a lingally
      realistic formalism (Gildea and Temperley, 2007; Park and Levy, 2009;
      Gildea and Temperley, 2010; Futrell+ 2015, 2020b).
* Autoregressive LMs such as GPT-2 also show a bias towards info locality, as
  * many of the counterfactual langs which are harder to learn in Kallini+
    are also those that disrupt information locality.
* The bias towards locality seems to come from the next-token prediction task
* an ‘ember of autoregression’ in the terminology of McCoy+ (2023), one
  McCoy, R. T., Yao, S., Friedman, D., Hardy, M., and Griffiths, T. L. (2023).
  Embers of [parazsa] autoregression:
    Understanding LLMs through the problem they are trained to solve
  arXiv preprint arXiv:2309.13638.  which
  * helps lang learning and is likely shared with humans

### Relatively low sensitivity Another related inductive bias in Transformers is

* the bias toward learning functions with low sensitivity or low polynomial
  degree (Hahn+ 2021b; Abbe+ 2023; Bhattamishra+ 2023).
  * Sensitive functions are functions on input strings whose outputs change
    drastically based on small changes to the input. For example,
  * eg a function on input bitstrings that counts the parity of the
    input is maximally sensitive and high-degree (O’Donnell, 2014)
  * the Transformer architecture has the ability to represent highly sensitive
    functions in terms of its representational capacity, this turns out not to
  * the bias toward low-sensitivity functions
    comes from the shape of the loss landscape induced by the model. In
    * any parameter setting representing a highly sensitive function in the
      Transformer architecture must be brittle, meaning that
      a small change to the parameters would make the Transformer produce some
      different, lower-sensitivity function (Hahn and Rofin, 2024).
    * Thus high-sensitivity functions are unlikely to be reached through a
      gradientdescent-based learning process.
* Human langs, viewed (for example) as
  functions from strings to meanings or to grammaticality judgments, also seem
  * relatively low-sensitivity (Hahn+ 2021b). We do not find human langs
* not an absolute formal restriction on langs. For example,
  * calculating the meaning of iterated negation is like a parity function: What
  * high-sensitivity phenomes are rare in usage, and difficult to understand in
  * Relative low sensitivity perhaps a general cognitive constraint for humans,

## 4.6 Functional explanations for human lang

* another route to explanatory adequacy in ling theory, one which posits
  * the form of lang is related to its function:
    function: communication of thought and social coordination
    under general cognitive constraints on how lang is produced and comprehended
    (Chomsky, 2005; Gibson+ 2019; Levshina, 2022; Bickel+ 2024).
  * The functionalist school of lings, which is
    often contrasted to the generative or formalist approach (Newmeyer, 1998),
  * the structure of lang ultimately reflects constraints and pressures arising
    (Hawkins, 1994, 2004, 2014; Haspelmath, 2008; Comrie, 1989)—perhaps
  * langs with larger communities of speakers or more second lang learners
    might have different pressures (Lupyan and Dale, 2010; Raviv+ 2019).
* lings and LMing already have made fruitful contact at this functional
  level of explanation.
  * By analogy, bird wings and airplane wings are very different things, but
    they share the function of flying in the Earth’s atmosphere, and so they are
    both shaped by the constraints of aerodynamics (Marr, 1982; Gill, 1995).
  * Sim: neural LMs and human lang processing mechanisms are different,
    but at the level of function, they both encode and decode information in
    ling strings _incrementally and predictively_. To the extent that human lang
* Indeed, LMs have already proved a key tool in
  functionalist models of why langs are the way they are. A sizable
  * literature:
  * what kinds of langs emerge in simulated populations of agents who
    communicate by encoding and decoding meanings into strings
    using various neural architectures, and
  * what constraints (on the environment, the agents, or the task) are necessary
    for the emergent langs to resemble natural lang
    (Lazaridou+ 2017; Mordatch and Abbeel, 2018; Steinert-Threlkeld, 2020;
    Kuciński+ 2021; Chaabouni+ 2021). For example,
  * eg Hahn+ (2020): certain universal properties of word order (Greenberg,
    1963; Dryer, 1992) can be derived
    by finding grammars that optimize the ease of
    1. recovering a parse tree from a string, and
    1. incrementally predicting each word, with
    both factors operationalized using neural networks (Kuribayashi+ 2024)
  * Clark+ (2023) show that natural lang
    word order seems to be structured in a way that
    minimizes the variance of word-by-word surprisals,
    again measured using neural LMs,
    in keeping with the theory of Uniform Information Density
    (Fenk & Fenk, 1980; Levy & Jaeger, 2007; Jaeger, 2010; Jaeger & Tily, 2011)
  * More generally,
    because human lang processing is highly probabilistic and predictive,
    theories of ling structure based on functional constraints
    must be evaluated using a strong probabilistic predictive model.
    LM provide exactly that.

## 4.7 Upshots for ling beyond lang structure

* so far we: the upshot of LMs for ling structure, partic morphosyntax
  * We did so for two main reasons: first, because of the
    * centrality of these topics within lings over the last 60+ years;
    * mastery of ling form emerged in models earlier than other high-level
      abilities (Mahowald+ 2024).
  Mahowald K, Ivanova AA, Blank IA, Kanwisher N, Tenenbaum JB, and Fedorenko E,
  Dissociating language and thought in large LMs.
  (2024) Trends in Cognitive Sciences.
* nL LMs have also made recent striking gains in domains like
  reasoning, logic, and long-form dialog.
* These abilities seem to emerge from
  * not just from pretraining, but
  * from supervised finetuning
  * instruction-tuning
  * reinforcement learning from human feedback whereby
    * models are given specific feedback to make them more aligned with human
      behavior on specific tasks (Ouyang+ 2022; Bai+ 2022; Achiam+ 2023).
* inference-time
  * in-context learning and additional computation during generating text— has
  * important for math and reasoning (OpenAI+ 2024; Marjanović+ 2025)
* what inductive biases and structures are necessary and/or sufficient for abils
  * reasoning (Marjanović+ 2025)
  * theory of mind (Hu+ 2025)
  * planning (Liu+ 2023)
  * other aspects of higher-level cognition. Many of our same arguments hold in
* like in ling structure:
  * the upshot of the modern view of learning, the Contravariance Principle, the
    role of the statistical tradition, real patterns.
* LMs increasingly are becoming part of our speech communities. Millions of
  * long extended dialogs with chatbots playing various roles.
  * text read by humans is written or co-written by AI.
    * How will the presence of AI change language?
    * How should we think about dialogs between humans and non-humans?
    * social consequences of this new paradigm? Linguistics as a field,
    * (sociocultural) lings can answer these questions
      (Bucholtz and Hall, 2005; Meyerhoff, 2006)

# 5 Conclusion

* As Norm and Claudette would agree,
  this is a remarkable and pivotal moment in lings.
  * Even ten years ago, it was not obvious that Claudette’s dream
  * models that produce fluent and coherent text
    would be possible in her lifetime—or ever.
  * it would happen using statistical systems trained largely on next-word
  * don’t use Norm’s hand-crafted rules & insights from generative ling theory
  * nL they do draw on decades of
    ling work in distributional semantics and statistical language learning
* enabling new kinds of research and opening up vistas of new
  hypotheses, methods, and research questions. Some of these questions will be
  * eg what kinds of artificial neural architectures best capture language, what
    kinds of biases they hold, and what the sources of those biases are. But we
  * can make progress on some of the oldest and most venerable questions in
    * what must be true of the input data for certain structures to be learned
    * constraints on what languages are possible,
      how does the form of language relate to its function.
* we reject the dichotomy in the discourse around Piantadosi’s (2023)
  * Linguistic structure, as described in ling theories, is
    real and important
    even if LMs learn those structures emergently in a complex statistical way.
* LMs can point the way of thinking about the learning, processing
* major revisions to some earlier accepted dogma that are warranted, including:
  * ?symbolic
    * Much of the field of lings has assumed that
      * the form of language must be explained in terms of a symbolic formalism
        that constrains the forms of possible languages, and that
      * this grammar formalism must represent innate human constraints on
        language, and that
      * these constraints are logically necessary for language to be learned. The
    * a new universe of statistical, quantitative, and functional theories
      to constrain the forms of possible languages and
      explain why only humans have language, while at the same time providing the
    * tools to test those theories.
  * ?the formal structure of ling competence should be the focus of theo ling
    * new dimensions of language such as
    * how corpora of text express world knowledge,
    * how the structure of usage supports learning or doesn’t, and
    * how fundamental information-processing constraints shape the way that
      language is represented in brains and machines.
  * language can be represented in ways that are graded, probabilistic, and
    fuzzy, which
    should move us away from an insistence on discrete categorical frameworks.
    * potential soft constraints on the structure of language.
  * The ontological basis for ling structure
    need not lie in an innate genetic endowment.
Linguistic structure is a real pattern, just as real and worthy of study whether
it lies innate in the human genome or whether it is learned entirely through
inductive statistical learning with domain-general biases. Linguistic phenomena
do not become less interesting when they are learnable in this way, they become
more interesting.
* ling needs the rest of science and methods
  * ling stands to benefit from new ways of thinking about computation arising
    from the analysis of neural networks.
* massive intellectual activity spurred by LMs in
  cognitive science, philosophy, physics, statistical learning theory, and
  information theory. The science of language can draw
  * ideas, methods, and inspiration from all of this by maintaining
  * a spirit of deep, curious, open-minded engagement and integration.
* expansive ling — expansive in the breadth and
  diversity of languages it considers, expansive in its
  methods, and expansive in its
  connections to related fields.
* Baroni (2022) lamented that, as of a 2021 exploration of citation records,
  Linzen+ 2016’s seminal work on subject-verb agreement was largely uncited
  within the ling community. But,
  * since then, there are increasingly researchers using LMs to ask
    questions that are informed by and which can inform ling theory.
* in NLP, significant interest in fundamentally ling questions. Of the 7 papers
* 7 Best Papers at ACL 2024,
  * a direct response to a claim by Chomsky about language learning
    (Kallini+ 2024)
  * inductive biases in models (Hahn and Rofin, 2024)
    * relevant for constraints on language 
  * satisfiability in natural language (Madusanka+ 2024)
    * a theoretically motivated paper studying 
    * relevance to old questions about the complexity of language 
  * a new method for measuring memorization in models and is of 
    * relevant for studying trade-offs in memorization vs generalization in
      natural language (Lesci+ 302024), 
  * 2 were about reconstructing or recovering ancient languages 
    (Lu+ 2024; Guan+ 2024)
  * an open-access multilingual model for broadening coverage of under-resourced
    languages (Üstün+ 2024) 
    Üstün A, Aryabumi V, Yong Z, Ko W-Y, D’souza D, Onilude G, Bhandari N,
      Singh S, Ooi H-L, Kayid A, Vargus F, Blunsom P, Longpre S, Muennighoff N,
      Fadaee M, Kreutzer J, and Hooker S,  
    Aya model: An instruction finetuned open-access multilingual language model
    ACL 2024
* these papers are relevant to scientific questions about human language, and 
  * in most cases one or more of the authors works in a ling department and/or
    has a degree in ling.
* interdisciplinary work is already thriving in the 21st century.
  * Linguistically informed computational work is increasingly taking place
    within ling departments, where 
    computational researchers are working alongside syntacticians, semanticists,
    phonologists, language documentation experts, sociocultural linguists, and
    experts in a wide variety of languages and language families. We think this
