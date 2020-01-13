Edward Grefenstette and Mehrnoosh Sadrzadeh. 
Experimental support for 
  a categorical compositional distributional model of meaning
EMNLP 2011 

http://www.cs.ox.ac.uk/activities/compdistmeaning/GS2011data.txt
see 6.6

* the sentence similarity task for transitive sentences
  * extension of the similarity task for compositional models developed by
    Mitchell and Lapata (2008), and constructed [similarly]
  * 2500 similarity judgements, provided by 25 participants
  * transitive verbs, each paired with both a subject and an object noun
    * Additionally, a ‘landmark’ verb is provided

# 6 Evaluation 7

* we present a new evaluation task extending the experimental methodology of
  Mitchell and Lapata (2008) to transitive verb-centric sentences, and 
  compare our model to those discussed by Mitchell and Lapata (2008)

## First Dataset Description 

* The first experiment, described in detail by Mitchell and Lapata (2008),
* evaluates how well compositional models disambiguate ambiguous words given
  the context of a potentially disambiguating noun. Each entry of the dataset
  provides a noun, a target verb and landmark verb (both intransitive). The
  noun must be composed with both verbs to produce short phrase vectors the
  similarity of which is measured by the candidate. Also provided with each
* a classification (“High” or “Low”) indicating whether or not the verbs are
  indeed semantically close within the context of the noun, as well as 
* an evaluator-set similarity score between 1 and 7

## Evaluation Methodology 

* Candidate models provide a similarity score for each entry
* The scores of high similarity entries and low similarity entries are averaged
* The correlation of the model’s similarity judgements with the human
  judgements is also calculated using [the scrupulous] Spearman’s ρ, a metric
  [again following] Mitchell and Lapata (2008)
* It is assumed that inter-annotator agreement provides the theoretical maximum
* baseline: The cosine measure of the verb vectors, ignoring the noun, is taken

## Other Models 

The other models we compare ours to are those evaluated by Mitchell and Lapata
(2008)

## Model Parameters 

## First Experiment Results 

## 6.6 Second Dataset Description 

* follows the format of the Mitchell and Lapata, (2008) dataset [but]
* target and landmark verbs are transitive, and 
  an object noun is provided in addition to the subject noun, hence 
  forming a small transitive sentence
* 200 entries consisting of sentence pairs (hence a total of 400 sentences)
* constructed by following the procedure outlined in §4 of Mitchell & L (2008)
* transitive verbs from CELEX 7 
* classification of HIGH or LOW by the authors
