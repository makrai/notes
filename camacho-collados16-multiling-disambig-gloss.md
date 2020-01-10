José Camacho-Collados, CD Bovi, Alessandro Raganato and Roberto Navigli
A Large-Scale Multilingual Disambiguation of Glosses
2016 LREC

* Notes during the talk
  * Babelfy is the state-of-the-art graphical appoach to wsd-delinking

#Abstract

* the disambiguated [word in the definitions] are
  * directly connected to the definiendum
* we obtain a multilingual corpus of textual definitions featuring over
  * 38 million definitions in
  * 263 languages
  * freely available at http://lcl.uniroma1.it/disambiguated-glosses

#1 Introduction

* definitional knowledge has proved to be key in achieving state-of-the-art
  * Word Sense Disambiguation
    (Lesk, 1986; Banerjee and Pedersen, 2002; Navigli and Velardi, 2005;
     Agirre and Soroa, 2009; Fernandez-Ordonez+ 2012;
    * Chen+ 2014;
      Chen, X., Liu, Z., and Sun, M
      A unified model for word sense representation and disambiguation
      EMNLP 2014
    * Camacho-Collados+ 2015b),
  * Taxonomy and Ontology Learning
    * (Velardi+ 2013; Flati et al., 2014;
    * Espinosa-Anke+ 2016),
  * Information Extraction
    * (Richardson+ 1998; Delli Bovi et al., 2015),
  * Plagiarism Detection (Franco-Salvador+ 2016), and
  * Question Answering (Hill+ 2015)
* evaluate our sense-annotated corpus
  * intrinsically, obtaining a disambiguation precision of over 90%
    * in three different languages, and
  * extrinsically on Open Information Extraction and Sense Clustering tasks
    * two state-of-the-art systems

#2 Related Work

* WordNet glosses have still been used successfully _in recent work_
  * Khan+ 2013;
    Khan, M. F., Khan, A., and Khan, K. (2013)
    Efficient word sense disambiguation technique 
      for sentence level sentiment classification of online reviews
  * Chen+ 2015
    Chen, T., Xu, R., He, Y., and Wang, X. (2015)
    Improving distributed representation of word sense
      via wordnet gloss composition and context clustering
    ACL(-IJCNLP) 2015
* attempts to disambiguate WordNet glosses automatically
  * as part of the eXtended WordNet project (Novischi, 2002)
    * coverage did not reach 6%
  * Moldovan and Novischi (2004)
    * model trained on the SemCor sense-annotated corpus (Miller+ 1993)
    * [they normally require] vast amount of annotated data 
  * part of the SensEval-3 workshop (Litkowski, 2004)
    * the best reported system obtained F-score below 70%
      * not enough for state-of-the-art NLP systems
* coverage ... of sense-annotated definitions produced to date
  * Princeton WordNet Gloss Corpus
    * human annotators
    * successful as part of the pipeline in
      * semantic similarity (Pilehvar+ 2013),
      * domain labeling (González+ 2012) and
      * Word Sense Disambiguation
        * Agirre and Soroa, 2009;
        * Camacho-Collados+ 2015b
          * Camacho-Collados, J., Pilehvar, M. T., and Navigli, R
          * A unified multilingual semantic representation of concepts
          * ACL 2015
      * problem: new encyclopedic knowledge about the world
  * automatic extraction of definitions from unstructured text
    * (Navigli and Velardi, 2010; Benedictis+ 2013;
    * Espinosa-Anke and Saggion, 2014; Dalvi+ 2015)
  * collaborative resources (Hovy+ 2013)
    * annotators ... difficulty of selecting ...  from an extremely
    * large sense inventory
* in this paper we propose an automatic disambiguation approach which
  * leverages
    * multilinguality and cross-resource information along with a
    * state-of-the-art multilingual Word Sense Disambiguation/Entity Linking
      * (Moro+ 2014) and a
    * vector-based semantic representation of concepts and entities
      * (Camacho-Collados+ 2015a)
  * produce a large-scale high-quality corpus of glosses,
    * automatically disambiguated with BabelNet synsets

#3 Methodology

* combination of different languages and resources
* problem:
* since definitions are short
  * lack of meaningful context would negatively affect the performance of
  * a Word Sense Disambiguation/Entity Linking system

#3.1.  Context-rich Disambiguation

* context enrichment procedure by
  * collecting all the definitions of this synset
    * in every available language and resource,
* after preprocessing and context-enrichment, We use a
  * state-of-the-art graph-based approach to Entity Linking and WSD,
    * Babelfy 8 (Moro+ 2014)

#3.2.  Disambiguation Refinement

* TODO megérteni
* NASARI
  * vector representations for over four million BabelNet synsets
  * exploiting the complementary knowledge of Wikipedia and WordNet
  * state-of-the-art results in various lexical semantics tasks such as
    * Semantic Similarity,
  *   ! Sense Clustering and
    * Word Sense Disambiguation
  * the 2.1 release version of the NASARI-embed vectors,
    * downloaded from http://lcl.uniroma1.it/nasari
* NASARI score allows us to both
  * discard low-confidence disambiguated instances and
  * correct the original disambiguation output by Babelfy in some cases

#4 Statistics p3

* verbs, adjectives and adverbs [are] often harder to disambiguate 
  as they are not directly related to the definiendum

#5 Evaluation p4

#5.1.  Intrinsic evaluation

* manually assessing the quality of disambiguation

#5.2 Extrinsic evaluation

###5.2.1. Open Information Extraction

* before the high-precision refinement, ... focused on
* DefIE (Delli Bovi+ 2015)
  * original implementation uses Babelfy to
    * disambiguate definitions one-by-one before extracting
      * relation instances [syntactic dependencies]
* Open Information Extraction (OIE) system

###5.2.2. Sense Clustering 

* this experiment evaluates our refined high-precision corpus
  * Knowledge resources such as Wikipedia or WordNet
    * suffer from the high granularity of their sense[s]
  * cluster of senses within these sense inventories
    * boost the performance in different applications
      * (Hovy+ 2013)
        * Hovy, E. H., Navigli, R., and Ponzetto, S. P
        * Collaboratively built semi-structured content
        * and Artificial Intelligence: The story so far
        * 2013 Artificial Intelligence
  * In this section ... this issue in Wikipedia
  * We simply enrich the BabelNet taxonomy with the
    * high-precision disambiguated glosses
      * synsets that are highly semantically connected with
      * the definiendum, which makes them particularly
      * suitable for enriching a semantic network
  * we obtain a new set of vector representations
    * for BabelNet synsets,
    * increasing ... coverage
      * 4.4M synsets covered by the default NASARI
      * 4.6M synsets covered by NASARI enriched

#6 Release

#7 Conclusion
