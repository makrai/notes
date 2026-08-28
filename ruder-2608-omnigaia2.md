OMNILINGUAL GAIA2: Evaluating the Multilingual Gap in Frontier AI Agents
Andrea Caciolai, Pere-Lluís Huguet Cabot, Chierh Cheng, Albert Ventayol-Boada,
  Gabriel Mejia Gonzalez, Christophe Ropers, Lucas Bandarkar, Sebastian Ruder,
  Darlene Sakakihara, Elliot Yun, P Andrews, G Mialon, R Froger, MR Costa-jussà
arXiv:2608.08775v2 [cs.CL] 11 Aug 2026

Dataset: https://huggingface.co/datasets/facebook/omnilingual-gaia2
Code: https://github.com/facebookresearch/meta-agents-research-environments

* Agentic benchmarks aim to measure how well AI agents plan, search, execute,
  and recover within realistic multi-tool environments, but 
  * hE are almost exclusively in English. As 
  * AI agents are globally deployed to a linguistically diverse user base,
* We introduce OMNILINGUAL GAIA2, 
  a machine-translated expansion (with partial human-expert validation) of the
  GAIA2 agentic benchmark, covering 
  * ten target languages spanning five writing systems, paired with 
    a localised and human-calibrated multilingual verifier.
* Evaluating seven frontier and open-weight agents, we find 
  a universal cross-lingual gap of 8.8–18.4 pass@3 points that is
  agent-asymmetric in magnitude, 
  concentrates on tool-orchestration rather than quantitative reasoning, and
  does not close with model scale. A 
* stratified error attribution decomposes the gap as 
  predominantly model-driven (55%), with a bounded 
  translation-contamination floor of only 6.4% of scenario–language pairs
* Human-expert linguistic analysis further identifies 
  morphological cue loss and amplified ambiguity as 
  the primary failure mechanisms in non-Latin-script languages. Our results
* multilingual agentic evaluation must become a standard part of reporting
  globally deployed agents

# Introduction

* AI agents—systems that plan, invoke tools, and act autonomously in an env
  (Wooldridge and Jennings, 1995; Franklin and Graesser, 1996; 
  Russell and Norvig, 2009)
  * Michael Wooldridge and Nicholas R Jennings. 
    Intelligent agents: Theory and practice. 
    The knowledge engineering review, 10(2): 115–152, 1995.
  * Stan Franklin and Art Graesser. 
    Is it an agent, or just a program?: A taxonomy for autonomous agents
    International workshop on agent theories, architectures, and languages,
    pages 21–35. Springer, 1996.
  * moved from objects of research curiosity to 
    real products deployed and used by hundreds of millions of people worldwide,
    thanks to the rapid advancements of Large Language Model (LLM) capabilities
    (Wang+ 2024; Xi+ 2025; Yang+ 2025; Staufer+ 2026).
  * Those users do not all speak English, yet 
    hE our ability to measure whether these agents actually work has barely kept
    pace with their deployment, and least of all beyond English. Even 
  * in English the ground is unsteady: developers who anticipated a 24% speedup
    from AI tools were instead slowed by 19% (Lobentanzer, 2026), and observed
    * task coverage remains a fraction of what has been hypothesised
      (Massenkoff and McCrory, 2026; Johnston+ 2026).
  * another language is, at the time of writing, largely unmeasured.
  * In English, this gap is being rapidly closed, with considerable work
    * agentic benchmarks that probe 
      how well these systems plan, search, and use tools 
      (Mialon+ 2024; Qin+ 2024; Xie+ 2024; Patil+ 2025; Deng+ 2026; 
      Barres+ 2025; Merrill+ 2026).
  * Beyond English, evaluation has barely followed: for frontier agentic systems
    * eg System Card: Claude Opus 4.7
    * multilingual assessment remains largely confined to 
      single-turn, knowledge-based question answering datasets such as 
      eg GLOBAL-MMLU (Singh+ 2025), when it is performed at all 2 .
* we present O MNILINGUAL GAIA2, a high-quality machine-translated expansion of
  GAIA2 (Froger+ 2026), paired with 
  + a multilingual verifier and a frontier multilingual agentic leaderboard. Our
