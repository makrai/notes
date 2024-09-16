Italian VerbNet: A Construction-based Approach to Italian Verb Classification
Lucia Busso, Alessandro Lenci
LREC 2016

# Abstract

* inspired by
  * Levin (1993) and VerbNet (Kipper-Schuler, 2005)
  * constructionist framework (Goldberg, 1995; 2006) and is
  * distribution-based. It is also semantically characterized by a link to
  * FrameNet’s semantic frames to represent the event expressed by a class
* maintain the hierarchic “tree” structure and monotonic nature of VerbNet’s
  * where possible, the original names (e.g.: Verbs of Killing, Verbs of
    Putting, etc.) [for compatibility]
* problems intrinsic to the original classifications, such as the role of
  argument alternations, here regarded simply as epiphenomena, consistently
  with the constructionist approach

# 1 Introduction

* lexical semantics, computational linguistics, cognitive sciences etc
  (Pinker, 1989; Jackendoff, 1990; Levin, 1993;
  Dorr, 1997;
    “Large‐scale dictionary construction for foreign language tutoring and [MT]
  Merlo and Stevenson, 2001)
    "Automatic Verb Classification based on ... Distribution of Arg Struct" CL
* [extensions to Levin (1993),] especially Korhonen and Briscoe (2004)
* translate or adapt [VerbNet] in other languages
  * Merlo+ (2002) ... convert 20 Levin classes to Italian, obtaining
  * Recent ... are the ones of Estonian VerbNet (Jentson, 2014) and
    Brazilian Portuguese (Scarton & Aluısio, 2012)
  * comparable to VerbNet were also done for Spanish (Ferrer, 2004),
    German (Schulte im Walde, 2006), and Japanese (Suzuki &Fukumoto, 2009)
  * French, several studies and researches have been done
    * Saint-Dizier (1996) first produced a resource rather similar to VerbNet
    * automatic acquisition ... (Sun+ 2010). The
    * most complete work ... is however Pradet+ (2014)
* our aim has not been to directly translate VerbNet in Italian, but rather to
  develop a new, autonomous and independent classification for Italian verbs,
  accounting for Italian the syntactic peculiarities, and stemming from the
  integration of various resources and theoretical frameworks

# 3 Towards an Italian Verb Classification

* Constructionism
  * “[surface differences are] most naturally attributed directly to the
    different verbs and arguments involved.” (Goldberg, 2002 )
  * there are generally more numerous, broad and powerful generalizations
    surrounding particular surface forms than the ones that come from
    transformational and derivational accounts
  * each argument structure construction specifies its
    semantic and information‐structure properties
  * in striking contrast with earlier derivational accounts
    * deriving one variant of an alternation from another
* we also described each class associating it to the corresponding FrameNet
  conceptual frame (Baker+ 1998)
  * integrate characteristics of the so-called ontological taxonomies
    in an otherwise distributional one.
  * FrameNet’s roles (aka Frame Elements)
* classes [here have] a prototype-like structure (Rosch, 1973)

## 3.1. Methodology and Resources

* bootstrapped from ... the 1000 most frequent Italian verbs (Lebani+ 2014)
* monolingual Italian dictionary (Sabatini & Coletti, 2012, henceforth: S&C)
  * the only Italian dictionary that indicates the verb valency
* matched with ... the La Repubblica corpus (Baroni+ 2004)
* _..._
* corpus-based lexical resource on Italian argument structure
  LexIt (Lenci+ 2012)
* the Italian section (Cennamo& Fabrizio, 2013)
  of the typological database ValPal (Hartmann+ 2013)
  * part of the Leipzig Valency Classes Project, which aims to follow up
    the works by Levin (1993) for English and by Apresjan (1967) for Russian;
* We did not includ, a formal description of the event and of its temporal
  structure (which is instead present in VerbNet’s semantic description)
  * at least in this first phase of the proj

## 3.2. Class Description and Structure

* [verbs that all refer to] the movement of a Theme performed by an Agent or a
  Cause + verbs of KILLING [were] used to “tune” our method
* We
  * maintained the original L/V English name for the general description of the
    classes
  * named each subclass with its most prototypical Italian member
  * [subclasses do] not precisely correspond to a VerbNet _class_

## 3.3. Some notable differences with Levin classes

* Four different groups of mismatches
  1. subclasses that had to be eliminated from the Italian classification due
     to syntactic or semantic differences between the two languages
  2. classes that are individuated solely based on the presence of particular
     alternations. Since we have assumed, consistently with Construction
     Grammar, that syntactic alternations are merely epiphenomena, [such]
     classes have been excluded
  3. subclasses in the original model were transformed into classes in our
     system, or independent classes were reduced to subclasses
  4. new Italian subclasses e.g. Under the CHANGE OF POSSESSION class
