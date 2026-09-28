Temperature in symbolic understanding
Andras Kornai, Fable Claude Fable 5.1
September 2026 lingbuzz/010349
 
# Abstract

* The same copular syntax that yields 
  * the tradition's favorite truth condition, _snow is white_, yields 
  * the animal rights movement's favorite slogan, _meat is murder_. We argue
* the difference between the two lives in a single parameter of the
  _evaluation_, temperature, and that the term is 
* not a metaphor: the parameter so named is literally the one that 
  * what Harmonic Grammar and maximum entropy phonotactics fit to gradient
    acceptability data.
  * attention mechanism of transformers runs at the fixed temperature
    $1/\sqrt{d_}$, and 
  * infer time: deployed language models expose a second instance of the same
    parameter to their users as the sampling knob.
* Grammaticality stars, analytic truths, thematic role assignment, anaphora
  resolution, and rhetorical force are 
  readouts of one Gibbs competition at different operating points. We work
* our running examples
  * _meat is murder_ and its political cousins _property is theft_ and _taxation
    is theft_, and on 
  * anaphora resolution in _he beat him_ discourses and Winograd schemas. 
* two sites of the parameter
  * A small experiment on a deployed model 
    tells the two sites of the parameter apart: 
  * the sampling knob leaves the reading of _meat is murder_ untouched at every
    setting, 
  * the evaluation instruction flips it, and 
  * the model's refusal, when it refuses, localizes at the one taught boundary
    the analysis predicts.
* A self-contained appendix develops the machinery -
  Gibbs distributions, annealing, energy landscapes, softmax, regularization --
  assuming nothing beyond linear algebra and one-variable calculus.

# 1 Intro

* The minimal pair is evidently not powered by syntax but by lexical info. 
  * The mainstream syntacto-semantic approach concludes, after a great deal of
    computation, that snow' ⊂ white' and meat' ⊂ murder' 
  * One standard response is to declare (1b) beyond the domain of grammar –
    metaphor, rhetoric, pragmatics. We hold instead with 
  * nL Wilks (1978): usage of this kind is the norm of ordinary language, not
  * other standard response accommodates each extension by a fresh posit – a
    * second lexical entry,
    * an additional sense,
    * a type-shifting rule (see Kennedy 2011 for a careful execution of this)
    * We take the opposite, monosemic stance: 
      if a single form is used, the burden of proof falls on those who wish to
      posit separate meanings (Ruhl, 1989).
* we: what separates the literal from the extended, 
  the categorical from the gradient, and the assertoric from the rhetorical, is
  a single parameter of evaluation which we call temperature. Underneath the
* compos vs eval: claim runs a division we maintain throughout: 
  * composition builds vectors – a sentence, like a word, is a point in
    representation space – while 
  * scalars arise only in evaluation, so that 
    ie traditional truth values are just the cold shadow of the sentence vector,
    not its meaning. Run cold over the lexicon as it is taught, (1a) is true and
* (1b) is simply false. But the falsity is manufactured at exactly one point:
  the restriction of murder to human victims.
  * This restriction is installed by socialization, and 
    the naive lexicon never had it – to the child, killing is killing, whatever
    the victim. Run cold over the naive lexicon, (1b) is as generically true as
    (1a). 
  * What the slogan asks for is the temporary lifting of that one restriction,
  * warmth ~> a restriction can be lifted without being unlearned.  Once it is
    lifted the rest is ordinary implication: if murder is to be avoided, as most
    people would instinctively agree, and meat is murder, it follows without any
    special stipulation that meat is to be avoided. 1 
* The syntactic framework in which this division of labor is embedded – a
  * ‘bleached’ syntax whose entire contribution is a small set of linking
    instructions, deltas, over 
    lexical statics in the sense of Kornai (2023) – is 
    developed in a companion paper, _The bleaching of syntax_. Nothing below
    depends on its details beyond what is restated in place.
* temperature is meant literally.
  * When a linguist hears the word applied to grammar, the natural assumption is
    that a suggestive analogy is being drawn from thermodynamics, to be cashed
    out, if at all, in some future theory. The assumption is wrong, and Section
    2 together with Appendix A is designed to discharge it.
* temperature has been in linguistics for decades under other names: 
  * Harmonic Grammar scores candidates by an energy function (Smolensky, 1986),
  * Optimality Theory is its cold, strictly ranked limit (Prince & Smolensky 93)
  * maximum entropy phonotactics (Hayes and Wilson, 2008) is the Gibbs
    distribution, by that name, fitted to corpus data.
  * in the attention mechanism of the transformer (Vaswani+ 2017), and
  * exposed to every user of a deployed language model as the sampling
    “temperature” – on the output side, as Appendix A.5 notes. 
  * One equation covers all of these, and 
  * the traditional symbolic computation of grammaticality – a derivation that
    returns a star or nothing – is its cold case, the limit in which the
    competition keeps only its best candidate, or the best few when they tie.
  * whatever cannot be put in the form of the one equation does not get to share
    the thermostat.

