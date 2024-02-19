Llama 2: Open Foundation and Fine-Tuned Chat Models
H Touvron, L Martin, K Stone, P Albert, A Almahairi, Y Babaei, N Bashlyko,,,
  A Fan, M Kambadur, S Narang, A Rodriguez, R Stojnic, S Edunov, T Scialom
arXiv:2307.09288 [cs.CL]


#Abstract

* we devel and release Llama 2, a collection of pretrained and fine-tuned LLMs
  * scale from 7 billion to 70 billion parameters
  * fine-tuned LLMs, called Llama 2-Chat, are optimized for dialogue use cases
  * outperform open-source chat models on most benchmarks we tested, and
  * based on our human evaluations for helpfulness and safety, may be a
 suitable substitute for closed-source models
* detailed description of our approach to fine-tuning and safety improvements


#1 Introduction3

* seemingly straightforward nature of the training methodology. Auto-regressive
  * pretrained on an extensive corpus of self-supervised data, followed by
    alignment with human preferences via techniques such as Reinforcement
    Learning with Human Feedback (RLHF). Although the training methodology is
* high computational requirements have limited the development of LLMs to a few
  * public releases of pretrained LLMs (such as BLOOM (Scao+ 2022), LLaMa-1
    (Touvron+ 2023), and Falcon (Penedo et al., 2023))
    that match the performance of
    closed pretrained competitors like GPT-3 (Brown+ 2020) and Chinchilla
    (Hoffmann+ 2022), but
    none of these models are suitable substitutes for
    closed “product” LLMs, such as ChatGPT, BARD, and Claude
    * heavily fine-tuned to align with human preferences, which
      * greatly enhances their usability and safety. This step can require
      * often not transparent or easily reproducible, limiting progress within
* we develop and release Llama 2, a family of pretrained and fine-tuned LLMs,
  * scales up to 70B parameters. On the
  * series of helpfulness and safety benchmarks we tested,
  * Llama 2-Chat models generally perform better than existing open-source
  * on par with some of the closed-source models, at least on the human
    evaluations we performed (see Figures 1 and 3)
  * We have taken measures to increase the safety of these models, using
    * safety-specific data annotation and tuning, as well as conducting
    * red-teaming and employing iterative evaluations
  * a thorough description of our fine-tuning methodology and safety approach
* observations we made during the development of Llama 2 and Llama 2-Chat, such
  * emergence of tool usage and temporal organization of knowledge
* We are releasing the following models to the general public
  for research and commercial use
  1. Llama 2, an updated version of Llama 1
    * trained on a new mix of publicly available data. We also
      increased the size of the pretraining corpus by 40%,
      doubled the context length of the model, and adopted
      grouped-query attention (Ainslie+ 2023)
      * Joshua Ainslie, James Lee-Thorp, Michiel de Jong, Yury Zemlyanskiy,
          Federico Lebrón, and Sumit Sanghai
        Gqa: Training generalized multi-query transformer models from
        multi-head checkpoints
        2023
    * We are releasing variants of Llama 2 with 7B, 13B, and 70B parameters. We
    * 34B variants, which we report on in this paper but are not releasing.§
2. Llama 2-Chat, a fine-tuned version of Llama 2 that is optimized for dialogue
   * We release variants of this model with 7B, 13B, and 70B parameters as
* potential risks with use (Bender+ 2021b; Weidinger+ 2021; Solaiman+ 2023)
* Testing conducted to date has been in English and has not — and could not —
  cover all scenarios
  => before deploying any applications of Llama 2-Chat, developers should
  perform safety testing and tuning tailored to their specific applications of
  * We provide a responsible use guide¶ and code examples‖ to facilitate the
    safe deployment of Llama 2 and Llama 2-Chat
  * More details of our responsible release strategy can be found in Sec 5.3


#2 Pretraining 5

## 2.1 Pretraining Data 5
## 2.2 Training Details 5
## 2.3 Llama 2 Pretrained Model Evaluation 7


#3 Fine-tuning 8

