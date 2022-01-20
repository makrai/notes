What BERT is not: Lessons from a new suite of psycholinguistic diagnostics LM
Allyson Ettinger
arXiv:1907.13528

https://github.com/aetting/lm-diagnostics

# Abstract

* we introduce a suite of diagnostics drawn from human language experiments,
  * allow us to ask targeted questions about the information used by LMs
* results: BERT
  * can generally distinguish good from bad completions
    involving shared category or role reversal,
    albeit with less sensitivity than humans,
  * robustly retrieves noun hypernyms, but
  * struggles with challenging inferences and role-based event prediction
  * clear insensitivity to the contextual impacts of negation
* from the conclusion: we must be conservative in the conclusion
  * Because these sets are small,
  * different formulations may yield different performance

# 1 Intro

* diagnostics targeting a range of linguistic capacities, drawn from psycholing
  * advantages: because of their origin in psycholinguistics,
    * carefully controlled to ask targeted questions about linguistic capabilits
    * ask these questions by examining word predictions in context,
    * allows us to study LMs without any need for task-specific fine-tuning
* distinctive properties of our diagnostics
  * chosen specifically to reveal insensitivities in predictive models, as
    evidenced by patterns that they elicit in human brain responses (N400)
  * beyond the syntactic focus seen in existing LM diagnostics
    * commonsense/pragmatic inference, semantic roles and event knowledge,
      category membership, and negation
* Each of our diagnostics is set up to support tests of
  * word prediction accuracy and
  * sensitivity to distinctions between good and bad context completions
* we focus on the BERT model here as an illustrative case study
  * the diagnostics are applicable for testing of any LM
* two main contributions
  * a new set of targeted diagnostics for assessing linguistic capacities
  * shed light on strengths and weaknesses of the popular BERT model
    * struggles with challenging commonsense/pragmatic inferences and
      role-based event prediction
    * generally robust on within-category distinctions and role reversals, but
      with lower sensitivity than humans, and
    * very strong at associating nouns with hypernyms
    * fails completely to show generalizable understanding of negation

# 2 Motivation for use of psycholinguistic tests on LMs

* we are not testing whether LMs are psycholinguistically plausible
* it is the pre-training that seemingly underlies the generalization power

# 3 Related Work

* fine-grained classification tasks to probe information in
  * sentence embeddings (Adi+ 2016; Conneau+ 2018; Ettinger+ 2018), or
  * token-level and other sub-sentence level information in contextual embeds
    (Tenney+ 2019b; Peters+ 2018b)
  * specific linguistic phenomena such as
    * function words (Kim+ 2019)
  * overall level of “understanding”: semantic similarity and entailment
    (Wang+ 2018; Bowman+ 2015; Agirre+ 2012; Dagan+ 2005; Bentivogli+ 2016), and
  * curated versions of these tasks to test for specific linguistic capabilities
    (Dasgupta+ 2018; Poliak+ 2018; McCoy+ 2019)
  * Our diagnostics test LMs in their natural setting—via word predict in contxt
* analyzing linguistic capacities of LMs specifically
  * dominated by syntactic testing
  * employing targeted evaluations modeled after psycholinguistic tests
    (Linzen+ 2016; Gulordava+ 2018; Marvin and Linzen, 2018; Wilcox+ 2018;
    Chowdhury and Zamparelli, 2018; Futrell+ 2019)
    * typically draw conclusions based on LMs’ output probabilities
* internal dynamics underlying LMs’ capturing of syntactic info,
  * in different components of the LM and
    at different timesteps within the sentence
    (Giulianelli+ 2018)
  * individual units (Lakretz+ 2019)
  * semantic phenomena like negative polarity items are tested in some studies
    (Marvin and Linzen, 2018; Jumelet and Hupkes, 2018)
    * still firmly rooted in the notion of detecting structural dependencies
  * we including commonsense/pragmatic reasoning, semantic role and event
    knowledge, category membership, and negation
    * Our tests are also distinct in eliciting a very specific response profile
      in humans, creating unique predictive challenges for models, see 4.2