# 2 the one equation and its cold limit: ungrammatic stars & them role assign

* Suppose a system must settle on one of a finite set of candidates x – 
  * eg set: readings of a sentence, participants for a role, antecedents for a
    pronoun – and 
  * each candidate carries a score s(x). 
  * The Gibbs distribution at temperature T assigns the candidates probabilities

    P T (x) = e^{s(x)/T} /Z T,      (2)

  * Z T the normalization over the candidate set. 
  * As T → 0 the distribution piles all its mass on the best candidate: zero
    * argmax, deterministic choice, and the odds against every non-optimal
      candidate diverge – which is, we contend, exactly the behavior linguists
      record with the ungrammaticality star. 
  * Acceptability is pervasively gradient and predictable from suitably
    normalized model probabilities (Lau, Clark, and Lappin, 2017), once
    probability is no longer conflated with frequency of attestation (Pereira,
    2000); the categorical judgments of the tradition are recovered as the cold
* Appendix A develops (2) from scratch and traces its career through 
  simulated annealing, Hopfield networks, Boltzmann machines, Harmonic Grammar,
  and the transformer.
* The cold limit is not merely/it also
  * an idealization of judgment data; it also 
  * describes familiar grammatical selection mechanisms. 
  * Pān.ini defines the instrument case by a superlative: the karan.a is
    sādhakatamam, ‘the most effective means’ (As.t.ādhyāyı̄ 1.4.42), just as the
    karman is ı̄psitatamam, ‘the most desired’ (1.4.49). A superlative over
    candidate participants is an argmax; an 
  * argmax is the zero-temperature limit of a softmax; and 
    a softmax over scored candidates is exactly what the attention mechanism
    computes (Appendix A.5).
  * Kāraka assignment is a competition run cold: the candidates in (2) range
    over the clause’s participants, and 
  * the score is supplied by the proto-role entailments of Dowty (1991), with
  * the subject-selection hierarchy A > I > O of Fillmore (1968) as the form
    book of expected winners.
  * _The key opened the door_ is the instrument winning in the absence of an agt
  * _*John and the key opened the door_ is an address clash – coordination
    distributes a single linking instruction over conjuncts that bind different
    addresses (cause vs. ins) in the verb’s decomposition – zeugma, run cold.
* Two points deserve emphasis before we turn the dial up
  * assignment runs cold everywhere: the competition must end in an argmax,
    which is why grammar is fast, automatic, and decisive in every language.
    Warmth enters not in the assignment of structure but in the evaluation of
    what has been assembled.
  * the claim of literalness. When kāraka assignment is construed as a softmax
    competition, no analogy is being drawn: 
  * attention is equation (2), the 
  * 1/\sqrt d divisor in its defining formula is a fixed temperature (App A.5),
  * maxent grammar has already estimated the parameter; the 
  * physicist, the phonologist, and the transformer engineer are using one
    equation, and this paper merely declines to pretend otherwise.

# 3 eg meat is murder : what runs cold, what requires warmth, 
and why the slogan is three words long. 

* The statics of meat contain, as preconditions, the production of the thing
  * meat is flesh taken for the table, and – humans not being carrion-eaters –
  * taken means killed. Meat requires killing is therefore available
  * murder decomposes, equally cold, as killing plus wrong. Now run the chain:
    meat requires killing; were that killing murder, meat would require a wrong;
  * what can only be had through a wrong is itself wrong – the transmission
  * deduction at every step but one, 
    the step across the person/animal boundary in the victim slot of murder.
* The restriction of victims to persons is not part of the naive entry: 
  * the child who learns where meat comes from reacts with distress before any
    rhetoric has reached them (Bray+ 2016); 
    some hold to that reaction against the practice of their own family, and on
    explicitly moral grounds (Hussar and Harris, 2010). The child is then taught
    * restriction: like the one that whales are not fishes. 
  * Two things are taught, in fact, and the slogans of Section 4 will need both:
    that the victim slot of murder admits persons only, and that 
    killing for food falls on the legitimate side of a line that killing for
    other ends does not.
  * The lexicon is conservative: an entry records the typical – every donkey has
    four legs is true by definition, unfalsifiable by the odd lame donkey – and
  * entries are revised not by counterfactual pressure but by prevalence, the
    way Hungarian kocsi moved from ‘horse-drawn coach’ to ‘car’ when the motor
    variety became the prevalent one. Cold evaluation over the taught lexicon
    therefore fails the sentence at the two taught steps and at no other, and
    what the slogan requests is accordingly not a new crossing but the
    suspension of a taught one: as T rises, slaughter – adjacent to murder in
    every feature, since the naive entry never separated them – resumes the
    connection that socialization severed.
