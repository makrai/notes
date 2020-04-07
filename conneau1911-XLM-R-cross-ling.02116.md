XLM-R: Unsupervised Cross-lingual Representation Learning at Scale
Alexis Conneau, K Khandelwal, N Goyal, V Chaudhary, G Wenzek, F Guzmán, E Grave,
  Myle Ott, Luke Zettlemoyer, Veselin Stoyanov
arXiv:1911.02116

# Abstract

* pretraining multilingual language models at scale leads to
  significant performance gains for a wide range of cross-lingual transfer task
* a Transformer-based masked language model on one hundred languages, using
  more than two terabytes of filtered CommonCrawl data. Our model, dubbed
* significantly outperforms multilingual BERT (mBERT) on a variety of
  cross-lingual benchmarks, including +13.8% average accuracy on XNLI, +12.3%
  average F1 score on MLQA, and +2.1% average F1 score on NER.  XLM-R
* performs particularly well on low-resource languages, improving 11.8% in XNLI
  accuracy for Swahili and 9.2% for Urdu over the previous XLM model
* We [ empirically evaluate ] the key factors that are required to achieve this
  * trade-offs between
    * positive transfer and capacity dilution and
    * the performance of high and low resource languages at scale. Finally, we
* very competitive with strong monolingual models on the GLUE and XNLI
* code, data, and models publicly available
* conclusion: and the importance of key hyperparameters

# 1 Intro

* goal of this paper is to improve cross-lingual language understanding (XLU),
  by carefully studying the effects of training
  unsupervised crosslingual representations at a very large scale. We present
* XLM-R, a transformer-based multilingual masked language model pre-trained on
  * 100 languages, which obtains SOTA performance on cross-lingual
    classification, sequence labeling and question answering