* contributions are: 1 See 2 No for instance System Card: Claude Opus 4.7
  1. A multilingual agentic benchmark. We release OMNILINGUAL GAIA2, 
    a machine-translated (MT) expansion of GAIA2 that covers 
    * four capabilities, namely adaptability, ambiguity, execution, and search,
    * ten target languages spanning five writing systems while 
      preserving the executable structure required by the verifier (§3).  
    * We select the translation system through a per-language quality evaluation
      and design a MT pipeline that enforces cross-surface terminology
      consistency across scenarios (§3.2). 
    * App A: our language-coverage contribution relative to existing datasets
  2. A human-calibrated multilingual verifier. 
    * We localise the LLM-as-a-Judge (LLMaaJ) component of the GAIA2 verifier,
    * we ensure its multilingual quality via calibration on a golden set of
      human-annotated and MT agent traces (§3.3).
  3. A cross-lingual multi-agent leaderboard and 
    empirical characterisation of the gap. 
    * We evaluate a heterogeneous cohort of seven AI agents spanning 
      * frontier closed-source systems and open-weights models of 
        various sizes and architectures, and find that: 
    1. the cross-lingual gap is 
      universal in direction but agent-asymmetric in magnitude (8.8–18.4
      percentage points, pp)
    1. capability ordering (search > execution > adaptability > ambiguity)
       is stable across languages 
      * translation reshapes the level without reordering difficulty; 
    1. agents shift their behavioural strategy off English, 
      increasing exploratory reads while reducing state-changing writes; 
    1. the cross-lingual gap is concentrated in tool-orchestration and
       final-response quality, not in quantitative or categorical reasoning; and 
    1. the gap does not close with model scale within a single family (§4, §5).
  4. An error taxonomy and gap attribution showing 
    * the gap is predominantly model-driven. We define 
    * a five-category verdict taxonomy and apply 
    * a stratified automatic triage protocol that 
      corrects for the selection bias of deterministic-only analysis. The
    * 55% of the cross-lingual gap to genuine agent failures, 
      35% to translation defects, and 
      10% to verifier artefacts (§6.1,§6.2).  
    * Extending the analysis to the whole benchmark, we bound 
      * MT-induced contamination at only 6.4% of all scenario–language pairs,
      * ie the benchmark predominantly measures model capability 
        rather than translation noise.
  5. A human-expert linguistic analysis 
    identifying failure mechanisms per error category. 
    * Three native-speaker linguists independently inspect agent traces 
      across the four capabilities and surface qualitative patterns: 
    1. translation defects — MT 
      * amplifies latent English ambiguities and 
      * silently drops directional/morphological constraints that disambiguate
    1. verifier artefacts — verifier strictness is 
      language-dependent, 
      stochastic, and can 
      hallucinate rejections of correct content; 
    1. agent failures — morphological cue loss (articles, plural marking) in
       cmn/jpn/ind drives the most consequential over-actions; and 
    1. measurement artefacts — 
      action-count grading penalises harmless self-corrections that reach the
      correct end state, inflating the apparent failure rate (§6.3).
* OmniGAIA2 is part of Meta’s broader Omnilingual effort to extend AI capability
  beyond the handful of high-resource languages that dominate current systems,
  alongside 
  * Omnilingual ASR (Omnilingual-ASR-team+ 2025) for 1,600+ languages and
  * Omnilingual MT (Omnilingual-MT-Team+ 2026) at comparable scale. Where those
  * BOUQuET (Andrews+ 2025) expands the translation-evaluation frontier,
  * OmniGAIA2: evaluation to interactive, tool-using agentic tasks beyond eng

# 2 Related Work

## Multilingual agentic evaluation. 

* Efforts have so far been narrow along at least one axis: 
  the set of languages, the class of agents evaluated, or 
  the fidelity of the verifier under translation. 
