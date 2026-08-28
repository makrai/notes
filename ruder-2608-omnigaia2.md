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
    a localised and human-calibrated multilingual verifier
  * conclu: ten priority target languages
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
* findings are as follows [From the conclusions.]
  * the cross-lingual gap is
    universal in direction but agent-specific in magnitude (8.8–18.4 pp in
    pass@3), and
    no agent is uniformly robust: the frontier systems narrow the gap without
    closing it
    * The metric inspected differentiates them: Gemini-3.1-P RO is the most
      self-consistent (smallest pass all 3 gap) while
      Claude-4.7-Opus keeps high any-of-three accuracy off English yet loses
      per-attempt reliability
  * the gap is predominantly model-driven: a
    * stratified error attribution assigns
      55% of it to genuine agent failures,
      35% to translation defects and
      10% to verifier artefacts, while
    * a benchmark-wide bound leaves only 6.4% of scenario–language pairs MT-unsolvable;
    * the gap concentrates on tool-orchestration and response quality
      rather than quantitative or categorical reasoning
  * this gap does not close with model scale:
    * a same-family size ladder shows the English–target delta widening from +8
  * agents adopt a more hesitant execution strategy off English,
    foraging longer over the environment and
    committing later and less decisively (the write-action share of tool calls
    falls by 1–2.5 pp);
    * this shift is the behavioural signature of degraded comprehension:
      it accompanies the mis-counted write actions behind the execution-side
      failures rather than reflecting a successful adaptation
  * linguistic analysis identifies
    morphological cue loss and amplified ambiguity as primary failure
    mechanisms, particularly in non-Latin-script languages
  * sum: that multilingual agentic evaluation belongs alongside multilingual
    understanding evaluation as a standard part of the reporting protocol for
    globally deployed agents

# Introduction

* AI agents—systems that plan, invoke tools, and act autonomously in an env
  (Wooldridge and Jennings, 1995; Franklin and Graesser, 1996;
  Russell and Norvig, 2009)
  * Michael Wooldridge and Nicholas R Jennings
    Intelligent agents: Theory and practice
    The knowledge engineering review, 10(2): 115–152, 1995
  * Stan Franklin and Art Graesser
    Is it an agent, or just a program?: A taxonomy for autonomous agents
    International workshop on agent theories, architectures, and languages,
    pages 21–35. Springer, 1996
  * moved from objects of research curiosity to
    real products deployed and used by hundreds of millions of people worldwide,
    thanks to the rapid advancements of Large Language Model (LLM) capabilities
    (Wang+ 2024; Xi+ 2025; Yang+ 2025; Staufer+ 2026)
  * Those users do not all speak English, yet
    hE our ability to measure whether these agents actually work has barely kept
    pace with their deployment, and least of all beyond English. Even
  * in English the ground is unsteady: developers who anticipated a 24% speedup
    from AI tools were instead slowed by 19% (Lobentanzer, 2026), and observed
    * task coverage remains a fraction of what has been hypothesised
      (Massenkoff and McCrory, 2026; Johnston+ 2026)
  * another language is, at the time of writing, largely unmeasured
  * In English, this gap is being rapidly closed, with considerable work
    * agentic benchmarks that probe
      how well these systems plan, search, and use tools
      (Mialon+ 2024; Qin+ 2024; Xie+ 2024; Patil+ 2025; Deng+ 2026;
      Barres+ 2025; Merrill+ 2026)
  * Beyond English, evaluation has barely followed: for frontier agentic systems
    * eg System Card: Claude Opus 4.7
    * multilingual assessment remains largely confined to
      single-turn, knowledge-based question answering datasets such as
      eg GLOBAL-MMLU (Singh+ 2025), when it is performed at all 2
* we present O MNILINGUAL GAIA2, a high-quality machine-translated expansion of
  GAIA2 (Froger+ 2026), paired with
  + a multilingual verifier and a frontier multilingual agentic leaderboard. Our
