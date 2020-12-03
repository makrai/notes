Christopher D. Manning
Last Words.  Computational Linguistics and Deep Learning
2015

# 1. The Deep Learning Tsunami

* Hinton: Babel fish (not to hu)

# 2. The Success of Deep Learning

* Neon, the new transcription system for Google Voice
  * http://googleblog.blogspot.com/2015/07/neon-prescription-or-rather-new.html
* “Using a (deep breath) long short-term memory _deep recurrent_ neural network
  (whew!), we cut our transcription errors by 49%.”

# 3. Why Computational Linguists Need Not Worry

* The really dramatic gains may only have been possible on true signal
  processing tasks (image, speech)
* Joseph Reisinger wrote on his blog:

> “I get pitched regularly by startups doing ‘generic machine learning’ which
> is, in all honesty, a pretty ridiculous idea.  Machine learning is ... closer
> to design than coding.”

* From this perspective, it is people in linguistics, people in NLP, who are
  the designers
* Recently at ACL conferences, there has been an over-focus on numbers, on
  beating the state of the art. Call it playing the Kaggle game.  More of the
  field’s effort should go into problems, approaches, and architectures
* I: Universal Dependencies
  * http://universaldependencies.github.io/docs/
  * The goal is to develop a common syntactic dependency representation and
  * POS and feature label sets which can be used with reasonable linguistic
  * fidelity and human usability across all human languages
* Abstract Meaning Representation
  * http://amr.isi.edu

# 4. Deep Learning of Language

* The gains so far have not so much been from true Deep Learning (use of a
  hierarchy of more abstract representations to promote generalization) as from
  the use of distributed word representations
* the “Parallel Distributed Processing” mantra ... had a much more
  cognitive-science directed focus (Rumelhart and McClelland 1986).  The
  sharing that occurs within deep representations
* the system devel process
  * The researcher defines a model architecture and a top-level loss function
  * parameters and the representations of the model self-organize so as to
    minimize this loss, in an end-to-end learning framework
  * We are starting to see the power of such deep systems in
    * recent work in neural machine translation
      * Sutskever, Vinyals, and Le 2014;
      * Luong+ 2015
        MT Luong, I Sutskever, Quoc V Le, Oriol Vinyals, and Wojciech Zaremba.
        Addressing the rare word problem in neural machine translation
        2015
* compositionality in models,

# 5. Scientific Questions That Connect CL and Deep Learning

* we might return ... to some of the interesting linguistic and cognitive issues
  * motivated non-categorical representations and neural network approaches.
  * e.g. the POS of words in the gerund V-ing form, 
* explaining linguistic variation and change with distributed representations
  * Sagi, Kaufmann, and Clark (2011)—actually
  * Kulkarni+ (2015)
  * Kim+ (2014)
* past tense debate
  * arguing against the adequacy of neural networks for rule-governed
    linguistic behavior was the foundation for the rise to fame of Steve
    Pinker—and the foundation of the career of about six of his graduate
    students. It would take too much space to go through the issues here, but
    in the end, I think it was a productive debate
  * a vast amount of work by Paul Smolensky on how basically categorical
    systems can emerge and be represented in a neural substrate (Smolensky and
    Legendre 2006).  Indeed, Paul Smolensky arguably went too far down the
    rabbit hole, devoting a large part of his career to developing a new
    categorical model of phonology, Optimality Theory
    (Prince and Smolensky 2004)
