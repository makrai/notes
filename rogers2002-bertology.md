Anna Rogers, Olga Kovaleva, Anna Rumshisky
Primer in BERTology: What we know about how BERT works
arXiv:2002.12327 [cs.CL]

# Abstract

* Transformer-based models are now widely used in NLP,
  but we still do not understand a lot about their inner workings
* This paper
  * synthesizing over 40 analysis studies
  * overview of the proposed modifications ... and its training regime
  * directions for further research

# 1 Introduction

* Transformers (Vaswani+ 2017) took NLP by storm, offering
  * enhanced parallelization and better modeling of long-range dependencies
  * best ... model is BERT (Devlin+ 2019) which obtained SOTA results in benchm
  * integrated in Google search 1 , improving an estimated 10% of queries
    * https://blog.google/products/search/search-language-understanding-bert
* [hE] little cognitive motivation, and the
  * size of these models limits our ability [for pre-training and ablation]
* We focus on the studies investigating the types of knowledge learned by BERT,
  where this knowledge is represented, how it is learned, and the
  methods proposed to improve it

# 2 Overview of BERT architecture

* BERT is a stack of Transformer encoder layers (Vaswani+ 2017)
  * multiple “heads”, i.e., fully-connected neural networks
    augmented with a self-attention mechanism
  * For every input token in a sequence,
    each head computes key, value and query vectors,
    which are used to create a weighted representation
    * The outputs of all heads in the same layer are combined and
      run through a fully-connected layer
    * Each layer is wrapped with a skip connection + layer normalization
* conventional workflow: pre-training and fine-tuning
  * Pretraining uses two semi-supervised tasks:
    * masked language modeling (MLM, prediction of randomly masked input token)
    * next sentence prediction
      (NSP, predicting if two input sentences are adjacent to each other)
  * fine-tuning for downstream applications,
    one or more fully-connected layers are typically added
    on top of the final encoder layer
* The input representations are computed as follows:
  * tokenizes the given word into wordpieces (Wu+ 2016b), and then
  * combines three embedding layers (token, position, and segment)
  * Special token [CLS] is used for classification predictions, and
    [SEP] separates input segments
* base and large, varying in the
  number of layers, their hidden size, and number of attention heads

# 3 What knowledge does BERT have?

* approaches include
  * fill-in-the-gap probes of BERT’s MLM,
  * self-attention weights,
  * and probing classifiers using different BERT representations as inputs

## 3.1 Syntactic knowledge

* representations are hierarchical rather than linear
  * there is something akin to syntactic tree structure (Lin+ 2019)
    in addition to the word order information
  * information about parts of speech, syntactic chunks and roles
    * Tenney+ (2019b) and Liu+ (2019a)
  * knowledge of syntax is partial (Liu+ 2019a)
    * not recover the labels of distant parent nodes in the syntactic tree
* syntactic structure is not directly encoded in self-attention weights, but
  they can be transformed to reflect it. Htut+ (2019) were unable to extract
  full parse trees from BERT heads even with the gold annotations for the root
* dependency tree extracted directly from self-attention weights (Jawahar+ 19)
  * no quantitative evaluation
* transformation matrices (Hewitt and Manning 2019) that
  recover much of the Stanford Dependencies formalism for PennTreebank data
* Jawahar+ (2019) try to approximate BERT representations
  with Tensor Product Decomposition Networks (McCoy+ 2019a), concluding that
  * dependency trees are the best match among 5 decomposition schemes
  * differences are very small
* BERT takes subject-predicate agreement into account [in] the cloze task
  * even [with] distractor clauses and meaningless sentences (Goldberg 2019)
* negation and scope (Warstadt+ 2019)
  * BERT is better able to detect the presence of
    negative polarity items (e.g.  ”ever”) and
    the words that allow their use (e.g.  ”whether”)
    than scope violations
  * BERT does not “understand” negation and is insensitive to malformed input
    * predictions were not altered even with shuffled word order,
      truncated sentences, removed subjects and objects (Ettinger, 2019)
    * adversarial attacks: models disturbed by nonsensical input (Wallace+ 19a)
    * encoding of syntactic structure does
      not indicate that it actually relies on that knowledge

