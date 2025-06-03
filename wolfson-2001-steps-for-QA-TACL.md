Break It Down: A Question Understanding Benchmark
Tomer Wolfson, Mor Geva, Ankit Gupta, M Gardner, Y Goldberg, D Deutch, J Berant
TACL, 2020. Author's final version

# Abstract

* break down a question into the requisite steps for computing its answer
* we introduce a Question Decomposition Meaning Representation (QDMR) for
  * ordered list of steps, expressed through natural language, that are
* crowdsourcing pipeline, showing that quality QDMRs can be annotated at scal
* Break dataset, containing over 83K pairs
* demonstrate the utility of QDMR by showing that
  * open-domain question answering on the HotpotQA dataset,
  * it can be deterministically converted to a pseudo-SQL formal language,
    which can alleviate annotation in semantic parsing applications
  * sequence-to-sequence model with copying that parses questions into QDMR
    * substantially outperforms several natural baselines
