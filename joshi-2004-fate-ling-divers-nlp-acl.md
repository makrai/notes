Pratik Joshi, Sebastin Santy, Amar Budhiraja, Kalika Bali, Monojit Choudhury
The State and Fate of Linguistic Diversity and Inclusion in the NLP World
arxiv.org/abs/2004.09095

# Abstract

* over 7000 languages of the world are [not] represented in the rapidly evolving
* we look at the relation between the
  types of languages, resources, and their representation in NLP conferences
  * trajectory that different languages have followed over time
  * Our quantitative investigation underlines the disparity between languages,
  * calls into question the “language agnostic” status
  * ACL community [should] prioritise the resolution of the predicaments

# 1 The Questions

* Languages X and Y are the official languages of two different countries; they
  * 29M and 18M native speakers, and 2M and 5.5K Wikipedia articles,
  * X is syntactically quite similar to English,
    though uses dimunitives and has grammatical gender
    * Y, on the other hand, has a different word order from English, and has a
      rare typological feature: generally it is a head-final language, but noun
      phrases are head-initial.  It also features full and partial reduplication
  * 69 items on LDC and ELRA contain data in X, whereas for
    Y there are only 2 items
    * X boasts of some of the best online machine translation systems, whereas
    * Y is supported by very few online MT systems and that too inferior
  * number of papers in conferences (ACL, NAACL, EACL, EMNLP, LREC, WS) that
    mention X and Y in the paper, across the years
    * X has a steady and growing trend of research, our
    * community has been mostly oblivious to Y, until recently when some of the
      zero-shot learning papers have started mentioning it
  * Can you guess what X and Y are?
* NLP researchers surely know
  * of (and might even speak) several languages which
    * in the same boat as X; languages which
    * have a large amount of resources and therefore access to the benefits
    * and languages like Y; those which lack resources and the attention
  * extremely skewed distribution of resources across the world’s languages
  * most of our NLP systems, which are typically declared language agnostic,
    are not truly so (Bender, 2011)
  * The handful of languages on which NLP systems are trained and tested are
    * related and from the same geography, drawn from a few dominant families,
    * typological echo-chamber
  * majority of typologically diverse phenomena never seen by sys (Ponti+ 2018)
    Nevertheless, it would be prudent to re-examine these issues
* Neural systems
  * require a lot more data for training than rule-based or traditional ML
  * zero-shot learning of massively multilingual systems (Devlin+ 2018;
    Conneau+ 2018) bridge this gap
    * need only large unlabeled corpora across languages
    * how does [this change] the fate of different languages?
* tractable and quantifiable questions on Linguistic Diversity and Inclusion:
  1. How many resources, labeled and unlabeled, are available
    * How does this distribution correlate to their number of native speakers?
    * What can we expect to achieve today and in the near future?
  2. Which typological features remain unexplored by systems because we
     have hardly created any resources and conducted data-driven research
  3. how inclusive has ACL been in conducting and publishing research
    * was the linguistic diversity of ACL higher?  In 1980s and early 90s,
      when large scale datasets were not the drivers
  4. amount of resource influence the research questions and the venue?
  5. role [of] an individual researcher, or a research community in bridging
* languages of the World can be broadly classified into 6 classes based on
  * how much and what kind of resources they have
  * distinct and different trajectory in the history of ACL
  * [different] hope of coming to the forefront with zero-shot learning

# 2 The Six Kinds of Languages

* we propose a taxonomy based on the number of language resources which exist

## 2.1 Features

* two feature axes: number of unlabeled vs.labeled resources
* each data resource as a fundamental unit
* Other units such as the total number of datapoints across datasets can be
  misleading because
  * different NLP tasks have different data requirements
    * Machine Translation (MT) models require Ms (Koehn and Knowles, 2017) to
    * Question Answering require around 100 K datapoints (Rajpurkar+ 2016)
  * diff measure
    * Speech data measured in hours, MT data measured in number of parallel s
      sentences).to categorize languages into 6 unique positions in the
      language resource ‘race’:

