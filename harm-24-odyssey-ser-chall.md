TalTech Systems for the Odyssey 2024 Emotion Recognition Challenge
Henry Härm; Tanel Alumae
Odyssey 2024

# Abstract

* we fuse the predictions of text and speech based emotion recognition models
  * audio-based model adapts the Wav2Vec2-BERT model for emotion recognition,
  * text-based model uses finetuned LLaMA2-7B as the backbone
  * combined for the classification task by training a multi-class logistic
    regression model, using the posteriors of the underlying models as input
* classification: macro-F1 score of 0.354 on evaluation data, ranked 2nd
* attribute prediction: an average score of 0.5144, ranked 6th
* from the conclusion: it is also important to tune the models’ predictions to
  the expected prior probabilities of the evaluation data

# 1. Intro

* wav2vec2.0 [7] enables self-supervised learning of speech representations by
  masking latent representations of the raw waveform and
  solving a contrastive task over quantized speech representations
  * SOTA results in many speech processing benchmarks and evaluations
    * speech recognition [7]
    * spoken language identification [8]
    * emotion recognition [9, 10, 11]
* Alternatively, emotion recognition can be done in the text domain by firstly
  transcribing the speech
  * specific LLM models can be trained as in [14], where
    * an emotion and context knowledge enhanced LLM (DialogueLLM) was proposed
    * finetuned from publicly available LLMs using parameter-efficient
      methodologies such as low-rank adaptation (LoRA) [15],
      optimizing them for speech emotion recognition (SER) tasks
* we: the Tallinn University of Technology (TalTech) team for the Odyssey 2024
  * based on two freely available foundation models:
    * Wav2Vec2-BERT for speech and LLaMA2-7B for text
  * Both models are adapted to emotion recognition using additional output
    layers and the foundation model backbones are finetuned for emotion
    classification using LoRA
  * classification task, the two models are combined using an additional
    logistic regression model that uses the posteriors of the underlying models
  * attribute prediction, we combine the models using attribute-specific
    interpolation weights
  * Our best systems were ranked second in the emotion classification task and
    sixth in the emotional attribute prediction task

# 2. Data

* The average duration of utterances in the training set is 5.8 seconds
* we decided to automatically transcribe all data splits on our own,
  in order for the eval data transcripts to be consistent with training & dev
  * using the NVIDIA NeMo Canary 1B1 multiling ASR model [17], greedy decoding

# 3. Methods

* Our approach to emotion recognition is based on finetuning speech or text
  based foundation models
* Table 1 provides a overview of the models with which we experiment

## 3.1. Speech-based emotion recognition

* For both emotion category and emotion attribute prediction
* based on the Wav2Vec2BERT model shared by the Seamless4MT project [18]
  * pre-trained on 4.5M hours of unlabeled audio data covering
    > 143 languages, using self-supervised loss
  * the same architecture as Wav2Vec2.0 [7], but replaces the attention-block
    with a Conformer-block as introduced in [19]
    * [19] Anmol Gulati, James Qin, Chung-Cheng Chiu, Niki Parmar, Yu Zhang,
        Jiahui Yu, Wei Han, Shibo Wang, Zhengdong Zhang, Yonghui Wu, et al.,
      “Conformer: Convolution-augmented transformer for speech recognition,”
      arXiv preprint arXiv:2005.08100, 2020
  * also employs a causal depthwise convolutional layer and uses
    mel-spectrogram representation of the audio as input, instead of the raw
    waveform. Wav2Vec2BERT uses Shaw-like position embeddings [20]
  * 24 Conformer layers with approximately 600M parameters
* Wav2Vec2-BERT model was adapted into an emotion classification model by
  aggregating its outputs with an attentive pooling layer,
  followed by a fully connected layer featuring ReLU activation and BatchNorm,
  and the final output layer, corresponding to the emotion categories
  * This model categorizes emotions into eight primary classes, along with “O”
    (Other) and “X” (No agreement) as additional distinct classes for training
  * cross-entropy loss on random 2 to 4 second chunks of emotion-labeled
    utterances, employing consensus-based labels derived from plurality voting
    rather than directly utilizing individual annotator labels
  * on-the-fly data augmentation was applied using point source noises and
    simulated room impulse responses (RIRs) from the MUSAN corpus
  * training regimen spanning 10 epochs, with optimization via Adam, a
    * peak learning rate of 10−4, weight decay 0.001 and an
    * effective batch size of 64
  * speed perturbation was applied to half of the training batches
    to further diversify training data
  * LoRA was employed to fine-tune the pre-trained model, optimizing its
    performance with a configuration (rank = 32, α = 32 and dropout = 0.05)
    ~> only around 8 million trainable parameters
* The emotion classification model was not directly used for prediction but
  it served as an embedding extractor
  * Utterance embeddings were derived from the output of the first dense
    layer following the pooling layer. A logistic regression model was then
    trained on these embeddings, excluding data labeled as “X” and “O” with
    feature normalization and dimensionality reduction to 15 using LDA
* The training data is highly unbalanced with regard to the emo categories.
  * hE the emotion distribution in evaluation data is uniform. Therefore,
  ~> we post-processed the trained logistic regression model to use uniform
  prior over the 8 emotion categories, by appropriately modifying the biases of
  the softmax layer
* attribute prediction, the model structure mirrored that of classification
  model, but replaced the final softmax layer with a tanh nonlinearity, fol-
  lowed by an additional linear layer with three outputs
