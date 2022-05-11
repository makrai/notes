XTREME-R: Towards More Challenging and Nuanced Multilingual Evaluation
Sebastian Ruder, Noah Constant, Jan Botha, Aditya Siddhant, Orhan Firat, 
  Jinlan Fu, Pengfei Liu, Junjie Hu, Graham Neubig, Melvin Johnson
arXiv:2104.07412 [cs.CL]

data, translations, evaluation resources, and interactive leaderboard

* striking advances in multilingual NLP capabilities over the past year
* SOTA on the XTREME multilingual benchmark improved by more than 13 points.
  * sizeable gap to human-level performance remains, 
    hE, improvements have been easier to achieve in some tasks than in others.
* This paper analyzes the current state of cross-lingual transfer learning and
  summarizes some lessons learned. In order to catalyze meaningful progress, 
* we extend XTREME to XTREME-R, which consists of an improved set of 
  * ten natural language understanding tasks, including challenging
    language-agnostic retrieval tasks, and covers 
  * 50 typologically diverse languages. In addition, 
* we provide a massively multilingual diagnostic suite and 
  fine-grained multi-dataset evaluation capabilities through an 
  interactive public leaderboard to gain a better understanding of such models. 

# 1 Intro

* three billion speakers of low-resource languages and prevent the NLP com-
* large-scale benchmarks such as XTREME (Hu+ 2020) and XGLUE (Liang+ 2020) have
* When XTREME was released, the gap between the best-performing baseline, XLM-R
  Large (Conneau+ 2020), and human-level performance was roughly 25. This has
  * now less than 12 points, a much smaller but 
  * still substantial gap compared to the difference from human-level perf in
    English transfer learning (Wang+ 2019a), which has recently been closed
    entirely on some evaluation suites (He+ 2021).
    * Pengcheng He, Xiaodong Liu, Jianfeng Gao, and Weizhu Chen. 2021.  
      DeBERTa: Decoding-enhanced BERT with Disentangled Attention
      ICLR 2021
* progress has not been uniform, but 
  * concentrated on cross-lingual retrieval tasks where fine-tuning on other
    tasks and pre-training with parallel data lead to large gains. On other task
  * still generally perform poorly on languages with limited data and non-Latin
  * Fine-tuning on additional translated data generally leads to the best
    performance.  
* XTREME-R (XTREME-Revisited), a new benchmark with the dual purpose of ensuring
  * 50 typologically diverse languages and 10 challenging, diverse tasks. To
  * new tasks that focus on “language-agnostic” retrieval (Roy+ 2020),
    * targets must be retrieved from a large multilingual candidate pool. We
  * baselines, SOTA mT5 (Xue+ 2020) and translate-train
* diagnostics
  * instead of a single aggregate metric summarizing a model’s performance and
  * towards a more nuanced evaluation and comparison of multilingual models
    (Ethayarajh and Jurafsky, 2020; Linzen, 2020). To this end, we introduce an
    * Kawin Ethayarajh and Dan Jurafsky. 2020. 
      Utility is in the eye of the user: A critique of nlp leaderboards.
    * Tal Linzen. 2020
      How can we accelerate progress towards human-like ling generalization?
      arXiv preprint arXiv:2005.00955.
  * we: extensible multilingual diagnostic and evaluation suite that consists of
  * two main components: a) 
    * MultiCheckList , a test suite (Ribeiro+ 2020) for probing QA in 50 langs
      * direct evaluation of finegrained capabilities in a massively multiling
    * We extend the multi-dataset evaluation framework ExplainaBoard (Fu+ 2020;
      Liu+ 2021) to additional tasks and the multilingual setting. This
      * break down performance based on language and task-specific attributes,
* logistic improvements to improve XTREME-R ’s utility as a leaderboard. To
  * each submission is required to provide metadata such as the 
    number of parameters and amount of pre-training data, which we make
  * task and language-specific sub-leaderboards to invite submissions of dedicat
