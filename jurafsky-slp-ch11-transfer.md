in Speech and Language Processing. Daniel Jurafsky & James H. Martin.  
Draft of December 29, 2021

# 11 Transfer Learning with Pretrained Language Models and Contextual Embeddings

* Fluent speakers bring an enormous amount of knowledge ofr comprehension & prod
  * vocabulary: rich representations associated with the words we know,
    * grammatical function, meaning, real-world reference, and pragmatic func.
    * a useful lens to explore the acquisition of knowledge from text, by both
      people and machines.
  * size of adult vocabularies vary widely both within and across languages. For
  * young adult speakers of American English range from 30,000 to 100,000
    depending on the
    resources used to make the estimate and the
    definition of what it means to know a word. What is
  * the vast majority of words are acquired early in life
    through spoken interactions in context with care givers and peers, usually
    well before the start of formal schooling
    * This active vocabulary is extremely limited compared to the size of adult
      * 2000 words for young speakers) and is quite stable, with very few
        additional words learned via casual conversation beyond this early
        stage.
    * a very large number of words to be acquired by some other means.
    * children have to learn about 7 to 10 words a day, every single day, to
      * empirical estimates of vocabulary growth in late elementary through high
        school are consistent with this rate. How do children achieve this rate?
    * The most likely remaining explanation is that the bulk of this knowledge
      acquisition happens as a by-product of reading
      * Research into the average amount of time children spend reading, and the
        lexical diversity of the texts they read, indicate that it is possible
        to achieve the desired rate.
      * at some points during learning the rate of vocabulary growth exceeds the
        rate at which new words are appearing to the learner!
  * Many of these facts have motivated approaches to word learning based on the
    distributional hypothesis,
    * something about what we’re loosely calling word meanings can be learned
      even without any grounding in the real world, solely based on the content
    * based on the complex association of words with the co-occuring words 
    * the knowledge that we acquire through this process can be used during
      language processing long after its initial acquisition in novel contexts.
* static word embeddings
  * We saw in Chapter 6 that embeddings (static word representations)
  * can be learned from text and
  * employed for eg measuring word similarity or studying meaning change
* In this chapter, we expand on static word embeddings in two large ways
  * contextual embeddings: representations for words in context. The methods eg
    those learned by popular methods like BERT (Devlin+ 2019) or GPT (Radford+
    2019) or their descendants, each word w will be represented by a different
    vector each time it appears
  * pretraining and fine-tuning.  
    * pretraining the process of learning some sort of representation of meaning
      for words or sentences by processing very large amounts of text
    * We’ll call these pretrained models pretrained language models, since they
      can take the form of the transformer language models we introduced in
      Chapter 9
  * fine-tuning the process of taking the representations from these pretrained
    models, and further training the model, often via an added neural net
    classifier, to perform some downstream task like NER or question answering
    or coreference. The intuition
  * the pretraining phase learns a language model that instantiates a rich
    representations of word meaning, that thus enables the model to more easily
    learn (‘be fine-tuned to’) the requirements of a downstream NLU task.
  * The pretrain-finetune paradigm is an instance of what is called transfer
    learning in machine learning: the method of acquiring knowledge from one
    task or domain, and then applying it (transferring it) to solve a new task
    * adding grounding from vision or from real-world interaction into
      pretrained models can help build even more powerful models, but even text
      alone is remarkably useful, and we will limit our attention here to purely
      textual models.
* two common paradigms for pretrained language models. One is the
  * causal or left-to-right transformer model we introduced in Chapter 9.
  * In this chapter we’ll introduce the bidirectional transformer encoder, and
    * masked language modeling, introduced with the BERT model (Devlin+ 2019)
      * allows the model to see entire texts at a time, including both the right
        and left context.
* at the end of the ch, we’ll show how the contextual embeddings from these
  pretrained language models can be used to transfer the knowledge embodied in
  these models to novel applications via fine-tuning
  * in later chapters we’ll see pretrained language models fine-tuned to tasks
    from parsing to question answering, from information extraction to semantic
    parsing.

## 11.1 Bidirectional Transformer Encoders

* underlies models like BERT and its descendants like RoBERTa (Liu+ 2019) or
  SpanBERT (Joshi+ 2020).
* In Chapter 9 we explored causal (left-to-right) transformers that can serve as
  the basis for powerful language models LMs that can easily be applied to
  autoregressive generation problems such as contextual generation,
  summarization and machine translation
  * hE, when applied to sequence classification and labeling problems 
    * obvious shortcomings since they are based on an incremental, left-to-right
    * eg NER we’ll want to be able to use information from the right context as
  * the hidden state computation at each point in time is based solely on the
    current and earlier elements of the input, ignoring
