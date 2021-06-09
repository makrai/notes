Controlling the Amount of Verbatim Copying in Abstractive Summarization
Kaiqiang Song, Bingqing Wang, Zhe Feng, Liu Ren, Fei Liu
arXiv:1911.10390 [cs.CL]	AAAI 2020 (Main Technical Track)

implementation and models https://github.com/ucfnlp/control-over-copying

# Abstract

* Human editors can usually exercise control over copying: extractive vs abstrac
* hE, whether modern neural abstractive summarizers have the same flexibility,
* we present a neural summarization model that, by
  learning from single human abstracts, can produce a broad spectrum of sums
  * frame the task of summarization as language modeling and exploit
    alternative mechanisms to generate summary hypotheses
* extensive experiments: we illustrate the significance of our proposed method
  * competitive results over strong baselines. Our analysis further reveals
* conclusion
  * Transformer-based, decoder-only framework to generate summaries
  * multiple strategies at training and decoding stages to generate diverse
    summary hypotheses. We show competitive results

# Introduction

* usage scenarios
  * system abstracts may not contain excessive copied content without proper
    permission
  * 11 consecutive words or longer are considered by EU standards as the
    author’s intellectual creation and it is thus protected by copyright law
    (de Castilho+ 2019). Without proper control over copying, commercial
  * relatively extractive is desirable as they are less likely to suffer from
    content hallucination (Reiter 2018) and better at preserving the meaning
* We define copy rate as the percentage of summary n-grams appearing
* text shortening, word reordering, paraphrasing and abstraction involved
* abstractive summarizers are not necessarily trained on every word of reference
  summaries but they ought to separate the prediction of summary words that are
  seen in the source text from those unseen
* underlying principle:
  * If a summarizer is trained to predict only seen words, it learns to copy
    them from the source text, producing extractive summaries
  * As more unseen words are used for training, the summarizer gradually
    transforms from copying only to both copying and generating new words
  * “mix-and-match” strategy, we enable an abstractive summarizer to generate
    summaries with more, or less, copying
* We frame abstractive summarization as a language modeling task and present a
  decoder-only framework for it. It uses the 
  * same Transformer architecture (Vaswani+ 2017) to both encoding and decoding
  * All network parameters are warm-started using pretrained deep repr
    * In contrast, in a typical encoder-decoder architecture, only parameters of
      the encoder and decoder can be warm-started but not those of the
      attention/copy mechanism (Khandelwal+ 2019)
* training: experiment with varying proportions of seen and unseen summary words
  in training to teach the summarizer to favor, or not to favor, copying
* decoding time, we compare different
  * search strategies (bestfirst search vs. beam search) and
  * reranking methods to encourage system abstracts to use wording similar to
    the original (only single reference summaries are available)
  * evaluate summary quality along multiple dimensions, using automatic metrics
    * lexical similarity (ROUGE; Lin, 2004) and
    * semantic similarity (BERTScore; Zhang+ 2019), and through
    * human assessment of grammaticality, informativeness, and whether system
      abstracts remain true-to-original
* outperforming or performing on par with the best published results
* contributions:
  * new summarization method that provides the flexibility to produce a spectrum
  * our method emphasizes on in-depth analysis of the copy behavior in
    * frames abstractive summarization as a language modeling task and exploits
      multiple strategies at training and decoding stages to generate diverse
      summary hypotheses. We show 
  * competitive results demonstrate the effectiveness of the proposed method

# Related Work

* human-written summaries contain varying amounts of reused text
  * newswire (Over and Yen 2004; Hermann+ 2015),
  * meetings (Carletta and+ 2005; Liu and Liu 2013),
  * scientific articles (Qazvinian+ 2013) and
  * online forums (Ouyang, Chang, and McKeown 2017)
* the degree of copying can have a direct impact on automatic evaluation metrics
  * ROUGE was reported to favor summaries that use the same wording as the orig
    (Ng and Abrecht 2015)
  * If reference summaries are made by copying,
* extractive and abstractive summarization techniques have been investigated
  (Nenkova and McKeown 2011)
* compressive summaries: sentences compressed by removing inessential phrases,
  (Martins and Smith 2009; Li+ 2013; Wang+ 2013; Filippova+ 2015; Durrett+ 2016)
* Abstractive summarization (Barzilay and McKeown 2005; Liu et al. 2015;
  Liao, Lebanoff, and Liu 2018; Hardy and Vlachos 2018)
* encoder-decoder architecture (Rush+ 2015; See, Liu, and Manning 2017; Chen and
  Bansal 2018; Lebanoff, Song, and Liu 2018; Celikyilmaz+ 2018)
* deep contextualized representations such as BERT (Devlin+ 2018) and ELMo
* tempting to use pretrained deep representations to “warm-start” the
  encoder/decoder, Khandelwal+ (2019) find that results can be less satisfying
  as the attention weights are still not pretrained. In this paper we adopts a
  decoder-only framework (Dong+ 2019) where the same Transformer architecture is
  used for both encoding the source text and decoding the summary
* Copying can help produce unseen words
  * originally introduced to the seq2seq framework for NMT (Gulcehre+ 2016) and
  * for abstractive summarization (See, Liu, and Manning 2017)
  * Knowles and Koehn (2018) examine the influence of context and sub-words on
    the copying behavior of an NMT system
  * To suppress copying, Kryciski+ (2018) introduce a novelty metric which is to
    be optimized during policy learning; and
  * Weber+ (2018) modify the scoring function of the summary sequence at
    decoding time
  * Fan, Grangier, and Auli (2018) attempt to control over summary length,
    entities, source style and portions. But they do not address copying

# Experiments 5

* We experiment with selecting varying amounts of seen and unseen summary tokens
  and source tokens for training, where the 
  * number of circles is proportional to the number of tokens used in computing
    the loss term. 
  * All summaries in Table 3 are decoded using beam search (k=5) without rerank
* Our findings suggest that,
  the factor that makes the most impact on the copying behavior of a summarizer
  is the proportion of seen and unseen summary words used for training
  * The 1-gram copy rate for case a.  is about 99% for both datasets, with the
    minor gap due to tokenization discrepancies. As more unseen words are used
    for training, the summarizer gradually transforms from copying only to both
    copying and generating new words not present in the source text
  * the ratio of seen vs. unseen words in ground-truth summaries is 
    about 2:1 in both datasets, and 
    Newsroom is slightly more extractive than Gigaword
  * it is important to maintain a similar ratio during training in order to
    achieve high ROUGE scores. Pure extracts do not attain high ROUGE scores, as
    ground-truth summaries themselves are abstracts. Our analysis further
* training on source words has little impact on the copying behavior, but it
  improves representation learning and has lead to 
  consistently improved ROUGE-2 F-scores