* contributions:
  * an analysis of progress in cross-lingual modeling;
  * an improved benchmark covering 50 languages
    * including a newly created retrieval task (Mewsli-X)
  * a massively multilingual diagnostic suite;
  * fine-grained evaluation capabilities;
  * experiments and analyses of SOTA models; and
  * an interactive metadata-rich leaderboard.

# 2 Examining the State of Multilingual Benchmarking

## 2.1 Background

* XTREME was proposed as a platform to unify this fragmented evaluation landscap
  * 9 tasks covering 40 diverse languages, which 
  * tasks can be grouped into 4 broad task types (see §3.1 for details):
    classification (XNLI, PAWS-X), structured prediction (UD-POS, WikiANN-NER),
    question answering (XQuAD, MLQA, TyDiQA-GoldP), and 
    retrieval (Tatoeba, BUCC). XTREME focuses on zero-shot cross-lingual
    transfer, i.e. models can be pretrained on any multilingual data and are
* XGLUE (Liang+ 2020), another cross-lingual benchmark focuses on 
  * generation tasks, a smaller number of less typologically diverse languages,
* Other non-English benchmarks focus on specific 
  * linguistic phenomena, e.g. code-switching (Khanuja+ 2020); 
  * languages, e.g. Indonesian (Willie+ 2020) and Persian (Khashabi+ 2020); and
  * language families, e.g. Indian languages (Kakwani+ 2020).

## 2.2 An Analysis of XTREME

* As of April 15, 2021, all submissions are large-scale Transformers (Vaswani+)
  * Multilingual BERT (mBERT), XLM-RoBERTa (XLM-R; Conneau+ 2020) and mT5
    * extend BERT (Devlin+ 2019), RoBERTa (Liu+ 2019), and T5 respectively.
  * Rebalanced mBERT (Rem-BERT; Chung+ 2021) 
    * a more efficient, scaled-up reparameterization of mBERT.  These models
  * pre-trained on unlabeled data in around 100 languages from Wikipedia (mBERT)
    and CommonCrawl
* XLM-R was the strongest baseline in XTREME (Hu+ 2020) and is the foundation
  * fine-tuned on English data of a related task prior to task-specific
    fine-tuning (STILTs; Phang+ 2020)
  * The following models furthermore propose new methods to leverage parallel
    data during pretraining or fine-tuning.  
    * FILTER (Fang+ 2020), based on XLM-R, fuses representations in diff langs.
    * VECO (Luo+ 2020) is a 24-layer encoder-decoder model 
      * uses additional MLM variants during pre-training
    * T-URLv2 and HiCTL (Wei+ 2021), based on InfoXLM (Chi+ 2020) and XLM-R
      respectively, employ contrastive losses
    * ERNIE-M (Ouyang+ 2020) incorporates back-translation into LMing
      modeling. 2
* We analyze the performance of these models on the XTREME leaderboard in Figure
  * improved average performance on XTREME from 55.8 to 81.4.  
  * Much of this improvement is concentrated in the retrieval-based tasks where
    * from 47.7 (mBERT) to 92.7 (VECO). In contrast, performance on 
  * question answering and structured prediction has improved only slightly.  
  * tasks
  * Tatoeba retrieval task
    * still struggle with a few low-resource languages, i.e.  Swahili, Javanese,
      and Tagalog
    * perform well for most other languages and their 
      * scores are concentrated in a relatively small range. On the 
  * question answering task MLQA (Figure 1b), scores have increased slightly for
    all languages but remain well below performance on English
  * part-of-speech tagging (Figure 1d), scores remain largely the same;
    * lower for some langs 
      * with non-Latin scripts (Japanese, Chinese, Korean, Thai) and 
      * low-resource languages (Yoruba). Similar trends hold for 
  * named entity recognition. We show the scores broken down by language family
    for the remaining tasks in Appendix A. The remaining gap to English
    performance on these tasks is par-
* models fine-tuned on in-language monolingual data often perform more similarly
  across languages (Clark+ 2020; Hu+ 2020).

* standard token-level MLM pre-training produces representations are of limited
  use for cross-lingual sentence retrieval, as evidenced by the 
  * comparatively poor performance of the mBERT and XLM-R models
