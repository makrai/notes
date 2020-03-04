Anna Rogers, Olga Kovaleva, Anna Rumshisky
Primer in BERTology: What we know about how BERT works

# Abstract

* Transformer-based models are now widely used in NLP, but we still do not
  understand a lot about their inner workings
* This paper
  * synthesizing over 40 analysis studies. We also provide an
  * overview of the proposed modifications ... and its training regime.  We
  * directions for further research

# 1 Introduction

* Transformers (Vaswani+ 2017) took NLP by storm, offering
  * enhanced parallelization and better modeling of long-range dependencies
  * best ... model is BERT (Devlin+ 2019) which obtained SOTA results in benchm
  * integrated in Google search 1 , improving an estimated 10% of queries
    * https://blog.google/products/search/search-language-understanding-bert
* little cognitive motivation, and the
  * size of these models limits our ability to experiment with pre-training and
    perform ablation studies. This explains a large number of studies over the
* We focus on the studies investigating the types of knowledge learned by BERT,
  where this knowledge is represented, how it is learned, and the
  methods proposed to improve it.  1

# 2 Overview of BERT architecture

* BERT is a stack of Transformer encoder layers (Vaswani+ 2017) which consist
  * multiple “heads”, i.e., fully-connected neural networks augmented with a
    self-attention mechanism. For every input token in a sequence, each head
    computes key, value and query vectors, which are used to create a weighted
    representation. The outputs of all heads in the same layer are combined and
    run through a fully-connected layer. Each layer is wrapped with a skip
    connection and layer normalization is applied after it
* conventional workflow: pre-training and fine-tuning
  * Pretraining uses two semi-supervised tasks:
    * masked language modeling (MLM, prediction of randomly masked input token)
    * next sentence prediction
      (NSP, predicting if two input sentences are adjacent to each other).  In
  * fine-tuning for downstream applications,
    one or more fully-connected layers are typically added
    on top of the final encoder layer
* The input representations are computed as follows: BERT first
  * tokenizes the given word into wordpieces (Wu+ 2016b), and then
  * combines three embedding layers (token, position, and segment) to obtain a
    fixed-length vector
  * Special token [CLS] is used for classification predictions, and
    [SEP] separates input segments
* base and large, varying in the
  number of layers, their hidden size, and number of attention heads

# 3 BERT embeddings

* find that BERT’s contextualized embeddings form distinct and clear clusters
  corresponding to word senses (Wiedemann+ 2019),
  which confirms that the basic distributional hypothesis holds
* representations of the same word varies depending on position of the sentence
  * likely due to NSP objective (Mickus+ 2019)

 measure
* how similar the embeddings for identical words are in every layer
  * Ethayarajh (2019) find that later BERT layers produce more context-specific
    * embeddings occupy a narrow cone in the vector space, and
      this effect increases from lower to higher layers.  That is, two random

# 4 What knowledge does BERT have?

* approaches include
  * fill-in-the-gap probes of BERT’s MLM,
  * self-attention weights,
  * and probing classifiers using different BERT representations as inputs

##4.1 Syntactic knowledge

Lin+ (2019) showed that BERT representations are hierarchical rather
than linear, i.e.  there is something akin to syntactic tree structure in
addition to the word order information. Tenney+ (2019b) and Liu+
(2019a) also showed that BERT embeddings encode information about parts of
speech, syntactic chunks and roles. However, BERT’s knowledge of syntax is
partial, since probing classifiers could not recover the labels of distant
parent nodes in the syntactic tree (Liu+ 2019a).

As far as how syntactic information is represented, it seems that syntactic
structure is not directly encoded in self-attention weights, but they can be
transformed to reflect it. Htut+ (2019) were unable to extract full
parse trees from

BERT heads even with the gold annotations for the root. Jawahar+ (2019)
include a brief illustration of a dependency tree extracted directly from
self-attention weights, but provide no quantitative evaluation. However,
Hewitt and Manning (2019) were able to learn transformation matrices that would
successfully recover much of the Stanford Dependencies formalism for
PennTreebank data (see Figure 2). Jawahar+ (2019) try to approximate BERT
representations with Tensor

Product Decomposition Networks (McCoy+ 2019a), concluding that the
dependency trees are the best match among 5 decomposition schemes (although the
reported MSE differences are very small).

