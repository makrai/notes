Discourse Coherence
from Daniel Jurafsky & James H. Martin: Speech and Language Processing ch22
Draft of December 30, 2020

* coherent groups of sentences: discourse, and we use the word coherence to
* local coherence and global coherence. Let’s consider
  * between adjacent or nearby sentences
  * three ways in which real discourses are locally coherent;
1. related to nearby sentences in systematic ways. Consider this example from
  * Hobbs (1979). John took a train from Paris to Istanbul. He likes spinach./He
    had to attend a conference
  * the second sentence gives a REASON for Jane’s action in the first sentence
  * coherence relations, introduced in Section 22.1
2. by virtue of being “about” someone or something
  * some entities are salient, and the discourse focuses on them
  * entity-based coherence
  *
g. incoherent: John wanted to buy a piano for his living room.  Jenny also
    wanted to buy a piano.  He went to the piano store.  It was nearby.  The
    living room was on the second floor.  She didn’t find anything she liked
    The piano he bought was hard to get up to that floor
  * Centering Theory (Grosz+ 1995), the most influential theory of entity-based
    * which entities in the discourse model are salient at any point
    * pronominalized or appear in prominent syntactic positions like subj/obj
  * entity grid model of coherence (Barzilay and Lapata, 2008)
    * introduced in Section 22.3
3. topically coherent: nearby sentences are generally
  * about the same topic and use similar vocabulary to discuss these topics
  * from a single semantic field or topic, they tend to exhibit the surface
  * lexical cohesion (Halliday and Hasan, 1976):
    * identical or semantically related words in nearby sentences.  For example,
* global coherence. Many
  * genres of text are associated with particular conventional discourse structs
  * Academic articles might have sections describing the Methodology or Results
  * Stories might follow conventional plotlines or motifs
  * Persuasive essays have a particular claim they are trying to argue for, and
    * a structured set of premises that support the argument and demolish count
* coherence detection plays a part in any task that requires
  * measuring the quality of a text. For example coherence can help in
    * essay grading or essay quality measurement that are trying to grade how
      (Somasundaran+ 2014, Feng+ 2014, Lai and Tetreault 2018). Coherence can
  * summarization; knowing the coherence relationship between sentences can help
    know how to select information from them. Finally,
  * mental health tasks like measuring symptoms of schizophrenia or other kinds
    * detecting incoherent text may even play a role
    * Ditman and Kuperberg 2010
      Ditman, T. and Kuperberg, G. R. (2010)
      Building coherence: A framework for exploring the breakdown of links
      across clause boundaries in schizophrenia
      Journal of neurolinguistics 23(3), 254–269
    * Elvevåg+ 2007
      Elvevåg, B., Foltz, P. W., Weinberger, D. R., and Goldberg, T. E. (2007)
      Quantifying incoherence in speech: an automated methodology and novel
      application to schizophrenia.  Schizophrenia research 93(1-3), 304–316
    * Bedi+ 2015
      Bedi, Carrillo, Cecchi, Slezak, Sigman, Mota, Ribeiro, ..., Corcoran
      Automated analysis of free speech predicts psychosis onset in high-risk
      youths. npj Schizophrenia 1
    * Iter+ 2018
      Iter, D., Yoon, J., and Jurafsky, D. (2018)
      Automatic detection of incoherent speech for diagnosing schizophrenia
      Fifth Workshop on Computational Linguistics and Clinical Psychology

## 22.1 Coherence Relations

* The next two sections describe two commonly used models of coherence relations
  and associated corpora

### Rhetorical Structure Theory (RST)

* Mann and Thompson, (1987). In RST
* relations between two spans of text, generally a nucleus and a satellite. The
  * nucleus is the unit that is more central to the writer’s purpose and that is
    interpretable independently; the satellite is less central and generally is
    only interpretable with respect to the nucleus
