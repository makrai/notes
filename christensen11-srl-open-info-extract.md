An Analysis of Open Information Extraction based on Semantic Role Labeling
Janara Christensen , Mausam , Stephen Soderland and Oren Etzioni
2011

# Abstract

* Open Information Extraction extracts relations from text without requiring a
  pre-specified domain or vocabulary
* we investigate the use of semantic role labeling techniques for the task of
  Open IE
* We compare 
  * SRL-based open extractors, which perform computationally expensive, deep
    syntactic analysis, with 
  * TextRunner, an open extractor, which uses shallow syntactic analysis but is
    able to analyze many more sentences in a fixed amount of time and thus
    exploit corpus-level statistics.  Our evaluation answers questions
    regarding these systems, including, 
* binary, n-ary and nested relations?
* This paper reports that, contrary to our beliefs, SRL is robust to noisy Web
  text, and achieves a much larger recall; whereas TextRunner obtains a much
  higher precision than SRL extractors, at lower recalls. Finally, TextRunner
  is 20-700 times faster than SRL systems we have tested (dependent on use of
  dependency parser versus constituency).

## 2.2 SRL

* roles are commonly divided into metaroles (A0-A7) and additional common
  classes such as location, time, etc. Each Ai can represent a different role
  based on the verb, though A0 and A1 most often refer to agents and patients
  respectively.

# 6 Related work

* We are the first to use SRL for Open IE, but its use for traditional IE is
  investigated by Harabagiu et al.  [11]. They used a lexico-semantic feedback
  loop in a question-answering system for a set of pre-defined relations.