Regarding syntactic competence of BERT’sMLM, Goldberg (2019) showed that BERT
takes subject-predicate agreement into account when performing the cloze task.
This was the case even for sentences with distractor clauses between the
subject and the verb, and meaningless sentences. A study of negative polarity
items (NPIs) by Warstadt+ (2019) showed that BERT is better able to
detect the presence of NPIs (e.g. ”ever”) and the words that allow their use
(e.g. ”whether”) than scope violations.

The above evidence of syntactic knowledge is belied by the fact that BERT
does not “understand” negation and is insensitive to malformed input.

In particular, its predictions were not altered even with shuffled word order,
truncated sentences, removed subjects and objects (Ettinger, 2019). This is
in line with the recent findings on adversarial attacks, with models
disturbed by nonsensical inputs (Wallace+ 2019a), and suggests that
BERT’s encoding of syntactic structure does not indicate that it actually
relies on that knowledge.

##4.2 Semantic knowledge

To date, more studies were devoted to BERT’s knowledge of syntactic rather than
semantic phenomena. However, we do have evidence from an

MLM probing study that BERT has some knowledge for semantic roles (Ettinger,
2019). BERT is even able to prefer the incorrect fillers for semantic roles
that are semantically related to the correct ones, to those that are unrelated
(e.g. “to tip a chef” should be better than “to tip a robin”, but worse than
“to tip a waiter”).

Tenney+ (2019b) showed that BERT encodes information about entity
types, relations, semantic roles, and proto-roles, since this information can
be detected with probing classifiers.

BERT struggles with representations of numbers. Addition and number decoding
tasks showed that BERT does not form good representations for floating point
numbers and fails to generalize away from the training data (Wallace+
2019b). A part of the problem is BERT’s wordpiece tokenization, since numbers
of similar values can be divided up into substantially different word chunks.

##4.3 World knowledge

* MLM [ adapted] for knowledge induction by filling in the blanks
  e.g. “Cats like to chase [ ]”). There is at least one
* probing study of world knowledge in BERT (Ettinger, 2019), but the
  * bulk of evidence comes from numerous practitioners using BERT to extract kn
* for some relation types, vanilla BERT is competitive with methods [with KB]
  (Petroni+ 2019)
* generalizes better to unseen data (Davison+ 2019).  However, to retrieve
  * we need good template sentences, and there is work on their
    * automatic extraction and augmentation (Bouraoui+ 2019; Jiang+)
* BERT cannot reason based on its world knowledge.
  * can “guess” the affordances and properties of many objects, but does not
    have the information about their interactions
    (e.g. it “knows” that people can walk into houses, and that houses are big,
    but it cannot infer that houses are bigger than people (Forbes+ 2019).)
  * performance drops with the number of necessary inference steps
    * Zhou+ (2020) and Richardson and Sabharwal (2019) also show that the
  * some of BERT’s success in factoid knowledge retrieval comes from
    learning stereotypical character combinations (Poerner+ 2019)
    e.g. a person with an Italian-sounding name is Italian

# 5 Localizing linguistic knowledge

##5.1 Self-attention heads

Attention is widely considered to be useful for understanding Transformer
models, and several studies proposed classification of attention head types: •
attending to the word itself, to previous/next words and to the end of the
sentence (Raganato and Tiedemann, 2018); • attending to previous/next tokens,
[CLS], [SEP], punctuation, and “attending broadly” over the sequence (Clark et
al., 2019); • the 5 attention types shown in Figure 4 (Kovaleva+ 2019).Vertical
[CLS] [SEP]

Diagonal [SEP] [CLS] [SEP]

Vertical + diagonal [SEP] [CLS] [SEP] [SEP] [CLS]

Block [SEP]

Heterogeneous [SEP] [CLS] [SEP] [SEP]

Figure 4: Attention patterns in BERT (Kovaleva+ 2019)

According to Clark+ (2019), “attention weight has a clear meaning: how
much a particular word will be weighted when computing the next
representation for the current word”. However, Kovaleva+ (2019) showed
that most selfattention heads do not directly encode any nontrivial
linguistic information, since less than half of them had the “heterogeneous”
pattern 2 . Much of the model encoded the vertical pattern (attention to [CLS],
[SEP], and punctuation tokens), consistent with the observations by Clark et
al. (2019).

