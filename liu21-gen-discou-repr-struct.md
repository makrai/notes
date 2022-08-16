Text Generation from Discourse Representation Structures 
Jiangming Liu, Shay B. Cohen, Mirella Lapata
NAACL 2021
 
code and datasets:
github.com/LeonCrashCode/Discourse-Representation-Tree-Structure/tree/main/gmb/DRS-to-text

# Abstract

* We propose neural models to generate text from formal meaning representations
  based on Discourse Representation Structures (DRSs)
* DRSs are document-level representations which encode rich semantic detail
  * rhetorical relations, presupposition, and co-reference within & across sent
* We formalize the task of neural DRS-to-text generation and provide
  * solutions for the problems of condition ordering and variable naming which
    render generation from DRSs non-trivial
  * Our generator relies on a novel sibling treeLSTM model which is able to
    accurately represent DRS structures and is more generally
    suited to trees with wide branches
* competitive performance (59.48 BLEU) on the GMB benchmark against several
  strong baselines.

# 1 Intro

* generate natural language output from intermediate semantic representations
  (Yao+ 2012; Takase+ 2016), from
  * logical forms underlying various grammar formalisms
    (Wang, 1980; Shieber+ 1990; Carroll and Oepen, 2005; White+ 2007)
  * typed lambda calculus (Lu and Ng, 2011)
  * Abstract Meaning Representations (AMR; Flanigan+ 2016; Konstas+ 2017;
    Song+ 2018; Beck+ 2018; Damonte and Cohen 2019; Ribeiro+ 2019; Zhu+ 2019;
    Cai and Lam 2020; Wang+ 2020)
  * Discourse Representation Theory (DRT; Basile and Bos 2011; Basile 2015)
  * and Minimal Recursion Semantics (MRS; Horvat+ 2015; Hajdik+ 2019).

* we propose neural models to generate high-quality text from semantic
  representations based on Discourse Representation Structures (DRSs)
* DRSs are the basic meaning-carrying units in Discourse Representation Theory
  (DRT; Kamp 1981; Kamp and Reyle 1993; Asher and Lascarides 2003),
* DRT is a formal semantic theory designed to handle a variety of ling phenom,
  * anaphora, presuppositions (Van der Sandt, 1992; Venhuizen+ 2018), and
    temporal expressions within and across sentences
  * scoped meaning representations, they capture the semantics of negation,
    modals, and quantification.

* Figure 1 displays in box format the meaning representation for a discourse
  consisting of two sentences. The outermost box is a segmented DRS expressing
  the rhetorical relation CONTRAST between box b 1 representing the first
  sentence and box b 4 representing the second sentence. Boxes b 1 and b 2 are
  DRSs, the top layers contain variables (eg x 1 , x 2 ) indicating discourse
  referents and the bottom layers contain conditions (eg Named(x 3 , “tom”))
  representing information about discourse referents. Variables and conditions
  have pointers (denoted by b in the figure) pointing to the boxes where they
  should be interpreted. 1 Predicates are disambiguated to their Wordnet
  (Fellbaum, 1998) senses (eg male.n.02 and play.v.03).

* anal vs gen
  * considerable activity recently in developing models which analyze text in
    the style of DRT (van Noord+ 2018, 2019; Liu+ 2019a, 2018; Fancellu+ 2019),
  * hE attempts to generate text from DRSs have been few and far between
    (however see Basile 2015 and Narayan and Gardent 2014)
  * two properties of DRS-based semantic representations render generation chal
    * DRS conditions are unordered representing a set (rather than a list). 
      * An exception are conditions in segmented DRSs whose order can be
        retrieved deterministically based on the arguments of rhetorical
        relations. For example, given the relation BECAUSE(b 1 , b 3 ), we can
        assume that box b 1 precedes b 3
      * A hypothetical generator would have to produce the same output text for
        any DRSs which convey the same meaning but appear different due to
        their conditions having a different order (see Figures 1 and 2a which)
  * variables and their prominent status in DRSs
    * Variables identify objects in discourse (such as entities and
      predicates), and are commonly used to model semantic phenomena including
      coreference, control constructions, and scope
    * In Figure 1, variables x, e, s, t, p, and b denote entities, events,
      states, time, propositions and boxes, respectively
    * Variable names themselves are arbitrary and meaningless posing a
      challenge for learning
    * generator must verbalize different variable names to the same surf form
    * The meaning representations in Figures 1 and 2b are identical and both
      correspond to the same discourse except that the variables have been
      given different names (b 5 in Figure 1 has been named b 1 in Figure 2b)

* These two problems are further compounded by the way DRSs are displayed, in a
  box-like format which is
  intuitive and easy to read but not convenient for modeling purposes. As a
  => DRSs are often post-processed in a format for modern neural network
  * eg DRS variables and conditions are converted to clauses (van Noord+ 2018)
    or DRSs are modified to trees where each box is a subtree and conditions
    within the box correspond to children of the subtree (Liu+ 2019a, 2018).

* we propose novel solutions to condition ordering and variable naming. We
  * even though DRS conditions appear unordered, they have a latent order due
    to biases in the way the training data is created. To give a concrete
  * eg the Groningen Meaning Bank (GMB; Bos+ 2017) provides the largest
    collection to date of English texts annotated with DRSs
    * annotations were generated with the aid of a CCG parser (Clark and
      Curran, 2007); atomic DRS conditions were associated with CCG supertags
      and then semantically combined following the syntactic CCG derivations.
  * Even annotators creating DRSs manually would be prone to follow a canonical
    order (eg listing named entities first, then verbal predicates and their
    thematic roles, and finally temporal conditions)
  * We propose a graph-based model which learns to recover the latent order of
    * handle variable names with a method which rewrites arbitrary indices to
      relative ones which are in turn determined by the order of conditions.

* Following previous work, we convert DRSs to a more amenable format.
  * Discourse Representation Tree Structures (DRTSs; Liu+ 2019b) as the
     semantic representation input to our document generation task, and
     generate a sequence of words autoregressively
  * encoder-decoder framework with a treeLSTM (Tai+ 2015) encoder and a
    standard LSTM (Hochreiter and Schmidhuber, 1997) decoder.
  * hE DRS trees are wide and the number of children for a given node can = 180
    => memory-consuming and sparse to assign a forget gate for each child as in
    the case of conventional (N-ary) treeLSTM (Tai+ 2015)
  * We propose a variant which we call Sibling treeLSTM that
    replaces N forget gates with a parent gate and a sibling gate. As a result,
    it reduces memory usage from O(N ) to O(2), and is more suitable for
* Our contributions can be summarized as follows: 
  * we formalize the task of neural DRS-to-text generation; 
  * solutions for the problems of condition ordering and variable naming, which
    render generation from DRS-based meaning representations non-trivial; and 
  * propose a novel sibling treeLSTM model that can be also generally used to
    model wide tree structures
