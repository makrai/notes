MASSIVE Multilingual Abstract Meaning Representation:
  A Dataset and Baselines for Hallucination Detection
Michael Regan, Shira Wein, George Baker, Emilio Monti
arXiv:2405.19285 [cs.CL]

# Abstract

* Abstract Meaning Representation (AMR) is a semantic formalism that
  * captures the core meaning of an utterance
* AMR corpora in English and more recently across languages
  * limited size of existing datasets and the cost of collecting more
  * we have both engineering and scientific questions in mind
* we introduce MASSIVE-AMR, a dataset with > 84,000 text-to-graph annotations,
  * the largest and most diverse of its kind
  * AMR graphs for 1,685 information-seeking utterances mapped to
    50+ typologically diverse languages. We describe how we built our resource
* experiments using LLMs for
  * multilingual AMR and SPARQL parsing as well as
  * AMRs for hallucination detection in the context of knowledge base QA
* shedding light on persistent issues using LLMs for structured parsing

# 2 Related Work

## 2.3 Abstract Meaning Representation

* Abstract Meaning Representation (AMR, Banarescu+, 2013) is
  * a linguistic formalism that represents utterance meaning as
    directed, mostly acyclic graphs. Graph
  * nodes denote key concepts associated with the meaning of the utterance,
    targeting events and event participants.
  * labeled edges for event-event, event-entity, entity-entity, and other rels
* Early AMR research focused on text-to-AMR parsing, with
  * the JAMR parser (Flanigan+, 2014) paving the way
  * SOTA models
    based on transitions (Drozdov+, 2022),
    seq2seq approaches (Bevilacqua+, 2021), and
    ensemble distillation (Lee+, 2022). In lieu of such heavily engineered
  * we target generative models with in-context learning and fine-tuning
    following recent work (Ettinger+, 2023).
* metric: Smatch
  * The original AMR reference-based metric is Smatch (Cai and Knight, 2013),
    a measure of overlapping triples, which has led to the newly optimized
  * Smatch++ (Opitz, 2023) and
  * S2match (Opitz+, 2020) which uses embeddings to match concepts within
    triples.
  * multilingual AMR metrics (Wein and Schneider 2022)
    eg XS2match using LaBSE embeddings (Feng+, 2022) for cross-lingual AMR eval
* cross-lingua
  * AMRs were not designed to function across languages (Banarescu+, 2013), and
  * language has a measurable effect on AMR structure (Wein+, 2022),
  * represent the meaning of non-English sentences in AMRs
    (Xue+, 2014; Hajič+, 2014; Wein and Schneider, 2024).
  * In typology, a Uniform Meaning Representation (Van Gysel+, 2021) helps
    account for formal and semantic differences across languages more
    consistently than AMR, and work
  * tying multilingual resources to a common formalism (Navigli+ 2022)

## 2.4 AMR for KBQA

* Using symbolic representations for QA is well studied in NLP
  (Niu+, 2023; Wang+, 2023). A
  * mapping of AMR nodes to SPARQL concepts and variables is shown to
    improve KBQA systems (Kapanipathi+, 2021), and
  * sequence-to-sequence models learn to apply these rules selectively for
    improved generalization (Bornea+, 2022).
* The multilingual QA resource most similar to ours is QALD9-AMR (Lee+, 2022),
  * maps utterances from 9+ languages
    to the same English-only AMR and gold SPARQL queries (Usbeck+, 2018).
  * MASSIVE-AMR: graphs consist of multilingual entities (Table 2)
    translated or localized (eg a regional entity for where the language is
    spoken) for each of 50+ languages (Tables 2 and 3)

# 3 Data 3

* Tab 3
  * en-US: English (United States)
  * sl-SL: Slovene (Slovenia)
  * it-IT: Italian (Italy)
  * sq-AL: Albanian (Albania)
  * cy-GB: Welsh (United Kingdom)
  * af-ZA: Afrikaans (South Africa)
  * is-IS: Icelandic (Iceland)
  * az-AZ: Azerbaijani (Azerbaijan)

# 4 Experimental 4

# 5 Exper 5

## 5.3 Data: Language Subsets for Parsing

* For experiments in AMR and SPARQL parsing, we identify a subset of languages:
  * for comparison with QALD9, we select Indo-European languages from
    MASSIVE-AMR, the subset we refer to as MASSIVE-, and
    * English, French, Russian, German, Italian, Lithuanian
  * a more diverse sample with different scripts and less representation in
    Wikipedia, referred to as MASSIVE+ (Table 5).
    * Vietnamese, Japanese, Korean, Hungarian, Urdu, Amharic, Azeri, Finnish
* For structured parsing experiments using incontext learning,
  we sample about 100 utterances each from QALD9, MASSIVE-, and MASSIVE+
  (eg the same 16 questions in 6 different languages),
  reporting average results across languages in each subset.

# 6 Conclusion

* structure parsing, both AMR graph and SPARQL query parsing across languages
  * performance for AMR parsing with in-context learning is less effective
    compared with reported SOTA using fine-tuning; still,
  * qualitative assessment of produced structures reveals many coherent,
    correct graphs despite low similarity with a ground truth
  * SPARQL parsing performance is high across languages,
    at least in small studies using the QALD9-AMR dataset
* AMRs for knowledge base question answering (KBQA),
  * whether AMRs can help detect incongruous SPARQL queries,
    essentially serving as a proxy confidence measure
    for the correctness of an answer suggested by a QA system
  * we first confirm that the GPT models do indeed hallucinate sem relations,
  * ‘easy’ hallucination detection is actually quite challenging,
    even for GPT-4
    * ie asking a model to verify relations are allowed
  * ‘hard’ hallucination detection is also challenging
    * ie the identification of utterances that are likely ambiguous
    * a joint AMR-SPARQL model only detecting 1 in 5 cases

# 9 Limitations

1. Our work involved research into multilingual SPARQL and AMR parsing;
   though our dataset includes 52 languages, we report results on no more
   than 10-12 of these. Many of
