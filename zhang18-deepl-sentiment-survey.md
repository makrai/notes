L Zhang, S Wang, B Liu
Deep learning for sentiment analysis: A survey
Wiley Interdisciplinary Reviews 2018

# Deep learning

## MEMORY NETWORK 11

* Weston+ (2014) introduced the concept of Memory Networks (MemNN)
  for the question answering problem
* several inference components combined with a large long-term memory
  * components can be neural networks (NNs)
  * memory acts as a dynamic knowledge base
* four learnable/inference components
* Based on MemNN, Sukhbaatar+ (NIPS 2015): MemN2N
  * an End-to-End Memory Network (MemN2N)
  * with a recurrent attention mechanism over the long-term memory component
  * refines the attention mechanism to some extent
  * a similar idea is the Neural Turing Machines reported by Graves+ 2014

# SENTIMENT ANALYSIS TASKS 12

* three levels of granularity:
  document level, sentence level, and aspect level
  * Document level sentiment classification classifies an opinionated document
    * assumes that the document is known to be opinionated and
      contain opinions about a single entity
  * Sentence level sentiment classification classifies individual sentences
    * each sentence cannot be assumed to be opinionated
    * subjectivity classification
  * aspect level sentiment analysis or aspect-based sentiment analysis
    * summarize people’s opinions on entities and [their] aspects/features
    * [entities] also called targets
    * subtasks such as aspect extraction, entity extraction, and
      aspect sentiment classification
* Apart from these core tasks, sentiment analysis also studies
  emotion analysis, sarcasm detection, multilingual sentiment analysis

# DOCUMENT LEVEL SENTIMENT CLASSIFICATION 13

* Tang+ (EMNLP 2015): a NN to learn doc repr, with sentence rels
  * sentence representation with CNN or LSTM from word embeddings. Then GRU
* Tang+ (ACL 2015) applied user and product representations in review classif
* Chen+ (EMNLP 2016) also incorporated user information and product information
  * via word and sentence level attentions
* Dou (EMNLP 2017) used a deep memory network to capture user and product info
  * two separate parts
    1. LSTM is applied to learn a document representation
    2. a deep memory network consisting of multiple computational layers (hops)
       is used to predict the review rating for each document
* Xu+ (EMNLP 2016): a cached LSTM model
  to capture the overall semantic information in a long text
  * The memory in the model is divided into several groups with
    * low forgetting rates to capture global semantic features and the
    * ones with high forgetting rates to learn local semantic features
* Yang+ (NAACL 2016): a hierarchical attention network for doc level
  * two levels of attention mechanisms: word level and sentence level
* Yin+ (EMNLP 2017) document-level aspect-sentiment rating prediction task
  as a machine comprehension problem
  * hierarchical interactive attention-based model
  * documents and pseudo aspect-questions are interleaved
    to learn aspect-aware document representation
* Zhou+ (EMNLP 2016) designed an attention-based LSTM network
  for cross-lingual sentiment classification at the document level
  * two attention-based LSTMs for bilingual representation, and
    each LSTM is also hierarchically structured
  * from (English) to a resource-poor language (Chinese)
* Li+ (IJCAI 2017): an adversarial memory network for
  cross-domain sentiment classification in a transfer learning setting
  * two networks for sentiment classification and
    domain classification (i.e. whether a document is from the sr or tg domain)

# SENTENCE LEVEL SENTIMENT CLASSIFICATION 16

* since a sentence is usually short compared to a document, some
  syntactic and semantic information may be used to help
  (e.g., parse trees, opinion lexicons, and part-of-speech tags)
* Additional information such as review ratings, social relationship, and
  cross-domain information can be considered too
* In early research, parse trees were used together with the original words
* lately, CNN and RNN become more popular, and they do not need parse trees
  * word embeddings as input, which already encode some semantics and syntax
* Socher+ 49 first: a semi-supervised Recursive Autoencoders Network
* Socher+ 50: a Matrix-vector Recursive Neural Network (MV- RNN)
  * each word is additionally associated with a matrix representation
