    Developing a High-performance Framework for SER Naturalistic Conditions Chall
      for Emotional Attribute Prediction
    Thanathai Lertpetchpun, Tiantian Feng, Dani Byrd, Shrikanth Narayanan
Interspeech 2025 [challange](/naini-25-interspeech-ser-msp-podcast.md)

[model](https://github.com/tiantiaf0627/vox-profile-release)

* multimodal learning, multi-task learning, and imbalanced data handling
* our best system is trained by adding text embeddings, predicting gender, and
  including ``Other'' (O) and ``No Agreement'' (X) samples in the training set
* a simple two-system ensemble

# Intro

* imbalanced emotion classes ~> undersampling, so that the model identifies
  * this simple method is effective in improving SER performance
  * helps the model converge faster, consequently reducing the training time
* we further investigate the impact of including or excluding speech samples
  with mixed annotations, labeled as “Other” (O) and “No Agreement” (X)
  * Most studies choose to discard these labels without an explicit rationale
  * our findings: these labels contain valuable information
* contributions and findings are summarized below:
  * Incorporating text representations alongside speech embeddings signif +
  * Leveraging auxiliary labels such as gender information +
  * data imbalance: undersampling improves performance and accelerates training
  * Including “Other” and “No Agreement” labels in training, unlike most
    previous work, improves SER performance

# 2. Method

## 2.2. Attribute Representation Learning

* fig 1
* The final representations are fed into three distinct 2-layer MLPs to predict
  arousal, valence, and dominance in a regression task. Since the challenge
  * CCC loss as our learning objective. Moreover, we perform
  * multi-task learning to simultaneously learn emotion attributes alongside
    speaker-specific information such as gender and speaker identity. To achieve
    * we pass the final representation through a separate 2-layer downstream
      model to predict the gender information, optimizing with cross-entropy
      loss
    * we feed the same representation into another downstream model to learn the
      speaker identity representation. When training the model for speaker
      * additive angular margin loss [21], a widely used loss for speaker
        verification tasks, and exclude the speaker embedding from the final
        representation
      * AAM-Softmax loss for speaker prediction

# 3. Experimental Setup

## 3.2 Experimental Details

* The best model was selected based on the performance on the validation set
  For the multitask learning, we used task loss weights α = 1 and β = 0.1
* undersampling method as the default method in most experiments. We use
* WavLM Large and Whisper Large-V3 for the speech foundation model, and
* RoBERTa-Large as the pre-trained text model
* Following the challenge baseline,
  we fine-tune the pre-trained WavLM Large along with the downstream models
  * we froze the model for the Whisper Large-V3 and RoBERTa-Large
  * We will add the prefix “MM (multimodal)” to the model to indicate that the
    model uses text embedding as an auxiliary input. As we did
* no access to the test set and only one submission per week, it was challenging
  * the performances except for Table 6 are reported on the validation set

# 4. Results and Discussion

* Sec 4.5 summarizes the versions submitted to the challenge

## 4.1. Pre-trained Text Model

* impact of adding text embedding to the final representation
* we compare WavLM Large and WavLM Large + RoBERTa-Large (MMWavLM)
* Table 2 shows that the MMWavLM (multimodal) performs better in every attribute

|        | A     | V     | D     | Average |
|--------|-------|-------|-------|---------|
| WavLM  | 0.6530| 0.7000| 0.5651| 0.6394  |
| MMWavLM| 0.6694| 0.7334| 0.5735| 0.6588  |

## 4.2 Attributes Learning

* gender prediction has proven effective in classifying emotions [25],
* we investigate whether it can also improve the regression task
* Table 3 shows that multi-task learning with gender information increases the
* hE adding the speaker embedding or predicting the speaker label worsens the
* We analyzed the speaker label to understand the reasons behind this. First,
  * approximately 80% of the shared dataset were represented by just 26% of the
    total speakers, causing the model to be overfit to a limited subset of seen
    speakers. Second,
* the pre-trained speaker extractor does not generalize well on the dataset
  * We randomly selected 100 utterances from 10 speakers and extracted speaker
    embedding from them
  * fig 2: speaker embeddings failed to cluster together, making it difficult

|          | A     | V     | D     | Average |
|----------|-------|-------|-------|---------|
| MMWavLM  | **0.6694**| 0.7334| 0.5735| 0.6588  |
| + S Emb  | 0.6483| 0.6962| 0.5643| 0.6363  |
| + S Pred | 0.6428| 0.7141| 0.5684| 0.6418  |
| + G Pred | 0.6662| **0.7367| 0.5787| 0.6605**  |

## 4.3. Undersampling

|               | A     | V     | D     | Average |
|---------------|-------|-------|-------|---------|
| Whole dataset | 0.6620| 0.5574| 0.5735| 0.5996  |
| Undersampling | **0.6694** | **0.7334** | **0.5795** | **0.6588** |

## 4.4. Other and No Agreement labels

* O/X samples are not in test sets,
* adding or removing them substantially impacts performance
* Table 5 shows that removing data from the training set, [even if] it belongs
  to O or X, degrades performance. The results also show that
* adding O/X (Valid set) samples to the training set improves the performance
* adding O/X (Valid set) samples and removing non-O/X (Train) samples give the
  best performance for the SER system. This indicates that,
* ie valuable samples, despite the annotators’ lack of agreement in classif emo
* hE, due to submission limitations, we did not submit the system trained with
  the whole training set + O/X (Valid set) - Non-O/X (Train) to the leaderboard,
  even though it achieved the best performance on the validation set

|               | A      | V      | D      | Average |
|---------------|--------|--------|--------|---------|
| Training Set  | 0.6694 | 0.7334 | 0.5735 | 0.6588  |
| - O/X(Train)      | 0.6622 | 0.7342 | 0.5774 | 0.6579  |
| - Non-O/X(Train)  | 0.6692 | 0.7332 | 0.5720 | 0.6581  |
| O/X(Valid set) | .67 | .71 | .60 | .66 |
| - Non-O/X (Train) | .68 | .76 | .61 | .69 |

## 4.5 [Versions submitted to the challange]

* ablation in tab 6
* ensembles
  * best system consists of only two models:
    * WavLM with gender prediction, undersampling technique and O/X (V) inclu-
    * MMWhisper with only undersampling. We
    * ensembled the system by averaging the CCC prediction from each one
  * ensembling only a few systems can exhibit strong performance. Moreover, we
* a 3-system ensemble:
  * WavLM with gender prediction, undersampling technique and O/X (V) inclusion;
    WavLM with gender prediction and undersampling technique; and
    MMWhisper with gender prediction, undersampling technique and O/X (V) inclu
  * 3rd in the challange
* since the number of submissions is limited, it is challenging to demonstrate
  which aspects of our methods contribute the most to improving scores

## 4.6 Future work

* separate system for each attribute demonstrated strong performance.
* instead of freezing the pre-trained Whisper Large-V3 and RoBERTa-Large, we
  could apply LoRa as proposed by [22, 26] to further improve the performance.
* [keep] simplicity
