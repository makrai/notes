Semantic Role Labeling in the Training Corpus for Slovene
Simon Krek, Polona Gantar, Kaja Dobrovoljc, Iza Škrjanec
2016, Conference on Language Technologies & Digital Humanities Ljubljana

# Abstract

The paper describes the procedure, tagset, criteria and tools for semantic role
labeling in the training corpus for Slovene. In the first part we present the
theoretical foundations of our research and the methodology. The following part
includes a detailed description of the tagset used for semantic role labeling
of Slovene, together with annotation criteria. Ambiguous cases are highlighted
and potential now semantic roles are suggested for solving borderline cases.
The paper finishes with a short summary of the decisions that were taken in the
process, and future work in the context of the bilateral Slovene-Croatian
project Semantic Role Labeling in Slovene and Croatian.

# 1 Introduction

Labeling of semantic roles (Eng. Semantic Role Labeling - SRL) is a procedure
that is the linguistic point of view, dedicated (automatic) identifying
participatory roles of linguistic technology while developing systems for
information extraction, systems for responding to questions (Eng. Question
Answering System) , improving the operation of syntactic parsers and machine
translators, etc. (Shen and Lapata, 2007; Christensen et al., 2011). Since the
lack of consensus on the various categories and the criteria for determining
which today are already available for many languages, causing difficulties in
čezjezikovnem model semantic labeling should in our view, an effective system
of criteria and indications for marking participatory roles or, more precisely
predikatno- argumentnih relationships (a) to provide a set of categories, which
is the most optimal, ie. cover all (in our case Slovene) key participatory
roles and at the same time (b) does not contain categories that are excessively
detailed or mutual overlays, (c) be based primarily on semantic rather than on
morphological, lexical or syntactic properties, (d) allow for formal
description or usefulness of language technology applications, and (e) to be as
compatible with the categories and criteria applicable to other languages
​​(cf.. Petukhov and Bunt, 2008: 39). To this end, within the
framework of the project of making the training corpus for semantic tagging
applications for Slovenian created a system of criteria for the identification
and marking of participatory roles in Slovene. Our goal was to manually tag
syntax half of the sealed part of the training corpus ssj500k, on the basis of
whether it would be in the future be automatically recorded even larger corps.
In this paper we present the starting point for determining the semantic
categories and tags for the English, the tagging process and tools for semantic
markup training corpus for Slovene.

# 2 Theoretical and methodological background

In selecting the method of semantic tagging and semantic categories for
determining Slovene We first analyzed the individual approaches that have been
developed and used for other languages, for example. PropBank (Palmer et al.,
2005), Verbnet (Kipper et al., 2006) and FrameNet (Backer et al., 1998) for
English, Ancor (Taul et al., 2011) for the Spanish, Sonar (Schuurman et al. ,
2010) for the Dutch. In addition, a set of codes for Croatian (Filko et al.,
2012) and the Czech valence lexicon Vallex. We focused on comparing formal
descriptions (ie. Sets of semantic tags) for each participatory role and the
criteria for their determination. From the perspective of optimizing the set of
codes, which would provide enough robust system and at the same time as far as
possible into account the specifics of the Slovenian language, we consider also
the degree of semantic fragmentation, which provides a single system, and the
fact that the Slovene language is not available in machine-readable lexicon
verbal valency. In addition, we have criteria for semantic tagging like to set
so as to enable reliable and most consistent Marking the training corpus. In
the range of participatory roles and their formal descriptions are derived from
the functional generative approach of the Prague Dependency nurseries (Eng.
Prague Dependency Treebank; (PDT); Mikulov et al., 2006) within the scope of
prototypical verbal sample (proposition) the relationship between the
participants, who have You can udeležensko role delovalnika or circumstances.
Participants and their various participatory role therefore provides
prototypical prepozicija given meaning of the verb, which is realized in its
valency scheme. In concrete terms, we could say that foresees verb to do in one
of its meanings so delovalniške as optional participants at the
morphosyntactic level realized in the form of arguments, which can be written
as: who does what to whom (when, where, how, why) which represents a valency
scheme actual verbal meaning. Given that the number of delovalnikov given
example predictable, though not necessarily realized in each sample of said
verb respectively. meaning it is possible for the situation to say is that it
provides verbal meaning, it remains an open question whether they are actually
necessary for the proper evocation of verbal meaning. On the other hand, it is
clear that the (non) realization of individual delovalnikov in itself does not
necessarily affect the meaning of the verb, as the speaker may be provided for
the participants, even if the sample is not expressed (Hanks, 2010; Jelly,
2010). Thus, it is there in the mental lexicon of speakers for each verb
meaning prototypical proposition that the real text is realized in different
ways, with uses such language morphosyntactic inventory, including the Ellipse
and contextual references, as well as zunajezikovne and pragmatic circumstances
of utterance. In determining the relationship between the semantic mandatory
and optional semantic participants are therefore at baseline derived from the
system PropBank (Palmer et al., 2005) (Figure 1). This model provides
meaningful liability only at delovalnikov (set), which are always semantically
obligatory (arg [0-4]), while the circumstances (adverbial supplements; argM)
specified as semantically optional, while, as mentioned above, the semantic
obligation It does not imply a structural commitments