* contributions are: 1 See 2 No for instance System Card: Claude Opus 4.7
  1. A multilingual agentic benchmark. We release OMNILINGUAL GAIA2,
    a machine-translated (MT) expansion of GAIA2 that covers
    * four capabilities, namely adaptability, ambiguity, execution, and search,
    * ten target languages spanning five writing systems while
      preserving the executable structure required by the verifier (§3)
    * We select the translation system through a per-language quality evaluation
      and design a MT pipeline that enforces cross-surface terminology
      consistency across scenarios (§3.2)
    * App A: our language-coverage contribution relative to existing datasets
  2. A human-calibrated multilingual verifier
    * We localise the LLM-as-a-Judge (LLMaaJ) component of the GAIA2 verifier,
    * we ensure its multilingual quality via calibration on a golden set of
      human-annotated and MT agent traces (§3.3)
  3. A cross-lingual multi-agent leaderboard and
    empirical characterisation of the gap
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
    1. the gap does not close with model scale within a single family (§4, §5)
  4. An error taxonomy and gap attribution showing
    * the gap is predominantly model-driven. We define
    * a five-category verdict taxonomy and apply
    * a stratified automatic triage protocol that
      corrects for the selection bias of deterministic-only analysis. The
    * 55% of the cross-lingual gap to genuine agent failures,
      35% to translation defects, and
      10% to verifier artefacts (§6.1,§6.2)
    * Extending the analysis to the whole benchmark, we bound
      * MT-induced contamination at only 6.4% of all scenario–language pairs,
      * ie the benchmark predominantly measures model capability
        rather than translation noise
  5. A human-expert linguistic analysis
    identifying failure mechanisms per error category
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
      correct end state, inflating the apparent failure rate (§6.3)
* OmniGAIA2 is part of Meta’s broader Omnilingual effort to extend AI capability
  beyond the handful of high-resource languages that dominate current systems,
  alongside
  * Omnilingual ASR (Omnilingual-ASR-team+ 2025) for 1,600+ languages and
  * Omnilingual MT (Omnilingual-MT-Team+ 2026) at comparable scale. Where those
  * BOUQuET (Andrews+ 2025) expands the translation-evaluation frontier,
  * OmniGAIA2: evaluation to interactive, tool-using agentic tasks beyond eng

# 2 Related Work

## Multilingual agentic evaluation

* Efforts have so far been narrow along at least one axis:
  the set of languages, the class of agents evaluated, or
  the fidelity of the verifier under translation
* In the web-agent setting,
  * X-WebAgentBench (Wang+ 2025) translates a subset of navigation tasks into
  several languages, while
  * Ticket-Bench (Sales Almeida+ 2025) regionalises a customer-service
    function-calling benchmark across six European locales. On
  * tool-calling sub-capability alone,
    MLCL (Luo+ 2026) isolates cross-lingual robustness of API selection and
    argument copying,
    decomposing the multilingual gap into query-comprehension and
    parameter-value-mismatch components
  * MASSIVE-Agents (Kulkarni+ 2025), which covers 52 languages, was
    created by cleaning the original MASSIVE dataset and then
    reformatting it for evaluation within the Berkeley Function-Calling
    Leaderboard (BFCL) framework
  * MAPS (Hofman+ 2026) pairs
    a ten-language agent suite with a security-focused analysis, and
  * TelcoAgent-Bench (Bariah+ 2026) evaluates multilingual telecom agents in
    English and Arabic, finding that
    performance gaps widen in unconstrained bilingual settings—a pattern
    consistent with our own findings across ten languages
* Closest to our setting, three recent efforts
  * translate structurally identical benchmarks across languages while
    preserving their executable verifiers:
    * SEATauBench (Nguyen+ 2026) adapts τ 2 -Bench into five Southeast Asian ls
    * PolyWorkBench (Li+ 2026) constructs
      a native multilingual long-horizon agent benchmark from scratch, and
    * our most direct sibling,
      GAIA-v2-LILT (Kim+ 2026), localises GAIA across five target languages
      through a translate-then-adapt pipeline that
      modifies task semantics to fit the locale
