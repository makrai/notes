from Speech and Language Processing Second Edition
Daniel Jurafsky and James H. Martin

## 1 Introduction

* The idea of giving computers the ability to process human language is
  * as old as the idea of computers themselves
  * a vibrant interdisciplinary field with
    * many names corresponding to its many facets, names like
      speech and language processing, human language technology, natural
      language processing, computational linguistics, and speech recognition
      and synthesis
  * The goal of this new field is to
    get computers to perform useful tasks involving human language, tasks like
    enabling human-machine communication, improving human-human communication,
    or simply doing useful processing of text or speech
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
  * the mathematical models that are introduced throughout the book

## 1.1 Knowledge in Speech and Language Processing

* eg the Unix wc program, which counts the total number of bytes, words, and ls
  * when it is used to count the words in a file, it requires knowledge about
    what it means to be a word and thus becomes a language processing system
* HAL must be able to
  * speech recognition and speech synthesis
    require knowledge about phonetics and phonology
    * how words are pronounced in terms of sequences of sounds and how each of
      these sounds is realized acoustically
  * Producing and recognizing word forms
    * variations of individual words (e.g., recognizing that doors is plural)
    * morphology, the way words break down into component parts that carry
      meanings like singular versus plural
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
    * pragmatic or dialogue knowledge
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

* most tasks in speech and language processing can be viewed as
  resolving ambiguity at one of these levels. We say some input is
  * ambiguous if multiple, alternative linguistic structures can be built for
  * eg the spoken sentence _I made her duck_. Here are five different meanings
    * I cooked waterfowl for her
    * I cooked waterfowl belonging to her
    * I created the (plaster [gipsz]?) duck she owns
    * I caused her to quickly lower her head or body
    * I waved my magic wand and turned her into undifferentiated waterfowl
* duck and her are morphologically or syntactically ambiguous in their POS
  * Duck can be a verb or a noun, while her can be a dative pronoun or a posses
  * _make_ is
    * semantically ambiguous; it can mean create or cook. Finally, the verb
    * syntactically ambiguous in a different way. Make can be
      * transitive, that is, taking a single direct object (1.6), or it can be
      * ditransitive, that is, taking two objects (1.9),
        meaning that the first object (her) was made into the second object
    * take a direct object and a verb (1.8), meaning that the object (her) was
      caused to perform the verbal action (duck)
  * in a spoken sentence, the first word could have been eye or the 2nd maid
* models and algorithms as ways to resolve or disambiguate these ambiguities
  * lexical disambiguation
    * deciding whether duck is a verb or a noun can be solved by POS tagging
    * whether make means “create” or “cook” can be solved by word sense disambig
    * text-to-speech synthesis system reading the word lead needs to decide
      whether it should be pronounced as in lead pipe or as in lead me on. By
  * syntactic disambiguation
    * whether her and duck are part of the same entity (as in (1.5) or (1.8))
    * can be addressed by probabilistic parsing. We also consider ambiguities
    * whether a sentence is a statement or a question: speech act interpret

## 1.3 Models and Algorithms

* the various kinds of knowledge described in the last sections can be captured
  through the use of a small number of formal models or theories
  * all from the standard toolkits of computer science, mathematics, and ling
  * state machines, rule systems, logic, probabilistic models, and vector-space
  * algo
    * state space search algorithms, such as dynamic programming, and
    * machine learning algorithms, eg classifiers and Expectation-Maximization
* State machines and formal rule systems are the main tools used when dealing
  with knowledge of phonology, morphology, and syntax
  * state machines are formal models that consist of states, transitions among
    states, and an input representation. Some of the variations of this basic
    * (non-)deterministic and finite-state automata and finite-state transducers
  * their declarative counterparts: formal rule systems. Among the more
    * probabilistic and nonprobabilistic
    * regular grammars and regular relations,
      context-free grammars,
      feature-augmented grammars
* models based on logic. We discuss
  * first-order logic, also known as the predicate calculus, as well as such
  * lambda-calculus, feature structures, and semantic primitives. These logical
  * traditionally been used for modeling semantics and pragmatics, although
    more recent work has tended to focus on potentially more robust techniques
    drawn from non-logical lexical semantics
