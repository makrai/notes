Byte Latent Transformer: Patches Scale Better Than Tokens
Artidoro Pagnoni, R Pasunuru, P Rodriguez, J Nguyen, B Muller, M Li, C Zhou,
  L Yu, J Weston, L Zettlemoyer, G Ghosh, M Lewis, A Holtzman, S Iyer
arXiv:2412.09871 [cs.CL]

https://github.com/facebookresearch/blt

* We introduce the Byte Latent Transformer (BLT), 
  * a new byte-level LLM architecture that, for the first time, 
  * models trained on raw bytes without a fixed vocabulary. 
  * dynamically selecting long patches when data is predictable, along with
  * matches tokenization-based LLM performance at scale with 
  * significant improvements in inference efficiency and robustness. BLT 
  * encodes bytes into dynamically sized patches, which 
    * patches serve as the primary units of computation
  * Patches are segmented based on the entropy of the next byte, 
    allocating more compute and model capacity where increased data complexity
    demands it. We present the first 
* intuition
* FLOP controlled scaling study of byte-level models up to 8B parameters and 4T
  training bytes. Our results demonstrate the feasibility of scaling 
  * Both training and inference efficiency improve due to 
  * qualitative improvements on reasoning and long tail generalization. Overall,
  * for fixed inference costs, BLT shows significantly better scaling than
    tokenization-based models, by 
  * simultaneously growing both patch and model size

# 1 Intro

* Existing large language models (llms): tokenization—a heuristic pre-processing
  * groups bytes into a static set of tokens. Such tokens 
  * bias how a string is compressed, leading to shortcomings such as
    * domain/modality sensitivity (Dagan+ 2024)
    * sensitivity to input noise (§6)
    * a lack of orthographic knowledge (Edman+ 2024)
    * multilingual inequity (Liang+ 2023; Petrov+ 2024; Limisiewicz+ 2024)
* directly training llms on bytes 
  * previously prohibitively costly at scale due to long sequence lengths (Xue+
    2022). Prior works 
  * mitigate this by employing 
    * more efficient self-attention (El Boukkouri+ 2020; Clark+ 2022) or
    * attention-free architectures (Wang+ 2024) (§8)
    * helps train small models. 
  * At scale, the computational cost of a Transformer is dominated by large
    feed-forward network layers that run on every byte, not the cost of the
    attention mechanism
* we propose a dynamic, learnable method for grouping bytes into patches (§2)
  * a new model architecture that mixes byte and patch information. Unlike
  * no fixed vocabulary for patches. 
  * Arbitrary groups of bytes are mapped to latent patch representations via
    light-weight learned encoder and decoder modules. We show that this results
  * more efficient allocation of compute than tokenization-based models
* Tokenization-based llms allocate the same amount of compute to every token
  * trades efficiency for performance, since 
  * tokens are induced with compression heuristics that are 
  * not always correlated with the complexity of predictions. Central to our
  * models should dynamically allocate compute where it is needed
    eg the first word of a new sentence
  * a large transformer is not needed to predict the ending of most words, since
  * BLT’s architecture (§3) where there are three transformer blocks: 
    * two small byte-level local models and 
    * a large global latent transformer (Figure 2). 
    * To determine how to group bytes into patches and therefore how to
      dynamically allocate compute, BLT 
    * segments data based on the entropy of the next-byte prediction creating
      contextualized groupings of bytes with relatively uniform information
      density
* flop-controlled scaling study of byte-level models up to 8B parameters and 4T
  training bytes, showing that we can train a model end-to-end at scale from
  * matches training flop-controlled performance 1 of Llama 3 while using up to
    50% fewer flops at inference (§5). We also show that directly working with
  * significant improvements in modeling the long-tail of the data. BLT models
  * more robust to noisy inputs and display 
  * enhanced character level understanding abilities demonstrated on
    orthographic knowledge, phonology, and low-resource machine translation (§6)
  * we can simultaneously increase model size and patch size while maintaining
    the same inference flop budget. 
    * Longer patch sizes, on average, save compute which can be reallocated to
      grow the size of the global latent transformer, because it is run less
      often. We conduct 
  * inference-flop controlled scaling experiments (Figure 1), and observe
    significantly better scaling trends than with tokenization-based
