Learning and Evaluating General Linguistic Intelligence
Dani Yogatama, Cyprien de Masson d'Autume, Jerome Connor, Tomas Kocisky, Mike Chrzanowski, Lingpeng Kong, Angeliki Lazaridou, Wang Ling, Lei Yu, Chris Dyer, Phil Blunsom
arXiv:1901.11373 [cs.LG]

* We define general linguistic intelligence (GLI) as the
  ability to reuse previously acquired knowledge about a language's lexicon,
  syntax, semantics, and pragmatic conventions to adapt to new tasks quickly.
* we analyze SOTA natural language understanding models and conduct an
  extensive empirical investigation to evaluate them against these criteria
  through a series of experiments that
  assess the task-independence of the knowledge being acquired by learning
* , we propose a new evaluation metric 
  * In addition to task performance 
  * based on an online encoding of the test data that
    quantifies how quickly an existing agent (model) learns a new task.  Our
* while the field has made impressive progress in terms of
  model architectures that generalize to many tasks, these
  models still require a lot of in-domain training examples (e.g., for fine
  tuning, training task-specific modules), and are
  prone to catastrophic forgetting.  Moreover, we find that
  * far from solving general tasks (e.g., document question answering), our
  * overfitting to the quirks of particular datasets (e.g., SQuAD). We discuss
  * missing components 
  * conjecture on how to make progress toward general linguistic intelligence. 

# 6 Discussion

* They typically include task-specific components to perform multiple tasks,
  and assume that the data distribution is stationary within a task.

* we need more sophisticated transfer and continual learning methods.  For
  * eg elastic weight consolidation (Kirkpatrick+ 2017) and
    progress and compress (Schwarz+ 2018) may hold promise
    for improving our models’ robustness to forgetting. Another crucial
  * currently underexplored is a memory module that
    * rapidly adapts to domain shifts and generalizes across tasks. Recent work
    * neural cache (Grave+ 2017) and
    * dynamic evaluation (Krause+ 2018) provide some evidence of the effectiven
    * future: design similar models that
      operate beyond the token level and are reusable across tasks 

* Learning to learn (i.e., meta learning) is another approach to
  learn models that adapt to new tasks rapidly. In this setup,
  * parameters of the model are trained to ensure that
    a small number of gradient steps on a new task results in good performance
  *  meta learning natural language processing models
    * not much work on it
    * Standard meta learning methods (Finn+ 2017; Nichol+ 2018) require the
      distribution of tasks that we want the model to adapt to to be known in
      advance (i.e., we need to know all the tasks that we want to evaluate
      on)
    * However, since NLP models take the same kind of inputs for all tasks
      (i.e., a sequence of characters or words),
      it is conceivable that meta-learned NLP models generalize to new unseen
      tasks. In particular,
    * our code-length objective offers an intriguing meta learning objective
      since it quantifies generalization speed.

* curriculum design
  * When presented with multiple training examples from multiple tasks,
    our experiments also show that
    training curriculum can have a considerable effect on model performance. In
  * important if we can see all the tasks beforehand (i.e., similar to the
    multitask training setup), designing a curriculum that allows the model to
    learn better and faster becomes .

* Population Based Training (PBT, Jaderberg+ 2017) could be used to
  * design a curriculum that improves training. PBT
  * requires a lot of computational resources, but
    the cost could be amortized if it can be used to establish a fixed schedule
    that becomes a standard curriculum for training GLI models.

* task- specific components (among others)
  * One key reason that our models generalize poorly to other tasks is that
  * A perfect language model should in theory be able to do any linguistic task
    (e.g., by formulating the task as a question and querying the language
    model to generate answers)
  * McCann+ (2018) proposed such a model that can work on multiple tasks,
    although the overall performance of their model is still below task spec ms
* Unsupervised pretraining of language models that are then used as a backbone
  of task-specific models has also been shown to considerably improve
  performance on downstream tasks (Radford+ 2018; Peters+ 2018; Devlin+ 2018).
  * believe that continued progress on generative LMs will drive GLI
* not considered 
  * robustness to adversarial examples 
  * ability to understand multiple languages In this paper, we mainly consider
  * Jia & Liang (2017) show that
    reading comprehension models trained on SQuAD are very prone to adversarial
    * some adversaries are constructed by shifting the distribution of the
      inputs in non-trivial but meaning-preserving ways
  * Improving cross-dataset transfer inside a single task will likely see this
    classes of adversaries weakened
* future: model should also be able to provide human-understandable reasoning
  of its decisions and intentions (interpretablity and explainability).