* we not only compare word probabilities—we also examine word prediction direct,
  * word prediction accuracy as a test of LMs’ language understanding
  * LAMBADA dataset (Paperno+ 2016), tests models’ ability to predict the final
    word of a passage, in cases where the final sentence alone is insufficient
    * not controlled to isolate and test the use of specific types of info
* examining linguistic characteristics of the BERT model itself
  * Clark+ (2019) analyze the dynamics of BERT’s self-attention mechanism,
    probing attention heads for syntactic sensitivity and finding that
    individual heads specialize strongly for syntactic and coreference relations
  * Lin+ (2019) also examine syntactic awareness in BERT by
    * syntactic probing at different layers, and
    * examination of syntactic sensitivity in the self-attention mechanism
  * Tenney+ (2019a) test a variety of linguistic tasks at different layers
  * Goldberg (2019) tests BERT on several of the targeted syntactic evaluations
    described above for LMs, finding
    BERT to exhibit very strong performance on these measures
    * Our work:
      directly via the word prediction mechanism, and in
      expanding beyond the syntactic tests

# 4 Leveraging pling studies. The power in our diagnostics

* In this section we provide relevant background on human language processing,
  and explain how we use this information to choose the particular tests

## 4.1 Background: prediction in humans

* human responses to words in context, in order to better understand the
  information that our brains use to generate predictions
* two types of predictive human responses are relevant to us here:

### Cloze probability

* humans are given an incomplete sentence and tasked with
  filling their expected word in the blank
  * gold standard for best human prediction in context
  * not under any time pressure, so they have the
  * opportunity to use all available information from the context to predict

### N400 amplitude

* brain response detected by measuring electrical activity at the scalp (by EEG)
* to gauge how expected a word w is in a context c
  * appears to be sensitive to fit of a word in context
  * correlate with cloze in many cases (Kutas and Hillyard, 1984)
  * predicted by LM probabilities (Frank+ 2013)
  * expectations reflected in the N400 sometimes deviate from the more
    fully-formed expectations reflected in the untimed cloze response

## 4.2 Our diagnostic tests

* all drawn from human studies that have
  * revealed divergences between cloze and N400 profiles
  * i.e. N400 response suggests a level of insensitivity to certain information
    when computing expectations, causing a deviation from the fully-informed
    cloze predictions
  * present particularly challenging prediction tasks, tripping up models that
    fail to use the full set of available information

# 5 Datasets 4

* Each of our diagnostics supports three types of testing:
  word prediction accuracy, sensitivity testing, and qualitative prediction anal
* constructed to constrain the information relevant for making word predictions
* word prediction accuracy, we use the most expected items from human cloze
  probabilities as the gold completions
* sensitivity testing, we
  * compare model probabilities for good versus bad completions— specifically,
  * on which the N400 showed reduced sensitivity in experiments
  * whether LMs will show similar insensitivities
* qualitative predictions of models’ top predictions
  because these items are constructed in such a controlled manner,
  * qualitative analysis of models’ top predictions can be highly informative
* In all tests, the target word to be predicted falls in the final position
  * tests should function similarly for either left-to-right or bidirectional
  * only token probabilities in context, they are
    equally applicable to the masked LM setting of BERT as to a standard LM
  * we filter out items for which the expected word is not in BERT’s single-word
* small test sets, due to their origin in psycholinguistic studies
  * hand-designed by cognitive scientists to test predictive processing

## 5.1 CPRAG-102: commonsense and pragmatic inference

* tests sensitivity to differences within semantic category
> He complained that after she kissed him, he couldn’t get the red color off
> his face. He finally just asked her to stop wearing that (lipstick/mascara)
* Federmeier and Kutas (1999) tested how brains would respond to different types
  of context completions

### Information needed for prediction

* For instance, in Table 1,
  * commonsense knowledge informs us that
    red color left by kisses suggests lipstick, and
  * pragmatic reasoning allows us to infer that
    the thing to stop wearing is related to the complaint
