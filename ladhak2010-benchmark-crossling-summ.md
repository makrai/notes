WikiLingua: A New Benchmark Dataset for Cross-Lingual Abstractive Summarization
Faisal Ladhak, Esin Durmus, Claire Cardie, Kathleen McKeown
Findings of EMNLP 2020 arXiv:2010.03093 [cs.CL]

https://github.com/esdurmus/Wikilingua

* article and summary pairs in 18 languages from WikiHow,
  * Eng Spa Por Fre Ger Rus Ita Ind Dut Ara Chi Vie Tha Jap Kor Hin Cze Tur
* WikiHow: a high quality, collaborative resource of how-to guides on a diverse
  set of topics written by human authors
* gold-standard article-summary alignments across languages by aligning the
  images that are used to describe each how-to step in an article. As a set of
* baselines for further studies, we evaluate the performance of existing
  cross-lingual abstractive summarization methods on our dataset
* method for direct crosslingual summarization (ie without translation at infer)
  by leveraging synthetic data and Neural Machine Translation as a pre-training
  * significantly outperforms the baseline approaches, while
  * more cost efficient during inference

# 1 Intro

* abstractive summarization, mostly monolingual (Lewis+ 2019a; Song+ 2020)
* resources for cross-lingual summarization
  (Giannakopoulos, 2013; Li+ 2013; Elhadad+ 2013; Nguyen and Daumé III, 2019),
  * very limited in size
* difficult to collect high-quality, large-scale datasets via crowd-sourcing
  * costly endeavor: humans must condense, and paraphrase entire articles
  * subjectivity in content selection (Nguyen and Daumé III, 2019)
* WikiHow: collaboratively written how-to guides with summaries across 18
  * Each article and summary is written and edited by 23 people, and further
    reviewed by 16 people, on average, which ensures that the content is of a
  * articles describe multiple methods with steps to complete a procedural task
    * diverse set of topics, such as “How to Make a Creamy Coffee”, “How to
      Exercise to Ease Back Pain”
    * Each step contains a one sentence summary followed by a paragraph
      detailing the instruction, along with an image to illustrate the given
    * the ordering of steps may differ for the same article across languages,
      * we align each step using the corresponding illustrative image, as shown
* WikiLingua
  * 141,457 unique English articles
  * other 17 languages has, on average, 42,783 articles that align with an en
  * the largest dataset with parallel articles and summaries for cross-lingual
    abstractive summarization to date
* for cross-lingual and multilingual summarization

# 3 Existing Multilingual Abstractive Summarization Datasets

## MultiLing’13 and ’15

* MultiLing Workshops (Giannakopoulos, 2013; Elhadad+ 2013; Kubina+ 2013)
* MultiLing’13 dataset includes summaries of 30 Wikipedia articles per language,
  describing a given topic
* For MultiLing’15, an additional 30 documents were collected for evaluation
  (Giannakopoulos+ 2015)
* no parallel articles or summaries: difficult to use for cross-lingual eval

## Global Voices (Nguyen and Daumé III 2019)

* social network descriptions of news articles provided by Global Voices
* not written with the purpose of summarizing the article content but rather to
  draw user clicks on social media; therefore, they have a lower coverage of the
* the authors crowd-source a small set of summaries, to English, for 15 langs

* WikiLingua is similar to Global Voices in terms of article and summary length
  * MultiLing articles and summaries are longer
  * All three existing datasets are limited in size in comparison to WikiLingua
  * Furthermore, our dataset includes articles on a wide range of topics
  * number of articles per language is two orders of magnitude larger than
    Global Voices, which is the largest dataset to date for cross-lingual eval

# 4 Cross-lingual Experiments

## 4.1 baselines

## 4.2 Direct Cross-lingual Summarization

* method for direct crosslingual abstractive summarization, 
  leveraging synthetic data and machine translation as a pre-training step

# 5 Results and Analysis

* our method outperforms existing baselines, 
  without relying on translation at inference time

# 6 Related Work

## Abstractive Summarization in English

* monolingual summarization in English (Gehrmann+ 18; Song+ 20; Narayan+ 18)
* Rush+ (2015) proposes the first neural abstractive summarization model 
  * an attention-based CNN encoder and a feed-forward decoder
* Chopra+ (2016) shows improvements using a RNN for the decoder
* Nallapati+ (2016) shows further improvements by incorporating
  * embeddings for linguistic features such as POS tags and named-entity tags
  * a pointer network (Vinyals+ 2015) to enable copying words from the source
* See+ (2017) extends this model by further incorporating a coverage penalty
  to address the problem of repetitions in the generated summary
* Chen and Bansal (2018) takes a two stage approach to abstractive summarization
  * extractor to select salient sentences from the articles, and an
  * abstractor to rewrite the sentences selected by the extractor
  * further train the extractor and abstractor end-to-end with a
    policy-gradient method, using ROUGE-L F1 as the reward function
* pre-trained language models have achieved the SOTA results in abstractv summ
  (Lewis+ 2019b; Liu and Lapata, 2019; Song+ 2020)
  * we use mBART (Liu+ 2020) for all the baselines and our direct
    cross-lingual models

## Cross-lingual Abstractive Summarization

* Wan+ (2010) proposes summarize-then-translate and translate-then-summarize
  * summarize-then-translate is
    * computationally less expensive since it translates only the summary
    * less prone to error propagation from translation systems
    * hE, requires a large amount of training data in the low-rsc language to
  * translate-then-summarize approach relies on having an accurate translation
    system and a large amount of summarization training data in the target
* both
  * widely used
    * translate-then-summarize (Leuski+ 2003) and
    * summarize-then-translate (Lim+ 2004; Orăsan and Chiorean, 2008; Wan+ 2010)
  * prone to error propagation
* Ouyang+ (2019): a variant of translate-then-summarize
  * doing a round-trip translation of English articles through the source lang
  * train on noisy English article and clean summary pairs, which allows them
    to account for potential translation noise
* direct crosslingual summarization: limited prior work
  * Shen+ (2018) propose zero-shot cross-lingual headline generation
    * generate Chinese headlines for English articles, via a
    * teacher-student framework, using two teacher models
  * Duan+ (2019): a similar approach for cross-lingual abstractive sentence summ
    * our approach is much simpler and also focuses on a different kind of
      summarization task
* Zhu+ (2019) use round-trip translation of large scale monolingual datasets
  (Hermann+ 2015; Zhu+ 2018; Hu+ 2015) to generate synthetic training data
  * multi-task model to learn both translation and cross-lingual summarization
  * We tried their approach on our data, using the code provided, but the
    results were worse than all baselines except lead
    * this may be due to the amount of training data, as
      their synthetic dataset was much larger than ours (1.69M pairs for Zh-En)
  * An extension of their approach would be to
    incorporate multi-task training for pre-trained mBART, which we leave for fu
* prior work limited to a few languages, and mostly in the news domain
  (Wan+ 2010; Wan, 2011; Yao+ 2015; Zhang+ 2016; Wan+ 2019)
  * Nguyen and Daumé III, (2019) address this, but the proposed dataset is still
    limited in size, and contains summaries only in English

# 7 Conclusion

* future work: multi-source cross-lingual summarization architectures, i.e,
  models that can summarize from multiple source languages in to a target lang
* explore the feasibility of multilingual summarization, i.e. building models
  that summarize articles from any language to any other language
