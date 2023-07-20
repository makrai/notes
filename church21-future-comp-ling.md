The Future of Computational Linguistics: On Beyond Alchemy
Kenneth Church and Mark Liberman
Front. Artif. Intell., 19 April 2021 Sec. Language and Computation Volume 4 -

# Abstract

* Over the decades, fashions in Computational Linguistics have changed again
  * major shifts in motivations, methods and applications. When
  * digital computers first appeared, linguistic analysis adopted the new
    methods of information theory, which accorded well with the ideas that
    dominated psychology and philosophy
  * formal language theory and the idea of AI as applied logic, in sync with
    the development of cognitive science
  * a revival of 1950s-style empiricism—AI as applied statistics—which in turn
  * deep nets
  * we offer some thoughts about paths forward, especially for younger
    * the climate is changing again, and

# 1 Introduction: Better Together

* we will define the field of Computational Linguistics by
  what is discussed in top venues, using Google Scholar’s ranking of venues.1
* name of one of ACL, was controversial in the 1960s. The current name
  * dates back to 1968
  * Before that, the name of the society included the phrase, MT
    * a topic that was more popular before the ALPAC report (Pierce and
      Carroll, 1966) than after the ALPAC report, especially among funding
      agencies in America, for reasons described by Hutchins (2003) among
  * One of the reviewers asked us to define the field in a way that will stand
    up to the test of time, but unfortunately, it is difficult to pigeonhole
  * has been closer to Linguistics at times, but is
  * currently closer to Computer Science (Engineering),
    and especially Machine Learning
    * many favoring end-to-end systems over representation
      (with or without statistics)
* we will describe the past as tribes of researchers migrating through a
  changing conceptual and socio-economic landscape
  * changes are caused by
    * inventions and ideas from outside the field, and also by
    * own correlated philosophical, methodological, and technical evolution.
* this history as a sequence of well-defined stages, defined by
  * a sequence of dominant ideologies about
  how to define and analyze linguistic patterns. Thus
  1. (1950s): Empiricism I—information theory
  2. (1970s): Rationalism I—formal language theory and logic
  3. (1990s): Empiricism II—stochastic grammars
  4. (2010s): Empiricism III—Deep Nets
* ? winner-take-all picture of the field? no
  * give-and-take of interdisciplinary ideas, making room for various
    combinations of methodologies and philosophies, in different proportions at
  * Logic played a larger role when rationalism was in fashion, and
  * probability played a larger role when empiricism was in fashion, and
  * both faded into the background as deep nets gave procedural life to
    * an associationist (rather than statistical) flavor of empiricism. But at
  * research communities of various sizes inhabiting or exploring different
    * motivated by their various ideological visions, their preferred
      methodological tools, and their substantive goals.
* Church (2011): a pendulum swinging back and forth between Rationalism and
  Empiricism
  * few statistical papers in ACL conferences3 in 1990
  * a decade later, there were very few non-statistical papers. Just as Chomsky
* top venues in computational linguistics (as defined in footnote 1) make use
* good ideas rarely disappear completely, even during winters
  * Hinton and LeCun believed in nets and kept at it, even when it wasn’t
    fashionable (Rumelhart+ 1985; LeCun+ 1998; Krizhevsky+ 2012; LeCun+ 2015).
  * Salton believed in vector spaces (Salton+ 1983; Salton and Buckley, 1988;
    Salton+ 1993; Salton and Harman, 2003; Dubin, 2004).
* In retrospect, the metaphors of rebellions and pendulums are unfortunate.
  * Sometimes ideas are clashing
    * esp in the presence of unusually strong personalities like Chomsky, but
  * more often, there is plenty of room for multiple positions to co-exist,
    sometimes in the very same person. As we will see,
    * eg Shannon made important contributions to multiple positions.
* Most positions have much to recommend them. At each historical stage,
  * there’s a combination that is better than the best “pure” position. We will
  * tempting to emphasize differences, but more profitable to emphasize synergs.  

## 1.1 Can We Use the Past to Predict the Future?

     If you don’t like the weather in New England now, just wait a few minutes.
                                                                     Mark Twain

* it is a good bet that the future will not be like the present. There was
  considerable relevant history before the 1950s, and there will certainly be
  more changes in the future.
* the times may be ripe for change, though it is hard to say in which direction
  * will involve some combination of logic, probability and connectionism,
  * probably in different proportions from what they are now, or what they were
  * we ought to provide today’s students with a broad education that makes room
  * classes on computational linguistics are removing many topics that we used
* Consider BERT (Devlin+ 2018). Transformer nets have taken the field by storm,
  * 14k citations for this one BERT paper in just two years, with
  * many more citations for other transformer nets: ERNIE (Sun+ 2020), GPT5
    (Brown+ 2020), ELMO (Peters+ 2018), etc. Given all this excitement over
  * will there be a future beyond BERT? Probably so, given that
  * history of paradigm changes every few decades.
