Sentiment and Emotion help Sarcasm?  A Multi-task Learning Framework for
  Multi-Modal Sarcasm, Sentiment and Emotion Analysis 
Dushyant Singh Chauhan, Dhanush S R, Asif Ekbal, Pushpak Bhattacharyya
ACL 2020

# Abstract

* we hypothesize that sarcasm is closely related to sentiment and emotion
* we propose a multi-task deep learning framework to solve all these three
* multi-modal conversational scenario
1. manually annotate the recently released multi-modal MUStARD sarcasm dataset
   with sentiment and emotion classes, both implicit and explicit
2. multi-tasking, we propose two attention mechanisms, viz. 
  * Inter-segment Inter-modal Attention (Ie-Attention) and 
    * to learn the relationship between the different segments of the sentence
    (across the modalities)
  * Intra-segment Inter-modal Attention (Ia-Attention)
    * Ia-Attention focuses within the same segment of the sentence 
      (across the modalities)
  * representations from both the attentions are concatenated and shared across
    the five classes (ie sarcasm, implicit sentiment, explicit sentiment,
    implicit emotion, explicit emotion) for multi-tasking
* results on the extended version of the MUStARD dataset show the 
  * efficacy over the existing SOTA systems
  * better performance for the primary task, ie sarcasm detection,
    with the help of two secondary tasks, emotion and sentiment analysis.