* synthetic-generation approaches
  (IntellAgent (Levi and Kadar, 2025), TaskCraft (Shi+ 2026),
  AgentSynth (Xie+ 2026)),
* MT-based expansion
  preserves an existing verifier’s executable structure while scaling ling,
  following the hybrid MT-then-expert-review pipeline of MMLU-ProX (Xuan+ 2025)
  at 29 languages
* Benchmark validity grounds our analysis:
  the Agentic Benchmark Checklist (ABC) (Zhu+ 2026) documents
  systematic outcome~ and task-validity failures in widely used agentic
  benchmarks;
  * we address these by
    * calibrating the verifier against human labels (§3.3) and by
    * decomposing the observed gap into translation-, model-, and verifier-side
      factors with a bounded contamination floor (§6.3)
* O MNILINGUAL GAIA2 is, to our knowledge, the first extension of GAIA2 that
  1. covers ten target languages spanning five writing systems (Appendix A)
     while preserving the executable verifier end-to-end,
  1. reports a paired comparison
    across a heterogeneous cohort of frontier and open-weights agents
    under a shared, calibrated cross-lingual judge, and
  1. decomposes the observed gap into translation-side and model-side factors,
     extending the analytic programme of MLCL
     from isolated tool calls to full agent trajectories—complemented by a
    * comprehensive human-expert linguistic validation

## Multilingual LLM-as-a-Judge. Because

* GAIA2, and by inheritance O MNILINGUAL GAIA2, relies on
  a model-based verifier to grade the natural-language write actions of agents,
  the cross-lingual reliability of the judge itself is a first-class concern
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
    judges systematically prefer back-translated over human-authored responses
* Doğruöz+ (2026): concrete recommendations for multilingual judging practice
* Our verifier design (§3.3) inherits the GAIA2 LLMaaJ scaffold but
  explicitly recalibrates it against human-annotated multilingual agent traces,
  quantifying inter-rater agreement with standard nominal-scale statistics
  (Cohen, 1960; Artstein and Poesio, 2008; Landis and Koch, 1977; Krippendorff,
  2019) and reporting
  language-conditional confidence intervals on the resulting leaderboard

## 3.2 Translating the benchmark

### Translation system. We rely on BOUQuET 3 (Andrews+ 2025) to select
GEMMA-4-31B-I NSTRUCT (Team+ 2025) as our translator system, as the top-ranking
open-license translator system across all the languages we target
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
  via a multi-step verifier employing an LLMaaJ component for text spans
  * to properly extend the benchmark into a multilingual setting,
    besides the user tasks, universe app states, and oracle events,
    the LLMaaJ component too
    needs to be localised, to ensure a fair judgement of non-English scenarios
* _judge_ = the LLMaaJ component of the verifier,
* here we describe the work done to
  * localise the judge, and
  * run calibrations to ensure parity to English and correctness on target langs
* We summarize the protocol and findings below, App C for additional details
* Localising the judge
  * The (multilingual) judge quality can be improved along two axes:
    the judge prompt and the judge model
  * To evaluate both independently of agent performance, we use a set of
    human-annotated scenario traces from GAIA2, each carrying a ground-truth
    pass/fail label. The same set is translated with our pipeline (§3.2) to
    produce a cross-lingual counterpart, enabling evaluation under both source
    and target languages on identical trace scaffolding
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
    κ = 0.981
  * This agreement is preserved under translation across all the 10 langs, on
    the LLM-touched slice Cohen’s κ ranges from 0.886 (tur) to 0.971 (eng, cmn)

# 5 Results

## 5.2 Per-capability breakdown

* We now break down the numbers of Table 1 into the four capabilities
* For each (capability, language, agent) combination we report pass@3 with 95%
  CIs and we test the English-vs-target-language difference with a paired
  McNemar test (McNemar, 1947) on the matched scenario pairs, per capability
* Figure 2 gives the full capability-by-language view at a glance, while the
  * exact numbers, Wilson CIs and per-cell McNemar p-values are in Appendix D
