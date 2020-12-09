exBERT: A Visual Analysis Tool to Explore Representations in Transformers
Benjamin Hoover, Hendrik Strobelt, Sebastian Gehrmann
arXiv:1910.05276 [cs.CL]

# Abstract

* interactive analyses of these models can help humans better gain an intuition
* We present exBERT, an interactive tool
  * matching a human-specified input
    to similar contexts in a large annotated dataset
  * aggregating the annotations of the matching similar contexts

# 1 Intro

* BERT's applications to transfer learning [Devlin+ 2019]
  * extensions [Sanh+ 2019, Liu+ 2019] are
  * dominating the standard language understanding benchmarks [Wang+ 2018, 2019]
  * as autoregressively trained language models that can be used for generation
    [Radford+ 2019, Keskar+ 2019]
* understanding whether BERT learns linguistic features such as POS, DEP, or NER
  [Tenney+ 19a, Vig and Belinkov, 19, Raganto and Tiedemann, 18, Tenney+ 19b]
  * Clark+ [19] found that heads at different layers learn specific ling struct
    despite being trained in a completely unsupervised manner, 
    although many heads ostensibly learn redundancies
  * Voita+ [2019]: BERT depends on only a subset of the total heads and that
    overall model performance could be maintained when some heads were pruned
* Attention visualizations such as BertViz by Vig [2019] have taken large steps
  * hE, without understanding the attended-to embeddings, or 
    relying on attention alone for a faithful interpretation, 
    can lead to faulty interpretations
    [Brunner+ 2019, Jain and Wallace, 2019, Wiegreffe and Pinter, 2019]
* exBERT, a tool
  * view into both the attention and internal representations
  * agnostic to the underlying Transformer model and corpus
  * probing whether the representations capture metadata such as 
    linguistic features or positional information

# 4 Case Study: BERT

* corpus used is the Wizard of Oz, 2 which is annotated and processed by BERT to
* We explore the layers and heads at which BERT learns the linguistic features
  of a masked token.
* e.g. _The girl ran to a local pub to escape the din of her city._

## 4.1 Behind the mask

* it is not until layer 6 (Figure 2b) that BERT is confident about the masked
  embedding being a verb.  Subsequent layers seem to refine this estimation,

## 4.2 Behind the heads

* Going back to 5-[all], we see that the 
  * token embedding fails to embrace the masked “escape” token as a verb 
  * head embedding learned to attend to  
    * sentence structures where the most similar tokens in the corpus are verbs
    * the direct object (DOBJ) of that verb, a dependency that Clark+ [2019]
      showed was strongest in head 8-9. Exploring other individual heads at this
    * 5-3 primarily detects the ROOT dependency (2d) while 
      5-6 detects the AUX dependency (2e).  
* how all the heads were able to maximize their attention on the “din” token and
  thus detect the DOBJ pattern that was in 18 of the top 50 matches in the?
* no head individually looks for DOBJ, and therefore that pattern must be
  detected through a combination of heads. Naively, we can strategically select
  the heads that maximize their attention to “din” (5-[0,4,5,7,8,9] shown in
  Figure 2f), but find that these most normally find the object of the
  preposition (POBJ). Further exploration shows that the DOBJ pattern can be
  detected by 5-[6,9] (2g), albeit with confusion to the DET dependency. It
  seems that complex dependencies like 
DOBJ can be detected in the early-middle layers of the model but rely on a
combination of heads.  

## 4.3 More than position