* Probabilistic models are crucial for capturing every kind of linguistic knowl
  * Each of the other models (state machines, formal rule systems, and logic)
    can be augmented with probabilities. For example, the
  * state machine become the weighted automaton, or Markov model. We spend a
  * hidden Markov models or HMMs, which are used everywhere in the field, in
    part-of-speech tagging, speech recognition, dialogue understanding,
    text-to-speech, and machine translation. The key advantage of probabilistic
  * can solve the many kinds of ambiguity problems that we discussed earlier;
    almost any speech and language processing problem can be recast as “given N
    choices for some ambiguous input, choose the most probable one”
* vector-space models, based on linear algebra, underlie
  information retrieval and many treatments of word meanings
* search through a space of states representing hypotheses about an input
  * using any of these models typically involves it
    * speech recognition: space of phone sequences for the correct word. In
    * parsing, we search through a space of trees for the syntactic parse
    * machine translation, we search through a space of translation hypotheses
  * algo
    * non-probabilistic tasks, such as tasks involving state machines, we use
      well-known graph algorithms such as depth-first search. For
    * probabilistic tasks, we use heuristic variants such as
      best-first and A* search and rely on dynamic programming algorithms
      for computational tractability
* Machine learning tools such as classifiers and sequence models play a
  * Based on attributes describing each object, a
  * classifier attempts to assign a single object to a single class while a
    * eg whether a word is spelled correctly, classifiers
    * eg decision trees, support vector machines, Gaussian mixture models, and
      logistic regression could be used to make a binary decision (correct or)
      for one word at a time
  * sequence model attempts to jointly classify a sequence of objects
    into a sequence of classes
    * eg hidden Markov models, maximum entropy Markov models, and CRFs could be
    * assign correct/incorrect labels to all the words in a sentence at once
* the same methodological tools that are used in machine learning research—the
  * training and test sets, statistical techniques like cross-validation, and
    careful evaluation of trained systems

## 1.4 Language, Thought, and Understanding

* Turing test
  * the ability of computers to process language as skillfully as we humans do
    will signal the arrival of truly intelligent machines. The basis of this
  * language is intertwined with our general cognitive abilities
  * Alan Turing (1950). In this famous paper, Turing introduced what has come
    * three participants: two people and a computer. One of the people is a
    * the interrogator must determine which of the other two participants is
* 1966 ELIZA was an early natural language processing system capable of
  * a version of ELIZA imitated the responses of a Rogerian psychotherapist
  * we discuss in more detail in Chapter 2, ELIZA is a remarkably simple
  * pattern matching to process the input and translate it into suitable
    outputs
  * This simple technique succeeds in this domain because ELIZA doesn’t
    actually need to know anything to mimic a Rogerian psychotherapist. As
    * Weizenbaum notes, this is one of the few dialogue genres where listeners
      can act as if they know nothing of the world
  * many people who interacted with ELIZA came to believe that it really
    understood them and their problems. Indeed, Weizenbaum (1976) notes that
    * many of these people continued to believe in ELIZA’s abilities even after
    the program’s operation was explained to them
  * In more recent years, Weizenbaum’s informal tests have been repeated in a
    somewhat more controlled setting
  * Since 1991, an event known as the Loebner Prize competition has attempted
    to put various computer programs to the Turing test. Although these
    * little scientific interest, a consistent result over the years has been
    * even the crudest programs can fool some of the judges some of the time
      (Shieber, 1994a)
    * nothing to quell [csillapít] the ongoing debate over the suitability of
      the Turing test as a test for intelligence among philosophers and AI
      researchers (Searle, 1980)
* social sciences that has confirmed another of Turing’s predictions from the
  same paper
  * at the end of the century the use of words and educated opinion will have
    altered so much that we will be able to speak of machines thinking without
    expecting to be contradicted
  * regardless of what people believe or know about the inner workings of comps
    * people talk about them and interact with them as social entities
    * people are polite to them, treat them as team members, and expect, among
      other things, that computers should be able to understand their needs and
      be capable of interacting with them naturally. For example,
  * Reeves and Nass (1996): when a computer asked a human to evaluate how well
    the computer had been doing, the human gives more positive responses than
    when a different computer asks the same questions. People seemed to be
    * people also give computers higher performance ratings if the computer has
      recently said something flattering to the human. Given these
  * speech~ and language-based systems may provide many users with the most
    natural interface for many applications. This fact has led to a long-term

## 1.5 The State of the Art

## 1.6 Some Brief History

### 1.6.1 Foundational Insights: 1940s and 1950s