* Socher+ 51, the Recursive Neural Tensor Network (RNTN)
* Qian+ 33: two more advanced models,
  * Tag-guided Recursive Neural Network (TG-RNN), which
    chooses a composition function according to the part-of-speech tags
  * Tag-embedded Recursive Neural Network / Recursive Neural Tenser Network
    * learns tag embeddings and then combines tag and word embeddings together
* Kalchbrenner+ 52: a Dynamic CNN (called DCNN)
  * the dynamic K-Max pooling operator as a non-linear subsampling function
  * The feature graph induced by the network is able to capture word relations
* Kim 53: use CNN for sentence-level sentiment classification
* dos Santos and Gatti 54: a Character to Sentence CNN (CharSCNN)
  * extract relevant features from words and sentences of any size
* Wang+ 55: LSTM for Twitter sentiment classification
  by simulating the interactions of words during the compositional process
  * Multiplicative operations between word embeddings through gate structures
  * bidirectional LSTM 56 by allowing bidirectional connections in the hidden l
* Wang+ 57: a regional CNN-LSTM model
* Wang+ 58: a joint CNN and RNN architecture for sentiment
  * coarse-grained local features generated by CNN and
  * long-distance dependencies learned via RNN
* Guggilla+ 59: a LSTM- and CNN-based deep NN model
  * for claim classification (classifying sentences to be factual or feeling)
* Huang+ 60: to encode the POS tags in a tree-structured LSTM
* Akhtar+ 61: several multi-layer perceptron based ensemble models
  for fine-gained sentiment classification of financial microblogs and news
* Guan+ 62 employed a weakly-supervised CNN for sentence (and also aspect)
  * two-step learning process: it
    1. a sentence representation weakly supervised by overall review ratings
    2. uses the sentence (and aspect) level labels for fine-tuning
* Teng+ 63: a context-sensitive lexicon-based method for sentiment
  * simple weighted-sum model, using
  * bidirectional LSTM to learn the sentiment strength, intensification and
    negation of lexicon sentiments in composing the sentiment value
* Yu and Jiang 64 generalized sentence embeddings for cross-domain
  * two separated CNNs that jointly learn two hidden feature representations
    from both the labeled and unlabeled data
* Zhao+ 65 introduced a recurrent random walk network learning approach for
  * exploiting the deep semantic representation of
    user posted tweets and their social relationships
* Mishra+ 66 utilized CNN to automatically
  extract cognitive features from the eye-movement (or gaze) data and
  used them as enriched features along with textual features for sentiment
* Qian+ (ACL 2017) presented a linguistically regularized LSTM for the task
  * linguistic resources such as sentiment lexicon, negation words and
    intensity words

# ASPECT LEVEL SENTIMENT CLASSIFICATION 18

# ASPECT EXTRACTION AND CATEGORIZATION 20

# OPINION EXPRESSION EXTRACTION 21

* opinion (expression/term) extraction/identification
  * identify the expressions of sentiment in a sentence or a document. Similar
* Irsoy and Cardie 93,94 explored the application of deep bidirectional RNN for
* Liu+ 95 presented a general class of discriminative models based on the RNN
  architecture and word embedding
  * different RNN architectures including Elman-type, Jordan-type, LSTM and
    their variations
* Wang+ 83: a model integrating recursive NNs and CRF to
  co-extract aspect and opinion terms
* CMLA is also: for co-extraction of aspect and opinion terms. 84

# SENTIMENT ANALYSIS WITH WORD EMBEDDING 22