* Two patterns are visible:
  * performance is strongest in English for nearly every (agent, capability) cmb
  * the drop concentrates on the CJK and Indic languages (cmn, jpn, hin). These
  * part of the reason is the agents not carefully considering the
    various forms entities may take when calling tools (see Appendix H)
    * mirroring cross-script mistakes in non-agentic tasks (Bandarkar+ 2026)
* The frontier agents (Claude-4.7-Opus, GPT-5.4) show
  the most cross-lingually robust behaviour, while
  the open-weights agents perform significantly below English
  on almost every target language
* the capability ordering appears stable across languages, with pass@3 numbers
  * decreasing from search through execution and adaptability to ambiguity, so
  * Search is both the strongest capability and among the more robust, with
    KIMI-2.6 achieving the highest target-language search of any agent (84.7)
  * The frontier agents are most cross-lingually robust on adaptability:
    Claude-4.7-Opus and Gemini-3.1-Pro retain it almost intact off English
    (target-language means of 73.0 and 48.9 against English 75.6 and 51.2)
  * execution and, especially, ambiguity, is the hardest capability everywhere
    * every agent scores lowest off English

## 5.3 Behavioural signatures

* Comparing the English and target-language distribution of
  lower-level per-scenario signals, such as
  * agent step count and
  * tool-call composition (which tools are invoked and in what proportion)
  * inflated step counts and tool-call retry loops may indicate the agent
    struggling with a partially-understood instruction, whereas
  * truncated planning or a collapsed tool-call vocabulary might suggest the
    agent giving up early rather than exploring
* We focus our analysis on two proprietary agents (Claude-4.7-Opus, GPT-5.4) and
  the strongest open-weights agent (Kimi-2.6), and find
  two main behavioural signatures

### Tool-call volume

* For each scenario we pair its target-language runs with the matching English
* compare the average number of tool calls
* Only GPT-5.4 does systematically more work off English: it issues 21.6% more
  tool calls than in English, an increase present in every target language and
  largest for hin (+41%), spa (+37%), tur (+23%), deu (+22%) and fra (+21%)
* Claude-4.7-Opus and Kimi-2.6 do the opposite, issuing slightly fewer (−7.6%)
  * per-language changes mixed in sign
    (Claude-4.7-Opus from −23% on por to +7% on cmn;
    Kimi-2.6 from −17% on fra/ita/spa to +6% on hin)
* This extra activity does not, however, explain the regression
  * For GPT-5.4 the scenarios that lose accuracy off English inflate their tool
    count no more than those that hold it (+4.8 vs +6.5 calls), so tool volume
    and success move independently
  * The one agent whose tool count does track its accuracy is Claude-4.7-Opus,
    and it runs the opposite way: its regressing scenarios issue fewer calls,
    not more (−11.0 vs +3.6 calls)—a “give up early” signature rather than
    flailing with extra actions

### Tool-strategy composition

* All three agents also change which tools they reach for off English, and this
  shift is far larger than a cohort-level average suggests
* We quantify it with the Jensen–Shannon divergence (JSD) between an agent’s
  English and target-language tool-choice distributions, where higher means a
  bigger strategy shift
* Pooled over a whole cohort the shift looks negligible
  (0.010/0.025/0.020 bits for Claude-4.7-Opus/GPT-5.4/Kimi-2.6),
* per matched scenario it is several times larger (0.087, 0.109, 0.116 bits),
  and larger still within matched thirds of each trajectory (0.170, 0.197,
  0.216), an approximate per-turn view
  * measured per scenario, the three agents look much more alike,
    GPT-5.4’s apparent 2.5× lead over Claude-4.7-Opus shrinks to about 1.3×,
    and Kimi-2.6 re-plans its tool use as much as either frontier agent

### What changes

* The direction of the shift is consistent
  across all three agents and across languages: off English
  * larger fraction of their tool budget on exploratory reads and a
  * smaller fraction on state-changing writes
