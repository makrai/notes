Multilingual Probing of Deep Pre-Trained Contextual Encoders
Vinit Ravishankar, Memduh Gökırmak, Lilja Øvrelid, Erik Velldal
First NLPL Workshop on Deep Learning for NLP 2019

# Abstract

* from a typological perspective amongst others – multilingual variants of
  existing encoders on probing datasets constructed for 6 non-English languages.
* we probe each layer of a multiple monolingual RNN-based ELMo models, the
  transformer-based BERT’s cased and uncased multilingual variants, and a
  variant of BERT that uses a cross-lingual modelling scheme (XLM).
* English, as well as French, German, Spanish, Russian, Turkish and Finnish.

# 1 Intro

* Detailed evaluations have naturally followed: these have either been
  * follow-up works to papers describing contextl repr sys e.g. Peters+ (2018b)
  * evaluating a broad class of encoders on a variety of tasks (Perone+ 2018).
* quantify what sort of linguistic information our encoders retain, and
  * how this information varies across language, across encoder, and across task
  * quantify differences between settings rather than absolute results.

# 2 prior work

### deep neural pre-training

### multilingualism in pre-training

### evaluation

* SentEval toolkit (Conneau and Kiela, 2018), which provided an easy-to-use
  * before deep representations; evaluating shallow sentence representations
  * classification tasks, textual entailment and similarity tasks, a para-
    phrase detection task, and caption/image retrieval tasks. Relevant to our
* Conneau+ ’s (2018a) set of ‘probing tasks’,
  * a variant on the theme of diagnostic classification
    (Hupkes+ 2017; Belinkov+ 2017; Adi+ 2016; Shi+ 2016), that would attempt
  * focus on evaluating representations for English; they provide
  * Spearman correlations between the performance of a particular repr mech on
    * probed for specific linguistic properties, and the
    * downstream performance on a variety of NLP tasks.  Along similar lines,