* Bidirectional encoders overcome this limitation by allowing the
  * self-attention mechanism to range over the entire input, see Fig 11.2
  * contextualized representations of the tokens in an input sequence that are
    generally useful across a range of downstream applications.
  * self-attention to map sequences of input embeddings (x 1 , ..., x n ) to
    sequences of output embeddings the same length (y 1 , ..., y n ), where the
    output vectors have been contextualized using information from the entire
    input sequence.
* the use of the same self-attention mechanism used in causal models. As with
  * first step is to generate a set of key, query and value embeddings for each
    element of the input vector x through the use of learned weight matrices W^Q
    , W^K , and W^V .
  * These weights project each input vector x_i into its specific role as a key,
    query, or value.  q i = W^Q x_i ; k i = W^K x_i ; v i = W^V x_i (11.1)
  * The output vector y_i corresponding to each input element x_i is a weighted
    sum of all the input value vectors v, as follows: y_i = \sum_{j=i}^n α i j v
    j (11.2)
  * The α weights are computed via a softmax over the comparison scores between
    every element of an input sequence considered as a query and every other
    element as a key, where the comparison scores are computed using dot
    products α i j = exp(score i j ) / sum_k exp(score ik ) score i j = q i · k
    j
  * Since each output vector, y_i , is computed independently, the processing of
    an entire sequence can be parallelized via matrix operas
    * pack the input embeddings x_i into a matrix X ∈ R N×d h 
    * ie, each row of X is the embedding of one token of the input
    * We then multiply X by the key, query, and value weight matrices (d × d) to
      produce matrices Q ∈ R N×d , K ∈ R N×d , and V ∈ R N×d , containing Q = X
      W^Q ; K = X W^K ; V = X W^V (11.5) => we can compute all the requisite
      query-key comparisons simultaneously by multiplying Q and K^T in a single
      operation.
    * Fig. 11.3 illustrates the result of this operation for input length 5
  * Finally, we can scale these scores, take the softmax, and then multiply the
    result by V resulting in a matrix of shape N × d where each row contains a
    contextualized output embedding corresponding to each token in the input.
    SelfAttention(Q, K, V) = softmax ( Q K^T / √ d_k ) V

  * Fig. 11.3, the full set of self-attention scores represented by QK^T
    constitute an all-pairs comparison between the keys and queries for each
    element of the input
    * In the case of causal language models in Chapter 9, we masked the upper
      triangular portion of this matrix (in Fig. ??) to eliminate information
      about future words since this would make the language modeling training
      task trivial.
    * With1 bidirectional encoders we simply skip the mask, allowing the model
      to contextualize each token using information from the entire input.
  * Beyond this simple change, all of the other elements of the transformer
    architecture remain the same for bidirectional encoder models. Inputs to
* subword tokenization and positional embeddings then passed through a series of
  standard transformer blocks consisting of self-attention and feedforward
  layers augmented with residual connections and layer normalization, as shown
  in Fig. 11.4.
* the original bidirectional transformer encoder model, BERT (Devlin+ 2019),
  consisted of the following:
  * A subword vocabulary consisting of 30,000 tokens generated using the
    Word-Piece algorithm (Schuster and Nakajima, 2012)
  * Hidden layers of size of 768,
  * 12 layers of transformer blocks, with 12 multihead attention layers each.
* The result is a model with over 100M parameters
  * WordPiece (one of the large family of subword tokenization algorithms that
    includes the BPE algorithm we saw in Chapter 2) means that BERT and its
  * based on subword tokens rather than words
    * Every input sentence first has to be tokenized, and then all further
      processing takes place on subword tokens rather than words. This will
    * for some NLP tasks that require notions of words (like named entity
      tagging, or parsing) we will occasionally need to map subwords back 2 word
* issue with transformers is that the size of the input layer dictates the
  complexity of model
  * Both the time and memory requirements in a transformer grow quadratically
    with the length of the input. It’s => necessary to set a fixed input length
    that is long enough to provide sufficient context for the model to function
    and yet still be computationally tractable
  * For BERT, a fixed input size of 512 subword tokens was used.

## 11.2 Training Bidirectional Encoders 6

* We trained causal transformer language models in Chapter 9 by making them
  iteratively predict the next word in a text
  * hE eliminating the causal mask makes the guess-the-next-word LM task trivial
    since the answer is now directly available from the context, so we’re in
