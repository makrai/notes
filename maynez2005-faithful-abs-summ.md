On Faithfulness and Factuality in Abstractive Summarization
Joshua Maynez, Shashi Narayan, Bernd Bohnet, Ryan McDonald
ACL 2020, 14 pages arXiv:2005.00661 [cs.CL]

# Abstract

* limit of the standard likelihood training and approximate beam-search decoding
  * less human-like responses for open-ended tasks such as LM and story generat
    (Holtzman+ 2020; Welleck+ 2020; See+ 2019)
  * for abstractive document summarization: highly prone to hallucinate content
* We conducted a large scale human evaluation of several neural extreme abs summ
  * types of hallucinations they produce
  * substantial amounts of hallucinated content in all model generated summs
  * pretrained models are better summarizers not only in terms of raw metrics,
    i.e., ROUGE, but also in generating faithful and factual summaries
  * textual entailment measures better correlate with faithfulness than standard
    metrics, potentially leading the way to automatic evaluation metrics as well
    as training and decoding criteria

# 1 Intro

* extreme abstractive document summarization (Narayan+ 2018a)
* summaries often forge entities (e.g., “Nigel Goldsmith” or “Zac Goldwin”) or
  information (e.g., “UKIP leader Nigel Goldsmith”, “Nigel Goldsmith winning the
  mayoral election”, “Sadiq Khan being the former London mayor” or “Zac Goldwin
  being the Labour’s candidate”) that are not supported by the document or are
  factually wrong. Interestingly,
  * all summaries are topical and fluent, and
    perform well in terms of ROUGE scores (Lin and Hovy, 2003)
* We conducted a large-scale human evaluation of hallucinated content
  * in
    * Recurrent Neural Network (RNN, See+ 2017),
    * Convolutional Neural Network (CNN, Narayan+ 2018a), and
    * Transformers (Radford+ 2019; Rothe+ 2020), as well as
    * human written summaries
  * for the recently introduced eXtreme SUMmarization task 
    (XSum , Narayan+ 2018a)
* questions:
  * How frequently do abstractive summarizers hallucinate content?;
  * Do models hallucinate by
    * manipulating the information present in the input document (intrinsic) or
    * adding information not directly inferable from the input document (extrin)
  * How much hallucinated content is factual, even when unfaithful?; and
  * Are there automatic means of measuring these hallucinations?
* conclusions:
  * intrinsic and extrinsic hallucinations happen in more than 70% of
    single-sentence summaries
  * the majority of hallucinations are extrinsic, which
    * potentially could be valid abstractions that use background knowledge
    * hE, we found that over 90% of extrinsic hallucinations were erroneous
  * models initialized with pretrained parameters perform best
    both on automatic metrics and human judgments of faithfulness/factuality
    * they have the highest percentage of factual within extrinsic hallucinatons
    * in contrast to Niven and Kao, (2019) who argue that large-scale pretrained
      models are merely better at learning data-specific regularities
    * at least on in-domain summarization
  * ROUGE (Lin and Hovy, 2003) and BERTScore (Zhang+ 2020) correlates less with
    faithfulness/factuality
    than metrics derived from automatic semantic inference systems, specifically
    the degree to which a summary is entailed by the source document

# 2 Hallucinations in Summarization

* Open-ended generation
  * the task of generating text that forms a natural continuation from the input
  * focus has been text that is more human-like
    (i.e., less repetitive or dull with more content-related words)
    (Holtzman+ 2020; Welleck+ 2020; See+ 2019)
* In contrast, tasks
  * document summarization (Nenkova and McKeown, 2011; See+ 2017; Paulus+ 2018)
  * data-to-text generation (Lebret+ 2016; Wiseman+ 2017)
* noises or artifacts of the training data, such as reference divergence
  (Kryscinski+ 2019a; Wiseman+ 2017; Dhingra+ 2019)
  * Thus, models can generate texts that are not consistent with the input, 
    yet would likely have reasonable model log-likelihood

## 2.1 Intrinsic and Extrinsic Hallucinations

* Intrinsic hallucinations are consequences of synthesizing content using the
  information present in the input document
  * e.g. “Former London mayoral candidate” in the TConvS2S abstract uses terms
    or concepts from the document but misrepresent information
* Extrinsic hallucinations are model generations that ignore the src altogether
  * e.g. “Nigel” in the PtGen abstract and “2016” in both Gold and GPT-TUNED
  * terms are not introduced in the document
  * if decoder is agnostic to the divergence issue between the source and target
    (Wiseman+ 2017; Dhingra+ 2019), it will function more as an open-ended
    language model and will be prone to extrinsic hallucinations

## 2.2 Factual Hallucinations in Summarization

* Factual hallucinations may be composed of intrinsic or extrinsic hallucination
  * it is natural to construct summaries that integrate with the author’s
    background knowledge (van Dijk and Kintsch, 1978; Brown and Day, 1983)
  * example is audience-targeted summarization where a good summary will reflect
    understanding of both the article domain and the desired audience
