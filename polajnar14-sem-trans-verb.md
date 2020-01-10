Tamara Polajnar, Laura Rimell, Stephen Clark
Using Sentence Plausibility to Learn the Semantics of Transitive Verbs
NIPS learning semantics workshop 2014; in arXiv, some minor errata fixed

#1 Intro

* ways to combine distributional representations of Subject, Verb, Object (SVO)
  triples to form transitive sentences [2–6, 11, 13]
  2. Marco Baroni and Roberto Zamparelli
    Nouns are vectors, adjectives are matrices: Representing adjective-noun
    EMNLP 2010
  3. Stephen Clark
    Type-driven syntax and semantics for composing meaning vectors
    2013 In C Heunen, M Sadrzadeh, and E Grefenstette, eds, Quantum Physics
    and Linguistics: A Compositional, Diagrammatic Discourse, Oxford Uni Press
  4. Bob Coecke, Mehrnoosh Sadrzadeh, and Stephen Clark
    Mathematical foundations for a compositional distributional model of meanng
    Lambek Festschrift 2010
  5. E Grefenstette, G Dinu, Y Zhang, M Sadrzadeh, and M Baroni
    Multi-step regression learning for compositional distributional semantics
    IWCS 2013
  6. Edward Grefenstette and Mehrnoosh Sadrzadeh GS2011
    Experimental support for a categorical compositional distributional
    EMNLP 2011
  11. Jeff Mitchell and Mirella Lapata
    Vector-based models of semantic composition
    ACL-08
  12. Tamara Polajnar and Stephen Clark
    [Distributional sem] vectors through context selection and normalisation
    EACL 2014
  13. Tamara Polajnar, Luana Fagarasan, and Stephen Clark
    Reducing dimensions of tensors in type-driven distributional semantics
    EMNLP 2014
* functional approach [1–4],
  * argument-taking words such as verbs and adjectives are ...  tensors,
    which take as arguments word representations of lower order
  * promising initial results [5–8, 13]
  7. Edward Grefenstette and Mehrnoosh Sadrzadeh
    Experimenting with transitive verbs in a DisCoCat
    GEMS 2011
  8. Dimitri Kartsaklis and Mehrnoosh Sadrzadeh KS2013
    Prior disambiguation of word tensors for constructing sentence vectors
    EMNLP 2013
  * but many questions remain
    * effective method of learning verb tensors from a corpus
    * appropriate sentence space for a variety of different tasks
* This paper presents work in progress which addresses both of these questions
  * A variety of methods for composing the V, S, and O are investigated
  * The results show that
    * plausibility training [i.e. noise-contrastive estimation, see Hashimoto
      and Tsubaki 2015] outperforms the distributional method on a verb
      disambiguation task, while
    * the purely distributional approach performs better on sentence similarity

#2 Methods

tensor training can be expensive and in practice, for some tasks, the verb can
be approximated as a matrix

#3 Tasks

* verb disambiguation, and transitive sentence similarity
  * In each case the system must ... assign similarity values to pairs of SVOs
* For the verb disambiguation task we use the GS2011 dataset [6]
  * pairs of SVO triples in which the subject and object are held constant, and
    the verb is manipulated to highlight different word senses
  * e.g. _draw_ has senses _attract_ and _depict_
    * _report draw/attract/depict attention_
      _child draw/attract/depict picture_
* For the transitive sentence similarity task we use the KS2013 dataset [8]
  * This dataset also consists of pairs of SVO triples, but the
    subject and object as well as the verb vary
  * _author write book_ !~  _delegate buy land_
    _programme offer support_ ~ _service provide help_

#5 Conclusion
