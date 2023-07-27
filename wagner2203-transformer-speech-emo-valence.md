Dawn of the transformer era in speech emotion recog: closing the valence gap
Johannes Wagner, Andreas Triantafyllopoulos, Hagen Wierstorf,
  Maximilian Schmitt, Felix Burkhardt, Florian Eyben, Björn W. Schuller
arXiv:2203.07378 [eess.AS]

# Abstract

* transformer-based architectures which are pre-trained with self-supervision
* audio domain: such architectures have also been successfully utilised
* hE not evaluated the influence of model size and pre-training data on
  downstream performance, and limited attention to
  * generalisation, robustness, fairness, and efficiency
* we: a thorough analysis of these aspects on several pre-trained variants of
  wav2vec 2.0 and HuBERT that we
  * fine-tuned on the dimensions arousal, dominance, and valence of
    MSP-Podcast, while additionally using
  * IEMOCAP and MOSI to test cross-corpus generalisation
* new SOTA performance for valence prediction without explicit linguistic info,
  * unlike recent multimodal approaches that explicitly utilise textual info
  * concordance correlation coefficient (CCC) of .638 on MSP-Podcast
* our investigations reveal that transformer-based architectures are
  * more robust to small perturbations compared to a CNN-based baseline and
  * fair with respect to biological sex groups, but
  * not fair towards individual speakers
* success on valence is based on implicit linguistic information learnt
* remaining issues: robustness and individual speaker

# 1 Intro

* prediction of an emotional category or dimensional value through the
  * linguistic (what has been said) or the
    * primarily contained in textual information (eg the transcription of an)
    * better suited for valence recognition [5, 6, 7, 8] and
    * can heavily draw from recent advances in ASR and NLP [9, 10, 11], but
    * might be limited to a single language
  * paralinguistic (how it has been said) stream [4] – or
    * acoustic and prosodic information contained in the raw audio signal
    * works better for arousal and dominance [5, 6, 7, 8] and has the
    * potential to generalise across different languages, while
    * typically suffering from low valence performance [4, 8]
  * multimodal architectures (combination of several different models)
    * the strengths of both paradigms can be utilised in complementary fashion
    * a potentially prohibitive strain on computational resources, while
    * still limited to a single language
  * we aim towards a model that only implicitly (if at all) utilises the
    linguistic information stream during deployment, and does
    * not require access to ASR and NLP frontends
* challenges remain for real-world paralinguistics-based SER applications:
  * improving on its inferior valence performance [4, 8],
  * overcoming issues of generalisation and robustness [12, 13], and
  * alleviating individual~ and group-level fairness concerns [14, 15]
* Previous works have attempted to tackle these issues in isolation, eg by
  * eg cross-modal knowledge distillation to increase valence performance [16],
  * speech enhancement or data augmentation to improve robustness [12, 13], and
  * de-biasing techniques to mitigate unfair outcomes [17]
* each of those approaches comes with its own hyperparameters to tune
* general-purpose foundation models that can be easily adapted to several use-
  cases [18]
  * trained on large datasets, often using proxy tasks
    to avoid dependencies on hard-to-acquire labels, and then
  * fine-tuned on (small) sets of labelled data for their intended tasks
  * tremendous success in computer vision [19], NLP [20], and
    computer audition [21, 22] – including SER [23, 24, 25]
  * speech: wav2vec 2.0 [21] and HuBERT [22]