* The categories whose share grows most are retrieval and browsing operations:
  product search and catalogue listing rise by +3–6 pp for every agent, with
  further gains on product-detail lookups and conversation listing
* The per-tool falling side is noisier (dominated by scenario-mix effects), so
  * we summarise the commit side by aggregating over the mutation flag each tool
    carries:
  * the write-action share of all tool calls falls
    32.1% to 29.9% for Claude-4.7-Opus(−2.1 pp),
    30.5% to 28.1% for GPT-5.4 (−2.5 pp) and
    29.3% to 28.0% for Kimi-2.6 (−1.3 pp). In other words,
* ie in a non-English scenario all three agents
  forage longer over the environment and commit later and less decisively – the
  * behavioural counterpart to the tool-count-mismatch failures of §5.4, where
    the wrong number of side-effectful calls is
    the dominant non-English failure signature

## 5.4 Verifier decomposition

* To identify which verifier checks drive the regression,
  we label each failed run by the first verifier check it fails:
  * quantitative (e.g. a mismatched count of retrieved emails),
  * categorical (e.g. mismatched attendee-set for a calendar event),
  * textual (e.g. rejected message content from the LLMaaJ),
  * overall tool-count mismatch, or
  * timeout
* Then, we report each class’s
  absolute failure rate, with all runs in the denominator,
  rather than its share of failures
  * The share-of-failures view is flat across languages and hides the effect;
    the absolute view localises it
* The cross-lingual regression is not carried by quantitative or categorical
  from English to the non-English average,
  * None of these deltas are significant under a matched-pair McNemar test
    * quantitative-checker failures move by only +0.04 percentage points (pp)
      for Claude-4.7-Opus, −0.33 pp for GPT-5.4 (ie slightly improving) and
      +0.06 pp for Kimi-2.6, and
    * categorical-checker failures by +0.08, +0.05 and −0.12 pp
  * instead concentrated in the
    * tool-count-mismatch checker (+10.6 pp Claude-4.7-Opus, +5.3 pp GPT-5.4,
      +5.7 pp Kimi-2.6) and the
    * textual-reply checker (+6.2, +3.4, +3.5 pp), which
    * together account for essentially all of the +17.0/+9.3/+11.1 pp rise in
      the overall non-English failure rate
* The cross-lingual gap is thus
  a tool-orchestration and final-response-quality effect,
  not a numeric~ or categorical-reasoning effect –
  consistent with the ambiguity over-commitment of §5.2 (tool-count) and the
  reply-quality degradation discussed in §6 (textual)

## 5.5 Scale ablation: the Qwen-3.5 size ladder

* We vary scale within a single family to ask
  how agentic competence and the cross-lingual gap of §5.2 move with model size
  * four Qwen-3.5 sizes: one dense (27B) and three mixture-of-experts (35B-A3B,
    122B-A10B, 397B-A17B, with 3/10/17B active parameters) 9 . We run the full
  * We omit checkpoints smaller than 9B, for which
    the agent harness does not reliably elicit tool calls,
    yielding near-zero valid trajectories
  * 11-language × 4-capabilities, under the same experimental setup. Note that
    this scaling study is run on a different model generation from
    Qwen-3.6-35B-A3B, so it is meant to complement rather than extends Table 1
* Table 2
* Scaling is monotonic, but a dense mid-size rivals the largest MoE
  * Average pass@1 rises monotonically: 10.5 → 12.9 → 18.1 → 20.0
  * 397B-A17B is the strongest size on average and on search and adaptability
  * the dense 27B actually edges the 6×-larger 397B-A17B
    on execution (21.4 vs 20.7) and ambiguity (7.6 vs 7.5), and
    clears 122B-A10B comfortably
  * ie Aggregate capability tracks the active parameter count, and
  * the dense mid-size model is fully competitive with the largest sparse one
      per active parameter
* The capability ordering is stable. The canonical ordering of
  search > execution > adaptability > ambiguity holds across sizes,
  * the one exception is 122B-A10B, whose execution collapses to the level of
    its adaptability. Scale lifts the whole profile rather than re-ordering
