Learning Transformer Programs
Dan Friedman, Alexander Wettig, Danqi Chen
arXiv:2306.01128 [cs.LG] NeurIPS 2023 (oral)

tl;dr intrinsically interpretable machine learning

code

* Recent research in mechanistic interpretability has attempted to
  * reverse-engineer Transformer models by carefully
    inspecting network weights and activations. However, these approaches
  * hE require considerable manual effort and still fall short of providing
  * not complete, faithful descriptions of the underlying algorithms. In this
* we introduce a procedure for
  training Transformers that are mechanistically interpretable by design
  * We build on RASP [Weiss+ 2021],
    a programming language that can be compiled into Transformer weights
  * Instead of compiling human-written programs into Transformers, we design
    a modified Transformer that can be trained using gradient-based optimization
    and then automatically converted into a discrete, human-readable program. We
  * name: Transformer Programs. To validate our approach, we learn
* exper: Transformer Programs for a variety of problems, including an
  eg in-context learning task,
  a suite of algorithmic problems (e.g. sorting, recognizing Dyck languages),
  and NLP tasks including named entity recognition and text classification
* The Transformer Programs can automatically find reasonable solutions,
  performing on par with standard Transformers of comparable size; and,
  more importantly, they are easy to interpret. To demonstrate these advantages,
* we convert Transformers into Python programs and
  use off-the-shelf code analysis tools to
  debug model errors and
  identify the "circuits" used to solve different sub-problems. We hope that
  Transformer Programs open a new path toward the goal of
