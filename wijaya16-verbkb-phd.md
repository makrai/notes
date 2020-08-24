Derry Tanti Wijaya
VerbKB: A Knowledge Base of Verbs for Natural Language Understanding
2016 PhD Thesis

# Abstract

* typed with a pair of NELL semantic categories
  that indicates its subject type and its object type
  e.g., “live in”(person, location).  We present algorithms behind VerbKB that
  learn two semantic types of mappings for these verb lexical units
* complement
  * WordNet and VerbNet and
  * knowledge bases about _entities_ such as NELL
* two semantic types of mappings are
  1. from verb lexical units
    * to binary relations in knowledge bases
    * e.g., ... from the verb lexical unit “die at”(person, nonNegInteger)
      to the binary relation personDiedAtAge) and
  2. the mappings from verb lexical units
    * to changes in binary relations in knowledge bases (
    * e.g., the mapping from the verb lexical unit “divorce”(person, person)
      to the termination of the relation hasSpouse).  The mappings from verb
* to binary relations in knowledge bases such as NELL, YAGO, or Freebase
  * NELL [Carlson+ 2010]
  * YAGO [Hoffart+ 2013]
  * DBPedia [Auer+ 2007] or
  * Freebase [Bollacker+ 2008]

# 1 Intro

* Some verbs express 
  * relationships among entities in the world,
  * events that change these relationships, and some do 
  * both
* process
  * subject-verb-object (SVO) triples obtained from the high coverage Web-scale
    corpora of ClueWeb [Callan+ 2009a] (the semantic types of the verbs’
    subject and object fillers defined by the types in the NELL knowledge base)
  * synonymy and antonymy relations between English verbs in manually
    constructed resources that are the Moby Thesaurus 2 and WordNet,
  * automatically clusters
    * 65,679 unique verb patterns (verb lexical units in VerbKB without types)
    * into 215,106 synsets, each synset typed with semantic types in NELL and
      organized into a subsumption taxonomy based on types
  * Each synset is then either mapped to a pre-existing NELL relation or added
    as a new relation in NELL

## 1.1 Overall Description of the General Approach to Building VerbKB

* Since a verb pattern often has multiple senses, e.g., “play”, we add to the
  verb pattern, its type signatures [to differentiate] senses e.g.,
  “play”(person, musicalInstrument),
  “play”(person, person),
  “play”(person, game), etc. The use of NELL types means that the
  * sense granularity is constrained by the semantic granularity of NELL types
  * we refer to them as typed verbs
* oragnization
  3. we link these typed verbs to their equivalent existing NELL relations if
     such exist
     * eval in relation extraction
  4. we link the addition or removal of the verb patterns into/from Wikipedia
      pages to the changes: initiation or termination of Wikipedia infobox
      relations (in other words, DBPedia relations) if such exist
      * eval in temporal scoping
  5. we add the missing typed verbs-relations into NELL
   1. cluster semantically equivalent typed verbs in VerbKB. Although the
     * measured by overlaps of their subject and object fillers – and their two
       e.g. “marry in”(person, location) and “wed in”(person, location) in the
   2. add the cluster personMarryAtLocation into NELL as a new binary relation
* VerbKB is the largest publicly available knowledge base of English verbs to
  date that contains mappings from verbs to knowledge base relations and
  changes in these relations
* shortcomings that we plan to address in future work, including:
  * only ... subject-verb-object (SVO) triples construction. We ignore
    * intransitive verbs e.g., “he runs”, the
    * copula whose type signature is not distinct enough to disambiguate
      * e.g., “he is a friend” – the type signature here is (person, person)
      * adjectives and adverbs [e.g. _man is happy_]
      * nouns e.g., “the wind speed is 9 mph”
      * 35.5% of the relations cannot be expressed by a combination of verbs
        and prepositions alone
  * only a small subset of interrelationships between typed verbs, of the kind
    begin-relation(X) → end-relation(Y), as in begin-spouse(“marry”(person,
    person)) → endspouse(“divorce”(person, person)), begin-yearsActive(“be
    born in”(person, year)) → endyearsActive(“die in”(person, year))
    * Future work: “hire”(company, person) → “work for”(person, company) → “be
      appointed as”(person, ceo) → “lead”(person, company)
  * e.g. personEatFood has verbs that should not all become one cluster:
    “eat”, “finish”, “consume”, “digest”, “ingest”, “devour”, “gobble”, “wolf”,
    “chew with”, “pig on”, etc.  Future work can bring into consideration
    * other semantic roles like Instrument: “eat with fork”, “chew with teeth”
      and Manner: “gobble fast”, “ingest slowly”
  * distribution of tenses of the verb patterns
    * can be useful ... with respect to the internal temporal structure
      e.g. “*Kim is knowing the answer”
    * distribution of temporal modifiers and of tenses
    based on ... the aspectual classification of verbs by Vendler [1957]
    * in Wikipedia edit histories that a change in the verb tense is often a
      _ is due to take office_ -> _took office_
  *  we do not differentiate between the preposition
    * signals the argument of the verb e.g., the preposition “against” in the
    * signals the adjunct of the verb e.g., the [durative] “since” in the
    * Future work ... generalizing over prepositions that signal adjuncts
