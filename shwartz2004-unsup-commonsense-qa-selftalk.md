Unsupervised Commonsense Question Answering with Self-Talk
Vered Shwartz, Peter West, Ronan Le Bras, Chandra Bhagavatula, Yejin Choi
EMNLP 2020 arXiv:2004.05483 [cs.CL]

* Natural language understanding involves reading with implicit background knowl
* Current systems either rely on
  * pre-trained language models as the sole implicit source of world knowledge,
  * external knowledge bases (KBs) to incorporate additional relevant knowledge.
* We propose an unsupervised framework based on self-talk as a novel alternative
  to multiple-choice commonsense tasks
* Inspired by inquiry-based discovery learning (Bruner, 1961),
* our approach inquires language models with a number of information seeking qs
  e.g. "what is the definition of ..." to discover additional background knowl.
* Empirical results demonstrate that the self-talk procedure
  * substantially improves the performance of zero-shot language model baselines
    on four out of six commonsense benchmarks, and
  * competes with models that obtain knowledge from external KBs. While our
  * hE, the self-talk induced knowledge even when leading to correct answers is
    not always seen as useful by human judges, raising interesting questions
    about the inner-workings of pre-trained language models for commonsense
    reasoning.

# 1 Intro

* relying on implicit background knowledge is ubiquitous across NLU tasks such
  * reading comprehension (Hirschman+ 1999) and
  * recognizing textual entailment (Dagan+ 2013), and even more so in
  * tasks dedicated to commonsense reasoning
    such as the Winograd schema challenge (Levesque+ 2012).
* Most current NLU models rely on pretrained language models
  * standard practice is to fine-tune a pre-trained LM on task-specific data.
  * Alternatively, LM score is used to rank answer choices in a zero-shot setup
    (Wang+ 2019; Bosselut and Choi, 2019)
  * In both setups, improvement greatly due to the world knowledge in LMs
    (Petroni+ 2019; Davison+ 2019)
* hE, LMs as knowledge providers suffer from various shortcomings:
  * insufficient coverage: due to reporting bias, many
    trivial facts might not be captured by LMs because they are rarely written
    (Gordon and Van Durme, 2013).
  * insufficient precision:
    * the distributional training objective increases the probability of
      non-facts that are semantically similar to true facts, as in negation
      (“birds cannot fly”; Kassner and Schütze, 2019)
    * excel in predicting the semantic category of a missing word, but might
      predict the wrong instance in that category
      (e.g., depending on the phrasing, BERT sometimes predicts red as the color
      of a dove)
  * limited reasoning capabilities: it is unclear that LMs are capable of
    performing multiple reasoning steps involving implicit knowledge.
* To increase the coverage of high-precision world knowledge and facilitate
  multi-hop reasoning by making intermediate reasoning steps explicit,
  prior work incorporated
  * KBs (e.g. ConceptNet; Speer and Havasi, 2012) and
  * knowledge-informed models (Xia+ 2019; Bosselut and Choi, 2019; Chen+ 2019)
* we study pre-trained LMs as an alternative to external KBs
  in providing knowledge to commonsense question answering tasks. We propose
  * an unsupervised model that uses an LM as the answer scorer, and
  * a (possibly different) LM as a knowledge source. We formulate the
  * process of obtaining relevant knowledge as a self-talk, inquirybased
* steps:
  * generating natural-language “clarification questions” conditioned on context
  * generating their corresponding answers (“clarifications”), and
  * incorporating the clarifications as additional context.
* no additional supervision. Yet, we show that
* on 4 out of 6 tasks it substantially improves upon a zero-shot baseline that
  relies on LM score alone and
* performs on par, and sometimes better than, models that use external knowl scr
* even among the clarifications that helped the prediction, humans perceived
  many as unhelpful or even incorrect, demonstrating that LM-based models often
  solve problems correctly for seemingly incorrect reasons. Our results call for
  future research on robust and correct knowledge integration to LM-based QA

## 5.1 Useful Clarifications

We define a clarification as useful if
  * it is the clarification with the best LM score in its instance (i.e., the
    clarification used in practice); and
  * the instance was incorrectly predicted by the zero-shot baseline but
    correctly predicted by the self-talk model
* mwthod
  * we sampled up to 50 useful clarifications for each combination of task and
    knowledge source, using the best performing LM (See Table 3 in the appendix
    for examples)
  * We showed crowd-sourcing workers an instance along with a clarif Q & A and
    asked them:
    * whether the question is grammatical, not entirely grammatical but
      understandable, or completely not understandable; and if the answer was
      anything but “completely not understandable”,
    * whether the question is relevant, i.e.  on topic with the instance.  We
      asked the same questions about the answer, in addition to:
    * whether the answer is factually correct or likely true; and
    * whether the answer adds helpful information to solve the instance.
* Fleiss Kappa κ = 0.43 (Landis and Koch, 1977).
* across tasks and resources, most clarifications are grammatical or at least
  understandable
  * Among the clarifications considered grammatical or understandable, the right
  * Most clarifications were considered relevant to the context and correct, but
    only 40% on average were considered helpful. Considering that
  * these are all clarifications that indeed helped the model, this is an
  * not completely unexpected finding: the model utilizes knowledge that humans
    wouldn’t consider as helpful
* Breaking down by knowledge source, the ratio of clarifications
  * XLNet performs worse on all measures.
  * ConceptNet’s clarifications are often judged as irrelevant likely because
    * limited to a very specific type of clarification (the relationship between
      a pair of terms)
  * It’s not too surprising that clarifications generated by LMs were sometimes
    judged as factually incorrect. We also note that
  * COMeT generated factually correct clarifications for Social IQa (which is
    based on ATOMIC, on which COMeT was trained), and
  * ConceptNet generated factually correct clarifications for Common-SenseQA
    (which is based on ConceptNet).
  * pre-trained LMs do particularly well in definitions.

# 6 Related Work

## 6.2 Extracting Knowledge from LMs

* Petroni+ (2019) showed that such LMs can be used in a KB completion task over
  ConceptNet and Wikidata (Vrandečić and Krötzsch, 2014) 
  * by converting KB relations into natural language templates and 
    querying the LM for the missing part in the triplet 
  * e.g. “Dante was born in [MASK]” assigns the highest probability to Rome.
* Davison+ (2019) similarly showed that BERT assigns higher scores to natural
  language fragments of true rather than fictitious ConceptNet triplets, and
  semi-automated the template creation by using GPT2 to score hand-crafted
  templates.  While both works have shown somewhat promising results, 
* hE
  * Kassner and Schütze (2019) showed that negated facts are also considered
    likely by the LM, while 
  * Logan+ (2019) pointed out that LMs may over-generalize and produce incorrect
    facts such as “Barack Obama’s wife is Hillary”.
