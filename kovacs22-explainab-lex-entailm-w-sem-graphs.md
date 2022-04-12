Explainable lexical entailment with semantic graphs
Adam Kovacs, Kinga Gemes, Andras Kornai, and Gabor Recski
Natural Language Engineering (2022), 1–24 doi:10.1017/S1351324922000092

# 2. Related work

## 2.1 formulations of the lexical entailment task and corresponding datasets,
with special emphasis on the two datasets used in our work

* Entailment between pairs of words has been studied extensively as
  * one of the fundamental relationships in the lexicon and as
  * an essential building block of models of natural language inference.
  * Several recent task formulations
    equate lexical entailment with hypernymy/hyponymy or the IS_A relationship
    (Vulić+ 2017; Vulić, Ponzetto, and Glavaš 2019), treating it as
    * a relationship between two entries in a lexicon and creating
    * datasets of labeled pairs of words such as Hyperlex (Vulić+ 2017). Other
  * in their respective contexts
    * eg _eliminate_ entails _treat_ in Aspirin eliminates headaches but
      not in Aspirin eliminates patients,
    * Levy and Dagan (2016) introduce a dataset of annotated relation pairs.
      * question–answer pairs as context for lexical entailment,
    * other approaches involve providing context as
      * pairs of arguments (Zeichner, Berant, and Dagan 2012) or
      * pairs of argument types
        (Berant, Dagan, and Goldberger 2011; Schmitt and Schütze 2019).
  * as a special case of natural language inference (NLI), modern systems for
    * Stanford Natural Language Inference (SNLI, Bowman+ 2015) dataset and the
    * Multi-Genre NLI Corpus (MultiNLI, Williams, Nangia, and Bowman 2018)
* we, 
  * based on the 4lang formalism for representing (lexical) semantics and is
    * outlined in Section 3.2
    * capable of inspecting the relationship between the meaning of any two
      utterance fragments
  * evaluate our system on two recent benchmarks.  The datasets used in the
    * 2020 Semeval task “Predicting Multilingual and Cross-lingual (graded)
      Lexical Entailment’’ (Glavaš+ 2020) are
      * derived from HyperLex (Vulić+ 2017), a dataset of monolingual and
        cross-lingual–graded lexical entailment
      * Candidate word pairs for human annotation were gathered from the USF
        (Nelson, McEvoy, and Schreiber 2004) and WordNet (Miller 1995)
      * we will use the binary labels of the monolingual subsets for English,
        German, and Italian
      * Some examples for each language are shown in Table 1. On this dataset,
      * we will compare our method to 
        * GLEN system for measuring multilingual and cross-lingual lexical
          entailment using specialized word embeddings (Vulić+ 2019), which
          outperforms previous baselines in Upadhyay+ (2018), and also to the
        * other systems participating in the shared task, including our own
          earlier system presented in Kovács+ (2020).
    * A more challenging task formulation is provided by
      SherLlic dataset of lexical inference in context (Schmitt & Schütze 2019)
      * built by extracting inference candidates from an entity-linked portion
        of the ClueWeb corpus (Gabrilovich, Ringgaard, and Subramanya 2013) and
        using them as input to human annotation. Because annotation candidates
        were chosen based on distributional evidence, many entailment pairs in
        the final dataset are completely novel, missing from existing knowledge
        bases such as WordNet
      * Argument types for event pairs are necessary to disambiguate words
        eg run entails lead
        * yes if its arguments are of type PERSON and COMPANY (Bezos runs Amaz)
          not if they are COMPUTER and SOFTWARE, as in my mac runs macOS.
        * Table 2 shows further examples of entries in the SherLlic dataset. An
      * extensive evaluation of various LE systems on this dataset presented in
        Schmitt and Schütze (2019) will serve as the starting point for our
        evaluations in Section 4.
* The need for such novel datasets has been made clear by several recent
  * biases of deep learning based models of NLI
  * Glockner, Shwartz, and Goldberg (2018) constructed a new NLI test set from
    SNLI by replacing a single word in sentences from the training set, and
    used this new benchmark to expose top NLI systems’ inability to perform
    true lexical inference. The only model in their evaluation not showing a
    major drop in performance was the one incorporating lexical knowledge
    (Chen+ 2018)
  * inability of deep learning based NLI models to generalize across datasets
    * study across 6 systems and 3 datasets (Talman and Chatzikyriakidis 2019).
    * call into question whether black box models trained for high performance
      on any single NLI benchmark can be regarded as true models of inference.
    * rule-based models such as the one proposed in this paper can
      * facilitate further qualitative analysis of deep learning models by
      * strong explainable baselines on multiple tasks and datasets.

