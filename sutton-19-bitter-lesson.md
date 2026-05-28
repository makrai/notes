The Bitter Lesson
Rich Sutton
March 13, 2019

* The biggest lesson that can be read from 70 years of AI research
* general methods that leverage computation are ultimately the most effective,
  and by a large margin. The ultimate reason for this is
* Moore's law, or rather its generalization of continued exponentially falling
  cost per unit of computation
* Most AI research has been conducted
  as if the computation available to the agent were constant
  * ie leveraging human knowledge would be one of the only ways to improve perf
  * sys to work in the way the researchers thought their own minds worked
  * domain knowledge
* over a slightly longer time than a typical research project,
  massively more computation inevitably becomes available
* only thing that matters in the long run is the leveraging of computation
* These two need not run counter to each other, but in practice they tend to
  * Time spent on one is time not spent on the other. There are
  * psychological commitments to investment in one approach or the other. And
  * the human-knowledge approach tends to complicate methods in ways that make
    them less suited to taking advantage of general methods leveraging comp
* examples of AI researchers' belated learning of this bitter lesson, and
  * computer chess,
    * the methods that defeated the world champion, Kasparov, in 1997, were
      based on massive, deep search
    * this was looked upon with dismay by the majority of
    * computerchess researchers who had pursued methods that leveraged human
      understanding of the special structure of chess
    * a simpler, search-based approach with special hardware and software
      proved vastly more effective, these
    * human-knowledge-based chess researchers said that ``brute force" search
      was not a general strategy, and anyway it was not how people played chess
  * computer Go, only delayed by a further 20 years
    * Enormous initial efforts went into avoiding search by
    * taking advantage of human knowledge, or of the special features of the
      * irrelevant, or worse, once search was applied effectively at scale. Also
    * learning by self play to learn a value function (as it was in many other)
      * also important in chess, although not in the 1997 program
    * learning is like search in that it enables massive computation to be
      brought to bear
    * Search and learning are the two most important classes of techniques for
      utilizing massive amounts of computation in AI research
  * speech recognition, there was an
    * early competition, sponsored by DARPA, in the 1970s. Entrants included
    * a host of special methods that took advantage of human knowledge --
      * knowledge of words, of phonemes, of the human vocal tract, etc
    * statistical methods did much more computation, based on HMMs
    * the statistical methods won out over the human-knowledge-based methods
    * all of NLP, gradually over decades, where statistics and computation came
      to dominate the field
    * deep learning in speech recognition is the most recent step in this
      * rely even less on human knowledge, and use even more computation
      * learning on huge training sets, to produce dramatically better ASR
  * computer vision, there has been a similar pattern
    * Early methods: searching for edges, or generalized cylinders, or in terms
      of SIFT features. But today all this is discarded
    * Modern deep-learning neural networks use only
      the notions of convolution and certain kinds of invariances
* historical observations that
  * AI researchers have often tried to build knowledge into their agents,
  * this always helps in the short term, and is personally satisfying
  * in the long run it plateaus and even inhibits further progress
  * breakthrough progress eventually arrives by an opposing
    approach based on scaling computation by search and learning
  * The eventual success is tinged [csömöröl?] with bitterness, and
    often incompletely digested
* general purpose methods, of
  * methods that continue to scale with increased computation even as the
    available computation becomes very great
    * The two methods that seem to scale:
    * search and learning
* the actual contents of minds are tremendously, irredeemably complex
  * stop trying to find simple ways to think about the contents of minds
    eg simple ways to think about space, objects, multiple agents, or symmetries
  * All these are part of the arbitrary, intrinsically-complex, outside world
  * They are not what should be built in, as their complexity is endless;
  * build in only the meta-methods that can find and capture this arb complexity
  * these methods is that they can find good approximations, but
  * the search for them should be by our methods, not by us
  * We want AI agents that can discover like we can,
    not which contain what we have discovered
  * Building in our discoveries only makes it harder to see
    how the discovering process can be done
