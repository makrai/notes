To Tune or Not to Tune? Adapting Pretrained Representations to Diverse Tasks
Matthew E. Peters, Sebastian Ruder, Noah A. Smith
reprl4nlp arXiv:1903.05987

* how to best adapt the pretrained model to a given target task
* two most common forms of adaptation, feature extraction (where the pretrained
  weights are frozen), and directly fine-tuning the pretrained model
* empirical results across diverse NLP tasks with two SOTA models show that the
  relative performance of fine-tuning vs feature extraction depends on the
  similarity of the pretraining and target tasks
* We explore possible explanations for this finding and provide a set of
  adaptation guidelines for the NLP practitioner

# 1 Introduction

* Sequential inductive transfer learning (Pan and Yang, 2010): two stages
  * pretraining, in which the model learns a general-purpose representation
  * adaptation, in which the representation is transferred to a new task
* in the adaptation phase, there are two main paradigms: feature extraction
  (FE) and fine-tuning (FT)
  * feature extraction: the model’s weights are ‘frozen’ and the pretrained
    representations are used in a downstream model similar to classic
    feature-based approaches (Koehn+ 2003)
    * enables use of task-specific model architectures
    * computationally cheaper as features only need to be computed once
  * pretrained model’s parameters can be unfrozen and fine-tuned on a new task
    (Dai and Le, 2015)
    * convenient as it may allow us to adapt a general-purpose representation
      to many different tasks
* Gaining a better understanding of the adaptation phase is key
  * we compare two SOTA pretrained models, ELMo (Peters+ 2018) and BERT
  * seven tasks including NER, NLI, and paraphrase detection
  * characterize
    * conditions under which one approach substantially outperforms the other,
      * comparable performance in most cases, except when the source and target
        tasks are either highly similar or highly dissimilar
    * whether it is dependent on the pretraining objective or target task
* We furthermore shed light on the practical challenges of adaptation and
  * guidelines to the NLP practitioner, as summarized in Table 1

# 2 Pretraining and adaptation

## Sentence embedding methods

* pretraining objectives such as
  * previous/next sentence prediction (Kiros+ 2015; Logeswaran and Lee, 2018),
  * NLI (Conneau+ 2017), or a
  * combination of objectives (Subramanian+ 2018)
* During the adaptation phase, the sentence representation is typically
  provided as input to a linear classifier (FE)
* LM pretraining with FT has also been successfully applied to sentence level
  *  Howard and Ruder (2018, ULMFiT) propose techniques for fine-tuning a LM,
     * triangular learning rate schedules and
     * discriminative finetuning, which uses lower learning rates for lower
       layers
  * Radford+ (2018) extend LM to additional sentence and sentence-pair tasks

## Masked LM and next-sentence prediction

* BERT (Devlin+ 2018) combines both word and sentence representations
  (via masked LM and next sentence prediction objectives)
  in a single very large pretrained transformer (Vaswani+ 2017)
* adapted to both word and sentence level tasks by FT with task-specific layers

# 3 Experimental Setup

## 3.2 Adaptation

* For FE we require a task-specific architecture, while
  for FT we need a task-specific output layer
* For fair comparison, we do an extensive hyper-parameter search for each task

### Feature extraction

* For both ELMo and BERT, we extract contextual representations of the words
  from all layers
* During adaptation, we learn a linear weighted combination of the layers (Pe-
  ters+ 2018) which is used as input to a task-specific model
* When extracting features, it is important to expose the internal layers as
  they typically encode the most transferable representations
* task-spec model by task
  * For SA, we employ a bi-attentive classification network (McCann+ 2017)
  * For the sentence pair tasks, we use the ESIM model (Chen+ 2017)
  * For NER, we use a BiLSTM with a CRF layer (Lafferty+ 2001; Lample+ 2016)

### Fine-tuning

* ELMo: We max-pool over the LM states and add a softmax layer for text classif
  * For the sentence pair tasks, we compute cross-sentence bi-attention between
    the LM states (Chen+ 2017), apply a pooling operation, then add a softmax
    layer
  * For NER, we add a CRF layer on top of the LSTM states
* BERT
  * We feed the sentence representation into a softmax layer for text
    classification and sentence pair tasks following Devlin+ (2018)
  * For NER, we extract the representation of the first word piece for each
    token and add a softmax layer

# 4 Results

* For ELMo, we find the largest differences for sentence pair tasks where FE
  consistently outperforms FT
* For BERT, we obtain nearly the opposite result: FT significantly outperforms
  FE on all STS tasks, with
  * much smaller differences for the others

## Discussion

* Mou+ (2016) showed that similar pretraining tasks transfer better
  * hE Mou+ (2016) only investigate transfer between classification tasks
    (NLI → SICK-E/MRPC)
* In computer vision (CV), Yosinski+ (2014) similarly found that the
  transferability of features decreases as the distance between the pre-
  training and target task increases
* Skip-thoughts ~~ and Quick-thoughts (Logeswaran and Lee, 2018), which has
  similar performance ~~ which use a next-sentence prediction objective similar
  to BERT, perform particularly well on STS tasks, indicating a close alignment
  between the pretraining and target task. This strong alignment also seems to
  be the reason for BERT’s strong relative performance on these tasks
