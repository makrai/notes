Manócska : A Unified Verb Frame Database for Hungarian
Ágnes Kalivoda, Noémi Vadász, and Balázs Indig
2018 tsd

# 4 The structure

* The XML-format (presented on Fig. 1) contains all the six resources,
  * including every fine-grained feature available in the MetaMorpho database
    (e.g. distinction between arguments and adjuncts – the latter marked with
    COMPL, information about the valencies’ theta roles and semantic
    constraints like animate or bodypart)
  * two optional subentries based on whether there is a verbal particle (Prev)
    * subdivided depending on the possibility of an infinitival argument (Inf)
      * frames are collected within the Frames tag. Each frame can have
        * meta attributes, e.g. a reference to its ID in the original resource.
        * lists of arguments (subject, object, obliquus) and adjuncts
          * grammatical case or a postposition. Beside that, they
          * may have extra constraints, e.g.  some features which help to
            * each feature as a key–value pair chosen from a predefined domain,
        * frame frequencies coming from the different resources are attributes

# 5 Theoretical Implications

* the verb itself can be substituted with several semantically related words,
  but interestingly, its frames can not vary so freely
  * even more apparent if the verb has a [directional] particle + an argument
    which agrees with it in its grammatical case
  * the verb seems to have very little syntactic, but rather semantic power in
  * e.g. _be (lit. in.ILL) verb smth.ACC smth.INS_ mostly matches frames where
    * core meaning 'to cover'
    * befed, bearanyoz, bedörzsöl, bepiszkı́t, besugároz, beterı́t