* Sometimes the theory is ahead of the practice,6 but these days, the
  * deep net practice is well ahead of the theory. LeCun expressed this fact
  * Elsewhere,8 LeCun argued that “Theory often follows invention,” using
    examples like those in Table 1 to make the case.
* Histories of Artificial Intelligence (AI) often start in 1956 with
  * the naming of the field,9 but of course,
  * many of the key ideas are considerably older than the name. As mentioned
  * logic and probability have played an important role in the history of AI.
  * Sometimes logic and probability co-exist in harmony. In fact,
    * Boole’s seminal 1854 book on mathematical logic (Boole, 1854) mentions
      “probability” in the title: “An Investigation of the Laws of
    * a century later, Shannon made two crucial contributions, one on each side
      * His 1937 master’s thesis, which made digital computers possible by
        translating expressions of Boolean logic systematically into
        electrical-mechanical terms, was titled “A Symbolic Analysis of Relay
      * his 1948 monograph ”A mathematical theory of communication” (Shannon,)
        * introduced the concepts and techniques of information theory based on
        * messages are sequences of symbols generated by a stochastic process.
* a third concept arose in Ronald Fisher’s 1936 paper “The use of multiple
  * a method for dividing multivariate measurements into categories based on
    thresholding a linear combination of the measurement vectors. Although
  * this results in a categorical classification, it is obviously not a logical
    expression, since it involves arithmetic on numerical measurements. And
  * based on assumptions about the underlying population distributions, the
  * idea is not limited by any considerations of probability theory—it is just
  * a thresholded inner product. Generalizations of this idea
  * networks of matrix multiplications interconnected via point
    non-linearities—have risen to prominence under a variety of
  * names: the “perceptron,” “neural nets,” “parallel distributed processing,”
    “connectionism,” and most recently “deep learning.” Fisher’s contributions
* In 1943, Warren McCulloch and Walter Pitts aimed to
  bring Boolean logic to neuroscience, in a paper with the
  * title “A logical calculus of the ideas immanent in nervous activity”
  * “neural events and the relations among them can be treated by means of
    propositional logic
  * Stephen Kleene’s 1951 paper “Representation of events in nerve nets and
    finite automata,” he re-expressed the McCulloch-Pitts system to cover
    * what he called “regular events,” constituting a “regular language”
      symbolized via what we now call “regular expressions”
  * recursive function theory and its development into formal language theory,
  * enormous influence on linguistics and computer science, but it seems to
  * a dead end from the perspective of neural computation.  Instead, it was
  * an extension of Fisher’s discriminant analysis that succeeded in that
    arena, starting with Frank Rosenblatt’s 1958 paper “The perceptron: a
    probabilistic model for information storage and organization in the brain”
    * “probabilistic model” means only that most of the values used in
      learning, computation, and storage are gradient rather than categorical,
      while some binary decisions are made by thresholding: “If the algebraic
  * a simple iterative method for learning the weights and thresholds needed to
* an enthusiastic ferment of perceptron-inspired speculation, which was
  * dampened by the criticisms in Minsky and Papert’s 1969 book “Perceptron: an
    introduction to computational geometry” (Minsky and Papert, 1969), which
    * linear perceptrons were too limited for serious applications, and that
    * non-linear networks would be in general impossible to train.  Another
  * sparked by the work summarized in the 1986 book “Parallel distributed
    processing: Explorations in the microstructure of cognition” (McClelland+
    1986), which provided an effective method for training multi-layer networks
    with intermediate point non-linearities, and also presented many impressive
    (conceptual) applications.
* in the 1990s the growth of statistical machine learning,
  * epitomized by Vapnik (1995), which promised better results from
  * mathematically more tractable methods. But then a
* third wave, which we’re still riding, was inspired by the development of
  better training methods for deep networks, represented by Hinton+ (2006), and
  enabled by the spread of powerful GPU-based linear algebra machines.

## 1.2 Connectionism, Associationism and Empiricism

* connections between deep nets (connectionism) and associationism in
  philosophy and psychology, going back to Locke and Hume:10
* [A]ssociationism … has also been closely aligned with a number of different:
  * empiricism, behaviorism, anti-representationalism.
* associationism has never really connected with mathematics. What’s different,
* LeCun: when hardware is too slow … software is not readily
  available—experiments are not reproducible because of lack of open
  source—people will find ways to dismiss good ideas.”11

## 1.3 Representation vs. End-To-End

* Minsky thought representation was the key to AI (Minsky, 1961; Minsky and
  Papert, 1969) and never warmed to neural nets.12
* critique of end-to-end systems
  * Tukey (1977) advocated an alternative which he called
    exploratory data analysis (EDA). EDA emphasizes a role for a
    * human in the loop
  * Chomsky (1959) objected to the use of black boxes in Skinner’s Behavorism.
