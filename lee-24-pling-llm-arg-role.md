A Psycholinguistic Evaluation of Language Models’ Sensitivity to Argument Roles
Eun-Kyoung Rosa Lee, Sathvik Nair, Naomi Feldman 
Findings of EMNLP 2024 November Miami, Florida, USA 3262–3274

# Abstract

* we replicate psycholinguistic studies on human argument role processing
* language models are able to distinguish verbs that appear
  in plausible and implausible contexts, where 
  plausibility is determined through the relation between the verb and its
  preceding arguments. However, 
* none of the models capture the same selective patterns that human
  comprehenders exhibit during real-time verb prediction
* ie LMs’ capacity to detect verb plausibility not from the same mechanism
  that underlies human real-time sentence processing

# 1 Intro

* Surprisingly, studies with human participants have shown that
  the roles assigned to the arguments by the structure do
  not immediately impact verb prediction,
  in contrast to the context-independent lexical meanings of arguments. Human
  * similar initial responses to a verb when it appears
    in role-appropriate and role-reversed contexts (e.g., 1a vs 1b)
  * Kim and Osterhout, (2005); Chow+ (2016). This has been taken to indicate
  * ie argument roles have a delayed impact on verb prediction in human proc
* used paradigms from experimental psycholinguistics
  to evaluate LM’ representation of syntactic and semantic knowledge, and
  * language models trained on next-word prediction alone have shown strong
    levels of correspondence with human behavioral and neural data.
  * ? the extent to which they accurately encode and utilize 
    * structural information, such as argument roles, in relation to
    * structure-independent word meanings, 
    to determine sentence plausibility remains an open question
* whether models can distinguish between plausible and implausible sentences
  involving argument role manipulations (Ettinger, 2020; Papadimitriou+ 2022;
  Wilson+ 2023a; Kauf+ 2023). However, much of this research has focused on
  * full sentences
    rather than isolating the relationship between argument roles and the verb,
    * confounding factors such as animacy. This makes it challenging to
* we take a new approach in evaluating role-sensitivity in LLMs, by focusing on
  representations of verbs that appear in plausible/implausible sentence contxt,
  * plausibility is determined based on the verb’s compatibility with the
    preceding argument-role bindings.
  * insights from experimental work testing humans’ role-sensitivity and
  * a more direct evaluation of LM vs human sensitivity to structural
  * testing language models that are trained on next-word prediction provides a
  * whether the systematic predictive patterns observed in human behavior
    naturally arise from 
    * statistical co-occurrences and a prediction objective, as opposed to
    * additional human cognitive processes. In this way, 
  * directly comparing predictive processing between humans and models can help
    us better understand the mechanisms that underlie human language processing.
* We adapt materials used in psycholinguistic studies
  evaluating humans’ sensitivity to argument roles, which allows us to use
  * carefully constructed minimal pairs of sentences which 
  only differ with respect to argument roles, while 
  controlling for other factors like animacy.
  * examining models’ ability to extract argument-role bindings based on
    sentence structure, as it 
  * requires models to go beyond simply learning relations between arguments and
    verbs, i.e., between real-world events and participants that are likely to
    be involved in those events. We compare model performance on two different
* 2 types of argument role manipulations, in addition to a baseline condition
  which has shown to elicit immediate sensitivity in humans, as a way to more
  systematically compare human and model behavior.
* we find that 
  * language models show weak sensitivity to argument role information
    relative to role-independent argument meanings,
    similar to human initial prediction behavior, 
  * models do not show the same consistency
    across different types of argument role manipulations as humans do,
    indicating a difference in the way argument roles are processed 
  * models’ weak performance may not necessarily arise from inaccurate
    processing of argument roles. These results 
* overall indicate that 
  even if models are able to distinguish plausible and implausible verbs
  based on argument roles, to varying degrees of success, 
  the lack of generalization across sentences that share the same structural
  relation suggests that 
  the models do not use the same mechanism as humans to compute argument-verb
  relations
