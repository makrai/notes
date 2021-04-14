Leveraging ParsBERT and Pretrained mT5 for Persian Abstractive Text Summarizaton
Mehrdad Farahani, Mohammad Gharachorloo, Mohammad Manthouri
CSICC 2021 arXiv:2012.11204 [cs.CL]

* Pre-trained transformer-based encoder-decoder models gain popularity for summ
* This paper proposes
  * two methods to address this task and
  * a novel dataset named pn-summary for Persian abstractive text summarization
  * The models employed in this paper are mT5 and an encoder-decoder version of
    the ParsBERT model (i.e., a monolingual BERT model for Persian)
  * fine-tuned on the pn-summary dataset

# 1 Intro

* Text summarization can be viewed from different perspectives including
  * single-document [4] vs. multi document [5, 6] and
  * monolingual vs.  multi-lingual [7]
  * extractive or abstractive. In
    * extractive summarization, a few sentences are selected from the context to
      * sentence scores are determined by computing certain features such as the
        ordinal position of sentences concerning one another, length of the
        sentence, a ratio of nouns, etc. After sentences are ranked, the top n
    * Abstractive summarization by generating new sentences
      with words that are not necessarily found in the original text
    * Persian language: almost all works are extractive. This is
      * partly due to the lack of proper Persian text datasets for this task
* based on Sequence-to-Sequence (Seq2Seq) structures as text summarization can
  * [9] Piji Li, Wai Lam, Lidong Bing, and Z Wang
    Deep recurrent generative decoder for abstractive text summarization
    ArXiv, abs/1708.00625, 2017
  * [10] Ramesh Nallapati, Bowen Zhou, CD Santos, Çaglar Gülçehre, and B Xiang
    Abstractive text summarization using sequence-to-sequence rnns and beyond
    In CoNLL, 2016
  * [11] Romain Paulus, Caiming Xiong, and R Socher
    A deep reinforced model for abstractive summarization
    ArXiv, abs/1705.04304, 2018
    * combines reinforcement learning with supervised word prediction
  * [12] A See, Peter J Liu, and Christopher D Manning
    Get to the point: Summarization with pointer-generator networks
    ArXiv, abs/1704.04368, 2017
  * [13] Wei Li, X Xiao, Yajuan Lyu, and Yuanzhuo Wang
    Improving neural abstractive document summarization
      with explicit information selection modeling
    In EMNLP, 2018
    * an extended version of encoder-decoder architecture that benefits from an
      information selection layer for abstractive summarization
  * Many of the works benefit from pre-trained language models
    * lightweight fine-tuning phase by employing transfer learning benefits
* BERT [14], and T5 [15] are amongst widely used pre-trained language models
  * BERT uses a Masked Language Model (MLM) and an encoder-decoder stack to
    * joint conditioning on the left and right context
* T5, is a unified Seq2Seq framework that employs Text-to-Text format to
  address NLP text-based problems
  * multilingual variation of the T5 model is called mT5 [16] that covers
    * 101 different languages and is trained on a Common Crawl-based dataset
* BERT model also has a
  * multilingual version
  * numerous monolingual variations of this model [17,18] that have shown to
    outperform the multilingual version on various NLP tasks
  * For Persian, the ParsBERT model [19] has shown SOTA on many Persian NLP
    tasks such as Named Entity Recognition (NER) and Sentiment Analysis
* contributions:
  * novel dataset for the Persian text summarization task, publicly available
  * Investigating two approaches towards abstractive summarization for Persian
    * use the ParsBERT model in a Seq2Seq structure as presented in [20]
    * use the mT5 model
    * Both models are fine-tuned on the proposed dataset

# 2 ParsBERT Seq2Seq encoder-decoder model as well as mT5

# 3 Fine-tuning and text generation configurations for both approaches

# 4 Dataset and its statistical features; metrics

# 5 Results obtained from fine-tuning the dataset mentioned in earlier models

# 6 Conclusion
