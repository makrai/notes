TyDiQA: ABenchmark for Information-Seeking QA in Typologically Diverse Langs
JH Clark, EChoi, MCollins, DGarrette, TKwiatkowski, VNikolaev, JPalomaki
TACL 2020

# Abstract

* 11 typologically diverse languages with 204K question-answer pairs. The
  languages of TyDiQA are diverse with regard to their typology
* example-level qualitative linguistic analyses of observed language phenomena
* realistic information-seeking task and avoid priming effects
* data is collected directly in each language without the use of translation

# 1 Intro

* World Atlas of Language Structures (Comrie & Gil, 05; Dryer & Haspelmath, 13)
  * 2600 languages by 192 typological features including phenomena such as 
    word order, reduplication, grammatical meanings encoded in morphosyntax,
    case markings, plurality systems, question marking, relativization
* differences in the availability of monolingual and parallel translation data,
  how standardized the writing system is
  * variable spacing conventions (e.g. Thai)
* we present the first public largescale multilingual corpus of info-seeking QA
* Our goals in doing so are:
  * building high-quality QA systems in roughly the world’s top 100 languages
* We
  * describe the typological features of TyDiQA’s languages
  * glossed examples of some relevant phenomena drawn from the data
  * open-source baseline model and a public leaderboard with a hidden test set
    * intrinsic and extrinsic analyses on a challenging task to spark progres

# 2 Task definition

* question along with the content of a Wikipedia article, and
* requests that it make two predictions:
  * Passage Selection Task: Given a list of the passages in the article, return
    either the index of the passage that answers the question or NULL
2. Minimal Answer Span Task: Given the full text of an article, return one of
    * the start and end byte indices of the minimal span that completely answrs
    * YES or NO if the question requires a yes/no answer and we can draw a
      conclusion from the passage;
    * NULL if it is not possible to produce a minimal answer for this question

# 5 Typological diversity

* many language families
* diverse data characteristics that are relevant to modeling
* Approaches that rely too heavily on high-quality MT will fail to generalize
* we select
  * some languages that have parallel training data (e.g.  Japanese, Arabic)
  * some that have very little parallel training data (e.g. Bengali, Kiswahili)

## 5.1 Discussion of Languages

### Arabic: a Semitic language with

* short vowels indicated as typically-omitted diacritics.  Arabic employs a
* root-pattern system: a sequence of consonants represents the root; letters
* substantial affixation for inflectional and derivational word formation
* grammatical number: singular, dual (two), and plu13 ral (Ryding, 2005)
* Clitics are common (Attia, 2007)

### Bengali: a morphologically-rich language. Words may be complex

* inflection, affixation, compounding, reduplication, and the idiosyncrasies of
  the writing system including non-decomposable consonant conjuncts. (Thompson,
  2010)