## 3.2 Semantic knowledge

* more studies were devoted to BERT’s knowledge of synta[x] rather than sem
* some knowledge for semantic roles (Ettinger, 2019)
  * an MLM probing study that
  * prefers “to tip a chef” to “to tip a robin”
    i.e.  incorrect fillers for semantic roles that are
    semantically related to the correct ones, to those that are unrelated
* entity types, relations, semantic roles, and proto-roles
  detected with probing classifiers (Tenney+ 2019b)
* struggles with representations of numbers. Addition and number decoding tasks
  * [no] good representations for floating point numbers (Wallace+ 2019b)
  * problem [with] wordpiece tokenization: numbers of similar values can be
    divided up into substantially different word chunks
* surprisingly brittle tonamed entity in replacements: e.g. 
  * replacing names in the coreference task changes 85% of predictions
    (Balasubramanian+ 2020)
    * This suggests that the model does not form a generic idea of named entitis
    * although its F1 scores on NER probing tasks are high (Tenney+ 2019a)
  * Broscheit (2019) find that fine-tuning BERT on Wikipedia entity linking
    "teaches" it additional entity knowledge, which would 
    * suggest that it did not absorb all the relevant entity information during
      pre-training on Wikipedia

## 3.3 World knowledge

* MLM [adapted] for knowledge induction by filling in the blanks
  e.g. “Cats like to chase [ ]”)
* probing study of world knowledge in BERT (Ettinger, 2019), but the
  * bulk of evidence comes from numerous practitioners using BERT to extract kn
* for some relation types, vanilla BERT is competitive with [KB] methods
  (Petroni+ 2019)
* generalizes better to unseen data (Davison+ 2019)
  * [hE] we need good template sentences
    * automatic extraction and augmentation (Bouraoui+ 2019; Jiang+)
