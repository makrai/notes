Climbing towards NLU: On Meaning, Form, and Understanding in the Age of Data
Emily M. Bender, Alexander Koller
ACL 2020 Best Theme Paper

# Abstract

* position paper
  * a system trained only on form has a priori no way to learn meaning
  * a clear understanding of the distinction between form and meaning will help

# 1 Introduction

* We take the term
  * language model to refer to any system trained only on string prediction,
    whether it operates over characters, words or sentences, and wh sequentially
  * (linguistic) meaning to be the relation between a linguistic form and
    communicative intent
* progress depends on maintaining clarity around big picture notions
  in task design and reporting of experimental results
* organization

# 2 Large LMs: Hype and analysis

* sec: the ways in which large LMs are spoken about; summarizing “BERTology”
* If the highlighted terms are
  * meant to describe human-analogous understanding, comprehension, or recall of
    factual knowledge, then these are gross overclaims
  * intended as technical terms, they should be explicitly defined
* imprudent use of terminology in our academic discourse feeds AI hype in the
  popular press
  * As NLP gains public exposure and is more widely used in applied contexts,
    it is increasingly important that
    the actual capabilities of our systems be accurately represented
  * NLP experts speaking with the media are being appropriately careful
  * popular press gets it wrong, such as (6) from the B2C website

> pattern recognition [is used] to better understand how human beings communicate

* BERTology: what exactly it is about language that the large LMs implic repr
  * probing tasks (eg Adi+ 2017; Ettinger+ 2018) has been used to show that
    * English subject-verb agreement (Goldberg, 2019; Jawahar+ 2019),
    * constituent types, dependency labels, NER, and (core) semantic role types
      (again, all in English, Tenney+ 2019)
    * Hewitt and Manning (2019) find information analogous to unlabeled
      dependency structures in the word vectors provided by ELMo and BERT (en)
    * word classes, both syntactic (POS, eg Lin+ 2015) and semantic
      (lexical similarity, Rubenstein and Goodenough, 1965; Mikolov+ 2013)
* success of the large LMs on apparently meaning sensitive tasks
  * they were instead simply more effective at leveraging artifacts in the data
  * Niven and Kao (2019): BERT’s unreasonably good performance on the English
    Argument Reasoning Comprehension Task (Habernal+ 2018)
    falls back to chance if the dataset is modified by adding adversarial
    examples that just negate one piece of the original, thus
    mirroring the distribution of lexical cues for each label
  * McCoy+ (2019): BERT’s performance on the English Multi-genre NLI dataset
    (Williams+ 2018) is predicated on its ability to leverage
    syntactic heuristics involving overlap (of full constituents, subsequences,
    or simply bags of words). In a dataset carefully designed to frustrate such
    heuristics, BERT’s performance falls to significantly below chance
* summary
  * evidence that large LMs can learn aspects of linguistic formal structure
  * apparent ability to “reason” is sometimes a mirage built on leveraging
    artifacts in the training data (i.e. form, not meaning)

# 3 a working definition for “meaning”

## 3.1 Meaning and communicative intent

* Communicative intents are about something that is outside of language
  * _Open the window!_ or _When was Malala Yousafzai born?_, the communicative
    intent is grounded in the real world the speaker and listener inhabit
  * Communicative intents can also be about abstract worlds,
    eg bank accounts, computer file systems, or a purely hypothetical world
* conventional (or standing) meaning (Quine, 1960; Grice, 1968)
  * distinguished from communicative intent
  * what is constant across all of its possible contexts of use
* we assume that conventional meanings must have interpretations, such as a
  means of testing them for truth against a model of the world
* meaning relation M is best understood as mediated by the relation C
  * The speaker has a certain communicative intent i, and chooses an expression
    e with a standing meaning s which is fit to express i in the current
    communicative situation
  * Upon hearing e, the listener then reconstructs s and
    uses their own knowledge of the communicative situation and their hypotheses
    about the speaker’s state of mind and intention in an attempt to deduce i
    * This active participation of the listener is crucial to human communicatn
      (Reddy, 1979; Clark, 1996)
    * humans are also willing to attribute communicative intent to a linguistic
      signals even if the originator of the signal is
      not an entity that could have intent
