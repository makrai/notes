Improving Neural Conversational Models with Entropy-Based Data Filtering
Richard Csaky, Patrik Purgai, Gábor Recski

## 3.2 Clustering Methods and Filtering

* clusters of utterances established by clustering their vector representations
  using the Mean Shift algorithm (Fukunaga and Hostetler, 1975)
  Source and target utterances are clustered separately.
* In the AVG EMBEDDING setup the representation R(U ) of utterance U is
  computed by taking the average word embedding weighted by the smooth inverse
  frequency of words (Arora+ 2017),
* We also experiment with Sent2vec, a more sophisticated sentence
  embedding approach, which can be thought of as an extension of word2vec to
  sentences (Pagliardini+ 2018).