## 2.2 Repositories

* the LDC catalog and the ELRA Map for labeled datasets
  * keeping within the purview of NLP datasets used in `*`CL conferences, we
  * not e.g
    * PanLex (Kamholz+ 2014), which is a large lexical database of a wide range
    * OLAC (Simons and Bird, 2003), which contains a range of information for
      different languages (e.g. text collections, audio recordings, and dicts)
* Wikipedia pages as a measure for unlabeled data resources

## 2.3 Language Classes

### 0 The Left-Behinds: have been and are still ignored [by] NLP

* probably impossible effort to lift them up in the digital space
* Unsupervised pre-training methods only make the ‘poor poorer’
  * no unlabeled data to use

### 1 The Scraping-Bys

* some amount of unlabeled data, there is a possibility, a matter of years
* take a solid, organized movement that
  * increases awareness about these languages, and also sparks a strong effort
  * collect labelled datasets for them, seeing as they have almost none

### 2 The Hopefuls

* A small set of labeled datasets has been collected for these languages,
* there are [digital] researchers and language support communities
* Promising NLP tools can be created for these languages [in] a few years

### 3 The Rising Stars

* Unsupervised pre-training has been an energy boost for these languages
* strong web presence, there is a thriving cultural community online for them
* insufficient efforts in labeled data collection
* can be very well off if they continue to ride the ‘pre-training’ wave

### 4 The Underdogs [a nyugodt? esélytelenek]

* Powerful and capable, serious amounts of resource ‘firepower’
* unlabeled data, comparable to those possessed by the winners, [but]
* lesser amount of labeled data
* With dedicated NLP communities conducting research on these languages, they
  * potential to become winners and enjoy the fruits of ‘digital superiority'

### 5 The Winners

* in the lead for quite a while now, some longer than others
* dominant online presence, massive industrial and government investments in
  the development of resources and technologies
* benefit from each state-of-the-art NLP breakthrough

| |                                                 |lang|speaker |lang  |
|-|-------------------------------------------------|----|--------|------|
|0|Dahalo, Warlpiri, Popoloca, Wallisian, Bora      |2191|1.2 B	  |88.38%|
|1|Cherokee, Fijian, Greenlandic, Bhojpuri, Navajo  | 222|  30   M| 5.49%|
|2|Zulu, Konkani, Lao, Maltese, Irish               |  19|   5.7 M| 0.36%|
|3|Indonesian, Ukranian, Cebuano, Afrikaans, Hebrew |  28|1.8 B	  | 4.42%|
|4|Russian, Hungarian, Vietnamese, Dutch, Korean    |  18|2.2 B	  | 1.07%|
|5|English, Spanish, German, Japanese, French       |   7|2.5 B	  | 0.28%|

## 2.4 Findings

### On your marks. As can be seen in Figure 3, the

* Winners take pole position in all rankings, and Class 0 [have] no resource
* Wikipedia distribution seems to be more fair for classes 1, 2, and 3 vs 4 5
* Web distribution has a clear disparity

### Talk ain’t cheap. Looking at Table 1, we see that

* lack of technological inclusion for class 0 could draw native speakers to 5

# 3 Typology

* structural and semantic properties. Large-scale efforts have led to the
* WALS database of typological features (Dryer and Haspelmath, 2013).  Such
  documentation becomes important as there are barely any other classifications
* work indicating the effectiveness of injecting typological information to
  guide the design of models (Ponti+ 2018). Also,
  * transfer learning [works better between] similar typological (Pires+ 2019)
* under-representation of certain typological features
* WALS data (Dryer and Haspelmath, 2013), which contains typological features
  * 2679 languages. There are a total of
  * 192 typological features, with an
    average of 5.93 categories per feature
  * 549 out of 1139 categories (across all features) exist in classes 0, 1, 2
    but not 3, 4, 5. This comes to a total of unique categories, with an
    * average of 2.86 categories per feature being ignored.  Typological
    * features with the most ‘ignored’ categories:
      Position of Negative Morpheme With Respect to Subject, Object, and Verb