* even without the use of deep learning models, word embeddings can be used
* sentiment-encoded word embeddings. For sentiment analysis,
  * directly applying [ CBOW or Skip-gram faces] problems, because
    words with similar contexts but opposite sentiment polarities (good/bad)
    may be mapped to nearby vectors in the embedding space. Therefore,
  * Mass+ 102 learned word embeddings [ capturing] both semantic and sentiment
  * Bespalov+ 103 showed that an n-gram model combined with latent representation
    would produce a more suitable embedding for sentiment classification
  * Labutov and Lipson 104 re-embed existing word embeddings with logistic
    regression
    by regarding sentiment supervision of sentences as a regularization term
  * Le and Mikolov 35: the concept of paragraph vector to first
    * fixed-length representation for variable-length pieces of texts,
      including sentences, paragraphs and documents
    * on both sentence and document-level sentiment classification[,] performance
      gains, which demonstrates the merit of paragraph vectors
  * Tang+ 105,106 presented models to learn Sentiment-specific Word Embeddings
    (SSWE), in which not only the semantic but also sentiment information is
    embedded in the learned word vectors
  * Wang and Xia 107 developed a neural architecture to train a sentiment-
    bearing word embedding by integrating the sentiment supervision at both the
    document and word levels
  * Yu+ 108 adopted a refinement strategy to obtain joint semantic-sentiment
    bearing word vectors
* Feature enrichment and multi-sense word embeddings are also investigated
  * Vo and Zhang 69 studied aspect-based Twitter sentiment classification by
  * Li and Jurafsky 109 experimented with the utilization of
    multi-sense word embeddings on various NLP tasks. Experimental results show
    * they offer little help to sentiment classification tasks
    * Ren+ 110: methods to learn topic-enriched multi-prototype
      word embeddings for Twitter sentiment classification
* Multilinguistic word embeddings have also been applied to sentiment
  * Zhou+ 111 reported a Bilingual Sentiment Word Embedding (BSWE) model for
    cross-language sentiment classification. It
    * incorporates the sentiment information into English-Chinese bilingual
      embeddings by employing labeled corpora and their translation, instead of
      large-scale parallel corpora
  * Barnes+ 112 compared several types of bilingual word embeddings and
    neural machine translation techniques
    for cross-lingual aspect-based sentiment classification
* Zhang+ 113 integrated word embeddings with matrix factorization for
  personalized review-based rating prediction. Specifically, the authors
  * refine word2vec and GloVe using sentiment lexicons
* Sharma+ 114: a semi-supervised technique to use sentiment bearing
  word embeddings for ranking sentiment intensity of adjectives

# EMOTION ANALYSIS 23

* Wang Z, Zhang Y, Lee S, Li S, and Zhou G
  A bilingual attention network for code-switched emotion prediction
  (COLING 2016)
  * both the monolingual and bilingual contexts
* Zhou H, Huang M, Zhang T, Zhu X and Liu B
  Emotional chatting machine: with internal and external memory
  arXiv preprint. arXiv:1704.01074, 2017
* Abdul-Mageed M, Ungar L
  EmoNet: fine-grained emotion detection with gated recurrent NNs
  (ACL 2017), 2017
* Felbo B, Mislove A, Søgaard A, Rahwan I, and Lehmann S
  Using millions of emoji occurrences to learn any-domain representations for
  detecting sentiment, emotion and sarcasm
  (EMNLP 2017), 2017
* Gui L, Hu J, He Y, Xu R, Lu Q, and Du J
  A question answering approach to emotion cause extraction
  (EMNLP 2017), 2017

# OTHER RELATED TASKS [with deep learning] 25

* Sentiment Intersubjectivity: Gui+ (IJCAI, 2016) tackled intersubjectivity
  * gap between the surface form and the corresponding abstract concepts,
* Lexicon Expansion: Wang+ 144: a PU learning-based neural approach
* Financial Volatility Prediction: Rekabsaz+ 145 made volatility predictions
  with word embedding-based information retrieval models
* Opinion Recommendation: Wang and Zhang 146 introduced the task
  * generate a customized review score + review of a product that the
    particular user is likely to give
  * multiple-attention memory network was: to tackle the problem,
* Stance Detection: Augenstein+ 147: a bidirectional LSTMs
  * in political twitter data
  * Du+ 148 designed a target-specific neural attention model
