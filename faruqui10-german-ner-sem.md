Training and Evaluating a German Named Entity Recognizer with Sem Genization
Manaal Faruqui and Sebastian Padó
in Pinkal+ 2010 Semantic Approaches in Natural Language Processing

# 2 Named Entity Recognition with Semantic Generalization 130

* use Stanford’s Named Entity Recognition system
  * uses a linear-chain Conditional Random Field to predict the most likely
    sequence of NE labels (Finkel and Manning, 2009)
  * variety of features, including the word, lemma, and POS tag
    of the current word and its context, n-gram features, and
    “word shape” (capitalization, numbers, etc.)
  * supports the inclusion of distributional similarity features
  * combines standard distributional similarity
    with morphological similarity, Clark (2003)
  * decrease the entropy of the NE classes distribution
    by conditioning on clusters,
* btw
  * LexikoNet, a German semantic noun classification with 60,000 entries
