The Skipped Beat: A Study of Sociopragmatic Understanding in LLMs for 64 Langs
Chiyu Zhang, Khai Duy Doan, Qisheng Liao, Muhammad Abdul-Mageed
EMNLP 2023 Main conference

https://github.com/UBC-NLP/SPARROW

# Abstract

* Instruction tuned large language models (LLMs), such as ChatGPT
* cross-lingual sociopragmatic meaning (SM)
  * = meaning embedded within social and interactive contexts
  * not adequately represented in any of the existing benchmarks
* we present SPARROW, an extensive multilingual benchmark specifically for SM
  * 169 datasets covering 13 task types
  * 6 primary categories (eg anti-social language detection, emotion recog)
  * 64 languages from 12 language families representing 16 scripts
* evaluation
  * of various
    * multilingual pretrained language models (eg mT5) and
    * instruction-tuned LLMs (eg BLOOMZ, ChatGPT) on SPARROW
    * fine-tuning, zero-shot, and/or few-shot learning
  * results
    * open-source instruction tuned LLMs struggle to understand SM multiling
    * close to a random baseline in some cases
    * ChatGPT outperforms many LLMs
    * hE it still falls behind task-specific finetuned models (gap = 12.19)

# 1 Intro

* Multilingual LLMs recently (Xue+, 2021; Scao+, 2022)
  * instruction tuning and reinforcement learning from human feedback (RLHF)
    (Ouyang+, 2022) have enhanced the zero-shot generalization
  * ChatGPT exhibits impressive capabilities in this regard
  * what we call sociopragmatic meaning (SM)
    * some forms of meaning are deeply embedded in social interactions
    * sociolinguistics: social varia related to lang users (Tagliamonte, 2015)
    * pragmatics: communicative intentions (Boxer and Cortés-Conde, 2021)
    * quite established within linguistics, hE NLP systems still struggle
    * intertwined in social and interactive cont (Zhang and Abdul-Mageed, 2022)
* evaluate how instruction tuned models eg ChatGPT can capture SM across langs
  * needed: datasets under standardized conditions, easy to replicate
  * fair model comparisons and reproducibility
  * hE Most existing benchmarks focus on the monolingual setting
    * en: GLUE (Wang+, 2019), SentEval (Conneau and Kiela, 2018), and
      TweetEval (Barbieri+, 2020) for English,
    * Arabic
      * ARLUE (Abdul-Mageed+, 2021)
      * CLUE (Xu+, 2020a) for Chinese,
      * IndoNLU (Wilie+, 2020) for Indonesian
    * multilingual: XTREME (Hu+, 2020) and XGLUE (Liang+, 2020)
      * hE only a few SM tasks for a limited number of languages
      * They are also limited to standard language use (eg Wikipedia)
    * multiling sentiment analysis: UMSAB (Barbieri+ 2022), tweets in 8 langs
    * ie no unified, diverse, and comprehensive benchmark
* data inaccessibility (Assenmacher+, 2022)
  * many studies release the IDs of posts (eg tweets)
  * hE substantial amounts of these social posts become inaccess (Zhang+, 2022)
  * we attempt to re-collect text contents of 25 datasets by using their IDs
    * we can only retrieve 58% samples on average (see Table 8 in Appendix)
  * hinders fair comparisons in NLP for SM research.  This issue has already
  * become worse as corporations such as Twitter tighten access to their API,
* we introduce SPARROW, a massively multilingual SM evaluation benchmark,
  * 169 datasets covering 64 languages from 12 language families, 16 scripts,
  * diverse online platforms (eg Twitter, YouTube, and Weibo)
  * extensive evaluation of ChatGPT in comparson to 13 other models
    * size between 110M--7B parameters
  * we answer some questions related to how that LLMs fare across languages
  * leaderboard to facilitate future comparisons; modular, interactive

* tab 1: Zhong+ (2023) Qin+ (2023) Ahuja+ (2023) Laskar+ (2023) Bang+ (2023)
  Lai+ (2023) Das+ (2023) Wang+ (2023) Zhang+ (2023b) Ziems+ (2023)

* contributions
  * We collect, uniformize, and responsibly release massively multilingual SM
    datasets in a new benchamark;
  * SPARROW is essentially an archive of SM datasets
    * alleviates the serious issue of data decay;
  * We evaluate a wide range of models on our SPARROW benchmark via
    * fine-tuning SoTA encoder-only pretrained language models
    * zero-shot learning of a number of generative models, including
      instruction tuned models (eg BLOOMZ) as well as ChatGPT
  * We establish standard settings for future research in this area
    across a large number of languages and tasks