* In CV, FT generally outperforms FE when transferring from ImageNet supervised
  classification pretraining to other classification tasks (Kornblith+ 2018)
  * FT is less useful for more distant target tasks such as semantic
    segmentation (He+ 2018)
    * in line with our results, which show
      * strong performance with FT between closely aligned tasks (next-sentence
        prediction in BERT and STS tasks) and
      * poor performance for more distant tasks (LM in ELMo and sentence pair
        tasks)
* A confounding factor may be the suitability of the inductive bias of the
  model architecture for sentence pair tasks, which we will analyze next

# 5 Analyses

## Modelling pairwise interactions

* LSTMs consider each token sequentially, while
  Transformers can relate each token to every other in each layer (Vaswani+ 17)
  This might facilitate FT with Transformers on sentence pair tasks, on which
  ELMo performs comparatively poorly
* we compare different ways of encoding the sentence pair with ELMo and BERT
  * ELMo, we compare encoding with and without cross-sentence bi-attention in
    Table 3. When adapting the ELMo LSTM to a sentence pair task, modeling the
    sentence interactions by fine-tuning through the bi-attention mechanism
    provides the best performance. 2 This provides further evidence that the
    LSTM has difficulty modeling the pairwise interactions during sequential
    processing.  This is in contrast to a Transformer LM that can be fine-tuned
    in this manner (Radford+ 2018)
  * For BERT, we compare joint encoding of the sentence pair with encoding the
    sentences separately in Table 4. The latter leads to a drop in performance,
    which shows that the BERT representations encode cross-sentence
    relationships and are therefore particularly well-suited for sentence pair
    tasks

## Impact of additional parameters (evaluated on NER)

* We add a CRF layer (as used in FT) and a BiLSTM with a CRF layer (as used in
  FE) to both and show results in Table 5
* We find that additional parameters are key for FE, but
  hurt performance with FT
* FT requires gradual unfreezing (Howard and Ruder, 2018) to match performance
  of feature extraction

### ELMo fine-tuning

* We found fine-tuning the ELMo LSTM to be initially difficult and required
  careful hyper-parameter tuning. Once tuned for one task, other tasks have
  similar hyperparameters.  Our best models used slanted triangular learning
  rates and discriminative fine-tuning (Howard and Ruder, 2018) and in some
  cases gradual unfreezing

## Impact of target domain

* We calculate the Jensen-Shannon divergence based on term distributions (Ruder
  and Plank, 2017) between the domains used to train BERT (books and Wikipedia)
  and each MNLI domain
* results in Table 6
  * no significant correlation

## Representations at different layers

* how the information in the different layers of the models develops over the
  course of fine-tuning
  * We measure this in two ways:
    * with diagnostic classifiers (Adi+ 2017); and
    * with mutual information (MI; Noshad+ 2018)
  * Both methods allow us to associate the hidden activations of our model with
    a linguistic property
  * In both cases, we usethe mean of the hidden activations of BERT-base of
    each token / word piece of the sequence(s) as the representation
    * We show results for BERT as they are more inspectable due to the model
      having more layers. Trends for ELMo are similar
    * similar results when using max-pooling or the representation of the first
      token
* diagnostic classifiers
  * features: for each example, we extract the pretrained and fine-tuned repr
    at each layer
  * logistic regression model (linear regression for STS-B, which has
    real-valued outputs)
  * data: the training data of
    two single sentence (CoLA 5 and SST-2) and
    two pair sentence tasks (MRPC and STS-B)
  * We show its performance on the corresponding dev sets in Figure 1
* results of diagnostic classifiers
  * For all tasks, performance generally is higher in higher layers of the
  * Fine-tuning improves the performance of the diagnostic classifier at
    every layer
  * by task
    * For the single sentence classification tasks CoLA and SST-2, pretrained
      performance increases gradually until the last layers
    * sentence pair tasks MRPC and STS-B performance is
      mostly flat after the fourth layer
      * ie Relevant information not seem to be concentrated primarily in the
        upper layers of pretrained representations, which could
        explain why fine-tuning is particularly useful in these scenarios
* mutual information with regard to representations of deep neural networks
  * computing it has only become feasible recently with the development of
    more sophisticated MI estimators
  * we use the SOTA ensemble dependency graph estimator (EDGE; Noshad+ 2018)
    with default hyper-parameter values
    * sanity check, we compute the MI between hidden activations and random
      labels and random representations and random labels, which yields 0 in
      every case as we would expect
      * For the same settings, we obtain non-zero values with earlier
        estimators (Saxe+ 2018), which seem to be
        * less reliable for higher numbers of dimensions
  * We show the mutual information I(H; Y) between the pretrained and
    fine-tuned mean hidden activations H at each layer of BERT and the output
    labels Y on the dev sets of CoLA, SST-2, and MRPC in Figure 2
    * pretrained: The MI between pretrained representations and labels is close
      to 0 across all tasks and layers, except for SST where the last layer
      shows a small non-zero value
    * fine-tuned representations display much higher MI values. By task:
      * sentence pair task MRPC: MI rises gradually through the intermediate
        and last layers
      * single sentence classification tasks, the MI rises sharply in the last
        layers
  * Similar to our findings with diagnostic classifiers, knowledge for
    single sentence classification tasks thus seems mostly concentrated in the
    last layers, while
    pair sentence classification tasks
    gradually build up information in the intermediate and last layers