* the automaton and probabilistic or information-theoretic models
* automaton arose in the 1950s
  out of Turing’s (1936) model of algorithmic computation, considered by many
  * the foundation of modern computer science
  * McCulloch-Pitts neuron (McCulloch and Pitts, 1943), a simplified model of
    the neuron as a kind of computing element that could be described in terms
    of propositional logic, and then to the work of
  * Kleene (1951, 1956) on finite automata and regular expressions
  * Shannon (1948) applied probabilistic models of discrete Markov processes to
    automata for language
  * Drawing on the idea of a finite-state Markov process from Shannon’s work,
    Chomsky (1956) first considered finite-state machines as a way to
    characterize a grammar and defined a finite-state language as a language
    generated by a finite-state grammar
    * formal language theory, which used algebra and set theory to define
      formal languages as sequences of symbols. This
    * context-free grammar, first defined by Chomsky (1956) for natural langs
      * independently discovered by Backus (1959) and Naur+ (1960) in their
        descriptions of the ALGOL programming language
* probabilistic algorithms for speech and language processing, which dates to
  * Shannon: the metaphor of the noisy channel and decoding for the
    transmission of language through media such as communication channels and
    speech acoustics
    * borrowed the concept of entropy from thermodynamics as a way of measuring
      the information capacity of a channel, or the information content of a
      language, and performed
    * the first measure of the entropy of English by using probabilistic
      techniques.  It was also during this early period
  * sound spectrograph was developed (Koenig+ 1946), and foundational research
    * instrumental phonetics that laid the groundwork for later work in speech
      recognition. This led to the first
    * machine speech recognizers in the early 1950s
    * 1952 Bell Labs built a statistical system that could recognize any of the
      10 digits from a single speaker (Davis+ 1952). The system had
      * 10 speaker-dependent stored patterns roughly representing the first two
        vowel formants in the digits. They achieved
      * 97%–99% accuracy by choosing the pattern that had the highest relative
        correlation coefficient with the input

### 1.6.2 The Two Camps: 1957–1970

* symbolic and stochastic
  * speech and language processing had split very cleanly into two paradigms:
* symbolic paradigm took off from two lines of research. The first was the
  1. Chomsky and others on formal language theory and generative syntax
     throughout the late 1950s and early to mid 1960s, and the
     work of many linguistics and computer scientists on parsing algorithms,
     initially top-down and bottom-up and then with dynamic programming
    * One of the earliest complete parsing systems was
      Zelig Harris’s Transformations and Discourse Analysis Project (TDAP),
      * implemented between June 1958 and July 1959 at the University of
        Pennsylvania (Harris, 1962)
    * reimplemented recently and is
      * described by Joshi and Hopely (1999) and Karttunen (1999), who note
      * the parser was essentially implemented as a cascade of FSTs
  2. the new field of artificial intelligence
    * summer of 1956
      John McCarthy, Marvin Minsky, Claude Shannon, and Nathaniel Rochester
      brought together a group of researchers for a two-month workshop on
      what they decided to call artificial intelligence (AI)
    * Although AI always included a minority of researchers focusing on
      stochastic and statistical algorithms (including probabilistic models
      and neural nets), the
    * major focus of the new field was the work on reasoning and logic
      typified by Newell and Simon’s work on the Logic Theorist and the
      General Problem Solver. At this point,
    * early natural language understanding systems were built
      * These simple systems worked in single domains mainly by a combination
        of pattern matching and keyword search with simple heuristics for
        reasoning and question-answering
    * By the late 1960s, more formal logical systems were developed
* stochastic: in departments of statistics and of electrical engineering
  * By the late 1950s, the Bayesian method was beginning to be applied to the
    problem of optical character recognition
  * Bledsoe and Browning (1959) built a Bayesian text-recognition that
      used a large dictionary and computed the
      likelihood of each observed letter sequence given each word in the
      dictionary by multiplying the likelihoods for each letter
  * Mosteller and Wallace (1964) applied Bayesian methods to the problem of
    authorship attribution on The Federalist papers
  * 1960s also saw the rise of
    * the first serious testable psychological models of human language
      processing based on transformational grammar, as well as
    * the first online corpora
      * the Brown corpus of American English, a one-million-word collection of
        samples from 500 written texts from different genres (newspaper,
        novels, non-fiction, academic, etc.), which was assembled at Brown
        University in 1963–64 (Kučera and Francis, 1967; Francis, 1979; Francis
        and Kučera, 1982), and
    * William S. Y. Wang’s 1967 DOC (Dictionary on Computer), an on-line
      Chinese dialect dictionary

