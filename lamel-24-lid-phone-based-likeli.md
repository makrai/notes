L.F. Lamel and J.L. Gauvain
1994
Language Identification Using Phone-based Acoustic Likelihoods

ABSTRACT

phone-based acoustic likelihoods [self 5, 13]
language-specific phone model sets
    (each set is a large ergodic HMM)
automatic language identification [11, 15, 2, 3, 9, 28, 21]
a multi-language corpus[19]
Some ... techniques for language identification combine feature vectors
(filter bank, LPC, cepstum, formants) with prosodic features using polynomial
classifiers[2], vector quantization[3, 9, 28], or neural nets[20].  Broad
phonetic labels were used with finite state models[15] and with neural
nets[20]. More recently, Gaussian mixture and HMM have been proposed for
language identification[21, 31], as well as stochastic segment-based
models[10].
[as opposed to word recognition phone recognition is] task independent.
Phone-based acoustic likelihoods 
   for sex and speakeridentification [5, 13]
the fine phonetic classes slightly outperformed broad phonetic categories, and
both these outperformed acoustic features [18]

PHONE-BASED ACOUSTIC LIKELIHOODS

The basic idea is to train a set of large phone-based ergodic hidden Markov
models (HMMs) for each non-linguistic feature to be identified.
This decoding procedure has been efficiently implemented by processing all the
models in parallel using a time-synchronous beam search strategy.
characteristics:
    more precise than methods based on long-term statistics such as long term
    spectra, VQ codebooks, or probabilistic acoustic maps[27, 30].
    phonotactic constraints.
each large ergodic HMM is built from small left-to-right phonetic HMMs.
Viterbi algorithm
the output phone string is ignored
context-independent (CI) phone models, where each phone model is a 3-state
left-toright continuous density hidden Markov model (CDHMM) with Gaussian
mixture observation densities. The covariance matrices of all Gaussian
components are diagonal. 
Maximum likelihood estimators
In our original formulation, phonetic labels were required
for training the models[5].
    [we used] MAP estimation with seed models derived from transcribed speech
    data [for speaker identification]
    ML estimation where models trained on labeled data are used to generate
    an approximate transcription of the training data [for] language
    identification
        using a common phone alphabet for all of the languages.
The use of ergodic HMM has been reported for speaker identification[24, 29,
16, 21] and for language identification[31] using small ergodic HMMs with a
maximum of 5 to 8 states. Gaussian mixture models, which are special cases of
ergodic HMM, have been used for speaker identification[25, 30]. The use of
phone-based HMM has been reported for text-dependent[26, 17] and for text-
independent, fixed-vocabulary[26] speaker identification.

FRENCH/ENGLISH LID EXPERIMENTS

associated phonetic transcriptions,
corpus
number of CI phone models
32 gaussians per mixture, 
no duration model
bandwidth
phonotactic constraints provided by phone bigrams.
initial and final silences

OGI 10-LANGUAGE EXPERIMENTS

over the telephone
corpus
The training data was first labeled using a set of speakerindependent,
context-independent phone models. Languagespecificic models were then
estimated using MLE with the these labels.
without the use of phone transcriptions.
10-way language identification results
Two-way French/English language identification

SUMMARY
