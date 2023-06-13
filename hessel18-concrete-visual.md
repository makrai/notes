Quantifying the visual concreteness of words and topics in multimodal [retriev]
Jack Hessel, David Mimno, Lillian Lee
arXiv:1804.06786v2 [cs.CL] 23 May 2018

* our Wikipedia and British Library data at
http://www.cs.cornell.edu/~jhessel/concreteness/concreteness.html

# Abstract

* concepts with concrete visual manifestations may be easier to learn
* We apply the approach in four [img retrieval] settings,
  ranging from image captions to images/text scraped from historical books
* We find that
  1. concrete concepts are indeed easier to learn;
  1. the large number of algorithms we consider have similar failure cases;
  1. the precise positive relationship between concreteness and performance
     varies between datasets

# 1. Intro

* Text and images are often used together to serve as a richer form of content
  * eg
    * articles may be accompanied by photographs or infographics;
    * images shared on social media are often coupled with descriptions or tags
  * suggest that [images and text are] complements
* But Hill and Korhonen (2014b) observe that for their multimodal architecture
  * concreteness of a concept ... affects whether multimodal or single-channel
    representations are more effective
  * concreteness was derived for 766 nouns and verbs
    from a fixed psycholinguistic database of human ratings
* we introduce an ... algorithm for
  characterizing the visual concreteness of all the concepts indexed textually
  in a given multimodal dataset
  * leverage the geometry of image/text space
  * Intuitively, a [concrete concept is one associated with more similar] imgs;
    for example, images associated with “dog” will likely contain dogs, whereas
    images associated with “beautiful” may contain flowers, sunsets, weddings
* Allowing concreteness to be dataset-specific is an important innovation
  because concreteness is contextual
  * eg “London” as highly concrete because of a preponderance of iconic imgs
    [or] a geotag for diverse images
* our method is compatible with both discrete and continuous textual concepts
  (eg topic distributions)
* we consider the cross-modal retrieval problem, and examine a number of NLP,
  vision, and retrieval algorithms
  * 4 datasets × 2 image-representation algorithms × 5 textualrepresentation
    algorithms × 4 text/image alignment algorithms × 2 feature pre-processing
    schemes), we find that
  * more concrete instances are easier to retrieve, and
  * different algorithms have similar failure cases.  Interestingly, the
  * some datasets appear to have a linear relationship between [conc & retriev]
    * others: beyond [a concreteness threshold] retrieval becomes much easier
* our work can have a positive impact on future multimodal research
  * evaluation — more credit should ... be assigned to performance on non-concr
  * creating or augmenting multimodal datasets, where one might
    a priori consider the desired relative proportion of concrete vs. non-conc
  * curriculum learning (Bengio+ 2009)
  * §8 gives more detail