* Some symmetric relations, however, hold between two nuclei
* examples of RST coherence relations, with definitions adapted from the RST
  Treebank Manual (Carlson and Marcu, 2001)
  * Reason: The nucleus is an action carried out by an animate agent and the
    * [ NUC__Jane took a train from Paris to Istanbul._]
      [ SAT _She had to attend a conference._]
  * Elaboration: The satellite gives additional information or detail about the
    * [ NUC__Dorothy was from Kansas._]
      [ SAT _She lived in the midst of the great Kansas prairies._]
  * Evidence:
    * Elaboration, where the additional information is to convince the reader to
      accept the information presented in the nucleus
    * [ NUC__Kevin must be here._] `[` SAT _His car is parked outside._`]`
  * Attribution:
    * The satellite gives the source of attribution for an instance of reported
      speech in the nucleus
    * [ SAT _Analysts estimated_]
      [ NUC__that sales at U.S. stores declined in the quarter, too]
  * List:
    * In this multinuclear relation, a series of nuclei is given, without
      contrast or explicit comparison: (22.11)
    * [ NUC__Billy Bones was the mate;_ ]
      [ NUC__Long John, he was quartermaster_]
* represented graphically, with an arrow from the satellite to the nucleus:
* hierarchical structure between coherence relations. Figure 22.1 shows the
  * leaves in the Fig. 22.1 tree correspond to text spans of a sentence
  * elementary discourse units or EDUs in RST; these
  * also be referred to as discourse segments. Because these units may
  * determining the boundaries of an EDU_is an important task for extracting
  * we generally draw on parsing algorithms to infer discourse structure
    * as we’ll see in Section 22.2
* corpora for many discourse coherence models; the
  * RST Discourse TreeBank (Carlson+ 2001) is the largest available discourse
  * 385 English language documents selected from the Penn Treebank, with full
    RST parses for each one, using a large set of 78 distinct relations, grouped
    into 16 classes
  * RST treebanks exist also for Spanish, German, Basque, Dutch and Brazilian Pt
    (Braud+ 2017)
* in summarization or information extraction
  *
g. the nuclei of a text presumably express more important information than
    the satellites, which might be dropped in a summary

### Penn Discourse TreeBank (PDTB)

* another model of coherence relations (Miltsakaki+ 04, Prasad+ 08, Prasad+ 14)
  * lexically grounded. Instead of asking
  * annotators were given a list of discourse connectives, words that signal

g. _because, although, when, since_, or _as a result_. In a part of a text
    * where these words marked a coherence relation between two text spans, the
      connective and the spans were then annotated, as in Fig.  22.13, where the
    * causal relationship between what PDTB calls Arg1 (the first two sentences,
      here in italics) and Arg2 (the third sentence, here in bold).  (22.13)
  * also annotates pairs of neighboring sentences with no explicit signal, like
    * annotator first insterts the word or phrase that could have been its
      signal (in this case _as a result_), and then labels its sense
    * ambiguous discourse connective
g. _since_ are marked whether it is used
      in a CAUSAL or a TEMPORAL sense
* dataset contains roughly 18,000 explicit relations and 16,000 implicit
  * nothing above the span-pair level,
    no commitment with respect to higher-level discourse structure
* treebanks using similar methods for other languages; (22.15) shows an example
  * Chinese Discourse TreeBank (Zhou and Xue, 2015)
  * Chinese has a smaller percentage of explicit discourse connectives than
    English (only 22%, compared to 47% in English), annotators
  * labeled corpus by directly mapping pairs of sentences to 11 sense tags

## 22.2 Discourse Structure Parsing

### 22.2.1 EDU_segmentation for RST parsing

* RST parsing is generally done in two stages. The first stage,
  * EDU_segmentation, extracts the start and end of each EDU. The output of this
  * EDUs roughly correspond to clauses,
    * early models first ran a syntactic parser, and then post-processed
    * Modern systems generally use neural sequence models supervised by the gold
    * Wang+ (2018) and Muller+ (2019) use the biLSTM-CRF architecture we saw for
      named entity tagging and semantic role labeling.  Here the input sentence
    * 1 indicates the start of an EDU_(except at the start of sentence)

### 22.2.2 RST parsing

* have long been based on syntactic parsing algorithms like shift-reduce parsing
  (Marcu, 1999). Many
* modern RST parsers since Ji and Eisenstein (2014) draw on the neural syntactic
  parsers we saw in Chapter 14, using representation learning to build represen-
  tations for each span, and training a parser to choose the correct shift and
  reduce actions based on the gold parses in the training set
