XL-Sum: Large-Scale Multilingual Abstractive Summarization for 44 Languages
Tahmid Hasan, Abhik Bhattacharjee, Md Saiful Islam, Kazi Samin, Yuan-Fang Li,
  Yong-Bin Kang, M. Sohel Rahman, Rifat Shahriyar
Findings of ACL 2021 arXiv:2106.13822 [cs.CL]

dataset, curation tool, and summarization model checkpoints

# Abstract

* 1 million professionally annotated article-summary pairs from BBC,
  * extracted using a set of carefully designed heuristics
* 44 languages ranging from low to high-resource,
  for many of which no public dataset is currently available
* highly abstractive, concise, and of high quality,
  as indicated by human and intrinsic evaluation
* We fine-tune mT5, a SOTA pretrained multilingual model, with XL-Sum and
  experiment on multilingual and low-resource summarization tasks
  * XL-Sum competitive to results obtained using similar monolingual datasets:
    * higher than 11 ROUGE-2 scores on 10 languages we benchmark on, with some
      of them exceeding 15, as obtained by multilingual training
  * multilingual training can help towards better summarization, most likely
    due to the positive transfer between sister languages with morphological
    similarity
* training on low-resource languages individually also provides competitive perf
* the largest abstractive summarization dataset collected from a single source

# 1 Intro

* Automatic text summarization (Nenkova and McKeown, 2011) is fundamental in NLP
  * Ani Nenkova and Kathleen McKeown
    Automatic summarization
    2011 Foundations and Trends® in Information Retrieval, 5(2–3):103–233
* Extractive methods suffer from some limitations, including weak coherence
  between sentences, inability to simplify complex and long sentences, and
  unintended repetition (See+ 2017; Widyassari+ 2020)
  * AP Widyassari, S Rustad, G Fajar Shidik, E Noersasongko, A Syukur+
    Review of automatic text summarization techniques & methods
    Journal of King Saud University Computer and Information Sciences 2020
* Abstractive summarization (Hsu+ 2018)
  * more coherent and concise than extractive summaries (Cohn and Lapata, 2008)
  * sequence-to-sequence (seq2seq) models and Transformer-based models have
    rejuvenated abs summ (Rush+ 2015; See+ 2017; Zhang+ 2020)
* seq2seq models are heavily data-driven
* multilingual abstractive summarization datasets (Giannakopoulos+ 2015; Cao+
  2020; Scialom+ 2020), are limited in terms of the number of languages,
  training samples, or both
* we introduce XL-Sum, a large-scale abstractive summarization dataset of news
  articles crawled from the British Broadcasting Corporation (BBC) website
  * Using a custom crawler, we collect 1 million professionally annotated
    article-summary pairs covering 44 languages
  * similar summarization strategies across all languages
  * the first publicly available summarization dataset and benchmarks for many
    languages (e.g., Bengali, Swahili)
* We achieve higher than 11 ROUGE-2 score on the 10 languages we benchmark on
  * exceeding 15 ROUGE2 score (16.58 being the SOTA for English, Zhang+ (2020)
    on XSum (Narayan+ 2018), a similar dataset) on many of them
* low-resource summarization task shows competitive results, indicating that
  the dataset can be used even for the low-resource languages individually
* contributions in this paper:
  * XL-Sum, a dataset containing 1 million article-summary pairs in 44 languages
  * a data curation tool that can automatically crawl and extract BBC
    * the dataset can be made even larger over time
  * We are the first to perform multilingual summarization on a diverse set of
    languages, achieving strong baselines on all languages tested

# 6 Related work

* Pretrained language models applied to abstractive summarization
  * initialized the ~ of a seq2seq model
    * Liu and Lapata (2019) initialized the encoder and with the pretrained BERT
    * Rothe+ (2020) initialized both the encoder and the decoder
  * Raffel+ (2020); Qi+ (2020) used fully pre-trained seq2seq models, while
  * Zhang+ (2020) introduced a summarization-specific pretraining objective to
    achieve SOTA results on multiple datasets.  Most works on abstractive
* benchmark datasets for other languages
  * Giannakopoulos+ (2015) introduced MultiLing 2015 spanning 40 languages
    * training set having only 10k samples in total
  * Cao+ (2020); Scialom+ (2020) introduced two new datasets for multiling summ
    * both limited to less than 10 languages.  Moreover,
    * samples for different languages were collected from different sources,
      making them exposed to different types of summarization strategies,
      which raises questions on the uniformity of the summaries

# 7 Conclusion

* future: crosslingual summarization Zhu+ (2019)