* The cross-lingual gap does not close with scale.  English is the ceiling at
  * the gap to the target-language mean widens as models grow:
    English minus the mean of the other ten languages: +8.1, +7.5, +10.4, +12.7
  * hin and jpn are the weakest languages at every size,
    mirroring the script-family fragility of §5.2
* Scaling the model therefore raises the multilingual floor but leaves the shape

# 6 Error Attribution Gap: automatic and linguistic analysis

* this section asks why a cross-lingual gap; exists
* org 1. error taxonomy; 2. automatic evaluation, and 3. human linguistic anal

## 6.1 Error Taxonomy

* Categories are checked top-down; the first that fits is assigned

1. Infrastructure (I1–I2) — The run crashed or no judgement was persisted; no
   gradable attempt exists
2. Translation defect (T1–T4) —
  The MT pipeline corrupted the task inputs (task description, universe app
  state field, or oracle event) such that the target run was set up to fail
  Sub-codes:
  * oracle-event mis-translation (T1)
  * universe app-state corruption (T2)
  * task description ambiguity or meaning change (T3)
  * cross-reference/transliteration breakage (T4)
    * T4 is near-empty as a distinct construction-level defect:
      a dedicated non-Latin script audit finds no transliteration errors
      introduced by benchmark construction (App. H), and
      the few cross-reference cases we observe share the T1 mechanism—
      an oracle-compared literal left translated rather than passed through
      unchanged
3. Verifier artefact (K1–K3) —
  The agent’s action was effectively correct but the verifier rejected
  * typically a translation-sensitive judge (LLM-as-Judge) rejection (K1),
  * a locale/format mismatch on a hard checker (K2), or
  * list/ordering strictness (K3)
4. Agent failure (A1–A7) —
  * The model genuinely erred on a fair, correctly-translated task
  * It includes:
    * wrong content/args (A1)
    * missing required action (A2)
    * extra/spurious action (A3)
    * wrong tool/target (A4)
    * wrong final answer (A5)
    * refusal/no answer (A6)
    * non-convergence (A7)
5. Inconclusive (E1) —
  Multiple plausible causes coexist or
  the deciding evidence (e.g. the judge rationale) is unavailable

## 6.2 Automatic estimation

* we automatically triage every cross-lingual failure into the taxonomy of §6.1
* steps
  * correcting for infrastructure aborts,
  * stratifying regressions by within-scenario determinism, and
  * extrapolating to scenarios that fail in both languages,
* we find the gap to be
  * majority genuine model failure (55.4%), with
  * translation defects a smaller and spatially localised contamination floor 34.5
  * only 6.4% of all benchmark pairs rendered unsolvable in the target) and
  * verifier artefacts the remainder (10.1%)
* Five-annotator human re-adjudication confirms the automatic fault-side label
  on 91.4% of a stratified sample. The remainder of this subsection develops
  each step

### Triage protocol. We attribute each target-language failure to the taxonomy

* input: the per-scenario artefacts persisted by the evaluation harness: the
  graded verdict, the environment action log (the agent’s write actions), the
  agent trajectory, and, where available, the LLM-as-Judge rationale together
  with the oracle reference
* One diagnostic agent handles one unit of work: it reads these artefacts and,
  in regression mode,
  diffs a failing target run against a passing English run for the same
  scenario—the English run is the ground truth the dataset does not otherwise
  provide—before assigning a category, sub-code, and confidence
* Judge rejections, which are otherwise ambiguous
  between a verifier artefact (K1) and a wrong final answer from the agent (A5),
  are adjudicated from the persisted judge rationale and the oracle reference
  rather than inferred from which check fired
* The protocol is orchestrated as an extract–diagnose–compile fan-out (App G)

