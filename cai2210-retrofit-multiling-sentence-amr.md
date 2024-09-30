Retrofitting Multilingual Sentence Embeddings with Abstract Meaning Representation
Deng Cai, Xin Li, Jackie Chun-Sing Ho, Lidong Bing, Wai Lam
EMNLP2022 arXiv:2210.09773 [cs.CL]

* We: a new method to improve existing multilingual sentence embeds with AMR
  * AMR is a structured semantic representation that presents the core concepts
    and relations in a sentence explicitly and unambiguously
    * helps reduce surface variations across different expressions and langs.
* thorough evaluation of existing multilingual sentence embeddings and our
  * 5 transfer tasks in different downstream applications.  Experiment results
  * better SOTA performance on both semantic textual similarity and transfer

## 6.3 Baseline Systems

## mBERT / XLM-R: the mean pooling of mBERT (Devlin+ 19) & XLM-R (Conneau+ 20)

* both are pre-trained on multilingual data
* no parallel or labeled data was used.

## mUSE, Multilingual Universal Sentence Encoder (Chidambaram+ 2019) uses a

* dual-encoder transformer architecture and adopts contrastive objectives. It
* trained on mined question-answer pairs, SNLI data, translated SNLI data, and
  parallel corpora over 16 languages.

## LASER (Artetxe and Schwenk, 2019)

* seq-to-seq encoder-decoder architecture trained on parallel corpora for MT
* The sentence representation is obtained via max-pooling over the output of
* 93 languages

## LaBSE, Language-agnostic BERT Sentence Embedding (LaBSE, Feng+ 2020) was

* trained similar to mUSE with a translation ranking loss. It
* fine-tunes a dual-BERT architecture with 6 Billion translation pairs for
* 109 languages.

## Xpara: Reimers and Gurevych (2020)

* XLM-R fine-tuned to imitate SBERT-paraphrases (Reimers and Gurevych, 2019),
* a RoBERTa model trained on more than 50 Million English paraphrase pairs,
  with massive bilingual sentence pairs over 50 languages.

## Model Variants (Ablation)

* #1: To show if learning from English data suffices, we train the AMR
  encoder with only English sentences and the AMR graphs derived from them.
* #2: the original parser in Cai+ (2021), which does not include French.
* #3: To measure the help of involving more languages when training the AMR enc
  * we train the AMR encoder without the AMR graphs derived from French & Arabic
* #4: AMR encoder without English sentences.
* #5: The standard model as described in Section 6.2.
* For each model variant, we report the average performance over five runs (rand)

## 6.5 Results

### Multilingual STS Table 2 and Table 3 show the evaluation results

* 3 monolingual STS tasks and 7 cross-lingual STS tasks respectively. As seen,
  * the best-performing models in the literature are mUSE and Xpara. Thus,
  * we present the results of augmenting mUSE and Xpara with our AMR embeds,
    denoted by mUSE++ and Xpara++ respectively.
* Using AMR embeddings substantially improves both two models across the
  monolingual (up to +2.31 on avg.) and cross-lingual settings (up to +2.22 on
  avg.), greatly advancing the SOTA performance. The average scores of
  monolingual and cross-lingual settings are pushed to 85.88 and 84.25
  * The improvements for mUSE are generally greater than those for Xpara,
    * even though the training data of mUSE overlaps with our AMR encoders
    * maybe because Xpara is trained on paraphrase corpus, which diminishes the
      ability of AMR to group different expressions of the same semantics.
* model variant #2 performs best on monolingual settings while
  * model variant #5 attains the best results on cross-lingual settings. We
  * adding more languages to the training of the AMR parser
    helps the generalization to other languages and
    reduces the parsing inconsistency across different languages
    => the AMR graphs from different languages are better aligned, leading to a
    => better-aligned vector space
  * On the other hand, adding more language may decrease the parsing accuracies
    on individual languages due to the fixed model capacity
  * all other model variants except #2 underperform `#5`, confirming the
    effectiveness of the proposed mixed training strategy

### Transfer Tasks Table 4 shows the evaluation results on transfer tasks.

* For each task, we report the macro-average scores across different languages.
  * The results for each language can be found in Appendix
  * our AMR encoders are only trained with a few languages (en, de, es, it, zh,
    fr, and ar) at most
    * unlike previous work,
    * To isolate the effect on unseen languages, we separate the results on
      those seen languages from all languages (seen/all).
* the rankings of existing models are quite different to the results on STS
  * LASER and LaBSE achieve the best results on most transfer tasks
    except for QAM, and
    * outperforms mUSE and Xpara by large margins in most cases. The results
* Next, we augment the best-performing models, LASER and LaBSE, with our AMR
  * For seen languages, our methods substantially boost the performance of
    these two models across different tasks (up to +2.02 on avg.). The
    * gains over LASER are greater than those over LaBSE.  Note that
    * LASER is trained with an encoder-decoder architecture and both LaBSE and
      our AMR encoders are trained with a Siamese network. Therefore, we
      believe the AMR embeddings are more complementary to LASER.
  * all languages
    * LASER: the improvements over LASER are also considerable (up to +1.11 on
      avg.)
    * LaBSE: However, according to the average scores over different tasks, the
      AMR embeddings seem to fail to improve LaBSE; We even observe a
      performance drop for model variants #1-#3. Nevertheless, the performance
      * largely comes from XNLI while the
        scores on other tasks are instead boosted. This is
      * because the test sets of XNLI include some distant languages (eg
        Swahili and Urdu) that our multilingual AMR parser cannot handle well
        (see the results on individual languages in Table 6 in Appendix). We
  * comparison among different model variants provides a basis for the above
    * #2 (exclude French from the training of the multilingual AMR parser)
    performs worst
    * #1 (drop all non-English AMR graphs for training) and #2 (drop the AMR
      graphs derived from French and Arabic) are the other two variants that
      negatively impact the average performance.  Another interesting
    * #4 performs best on MLDoc and QAM, suggesting
      English sentences might not be necessary.
