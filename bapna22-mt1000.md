Building Machine Translation Systems for the Next Thousand Languages
A Bapna, I Caswell, J Kreutzer, O Firat, D van, E Aditya, S Mengmeng+
arXiv:2205.03983 [cs.CL] Google Research (2022)

# Abstract

* Building clean, web-mined datasets by
  * semi-supervised pre-training for language-id
  * data-driven filtering techniques;
* Leveraging
  * MT models trained with parallel data for over 100 languages and
  * small monolingual datasets for over 1000 languages to enable translation
    for several previously under-studied languages; and
* Studying the limitations of evaluation metrics for long tail languages and
  * qualitative analysis of the outputs from our MT models

# 1 An overview

* academic and commercial machine translation (MT) systems
  * large-scale web-mined datasets (Resnik & Smith, 2003; Uszkoreit+ 2010;
    Esplà-Gomis, 2009; Esplà+ 2019; Bañón+ 2020; Schwenk+ 2021)
  * deep learning and sequence-to-sequence models (Sutskever+ 2014;
    Bahdanau+ 2015; Luong+ 2015; Vaswani+ 2017)
  * large parallel (and monolingual) datasets mined from the web,
  * data augmentation approaches like
    * back-translation (Sennrich+ 2016; Edunov+ 2018) and
    * self-training (He+ 2019) and
  * massively multilingual modeling: high quality MT for over 100 languages
    (Firat+ 2016a; Johnson+ 2017; Aharoni+ 2019a; Arivazhagan+ 2019;
    Tang+ 2021; Fan+ 2021)
* hE widely-available, general-domain MT systems limited to around 100
  * highly skewed in favour of European languages
  * eg Google Translate supports Frisian, Maltese, Icelandic, and Corsican,
    each with fewer than 1M L1 speakers
  * long-tail languages: Google Translate not support (up until this work)
    Bhojpuri (~51M speakers), Oromo (~24M speakers), Quechua (~9M speakers), or
    Tigrinya (~9M speakers, van Esch+ 2022)

# 2 Web-crawled datasets for 1000 languages

* lack of digitized and accessible datasets and NLP tools like LangID
  * we building monolingual web text corpora in over 1500 languages
  * focus on dealing with common noise, data quality and scale challenges
    encountered when building a dataset from the web (Section 2)
* scale LangID models to 1500+ languages (2.1.1), both using traditional n-gram
  models and semi-supervised approaches
* filtering techniques that enable using these LangID models to identify
  long-tail language data on the web. To minimize recall loss during mining,
  * we cluster languages by error rate (2.1.3)
  * document-level LangID consistency to filter our data (2.1.4)
  * percent-threshold wordlist filtering (2.1.5),
  * T F IIF filtering (2.1.7),
  * hand-designed filters for certain languages (2.1.8)
* resulting dataset in Section 2.2
* audit of 72 language corpora (2.2.2)
  * the data is between 70% and 100% in-language, with a median score of 80%

# 3 Machine Translation for long-tail languages: With monolingual data mined

* we utilizing all the parallel data that is available for higher resource
  * "zero-resource" since no direct supervision is available for our long-tail
  * resources for these languages, including 10Ms of native speakers,
    centuries (or in some cases millenia) of scholarship, and even
    large segments of text inaccessible to digital methods
    * Bird (2020): some more reflections on this term
* techniques for zero-resource translation for long-tail languages > 1000
  * self-supervised learning from monolingual data,
    massively multilingual supervised training,
    large-scale back-translation and self-training, and high capacity models
  * utilizing our existing parallel corpus spanning around 100 languages and
    the 1000-language monolingual dataset built from the web (Section 3)
  * model capacity in highly multilingual models by
    * comparing the performance of 1.5B and 6B parameter Transformers on
      zero-resource translation (3.2)
* We then scale up the number of self-supervised languages to 1000,
  * performance of most long-tail languages improves as more monolingual data
    from similar languages becomes available (3.3)
  * large-scale data augmentation in order to understand the strengths/limits
  * we fine-tune the resulting model on a subset of 30 languages with large
    amounts of synthetic data via self-training and back-translation (3.4)
  * filter synthetic data to increase the robustness of these fine-tuned
    models to hallucinations and wrong-language translations (3.5)
  * distill these models into smaller, more inference-friendly architectures
    using sequence level distillation
    * performance gaps between the teacher and student models (3.6)

# 4 Evaluating MT for 1000 languages

* Existing MT systems heavily rely on
  * n-gram overlap based lexical metrics (BLEU , Papineni+ 2002) or the new and
  * model-based metrics
    * YISI (Lo, 2019), BLEURT (Sellam+ 2020) or COMET (Rei+ 2020) to evaluate
  * usually computed on static evaluation sets with fixed references obtained
    from professional translators or crowd-workers
* we build an evaluation set for 38 selected languages from the long-tail (4.1)
  * by translating English sentences into these languages
  * limitations of BLEU in the long-tail setting and
  * we make the case for evaluating these languages with C HR F (4.2)
* We: an approximate, round-trip translation based, reference-free metric
  to understand the quality of our models on languages whithout reference (4.3)
  * human evaluations of our models (on a subset of 28 languages)
    => it is possible to build functioning MT systems (4.4)
* To understand the weaknesses of our massively-multilingual zero-resource
  * qualitative error analysis on several languages
  * often confuse distributionally similar words and concepts,
    eg “tiger” becomes a “miniature crocodile” (4.5)
  * deteriorates on less frequent tokens for lower-resource settings (4.6)
  * often fail to adequately translate short, or single word inputs (4.7)
  * magnify biases or noise in the training (4.8)
    * distilled models also

# 5 Other miscellaneous findings and experiments

* often perform better when translating directly between similar languages —
  rather than using English as a pivot (5.1)
  * zero-shot transliteration between different scripts (5.2)
  * appending terminal punctuation to any input, the “period trick” (5.3)
* robust to nonstandard Unicode glyph usage for some but not all languags (5.4)
  * non-Unicode fonts (5.5)

# 6 The role of native speakers

* we rely extensively on native speakers of these languages to guide, evaluate
  and often contribute technically to the development of these systems
* we add support for 24 new languages to Google Translate
  * evaluate each language thoroughly and consult members of affected
    communities; as a result we limited this effort to 30 languages, of which
    24 met our launch bar
  * cover languages with large speaker populations in regions that are
    under-represented in technology, like the Americas, Africa, and South Asia
