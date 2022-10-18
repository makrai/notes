BERT-A: Fine-tuning BERT with Adapters and Data Augmentation
Sina J. Semnani, Kaushik Ram Sadagopan, Fatma Tlili
https://web.stanford.edu/class/archive/cs/cs224n/cs224n.1194/reports/default/15848417.pdf

## 2.3 Adapters and PALs

* Both PALs (Stickland and Murray [15]) and adapters ([3]) introduce
  task-specific modules in the BERT architecture for multi-task training
  * Adapters [3] add new bottleneck modules within the transformer layers of
    the pre-trained network which are fine-tuned for the given task. Similarly
  * [15] add Projected Attention Layers within the transformer layer with
    shared weights across the different transformer layers of the BERT model
  * We describe these models in more details in the next section

# 6 Conclusion

* for QA, adapters outperform other approaches
  eg tuning the last transformer block of BERT or using PALs
* We have also provided a method to use adapters to achieve high F1 measure
* future direction is using the very large TriviaQA [6] dataset for pretraining
  * adding appropriate task-specific modules inside BERT can help interpreting
    * eg task-specific attentions where we used linear projection, and try to
      visualize the attention mechanism
    * This visualization would not be mixed with what BERT attentions have
      already learned during their pre-training on language modeling tasks