### Gap-representative stratification. The severity of a regression is itself
informative. A deterministic translation defect corrupts the task and breaks
every target run, whereas a stochastic model slip or a flaky judge breaks only
some. Sampling only complete collapses (English 3/3, target 0/3) therefore
over-represents translation defects. We instead stratify infra-clean
regressions by within-scenario determinism—
* deterministic (the target never succeeds) versus
* stochastic (the target succeeds on a strict subset of runs)—triage a language-
  and capability-balanced sample of each at the granularity of individual
  failing runs, and
* we reweight each stratum’s cause composition by its true failing-run volume
  (known exactly from the run index) to obtain a gap representative estimate
* Confidence intervals are obtained by a scenario-clustered bootstrap

### Composition of the gap

* The two strata differ sharply (Table 3):
* deterministic failures are translation-driven (59%), but
* stochastic failures—which carry the larger share of the gap—are model-driven
  (75%)
* After reweighting (Table 4),
  55.4% (95% CI 50.3–60.7) of the cross-lingual gap is a genuine model failure,
  34.5% (29.5–39.1) a translation defect, and
  10.1% (7.1–13.5) a verifier artefact
* Restricting attention to complete collapses inverts this to a translation-
  dominated ≈ 55%/33% split, quantifying the selection bias that the
  stratification removes
* The model-driven share is language-dependent,
  largest for Turkish and Japanese and
  smallest for Portuguese and Spanish (Appendix G)

### From regressions to the whole benchmark

* The triage above conditions on English passing; by construction it cannot see
  scenarios that fail in both languages, which is precisely where a translation
  defect could deflate a target score without leaving a visible regression. To
  bound contamination over the entire benchmark
* we therefore partition all 6,056 English×target scenario–language pairs by
  outcome (Appendix G Table 19) and use a simple observation:
  a translation defect can only corrupt a score by rendering the target
  unsolvable, i.e., the target never passes
* ie The 74.5% of pairs solved in the target on at least one run are
  translation-clean by construction—the translated task is demonstrably
  solvable—leaving only the 25.5% the target never solves to account for

### The both-fail blind spot. We triage all three “target-never-solves” cells,
including the both-fail cell that regression analysis misses
* The translation-defect rate falls monotonically as English competence drops:
  59% where English solves the scenario (a clean regression),
  16% where English is already flaky, and only
  10% (95% CI 5.6–16.9) where English also fails. In other words,
* ie translation defects concentrate exactly where they are already visible as
  clean regressions, and
  the blind spot is if anything cleaner than the part we can see—ruling out a
  hidden reservoir of contamination—and in any case
  both-fail defects cannot bias the cross-lingual ranking,
  since a scenario English also fails contributes nothing to the gap
* Weighting the three cells by size,
  translation defects render only 6.4% of all pairs unsolvable in the target,
  clustered on a handful of oracle- and keyword-mistranslation bugs
* The cross-lingual gap therefore predominantly reflects genuine model
  capability, over a small, localised, and fixable translation-contamination
  floor

### Human-based validation. To test the triage beyond hand-picked cases,

* five annotators re-adjudicated a stratified sample of triaged failures through
  a purpose-built review interface (Appendix I), each confirming or rejecting
  the assigned fault side from decision-relevant evidence alone
  (source/translated task, oracle, judge rationale, agent answer). Across
* 140 items in seven languages, they
  confirmed the automatic label in 128—91.4% agreement (95% CI 85.6–95.0)—with
  comparable rates across all three sides (Translation 19/22, Verifier 25/27,
  Agent 84/91) and rejections spread across category boundaries with no
  systematic direction
* This corroborates the decomposition of Table 4:
  independent human judgement agrees with the automatic fault-side assignment on
  the large majority of a representative sample; full breakdown in Appendix I

## 6.3 Linguistic Analysis

* Three linguists, native in Indonesian, Mandarin+Jap, and Spanish
  * all proficient in English, with the Mandarin speaker also proficient in
  * they independently inspected agent traces, translated prompts, and universe
    content for 16 scenarios spanning all four capabilities; six representative
    cases are presented in Table 5

### Translation defects (T)

