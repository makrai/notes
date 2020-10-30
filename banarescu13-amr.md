Laura Banarescu, Claire Bonial, Shu Cai, Madalina Georgescu, Kira Griffitt
Abstract Meaning Representation for Sembanking
2013 7th Linguistic Annotation Workshop & Interoperability with Discourse

# Abstract

* we are writing down the meanings of thousands of English sentences
* simple, whole-sentence semantic structures
* will spur new work in statistical natural language understanding and
  generation, like the Penn Treebank encouraged work on statistical parsing
* tools associated with AMR

# 1 Intro

* Syntactic treebanks have had tremendous impact on natural language processing
  * rather than separate tasks and evaluations for base noun identification,
  * smaller tasks are naturally solved as a by-product of whole-sentence parsng,
    and in fact, solved better than when approached in isolation
* By contrast, semantic annotation today is balkanized. We have separate
  * annotations for named entities, co-reference, semantic relations, discourse
    connectives, temporal entities, etc. Each annotation has its own associated
  * evaluation, and training data is split across many resources. We lack a sim-
* principles are:
  * rooted, labeled graphs that are
    easy for people to read, and easy for programs to traverse
  * abstract away from syntactic idiosyncrasies. We attempt to assign the
    * same AMR to sentences that have the same basic meaning
    * e.g. “he described her as a genius”, “his description of her: genius”, and
      “she was a genius, according to his description” are all assigned the same
  * extensive use of PropBank framesets (Kingsbury and Palmer, 2002;
    Palmer+ 2005). For example, we represent a phrase like “bond investor” using
    the frame “invest-01”, even though no verbs appear in the phrase
  * agnostic about how we might want to analyze/generate
  * heavily biased towards English. It is not an Interlingua
* 50-page annotation guideline. In this paper, we give a high-level description

# 2 AMR Format

* rooted, directed, edge-labeled, leaf-labeled graphs
  * a completely traditional format,
  * equivalent to the simplest forms of
    feature structures (Shieber+ 1986), conjunctions of logical triples,
    directed graphs, and PENMAN inputs (Matthiessen and Bateman, 1991). Figure 1
* we adapt the PENMAN notation for human reading and writing

# 3 AMR Content

* In neo-Davidsonian fashion (Davidson, 1969), we introduce variables (or graph
  nodes) for entities, events, properties, and states
  * Leaves are labeled with concepts, so that “(b / boy)” refers to
    an instance (called b) of the concept boy
  * Relations link entities, so that “(d / die-01 :location (p / park))” means
    there was a death (d) in the park (p)
  * When an entity plays multiple roles in a sentence, we employ
    * re-entrancy in graph notation (nodes with multiple parents) or
    * variable re-use in PENMAN notation
* concepts are either
  English words (“boy”), PropBank framesets (“want-01”), or special keywords
  * Keywords include
    * special entity types (“date-entity”, “world-region”, etc.),
    * quantities (“monetary-quantity”, “distance-quantity”, etc.), and
    * logical conjunctions (“and”, etc)
* approximately 100 relations:
  * Frame arguments, following PropBank conventions. :arg0, :arg1, ..., :arg5
  * General semantic relations. :accompanier, :age, :beneficiary, :cause,
    :compared-to, :concession, :condition, :consist-of, :degree, :destination,
    :direction, :domain, :duration, :employed-by, :example, :extent, :frequency,
    :instrument, :li, :location, :manner, :medium, :mod, :mode, :name, :part,
    :path, :polarity, :poss, :purpose, :source, :subevent, :subset, :time,
    :topic, :value
  * Relations for quantities.  :scale, :quant, :unit,
  * Relations for date-entities. :day, :month, :year, :weekday, :time,
    :timezone, :quarter, :dayperiod, :season, :year2, :decade, :century,
    :calendar, :era
  * Relations for lists. :op1, :op2, :op3, :op4, :op5, :op6, :op7, ..., :op10
  * also includes the inverses of all these relations, e.g., :arg0-of,
  * every relation has an associated reification, which is
    * what we use when we want to modify the relation itself. For example, the
      reification of :location is the concept “be-located-at-91”
* rest of this section, we give examples of how AMR represents
  various kinds of words, phrases, and sentences

## Frame arguments. We make heavy use of PropBank framesets to abstract away

* PropBank framesets to abstract away from English syntax. For example, the
* e.g. frameset “describe-01” has three pre-defined slots
  (:arg0 is the describer, :arg1 is the thing described, and :arg2 is what it is
  being described as)

```
(d / describe-01
:arg0 (m / man)
:arg1 (m2 / mission)
:arg2 (d / disaster))
```

> The boy did not go
> The man described the mission as a disaster
> The man’s description of the mission: disaster
> As the man described it, the mission was a disaster

## General semantic relations, e.g. :beneficiary, :time, and :destination

```
(s / hum-02
:arg0 (s2 / soldier)
:beneficiary (g / girl)
:time (w / walk-01
:arg0 g
:destination (t / town)))
```