* a fill-in-the-blank task, technically called the cloze task (Taylor, 1953).
  * motivating example from Chapter 3 Instead of predicting which words are
    likely to come next in this example:
  * predict a missing item given the rest of the sentence.
  * during training the model is deprived of one or more elements of an input
    sequence and must generate a probability distribution over the vocab for
    * cross-entropy loss from each of the model’s predictions to drive the
  * can be generalized to any of a variety of methods that corrupt the training
    input and then asks the model to recover the original input.
    * eg masks, substitutions, reorderings, deletions, and extraneous inserts

### 11.2.1 Masking Words

* original approach to training bidirectional encoders is called Masked Language
  Modeling (MLM) (Devlin+ 2019)
  * uses unannotated text from a large corpus. Here, the
  * a random sample of tokens from each training sequence is selected for use in
    the learning task
    * chosen tokens are used in one of three ways:
      * It is replaced with the unique vocabulary token [MASK].
      * It is replaced with another token from the vocabulary, randomly sampled
        based on token unigram probabilities.
      * It is left unchanged
* In BERT, 15% of the input tokens are sampled for learning.
  * Of these, 80%/10%/10%
  * The MLM training objective is to predict the original inputs for each of the
    masked tokens using a bidirectional encoder of the kind described in 11.1
  * cross-entropy loss from these predictions drives the training process for
    all the parameters in the model
    * Note that all of the input tokens play a role in the self-attention
* More specifically, the [whole] original input sequence is first tokenized
  using a subword model.
  * The sampled items which drive the learning process are chosen from among the
    set of tokenized inputs
  * Word embeddings for all of the tokens in the input are retrieved from the
    word embedding matrix and then combined with positional embeddings to form
    the input to the transformer.  
* To produce a probability distribution over the vocabulary for the masked toks,
  the output vector from the final transformer layer for each masked token is
  multiplied by a learned set of classification weights W V ∈ R |V |×d h and
  then through a softmax to yield the required predictions over the vocabulary.
  y i = softmax(W V h i )
* With a predicted probability distribution for each masked item, we can use
  cross-entropy to compute the loss for each masked item the negative log
  probability assigned to the actual masked word, as shown in
* The gradients that form the basis for the weight updates are based on the
  average loss over the sampled learning items from a single training sequence
  (or batch of sequences)

### 11.2.2 Masking Spans

* For many NLP applications, the natural unit of interest may be larger than a
  single word (or token).
  * eg Question answering, syntactic parsing, coreference and semantic role labl
  * identification and classification of constituents, or phrases. This suggests
  * a span-oriented masked learning objective might improve performance on such
* A span is a contiguous sequence of one or more words selected from a training,
  prior to subword tokenization
  * a set of randomly selected spans from a training sequence are chosen
  * SpanBERT originated this technique (Joshi+ 2020),
    * a span length is first chosen by sampling from a geometric distribution
      that is biased towards shorter spans an with upper bound of 10. Given this
    * a starting location ~ is sampled uniformly.
      * consistent with the desired span length and the length of the input
    * all the words within the span are substituted according to the same regime
      used in BERT: 80% [MASK], 10% rand, 10% orig
      * all the tokens in a given span are substituted using the same method
    * As with BERT, the total token substitution is limited to 15% of the
      training sequence input 
    * the input is passed through the standard transformer architecture to
      generate contextualized representations of the input tokens.
* Downstream span-based applications rely on
  * span representations derived from the tokens within the span, as well as the
  * start and end points, or the boundaries, of a span
  * Representations for these boundaries are typically derived from the first
    and last words of a span, the words immediately preceding and following the
    span, or some combination of them
  * The SpanBERT learning objective augments the MLM objective with a boundary
    oriented component called the Span Boundary Objective (SBO)
    * SBO: predict the words within a masked span from the words immediately
      preceding and following it. This prediction is made using the output
      vectors associated with the words that immediately precede and follow the
      span being masked, along with positional embedding that signals which word
      in the span is being predicted:

      L(x) = L MLM (x) + L SBO (x) (11.7) L SBO (x) = −log P(x|x s , x e , p x )
      (11.8)
    * where s denotes the position of the word before the span and e denotes the
      word after the end
    * The prediction for a given position i within the span is produced by
      concatenating the output embeddings for words s and e span boundary vecs
      with a positional embedding for position i and passing the result through
      a 2-layer feedforward network.  s = FFNN([y s−1 ; y e+1 ; p i−s+1 ]) z =
      softmax(Es)