* Translation neutralises disambiguating surface cues
  * Several prompts are
    ambiguous in English yet resolvable through word order or morphology;
    translation collapses these cues and forces a single reading that may not be
    the intended one (
    eg “whose titles” rendered as job title rather than event title in every lng
* Faithful-looking translations silently drop constraints
  A directional preposition (“booked a cab to”) was dropped or weakened in every
  target language, removing the very constraint that fixes the correct answer
  eg the Spanish “a las que... reservar” looks directional but is incongruent
  with the verb’s non-motion reading
* Morphological cue loss drives the most consequential failures
  * In article-less, number-neutral languages (cmn/jpn/ind) the singular “my
    contact” is parsed as a generic set, and the agent deletes both matching
    contacts instead of asking for clarification (Case 6, T3)
  * Controlled-vocabulary drift compounds this: an inconsistently rendered
    property-type enum leaves the target filter unreachable (Case 5, T2)

### Verifier artefacts (K)

* Judge strictness is language-dependent, stochastic, and can hallucinate
  * The soft judge rejects correct target-language content while accepting
    identical English content, and
    in one case cited agent text that was never produced (Case 4, K1)
* Action-count gating penalises harmless self-corrections
  The hard count-gate fails any mismatch between the agent’s and the oracle’s
  write-action counts
  even when the final state is correct—
  e.g. an agent that omits an attendee, deletes the event, and recreates it
  correctly (Cases 3–5)
  Although the taxonomy records these as extra-action agent errors (A3),
  the correct end state means
  they are largely measurement artefacts of end-state-blind grading
  rather than genuine capability regressions

### Agent failures (A)
* Genuine model errors are present and, in aggregate, dominant
  * Consistent with the automatic decomposition (§6.2),
    where model failures account for 55.4% of the cross-lingual gap, the sample
  * clean slips traceable to neither MT nor the verifier:
    a Spanish run skips a required save step despite naming it in its own
    reasoning (Case 3, A2), and
    a retrieval miss returns only one of two matching contacts (Case 6, spa)
* Genuine over-actions must be separated from grading artefacts
  * Not every extra write is benign:
    an over-action that changes the final state is a true A3 regression,
    unlike the idempotent self-corrections penalised by the count-gate above,
    and the two must be disentangled
    before an action-count failure is read as a capability gap

### Overall, the linguistic analysis

* illustrates each non-infrastructure fault side of §6.1 with concrete
  cross-lingual cases and
* is consistent with the automatic decomposition of §6.2:
  translation defects and verifier artefacts are real but bounded, while
  genuine, translation-independent agent errors surface
  even in this small qualitative sample

# 7 Conclusion

* open directions
  * broaden coverage along two axes:
    * capabilities (e.g. the one we deferred in this work) and
    * target languages, ideally with a focus on
      the lower-resource end where we posit the cross-lingual gap is widest. A
  * harden the translation pipeline (§3.2) against the translation-defect
    mechanisms our error analysis surfaces (§6.3), driving down the 6.4%
    translation-induced unsolvability floor of the benchmark

# App A Languages

* Table 6 Language coverage comparison between
  MAPS Hofman+ (2026), GAIA-v2-LILT Kim+ (2026), and our benchmark

Language         | MAPS | GAIA-v2-LILT | OMNILINGUAL GAIA2
-----------------|------|--------------|-------------------
Arabic           |  ✓   |      ✓       |         –
German           |  ✓   |      ✓       |         ✓
Hindi            |  ✓   |      ✓       |         ✓
Korean           |  ✓   |      ✓       |         –
Portuguese       |  ✓   |      ✓       |         ✓
Italian          |  ✓   |      –       |         ✓
Japanese         |  ✓   |      –       |         ✓
Spanish          |  ✓   |      –       |         ✓
Russian          |  ✓   |      –       |         –
Hebrew           |  ✓   |      –       |         –
Mandarin Chinese |  –   |      –       |         ✓
French           |  –   |      –       |         ✓
Indonesian       |  –   |      –       |         ✓
Turkish          |  –   |      –       |         ✓
