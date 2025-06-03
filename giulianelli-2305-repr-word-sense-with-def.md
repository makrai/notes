Interpretable Word Sense Representations via Definition Generation: The Case of Semantic Change Analysis
Mario Giulianelli, Iris Luden, Raquel Fernandez, Andrey Kutuzov
ACL 2023 arXiv:2305.11993 [cs.CL]

# Abstract

* We propose using automatically generated natural language definitions of
  contextualised word usages as interpretable word and word sense reprs
* Given a collection of usage examples for a target word,
  and the corresponding data-driven usage clusters (ie, word senses),
  a definition is generated for each usage with a specialised Flan-T5 LM
  * the most prototypical def in a usage cluster is chosen as the sense label.
* We demonstrate how the resulting sense labels can
  * make existing approaches to semantic change analysis more interpretable,
  * allow users ~~ historical linguists, lexicographers, or social scientists
    ~~ to explore and intuitiv explain diachronic trajectories of word meaning
  * many possible applications of the 'definitions as representations' paradigm
  * Beyond being human-readable, contextualised definitions also
  * outperform token or usage sentence embeddings
    in word-in-context semantic similarity judgements
* from the conclusion
  * generated defs already shown to be effective for WSD (Bevilacqua+ 2020)
  * we: a broader perspective and demonstrates that
    * modern language models like Flan-T5 (Chung+ 2022) are sufficiently mature
      to produce robust and accurate definitions in a simple prompting setup.
  * The generated definitions outperform traditional token embeddings in
    word-in-context similarity judgements while being naturally interpretable.
  * applied to semantic change analysis, our approach traces word sense
    dynamics over time
    * Operating in the space of humanreadable definitions makes such analyses
      much more interesting and actionable for linguists and lexicographers—who
  * can also be used for other NLP tasks in the area of lexical semantics,
    eg word sense induction, idiom detection, and metaphor interpretation.
  * Our experiments with diachronic sense modelling are
    still preliminary and mostly qualitative
  * future: evaluate systematically how well our predictions correspond to the
    judgements of (expert) humans. Once further evidence is gathered,
    * tracing cases of sem narrowing/widening over time (Bloomfield, 1933) by
      * analysing the variability of contextualised definitions
        in different time periods and by
      * making cluster labels time-dependent
      * Both directions will require extensive human annotation

# 2 Related Work

## 2.2 Semantic Change Detection

* Words in natural language change their meaning over time; these diachronic
* of interest both for linguists and NLP practitioners
* Lexical semantic change detection (LSCD) is nowadays well represented
  * workshops (Tahmasebi+ 2022) and several
  * shared tasks (eg Schlechtweg+ 2020; Kurtyigit+ 2021). LSCD is usually
* cast either/or as
  * binary classification (whether the target word changed its meaning)
  * a ranking task (ordering target words according to the degree of change)
* manually annotated datasets are used: so-called DWUGs in Sec 3
* issue: methods rarely describe change in terms of word senses, which are
  * extremely important for linguists to understand diachronic meaning
  * systems provide (and are evaluated by) perword numerical ‘change scores’
    which are hardly interpretable; at best, a binary ‘sense gain’ or ‘sense
    loss’ classification is used
  * approaches that do operate on the level of senses
    (eg Mitra+ 2015; Homskiy and Arefyev, 2022) do
    * not label them in a linguistically meaningful way, making it
    * difficult to understand the relations between the resulting ‘anonymous’
      types of word usage.

# 3 Data

## 3.2 Diachronic Word Usage Graphs

* We showcase interpretable word usage (§5) and sense representations (§6 & 7)
* diachronic word usage graphs (DWUGs, Schlechtweg+ 2021). A DWUG is
* a weighted, undirected graph, where
  * nodes represent target usages (word occurrences within a sentence or
    discourse context) and
  * edge weights represent the semantic proximity of a pair of usages. DWUGs
* result from a multi-round incremental human annotation process, with
  * annotators asked to judge the semantic relatedness of pairs of word usages
    on a 4-point scale.  Based on these pairwise relatedness judgements,
  * word usages are then grouped into usage clusters (a data-driven
    approximation of word senses)
    using a variation of correlation clustering
    (Bansal+ 2004; Schlechtweg+ 2020)
* ? SemCor (Miller+ 1993)
  * in theory, a definition dataset could be also be extracted from SemCor
  * hE we do not anticipate it will contribute much to training or evaluation
  <= SemCor does not contain any new definitions with respect to WordNet:
    * only more examples for the same word-definition pairs. This can be
* DWUGs are currently available in seven languages (de en ru es la sv no)
  https://www.ims.uni-stuttgart.de/en/research/resources/experiment-data/wugs/
* In this paper, we use the English graphs, which consist of
  * usage sentences sampled from the Clean Corpus of Historical American
    English (Davies, 2012; Alatrash+ 2020) and belonging to
    two time periods: 1810-1860 and 1960-2010.  There are
  * 46 usage graphs for English, corresponding to 40 nouns and 6 verbs
    annotated by a total of 9 annotators
    * Each target lemma has received on average 189 judgements, 2 for each
      usage pair
  * Figure 1 shows an example of a DWUG, with
    * colours denoting usage clusters (ie, data-driven senses)
    * the ‘blue’ and ‘orange’ clusters belong almost entirely to diff periods:
      a new sense of the word has emerged
* We show how our approach helps explain such cases of semantic change in §7.

# 4 Definition Generation

## Prompt selection

* In prelim expers, we used the pre-trained Flan-T5 Base model (250M params) to
  select a definition generation prompt among 8 alternative verbalisations.
  Appending the question ‘What is the definition of w?’ to the usage example
  consistently yielded the best scores.6 We use this prompt for all further
  experiments.
