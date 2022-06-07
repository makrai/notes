COMET-ATOMIC 2020: On Symbolic and Neural Commonsense Knowledge Graphs
Jena D. Hwang, Chandra Bhagavatula, Ronan Le Bras, Jeff Da, Keisuke Sakaguchi,
  Antoine Bosselut, Yejin Choi
AAAI 12 October 2020 arXiv:2010.05953 [cs.CL]

# Abstract

* renewed interest in commonsense representation and reasoning in NLU
* new commonsense knowledge graphs (CSKG) has been central to these advances
* we posit that manually constructed CSKGs will never achieve the coverage
  necessary to be applicable in all situations encountered by NLP agents
  * new evaluation framework for testing the utility of KGs based on
    how effectively implicit knowledge representations can be learned from them
  * ATOMIC 2020, a new CSKG of general-purpose commonsense knowledge
    * containing knowledge that is not readily available in pretrained LMs
* we evaluate its properties in comparison with other leading CSKGs, performing
  the first large-scale pairwise study of commonsense knowledge resources
* ATOMIC 2020 is better suited for training knowledge models that can generate
  accurate, representative knowledge for new, unseen entities and events
* human evaluation, we show that
  the few-shot performance of GPT-3 (175B parameters), while impressive,
  remains ~12 absolute points lower than a BART-based knowledge model trained
  on ATOMIC 2020 despite using over 430x fewer parameters

# 1 Intro

* large-scale language models (Radford+ 2018; Devlin+ 2019; Brown+ 2020)
  trained on extreme-scale data have been shown to
  effectively adapt to diverse downstream tasks, achieving signif (Wang+ 2019)
  * as these models have grown larger (and trained on larger amounts of data),
    their benchmark performance has continued to improve (Raffel+ 2019) despite
    limited conceptual improvements, leaving
    open questions regarding the source of these remarkable generalization
* many of these performance gains could be a result of
  LM memorizing facts in their parameters during training (Roberts+ 2020) that
* language models as knowledge bases has emerged (Petroni+ 2019).  In this
  * language models are prompted with natural language prefixes or questions,
    and they express knowledge through language generation. The
* initial success of this paradigm for representing commonsense knowledge
  (Davison, Feldman, and Rush 2019; Tamborrino+ 2020) has led to the
  * optimistic claim that LMs remove the need for structured knowledge
* LM's best results are observed in narrowly specific conditions – we show (cf
  §5) that they perform better when evaluated on knowledge bases that
  prioritize ontological relations and whose examples resemble language-like
  assertions (e.g., mango IsA fruit). 2 Consequently, the types of knowledge
  that can be directly accessed through the language model’s interface remains
  limited
* training language models on knowledge graph tuples leads them to learn to
  express their implicit knowledge directly (Bosselut+  2019), allowing them to
  provide commonsense knowledge on-demand. These adapted knowledge models have
  * promising results on commonsense benchmarks compared with methods that
    require linking entities to knowledge graphs (Shwartz+ 2020; Liu+ 2020)
* we propose a dual use for commonsense knowledge bases going forward: as
  * static graphs that can be linked to for discrete knowledge access, and
  * resources for adapting language models to hypothesize commonsense knowledge
    about un-annotated entities and events
    * we propose evaluating commonsense knowledge resources based on the
      complementary information they can bring to pretrained
* Atomic^20_20, a new, high-quality knowledge graph with
  * 1.33M commonsense knowledge tuples across 23 commonsense relations. We
  * compare it with respect to its coverage and accuracy in competition with
    other highly used CSKGs, such as ConceptNet (Speer+ 2017). Our results
  * Atomic^20_20 is able to cover more correct facts about more diverse knowl
* we formalize the COMET framework of Bosselut+ (2019) across different seed
  language models and training knowledge graphs, and evaluate the commonsense
  knowledge hypothesized by these adapted knowledge models. Our empirical study
  * two promising conclusions. First, it confirms that
    * KG-adapted language models learn to express knowledge more precisely than
      naive language models trained only on language. And second, we show that
    * Atomic^20_20 as a transfer resource leads to COMET models that achieve
      the largest increase over their seed language model (across all seed LMs)
      for the commonsense knowledge types it covers, validating the importance
      of constructing knowledge resources with examples of knowledge not
      readily found in language models
* Key Contributions: In summary, we make three key contributions in this paper

# 2 Background

## Commonsense Knowledge Graphs

* Large scale commonsense knowledge graphs allows models to learn to reason
  over commonsense knowledge to make predictions (Lin+ 2019; Feng+  2020).  In
* we evaluate three existing knowledge graphs, C ON CEPT N ET , Atomic , and
  T RANS OMCS on their coverage 3 and precision relative to our new resource A
  TOMIC 20 20 
* The ConceptNet (v5.7) knowledge graph (Speer, Chin, and Havasi 2017)
  * 36 relations focusing mostly on
    * 90% taxonomic and lexical knowledge (e.g., RelatedTo, Synonym, IsA) and
    * physical commonsense knowledge (e.g., MadeOf, PartOf). ConceptNet
  * 3.4M entity-relation tuples (in English) collected by crowdsourcing and
    merged with existing knowledge databases from DBPedia, WordNet, Wiktionary,
    and OpenCyc. Since the knowledge are derived from human efforts, the
    accuracy of ConceptNet (v5.7) knowledge is fairly high, though the
    quality does vary depending on the sources of knowledge and relation types
  * (Davis and Marcus 2015; Sap+ 2019), and shown in Figure 2,
    the coverage of ConceptNet (v5.7) is limited to mostly taxonomic,
