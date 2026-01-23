Marc A Zissman, Kay M Berkling
2001
Automatic language identification

3.1. Spectral-similarity approaches

spectra could be used directly _as feature vectors_, or they could be used
instead to compute formant-based or cepstral features vectors
_spectral-similarity_ could be calculated by the Euclidean, Mahalanobis, or some
other distance metric
Examples of _spectral-similarity LID systems_ are those proposed and developed
by Cimarusti and Ives (1982), Foil (1986), Goodman et al. (1989) and Sugiyama
(1991).
Riek et al. (1991), Nakagawa et al. (1992) and Zissman (1993) applied _Gaussian
mixture_ classifiers to language identification
_HMM_-based language identification was first proposed by House and Neuburg
(1977). Savic et al. (1991), Riek et al. (1991), Nakagawa et al. (1992) and
Zissman (1993) all applied HMMs to spectral and cepstral feature vectors, unlabeled training speech. 
    Riek and Zissman found that unsupervised HMM systems manner did not perform as well 
    Nakagawa et al. (1994) eventually obtained better performance
as some of the static classifiers 

3.2. Prosody-based approaches

For example, Itahashi et al., 1994 and Itahashi and Du, 1995
    more robust in noisy environments

3.3. Phone-recognition approaches

Lamel built two HMM-based phone recognizers: one in English and another in
French (Lamel and Gauvain, 1993
English versus Japanese spontaneous, telephone-speech (Muthusamy et al.,
1993).
Both Lamel and Muthusamy trained their systems with multi-language
phonetically labeled corpora
single-language phone recognizer as a front end to a system that uses
phonotactic scores
     Hazen and Zue (1993) and Zissman and Singer (1994)
     accurate Spanish versus Japanese LID can be performed using only an
     English phone recognizer
 
3.4. Using multilingual speech units

nem értem, (Wheatly et al., 1994).
phones that carry the most language discriminating information

3.5. Word level approaches

Between phone-level systems described in the previous sections and the
large-vocabulary speech recognition systems
Each language-dependent lexicon contains several thousand entries
language-dependent lexicon ... can be learned automatically from the training
data

3.6. Continuous speech recognition

large-vocabulary continuous-speech recognition systems
require many hours of labeled training data in each language

4. Evaluations

The syllabic-feature system and the systems with multiple phone recognizers
followed by phonotactic language modeling have exhibited the best performance
over the years
orthographically and phonetically labeled speech corpora have not been
available

5. Conclusions

Systems which try to model phones, phone frequencies and phonotactics
naturally perform better than those that model only lower-level acoustic
information. 
Presumably, systems that model words and grammars _will_ be shown
to have even better accuracy.
State-of-the-art large-vocabulary CSR systems are often trained on many hours
of transcribed speech
