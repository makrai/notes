    Multi-task learning for speech emotion recognition in naturalistic conditions
    Bartłomiej Zgórzyński, Juliusz Wójtowicz-Kruk, Piotr Masztalski, Władysław Średniawa
Interspeech 2025 [challange](/naini-25-interspeech-ser-msp-podcast.md)

* a multi-encoder joint classification and regression training framework for
* a multi-modal, multi-encoder architecture with a fusion module
* Our results demonstrate the effectiveness of the multi-task approach for both
  * top 10 spot in categorical emotion classif and 2nd place in emo attribute
* ablation study shows that employing multi-task learning outperforms separate
  task-specific training

# 3. Methodology

## 3.1 System architecture

* we process both the audio recording and its transcription simultaneously
  * pre-trained expert models that extract latent space features from both text
    and audio.  Encoders: Whisper Encoder [25], WavLM [26], and RoBERTa [10]
* Fusion, fig 1: To aggregate and interpret the outputs from multiple encoders
  * attentive statistics pooling (ASP) layers [29],
    * to reduce the dimensionality of the outputs from each encoder
  * projection layers, and
    * dense layers are used to project the embeddings into a common dim
  * an LSTM layers to capture relationships between embeddings from different
    experts, we incorporate LSTM layers. Finally,
  * a single linear layer predicts both emotion logits and speech attribute
    * scaled sigmoid function applied to constrain attribute values within 1–7
      The architectural diagram of the proposed
      solution is presented in the Figure 1

## 3.2. Training strategy

* Speech emotion recognition and speech attribute prediction are highly corred
  ~> two phases: multi-task pre-training and task-specific fine-tuning
* for multi-task pre-training, we use a weighted sum of loss functions, where
  * the weights are treated as training hyperparameters. For model optimization,
  * weighted cross-entropy loss for emotion classification and
  * mean squared error for speech attribute prediction. The loss function is
* task-specific fine-tuning
  * classification task, we use a standard cross-entropy loss
  * regression task, the label distribution of the attribute values caused the
    model to focus on predictions close to the mean
  ~> we incorporate a Gaussian penalty
  * The final formulation of the loss function is presented below
  $L reg = \mean \exp ( - (ŷ_i − µ)^2 / 2σ^2 ) · (y_i − ŷ_i )^2_{}$
  * y i is the true value, ŷ i is the predicted value,
  * µ = 4 and σ are set as the mean and standard deviation of the Gaussian func
  * mean is among the batch
  * Scaling the loss function penalises the model for predicting
    values close to the mean that are actually far from the true values
  * This approach significantly expanded the model prediction value range