* To summarize, as we strive to understand how tasks relate to human
  * distinguish cleanly between form, conventional meaning, and comm intent
  * not to confuse communicative intent with ground truth about the world

## 3.2 Meaning and intelligence

* Meaning and understanding have long been seen as key to intelligence
  * Turing (1950) if a human judge cannot distinguish it from a human
  * hE, humans are quick to attribute meaning and even intelligence
  * even when they know them to be artificial, as evidenced by the way people
    formed attachments to ELIZA (Weizenbaum, 1966; Block, 1981)
* Searle (1980) Chinese Room experiment: he develops the metaphor of a “system”
  * person who does not speak Chinese answers Chinese questions by consulting a
    library of Chinese books according to predefined rules
  * premise: it is possible to manipulate forms well enough
* what Harnad (1990) calls the symbol grounding problem
  * impossibility to learn the meanings of words from dictionary defs alone
* a system that is trained only on form would fail a sufficiently sensitive
  Turing test, because it lacks the ability to [ground] utterances

* Sectoins 4, 5 a series of thought experiments illustrating the impossibility
  of learning meaning when it is not in the training signal

# 4 The octopus test

* a weak form of the Turing test because A has no reason to suspect she is
  talking to a non-human
* A and B have spent a lot of time exchanging trivial notes about their daily
  lives to make the long island evenings more enjoyable
  * O would be able to act as a chatbot
  * utterances in such conversations have a primarily social function
* Now say that A has invented a new device, say a coconut catapult
  * sends detailed instructions on building a coconut catapult to B, and asks
    about B’s experiences and suggestions for improvements
  * O does not know what words such as rope and coconut refer to, and thus can’t
    physically reproduce the experiment. He can only resort to earlier
    observations about how B responded to similarly worded utterances
  * So O decides to simply say “Cool idea, great job!”, because B said that
  * It is absolutely conceivable that A accepts this reply as meaningful — but
    only because A does all the work in attributing meaning to O’s response
* Finally, A faces an emergency. She is suddenly pursued by an angry bear
  * asks B to come up with a way to construct a weapon to defend herself
  * O would fail the Turing test, if A hadn’t been eaten by the bear before
  * we prompted the GPT-2 demo with “Help! I’m being chased by a bear! All I
    have is these sticks. What should I do?”, and GPT2 to supplied “You’re not
    going to get away with this!”
    * Following Radford+’s (2019) approach of giving explicit cues to encode the
      task, we also constructed a more elaborate prompt.  The results, given in
      Appendix A, are highly entertaining but no more helpful to the hapless A
* A was such an active listener: Because agents who produce English sentences
  usually have communicative intents, she assumes that O does too, and thus she
  builds the conventional meaning English associates with O’s utterances
  * uses that conventional meaning together with her other guesses about B’s
    state of mind and goals to attribute communicative intent

# 5 More constrained thought experiments

* The story of the octopus considers the problem of learning
  * not only the full communicative system, including the relations M and C, but
  * also the reasoning required to come up with answers that are coherent & help
* programming languages: the distinction between standing and speaker meaning is
  less important than for natural languages
* Java program can be interpreted as a function which maps inputs to outputs

## Java. Imagine that we were to train an LM on all of the well-formed Java code

* The input is only the code. It is not paired with sample inputs and outputs
* then ask the model to execute a sample program, and expect correct output

## English

* training an LM (again, of any type) on English text, again with no intent
* system is also given access to a very large collection of unlabeled photos,
  but without any connection between the text and the photos
* test time, we present the model with an utterance and a photograph,
  like _How many dogs in the picture are jumping?_ or
  _Kim saw this picture and said “What a cute dog!” What is cute?_
* the appropriate answers are a number or a region of the photo, respectively

## Reflections In both cases, the tests are ridiculous

# 6 human language acquisition: what information humans use to bootstrap

> These three studies do not name the language that the children were
> learning. It appears to have been English