* In the web-agent setting, 
  * X-WebAgentBench (Wang+ 2025) translates a subset of navigation tasks into
  several languages, while 
  * Ticket-Bench (Sales Almeida+ 2025) regionalises a customer-service
    function-calling benchmark across six European locales. On
  * tool-calling sub-capability alone, 
    MLCL (Luo+ 2026) isolates cross-lingual robustness of API selection and
    argument copying, 
    decomposing the multilingual gap into query-comprehension and
    parameter-value-mismatch components.  
  * MASSIVE-Agents (Kulkarni+ 2025), which covers 52 languages, was 
    created by cleaning the original MASSIVE dataset and then 
    reformatting it for evaluation within the Berkeley Function-Calling
    Leaderboard (BFCL) framework
  * MAPS (Hofman+ 2026) pairs 
    a ten-language agent suite with a security-focused analysis, and 
  * TelcoAgent-Bench (Bariah+ 2026) evaluates multilingual telecom agents in
    English and Arabic, finding that 
    performance gaps widen in unconstrained bilingual settings—a pattern
    consistent with our own findings across ten languages. 
* Closest to our setting, three recent efforts 
  * translate structurally identical benchmarks across languages while
    preserving their executable verifiers: 
    * SEATauBench (Nguyen+ 2026) adapts τ 2 -Bench into five Southeast Asian ls
    * PolyWorkBench (Li+ 2026) constructs 
      a native multilingual long-horizon agent benchmark from scratch, and 
    * our most direct sibling, 
      GAIA-v2-LILT (Kim+ 2026), localises GAIA across five target languages
      through a translate-then-adapt pipeline that 
      modifies task semantics to fit the locale. 
* synthetic-generation approaches 
  (IntellAgent (Levi and Kadar, 2025), TaskCraft (Shi+ 2026), 
  AgentSynth (Xie+ 2026)), 
* MT-based expansion 
  preserves an existing verifier’s executable structure while scaling ling,
  following the hybrid MT-then-expert-review pipeline of MMLU-ProX (Xuan+ 2025)
  at 29 languages. 
* Benchmark validity grounds our analysis: 
  the Agentic Benchmark Checklist (ABC) (Zhu+ 2026) documents 
  systematic outcome~ and task-validity failures in widely used agentic
  benchmarks; 
  * we address these by 
    * calibrating the verifier against human labels (§3.3) and by 
    * decomposing the observed gap into translation-, model-, and verifier-side
      factors with a bounded contamination floor (§6.3).
* O MNILINGUAL GAIA2 is, to our knowledge, the first extension of GAIA2 that 
  1. covers ten target languages spanning five writing systems (Appendix A)
     while preserving the executable verifier end-to-end, 
  1. reports a paired comparison 
    across a heterogeneous cohort of frontier and open-weights agents 
    under a shared, calibrated cross-lingual judge, and 
  1. decomposes the observed gap into translation-side and model-side factors,
     extending the analytic programme of MLCL 
     from isolated tool calls to full agent trajectories—complemented by a
    * comprehensive human-expert linguistic validation.

## Multilingual LLM-as-a-Judge. Because 

* GAIA2, and by inheritance O MNILINGUAL GAIA2, relies on 
  a model-based verifier to grade the natural-language write actions of agents,
  the cross-lingual reliability of the judge itself is a first-class concern.
* LLM judging was popularised by Zheng+ (2023) and 
  inherits from 
  * prompt-based translation-quality scoring in the MT community
    (Kocmi and Federmann, 2023; Rei+ 2022; Juraska+ 2025); 
  * position, verbosity, and self-preference biases
    (Panickssery+ 2024; Koo+ 2024) 
    * already problematic in the monolingual setting
* In the multilingual setting these effects compound:
  * METAL (Hada+ 2024) and MM-Eval (Son+ 2024) document 
    sharp drops in judge-human agreement on lower-resource languages,
  * M-RewardBench (Gureja+ 2025) reports the analogous 
    collapse for multilingual reward models, 
  * BabelJudge (KC, 2026) extends the analysis to full agent trajectories and
    * order-consistency near chance on some languages, the 
  * Coin-Flip-Judge study (Yagubyan, 2026) quantifies reliability floors under
    adversarial pairings, and 
  * Zhang+ (2026) isolate a distinct translationese bias whereby 
    judges systematically prefer back-translated over human-authored responses.
