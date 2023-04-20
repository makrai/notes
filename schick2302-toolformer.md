Toolformer: Language Models Can Teach Themselves to Use Tools
Timo Schick, Jane Dwivedi-Yu, Roberto Dessì, Roberta Raileanu, Maria Lomeli,
  Luke Zettlemoyer, Nicola Cancedda, Thomas Scialom
arXiv:2302.04761 [cs.CL]

* Language models (LMs) exhibit remarkable abilities to solve new tasks
  from just a few examples or textual instructions, especially at scale. They
  * he struggle with basic functionality, such as arithmetic or factual lookup,
    where much simpler and smaller models excel
* we show that LMs can teach themselves to use external tools via simple APIs
  * Toolformer, a model trained to decide which APIs to call, when to call
    them, what arguments to pass, and how to best incorporate the results
  * self-supervised way, requiring nothing more than
    a handful of demonstrations for each API
  * We incorporate a range of tools, including a calculator, a Q\&A system, two
    different search engines, a translation system, and a calendar
  * substantially improved zero-shot performance across a variety of downstream
    * often competitive with much larger models, keeping LM abilities
