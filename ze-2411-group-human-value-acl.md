SPICA: Retrieving Scenarios for Pluralistic In-Context Alignment
Quan Ze Chen, K.J. Kevin Feng, Chan Young Park, Amy X. Zhang
ACL 2025 arXiv:2411.10912 [cs.CL]

* different groups' [human] values differ, one approach to 
* steer models at inference time towards each group's preferences. However,
  * techniques like in-context learning ie drawing few-shot examples
  * hE only consider similarity and not cross-group differences in values. 
* We propose SPICA, a framework that
  accounts for group-level differences during in-context example retrieval
  * three designs: scenario banks, group-informed retrieval metrics, and
    in-context alignment prompts
* evaluation of SPICA on an alignment task 
  * inputs from four demographic groups (n=544), 
  * our metrics retrieve in-context examples that more closely match observed
    preferences, with the best prompt configuration using multiple contrastive
    responses to demonstrate examples
  * end-to-end evaluation (n=120), we observe that SPICA is
    higher rated than similarity-based retrieval, with groups seeing
    up to a +0.16 point improvement on a 5 point scale. Additionally, 
    * gains from SPICA were more uniform ie all groups benefiting from alignment
* group-agnostic approach can align to aggregated values, 
  hE it is not most suited for divergent groups

# 2 Related Work

## Value Alignment of LLMs 

* Traditional methods for customizing LLMs for specific tasks and domains
  involve modifying training procedures
  * pretraining on task-specific corpora (Wu+ 2023; Lee+ 2020)
  * post-hoc finetuning (Gururangan+ 2020; Han and Eisenstein, 2019)
  * instruction tuning (Ge+ 2023; Gupta+ 2022; Shi+ 2023)
  * aligning with human preferences (Ouyang+ 2022)
* These approaches are also used to encode moral values and human preferences
  (Tay+ 2020; Bai+ 2022; Liu+ 2022; Bang+ 2023; Jang+ 2023)
* significant limitations for value alignment.  They 
  * require extensive human annotation (Kim+ 2023)
  * limited understanding of how well the models have internalized these values
    (Agarwal+ 2024), making them less robust for value alignment. Moreover, 
  * evolving values :-( Once trained, these models lack flexibility; 
    * updating often requires complete retraining (Carroll+ 2024)

## Accounting for Pluralism in Value Alignment 

* Supporting pluralistic values is crucial for building general-purpose agents
  (Sorensen+ 2024b).
  * Large datasets like ValuePrism (Sorensen+ 2024a) and PRISM (Kirk+ 2024)
    highlight the importance of reflecting diverse values, yet achieving
    consensus remains challenging. 
* Some approaches turn to higher-level abstract descriptions of values as a
  solution for building consensus via deliberative inputs (Bai+ 2022). However,
  practical application of these values to specific cases often reveals
  discrepancies in understanding (Koshy+ 2023). Drawing from the 
* legal realm, there have also been approaches that propose combining
  higher-level descriptions with specific examples (e.g., legal precedents) to
  illustrate more ambiguous concepts encoded by values
  (Cheong+ 2024; Chen and Zhang, 2023)
* second-order challenges when groups share similar sets of preferences or
  values (such as preferring diversity and factual quality) while also
  disagreeing on their salience (Jackson, 1960) and thus prioritization in
  practical application (Weld+ 2022). This aspect is often overlooked by
  existing frameworks for pluralistic alignment. 
  * SPICA captures disaggregated individual preferences that
    can be used to derive both first-order group preferences (values) and
    second-order group norms.

# 4 Exper

## 4.1 Dataset and Scenario Bank Construction

* For our evaluation alignment task, we constructed a set of queries (which
  define the topics to provide alignment on) by drawing
  from an existing set of challenging alignment situations based on
  prompts observed in conversations on the PRISM dataset (Kirk+ 2024). 
  * PRISM engaged human participants to interact with LLMs by naturally
    starting conversations with 3 types of guidance meant to invoke conversats
    around more challenging and complex topics: 
    “unguided”, “values guided”, or “controversy guided”. We observed that of
  * unguided conversations primarily resulted in simple informational requests
    which are not particularly controversial in the context of pluralistic
    alignment, so we opted to drop conversations of this type.
  * val qui + cont: we randomly selected a subset, split into 3 slices:
    retrieval (train, n = 360), weight optimization and selection of ICL prompt
    setups (dev, n = 150), and evaluation hold-out (test, n = 75).
  * PRISM responses are created by existing collective-value-aligned models,
    they do not cover desirable behaviors for all groups. Instead, we follow
    Section 3.1 and construct new responses ourselves based on several classes
    of common model behaviors (Appendix A.7.1). To capture the stochastic nature
    of model outputs, we generate 3 responses in each class.

# 5 Conclusions and Discussion

* group-informed metrics coupled with the scenario bank and ICL prompts in Spica
  contributed to improving pluralistic alignment,
  primarily by supporting groups that are traditionally disadvantaged.

## Pluralistic Versus Collective Values From prior work, we have seen how

* models can favor the values and norms of their designers and the majority
  (Buyl+ 2024; Rozado, 2024) in collective alignment settings.
* Spica presents a path towards supporting pluralistic alignment towards
  individual groups. However, 
* hE focusing on pluralistic alignment alone can lead to divides along
  demographic and ideological lines, furthering social fragmentation.
* Ultimately, we believe there should be a balance between
  striving for common ground through collective alignment (Bai+ 2022), and
  accommodating diverse views through pluralistic alignment.

## Efficiently Mapping Group Values and Norms In this work, 

* we built our scenarios by drawing from existing conversation data. However,
  * this is not a very efficient way to map group values— 
    many user queries may not have controversial model behaviors and 
    even controversial conversations end up covering similar points of
    contention [állítás; viszály]
* future work: elicit group values through interactive LLM-backed agents
  engaging with groups in human-in-the-loop refinement and synthesis processes
  (Klingefjord+ 2024) that 
  could produce scenarios that are either/or
  better demonstrations of values and norms or 
  more controversial to ground ambiguous decision bounds
