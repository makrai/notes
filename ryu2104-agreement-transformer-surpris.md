Accounting for Agreement Phenomena in Sentence Comprehension with GTP-2:\
  Effects of Similarity-based Interference on Surprisal and Attention\
Soo Hyun Ryu, Richard L. Lewis\
CMCL 2021 arXiv:2104.12874 [cs.CL]

* We advance a novel explanation of similarity-based interference effects in
  subject-verb and reflexive pronoun agreement processing,\
  grounded in surprisal values computed from a pretrained large-scale GPT-2
* surprisal of the verb or reflexive pronoun predicts\
  facilitatory interference effects in ungrammatical sentences, where a
  distractor noun that matches in number with the verb or pronoun leads to
  faster reading times, despite the distractor not participating in the
  agreement relation
* We review the human empirical evidence for such effects,\
  including recent meta-analyses and large-scale studies. We also show that
* attention patterns (indexed by entropy and other measures) in the Transformer
  show patterns of diffuse attention in the presence of similar distractors,
  consistent with cue-based retrieval models of parsing
* But in contrast to these models,\
  the attentional cues and memory representations are learned entirely from the
  simple self-supervised task of predicting the next word. 

# 1 Intro

* Deep Neural Network (DNN) language models
  * linguistic competence \
    (Chaves 2020; Da Costa and Chaves 2020; Ettinger 2020; Wilcox+ 2018 2019)
  * pot to provide accounts of psycholinguistic phenomena in sentence proc
    (Futrell+ 2018; Linzen and Baroni, 2021; Van Schijndel and Linzen, 2018;
    Wilcox+ 2020)
* In this paper we show how attention-based transformer models (we use a
  pre-trained version of GPT-2) provide the basis\
  for a new theoretical account of\
  facilitatory interference effects in subject-verb and reflexive agreement
  processing
  * we review the effects in detail below
  * effects have played an important role in psycholinguistic theory because
    they show that properties of noun phrases that are not the grammatical
    targets of agreement relations may nonetheless exert an influence on
    processing time at points where those agreement relations are computed.

* The explanation we propose here is a novel one
  * grounded in surprisal (Hale, 2001; Levy, 2008), but with
  * origins in graded attention and similarity-based interference\
    (Van Dyke and Lewis, 2003; Lewis+ 2006; Jäger+ 2017)
  * We use surprisal as the key predictor of reading time (Levy, 2013), and
  * targeted analyses of patterns of attention in the transformer, show that\
    the model behaves in ways consistent with cue-based retrieval theories of
    sentence processing
  * The account thus provides a new integration of\
    surprisal and similarity-based interference theories of sentence procing,
    adding to a growing literature of work integrating\
    noisy memory and surprisal (Futrell+ 2020)
  * In this case, the noisy representations arise from training the transformer
    * interference must exert its influence on reading times\
      through a surprisal bottleneck (Levy, 2008).

# 2 Agreement interference effects human sentence processing\
(subject-verb and reflexive pronoun) 

# 3 GPT-2 for human reading time studies 

* GPT-2 architecture, its interesting psycholinguistic properties, and
* the method and metrics that we will use to examine the agreement effects 

# 4 Subject-verb agreement experiments

# 5 Reflexive agreement experiments
 
# 6 theoretical reflections, weaknesses, and future work
