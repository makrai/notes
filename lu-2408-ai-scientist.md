The AI Scientist: Towards Fully Automated Open-Ended Scientific Discovery
Chris Lu, Cong Lu, Robert Tjarko Lange, Jakob Foerster, Jeff Clune, David Ha
arXiv:2408.06292 [cs.AI]

https://github.com/SakanaAI/AI-Scientist

* frontier models have already been used as aides to human scientists, eg for
  brainstorming ideas, writing code, or prediction tasks, they still conduct
* we: the first comprehensive framework for fully automatic scientif discovery
  * generates novel research ideas, writes code, executes experiments,
    visualizes results, describes its findings by writing a full scientific
    paper, and then runs a simulated review process for evaluation. In
  * this process can be repeated to iteratively develop ideas in an open-ended
    * like the human scientific community. We demonstrate its versatility
* demo by applying it to three subfields of machine learning:
  diffusion modeling, transformer-based LM, and learning dynamics (grokking)
  * a full paper at a cost of less than $15 per paper
* automated reviewer, which we show achieves near-human performance in
  * AI Scientist'papers exceed the acceptance threshold at a top machine
    learning conference as judged by our automated reviewer. This approach
* a new era in scientific discovery in machine learning:
  bringing the transformative benefits of AI agents to the entire research
  process of AI itself
  * closer to a world where endless affordable creativity and innovation can be
    unleashed on the world's most challenging problems

# 1 Intro

* The modern scientific method (Chalmers, 2013; Dewey, 1910; Jevons, 1877) is
  arguably one of the greatest achievements of the Enlightenment
  * collects background knowledge, drafts a set of plausible hypotheses to
    test, constructs an evaluation procedure, collects evidence for the
    different hypotheses, and finally assesses and communicates their findings
  * the manuscript undergoes peer review and subsequent iters of refinement
  * This procedure has led to countless breakthroughs in science and
    technology, improving human quality of life
* automate general scientific discovery (Langley, 1987, 2024; Waltz and
  Buchanan, 2009) has been a long ambition of the community since at least the
  * the Automated Mathematician (Lenat, 1977; Lenat and Brown, 1984) and
    DENDRAL (Buchanan and Feigenbaum, 1981). In the field of AI, researchers
    have envisioned the possibility of
  * automating AI research using AI itself (Ghahramani, 2015; Schmidhuber,
    1991, 2010a,b, 2012), leading to “AI-generating algorithms” (Clune, 2019)
  * foundation models have seen tremendous advances in their general
    capabilities (Anthropic, 2024; Google DeepMind Gemini Team, 2023; Llama
    Team, 2024; OpenAI, 2023), but they have only been shown to accelerate
  * writing of scientific manuscripts (Altmäe+ 2023; Dinu+ 2024; Ifargan+ 2024;
    Majumder+ 2024), as
  * a muse to brainstorm ideas (Baek+ 2024; Girotra+ 2023; Wang+ 2024b), or
  * aides to coding (Gauthier, 2024). To date, the community has yet to show
* so far relied on carefully constraining the search space of discoveries,
  * limits the scope of exploration and requires substantial human expertise
  * fields
    * materials discovery (Merchant+ 2023; Pyzer-Knapp+ 2022; Szymanski+ 2023)
    * synthetic biology (Hayes+ 2024; Jumper+ 2021) have been achieved by
  * restricting exploration to well-characterized domains with predefed params
  * goal: broader, open-ended discovery and addressing only a subset of the
  * Within machine learning itself, research automation restricted to
    * hyperparameter and architecture search (He+ 2021; Hutter+ 2019; Lu+
      2022b; Wan+ 2021, 2022) or
    * algorithm discovery (Alet+ 2020; Chen+ 2024b; Kirsch+ 2019; Lange+
      2023a,b; Lu+ 2022a; Metz+ 2022) within a hand-crafted search space
    * LLMs extended the search space to more generalized, code-level solutions
      (Faldor+ 2024; Lehman+ 2022; Lu+ 2024a; Ma+ 2023)
    * remains constrained by rigorously-defined search spaces and objectives,
* The AIScientist, the first fully automated and scalable pipeline for
  * input: a broad research direction and a simple initial codebase, The AI
  * performs ideation, a literature search, experiment planning, experiment
    iterations, manuscript writing, and peer reviewing to
  * output: insightful papers. Furthermore, in principle The AIScientist
  * can run in an open-ended loop, building on its previous scientific
    discoveries to improve the next generation of ideas
  * low financial cost (∼$15/paper) and represents a step towards turning the
  * can be applied to almost any other discipline, eg biology or physics, given
    an adequate way of automatically executing experiments (Arnold, 2022;
    Kehoe+ 2015; Zucchelli+ 2021)