### 11.2.3 Next Sentence Prediction

* masked-based learn (pred words from surrounding contexts) is for word repr
* hE some applications involve the relationship between pairs of sentences.
  * paraphrase detection (detecting if two sentences have similar meanings),
    entailment (detecting if the meanings of two sentences entail or contradi)
    discourse coherence (if two neighboring sentences form a coherent discourse)
* BERT introduced a second learning objective called Next Sentence Prediction
  * input: pairs of sentences and is asked to predict whether each pair consists
    of an actual pair of adjacent sentences
  * 50% of the training pairs consisted of positive pairs, and in the other 50%
    the second sentence of a pair was randomly selected from
  * two new tokens to the input representation (tokens that
    * will prove useful for fine-tuning as well)
    * after tokenizing the input with the subword model, the token
    * [CLS] is prepended to the input sentence pair, and the token [SEP] is
      placed between the sentences and after the final token of the second
      sentence
    * Finally, embeddings representing the first and second segments of the
      input are added to the word and positional embeddings to allow the model
      to more easily distinguish the input sentences.
* During training, the output vector from the final layer associated with the
  [CLS] token represents the next sentence prediction
  * a learned set of classification weights W NSP ∈ R 2×d h is used to produce a
    two-class prediction from the raw [CLS] vector.  y i = softmax(W NSP h i )
  * Cross entropy is used to compute the NSP loss for each sentence pair

### 11.2.4 Training Regimes

* The corpus used in training BERT and other early transformer-based LMs
  * 800 million word corpus of book texts called BooksCorpus (Zhu+ 2015) and a
  * 2.5 Billion word corpus derived from the English Wikipedia, for a
  * The BooksCorpus is no longer used (for intellectual property reasons), and
* SOTA models employ corpora that are orders of magnitude larger than these
* To train the original BERT models, pairs of sentences were selected according
  to the NSP 50/50 scheme
  * so that their combined length was less than the 512 token input
  * Tokens within these sentence pairs were then masked using the MLM approach
  * combined loss from the MLM and NSP objectives used for a final loss
  * Approximately 40 passes (epochs) data was required for convergence
* result of this pretraining process consists of both learned word embeddings,
  as well as all the parameters of the bidirectional encoder that are used to
  produce contextual embeddings for novel inputs.

### 11.2.5 Contextual Embeddings

* Given a pretrained language model and a novel input sentence, we can think of
  the output of the model as constituting contextual embeddings for each token
  * can be used as a contextual repr for any task requiring the meaning of word
* Contextual embeddings are thus vectors representing some aspect of the meaning
  * we can use the output vector y i from the final layer of the model as a
    representation of the meaning of token x i in the context of sent OR
  * it’s common to average the output tokens y i from last four layers of the
* Where static embeddings represent the meaning of word types (vocabulary entry)
  * contextual embeddings represent the meaning of word tokens: instance in cont
  * tasks like measuring the semantic similarity of two words in context, and
  * useful in linguistic tasks that require models of word meaning.
  * In the next sec: their most common use: as embeddings of word or even entire
    sentences that are the inputs to classifiers in the fine-tuning process for
    downstream NLP applications.

## 11.3 Transfer Learning through Fine-Tuning 11

* pretrained language models can extract generalizations from large text
* useful for myriad downstream applications. To make practical use of these
* we create interfaces from these models to downstream through fine-tuning
* Fine-tuning: creation of applications on top of pretrained models through the
  addition of a small set of application-specific parameters.
  * using labeled data from the application to train these additional
    application-specific parameters
  * Typically either freeze or make only minimal adjustments to the pretrained
    language model parameters.

### 11.3.1 Sequence Classification

* Seq classif applics often represent an input sequence with a single repr. With
  * With RNNs, we used the hidden layer associated with the final input element
  * with transformers, An additional vector is added to the model to stand for
    the entire sequence.
    * sometimes called the sentence embedding since it refers to the entire hE
      the same term is also used in other ways
  * In BERT, the [CLS] token plays the role of this embedding. This
    * added to the vocabulary and is prepended to the start of all input
      sequences,
    * The output vector in the final layer of the model for the [CLS] input
      represents the entire input sequence and serves as the input to a
      classifier head, a logistic regression or neural network classifier that
      makes the decision
