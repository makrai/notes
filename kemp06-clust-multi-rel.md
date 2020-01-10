Learning Systems of Concepts with an Infinite Relational Model
Charles Kemp, Joshua B. Tenenbaum, TL Griffiths, Takeshi Yamada, Naonori Ueda
2006

#Abstract

* We present a nonparametric Bayesian model that 
  discovers systems of related concepts. 
  Given data involving several sets of entities, our model 
  discovers the kinds of entities in each set and the relations between kinds 
* We apply our approach to four problems: 
  clustering objects and features, learning ontologies, 
  discovering kinship systems, and discovering structure in political data.

#1 Intro

* The systems we wish to discover are simple versions of the “domain theories”
  discussed by cognitive scientists and AI researchers (Davis 1990). Suppose
* a domain includes several types, or sets of entities. One role of a domain
  * specify the kinds of entities that exist in each set, 
    and the possible or likely relationships between those kinds.
* e.g. medicine: cancer and diabetes are both disorders, asbestos and arsenic
  are both chemicals, and that chemicals can cause disorders. 
* Our model assumes that 
  * each entity belongs to exactly one kind, or cluster, and 
  * simultaneously discovers the clusters and the relationships between
    clusters that are best supported by the data.
  * number of clusters used by a theory should be able to grow
* applying it to four problems. First we suggest that 
  1. object-feature data can be profitably viewed as a relation 
  2. biomedical ontology. Ontologies are classic examples of the theories 
  3. the kinship structure of an Australian tribe. Our final example considers
  4. a political data set: clusters of countries, clusters of interactions
     between countries, and clusters of country features.
