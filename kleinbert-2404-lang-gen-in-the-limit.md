Language Generation in the Limit
Jon Kleinberg, Sendhil Mullainathan
arXiv:2404.06757 [cs.DS]

* current large language models are complex, 
* nL the most basic specifications of the underlying language generation problem
  itself are simple to state: 
* given a finite set of training samples from an unknown language, 
  produce valid new strings from the language that don't already appear in the
* what can we conclude about language generation using only this specification,
* suppose that an adversary enumerates the strings of an unknown target language
  * a possibly infinite list of candidates. A computational agent is trying to
* we say that the agent generates from L in the limit 
  if after some finite point in the enumeration of L, 
  the agent is able to produce new elements that come exclusively from L and
  that have not yet been presented by the adversary. Our main result is that
* there is an agent that is able to generate in the limit 
  for every countable list of candidate languages
* This contrasts dramatically with negative results due to Gold and Angluin in a
  * Gold and Angluin: well-studied model of language learning where 
    the goal is to identify an unknown language from samples; the difference
* ie identifying a language is a fundamentally different problem than generating
  from it
