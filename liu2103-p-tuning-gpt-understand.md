GPT Understands, Too
Xiao Liu, Yanan Zheng, Zhengxiao Du, Ming Ding, Yujie Qian, Zhilin Yang,
  Jie Tang
arXiv:2103.10385 [cs.CL]

* Prompting a pretrained language model with natural language patterns has been
  * effective for natural language understanding (NLU). However, our
  * hE manual discrete prompts often lead to unstable performance -eg
  * changing a single word in the prompt might result in substantial
    performance drop. 
* We propose a novel method P-Tuning that employs 
  * trainable continuous prompt embeddings in concat with discrete prompts
* Empirically, P-Tuning not only/but also 
  * stabilizes training by minimizing the gap between various discrete prompts,
  * improves performance by a sizeable margin on NLU tasks eg LAMA & SuperGLUE
  * generally effective for both frozen and tuned language models, under 
  * both the fully-supervised and few-shot settings
* from the related work: Technically, P-Tuning also has a few unique designs
  * hybrid continuous-discrete prompts and employing a prompt encoder

# 1 Intro

* Pretrained language models (PLMs; Brown+ 2020) have significantly advanced
  the performance of natural language understanding (NLU). PLMs are trained
  with different pretraining objectives, such as 
  * masked language modeling (Devlin+ 2018), 
  * autoregressive language modeling (Radford+ 2019), 
  * seq2seq (Raffel+ 2019), and 
  * permutation language modeling (Yang+ 2019).
* prompting (Brown+ 2020; Schick and Schütze, 2020)
  * manually written prompt patterns as additional input to a language model.
  * PLMs are either finetuned on a small labeled dataset or frozen for direct
    inference on downstream tasks.  Prompting has 
  * significantly improved the performance of many NLU tasks
    (Brown+ 2020; Schick and Schütze, 2020)
* manual discrete prompts suffer from a large degree of instability.
  * Table 1: with a frozen language model, changing a single word in the prompt
    might result in substantial performance drop. As we will show in Section 3,
  * when the language model is tuned, the instability problem is alleviated but
    the performance difference between different prompts is still sizeable,
    especially in the few-shot setting. Such an instability issue of discrete
* automatic prompting have attempted to search for a better-performing prompt
  given a task (Shin+ 2020; Gao+ 2020; Jiang+ 2020b), but these methods do not
  * still unstable
* we: P-Tuning that employs
  trainable continuous prompt embeds in concatenation with discrete prompts.
  * given a discrete prompt as the input, P-Tuning concatenates continuous
    prompt embeddings with the discrete prompt tokens and feeds them as the
    input to the language model. The continuous prompts are updated by
    backpropagation to optimize the task objective. The intuition is that
    continuous prompts incorporate a certain degree of learnability into the
    input, which may learn to offset the effects of minor changes in discrete
    prompts to improve training stability. To further improve performance, 
  * we employ a prompt encoder using LSTMs or MLPs to model the dependency
    between continuous prompt embeddings.
* experiments with two NLU benchmarks: the LAMA (Petroni+ 2019) knowledge
  probing and SuperGLUE (Wang+ 2019a). On 
  * LAMA, with the language model frozen, P-Tuning outperforms manual
    discrete prompts and searched prompts by 20+ points and 9 points
    respectively with the same pretrained models. On 
  * SuperGLUE, with the language model finetuned, P-Tuning outperforms PET
    (Schick and Schütze, 2020) with the best discrete prompts under both the
    fully-supervised and few-shot settings. In addition to improving
  * substantially reduces the performance gap between different discrete
    prompts ie improved stability for language model adaptation.
    * across a wide range of tasks and settings

# 3 Experiments 3

## 3.1 LAMA (Petroni+ 2019) for knowledge probing

## 3.2 SuperGLUE (Wang+ 2019a) for general NLU fully-supervised learning (§)

## 3.3 SuperGLUE (Wang+ 2019a) for general NLU few-shot learning (§ 3.3)

## 3.4 Stabilizing Language Model Adaptation

* ie reducing the differences between different prompts. As we have shown in
* Table 1, manual prompts have a large impact on the performance.
* few-shot learning, the performance gap of different prompts is prominent
  due to the sensitivity of few-shot learning (Zheng+ 2021). Results in
* Table 6 show that P-tuning improves the performance of the worst-performing
  patterns (eg P#5), and achieves a smaller standard deviation over
  multiple patterns. Compared to PET-FT, P-tuning increases the stability
  w.r.t. the choice of patterns.
* LAMA, we observe similar a phenomenon that while 
  * manual prompts often yield quite volatile results, 
  * nL appending trainable continuous prompts on top of the manual prompts can
    stabilize their performances,
    reducing the standard deviation from 10.1 to 0.46.

# 4 Related work

## Language Model Prompting

* GPT-3 (Brown+ 2020) uses in-context examples (Liu+ 2021; Zhao+ 2021b) as a
  way of prompting to transfer knowledge from pretraining to downstream tasks.
* Schick and Schütze (2020) proposed to use cloze patterns, which
  removes the constraint that the masked token is the last token
* automatically search for high-performing prompts by 
  * mining the training corpus (Jiang+ 2020b), 
  * gradient-based search (Shin+ 2020), or 
  * using pretrained generative models (Gao+ 2020).
* concurrently
  * Prefix-tuning (Li and Liang, 2021) adds continuous prompts at the beginning
    of the sequence for each layer
  * continuous prompts for NLU, also concurrent, focusing on improving
    knowledge probing (Qin and Eisner, 2021; Zhong+ 2021)
  * Lester+ (2021): with large pretrained models,
    only tuning continuous prompts with a frozen language model achieves
    comparable performance to full-model tuning

## Knowledge in Language Models

* Selfsupervised (Liu+ 2020) pre-trained language models (Han+ 2021) not only
  contextualized text representations but also linguistic and world knowledge 
  * including GPT (Radford+ 2019), BERT (Devlin+ 2018), XL-Net (Yang+ 2019),
    RoBERTa (Liu+ 2019) have been observed to learn . 
* Hewitt and Manning, (2019) demonstrates that contextualized representations
  produced by language models can form a parse tree in the embedding space.
* Vig, (2019; Clark+ (2019b) look into the multi-head attention patterns within
  transformers and discover that 
  * certain attention heads may correspond to some grammatical functions,
    including co-reference and noun modifiers. 
* the LAMA task (Petroni+ 2019, 2020) propose the LAMA task that leverages 
  * cloze tests to predict the fact triples of knowledge bases to examine
    language model’s ability of memorizing facts with answers in the
    single-token format. 
* Wang+ (2020) investigate the attention matrices to find evidence about
  knowledge triples contained in the context. 
* Jiang+ (2020a) develop a multi-token fact retrieval dataset based on LAMA.
