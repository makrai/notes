The MAHNOB Mimicry Database: A database of naturalistic human interactions ✩
Sanjay Bilakhia a,∗, Stavros Petridis a, Anton Nijholt b, Maja Pantic a,b
Pattern Recognition Letters 66 (2015) 52–61

# Abstract

* People mimic verbal and nonverbal expressions and behaviour of their counters
  * mimicry has the power to inﬂuence social judgment and various social behavs
    * negotiation and debating, courtship, empathy and helping behaviour.
* automatic recognition of mimicry behaviour would be a valuable tool in
  negotiation skills enhancement and medical help provision training
* we present the MAHNOB mimicry database, a set of
  * fully synchronised, multi-sensory, audiovisual recordings of naturalistic
    dyadic interactions, suitable for investigation of mimicry and negotiation
    behaviour. The database contains 11 h of recordings, split over 54 sessions
    of dyadic interactions between 12 confederates and their 48 counterparts,
    being engaged either in a socio-political discussion or negotiating a
    tenancy agreement.  To provide a benchmark for efforts in machine
    understanding of mimicry behaviour, we report a number of baseline
    experiments based on visual data only.  Speciﬁcally, we consider face and
    head movements, and report on binary classiﬁcation of video sequences into
    mimicry and non-mimicry categories based on the following widely-used
    methodologies: two similarity-based methods (cross correlation and time
    warping), and a state-of-the-art temporal classiﬁer (Long Short Term Memory
    Recurrent Neural Network). The best reported results are session-dependent,
    and affected by the sparsity of positive examples in the data. This
    suggests that there is much room for improvement upon the reported baseline
    experiments

# 1 Intro

* Mimicry behaviour can be divided into motor mimicry & emotional mimicry [15]
  * Motor mimicry constrains behaviours to be identical in expression (but not
    in duration, intensity or phase)
  * emotional mimicry, the displayed behaviours may not be identical, but have
    the same “functional value”, i.e.  “convey the same message” in terms of
    the underlying affective state, including but not limited to, sadness,
    empathy, or trust
  * motor mimicry may also be (a part of) an emotional mimicry episode. For
    example,
    an inner-brow raise displayed in sadness may be mimicked (and perhaps
    intensiﬁed by additional displays of chin raise and downwards head tilt).
  * we largely focus on motor mimicry, mainly because of its agnostic character
  * ?annotation subjective
    * emotional mimicry judgment is all about interpretation of what underlies
      the displayed behavioural expression and mimicry episode,
    * motor mimicry judgment is objective, describing just the “surface” of the
      shown behaviour, such as which facial movement or speech mannerism has
      been mimicked, leaving inference about the conveyed message (emotion) to
      higher order decision making.