This apparent redundancy must be related to the overparametrization issue (see
section 7).

Attention to [CLS] is easy to interpret as attention to an aggregated
sentence-level representation, but BERT also attends a lot to [SEP] and punc-
tuation. Clark+ (2019) hypothesize that periods and commas are simply
almost as frequent as [CLS] and [SEP], and the model learns to rely on them.
They suggest also that the function of [SEP] might be one of “no-op”, a signal
to ignore the head if its pattern is not applicable to the current case. [SEP]
gets increased attention starting in layer 5, but its importance for prediction
drops. If this hypothesis is correct, attention probing studies that excluded
the [SEP] and [CLS] tokens (as e.g. Lin+ (2019) and Htut+ (2019))
should perhaps be revisited.

Proceeding to the analysis of the “heterogeneous” self-attention pattern, a
number of studies looked for specific BERT heads with linguistically
interpretable functions.

Some BERT heads seem to specialize in certain types of syntactic relations.
Htut+ (2019) and Clark+ (2019) report that there are BERT heads
that attended significantly more than a random baseline to words in certain
syntactic positions. The datasets and methods used in these studies differ,
but they both find that there 2

The experiments were conducted with BERT fine-tuned on GLUE tasks (Wang+
2018).  are heads that attend to words in obj role more than the positional
baseline. The evidence for nsubj, advmod, and amod has some variation between
these two studies. The overall conclusion is also supported by Voita+
(2019)’s data for the base Transformer in machine translation context. Hoover
et al. (2019) hypothesize that even complex dependencies like dobj are encoded
by a combination of heads rather than a single head, but this work is limited
to qualitative analysis.

Both Clark+ (2019) and Htut+ (2019) conclude that no single head
has the complete syntactic tree information, in line with evidence of partial
knowledge of syntax (see subsection 4.1).

Lin+ (2019) present evidence that attention weights are weak indicators
of subjectverb agreement and reflexive anafora. Instead of serving as strong
pointers between tokens that should be related, BERT’s self-attention weights
were close to a uniform attention baseline, but there was some sensitivity to
different types of distractors coherent with psycholinguistic data.

Clark+ (2019) identify a BERT head that can be directly used as a
classifier to perform coreference resolution on par with a rule-based
system,.

Kovaleva+ (2019) showed that even when attention heads specialize in
tracking semantic relations, they do not necessarily contribute to

BERT’s performance on relevant tasks. Kovaleva+ (2019) identified two
heads of base BERT, in which self-attention maps were closely aligned with
annotations of core frame semantic relations (Baker+ 1998). Although
such relations should have been instrumental to tasks such as inference, a head
ablation study showed that these heads were not essential for BERT’s success on
GLUE tasks.

##5.2 BERT layers

The first layer of BERT receives as input representations that are a
combination of token, segment, and positional embeddings. It stands to reason
that thelower layers have the most linear word order information. Lin+
(2019) report a decrease in the knowledge of linear word order around layer 4
in BERT-base. This is accompanied by increased knowledge of hierarchical
sentence structure, as detected by the probing tasks of predicting the index
of a token, the main auxiliary verb and the sentence subject.

There is a wide consensus among studies with different tasks, datasets and
methodologies that syntactic information is the most prominent in the middle
BERT 3 layers. Hewitt and Manning (2019) had the most success reconstructing
syntactic tree depth from the middle BERT layers (69 for base-BERT, 14-19
for BERT-large). Goldberg (2019) report the best subject-verb agreement
around layers 8-9, and the performance on syntactic probing tasks used by
Jawahar+ (2019) also seemed to peak around the middle of the model.

The prominence of syntactic information in the middle BERT layers must be
related to Liu+ (2019a) observation that the middle layers of Trans-
formers are overall the best-performing and the most transferable across tasks
(see Figure 5).

Figure 5: BERT layer transferability (columns correspond to probing tasks)
(Liu+ 2019a).

