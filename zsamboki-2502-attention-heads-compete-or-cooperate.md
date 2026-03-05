Do Attention Heads Compete or Cooperate during Counting?
Pál Zsámboki, Ádám Fraknói, Máté Gedeon, András Kornai, Zsolt Zombori
arXiv:2502.06923 [cs.LG]

* we training small transformers on an elementary task, counting, which is 
  * a crucial deductive step in many algorithms. 
  * We present an in-depth mechanistic interpretability analysis
  * we investigate the collaboration/competition among the attention heads: we
  * ie pseudo-ensemble, all solving the same subtask, or 
    they perform different subtasks, meaning that they can only solve the
    original task in conjunction.
* on the semantics of the counting task, 
  attention heads behave as a pseudo-ensemble, 
  * but their outputs need to be aggregated in a non-uniform manner
    in order to create an encoding that conforms to the syntax.
