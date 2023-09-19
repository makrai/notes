HuBERT: Self-Supervised Speech Representation Learning by Masked Prediction of Hidden Units
Wei-Ning Hsu, Benjamin Bolte, Yao-Hung Hubert Tsai, Kushal Lakhotia, Ruslan Salakhutdinov, Abdelrahman Mohamed
arXiv:2106.07447 [cs.CL]

* Self-supervised approaches for speech representation learning: problems
  1. there are multiple sound units in each input utterance, 
  1. there is no lexicon of input sound units during the pre-training phase, and 
  1. sound units have variable lengths with no explicit segmentation. To deal
* we propose the Hidden-Unit BERT (HuBERT) for self-sup speech repr learn which
  * offline clustering step to provide aligned target labels for a BERT-like
    prediction loss. A key ingredient of
  * applying the prediction loss over the masked regions only, which 
    forces the model to learn a combined acoustic and language model over the
    continuous inputs
  * relies primarily on the consistency of the unsupervised clustering step
    rather than the intrinsic quality of the assigned cluster labels
    * Starting with a simple k-means teacher of 100 clusters, and using 
      two iterations of clustering, the HuBERT model 
* either matches or improves upon the SOTA wav2vec 2.0 performance on the
  Librispeech (960h) and Libri-light (60,000h) benchmarks 
  with 10min, 1h, 10h, 100h, and 960h fine-tuning subsets
* Using a 1B parameter model, HuBERT shows
  up to 19% and 13% relative WER reduction
  on the more challenging dev-other and test-other evaluation subsets. 

# 1 Intro

* pretext [?=pre-training] tasks for self-supervised speech repr learning
  * distinguishing near-by features from temporally distant ones [1]–[3],
    next-step prediction of audio features [4], 
    masked prediction of audio features given unmasked context [5], [6].

* self-supervised learning methods do not rely on any linguistic resources
  => universal representations since labels, annotations, and textonly material
  ignores rich information in the input signal.

* crucial for industrial applications and products with ever-increasing
  coverage of new languages and domains. The time needed to collect large
  * spoken-only dialects and languages is another significant benefit of
  * non-standard orthographic rules, many of these languages and dialects have
    very little or no resources at all.

* Pseudo-labeling (PL), also known as self-training and belongs to the family
  of semi-supervised learning techniques, has been the dominant approach for
  utilizing unlabeled speech and audio with 
  * successful applications dating back to the mid1990s [7]–[10]
  * starts with some supervised data to train a ”teacher” model in one task.
    Pseudolabels are then generated for the unlabeled data using the teacher
  * Next, a student model is trained using the combined supervised and
    teacher-labeled data either using the standard cross-entropy [9] loss or
    using a contrastive loss [11] to account for noise in teacher-generated
    labels. The pseudo-labeling process may be repeated multiple times to
    improve teacher label quality [12] iteratively.

* advantages of self-sup compared to pseudo-labeling 
  1. Pseudo-label methods force student models to merely mimic a teacher model,
    * teacher is limited by its supervised data size and the provided
      annotation quality
    * self-supervised pretext tasks force the model to represent the entire
      input signal by compressing much more bits of information into the
      learned latent representation.  
  2. In pseudo-labeling, the supervised data of the teacher model forces the
     whole learning to be geared towards a single downstream task. On the
    * self-supervised features show better generalization to many downs applics

* self-supervised learning in Computer Vision (CV) [13]–[15] and NLP [16]–[18]
  * discrete input sequences, such as in Natural Language Processing (NLP)
    * masked prediction [19], [20] or 
    * auto-regressive generation [18], [21] of input sequences with partial obfuscation
  * continuous inputs, such as in Computer Vision (CV) applications, reprs
    learned through instance classification, in which 
    * each image and its augmentations are treated as a single output class to
      be pulled together [14], [15] or contrasted against other negative
      samples [22].

* Speech signals differ from text and images in that they are continuous-valued
  * multiple sounds in each input utterance: breaks the instance classification
    assumption used in many CV pre-training approaches. Secondly, during
  * no prior lexicon of discrete sound units available, as in NLP applications
    * hindering the use of predictive losses. Lastly, 
  * the boundaries between sound units are not known, which 
    complicates masked prediction pre-training.

* we introduce Hidden unit BERT (HuBERT) that benefits from 
  * an offline clustering step 
    to generate noisy labels for a BERT-like per-training
  * a BERT model consumes masked continuous speech features 
    to predict pre-det cluster assignments
  * The predictive loss is only applied over the masked regions, forcing the
    model to learn good high-level representations of unmasked inputs 
    to infer the targets of masked ones correctly
  * Intuitively, the HuBERT model learns both acoustic and LMs from continuous
    1. model unmasked inputs into meaningful continuous latent representations,
      which maps to the classical acoustic modeling problem.
    2. to reduce the prediction error, the model needs to capture the
       long-range temporal relations between learned representations. One
       * insight: consistency of the targets, not just their correctness, which
         enables the model to focus on modeling the sequential structure of
         input data
  * Our approach draws inspiration from the DeepCluster method for
    self-supervised visual learning [23]; however, HuBERT benefits from the
    masked prediction loss over speech sequences to represent their sequential
    structure.

* exper
  * pre-trained on either the standard Librispeech 960h [24] or the Libri-Light
    60k hours [25], it 
  * either matches or improves upon the SOTA wav2vec 2.0 [6] performance 
    on all fine-tuning subsets of 10mins, 1h, 10h, 100h, and 960h.  We present
  * systematic results on three model sizes pre-trained with HuBERT: BASE (90M
    parameters), Large (300M), and X-Large (1B)
    * X-Large model shows up to 19% and 13% relative WER improvement from Large
      models on dev-other and test-other evaluation subsets 
      when pre-trained on the Libri-Light 60k hours.