* contributions: 
  1. We introduce BLT, a byte latent llm architecture that dynamically allocates
     compute to improve flop efficiency, 
  1. We show that we achieve training flop-controlled parity with Llama 3 up to
     8B scale while having the option to trade minor losses in evaluation
     metrics for flop efficiency gains of up to 50%, 
  1. BLT models unlock a new dimension for scaling llms, where model size can
     now be scaled while maintaining a fixed-inference budget, 
  1. We demonstrate the improved robustness of BLT models to input noise and
     their awareness of sub-word aspects of input data that token-based llms

# 6 Byte Modeling Improves Robustness

* We also measure the robustness of BLT compared to token-based models that lack
* we present an approach to byte-ify pretrained token-based models

## 6.1 Character-Level Tasks

* A very early motivation for training byte-level models was to take advantage
  * robustness to byte level noise in the input, and also to exploit their
  * awareness of the constituents of tokens, which current tokenizer-based
* eval, both English and multi-lingual, including digits and phonemes (Tab 3)

### Noisy Data 

* We create noised versions of the benchmark classification tasks described in
  Section 5.2, to compare the robustness of tokenizer-based models with that of
* 5 character-level noising strategies to introduce variations in the text:
  1. AntSpeak : This strategy converts the entire text into uppercase,
     space-separated characters. 
  1. Drop: Randomly removes 10% of the characters from the text. 
  1. RandomCase: Converts 50% of the characters to uppercase and 50% to
     lowercase randomly throughout the text. 
  1. Repeat: Repeats 20% of the characters up to a maximum of four times. 
  1. UpperCase: Transforms all characters in the text to uppercase. 
* we apply each noising strategy to either the prompt, completion, or both as
  separate tasks and report the average scores. In 
* Table 3 reports results on noised HellaSwag (Zellers+ 2019) and find
  * BLT indeed outperforms tokenizer-based models across the board in terms of
  * average advantage of 8 points over the model trained on the same data, and
    even improves over the Llama 3.1 model trained on a much larger dataset

### Phonology - Grapheme-to-Phoneme (G2P) We assess BLT’s capability to 

* map a sequence of graphemes (characters representing a word) into a
  transcription of that word’s pronunciation (phonemes). In 
* Table 3 presents the results of the G2P task in a 5-shot setting using
  Phonology Bench (Suvarna+ 2024) and find that BLT outperforms Llama 3 1T

### CUTE: character-level understanding (Edman+ 2024)

* several tasks that are broadly classified into three categories: 
  * understanding composition
  * understanding orthographic similarity
  * ability to manipulate sequences. This benchmark poses 
* a significant challenge for most tokenizer-based models, as they appear to
  possess knowledge of their tokens’ spellings but struggle to effectively
  utilize this information to manipulate text. 
* Table 3 shows that BLT-Entropy outperforms both BPE Llama 3 models by more
  than 25 points on this benchmark
  * exceptional proficiency in character manipul: 99.9% on both spelling tasks
  * despite BLT having been trained on 16x less data than Llama 3.1 indicates
    that character level information is hard to learn for BPE models. Figure 7
    illustrates a few such scenarios where Llama 3 tokenizer model struggles but
    our BLT model performs well. 
  * Word deletion and insertion: BPE performs better. Such word manipulation
    * might not be straightforward for a byte-level model but 
    * the gap is not too wide and 
    * building from characters to words could be easier than the other way
* We use the same evaluation setup in all tasks and the original prompts from
  Huggingface.  BPE models might benefit from additional prompt engineering

### Low Resource Machine Translation 

* into and out of six popular language families and 21 lower resource languages
  with various scripts from the FLORES-101 benchmark (Goyal+ 2022) and report
  SentencePiece BLEU in Table 4. Our results demonstrate that 
* BLT outperforms a model trained with the Llama 3 tokenizer, achieving a
  * 2-point overall advantage in translating into English and a 
  * 0.5-point advantage in translating from English. 
  * In popular language pairs, BLT performs comparably to or slightly better
    than Llama 3. However, 
  * BLT outperforms Llama 3 on numerous language pairs within lower-resource
    language families, underscoring the effectiveness of byte modeling for
    generalizing to long-tail byte sequences