There is conflicting evidence about syntactic chunks. Tenney+ (2019a)
conclude that “the basic syntactic information appears earlier in the network
while high-level semantic features appears at the higher layers”, drawing
parallels between this order and the order of components in a typical NLP
pipeline from POS-tagging to dependency parsing to semantic role labeling.
Jawahar+ (2019) also report that the lower layers were more useful for
chunking, while middle layers were more useful for parsing. At the same time,
the probing experiments by Liu+ (2019a) find the opposite: both POS-
tagging and chunking were also performed best at the middle layers, in both
BERT-base and BERTlarge.

The final layers of BERT are the most taskspecific. In pre-training, this
means specificity to the MLM task, which would explain why the middle layers
are more transferable (Liu+ 2019a). In fine-tuning, it explains why the
final layers change the most (Kovaleva+ 2019). At the same time, Hao et
al. (2019) report that if the weights of lower layers of the fine-tuned BERT
are restored to their original values, it does not dramatically hurt the
model performance.

Tenney+ (2019a) suggest that while most of syntactic information can be
localized in a few layers, semantics is spread across the entire model, which
would explain why certain non-trivial examples get solved incorrectly at
first but correctly at higher layers. This is rather to be expected: se-
mantics permeates all language, and linguists debate whether meaningless
structures can exist at all (Goldberg, 2006, p.166-182). But this raises the
question of what stacking more Transformer layers actually achieves in BERT in
terms of the spread of semantic knowledge, and whether that is beneficial.

The authors’ comparison between base and large

BERTs shows that the overall pattern of cumulative score gains is the same,
only more spread out in the large BERT.

The above view is disputed by Jawahar+ (2019), who place “surface
features in lower layers, syntactic features in middle layers and semantic
features in higher layers”. However, the conclusion with regards to the
semantic features seems surprising, given that only one SentEval semantic task
in this study actually topped at the last layer, and three others peaked around
the middle and then considerably degraded by the final layers.

# 6 Training BERT

This section reviews the proposals to optimize the training and architecture of
the original BERT.

## 6.1 Pre-training BERT

The original BERT is a bidirectional Transformer pre-trained on two tasks: next
sentence prediction (NSP) and masked language model (MLM). Multiple studies
have come up with alternative training objectives to improve on BERT.  3

These BERT results are also compatible with findings by

Vig and Belinkov (2019), who report the highest attention to tokens in
dependency relations in the middle layers of GPT-2.  • Removing NSP does not
hurt or slightly improves task performance (Liu+ 2019b;Joshi+
2020; Clinchant+ 2019), especially in cross-lingual setting (Wang et
al., 2019b). Wang+ (2019a) replace NSP with the task of predicting both
the next and the previous sentences. Lan+ (2020) replace the negative NSP
examples by the swapped sentences from positive examples, rather than sentences
from different documents.  • Dynamic masking (Liu+ 2019b) improves on
BERT’s MLM by using diverse masks for training examples within an epoch; •
Beyond-sentence MLM. Lample and Conneau (2019) replace sentence pairs with
arbitrary text streams, and subsample frequent outputs similarly to Mikolov et
al. (2013b).  of increasing the corpus volume and longer training. The data
also does not have to be unstructured text: although BERT is actively used as a
source of world knowledge (subsection 4.3), there are ongoing efforts to
incorporate structured knowledge resources (Peters+ 2019a).

Another way to integrate external knowledge is use entity embeddings as input,
as in E-BERT (Poerner+ 2019) and ERNIE (Zhang+ 2019).

Alternatively, SemBERT (Zhang+ 2020) integrates semantic role
information with BERT representations.  • Permutation language modeling. Yang
et al.  (2019) replace MLM with training on different permutations of word
order in the input sequence, maximizing the probability of the original word
order. See also the n-gram word order reconstruction task (Wang+ 2019a).
• Span boundary objective aims to predict a masked span (rather than single
words) using only the representations of the tokens at the span’s boundary
(Joshi+ 2020); • Phrase masking and named entity masking (Zhang+
2019) aim to improve representation of structured knowledge by masking
entities rather than individual words; • Continual learning is sequential
pre-training on a large number of tasks 4 , each with their own loss which are
then combined to continually update the model (Sun+ 2019b).  •
Conditional MLM by Wu+ (2019b) replaces the segmentation embeddings
with “label embeddings”, which also include the label for a given sentence
from an annotated task dataset (e.g. sentiment analysis).  • Clinchant+
(2019) propose replacing the

