Unifying Cross-Lingual Semantic Role Labeling with Heterogeneous Ling Resources 
Simone Conia, Andrea Bacciu, Roberto Navigli
NAACL 2021

https://github.com/SapienzaNLP/unify-srl

* cross-lingual techniques are finding 
  * increasing success in a wide range of Natural Language Processing tasks,
  * application to Semantic Role Labeling (SRL) has been strongly limited by
    * each language adopts its own linguistic formalism, from 
    * PropBank for English to AnCora for Spanish and PDT-Vallex for Czech,
* we present a unified model to perform cross-lingual SRL over heterogeneous
  linguistic resources. Our model 
  * implicitly learns a high-quality mapping for different formalisms across
    diverse languages without resorting to word alignment and/or translation
  * competitive with the current SOTA and * robust to low-data scenarios. Most
  * annotate a sentence in a single forward pass with all the inventories it
    was trained with, providing a tool for the analysis and comparison of
    linguistic theories across different languages. We release our code and

# 1 Intro

* recurrent networks to better capture relations over sequences 
  (He+ 2016; Marcheggiani+ 2017). 
* Owing to the recent wide availability of multi-lingual word embeddings
  (Grave+ 2018) and
* models that work on multiple languages (Cai & Lapata 19b; He+ 19; Lyu+ 19)
* practice of training and evaluating a model on each language separately 
  (Cai and Lapata, 2019b; Chen+ 2019; Kasai+ 2019; He+ 2019; Lyu+ 2019)
* using a single for-
malism across multiple languages through annota-
tion projection or other transfer techniques (Akbik
 et al., 2015, 2016; Daza and Frank, 2019; Cai and
Lapata, 2020; Daza and Frank, 2020). However,
* often rely on word aligners and/or automatic translation tools which may
  introduce a considerable amount of noise, especially in low-resource languages 
* a linguistic formalism of choice, which may have been developed with a
  specific language in mind, [may not be] suitable for other languages.
* contributions can be summarized as follows:
  * our model is robust to low-resource scenarios, thanks to its ability to
    generalize across languages;
  * We probe our model and demonstrate that 
    it implicitly learns to align heterogeneous linguistic resources;
    * We leave an in-depth qualitative and quantitative analysis for future work
  * We automatically build and release a crosslingual mapping that aligns
    linguistic formalisms from diverse languages.  We hope that our unified

# 4 Experiments

## 4.1 Experimental Setup

## 4.2 Dataset

## 4.3 Results

### Cross-lingual SRL. Table 1 compares the results

### Low-resource cross-lingual SRL. We evaluate

### One-shot cross-lingual SRL. An interesting

# 5 Analysis and Discussion

## Cross-formalism SRL. In contrast to existing

* may potentially work on any of the 100 languages supported by the underlying
  language model (m-BERT or XLMRoBERTa), e.g., in Italian, as shown in Figure
  1 (right). This is 
* vital for those languages for which a predicate-argument structure inventory
  has not  yet been developed – an endeavor that may take years to come to
  fruition – and, therefore, manually annotated data are unavailable. Thus, as

## Aligning heterogeneous resources. As briefly

* While producing the silver annotations, we keep track of the number of times
  each predicate sense in the source inventory is associated by the model with
  a predicate sense of the target inventory. As a result, 
* we produce a weighted directed graph in which the  
  * nodes are predicate senses and an 
  * edge (a, b) with weight w indicates that our model maps the source
    predicate sense a to the target predicate sense b at least w times. A
    portion of this graph is displayed in 
* Figure 2: we show the most frequent alignments for each language, i.e., the
  top-3 edges with largest weight from the nodes of each inventory to the nodes
  of the English PropBank (Figure 2, left) and to the nodes of VerbAtlas
  (Figure 2, right).  
* e.g. the Chinese PropBank sense 开始.01 can correspond to both start.01 and
  begin.01.  Figure 2 (right) also shows that our model learns to 
* map senses from different languages and formalisms to the coarse-grained
  senses of VerbAtlas, even though the latter formalism is quite distant from
  the others as its frames are based on clustering WordNet synsets – sets of
  synonymous words – that share similar semantic behavior, rather than
  enumerating and defining all the possible senses of a lexeme as in the
  English and Chinese PropBanks. To the best of our knowledge, 
* our unified model is the first transfer-based tool to automatically align
  diverse linguistic resources across languages without relying on human
  supervision.

# 6 Conclusion and Future Work

* On one/other hand, recent research in 
  * multilingual SRL has focused mainly on proposing novel model ar-
    chitectures that achieve SOTA results, but require a model instance to be
    trained on and for each language of interest. On the other hand, the latest
  * cross-lingual SRL have revolved around using the English PropBank inventory
    as a universal resource for other languages through annotation transfer
* our model architecture has “universal” encoders which share their weights
  across 7 languages and varying formalisms.  
* evaluated on the gold multilingual benchmark of CoNLL-2009, outperforms
  previous SOTA multilingual systems over 6 diverse languages, ranging from
  Catalan to Czech, from German to Chinese, and, at the same time, also
  considerably reduces the amount of trainable parameters required to support
* our model can be rsed on languages that were never seen at training time,
  opening the door to alignment-free cross-lingual SRL on languages where a
  predicate-argument structure inventory is not yet available.
