Towards Multimodal Sarcasm Detection (An _Obviously_ Perfect Paper)
Santiago Castro, Devamanyu Hazarika, Verónica Pérez-Rosas, Roger Zimmermann, Rada Mihalcea, Soujanya Poria
ACL 2019 arXiv:1906.01815 [cs.CL]

The full dataset is publicly available at github.com/soujanyaporia/MUStARD

# Abstract

* Sarcasm is often expressed through several verbal and non-verbal cues, eg,
  a change of tone, overemphasis in a word, a drawn-out syllable, or a straight
  looking face
  * Most recent works were textual
* we argue that incorporating multimodal cues can improve the automatic
  * a new sarcasm dataset, Multimodal Sarcasm Detection Dataset (MUStARD),
    compiled from popular TV shows. MUStARD consists of 
  * audiovisual utterances annotated with sarcasm labels
  * Each utterance is accompanied by its context of historical utterances in
    the dialogue, which provides additional information on the scenario
* initial results show that the use of multimodal information can reduce the
  relative error rate of sarcasm detection by up to 12.9% in F-score when
  compared to the use of individual modalities

# 4 Multimodal Feature Extraction

## Text Features: We represent the textual utterances in the dataset using

* BERT (Devlin 2018) provides a sentence representation ut ∈ Rdt for every
  utterance u
  * we average the last four transformer layers of the first token ([CLS]) in
  * BERTBase model – to get a unique utterance representation of size dt =
* We also considered averaging Common Crawl pre-trained 300 dimensional GloVe
  * it resulted in lower performance as compared to BERT-based features.

## Speech Features: To leverage information from the audio modality, we obtain

* low-level features from the audio data stream for each utterance in the
  * intended to provide information related to pitch, intonation, and other
    tonal-specific details of the speaker (Tepperman 2006)
* We utilize the popular speech-processing library Librosa (McFee 2018) and
  1. we load the audio sample for an utterance as a time series signal with a
     sampling rate of 22050 Hz
  2. remove background noise from the signal by applying a heuristic
     vocal-extraction method.3 Finally, we 
  3. segment the audio signal into dw nonoverlapping windows
    to extract local features that include MFCC, melspectogram, spectral
    centroid and their associated temporal derivatives (delta).  Segmentation
    * a fixed length representation of the audio sources which are otherwise
    * All the extracted features are concatenated together to compose a da =
      283 dimensional joint representation {uai }di=1 for each window.  
  * The final audio representation of each utterance is obtained by calculating
    the mean across the window segments, ie  ua = d1w (∑i uai ) ∈ Rda .

## Video Features: We extract 

* visual features for each frame using a `pool5` layer of an ImageNet (Deng 09)
  pretrained ResNet-152 (He 2016) image classification model
  * preprocess every frame by resizing, center-cropping and normalizing it.  To
  * each utterance, we compute the mean of the obtained dv = 2048 dimensional
    feature vector uvi for every frame: uv = f1 (∑i uvi ) ∈ Rdv 
* we could use more advanced visual encoding techniques (eg, recurrent neural
  network encoding techniques), we decide to use the same averaging strategy as
  with the other modalities.

# 7 Conclusion

* we developed models that leverage three different modalities, including 
  text, speech, and visual signals
  * We also experimented with the integration of context and speaker info
* challenges that we believe are important to address in future research work
  on multimodal sarcasm detection.

## Multimodal fusion: So far, we have only explored early fusion for multimodal

* Future work could investigate advanced spatiotemporal fusion strategies (
  * eg Tensor-Fusion (Zadeh 2017), CCA (Hotelling, 1936)) to better encode the
* fusion strategies that can better model incongruity among modalities

## Multiparty conversation: The dialogues represented in our dataset are often

* multimodal ~> better relationship modeling (Majumder 2018), and 
* exploit models that provide gesture, facial and pose information (Cao 2018).

## Neural baselines: As we strove to create a 

* high quality vs corpus size
* the occurrence of sarcastic utterances itself is scanty. To focus on effects
* we chose a balanced version of the dataset with a limited size. This,
  => the problem of over-fitting in complex neural models. As a consequence, in
  * SVM classifiers perform better than CNNs. Future work should try to
* solutions involving pre-training, transfer learning, domain adaption, or
  low-parameter models.

## Sarcasm detection in conversational context:

* MUStARD is inherently a dialogue level dataset where 
  we aim to classify the last utterance in the dialogue. In a dialogue, to
* we utilize conversational context
* hE key conversation specific factors such as interlocutors’ goals, intents,
  dependency, etc. (Poria 2019). Considering these factors can improve

## Main speaker localization

* We currently extract visual features ubiquitously for each frame.  As 
* gesture and facial expressions are important features for sarcasm analysis,
* the capability for models to identify the speakers in the multiparty videos
  is likely to be beneficial for the task.  Finally, we believe the resource