* eg sentiment classification
  * A simple approach to fine-tuning a classifier for this application learns a
    set of weights, W C , to map the output vector for the [CLS] token, y CLS to
    a set of scores over the possible sentiment classes.
  * eg three-way sentiment classification task (positive, negative, neutral) and
    dimensionality d h for the size of the language model hidden layers gives W
    C ∈ R 3×d h 
  * Classification of unseen documents proceeds by passing the input text
    through the pretrained language model to generate y CLS , multiplying it by
    W C , and finally passing the resulting vector through a softmax.  y =
    softmax(W C y CLS ) (11.11)
* Finetuning the values in W C requires supervised training data consisting of
  input sequences labeled with the appropriate class
  * cross-entropy loss between the softmax output and the correct answer is used
* A key difference from what we’ve seen earlier with neural classifiers is that
  this loss can be used to
  * learn the weights of the classifier, but also to
  * update the weights for the pretrained language model itself.
    * In practice, reasonable classification performance is typically achieved
      with only minimal changes to the language model parameters,
    * often limited to updates over the final few layers of the transformer.

### 11.3.2 Pair-Wise Sequence Classification

* eg logical entailment, paraphrase detection and discourse analysis 
* Fine-tuning an application for one of these tasks proceeds just as with
  pretraining using the NSP objective
  * fine-tuning, pairs of labeled sentences from the supervised training data
    are presented to the model
  * As with sequence classification, the output vector associated with the
    prepended [CLS] token represents the model’s view of the input pair
  * And as with NSP training, the two inputs are separated by the a [SEP] token.
  * classification, the [CLS] vector is multiplied by a set of classific weights
    and passed through a softmax to generate label predictions, which
* eg entailment classification task with the Multi-Genre NLI (MultiNLI) dataset
  (Williams+ 2018). In the task of
  * natural language inference or NLI, also called recognizing textual entailmen
  * classify the relationship between the meanings of a pair of sentences . For
  * 3 labels: entails, contradicts and neutral. These labels describe a
    * The meaning of these labels is looser than strict logical entailment or
      contradiction indicating that a typical human reading the sentences would
      most likely interpret the meanings in this way.
  * the first sentence (the premise) and the second sentence (the hypothesis).
* To fine-tune a classifier for the MultiNLI task, we pass the
  premise/hypothesis pairs through a bidirectional encoder as described
  * use the output vector for the [CLS] token as the input to the
    __classification head__. As with ordinary sequence
  * this head provides the input to a three-way classifier that can be trained

### 11.3.3 Sequence Labelling

* eg part-of-speech tagging or BIO-based named entity recognition, follow
  * the same basic classification approach. Here,
  * the final output vector corresponding to each input token is passed to a
    classifier that produces a softmax distribution over the set of tags. Again,
  * simple classifier consisting of a single feedforward layer + softmax, the
    set of weights to be learned for this additional layer is W K ∈ R k×d h
    * k is the number of possible tags for the task y i = softmax(W K z i )
      (11.12) t i = argmax k (y i ) (11.13)
  * tag seq
    * As with RNNs, a greedy approach, where ie the argmax tag for each token is
      taken as a likely answer, can be used
    * Alternatively, the distribution over labels provided by the softmax can be
      passed to a conditional random field (CRF) layer 
      * CRF layer can take global tag-level transitions into account.
* complication with this approach arises from the use of subword tokenization
  * Supervised training data for tasks like named entity recognition (NER) is
    typically in the form of BIO tags associated at the word level. For example
  * doesn’t align directly with BIO tags in the ground truth annotation: ’Mt’,
  * we need a way to assign BIO tags to subword tokens during training and a
    corresponding way to recover word-level tags from subwords during decoding.
    * For training, we can just assign the gold-standard tag associated with
      each word to all of the subword tokens derived from it.  
    * For decoding, the simplest approach is to use the argmax BIO tag
      associated with the first subword token of a word
      * More complex approaches combine the distribution of tag probabilities
        across the subwords in an attempt to find an optimal word-level tag.

### 11.3.4 Fine-tuning for Span-Based Applications

* middle ground between sequence level and token level tasks. That is, in
  * representations of contiguous sequences of tokens
  * identifying spans of interest, classifying spans according to some labeling
    scheme, and determining relations among discovered spans
  * Applications include named entity recognition, question answering, syntactic
    parsing, semantic role labeling and coreference resolution.
* start i and end j such that 1 <= i <= j <= T . This formulation results in a
  * often impose an application-specific length limit L, so the legal spans are
  * refer to the enumerated set of legal spans in x as S(x).
