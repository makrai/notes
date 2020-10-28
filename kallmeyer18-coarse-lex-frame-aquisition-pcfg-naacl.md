Coarse Lexical Frame Acquisition at the Syntax–Semantics Interface 
  Using a Latent-Variable PCFG Model
Laura Kallmeyer, Behrang Q. Zadeh, and Jackie Chi Kit Cheung

# Abstract

* input [is] syntactic dependency trees

# 1 Intro

* without using any explicit semantic information as training data 
* The task involves 
  * grouping verbs that evoke the same frame ...  and 
  * clustering their syntactic arguments into latent semantic roles
* [comparison to] FrameNet (Ruppenhofer+ 2016) and PropBank (Palmer+ 05)
  * many-to-many relationship between verb types and frame types
    * Similar to FrameNet and in contrast to PropBank
  * general semantic roles instead of frame-specific slot 
    * similar to PropBank
* automatically generate more abstract lexical-semantic representations 
  from lexicalized dependency structures.
  * we study possible ways to 
* requires not only 
  * distinguishing between different senses of verbs, but also 
  * identifying [lexical relationships (e.g., synonymy, opposite], troponymy)
* bib
    * Modi+ 2012; Green+ 2004), our problem definition 
    * differs from ... unsupervised fine-grained frame induction using verb WSD
      (Kawahara+ 2014; Peng+ 2017)
      Similarly, forming role clusters yields generalization from several
      alternate linkings between semantic roles and their syntactic
      realization. Given, for instance, an occurrence of the verb 
* e,g, _pack_ and its syntactic arguments, not only do we aim to distinguish
  * different senses ... the FILLING frame, or the PLACING frame), but also to
  * group [the latter] ... with [disambed instances of] _load, pile, place_
* motivation for this work is twofold. On the one hand, the frame induction
  * can be useful in 
    text summarization (Cheung and Penn, 2013), 
    question answering (Frank+ 2007; Shen and Lapata, 2007), and so on,
  * theoretical linguistic insights into frame structure. In this sense, our
* L-PCFG (Johnson, 1998; Matsuzaki+ 2005; Petrov+ 2006; Cohen, 2017). As 
  * input [is] syntactic dependency trees and 
  * extracts input strings corresponding to instances of frame expressions,
    which are subsequently grouped into latent semantic frames and roles 
    * dynamically adapting the number of frames and roles to the data, 
      * inside-outside (Expectation-Maximization)
        Dempster+ (1977); Do & Batzoglou, (2008) algorithm and a 
      * split-merge procedure (Petrov+ 2006) for 
      * we employ new heuristics
* Our experiment shows that the method outperforms a number of 
  baselines, including 
    * frame grouping by lexical heads and one 
    * based on agglomerative clustering

# 2, 3

* We 
  * converted lexicalized dependency trees of sentences 
    to a set of input strings of fixed, predetermined structure 
    consisting of a verbal head, its arguments and their syntactic dependencies
  * use a CFG model (subsequently L-PCFG) to shape/capture frame structures
    * EM parameter estimation techniques from PCFG while 
      relaxing independence assumptions, including appropriate 
      methods for splitting and merging frames and semantic roles and using
      word embeddings for better generalization

# 4 evaluation dataset and results from experiments

## 4.2 Evaluation Measures

* we report 
  * the harmonic mean of BCubed precision and recall (BCF) (Bagga & Baldwin 98), and 
    purity (P U ), inverse purity ( I P U ) and their harmonic mean ( F P U )
    (Steinbach+ 2000) as figures of merit
  * reflect a notion of similarity between the distribution[s] 
  * alone may lack sufficient information for a fair understanding of the
  * P U and I P U are 
    * easy to interpret [by analogy to] precision and recall in classification
    * may be deceiving under certain conditions (as explained by Amigó et al.,
      2009, under the notions of homogeneity, completeness, rag bag, and ‘size
      vs. quantity’ constraints).  Reporting 
  * B C F alongside F P U ensures that these pitfalls are not overlooked

## 4.4 Results

### Quantitative Comparison with Baselines 

* frame type clustering, our method ... outperforms all the baselines.  F P U
  * output contains a small proportion of “rag bag” clusters [which is bad]
  * many incomplete yet homogeneous clusters (as we discuss below). With
* roles ... performance ... very similar to the syntactic baseline (B C F=97.3)

### What is in the clusters? 

[performance in verb clust] varies from one gold frame category to another one.
  * The most problematic: `ACTIVITY_START`, `PROCESS_START`, and PLACING .
    * system ... fails to distinguish between ACTIVITY_START and PROCESS_START
    * PLACING ... frequent idiomatic usages of [each] verb, 
      e.g., ‘to lay claim’, ‘to place listing’, ‘to position oneself as’
  * system can 
    * distinguish ... between different readings of polysemous verbs,
      * e.g., instances of ... ‘pack’ that evoke the FILLING vs PLACING frame 
    * group synonymous (and opposite) verbs that evoke the same frame into one
    e.g. _‘decline’, ‘drop’, ‘fall’, ‘gain’, ‘jump’, ‘rise’, . . . ,
    * clusters (consisting of only one or two instances): ... those with
      wrong (and incomplete) dependency parses

# 5 Related Work

* differs from most work on word sense induction (WSI), e.g. 
  (Goyal and Hovy, 2014; Lau+ 2012; Manandhar+ 2010; Van de Cruys
  and Apidianaki, 2011), in that [we create] more general meaning categories
  * However, our method can be adapted to WSI, too.  
    * we can assume that word senses ...  necessarily evoke different frames;
    * the induced frame clusters can be seen directly as clusters of [senses]
* unsupervised semantic role induction 
  (Carreras and Marquez, 2005; Lang and Lapata, 2010, 2011; 
  Titov and Klementiev, 2012; Swier and Stevenson, 2004), 
  * our method differs from them in that 
    we attempt to include senses/frame head grouping 
* unsupervised template induction in information extraction (IE)
  * build structured summaries of text
  * MUC-style frames in Chambers and Jurafsky (2009, 2011) and its 
  * later refinements such as 
    (Chambers, 2013; Cheung+ 2013; Balasubramanian+ 2013)
* ontology learning and population from text (Cimiano+ 2005) 
  * Our focus is on lexicalized elementary syntactic structures, 
    identifying lexical semantic relationships, and thereby 
    finding salient patterns in syntax–semantic interface 
* Modi+ (2012) propose the most similar work to ours.  
  * They adapt Titov and Klementiev, (2012) to 
  * learn FrameNet-style head and role groupings. Modi+ (2012) assume
  * roles to be frame-specific
* [research using] lexical resources such as WordNet 
  (Pennacchiotti+ 2008; Green+ 2004) 
  in supervised or unsupervised settings) to 
  refine and extend existing frame repositories such as FrameNet
