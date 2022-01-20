Modeling the structure of recent philosophy
Maximilian Noichl
Synthese volume 198, pages 5089–5100 (2021)
https://link.springer.com/article/10.1007/s11229-019-02390-8#

# Abstract

* we: unsupervised learning of clusters from a citation database, and
  * applied to a large corpus of articles in philosophy to give an account of
  * 68,152 records were downloaded from the Reuters Web of Science-Database.
  * citation data was processed using dimensionality reduction and clustering.
  * results are graphically represented
  * clusters suggest that
    * the division of analytic and Continental philosophy in the considered
      timespan is overstated; that analytical, in contrast to Continental
      philosophy does not form a coherent group in recent philosophy; and that
    * metaphors about the disciplinary structure should focus on the coherence
      and interconnectedness of a multitude of smaller and larger subfields

# 1 Intro

* our method tries to avoid the potential biases of conscious classification by
  experts in their respective fields through the deployment of unsupervised
  machine-learning techniques. It is very much in the line of the
* the general tradition of mapping approaches to science, like Boyack+ (2005).
  * The standard technique that lies at the heart of this approach is
    bibliographic coupling, which tries to grasp the relation between two texts
    by assessing how many sources they have in common. It
    * has been considered the best method for this purposes for a while
      (Boyack and Klavans 2010)
    * Recent evidence has called into question (Boyack and Klavans 2017), but
    * clearly remains among the best methods for the clustering of scientific
      literature (Waltman+ 2019).

# Method

## Processing

* all records were removed which shared less then three citations with any of
  the other records in the dataset, a step which was necessary
  to ensure the connectedness of the manifold, which was to be estimated with
* preliminary dimensionality-reduction has been shown to be beneficial to
  text-classification-tasks (Shafiei+ 2007; Underhill+ 2007),