* As in LAMBADA, the final sentence is not supporting prediction on its own
  * Unlike LAMBADA, the consistent structure of these items
  * none of these items contain the target word in context,
    * commonsense inference rather than coreference
  * avg Human cloze probabilities for expected completions is .74

### Sensitivity test. The Federmeier and Kutas (1999) study found that

* inappropriate completions (e.g., mascara, bracelet) had
  * cloze probabilities of virtually zero (average cloze .004 and .001, resp),
  * N400 showed some expectation for completions that shared a semantic category
    with the expected completion (e.g., mascara, by relation to lipstick)
* sensitivity test targets this distinction,
  testing whether LMs will favor inappropriate completions

### Data: we filter out six/40 to accommodate BERT’s single-word vocabulary

## 5.2 ROLE-88: event knowledge and semantic role sensitivity

* sensitivity to impact of role reversals. Table 2 shows an example item pair
> the restaurant owner forgot which customer/waitress the waitr/custo had served
* items come from a human experiment by Chow+ (2016)

### Information needed for prediction

* requires event knowledge about
  typical interactions between types of entities in the given roles

### Sensitivity test

* Chow+ (2016) study found that although each completion (e.g., served) is
  good for only one of the noun orders and not the reverse, the
  * N400 shows a similar level of expectation for the target completions
    regardless of noun order. Our sensitivity test targets this distinction,
  * cloze probabilities show strong sensitivity to the role reversal, with
    average cloze difference of .233 between good and bad contexts

### Data: we filter to 88/120 orig final items

## 5.3 NEG-136: negation

* negation, along with knowledge of category membership. Table 3 shows examples
> A robin is (not) a bird/tree
* test items come from a human study by Fischler+ (1983)

### Information needed for prediction

* the negative contexts in these items are highly unconstraining
  (A robin is not a ~), prediction accuracy is not a useful measure
  * We test prediction accuracy for affirmative contexts only
* allows us to test models’ use of hypernym information (robin < bird)
* Targeting of negation happens in the sensitivity test

### Sensitivity test. The Fischler+ (1983) study found that

* N400 shows more expectation for true completions in affirmative sentences
  * fails to adjust to negation: more expectation for false continuations
* testing whether LMs will show similar insensitivity to impacts of negation
  * we use truth judgments rather than cloze probability

### Data Fischler+ provide the list of 18 subject nouns and 9 category nouns

* We refer to these 72 simple sentences as NEG-136-SIMP
* All target words are in BERT’s single-word vocabulary

### Supplementary items, designed to test effects of naturalness

* Nieuwland and Kuperberg (2008) followed up on the Fischler+ (1983) experiment,
* affirmative and negative sentences chosen to be more “natural”, and
  contrasting these with affirmative and negative sentences chosen to be less
  natural
  * Natural: _Most smokers find that quitting is (not) very (difficult/easy)_
  * less natural: _Vitamins and proteins are (not) very (good/bad)_
* We refer to these supplementary 64 items as NEG-136-NAT

# 6 Experiments 6

* We test two versions of the pretrained model: BERT BASE and BERT LARGE (uncas)
  * BASE has 110M parameters, and 7 BERT LARGE has 340M
* Following Goldberg (2019), we also add a [CLS] token to the start of each
  sentence to mimic BERT’s training conditions
* because of BERT’s bidirectionality: we include a period and a [SEP] token
* Logits produced by the language model for the target position are
  softmax-transformed to obtain probabilities comparable to human cloze probs

# 7 Results for CPRAG-102 6

## 7.1 Word prediction accuracies

* to what extent BERT can achieve this performance based on simpler cues like
  * bow
    * To test word order, we shuffle the words in each item’s first sentence,
  * n-gram context.
    * To test adequacy of n-gram context, we truncate the second sentence,
      removing all but the two words preceding the target word (“Trunc”)—
    * leaving generally enough syntactic context to identify the part of speech,
      as well as some sense of semantic category (on top of the thematic setup
      of the first sentence), but removing other information from the second
