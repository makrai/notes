Automatic Keyphrase Extraction: A Survey of the State of the Art
Kazi Saidul Hasan and Vincent Ng
2014 acl

ugyanez a téma jobban le van írva [ebben a posztban](
http://bdewilde.github.io/blog/2014/09/23/intro-to-automatic-keyphrase-extraction/)

# Intro

* keyphrases 
  * enabled fast and accurate searching for a given document 
  * [have] potential in improving many NLP and IR tasks, such as 
    * text summarization (Zhang et al., 2004), 
    * text categorization (Hulth and Megyesi, 2006), 
    * opinion mining (Berend, 2011), and 
    * document indexing (Gutwin et al., 1999).

# 2 [corpus-related issues]

* length
* structural consistency
* topic change
* topic correlation
  * difference between
    * scientific articles and news articles: keyphrases ... are typically
      related to each other (Turney, 2003; Mihalcea and Tarau, 2004).
    * informal text (e.g., emails, chats, informal meetings, personal blogs)
      * any number of potentially uncorrelated topics

# 3 Keyphrase Extraction Approaches

## 3.1 extracting a list of words/phrases that serve as candidate keyphrases

* heuristic rules
  1.  using a stop word list to remove stop words (Liu et al., 2009b), 
  2.  allowing words with certain partof-speech tags (e.g., nouns, adjectives,
      verbs) to be candidate keywords (Mihalcea and Tarau, 2004; Wan and Xiao,
      2008b; Liu et al., 2009a), 
  3. allowing n-grams that appear in Wikipedia article titles to be candidates
     (Grineva et al., 2009), and 
  4. extracting n-grams (Witten et al., 1999; Hulth, 2003; Medelyan et al.,
     2009) or noun phrases (Barker and Cornacchia, 2000; Wu et al., 2005) that
     satisfy pre-defined lexico-syntactic pattern(s) (Nguyen and Phan, 2009).
  * prune candidates that are unlikely to be keyphrases (Huang et al., 2006;
    Kumar and Srinathan, 2008; El-Beltagy and Rafea, 2009; You et al., 2009;
    Newman et al., 2012).

## 3.2 supervised keyphrases selection
## 3.2 unsupervised keyphrases selection