* what these typological ‘exclusions’ mean in multilingual methods, we look at
  * specific languages which contain these ‘excluded’ categories in the
  * similarity search, from the results of Artetxe and Schwenk (2018)
  * even when jointly training of all languages

## 3.1 Findings

### Far-reaching repercussions

* The most ‘ignored’ feature in Table 2, 144E (Multiple Negative Constructions
  in SVO Languages), is a rare feature, existing in only 38 languages
  * languages are from various regions (e.g. Wolof, Icelandic, and Kilivila)

### Does it run in the family? e.g. Semitic

* Amharic is the second most spoken language after Arabic (which has 300M)
  * Amharic has 9 ‘ignored’ typological features, whereas Arabic has none
  * reflects in the error rate of English to Amharic 60.71 vs 7.8

# 4 Conference-Language Inclusion 5

* ACL, EMNLP, LREC have the ability to turn heads in both industry and governmn
  * attract funds to a particular technology

## 4.1 Dataset

* ACL Anthology Corpus (ACL-ARC, Bird+ 2008) is till 2015
* non-ACL conferences such as LREC, COLING, we augment this dataset by
* using Semantic Scholar’s API and scraping ACL Anthology itself
* we gather 11 conferences: ACL, NAACL, EMNLP, EACL, COLING, LREC, CONLL,
  Workshops (WS, all since 1990), SEMEVAL, TACL and CL Journals

## 4.2 Analysis

### 4.2.1 Language Occurrence Entropy

* entropy as our metric to measure language inclusivity of each conference

### 4.2.2.Class-wise Mean Reciprocal Rank

* To quantify the extent of inclusion of language classes from our taxonomy in
* class-wise mean reciprocal rank as a metric

## 4.3 Findings

### All-Inclusive

* LREC and WS have been the most inclusive across all categories and have been
  continuing to do so over the years

### A ray of hope

* ACL, EMNLP, NAACL, LREC, we note a marked spike in entropy in the 2010s,
* absent in other conferences. This might be due to cross-lingual techniques

### The later the merrier

* conferences which started later have taken lessons from past
* COLING, ACL, EACL, EMNLP (order of their start dates)

### Falling off the radar

* more stark [merev, kopár] in CONLL, TACL, SEMEVAL

# 5 Entity Embedding Analysis

* jointly learn the representations of conferences (year), authors, languages
  * collectively term as entities
  * project these entities in the same space

## 5.1 Model

* task of the model is to predict K words from the title and the abstract
* parallels to the Skipgram model of Word2Vec (Mikolov+ 2013)

## 5.2 Analysis

* Table 5: Language-Author-Language MRR on Taxonomy Classes. MRR(K)
* A higher value of this measure indicates a more focused community working on
  that particular language, rather than a diverse range of authors

## 5.3 Findings

### Time waits for no conference

* the [horizontal t-SNE] axis represents the progression of time
  * Alternatively a shift in the focus of NLP research, moving
    from theoretical research focused on grammar and formalisms on the left to
    a data-driven, more ML-oriented approach on the right

### Long distance relationships? Figure 6

* less-resourced language classes are farther away from the trend-line of ACL

### Not all heroes wear capes

* Table 5 shows the MRR for each class of languages in the taxonomy
  * class 0 has the highest MRR across different K values
    * low resource languages have some focused research groups
  * decreasing trend of MRR from class 0 to class 5,
  * except for class 2, thereby indicating that more popular languages are
    addressed by more authors
  * Japanese, Mandarin, Turkish and Hindi (MRR(10) > 0.75) are in class 5 or 4
    but their MRR is higher even compared to low resource languages
  * low resource languages like Burmese, Javanese  and Igbo which have
    millions of speakers but significantly low MRR values, potentially
    indicating that not a lot of attention is being given to them

# 6 Conclusion 9

* in case you’re still itching to know, Language X is Dutch, and Y is Somali