On the other hand, systems such as PDT and FrameNet (Backer et al., 1998),
provide for the determination of the level obligatornosti circumstances (Figure
2). In this case, both semantically obligatory delovalniki (ACT, PAT, ADDR,
ORIG, EFF) and semantically obligatory circumstances (time, place, cause,
manner) marked with labels arg [0-4], meaning optional circumstances it marks
argM ( see. Table 1).

With the merger of the two systems in terms of obligatornosti participants, the
above example, the verb do look like this:

```
Who does what to whom when where why how
```

Table 1: Scheme valency of the verb to do with the note participatory roles and
their obligatornosti system PDT.

Although it seems according to the semantic properties of the verb appropriate
system PDT that the merger semantic syntactic criteria also recognizes
obligatornost optional participants (cf. Also jelly, 2010),
obligatornosti for Slovenian could not be fully implemented without the lexicon
information for each verb. In the current phase of semantic tagging we
therefore maintain obligatornost only delovalnikih, in the circumstances, these
deferrals are not included, but it's one of the challenges that we intend to
engage in further stages of the labeling.

# 3 Semantic tagging of Slovene: set of labels and the criteria for their determination

The basis for a set of participatory roles and their labels, it has, as has
been said, represented tags Prague Dependency Treebank. From the perspective
of optimizing the semantic fragmentation, taking into account the specifics of
the Slovenian and at the same time hiding markings between the individual
systems are set appropriately reduced it. Table 2 shows the merger set
delovalniških applications according to PDT and tags for Slovene.

Prague Dependency optional Treebank provides the participants the
following categories: time, space, causality and the way we have also taken
into account in the Slovenian range (Table 2). In internal granularity we
strive to associate semantic categories under one label. Thus, for example. for
different time categories (When, parallel, from a when, this is a when, how
long, since a when, etc. - a total of 9) who have in PDT separate codes in the
Slovenian range combined into just three: TIME (time), DUR (duration ) and the
FREQ (frequency). At the same time, we determined that label TIME includes
semantic links that correspond to the definitions as when, by coincidence, to /
from time to time, the code DUR provides links that define the duration of the
condition or action (how long), ATC FREQ but frequency (how often, how many
times).

In the labeling of multi-word units are set PDT maintain a tag DPHR (Dependant
part of phraseme), which was renamed the phrase. We denote phraseological
Relationship Type: Phrase _go on the nerves_, _wrapped in silence_ Phrase etc.
* We in the Slovenian range tag is stacked legends MWPRED (Multi-word
  predicate), which was used for the labeling of communications and the
  infinitive of the verb phase, for example. MWPRED _started to cry_, and to
  link the infinitive and the modal verbs, for example. It will _be able to
  convince_ MWPRED, _unable to read_ MWPRED _not want to deprive_ MWPRED.
  Federations verb and predicator attribute not marked with a special tag (PDT
  on this link tag used COMPL – predicative complement)
