The Skipped Beat: A Study of Sociopragmatic Understanding in LLMs for 64 Languages
Chiyu Zhang, Khai Duy Doan, Qisheng Liao, Muhammad Abdul-Mageed
EMNLP 2023 Main conference

https://github.com/UBC-NLP/SPARROW

* Instruction tuned large language models (LLMs), such as ChatGPT, demonstrate
* cross-lingual sociopragmatic meaning (SM)
  * ie meaning embedded within social and interactive contexts. This deficiency
  * not adequately represented in any of the existing benchmarks. To address
* we present SPARROW, an extensive multilingual benchmark specifically for SM
  * 169 datasets covering 13 task types across six 
  * 6 primary categories (eg anti-social language detection, emotion recog).
  * 64 languages originating from 12 language families representing 16 writing
* evaluation of various 
  * multilingual pretrained language models (eg mT5) and
  * instruction-tuned LLMs (eg BLOOMZ, ChatGPT) on SPARROW through 
  * fine-tuning, zero-shot, and/or few-shot learning. Our comprehensive
* existing open-source instruction tuned LLMs still struggle to understand SM
  across various languages
  * close to a random baseline in some cases. We also find that 
  * ChatGPT outperforms many LLMs
  * hE it still falls behind task-specific finetuned models with a gap of 12.19
    SPARROW score. Our benchmark is available at: this https URL 

# 1 Intro

# 2 Related Work

## Evaluation of LLMs. There have been many at- tempts to evaluate ChatGPT and
instruction tuned LLMs. Qin et al. (2023); Laskar et al. (2023);

### Sociopragmatic Meaning Benchmarks. Many previous works introduce unified
benchmarks such as GLUE (Wang et al., 2019), SentE-

# 3 SPARROW Benchmark

* Inspired by previous evaluation benchmarks like GLUE (Wang+, 2019), 
  we define a global metric called SPARROW score, which represents the
  unweighted average of all dataset-specific metrics.  The SPARROW score
  * an overall indication of performance on SM tasks

## 3.1 Task Clusters

## 3.2 Preprocessing, Splits, and Metrics

## 5.2 Results

* tab 3: aggregated performance of Test-S on each task and main category
* test results on all datasets and compare to dataset-specific SoTA performance
  in Tables 17, 18, 19, 20, 21, and 22 in Appendix.

### 5.2.1 Overall performance over different models? 

* All the fully finetuned models surpass 
  the zero-shot generative models as well as ChatGPT, as shown in Table 3. The
* most superior among the finetuned models is InfoDCL, which achieves SPA 71.60 
  * outperforms ChatGPT with 11.56 points SPARROW score. On the other hand, the
* open-source models (ie BLOOM, mT5 and LLaMA) still close to a random baseline.
* instruction tuned multilingual LLMs (BLOOMZ and mT0) only slightly > random

### 5.2.2 Instruction tuning can enhance LLMs’ ability on SM understanding, but

* it depends on the instruction training data. Following instruction tuning 
* on the English-only P3 dataset, 
  * BLOOMZ-P3 demonstrates an improvement of 7.76 SPARROW compared to BLOOM
  * BLOOMZ improves 5.85 points over BLOOM (but falls short of BLOOMZ-P3).  
  * MT0 also outperforms mT5. However, there remains a 
  * substantial gap between all instruction tuned models and finetuned models.
  * BLOOMBactrian performs worse than BLOOMZ and BLOOMZ-P3, which are
    instruction tuned with NLP tasks. This indicates that 
  * ie the general purpose instruction-response dataset is not very useful for SM

* we compare BLOOM with BLOOMZ-P3 and BLOOMZ in terms of individual tasks,
  * sentiment analysis to exhibit the most significant improvement
  * BLOOMZ-P3 and BLOOMZ achieve a sentiment score improvement of 16.37 and
    12.36, respectively, based on average calculation across 77 sentiment
    analysis datasets.  However, BLOOMBactrian obtains an improvement of only
    1.79 sentiment score, perhaps implying that the Bactrian
    instruction-response data is not all that useful for some SM tasks. After
    tuning mT5 on xP3 dataset, mT0 also experiences a 13.88 improvement in the
  * may be stemming from inclusion of five English sentiment analysis datasets
    in both P3 and xP3 during the training phase. For example, we observe that
    BLOOM, BLOOMZ, BLOOMZ-P3, mT5, and mT0 obtain an accuracy of 56.4, 92.2,
    93.00, 49.00, and 76.8 on SentengSoc (not included in either xP3 or P3),
    * BLOOM-Bactrian still performs poorly (accuracy= 53.60) after instruction

### 5.2.3 How do LLMs perform across different SM tasks? They are 

* inferior at humor and antisocial language detection while being 
* relatively better at sentiment and emotion recognition tasks.  
* BLOOMZ-P3, BLOOMZ, and mT0 exhibit considerable enhancements (> 5 points) on
  sentiment and emotion when compared to their respective initialization
