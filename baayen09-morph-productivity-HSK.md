Corpus linguistics in morphology: morphological productivity
R. Harald Baayen
in Corpus linguistics. An international handbook, 2009

# 1. Morphological productivity 899

# 2. Theoretical frameworks

* in probabilistic paradigmatic morphology
  productivity not crucially depends on regularity
* schemas, constructions, and local generalizations
  (Albright/Hayes 2003; Baayen 2003; Bybee 2001; Dabrowska 2004)
* morphological productivity resulting from a great many factors
  e.g. experience with the words of her language, memory capacities, her
  conversational skills, her command of the stylistic registers,
  knowledge of other languages, her communicative needs,
  personal language habits and those of the people with which she interacts
* Corpora to explore how productivity varies across
  * registers, written versus spoken language, social and geographical space,
    and even time
  * Corpus-derived measures and lexical processing in the mental lexicon

# 3. Measuring productivity 6

* Several corpus-based measures (Baayen 1992,1993; Baayen/Renouf 1996)

## 3.1. Mathematical formalizations of productivity

* realized productivity
  * the size of the morphological category,
* expanding productivity
  * the rate at which a morphological category is expanding,
  * oriented to what is expected for the near future
  * estimated by the number of hapax legomena in the category divided by the
    total number of hapax legomena
  * an estimate of the contribution to the growth rate of the vocabulary
  * refered to as the hapax-conditioned degree of productivity (Baayen 1993)
* potential productivity
  * the extent to which the market for a category is saturated
  * The ratio of hapax legomena in a given morphological category
    to the total number of tokens in that category
  * Figure 1. The dynamics of vocabulary growth. The
    * horizontal axis displays corpus size in tokens (N), the
    * vertical axis displays the number of types observed
    * Potential productivity is defined as the asympt slope
  * diachrony
  * A corpus as a (simplified) model of diachrony
  * In psycholinguistics, estimates of age of acquisition often have superior
    predictivity for lexical processing compared to synchronic frequency counts
* An alternative computational method for estimating the growth rate is based
  on the deleted estimation method of Jelinek/Mercer (1985) !
  * Nishimoto (2003) shows that it obtains similar productivity rankings
  * Nishimoto, Eiji (2003),
    Measuring and Comparing the Productivity of Mandarin Chinese Suffixes.
    Computational Linguistics and Chinese Language Processing 8, 49⫺76
* in All these productivity measures only those words in which a given
  morpheme was the last are taken into account
  e.g. _helpfulness_ is not counted as a member of -ful
  * Gaeta/Ricca (2005) have shown that similar rankings are obtained for counts
    excluding or including words that have undergone further word formation

## 3.2. Interpretation and validation 10

### 3.2.1. Realized productivity 12

### 3.2.2. Expanding productivity 14

### 3.2.3. Potential productivity 16

* e.g. suffix for creating agent nouns in Dutch
  * unmarked is ER (GEEF-ER, ’giver’),
    * greater realized and expanding productivity
  * female is STER (GEEF-STER, ’female giver’)
    * the greater potential productivity
  * experimental study validating the potential productivity
    * Baayen (1994b)
      * subjects were asked to generate many words with a specified affix
      * they produced many more neologisms in STER than in ER or VER
    * correlated with parseability (Hay 2003)
    * visual lexical decision latencies (Wurm/Aycock/Baayen 2006)
* A closely related measure for potential productivity is
  * the ratio `I = S/V(N)` of
    the estimated size `S` of the category in an infinitely large corpus and
    the observed number of types in a corpus of size N
  * Rough estimate of S: the finite Zipf-Mandelbrot model (Evert 2004)

# 4. Forces shaping productivity 18

* two factors: societal factors and processing constraints

## 4.1. Productivity in the speech community

* speakers with different backgrounds and varying communicative goals
* stylometry (Burrows 1992)
  * individual writers develop their own characteristic speech habits
* morphological categories might be more productive in some registers
* needs of speech communities and groups of specialists therin (Clark, 1998)
  change over time
  * a domain with rapid innovation or with slow or little innovation

### 4.1.1. Register and productivity

### 4.1.2. Productivity through time 23

from the perspective of the changing needs of society

## 4.2. Productivity and processing constraints in the mental lexicon 26 911

lexical, sublexical, and supralexical probabilities

### 4.2.1. Productive and unproductive: an absolute distinction?

### 4.2.2. Processing constraints 29

* exemplar-driven analogical generalization underlies both unproductive
  and productive rules
