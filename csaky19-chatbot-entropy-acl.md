## 5.2 Evaluation Metrics

* automatic evaluation of chatbots is an open research problem. In order to
* BLEU and perplexity are omitted, because [they] don’t correlate with human
  judgment (Liu+ 2016). Even though we don’t use these, we still have
* the following metrics assess different parts of response quality, thus models
  should be compared on the whole set of metrics.  The first and simplest
* response length (|U |), is widely used as a simple indicator of engagement
  (Serban+ 2017b; Tandon+ 2017; Baheti+ 2018)

### Word and utterance entropy. 

* The per-word entropy H w = − |U 1 | w∈U log 2 p(w) of responses is measured
* [word] probabilities are calculated [from] the training data (Serban+ 2017b)
* We introduce the bigram version of this metric
* Utterance entropy is simply the product of H w and |U | (Serban+ 2017b). 
* We also report utterance entropy at the bigram level.

### KL divergence ... between model and ground truth (GT) response sets 
* The bigram version of this metric is also reported. 

### Embedding metrics. Embedding average, extrema, and greedy are widely used

* introduced by Liu+ (2016). 
* average measures the cosine similarity between the average word embeddings of
* extrema constructs a representation by taking the greatest absolute value for
  each dimension among the word vectors in the response and target utterances,
* greedy matches each response token to a target token (and vice versa) based
  on the cosine similarity between their embeddings, and averages the total

### Coherence

* the cosine similarity between pairs of input and response (Xu+ 2018b).
* higher value seems better as model responses tend to have lower coherence
  than targets

### Distinct metrics. 

* Distinct-1 and distinct-2 are widely used in the literature (Li+ 2016a),
  measuring the ratio of unique unigrams/bigrams to the total number of
  unigrams/bigrams in a set of responses. However, they are 
* very sensitive to the test data size
* While the number of total words increases linearly, the number of unique
  words is limited by the vocabulary

* Normally metrics are computed at the validation loss minimum of a model,
  however in the case of chatbot models loss may not be a good indicator 
* we also looked at how these 13 metrics progress during training.
* metrics ... seem to favor a model that overfitted the training data, which we
* responses are qualitatively better after overfitting (Csáky 17; Tandon+ 17),
* future work to conduct human evaluation between non-overfitted and overfitted
