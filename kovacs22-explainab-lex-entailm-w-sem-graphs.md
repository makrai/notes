Explainable lexical entailment with semantic graphs
Adam Kovacs, Kinga Gemes, Andras Kornai, and Gabor Recski
Natural Language Engineering (2022), 1–24 doi:10.1017/S1351324922000092

# 2. Related work

## 2.1 formulations of the lexical entailment task and corresponding datasets,
with special emphasis on the two datasets used in our work

* Entailment between pairs of words has been studied extensively as
  * one of the fundamental relationships in the lexicon and as
  * an essential building block of models of natural language inference
  * Several recent task formulations
    equate lexical entailment with hypernymy/hyponymy or the IS_A relationship
    (Vulić+ 2017; Vulić, Ponzetto, and Glavaš 2019)
    * a relationship between two entries in a lexicon
    * datasets of labeled pairs of words such as Hyperlex (Vulić+ 2017)
  * in their respective contexts
    * eg _eliminate_ entails _treat_ in _Aspirin eliminates headaches_ but
      not in _Aspirin eliminates patients_
    * Levy and Dagan (2016) introduce a dataset of annotated relation pairs
      * question–answer pairs as context for lexical entailment,
    * other approaches involve providing context as
      * pairs of arguments (Zeichner, Berant, and Dagan 2012) or
      * pairs of argument types
        (Berant, Dagan, and Goldberger 2011; Schmitt and Schütze 2019)
  * as a special case of natural language inference (NLI)
    * Stanford Natural Language Inference (SNLI, Bowman+ 2015) dataset and the
    * Multi-Genre NLI Corpus (MultiNLI, Williams, Nangia, and Bowman 2018)
* we,
  * based on the 4lang formalism for representing (lexical) semantics
    * outlined in Section 3.2
    * capable of inspecting the relationship between the meaning of any two
      utterance fragments
  * evaluate our system on two recent benchmarks
    * 2020 Semeval task “Predicting Multilingual and Cross-lingual (graded)
      Lexical Entailment’’ (Glavaš+ 2020)
      * derived from HyperLex (Vulić+ 2017), a dataset of monolingual and
        cross-lingual–graded lexical entailment
      * Candidate word pairs for human annotation were gathered from 
        USF (Nelson, McEvoy, and Schreiber 2004) and WordNet (Miller 1995)
      * we will use the binary labels of the monolingual subsets for English,
        German, and Italian
      * Some examples for each language are shown in Table 1
      * we will compare our method to
        * GLEN system for measuring multilingual and cross-lingual lex entailmn
          using specialized word embeddings (Vulić+ 2019), which
          outperforms previous baselines in Upadhyay+ (2018)
        * other systems participating in the shared task
          * including our own earlier system presented in Kovács+ (2020)
    * A more challenging task formulation is provided by
      SherLlic dataset of lexical inference in context (Schmitt & Schütze 2019)
      * built by extracting inference candidates from an entity-linked portion
        of the ClueWeb corpus (Gabrilovich, Ringgaard, and Subramanya 2013) and
        using them as input to human annotation
        * many entailment pairs in the final dataset are completely novel,
          missing from existing knowledge bases such as WordNet
        * Because annotation candidates were chosen based on distribution
      * Argument types for event pairs are necessary to disambiguate words
        eg whether _run_ entails _lead_
        * yes if its arguments are of type PERSON and COMPANY (Bezos runs Amaz)
          not if they are COMPUTER and SOFTWARE (my mac runs macOS)
        * Table 2 shows further examples of entries in the SherLlic dataset
      * extensive evaluation of various LE systems on this dataset presented in
        Schmitt and Schütze (2019) will serve as the starting point for our
        evaluations in Section 4
* need for novel datasets
  * biases of deep learning based models of NLI
  * a new NLI test set from SNLI (Glockner, Shwartz, and Goldberg 2018)
    constructed by replacing a single word in sentences from the training set,
    * expose top NLI systems’ inability to perform true lexical inference
    * The only model in their evaluation not showing a major performance drop
      was the one incorporating lexical knowledge (Chen+ 2018)
  * inability of deep learning based NLI models to generalize across datasets
    * study across 6 systems and 3 datasets (Talman and Chatzikyriakidis 2019)
    * call into question whether black box models trained on any single NLI
      benchmark can be regarded as true models of inference
    * rule-based models such as the one proposed in this paper can
      * facilitate further qualitative analysis of deep learning models by
      * strong explainable baselines on multiple tasks and datasets

