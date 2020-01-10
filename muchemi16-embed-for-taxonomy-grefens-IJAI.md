Rapid induction of multiple taxonomies for enhanced faceted text browsing
Lawrence Muchemi and Gregory Grefenstette
2016 July International Journal of Artificial Intelligence and Applications

#Abstract

* rapidly inducing multiple subject-specific taxonomies from crawled data
* two methodologies
  * The first method involves a sentence-level words co-occurrence frequency
    method for building the taxonomy
    * an extension of the method described in [5]
  * the second involves the bootstrapping of a Word2Vec based algorithm with a
    directed crawler.
    * previously used in the context of lexicography in [12]
      * Greffenstte and Muchemi (2016 LREC)
        Determining the Characteristic Vocabulary for a Specialized Dictionary
          using Word2vec and a Directed Crawler
* We exploit the multilingual open-content directory of the [web], DMOZ to
  seed the crawl, and the domain name to direct the crawl. This domain
  corpus is then input to our algorithm that can automatically induce
  taxonomies.  The induced taxonomies provide hierarchical semantic
  dimensions for the purposes of faceted browsing
* we applied the resulting taxonomies to personal social media data
  (Twitter, Gmail, Facebook, Instagram, Flickr) with an objective of
  enhancing an individual’s exploration of their personal information
  through faceted searching
* comprehensive corpus based evaluation of the algorithms based on many
  datasets drawn from the fields of medicine (diseases) and leisure (hobbies)
  and show that the induced taxonomies are of high quality

##3.2 Word embedding in taxonomy generation

* The details of this domain-specific lexicon identification process and
  evaluation are found in [12].