* Liu+ (2019) probe similar deep pre-trained to the ones we do, on a set of
  ‘sixteen diverse probing tasks’. (
* Tenney+ (2018) probe deep pre-trained encoders for sentence structure.
* Saphra and Lopez (2018) present a CCA-based method to compare representation
  learning dynamics across time and models, without explicitly requiring
  annotated corpora.
* multilingual sentence representations, Conneau+ (2018b) describe the XNLI
  dataset, a set of translations of the development and test portions of the
  multi-genre MultiNLI inference dataset (Williams+ 2018). This, in a sense, is
  * the authors evaluate sentence representations derived by mapping non-English
    representations to an English representation space.

##2.4 BERTology

* BERT’s attentions heads, such as Michel+ (2019), where the authors prune
  heads, often reducing certain layers to single heads, without a significant
  drop in performance in certain scenarios.
* Clark+ (2019) provide a per-head analysis and attempt to quantify what
  information each head retains; they discover that specific aspects of syntax
  are well-encoded per head, and find heads that correspond to certain
  linguistic properties, such as heads that attend to direct objects of verbs.
* BERT’s layers, such as
  * Tenney+ (2019), who discover that BERT’s layers roughly correspond to the
    notion of the classical ‘NLP pipeline’, with lower level tasks such as
    tagging lower down the layer hierarchy.
  * Hewitt and Manning (2019) define a structural probe over BERT
    representations, that extracts notions of syntax that correspond strongly
    to linguistic notions of dependency syntax.

# 3 Corpora.

* The linguistic features we probe, and how we generated our probing corpus
* our tasks can broadly be grouped into surface, syntactic and semantic tasks.
* the same as the ones described in Conneau+ (2018a), with minor modif
  * Due to the differences in corpus domain (Wikipedia)
    * we alter some of their word-frequency parameters. We also
    * exclude the top constituent (TopConst) task; we noticed that
      * Wikipedia tended to have far less diversity in sentence structure
        than the original Toronto Books corpus, due to the more encyclopaedic
1. Sentence length: In SentLen, sentences are divided into multiple bins based
2. Word count: In WC, we sample sentences that feature exactly one amongst a
3. Tree depth: The TreeDepth task simply asks the representation to predict the
4. Bigram shift: In BiShift, for half the sentences in the dataset, the order
5. Subject number: The SubjNum task asks the classifier to predict the number of
6. Object number: ObjNum, similar to the subject number task, was annotated
7. Coordination inversion: In CoordInv, two main clauses joined by a
   coordinating conjunction have their orders reversed, with a probability of
   one in two. Only sentences with exactly two top-level conjuncts are con-
   sidered.
8. (Semantic) odd man out: SOMO, one of the more difficult tasks in the
   collection, replaces a randomly sampled word with another word with
   comparable corpus bigram frequencies.
9. Tense prediction: The Tense prediction asks the classifier to predict the
   tense of the main verb: we compare the past and present tenses.

## 3.2 Data

### Languages

* Our choice of languages was motivated by three factors:
  * the availability of a Wikipedia large enough to extract data from;
  * the availability of a reasonable dependency parsing model, and
  * typological diversity. The former, in particular, was a bit of a
    restriction, since not all sentences were valid candidates for extraction
    per task. Our final set of languages include an additional corpus for
* English, as well as French, German, Spanish, Russian, Turkish and Finnish.
  * includes morphologically agglutinative, fusional and (relatively) isolating
  * two scripts, Latin and Cyrillic.
  * three families (Indo-European, Turkic and Uralic).

### Preprocessing

# 4 Implementation. choice of encoders, as well as infrastructural details 5

# 5 results

## 5.2 Language

* Figure 5, which displays what one might call the net ‘informativity’ of an
  encoder, i.e. an average of how much information each encoder retains
  averaged over tasks. The most noticeable effect here is the
  * drop in informativity for Russian and Turkish. While this is perhaps
    * Turkish – which has smaller probing corpora, and a less reliable Wikipedia
    * Russian’s opaqueness cannot be as easily explained away, particularly when
      contrasted with Finnish, which tends to have fewer resources.
* Figure 6, which displays the averaged results of three systems
  * Most linguistic differences appear to be clustered in the semantic part of
  * not the least of possible factors is the actual probing corpus itself:
  * however, we attempt to provide a justification, from a typological
  * Tense task stands out as fairly easy to probe for all languages.  It thus
  * subject and object number,
    * French and Spanish appear to be somewhat easier to probe than other
    * both languages marking nominal number, not just with verb agreement, but
      also with plural articles, resulting in representations that are more
    * English and German, which either do not have plural articles, or have plural
      articles that morphologically overlap with non-plural forms, or with
    * Russian, that tends to avoid articles in general.
  * German’s relative ability at retaining information on CoordInv and Tense, as
  * Finnish’s extraordinarily high performance on Tense. Further,
  * SentLen appears to be retained better, counter-intuitively, in Russian,
    Turkish and Finnish; a brief look at Figure 1 shows that, interestingly,
    this is likely due to BERT.
* not seem to indicate that English is somehow better represented in our
  multilingual systems, nor does it appear to perform significantly better than
  other languages in general, indicating that none of our models are ‘learning’
  English first and then adapting to other languages.

# 6 conclude with a discussion of the implications and future work

## Implications Having elaborated our results, it becomes crucial to
contextualise their importance. ‘Probing’ an encoder, or more correctly, using
diagnostic classifiers to attempt to quantify what information an encoder
stores, appears to be a reasonable approach to qualifying this information.
* critique of encoder probing approach. To paraphrase
  * Saphra and Lopez (2018), the architecture of a diagnostic classifier does
    affect the performance of a probing task; further,
  * lower layers of encoders may represent information in ways designed to be
    picked up on by their own higher layers; this might prove difficult for
    simple classifiers to truly probe.

## 6.2 Future work One potential strand of research relates directly to the

* our choice of tasks was fairly restrictive, and does not
* include many tasks that are truly semantic, which does not provide us with
  * draw conclusions similar to Liu+ (2019), which is that
    * pretrained models encode stronger syntax than semantics. An obvious
* particularly within a multilingual context:
  the tasks proposed by Liu+ (2019) and Tenney+ (2018) are
  not strictly easy to motivate cross-linguistically: the burden of annotation
* more semantic-level probing by means of existing cross-lingual semantic resrc,
  such as the Parallel Meaning Bank (Abzianidze+ 2017).
  Lasha Abzianidze, Johannes Bjerva, Kilian Evang, Hessel Haagsma, Rik van
  Noord, Pierre Ludmann, Duc-Duy Nguyen, and Johan Bos.
  arXiv:1702.03964 [cs].  ArXiv: 1702.03964.  2017.
  The Parallel Meaning Bank: Towards a Multilingual Corpus of Translations
  Annotated with Compositional Meaning Representations.