* We’ll describe the shift-reduce parser of Yu+ (2018). The parser
  * state consists of a stack and a queue, and produces this structure by taking
  * Actions include:
    * shift: pushes the first EDU_in the queue onto the stack creating a
      single-node subtree
    * reduce(l,d): merges the top two subtrees on the stack, where l is the
      coherence relation label, and d is the nuclearity direction, d ∈ {NN, NS,
      SN}.  As well as the pop root operation, to remove the final tree from the
      stack
* evaluated on the test section of the RST Discourse Treebank, either with
  gold EDUs or end-to-end, using the RST-Pareval metrics (Marcu, 2000b). It is
  standard to first transform the gold RST trees into right-branching binary
  * four metrics: trees with no labels (S for Span), labeled with nuclei (N),
    with relations (R), or both (F for Full), for each metric computing
    microaveraged F 1 over all spans from all documents (Marcu 00b, Morey+ 17)

### 22.2.3 PDTB discourse parsing

* sometimes called shallow discourse parsing because the task just involves flat
* four subtasks for PDTB discourse parsing was laid out by Lin+ (2014) in the
  * separate tasks for explicit (tasks 1-3) and implicit (task 4) connectives: 1.  2.  3.  4
    1. Find the discourse connectives (disambiguated from non-discourse uses)
    1. Find the two spans for each connective
    1. Label the relationship between these spans
    1. Assign a relation between every adjacent pair of sentences
* systems proposed for Task 4: taking a pair of adjacent sentences as input and
  assign a coherence relation sense label as output. The setup often follows
  Lin+ (2009) in assuming gold sentence span boundaries and assigning each
  adjacent span one of the 11 second-level PDTB tags or none (removing the 5
  very rare tags of the 16 shown in italics in Fig. 22.3)
  * A simple but very strong algorithm for Task 4 is to
    represent each of the two spans by BERT embeddings and
    take the last layer hidden state corresponding to the position of the [CLS]
    pass this through a single layer tanh feedforward network and then a softmax
    for sense classification (Nie+ 2019)
* Task 1 is to disambiguating discourse connectives from their non-discourse
  *
g. as Pitler and Nenkova (2009) point out, the word _and_ is a
    * discourse connective linking the two clauses by an elaboration/expansion
    * non-discourse NP conjunction in (22.25): (22.24) Selling picked up as
  * _once_ is a
    * discourse connective indicating a temporal relation in (22.26), but simply
    * a non-discourse adverb meaning ‘formerly’ and modifying used in (22.27):
  * a special case of word sense disambiguation
    * Early work on disambiguation showed that the 4 PDTB high-level sense
      classes could be disambiguated with high (94%) accuracy used syntactic
      features from gold parse trees (Pitler and Nenkova, 2009)
    * Recent work performs the task end-to-end from word inputs using a
      biLSTM-CRF with BIO outputs ( B CONN, I CONN, O, Yu+ 2019)
* task 2, PDTB spans can be identified with the same sequence models used to
  find RST EDUs: a biLSTM sequence model with pretrained contextual embedding
  (BERT) inputs (Muller+ 2019). Simple heuristics also do pretty well as a base-
  line at finding spans, since 93% of relations are either completely within a
  single sentence or span two adjacent sentences, with one argument in each
  sentence (Biran and McKeown, 2015)

## 22.3 Centering and Entity-Based Coherence

* idea of entity-based coherence appears early in functional linguistics and
  the psychology of discourse (Chafe 1976, Kintsch and Van Dijk 1978), and soon
* In this section we introduce two models of this kind of entity-based coherence
  * Centering Theory (Grosz+ 1995), and
  * the entity grid model of Barzilay and Lapata (2008)

### 22.3.1 Centering Theory

* a theory of both discourse salience and discourse coherence. As a model of
  * salience: at any given point in the discourse one of the entities in the
    discourse model is salient: it is being “centered” on. As a model of
  * coherence: discourses in which adjacent sentences CONTINUE to maintain the
    same salient entity are more coherent than those which SHIFT back and forth
* e.g. two texts from Grosz+ (1995) which have the same propositional content
  * John went to his favorite music store to buy a piano
    He had frequented the store for many years
    He was excited that he could finally buy a piano
    He arrived just as the store was closing for the day
  * John went to his favorite music store to buy a piano
    It was a store John had frequented for many years
    He was excited that he could finally buy a piano
    It was closing just as John arrived
