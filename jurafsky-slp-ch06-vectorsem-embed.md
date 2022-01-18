from Speech and Language Processing. Daniel Jurafsky & James H. Martin.  2021.

# 6 CHAPTER Vector Semantics and Embeddings

* Words that occur in similar contexts tend to have similar meanings. This link
  * the distributional hypothesis. The hypothesis was
  * first formulated by linguists like Joos (1950), Harris (1954), Firth (1957),
* vector semantics, which instantiates this linguistic hypothesis by
  learning representations of the meaning of words, called embeddings, directly
  from their distributions in texts. These representations are
  * used in every natural language processing application that uses meaning, and
  * static embeddings we introduce here underlie the more powerful
  * dynamic or contextualized embeddings like BERT that we will see in Chap 11
* the first example in this book of representation learning, automatically
  * self-supervised ways to learn representations of the input,
    instead of creating representations by hand via feature engineering, is
    an important focus of NLP research (Bengio+ 2013).

## 6.1 Lexical Semantics

* How should we represent the meaning of a word?
  * n-gram models: a string of letters, or an index in a vocabulary list
  * not that different from a tradition in philosophy
    * just spelling the word with small capital letters;
      representing the meaning of “dog” as DOG, or by using an apostrophe (DOG’)
* lexical semantics 
  * we’ll want a model of word meaning to do all sorts of things for us. It
  * some words have similar meanings (cat is similar to dog), others are
    antonyms (cold is the opposite of hot), some have
    positive connotations (happy) while others have negative connotations (sad).
  * buy, sell, and pay offer differing perspectives on the same underlying
    purchasing event (If I buy something from you, you’ve probably sold it to)
  * draw inferences to address meaning-related tasks like question-answering or
    dialogue.
* In this section we summarize some of these desiderata
  * drawing on results in lexical semantics, the linguistic study of word meanin
  * we’ll return to and expand on this list in Chapter 18 and Chapter 10.  

#### Lemmas and Senses