* Mercer was an early advocate of end-to-end approaches (Church and Mercer,
  1993). This approach led to the famous quote,
  * “Every time I fire a linguist, the performance of our speech recognition
    system goes up.”13 The
  * IBM: “self-organizing systems” in papers on speech recognition (Jelinek,
    1990) and machine translation (Brown+ 1988). After leaving IBM, many of the
  * similar methods in hedge funds and politics (Zuckerman, 2019).  The
  * term “self-organizing” dates back to the 1950s (Von Foerster, 1959), if not
* representation
  * All of AI relies on representations. The question is where do those
    representations come from? So, uh, the classical way to build a pattern
* end-to-end approach is that it encourages young researchers to focus
  * too much on network architecture and training methods, and
  * not enough on insights from literature from a wide range of relevant
    disciplines, about both methodology and content).
* black boxes and glass boxes in software engineering (Boehm and Papaccio,
  1988)
  * In software engineering, though maybe not in machine learning, it is
    generally accepted that there should be plenty of room for
    both system testing (black boxes) as well as unit testing (glass boxes).
  * Standard benchmarks in computational linguistics such as papers with code15
    and GLUE16 (Wang+ 2018) tend to emphasize system testing, though
  * Ribeiro may be successful in advocating more use of unit testing
    (Ribeiro+ 2016; Ribeiro+ 2020)
* interpretability with tutorials on that subject at recent conferences such as
  NeurIPS-2020,17 EMNLP-2020 (Wallace+ 2020),18 and ACL-2020 (Belinkov+ 2020).

## 1.4 An Example of Representations: Semantic Nets

* words (and concepts) as nodes in a graph, with
  edges representing relations such as synonyms, antonyms and hypernyms 
  * many names for such graphs: knowledge graphs, semantic networks,
    ontologies, etc
  * represent lexical knowledge and/or world knowledge. Examples of semantic
  * eg WordNet19 (Miller+ 1990), CYC (Lenat, 1995), Freebase/Wikidata
    (Bollacker+ 2008). Many of these resources were
  * other languages.20 BabelNet 4.021 (Navigli and Ponzetto, 2012) supports 284
    languages. Many of these ontologies can be downloaded for free. All have
* ambitious projects 
  * CYC is particularly ambitious, perhaps too ambitious
  * WordNet is less ambitious; the scope of this project was constrained by the
  * Murray’s Oxford English Dictionary (Murray, 2001) and CYC, have a way of
  * WordNet (and Unix) succeeded, largely because “Less is more”
    (McMahon+ 1978)
* resources have been built with volunteer labor: 
  * Freebase, Wikipedia and Murray’s Oxford English Dictionary. If one wants to
  * it may not be feasible to pay a full-time staff to do the work by hand.
  * Universities can use student labor to reduce labor costs
  * gig economy offers opportunities to reduce labor costs even more (Zaidan
    and Callison-Burch, 2011), raising various ethical questions (Hara+ 2018).
* future, it may be possible that machine learning methods such as knowledge
  graph completion (KGC) could make it more feasible to construct linguistic
  resources such as WordNet, CYC and Freebase. KGC starts with 〈h,r,t〉
  * benchmarks such as WN18RR and FB15k-237 which are
    derived from WordNet and Freebase, respectively. There are 11 relations in
* static embeddings [Word2Vec (Mikolov+ 2013c), GloVe (Pennington+ 2014)] and
  contextual embeddings [BERT (Devlin+ 2018), ERNIE (Sun+ 2020), GPT (Brown+
  2020), ELMO (Peters+ 2018)].  Pre-trained embeddings can be downloaded
  * in many languages25 and many domains including medicine and twitter (Lee+
    2020; Nguyen+ 2020). In contrast to WordNet, CYC, Freebase, etc.,
* tall skinny matrices do not work well with modern GPUs. Embeddings are V×K
  * Large vocabularies (V≫30,000) are particularly challenging for deep nets.
* Subwords are based on BPE (byte pair encoding), which
  * borrows ideas from information theory to learn a dictionary of word pieces
  * One might be concerned that subwords (and BERT) may have been designed for
    languages like English with particular types of spelling systems,
    relatively fixed word order and Indo-European etymology. In fact,
  * pre-trained BERT-like models are available in many languages (see footnote
  * BERT-like models for Chinese, a commercially important language that is

# 2 Pros and CONS

## 2.1 Pros: Successes

## 2.2 Cons: Alchemy

# 3 Perspectives From Funding Agencies Around the World

## 3.1 DARPA’s ”AI Next” Campaign

## 3.2 Perspectives From Europe and Asia

# 4 Paths Forward

## 4.1 Paths Forward for Funding Agencies

## 4.2 Paths Forward for Managers in Industrial Research

## 4.3 Paths Forward for Senior Researchers

## 4.4 Paths Forward for Younger Researchers
