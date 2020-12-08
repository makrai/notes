What BERT is not: Lessons from a new suite of psycholinguistic diagnostics LM
Allyson Ettinger
arXiv:1907.13528

# Abstract

* we introduce a suite of diagnostics drawn from human language experiments,
  * allow us to ask targeted questions about the information used by LMs
* BERT can generally distinguish good from bad completions involving shared
  category or role reversal, albeit with less sensitivity than humans, and it
  * robustly retrieves noun hypernyms, but it 
  * struggles with challenging inferences and role-based event prediction -and
  * clear insensitivity to the contextual impacts of negation. 

# 1 Intro

* diagnostics targeting a range of linguistic capacities, drawn from psycholing
  * advantages Because of their origin in psycholinguistics,
    * carefully controlled to ask targeted questions about linguistic capabilits
    * ask these questions by examining word predictions in context, which 
      * allows us to study LMs without any need for task-specific fine-tuning.  
* distinctive properties of our diagnostics
  * chosen specifically for their capacity to reveal insensitivities in
    predictive models, as evidenced by patterns that they elicit in human brain
    responses.  
  * beyond the syntactic focus seen in existing LM diagnostics— we have tests
    * commonsense/pragmatic inference, semantic roles and event knowledge,
      category membership, and negation. 
* Each of our diagnostics is set up to support tests of both 
  * word prediction accuracy and 
  * sensitivity to distinctions between good and bad context completions.
* we focus on the BERT model here as an illustrative case study, these
  diagnostics are applicable for testing of any language model.  
* two main contributions
  * a new set of targeted diagnostics for assessing linguistic capacities in
  * shed light on strengths and weaknesses of the popular BERT model. We find
    * struggles with challenging commonsense/pragmatic inferences and 
      role-based event prediction, that it is 
    * generally robust on within-category distinctions and role reversals, but
      with lower sensitivity than humans, and that it is 
    * very strong at associating nouns with hypernyms.  Most strikingly,
    * fails completely to show generalizable understanding of negation,