# 2 Related Work

## Evaluation of LLMs, ChatGPT and instruction tuned LLMs

* English evaluation benchmarks for various NLP tasks
  * Qin+ (2023); Laskar+ (2023); Zhong+ (2023); Wu+ (2023)
  * eg GLUE (Wang+, 2019) and BigBench (Srivastava+, 2022)
  * ChatGPT performs less effectively than the models finetuned specifically
  * nL superior capabilities compared to other instruction tuned LLMs
    * eg FLAN (Chung+, 2022)
* multilingual benchmarks
  * Ahuja+ (2023); Bang+ (2023); Laskar+ (2023); Lai+ (2023); Huang+ (2023)
  * benchmarks: eg XNLI, PAWS-X, XLSum involving monolingual NLP tasks and
    crosslingual tasks (eg machine translation)
  * large gap in performance of instruction tuned LLMs and ChatGPT,
    * especially on low-resource languages and those with non-Latin scripts
* SM is still not adequately represented in existing benchmarks
  * Table 1: benchmarks used for listed evaluations only include a few SM tasks
    focusing on sentiment analysis
  * Wang+ (2023); Zhang+ (2023b) investigate LLMs on a number of SM tasks
    * eg offensive language detection), but only on English
  * Ziems+ (2023) investigate ChatGPT performance on a range of comp soc sci
    * eg sociology, psychology, and linguistics, but only on English
  * Das+ (2023) evaluate ChatGPT on hate speech detection to 11 languages

## Sociopragmatic Meaning Benchmarks

* unified benchmarks: GLUE (Wang+, 2019), SentEval (Conneau and Kiela, 2018),
  XTREME (Hu+, 2020), and XGLUE (Liang+, 2020)
  * a wide range of NLP tasks, hE !1 SM task (ie sentiment)
* benchmarks focusing on SM
  * Barbieri+ (2020) introduce TweetEval benchmark that contains
    seven English datasets of six SM tasks
  * SentiEval (Zhang+ 2023b)
    * 26 English datasets of 13 sentiment-related tasks
* Beyond English
  * sentiment: NusaX (Winata+, 2022), NaijaSenti (Muhammad+, 2022), and
    AfriSenti (Muhammad+, 2023a)
    * 8 Indonesian languages, 4 African languages, and 14 African langs resp
  * UMSAB introduced by Barbieri+ (2022) contains
    * 11 sentiment analysis datasets in 11 languages
  * detecting antisocial online comments, Risch+ (2021) introduces a
    toxic comment collection that contains 43 datasets of
    six antisocial detection tasks in 14 languages
* Figure 1 for a comparison

# 3 SPARROW Benchmark

* 13 types of tasks in six main categories, 169 datasets
* from a wide period of time (1986-2022)
* We group different tasks in our benchmark
  * hate speech, offensive language, and dangerous language detection as
    anti-social language detection
* we keep sentiment analysis and emotion recognition distinct due to the popul
* Table 2 summarizes statistics of SPARROW
  * more information about languages in SPARROW in Table 7 of the Appendix
  * detailed descriptions with full citations of all our datasets in Tabs 9--14
* aggregated metric
  * Inspired by previous evaluation benchmarks like GLUE (Wang+ 2019)
  * we define a global metric called SPARROW score, which represents
    the unweighted average of all dataset-specific metrics
  * an overall indication of performance on SM tasks
  * may be dominated by the largest task cluster (ie, sentiment analysis)
    or languages (e.g., languages from Indo-European language family)

## 3.1 Task Clusters

### Antisocial Language Detection

* proliferation of antisocial language (eg hate speech)
  toxifies public discourse, incites violence, and undermines civil society
  (Sap+, 2019; Vidgen and Derczynski, 2020).  Antisocial language detection is
* We include under the umbrella of antisocial language the following:
  * aggressive language (Kumar+, 2018),
  * dangerous language (Alshehri+, 2020),
  * hate speech (eg Waseem and Hovy (2016); Deng+ (2022)),
  * offensive language (eg Mubarak+ (2020); Kralj Novak+ (2021)),
  * offense type identification (eg Zampieri+ (2019)), and
  * offense target identification (eg Ousidhoum+ (2019); Jeong+ (2022))

### Emotion Recognition

* Emotion affects our decision-making as well as mental and physical health
  (Abdul-Mageed and Ungar, 2017)