* leveraging chain-of-thought (Wei+ 2022) and self-reflection (Shinn+ 2024)
  * The AI Scientist generates
    its own scientific ideas, hypotheses, and a plan for testing them experiment
  * implements plan-directed code-level changes to the experiment “template”
    using the SOTA coding assistant Aider (Gauthier, 2024), and
  * executes experiments to collect a set of computational results
  * draft a scientific paper
  * automated paper-reviewing process using guidelines from a standard ML conf
  * adds the completed ideas and reviewer feedback to its archive of scientific
    findings, and the process repeats
  * the generated paper and experimental artifacts allow us to easily interpret
    and judge its findings post-hoc, allowing human scientists to also benefit
    from what is learned
  * can generate hundreds of interesting, medium-quality papers in a week

# 4 a foundation model-based reviewing process in Section 4. This process

* near-human-level performance across multiple evaluation metrics (eg 65% vs
  66% balanced accuracy) when evaluated on ICLR 2022 OpenReview data
  * The reviews further enable The AI Scientist to select the best ideas for
    “publication” to an ever-growing archive of scientific discoveries, and the
    process can be repeated to build on these discoveries, just as in the human
    scientific community

# 5 an in-depth case study into one selected paper in Section 5, and present

# 6 aggregate results in Section 6

# 7. Related Work

* a long tradition of automatically optimizing individual parts of the ML
  pipeline (AutoML, He+ (2021); Hutter+ (2019)), none come close to
  * hE not communicating obtained scientific insights in an interpretable and
    general format

## LLMs for Machine Learning Research

* Most closely related to our work: those that use LLMs to assist ML research
  * Huang+ (2024) propose a benchmark for measuring how successfully LLMs can
    write code to solve a variety of machine learning tasks
  * Lu+ (2024a) use LLMs to propose, implement, and evaluate new SOTA algos for
    preference optimization
  * Liang+ (2024) use LLMs to provide feedback on research papers and find that
    they provide similar feedback to human reviewers, while
  * Girotra+ (2023) find that LLMs can consistently produce higher quality
    ideas for innovation than humans
  * Baek+ (2024); Wang+ (2024b) use LLMs to propose research ideas based on
    scientific literature search but do not execute them
  * Wang+ (2024c) automatically writes surveys <~ extensive literature search 

## LLMs for Structured Exploration
* LLMs are commonly used as a tool to explore large search spaces. For example,
  * Because LLMs contain many human-relevant priors, they
* LLM coding capabilities to explore
  * reward functions (Ma+ 2023; Yu+ 2023)
  * virtual robotic design (Lehman+ 2023)
  * environment design (Faldor+ 2024)
  * neural architecture search (Chen+ 2024a)
* LLMs as
  * evaluators (Zheng+ 2024) for “interestingness” (Lu+ 2024b; Zhang+ 2024) and
  * recombination operators for
    * black-box optimization with Evolution Strategies (Lange+ 2024; Song+
      2024) and for
    * Quality-Diversity approaches (Bradley+ 2024; Ding+ 2024; Lim+ 2024). Our
      * many proposed ideas are new combinations of previous ones

## AI for Scientific Discovery, a long tradition (Langley, 1987, 2024) across

* fields
  * chemistry (Buchanan and Feigenbaum, 1981),
  * synthetic biology (Hayes+ 2024; Jumper+ 2021),
  * materials discovery (Merchant+ 2023; Pyzer-Knapp+ 2022; Szymanski+ 2023),
  * mathematics (Lenat, 1977; Lenat and Brown, 1984; Romera-Paredes+ 2024), and
  * algorithm search (Fawzi+ 2022)
* analyze existing pre-collected datasets and find novel insights (Falkenhainer
  and Michalski, 1986; Ifargan+ 2024; Langley, 1987; Majumder+ 2024; Nordhausen
  and Langley, 1990; Yang+ 2024; Zytkow, 1996)
* future: reach across all science
  * eg robotic automation for wet labs (Arnold, 2022; Kehoe+ 2015; Sparkes+
    2010; Zucchelli+ 2021)

# 8 limitations, ethical considerations, and future outlook of our approach in

## Limitations of the Automated Reviewer. While the automated reviewer shows

* ICLR 2022 is old enough to potentially appear in the base model pre-training
  * nL LLMs were far from being able to reproduce old reviews exactly from
    initial segments, which suggests they have not memorized this data
  * the rejected papers in our dataset used the original submission file,
    whereas for the accepted papers only the final camera-ready copies were
  * Future iterations could use more recent submissions (e.g. from TMLR) for
  * the automated reviewer is unable to ask questions to the authors in a
  * unable to view figures and must rely on textual descriptions of them

## Common Failure Modes