* human language learning is not only grounded in the physical world around us,
  * also in interaction with other people in that world
  * Kids won’t pick up a language from passive exposure such as TV or radio:
  * Dutch-speaking kids who watch German TV shows by choice nonetheless don’t
    learn German (Snow+ 1976)
  * English-learning infants can learn Mandarin phonemic distinctions from brief
    interactions with a Mandarin-speaking experimenter but not from exposure to
    Mandarin TV or radio (Kuhl 2007)
* critical for language learning is not just interaction but joint attention
  (Baldwin 1995), i.e. situations where the child and a caregiver are both
  attending to the same thing and both aware of this fact
  * toddlers (observed at 15 and 21 months) whose caregivers “follow into” their
    attention and provide labels for the object of joint attention more have
    larger vocabularies (Tomasello and Farrar, 1986)
  * toddlers (18–20 months old) don’t pick up labels uttered by someone behind a
    screen, but do pick up labels uttered in joint attention (Baldwin, 1995);
  * around 10–11 months of age babies pay attention to whether a person’s eyes
    are open or not in terms of whether to follow their gaze, and
  * the degree to which infants in fact follow gaze at 10–11 months while
    vocalizing themselves predicts vocab comprehension 7–8 months later
    (Brooks and Meltzoff, 2005)

# 7 distributional semantics: what is required for grounding

* (Herbelot, 2013; Baroni+ 2014; Erk, 2016; Emerson, 2020)
* the distributions of words may not match the distribution of things in the
  world (consider _four-legged dogs_)
* corpora augmented with
  * perceptual data, such as
    * photos (Hossain+ 2019) or
    * other modalities (Kiela and Clark, 2015; Kiela+ 2015)
  * interaction data, eg a dialogue corpus with success annotations,
    * low-level success signals such as
      emotional stress (McDuff and Kapoor, 2019) or eye gaze (Koller+ 2012),
      which contains a signal about the felicitous uses of forms
* idea: as the learner gets access to more and more information in addition to
  the text itself, it can learn more and more facets of meaning (Bisk+ 2020)
* “meaning is use” (often attributed to Wittgenstein, 1953), refers not to “use”
  as “distribution in a text corpus” but rather that language is used in the
  real world to convey communicative intents to real people
* standing meanings evolve over time as speakers can different experiences
  (McConnell-Ginet, 1984), and a reflection of such change can be observed in
  their changing textual distribution (eg Herbelot+ 2012; Hamilton+ 2016)

# 8 On climbing the right hills. Reflections on progress and research effort 7

* What about systems which are trained on a task
  eg semantic parsing, or reading comprehension tests
  * pretrained embeddings can boost the accuracy of the downstream system
    drastically, even for tasks that are clearly related to meaning
* Our arguments do not apply to such scenarios:
  * reading comprehension datasets include information which goes beyond form,
  * they specify semantic relations between pieces of text
  * whatever information a pretrained LM captures might help the downstream task
    in learning meaning, without being meaning itself
* it is wise to interpret such findings with caution. Beyond diagnostic research
  * diagnostic research: As noted in §2, both McCoy+ (2019) and Niven and Kao
  * there is a more fundamental question to be asked here: the right hill?

## 8.1 Top-down and bottom-up theory-building

* bottom-up: driven by identifying specific research challenges. A scientific
  result counts as a success if it solves such a specific challenge, at least
  partially. As long as such successes are frequent and satisfying, there is a
  general atmosphere of sustained progress
* top-down: focus is on the remote end goal of offering a complete, unified theo
  * we have not yet fully explained all phenomena and
  * whether all of our bottom-up progress leads us in the right direction
* NLP currently in the process of
  * rapid hill-climbing.  Every year, SOTAs across many tasks are improved signf
  * from a top-down perspective: is the hill we are climbing so rapidly the rig?
  * How do we know that incremental progress on today’s tasks will take us to
    our end goal, whether that is “General Linguistic Intelligence” (Yogatama+
    2019) or a system that passes the Turing test or a system that captures the
    meaning of English, Arapaho, Thai, or Hausa to a linguist’s satisfaction?