* Multilingual masked language models (MLM, large Transformer models (Vaswani)
  * mBERT (Devlin+ 2018) and
  * XLM (Lample and Conneau, 2019) have pushed the SOTA on cross-lingual NLU
* effective in cross-lingual
  * natural language inference (Bowman+ 2015; Williams+ 2017; Conneau+ 2018)
  * question answering (Rajpurkar+ 2016; Lewis+ 2019)
  * and named entity recognition (Pires+ 2019; Wu and Dredze, 2019)
* limited scale: all of these studies pre-train on Wikipedia, which provides a
  * especially for lower resource languages
* we first present a comprehensive analysis of the
  trade-offs and limitations of multilingual language models at scale,
  * inspired by recent monolingual scaling efforts (Liu+ 2019)
  * trade-off between high-resource and low-resource languages and the
  * impact of language sampling and vocabulary size. The experiments expose a
    trade-off as we scale the number of languages for a fixed model capacity:
    * more languages leads to better cross-lingual performance on low-resource
      languages up until a point, after which the overall performance on
      monolingual and cross-lingual benchmarks degrades. We refer to this
  * the curse of multilinguality, and show that it
  * can be alleviated by simply increasing model capacity. We argue, however,
* Our best model XLM-RoBERTa (XLM-R) outperforms mBERT on cross-lingual
  * classification by up to 21% accuracy on low-resource languages like Swahili
    and Urdu
  * XNLI: It outperforms the previous SOTA by 3.9% average accuracy
  * 2.1%average F1-score on Named Entity Recognition, and
  * 8.4% average F1-score on cross-lingual Question Answering. We also evaluate
* monolingual fine tuning on the GLUE and XNLI benchmarks, where XLM-R obtains
  * competitive with SOTA monolingual models, including RoBERTa (Liu+ 2019)

# 2 Related Work

* transformer based language models (Radford+ 2018; Devlin+ 2018), unsupervised
  * cross-lingual understanding
    (Mikolov+ 2013a; Schuster+ 2019; Lample and Conneau, 2019) extends these
  * mBERT (Devlin+ 2018) and XLM (Lample and Conneau 2019) introduced mBERT and
    * masked language models trained on multiple languages,
      without any cross-lingual supervision
  * Lample and Conneau (2019) propose translation language modeling (TLM) as a
    way to leverage parallel data and obtain a new SOTA on XNLI benchmark
    (Conneau+ 2018).  They further show strong improvements on
  * unsupervised machine translation and pretraining for sequence generation
  * effectiveness of mBERT on sequence labeling tasks (Pires+ 2019)
  * cross-lingual multi-task learning: Huang+ (2019) showed gains over XLM
  * cross-lingual data augmentation for cross-lingual NLI
    * Singh+ (2019) demonstrated the efficiency of
  * relatively modest scale, in terms of the amount of training data
* scaling language model pretraining (size of the model and the training data)
  * monolingual case, Jozefowicz+ (2016) show how large-scale LSTM models can
    * language modeling benchmarks when trained on billions of tokens
  * GPT (Radford+ 2018) also highlights the importance of scaling the data and
  * RoBERTa (Liu+ 2019) shows that training BERT longer on more data leads to
  * we show that mBERT and XLM are undertuned, and that simple improvements in
    * cleaned CommonCrawls (Wenzek+ 2019), which
      increase the amount of data for low-resource languages by two orders of m
  * Similar data has also been shown to be effective for learning high quality
    word embeddings in multiple languages (Grave+ 2018)
* massively multilingual machine translation models from large parallel corpora
  * high and low resource trade-off and the problem of capacity dilution
    (Johnson+ 2017; Tan+ 2019). The work
  * most similar to ours is Arivazhagan+ (2019), which trains a single model in
    103 languages on over 25 billion parallel sentences
  * Siddhant+ (2019) further analyze the representations obtained by the
    encoder of a massively multilingual machine translation system and show
    that it obtains similar results to mBERT on cross-lingual NLI

# 3 Model and Data

* In this section, we present the training objective, languages, and data we use
* We follow the XLM approach (Lample and Conneau, 2019) as closely as possible,

## Masked Language Models. We use a Transformer model (Vaswani+ 2017)
trained with the multilingual MLM objective (Devlin+ 2018; Lample and
Conneau, 2019) using only monolingual data. We sample streams of text from each
language and train the model to predict the masked tokens in the input. We
apply subword tokenization directly on raw text data using Sentence

Piece (Kudo and Richardson, 2018) with a unigram language model (Kudo, 2018)
We sample batches10 2

Figure 1: Amount of data in GiB (log-scale) for the 88 languages that appear in
both the Wiki-100 corpus used for

XLM-100, and the CC-100 used for XLM-R. CC-100 increases the amount of data by
several orders of magnitude, in particular for low-resource languages.  from
different languages using the same sampling distribution as Lample and Conneau
(2019), but with α = 0.3. Unlike Lample and Conneau (2019), we do not use
language embeddings, which allows our model to better deal with code-switching
We use a large vocabulary size of 250K with a full softmax and train two
different models: XLM-R Base (L = 12, H = 768, A = 12, 270M params) and XLM-R
(L = 24, H = 1024, A = 16, 550M params). For all of our ablation studies, we
use a BERT Base architecture with a vocabulary of 150K tokens. Appendix B
goes into more details about the architecture of the different models
referenced in this paper

## Scaling to a hundred languages. XLM-R is trained on 100 languages; we

* languages and associated statistics in Appendix A.  Figure 1 specifies the
  iso codes of 88 languages that are shared across XLM-R and XLM-100, the model
  from Lample and Conneau (2019) trained on Wikipedia text in 100 languages
* we replace some languages with more commonly used ones such as
  * romanized Hindi and traditional Chinese. In our
  * ablation studies [on] the 7 languages for which we have classification and
    sequence labeling evaluation benchmarks: en fr de ru zh sw ur
    * a suitable range of language families and includes low-resource languages
  * larger sets of 15, 30, 60 and all 100 languages.  When reporting results on
    * high-resource = average of English and French results, and the
    * by low-resource, we refer to the average of Swahili and Urdu results

## Scaling the Amount of Training Data

* Following Wenzek+ (2019), we build a clean CommonCrawl Corpus in 100
  languages. We use an
* internal language identification model in combination with the one from
  fastText (Joulin+ 2017)
* one CommonCrawl dump for English and twelve dumps for all other languages,
  * significantly increases dataset sizes, especially for e.g. Burmese and Swah
* monolingual Wikipedia corpora are too small to enable unsupervised represent
  * As we show in Section 5.3,
* few hundred MiB of text data is usually a minimal size for learning a BERT

# 4 Evaluation

## Cross-lingual Natural Language Inference (XNLI). The XNLI dataset comes with

* 15 languages, and a ground-truth English training set. The
* training set has been machine-translated to the remaining 14 languages,
  providing synthetic training data for these languages as well
* We evaluate our model on cross-lingual transfer from English to other
  languages.  We also consider
* three machine translation baselines:
  * translate-test: dev and test sets are machine-translated to English and a
  * translate-train (per-language):
    the English training set is machine-translated to each language and we
    fine-tune a multiligual model on each training set
  * translate-train-all (multi-language): we fine-tune a multilingual model on
    the concatenation of all training sets from translate-train
    * For the translations, we use the official data provided by the XNLI proj

## Named Entity Recognition. For NER, we consider the

* CoNLL-2002 (Sang, 2002) and CoNLL2003 (Tjong Kim Sang and De Meulder, 2003)
* English, Dutch, Spanish and German
* We fine-tune multilingual models either on
  * the English set to evaluate cross-lingual transfer,
  * each set to evaluate per-language performance, or
  * all sets to evaluate multilingual learning
* We report the F1 score, and
  compare to baselines from Lample+ (2016) and Akbik+ (2018)

## Cross-lingual Question Answering: the MLQA benchmark from Lewis+ (2019),

* extends the English SQuAD benchmark to
  Spanish, German, Arabic, Hindi, Vietnamese and Chinese
* We report the F1 score as well as the exact match (EM) score for cross-ling

## GLUE Benchmark (Wang+ 2018), we evaluate the English performance

* GLUE multiple classification tasks, such as
  MNLI (Williams+ 2017), SST-2 (Socher+ 2013), or QNLI (Rajpurkar+ 2018)
* We use BERT Large and RoBERTa as baselines

# 5 Analysis and Results

In this section, we perform a comprehensive anal-
ysis of multilingual masked language models. We
conduct most of the analysis on XNLI, which we
found to be representative of our findings on other
tasks. We then present the results of XLM-R on
cross-lingual understanding and GLUE. Finally,
we compare multilingual and monolingual models,
and present results on low-resource languages.
5.1
Improving and Understanding
Multilingual Masked Language Models
Much of the work done on understanding the cross-
lingual effectiveness of mBERT or XLM (Pires
et al., 2019; Wu and Dredze, 2019; Lewis et al.,
2019) has focused on analyzing the performance of
fixed pretrained models on downstream tasks. In
this section, we present a comprehensive study of
different factors that are important to pretraining
large scale multilingual models. We highlight the
trade-offs and limitations of these models as we
scale to one hundred languages.
Transfer-dilution trade-off and Curse of Multi-
linguality. Model capacity (i.e. the number of
parameters in the model) is constrained due to prac-
tical considerations such as memory and speed dur-
ing training and inference. For a fixed sized model,
the per-language capacity decreases as we increase
the number of languages. While low-resource lan-
guage performance can be improved by adding sim-
ilar higher-resource languages during pretraining,
the overall downstream performance suffers from
this capacity dilution (Arivazhagan et al., 2019).
Positive transfer and capacity dilution have to be
traded off against each other.
We illustrate this trade-off in Figure 2, which
shows XNLI performance vs the number of lan-
guages the model is pretrained on. Initially, as we
go from 7 to 15 languages, the model is able to take
advantage of positive transfer and this improves
performance, especially on low resource languages.
Beyond this point the curse of multilinguality kicks
in and degrades performance across all languages.
Specifically, the overall XNLI accuracy decreases
from 71.8% to 67.7% as we go from XLM-7 to
XLM-100. The same trend can be observed for
models trained on the larger CommonCrawl Cor-
pus.
The issue is even more prominent when the ca-
pacity of the model is small. To show this, we
pretrain models on Wikipedia Data in 7, 30 and
100 languages. As we add more languages, we
make the Transformer wider by increasing the hid-
den size from 768 to 960 to 1152. In Figure 4, we
show that the added capacity allows XLM-30 to be
on par with XLM-7, thus overcoming the curse of
multilinguality. The added capacity for XLM-100,
however, is not enough and it still lags behind due
to higher vocabulary dilution (recall from Section 3
that we used a fixed vocabulary size of 150K for
all models).
High-resource/Low-resource trade-off. The al-
location of the model capacity across languages is
controlled by several parameters: the training set
size, the size of the shared subword vocabulary,
and the rate at which we sample training exam-
ples from each language. We study the effect of
sampling on the performance of high-resource (En-
glish and French) and low-resource (Swahili and80
70
60
50
40
15 30 60 100
Number of languages
High res.
All
Accuracy
Figure 2:
The transfer-
interference trade-off:
Low-
resource languages benefit from
scaling to more languages, until
dilution (interference) kicks in
and degrades overall performance.
80
70
60
50
40
0.01 0.3 0.7 1.0
Language sampling
Low res.
High res.
Low res. High res.
All
Figure 5: On the high-resource
versus low-resource trade-off: im-
pact of batch language sampling
for XLM-100.
Wikipedia
7
30
100
Number of languages
Fixed capacity
CommonCrawl
Figure 3: Wikipedia versus Com-
monCrawl: An XLM-7 obtains
much better performance when
trained on CC, in particular on
low-resource languages.
68
66
64
62
60
32k 64k 128k 256k 512k
Vocabulary size
Fixed capacity
Increased capacity
Figure 6: On the impact of vocabu-
lary size at fixed capacity and with
increasing capacity for XLM-100.
Urdu) languages for an XLM-100 model trained
on Wikipedia (we observe a similar trend for the
construction of the subword vocab). Specifically,
we investigate the impact of varying the α param-
eter which controls the exponential smoothing of
the language sampling rate. Similar to Lample and
Conneau (2019), we use a sampling rate propor-
tional to the number of sentences in each corpus.
Models trained with higher values of α see batches
of high-resource languages more often. Figure 5
shows that the higher the value of α, the better the
performance on high-resource languages, and vice-
versa. When considering overall performance, we
found 0.3 to be an optimal value for α, and use this
for XLM-R.
Importance of Capacity and Vocabulary Size.
In previous sections and in Figure 4, we showed
the importance of scaling the model size as we
increase the number of languages. Similar to the
overall model size, we argue that scaling the size
of the shared vocabulary (the vocabulary capacity)
can improve the performance of multilingual mod-
els on downstream tasks. To illustrate this effect,
we train XLM-100 models on Wikipedia data with
74
72
70
68
66
All
Increased capacity
Figure 4: Adding more capacity to
the model alleviates the curse of
multilinguality, but remains an is-
sue for models of reasonable size.
Accuracy
Low res.
Accuracy
Accuracy
7
Accuracy
Accuracy
80
70
60
50
40
68
66
64
62
60
2048 4096 8192 BPE SPM
Batch size
Preproc.
.
Figure 7: On the impact of large-
scale training, and preprocessing
simplification from BPE with tok-
enization to SPM on raw text data.
different vocabulary sizes. We keep the overall
number of parameters constant by adjusting the
width of the transformer. Figure 6 shows that even
with a fixed capacity, we observe a 2.8% increase
in XNLI average accuracy as we increase the vo-
cabulary size from 32K to 256K. This suggests that
multilingual models can benefit from allocating a
higher proportion of the total number of parameters
to the embedding layer even though this reduces the
size of the Transformer. With bigger models, we
believe that using a vocabulary of up to 2 million to-
kens with an adaptive softmax (Grave et al., 2017;
Baevski and Auli, 2018) should improve perfor-
mance even further, but we leave this exploration
to future work. For simplicity and given the com-
putational constraints, we use a vocabulary of 250k
for XLM-R.
We further illustrate the importance of this pa-
rameter, by training three models with the same
transformer architecture (BERT Base ) but with dif-
ferent vocabulary sizes: 128K, 256K and 512K.
We observe more than 3% gains in overall accuracy
on XNLI by simply increasing the vocab size from
128k to 512k.Importance of large-scale training with more
data. As shown in Figure 1, the Common-
Crawl Corpus that we collected has significantly
more monolingual data than the previously used
Wikipedia corpora. Figure 3 shows that for the
same BERT Base architecture, all models trained on
CommonCrawl obtain significantly better perfor-
mance.
Apart from scaling the training data, Liu et al.
(2019) also showed the benefits of training MLMs
longer. In our experiments, we observed similar
effects of large-scale training, such as increasing
batch size (see Figure 7) and training time, on
model performance. Specifically, we found that
using validation perplexity as a stopping criterion
for pretraining caused the multilingual MLM in
Lample and Conneau (2019) to be under-tuned.
In our experience, performance on downstream
tasks continues to improve even after validation
perplexity has plateaued. Combining this observa-
tion with our implementation of the unsupervised
XLM-MLM objective, we were able to improve
the performance of Lample and Conneau (2019)
from 71.3% to more than 75% average accuracy
on XNLI, which was on par with their supervised
translation language modeling (TLM) objective.
Based on these results, and given our focus on
unsupervised learning, we decided to not use the
supervised TLM objective for training our models.
Simplifying multilingual tokenization with Sen-
tence Piece. The different language-specific to-
kenization tools used by mBERT and XLM-100
make these models more difficult to use on raw
text. Instead, we train a Sentence Piece model
(SPM) and apply it directly on raw text data for
all languages. We did not observe any loss in per-
formance for models trained with SPM when com-
pared to models trained with language-specific pre-
processing and byte-pair encoding (see Figure 7)
and hence use SPM for XLM-R.
5.2
Cross-lingual Understanding Results
Based on these results, we adapt the setting of Lam-
ple and Conneau (2019) and use a large Trans-
former model with 24 layers and 1024 hidden
states, with a 250k vocabulary. We use the multi-
lingual MLM loss and train our XLM-R model for
1.5 Million updates on five hundred 32GB Nvidia
V100 GPUs with a batch size of 8192. We leverage
the SPM-preprocessed text data from Common-
Crawl in 100 languages and sample languages with
α = 0.3. In this section, we show that it out-
performs all previous techniques on cross-lingual
benchmarks while getting performance on par with
RoBERTa on the GLUE benchmark.
XNLI. Table 1 shows XNLI results and adds
some additional details: (i) the number of models
the approach induces (#M), (ii) the data on which
the model was trained (D), and (iii) the number of
languages the model was pretrained on (#lg). As
we show in our results, these parameters signifi-
cantly impact performance. Column #M specifies
whether model selection was done separately on
the dev set of each language (N models), or on
the joint dev set of all the languages (single model).
We observe a 0.6 decrease in overall accuracy when
we go from N models to a single model - going
from 71.3 to 70.7. We encourage the community to
adopt this setting. For cross-lingual transfer, while
this approach is not fully zero-shot transfer, we
argue that in real applications, a small amount of
supervised data is often available for validation in
each language.
XLM-R sets a new state of the art on XNLI. On
cross-lingual transfer, XLM-R obtains 80.1% ac-
curacy, outperforming the XLM-100 and mBERT
open-source models by 9.4% and 13.8% average ac-
curacy. On the Swahili and Urdu low-resource lan-
guages, XLM-R outperforms XLM-100 by 13.8%
and 9.3%, and mBERT by 21.6% and 13.7%.
While XLM-R handles 100 languages, we also show
that it outperforms the former state of the art Uni-
coder (Huang et al., 2019) and XLM (MLM+TLM),
which handle only 15 languages, by 4.7% and 5%
average accuracy respectively. Using the multilin-
gual training of translate-train-all, XLM-R further
improves performance and reaches 82.4% accuracy,
a new overall state of the art for XNLI, outperform-
ing Unicoder by 3.9%. Multilingual training is
similar to practical applications where training sets
are available in various languages for the same task.
In the case of XNLI, datasets have been translated,
and translate-train-all can be seen as some form
of cross-lingual data augmentation (Singh et al.,
2019), similar to back-translation (Xie et al., 2019).
Named Entity Recognition. In Table 2, we re-
port results of XLM-R and mBERT on CoNLL-
2002 and CoNLL-2003. We consider the LSTM
+ CRF approach from Lample et al. (2016) and
the Flair model from Akbik et al. (2018) as base-
lines. We evaluate the performance of the model
on each of the target languages in three different
settings: (i) train on English data only (en) (ii) train
on data in target language (each) (iii) train on data
in all languages (all). Results of mBERT are re-
ported from Wu and Dredze (2019). Note that we
do not use a linear-chain CRF on top of XLM-R
and mBERT representations, which gives an ad-
vantage to Akbik et al. (2018). Without the CRF,
our XLM-R model still performs on par with the
state of the art, outperforming Akbik et al. (2018)
on Dutch by 2.84 points. On this task, XLM-R
also outperforms mBERT by 2.1 F1 on average for
cross-lingual transfer, and 1.86 F1 when trained
on each language. Training on all languages leads
to an average F1 score of 89.18%, outperforming
cross-lingual transfer approach by more than 8.5%.
Question Answering. We also obtain new state
of the art results on the MLQA cross-lingual ques-
tion answering benchmark, introduced by Lewis
et al. (2019). We follow their procedure by training
on the English training data and evaluating on the
7 languages of the dataset. We report results in
Table 3. XLM-R obtains F1 and accuracy scores of
70.0% and 52.2% while the previous state of the art
was 61.6% and 43.5%. XLM-R also outperforms
mBERT by 12.3% F1-score and 10.6% accuracy.
It even outperforms BERT-Large on English, con-
firming its strong monolingual performance.
5.3
Multilingual versus Monolingual
In this section, we present results of multilingual
XLM models against monolingual BERT models.
GLUE: XLM-R versus RoBERTa. Our goal is
to obtain a multilingual model with strong perfor-
mance on both, cross-lingual understanding tasks
as well as natural language understanding tasks
for each language. To that end, we evaluate XLM-
R on the GLUE benchmark. We show in Table 4,
that XLM-R obtains better average dev performance
than BERT Large by 1.3% and reaches performance
on par with XLNet Large . The RoBERTa model out-
performs XLM-R by only 1.3% on average. We
believe future work can reduce this gap even fur-
ther by alleviating the curse of multilinguality and
vocabulary dilution. These results demonstrate the
possibility of learning one model for many lan-
guages while maintaining strong performance on
per-language downstream tasks.
Model #lgs MNLI-m/mm QNLI QQP SST MRPC STS-B Avg
BERT Large †
XLNet Large †
RoBERTa †
XLM-R 1
1
1
100 86.6/-
89.8/-
90.2/90.2
88.4/88.5 92.3
93.9
94.7
93.1 91.3
91.8
92.2
92.2 93.2
95.6
96.4
95.1 88.0
89.2
90.9
89.7 90.0
91.8
92.4
90.4 90.2
92.0
92.8
91.5
on CC obtains 80.0% average accuracy on the 7
languages, while the average performance of mono-
lingual BERT models trained on CC is 77.5%. This
is a surprising result that shows that the capacity
of multilingual models to leverage training data
coming from multiple languages for a particular
task can overcome the capacity dilution problem to
obtain better overall performance.
Model
D
#vocab
en fr de ru zh sw ur Avg
84.5
86.7 78.6
81.2 80.0
81.2 75.5
78.2 77.7
79.5 60.1
70.8 57.3
65.1 73.4
77.5
74.7
79.5 72.5
76.4 73.1
74.8 60.8
71.2 62.3
66.9 71.8
76.2
80.2
82.9 75.7
79.7 78
80.4 68.7
75.7 66.7
71.5 76.3
80.0
Monolingual baselines
Table 4: GLUE dev results. Results with † are from
Liu et al. (2019). We compare the performance of XLM-
R to BERT Large , XLNet and Roberta on the English
GLUE benchmark.
BERT
Wiki
CC
40k
40k
Multilingual models (cross-lingual transfer)
XLM-7
Wiki
CC
150k
150k
82.3
85.7
76.8
78.6
Multilingual models (translate-train-all)
XNLI: XLM versus BERT. A recurrent criti-
cism against multilingual model is that they obtain
worse performance than their monolingual coun-
terparts. In addition to the comparison of XLM-R
and RoBERTa, we provide the first comprehen-
sive study to assess this claim on the XNLI bench-
mark. We extend our comparison between multi-
lingual XLM models and monolingual BERT mod-
els on 7 languages and compare performance in
Table 5. We train 14 monolingual BERT mod-
els on Wikipedia and CommonCrawl 2 , and two
XLM-7 models. We add slightly more capacity
in the vocabulary size of the multilingual model
for a better comparison. To our surprise - and
backed by further study on internal benchmarks
- we found that multilingual models can outperform
their monolingual BERT counterparts. Specifically,
in Table 5, we show that for cross-lingual transfer,
monolingual baselines outperform XLM-7 for both
Wikipedia and CC by 1.6% and 1.3% average ac-
curacy. However, by making use of multilingual
training (translate-train-all) and leveraging training
sets coming from multiple languages, XLM-7 can
outperform the BERT models: our XLM-7 trained
2
For simplicity, we use a reduced version of our corpus by
capping the size of each monolingual dataset to 60 GiB.
XLM-7
Wiki
CC
150k
150k
84.6
87.2
80.1
82.5
Table 5: Multilingual versus monolingual models
(BERT-BASE). We compare the performance of mono-
lingual models (BERT) versus multilingual models
(XLM) on seven languages, using a BERT-BASE archi-
tecture. We choose a vocabulary size of 40k and 150k
for monolingual and multilingual models.
5.4
Representation Learning for
Low-resource Languages
We observed in Table 5 that pretraining on
Wikipedia for Swahili and Urdu performed sim-
ilarly to a randomly initialized model; most likely
due to the small size of the data for these languages.
On the other hand, pretraining on CC improved
performance by up to 10 points. This confirms our
assumption that mBERT and XLM-100 rely heav-
ily on cross-lingual transfer but do not model the
low-resource languages as well as XLM-R. Specifi-
cally, in the translate-train-all setting, we observe
that the biggest gains for XLM models trained on
CC, compared to their Wikipedia counterparts, are
on low-resource languages; 7% and 4.8% improve-
ment on Swahili and Urdu respectively.