* SPARROW includes 26 emotion datasets in 17 languages
  * eg Kajava (2018); Bianchi+ (2021)

### Humor Detection

* Humor is a type of figurative language which induces
  amusing effects, such as laughter or well-being sensations
* We include four humor detection datasets in four languages
  (eg Blinov+ (2019); Meaney+ (2021))

### Irony & Sarcasm Detection

* Irony and sarcasm also involve figurative language
  * intentionally uses diametric language to signify implied meaning
* We include
  * nine irony detection datasets in seven languages (eg Xiang+ (2020)),
  * ten sarcasm detection datasets in four languages (eg Walker+ (2012)), and
  * an irony type identification dataset (Van Hee+, 2018)

### Subjectivity and Sentiment Analysis

* Subjectivity analysis aims to understand the opinions, feelings, judgments,
  and speculations expressed via language (Abdul-Mageed+, 2014)
  * Our benchmark includes six subjectivity analysis datasets in 5 languages
    (eg Pang and Lee (2004); Pribán and Steinberger (2022))
* Subjectivity incorporates sentiment
  * Sentiment analysis (Poria+, 2020) is one of the most popular tasks in SM
  * Our benchmark contains 77 sentiment analysis datasets in 58 languages
    (eg Pang and Lee (2005); Marreddy+ (2022))

## 3.2 Preprocessing, Splits, and Metrics

# 4 Evaluation Methods

## 4.1 Finetuning on Encoder-Only Models

* We evaluate the following Transformer-encoder-based multilingual models on
  * Multilingual-BERT (mBERT, Devlin+, 2019, Base, 110M parameters),
  * XLM-RoBERTaBase (XLM-R, Conneau+, 2020, 270M parameters),
  * Bernice (DeLucia+, 2022), a 270M-parameter model trained with 2.5B tweets
    in 66 languages, and
  * InfoDCL (Zhang+, 2023a), a SoTA for SM understanding, which
    * further trains XLM-R with 100M tweets in 66 languages
      with contrastive learning
* More details about all models are in Appendix B

## 4.2 Zero~ and Few-Shot on LLMs

* We investigate zero-shot performance on a wide range of generative models,
  including pre-trained generative models:
  * BLOOM (Scao+, 2022),
  * mT5 (Xue+, 2021),
  * LLaMA (Touvron+, 2023),
* instruction tuned models:
  * BLOOMZ (Scao+, 2022), a BLOOM-initialized model
    tuned with multi-lingual xP3 corpus,
  * BLOOMZ-P3 (Muennighoff+, 2022), a BLOOM-initialized model
    tuned with English-only P3 corpus,
  * BLOOM-Bactrian (Li+, 2023), a BLOOM-initialized model
    tuned with 3.4M instruction-following samples in 52 languages,
  * mT0 (Muennighoff+, 2022), an mT5 model tuned with xP3 corpus,
  * Alpaca (Taori+, 2023), a LLaMA-initialized model
    tuned with 52K English instruction-following samples,
  * Vicuna (Chiang+, 2023), a LLaMA-initialized model on 70K conversat data
  * ChatGPT, for which we use the gpt-3.5-turbo-0301 version via OpenAI API.2
* details
  * We use 7B-size version of BLOOM~ and LLaMA-based models and
  * 4B-size version of mT5-based models. We also evaluate
* six open-source LLMs (i.e, BLOOM, BLOOMZ-P3, mT5, mT0, LLaMA, and Vicuna) via
  few-shot in-context learning

# 5 Experiments 5

## 5.1 Implementation

## 5.2 Results

* tab 3: aggregated performance of Test-S on each task and main category
* test results on all datasets and comparison to dataset-specific SoTA perf:
  Tables 17--22 in Appendix

### 5.2.1 Overall performance over different models?

* All the fully finetuned models surpass
  the zero-shot generative models as well as ChatGPT, as shown in Table 3
* most superior among the finetuned models is InfoDCL, which achieves SPA 71.60
  * outperforms ChatGPT with 11.56 points SPARROW score
* open-source models (ie BLOOM, mT5 and LLaMA) still close to a random baseline
* instruction tuned multilingual LLMs (BLOOMZ and mT0) only slightly > random

### 5.2.2 Instruction tuning can enhance LLMs’ ability on SM understanding, but