## 2.2 recent approaches to entailment and inference tasks

* hypernymy, lexical entailment is most often addressed using distributional
  * Hypernymy candidates are encoded using word embeddings and classified by
    * neural networks (Nguyen+ 2017; Shwartz, Goldberg, & Dagan 2016; Yu+ 2015)
    * Support Vector Machines (SVMs) and
      logistic regression (Baroni+ 12; Levy+ 15; Roller, Erk, & Boleda 14)
    * a neural model for supervised learning of hypernymy-specific embeddings
      Yu+ (2015)
    * standard distributional models cannot account for the asymmetric property
      * Nguyen+ (2017)
        * HyperVec, a hierarchical approach to learning hypernymy embeddings
          that allowed for significant improvement over the SOTA on HyperLex
      * Glavaš and Ponzetto (2017) proposes Dual Tensor
        * approach based on neural models to
          explicitly model the asymmetric nature of the hypernymy relation
        * transforms generic embeddings into specialized vectors for scoring
          concept pairs based on whether the asymmetric relation holds
    * HypeNET (Shwartz+ 2016)
      * extracting paths between premise and hypothesis from dependency trees
        and using them as inputs to Long Short-term Memory Networks (LSTMs)
    * Fine-tuning generic word vectors using external knowledge such as WordNet
      * improved performance on a range of NLU tasks (Glavaš and Vulić 2018).
      * POSTLE (Kamath+ 2019) extend this method to unseen words,  introduced
        * post-specialization for LE), a model that learns an explicit global
          specialization function captured with feed forward neural networks
* Inference systems trained on the SNLI and MultiNLI datasets
  mostly use neural language models based on the Transformer, in particul BERT 
  * SemBERT (Zhang+ 2020): a BERT backbone enhanced with a SRL-er
  * MT-DNN (Liu+ 2019) enhances the system presented in Liu+ (2015) with BERT
  * Top results on the MultiNLI benchmark were achieved by
    optimized, pretrained, and finetuned versions of BERT, RoBERTa (Zhuang+
    2021), and ALBERT (Lan+ 2020)
  * combining rule-based models in NLI with deep LMs (BERT, ALBERT, RoBERTa)
    has recently also led to competitive results
    (Haruta, Mineshima, and Bekki 2020; Kalouli, Crouch, and de Paiva 2020)
  * we will also present an improvement over such a model using our fully
    rule-based method for detecting entailment between pairs of words

## 2.3 common approaches to semantic parsing

* Semantic parsing: mapping natural language text to some model of its meaning
  * can only be defined with respect to a particular system of semantic repr
* to lexical databases
  * graph of synonym sets in WordNet (Miller 1995),
  * semantic role inventory in VerbNet (Kipper+ 2008), or
  * ontology of semantic frames in FrameNet (Ruppenhofer+ 2006)
* Abstract meaning representations (AMR, Banarescu+ 2013), one of the most wide
  * based on the PropBank database (Palmer, Gildea, and Kingsbury 2005)
  * handles a range of phenomena in the semantics of English
  * no treatment of word meaning
  * not intended as a universal representation of natural language semantics,
    * despite some early efforts in Xue+ (2014) and the release of a
    * Chinese AMR bank (Li+ 2016)
  * Automatic construction of AMR graphs from text is usually performed using
    deep neural models (Konstas+ 2017; Lyu and Titov 2018; Zhang+ 2019) trained
    on AMR banks
* A language-agnostic approach to meaning representation is taken by
  Universal Conceptual Cognitive Annotation (UCCA, Abend and Rappoport 2013),
  * abstracts away from syntax by
    representing words of a sentence as leaf nodes of DAGs representing scenes
    evoked by predicates
  * top-performing parsers for UCCA all employ neural networks trained on
    manually annotated sentences
    (Hershcovich, Abend, & Rappoport 17, 18; Ozaki+ 20; Samuel & Straka 20)
* these formalisms often dependent on
  * large manually built databases, existing parsing systems also rely on
    large datasets of hand-crafted representations (sembanks) for training
  * Transferring such systems across domains and languages therefore requires
    a considerable amount of expert human labor
  * we will use a meaning representation formalism designed to enable robust
    rule-based parsing and relying only on language-agnostic resources
    * this sec: overview only; our extensions and modifications in Section 3
