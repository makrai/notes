    Medusa: A Multimodal Deep Fusion Multi-Stage Training Framework for SER Natural
    G Chatzichristodoulou, D Kosmopoulou, A Kritikos, A Poulopoulou, E Georgiou,
      A Katsamanis, V Katsouros, A Potamianos
Interspeech 2025 [challange](/naini-25-interspeech-ser-msp-podcast.md)

first place in Task 1 Interspeech 2025 SER MSP Podcast classification
[code](https://github.com/emopodntua/medusa)

# 1 Intro

* we introduce M EDUSA , a multimodal and multi-stage training framework for
  Task 1: “Categorical Emotion Recognition”. M EDUSA
  * incorporates DeepSER, a deep fusion architecture, which effectively captures
    acoustic and linguistic information, through a
  * four-stage training pipeline
    * Stage 1 trains the DeepSER model on the complete dataset, while
    * Stage 2 resumes training with balanced subsets, to address class imbalance
    * Stage 3 trains a meta-classifier to combine ensemble predictions, and
    * Stage 4 implements a model soup [9] over different meta-classifiers. M
* We develop DeepSER, a novel extension of a deep fusion architecture [10],
  * integrates transformer-based models and expands beyond two modalities for
* we utilize
  * detailed annotator scores and
  * Manifold MixUp regularization (M.MixUp), to address class-imbalance

### 3.2.2 Emotional Attributes

* The emotional attributes (valence, arousal, dominance) are incorporated into
  the model’s multitask learning objective, providing additional regularization

## 3.7. Manifold MixUp

* Manifold MixUp [16] (M.MixUp) is a regularization technique that
  interpolates between latent representations of input examples
  * For a pair of examples with hidden representations h i , h j ∈ R n and
    corresponding labels y i , y j , M.MixUp computes mixed features
    h̃ = λh i + (1 − λ)h j and labels ỹ = λy i + (1 − λ)y j , where
    λ ∈ [0, 1] is drawn from a Beta(α, α) distribution
* connections to vicinal risk minimization (VRM) [28], this approach creates
* particularly beneficial for our SER task
  with its class imbalance and annotator ambiguity challenges
* we apply M.MixUp with probability p during training,
  before the classification head of DeepSER

## 5.2. DeepSER-level Ablation

* Overview: We conduct a DeepSER-level ablation study to investigate the impact
  of each architectural and training component. We select models 2, 8, 9 and 13
  from Table 1 for this analysis, as they represent both top-performing
  configurations and diverse model architectures with varying feature sets and
  SSL extractors
* In each experiment, we replace a key component with its standard implem, and
  evaluate on our balanced test sets. The ablated components include: deep
  fusion replaced with late fusion, soft targets with one-hot labels, and
  training without (w/o) M.MixUp, w/o Stage 2 (balanced training), and w/o
  multitask loss
* All components consistently improve F1 performance, with
* results averaged across multiple DeepSER models for robust conclusions. The
* Table 2
* Soft targets emerge as the most impactful component, as removing them leads
  to an average 8.23% relative degradation in F1 score. This suggests that
* Deep fusion proves vital for performance, with its removal causing a 6.31%
* M.MixUp’s removal also results in significant performance drops, likely due
  * virtual training points that smooth decision boundaries around existing
* Removing Stage 2 (balanced training) and multitask learning also degrades

## 5.3. MEDUSA-level Ablation

* MEDUSA-level ablation study exploring two key directions:
  1. the optimal number of models in the ensemble and
  2. the effectiveness of different ensemble aggregation techniques. We compare
    * 4 voting approaches: hard voting, soft voting, single-run
     meta-classifier and meta-classifier soup, where we average meta-classifier
     weights over multiple runs to smooth decision boundaries [9]
* Table 3, demonstrate that
  * both meta-classifier variants consistently outperform soft and hard voting
    approaches, indicating the significance of this approach
* Compared to the top DeepSER model (see Table 1), M EDUSA shows a 7.23%
  relative improvement
* meta-classifier (single run) performs better when combining the top-5 models
  of Table 1, the
* meta-classifier soup shows slight advantages when incorporating more models,
  i.e., 7 and 14. Based on these findings, we opted for the meta-classifier soup
* we limit our ensemble to 14 models,
  as doubling from 7 to 14 models showed diminishing improvements

# Abstract worse than the end of the Intro

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
