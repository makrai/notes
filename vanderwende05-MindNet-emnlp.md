MindNet: an automatically-created lexical resource
Lucy Vanderwende, Gary Kacmarcik, Hisami Suzuki, Arul Menezes

#Abstract

* MindNet, a lexical resource built automatically by processing text. We will
* two forms of MindNet: as a
  * static lexical resource, and, as a
  * toolkit which allows MindNets to be built from arbitrary text. We will also
  * web-based interface to MindNet lexicons (MNEX) that is intended to make the
* English and Japanese MindNets will be shown and will be
* made available ... for research purposes

#1 MindNet

* Previous publications on MindNet
  (Suzuki et al., 2005, Richardson et al., 1998, Vanderwende 1995)
  * MindNet from the data contained in Japanese and English lexiconos

##Semantic Relations

* directed, labeled relationships between two words; see Table 1:
  * Attributive Manner Source Cause Means Synonym Goal Part Time Hypernym
    Possessor TypicalObject Location Result TypicalSubject
* obtained from the Logical Form analysis of our broad coverage
  * parser NLPwin (Heidorn, 2000). The Logical Form is a
  * labeled dependency analysis with function words removed. We have not
  * quality varies according to the relation type, with
    * Hypernym ... TypicalSubject and TypicalObj being reliable, while
    * Part and Purpose are less reliable
    * we solicit feedback on the level of accuracy which is tolerable for
      specific applications

##Semantic Relation Structures

* semrel structure
  * the hierarchical collection of semantic relations (semrels) ... extracted
    from a source sentence
* inverted structures
  * semrel structure ... viewed from the perspective of each unique word
  * a different word placed at the root of the structure

#2 MNEX

* MNEX (MindNet Explorer) is
  * the web-based interface to MindNet that is designed to facilitate browsing
  * displays paths based on the word or words that the user enters. A
  * path
    * within either a single semrel structure or by combining fragments
    * weighted for comparison (Richardson, 1997)
    * Currently, either one or two words can be specified
    * restrictions to refine the path search. A user can restrict the intended
      * part of speech of the words entered, and/or the user can
      * restrict the paths to include only the specified relation
    * When only one word is given, then all paths from that word are ranked
      * e.g. all paths from the word bird, restricted to Noun part of speech,
        through the Part relation:

#3 3 Relation to other work

* WordNet, EuroWordNet
* FrameNet (Baker et al., 1998) and OpenCyc
  * Their use is still being explored as they have been made available only
    recently
* Japanese ... concept dictionaries
  * [EDR](http://www2.nict.go.jp/ipp/EDR/ENG/indexTop.html) and 
  * [Nihongo Goi-taikei (NTT)](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.357.8460)
  * [fizetős/CD-s]
