NV-Embed: Improved Techniques for Training LLMs as Generalist Embedding Models
Chankyu Lee, Rajarshi Roy, Mengyao Xu, Jonathan Raiman, Mohammad Shoeybi, Bryan Catanzaro, Wei Ping
arXiv:2405.17428 [cs.CL]

* Decoder-only large language model (LLM)-based embedding models are 
  * beginning to outperform BERT or T5-based embedding models in
    general-purpose text embedding tasks, including dense vector-based
    retrieval. In this work, 
* we introduce the NV-Embed model, incorporating architectural designs,
  training procedures, and curated datasets to 
  * significantly enhance the performance of LLM as a versatile embedding
  * maintaining its simplicity and reproducibility. For model 
  * architecture, we propose a latent attention layer to obtain pooled
    embeddings, which consistently improves retrieval and downstream task
    accuracy compared to mean pooling or using the last `<EOS>` token embedding
    from LLMs. To enhance representation learning, 
  * we remove the causal attention mask of LLMs during contrastive training.
  * training algorithm, we introduce a two-stage contrastive instruction-tuning
    * first applies contrastive training with instructions on retrieval
      datasets, utilizing in-batch negatives and curated hard negative
      examples. At 
    * stage-2, it blends various non-retrieval into instruction tuning, which
      * enhances non-retrieval task accuracy and improves retrieval perf
  * training data, we utilize the 
    hard-negative mining, synthetic data generation and existing public
    available datasets to boost the performance of embedding model. By
* our NV-Embed-v1 and NV-Embed-v2 models obtained the 
  * No.1 position on the Massive Text Embedding Benchmark (MTEB) (as of 2024)
    across 56 embedding tasks, demonstrating the sustained effectiveness of the
    proposed methods over time.  Additionally, it achieved the 
  * highest scores in the Long Doc section and the 
  * second-highest scores in the QA section of the AIR Benchmark, which covers
    a range of out-of-domain information retrieval topics beyond those in MTEB.

# 1 Intro

3. Training data is one of the most crucial factors in achieving
  * We provide a detailed recipe on the curation of training datasets,
    * dataset-specific information, the 
    * positive-aware hard-negative mining technique to enhance contrastive
      training, the 
    * synthetic data generation and example-based multi-class labeling. This
  * enables the community to easily reproduce and even surpass our model,

## 3.2 Latent attention layer

* There are two popular methods to obtain the embedding for a sequence of tokens:
  i) mean pooling, and ii) the last <EOS> token embedding. 
  * Previous bidirectional embedding models typically use mean pooling (Wang+,
    2022; Izacard+, 2021), while 
  * the last <EOS> token embedding is more popular for decoder-only LLM based
    embedding models. However, both methods have certain 
* limitations.
  * Mean pooling simply takes the average of token embeddings and may dilute
    the important information from key phrases, meanwhile 
  * the last <EOS> token embedding may suffer from recency bias, relying
    heavily on the output embedding of last token.
* we propose a latent attention layer inspired by Jaegle+ (2021)
  to achieve more expressive pooling of the sequences
  for general-purpose embedding tasks.
* denote the last layer hidden from decoder as the query Q ∈ Rl×d , where l is
  the length of sequence, and d is the hidden dimension. They are sent to
  attend the latent array K = V ∈ Rr×d , which are trainable “dictionary” used
  to obtain better representation, where r is the number of latents in the
  dictionary.
* The output of this cross-attention is O ∈ Rl×d , O = softmax(QK T )V (1)
  which is followed by a regular MLP consists of two linear transformations
  with a GELU activation in between. Our model uses latent attention layer with
  r of 512 and the number of heads as 8 for multi-head attention. 
* Finally, we apply mean pooling after MLP layers to obtain the embedding of
  whole sequences. See Figure 1 for an illustration. It is worth mentioning
* rel work
  * our approach follows the spirit of dictionary learning to obtain better
    representation (e.g., Wang+, 2018), which is 
  * different from the Perceiver IO architecture. 
  * compared to normal self-attention, consistent improvements, see ablation

## 4.2 Public non-retrieval datasets

* mainly from three sub-tasks in MTEB benchmark: 
  * classification, clustering and semantic similarity (STS). We pre-process
    the format of these datasets to become the compatible with retrieval
    datasets for contrastive training: − query q + , positive document d+ and
    hard negative documents {d− 0 , ..., dn }.
* classification, we utilize the English training splits of various datasets
  from MTEB Huggingface datasets (Muennighoff+, 2022; Lhoest+, 2021). The
  * Niklas Muennighoff, Nouamane Tazi, Loïc Magne, and Nils Reimers.
    MTEB: Massive text embedding benchmark. arXiv preprint arXiv:2210.07316,
  * Q Lhoest, AVd Moral, Y Jernite, A Thakur, P von Platen, S Patil, et al
    Datasets: A community library for natural language processing. EMNLP 2021
  * the classification datasets that we use are as follows: 
    * list
      * AmazonReviews (McAuley & Leskovec, 2013a)
      * AmazonCounterfactual (O’Neill+, 2021)
      * Banking77 (Casanueva+, 2020)
      * Emotion (Saravia+, 2018)
      * IMDB (Maas+, 2011)
      * MTOPDomain/MTOPIntent (Li+, 2021)
      * ToxicConversations (Adams+, 2019)
      * TweetSentimentExtraction (Maggie, 2020)
      * AmazonPolarity (McAuley & Leskovec, 2013b)
      * MassiveScenario/MassiveIntent (FitzGerald+, 2022)
    * For the Emotion and AmazonCounterfactual classification datasets we use
      BM25 (Robertson+, 2009) similarity thresholds to filter out training data
      that is similar to the MTEB evaluation set.
* clustering datasets, we utilize 
  * the `raw_arxiv`, `raw_biorxiv` and `raw_medrxiv` datasets from MTEB
    Huggingface datasets, 
  * TwentyNewsgroups (Lang, 1995), Reddit (Geigle+, 2021), StackExchange
    (Geigle+, 2021), RedditP2P (Reimers, 2021b) and StackExchangeP2P (Reimers,
    2021a) We filter out any training data that match the MTEB evaluation set.
* technical
  * The classification and clustering datasets provide examples and corresponding
  class/cluster labels.
  * The example texts extracted from the appropriate text/title/abstract field
  * For binary classification tasks the label texts are used 
  * multi-class classification and clustering tasks, 
    * a randomly sampled example from the ground-truth class/cluster is d+
    * randomly sampled examples from other classes/clusters are used for d-
    * ablation experiments supporting this approach in section 5.3.4.
*  semantic textual similarity datasets, we use the training splits of three
   semantic similarity datasets STS12 (Agirre+, 2012), STS22 (Chen+, 2022),
   STS-Benchmark (Cer+, 2017) from MTEB Huggingface datasets. 
   * For any pair of texts with associated relevance scores (ta , tb , score),
     we create two examples (q + = ta , d+ = tb ) and (q + = tb , d+ = ta ) if
     score ≥ 4. We mine the 
  * hard negatives d− k from the pool of other texts using the same technique
    as section 4.1.1. 
  * Task instructions are appended to d+ , d− 
    since they are symmmetric with the query.