* The Atomic (Sap+ 2019) knowledge graph consists of
  * 880K of tuples across 9 relations that cover
    social commonsense knowledge (e.g, X gets X’s car repaired xIntent to
    maintain the car),
    including dynamic aspects of events such as causes and effects, if-then
    conditional statements, and mental states
  * collected and validated completely through crowdsourcing
* The T RANS OMCS (Zhang+ 2020a) knowledge graph consists of
  * 18.48M tuples that were automatically converted from syntactic parses of
    sentences from various web sources including Wikipedia, Yelp, and Reddit
  * The set of relations used for the mapping is copied from ConceptNet 
    * much larger than other commonsense knowledge graphs, the
    * precision of the extracted knowledge is significantly lower
    * performs poorly as an adaptation resource relative to other KGs (cf. §5)
* We were unable to include Cyc (Lenat 1995) in our study due to the
  discontinuation of its research license and the cost of the commercial
  license (over $1M). ConceptNet includes a subset of Cyc – OpenCyc

## Language Models as Knowledge Bases

* results motivating these observations are often limited to narrowly scoped
  subsets of commonsense knowledge that primarily include taxonomic knowledge
  (e.g., mango IsA fruit) and that are often found explicitly stated in text
  However, commonsense facts are often implied (Gordon and Van Durme 2013),
  and as will be seen in our studies (cf. §4),
  * SOTA neural models struggle to express implicit commonsense knowledge that
    involves complex relationships.  3
* Bosselut+ (2019) take the best of both worlds between commonsense knowledge
  graphs and pretrained language models. The
  * commonsense transformer, or COMET, adapts pretrained neural language models
    by training on example tuples from commonsense knowledge graphs. It takes a
    head/source phrase and a relation (e.g., take a nap Causes) and generates
    the tail/target phrase (e.g., have energy). Bosselut+ (2019) show that
    COMET trained on the ConceptNet and Atomic knowledge graphs is able to
    adapt to generate novel (and valid) commonsense knowledge tuples
  * produce commonsense knowledge on-demand for any head entity that can be
    expressed through language. This flexibility allows them to be used
  * applied to new, previously unexplored tasks, such as
    sarcastic comment generation (Chakrabarty+ 2020),
    therapy chatbots (Kearns+ 2020), and
    automated story plot generation (Ammanabrolu+ 2020). These contributions

# 3 Atomic^20_20

* a new commonsense knowledge graph covering social, physical, and eventive
  aspects of everyday inferential knowledge (cf. §3).  Next,
* 23 commonsense relations types. They can be broadly classified into three
  * 9 commonsense relations of social interaction,
    * tuples primarily from Atomic + crowdsourced an additional 34K tuples
      using the same approach as Sap+ (2019)
  * 7 physical-entity commonsense relations, and
  * 7 event-centered commonsense relations concerning
    situations surrounding a given event of interest. The full inventory of A
    TOMIC 20 20 relations is listed in Table 1
  * by far, the two largest new relations are ObjectUse and HinderedBy. For
* ObjectUse e.g. “popcorn bucket” that may be used for “holding popocorn”
  * 130K everyday object-use pairs
  * by asking crowdworkers for necessary objects and their uses for each event
  * atypical usages gathered in a separate pass where workers were asked to
    provide creative or resourceful but feasible uses of the objects. Given
    “popcorn bucket”, for instance, one might “wear it as a hat” for, say, a
* HinderedBy, we explore the notion that
  * many events in real world can be defeasible (Lascarides and Asher 1991)
    by collecting hindrances to goals that may be useful for tasks such as
    counterfactual reasoning. For example
  * e.g.  X’s desires to adopt a cat may be hindered by finding out that X is
    allergic to cats, which would necessitate X to adjust future actions
* Atomic^20_20 also pulls commonsense tuples from the English subset of
  ConceptNet (v5.7, latest version available; Speer, Chin, and Havasi 2017)
  * 172K out of 3.4M tuples was selectively chosen to be integrated into
  * to reflect commonsense information dealing with qualitative human experienc
  * eliminated data are tuples with edge weight ≤ 0.5, dictionary or
    etymologically based knowledge (e.g., synonyms/antonyms, inflections),
    lexical hyper/hyponymic lexical relationships such as IsA or InstanceOf,
    and relations based on lexical cooccurrence (e.g., RelatedTo or
    LocatedNear), which are easily recoverable from language models. 5 After
    * geographic facts (e.g., “shenzhen” AtLocation“china”), tuples from each
      ConceptNet were examined for further splits or joins to align with the
      existing structure of Atomic^20_20 . A random 10% tuples from each
* crowdsourced validity testing (akin to the process described later in §4)
  * In the end, only 5 relations retain the ConceptNet ’s original meaning with
    a few relations that are cognates in Atomic^20_20

# 4 Comparison of Atomic^20_20 to other prominent CSKBs

* our new symbolic knowledge graph is more accurate than any current CSKB (see

# 5 our new neural knowledge model COMET-Atomic^20_20

* successfully transfers Atomic^20_20 ’s declarative knowledge to beat GPT-3,
  the largest pre-trained language model, in spite of using 400x fewer
  parameters (see Table 6, cf. §5)

# 6 the utility and importance of high-quality symbolic knowledge provided by
Atomic 20 20 to generalize on commonsense information that LMs cannot
expressively capture on their own