> The soldier hummed to the girl as she walked to town

## Co-reference. AMR abstracts away from co-reference gadgets like pronouns,

* we reuse AMR variables, as with “g” above. AMR annotates
* sentences independent of context, so
* if no antecedent in the sentence, nominative of the pronoun: “(h / he)”

## Inverse relations. We obtain rooted structures by using inverse relations

* root of an AMR represents the focus of the sentence or phrase. Once we have
* no more focus considerations

## Modals and negation

* negation logically with :polarity, and it
* modals with concepts

```
(p / possible
:domain (g / go-01
:arg0 (b / boy))
:polarity -))
```

> The boy cannot go

## Questions

* wh: the concept “amr-unknown”, in place, to indicate
* Yes-no questions, imperatives, embedded whclauses: with the AMR relation :mode

## Verbs

* AMR abstracts away from light-verb constructions

## Nouns. We use PropBank verb framesets to represent many nouns as well

* nominalizations refer to a whole event/a role player in an event

## Adjectives. Various adjectives invoke PropBank framesets

```
(s / spy
:arg0-of (a / attract-01))
```

> the attractive spy

* “-ed” adjectives frequently invoke verb framesets, e.g. “acquainted with” maps
* not restricted to morphological simplification
* “-able” adjectives often invoke the AMR concept “possible”, but not always

## Prepositions. Most prepositions simply signal semantic frame elements, and

* kept if they carry additional information
```
(d / default-01
:arg1 (n / nation)
:time (a / after
:op1 (w / war-01))
```

> The nation defaulted after the war
* Occasionally, neither PropBank nor AMR has an appropriate relation, in which
```
(s / sue-01
:arg1 (m / man)
:prep-in (c / case))
```

> The man was sued in the case

## Named entities

* Any concept in AMR can be modified with a :name relation
* standardized forms for ~ 80 named-entity types, e.g. person, country,
* not normalize multiple forms of a concept (“US” versus “United States”)
* avoids analyzing semantic relations inside a named entity—e.g., an
* uniform treatment to titles, appositives, and other constructions

## Copula. Copulas use the :domain relation

```
(w / white
:domain (m / marble))
```

> The marble is white

## Reification. Sometimes we want to use an AMR relation as a first-class

```
(b / be-located-at-91
:arg1 (m / marble)
:arg2 (j / jar)
:polarity -)
:time (y / yesterday))
```

> The marble was not in the jar yesterday

* If we do not use the reification, we run into trouble
```
(m / marble
:location (j / jar
:polarity -)
:time (y / yesterday))
``` 
> yesterday’s marble in the non-jar

* Some reifications are standard PropBank framesets
  (e.g., “cause-01” for :cause, or “age-01” for :age)


* Here For we omit descriptions of comparatives, superlatives, conjunction,
  possession, determiners, date entities, numbers, approximate numbers,
  discourse connectives, and other phenomena covered in the full AMR guidelines

# 4 Limitations of AMR 6

* not represent inflectional morphology for tense and number, and articles. This
  * we do not have a nice semantic target representation for these phenomena. A
* no universal quantifier. Words like “all” modify their head concepts.  AMR
* not distinguish between real events and hypothetical, future, or imagined
  e.g. in “the boy wants to go”, “want-01” and “go01” have the same status, even
* “history teacher” !~ “history professor”
  * “(p / person :arg0-of (t / teach-01 :arg1 (h / history)))”
  * “(p / professor :mod (h / history))”, because “profess-01” is not an
  * It would be reasonable in such cases to use a
    NomBank (Meyers+ 2004) noun frame with appropriate slots

# 5 Creating AMRs

* AMR Editor allows rapid, incremental AMR construction
  via text commands and graphical buttons. It includes online documentation of
  relations, quantities, reifications, etc., with full examples. Users log in,
  and the editor records AMR activity. The editor also provides significant
  * users are warned about incorrect relations, disconnected AMRs,
    words that have PropBank frames, etc
  * Users can also search existing sembanks for phrases to see how they were
* to assess inter-annotator agreement (IAA), as well as automatic AMR parsing,
  we developed the smatch metric (Cai and Knight, 2013) and associated script. 3
  * overlap between two AMRs by viewing each AMR as a conjunction of triples
  * looking for the variable mapping that yields the highest F-score
  * no reference to English strings or word indices
    * in the same way that Bleu not making reference to the source
* initial IAA study, and
  * prior to adjusting the AMR Editor to encourage consistency,
  * 4 expert AMR annotators annotated 100 newswire sentences and 80 web text
    sentences. They then created consensus AMRs through discussion. The average
    annotator vs. consensus IAA (smatch) was 0.83 for newswire and 0.79 for web
  * newly trained annotators doubly annotated 382 web text sentences, their
    annotator vs. annotator IAA was 0.71

# 6 Current AMR Bank 7