* best performing model publicly available [26]
  * the first transformer-based dimensional SER model released
  * [an introduction how to use it](https://github.com/audeering/w2v2-how-to)

# 2 Rel work: wav2vec2.0 and HuBERT utilised for (primarily categorical) SER

* Table 1: a summary of recent works based on wav2vec 2.0 and HuBERT on the
  IEMOCAP dataset [33], where most prior works have focused
  * ranked by unweighted average recall (UAR) / weighted average recall (WAR)
  * four emotional categories of anger (1103 utterances), happiness (1636),
    sadness (1084), and neutral (1708), which is the typical categ for IEMOCAP
  * unbalanced class problem, UAR and WAR can diverge
    * nL Yuan+ [28] report both yielding almost identical values. We therefore
      assume that a ranking over both metrics is still meaningful. Most of the
  * cross-validation
    * most works apply leave-one-session-out cross validation (5 folds), except
      Yuan+ [28] using leave-one-speaker-out cross validation (10 folds) and
      Wang+ [23] who do not explicitly mention which folds they used. The
  * model size
    * base architecture (w2v2-b / hubert-b) or the large architecture (w2v2-L /
      hubert-L) in a down-stream classification task (for
      * more details on the models, see Section 3.2). Even though, authors have
  * different head architectures and training procedures
* general observations from Table 1:
  1. roughly 10% better performance with models where the weights of the
     pre-trained model were not frozen during the down-stream task
  2. Using a pre-trained model fine-tuned for speech recognition does not help
     with the down-stream task (eg row 15 vs row 19 −3.2%)
  3. When the base and the large architecture of the same model type are tested
     within the same study, the
     large one yields better results (eg row 17 vs row 22 +3.0%), though the
     difference can be quite small (eg row 19 vs row 20 +.5% )
  4. Likewise, in that case HuBERT outperforms wav2vec 2.0
     (eg row 22 vs row 20: +2.1%)
  5. When performing a fine-tuning of the transformer layers, a
    simple average pooling in combination with
    a linear classifier built over wav2vec 2.0 or HuBERT (Wang+ [23]) 
    shows best performance in the ranking
    * hE, some of the more complex models [32] only report results without fint
      * eg the cross-representation encoder-decoder model proposed by Makiuchi+
* dimensional emotion
  * the aforementioned studies have focused on emotional categories
  * several studies concentrate on dimensions
* most comparable to ours is that of Srinivasan+ [16], 
  * wav2vec 2.0 / HuBERT fine-tuned on arousal, dominance, and valence
  * particularly good in predicting valence 
    * a feature which has long escaped audio-based models
  * When additionally joining audio embeddings from the fine-tuned models and
    text representations obtained with a pre-trained BERT model, they got a
    concordance correlation coefficient (CCC) for valence of .683 on the
    MSP-Podcast corpus [34]
  * they distill the multi-model system to an audio-only model using
    student-teacher transfer learning, while still reaching a CCC of .627
    * massive improv compared to the previous SOTA performance of .377 [35]
  * Table 2, summarises their results for w2v2-b, hubert-b, w2v2-L, and
    hubert-L without cross-modal distillation
  * back up two of our earlier findings: the
    * large architecture is superior to the base model and
    * HuBERT outperforms wav2vec 2.0
  * CCC performance surpasses both that of
    * Triantafyllopoulos+ [4] (.515), who proposed a multimodal fusion of
      pre-trained BERT embeddings with an untrained CNN model, and of
    * Li+ [35] (.377) who
      * pre-train a CRNN model on LibriSpeech
        * using Contrastive Predictive Coding and subsequently
      * fine-tuned it on MSP-Podcast
* ? influence of the amount and domain of the data used for pre-training
  * eg the large model consistently shows better performance
    * hE unclear if that can be attributed to the additional layers or the fact
      that it was trained on 60 times more data compared to the base model
  * since the models used in previous work were all pre-trained on read English
    * ? impact that the use of speech from other domains may have
  * we therefore present a systematic comparison of different models
    pre-trained under various conditions (eg including noisy speech) and
    evaluate them on several datasets (in-domain and cross-corpus)
* augmentation ie perturbation ie noise and reverb
  * Besides investigating performance of SER models on clean test data, it is
    important to show that they also work well under more challenging condis
  * augmentation methods have been used to improve performance on clean test
    data [36, 37],
  * hE only a few studies have evaluated performance on augmented test data
  * prev SER models show robustness issues (Jaiswal& [38] and Pappagari+ [39])
    * particularly for background noise and reverb
  * we systematically investigate robustness of transformer-based models
    against a variety of augmentations, focusing on small perturbations of the
    input signal as larger changes can modify the perceived emotion [38, 40]
* fairness is an important, but challenging topic for machine learning models
  * group fairness, eg biological sex in automatic speech recognition [41]
  * For SER models, only a few evaluations are available
  * Gorrostieta+ [17] found a decrease in CCC for females compared to males for
    arousal in MSP-Podcast (v1.3) of around .234 for their convolutional model
    * individual fairness by estimating the influence of the speaker on the
      model performance
      * a known problem for other speaker verification models [42]

# 3 Experimental setup: models, databases, and evaluation methods

## 3.3 Datasets

* We used the MSP-Podcast corpus [34] (v1.7) to run multitask training on the
  three dimensions of arousal, dominance, and valence
  * 84 hours of naturalistic speech from podcast recordings
  * original labels cover a range from 1 to 7, which we normalise into the
    interval of 0 to 1. In-domain results are reported on the test-1 split
    * The test-1 split contains 12, 902 samples (54% female / 46% male) from 60
      speakers (30 female / 30 male)
    * samples per speaker are not balanced and vary between 42 and 912. The
      samples have a combined length of roughly 21 hours, and
      * vary between 1.92 s and 11.94 s per sample
* We report cross-domain results for the IEMOCAP  dataset [33]
  * ie Interactive Emotional Dyadic Motion Capture
  * roughly 12 hours of scripted and improvised dialogues by ten speakers (5
    female / 5 male). It provides
  * the same dimensional labels as MSP-Podcast corpus, but in a range of 1--5,
    which we normalise to the interval 0 to 1
  * Since we use the dataset only during evaluation, we do not apply the usual
    speaker cross-folding, but treat the corpus as a whole
  * 10, 039 samples (49% female / 51% male) with a 
    * length varying between .58 s and 34.14 s
* Finally, we additionally report cross-corpus results for valence on MOSI
  * ie Multimodal Opinion Sentiment Intensity (MOSI) [49] corpus
  * 4 h of YouTube movie review videos spoken by 41 female and 48 male
  * annotated for sentiment on a 7-point Likert scale ranging from −3 to 3,
    which we normalise to the interval 0 to 1
  * gender/sex labels are not part of the distributed database, we re-annotated
  * We report results on the test set that contains 685 samples (51% female /
    49% male) with a total duration of 1 hour and
    * sample length varying between .57 s and 33.13 s
* arousal and valence from sentiment
  * sentiment is a different concept than valence
  * sentiment corresponds to an attitude held towards a specific object
  * valence more generally characterises a person’s feeling [50]
  * nL sentiment annotations can be decomposed to intensity and polarity [51],
    which we consider to roughly correspond to arousal and valence
  * We expect some correlation between
    (predicted) valence and (annotated) sentiment scores
  * As our primary interest is a
    between-model comparison for out-of-domain generalisation, and
    not the absolute sentiment prediction performance itself
    => the use of MOSI for cross-corpus experiments well-motivated practically

# 4 Results with publicly-available pre-trained models for dimensional SER (cf)

## 4.1 Can transformer-based models close the performance gap for valence?

## 4.2 Do the models generalise better across different domains?

## 4.3 More (and more diverse) data during pre-training ?=> better performance?

## 4.4 Does a larger architecture lead to better performance?

## 4.5 Are the models robust against small perturbations to the input signals?

## 4.6 Are the models fair regarding the biological sex of the speaker?

## 4.7 Is performance equal across all speakers?

## 4.8 Does explicit linguistic information further improve performance?

# 5 Analysis 13

## 5.1 Why do transformer-based models generalise so well?

## 5.2 How important is a fine-tuning of the transformer layers?

## 5.3 Do the models implicitly learn linguistic information?

# 6 Efficiency improvements 18

## 6.1 Does pre-training help with training stability and convergence?

## 6.2 How many transformer layers do we really need?

## 6.3 Can we reduce the training data without a loss in performance?

# 7 Summary 21

# 8 Conclusion
