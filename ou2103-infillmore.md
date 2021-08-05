InFillmore: Frame-Guided Language Generation with Bidirectional Context
Jiefu Ou, Nathaniel Weir, Anton Belyy, Felix Yu, Benjamin Van Durme
`*`SEM 2021 arXiv:2103.04941 [cs.CL]

Codebase and demo available from https://nlp.  jhu.edu/demos/infillmore.  ‡

# Abstract

* We propose a structured extension to bidirectional-context conditional
  language generation, or "infilling," 
  * inspired by Frame Semantic theory (Fillmore, 1976).  
  * Guidance is provided through two approaches: 
    * model fine-tuning, conditioning directly on observed symbolic frames, and 
    * a novel extension to disjunctive lexically constrained decoding that
      leverages frame semantic lexical units.  Automatic and human evaluations
* allows for explicit manipulation of intended infill semantics, with minimal
  loss in distinguishability from human-generated text.  Our methods flexibly

# 1 Introduction

* A popular strategy for automatic story generation is coarse-to-fine: 
  * first by proposing a story plan, and then realizing it into natural
    language form using large pretrained neural language models 
    (Fan+ 2018; Goldfarb-Tarrant+ 2019). In this work, 
* we study the use of FrameNet frames (Baker+ 1998) as representational units
  for such plan guidance.  In 
  * Frame Semantics (Fillmore, 1976; Fillmore and Baker, 2010), 
    * words evoke structural situation types (frames) that 
    * frames describe the common schematic relationships between lexical items.
  * hypothesize yielding a flexible, controllable and domain-general model for
    surface realization of story plans with a variety of dimensions for user
* lexically constraining its generation output to contain frame-associated LUs.
* We evaluate through a sentence-infilling task based on ROCStories
  (Mostafazadeh+ 2016), assessing performance on two dimensions:
  * the quality of generation, as measured through perplexity and human eval
  * the fidelity: whether generated text evokes the frames used as guidance. We