### 1.6.3 Four Paradigms: 1970–1983

* explosion in research in speech and language processing and the development
  of a number of research paradigms that still dominate the field
* The stochastic paradigm played a huge role in the development of
  speech recognition algorithms in this period, particularly the use of the
  hidden Markov model (HMM) and
  the metaphors of the noisy channel and decoding,
  developed independently by
    Jelinek, Bahl, Mercer, and colleagues at IBM’s Thomas J. Watson Research
    Center, and by
    Baker at Carnegie Mellon University, who was influenced by the work of Baum
    and colleagues at the Institute for Defense Analyses in Princeton
    AT&T’s Bell Laboratories was another key center for work on speech
    recognition and synthesis; see Rabiner and Juang (1993) for descriptions of
    the wide range of this work
* The logic-based paradigm was begun by the work of Colmerauer+ on Q-systems
  and metamorphosis grammars (Colmerauer, 1970, 1975), the forerunners of
  Prolog, and Definite Clause Grammars (Pereira and Warren, 1980)
  * Independently, Kay’s (1979) work on functional grammar and shortly later,
    Bresnan and Kaplan’s (1982) work on Lexical Functional Grammar (LFG),
    established the importance of feature structure unification
* The natural language understanding field took off during this period,
  * Winograd’s SHRDLU system, which simulated a robot embedded in a world of
    toy blocks (Winograd, 1972a). The program was able to accept
    natural-language text commands (Move the red block on top of the smaller
    green one) of a hitherto unseen complexity and sophistication. His system
    * first to attempt to build an extensive (for the time) grammar of English,
      based on Halliday’s systemic grammar
    * made it clear that the problem of parsing was well enough understood to
      begin to focus on semantics and discourse
  * Roger Schank and his colleagues and students (in what was often referred
    to as the Yale School) built a series of language-understanding programs
    that focused on
    conceptual knowledge such as scripts, plans, and goals, and human memory
    organization (Schank and Abelson, 1977; Schank and Riesbeck, 1981;
    Cullingford, 1981; Wilensky, 1983; Lehnert, 1977). This work often used
    * network-based semantics (Quillian, 1968; Norman and Rumelhart, 1975;
      Schank, 1972; Wilks, 1975c, 1975b; Kintsch, 1974) and began to
    * incorporate Fillmore’s notion of case roles (Fillmore, 1968) into their
      representations (Simmons, 1973)
* The logic-based and natural-language-understanding paradigms were unified in
  systems that used predicate logic as a semantic representation, such as the
  LUNAR question-answering system (Woods, 1967, 1973)
* The discourse modeling paradigm focused on four key areas in discourse
  * Grosz+: substructure in discourse, and of discourse focus
    (Grosz, 1977a; Sidner, 1983)
  * automatic reference resolution (Hobbs, 1978)
  * BDI (Belief-Desire-Intention) framework for logic-based work on speech acts
    (Perrault and Allen, 1980; Cohen and Perrault, 1979)

### 1.6.4 Empiricism and Finite State Models Redux: 1983–1993

* the return of two classes of models
  that had lost popularity in the late 1950s and early 1960s, partially due to
  theoretical arguments against them such as Chomsky’s influential review of
  Skinner’s Verbal Behavior (Chomsky, 1959b). The first class was
1. finite-state models, which began to receive attention again after work on
   * finite-state phonology and morphology by Kaplan and Kay (1981) and
     finite-state models of syntax by Church (1980)
2. the “return of empiricism”; most notable here was
  * the rise of probabilistic models throughout speech and language processing,
    influenced strongly by the work at the IBM Thomas J.  Watson Research
    Center on probabilistic models of speech recognition
  * probabilistic methods and other such data-driven approaches spread
    from speech into part-of-speech tagging, parsing and attachment
    ambiguities, and semantics
  * new focus on model evaluation, based on using held-out data, developing
    quantitative metrics for evaluation, and emphasizing the comparison of
    performance on these metrics with previous published research.  This period
  * considerable work on natural language generation

### 1.6.5 The Field Comes Together: 1994–1999

* probabilistic and data-driven models had become quite standard throughout NLP
  * Algorithms for parsing, part-of-speech tagging, reference resolution, and
    discourse processing all
    began to incorporate probabilities and to employ evaluation methodologies
    borrowed from speech recognition and information retrieval. Second, the
