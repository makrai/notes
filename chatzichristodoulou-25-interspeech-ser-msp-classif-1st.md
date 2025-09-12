    Medusa: A Multimodal Deep Fusion Multi-Stage Training Framework for SER Natural
    G Chatzichristodoulou, D Kosmopoulou, A Kritikos, A Poulopoulou, E Georgiou,
      A Katsamanis, V Katsouros, A Potamianos
Interspeech 2025 [challange](/naini-25-interspeech-ser-msp-podcast.md)

first place in Task 1 Interspeech 2025 SER MSP Podcast classification
[code](https://github.com/emopodntua/medusa)

# 1 Intro

* we introduce Medusa, a multimodal and multi-stage training framework for
  Task 1: “Categorical Emotion Recognition”. Medusa
  * incorporates **DeepSER,** a **deep fusion** for acoustic and linguistic info
  * four-stage training pipeline
    * Stage 1 trains the DeepSER model on the complete dataset
    * Stage 2 resumes training with balanced subsets, to address class imbalance
    * Stage 3 trains a meta-classifier to combine ensemble predictions, and
    * Stage 4 implements a model soup [9] over different meta-classifiers
* We develop DeepSER, a novel extension of a deep fusion architecture [10],
  * only on ReseachGate [10] E. Georgiou, C. Papaioannou, and A. Potamianos,
    Deep hierarchical fusion with application in sentiment analysis
    Interspeech 2019, 2019, pp. 1646–1650
  * integrates transformer-based models and expands beyond two modalities
* we utilize
  * detailed annotator scores and
  * Manifold MixUp regularization (M.MixUp), to address class-imbalance

# 2. Related Work

* from acted emotions [11] to naturalistic [8] and in-the-wild scenarios [12]
* use raw speech signals, mel-spectrograms and extracted features [13]. Other
* self-supervised learning (SSL), as shown by emotion2vec [5] and WavLLM [14]
* Multimodal methods integrate acoustic, linguistic and visual signals
  * Medusa focuses specifically on acoustic and linguistic modalities
  * Our fusion strategy, DeepSER, draws inspiration from DHF [10] and extends
* conceptually related work in computational paralinguistics:
  * soft target learning strategy [15],
    * [15] A Ando, S Kobashikawa, H Kamiyama, R Masumura, Y Ijima, and Y  Aono,
      Soft-target training with ambiguous emotional utterances
        for dnn-based speech emotion classification,” in
      ICASSP 2018 (IEEE Intl Conference on Acoustics, Speech and Signal Proc)
  * mixing-based regularization [16, 17] and
  * mulitask learning [18]. For
  * ensemble methods, model diversity [19] is a helpful factor
  * meta-classifier [20] idea has also been investigated independently
  * Medusa combines these approaches into a unified SER framework

## 3.1 Overview

* Medusa leverages detailed human annotator scores as soft targets, e.g., two
* The training recipe follows a four-staged pipeline
  * The first two stages train the DeepSER models with soft targets and Manifold
    MixUp [16] (M.MixUp) regularization, with
    * Stage 1 using standard training, and Stage 2 employing balanced subset
  * The final two stages of the pipeline form the Medusa ensemble, where
    * a meta-classifier learns to combine the posterior distributions of

## 3.2. The MSP-Podcast dataset

### Soft Targets

* annotator (dis)agreement provides crucial insights,
  * ie whether disagreement stems from
    poor sample quality or proximity to multiple emotions. Using the full
    decision vector, rather than one-hot representations, offers two advantages:
* enables us to leverage the entire dataset, including samples without consensus
  (∼20K samples), and helps the model develop more nuanced decision boundaries
* We normalize these decision vectors consistently across all samples

### 3.2.2 Emotional Attributes

* The emotional attributes (valence, arousal, dominance) are incorporated into
  the model’s multitask learning objective, providing additional regularization

## 3.4. Deep fusion architecture DeepSER

* the Deep Hierarchical Fusion (DHF) scheme [10], which
  combines unimodal representations at multiple layers,
  we propose a novel extension named DeepSER.
* two key advancements. First, we
  * replace the original LSTM-based [27] architecture with transformers [21] to
    better capture unimodal and cross-modal relationships. Second, we
  * extend the fusion mechanism to handle N arbitrary modalities, enabling
* DeepSER utilizes
  * a base transformer encoder architecture (Algorithm 1) as its fundamental
    building block for both unimodal and fusion processing.
  * The overall fusion process (Algorithm 2) operates by
    1. extracting intermediate representations from each unimodal encoder’s
       layers.
    2. These representations are then fed into fusion encoders, which combine
       them hierarchically,
       i.e., each fusion stage processes both the current unimodal features and,
       when available, the fusion representations from previous stages, enabling
       deep multimodal integration.
* Medusa’s implementation: DeepSER architecture with
  a two-layer transformer encoder (Enc), and for 2 and 3 modalities
* A detailed technical report covering these extensions: in our GitHub repo

## 3.7. Manifold MixUp

* Manifold MixUp [16] (M.MixUp) is a regularization technique that
  interpolates between latent representations of input examples
  * For a pair of examples with hidden representations h i, h j ∈ R n and
    corresponding labels y i, y j, M.MixUp computes mixed features
    h̃ = λh i + (1 − λ)h j and labels ỹ = λy i + (1 − λ)y j, where
    λ ∈ [0, 1] is drawn from a Beta(α, α) distribution
* connections to vicinal risk minimization (VRM) [28]
* particularly beneficial for our SER task
  with its class imbalance and annotator ambiguity challenges
* we apply M.MixUp with probability p during training,
  before the classification head of DeepSER

## 5.2. DeepSER-level Ablation

* Overview: We conduct a DeepSER-level ablation study to investigate the impact
  of each architectural and training component
  * We select models 2, 8, 9 and 13 from Table 1 for this analysis, as
    they represent both top-performing configurations and diverse model archits
    with varying feature sets and SSL extractors
* In each experiment, we replace a key component with its standard implem, and
  evaluate on our balanced test sets
  * ablated components include:
    * deep fusion replaced with late fusion,
    * soft targets with one-hot labels, and
    * training without (w/o) M.MixUp,
    * w/o Stage 2 (balanced training), and
    * w/o multitask loss
* All components consistently improve F1 performance
* results averaged across multiple DeepSER models for robust conclusions
* Table 2
* Soft targets emerge as the most impactful component, as
  removing them leads to an average 8.23% relative degradation in F1 score. This
* Deep fusion proves vital for performance, with its removal causing a 6.31%
* M.MixUp’s removal also results in significant performance drops
  * virtual training points that smooth decision boundaries around existing
* Removing Stage 2 (balanced training) and multitask learning also degrades

## 5.3. MEDUSA-level Ablation

* MEDUSA-level ablation study exploring two key directions:
  1. the optimal number of models in the ensemble and
  2. the effectiveness of different ensemble aggregation techniques. We compare
    * 4 voting approaches:
    * hard voting,
    * soft voting,
    * single-run meta-classifier and
    * meta-classifier soup, where we average meta-classifier weights over
      multiple runs to smooth decision boundaries [9]
* Table 3
  * both meta-classifier variants consistently outperform soft and hard voting
* Compared to the top DeepSER model (see Table 1), Medusa shows a 7.23%
  relative improvement
* meta-classifier (single run) performs better when combining the top-5 models
  of Table 1
* meta-classifier soup shows slight advantages when incorporating more models,
  ie 7 and 14. Based on these findings, we opted for the meta-classifier soup
* we limit our ensemble to 14 models,
  as doubling from 7 to 14 models showed diminishing improvements

# Abstract (worse than the end of the Intro)

* four-stage training pipeline, which effectively handles class imbalance and
  emotion ambiguity
  * first two stages train an ensemble of classifiers that utilize
    * DeepSER, a novel extension of a deep cross-modal transformer fusion
      mechanism from pretrained self-supervised acoustic and linguistic reprs
    * Manifold MixUp for further regularization. The
  * last two stages optimize a trainable meta-classifier that combines the
    ensemble predictions
* we incorporate annotation scores as soft targets, coupled with
  * balanced data sampling and multitask learning. MEDUSA ranked 1st in Task 1:
