Focus Attention: Promoting Faithfulness and Diversity in Summarization
Rahul Aralikatte, Shashi Narayan, Joshua Maynez, Sascha Rothe, Ryan McDonald
ACL 2021 arXiv:2105.11921 [cs.CL]

* Professional summaries are written with document-level information, such as
  the theme of the document, in mind
* hE, seq2seq decoders which simultaneously learn to
  focus on salient content, while deciding what to generate, at each step
* we introduce
  * Focus Attention Mechanism, a
    * simple yet effective method to encourage decoders to proactively
    * generate tokens that are similar or topical to the input document
  * Focus Sampling method to enable generation of diverse summaries, an area
    * currently understudied in summarization
* evaluated on the BBC extreme summarization task,
  * two SOTA models augmented with Focus Attention generate summaries that are
    closer to the target and more faithful to their input documents,
    outperforming their vanilla counterparts on ROUGE and multiple fait measures
* We also empirically demonstrate that Focus Sampling is more effective in
  generating diverse and faithful summaries than top-k or nucleus sampling

# 1 Intro

* Neural generation models generate outputs with low diversity
  due to standard likelihood training, approximate decoding objectives, and 
  lack of high quality multireference datasets
  (Fan+ 2018; Kulikov+ 2019; Freitag+ 2020; Choi+ 2020). Not much attention has
* diverse, yet faithful summaries
  * two goals are often challenging to achieve simultaneously (Hashimoto+ 2019)
  * a model can produce diverse outputs through sampling (Fan+ 2018; Holtzman+
    2020), but at the cost of quality
* Focus Attention MEchanism (or FAMe) to transformer-based seq2seq archits
* FAMe aims to perform source-side planning to focus the summary on supported
  * augments standard contextual representations with a 
    dynamic source-conditioned vocabulary biasing layer
* findings:
  * FAMe promotes summaries faithful to the source When evaluated on XSum
  * In the paper we focus on assessing FAMe on XSum 
  * other summarization and text editing results in Appendix B and C
  * experiments with two SOTA summarizers – RoBERTa S2S & PEGASUS  – show that
    both models generate summaries that are more faithful to their input
    documents when augmented with FAMe, in comparison with their vanilla
  * Faithfulness is measured through a variety of previously proposed metrics
    * In addition, we leverage the manually annotated doc-summary pairs for
      faithfulness from Maynez+ (2020) and train a scorer which serves as an
      efficient proxy for expensive human evaluations. We call this metric
      BERTFaithful
  * FAMe enables diverse summaries
    * FAMe, by design, supports Focus Sampling – a technique that is more
      effective in sampling topically relevant tokens to generate diverse, yet
      topically consistent and faithful outputs, than other sampling methods
      (Fan+ 2018; Holtzman+ 2020)
    * We demonstrate the effectiveness of our Focus Sampling technique using
      a variety of existing diversity and faithfulnes measures. Empirically, we
    * optimizing for high diversity often comes at the cost of faithfulness
    * provides a mechanism for trading-off faithfulness with diversity

# 2 Related Work

## Task-Specific Architectural Priors enhance seq2seq architectures with task-

* Pointer-generator style models (See+ 2017; Xu+ 2020) can accurately generate
  mostly extractive summaries by copying words from the source text via
* Text editing models (Malmi+ 2019; Dong+ 2019b; Mallinson+ 2020) cast
  * text generation as a sequence tagging problem with
    carefully selected edit operations required for the task.  Others focus on
* improving content selection to better
  * constrain the model to likely input phrases (Gehrmann+ 2018) or by
  * improving the representation of relevant input tokens (Zhou+ 2017).  Instead
* FAMe can be seen as a generalization of Pointer-generator or text-editing
  models via soft vocabulary learning
  * In fact, our F AME models achieve SOTA on text-editing tasks (Appendix C)

## Topic-Aware Generation Models, capturing document-level semantic information

* Barzilay and Elhadad (1997) use WordNet (Fellbaum, 1998) to model a text’s
  content relative to a topic based on lexical chains
* Lin and Hovy (2000) propose to learn topic signatures
* document-level topic information has been used for improving neural
  * LMs (Mikolov and Zweig, 12; Ghosh+ 16; Dieng+ 17; Karmaker Santu+ 19),
  * response generators (Xing+ 2017; Dziri+ 2019), and not surprisingly, neural
  * summarizers (Narayan+ 2018; Ailem+ 2019; Wang+ 2020c)
    * Narayan+ (2018) and Ailem+ (2019), use a pretrained LDA; (Blei+ 2003)
    * Wang+ (2020c) use Poisson factor analysis (Zhou+ 2012), to synthesize
* we dynamically learn a target-induced topic distribution for the input under
  * the human-written summary as a proxy for the input document

## Faithful Generation Models

* Cao+ (2017) force faithful generation by conditioning on both source text and
  extracted fact descriptions from the source text
* Song+ (2020) propose to jointly generate a sentence and its syntactic
  dependency parse to induce grammaticality and faithfulness
* Tian+ (2019) learn a confidence score to ensure that the model attends to the
  source whenever necessary
* Wang+ (2020d)
  * new input-output matching and embedding similarity losses
    to alleviate hallucination issues
* consistency remains an open problem (Gabriel+ 2020)

## Diverse Generation Models, human-like outputs

* Vijayakumar+ (2018) and Kulikov+ (2019) diversify beam search, using a
  task-specific scoring function, or constrain beam hypotheses to be
  sufficiently different
* avoid text degeneration by truncating the unreliable tail of the probability
  distribution at each decoding step, either by sampling from
  * the top-k tokens (Top-k Sampling; Fan+ 2018) or by sampling from
  * a dynamic nucleus of tokens with the bulk of the probability mass
    (Nucleus Sampling; Holtzman+ 2020)
* modify the training objective to make the distribution sparse (Martins+ 2020)
* assign lower probability to unlikely generations (Welleck+ 2019a)
* For conditional text generation, most work focuses on generating diverse
  * questions (Narayan+ 2016; Dong+ 2017; Sultan+ 2020; Wang+ 2020b) or
  * paraphrases (Li+ 2016b; Dai+ 2017; Xu+ 2018; Cao and Wan, 2020)
* Following Gehrmann+ (2018), Cho+ (2019) use a mixture of experts to sample
  different binary masks on the source sequence
* Our focus sampling is similar to top-k and nucleus sampling methods
  * it truncates the tail of the probability distribution
  * hE, instead of truncating it at each decoding step, it
    biases the decoder proactively to generate output from a set of tokens which
    are topically-relevant to the input
