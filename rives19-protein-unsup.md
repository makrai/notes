A Rives, S Goyal, J Meier, D Guo, M Ott, C. Lawrence Zitnick, J Ma, R Fergus
Biological Structure and Function Emerge from
  Scaling Unsupervised Learning to 250 Million Protein Sequences
https://www.biorxiv.org/content/10.1101/622803v1

#Abstract

* In ... artificial intelligence,
  * scale in data and model capacity enabled by unsupervised learning
  * major advances in representation learning and statistical generation
* In biology, the anticipated growth of sequencing promises
  * unprecedented data on natural sequence diversity
* Learning the natural distribution of evolutionary protein sequence variation
* we use unsupervised learning to train a deep contextual language model
  on 86 billion amino acids across 250 million sequences spanning evolutionary
  diversity. The resulting model
  * maps raw sequences to representations of biological properties without
    labels or prior domain knowledge. The learned representation space
  * organizes sequences at multiple levels of biological granularity from the
    biochemical to proteomic levels.  Learning
  * recovers information about protein structure:
    secondary structure and residue-residue contacts can be extracted by linear
    projections from learned representations
* With small amounts of labeled data, the ability to identify tertiary contacts
* full sequence diversity rather than individual protein families increases
  recoverable information about secondary structure
* We [adapt networks] to variant activity prediction from sequences only, with
  * results are comparable to a state-of-the-art variant predictor that uses
    evolutionary and structurally derived features