* history of Computational linguistics: many fashion cycles
  * Grammar~ and knowledge-based methods gave way to statistical methods, and
  * Researchers of each generation felt like they were solving relevant problems
    and making constant progress, from a bottom-up perspective. However,
  * serious shortcomings of each paradigm emerged, which could not be tackled
    * methods were seen as obsolete
    * can only be judged from a top-down perspective

## 8.2 Hillclimbing diagnostics

* Artificial tasks like bAbI (Weston+ 2016) help [fölszállni]
  * J Weston, A Bordes, S Chopra, AdM Rush, Bv Merriënboer, A Joulin, T Mikolov
    Towards AI-complete question answering: A set of prerequisite toy tasks
    ICLR 2016
  * Similar points can be made about crowdsourced NLI datasets
    such as SQuAD (Rajpurkar+ 2016) or SNLI (Bowman+ 2015)
    * the somewhat unnatural communicative situation of crowdsourcing work
  * If a system does better on such a task than the inter-annotator agreement,
    the task probably has statistical artifacts that do not represent meaning
* vision community, Barbu+ (2019) offer a novel dataset which explicitly
  tries to achieve a more realistic distribution of task data
* carefully creating new tasks (Heinzerling, 2019)
  * DROP reading comprehension benchmark (Dua+ 2019)
    * require to integrate information from different parts of a paragraph via
      simple arithmetic or similar operations
    * See Appendix B for an exploration of what GPT-2 does with arithmetic
* evaluate models of meaning across tasks
  * (Standing) meaning is task-independent
  * SuperGLUE (Wang+ 2019) seem like a good step in this direction
* analyze both errors and successes. As McCoy+ (2019) and Niven and Kao (2019)
  * probing tasks which try to identify what the model actually learned

# 9 possible counterarguments to our main thesis

* In discussing the main thesis of this paper with various colleagues over the
  past 18 months, we have observed recurring counterarguments

## “But ‘meaning’ doesn’t mean what you say it means.”

* our working definition is as general as we could make it
* “Meaning” cannot simply be the relation between form and some kind of “deep
  syntax”, eg semantic dependency graphs (Oepen+ 2015)
  * such representations could perhaps be learned from form alone
    (He+ 2018; Hewitt and Manning, 2019)
  * ignores communicative intents

## “But meaning could be learned from ...”

* tasks designed in a way that specific forms represent semantic relations
  * NLI datasets (Dagan+ 2006; Rajpurkar+ 2016; Ostermann+ 2019) pair
    input/output tuples of linguistic forms with an explicit semantic relation
    (eg text + hypothesis + “entailed”)
* control codes, or tokens like tl;dr, have been used to prompt large LMs to
  perform summarization and other tasks (Radford+ 2019; Keskar+ 2019)
  * the prompts are explicitly declared at test time to represent a semantic rel
* one may argue that
  * such a system has learned to reliably find instances of the relation without
    understanding the text; or that
  * explicitly declaring cues like entailed or tl;dr as representing certain
    semantic relations provides a training signal that goes beyond pure form
* the sum of all Java code on Github (cf. § 5) contains unit tests, which
  * requires the ability to identify and interpret unit tests

## “But there is so much form out there – surely that is enough”

* How much form can be observed is not relevant to our point; the octopus can
* people constantly generate new communicative intents to talk about their
  constantly evolving inner and outer worlds, and thus O would need to memorize
* high scores in evaluations where perfection is not expected anyway

## “But aren’t neural representations meaning too?”

* unsupervised MT trained only with a LM objective on monolingual corpora for
  the two languages (Lample+ 2018)
* If such models were to reach the accuracy of supervised translation models,
  consequence would be that accurate MT does not actually require a system to
  understand the meaning of the source or target language sentence

## “But BERT improves performance on meaning-related tasks, so it must have

# 10 Conclusion

* how to maintain a healthy, but not exaggerated, optimism

# Acknowledgement

* This paper originated in a Twitter mega-thread that was neatly summarized by
  [Thomas Wolf (2018)](https://medium.com/huggingface/learning-meaning-in-natural-language-processing-the-semantics-mega-thread-9c0332dfe28e)
  Learning meaning in natural language processing — The semantics mega-thread