## 2.2 recent approaches to entailment and inference tasks

* hypernymy, lexical entailment is most often addressed using distributional
  * Hypernymy candidates are encoded using word embeddings and classified by
    * neural networks (Nguyen+ 2017; Shwartz, Goldberg, & Dagan 2016; Yu+ 2015)
    * Support Vector Machines (SVMs) and logistic regression (Baroni+ 2012;
      Levy+ 2015; Roller, Erk, and Boleda 2014)
    * a neural model for supervised learning of hypernymy-specific embeddings
      Yu+ (2015)
    * standard distributional models cannot account for the asymmetric property
      * Nguyen+ (2017) 
        * HyperVec, a hierarchical approach to learning hypernymy embeddings
          that allowed for significant improvement over the SOTA on HyperLex
      * Glavaš and Ponzetto (2017) proposes Dual Tensor, an
        * approach based on neural models to
          explicitly model the asymmetric nature of the hypernymy relation.
        * transforms generic embeddings into specialized vectors for scoring
          concept pairs based on whether the asymmetric relation holds.
    * HypeNET (Shwartz+ 2016), a method based on
      * extracting paths between premise and hypothesis from dependency trees
        and using them as inputs to Long Short-term Memory Networks (LSTMs).
    * Fine-tuning generic word vectors using external knowledge such as WordNet
      (Miller 1995) has improved performance on a range of language
      understanding tasks (Glavaš and Vulić 2018). To extend this method to
      unseen words, Kamath+ (2019) introduced POSTLE (post-specialization
      for LE), a model that learns an explicit global specialization function
      captured with feed forward neural networks.
* Inference systems trained on the SNLI and MultiNLI datasets mostly use neural
  language models based on the Transformer architecture (Vaswani+ 2017), in
  particular BERT (Devlin+ 2019)
  * SemBERT (Zhang+ 2020) uses a BERT backbone enhanced with a Semantic Role
    Labeler (SRL)
  * MT-DNN (Liu+ 2019) enhances the system presented in Liu+ (2015) with BERT.
  * Top results on the MultiNLI benchmark were achieved by optimized,
    pretrained, and finetuned versions of BERT, RoBERTa (Zhuang+ 2021), and
    ALBERT (Lan+ 2020)
  * Using rule-based models in NLI and combining them with deep learning based
    language models (BERT, ALBERT, RoBERTa) has recently also led to
    competitive results (Haruta, Mineshima, and Bekki 2020; Kalouli, Crouch,
    and de Paiva 2020)
  * we will also present an improvement over such a model using our fully
    rule-based method for detecting entailment between pairs of words.

## 2.3 common approaches to semantic parsing

* Semantic parsing is the task of
  mapping natural language text to some model of its meaning, and as a language
  * can only be defined with respect to a particular system of semantic repr. As interest in
* to lexical databases
  * graph of synonym sets in WordNet (Miller 1995), the
  * semantic role inventory in VerbNet (Kipper+ 2008), or the
  * ontology of semantic frames in FrameNet (Ruppenhofer+ 2006).
* Abstract meaning representations (AMR, Banarescu+ 2013), one of the most wide
  * based on the PropBank database (Palmer, Gildea, and Kingsbury 2005).
  * handles a range of phenomena in the semantics of English but does not
  * no treatment of word meaning and is also
  * not intended as a universal representation of natural language semantics,
    * despite some early efforts in Xue+ (2014) and the release of a
    * Chinese AMR bank (Li+ 2016).
  * Automatic construction of AMR graphs from text is usually performed using
    deep neural models (Konstas+ 2017; Lyu and Titov 2018; Zhang+ 2019) trained
    on AMR banks
* A language-agnostic approach to meaning representation is taken by Universal
  Conceptual Cognitive Annotation (UCCA, Abend and Rappoport 2013), which
  * abstracts away from syntax by
    representing words of a sentence as leaf nodes of DAGs representing scenes
    evoked by predicates.
  * top-performing parsers for UCCA all employ neural networks trained on
    manually annotated sentences (Hershcovich, Abend, and Rappoport 2017, 2018;
    Ozaki+ 2020; Samuel and Straka 2020)
