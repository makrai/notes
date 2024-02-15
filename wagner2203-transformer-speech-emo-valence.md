Dawn of the transformer era in speech emotion recog: closing the valence gap
Johannes Wagner, Andreas Triantafyllopoulos, Hagen Wierstorf,
  Maximilian Schmitt, Felix Burkhardt, Florian Eyben, Björn W. Schuller
arXiv:2203.07378 [eess.AS]


# Abstract

* transformer-based architectures pre-trained with self-supervision
* audio domain: successfully utilised
* hE not evaluated
  * influence of model size and pre-training data on downstream performance,
  * generalisation, robustness, fairness, and efficiency
* we: a thorough analysis of these aspects on several pre-trained variants of
  wav2vec 2.0 and HuBERT that we
  * fine-tuned on the dimensions arousal, dominance, and valence of
    MSP-Podcast (Lotfian and Busso, 2019), while additionally using
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
  * individual~ and group-level fairness [14, 15]
* Previous works have attempted to tackle these issues in isolation, eg by
  * eg cross-modal knowledge distillation to increase valence performance [16],
  * speech enhancement or data augmentation to improve robustness [12, 13], and
  * de-biasing techniques to mitigate unfair outcomes [17]
* each of those approaches comes with its own hyperparameters to tune
* general-purpose foundation models
  that can be easily adapted to several usecases [18]
  * trained on large datasets, often using proxy tasks to avoid dependencies on
    hard-to-acquire labels, and then
  * fine-tuned on (small) sets of labelled data for their intended tasks
  * tremendous success in computer vision [19], NLP [20], and
    computer audition [21, 22] – including SER [23, 24, 25]
  * speech: wav2vec 2.0 [21] and HuBERT [22]
