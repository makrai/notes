Matt Post
A Call for Clarity in Reporting BLEU Scores
WMT 2018

https://github.com/awslabs/sockeye/ tree/master/contrib/sacrebleu

# Abstract

* The main culprit is different tokenization and normalization schemes applied
  to the reference

# 1 Introduction

* BLEU (Papineni+ 2002)
  * relative language independence, ease of computation, and 
    reasonable correlation with human judgments
  * has shepherded the field through a decade and a half (Graham+ 2014)
  * weaknesses (CallisonBurch+ (2006); Reiter (2018))
* Preprocessing schemes have a large effect on scores (§2.2)
* Papers do not report the hidden parameters and schemes they use (§2.3)
* I
  * quantify these issues and show that they are serious, with
    * variances bigger than many reported gains
  * user~ versus metric-supplied tokenization
  * suggest the community use only metric-supplied reference tokenization
    * Sometimes referred to as detokenized BLEU,
      since it requires that system output be detokenized prior to scoring

# Problem Description

* The first problem deals with parameters and is more theoretical
* A second problem, that of preprocessing, exists in practice

## 2.1 Problem: BLEU is underspecified

* Among BLEU parameters are:
  * The number of references used;
  * for multi-reference settings, the computation of the length penalty;
  * the maximum n-gram length; and
  * smoothing applied to 0-count n-grams
* people use BLEU scores across test sets and languages (comparing, for
  example, translation performance into English from German and Chinese)
* the number of references included with a test set has a large effect
  * WMT 2017 includes two references for English–Finnish
    * Scoring the online-B system with one/2 reference produces BLEU 22.04/25.25
  * NIST OpenMT Arabic–English and Chinese– English test sets provided four
    * BLEU scores in the high 40s (and now, low 50s)
  * all gathered together under the label “BLEU”, over time, they
    leave an impression of very high BLEU scores for some language pairs

## 2.2 Problem: Different reference preprocessings cannot be compared

* Preprocessing includes input text modifications such as
  * normalization (e.g., collapsing punctuation, removing special characters)
  * tokenization (e.g., splitting off punctuation)
  * compound-splitting, the removal of case [kis~/nagybetű], and so on
* tokenization is one of the most important and central. This is
  * because BLEU is a precision metric, and
    changing the reference processing changes the set of n-grams
  * Rehbein and Genabith (2007) showed that the use in the parsing of `F_1`
    scores as cross-lingual estimates were unreliable
* Table 1 demonstrates  different reference tokenizations
  * a single WMT 2017 translation (online-B) and the reference translation
    were both processed in the following ways:
  * basic. User-supplied preprocessing with the MOSES tokenizer (Koehn+ 2007)
  * split. Splitting compounds, as in Luong+ (2015a) e.g. rich-text → rich text
  * unk. All word types not appearing at least twice in the target side of the
    WMT training data (with “basic” tokenization) are mapped to UNK. This
    hypothetical scenario could easily happen if this common user-supplied
    preprocessing were inadvertently applied to the reference
  * metric. Only the metric-internal tokenization of the official WMT script,
* changes as high as 1.8 for one arc, and averaging around 1.0
  * The biggest is the treatment of case, which is well known,
    yet many papers are not clear about whether they report cased
* particularly before sub-word splitting (Sennrich+ 2016) was proposed,
  many systems limited the vocabulary in their attempt to deal with unknown
  * It’s possible that these papers applied this same masking to the references

# 4 Summary

* test sets from academic, government, and industry sources. It is a shame,
