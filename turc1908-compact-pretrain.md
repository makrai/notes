Well-Read Students Learn Better: On the Importance of Pre-training Compact Models
Iulia Turc, Ming-Wei Chang, Kenton Lee, Kristina Toutanova
arXiv:1908.08962 [cs.CL] Comments: 	Added comparison to concurrent work

* model compression techniques on pre-trained language representations 
  (Sun+ 2019; Sanh, 2019).
* hE, the baseline of just pre-training and fine-tuning compact LMs overlooked
* we first show that
  * pre-training remains important in the context of smaller architectures, and
    fine-tuning pre-trained compact models can be competitive to more elaborate
    methods proposed in concurrent work
* Starting with pre-trained compact models, we then explore
  transferring task knowledge from large fine-tuned models
  through standard knowledge distillation
* => simple, yet effective and general algorithm, Pre-trained Distillation,
  brings further improvements
* experiments
  * more generally explore the interaction between pre-training and distill
    under two variables that have been under-studied:
    model size and properties of unlabeled task data.  One surprising
* these variables have a compound effect
  even when sequentially applied on the same data
* To accelerate future research, we will make our 24 pre-trained miniature BERT
  models publicly available. 

# 1 Intro

* Could we directly train small models using the same two-staged approach? In
  * ie applying language model (LM) pre-training and task fine-tuning to
    compact architectures directly
  * This simple baseline has so far been overlooked by the NLP community,
    potentially based on an underlying assumption that
    the limited capacity of compact models is capitalized better when focusing
    on the end task rather than a general LM objective
  * Concurrent work proposes variations of the standard pre-training+fine-tuning,
    but with limited generality (Sun+ 2019a; Sanh, 2019)
  * We make the surprising finding that pre-training+fine-tuning in its
    original formulation is a competitive method for building compact models.
* For further gains, we leverage knowledge distillation (Hinton+ 2015), the
    * standard technique for model compression
    * A compact student is trained to recover the predictions of a highly
      accurate teacher
    * posited regularization effect of these soft labels (Hinton+ 2015),
  * In addition, distillation provides a means of producing pseudo-labels
  * By regarding
    LM pre-training of compact models as a student initialization strategy, we
    can take advantage of both methods
  * The resulting algorithm is a sequence of three standard training operations
    * masked LM (MLM) pre-training (Devlin+ 2018), task-specific distillation,
      and optional fine-tuning.
* we will refer to it as Pre-trained Distillation (PD, Figure 1).
  * Section 6.2, PD outperforms the pre-training+fine-tuning (PF) baseline,
    especially in the presence of a large transfer set for distillation.
* a controlled study
  following data and model architecture settings in concurrent work (Sec 4)
  * Pre-trained Distillation outperforms or is competitive with more elaborate
    approaches which use either/or more sophisticated ~
    * distillation of task knowledge (Sun+ 2019a) or
      * distill task knowledge from intermediate teacher activations,
        starting with a heuristically initialized student
    * pre-training from unlabeled text (Sanh, 2019)
      * fine-tune a compact model that is pre-trained on unlabeled text with
        the help of a larger LM teacher.
* extensive experiments that examine how
  Pre-trained Distillation and its baselines perform under various conditions.
  We investigate two axes that have been under-studied in previous work:
  model size and amount/quality of unlabeled data
  * 24 models of various sizes (4m to 110m parameters) and depth/width
    trade-offs, we observe that
  * model
    * pre-trained students can leverage depth much better than width;
      in contrast, this property is not visible for randomly-initialized models.
  * data
    * we vary 
      the amount of unlabeled data, as well as
      its similarity to the labeled set
    * Interestingly, Pretrained Distillation is more robust to these variations
      in the transfer set than standard distillation.
* to gain insight into the
  interaction between LM pre-training and task-specific distillation, we
  * sequentially apply these operations on the same dataset. In this
  * chaining the two operations performs better than any one of them applied in
    isolation, despite the fact that a single dataset was used for both steps.
  * surprising, indicating that
    pre-training and distillation learn complementary aspects of the data.
* we will make our 24 pretrained miniature BERT models publicly available
