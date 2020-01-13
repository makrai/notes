A Tool for Creating and Visualising Formal Concept Trees
Simon Andrews and Laurence Hirsch
2016

In-Close2 program is available at `https://sourceforge.net/projects/inclose/`
and the Java-Script program to visualise the tree in a Web-Browser can be accessed [at]
`http://homepages.shu.ac.uk/~aceslh/fca/fcaTree.html1`

# Abstract

* tool for creating and visualising formal concept trees.  The 
  * concept tree provides an alternative visualisation to the more commonly
    known concept lattice. The tool described here is an 
  * extension of the In-Close formal concept mining program, where 
  * concepts are output in a format that can be visualised in a Web Browser
    using the Collapsible Tree Layout from the D3.js JavaScript library.
  * ‘iceberg trees’ can also be produced, by specifying a minimum support for
    objects.

# Introduction

* tools that visualise and explore formal concept lattices, such as the well
  * Concept Explorer [15] ... ToscanaJ [4], Conflexplore [6], FcaStone/Graphviz
    [11] and Galicia [13]
  * no similar tools to visualise and explore formal concept trees.  Although
  * concept lattice is the natural and primary means of visualisation in FCA,
  * concept tree 
    * often easier to digest (particularly by non-FCA speakers) and
    * for situations where the underlying information structure is a tree
      e.g. taxonomy or a decision tree
    * application of formal concept trees, such as [5,10,14]
  * size and complexity
    * most of the lattice visualisation tools listed above have some means ...
      e.g. de-selecting attributes and objects in Concept Explorer
* This paper ... visualises them using the Collapsible Tree Format 
  from the D3.js JavaScript library
  * tree is created as an output from a modified version of In-Close2 [1,3,2].
  * output formal concepts in the D3 Collapsible Tree JSON file format
  * the limitation being only on the JavaScript to deal with very large JSONs

# 2 Concept Trees

* A lattice can be thought of as a collection of overlapping trees [5] where
* In ... a concept lattice, where an arc is removed to form a corresponding
  tree, any inherited objects and attributes that are lost by removing the
  connec- tion must be restored to the child and parent concepts 
  * the concepts in the lattice and the tree are exactly the same 
    only the number of connections have been reduced. 
  * Figure 1 ... attribute a3 and object o4 are labeled twice ... to maintain
    the intents and extents of the concepts 
* The input [is] the well-known Burmeister cxt format
* In-Close does not compute the lattice at all, it 
  simply computes the first occurrence of each child concept, in the manner of
  Close-by-One type algorithms [9,8], and ignores subsequent computations of
  the same child, thus not creating any connections to further parents
* inheritance 
  * attributes are inherited down the branches of the tree, 
  * objects are inherited up the branches

# 3 Visualising the Concept Tree

The tree is best read from top to bottom 
* in a manner of attribute ...  specialization, of concepts
* concept 4 contains all the objects that need water to live and can move,
* However, concept 5 does not necessarily tell you about other attributes its
  objects may have. For example, a frog can also live in water (concept 1)
  * extra connections in the lattice allow a user to determine those other
    attributes more easily. But, so long as this limitation is kept in mind,
    the concept tree is still a useful and readable visualisation.

# 4 ‘Iceberg Trees’

* idea of a formal concept ‘iceberg’ lattice was 
* described by [12] as being 
* a lattice where a minimum support has been applied, in terms of a minimum
  number of objects allowed in a concept
* does not, strictly speaking, produce a lattice
  * there may be ‘hanging branches’ [at the bottom], no longer connected 