* several thousand sentences, a subset of which can be freely downloaded, 4
  the rest being distributed via the LDC catalog
* In initially developing AMR, the authors built consensus AMRs for:
  * 225 short sentences for tutorial purposes
  * 142 sentences of newswire `*`
  * 100 sentences of web data `*`
* Trained annotators at LDC then produced AMRs for:
  * 1546 sentences from the novel “The Little Prince”
  * 1328 sentences of web data
  * 1110 sentences of web data `*`
  * 926 sentences from Xinhua news `*`
  * 214 sentences from CCTV broadcast conversation `*`
* Collections marked with a star `*` are also in the OntoNotes corpus
  (Pradhan+ 2007; Weischedel+ 2011)
* annotation time Using the AMR Editor, annotators are able to
  * translate a full sentence into AMR in 7-10 minutes and
  * postedit an AMR in 1-3 minutes

# 7 Related Work

* whole-sentence semantic parsing today typically use
  * small, domain-specific sembanks like GeoQuery (Wong and Mooney, 2006). The
  * for larger, broad-coverage sembanks, projects including the
    * Groningen Meaning Bank (GMB, Basile+ 2012a)
    * Universal Conceptual Cognitive Annotation (UCCA, Abend and Rappoport 2013)
    * the Semantic Treebank (ST, Butler and Yoshimoto, 2012)
    * the Prague Dependency Treebank (Böhmová+ 2003)
    * Universal Networking Lang (UNL Uchida+ 1999; Uchida+ 1996; Martins, 2012)

## Concepts

* Most systems use English words as concepts
* AMR uses PropBank frames (e.g., “describe-01”),
* UNL uses English WordNet synsets (e.g., “200752493”)

## Relations
* GMB uses VerbNet roles (Schuler, 2005), and
* AMR uses frame-specific PropBank relations
* UNL has a dedicated set of over 30 frequently used relations

## Formalism
* GMB meanings are written in DRT (Kamp+ 2011), exploiting full firstorder logic
* GMB and ST both include universal quantification

## Granularity: single sentence or more
* GMB and UCCA annotate short texts, so that the same entity can participate in
  events described in different sentences;
* other systems annotate individual sentences

## Entity types

* AMR uses 80
* GMB uses 7

## Manual versus automatic

* AMR, UNL, and UCCA annotation is fully manual
* GMB and ST produce meaning representations automatically, and these can be
  corrected by experts or crowds (Venhuizen+ 2013)

## Derivations
* AMR and UNL remain agnostic about the relation between strings and meanings,
* GMB annotate words and phrases directly, recording derivations as (for
  example) Montague-style compositional semantic rules operating on CCG parses

## Top-down verus bottom-up

* AMR annotators find it fast to construct meanings from the top down,
  starting with the main idea of the sentence (though Editor allows bottom-up)
* GMB and UCCA annotators work bottom-up

## Editors, guidelines, genres. These projects have graphical sembanking tools
(e.g., Basile+ (2012b)), annotation guidelines, 5 and sembanks that cover a wide
range of genres, from news to fiction. UNL and AMR have both annotated many of
the same sentences, providing the potential for direct comparison

# 8 Future Work

## Sembanking. Our main goal is to continue sembanking. We would like to employ

* shared tasks for natural language understanding and generation.  These tasks
* theoretical frameworks for probabilistic mapping between graphs and strings
  (Quernheim and Knight, 2012b; Quernheim and Knight, 2012a; Chiang+ 2013)

## Applications. Just as syntactic parsing has found many unanticipated

* semantics-based machine translation (MT) system. In this system,
  * we annotate bilingual Chinese/English data with AMR, then train
  * components to map Chinese to AMR, and AMR to English A
  * prototype is described by Jones+ (2012)

## Disjunctive AMR

* AMR aims to canonicalize multiple ways of saying the same thing
* manually-constructed paraphrase networks from the HyTER project
  (Dreyer and Marcu, 2012). Rather than build individual AMRs for different
* construct highly-packed disjunctive AMRs.  With this application in mind,
* official talks ~ state-sanctioned talks ~ meetings sanctioned by the state

```
(o / *OR*
:op1 (t / talk-01)
:op2 (m / meet-03)
:OR (o2 / *OR*
:mod (o3 / official)
:arg1-of (s / sanction-01
:arg0 (s2 / state))))
```

## AMR extensions. Finally, we would like to deepen the AMR language to include

* more relations (to replace :mod and :prep-X, for example),
* entity normalization (perhaps wikification), quantification, and
  temporal relations.  Ultimately, we would like to also include
* a comprehensive set of more abstract frames like
  * “Earthquake-01” (:magnitude, :epicenter, :casualties)
  * “CriminalLawsuit-01” (:defendant, :crime, :jurisdiction)
  * “Pregnancy01” (:father, :mother, :due-date)
  * Projects like FrameNet (Baker+ 1998) and CYC (Lenat, 1995) have long pursued