* RESLT
* For labeling modal verb phrases, we introduced the mark modal, for example.
  _It should be_ MODAL _could be_ modal.  Federations verb meaning weakness and
  a noun or noun phrase (in PDT code CPHR, nominal part of the complex
  predicate) at this stage does not distinguish between the roles
  polnopomenskih same verbs. This means that it does not establish the
  difference between _give name_ (PAT), _not have the purpose_ (PAT) - verbs
  with weakened meaning - and _give the ball_ (PAT), _have a friend_ (PAT) -
  where there is a relationship of verb and object set.  The distinction
  between the semantic impaired verbs as components of verbal communication,
  see. yet have at its disposal, bear in mind, and verbs as licensor
  participatory role have money, will come to the fore in identifying
  multi-word units, which provided for an independent level of labeling the
  training corpus. This labeling is currently taking place within the framework
  of the COST action PARSEME as part of the overall mission to identify
  multi-word units in different languages. The project provides for the first
  stage of determining the format and criteria for the identification of
  multiword units below manually Signs of about 11,400 units of the training
  corpus.

Total marks are based on PDT determine the criteria for recognizing them. In
Table 4, in addition to a set of codes and Slovenian names mentioned them yet
brief descriptions of participatory roles.

The Slovenian was set out of 34 marks in the PDT maintained 22 marks (+ 2 for
the verb phrase), but analysis has shown that in some borderline cases need
more semantic definitions. Below we describe some of the key semantic
relationships, which require a more precise definition of semantic tags, both
in terms of conceptual and formal (syntactic and morphological) criteria, as
well as potential additional / new participatory role.

## 3.1 Competitive participatory role / semantic relations

Individual relationships between the participants from the perspective of
determining the appropriate participatory roles often compete. Competitive
connections comes both inside delovalnikov, for example. between incumbents and
affected: Event in Ankaran (ACT) has been a dramatic accident (PAT), as well as
intra optional relationships, for example. the spatial (LOC) and causal
(cause) or time (TIME) participatory roles: choking in numbers (LOC  CAUSE),
minister at one of the meetings (TIME  LOC) said, and the delovalniškimi and
optional participants, for example. the spatial expressed delovalnikih:
hospital (LOC  ACT] will be introduced, on which more below.

Acting relationship - affected occurs above all in regard to syntactic
relationships, for example. the distinction between passive and active
buildings, where we distinguish between two morphosyntactic ability to express
trpnosti, ie. with a free verbal morpheme - a / Did you and the stakeholders in
-n / -t, and between passive and active feedback possessive syntactic
structure. On this basis, we are dealing with situations like. positive
discrimination (PAT) is referred to as a privilege as passive, as examples of
events (ACT) have been held as an active feedback possessive syntactic
structure. In passive buildings, we pay attention to the fact that they remain
participatory role in active and passive syntactic structure overlays, for
example. thing (PAT) is a bit more complicated - who (ACT) complicate things
(PAT); positive discrimination (PAT) is referred to as a privilege - who (ACT)
indicates positive discrimination (PAT) as a privilege.

In the semantic relationships between delovalniškimi optional and participants
compete particular prepositional delovalniško-spatial semantic connections
  * e.g. like. `LOC -> ACT/REC/RESLT`: hospital (`LOC -> ACT`) are introduced;
    cause inconvenience to the television (`LOC -> REC`); work in a company
    (`LOC -> RESLT`), and `GOAL -> RESLT/REC`: it was harvested in a good mood
    (`GOAL -> RESLT`); Nokia's in the pack (`REC -> GOAL`) supplied charger.
About spatially expressed aktantih occurs when the verb meaning does not
provide the spatial component, as envisaged by example. verbs of motion to
come, go, etc. KAM, but the activity, for example. in elementary school
(ACT) preparing for Fujifilm (ACT) are posted on the center (ACT) has begun.
Aktanti in these cases are actually metonymically expressed delovalniki, while
the verb valency pattern provides a potential okoliščinsko udeležensko city,
which in some cases actually expressed, for example. in elementary school in
Bistrica (ACT) are prepared.