* each of these individual perturbations causes a notable drop in accuracy

## 7.3 Qualitative

* in the first example
  * BERT has correctly zeroed in on things that one might borrow, but it
  * fails to infer that the thing is to be used for cutting lumber
* 2nd: failure to detect the snow-shoveling theme of the second item
* third example shows that BERT has
  * identified an animal theme (unsurprising, given the words zoo and animal),
  * not applying the phrase black and white stripes to identify the completion

# 8 Results for ROLE-88 8

## 8.1 Word prediction accuracies

* perturbations of the contexts
  * replacing the obj/subj with a generic substitute _one/other_
* removing either the object (“-Obj”) or the subject (“-Sub”)
  * relatively little effect on the accuracy of BERT BASE for either k = 1 or 5
  * the accuracy of LARGE drops substantially
  * i.e. BERT BASE is relying primarily upon one or the other
* items in this set are overall less constraining than those in Section 7
  * humans converge less clearly on the same predictions
  * To investigate the effect of constraint level,
    we divide items into four bins by top cloze value per sentence
    * highest cloze bin yields much higher model accuracies than the other three

# 9 Results for NEG-136 10

* errors consist exclusively of cases in which BERT completes the sentence
  with a repetition of the subject noun, e.g., _A daisy is a daisy_

## 9.4 Increasing naturalness

* in the natural sentences, BERT prefers true statements for both affirmative
  and negative contexts
* less natural sentences show the pattern exhibited on NEG-136-SIMP, in which
  * BERT prefers true statements in a high proportion of affirmative sentences,
  * and in 0% of negative sentences.  Table 15 contains BERT
    LARGE predictions on two pairs of sentences from the “Natural” sentence set.
* even when BERT’s first prediction is appropriate in the context,
  the top candidates often contradict each other (e.g., difficult and easy)
* even with these natural items, sometimes the negation is not enough to reverse
  * _A fast food dinner on a first date is(n't) very good/nice/romantic_

# 10 Discussion 11

* CPRAG-102, we see that both models
  * can predict the best completion approximately half the time (at k = 5), and
  * rely non-trivially on word order and full sentence context
  * hE, perturbations: successful predictions suggest that some of BERT’s
    success may exploit loop-holes
    * we examine predictions on challenging items
  * weaknesses in the commonsense and pragmatic inferences targeted by this set
  * BERT can also prefer good completions to bad semantically-related
    completions in a majority of items, but many of these probability
    differences are very small, much less than that of humans
* ROLE-88, BERT’s accuracy in matching top human predictions is much lower, with
  BERT LARGE at only 37.5% accuracy
  * BERT LARGE has more sensitivity than BERT BASE to the interaction between
    subject and object nouns
  * both models are typically able to use noun position to prefer good
    completions to role reversals, but the
    * differences are on average even smaller than on CPRAG-102, indicating
  * ability to distinguish role reversals suggests that the low word prediction
    accuracies are not due to insensitivity to word order per se, but rather to
    weaknesses in event knowledge or understanding of semantic role implic
* NEG-136 allows us to zero in with particular clarity on a divergence between
  * simple sentences describing category membership, BERT shows a complete
    inability to prefer true over false completions for negative sentences
  * impressive ability to associate subject nouns with their hypernyms,
    but when negation reverses the truth of those hypernyms, BERT continues to
    predict them nonetheless. By contrast, when presented with sentences that
    are more “natural”, BERT does reliably prefer true completions to false,
    with or without negation
  * latter sentences are designed to differ in naturalness, in all likelihood it
    is not naturalness per se that drives the model’s relative success on
    them—but rather a higher frequency of these types of statements in the
    training data

# 11 Conclusion

* sensitivity to role reversal and same-category distinctions, albeit < humans,
* succeeds with noun hypernyms, but it
* struggles with challenging inferences and role-based event prediction
* clear failures with the meaning of negation