* advanced pretrained text generators (Radford+ 2018, 2019; Dong+ 2019; Song+
  2019; Khandelwal+ 2019; Rothe+ 2020) are even better at capturing world knowl
  * e.g. the input document does not mention
    that the discussed “London mayoral election” is from “2016”; but the
    abstract generated by the pretrained text generator GPT-T UNED correctly
    predicts this information similar to the human-authored abstract

# 3 Extreme Document Summarization

* We focus our study on extreme summarization for the following reasons:
  * easier to annotate and analyze than longer summaries such as story
    highlights from the CNN/Dailymail dataset (Hermann+ 2015) or abstracts from
    the NY Times (Sandhaus, 2008) or the WikiSum (Liu+ 2018) dataset
  * the gold summary in the extreme summarization dataset is an introductory
    sentence prefacing each article. By virtue of this property, the extreme
    summarization task is not amenable to extractive strategies and requires an
    abstractive modeling approach. Hence, it provides us a better benchmark to
    assess abstractive models’ abilities to produce abstractions which are
    faithful and factual
  * since we conclude that hallucination is a problem on this dataset, then we
    can safely conclude it is a problem for summarization datasets with longer
    summaries, as modeling longer-distance dependencies and discourse struc-
    tures make the task harder

# 4 Abstractive Summaries

# 5 Experiments and Results 5

* The main focus of this work is not to propose a solution to hallucination, but
  to achieve a better understanding of hallucinations in abstractive summ
* scores
  * ROUGE (Lin and Hovy, 2003) scores, BERTScore (Zhang+ 2020) and
  * semantic inference metric such as
    * textual entailment
      (Pasunuru and Bansal, 2018; Welleck+ 2019; Falke+ 2019; Kryscinski+ 2019b)
    * question answering (Arumae and Liu, 2019; Wang+ 2020)

## 5.1 Automatic Evaluation of Summaries

* BERTScore (Zhang+ 2020) computes a similarity score for each token in the
  candidate summary with each token in the reference summary.  However, instead
  * computes token similarity using contextual embeddings.  Results are
* BertS2S performed far superior to any other randomly initialized models,

## 5.2 Assessment of Hallucinations

* annotators were tasked with
  * identifying those text spans that were unfaithful to the article and
  * for each text span, annotating whether the hallu was intrinsic or extrinsic
* The Appendix provides interannotator agreement of hallucinations as well as
  hallucinated span characteristics

### Extrinsic Hallucination due to Divergence between Source and Target

* the BBC gold summaries often have extrinsic hallucinations due to the dataset
  artifact that gold summaries are introductory sentences prefacing each
  article. It was not surprising that most models also had significant extrinsic
  hallucinations

### Intrinsic Hallucination is Also Common in Abstractive Summaries

* Gold summaries can also display intrinsic hallucinations. For example, a news
  * “Barack Obama” and “the office of the President of the United States”
* hE, the percentage of system summaries with intrinsic hallucination was much
  higher than in gold summaries (7.4% vs others). This phenomenon particularly
  * models’ tendency to misrepresent information in the document
    due to the lack of document-level understanding and inference
* The copy mechanism in PtGen
  * ext: the least percentage of extrinsic hallucination of 63.3%), but the
  * int: the mechanism lacks the inference capability and is
    prone to generate a summary that is not supported by the document (19.9%)
* TranS2S showed similar performance to PtGen and ranked second worst
* BertS2S showed the least number of intrinsic hallucination (16.9%) among all

### Pretraining Improves Faithfulness

* BertS2S reported the highest number of faithful summaries. It appears that
  * overall most conservative among all four abstractive systems while
    getting closer to reference summaries in terms of ROUGE. The pretraining

## 5.3 Assessment of Factual Hallucinations

* annotators were presented a single-sentence summary with hallucinations and
  * asked to assess whether it is true or false. To better explain the context
  * made available the source document as well as the external resources such as
    * The source document can be particularly important for generic summaries to
    * External resources assisted the evaluators to validate grounded facts in

### Pretraining Helps Generating Factual Summaries

* Gold is significantly different from all other systems. For
* extrinsic hallucinations, there were significant differences between PtGen and
  TConvS2S, PtGen and Gold , and, BertS2S and Gold . For
* factuality, the differences between PtGen , TConvS2S, and TranS2S were insignf

## 5.4 Automatic Measures for Hallucinations

### Textual Entailment

* We trained an entailment classifier by finetuning BERT-Large on the Multi-NLI
  * entailment probability score between the document and its abstractive summ
  * not optimal for the BBC article-summary pairs; the Multi-NLI dataset
    contains sentence-sentence pairs