* 4lang is a theory and formalism for representing the semantics of nat lang,
  * developed in Kornai (2012, 2019), Kornai+ (2015), and
  * partially implemented in Recski (2016, 2018)
  * az első implementációs cikk Nemeskey+ 2013 spreading
  * 4lang concept graphs represent meaning as
    directed graphs of language-independent concepts
    * Edges connecting concepts have one of three labels
      * Predicates are connected to their arguments via edges labeled 1 and 2,
      * 0-edges represent all relationships involving inheritance, including
        * hypernymy (dog → mammal) but also 0 0
        * attribution (dog → four-legged), and
        * unary predication (dog → bark)
        * This implies a broad definition of lexical entailment:
          unless explicitly overridden,
          dog entails not only mammal, but also bark and four-legged
    * In its current implementations, 4lang
      concepts have no grammatical attributes and no event structure, 
      * eg, the phrases _water freezes_ and _frozen water_ would both be
        represented as water → freeze
    * Figure 2 shows the 4lang definition of the concept _jewel_
      * obtained by processing the dependency parse of the Wiktionary def 
    * the 4lang system allows us to expand graphs, a process which
      * unifies one graph with the definition graphs of the concepts in it
  * can be built automatically from Universal Dependencies (Nivre+ 2018) using
    the rule-based dep_to_4lang module, which
    * we extend to improve performance across languages
      * Section 3 will describe these changes, as well as our
    * reimplementation of the parsing algorithm
      using Interpreted Regular Tree Grammars (IRTGs, Koller 2015)
      * in the present work this method is used to
        map natural language definitions to concept graphs representing the
        meaning of individual words,
        the system is capable of processing any UD graph and can be used to
        construct the 4lang semantic representation of any text

## 2.4 approaches to modeling entailment with semantic graphs

* Kovács+ (2020)
  * direct applicability of semantic graphs to hypernymy detection task by
  * a competitive system at the Semeval entailment task (Glavaš+ 2020)
  * we defined entailment to hold between a premise and a hypothesis
    if and only if in the twice-expanded definition graph of the premise
    there is a directed path of 0-edges from the premise word to the hypothesis
    (the maximum number of expansions was chosen arbitrarily)
    * not flow through locative and negative modifier clauses
      * preps (eg English _in, of, on_, German _in, auf_, Italian _di, su, il_)
      * words conveying negation (English _not_, German _keine_, etc.)
    * For example, where _nose_ is defined as “a protuberance on the face’’,
      4lang graphs would contain a path of 0-edges from nose to face
* On the Semeval dataset of word-level entailment, the above method detected
  * only about one-third of all true entailments in the dev dataset but
  * nearly perfect precision
  * On well-resourced languages such as English, WordNet was shown to be a very
    strong baseline both in terms of precision and recall, and
    * the main contribution of 4lang was its ability to increase recall without
      hurting precision,
      * increasing the performance of strong WordNet-based baselines on three
        languages, 
  * ranking first in English and Italian and second-best on German, see Table 3
* For English and Italian official WordNet releases were accessed via the nltk
* Kovács+ (2020) for German
  * no access to a high-coverage WordNet release
  * word pairs were therefore translated from German to English using the
    wikt2dict system (Ács, Pajkossy, and Kornai 2013)
  * In Section 4, when evaluating the methods presented in this article and
    comparing them to previous methods, we include a variant of this system
    using a recent German WordNet release, GermaNet
    (Hamp and Feldweg 1997; Henrich and Hinrichs 2010)

# 3 our pipeline

* building 4lang semantic graphs from Wiktionary entries
* obtaining additional synonyms both from Wiktionary and WordNet
* using graph grammars to transform dependency trees to 4lang graphs
* our method for establishing entailment over pairs of 4lang graphs

## 3.1 Semantic parsing with Interpreted Regular Tree Grammars 7

* Interpreted Regular Tree Grammars (IRTGs, Koller 2015) can be used to
  * encode the correspondence between sets of structures
  * used to perform
    * syntactic parsing (Koller and Kuhlmann 2012),
    * generation (Koller and Engonopoulos 2017),
    * semantic parsing (Groschwitz, Koller, & Teichmann 2015; Groschwitz+ 2018)
    * surface realization (Kovács+ 2019; Recski+ 2020). The system presented in
    * we use an IRTG for transforming UD trees into 4lang graphs
