Efficient Few-Shot Learning Without Prompts
Lewis Tunstall, N Reimers, Unso ES Jo, L Bates, D Korat, M Wasserblat, O Pereg
arXiv:2209.11055 [cs.CL]

Our code is available at this https URL and our datasets at this https URL . 

* Recent few-shot methods, such as 
  * parameter-efficient fine-tuning (PEFT) and
  * pattern exploiting training (PET), have achieved 
  * impressive results in label-scarce settings. However, they are difficult to
  * cons 
    * high variability from manually crafted prompts, and typically 
    * require billion-parameter language models to achieve high accuracy. To
* we propose SetFit (Sentence Transformer Fine-tuning), 
  * an efficient and prompt-free framework for few-shot fine-tuning of Sentence
    Transformers (ST).
  * first fine-tuning a pretrained ST on a small number of text pairs, in a
    contrastive Siamese manner. 
  * The resulting model is then used to generate rich text embeddings, which are
    used to train a classification head.
  * requires no prompts or verbalizers, and achieves high accuracy with 
    orders of magnitude less parameters than existing techniques. Our
* experiments show that SetFit obtains comparable results with PEFT and PET
  techniques, while being an order of magnitude faster to train. We also show
  * multilingual settings by simply switching the ST body.

# 1 Intro

* We demonstrate S ET F IT ’s efficacy in few-shot text classification over a
  range of NLP datasets and in multiple scenarios including distillation and
  non-English data. We 
  * compared to 
    * standard PLM fine-tuning, 
    * SOTA PET~ and PEFT-based methods such as A DAPET (Tam+ 2021) and T-F EW
      (Liu+ 2022), as well as 
    * recent prompt-free techniques such as Perfect (Karimi Mahabadi+ 2022a)

# 2 Related Work

* small but signif liter: Sentence Transformers (ST) for text classification
  * Perone+ (2018): sentence embeddings for text classification.
  * Piao (2021) used ’out-of-the-box’ STs for text classification without
    fine-tuning them. 
  * S ET F IT differs from these works in two aspects: First, 
    * we fine-tune the ST in a Siamese manner for a text classification
    * few-shot setups.
* few-shot and zero-shot training line of literature as few-shot and zero-shot
  approaches have recently received a great deal of interest in the research
  community due to the availability of pretrained language models and the
  untapped capacity to use them in resource-constrained domains. Specifically,
  we discuss ICL, PEFT, and prompt-based fine-tuning.
  * ICL models directly generate predictions based on input-to-output training
    examples provided as prompts, without any parameter updates. Perhaps the best
    * GPT-3 (Brown+ 2020b) achieves remarkable few-shot performance. However,
      * hE 175 billion parameters and requires massive computational resources,
        prompt engineering, and can only utilize pretrained knowledge.
  * PEFT methods, such as adapters (Rebuffi+ 2017), hold 
    * the majority of parameters fixed during training and only update small
      feed-forward networks that are inserted within the larger model
      architecture. A recent example is 
      * T-FEW (Liu+ 2022) outperforms GPT-3 at much lower computational cost. It
        * by adding learned vectors that rescale the network’s internal
          activations. T-F EW is 
        * 16 times smaller than GPT-3, but is still too large to be utilized as
          a practical tool in industry. It also 
        * requires a set of handcrafted prompts for each dataset.
* prompt-based finetuning. This approach 
  * converts the downstream classification task into a masked-language modeling
    (MLM) objective. The model 
  * outputs tokens in a cloze-style format that maps to the corresponding labels
    via a predefined template. A well known example of this method is 
  * Pattern Exploiting Training (PET) (Schick and Schütze, 2021b,a) . Like GPT3,
  * manually-crafted prompts, but since the model can be fine-tuned to specific
    tasks, PET-based approaches typically outperform GPT-3 in few-shot
    scenarios, even with far smaller PLM backbones.
    PET has since been extended in two main directions: 
  * Adapet (Tam+ 2021), improves PET with a decoupled label objective and
    label-conditioned MLM objective, and 
  * Perfect (Karimi Mahabadi+ 2022b) which uses 
    * task-specific adapters (Houlsby+ 2019; Pfeiffer+ 2021) and 
    * multi-token label-embeddings eliminate task prompts and verbalizers
      * independent from the language model vocabulary 
