How Decoding Strategies Affect the Verifiability of Generated Text
Luca Massarelli, Fabio Petroni, Aleksandra Piktus, Myle Ott, Tim Rocktäschel,
  Vassilis Plachouras, Fabrizio Silvestri, Sebastian Riedel
Findings of EMNLP 2020 arXiv:1911.03587 [cs.CL]

* A generated sentence is verifiable if it can be corroborated or disproved by
  Wikipedia, and we find that the verifiability of generated text
  * strongly depends on the decoding strategy.  In particular, we discover a
  * tradeoff between factuality (Wikipedia-corroborated) and repetitiveness
* decoding strategies such as top-k and nucleus sampling lead to
  less repetitive generations, they also produce less verifiable text.  Based on
* we introduce a simple and effective decoding strategy which, in comparison to
  * less repetitive and more verifiable text

# 1 Intro

* language models can also pick up factual knowledge from the training data
  (Petroni+ 2019; Logan+ 2019; Broscheit, 2019; Roberts+ 2020)
* we use Wikipedia to first create a set of natural lang prompts to initiate gen
  * Next, we use transformer models of various sizes and trained with different
    corpora to generate sentences off these prompts with varying decoding
  * Finally, following earlier work in fact checking (Thorne+ 2018), we use
    Wikipedia again to verify each sentence as supported, refuted, or unverifiab
    * using both an off-the-shelf automatic fact-checking system and human annot
  * In our analysis, we considered the most viewed Wikipedia pages in 2017, 2018
    * rationale: topics that are likely to be highly covered in a web crawl
    * Results (not reported in the paper) with a random set of Wikipedia pages
      showed lower values in terms of SPG and USPG (i.e., recall metrics)
* We define verifiability metrics on top of the automatic and human
  fact-checkers’ outcomes (see Figure 1 for a high-level overview)
* The truthfulness of generated text can be traded off with other properties
  * repetitiveness. Similarly, a model might generate ungrammatical text that
  * text generated from auto-regressive transformer-based LMs, especially in
    their large versions (1.4B parameters), is almost always grammatical and
  * We hence focus on this dimension in our analysis and define metrics that
    combine repetitiveness with verifiability
* One of our main findings is that while
  * sampling methods, such as top-k and nucleus, produce more natural and less
    repetitive text, they also generate fewer supported and more refuted
  * Beam search, on the other hand, shows much better performance in these dims
    * at the cost of producing highly repetitive text. Based on these
* Holtzman+ (2019) showed how the probability of human text under language
  models is varying from token to token
* we introduce a simple strategy: Delayed Beam Search (D ELAYED BS)
  * we iterate between sampling and finding most likely utterances
  * By simply injecting stochasticity in the beginning of a sentence and then
    switching to beam search, we generate text that is less repetitive while at
    the same time scores well in terms of our verifiability metrics
* Our main findings hold across several experimental settings, with varying
  training set size and model size
* contributions:
  * experimental methodology to assess machine generated text with respect to
    repetitiveness and verifiability
  * assess a wide range of decoding algorithms with respect to these dimensions,
  * a novel decoding strategy that addresses some of the shortcomings
  * we carry out an annotation campaign to validate our findings and
    * assess the quality of the automatic fact checking system
* future work could be to investigate
  * relationships among training corpora and generation
  * hE, some generations contain multiple claims that could be independent
    * We considered each sentence as a single claim to keep our exper clean
      avoid noise from an automatic claim extractor