* Doğruöz+ (2026): concrete recommendations for multilingual judging practice.
* Our verifier design (§3.3) inherits the GAIA2 LLMaaJ scaffold but 
  explicitly recalibrates it against human-annotated multilingual agent traces,
  quantifying inter-rater agreement with standard nominal-scale statistics
  (Cohen, 1960; Artstein and Poesio, 2008; Landis and Koch, 1977; Krippendorff,
  2019) and reporting 
  language-conditional confidence intervals on the resulting leaderboard

## 3.2 Translating the benchmark

### Translation system. We rely on BOUQuET 3 (Andrews+ 2025) to select
GEMMA-4-31B-I NSTRUCT (Team+ 2025) as our translator system, as the top-ranking
open-license translator system across all the languages we target.
* We measure translation quality by pairwise LLM-as-judge comparison of each
  candidate rendering against a reference translation, adjudicated by 
  two independent judges under position randomisation and majority voting; 
* a per-language head-to-head against the other shortlisted systems on this
  measure confirms this choice. Furthermore, we 
* investigate the effectiveness of a review and post-editing pass with a
  different model, which 
  proves a near-no-op: it rewrites fewer than 9% of fields, with 
  * edits are almost entirely stylistic, with 
    no measurable impact on translation quality while 
    roughly doubling per-scenario latency. See Appendix B

## 3.3 Multilingual Verifier

* GAIA2 evaluates every state-changing write action that the agent performs in
  the environment 
  against oracle annotations 
  via a multi-step verifier employing an LLMaaJ component for text spans.
  * to properly extend the benchmark into a multilingual setting, 
    besides the user tasks, universe app states, and oracle events, 
    the LLMaaJ component too 
    needs to be localised, to ensure a fair judgement of non-English scenarios.
* _judge_ = the LLMaaJ component of the verifier,
* here we describe the work done to 
  * localise the judge, and 
  * run calibrations to ensure parity to English and correctness on target langs
* We summarize the protocol and findings below, App C for additional details.
* Localising the judge. 
  * The (multilingual) judge quality can be improved along two axes: 
    the judge prompt and the judge model. 
  * To evaluate both independently of agent performance, we use a set of
    human-annotated scenario traces from GAIA2, each carrying a ground-truth
    pass/fail label. The same set is translated with our pipeline (§3.2) to
    produce a cross-lingual counterpart, enabling evaluation under both source
    and target languages on identical trace scaffolding.
  * prompt, we find English-specific assumptions that make these prompts unsound
    on translated content; 
    eg the content checker is primed exclusively with English few-shot examples,
    so a faithful non-English write action can be judged non-compliant for
    reasons unrelated to its correctness. OMNILINGUAL GAIA2 therefore ships a
  * we: set of localised judge prompts that remove this priming and generalise
    the natural-language sub-checks across target languages; 
  * the calibration below confirms that 
    this localisation leaves English agreement intact while 
    carrying over to the target languages we evaluate. On the 
  * model axis, we require a judge that is open-weight and 
    light-weight enough to score the entire multilingual leaderboard
    * GPT-OSS-120B 4 , meets both: as a mixture-of-experts model it activates
      only 5.1B parameters per token (OpenAI, 2025), 
      roughly an order of magnitude fewer than the dense LLAMA-3.3-70B-INSTRUCT
      original paper’s reference judge (Meta AI, 2024), ie far fewer FLOPs 
* Calibrating the judge. We compare, on the same human-annotated traces, the
  four combinations of the two judge models with the two prompt sets, scoring
  each against the human-majority label with Cohen’s κ (Cohen: chance-corrected)
  * On English, no configuration reproduces the human verdicts measurably better
    than another:
    the four agree with the human labels comparably (full-corpus κ within
    0.71–0.73, rising to κ ≥ 0.93 on the LLM-touched slice the judge actually
    adjudicates)
  * the proposed configuration (GPT-OSS-120B, localised) 
    agrees with the original paper’s reference judge on almost all traces, with
    κ = 0.981. 
  * This agreement is preserved under translation across all the 10 langs, on
    the LLM-touched slice Cohen’s κ ranges from 0.886 (tur) to 0.971 (eng, cmn)

# 5 Results

# 6 Error Attribution Gap: automatic and linguistic analysis