MASK token with [UNK] token, as this could help the model to learn certain
representation for unknowns that could be exploited by a neural machine
translation model.

Another obvious source of improvement is pretraining data. Liu+ (2019c)
explore the benefits 4

New token-level tasks in ERNIE include prediction whether a token is
capitalized and whether it occurs in other segments of the same document.
Segment-level tasks include sentence reordering, sentence distance prediction,
and supervised discourse relation classification.

Figure 6: Pre-trained weights help BERT find wider optima in fine-tuning on
MRPC (right) than training from scratch (left) (Hao+ 2019)

Pre-training is the most expensive part of training BERT, and it would be
informative to know how much benefit it provides. Hao+ (2019) conclude
that pre-trained weights help the fine-tuned

BERT find wider and flatter areas with smaller generalization error, which
makes the model more robust to overfitting (see Figure 6). However, on some
tasks a randomly initialized and fine-tuned

BERT obtains competitive or higher results than the pre-trained BERT with the
task classifier and frozen weights (Kovaleva+ 2019).

## 6.2 Model architecture choices

To date, the most systematic study of BERT architecture was performed by Wang
et al. (2019b).

They experimented with the number of layers, heads, and model parameters,
varying one option and freezing the others. They concluded that the number of
heads was not as significant as the number of layers, which is consistent
with the findings of Voita+ (2019) and Michel+ (2019), discussed
in section 7, and also the observation by

Liu+ (2019a) that middle layers were the most transferable. Larger hidden
representation size was consistently better, but the gains varied by
setting.Liu+ (2019c) show that large-batch training (8k examples)
improves both the language model perplexity and downstream task performance.
They also publish their recommendations for other model parameters. You+
(2019) report that with a batch size of 32k BERT’s training time can be sig-
nificantly reduced with no degradation in performance. Zhou+ (2019)
observe that the embedding values of the trained [CLS] token are not centered
around zero, their normalization stabilizes the training leading to a slight
performance gain on text classification tasks.

Gong+ (2019) note that, since self-attention patterns in higher layers
resemble the ones in lower layers, the model training can be done in a
recursive manner, where the shallower version is trained first and then the
trained parameters are copied to deeper layers. Such “warm-start” can lead to a
25% faster training speed while reaching similar accuracy to the original BERT
on GLUE tasks.

## 6.3 Fine-tuning BERT

Pre-training + fine-tuning workflow is a crucial part of BERT. The former is
supposed to provide taskindependent linguistic knowledge, and the fine-
tuning process would presumably teach the model to rely on the representations
that are more useful for the task at hand.

Kovaleva+ (2019) did not find that to be the case for BERT fine-tuned on
GLUE tasks 5 : during fine-tuning, the most changes for 3 epochs occurred
in the last two layers of the models, but those changes caused self-attention
to focus on [SEP] rather than on linguistically interpretable patterns.

It is understandable why fine-tuning would increase the attention to [CLS], but
not [SEP]. If Clark+ (2019) are correct that [SEP] serves as “no-op”
indicator, fine-tuning basically tells BERT what to ignore.

Several studies explored the possibilities of improving the fine-tuning of
BERT: • Taking more layers into account. Yang and

Zhao (2019) learn a complementary representation of the information in the
deeper layers that is combined with the output layer. Su and Cheng (2019)
propose using a weighted representation of all layers instead of the final
layer output.  5

See also experiments with multilingual BERT by (Singh+ 2019), where
fine-tuning affected the top and the middle layers of the model.  • Two-stage
fine-tuning introduces an intermediate supervised training stage between pre-
training and fine-tuning (Phang+ 2019;

Garg+ 2020).  • Adversarial token perturbations improve robustness of
the model (Zhu+ 2019).

With larger and larger models even fine-tuning becomes expensive, but Houlsby
et al. (2019) show that it can be successfully approximated by inserting
adapter modules. They adapt BERT to 26 classification tasks, achieving
competitive performance at a fraction of the computational cost. Artetxe+
(2019) also find adapters helpful in reusing monolingual BERT weights for
cross-lingual transfer.