* BertS2S abstracts showed the least number of contradictions
  * at par with the Gold summaries.  Similar to the performance on extrinsic
    hallucination in Table 2, the TConvS2S abstracts also displayed the
  * the Gold summaries are more neutral to their documents, whereas the BertS2S
    summaries are more entailed by their documents. This is
    * probably due to the nature of the data and that
      journalists tend to add color and have a high number of valid extrinsic

### Question Answering

* have been used to assess or promote summary informativeness
  (Narayan+ 2018b; Arumae and Liu, 2019). We adapted the QA framework to assess
* round-trip consistency method of Alberti+ (2019), which
  * combines question generation and answer extraction models to generate
    synthetic question-answer pairs. For the 500 document-summary pairs, we
    generated 731, 708, 720, 725 and 820 question-answer pairs for PtGen ,
  * we used a machine reading comprehension model to answer these questions
  * As in Alberti+ (2019), we trained all models: using a BERT-Base pretrained
    * question generation, answer extraction and reading comprehension models;
    * finetuned on the Natural Questions dataset (Kwiatkowski+ 2019)
* Similar to textual entailment, the BertS2S abstracts were the most faithful to
  * The Gold abstracts were the least accurate due to a high number of extrinsic

### Spearman’s Correlation of different metrics with the human scores

* textual entailment scores are best correlated with both faithful and factual
  * ROUGE -based metrics and BERTScore have very weak correlation, our findings
  * consistent with the recent studies (Goodrich+ 19; Kryscinski+ 19a; Wang+ 20)
* question answering scores showed a very weak correlation with f & f human
  * We hypothesize that this is due to a compounding of errors where
    * the question generator is used to generate questions from the systems’
      generated abstracts, instead of human-written text on which they were
    * the question generator is susceptible to generate questions with
      hallucinated content when fed in with hallucinated summaries, and
    * our assumption that a summary is faithful if the answers from the source
      and the summary match, is rather poor for extreme summarization
  * We demonstrate these issues in Figure 3
* Better ways of
  generating questions (Narayan+ 2020) and
  measuring factual consistency may alleviate some of these issues (Wang+ 2020)

## 5.5 Model Selection with Entailment

* Our study suggests that entailment could be used as a measure for faithfulness
  * hE, we should point out that this measure is referenceless. Thus,
    it can easily be gamed e.g. the first sentence is always entailed by the doc
  * need to be coupled with ref-based measures like ROUGE
* we can use it as a model selection objective or during decoding. We tested the
  * Specifically, we used entailment probability to select a summary between
    four candidates generated by systems evaluated
  * indeed this is a strong metric to optimize towards if we want faithful summs
* A further experiment is to train a model explicitly to predict faithfulness
  * we further fine-tuned the entailment model
    using the ‘faithful’ annotations generated during our evaluation. For all
  * indeed this slightly improves the ability to select faithful summaries from
    * We expect to see larger gains with more training data.  However,
    * this model is significantly better than ENTAILon ROUGE -based metrics and
      * a good balance between ROUGE and better faithfulness

# 6 Related Work

* saliency: Chen and Bansal (2018) asked human annotators to assess the summary
  relevance measuring both the saliency and the presence of
  contradictory/unrelated information
* Dhingra+ (2019) proposed a new automatic metric, PARENT, for data-to-text
  generation (Lebret+ 2016; Wiseman+ 2017) which
  * aligns n-grams from the reference and generated texts to the source table to
    measure the accuracy of n-grams that are entailed from the source table
* Goodrich+ (2019) proposed a model-based automatic metric to assess the
  faithfulness of Wikipedia summaries; they trained an
  * end-to-end model to extract a complete set of OpenIE-style (Banko+ 2007)
    facts from both the source text and the generated summary. The summary is
    faithful if it is precise in generating facts from the source text
  * In our experiments with OpenIEbased measures, we found that they are not
    suited for evaluating extreme summarization models; all models perform
    poorly on these metrics without any significant differences. Like ours, few
* recent works (some concurrent) have explored NLI and question answering models
  to detect factual consistency in generated text
  (Welleck+ 2019; Falke+ 2019; Kryscinski+ 2019b; Wang+ 2020). In line with our
  * Falke+ (2019) observed that the BERT-based NLI models substantially improved
    summaries reranking in terms of their correctness
  * Kryscinski+ (2019b) proposed an NLI-based fact checking model that is
    trained on a dataset tailored for detecting factual inconsistencies in gen-
    erated text
    * Wang+ (2020) proposed a question answering and generation based automatic
      evaluation protocol that is designed to identify factual inconsistencies
* Future work will likely investigate better ways of generating questions and
  measuring factual consistency to address poor correlation with faithfulness
  and factuality annotations
* reinforcement learning to improve informativeness and reduce contradiction
  * Pasunuru and Bansal (2018) used a textual entailment-based reward and
  * Arumae and Liu (2019), a question-answering based reward. However, these
  * don’t evaluate if these rewards improve faithfulness of summaries