* how mouse might be defined in a dictionary (simplified from the online
  dictionary ``` mouse (N)
1. any of numerous small rodents...
2. a hand-operated device that controls a cursor...  ```

* lemma, also called the citation form. The form mouse would also be the lemma
  * inflected forms like mice. Similarly sing is the lemma for sing, sang, sung.
  * In many languages the infinitive form is used as the lemma for the verb, so
    * Spanish dormir “to sleep” is the lemma for duermes “you sleep”. The
  * wordforms.
* each lemma can have multiple meanings; a word sense
  * Chapter 18 will discuss the problem of polysemy, and introduce WSD, the task

#### Synonymy

* eg couch/sofa vomit/throw up filbert/hazelnut car/automobile propositional
  meaning principle of contrast similarity

* A more formal definition of synonymy (between words rather than senses) is
  * if they are substitutable for one another in any sentence without changing
    the truth conditions of the sentence, the situations in which the sentence
* the two words have the same propositional meaning.
* no two words are absolutely identical in meaning. One of the fundamental
  * principle of contrast (Girard 1718, Bréal 1897, Clark 1987), states that a
    difference in linguistic form is always associated with some difference in
    meaning
  * For example, the word H 2 O is used in scientific contexts and would be
  * In practice, the word synonym is therefore used to describe a relationship
    of approximate or rough synonymy.

#### Word Similarity

* words don’t have many synonyms, most words do have lots of similar words
* Cat is not a synonym of dog, but cats and dogs are certainly similar words. In
* shift from talking about relations between word senses (like synonymy) to
  relations between words (like similarity). Dealing with words
  * avoids having to commit to a particular representation of word senses, which
* in larger semantic tasks. Knowing
  * how similar the meaning of two phrases or sentences are, a very important
  * question answering, paraphrasing, and summarization
  * getting values for word similarity is to ask humans to judge how similar one
  * datasets have resulted from such experiments. For example the
    * SimLex-999 dataset (Hill+ 2015) gives values on a scale from 0 to 10, like

#### Word Relatedness

* related in ways other than similarity. One such class of connections is called
* word relatedness (Budanitsky and Hirst, 2006), also traditionally called word
  association in psychology.  
* eg coffee and cup
  * not similar to cup; they share practically no features (coffee is a plant)
  * associated by co-participating in an everyday event (the event of drinking)
* Similarly scalpel and surgeon [szike és sebész] are not similar but are
* semantic fields
  * One common kind of relatedness between words is if they belong to the same ~
  * A semantic field is a set of words which cover a particular semantic domain
  * structured relations with each other. For example, words might be related by
  * eg the semantic field of hospitals (surgeon, scalpel, nurse, anesthetic)
  * related to topic models, like Latent Dirichlet Allocation, LDA, which apply
    unsupervised learning on large sets of texts to induce sets of associated
    words from text
    * for discovering topical structure in documents.
* In Chapter 18 we’ll introduce more relations between senses like hypernymy or
  IS-A, antonymy (opposites) and meronymy (part-whole relations).

#### Semantic Frames and Roles. Closely related to semantic fields

* A semantic frame is a set of words that denote perspectives or participants in
  a particular type of event
* eg A commercial transaction is a kind of event in which one entity trades
  money to another entity in return for some good or service, after which the
  good changes hands or perhaps the service is performed. This
  * encoded lexically by using verbs like buy (the event from the perspective of
    the buyer) sell (from the perspective of the seller) pay (focusing on the
    monetary aspect) or nouns like buyer
* Frames have semantic roles (like buyer, seller, goods, money), and words in a
* makes it possible for a system to know paraphrases eg _Sam bought the book
  from Ling_ could be paraph _Ling sold the book to Sam_
  * Sam has the role of the buyer in the frame and Ling the seller. Being able
  * important for question answering, and can help in machine translation

#### Connotation. Finally, words have affective meanings

* _connotation_ has different meanings in different fields, but here we use it
  to mean the aspects of a word’s meaning that are related to a writer or
  reader’s emotions, sentiment, opinions, or evaluations.
* positive connotations (happy) while others have negative connotations (sad).
* Even words whose meanings are similar in other ways can vary in connotation;
  * eg fake, knockoff, forgery, on the one hand, and copy, replica, reproduction
    on the other, or innocent (positive connotation) vs naive (negative
    connotation)
* sentiment, as we saw in Chapter 4, and
* word sentiment plays a role in important tasks like sentiment analysis, stance
  detection, and applications of NLP to politics and consumer reviews
* words vary along three important dimensions of affective meaning (Osgood+
  1957)
  * valence: the pleasantness of the stimulus
  * arousal: the intensity of emotion provoked by the stimulus
  * dominance: the degree of control exerted by the stimulus
* Each word is thus represented by three numbers, corresponding to its value on
* Osgood+ (1957) noticed that in using these 3 numbers to represent the meaning
  the model was representing each word as a point in a three-dimensional space,

## 6.2 Vector Semantics 5

* history in the 1950s when two big ideas converged:
  * Osgood’s 1957 idea to use a point in three-dimensional space to repr
    connotat
  * linguists like Joos (1950), Harris (1954), and Firth (1957) to define the
    meaning of a word by its distribution in language use, meaning its
    neighboring words or grammatical environments.
    * two words that occur in very similar distributions (whose neighboring
      words are similar) have similar meanings.
* vector semantics is to represent a word as a point in a multidimensional
  semantic space that is derived (in ways we’ll see) from the distributions of
  word neighbors
  * Vectors for representing words are called embeddings (although the term is
    * more strictly applied only to dense vectors like word2vec (Section 6.8),
      rather than sparse tf-idf or PPMI vectors (Section 6.3-Section 6.6)).
    * etim: from its mathematical sense as a mapping from one space or structure
      to another, although the meaning has shifted; see the end of the chapter.
* The fine-grained model of word similarity of vector sem is powerful in
  * the sentiment classifiers of Chapter 4 or Chapter 5 depend on the same words
    appearing in the training and test sets.
  * But by representing words as embeddings, classifiers can assign sentiment as
    long as it sees some words with similar meanings
  * can be learned automatically from text without supervision.
* In this chapter we’ll introduce the two most commonly used models. In the
  * tf-idf model, an important baseline, the meaning of a word is defined by a
    simple function of the counts of nearby words. We will see that this
    * very long vectors that are sparse, i.e. mostly zeros 
  * word2vec model family for constructing short, dense vectors that have useful
    semantic properties.  We’ll also
  * cosine, the standard way to use embeddings to compute semantic similarity,
    between two words, two sentences, or two documents, an important tool in
    * applications like question answering, summarization, or aut essay grading

## 6.3 Words and Vectors

* Vector or distributional models of meaning are generally based on a
  co-occurrence matrix, a way of representing how often words co-occur. We’ll
  * two popular matrices: the term-document matrix and the term-term matrix.

### 6.3.1 Vectors and documents

* term-document matrix
* row represents a word in the vocabulary and each column represents a document
  from some collection of documents. Fig. 6.2 shows Each cell in this matrix
  represents the number of times word occurs in doc particular document (defined
  by the column)
* first defined as part of the vector space model of information retrieval
  (Salton, 1971). In this model, a document is represented as a count vector, a
* linear algebra, a vector is, at heart, just a list or array of numbers. So As
  * dimension. In the example in Fig. 6.3, the document vectors are of dimension
    * in real term-document matrices, the vectors representing each document
      would have dimensionality |V |, the vocabulary size.
  * meaningful dimensions on which documents vary. Thus the first dimension for
  * we can compare each dimension, noting for example that the vectors for As
  * vector for a document as a point in |V |-dimensional space; thus the
    * vocabulary sizes are generally in the tens of thousands, and the number of
    * # documents can be enormous (think about all the pages on the web).  
  * hard to visualize, Fig. 6.4 shows a visualization in two dimensions; we’ve
  * D columns (one for each document in the collec
* originally for finding similar documents for the task of document info retriev
  * Two documents that are similar will tend to have similar words, and if two
    <=> column vectors will tend to be similar.  The vectors for the comedies As
  * Information retrieval (IR) is the task of finding the document d that best
    matches a query q. For IR we’ll therefore
    * also represent a query by a vector, also of length |V |, and we’ll need a
    * compare two vectors to find how similar they are. (Doing IR will also
      * the tf-idf term weighting, and the cosine similarity metric
    * efficient ways to store and manipulate these vectors by exploitin sparsity

### 6.3.2 Words as vectors: document dimensions

* associating each word with a word vector— a row vector rather than a column
* similar words have similar vectors because they tend to occur in similar docs.

### 6.3. Words as vectors: word dimensions

* term-term matrix, also called the word-word matrix or the term-context matrix
  in which the columns are labeled by words rather than documents. This matrix
  * dimensionality |V |×|V | and
  * each cell records the number of times the row (target) word and the column
    (context) word co-occur in some context in some training corpus
  * The context could be the
    * document, in which case the cell represents the number of times the two
    * most common, however, to use smaller contexts, generally a window around
      eg 4 words to the left and 4 words to the right, in which case the cell
* cherry and strawberry are more similar to each other than they are to digital
* |V|, the dimensionality of the vector, is generally the size of the vo-
  cabulary, often between 10,000 and 50,000 words (using the most frequent words
  in the training corpus; keeping words after about the most frequent 50,000 or
  so is generally not helpful). Since
* sparse vector representations
  * there are efficient algorithms for storing and computing with sparse
    matrices.

## 6.4 Cosine for measuring similarity

* a metric that takes two vectors of the same dimensionality, either both with
  words as dimensions, hence of length |V |, or both with documents as
  dimensions as documents, of length |D|) and gives a measure of their
  similarity
* By far the most common similarity metric is the cosine of the angle 
  * based on the dot product operator from linear algebra, aka the inner
    product: 
  * like most measures for vector similarity used in NLP
  * dot product `(v, w) = v · w = \sum_{i=1}^N v i w i`
  * similarity metric because it will tend to be high just when the two vectors
    have large values in the same dimensions.  Alternatively, vectors that have
    zeros in different dimensions—orthogonal vectors—will have a dot product of
    0, representing their strong dissim
  * raw dot product favors long vectors. The
  * vector length is defined as |v| = \sqrt \sum v_i^2
  * More frequent words have longer vectors => The raw dot product higher
  * we’d like a similarity metric regardless of freq
  * normalize for the vector length by dividing the dot product by the lengths
  * the same as the cosine of the angle between the two vectors, following from
    a · b = |a||b| cos θ a · b / |a||b| = cos θ
* For some applications we pre-normalize each vector, by dividing it by its
  * For unit vectors, the dot product is the same as the cosine.
* The cosine value ranges 
  * 1 for vectors pointing in the same direction, through 0 for orthogonal
    vectors, -1 for vectors pointing in opposite directions.
  * But since raw frequency values are non-negative, the cosine for these
    vectors ranges from 0–1.
* When two vectors are more similar, the cosine is larger but the angle is small

## TF-IDF: Weighing terms in the vector

* we’re not going to get good discrimination from words like the, it, or they,
  * occur frequently with all sorts of words and aren’t informative about any
* paradox
  * Words that occur nearby frequently (maybe pie nearby cherry) are more
    important than words that only appear once or twice. Yet
  * words that are too frequent—ubiquitous, like _the_ or good— are unimportant.
  *  balance these two conflicting constraints?
* two common solutions to this problem: in this/the next section we’ll describe
  * tf-idf weighting, usually used when the dimensions are documents. In the
  * PPMI algorithm (usually used when the dimensions are words).
* The tf-idf weighting (the ‘-’ here is a hyphen, not a minus sign) is the
  product of two terms, each term capturing one of these two intuitions:
* term frequency (Luhn, 1957): the frequency of the word t in the document d.
  * We can just use the
    * raw count as the term frequency: tf t, d = count(t, d)
    * log 10 of the frequency instead. The intuition is that a word appearing
      * Because we can’t take the log of 0, we normally add 1 to the count: 2 tf
* to give a higher weight to words that occur only in a few documents
  * these words are useful for discriminating those documents from the rest of
  * document frequency df t of a term t is the number of documents it occurs in.
  * inverse document frequency or idf term weight (Sparck Jones, 1972). The idf
  * the fraction N/df t , where N is the total number of documents in the
  * what counts as a document
    * It’s usually clear : in Shakespeare we would use a play; when processing a
    * encyclopedia articles like Wikipedia, the document is a Wikipedia page; in
    * newspaper articles, the document is a single article
    * Occasionally your corpus might not have appropriate document divisions and
      * break up the corpus into documents yourself for computing idf.
  * log(), Because of the large number of documents in many collections, this
    The resulting definition for inverse document frequency (idf) is thus
* `w_{t, d} = tf_{t, d} × idf_t`
* applications of The tf-idf weighting of co-occurrence matrices 
  * information retrieval, but also plays a role in many other aspects of NLP
  * It’s also a great baseline, the simple thing to try first
* We’ll look at other weightings like PPMI in Section 6.6.

## 6.6 Pointwise Mutual Information (PMI)

* alternative weighting function to tf-idf
* PPMI (positive pointwise mutual information), is
* used for term-term-matrices, when the vector dimensions correspond to words
* intuition: how much more the two words co-occur in our corpus than we would
  have a priori expected them to appear by chance.
* Pointwise mutual information (Fano, 1961) 4 is
  * confusion of terminology, Fano used the phrase
    * mutual information to refer to what we now call PMI
    * expectation of the mutual information for what we now call MI
  * one of the most important concepts in NLP. It is a measure of
  * how often two events x and y occur, compared with what we would expect if
    they were independent: I(x, y) = log 2 P(x, y) / P(x)P(y)
* The pointwise mutual information between a target word w and a context word c
  (Church and Hanks 1989, Church and Hanks 1990) is then defined as: PMI(w, c) =
  log 2 P(w, c) / P(w)P(c)
* we compute probability by using the MLE). The denominator tells us how often
* PMI values range from negative to positive infinity
  * hE negative PMI values tend to be unreliable 
  * To distinguish whether two words whose individual probability is each 10 −6
    occur together less often than chance, we would need to be certain that the
  *  not clear whether it’s even possible to evaluate such scores of
     ‘unrelatedness’ with human judgments
  * => Positive PMI (called PPMI) which replaces all negative PMI values with
    zero (Church and Hanks 1989, Dagan+ 1993, Niwa and Nitta 1994) 5 :
  * Positive PMI also cleanly solves the problem of what to do with log(0)
    PPMI(w, c) = max(log 2 P(w, c) / P(w)P(c) , 0)
* a co-occurrence matrix can be turned into a PPMI matrix
  * p_ij, p_i*, p_*j
* problem: PMI is biased toward infrequent events; very rare words tend to have
  * One way to reduce this bias toward low frequency events is to slightly P α
    (c) that raises the probability of the context word to the power of α: ```
    PPMI α (w, c) = max(log 2 P(w, c) / P(w)P α (c) , 0) P α (c) = count(c)^α /
    \sum_c count(c)^α ```
    * Levy+ (2015) found that a setting of α = 0.75 improved performance of on a
      wide range of tasks (drawing on a similar weighting used for skipgrams
      described below in Eq. 6.32). This works because raising the count to α =
      0.75
      * increases the probability assigned to rare contexts, and hence lowers
        their PMI (P α (c) > P(c) when c is rare, see 6.8.2)

  * Another possible solution is Laplace smoothing: Before computing PMI, a
    small constant k (values of 0.1-3 are common) is added to the counts,
    shrinking (discounting) all the non-zero values
    * The larger the k, the more the non-zero counts are discounted.

## 6.7 Applications of the tf-idf or PPMI vector models

* In summary, the vector semantics model (aka the tf-idf model or the PPMI mode)
  * repr target word as a vector with dimensions corresponding either to
    * the documents in a large collection (the term-document matrix) or to
    * the counts of words in some neighboring window (the term-term matrix)
  * The values in each dimension are counts, weighted by tf-idf (for
    term-document matrices) or PPMI (for term-term mxs)
  * the vectors are sparse (since most values are zero).  
  * computes the similarity between two words x and y by taking the cosine of
    * high cosine, high similarity. This entire
* often used for document functions like deciding if two documents are similar.
  We represent a document by taking the vectors of all the words in the
  document, and computing the centroid of all those vectors.
  * The centroid has the minimum sum of squared distances to each of the vectors
  * applications; information retrieval, plagiarism detection, news recommender
    systems, and even for digital humanities tasks like comparing different
    versions of a text to see
* word-level tasks
  * finding word paraphrases, tracking changes in word meaning, or automatically
    discovering meanings of words in different corpora.
  * eg find the 10 most similar words to any target word w by computing the cos

## 6.8 Word2vec

* embeddings, short dense vectors. Unlike the vectors we’ve seen so far,
  * number of dimensions d ranging from 50-1000, rather than the much larger
  * These d dimensions don’t have a clear interpretation. And the vectors are
  * dense: real-valued numbers that can be negative.
  * work better in every NLP task than sparse vectors.
  * we don’t completely understand all the reasons for this, we have some intu-
    * requires our classifiers to learn far fewer weights than if we represented
    * helps with generalization and avoiding overfitting. Dense vectors may also
* In this section we introduce skip-gram with negative sampling aka SGNS. The
  * skip-gram algorithm is
    * one of two algorithms in a software package called word2vec, and so
    * the algorithm is loosely referred to as word2vec (Mikolov+ 2013a,b)
* word2vec methods are fast, efficient to train, and easily available online
  with code and pretrained embeddings. Word2vec embeddings are
  * static embeddings: one fixed embedding for each word in the vocabulary.
  * In Chapter 11 we’ll introduce methods for learning dynamic contextual
    embeddings like the popular family of BERT representations, in which
    * the vector is different in different contexts.  
  * intuition of word2vec is that instead of counting how often each word w
    occurs near, say, apricot, we’ll train a classifier on a binary prediction
    task: “Is word w likely to show up near apricot?” We don’t actually care
    about
  * we’ll take the learned classifier weights as the word embeddings.
* self-supervision: we can use running text as implicitly supervised training
  data for such a classifier as gold ‘correct answer’ to the question “Is word c
  likely to show up near apricot?” This method, often called self-supervision,
  avoids the need for
  * first proposed in the task of neural language modeling, when Bengio+ (2003)
    and Collobert+ (2011) showed that a neural language model (a neural network
    that learned to predict the next word from prior words) could just use the
    next word in running text as its supervision signal, and could be used to
    learn an embedding representation for each word as part of doing this
    prediction task.
* We’ll see how to do neural networks in the next chapter, but
* word2vec is a much simpler model in two ways. word2vec simplifies the
  * task (making it binary classification instead of word prediction). Second,
  * architecture (training a logistic regression classifier instead of a
    multi-layer neural network with hidden layers that demand more sophisticated
    training algorithms)
* The intuition of skip-gram is:
  1. Treat the target word and a neighboring context word as positive examples.  
  1. Randomly sample other words in the lexicon to get negative samples.  
  1. Use logistic regression to train a classifier to distinguish those two
  1. Use the learned weights as the embeddings.

### 6.8.1 The classifier

* classifier such that, given a tuple (w, c) of a target word w paired with a
  candidate context word c return the probability that c is a real context word 
* P(−|w, c) = 1 − P(+|w, c)
* How does the classifier compute the probability P? The intuition of the skip-
  * base this probability on embedding similarity: a word is likely to occur
    near the target if its embedding vector is similar to the
  * if they have a high dot product (after all, cosine is just a normalized dot)
  * Similarity(w, c) ≈ c · w
  * not a probability, it’s just a number ranging from −∞ to ∞ 
  * To turn the dot product into a probability logistic or sigmoid function σ
    (x), the fundamental core of logistic regression: σ (x) = 1 / 1 + exp (−x)
  * P(+|w, c) = σ (c · w) =
  * we’ll also need the total probability of the two possible events to sum to 1
  * We thus estimate the probability that word c is not a real context word for
  * P(−|w, c) = 1 − P(+|w, c) = σ (−c · w) = 1 / 1 + exp (c · w)
  * simplifying assumption that all context words are independent ``` P(+|w, c
    1:L ) = \prod σ (c i · w) \log P(+|w, c 1:L ) = \log \sum σ (c i · w) ```
* Skip-gram actually stores two embeddings for each word, one for the word as a
  target (aka input embedding)/context (and noise aka output)
  * the target matrix and the context matrix could use different vocabularies,
    but we’ll simplify by assuming one shared vocabulary V .
  * ie the parameters we need to learn are two matrices W and C, each containing
    an embedding for every one of the |V | words in the

### 6.8.2 Learning skip-gram embeddings

* input a corpus of text, and a chosen vocabulary size N
* It begins by assigning a random embedding vector for each of the N words, and
* iteratively shift the embedding of each word w to be more like the embeddings
  of words that occur nearby in texts, and less like the embeddings of words
  that don’t occur nearby. Let’s start
* negative examples. In fact skipgram with negative sampling (SGNS) uses
  * k negative examples for 1 positive examples (ratio set by a parameter k)
  * each consisting of the target w plus a ‘noise word’ c_neg 
  * A noise word is a random word from the lexicon, constrained to != w
  * chosen according to their weighted unigram frequency p α (w)
  * But in practice it is common to set α = .75 P α (w) = count(w)^α / \sum_w'
    count(w')^α
  * weighting gives rare noise words slightly higher probability: for rare
    words, P α (w) > P(w)
  * eg with two events, P(a) = .99 and P(b) = .01: P α (a) = = .97, P α (b) =
    .03
* learning algorithm is to adjust those embeddings to
  * Maximize the similarity of the target word, context word pairs (w, c_pos )
    drawn from the positive examples
  * Minimize the similarity of the (w, c_neg ) pairs from the negative examples.
  * If we consider one word/context pair (w, c_pos ) with its k noise words
    c_{neg_i}
  * loss function L to be minimized (hence the −); here the first term expresses
* We minimize this loss function using stochastic gradient descent. Fig. 6.14
  shows the intuition of one step of learning.  
  * take the derivative of Eq. 6.34 with respect to the different embeddings
  * It turns out the derivatives are the following (we leave the proof as an
    exercise at the end of the chapter) ∂ L CE / ∂ c_pos = [σ(c_pos · w) − 1] w
    ∂ L CE / ∂ c_neg = [σ(c_neg · w)] w ∂ L CE / ∂ w = [σ (c_pos · w) − 1] c_pos
    + \sum [σ (c_{neg_i} · w)] c_{neg_i}
* The update equations going from time step t to t + 1 in stochastic gradient
* two embeddings for each word i: the target embedding w i and the context
  * It’s common to just add them together, representing word i with the vector w
  * Alternatively we can throw away the C matrix
* the context window size L affects the performance of skip-gram embeddings, and
  * experiments often tune the parameter L on a devset

### 6.8.3 Other kinds of static embeddings

* fasttext (Bojanowski+ 2017), addresses a problem with word2vec as we have
  * problems
    * deal with unknown words—words that appear in a test corpus 
    * A related problem is word sparsity, such as in languages with rich
      morphology, where some of the many forms for each noun and verb may
  * subword models, representing each word as itself plus a bag of constituent
    n-grams, with special boundary symbols < and > added to each word
  * embedding is learned for each constituent n-gram, and the word _where_ is
    represented by the sum of all of the embeddings of its constituent n-grams.
  * A fasttext open-source library, including pretrained embeddings for 157
    languages, is available at https://fasttext.cc.
* GloVe (Pennington+ 2014), short for Global Vectors, because the model is based
  * capturing global corpus statistics. GloVe is
  * based on ratios of probabilities from the word-word cooccurrence matrix,
    combining the intuitions of count-based models like PPMI while also
    capturing the linear structures used by methods like word2vec.
* elegant mathematical relationship with sparse embeddings like PPMI, in which
  * word2vec can be seen as implicitly optimizing a shifted version of a PPMI mx
    (Levy and Goldberg, 2014c)

## 6.9 Visualizing Embeddings

* list the most similar words to w by sorting the vectors by their cosine to w
* hierarchical clustering algorithm to show a representation of which words are
* project the 100 dimensions of a word down into 2 dimensions. Fig. 6.1 showed
  * projection method eg t-SNE (van der Maaten and Hinton, 2008)

## 6.10 Semantic properties of embeddings

### Different types of similarity or association: One parameter of vector

* size of the context window used to collect counts. This is
  * relevant to both sparse tf-idf vectors and dense word2vec vectors is the
  * generally between 1 and 10 words on each side of the target word 
  * The choice depends on the goals of the representation.
    * Shorter context windows tend to lead to more syntactic representations
      * the most similar words to a target word w tend to be semantically
        similar words with the same parts of speech. When vectors are computed
    * long context windows, the highest cos: topically related but not similar.
  * eg Levy and Goldberg (2014a) using skip-gram with a window of
    * ±2, the nearest neighbors of Hogwarts (from the Harry Potter series) were
      names of other fictional schools: Sunnydale or Evernight  With a window of
    * ±5, the most similar words to Hogwarts: Dumbledore, Malfoy, & half-blood
* two kinds of similarity or association (Schütze and Pedersen, 1993). Two words
  * first-order co-occurrence (sometimes called syntagmatic association) if they
    are typically nearby each other.
    * Thus wrote is a first-order associate of book or poem. Two words have
  * second-order co-occurrence (sometimes called paradigmatic association) if
    they have similar neighbors. Thus wrote is a second-order associate of said

### Analogy/Relational Similarity: Another semantic property of embeddings is

* embeddings can capture relational meanings
* the parallelogram model
  * In an important early vector space model of cognition,
  * Rumelhart and Abrahamson (1973) proposed the parallelogram model for solving
    simple analogy problems of the form a is to b as a* is to what?.
  * apple:tree::grape:?, i.e., apple is to tree as , and must fill in _vine_. In
  * the vector from the word apple to the word tree (= tree − apple) is added to
    the vector for grape ( grape); » the nearest word to that point is returned.
  * early sparse vector models of meaning could solve such analogy problems
    (Turney and Littman, 2005), but the parallelogram method received
  * more modern attention because of its success with word2vec or GloVe vectors
    (Mikolov+ 2013c, Levy and Goldberg 2014b, Pennington+ 2014). For
    eg king − man + woman is a vector close to queen.
      Paris − France + Italy results in a vector that is close to Rome
* The embedding model thus seems to be extracting representations of relations
  like MALE-FEMALE , or CAPITAL-CITY-OF , or even COMPARATIVE/SUPERLATIVE , as
* For a `a : b :: a ∗ : b ∗` problem, meaning the algorithm is
  * given vectors a, b, and a ∗ and must find b ∗ , the parallelogram method is
  * b̂ ∗ = argmin distance(x, b − a + a ∗ , 6.41) x with some distance function,
* caveats
  * the closest value returned by the parallelogram algorithm in word2vec or
    GloVe embedding spaces is usually not in fact b* but
    one of the 3 input words or their morphological variants
    (i.e., cherry:red :: potato:x returns potato or potatoes instead of brown),
    * these must be explicitly excluded
  * embedding spaces perform well if the task involves frequent words, small
    distances, and certain relations (like relating countries with their
    capitals or verbs/nouns with their inflected forms), the parallelogram
  * doesn’t work as well for other relations
    (Linzen 2016, Gladkova+ 2016, Schluter 2018, Ethayarajh+ 2019a), and indeed
  * Peterson+ (2020) argue that the parallelogram method is in general too
    simple to model the human cognitive process of forming such analogies

### 6.10.1 Embeddings and Historical Semantics


* for studying how meaning changes over time, by computing
  multiple embedding spaces, each from texts written in a particular time period
* eg Fig.  6.17 shows a visualization of changes in meaning in English words
  over the last two centuries, computed by building separate embedding spaces
  for each decade
  * from historical corpora like Google n-grams (Lin+ 2012) and
    the Corpus of Historical American English (Davies, 2012).
* A t-SNE visualization of the semantic change of 3 words in English using
  * The modern sense of each word, and the grey context words, are computed
    from most recent (modern) time-point embedding space. 
  * Earlier points are computed from earlier historical embedding spaces.
  * gay, broadcast, awesome

## 6.11 Bias and Embeddings

* embeddings, alas,
* embeddings can roughly model relational similarity: ‘queen’ as the closest
* gender stereotypes.  Bolukbasi+ (2016)
  * to ‘man’ ‘computer programmer + ‘woman’ = ‘homemaker’,
  * ‘father’ is to ‘doctor’ as ‘mother’ is to ‘nurse’. This could result in what
  * representational harm (Crawford (2017) and Blodgett+ (2020) call an allocational
    * a system allocates resources (jobs or credit) unfairly to different groups
    * For example algorithms that use embeddings for hiring potential
      programmers doctors might thus incorrectly downweight documents with
      women’s names.
* embeddings don’t just reflect the statistics of their input, but also
  amplify bias; gendered terms become more gendered in embedding space than they
  were in the input text statistics (Zhao+ 2017, Ethayarajh+ 2019b, Jia+ 2020),
  * biases are more exaggerated than in actual labor employment statistics
  (Garg+ 2018).
* Embeddings also encode the implicit associations that are
  * a property of human reasoning
  * The Implicit Association Test (Greenwald+ 1998) measures people’s
    associations between concepts (like ‘flowers’ or ‘insects’) and attributes
    (like ‘pleasantness’ and ‘unpleasantness’)
    by measuring differences in the latency with which they label words in the
    various categories. 
  * footnote. push a
    green button for ‘flowers’ (daisy, iris, lilac) and
    ‘pleasant words’ (love, laughter, pleasure) and a
    red button for ‘insects’ (flea, spider, mosquito) and
    ‘unpleasant words’ (abuse, hatred, ugly)
    they are faster than in an incongruous condition where they push a
    red button for ‘flowers’ and ‘unpleasant words’ and a
    green button for ‘insects’ and ‘pleasant words’.
  * Using such methods, people in the United States have been shown to associate
    * African-American names with unpleasant words (more than European-American
    * male names more with mathematics and female names with the arts, and
    * old people’s names with unpleasant words
      (Greenwald+ 1998, Nosek+ 2002a, Nosek+ 2002b)
  * Caliskan+ (2017) replicated all these findings of implicit associations
    using GloVe vectors and cosine similarity instead of human latencies. For
    * eg African-American names like ‘Leroy’ and ‘Shaniqua’ had a higher GloVe
      cosine with unpleasant words while
      European-American names (‘Brad’, ‘Greg’, ‘Courtney’) had a higher cosine
      with pleasant words
    * representational harm (Crawford 2017, Blodgett+ 2020), which is a harm
      * system demeaning or even ignoring some social groups. Any
* remove these kinds of biases, for example by developing a
  * transformation of the embedding space that removes gender stereotypes
    but preserves definitional gender (Bolukbasi+ 2016, Zhao+ 2017) or changing
  * other training procedure (Zhao+ 2018). However, although these sorts of
  * may reduce bias, they do not eliminate it (Gonen and Goldberg, 2019), and
* Historical embeddings are also being used to measure biases in the past.
  * Garg+ (2018) occupations and ethnicities or genders (for example the
    eg women’s names versus men’s to occupations like ‘librarian’ or ‘carpenter’
    across the 20th century.
    * the cosines correlate with the empirical historical percentages of women
      or ethnic groups in those occupations. Historical embeddings
  * also replicated old surveys of ethnic stereotypes
    * the tendency of experimental participants in 1933 to associate adjs like
      ‘industrious’ or ‘superstitious’ [babonás] with, e.g., Chinese ethnicity,
      correlates with the
      cosine between Chinese last names and those adjectives using embeddings
      trained on 1930s text
  * document historical gender biases, such as the fact that embeddings for
    adjectives related to competence (‘smart’, ‘wise’, ‘thoughtful’, 'rsrceful’)
    had a higher cosine with male than female words, and showed that
    this bias has been slowly decreasing since 1960. We return in later chapters

## 6.12 Evaluating vector models

* The most important evaluation metric for vector models is extrinsic evaluation
  * whether using vectors improves performance over some other model.
* useful to have intrinsic evaluations. 
  * most common metric is to test their performance on similarity, computing the
    correlation between an algorithm’s word similarity scores and
    word similarity ratings assigned by humans.  
  * WordSim-353 (Finkelstein+ 2002) is a commonly used set of
    ratings from 0 to 10 for 353 noun pairs; for example (plane, car) had an
  * SimLex-999 (Hill+ 2015) is a more difficult dataset that quantifies
    * similarity (cup, mug) rather than relatedness (cup, coffee), and including
    * both concrete and abstract adjective, noun and verb pairs. The
  * TOEFL dataset is a set of 80 questions,
    each consisting of a target word with 4 additional word choices; the task is
    * choose which is the correct synonym, as in the example:
    * eg Levied is closest in meaning to: _imposed, believed, requested,
      correlated_ (Landauer and Dumais, 1997)
  * All of these datasets present words without context.
* intrinsic similarity tasks that include context
  * The Stanford Contextual Word Similarity (SCWS) dataset (Huang+ 2012) and the
  * Word-in-Context (WiC) dataset (Pilehvar and Camacho-Collados, 2019) offer
  * SCWS gives human judgments on 2,003 pairs of words in their sentential
    context, while
  * WiC gives target words in two sentential contexts that are
    either in the same or different senses; see Section ??
  * The semantic textual similarity task (Agirre+ 2012, Agirre+ 2015)
    * evaluates sentence-level similarity algorithms, consisting of
    * a set of pairs of sentences, each pair with human-labeled similarity score
* analogy task, discussed on page 24, where the system has to solve problems of
  (Turney and Littman, 2005)
  * A number of sets of tuples have been created for this task,
    (Mikolov+ 2013a, Mikolov+ 2013c, Gladkova+ 2016),
    covering morphology (city:cities::child:children),
    lexicographic relations (leg:table::spout::teapot) and
    encyclopedia relations (Beijing:China::Dublin:Ireland),
  * some drawing from the SemEval-2012 Task 2 dataset of 79 different relations
    (Jurgens+ 2012).
* variability: All embedding algorithms suffer from inherent variability. For
  * randomness in the initialization and the random negative sampling,
  * individual documents in a collection may strongly impact the result
    (Tian+ 2016, Hellrich and Hahn 2016, Antoniak and Mimno 2018). 
  * best practice to train multiple embeddings with bootstrap sampling over
    documents and average the results (Antoniak and Mimno, 2018).
    * When embeddings are used to study word associations in particular corpora,

## 6.13 Summary

* In vector semantics, a word is modeled as a vector—a point in high-dim space,
  * static embeddings, in each each word is mapped to a fixed embedding.
* Vector semantic models fall into two classes: sparse and dense. 
  * sparse models each dimension corresponds to a word in the vocabulary V and
    cells are functions of co-occurrence counts. 
  * term-document matrix has a row for each word (term) in the vocabulary and a
    column for each document.  
  * word-context or term-term matrix has a row for each (target) word in the
    vocabulary and a column for each context term in the vocabulary
  * Two sparse weightings are common: 
    * tf-idf weighting which weights each cell by its term frequency and inverse
      document frequency, 
    * PPMI (pointwise positive mutual information), which is most common for for
      word-context matrices.  
* Dense vector models have dimensionality 50–1000
  * Word2vec algorithms like skip-gram are a popular way to compute dense
  * a logistic regression classifier to compute the probability that two words
    are ‘likely to occur nearby in text’
  * probability is computed from
    the dot product between the embeddings for the two words.  
* Skip-gram uses stochastic gradient descent to train the classifier, by
  learning embeddings that have a high dot product with embeddings of words that
  occur nearby and a low dot product with noise words.  
* Other important embedding algorithms include
  GloVe, a method based on ratios of word co-occurrence probabilities.  
* similarities are computed by some function of the dot product between vectors.
  The cosine of two vectors—a normalized dot product—is the most popular

## Bibliographical and Historical Notes

* The idea of vector semantics arose out of research in the 1950s in three field
  * linguistics, psychology, and computer science, each contributed a fundal asp
  * meaning is related to the distribution of words in context was widespread in
    linguistic theory of the 1950s, among
    * distributionalists like Zellig Harris, Martin Joos, and J. R. Firth, and
    * semioticians like Thomas Sebeok
    * As Joos (1950) put it, the linguist’s “meaning” of a morpheme... is by
      definition the set of conditional probabilities of its occurrence in cont"
  * the meaning of a word might be modeled as a point in a
    multidimensional semantic space came from psychologists like Osgood, who had
    * people assigning values along scales like happy/sad or hard/soft.
    * Osgood+ (1957) proposed that
      * meaning of a word could be modeled as a point in a multidim Euclidea spa
      * similarity of meaning between two words could be modeled as the distance
  * mechanical indexing
    * in the 1950s and early 1960s was the field then 
    * now known as information retrieval. In what became known as
    * the vector space model for info retrieval (Salton 1971, Sparck Jones 1986)
    * new ways to define the meaning of words in terms of vectors (Switzer 1965)
    * refined methods for word similarity based on measures of statistical
      association between words like
      mutual information (Giuliano, 1965) and idf (Sparck Jones, 1972), and
    * the meaning of documents could be represented in the same spaces as words.
  * philosophical underpinning of the distributional way of thinking came from
    * late writings of the philosopher Wittgenstein, who was
    * skeptical of the possibility of building a completely formal theory of
      meaning definitions for each word, suggesting instead that “the meaning of
      a word is its use in the language” (Wittgenstein, 1953, PI 43)
    * instead of
      using some logical language to define each word,or
      drawing on denotations or truth values, Wittgenstein’s idea is that
    * we should define a word by
      how it is used by people in speaking and understanding in their day-to-day
      * prefiguring the movement toward embodied and experiential ling/NLP model
        (Glenberg and Robertson 2000, Lake and Murphy 2021, Bisk+ 2020,
        Bender and Koller 2020)
  * More distantly related is the idea of
    defining words by a vector of discrete features, which has
    roots at least as far back as Descartes and Leibniz
    (Wierzbicka 1992, Wierzbicka 1996)
    * Hjelmslev, (1943/1969) and fleshed out in
    * early models of generative grammar (Katz and Fodor, 1963), the idea arose
    * representing meaning with semantic features,
      symbols that represent some sort of primitive meaning.  
    * eg hen, rooster, or chick
    ```
    hen +female, +chicken, +adult
    rooster -female, +chicken, +adult
    chick +chicken, -adult
    ```
    * some attempt to show that
      certain dimensions of embedding models contribute some specific
      compositional aspect of meaning like these early semantic features.
* dense vectors to model word meaning, and indeed the term embedding, grew out
  * latent semantic indexing (LSI) model (Deerwester+ 1988)
    recast as LSA (latent semantic analysis, Deerwester+ 1990)
  * In LSA singular value decomposition—SVD— is applied to a term-document mx
    * weighted by log frequency and normalized by entropy), and then
    * the first 300 dimensions are used as the LSA embedding
    * Singular Value Decomposition (SVD) is a method for finding the most
      important dimensions of a data set, those dimensions along which the
      data varies the most. LSA was then
    * quickly widely applied:
      * as a cognitive model Landauer and Dumais (1997), and for tasks like
      * spell checking (Jones and Martin, 1997)
      * language modeling
        (Bellegarda 1997, Coccaro and Jurafsky 1998, Bellegarda 2000)
      * morphology induction (Schone & Jurafsky 2000, Schone & Jurafsky 2001b)
      * multiword expressions (MWEs, Schone and Jurafsky, 2001a)
      * essay grading (Rehder+ 1998)
    * Related models were simultaneously developed and applied to
      word sense disambiguation by Schütze (1992)
    * in a probabilistic classifier, in the logistic regression document router
      of Schütze+ (1995)
* SVD on the term-term matrix (rather than the term-document matrix)
  * as a model of meaning for NLP was proposed soon after LSA by Schütze (1992).
  * (97-dimensional) embeddings produced by SVD to the task of
    word sense disambiguation, analyzed the resulting semantic space, and also
    suggested possible techniques like dropping high-order dimensions
    * See Schütze (1997).
* alternative matrix models followed on from the early SVD work, including
  * Probabilistic Latent Semantic Indexing (PLSI, Hofmann, 1999),
  * Latent Dirichlet Allocation (LDA, Blei+ 2003), and
  * Non-negative Matrix Factorization (NMF, Lee and Seung, 1999).
* The LSA community first used the word “embedding” in Landauer+ (1997), in a
  variant of its mathematical meaning
  as a mapping from one space or mathematical structure to another. In LSA, the
  * described the mapping from the space of sparse count vectors to the latent
  * metonymically shifted to mean the resulting dense vector in the latent space
* Bengio+ (2003) and Bengio+ (2006) showed that
  neural language models could also be used to develop embeddings as part of the
  task of word prediction.
  * Collobert & Weston (2007), Collobert & Weston (2008), & Collobert+ (2011)
    * embeddings could be used to represent word meanings for many tasks.
  * Turian+ (2010) compared the value of different kinds of embeddings for
    different NLP tasks
  * Mikolov+ (2011) showed that recurrent neural nets could be used as LMs
  * simplifying the hidden layer of these neural net language models to create
    the skip-gram (and also CBOW) algorithms was proposed by Mikolov+ (2013a).
  * negative sampling training algorithm was proposed in Mikolov+ (2013b). There
  * surveys of static embeddings and their parameterizations
    (Bullinaria and Levy 2007, Bullinaria and Levy 2012, Lapesa and Evert 2014,
    Kiela and Clark 2014, Levy+ 2015)
* for a deeper understanding of the role of vectors in information retrieval,
  * See Manning+ (2008)
  * how to compare queries with documents, more details on tf-idf, and
    issues of scaling to very large datasets
* See Kim (2019) for a clear and comprehensive tutorial on word2vec
* Cruse (2004) is a useful introductory linguistic text on lexical semantics