* two representations for each utterance U_n
  * backward-looking center of U_n, represents the current salient entity, the
    one being focused on in the discourse after U_n is interpreted
    * denoted as C_b (U_n )
  * forward-looking centers of U_n, are a set of potential future salient
    entities, the discourse entities evoked by U_n any of which could serve as
    C_b of the following utterance
    * denoted as C_f (U_n )
* forward-looking centers C_f (U_n ) are ranked according to factors like
  discourse salience and grammatical role (e.g. subjects > objects > all other)
  * preferred center: the highest-ranked forward-looking center C_p
  * a kind of prediction about what entity will be talked about next
* algorithm for centering presented in Brennan+ (1987), which defines
  * four intersentential relationships between a pair of utterances U_n and
    U_n+1 that depend on the relationship between C_b (U_n+1 ), C_b (U_n ), and
    C_p (U_n+1 ); these are shown in Fig. 22.7
* rules used by the algorithm:
  * Rule 1: If any element of C_f (U_n ) is realized by a pronoun in utterance
    U_n+1, then C_b (U_n+1 ) must be realized there as a pronoun also
  * Rule 2: Continue > Retain > Smooth-Shift > Rough-Shift
* The transition table is based on two factors:
  whether the backward-looking center C_b is the same from U_n to U_n+1 and
  whether this discourse entity is the one that was preferred (C_p ) from U_n
  * If both of these hold, a CONTINUE relation, the speaker has been talking
    about the same entity and is going to continue talking about that entity. In
  * RETAIN: the speaker intends to SHIFT to a new entity in a future utterance
    and meanwhile places the current entity in a lower rank C_f . In a
  * SHIFT relation, the speaker is shifting to a new salient entity

### 22.3.2 Entity Grid model

* The entity grid model of Barzilay and Lapata (2008) is an alternative way to
  * using machine learning to induce the patterns of entity mentioning that make
    a discourse more coherent
