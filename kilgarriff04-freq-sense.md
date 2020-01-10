How Dominant is the Commonest Sense of a Word?
Adam Kilgarriff
2004 tsd

#Abstract

We present a mathematical model of word sense frequency distributions, and use
word distributions to set parameters. The model implies that the expected
dominance of the commonest sense rises with the number of corpus instances, and
that, particularly for commoner words, highly uneven distributions are to be
expected much more often than even ones. The model is compared with the limited
evidence available from SEMCOR. The implications for WSD and its evaluation are
discussed.

#Intro

* if the commonest sense is commonest by far, accounting for, say, 90% of the
  corpus instances for the word, it becomes hard for an ‘intelligent’ WSD
  program to perform better than a dumb one that just always chooses the
  commonest sense,
* the lower bound issue (and a further set of concerns regarding the upper
  bound) continue to cast a shadow over much WSD activity and its evaluation
  [9,7,4].
  4. 
    * Philip Edmonds and Adam Kilgarriff. Guest editors, 
    * special issue on evaluating word sense disambiguation systems. 
    * 2002 J. Natural Language Engineering, 8(4).
  7. 
    * Adam Kilgarriff and Martha Palmer. Introduction, 
    * Special Issue on S ENSEVAL : Evaluating Word Sense Disambiguation Programs. 
    * 2000 Computers and the Humanities, 34(1–2):1–13.
  9. 
    * Adam Kilgarriff
    * Gold standard datasets for evaluating word sense disambiguation programs.  
    * 1998 Computer Speech and Language, Special Issue on Evaluation of Spee...

#2 The Model

##2.1 Assumptions

* words have a Zipfian or power-law distribution [16]. As a first
  approximation, the product of frequency and rank is constant.
* we assume no special relationship between different meanings of the same
  word.  We assume any instance of a word can be assigned to !1 sense
  * assumptions are patently untrue [11,6,8]
    6. Patrick Hanks. 1996. Contextual dependency and lexical sets.
    8. Adam Kilgarriff. 1997. ‘I don’t believe in word senses’. 
    11. George Lakoff. 1987. Women, Fire and Dangerous Things.  
* in the absence of much empirical evidence about the distribution of the whole
  population of words senses, we assume their distribution is as for words. We
  expect word senses to be power-law-distributed. We assume that the population
  of word senses will show no interesting distributional differences to the
  population of words. (There will just be rather more of them.)

#4 Discussion

* One possible reason for the theoretical figures being higher than the SEMCOR
  figures lies in the dictionary-writing process. Where a lexicographer is
  confronted with a large quantity of corpus data for a word, then, even if all
  of the examples are in the same area of meaning, it becomes tempting to
  allocate the word more column inches and more meanings.

##4.3 

* A system that concentrates on identifying the commonest sense could well
outperform one that concentrates on disambiguation.
* WSD [is] called Lexical Disambiguation in the MT community
* Gale et al. [5] note in a footnote

> It is common to use very small contexts (e.g., 5-words) based on the
> observation that people seem to be able to disambiguate word-senses basd on
> very little context.  We have taken a different approach. Since we have been
> able to find useful information out to 100 words (and measurable information
> out to 10,000 words), we feel we might as well make use of much larger
> contexts.  

  * In looking at a very large window, they approximate an approach which
    identifies a domain.
