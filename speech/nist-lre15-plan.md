# 1 INTRODUCTION

NIST ... evaluations of automatic language recognition technology, 
  * most recently in 2009 and 2011 -
  * similar in many ways to NIST’s two most recent evaluations
  * data
    * conversational telephone speech (CTS) data and 
    * broadcast narrowband speech (BNBS) data, and will emphasize distinguishing 
    * closely related languages.
      * frequently mutually intelligible.
  * different from the prior LRE’s in certain key respects. 
    * core (i.e., required) testing condition will be based on the use of only
      _limited and specified training data_ to develop the models for each of
      the target languages . The use of unrestricted training data, including
      from sources other than ones provided or occurring in prior evaluation
      corpora, will be permitted and encouraged in an alternative test
      condition for comparison of algorithmic and data contributions to
      performance
    * lenght not be limited to segments with approximately 3 seconds, 10
      seconds, or 30 seconds of speech duration.  Segments will be selected to
      cover a broad range of speech durations, and subsequent analysis will
      examine the effects of segment duration on performance
    * not be asked to provide hard decisions for each target language and each
      test segment.  Instead they will only be asked to provide for each test
      segment a score vector, with entries interpreted as _log likelihood
      ratios_ (llr) for each of the target languages.

# 5 DATA

## 5.2 TRAINING AND DEVELOPMENT DATA
