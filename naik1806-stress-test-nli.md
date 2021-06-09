Stress Test Evaluation for Natural Language Inference
Aakanksha Naik, Abhilasha Ravichander, Norman Sadeh, Carolyn Rose, Graham Neubig
COLING 2018 arXiv:1806.00692 [cs.CL]

# 1 Intro

* inspired by the work of Jia and Liang (2017) (and other related work: §5),
  * adversarial evaluation for reading comprehension by
  * adding a distracting sentence at the end of a paragraph
    (known as concatenative adversaries), and evaluating models on this test
  * cannot easily be applied to NLI as
    * the adversarial perturbations suggested are not label preserving, that is
    * the perturbations may decrease system performance but are not interpretabl
    * premise-hypothesis pairs in inference usually consist of a single
      sentence, but concatenative adversaries break this assumption.  In
* we are also interested in evaluating model competence on types of reasoning

# 2 examine the predictions of the best-performing sentence encoder model on
MultiNLI (Nie and Bansal, 2017), and create a typology of phenomena that it
finds challenging

1. Word Overlap (29%): Large word-overlap between premise and hypothesis
   sentences causes wrong entailment prediction, even if they are unrelated
   Very little word overlap causes a prediction of neutral instead of
   entailment
2. Negation (13%): Strong negation words (“no”, “not”) cause the model to
   predict contradiction for neutral or entailed statements
3. Antonymy (5%): Premise-hypothesis pairs containing antonyms (instead of
   explicit negation) are not detected as contradiction by the model
4. Numerical Reasoning (4%): For some premise-hypothesis pairs, the model is
   unable to perform reasoning involving numbers or quantifiers for correct
   relation prediction
5. Length Mismatch (3%): The premise is much longer than the hypothesis and this
   extra information could act as a distraction for the model
6. Grammaticality (3%): The premise or the hypothesis is ill-formed because of
   spelling errors or incorrect subject-verb agreement
7. Real-World Knowledge (12%): These examples are hard to classify without some
   real-world knowledge
8. Ambiguity (6%): For some instances, the correct answer is unclear to humans
   These are the most difficult cases
9. Unknown (26%): No obvious source of error is discernible in these samples

# 3 methodology to automatically construct stress tests, which may cause models
that suffer from similar weaknesses to fail (§3)

The resulting tests make it possible to perform evaluation on a
phenomenon-by-phenomenon basis, which is not the case for Jia and Liang (2017) 3

# 4 performance of four SOTA models on the MultiNLI dataset on our constructed
stress tests (§4), and observe performance drops across stress tests. We view
these results as a first step towards robust, fine-grained evaluation of NLI
systems. To encourage development of models that perform true natural language
understanding for NLI, we release our code and all stress tests for future
evaluation 4