* instruction tuned models perform significantly worse
  on aggressive language detection and humor detection tasks
  * BLOOMZ-P3, BLOOMZ, BLOOM-Bactrian, and mT0 all incur a loss of more than 5
    points on these two tasks
  * Upon investigating the predictions: many false negatives
    predictions. For a concrete example, we show that BLOOMZ-P3 predict most
* ChatGPT outperforms the open-source LLMs on all tasks except dangerous
  language detection
  * Compared to InfoDCL, we find gaps favoring InfoDCL in subjectivity analysis
    (a difference of 9.47), emotion recognition (a difference of 10.68), and
    irony & sarcasm detection (a difference of 10.70).  ChatGPT also 
  * largely lags behind InfoDCL in humor detection (a difference of 15.40) and
    antisocial language detection (a difference of 14.06). As the example shows
    * makes more false positive errors (classifies non-hateful as hateful).

### 5.2.4 How do LLMs perform across different languages? (instruction finet)

* we calculate the average language scores across all datasets within a lang
  * each language contains different tasks and datasets, no direct comparison
  * we compare the relative performance between different models for each lang
* comparing the instruction tuned models to their initial models, we observe
  * most languages experience improvement. However, we also observe a
  * significant decline in performance for the Amharic (amh) dataset among
    * BLOOMZ-P3, BLOOMZ, and mT0 experience a deterioration of 36.07, 24.99,
    * may be attributed to catastrophic forgetting after instruction tuning,
      * Amharic was not included in the training set and does not share the
      * different writing scripts with the other included languages.
  * Filipino (fil) tasks exhibit an average decline of approximately 11
    points on both BLOOMZ-P3 and BLOOMZ, as Filipino is not included in the xP3
  * Hindi is included in the xP3 dataset, the three instruction tuned models
    still show a decline in performance
    * Upon examining the individual performance of Hindi datasets, we find that
      * major deteriorations in the aggressive language detection and humor
      * emotion recognition and sentiment analysis tasks show improvement
* The instruction-response data for training Alpaca and Vicuna models consist
  solely of English language
  => we compare the performance of Alpaca and Vicuna to that of LLaMA using
  both English and non-English datasets. We observe that 
  * Alpaca and Vicuna outperform LLaMA when evaluated on English datasets,
  * hE, their performance declines when tested on non-English datasets,
* Compared to task-specific InfoDCL, ChatGPT performs poorly in 63 out of 64
  languages, sometimes with a large gap (eg 45.06 lower on Amharic, 38.67
  lower on Malayalam, and 36.91 lower on Buginese), as Table 4 shows.
* how different models perform on SM tasks across various languages. Re-
  * fig 4: hate speech detection (top) and humor detection (bottom), are
  * the average score of each language is obtained
  * The relative gain of each model against the random baseline is shown,
  * InfoDCL is the best model across various tasks and languages, with the
    exception of hate speech in Polish where ChatGPT outperforms it. As Figure
  * ChatGPT performs better for Western languages on hate speech detection.  We
  * wider gaps in hate speech detection between ChatGPT and InfoDCL
    on Arabic and Korean
  * ChatGPT demonstrates satisfactory performance in English humor, it remains
    at significant distance behind InfoDCL in Hindi humor.

### 5.2.5 Machine translated prompts help LLMs? Not in general

* but they do help in a few cases. We find, in Table 3, that the SPARROW
* ChatGPT with machine translated prompts is 6.14 points lower than ChatGPT
  with English prompts. Meanwhile, 
  * a few tasks such as humor and sarcasm acquire improvements.  We also observe
* a similar pattern for BLOOMZ and mT0, as Table 3 shows
* The low-resource languages with non-Latin scripts experience more drops in
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
  terms of detecting SM, a translate-then-detect approach may be possible.

### 5.2.8 How do open-source LLMs perform with few-shot in-context learning? As

* Table 6 compares three-shot and five-shot results with zero-shot results.
* few-shot learning does enhance the performance of BLOOM, mT5, LLaMA, and
  Vicuna
* With the increasing number of shots, the performance of LLaMA and Vicuna
  increases. Vicuna obtains SPARROW scores of 29.36, 39.44, and 41.97
  with zero, three, and five shots, respectively
* hE BLOOMZ-P3 and mT0 do not improve with few-shot learning
  * We suspect this is because the instruction finetuning of these two models
    only uses a zero-shot template that hurts their few-shot learning
  * they are also different from BLOOM and LLaMA in that they are finetuned on
    several NLP tasks only one of which is an SM task (ie sentiment analysis).

### 5.2.9 Are the open-source LLMs sensitive to prompts used? We carry out a

* We curate 55 datasets across four tasks from SPARROW and evaluate six models
  with the prompts we used for evaluating ChatGPT. As Table 24 in Appendix
* BLOOM, LLaMA, and Vicuna incur sizable performance drops (> 6 points)
* BLOOMZ-P3, mT5, and mT0 demonstrate performance levels akin to previous ones