* fine-tuning a pretrained language model for a span-based aplplication using
  the contextualized input embeddings from the model to generate representations
  for all the spans in the input
  * Most schemes for representing spans make use of two primary components:
    * representations of the span boundaries and
    * summary representations of the contents of each span
    * unified span representation, we concatenate the boundary repr with the sum
* simplest possible approach, we can use the contextual embeddings of the start
  and end tokens of a span as the boundaries, and the average of the output
  embeddings within the span as the summary repr
* more elaborate
  * boundaries: distinguish the embedding of a word as the beginning vs end
    * two distinct feedforward networks: s i = FFNN_start (h i ) (11.17) e j =
      FFNN_end (h j )   (11.18)
  * summary: average of the vectors treats all of ws as equally important
    * For many applications, a more useful repr would be centered around the
      head of the phrase
      * without syntactic parse is to use a standard self-attention layer to g i
        j = SelfATTN(h i: j ) (11.20)
* eg named entity recognition (NER).
  * Given a scheme for representing spans and
    * set of named entity types, a span-based approach to NER is a
      straightforward classification problem
  * assign a label y, from the set of valid NER labels, to span in S(x).  
    * we’ll add the label NULL to the set of types in Y .
  * fine-tuning entails using supervised training data to learn the parameters
    of the final classifier, as well as the weights used to generate the
    boundary representations, and the weights in the self-attention layer that
    generates the span content repr.
  * During training, the model’s predictions for all spans are compared to their
    gold-standard labels and cross-entropy loss is used to drive the training.
  * During decoding, each span is scored using a softmax over the final
    classifier output to generate a distribution over the possible labels, with
    the argmax score for each span taken as the correct answer. Fig. 11.10
    illustrates this approach with an example
  * A variation on this scheme designed to improve precision adds a calibrated
    threshold to the labeling of a span as anything other than NULL .
* two significant advantages to a span-based approach to NER over a BIO-based
  per-word labeling approach. The first advantage is that
  * BIO-based approaches are prone to a labeling mis-match problem. That is,
    * every label in a longer named entity must be correct 
    * I-ORG instead of B-ORG is an error
    * Span-based approaches only have to make one classification for each span.
  * naturally accommodate embedded named entities. For example, in this
    * eg both United Airlines and United Airlines Holding are legitimate NEs.
    * the span-based approach can naturally label both

## 11.4 Transfer Learning via Prompting

### 11.4.1 Text-to-Text Models

### 11.4.2 Prompting

### 11.4.3 Contextual (Few-Shot) Learning

## 11.5 Training Corpora

## 11.6 Potential Harms from Language Models

* Large pretrained neural language models exhibit many of the potential harms
  discussed in Chapter 4 and Chapter 6. Many of these harms
  * become realized when they are fine-tuned to downstream tasks, particularly
    those involving text generation, such as in assistive technologies like
    web search query completion, or predictive typing for email (Olteanu+ 2020)
  * eg generate toxic language
    * Gehman+ (2020); completely non-toxic prompts can lead large LMs to output
      hate speech and abuse
    * Brown+ (2020) and Sheng+ (2019); large language models generate sents with
      negative attitudes toward minority identities such as being Black or gay.
* biased in a number of ways by the distributions of their training data.
  * Gehman+ (2020) shows that large language model
    training datasets include toxic text scraped from banned sites. In addition
  * internet data is disproportionately generated by authors from developed
    countries, and many large language models train on data from Reddit, whose
    * male and young. Such biased population samples likely skew the resulting
* can amplify demographic and other biases in training data, just as static emb
* can be used for generating text for misinformation, phishing, radicalization,
  and other socially harmful activities (Brown+ 2020).
* McGuffie and Newhouse (2020) show how large language models
  generate text that emulates online extremists, with the risk of amplifying
  extremist movements and their attempt to radicalize and recruit.
* privacy issues. Language models, like other machine learning models,
  * can leak information about their training data
  * possible for an adversary to extract individual training-data phrases from a
    eg an individual person’s name, phone number, and address
    (Henderson+ 2017, Carlini+ 2020)
  * problem if they are trained on private datasets eg electronic health records
* Mitigating all these harms is an important but unsolved research question in
  * Extra pretraining (Gururangan+ 2020) on non-toxic subcorpora seems to
    reduce a language model’s tendency to generate toxic language somewhat
    (Gehman+ 2020)
  * analyzing the data used to pretrain large language models is important to
    understand toxicity and bias in generation, as well as privacy, making it
  * important that language models include datasheets or model cards giving
    full replicable information on the corpora used to train them.

## 11.7 Summary
