Needle in the Haystack for Memory Based Large Language Models
Elliot Nelson, Georgios Kollias, Payel Das, Subhajit Chaudhury, Soham Dan
arXiv:2407.01437 [cs.CL]

# Abstract

* LLMs often perform poorly on simple fact retrieval tasks. Here we investigate
* we ? if coupling a dynamically adaptable external memory to a LLM can
  alleviate this problem. For this purpose, 
  * Larimar, a recently proposed language model architecture which 
    uses an external associative memory, 
  * we test Larimar on long-context recall tasks
    including passkey and needle-in-the-haystack tests.
* the external memory of Larimar, which 
  * allows fast write and read of an episode of text samples, 
  * can be used at test time to handle contexts much longer than those seen
    during training. We further show that 
  * the latent readouts from the memory (to which long contexts are written)
    control the decoder towards generating correct outputs, with the memory
    stored off of the GPU. 
* Compared to existing transformer-based LLM architectures for long-context
  recall tasks that use larger parameter counts or modified attention
  mechanisms, a relatively smaller size Larimar is able to maintain strong
  performance without any task-specific training or training on longer contexts.  

# 1 Intro

* different attention mechanisms in transformer-based LLM architectures to
  address such issues with longcontext modeling (Munkhdalai+ 2024; Hwang+ 2024;
  Beltagy+ 2020; Dai+ 2019; Bulatov+ 2022). For example, 
  * transformers with Sliding Window Attention have been proposed that show
    O(L×W ) complexity for input length L and window size W (Beltagy+ 2020).
  * Memory of the past segments has been stored in a cache to be used as a
    context for the next segment (Dai+ 2019) or models have been trained to
  * explicit global memory tokens aka. soft prompts (Burtsev+ 2021; Bulatov+
    2022; Hwang+ 2024). Recently, 
  * Infini-transformer (Munkhdalai+ 2024) to use memory of all past segments,
    as opposed to considering only the memory of the last segment in processing
    the current segment and discarding all other past segments.
  * hE often require task-specific training on long-context instances and
    lack generalization.
* we investigate test-time long-context adaptation of LARIMAR , 
  * Larimar is a recently proposed (Das+ 2024) LLM decoder model augmented with
    dynamically updatable memory mechanisms, and 
  * we test its in-context recall performance on long-context modeling tasks.
  * The external memory is structured similarly to the Kanerva Machine (Wu+
    2018), but updates the memory by finding the least-squares solution to a
    linear system, following (Pham+ 2021), instead of updating a multivariate
    Gaussian posterior distribution.

# 3

## Needle-in-the-Haystack.

* We follow (Kamradt, 2023), using the “haystack” dataset of Paul Graham essays,
  * Gregory Kamradt. 2023. Needle In A Haystack ~~ pressure testing LLMs.
    Github.  https://github.com/gkamradt/LLMTest_NeedleInAHaystack
  * the total context length is ≈ 137K tokens. We test comple-