* increases in the speed and memory of computers had allowed
  commercial exploitation of a number of subareas of speech and language proc,
  in particular, speech recognition, and spelling and grammar correction
  * algorithms began to be applied to Augmentative and Alternative
    Communication (AAC). Finally,
* the rise of the Web emphasized the need for language-based information
  retrieval and information extraction

### 1.6.6 The Rise of Machine Learning: 2000–2007

* empiricist trends accelerated at an astounding pace in the new century. This
* largely driven by three synergistic trends
* large amounts of spoken and written material became widely available through
   the auspices of the Linguistic Data Consortium (LDC) and other similar
   organizations
  * Penn Treebank (Marcus+ 1993), Prague Dependency Treebank (Hajič, 1998),
    PropBank (Palmer+ 2005), Penn Discourse Treebank (Miltsakaki+ 2004b),
    RSTBank (Carlson+ 2001) and TimeBank (Pustejovsky+ 2003b), all of which
    layered standard text sources with various forms of syntactic, semantic,
    and pragmatic annotations. The existence of these resources promoted the trend of
  * casting more complex traditional problems, such as parsing and semantic
    analysis, as problems in supervised machine learning
  * establishment of additional competitive evaluations for
    parsing (Dejean and
    Tjong Kim Sang, 2001)
    * information extraction
      (NIST, 2007a; Tjong Kim Sang, 2002; Tjong Kim Sang and De Meulder, 2003)
    * word sense disambiguation (Palmer+ 2001; Kilgarriff and Palmer, 2000)
    * question answering (Voorhees and Tice, 1999)
    * summarization (Dang, 2006)
* more serious interplay with the statistical machine learning community
  * increased focus on learning led to a ^
  * Techniques such as
    support vector machines (Boser+ 1992; Vapnik, 1995),
    maximum entropy techniques and their equivalent formulation as multinomial
    logistic regression (Berger+ 1996), and
    graphical Bayesian models (Pearl, 1988)
    became standard practice in computational linguistics
* the widespread availability of high-performance computing systems facilitated
  the training and deployment of systems that could not have been imagined a
  decade earlier
* near the end of this period,
  largely unsupervised statistical approaches began to receive renewed attent
  * statistical approaches to
    * machine translation (Brown+ 1990; Och and Ney, 2003) and
    * topic modeling (Blei+ 2003) demonstrated that
      effective applications could be constructed from systems trained on
      unannotated data alone
  * the widespread cost and difficulty of producing reliably annotated corpora
    became a limiting factor in the use of supervised approaches for many
    problems. This trend toward the use of unsupervised techniques will likely
    increase

### 1.6.7 On Multiple Discoveries

* eg
  * dynamic programming to sequence comparison by Viterbi, Vintsyuk, Needleman
    and Wunsch, Sakoe and Chiba, Sankoff, Reichert+ and Wagner and Fischer
    (Chapters 3, 5, and 6)
  * the HMM/noisy channel model of speech recognition by Baker and by Jelinek,
    Bahl, and Mercer (Chapters 6, 9, and 10)
  * the development of context-free grammars by Chomsky and by Backus and Naur
    (Chapter 12)
  * the proof that Swiss-German has a non-context-free syntax by Huybregts and
    by Shieber (Chapter 16)
  * the application of unification to language processing by Colmerauer+ and by
    Kay (Chapter 15)
* sociologist of science Robert K. Merton (1961) argues, quite the contrary,
  that all scientific discoveries are in principle multiples, including those
  that on the surface appear to be singletons
  * well-known cases of multiple discovery or invention; just a few examples
  * extensive list in Ogburn and Thomas (1922) include the multiple invention
  * calculus by Leibnitz and by Newton, the multiple development of
  * natural selection by Wallace and by Darwin, and the multiple invention of
  * telephone by Gray and Bell. 3 But Merton gives a further array of evidence
  * multiple discovery is the rule rather than the exception, including
    * many cases of putative singletons that turn out be a rediscovery of
      previously unpublished or perhaps inaccessible work. An even stronger
  * ethnomethodological point that scientists themselves act under the
    assumption that multiple invention is the norm.  Thus many aspects of
  * scientific life are designed to help scientists avoid being “scooped”
    [publish a news story before]: submission dates on journal articles,
    careful dates in research records, circulation of preliminary or technical
    reports

### 1.6.8 A Final Brief Note on Psychology

* Many of the chapters in this book include
  short summaries of psychological research on human processing. Of course,
