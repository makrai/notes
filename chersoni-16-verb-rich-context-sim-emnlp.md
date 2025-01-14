Emmanuele Chersoni, Enrico Santus, Alessandro Lenci, P Blache, Chu-Ren Huang
Representing Verbs with Rich Contexts: an Evaluation on Verb Similarity
EMNLP 2016

# Intro

* cosine is generally adopted to measure such proximity, even though
  other measures have been proposed (Weeds+ 2004; Santus+ 2016)
* bag-of-words approach, that is they turn a text span ... into a set of words
  and they register separately the co-occurrence of each word
  * valuable information concerning word interrelations in a context gets lost,
* entire word windows as features
  * Ruiz-Casado+ (2005), Agirre+ (2009) and Melamud+ (2014) proposed
  * e.g. _kill_ and _heal_
    share the same object nouns ..., but are
    highly different if we consider their joint dependencies
  * data sparsity, therefore
    requiring either larger corpora or complex smoothing processes
* In this paper, we propose a syntactically savvy notion of joint contexts. To
  test our representation, we implement several DSMs and we evaluate them in a
  verb similarity task on two datasets. The results show that, even using a
  relatively small corpus, our syntactic joint contexts are robust with respect
  to data sparseness and perform similarly or better than single dependencies
  in a wider range of parameter settings

# 2 psycholinguistic and computational background for this research

* studies in sentence processing suggests that
  * verbs activate expectations on their typical argument nouns and vice
    versa (McRae+ 1998; McRae+ 2005) and
  * nouns do the same with other nouns occurring as co-arguments
    (Hare+ 2009; Bicknell+ 2010). Experimental subjects seem to
  * phenomenon, generally referred to as thematic fit (McRae+ 1998), supports
    * mental lexicon arranged as a web of mutual expectations.
* comp: dependency-based or of thematic roles-based DSMs
  (Baroni and Lenci, 2010; Lenci, 2011; Sayeed and Demberg, 2014; Greenberg+
  2015)
* richer contextual features in DSMs, mostly based on word windows. The first
  * composite-feature model by Ruiz-Casado+ (2005), who extracted word windows
    through a Web Search engine.
    * A composite feature for the target word _watches_ is
      _Alicia always ~ romantic movies_, extracted from the sentence
      _I heard that Alicia always watches romantic movies with Antony_.  Thanks
  * Agirre+ (2009) adopted an analogous approach, relying on a huge learning
  * Melamud+ (2014) introduced a probabilistic similarity scheme for modeling
    the so-called joint context. By making use of the Kneser-Ney language model
    (Kneser and Ney, 1995) and of a probabilistic distributional measure, they
    were able to overcome data sparsity, outperforming a wide variety of DSMs
    on two similarity tasks, evaluated on VerbSim (Yang and Powers, 2004) and
    on a set of 1,000 verbs extracted from WordNet (Fellbaum, 1998).

# 3 our reinterpretation of joint contexts with syntactic dependencies

* A joint context, as defined in Melamud+ (2014), is a word window of [radius]
  n around a target word.  The target is replaced by a placeholder, and the
  value of the feature for a word w is the probability of w to fill the
  placeholder position
* we introduce the notion of syntactic joint contexts, further abstracting from
  linear word windows by using dependencies. Each featureof the word vector, in
  our view, should correspond to a typical verb-argument combination, as an
* In the present study, we are focusing on verbs because
  verb meaning is highly context sensitive and
  include information about complex argument configurations. Therefore,
  verb representation should benefit more from ... joint features
  (Melamud+ 2014)

The procedure for defining of our representations is the following:
* we extract a list of verb-argument dependencies from a parsed corpus, and for
  each target verb we extract all the direct dependencies from the sentence of
  occurrence. For instance, in Finally, the dictator acknowledged his failure,
  we will have: target = ’acknowledge-v’; subject = ’dictator-n’; and object =
  ’failure-n’.
* for each sentence, we generate a joint context feature by joining all the
  dependencies for the grammatical relations of interest. From the example
  above, we would generate the feature
dictator-n.subj+~+failure-n.obj.
* the grammatical relations that we used are subject, object and complement,
  where complement is a generic relation grouping together all dependencies
  introduced by a preposition.

Our distributional representation for a target word is a vector of syntatic
joint contexts. For instance, the word vector for the verb _to begin_ would
include features like
{jury-n.subj+~+deliberation-n.obj,
operation-n.subj+~+on-i_thursday-n.comp,
recruit-n.subj+~+training-n.obj+on-i_streetn.comp ...}.
The value of each joint feature will be the frequency of occurrence of the
target verb with the corresponding argument combination, possibly weighted by
some statistical association measure.

# 4 Evaluation settings and results

## Datasets

* The DSMs are evaluated on two test sets:
  * VerbSim (Yang and Powers, 2006), 130 verb pairs
  * the verb subset of SimLex-999 (Hill+ 2015), 222 verb pairs.

## 4.4 Results

# Conclusions
