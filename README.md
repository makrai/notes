# Summarization

* fabbri2007-SummEval.md, [SummEval](https://github.com/Yale-LILY/SummEval)
  * re-evaluate 12 automatic evaluation metrics
  * consistently benchmark 23 recent summarization models
  * share
    * the largest collection of summaries generated by models trained on the
      CNN/DailyMail news dataset and share it in a unified format,
    * toolkit that provides an extensible and unified API for evaluating
      a broad range of automatic metrics,
    * collection of human judgments of model-generated summaries on the CNN/Dail
* scialom2004-multiling-summ.md, [MLSUM](https://github.com/recitalAI/MLSUM)
  * corpus obtained from online newspapers, it contains 1.5M+ pairs
    * 5 languages, namely, French, German, Spanish, Russian, Turkish
    * Together with English newspapers from the popular CNN/Daily mail dataset,
  * cross-lingual comparative analyses based on SOTA systems
  * highlight existing biases which motivate the use of a multi-lingual dataset
  * strong baselines from multilingual abstractive text generation models;
  * cross-lingual analysis of the results obtained by different approaches
* liu1908-summarization.md, [PreSumm](https://github.com/nlpyang/PreSumm)
  * BERT applied in text summarization
  * a general framework for both extractive and abstractive models
  * document-level encoder based on BERT
  * extractive model is built on top of this encoder
    by stacking several inter-sentence Transformer layers
  * abstractive summarization, we propose a new fine-tuning schedule
* ladhak2010-benchmark-crossling-summ.md,
  [WikiLingua](https://github.com/esdurmus/Wikilingua)
  * article and summary pairs in 18 languages from WikiHow,
* cao20-multisumm-multiling-abs-summ-aaai.md, MultiSumm, code coming
  * the first summarization dataset for Bosnian and Croatian,
* farahani2012-abstractive-summ-persian.md
* zhang1912-pegasus-summ.md
  * human performance on multiple datasets
* dong1905-multiling-gen.md, [UniLM](https://github.com/microsoft/unilm)
  * Unified LM Pre-training for Natural Language Understanding and Generation
* giannakopoulos15-multiling-summ-40.md
* raffel1910-transfer-t5.md
* erkan04-lexrank-jair.md
* chi20-cross-ling-nlg-pretrain.md, [XNLG](https://github.com/microsoft/unilm)
  * transfer monolingual NLG supervision to other pre-trained languages
  * eval in two crosslingual NLG datasets: QA and abstractive summarization
    * English, Chinese, and French
* see1704-summarization-pointer.md
* narayan18-XSum-conv.md
* kryscinski1908-summarizatoin-critical.md
    * models overfit to layout biases
* zaheer2007-big-bird-transformer-long.md
* liu2001-multiling-denoising-ae.md
* lewis1910-bart-denoising-s2s-pretrain.md
* kryscinski1808-abstraction-in-summarization.md