* these formalisms often dependent on
  * large manually built databases, existing parsing systems also rely on
    large datasets of hand-crafted representations (sembanks) for training.
  * Transferring such systems across domains and languages therefore requires
    a considerable amount of expert human labor. In this article,
  * we will use a meaning representation formalism designed to enable robust
    rule-based parsing and relying only on language-agnostic resources
    * this sec: overview only; our extensions and modifications in Section 3.
* 4lang is a theory and formalism for representing the semantics of nat lang,
  * developed in Kornai (2012, 2019), Kornai+ (2015), and
  * partially implemented in Recski (2016, 2018)
  * az első implementációs cikk Nemeskey+ 2013 spreading
  * 4lang concept graphs represent meaning as directed graphs of
    language-independent concepts.
    * Edges connecting concepts have one of three labels
      * Predicates are connected to their arguments via edges labeled 1 and 2,
      * 0-edges represent all relationships involving inheritance, including
        * hypernymy (dog − → mammal) but also 0 0
        * attribution (dog − → four-legged), and
        * unary predication (dog − → bark)
        * This implies a broad definition of lexical entailment:
          unless explicitly overridden,
          dog entails not only mammal, but also bark and four-legged
    * In its current implementations, 4lang concepts have no grammatical
      attributes and no event structure, for example, the phrases water freezes
      and frozen water would both be represented as water − → freeze
    * Figure 2 shows the 4lang definition of the concept jewel
      * obtained by processing the dependency parse of the Wiktionary def A
    * the 4lang system allows us to expand graphs, a process which
      * unifies one graph with the definition graphs of the concepts therin
        that graph.
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
        construct the 4lang semantic representation of any text.

## 2.4 approaches to modeling entailment with semantic graphs

* Kovács+ (2020) 
  * direct applicability of such semantic graphs to hypernymy detection task by
  * a competitive system at the Semeval entailment task (Glavaš+ 2020). When
  * we defined entailment to hold between a pair of premise and hypothesis
    if and only if in the twice-expanded definition graph of the premise there
    is a directed path of 0-edges leading from the premise word to the
    hypothesis word (the maximum number of expansions was chosen arbitrarily). Because
    * not flow through locative and negative modifier clauses, inference had to
      * preps (eg English in, of, on, German in, auf, Italian di, su, il) or
      * words conveying negation (English not, German keine, etc.).
    * For example, where nose is defined as “a protuberance on the face’’,
      4lang graphs would contain a path of 0-edges from nose to face, falsely
* On the Semeval dataset of word-level entailment, the above method detected
  * only about one-third of all true entailments in the dev dataset but
  * nearly perfect precision
  * On well-resourced languages such as English, WordNet was shown to be a very
    strong baseline both in terms of precision and recall, and
    * the main contribution of 4lang was its ability to increase recall without
      hurting precision,
      * increasing the performance of strong WordNet-based baselines on three
        languages, ranking
  * first in English and Italian and second-best on German, see Table 3.
* For English and Italian official WordNet releases were accessed via the nltk
* Kovács+ (2020) for German
  * no access to a high-coverage WordNet release
  * word pairs were therefore translated from German to English using the
    wikt2dict system (ács, Pajkossy, and Kornai 2013) to enable the use of
  * In Section 4, when evaluating the methods presented in this article and
    comparing them to previous methods, we include a variant of this system
    using a recent German WordNet release, GermaNet
    (Hamp and Feldweg 1997; Henrich and Hinrichs 2010)

# 3 our pipeline

* building 4lang semantic graphs from Wiktionary entries and for
* obtaining additional synonyms both from Wiktionary and WordNet. The section
* using graph grammars to transform dependency trees to 4lang graphs, and
* our method for establishing entailment over pairs of 4lang graphs

## 3.1

* Interpreted Regular Tree Grammars (IRTGs, Koller 2015) can be used to
  * encode the correspondence between sets of such structures and have in
  * used to perform
    * syntactic parsing (Koller and Kuhlmann 2012),
    * generation (Koller and Engonopoulos 2017),
    * semantic parsing (Groschwitz, Koller, & Teichmann 2015; Groschwitz+ 2018)
    * surface realization (Kovács+ 2019; Recski+ 2020). The system presented in
    * we uses an IRTG for transforming UD trees into 4lang graphs.
* For the full mapping between UD and 4lang structures see Table 4.

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