* entity grid, a two-dimensional array that represents the distribution of
  entity mentions across sentences. The
  * rows represent sentences, and the columns represent discourse entities
    (most versions of the entity grid model focus just on nominal mentions)
  * values represent whether the entity appears and its grammatical role
    * subject ( S), object ( O ), neither ( X ), or absent (–); in the
      implementation of Barzilay and Lapata (2008),
    * subjects of passives are represented with O , leading to a representation
      with some of the characteristics Table 1 of thematic roles
    * ject in sentence 1 (it also appears as the object of the preposition
      against, but entities that appear multiple times are recorded with
      highest-ranked grammatical function
* patterns local entity transition
* The transition probabilities then used as features for a machine learning
  * text classifier trained to produce coherence scores (for example from humans
  * such data is expensive to gather
  * Barzilay and Lapata (2005) introduced a simplifying innovation: coherence
  * self-supervision: trained to distinguish the natural original order of
    sentences in a discourse from a modified order (such as a randomized order)
    We turn to these evaluations in the next section

### 22.3.3 Evaluating Neural and Entity-based coherence

* coherence models are generally evaluated in one of two ways
  * have humans rate the coherence of a document and train a classifier to
  * categorial (high/low, or high/mid/low) or continuous. This is
  * the best evaluation to use if we have some end task in mind, like essay
    grading, where human raters are the correct definition of the final label
  * self-supervision: pair up a natural discourse with a pseudo-document created
    by changing the ordering. Since
    * naturally-ordered discourses are more coherent than random permutation
      (Lin+ 2011), a successful coherence
      algorithm should prefer the original ordering
* Self-supervision has been implemented in 3 ways. In the
  * sentence order discrimination task (Barzilay and Lapata, 2005), we
    compare a document to a random permutation of its sentence. A
    model should rank the original document higher. Given k documents, we can
  * sentence insertion task (Chen+ 2007) we take a document,
    remove one of the n sentences s, and
    create n − 1 copies of the document with s inserted into each position. The
    * harder than discrimination since we are comparing documents that differ by
      only one sentence
  * sentence order reconstruction task (Lapata, 2003), we take a document,
    randomize the sentences, and train the model to put them back in the correct
    * much harder task than simple classification

## 22.4 Representation learning models for local coherence

* topical or semantic field coherence. Discourses cohere by talking about the
* pioneered by a series of unsupervised models in the 1990s of this kind of
  * made use of lexical cohesion (Halliday and Hasan, 1976): the sharing of
    * identical or semantically related words in nearby sentences
  * Morris and Hirst (1991) computed lexical chains of words (like
    * e.g. pine, bush trees, trunk) that occurred through a discourse and
      that were related in Roget’s Thesaurus (by being in the same category, or
      linked categories).  They showed that
    * the number and density of chain correlated with the topic structure. The
  * TextTiling algorithm of Hearst (1997) computed the cosine between
    neighboring text spans, again showing that sentences or paragraph in a
    subtopic have higher cosine with each other, but not with sentences in a
  * LSA Coherence method of Foltz+ (1998) was the first to use embeddings,
    modeling the coherence between two sentences as the cosine between their
    LSA sentence embedding vectors, computing embeddings for a
    * sentence s by summing the embeddings of its words
    * overall coherence of a text as the average similarity over all pairs of
      adjacent sentences s i and s i+1
* beginning with Li+ (2014),
  * draw on the intuitions of
    * these early unsupervised models for learning
      * measuring how sentence representations they change between neighboring ss
    * also on the idea pioneered by Barzilay and Lapata (2005) of self-supervis
      * trained to distinguish natural discourses from unnatural discourses
* Here we present the local coherence discriminator (LCD, Xu+ 2019). Like early
  * coherence of a text as the average of coherence scores between consecutive
    pairs of sentences. But unlike the early unsupervised models, LCD is a
  * self-supervised model trained to discriminate consecutive sentence pairs (s
    * negative  partner uniformly sampled from the same document as s
  * margin loss max(0, \eta p + n) where η is the margin hyperparameter
* Xu+ (2019) also give a useful baseline algorithm that itself has quite high
  performance in measuring perplexity
  * train an RNN language model on the data, and compute the log likelihood of
    sentence s i given/without the preceding context
  * The difference between these values tells us how much the preceding context
    improved the predictability of s i , a predictability measure of coherence
* models to predict longer contexts than just consecutive pairs of sentences can
  result in even stronger discourse representations. For example a Transformer
  trained with a contrastive sentence objective to predict text a distance of ±2
  sentences improves performance on various discourse coherence

## 22.5 Global Coherence

* narrative structure of stories is one of the oldest kinds of global coherence
  * Propp (1968) models the discourse structure of Russian folktales via a kind
    of plot grammar. His model includes a set of
    * character categories he called dramatis personae,
      like Hero, Villain, Donor, or Helper, and a set of
    * events he called functions
      eg “Villain commits kidnapping”, “Donor tests Hero”, or “Hero is pursued”
      * have to occur in particular order, along with other components.  Propp
    * different tales choosing different subsets of functions, but always in the
      same order.  Indeed
  * Lakoff (1972) showed that Propp’s model amounted to a discourse grammar of
  * computational work Finlayson (2016) demonstrates that some of these Proppian
    functions could be induced from corpora of folktale texts by detecting
    events that have similar actions across stories
  * Bamman+ (2013) showed that generalizations over dramatis personae could be
    induced from movie plot summaries on Wikipedia. Their model
    * induced latent personae from features like the
      * actions the character takes (e.g., Villains strangle), the
      * actions done to them (e.g., Villains are foiled and arrested) or the
      * descriptive words used of them (Villains are evil)
* In this section we introduce two kinds of such global discourse structure that
  have been widely studied computationally. The first is the
  * structure of arguments: the way people attempt to convince each other in
    persuasive essays by offering claims and supporting premises. The second is
  * structure of scientific papers, and the way authors present their goals,
    results, and relationship to prior work

### 22.5.1 Argumentation Structure

* argumentation mining
* The study of arguments dates back to Aristotle, who in his Rhetorics described
  * three components of a good argument:
    * pathos (appealing to the emotions of the listener),
    * ethos (appealing to the speaker’s personal character), and
    * logos (the logical structure of the argument)
* Most of the discourse structure studies of argumentation have focused on logos
  * annotated datasets of persuasive essays or other arguments
    (Reed+ 2008, Stab and Gurevych 2014a, Peldszus and Stede 2016, Habernal and
    Gurevych 2017, Musi+ 2018).  Such corpora, for example, often include
  * annotations of argumentative components like
    * claims (the central component of the argument that is controversial and
      needs support) and
    * premises (the reasons given by the author to persuade the reader by
      supporting or attacking the claim or other premises), as well as the
    * argumentative relations between them like SUPPORT and ATTACK 
* arguments tend to be much less local;
  than rhetorical structure and other kinds of coherence relations,
  * often a persuasive essay will have only a single main claim, with
    premises spread throughout the text,
    without the local coherence we see in coherence relations
* Algorithms for detecting argumentation structure often include
  * classifiers for distinguishing claims, premises, or non-argumentation,
  * relation classifiers for deciding if two spans have the SUPPORT , ATTACK ,
    or neither relation (Peldszus and Stede, 2013). While these are the main
  * richer semantic relationships (Park and Cardie 2014, Hidey+ 2017) such as
    * preliminary efforts on annotating and detecting
    * argumentation schemes, larger-scale structures for argument like
      argument from example, or argument from cause to effect, or argument from
      consequences (Feng and Hirst, 2011)
* success or persuasiveness of an argument
  (Habernal and Gurevych 2016, Tan+ 2016, Hidey+ 2017). Indeed,
  * while it is Aristotle’s logos that is most related to discourse structure,
  * ethos and pathos techniques are particularly relevant
  * linguistic realization of features studied by social scientists like
    * reciprocity (people return favors),
    * social proof (people follow others’ choices),
    * authority (people are influenced by those with power), and
    * scarcity (people value things that are scarce),
  * all of which can be brought up in a persuasive argument (Cialdini, 1984)
  * Rosenthal and McKeown (2017) showed that
    * these features could be combined with argumentation structure to predict
      who influences whom on social media,
  * Althoff+ (2014): linguistic models of reciprocity and authority predicted
    success in online requests, while the
  * semisupervised model of Yang+ (2019) detected mentions of scarcity,
    commitment, and social identity to predict the success of peer-to-peer
    lending platforms
* See Stede and Schneider (2018) for a comprehensive survey of argument mining

### 22.5.2 The structure of scientific discourse

* annotation scheme for modeling these rhetorical goals is the
  argumentative zoning model of Teufel+ (1999) and Teufel+ (2009), which is
  * idea: each scientific paper tries to make a knowledge claim about a new
    piece of knowledge being added to the repository of the field (Myers, 1992)
    Sentences in a scientific paper can be assigned one of 15 tags; Fig. 22.13
    shows 7 (shortened) examples of labeled sentences
* Teufel+ (1999) and Teufel+ (2009) develop labeled corpora of scientific
  articles from computational linguistics and chemistry, which can be used as
  supervision for training standard sentence-classification architecture to
  assign the 15 labels

# Bibliographical and Historical Notes

* Coherence relations arose from the independent development of many scholars,
  * Hobbs (1979) idea that coherence relations play an inferential role for the
  * Mann and Thompson (1987) of the discourse structure of large texts. Other
  * Segmented Discourse Representation Theory
    (Asher and Lascarides 2003, Baldridge+ 2007) and
    the Linguistic Discourse Model
    (Polanyi 1988, Scha and Polanyi 1988, Polanyi+ 2004)
  * Wolf and Gibson (2005), coherence structure includes crossed bracketings,
    which make it impossible to represent as a tree, and propose a graph
    representation instead
  * A compendium of over 350 relations that have been proposed in the literature
    can be found in Hovy (1990)
* RST parsing was first proposed by Marcu (1997), and
  * early work was rule-based, focused on discourse markers (Marcu, 2000a). The
  * RST Discourse TreeBank (Carlson+ 2001, Carlson and Marcu 2001) enabled
    a wide variety of machine learning algorithms,
    * beginning with the shift-reduce parser of Marcu (1999) that used decision
      trees to choose actions, and
    * parsing methods (Soricut and Marcu 2003, Sagae 2009, Hernault+ 2010, Feng
      and Hirst 2014, Surdeanu+ 2015, Joty+ 2015) and
    * chunkers (Sporleder and Lapata, 2005)
  * Subba and Di Eugenio (2009) integrated sophisticated semantic information
  * Ji and Eisenstein (2014) first applied neural models to RST parsing neural
  * neural RST models (Li+ 2014, Li+ 2016, Braud+ 2017, Yu+ 2018, inter alia) as
  * neural segmenters (Wang+ 2018). and
  * neural PDTB parsing models (Ji and Eisenstein 2015, Qin+ 2016, Qin+ 2017)
* Barzilay and Lapata (2005) pioneered the idea of self-supervision for coherenc
  * Li+ (2014) first applied this paradigm to neural sentence-representation,
  * many neural self-supervised models followed (Li and Jurafsky 2017,
    Logeswaran+ 2018, Lai and Tetreault 2018, Xu+ 2019, Iter+ 2020)
* global topic structure of a text, the way the topics shift over the document
  * Barzilay and Lee (2004) introduced an HMM model for capturing topics for
  * later work expanded this intuition
    (Soricut and Marcu 06, Elsner+ 07, Louis and Nenkova 12, Li and Jurafsky 17)
* explicit and implicit discourse connectives has been a fruitful one for
  Marcu and Echihabi (2002), use sentences with explicit relations to help
  provide training data for implicit relations, by removing the explicit
  relations and trying to re-predict them as a way of improving performance on
  * idea was refined by Sporleder and Lascarides (2005), Pitler+ (2009), and
    Rutherford and Xue (2015). This relationship can
  * also be used as a way to create discourse-aware representations.  The
  * DisSent algorithm (Nie+ 2019), predicting explicit discourse markers
    * representations learned to be good at this task also function as powerful
      sentence representations for other discourse tasks
* entity-based coherence arose in multiple fields in the mid-1970s, in
  * functional linguistics (Chafe, 1976), in the
  * psychology of discourse processing (Kintsch and Van Dijk, 1978), and in the
  * Grosz, Sidner, Joshi, and their colleagues
  * Grosz (1977) addressed the focus of attention that conversational
    participants maintain as the discourse unfolds. She defined
    * two levels of focus;
      * entities relevant to the entire discourse were said to be in global foc
      * entities that are locally in focus (in a particular utterance) were said
        to be in immediate focus
  * Sidner (1979, 1983) described a method for tracking (immediate) discourse
    foci and their use in resolving pronouns and demonstrative noun phrases. She
  * distinction between the current discourse focus and potential foci, which
    * predecessors to the backwardand forward-looking centers of Centering
    * name and further roots of the centering approach
* Grosz+ (1983) integrated this work with the prior work of Sidner and Grosz
* a manuscript on centering which, while widely circulated since 1986, remained
  unpublished until Grosz+ (1995). A collection of centering papers appears in
  Walker+ (1998). See Karamanis+ (2004) and Poesio+ (2004) for a deeper
  exploration of centering and its parameterizations, and the History section of
  Chapter 22 for more on the use of centering on coreference
* grid model of entity-based coherence was
  * first proposed by Barzilay and Lapata (2005) drawing on
  * earlier work by Lapata (2003) and Barzilay, and then
  * extended by them Barzilay and Lapata (2008) and others with additional
    features (Elsner and Charniak 2008, 2011, Feng+ 2014, Lin+ 2011)
    * a model that projects entities into a global graph for the discourse
      (Guinaudeau and Strube 2013, Mesgar and Strube 2016), and
    * a convolutional model to capture longer-range entity dependencies
      (Nguyen and Joty, 2017)
* interpreting discourse-level linguistic phenomena, including
  * verb phrase ellipsis and gapping (Asher 1993, Kehler 1993), and
  * tense interpretation (Lascarides and Asher 1993, Kehler 1994, Kehler 2000)
  * relationship between coherence relations and discourse connectives
    (Knott and Dale 1994)
* Useful surveys of discourse processing and structure include Stede (2011) and
  Webber+ (2012)
* Andy Kehler wrote the Discourse chapter for the 2000 first edition of this
  textbook, which we used as the starting point for the second-edition
  chapter, and there are some remnants of Andy’s lovely prose still in this
  third-edition coherence chapter