* Parsing UD graphs and transforming them into 4lang graphs on a large scale 8
  * all UD relations representing modification (amod, advmod, nummod) are
    mapped to 0-edges, while
  * relations between predicates and their objects (obj, nsubj:pass) become 2s
  * Subjects relations (nsubj, csubj) are mapped to a pair of 0and 1-edges;
  * Clausal modifiers (acl, advcl) are generally also mapped to 0-edges,
    * some newly introduced exceptions will be discussed below. Additionally,
  * non-core (oblique) arguments marked by the obl relation.
    * eg Wiktionary def of teacher: someone who teaches, especially in a school
    * The obl UD edge teach → school does not in itself reveal the semantics
    * we take into account the case relation marking case the argument:
    * the full UD analysis contains the subgraph teach -obl→ school -case→ in,
    * 4lang graph teach ←  in  → school using an IRTG rule 
    * an English-specific exception to this rule: 
      * _by_ will trigger the configuration for the predicate–subject relation,
  * coordination
    * Section 3.4.1 of Recski (2018) simply copied all semantic relations between
      all elements of coordinating constructions, which has proved
    * practical for downstream applications despite
    * hE introducing some erroneous edges. Our system replicates this behavior
    * Some simple patterns over specific conjunctions (and, or, etc.) could be
      used to differentiate between occurrences of the conj dependency, similar
      to Enhanced Universal Dependencies (Schuster and Manning 2016)
    * hE modeling the semantics of coordinating conjunctions would require
      considerable language-specific effort
      (Gerdes and Kahane 2015; Kanayama+ 2018)
* relationships between clauses
  * the most significant limitation of the original system
  * This is partly due to the fact that 
    the type of the UD relation connecting the heads of two clauses often
    reveals very little about the semantic function of the dependent clause.
  * acl is defined i as clausal modifier of noun (adjectival clause), and
    * the general case can be handled by 0-edges, but this rule will currently
    * erroneous edges for sentences such as I have a parakeet named Cookie,
      * no mechanism to detect that parakeet is the object of named.
  * acl:relcl (relative clause modifier of a noun), which is
    * used both in _an animal that moves_ and the _man you love_
      * these would warrant the edges animal → move and man ← love, resp
      * The first of these two examples can receive the correct treatment based
        on the presence of the nsubj edge between move and that, thus we
        introduce a rule that implements the correspondence in Figure 7
      * Other occurrences of acl:relcl are currently not processed
* For the full mapping between UD and 4lang structures see Table 4.
* error analysis in Section 5
* currently implemented for three languages: English, German, and Italian.
  * requires the existence of an accurate UD parser and
    a machine-readable monolingual dictionary of sufficient coverage.
  * for some languages it might be necessary to extend the dep_to_4lang mapping
    * morphological features, as done in Recski, Borbély, and Bolevácz (2016).
  * We apply this pipeline to dictionary definitions extracted from data dumps
    of Wiktionary

## 3.2 detecting entailment between pairs of words or predicates using their
corresponding 4lang graphs

* this method improves performance even for languages with large WordNets (see
  Section 4 for details)
  * Entailment relations extracted using this method may be of lower quality
    than those encoded by manually built databases such as WordNet, but cover
    larger vocabularies 

# 4 evaluates our method on two recent benchmarks 14

* compares their performance to previous systems
* simple strategies for combining them with the output of SOTA NLI systems

# 5 results of manual error analysis on both datasets

# 6. Conclusion 19

* providing insight about the differences between the two formulations of the
  entailment task and identifying current shortcomings of our approach, along
  with possible solutions
* SherLIiC inspires us to think more deeply about synonymy, polysemy, dis-
  ambiguation, definitional economy, prepositional linkers, modal
  subordination, causativization, and a host of other questions that are
  traditionally considered central to natural language semantics
* WordNet, with its extensive hypernym links, tailor-made for entailment detect
  * can be profitably combined with other resources, dictionaries in particul
  * hE, for other relationals, such as causation, possession, mereological
    implications, spatiotemporal reasoning, etc WordNet is less helpful there
    * we would need similar datasets that highlight these very real problems
* future work, we hope to address several of the issues exemplified in our
  * a more explicit disambiguation process
    before, or in parallel to, the modeling of lexical entailment