* Why this step and no other, if the thermostat is one? Because the barriers
  differ.
  * A single global T weakens every score gap at once, but 
    nL it weakens them in proportion, and 
    the gap at the taught restriction is the smallest in the chain: 
    the naive entry never separated slaughter from murder, and the restriction
    is a penalty attached to one candidate after the fact, not a distance built
    into the statics. 
  * The deductive steps – meat requires killing, murder requires a wrong – are
    gaps of a different order, and stay effectively cold at any T a hearer will
    tolerate. As T rises the lowest barrier is crossed first. 
  * This mechanism is the reason annealing works at all (Appendix A.2), and it
    * ie the first thing to melt is the most recently taught exception.
* rhetoric is cheap exactly where convention had to work hard, for the
  suppressed reading is still resident in the statics, and a three-word slogan
  suffices to reactivate it. Nor is the boundary in question an arbitrary one to
  lean on. 
  * who counts as one for the purposes of murder
  * The line around the person – is the most frequently redrawn line in the
    history of the lexicon
  * and every redrawing was, in its day, a prevalence-driven revision of a
    typicality default of the kind just described.
  * A slogan that pushes on [the lex] is pushing where the lexicon has given way
    before.  
  * Persuasion, on this account, is annealing in the metallurgist’s strict sense
    (Appendix A.2) – not the deposition of new material but 
    * the re-heating of a quenched arrangement so that it may resettle, the melt
      retained, or not, on cooling. Such revisions run in both directions and do
      cool into convention: 
  * eg _stone lions_ – clear negative cases of lion in any normal context –
    * admitted into the noun’s positive extension, 
      forced by the non-vacuity of the combination, now runs as effortless
      routine for any material name paired with any concrete sortal (Kamp and
      Partee, 1995); there 
    * the crossing was taught rather than untaught, and the 
    * nL same mechanism: prevalence-driven revision of typicality defaults, with
      the direction set case by case.
* The rhetorical force of meat is murder is the engineered gap between the
  temperature its form promises and the 
  temperature its content requires. 
  * The form is maximally cold: copula, generic subject, the very shape of
    taxonomy – the shape of _snow is white_, the tradition’s paradigm of
    * the paradigm arrives pre-cooled.
  * _Snow is white_ entered the tradition as the stock atomic sentence of Tarski
    (1944), and the formalization that came with it types snow as a name and the
    sentence as an atomic predication, so that the genericity the pair turns on
    – snow and meat are mass nouns alike, and both sentences are bare copular
    generics in the sense of Carlson (1977) – is hidden by fiat before
    evaluation begins. A compositional derivation that inherits the paradigm
    will accordingly separate the pair on the subject side, for a reason that
    has nothing to do with meat or murder. The content verifies only warm.
    Neither side of this gap is a matter of felt coercion, on pain of circularity.
  * ordinary morphosyntax: bare or generic subject, individual-level present
    copula, gnomic rather than episodic anchoring. 
  * The warm side has geometry: the E 0 retrieval value of (3b) at T = 0,
    taxonomic distance, or the overlap of the two regions’ supports in a
    sparse-feature basis (Bricken+ 2023). The hearer who runs the sentence cold
    gets falsity; the hearer who lets the neighborhoods touch gets the point;
    and the push one feels is the sentence daring its reader to warm up. 
    * Truth value, entailment, similarity, and uptake are not four analyses here
      but one vector read at four temperatures, the division of Section 1.
* climate and weather
  * morphosyntax fixes which forms promise cold readings – and register moves
    the setting wholesale, 
    * genericity marking, gnomic aspect, obligatory mood are so many published
      thermostat settingsthe 
  * mathematical register pinned near zero, legal drafting deliberately cold,
    poetry warm by convention. 
  * What a single utterance negotiates is the weather a local departure from the
    climate its form announces. 
  * The engineered gap of (1b) is in this sense doubly determined – 
    the copular generic is cold in the climate of English, and 
    the slogan asks for a heat wave.
* The borrowings, finally, are auditable. In a sparse-feature basis (Bricken+
  2023; Templeton+ 2024) the dimensions along which meat and murder overlap can
  be named and, if the hearer resists the rhetoric, disputed one by one; and the
  evaluation, unlike the parse, is deliberate multi-step inference, so the
  theory expects the parse of (1b) to survive ablation of the reportable
  workspace of Gurnee+ (2026) while its rhetorical uptake does not. The
  prediction is stated here because it marks the difference between an analysis
  and an allegory: the temperature story is testable in an architecture whose
  internals can be recorded, decomposed, and perturbed.

# 4 eg2 property is theft and taxation is theft
* the machinery measures rhetorical craft, not political merit. 

# 5 anaphora resolution – he beat him – and to Winograd schemas, arguing that
* the resolution is the same competition run over discourse. 

# 6 collects the claims. 

# The appendix is a tutorial for the working linguist

* assumed nothing beyond linear algebra and one-variable calculus; readers to
  whom Gibbs distributions, annealing, and softmax are familiar can skip it, and
  readers to whom they are not may prefer to read it first.