* The AIScientist's some shortcomings already identified in Section 5. These
  * The idea generation process often results in very similar ideas across
    different runs and even models
    * possible solutions
      * directly follow up and go deeper on its best ideas, or by
      * recently-published papers as a source of novelty
  * Tabs 3-5: Aider fails to implement a significant fraction of the ideas
    * GPT-4o in particular frequently fails to write LaTeX that compiles. While
  * The AIScientist may incorrectly implement an idea, which can be difficult
    * possible partial solution:  An adversarial code-checking reviewer may
    * one should manually check the implementation before trusting the report
  * limited number of experiments per idea, the ~> results often do not meet
    the expected rigor and depth of a standard ML
    * no fair experiments that control for the number of parameters, FLOPs, or
      runtime. This often leads to deceptive or inaccurate conclusions. We
    * these issues will be mitigated as the cost of compute continues to drop
  * we do not currently use the vision capabilities of foundation models, it is
    ~> visual issues with the paper or read plots. For example,
    * the generated plots are sometimes unreadable, tables sometimes exceed the
      width of the page, and the page layout (including the overall visual
      appearance of the paper (Huang, 2018)) is often suboptimal
    * Future versions with vision and other modalities should fix this
  * sometimes struggles to find and cite the most relevant papers. It also
    * commonly fails to correctly reference figures in LaTeX, and sometimes
      even hallucinates invalid file paths
  * occasionally makes critical errors when writing and evaluating results. For
    * struggles to compare the magnitude of two numbers, which is a known
    * when it changes a metric (e.g. the loss function), it sometimes does not
      take this into account when comparing it to the baseline. To partially
    * nL we make sure all experimental results are reproducible, storing copies
      of all files when they are executed
  * Rarely, it hallucinates entire results. For example,
    * eg an early version of our writing prompt told it to always include
      confidence intervals and ablation studies. Due to
    * computational constraints ~> The AIScientist did not always collect
      additional results ~>
    * sometimes hallucinate an entire ablations table
    * We resolved this by instructing The AIScientist explicitly to only
      include results it directly observed
    * it frequently hallucinates facts we do not provide, eg the hardware used
  * More generally, we do not recommend taking the scientific content of this
    version of The AIScientist at face value
    * Instead, hints of promising ideas for practitioners to follow up on
      Nonetheless, we expect its trustworthiness to increase dramatically in
    * we hint at what is likely to be possible soon

## Safe Code Execution

* there is minimal direct sandboxing in the code, leading to several unexpected
  and sometimes undesirable outcomes if not appropriately guarded against. For
* eg
  * The AIScientist wrote code in the experiment file that initiated a system
    call to relaunch itself, causing an uncontrolled increase in Python
    processes and eventually necessitating manual intervention. In another run,
  * The AIScientist edited the code to save a checkpoint for every update step,
    which took up nearly a terabyte of storage
  * In some cases, when The AI Scientist’s experiments exceeded our imposed
    time limits, it attempted to edit the code to extend the time limit
    arbitrarily instead of trying to shorten the runtime. While creative, the
* potential implications for AI safety (Lehman+ 2020). Moreover, The
* occasionally imported unfamiliar Python libraries, further exacerbating
  safety concerns
* We recommend strict sandboxing when running The AI Scientist, such as
  containerization, restricted internet access (except for Semantic Scholar),
  and limitations on storage usage
* several unexpected positive results from the lack of guardrails. For example,
  * we had forgotten to create the output results directory in the grokking
    template in our experiments. Each successful run from The AI Scientist
    that outputted a paper automatically caught this error when it occurred and
    fixed it. Furthermore, we found that The AI Scientist would
* occasionally include results and plots that we found surprising, differing
  significantly from the provided templates. We describe some of these novel
  algorithm-specific visualizations in Section 6.1

## Broader Impact and Ethical Considerations. While The AI Scientist has the

* The ability to automatically generate and submit papers to academic venues
  could greatly increase the workload for reviewers, potentially overwhelming
  * like in arts (Epstein+ 2023)
  * if the Automated Reviewer tool was widely adopted by reviewers, it could
    diminish the quality of reviews and introduce undesirable biases into the
* papers or reviews that are substantially AI-generated must be marked as such
As with most previous technological advances, The AI Scientist has the
potential to be used in unethical ways. For example,
* it could be explicitly deployed to conduct unethical research, or even lead
* unintended harm if The AIScientist conducts unsafe research. Concretely,
* eg if it were encouraged to find novel, interesting biological materials and
  given access to “cloud labs” (Arnold, 2022) where robots perform wet lab
  biology experiments, it could (without its overseer’s intent) create new,
  dangerous viruses or poisons that harm people before we can intervene
* Even in computers, if tasked to create new, interesting, functional software,
  it could create dangerous malware. The AIScientist’s current capabilities,
  which will only improve, reinforce that
* the machine learning community needs to immediately prioritize learning how
  to align such systems to explore in a manner that is safe and consistent with
  our values

# 9 Discussion 20

# Appendix 31