## 3.2 »Manjkajoče« udeleženske vloge/pomenska razmerja

In the case of verbal meaning, which provide comprehensive valency pattern,
such as verbs of communication, sensing, thinking, etc., For example. `Who-ACT
said/stated what-PAT to whom-REC about what-RESLT` depending on the possibility
of attribution of the same participatory role of only one participant is a need
for a more detailed breakdown of meaningful participatory roles.

This includes differentiation between competing optional participatory
roles, we have already mentioned in the previous chapter. In sentences like:
the evening's matches will be played; do not fall in the war; one of the
meetings said the participants underlined attaches to either the time (TIME) or
spatial (LOC) participatory role. Since taking valency pattern may provide more
temporal or spatial actors like. The sentence in the giant slalom at the Junior
World Cup in Pohorje, opens up at least the empty space to "event" (a race war,
meeting SP), as for example, provides for a system FrameNet (EVENT), which
combines both spatially and temporally semantic component. Similarly, playing
the role of participatory mode (MANN) and space (LOC) in cases such as:
information the electrode cable lead to the device; the fact that he led the
girl, offering the possibility of more specialized participatory roles, for
example. "Trail" (PATH), which also has a system FrameNet.

# Tools and format of labeling the training corpus for Slovene

Semantic tagging corpus we used the tool SentenceMarkup, which was primarily
developed for the syntactic annotation of Slovene (Dobrovoljc et al., 2012).
The tool was adapted for the purposes of semantic labeling so that we have
added an independent and at the same time interoperable semantic level (Figure
3).

Since we want to program in the future to upgrade to different types of
labeling (eg., Labeling multiword units), it is important to ensure the
greatest possible autonomy in changing the set of markings on the multiple
levels and options as separate and combined search by type of links to
syntactical and other levels of labeling. The program allows you to export data
in tabular and XML format, in addition to data on the type of connection on
each level tagging also contains information on lemma, MSD tag and allows
display of the entire sentence.

# 5 Conclusion and future work

In the current phase of semantic tagging of the training corpus, our aim was to
establish a sufficiently robust and at the same time optimal set of
participatory roles in Slovene. Tags and the criteria for their denoted were
determined on the basis of existing models označevalskih where we derived in
particular from PDT in individual decisions but we also considered the
solutions in the system FameNet and others.

In the process of manually labeling the training corpus are proceeding from the
fact that it does not dispose of a dictionary of verb valency in English, they
tended to participatory selection of applications that enable consistency of
marking, taking into account both syntactic and semantic level. When playing
semantic tags they are therefore trying to establish a far more clear
distinguishing criteria, while we have proposed additional participatory tags
that resolve borderline cases. In the future, our intention is based on an
analysis of semantic links to determine the degree of obligatornosti both
delovalniških optional as well as participatory roles.

In the next phase we intend in the context of a bilateral project between
Slovenia and Croatia to establish a system for labeling of semantic roles that
will be assigned to existing syntactic dependency links in teaching corps,
which are used for machine learning algorithms for both languages. Sample of
the Slovenian and Croatian teaching corps will be marked with compatible labels
on them they will be also carried out the first experiments of automatic
labeling of supervised machine learning. The project will be produced common
guidelines for the labeling of semantic roles in Slovenian and Croatian, a tool
for the identification of semantic applications for markers on both sides,
exemplary teaching corpus for Slovene and Croatian and an experimental tool
that uses machine learning for automated labeling of semantic roles.

Part of the corpus ssj500k November 2015 was included in the collection syntax
nurseries Universal dependencies (UD) (Nivre et al., 2016). This allows the
system to marking semantic roles developed in the existing system JOS, transfer
and check in system, UD, which is one of the tasks for the future. Transfer
makes sense from the standpoint of compatibility between the Slovenian and
Croatian labeling system in the framework of the bilateral project, because
Croatia nursery uses tags UD