* it depends on the instruction training data
* on the English-only P3 dataset,
  * BLOOMZ-P3 demonstrates an improvement of 7.76 SPARROW compared to BLOOM
  * BLOOMZ improves 5.85 points over BLOOM (but falls short of BLOOMZ-P3)
  * MT0 also outperforms mT5
  * substantial gap between all instruction tuned models and finetuned models
  * BLOOMBactrian performs worse than BLOOMZ and BLOOMZ-P3, which are
    instruction tuned with NLP tasks
  * ie the general purpose instruction-response dataset is
    not very useful for SM
* we compare BLOOM with BLOOMZ-P3 and BLOOMZ in terms of individual tasks,
  * sentiment analysis to exhibit the most significant improvement
  * BLOOMZ-P3 and BLOOMZ achieve a sentiment score improvement of 16.37 and
    12.36, respectively, based on average calculation across 77 sentiment
    analysis datasets
  * BLOOMBactrian obtains an improvement of only 1.79 sentiment score, perhaps
    * ie the Bactrian instruction-response data is not all that useful for some
      SM tasks
  * After tuning mT5 on xP3 dataset, mT0 also experiences a 13.88 improvement
  * may be stemming from inclusion of five English sentiment analysis datasets
    in both P3 and xP3 during the training phase. For example, we observe that
    BLOOM, BLOOMZ, BLOOMZ-P3, mT5, and mT0 obtain an accuracy of 56.4, 92.2,
    93.00, 49.00, and 76.8 on SentengSoc (not included in either xP3 or P3),
    * BLOOM-Bactrian still performs poorly (accuracy= 53.60) after instruction

### 5.2.3 How do LLMs perform across different SM tasks?

* inferior at humor and antisocial language detection
* relatively better at sentiment and emotion recognition tasks
* BLOOMZ-P3, BLOOMZ, and mT0 exhibit considerable enhancements (> 5 points) on
  sentiment and emotion when compared to their respective initialization
* instruction tuned models perform significantly worse
  on aggressive language detection and humor detection tasks
  * BLOOMZ-P3, BLOOMZ, BLOOM-Bactrian, and mT0 all incur a loss of > 5 points
    on these two tasks
  * Upon investigating the predictions: many false negatives
* ChatGPT outperforms the open-source LLMs on all tasks except dangerous lang
  * Compared to InfoDCL, we find gaps favoring InfoDCL in
    subjectivity analysis (a difference of 9.47), emotion recognition (10.68),
    and irony & sarcasm detection (a difference of 10.70)
  * largely lags behind InfoDCL in humor detection (a difference of 15.40) and
    antisocial language detection (a difference of 14.06)
    * makes more false positive errors (classifies non-hateful as hateful)

### 5.2.4 How do LLMs perform across different languages? (instruction fineted)

* we calculate the average language scores across all datasets within a lang
  * each language contains different tasks and datasets, no direct comparison
  * we compare the relative performance between different models for each lang
* comparing the instruction tuned models to their initial models, we observe
  * most languages experience improvement
  * significant decline in performance for the Amharic (amh) dataset among
    * BLOOMZ-P3, BLOOMZ, and mT0 experience a deterioration of 36.07, 24.99,
    * may be attributed to catastrophic forgetting after instruction tuning,
      * Amharic was not included in the training set
      * different writing scripts from the other included languages
  * Filipino (fil) tasks exhibit an average decline of approx 11 points
    on both BLOOMZ-P3 and BLOOMZ, as Filipino is not included in the xP3
  * Hindi is included in the xP3 dataset
    * hE the three instruction tuned models still show a decline in performance
    * Upon examining the individual performance of Hindi datasets, we find that
      * major deteriorations in the aggressive language detection and humor
      * emotion recognition and sentiment analysis tasks show improvement
* The instruction-response data for training Alpaca and Vicuna models consist
  solely of English language
  => we compare the performance of Alpaca and Vicuna to that of LLaMA using
  both English and non-English datasets
  * Alpaca and Vicuna outperform LLaMA when evaluated on English datasets,
  * hE, their performance declines when tested on non-English datasets,
* Compared to task-specific InfoDCL, ChatGPT performs poorly in 63 out of 64
  languages, sometimes with a large gap (eg 45.06 lower on Amharic, 38.67
  lower on Malayalam, and 36.91 lower on Buginese), as Table 4 shows
* how different models perform on SM tasks across various languages
  * fig 4: hate speech detection (top) and humor detection (bottom)
  * the average score of each language is obtained
  * The relative gain of each model against the random baseline is shown
  * InfoDCL is the best model across various tasks and languages, with the
    exception of hate speech in Polish where ChatGPT outperforms it
  * ChatGPT performs better for Western languages on hate speech detection
  * wider gaps in hate speech detection between ChatGPT and InfoDCL
    on Arabic and Korean
  * ChatGPT demonstrates satisfactory performance in English humor, it remains
    at significant distance behind InfoDCL in Hindi humor