## 3.1 Supervised Fine-Tuning (SFT) 9
## 3.2 Reinforcement Learning with Human Feedback (RLHF) 9
## 3.3 System Message for Multi-Turn Consistency 16
## 3.4 RLHF Results 17


#4 Safety 20

## 4.1 Safety in Pretraining 20

## 4.2 Safety Fine-Tuning 23

## 4.3 Red Teaming 28

* identify risks before LLMs: ex post facto usage and analysis. Rather, as has
* now “red teaming“ ie various kinds of proactive risk identification,
  * colloquially called so based on the term used in computer security This
* granular analysis is very important because safety is a long-tail issue, in
   * even very infrequent edge cases can cause noticeable problems. Even if
   * target specific patterns in a more comprehensive way
* We conducted a series of red teaming with various groups of
  internal employees, contract workers, and external vendors. These teams
  * > 350 people, including domain experts in cybersecurity, election fraud,
    social media misinformation, legal, policy, civil rights, ethics, software
    engineering, machine learning, responsible AI, and creative writing They
  * individuals representative of a variety of socioeconomic, gender,
    ethnicity, and racial demographics
* they probed our models across a wide range of risk categories (such as
  * eg criminal planning, human trafficking, regulated or controlled
    substances, sexually explicit content,
    unqualified health or financial advice, privacy
  * different attack vectors (such as hypothetical questions,
    malformed/misspelled inputs, or extended dialogues). Additionally, we
  * specific tests to determine the capabilities of our models to facilitate
    the production of weapons (eg nuclear, biological, chemical, and cyber);
    findings on these topics were marginal and were mitigated
    * we will continue our red teaming efforts in this front
  * To date, we targeted model outputs in English
    * nL included non-English prompts and dialogue contexts, as that is a
      well-known attack vector. In all exercises, participants were given risk
      category definitions and were shown just a handful of examples of risky
      interactions with an LLM. After that,
* each participant was part of a subteam focused on a particular category of
  risk or attack vector. After creating each dialogue, the red team participant
  would annotate various attributes, including risk areas and degree of risk,
  as captured by a 5-point Likert scale
* insights provided by members of red teams that we were able to improve upon
  * [Early models] were more likely to have generated unsafe responses without
    noting that they contain problematic content. However, [slightly later
    models] have tended to display knowledge that the content is problematic,
    even if they do go on to provide it. “They respond with ‘[UNSAFE CONTENT]
    is not appropriate to discuss, etc.’ and then immediately follow up with
    ‘With that said, here’s how [UNSAFE CONTENT].’ ” [Latest models] are able
    to resolve these issues
  * Distracting the [early models] by including “quirks” or specific requests
    usually defeated any reluctance encountered via more direct requests. “A
    creative writing request (song, story, poem, etc.) is a reliable way to get
    it to produce content that it is otherwise robust against.”
  * Embedding a problematic request in a positive context often successful for
    [early models]: “The overall principle I’ve found most effective for any
    * hide it in language that is positive, progressive, and empowering.”

### From Red Teaming Insights to Safer Models. Crucially,

* after each exercise, we performed a thorough analysis of the collected data,
  including dialogue length, risk area distribution, histogram of topic of
  misinformation (where appropriate), and rated degree of risk. In each case,
  we took the overall lessons as a guide to help further model safety training,
  and specifically took data from these exercises for model fine-tuning, model
  feedback training, and as a signal for other safety model training
* Multiple additional rounds of red teaming were performed over several months
  to measure the robustness of each new model as it was released internally. We
* we defined the robustness of a model,
  * [absolute]: γ, with respect to a red teaming exercise executed by a set of
    experts as the average number of created prompts that would trigger a
    violating response from the model per person per hour. As an
    * eg on our 7B model, we had an evolution of γ : 1.8 → 0.45 over several
      red teaming iterations and model refinements. Robustness will likely
      continue to improve with additional red teaming efforts. Another
  * the percentage of prompts triggering violating responses discovered in the
    previous red teaming exercises that were mitigated in a given new candidate
    release. On average, we had a 90% rejection rate model over model

## 4.4 Safety Evaluation of Llama 2-Chat 29


#5 Discussion 32

## 5.1 Learnings and Observations 32 with RLHF

### Beyond Human Supervision

* At the outset of the project, many among us expressed a preference for
  supervised annotation, attracted by its denser signal. Meanwhile
* reinforcement learning, known for its instability, a somewhat shadowy field
* nL reinforcement learning proved highly effective, particularly given its
  cost and time effectiveness. Our findings underscore that the crucial
* synergy it fosters between humans and LLMs throughout the annotation proc
* Even with proficient annotators,
  each individual writes with significant variation
* A model fine-tuned on SFT annotation learns this diversity, including,
  unfortunately, the tail-end of poorly executed annotation. Furthermore,
* perf is capped by the writing abilities of the most skilled annotators
* annotators are arguably less subject to discrepancy
  when comparing two outputs’ preference annotation for RLHF
* Consequently, the reward mechanism swiftly learns to assign low scores to
  undesirable tail-end distribution and aligns towards the human preference
* Figure 20: the worst answers are progressively removed, shifting the
  distribution to the right
* potential to venture into writing trajectories that even the best
  annotators may not chart
* humans can still provide valuable feedback when comparing two answers,
  beyond their own writing competencies.  Drawing a parallel, while we may
* writing abilities of LLMs surpassing human annotators in certain tasks, are
  fundamentally driven by RLHF,
  as documented in Gilardi+ (2023) and Huang+ (2023)
  * Fabrizio Gilardi, Meysam Alizadeh, and Maël Kubli
    Chatgpt outperforms crowd-workers for text-annotation tasks
    arXiv preprint arXiv:2303.15056, 2023
  * Fan Huang, Haewoon Kwak, and Jisun An
    Is chatgpt better than human annotators?
      potential and limitations of chatgpt in explaining implicit hate speech
    arXiv preprint arXiv:2302.07736, 2023
* Supervised data may no longer be the gold standard, and this evolving

### In-Context Temperature Rescaling.  An phenomenon related to RLHF 32

* related to RLHF, a feature not previously reported
* dynamic re-scaling of temperature contingent upon the context
* As indicated in Figure 8, the temperature appears to be influenced by RLHF
* fig 21: the shifts are not uniformly applied across all prompts, as shown in
  * eg prompts associated with creativity, such as “Write a poem,” an increase
    in temperature continues to generate diversity across our various RLHF
    iterations. This can be observed in the Self-BLEU slope, which mirrors a
    pattern comparable to that of the SFT model
  * vs prompts based on factual information, such as “What is the capital of ?”
    the Self-BLEU slope diminishes over time. This pattern suggests that
    despite the rising temperature, the model learns to consistently provide
    the same response to factual prompts

### Llama 2-Chat Temporal [human history] Perception Our model showcased 33

* Figure 22. We manually tested dozens of examples and observed consistently
* robust capability to organize its knowledge in a temporal manner, even when
  provided with minimal data. To instill a concept of time in Llama 2-Chat, we
  collected a set of 1,000 SFT examples that were related to specific dates
  These examples included questions like “How long ago did Barack Obama become
  president?” Each was associated with
  * two critical pieces of metadata: the date when the query was posed — which
    influenced the response — and the event date, a point in time prior to
    which the question would be nonsensical
* LLMs have internalized the concept of time to a greater extent than
  previously assumed, despite their
  * training being solely based on next-token prediction and
  * data that is randomly shuffled without regard to their chronolog context

## 5.2 Limitations and Ethical Considerations 34

## 5.3 Responsible Release Strategy 35


#6 Related Work 35

## Large Language Models

* scaling laws of Kaplan+ (2020)
* several Large Language Models with more than 100B parameters have been
  * from GPT-3 (Brown+ 2020) to Gopher (Rae+ 2022) or
* specialized models, eg Galactica, for science (Taylor+ 2022)
* With 70B parameters, Chinchilla (Hoffmann+ 2022) redefined those scaling laws
  towards the number of tokens rather than model weights. Notable in this
* Llama: focus on computational efficiency during inference (Touvron+ 2023). A
* open-source versus closed-source models
  * Open-source releases like BLOOM (Scao+ 2022), OPT (Zhang+ 2022), and Falcon
    (Penedo+ 2023) have risen to
    challenge their closed-source counterparts like GPT-3 and Chinchilla
  * "production-ready" LLMs such as ChatGPT, Bard, and Claude, there’s a
    * marked distinction in performance and usability. These models rely on
    * tuning techniques to align with human preferences (Gudibande+ 2023), a
      * still being explored and refined within the open-source community
  * Attempts to close this gap have emerged, with
  * distillation-based models such as
    Vicuna (Chiang+ 2023) and Alpaca (Taori+ 2023) adopting a unique approach
    * synthetic instructions (Honovich+ 2022; Wang+ 2022).  However, while
    * still fall short of the bar set by their closed-source counterparts

## Instruction Tuning

* Wei+ (2021) obtained zero-shot performance on unseen tasks by fine-tuning
  LLMs on numerous datasets
* Chung+ (2022) and Longpre+ (2023) investigate the impact of instruction
  tuning as a function of number of tasks, model size, prompt settings, etc
* Prompts used for instruction tuning can be created by humans or by LLMs
  themselves (Zhou+ 2022), and
  follow-up instructions can be used to refine initial generations to make them
  more useful, engaging, and unbiased (Ganguli+ 2023; Madaan+ 2023). An
* chain-of-thought prompting (Wei+ 2022b), in which models are prompted to
* RLHF has emerged as a powerful strategy for fine-tuning LLMs, enabling
  * significant improvements in their performance (Christiano+ 2017). The
  * first showcased by Stiennon+ (2020) in the context of text-summarization
  * since been extended to a range of other applications
  * In this paradigm, models are fine-tuned based on feedback from human users,
    thus iteratively aligning the models’ responses more closely with human
    expectations and preferences
* Ouyang+ (2022) demonstrates that
  a combination of instruction fine-tuning and RLHF can help
  fix issues with factuality, toxicity, and helpfulness that
  cannot be remedied by simply scaling up LLMs
* “RL from AI Feedback” (RLAIF, Bai+ 2022b)
  partially automates this fine-tuning-plus-RLHF approach by replacing
  * the human-labeled fine-tuning data
    with the model’s own self-critiques and revisions, and by replacing
  * human raters with a model when ranking model outputs in RLHF, a process

## Known LLM Safety Challenges. Recent literature has extensively explored the

* Bender+ (2021b) and Weidinger+ (2021) underscore various hazards like
  bias, toxicity, private data leakage, and the potential for malicious uses
* Solaiman+ (2023) categorizes these impacts into two groups — those
  * that can be assessed within the base system and those
  * requiring a societal context evaluation, while
* Kumar+ (2022): potential mitigation strategies to curb [kordában tart] harm
* Work from Roller+ (2020) and Dinan+ (2021) also illuminates the difficulties
  * concerns ranging from privacy to misleading expertise claims
* Deng+ (2023) proposes a taxonomic framework to tackle these issues, and
* Bergman+ (2022) delves into the balance between potential positive and
  negative impacts from releasing dialogue models
* Investigations into red teaming reveal specific challenges in tuned LLMs,
  * Ganguli+ (2022) and Zhuo+ (2023) showcasing a variety of successful attack
    types and their effects on the generation of harmful content
* National security agencies and various researchers eg Mialon+ (2023)
  * red flags around advanced emergent model behaviors, cyber threats, and
    potential misuse in areas like biological warfare
* broader societal issues like
  * job displacement due to accelerated AI research and an
  * over-reliance on LLMs leading to training data degradation are also
    (Acemoglu and Restrepo, 2018; Autor and Salomons, 2018; Webb, 2019;
    Shumailov+ 2023)
* We are committed to continuing our work engaging with the broader policy,
  academic, and industry community on these issues


#7 Conclusion36


#A Appendix 46

## A.1 Contributions 46
## A.2 Additional Details for Pretraining 47
## A.3 Additional Details for Fine-tuning 51
## A.4 Additional Details for Safety 58
## A.5 Data Annotation 72
## A.6 Dataset Contamination 75
## A.7 Model Card 77
