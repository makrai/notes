A Multimodal Corpus for Emotion Recognition in Sarcasm
Anupama Ray, Shubham Mishra, Apoorva Nunna, Pushpak Bhattacharyya
(LREC 2022), pages 6992–7003 Marseille, 20-25 June 2022

dataset enriched with var- ious annotations and the code
for research purposes: https://github.com/apoorva-nunna/MUStARD_Plus_Plus

# Abstract

* sentiment and emotion analysis have been studied extensively,
* hE the relationship between sarcasm and emotion remained unexplored. A
  sarcastic expression may have a variety of underlying emotions. For example,
  “I love being ignored” belies sadness, while “my mobile is fabulous with a
  battery backup of only 15 minutes!” expresses frustration.
Detecting the emotion behind a sarcastic expression is non-trivial yet an
important task. We undertake the task of detecting the emotion in a sarcastic
statement, which to the best of our knowledge, is hitherto unexplored. 
* We start with MUStARD, the recently released multimodal sarcasm detection
  * pre-annotated with 9 emotions. 
  * We identify and correct 343 incorrect emotion labels (out of 690). 
  * We double the size of the dataset, 
  * label it with emotions along with valence and arousal which are important
  * we label each sarcastic utterance with one of the four sarcasm types:
    Propositional, Embedded, Likeprefixed and Illocutionary
* experimentation with multimodal (text, audio, and video) fusion models
  establishes a benchmark for exact emotion recognition in sarcasm and
* outperforms the SOTA