* Fine-tuning on sentence-level tasks (Phang+ 2020; Fang+ 2020) can mitigate
* The strong performance of VECO and ERNIE-M on the retrieval tasks can be
  attributed to a combination of parallel data and new pre-training objectives
  * Pre-training on parallel data improves performance on retrieval by 
    making the pre-training task more similar to the downstream setting but does
    not significantly improve performance on other tasks.  
* Fine-tuning on automatically translated task-specific data yields strong gains
  and is used by most recent models (Hu+ 2020; Ouyang+ 2020; Luo+ 2020).

# 3 XTREME-R 4

* XTREME-R focuses on the tasks that have proven to be hardest for current
  * drops XTREME ’s PAWS-X and BUCC tasks since recent advances have left 
    * less room for further improvement, and they 
    * cover only a small number of less diverse languages. They are replaced
* three new, more challenging tasks: 
  * one focusing on causal commonsense reasoning (§3.2.1) and 
  * two focusing on harder retrieval scenarios (§3.2.2), as this has been the
    task category where gains have been easiest to achieve.  We retain XTREME ’s
    seven other tasks as each still presents substantial challenges for
    SOTA cross-lingual models (§3.1). Overall, XTREME-R includes 10
* changes to the structured prediction tasks, NER and POS
  * Instead of only providing examples as lists of tokens, XTREME-R always
    provides the full text of an input sentence, thus ensuring that the entire
    benchmark now supports research on models that operate directly from the raw
    input string (Clark+ 2021). Furthermore, XTREME-R adopts 
  * a more realistic version of the NER task in which no gold tokenization
  * a multilingual diagnostic and evaluation suite (§3.4).

## 3.2 New Tasks

### 3.2.1 Multilingual Causal Reasoning, XCOPA 

* The Cross-lingual Choice of Plausible Alternatives (Ponti+ 2020) dataset asks
* which of two sentences causally follows a premise sentence.  The XCOPA 
* authors translated and re-annotated the validation and test sets of the
  English COPA (Roemmele+ 2011) dataset into eleven languages, which we use for
  evaluation.  
  * The English COPA training set together with the Social IQa (Sap+ 2019)
    training data are used for training
* en vs x
  * While accuracy on the English COPA recently reached 94.8% (Raffel+ 2020),
  * the SOTA on XCOPA is only around 70%
  * human-level performance on average at 97.6%

### 3.2.2 Retrieval from a Multilingual Pool

* Many previous retrieval benchmarks assume that e.g. a French query will be
  used to search over only English candidates. This setting is easy in the sense
  * not penalized for assigning a high rank to a less relevant candidate in the
    same or a similar language to the query. However, practical settings often
* XTREME-R includes two new related crosslingual retrieval tasks. The first
  * measure the extent to which cross-lingual representations are “strongly
    aligned” (Roy+ 2020), i.e. they place the semantically most related text
    pairs (e.g. a question and its answer) closest together in representation
    space, regardless of their language identities
  * entity linking as retrieving from a multilingual pool of entity descriptions
    * given an entity mention in context (Botha+ 2020). For both, 
    * we report performance as mean average precision at 20 (mAP@20).

#### LAReQA Language Agnostic Retrieval Question Answering (Roy+ 2020) is 

* a sentence retrieval task
* Each query has target answers in multiple languages, and 
  * models are expected to rank all correct answers above all incorrect answers,
    regardless of language. We use the LAReQA XQuAD-R dataset which contains
* 13,090 questions each of which has 11 target answers (in 11 languages) within
  the pool of 13,014 candidate answer sentences. Following Roy+ (2020), 
* we fine-tune models on the SQuAD v1.1 train set. The fine-tuned model is used
  to rank the 13K candidates for each question.  
  
#### Mewsli-X Mewsli (Multilingual Entities in News, linked), is an

* Mewsli requires linking a contextual entity mention to its entry in a
  language-agnostic knowledge base by retrieving the entity’s description from a
  multilingual candidate pool (Botha+ 2020). For XTREME-R , 
