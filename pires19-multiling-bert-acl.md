Telmo Pires, Eva Schlinger, Dan Garrette
How Multilingual is Multilingual BERT?
arXiv preprint arXiv:1906.01502

# Abstract

* Multilingual BERT (M-BERT, Devlin+ 2018)
  * a single language model pre-trained from monolingual corpora in 104 langs,
* surprisingly good at zero-shot cross-lingual model transfer
  * task-specific annotations in one language are used to fine-tune the [other]
* we present a large number of probing experiments, showing that
  * transfer is possible even to languages in different scripts
  * monolingual corpora can train models for code-switching
  * systematic deficiencies affecting certain language pairs

# 1 Intro

* we empirically investigate the degree to which mBERT generalizes across langs
  * mBERT released by Devlin+ (2019) as a single language model pre-trained on
    the concatenation of monolingual Wikipedia corpora from 104 languages
* mBERT enables a straightforward approach to zero-shot cross-lingual transfer:
  we fine-tune the model using task-specific training data from one language,
  and evaluate that task in a different language, thus allowing us to observe
* Our results show that
  * mBERT is able to perform cross-lingual generalization surprisingly well
* probing experiments designed to test various hypotheses show that
  * high lexical overlap between languages improves transfer, 
  * mBERT is also able to transfer between languages in different scripts
  * transfer works best for typologically similar languages,
    * suggesting that mBERT ’s multilingual representation
      * able to map learned structures onto new vocabularies, it does
      * not to learn systematic transformations of structures to
        accommodate a target language with different word order

# 3 Vocabulary Memorization

* How much does transferability depend on lexical overlap? And 
* is transfer possible to languages written in different scripts (no overlap)?

## 3.1 Effect of vocabulary overlap

* M-B ERT ’s performance, on the other hand, is flat for a wide range of
  overlaps, and even for language pairs with almost no lexical overlap, scores
  vary between 40% and 70%, 
  showing a representational capacity deeper than simple vocabulary memorization
* To further verify that E N -B ERT ’s inability to generalize is due to its
  lack of a multilingual representation and 
  * not an inability of its English-specific word piece vocabulary to represent
    data in other languages, 
  * we evaluate on non-cross-lingual NER and see that 
    it performs comparably to a previous state of the art model (see Table 3).

## 3.2 Generalization across scripts

* Table 4 shows a sample of POS results for transfer across scripts.  
* an M-B ERT model that has been fine-tuned using only POS labeled Urdu (ar scr)
  91% accuracy on Hindi (written in Devanagari script), even though it has never
* less accurate for other pairs, such as English and Japanese, indicating that
  * possible explanation for this, as we will see in section 4.2, is typ sim
  * different order of subject, verb and object

# 4 Encoding Linguistic Structure 

* Can M-B ERT generalize from monolingual inputs to 
  * code-switching text? Can the model generalize to 
  * transliterated text without transliterated language model pretraining?

##4.1 Effect of language similarity 

* Following Naseem+ (2012), we compare languages on a subset of the WALS
  features (Dryer and Haspelmath, 2013) relevant to grammatical ordering. 6
* Figure 2 plots POS zero-shot accuracy against the number of common WALS feats.
  * As expected, performance improves with similarity, showing that it is easier
  * still does a decent job for low similarity languages when compared to En-BER

## 4.2 Generalizing across typological features 

* Table 5 shows macro-averaged POS accuracies for transfer between languages
  grouped according to two typological features: 
  SVO SOV, and adjective/noun order (Dryer and Haspelmath, 2013)
  * SOV: Basque, Farsi, Hindi, Japanese, Korean, Marathi, Tamil, Telugu,
    Turkish, Urdu
* suggesting that M-B ERT not seem to learn systematic transformations of those
  structures to accommodate a target language with different word order.

## 4.3 Code switching and transliteration

* Code-switching (CS)—the mixing of multiple languages within a single utterance
* transliteration—writing that is not in the language’s standard script—present
* M-B ERT is pre-trained on monolingual, standard-script corpora. Generalizing
* We test M-B ERT on the CS Hindi/English UD corpus from Bhat+ (2018), which
  * provides texts in two formats: 
    * transliterated, where Hindi is written in Latin script, and 
    * corrected, where annotators have converted them back to Devanagari
* Table 6 shows the results for models fine-tuned using 
  * a combination of monolingual Hindi and English, and using the 
  * CS training set
* For script-corrected inputs, M-B ERT ’s 
  * performance is comparable
    * when trained only on monolingual corpora 
    * when training on code-switched data, and it is 
  * likely that some of the remaining difference is due to domain mismatch.
  * This provides further evidence that M-B ERT uses a representation that is
    able to incorporate information from multiple languages.  
* not able to effectively transfer to a transliterated target, 
  * suggesting that it is the language model pre-training on a particular
    language that allows transfer to that language.  
  * M-B ERT is outperformed by previous work 
    in both the monolingual-only and code-switched supervision scenarios.
    * Neither Ball and Garrette (2018) nor Bhat+ (2018) use contextualized word
      embeddings, but both incorporate explicit transliteration signals

# 5 Multilingual characterization of the feature space 

* If M-B ERT ’s feature space is multilingual, then the transformation mapping
  between the same sentence in 2 languages should not depend on the sentence
  itself, just on the language pair.

## 5.1 Experimental Setup

* nearest neighbor accuracy: We 
  * sample 5000 pairs of sentences from WMT16 (Bojar+ 2016) and feed each
    sentence (separately) to M-B ERT with no fine-tuning
  * a vector for each sentence, at each layer l
    * from hidden feature activations: average the representations for the
      non-spec input tokens 
  * For each pair of sentences, eg (v EN i , v DE i ), we compute 
    the vector pointing from one to the other and average it over all pairs: v̄
  * translate each sentence, `v_{EN_i}^{(l)}` by `v̄_{EN → DE}^{(l)}`,
    find the closest German sentence vector 8 , and measure accuracy

## 5.2 Results

* In Figure 3, we plot the nearest neighbor accuracy for EN DE (solid line). It
  * over 50% accuracy for all but the bottom layers, 9 which seems to 
  * imply that the hidden representations, share a common subspace that
    represents useful linguistic information, in a language-agnostic way.
* Similar curves are obtained for EN RU , and UR HI (in-house dataset), showing
* why the accuracy goes down in the last few layers, one possible explanation is
  that since the model was pre-trained for language modeling, it might need more
  language-specific information to correctly predict the missing word.

# 6 Conclusion

* transfer to typologically divergent and transliterated targets will likely 
  require the model to incorporate an explicit multilingual training objective,
  such as that used by Lample and Conneau (2019) or Artetxe and Schwenk (2018).  