* frequency of the base relative to that of the derived word
  * there are complex words that are more frequent than their bases
    (_illegible_)
  * the greater the ratio, the greater the likelihood of
    own memory trace and simplified phonotactics
  * rule-driven processing will be more important for formations [that are
    much less frequent than] their constituents
  * the proportion of types in a morphological category
    for which the base frequency exceeds the frequency of the derivative
    is positively correlated with
    the logarithmic transform of its potential productivity (P)
* junctural phonotactics:
  * the probability of the sequence of sounds
    spanning the juncture between its parts such as NH in INHUMANE
  * an affix is more likely to be an independent unit in speech production
    if it tends to create low-probability junctural phonotactics
  * In comprehension, these constituents are easier to parse out, so
    affixes that create such words are more productive (Hay 2003...)

### 4.2.3. Conspiracies 33 914

* see the last paragraph of this section (sec.~4)
* Relative frequency and junctural phonotactics are involved in two
  correlational conspiracies

#### conspiracy 1

* the strong intercorrelations of all measures of productivity,
  measures for junctural phonotactics,
  measures for relative frequency and parsing, and
  lexical statistical measures such as Shannon’s Entropy
* this correlational structure has two PCA dimensions (Hay/Baayen 2003)
  1. measures that guage mér how affixes are used against the backdrop of
     the corpus as anchor point for normalisation
    * Realized productivity, expanding productivity,
      entropy (information load),
      the count of formations with low-probability junctural phonotactics, and
      the estimates of the number of types parsed
      all enter into strong positive correlations
    * past and present usefulness of an affix
    * onomasiological usefulness in society, its
      referential functionality (Kastovsky 1986; Baayen/Neijt 1997), and
      register variation
  2. measures that are normalized with respect to the individual
     morphological categories
    * Potential productivity, the
      estimated proportion of types in the category that are parsed, and the
      frequency of the base (averaged over the types in the category) enter
      into strong positive correlations
    * strong negative correlations with the
      * frequency of the derivative (averaged over the types in the category)
      * probability of the juncture (similarly averaged)
    * This dimension guages the strength of the morpheme in terms of
      * the proportion of words in the corresponding morphological category
        to which the morpheme attaches
      * rather than through the memory traces of the derivatives

#### conspiracy 2

* processing constraints, grammatical constraints, and memory constraints
* English suffixes can be arranged in a hierarchy
  predictive for the order in which these suffixes can occur (Hay/Plag 2004)
* predictable from measures such as potential productivity and the
  proportion of types in the morphological category that are parsed (the
  second dimension identified above for the first conspiracy)
* illustrated in Figure 4 for potential productivity
  As the log-transformed potential productivity increases,
  the word’s rank increases as well
* the hypothesis of complexity-based ordering (Hay 2003, 2004)
  * suffixes that are more productive,
    and that function more as processing units
    must follow less productive suffixes
* two questions
  * the goal of word-formation: the creation of new words
  * why comprehension would benefit from this
* steps towards an answer to question 2
  * reminiscent of Bybee (1985) for inflection
    * more inherent inflection (tense and aspect marking, for instance)
      tends to be realized closer to the stem or root than
      more contextual inflection (person and number marking, for instance)
    * more (formally and semantically) predictable formatives are 
      peripheral to the less predictable and more fusional exponents,
      just as in derivation the less productive and often semantically less
      predictable suffixes are closer to the stem
    * semantic transparency is also at issue (Hay/Plag 2004)
  * a more careful consideration of the role of frequency in morph proc
    * relative frequency primarily affects low-level processes
      at the level of form (Hay/Baayen 2002, Hay 2003)
    * word frequency is more strongly correlated with measures of a word’s
      meaning than with measures of form (Baayen/Feldman/Schreuder 2006),
    * relative frequency (and derived measures such as parsing ratios) also
      reflects the relative complexities of compositional processes at the
      level of semantics
    * This explains the conspiracy of processing and grammatical constraints
  * productivity is inversely proportional to the
    likelihood of serving as input for further word formation
    (Krott/Schreuder/Baayen 1999)
* potential productivity is part of a correlational conspiracy of
  * low-level perceptual factors
    (as evidenced by junctural phonotactics and relative frequency)
  * factors pertaining to morphological processing
    at the levels of form and meaning
    (as evidenced by relative frequency and selectional restrictions), and
  * factors arising at the interface of memory and onomasiological needs

# 5. Concluding remarks 38 917

* new insights have been obtained by combining
  historical, stylistic, onomasiological, and cognitive factors
* fields that await exploration
  * sociolinguistic variables or
    the role of word formation in communal lexicons (Clark 1998)

# 6. Literature (a selection)