* understanding human language processing is a scientific goal in its own right
  * part of the general field of cognitive science. However, an understanding
  * nL can often be helpful in building better machine models of language. This
  * contrary to the popular wisdom, which holds that direct mimicry of nature’s
    algorithms is rarely useful in engineering applications
    eg if we copied nature exactly, airplanes would flap their wings; yet
    airplanes with fixed wings are a more successful engineering solution. But
  * language is not aeronautics. Cribbing from nature is sometimes useful for
    * human-centered tasks. Airplane flight has different goals from bird
    * the goal of speech recognition systems, for example, is to perform
      exactly the task that human court reporters perform every day: transcribe
    * people already do this well, we can learn from nature
    * an important application of speech and language processing systems is for
      human-computer interaction, it makes sense to copy a solution that
      behaves the way people are accustomed to

## 1.7 Summary

## Bibliographical and Historical Notes

* conference proceedings and journals. The conferences and journals most
  * the Association for Computational Linguistics (ACL), its European
    counterpart (EACL), and the International Conference on Computational
    Linguistics (COLING). The annual proceedings of ACL, NAACL, and EACL, and
    the biennial COLING conference are the primary forums in this area. Related
  * ACL Special Interest Groups (SIGs) such as the Conference on Natural
    Language Learning (CoNLL), as well as the conference on Empirical Methods
    in Natural Language Processing (EMNLP)
* speech recognition, understanding, and synthesis is presented at the annual
  INTERSPEECH conference, which is
  called the International Conference on Spoken Language Processing (ICSLP),
  and the European Conference on Speech Communication and Technology
  (EUROSPEECH) in alternating years, or
  the annual IEEE International Conference on Acoustics, Speech, and Signal
  Processing (IEEE ICASSP)
  * Spoken language dialogue research is presented at these or at workshops
    like SIGDial
* Journals include Computational Linguistics, Natural Language Engineering,
  Computer Speech and Language, Speech Communication, the IEEE Transactions
  on Audio, Speech & Language Processing, the ACM Transactions on Speech and
  Language Processing, and Linguistic Issues in Language Technology
* available for free online at the ACL Anthology
  (http://www.aclweb.org/anthology-index/)
  * Many of these papers, including those from the Computational Linguistics
    journal and the ACL, COLING, and related conferences
* from an Artificial Intelligence perspective can be found in the annual
  meetings of the American Association for Artificial Intelligence (AAAI), as
  well as the biennial International Joint Conference on Artificial Intelli-
  gence (IJCAI) meetings. Artificial intelligence
  * journals that periodically feature work on speech and language processing
    include Machine Learning, Journal of Machine Learning Research, and the
    Journal of Artificial Intelligence Research
* textbooks covering various aspects of speech and language processing are
  * Manning and Schütze (1999) (Foundations of Statistical Language Processing)
    focuses on statistical models of tagging, parsing, disambiguation,
    collocations, and other areas
  * Charniak (1993) (Statistical Language Learning) is an accessible, though
    older and less-extensive, introduction to similar material
  * Manning+ (2008) focuses on information retrieval, text classification, and
    clustering
  * NLTK, the Natural Language Toolkit (Bird and Loper, 2004), is a suite of
    Python modules and data for natural language processing, together with a
    Natural Language Processing book based on the NLTK suite
  * Allen (1995) (Natural Language Understanding) provides extensive coverage
    of language processing from the AI perspective
  * Gazdar and Mellish (1989) (Natural Language Processing in
    Lisp/Prolog/Pop11) covers especially automata, parsing, features, and
    unification and is available free online
  * Pereira and Shieber (1987) gives a Prolog-based introduction to parsing and
    interpretation
  * Russell and Norvig (2002) introduce artificial intelligence with chapters
    on natural language processing
  * Partee+ (1990) broadly cover mathematical linguistics
  * A historically significant collection of foundational papers can be found
    in Grosz+ (1986) (Readings in Natural Language Processing)
* places to acquire corpora of speech and text. One of the largest is the
  * Linguistic Data Consortium, a non-profit consortium that creates and
    distributes corpora (http://www.ldc.upenn.edu/)
  * See the textbook web page for pointers to others such as
    CHILDES (http://childes.psy.cmu.edu/),
    the British National Corpus (http://www.natcorp.ox.ac.uk/), the
    International Corpus of English (http://www.ucl.ac.uk/english-usage/ice/),
    Project Gutenberg (http://www.gutenberg.org/)
