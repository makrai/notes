XL-Sum: Large-Scale Multilingual Abstractive Summarization for 44 Languages
Tahmid Hasan, Abhik Bhattacharjee, Md Saiful Islam, Kazi Samin, Yuan-Fang Li,
  Yong-Bin Kang, M. Sohel Rahman, Rifat Shahriyar
Findings of ACL 2021 arXiv:2106.13822 [cs.CL]

dataset, curation tool, and summarization model checkpoints. We believe that our

* 1 million professionally annotated article-summary pairs from BBC, 
  * extracted using a set of carefully designed heuristics. The dataset covers
* 44 languages ranging from low to high-resource, for many of which no public
  dataset is currently available. XL-Sum is 
* highly abstractive, concise, and of high quality, as indicated by human and
  intrinsic evaluation. 
* We fine-tune mT5, a SOTA pretrained multilingual model, with XL-Sum and
  experiment on multilingual and low-resource summarization tasks.  XL-Sum
  * competitive to results obtained using similar monolingual datasets: we show
    * higher than 11 ROUGE-2 scores on 10 languages we benchmark on, with some
      of them exceeding 15, as obtained by multilingual training.  Additionally,
* training on low-resource languages individually also provides competitive perf
* the largest abstractive summarization dataset collected from a single source

# 1 Intro

* Automatic text summarization (Nenkova and McKeown, 2011) is fundamental in NLP
  * Ani Nenkova and Kathleen McKeown. . 
    Automatic summarization. 
    2011 Foundations and Trends® in Information Retrieval, 5(2–3):103–233.
* Extractive methods suffer from some limitations, including weak coherence
  between sentences, inability to simplify complex and long sentences, and
  unintended repetition (See+ 2017; Widyassari+ 2020).
* Abstractive summarization (Hsu+ 2018).  
  *  more coherent and concise than extractive summaries (Cohn and Lapata, 2008)
  * sequence-to-sequence (seq2seq) models and Transformer-based models have
    rejuvenated abs summ (Rush+ 2015; See+ 2017; Zhang+ 2020), which had
* seq2seq models are heavily data-driven, i.e., a large number of
* multilingual abstractive summarization datasets (Giannakopoulos+ 2015; Cao+
  2020; Scialom+ 2020), they are limited in terms of the number of languages
  covered, the number of training samples, or both.  
* we introduce XL-Sum, a large-scale abstractive summarization dataset of news
  articles crawled from the British Broadcasting Corporation (BBC) 1 website.
  Using a custom crawler, we collect 1 million professionally annotated
  article-summary pairs covering 44 languages.  Originating from a single
  * similar summarization strategies across all languages, making them ideal for
  * the first publicly available summarization dataset and benchmarks for many
    languages (e.g., Bengali, Swahili). Thus, this dataset potentially enables
* We achieve higher than 11 ROUGE-2 score on the 10 languages we benchmark on
  * exceeding 15 ROUGE2 score (16.58 being the SOTA for English, Zhang+ (2020)
    on XSum (Narayan+ 2018), a similar dataset) on many of them.  In addition,
* low-resource summarization task and show competitive results, indicating that
  the dataset can be used even for the low-resource languages individually.  
* contributions in this paper: 
  * XL-Sum, a dataset containing 1 million article-summary pairs in 44 languages
  * a data curation tool that can automatically crawl and extract BBC
    * the dataset can be made even larger over time.  
  * We are the first to perform multilingual summarization on a diverse set of
    languages, achieving strong baselines on all languages tested.  
