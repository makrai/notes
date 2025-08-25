If beam search is the answer, what was the question?
Clara Meister, Ryan Cotterell, Tim Vieira
EMNLP 2020

# Abstract

* exact maximum a posteriori (MAP) decoding of neural language generators
  frequently leads to low-quality results. Rather,
* most SOTA results on language generation tasks are attained using beam search
  despite its overwhelmingly high search error rate. This implies that the MAP
* what are the properties we desire in text? which merits the question: if beam
* We frame beam search as the exact solution to a different decoding objective
  in order to gain insights into why high probability under a model alone may
  not indicate adequacy. We find
* beam search enforces uniform information density in text, a property
  * motivated by cognitive science
* We suggest a set of decoding objectives that explicitly enforce this property
  * exact decoding with these objectives alleviates the problems encountered
    when decoding poorly calibrated language generation models
* we analyze the text produced using various decoding strategies and see
  * in our neural machine translation experiments, the extent to which this
    property is adhered to strongly correlates with BLEU

# 1 Intro

* beam search
  * As a simple search heuristic, beam search has been
  * used to decode models developed by the NLP community for decades. Indeed,
  * one of the few NLP algorithms that has stood the test of time: It has
  * a cornerstone of NLP systems since the 1970s (Reddy, 1977). As such, it
  * the natural choice for decoding neural probabilistic text generators—whose
    * where evaluating the full search space impossible (Kalchbrenner and
      Blunsom, 2013; Sutskever+ 2014; Vinyals and Le, 2015; Yin+ 2016). While
  * no formal guarantee that beam search will return— or even approximate—the
    highest-scoring candidate under a model, it has
  * proven merit in practice (Serban+ 2017; Edunov+ 2018; Yang+ 2019) and,
  * in neural machine translation (NMT), a shocking empirical finding has
    * almost invariably leads to better text than using exact search (or beam
      search with a very large beam size).  In fact,
    * Stahlberg and Byrne (2019) report that exact search returns the empty
      string in > 50% of cases,
      * This rate tends to decrease for larger models, although it is often
        still a considerable percentage.
      * showing that the success of beam search does (not) stem from
        * not from its ability to approximate exact decoding in practice, but
        * from a hidden inductive bias embedded in the algorithm
          * This inductive bias appears to be paramount for generating
            desirable text from neural probabilistic text generators.
    * several works explore this phenomenon (Murray and Chiang, 2018; Yang+
      2018; Stahlberg and Byrne, 2019; Cohen and Beck, 2019),
    * no one has yet hypothesized what beam search’s hidden inductive bias is
* We analyze the beam search blessing by reverse engineering an objective that
  beam search returns the exact solution for. Specifically,
  * we introduce a regularizer for the the standard (MAP) decoding objective
    for text generation models such that the exact solution to this regularized
    objective is equivalent to the solution found by beam search under the
    unmodified objective
  * Qualitative inspection reveals that our “beam search regularizer” has a
    clear connection to a theory in cognitive science—the uniform information
    density hypothesis (UID; Levy and Jaeger, 2007)
  * UID hypothesis: —subject to the constraints of the grammar—
    humans prefer sentences that distribute information (in the sense of
    information theory) equally across the linguistic signal, eg a sentence.
  * ie, human-produced text, regardless of language, tends to have evenly
    distributed surprisal
  * surprisal in information theory := negative log-probability
    => beam search has an interpretation as exact decoding, but
    with a UID-promoting regularizer that
    encourages evenly distributed surprisal in generated text
  * naturally leads to the development of several new regularizers that
    likewise enforce the UID property.
* Empirically, we experiment with our novel regularizers in the decoding of NMT
  * We first observe a close relationship between the standard deviation of
    surprisals—an operationalization of UID—and BLEU , which
    * suggests that high-quality text does indeed exhibit the UID property.
  * we find that even with exact search, our regularized objective leads to
    performance similar to beam search on standard NMT benchmarks.
  * Both of these observations are reflected in Fig. 1.
  * our regularizers alleviate the text-quality degradation typically seen when
    decoding with larger beam sizes
* We take all the above as evidence that our proposed explanation of beam
  search’s inductive bias indeed elucidates why the algorithm performs so well
  as a search heuristic for language generation tasks.

# 7 Related Work

* Neural probabilistic text generators are far from perfect; prior work has
  * they often generate text that is
    * generic (Vinyals and Le, 2015; Li+ 2016)
    * unnatural (Holtzman+ 2020)
    * and sometimes even non-existent (Stahlberg and Byrne, 2019). In the
* the beam search curse: using a larger beam size leads to worse performance
  * analyzed by a number of authors
    (Koehn and Knowles, 2017; Murray and Chiang, 2018; Yang+ 2018; Stahlberg
    and Byrne, 2019; Jean+ 2015; Tu+ 2016; He+ 2016; Cohen and Beck, 2019).
  * Many/other of these authors attribute the performance drop (as search
    becomes better) to
    * an inherent bias in neural sequence models to pefer shorter sentences.
    * the model architectures, or how they are trained
      (Cho+ 2014; Bengio+ 2015; Sountsov and Sarawagi, 2016; Vinyals+ 2017;
      Ott+ 2018a; Kumar and Sarawagi, 2019)
* regularized decoding objectives and modified training techniques proposed

# 8 Conclusion