### 5.2.5 Machine translated prompts help LLMs? Not in general

* but they do help in a few cases. Table 3
* ChatGPT with machine translated prompts is 6.14 points lower than ChatGPT
  with English prompts. Meanwhile,
  * a few tasks such as humor and sarcasm acquire improvements
* a similar pattern for BLOOMZ and mT0, as Table 3 shows
* The low-resource languages with non-Latin scripts experience more drops
  * in line with findings by Lai+ (2023)
  * Hebrew (heb) and Greek (ell) get the largest perf drops (> 25), tab 4

### 5.2.7 Translating input samples into English can help improve ChatGPT

* we use the non-English part of GPTHard (16 datasets)
* We translate these test samples into English using ChatGPT and subsequently
  employ the translated text and English prompt for classification. As
* Table 5 shows, we acquire a noteworthy enhancement in ChatGPT’s performance
  (McNemar’s test with α < 0.01) when using the translated input. We also ob-
  * ChatGPT is able to surpass GPT4 with the original inputs in three datasets
    (ie HatearaAla , Hate-spaBas , Hate-araMub )
* suggest that although ChatGPT has inferior ability on several languages in
  terms of detecting SM, a translate-then-detect approach may be possible

### 5.2.8 How do open-source LLMs perform with few-shot in-context learning?

* Table 6 compares three-shot and five-shot results with zero-shot results
* few-shot learning does enhance the perf of BLOOM, mT5, LLaMA, and Vicuna
* With the increasing number of shots, the performance of LLaMA and Vicuna
  increases. Vicuna obtains SPARROW scores of 29.36, 39.44, and 41.97
  with zero, three, and five shots, respectively
* hE BLOOMZ-P3 and mT0 do not improve with few-shot learning
  * We suspect this is because the instruction finetuning of these two models
    only uses a zero-shot template that hurts them in few-shot learning
  * they are also different from BLOOM and LLaMA in that they are finetuned on
    several NLP tasks only one of which is an SM task (ie sentiment analysis)

### 5.2.9 Are the open-source LLMs sensitive to prompts used?

* We curate 55 datasets across four tasks from SPARROW and evaluate six models
  with the prompts we used for evaluating ChatGPT. As Table 24 in Appendix
* BLOOM, LLaMA, and Vicuna incur sizable performance drops (> 6 points)
* BLOOMZ-P3, mT5, and mT0 demonstrate performance levels akin to previous ones

# 6 Public Leaderboard 9

* interactive and offers rich metadata about the various datasets in our bench-
* users can submit information about their models
  (eg number of params, time to convergence, pretraining datasets)
* also a new modular toolkit for fine-tuning or evaluating models on SPARROW

# 7 Conclusion

# 8 Limitations 10

## Benchmark Construction

* we plan to extend SPARROW to more types of tasks related to SM, such as
  * span-based sentiment analysis (Xu+ 2020b),
    Lu Xu, Lidong Bing, Wei Lu, and Fei Huang. 2020b
    Aspect sentiment classification with aspect-specific opinion spans. In
    EMNLP 2020b, pages 3561–3567, Online
  * affective language generation (Goswamy+ 2020), and
  * conversational sentiment analysis (Ojamaa+ 2015)
* more modalities, such affective image captioning (Mohamed+ 2022) and
  multi-modal emotion recognition (Firdaus+ 2020)
  * MEISD: A Multimodal Multi-Label Emotion, Intensity and Sentiment Dialogue
      Dataset for Emotion Recognition and Sentiment Analysis in Conversations
    Mauajama Firdaus, Hardik Chauhan, Asif Ekbal, Pushpak Bhattacharyya
    COLING 2020

## Model Selection

* future: model sizes > 7B
* commercial instruction tuned models
  * we only conduct a relatively small case study on GPT-4
  * future: more expensive (eg text-davinci-003 by OpenAI)

## Experiments: prompts

* we customize prompts employed for each task,
* we do not tailor prompts specifically for each model
* future work will test diverse prompt variations for more robust results
* translation
  * now only machine translated prompts in our analyses
  * the performance drop may stem from the poor quality of machine translation
  * future: human translated prompts
* now only zero-shot learning. The adoption of few-shot incontext learning