* BERT cannot reason based on its world knowledge
  * can “guess” the affordances and properties of many objects, but
    [no] information about their interactions
    (e.g. it “knows” that people can walk into houses, and that houses are big,
    but it cannot infer that houses are bigger than people (Forbes+ 2019)
  * performance drops with the number of necessary inference steps
    * Zhou+ (2020) and Richardson and Sabharwal (2019)
  * some of BERT’s success in factoid knowledge retrieval comes from
    learning stereotypical character combinations (Poerner+ 2019)
    e.g. a person with an Italian-sounding name is Italian

## 3.4 Limitations

* Tenney+ (2019a) remarks, “the fact that a linguistic pattern is not observed
  by our probing classifier does not guarantee that it is not there, and the
  observation of a pattern does not tell us how it is used." There is also the
* how complex a probe should be allowed to be (Liu+ 2019a). 
  * If a more complex probe recovers more information, to what extent are we
    still relying on the original model?  
* different probing methods may lead to complementary or even contradictory
  (Warstadt+ 2019). A given method might also favor one model over another,
  e.g., RoBERTa trails BERT with one tree extraction method, but leads with
  another (Htut+ 2019).  The 
* choice of linguistic formalism also matters (Kuznetsov and Gurevych, 2020).  
* focus on identifying what BERT actually relies on at inference time. This
  * architecture blocks (to be discussed in subsection 6.3), and at the level
  * information encoded in model weights. 
* Amnesic probing (Elazar+ 2020) aims to specifically remove certain information
  * see how it changes performance, finding, for example, that 
  * e.g. language modeling does rely on part-of-speech information.  
* information-theoretic probing. 
  * Pimentel+ (2020) operationalize probing as estimating mutual information
    between the learned representation and a given linguistic property, which
  * hE, focus should be not on the amount of information contained in a
    representation, but rather on how easily it can be extracted from it. 
* Voita and Titov (2020) quantify the amount of effort needed to extract info
  * as minimum description length needed to communicate both the probe size and
    the amount of data required for it to do well on a task

# 4 Localizing linguistic knowledge 4

## 4.1 BERT embeddings

* BERT’s contextualized embeddings form distinct and clear clusters
  corresponding to word senses (Wiedemann+ 2019)
* representations of the same word varies depending on position of the sentence
  * likely due to NSP objective (Mickus+ 2019)
* how similar the embeddings for identical words are in every layer
  * Ethayarajh (2019) find that later BERT layers produce more context-specific
    * embeddings occupy a narrow cone in the vector space, and
      this effect increases from lower to higher layers

## 4.2 Self-attention heads

* several studies proposed classification of attention head types:
  * attending to the word itself, to previous/next words and
    to the end of the sentence (Raganato and Tiedemann, 2018)
  * attending to previous/next tokens, [CLS], [SEP], punctuation, and
    “attending broadly” over the sequence (Clark+ 2019)
  * the 5 attention types shown in Figure 4 (Kovaleva+ 2019):
    Vertical, Diagonal, Vertical + diagonal, Block, Heterogeneous

### 4.2.1 Heads with linguistic functions

* The "heterogeneous" attention pattern shown in Figure 3 could potentially be
  linguistically interpretable, and a number of studies focused on identifying
  the functions of self-attention heads. In particular, some BERT heads seem to
* syntactic relations
  * Htut+ (2019) and Clark+ (2019) report that 
    * there are BERT heads that attended significantly more than a random
      baseline to words in certain syntactic positions. The 
    * datasets and methods used in these studies differ, but they both find that
    * heads that attend to words in obj role more than the positional baseline.
    * evidence for nsubj, advmod, and amod varies between these two studies.
    * overall conclusion is also supported by Voita+ (2019b)’s study of the base
      Transformer in machine translation context.  
    * Hoover+ (2019) hypothesize that even 
      complex dependencies like dobj are encoded by a combination of heads
      rather than a single head, but this work is limited to qualitative anal
  * Zhao and Bethard (2020) looked for the heads encoding negation scope
  * Both Clark+ (2019) and Htut+ (2019)
    * no single head has the complete syntactic tree information, 
      in line with evidence of partial knowledge of syntax (cf. subsection 3.1)
  * However, Clark+ (2019) identify a BERT head that can be directly used as a
    classifier to perform coreference resolution on par with a rule-based sys,
    which by itself would seem to require quite a lot of syntactic knowledge
  * Lin+ (2019) present evidence that attention weights are weak indicators of
    subject-verb agreement and reflexive anaphora. Instead of serving as strong
    pointers between tokens that should be related, BERT’s self-attention
    weights were close to a uniform attention baseline, but there was some
    sensitivity to different types of distractors coherent with psycholinguistic
    data. This is consistent with conclusions by Ettinger (2019)
* morphological information in BERT heads has not been addressed, but with the
  sparse attention variant by Correia+ (2019) in the base Transformer, some
  attention heads appear to merge BPE-tokenized words
* semantic relations, there are reports of self-attention heads encoding core
  frame-semantic relations (Kovaleva+ 2019), as well as 
  lexicographic and commonsense relations (Cui+ 2020)
* meaning of attention weights
  * "attention weight has a clear meaning: how much a particular word will be
    weighted when computing the next representation for the current word"
    (Clark+ 2019)
  * The overall popularity of self-attention as an interpretability mechanism is
    due to this idea
  * debated (Jain and Wallace, 2019; Serrano and Smith, 2019; Wiegreffe and
    Pinter, 2019; Brunner+ 2020)
  * in a multi-layer model where attention is followed by non-linear trafo, 
    the patterns in individual heads do not provide a full picture
* visualizations
  * many current papers are accompanied by attention visualizations, and there
  * tools (Vig, 2019; Hoover+ 2019), the visualization is typically
  * limited to qualitative analysis (often with cherry-picked examples)
    (Belinkov and Glass, 2019), and should not be interpreted as evidence

### 4.2.2 Attention to special tokens

### from earlier version of the now 4.2

* meaning [of attention weight]: “how much a particular word will be weighted
  when computing the next representation for the current word” (Clark+ 2019)
* However, most self-attention heads do not directly encode any nontrivial
  linguistic information
  * more than their half had not the “heterogeneous” pattern but vertic
    (Kovaleva+ 2019; Clark+ 2019)
  * must be related to the overparametrization issue (see section 7)
* Attention to [CLS] interpreted as attention to an aggregated sentence repr
  * also attends a lot to [SEP] and punctuation (Clark+ 2019)
  * periods and commas are simply almost as frequent as [CLS] and [SEP]
  * [SEP]
    * might be one of “no-op”, a signal to ignore the head
      if its pattern is not applicable to the current case
    * gets increased attention starting in layer 5, but
      its importance for prediction drops
    * [if so, than] attention probing studies that excluded the [SEP] and [CLS]
      tokens should perhaps be revisited (e.g. Lin+ (2019) and Htut+ (2019))
* the “heterogeneous” self-attention pattern,
  studies looked for specific BERT heads with linguistically interpretable func
  * specialize in certain types of syntactic relations
  * words in certain syntactic positions (Htut+ 2019; Clark+ 2019)
  * heads that attend to words in obj role more than the positional baseline
  * evidence for nsubj, advmod, and amod [differ] between these two studies
  * supported by Voita+ (2019)’s data for the base Transformer in MT context
  * even complex dependencies like dobj are encoded by a combination of heads
    * Hoover+ (2019), limited to qualitative analysis
* no single head has the complete syntactic tree information,
  * Both Clark+ (2019) and Htut+ (2019) conclude that
  * in line with evidence of partial knowledge of syntax (see subsection 4.1)
* attention weights are weak indicators
  of subject-verb agreement and reflexive anafora (Lin+ 2019)
  * Instead of serving as strong pointers between tokens
    * close to a uniform attention baseline, but
  * sensitivity to different types of distractors coherent with psycholing data
* a BERT head [directly for coreference classification] on par with a rule-basd
  (Clark+ 2019)
* even when attention heads specialize in tracking semantic relations, they do
  not necessarily contribute to BERT’s performance on relevant tasks
  * two heads of base BERT, in which self-attention maps were closely aligned
    with annotations of core frame semantic relations (Baker+ 1998)
  * Kovaleva+ (2019) identified
  * should have been instrumental to tasks such as inference, a
  * head ablation study showed that
    these heads were not essential for BERT’s success on GLUE tasks

## 4.3 BERT layers

* input [is] a combination of token, segment, and positional embeddings
* lower layers have the most linear word order information
  * decrease in the knowledge of linear word order around layer 4 (Lin+ 2019)
  * increased knowledge of hierarchical sentence structure, as detected by the
    probing tasks of predicting the
    index of a token, the main auxiliary verb and the sentence subject
* syntactic information is the most prominent in the middle BERT layers
  * consensus among studies with different tasks, datasets and methodologies
  * which layers exactly?
    * syntactic tree depth [is best] from the middle BERT layers
      * Hewitt and Manning (2019), 69 for base, 14-19 for large
    * subject-verb agreement around layers 8-9 (Goldberg 2019)
    * syntactic probing tasks used by Jawahar+ (2019) also [peaked in middle]
  * must be related to that the middle layers of Transformers are overall the
    best-performing and the most transferable across tasks (Liu+ 2019a)
  * conflicting evidence about syntactic chunks
    * Tenney+ (2019a) [drawing
      parallels to] the order of components in a typical NLP pipeline
      from POS-tagging to dependency parsing to semantic role labeling
    * lower layers were more useful for chunking, while
      middle layers were more useful for parsing (Jawahar+ 2019)
    * Liu+ (2019a) find the opposite: both POStagging and chunking were also
      performed best at the middle layers, in both BERT-base and BERT-large
* final layers of BERT are the most task-specific
  * In pre-training, this means specificity to the MLM task, which would
    explain why the middle layers are more transferable (Liu+ 2019a)
  * In fine-tuning, it explains
    why the final layers change the most (Kovaleva+ 2019)
  * if the weights of lower layers of the fine-tuned BERT are restored to orig,
    it does not dramatically hurt the model performance (Hao+ 2019)
* while most of syntactic information can be localized in a few layers,
  semantics is spread across the entire model, (Tenney+ 2019a)
  * certain non-trivial examples get solved incorrectly at first but
    correctly at higher layers. This is rather to be expected:
    semantics permeates all language, and linguists
    debate whether meaningless structures can exist at all (Goldberg, 2006)
  * what [does] stacking more Transformer layers actually achieve in BERT
    in terms of the spread of semantic knowledge, and is that beneficial?
    * comparison between base and large BERTs shows that the
      overall pattern of cumulative score gains is the same, only
      more spread out in the large BERT
* disputed by Jawahar+ (2019), who place “surface features in lower layers,
  syntactic features in middle layers and semantic features in higher layers”
  * only one SentEval semantic task in this study actually topped at the last
  * three others peaked around the middle and then degraded by the final layers

# 5 Training BERT 7

* proposals to optimize the training and architecture of the original BERT

## 5.1 Model architecture choices

* the most systematic study of BERT architecture was performed by Wang+ (2019b)
  * number of layers, heads, and model parameters,
    varying one option and freezing the others
  * number of heads was not as significant as the number of layers, which is
    consistent with
    * the findings of Voita+ (2019) and Michel+ (2019), discussed in section 7,
    * middle layers were the most transferable (Liu+ 2019a)
  * Larger hidden representation size was consistently better, but the
    gains varied by setting
* batchsize
  * large-batch training (8k examples) improves both the language model
    perplexity and downstream task performance (Liu+ 2019c)
    * They also publish their recommendations for other model parameters
  * with a batch size of 32k BERT’s training time can be significantly
    reduced with no degradation in performance (You+ 2019)
* embedding values of the trained [CLS] token are not centered around zero,
  their normalization stabilizes the training (Zhou+ 2019)
  * slight performance gain on text classification tasks
* training ... in a recursive manner (Gong+ 2019), where the
  shallower version is trained first and
  then the trained parameters are copied to deeper layers, aka. “warm-start”
  * 25% faster training speed while reaching
    similar accuracy to the original BERT on GLUE tasks

## 5.2 Improvements to the training regime

## 5.3 Pre-training BERT

* original BERT is a bidirectional Transformer pre-trained on two tasks:
  next sentence prediction (NSP) and masked language model (MLM)
* alternative training objectives
  * Removing NSP does not hurt or slightly improves task performance
    (Liu+ 2019b;Joshi+ 2020; Clinchant+ 2019),
    * especially in cross-lingual setting (Wang+ 2019b)
    * predicting both the next and the previous sentences (Wang+ 2019a) replace
    * swapped sentences from positive examples,
      rather than sentences from different documents Lan+ (2020)
  * Dynamic masking (Liu+ 2019b): diverse masks ... within an epoch
  * Beyond-sentence MLM
    * Lample and Conneau (2019)
      replace sentence pairs with arbitrary text streams, and
      subsample frequent outputs similarly to Mikolov+ (2013b)
    * SemBERT (Zhang+ 2020) integrates semantic role information
  * Permutation language modeling. Yang+ (2019) replace MLM with
    training on different permutations of word order in the input sequence,
    maximizing the probability of the original word order
    * See also the n-gram word order reconstruction task (Wang+ 2019a)
  * Span boundary objective (Joshi+ 2020)
    * predict a masked span (rather than single words)
      using only the representations of the tokens at the span’s boundary
  * Phrase masking and named entity masking (Zhang+ 2019)
    * masking entities rather than individual words
  * Continual learning (Sun+ 2019b)
    * i.e.  sequential pre-training on a large number of tasks,
      each with their own loss which are then combined
  * Conditional MLM by Wu+ (2019b) replaces the segmentation embeddings with
    “label embeddings”, which also include the label for a given sentence from
    an annotated task dataset (e.g. sentiment analysis)
  * replacing the MASK token with [UNK] token (Clinchant+ (2019)
    * could help the model to learn certain representation for unknowns
    * could be exploited by a neural machine translation model
* pretraining data
  * increasing the corpus volume and longer training (Liu+ 2019c)
  * incorporate structured knowledge resources (Peters+ 2019a)
* use entity embeddings as input, as in
  E-BERT (Poerner+ 2019) and ERNIE (Zhang+ 2019)
  * new tasks in ERNIE
    * token-level: prediction whether a token is capitalized and whether it
      occurs in other segments of the same document
    * Segment-level tasks include sentence reordering, sentence distance
      prediction, and supervised discourse relation classification
* Pre-training is the most expensive part of training BERT. What is the goal?
  * help the fine-tuned BERT find wider and flatter areas
    with smaller generalization error, which
    makes the model more robust to overfitting (Hao+ 2019)
  * on some tasks a randomly initialized and fine-tuned BERT
    obtains competitive or higher results
    than the pre-trained BERT with the task classifier and frozen weights

## 5.4 Fine-tuning BERT

* Pre-training + fine-tuning workflow is a crucial part of BERT
  * pre-training is supposed to provide task-independent linguistic knowledge,
  * fine-tuning process would presumably teach the model to [choose] the repr
* Kovaleva+ (2019) [find] for BERT fine-tuned on GLUE tasks [that] during
  fine-tuning, the most changes for 3 epochs occurred in the last two layers
  * those changes caused self-attention to focus on [SEP]
    rather than on linguistically interpretable patterns
  * why fine-tuning would increase the attention to [CLS], but not [SEP]?
  * If Clark+ (2019) are correct that [SEP] serves as “no-op” indicator,
    fine-tuning basically tells BERT what to ignore
  * multilingual BERT
    fine-tuning affected the top and the middle layers of the model (Singh+ 19)
* studies explored the possibilities of improving the fine-tuning of BERT:
  * Taking more layers into account
    * deeper layers combined with the output layer (Yang and Zhao 2019)
    * weighted representation of all layers (Su and Cheng 2019)
  * Two-stage fine-tuning
    * intermediate supervised training stage (Phang+ 2019; Garg+ 2020)
  * Adversarial token perturbations improve robustness of the model (Zhu+ 2019)
* With larger and larger models even fine-tuning becomes expensive, but
  * approximated by inserting adapter modules (Houlsby+ 2019)
  * 26 classification tasks, achieving competitive performance at a
    fraction of the computational cost
  * reusing monolingual BERT weights for cross-lingual transfer (Artetxe+ 2019)
* alternative to fine-tuning is extracting features from frozen reprs,
  but fine-tuning works better for BERT (Peters+ 2019b)
* Initialization can have a dramatic effect (Petrov, 2010)
  * variation ... not often reported
  * performance improvements claimed in many NLP modeling papers may be within
    the range of that variation (Crane, 2018)
  * Dodge+ (2020) report significant variation for BERT fine-tuned on GLUE
    * both weight initialization and training data order contribute to the var
    * propose an early-stopping technique to
      avoid full fine-tuning for the less-promising seeds

# 6 How big should BERT be? 10

## 6.1 Overparametrization

* Transformer-based models keep increasing in size:
  e.g. T5 (Wu+ 2016a) is over 30 times larger than the base BERT. This raises
* concerns about
  * computational complexity of self-attention (Wu+ 2019a),
  * environmental issues (Strubell+ 2019; Schwartz+ 2019), as well as
  * reproducibility and access to research resources in academia vs. industry
* current models do not make good use of the parameters they already have
  * all but a few Transformer heads could be pruned (Voita+ 2019)
  * most BERT heads in the same layer show similar self-att patts (Clark+ 2019)
  * able to reduce most layers to a single head (Michel+ 2019)
* harmful BERT heads/layers ... depending on the task
  * for machine translation (Michel+ 2019), and for GLUE tasks,
    both heads and layers could be disabled (Kovaleva+ 2019)
  * in structural probing classifier (Tenney+ 2019a),
    in 5 out of 8 probing tasks some layers (typ final) cause a drop in scores
* comparing BERT-base and BERT-large
  * [many times] the larger model perform better Liu+ (2019a), but
  * opposite was observed for subject-verb agreement (Goldberg, 2019) and
    sentence subject detection Lin+ (2019)
* why BERT ends up with redundant heads and layers
  * not clear ... given the complexity of language, and amounts of pre-training
  * Clark+ (2019) suggest that [reason] is the use of attention dropouts

## 6.2 Compression

* BERT can be efficiently compressed with minimal accuracy loss
* knowledge distillation framework (Hinton+ 2015)
  * a smaller student-network is trained to mimic the behavior of BERT(lrg/bas)
  * loss functions (Sanh+ 2019; Jiao+ 2019),
  * mimicking the activation patterns of individual portions of the teacher
    (Sun+ 2019a), or
  * knowledge transfer at different stages at the pre-training
    (Turc+ 2019; Jiao+ 2019; Sun+ or at the fine-tuning stage (Jiao+ 2019))
* quantization [of] weights (Shen+ 2019; Zafrir+ 2019)
  * often requires compatible hardware
* Other techniques include
  * decomposing BERT’s embedding matrix into smaller matrices (Lan+ 2019) and
  * progressive model replacing (Xu+ 2020)

## 6.3 Pruning and model analysis

# 7 Directions for further research

## Benchmarks that require verbal reasoning

* BERT  was shown to rely on shallow heuristics in 
  * natural language inference (McCoy+ 2019b; Zellers+ 2019; Jin+ 2020), 
  * reading comprehension (Si+ 19a; Rogers+ ; Sugawara+ ; Si+ 19b; Yogatama+ 19)
  * argument reasoning comprehension (Niven and Kao, 19), and 
  * text classification (Jin+ 2020). 
* Such heuristics can even be used to reconstruct a non-publicly-available model
  (Krishna+ 2020): there is a shortcut in the data
* devel of harder datasets should be as valued as modeling work

## Benchmarks for the full range of linguistic competence

* A step in this direction is the "Checklist" behavioral testing (Ribeiro+ 2020)
  the best paper at ACL 2020. Ideally, such tests would 
  * measure not only errors, but also sensitivity (Ettinger, 2019).

## Developing methods to "teach" reasoning.

* they often fail if any reasoning needs to be performed on top of the facts
  (Talmor+ 2019, see also subsection 3.3). For instance, 
* Richardson+ (2020) propose a method to "teach" BERT quantification,
  conditionals, comparatives, and boolean coordination.

## Learning what happens at inference time.

* discovering what knowledge actually gets used. Several promising directions
  * "amnesic probing" (Elazar+ 2020), 
  * identifying features important for prediction for a given task
    (Arkhangelskaia and Dutta, 2019), and 
  * pruning the model to remove the nonimportant components 
    (Voita+ 2019b; Michel+ 2019; Prasanna+ 2020)

# 8 Multilingual BERT

* trained on Wikipedia in 104 languages (110K wordpiece vocabulary)
  * Languages with a lot of data were subsampled, and some were super-sampled
    * exponential smoothing
* surprisingly [good] in zero-shot transfer on many tasks
  (Wu and Dredze, 2019; Pires+ 2019)
  * not in language generation (Rönnqvist+ 2019)
  * high-quality cross-lingual word alignments (Libovický+ 2019), with
  * caveats [kifogások] for open-class parts of speech (Cao+ 2019)
  * Adding more languages does not seem to harm the quality of representations
    (Artetxe+ 2019)
* across some scripts (Pires+ 2019)
* retrieve parallel sentences, although Libovický+ (2019) note that this task
  could be solvable by simple lexical matches
* representation space shows some systematicity in between-language mappings,
  (Pires+ 2019)
  * “translate” [by shifting the representations by the] sentences offset
* mBERT is simply trained on a multilingual corpus, with no language IDs,
  * but it encodes language identities (Wu and Dredze, 2019; Libovický+ 2019),
  * adding the IDs in pre-training was not beneficial (Wang+ 2019b)
  * at least some typological language features (Libovický+ 2019; Singh+ 2019),
  * transfer between structurally similar languages works better
    (Wang+ 2019b; Pires+ 2019)
  * could not be considered as interlingua (Singh+ 2019)
    if typological features structure its representation space
* cross-lingual transfer can be achieved (Artetxe+ 2019)
  by only retraining the input embeddings while keeping monolingual BERT weight
  * i.e. even monolingual models learn generalizable linguistic abstractions
* compared with English BERT
  * At least some of the syntactic properties of English BERT hold for mBERT:
  * MLM is aware of 4 types of agreement in 26 langs (Bacon and Regier, 2019)
  * main auxiliary of the sentence can be detected in German and Nordic langs
    (Rönnqvist+ 2019)
* shared word-pieces help mBERT?
  * yes (Pires+ 2019; Wu and Dredze 2019),
    performance correlated with the amount of shared vocabulary
  * no (Wang+ 2019b),
    bilingual BERT models [don't need] shared vocabulary
  * no, crossling transfer is possible by swapping [lecserélve] the model vocab
    without any shared word-pieces (Artetxe+ 2019)
* proposals were made for improving mBERT:
  * fine-tuning on multilingual datasets
    by freezing the bottom layers (Wu and Dredze, 2019)
  * improving word alignment in fine-tuning (Cao+ 2019)
  * translation language modeling (Lample and Conneau, 2019) [as]
    an alternative pre-training objective where
    words are masked in parallel sentence pairs
  * Huang+ (2019) combine 5 pre-training tasks
    (monolingual and cross-lingual MLM, translation language modeling,
    cross-lingual word recovery and paraphrase classification)
* monolingual BERT directly in cross-lingual setting
  * initializing the encoder part of the neural MT model with monolingual BERT
    (Clinchant+ 2019)
  * mBERT does not have to be pre-trained on multiple languages:
    freeze the Transformer weights and retrain only the input embeddings
    (Artetxe+ 2019; Tran 2019)

# 9 Discussion

## 9.1 Limitations

* Tenney+ (2019a) aptly stated,
  * “the fact that a linguistic pattern is not observed by our probing
    classifier does not guarantee that it is not there, and
  * the observation of a pattern does not tell us how it is used”
* trade-off between the complexity of the probe and the tested hypothesis
  (Liu+ 2019a)
  * A more complex probe might be able to recover more information,
    but it [is] less clear whether we are still talking about the orig model
* different probing methods may reveal ...  contradictory information
  (Warstadt+ 2019)
  * Certain methods might also favor a certain model,
    e.g., RoBERTa [and] BERT with [two] tree extraction methods (Htut+ 2019)
* Head and layer ablation studies (Michel+ 2019; Kovaleva+ 2019)
  * diffuse representations spread across the full network
  * semantic parsing tasks (Tenney+ 2019a)
  * [no] heads would perform parsing “in general” (Clark+ 2019; Htut+ 2019)
  * Michel+ (2019) prune heads in the order set by a proxy importance score,
  * Voita+ (2019) fine-tune the pretrained Transformer with
    a regularized objective that has the head-disabling effect
* attention visualizations, with ... tools (Vig, 2019; Hoover+ 2019)
  * debate on the merits of attention as a tool for interpreting deep learning
    (Jain and Wallace, 2019; Serrano and Smith, 2019;
    Wiegreffe and Pinter, 2019; Brunner+ 2020)
  * limited to qualitative analysis (Belinkov and Glass, 2019)

# 7 Directions for further research

### Benchmarks that require verbal reasoning

* [BERT's] verbal reasoning abilities are not as impressive as it seems
  * [BERT relies] on shallow heuristics in both
    natural language inference (McCoy+ 2019b; Zellers+ 2019) and
    reading comprehension (Si+ 2019; Rogers+ 2020; Sugawara+ 2020)
  * needs to incentivize [=motvt] dataset development on par with modeling work
    which at present is often perceived as more prestigious

### Developing methods to “teach” reasoning

* [when] reasoning needs to be performed on top of the facts they possess
  (see subsection 4.3)
* Richardson+ (2019) propose a method to “teach” BERT
  quantification, conditionals, comparatives, and boolean coordination

### Learning what happens at inference time

* what knowledge actually gets used
  * knowledge represented in BERT does not necessarily get used in downstream
    (Kovaleva+ 2019)
  * for work in this direction
    * other head ablation studies (Voita+ 2019; Michel+ 2019) and studies of
    * reading comprehension (van Aken+ 2019; Arkhangelskaia and Dutta, 2019)

# 8 Conclusion

* The stream of papers seems to be accelerating rather than slowing down
