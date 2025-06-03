Sean MacAvaney and Amir Zeldes
A Deeper Look into Dependency-Based Word Embeddings
naacl 2018

# Abstract

* embeddings trained with Universal and Stanford dependency contexts
  excel at different tasks
* enhanced dependencies often improve performance

# Intro

* word embeddings trained with neural networks have gained popularity
  * machine translation (Zou+ 2013) and information retrieval (Hui+ 2017)
* Levy and Goldberg (2014) ... use contexts based on dependency parses
  * akin to ... Pado and Lapata, (2007) [and] Baroni and Lenci (2010)
  * better at capturing semantic similarity, rather than relatedness
* Work since Levy and Goldberg (2014)
  * for sentence classification (Komninos and Manandhar, 2016)
  * Li+ (2017) ... model type (e.g., CBOW, Skip-Gram, GloVe)
  * Abnar+ (2018) ... predicting brain activation patterns
  * The best model to date
    for distinguishing between similarity and relatedness
    combines word embeddings, WordNet, and dictionaries (Recski+ 2016)
* existing work is [limited to] Stanford Dependencies (De Marneffe& 2008)
* We
  * provide further analysis using ... Universal Dependencies (Nivre+ 16)
  * not compare cross-lingual embeddings in our study
  * is [UD] better or worse than the English-specific labels and graphs?
  * approaches to simplifying and extending dependencies, including Enhanced
    dependencies and Enhanced++ dependencies (Schuster and Manning, 2016), as
    two levels of relation simplification
  * performance ... at distinguishing between functional and domain similarity
  * word similarity rankings and
    two downstream tasks: question-type classification and NER
