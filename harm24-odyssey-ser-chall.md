TalTech Systems for the Odyssey 2024 Emotion Recognition Challenge
Henry Härm; Tanel Alumae

# Abstract

* we fuse the predictions of text and speech based emotion recognition models.
  * audio-based model adapts the Wav2Vec2-BERT model for emotion recognition,
  * text-based model uses finetuned LLaMA2-7B as the backbone. 
  * combined for the classification task by training a multi-class logistic
    regression model, using the posteriors of the underlying models as input
    features. The model obtained a 
* classification: macro-F1 score of 0.354 on evaluation data and was ranked 2nd
* attribute prediction: an average score of 0.5144 and was thereby ranked 6th
