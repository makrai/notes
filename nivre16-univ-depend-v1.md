Joakim Nivre ∗ Marie-Catherine de Marneffe ◦ Filip Ginter • Yoav Goldberg †
    Jan Hajič ‡ Christopher D. Manning  Ryan McDonald / Slav Petrov / Sampo
    Pyysalo . Natalia Silveira  Reut Tsarfaty ? Daniel Zeman ‡
Universal Dependencies v1: A Multilingual Treebank Collection
2016

Google universal tag-et kiadó POS tagger magyarra?

# 1 Introduction

* typologically different languages
  * (e.g., morphologically rich languages, pro-drop languages, and languages
  * featuring clitic doubling).

# 3 Annotation Guideline Principles

* lexicalism
  * words are the basic units of grammatical annotation
* recoverability principle.
  * a transparent relation between the original textual representation and
  * the linguistically motivated word segmentation

## 3.1 Word Segmentation

* basic annotation units in UD are syntactic words
  * (not phonological or orthographic words). Concretely,
* clitics are split off (e.g., Spanish dámelo ‘give me it’ = dá me lo) and
* contractions are undone (e.g., French au = à le; see Figure 2)
  * when this is necessitated by the syntactic analysis, but
* for recoverability the original tokens are included as well
* MWE
  * annotated using special dependency relations,
  *     rather than by collapsing multiple tokens into one.

## 3.3 Syntax

* three types of structure: nominals, clauses and modifier words
* a distinction between
  * core arguments (e.g., subject and object) and other dependents
* not attempt to distinguish complements vs.  adjuncts
* UD indicates in the dependency labels whether dependents are phrases
  * or clauses,
* clausal: klózból megy a nyíl
* Relations between Content Words
* Enhanced Representation
  * propagate relations