An alternative to fine-tuning is extracting features from frozen
representations, but fine-tuning works better for BERT (Peters+ 2019b).

Initialization can have a dramatic effect on the training process (Petrov,
2010). However, variation across initializations is not often reported,
although the performance improvements claimed in many

NLP modeling papers may be within the range of that variation (Crane, 2018).
Dodge+ (2020) report significant variation for BERT fine-tuned on

GLUE tasks, where both weight initialization and training data order contribute
to the variation. They also propose an early-stopping technique to avoid full
fine-tuning for the less-promising seeds.

# 7 How big should BERT be?

## 7.1 Overparametrization

Transformer-based models keep increasing in size: e.g. T5 (Wu+ 2016a) is over
30 times larger than the base BERT. This raises concerns about computational
complexity of self-attention (Wu+ 2019a), environmental issues (Strubell et
al., 2019; Schwartz+ 2019), as well as reproducibility and access to research
resources in academia vs. industry.

Human language is incredibly complex, and would perhaps take many more
parameters to describe fully, but the current models do not make good use of
the parameters they already have. Voita+ (2019) showed that all but a few
Transformer heads could be pruned without significant losses in performance.
For BERT, Clark+ (2019) observe that most heads in the same layer show similar
self-attention patterns (perhaps related to the fact that the output of all
self-attention heads in

## 7.2 BERT compression

# 8 Multilingual BERT

# 9 Discussion

## 9.1 Limitations

* Tenney+ (2019a) aptly stated,
  * “the fact that a linguistic pattern is not observed by our probing
    classifier does not guarantee that it is not there, and
  * the observation of a pattern does not tell us how it is used”. There is
* tradeoff between the complexity of the probe and the tested hypothesis
  (Liu+ 2019a)
  * A more complex probe might be able to recover more information,
    but it [is] less clear whether we are still talking about the orig model
* different probing methods may reveal ...  contradictory information, in which
  (Warstadt+ 2019)
  * Certain methods might also favor a certain model,
    e.g., RoBERTa [and] BERT with [two] tree extraction methods (Htut+ 2019)
* Head and layer ablation studies (Michel+ 2019; Kovaleva+ 2019) inherently
  * but ... more diffuse representations spread across the full network: the
  * semantic parsing tasks (Tenney+ 2019a), the
  * [no] heads would perform parsing “in general” (Clark+ 2019; Htut+ 2019)
  * Michel+ (2019) prune heads in the order set by a proxy importance score,
  * Voita+ (2019) fine-tune the pretrained Transformer with
    a regularized objective that has the head-disabling effect
* attention visualizations, with ... tools (Vig, 2019; Hoover+ 2019). However,
  * debate on the merits of attention as a tool for interpreting deep learning
    (Jain and Wallace, 2019; Serrano and Smith, 2019;
    Wiegreffe and Pinter, 2019; Brunner+ 2020)
  * limited to qualitative analysis (Belinkov and Glass, 2019), and should not

## 9.2 Directions for further research

###Benchmarks that require verbal reasoning

* [BERT's] verbal reasoning abilities are not as impressive as it seems. In
  * rely on shallow heuristics in both
    natural language inference (McCoy+ 2019b; Zellers+ 2019) and
    reading comprehension (Si+ 2019; Rogers+ 2020; Sugawara+ 2020).  As with
    any optimization method, if there is a shortcut in the task, we have no
    reason to expect that BERT will not learn
  * needs to incentivize [=motvt] dataset development on par with modeling work
    which at present is often perceived as more prestigious

###Developing methods to “teach” reasoning

* [when] reasoning needs to be performed on top of the facts they possess
  (see subsection 4.3). For instance,
* Richardson+ (2019) propose a method to “teach” BERT
  quantification, conditionals, comparatives, and boolean coordination

###Learning what happens at inference time

* what knowledge actually gets used. At the moment, we know that the
  * knowledge represented in BERT does not necessarily get used in downstream
    (Kovaleva+ 2019)
  * for work in this direction
    * other head ablation studies (Voita+ 2019; Michel+ 2019) and studies of
    * reading comprehension (van Aken+ 2019; Arkhangelskaia and Dutta, 2019)

# 10 Conclusion

* The stream of papers seems to be accelerating rather than slowing down, and