* we derive Mewsli-X as a new variant of Mewsli-9, still linking against
  WikiData (Vrandečić and Krötzsch, 2014).  Mewsli-X features 
  * 15K mentions in 11 languages: given a mention in context, the task is to
    retrieve the single correct target entity description from a candidate pool
    ranging over 1M candidates across all 50 languages of XTREME-R 
* Fine-tuning is done on a predefined set of English-only mention-entity pairs
  randomly sampled from English Wikipedia hyperlinks. More details in Appendix C 

* baseline systems on both tasks
  * we follow previous work (Roy+ 2020; Botha+ 2020) and train 
  * a dual encoder initialized from the pretrained model weights
    * inbatch sampled softmax loss (Gillick+ 2018).

## 3.3 Languages

* 50 languages (shown using their ISO 639-1 codes for brevity; new languages are
  bolded) belonging to 14 language families and two isolates:
  af, ar, az, bg, bn, de, el, en, es, et, eu, fa, fi, fr, gu, he, hi, ht, hu,
  id, it, ja, jv, ka, kk, ko, lt, ml, mr, ms, my, nl, pa, pl, pt, qu, ro, ru,
  sw, ta, te, th, tl, tr, uk, ur, vi, wo, yo, zh

## 3.4 Diagnostic and evaluation suite

* Challenge sets and diagnostic suites (Wang+ 2019a,b; Belinkov and Glass, 2019)
  * mostly limited to English, with a few exceptions (Gulordava+ 2018). As
  * created with a human in the loop, the main challenge for creating a large
    multilingual diagnostic suite is to scale the annotation or translation
* MultiCheckList 
  * we build on the CheckList (Ribeiro+ 2020) framework, which facilitates
    creating parameterized tests for models. CheckList enables the creation
  * test cases using templates, which test for specific behavioral capabilities
    of a model with regard to a downstream task.  Importantly, by relying on
  * We focus on translating English tests (templates and their fill-in values)
  * we translate the minimum functionality tests (MFT) of CheckList , which
    probe for general vocabulary and taxonomic knowledge in question answering.
  * We instruct translators to create separate variants of a template to
    disambiguate linguistic phenomena, such as gender of fillin values, question
    type, semantics of properties, etc. We automatically fill names in each

### Multilingual ExplainaBoard The standard practice in leaderboards is to

### Metadata Beyond breaking down performance by attributes, we would like to

# 4 Exper 7

# 6 challenges and directions in cross-lingual modelling: 

* the hardest cross-lingual tasks, 
  * question answering, structured prediction, and language-agnostic retrieval
* pre-training with crosslingual objectives that explicitly encourage learning
  task-relevant syntactic and semantic information; 
* identifying the best way to leverage parallel data 
  during both pre-training and fine-tuning; 
* developing fine-grained behavioral language-specific evaluation resources
  extending MultiCheckList and learning 
* introducing appropriate inductive biases informed by a more fine-grained
  understanding of multilingual models, such as 
  * robust cross-lingual answering of abstract questions; among many others. We

# Appendix B Languages

## Language characteristics 

* detailed overview of languages in XTREME-R including interesting typological
  differences in Table 7.  Wikipedia information is taken from Wikipedia 9 and
  linguistic information from WALS Online 10 .  XTREME-R includes members of the
* families
  * Afro-Asiatic, Austro-Asiatic, Austronesian, Dravidian, IndoEuropean,
    Japonic, Kartvelian, Kra-Dai, NigerCongo, Sino-Tibetan, Turkic, Uralic,
    Creole, and Quechuan
  * two isolates, Basque and Korean.

## Language diversity indices 

* according to the typology and language family indices of Ponti+ (2020), which
* shown in Table 8 for XTREME-R , XTREME (Hu+ 2020), and XGLUE (Liang+ 2020).
* The typology index is based on the mean entropy of the distribution over 103
  typological features from URIEL (Littell+ 2017) across the languages while the
* family index consists of the number of distinct language families divided by
  the total number of languages
* XTREME-R is similarly diverse while covering a larger number of languages.