* best performing model publicly available [22]
  * J Wagner, A Triantafyllopoulos, H Wierstorf, M Schmitt, F Eyben, B Schuller
    Model for Dimensional Speech Emotion Recognition based on Wav2vec 2.0,
    2022 DOI: 10.5281/zenodo.6221127.
  * the first transformer-based dimensional SER model released
  * [an introduction how to use it](https://github.com/audeering/w2v2-how-to)


# 2 Related work: wav2vec2.0 and HuBERT for (primarily categorical) SER

* Table 1: a summary of recent works based on wav2vec 2.0 and HuBERT on the
  IEMOCAP dataset [33], where most prior works have focused
  * ranked by unweighted/weighted average recall (UAR/WAR)
  * four emotional categories of anger (1103 utterances), happiness (1636),
    sadness (1084), and neutral (1708), which is the typical categ for IEMOCAP
  * unbalanced class problem, UAR and WAR can diverge
    * nL Yuan+ [28]: both yield almost identical values
  * cross-validation
    * most works apply leave-one-session-out cross validation (5 folds), except
      Yuan+ [28] using leave-one-speaker-out cross validation (10 folds) and
      Wang+ [23] who do not explicitly mention which folds they used
  * model size
    * base architecture (w2v2-b/hubert-b) or the
      large architecture (w2v2-L / hubert-L) in a down-stream classification
    * more details on the models, see Section 3.2
  * different head architectures and training procedures
* general observations from Table 1:
  1. roughly 10% better performance with models where the weights of the
     pre-trained model were _not frozen_ during the down-stream task
  2. Using a pre-trained model fine-tuned for speech recognition does not help
     with the down-stream task (eg row 15 vs row 19 −3.2%)
  3. When the base and the large architecture of the same model type are tested
     within the same study,
    * the large one yields better results (eg row 17 vs row 22 +3.0%), though
    * hE difference can be quite small (eg row 19 vs row 20 +.5%)
  4. Likewise, in that case HuBERT outperforms wav2vec 2.0
    (eg row 22 vs row 20: +2.1%)
  5. When performing a fine-tuning of the transformer layers, a simple
    average pooling in combination with a linear classifier built over
    wav2vec 2.0 or HuBERT (Wang+ [23]) shows best performance in the ranking
    * hE, some of the more complex models [32] only report results without fint
    * eg the cross-representation encoder-decoder model by Makiuchi+ (2021)
* dimensional emotion (deferred)
  * the aforementioned studies have focused on emotional categories
  * several studies concentrate on dimensions
* most comparable to ours is that of Srinivasan+ [16],
  * wav2vec 2.0/HuBERT fine-tuned on arousal, dominance, and valence
  * particularly good in predicting valence
    * a feature which has long escaped audio-based models
  * When additionally joining
    audio embeddings from the fine-tuned models and
    text representations obtained with a pre-trained BERT model:
    a concordance correlation coefficient (CCC) for valence of .683 on the
    MSP-Podcast corpus [34]
  * Srinivasan+ distill the multi-model system to an audio-only model using
    student-teacher transfer learning, while still reaching a CCC of .627
    * massive improvment compared to the previous SOTA performance of .377 [35]
  * Table 2 summarises their results for w2v2-b, hubert-b, w2v2-L, & hubert-L
    without cross-modal distillation
  * these back up two of our earlier findings:
    * large architecture is superior to the base model and
    * HuBERT outperforms wav2vec 2.0
  * CCC performance surpasses both that of
    * Triantafyllopoulos+' [4] (.515) multimodal fusion of
      pre-trained BERT embeddings with an untrained CNN model
    * Li+ [35] (.377) who
      * pre-train a CRNN model on LibriSpeech
        * using Contrastive Predictive Coding
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
  * augmentation methods to improve performance on clean test data [36, 37]
  * hE only a few studies have evaluated performance on augmented test data
  * prev SER models show robustness issues (Jaiswal& [38] and Pappagari+ [39])
    * particularly for background noise and reverb
  * we systematically investigate robustness of transformer-based models
    against a variety of augmentations, focusing on small perturbations of the
    input signal as larger changes can modify the perceived emotion [38, 40]
* fairness is an important, but challenging topic for machine learning models
  * group fairness, eg biological sex in automatic speech recognition [41]
  * For SER models, only a few evaluations are available
  * Gorrostieta+ [17]: lower CCC for females compared to males for arousal in
    MSP-Podcast (v1.3) of around .234 (convolutional model)
  * individual fairness: the influence of the speaker on the performance
  * a known problem for other speaker verification models [42]


# 3 Experimental setup: models, databases, and evaluation methods

## 3.3 Datasets

* We used the MSP-Podcast corpus [34] (v1.7) to run multitask training on the
  three dimensions of arousal, dominance, and valence
  * 84 hours of naturalistic speech from podcast recordings
  * emotionally balanced
  * original labels cover a range from 1 to 7, which we normalise into 0..1
    * In-domain results are reported on the test-1 split
    * test-1 split contains 12, 902 samples (54% female) from 60 speakers (50%)
    * samples per speaker vary between 42 and 912
      * combined length: roughly 21 hours, and
      * vary between 1.92 s and 11.94 s per sample
* We report cross-domain results for the IEMOCAP  dataset [33]
  * ie Interactive Emotional Dyadic Motion Capture
  * ~ 12 hours of scripted and improvised dialogues by 10 speakers (5 females)
  * the same dimensional labels as MSP-Podcast corpus, but in a range of 1--5,
    which we normalise to the interval 0 to 1
  * Since we use the dataset only during evaluation, we do not apply the usual
    speaker cross-folding, but treat the corpus as a whole
  * 10,039 samples (49% female), length between .58 s and 34.14 s
* Finally, we additionally report cross-corpus results for valence on MOSI
  * ie Multimodal Opinion Sentiment Intensity (MOSI) [49] corpus
  * 4 h of YouTube movie review videos spoken by 41 female and 48 male
  * annotated for sentiment on a 7-point Likert scale ranging from −3 to 3,
    which we normalise to the interval 0 to 1
  * gender/sex labels are not part of the distributed database, we re-annotated
  * We report results on the test set that contains 685 samples (51% female)
    * total duration of 1 hour and
    * sample length varying between .57 s and 33.13 s
* arousal and valence from sentiment
  * sentiment is a different concept than valence
  * sentiment corresponds to an attitude held towards a specific object
  * valence more generally characterises a person’s feeling [50]
  * nL sentiment annotations can be decomposed to intensity and polarity [51],
    which we consider to roughly correspond to arousal and valence
  * We expect some correlation between (predicted) valence and (annotated)
    sentiment scores
  * As our primary interest is a between-model comparison for out-of-domain
    generalisation, and not the absolute sentiment prediction performance
    itself => the use of MOSI for cross-corpus expers is well-motivated
    practically

# 3.4 Evaluation

we evaluate SER models for correctness, robustness, and fairness [48]

## Correctness measures how well predictions match the ground truth

* The concordance correlation coefficient (CCC) provides an estimate of
  how well the predicted distribution matches the ground truth one [49], and is
* the typical measure for evaluating dimensional SER models [50]

## Robustness (cf. Section 4.8) 

* how model performance is affected by changes to the input signals such as
  adding background noise
  * Applying changes to the input might affect the ground truth label [33, 51].
* We focus on testing the robustness of the models against data augmentations
  that do not change the human perception of the underlying emotion
  * We select the following five augmentations from Jaiswal and Provost [33] to
    enable direct comparison with previous results: 
  * Natural soundscapes adds a randomly selected sample from the natural class
    of the ESC-50 dataset [52] with a signal-to-noise ratio (SNR) of 0 dB, 10
    dB or 20 dB
  * Human, non-speech adds a randomly selected sample from the human class of
    the ESC-50 dataset with a SNR of 0 dB, 10 dB or 20 dB
  * Interior/domestic adds a randomly selected sample from the interior class
    of the ESC-50 dataset with a SNR of 0 dB, 10 dB or 20 dB
  * Speed up segment selects a random segment of 10% to 20% length within the
    utterance and increases its speed by 1.25
  * Fade-in/fade-out decreases or increases the amplitude of the signal by 2%
    every second.

## Fairness (cf. Section 4.9) evaluates if the model predictions show

* biases for certain protected attributes like race, gender, or age [53]
* We focus on gender
  * due to the lack of sufficient available information and/or datasets for
  * For regression problems, there is no clear definition how to measure
  * most approaches try to achieve an equal average expected outcome for
    population A and B [54]
  * We measure fairness by estimating the gender fairness score as the
    difference in the correctness metric (CCC) between female and male groups.
  * A positive gender fairness score indicates a better performance of the
    model for female speakers.


# 4 Results with publicly-available pre-trained models for dimensional SER (cf)

## 4.1 Can transformer-based models close the performance gap for valence?

## 4.2 Do the models generalise better across different domains?

## 4.3 [earlier 5.3] Do the models implicitly learn linguistic information?

* To asses how sensitive the models are to linguistic content, we generated a
  synthesised version of a subset of the test set
  from the transcriptions of MSP-Podcast.3
* Figure 4: CCC performance for valence on the original and synthesised
  * performance gaps between the models in Figure 2 are directly linked with
    their ability to predict sentiment. Models reaching a high performance on
    the original files also do so on their synthetic versions and vice versa
* to learn linguistic content, fine-tuning the transformer layers is essential
  * otherwise correlation drops to almost zero
* This finding is also important for works doing in-domain training on IEMOCAP,
  * parts of the conversations are scripted 
    => a leakage of text information that may result in overoptimistic results
    [56] when that text information is exploited by transformer models
* our models may inherit similar biases as those found in NLP models [57]
  A Triantafyllopoulos, J. Wagner, H. Wierstorf, M. Schmitt, U. Reichel,
    F Eyben, F. Burkhardt, and B. W. Schuller
  Probing speech emotion recognition transformers for linguistic knowledge
  InterSpeech 2022 pp. 146–150

## 4.6 [earlier 4.3] More (and more diverse) data during pre-training ?=>
better performance?

* arousal and dominance: all tested models perform equally well, whereas
* valence/sentiment: the data used for pre-training has a strong effect
* Mixing data from several domains
  * among w2v2s: considerable improvement for w2v2-L-robust
    compared to w2v2-L, which is only trained on clean speech
  * hE, hubert-L, which uses the same pre-training data as w2v2-L, which is
    also trained on clean speech, still performs as good as w2v2-L-robust
* multi-lingual data: we see a performance drop when tested on English speech

## 4.4 Does a larger architecture lead to better performance?

## 4.5 Are the models robust against small perturbations to the input signals?

## 4.6 Are the models fair regarding the biological sex of the speaker?

## 4.7 Is performance equal across all speakers?

* Performance for the best foundation models is similar between most speakers
  in MSP-Podcast, but can deteriorate to low CCC values for some speakers

## 4.8 Does explicit linguistic information further improve performance?


# 5 Analysis 13

## 5.1 Why do transformer-based models generalise so well?

* Even without pre-training, the latent space generalises better than CNN14
* it abstracts away domain and speaker
* Pre-training
  * marginally improves arousal and dominance performance but is
  * critical for valence

## 5.2 How important is a fine-tuning of the transformer layers?



# 6 Efficiency improvements 18

## 6.1 Does pre-training help with training stability and convergence?

* Figure 11 shows the mean and standard deviation over the performance on the
  development set across three trials for CNN14 and w2v2-b
  * CNN14 shows a constant jittering across all 60 epochs, whereas
  * w2v2-b converges faster and we can reduce the number of epochs to 5

## 6.2 How many transformer layers do we really need?

* We can reduce the number of transformer layers to 12 without a degradation
  * With less than 12 layers we begin to see a negative effect on valence

## 6.3 Can we reduce the training data without a loss in performance?

* only possible for arousal and dominance


# 6 [earlier 7] Summary 21

## Effect of pre-training

* pre-training is essential to get good performance (Section 4.6), especially
  for the valence dimension
* when training wav2vec 2.0 from a random initialisation (Section 4.11): the
  model performs substantially worse on all three dimensions, and its
  embeddings are unable to capture valence information
* pre-training serves as a form of regularisation which helps stabilise the
  training (Section 5.1), thus resulting in
  * models require less iterations, and less data to train on (Section 5.3)
* hE !=> ‘more pre-training data leads to better performance’
* downstream performance can be negatively impacted by the introduction of more
  data, as seen by the comparison between w2v2-L-vox and w2v2-L-xls-r, which
  differ only in the fact that w2v2-L-xls-r has been trained on more (and more
  diverse) data, yet performs worse on all three dimensions

## Generalisation: transformer-based models show

* very good cross-corpus generalisation (Section 4.6),
* robustness (Section 4.8)
* invariant to domain, speaker, and gender characteristics (Section 4.11)
* These seem to stem primarily from the architecture rather than the
  pre-training as they are also evident in models inited from random (Sec 4.11)
* several self-attention layers can be removed without hampering perf (Sec 5.2)
  * though they might still be necessary for successful pre-training

## Fairness: fairness remains a challenging topic for contemporary ML

* gender (Section 4.9): transformer-based architects are more fair than CNN14
* individual fairness is important for SER
  * challenging even for the top-performing models investigated here (Sec 4.10)
  * long known to impact other speech analysis models [35, 37]

## Integration of linguistic and paralinguistic streams

* transformers seem capable of integrating both information streams of voice
  * well-performing valence prediction models
    * retain their effectiveness for synthesised speech lacking emo intonation
      (Section 4.3)
    * fail to benefit from fusion with explicit textual information (cf Sec 4.2)
  * this is only possible when fine-tuning the self-attention layers (Sec 4.4),
    * keeping them frozen results to complete failure for synthesised speech
      (Section 4.3)
    * ie ft leads to fundamental change in how the underlying signal is
      represented (moving from almost no sensitivity to linguistic content to
      increased reactivity to it)
    * This mechanism may be crucial in the pursuit of paralinguistic and
      linguistic integration which is
      key to a holistic understanding of human communication
  * integration might prove problematic in cases where the two modalities
    disagree, eg in cases of irony [67]. Our results also highlight that
* good valence performance might be language dependent as
  models pre-trained on a variety of languages perform worse for valence
  compared with comparable models pre-trained only for English (Section 4.1)


# 7 Conclusion
