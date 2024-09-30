The NarrativeQA Reading Comprehension Challenge
Tomáš Kočiský, Jonathan Schwarz, Phil Blunsom, Chris Dyer, Karl Moritz Hermann, Gábor Melis, Edward Grefenstette
arXiv:1712.07040 [cs.CL]

# Abstract

* Reading comprehension (RC)---in contrast to information retrieval---
  * requires integrating information and reasoning about events, entities, and
    their relations across a full document.
  * Question answering is conventionally used to assess RC ability, in both
    artificial agents and children learning to read. However, existing RC
  * datasets and tasks are dominated by questions that can be solved by
    selecting answers using superficial information (e.g., local context
    similarity or global term frequency); they thus fail to test for the
* we present a new dataset and set of tasks in which
  the reader must answer questions about stories by reading entire books or
  movie scripts. These tasks are designed so that successfully
  * answering their questions requires understanding the underlying narrative
  * humans solve the tasks easily, standard RC models struggle on the tasks
  * We provide an analysis of the dataset and the challenges it presents.

# Conclusion

* domain: fiction ie self-contained
  * richer set of entities, events, and the relations between them. We have
* a range of tasks, from
  * simple: read summaries of books and movie scripts, and generate or rank
    fluent English answers to human-generated questions
  * more complex: read the full stories to answer the questions (no summaries)
* the larger tasks are significantly more difficult as
  * the issue of scaling neural models to large documents,
  * questions formulated based on one or two sentences of a summary might
    require appealing to possibly discontiguous sentences or paragraphs
* requires potential solutions to these tasks to jointly
  * model the process of searching for information (possibly in several
    steps) to serve as support for generating an answer
  * generating the answer entailed by said support.
* SOTA
  * End-to-end mechanisms for both searching for information, such as
    attention, do not scale beyond selecting words or n-grams in short
    contexts such as sentences and small documents. Likewise,
  * neural models for mapping documents to answers, or determining entailment
    typically operate on the scale of sentences rather than sets of paragraphs.
* baseline and benchmark results for both sets of tasks, demonstrating that
  * summaries: existing models give sensible results out of the box on
  * they do not get any traction on the book-scale tasks
* a quant and qual analysis of the difficulty of the more complex tasks, we
* future research directions that may help bridge the gap between existing
  * we hope that this dataset will serve not only as/but as
    * a challenge for the machine reading community, but as
    * a driver for the development of a new class of neural models which will