* Training initially used 3 to 4-second audio chunks, with subsequent fine-
  tuning on 6 to 8-second segments, using training data where
  * the proportion of different categories had been balanced. This adjustment
    * because for the neutral category (which was dominating in training data),
      the mean value for most attributes was considerably lower than for other
      categories. As a
  * loss function, we used negative average CCC of the current batch

## 3.2. Text-based emotion recognition

* an open-source LLaMA 23 LLM with 7 billion parameters is fine-tuned
* category prediction task, the model is initialized with a
  sequence classification head, which is a linear layer using the last token in
  order to do the classification, similar to other causal models. The linear
  * 8 features according to the number of categories
  * trained on automatically generated utterance transcriptions
* attribute prediction task, the model is initialized with
  a sequence classification head configured with three output features
  * a regression task with a loss function based on the mean CCC of V, A, and D
* LoRA adapter is used (rank = 256, α = 256 and dropout = 0.1) for efficient
  fine-tuning over 40 epochs, using AdamW optimizer
  * learning rate of 2 × 10−5 and a batch size of 16
  * As LLaMA does not have a pad token we set it to be the same as EOS token
* alternative method, we train a model using RoBERTa [21] as the backbone
  * the same architecture as with the LLM model and finetuned with similar
    hyper-parameters, however it is not necessary to utilize a LoRa adapter
* we rebalance the predictions of the text-based model
  to follow a uniform prior over the categories
  * we “fix” the conditional probability distribution P (y|x) returned by the
    emotion identification model for input x to use the uniform prior

## 3.3. Combining outputs from audio and text-based models

### 3.3.1. Emotion category identification

* We tried two approaches for fusing predictions from audio and text-based
  1. simply linearly interpolate the posterior probabilities produced by
    * interpolation coefficient optimized on the balanced development data
    * The optimal interpolation coefficient is found using grid search from the
      interval of [0, 1] using a step size of 0.05
  2. multi-class logistic regression model, using the posteriors of the
     underlying models as input features. L2 penalty with the value of 1.0 is
     used for avoiding overfitting

### 3.3.2. Emotion attribute prediction

* linear interpolation for fusing the predictions of two models. For each
  attribute dimension, an optimal interpolation coefficient was found

# 4. Results

* we created another subset `Dev_bal` that contains 300 randomly selected items
  for each primary category, making it more similar to the evaluation dataset
* This subset was used for
  optimizing all hyperparameters and for training fusion models

## 4.1. Emotion category prediction The macro-F1 scores of diff models: Tab 3

* F1 scores of the text-based models surpass those of the audio-based models,
* LLaMA2-based model with balanced priors being the most accurate.  However,
* interpolating its predictions with those of a audio-based model provides
  substantial improvements both on development and evaluation data
* The optimal interpolation coefficient of the text-based model was 0.45
* Fusion using logistic regression gives noticeably larger improvements on
  development data than on evaluation data, suggesting moderate overfitting on
* Our two fusion systems were ranked 2nd and 3rd among all submissions

## 4.2. Emotion attribute prediction Table 2 presents the CCC scores for

* significance of fine-tuning the audio-based emotion model with balanced data,
  * notably enhances CCC scores across all evaluated attributes
* text-based model demonstrates an impressive accuracy in predicting valence,
  * optimal interpolation coefficient in the fusion identified at 0.55
  * arousal and dominance: the text-based model’s predictions do not contribute
    positively when optimized on development data, and the corresponding
    optimal interpolation coefficients were set to zero
* our fusion model, which integrates both audio and text-based predictions, did
  not surpass the baseline model in terms of the average CCC metric on
  evaluation data. While our model achieved
  * the highest accuracy in valence prediction among all submissions in the
  * significantly underperformed in predicting arousal and dominance
  * average CCC score, our best submission was ranked 6th in the team ranking

# 5. Post-evaluation experiments

* we experimented with some additional pretrained models
1. we finetuned the English SONAR speech encoder model [22] for emotion identif
  * SONAR speech encoders are based on the finetuned Wav2Vec2BERT model, with
    an additional sentence embedding layer that is
    trained to map spoken utterance embeddings into the same semantic space as
    the corresponding text-based sentence embeddings
    * The embedding layer uses simple mean pooling
  * we finetuned SONAR for emotion recognition using LoRA, using
    * the same hyperparameters as when training the Wav2Vec2-BERT based model
    * emotion recognition model benefits from pretraining on an ASR task [11]
    * Row #9 in Table 3 shows that
      the SONAR-based model indeed outperforms Wav2Vec2-BERT based model
    * we also replaced logistic regression based classification of the
      utterance embeddings with PLDA-based scoring
    * PLDA is a generative model and does
      not depend on the prior probability of the different categories in the
      training data, eliminating thus the need for the prior balancing step
2. we finetuned the larger 70 billion parameter variant of the LLaMA2 model
   for text based emotion classification. The model is much larger
  * quantization to load the model weights and activations with lower 4-bit
    data types, which is a technique to reduce memory and computational cost
  * nested quantization, which saves additional memory with minimal perf impact
  * overflow issues while training the model with fp16 computational type,
  ~> we selected bf16 (brain floating point) for its larger dynamic range
  * finetune with 80GB A100 GPUs. We finetuned our model for 4 epochs with a
    LoRa rank of 16, alpha of 16 and dropout of 0.05
  * Row #10 in Table 3 shows that the model outperforms our 7 B parameter model
  * F1 score of 0.334 on our balanced dataset
  * outperformed the previously mentioned SONAR-based model. Row #11 shows that
  * fusing the SONAR and larger LLaMA2 model outperforms previous interpolation
    of Wav2Vec2-BERT and LLaMA2-7b models results with an F1 score of 0.362