* letters used to write consonant clusters such as /pr/ or /rv/. Although
* letters are formed by
  * using a simple consonant with the inherent value vowel "a" (as with "k"
    Brahmi, pronounced "ka" in) Brahmi), or by
  * combining a consonant with an vowel in the form of a diacritic (as with
  * creation of more sophisticated sounds (as with "kya" Brahmi, formed with
    the consonants k Brahmi and y Brahmi assembled vertically).[1] Conjuncts
* often used with loan words. Native words typically use the basic consonant

### Finnish: a Finno-Ugric language with rich inflectional and deriv

* Word stems often alter due to morphophonological alternations (Karlsson, 13)
* A typical Finnish noun has approximately 140 forms and a verb about 260 forms
  (Hakulinen+ 2004)

### Japanese

* mostly non-configurational language in which
  * particles are used to indicate grammatical roles though the
  * verb typically occurs in the last position (Kaiser+ 2013). Japanese uses
* 4 alphabets: all of these are in common usage and can be found in TyDiQA
  * kanji (ideograms shared with Chinese),
  * hiragana (a phonetic alphabet for morphology and spelling),
  * katakana (a phonetic alphabet for foreign words), and the
  * Latin alphabet (for many new Western terms);

### Indonesian: an Austronesian language characterized by

* reduplication of nouns, pronouns, adjectives, verbs, and numbers (Sneddon+
  2012; Vania and Lopez, 2017), as well as
* prefixes, suffixes, infixes, and circumfixes

### Kiswahili: a Bantu language with complex inflectional morphology.  Unlike

* inflections, like number and person, are encoded in the prefix (Ashton, 1947)
* Noun modifiers show extensive agreement with the noun class (Mohamed, 2001)
* pro-drop language (Seidl and Dimitriadis, 1997; Wald, 1987).  Most semantic
* English as prepositions are expressed in verbal morphology or by nouns (Wald,
  1987)

### Korean: an agglutinative, predicate final language with a

* rich set of nominal and verbal suffixes and postpositions
* cases
  * Nominal particles express up to 15 cases
  * including the connective ‘and’/‘or’—and
  * can be stacked in order of dominance from right to left
* Verbal particles express a wide range of tense-aspect-mood, and
  * ‘sentence-ender’ for declarative, interrogative, imperative, etc.  Korean
* rich system of honorifics. There is
* extensive discourse-level pro-drop (Sohn, 2001)
* script is non-Latin featural alphabet arranged in syllabic blocks
  * White space is used in writing, but prescriptive conventions for spacing
    predicate-auxiliary compounds and semantically close noun-verb phrases are
    commonly flouted (Han and Ryu, 2005)

### Russian: an Eastern Slavic language using the Cyrillic alphabet. An

* inflected language, it relies on case marking and agreement to represent
* singular, paucal, and plural number
* Substantial fusional morphology (Comrie, 1989) is used along with
* three grammatical genders (Corbett, 1982),
* extensive prodrop (Bizzarri, 2015), and
* flexible word order (Bivon, 1971)

### Telugu: a Dravidian language

* Orthographically, consonants are fully specified and vowels are expressed as
  diacritics if they differ from the default
* agglutinating, suffixing language (Lisker, 1963; Krishnamurti, 2003)
* Nouns have 7-8 cases, singular/plural number, and three genders
* productive process for forming transitives and causative forms (Krishnamurti,
  1998)

### Thai: an analytic language despite very infrequent use of whitespace:

* analytic: uses helper words rather than morphology to express gramm rels
* Spacing in Thai is usually used to indicate the end of a sentence but may
  also indicate a phrase or clause break or appear before or after a number
  (Dānwiwat, 1987)

## 5.2 A linguistic analysis

* computational linguistics and its roots in linguistics,
  * While CL has remained informed by linguistics, practitioners often express
    a disconnect:
  * descriptive linguists focus on fascinating complex phenomena, yet datasets
    that computational linguists encounter often do not contain such
* TyDiQA is intended to help bridge this gap:
  * we have identified and annotated examples from the data that exhibit
    linguistic phenomena that
    * typically not found in English and
    * potentially problematic for NLP models
* Figures
  2.  interaction among three phenomena in a Finnish example,
  3. non-trivial word form changes due to inflection in Russian
  * Arabic also exemplifies many phenomena that are likely to challenge current
    * spelling variation of names (Figure 4),
    * selective diacritization of words (Figure 5),
    * inconsistent use of whitespace (Figure 6), and
    * gender variation (Figure 7)

# 6 A quantitative analysis 8

## 6.1 Question analysis

* comparison between the English question types found in TyDiQA and SQuAD in
  * Notably, TyDiQA displays a more balanced distribution of question words

## 6.2 Question-prompt analysis

* how effectively the annotators followed the question elicitation protocol of
* 1–2 words of overlap with the prompt (typically an entity or [a key]word)
  * none of the questions were answered by the prompt, as requested. Since
* questions often have less lexical overlap with their answers than the prompts

## 6.3 Data quality

# 7 Evaluation 9

## 7.1 Evaluation measures

###NULL handling: TyDiQA is an imbalanced dataset in terms of NULL

* due to differing amounts of content in each language on Wikipedia

###Passage selection task: For questions having a

###Minimal span task

## 7.2 An estimate of human performance

## 7.3 Primary tasks: Baseline results

# 8 Gold passage: A simplified task

## 8.1 Gold passage lexical overlap

## 8.2 Gold passage results

# 9 Recommendations and future work 12

* research directions where this data will allow new boundaries, including:
  * studying the interaction between morphology and question-answer matching;
  * evaluating the effectiveness of transfer learning
  * the usefulness of machine translation in question answering
    for data augmentation and as a runtime component, given varying data scenar
  * studying zero-shot QA
    by explicitly not training on a subset of the provided languages
* answer [to] questions often has simply not been written down in many langs

# 10 Conclusion 12
