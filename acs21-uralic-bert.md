Evaluating Transferability of BERT Models on Uralic Languages
Judit Ács, Dániel Lévai and Andras Kornai
IWCLUL 2021

# 1 Introduction

* multiling eval
  * els. Devlin+ (2019) showed that the original mBERT outperformed existing
    models on the XNLI dataset (Conneau+ 2018), a translation of the MultiNLI
    (Williams+ 2018) to 15 languages. mBERT was further evaluated by
  * Wu and Dredze (2019) for 5 tasks in 39 languages, which
  * expanded to over 50 languages for part-of-speech (POS) tagging, named entity
    recognition (NER) and dependency parsing (Wu and Dredze, 2020).  mBERT has
  * dependency (Kondratyuk and Straka, 2019) and
  * constituency parsing (Kitaev+ 2019). The surprisingly effective
  * further explored by Dufter and Schütze (2020).
* we show
  * these language models are very good at all three tasks when finetuned on a
    small amount of task specific data,
  * for morphological tasks, when native BERT models are available (et, fi, hu),
    these outperform the others on their native language, though the advantage
    over XLM-RoBERTa is not statistically significant,
  * for POS and NER, the use of native models from related, even closely related
    languages, rarely brings improvement over the multilingual models or even
    English models,
  * as long as the alphabet that the language uses is covered in the vocabulary
    of the model, we can transfer mBERT (or RuBERT) to the NER and POS tasks
    with surprisingly little finetuning data.

# 2 Approach

* three tasks: morphological probing, POS tagging and NER
  * Morphological probing tries to recover morphological tags from the sentence

# 3 The models evaluated

## 3.1 Subword tokenization

* XLM-RoBERTa uses the SentencePiece algorithm (Kudo and Richardson, 2018), the
  other models use the WordPiece algorithm (Schuster and Nakajima, 2012). The
  two types of tokenizers are algorithmically very similar, the
  * differences between them are mainly dependent on the vocabulary size per
    language. The multilingual models consist of about 100 languages, and the
* handling of missing characters differs significantly. In
  * BERT-based models, if there is a character missing from the tokenizer’s
    vocabulary, the model discards the whole segment between whitespaces,
    labeling it [UNK]
  * XLM-RoBERTa deletes the unknown characters, but the string that remains
    between whitespaces is segmented
* different vocabulary sizes the
  * Finnic models have 50000 subwords in their vocabulary,
  * HuBERT only contains 32000 subwords. The rest of the fertility values are
  * In extreme cases, a word is segmented into letters, which is the case for
    EngBERT on Erzya, but the non-Hungarian models on Hungarian also produce

# 4 Results 6

# 5 Conclusion 8

* languages that still lack basic resources, in particular
  the entire Samoyedic branch, Mari, and Ob-Ugric languages, are currently out
* avenue of research could be to work towards a stronger mBERT interlingua, or
  perhaps one for each script family, as the charset issues are clearly
