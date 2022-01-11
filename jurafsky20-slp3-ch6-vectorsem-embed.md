from Speech and Language Processing. Daniel Jurafsky & James H. Martin.  2021.

# 6 CHAPTER Vector Semantics and Embeddings

* Words that occur in similar contexts tend to have similar meanings. This link
  * the distributional hypothesis. The hypothesis was
  * first formulated by linguists like Joos (1950), Harris (1954), Firth (1957),
* vector semantics, which instantiates this linguistic hypothesis by
  learning representations of the meaning of words, called embeddings, directly
  from their distributions in texts. These representations are
  * used in every natural language processing application that uses meaning, and
  * static embeddings we introduce here underlie the more powerful
  * dynamic or contextualized embeddings like BERT that we will see in Chap 11
* the first example in this book of representation learning, automatically
  * self-supervised ways to learn representations of the input,
    instead of creating representations by hand via feature engineering, is
    an important focus of NLP research (Bengio+ 2013).

## 6.1 Lexical Semantics

* How should we represent the meaning of a word?
  * n-gram models: a string of letters, or an index in a vocabulary list
  * not that different from a tradition in philosophy
    * just spelling the word with small capital letters;
      representing the meaning of “dog” as DOG, or by using an apostrophe (DOG’)
* lexical semantics 
  * we’ll want a model of word meaning to do all sorts of things for us. It
  * some words have similar meanings (cat is similar to dog), others are
    antonyms (cold is the opposite of hot), some have
    positive connotations (happy) while others have negative connotations (sad).
  * buy, sell, and pay offer differing perspectives on the same underlying
    purchasing event (If I buy something from you, you’ve probably sold it to)
  * draw inferences to address meaning-related
    tasks like question-answering or dialogue.
* In this section we summarize some of these desiderata
  * drawing on results in lexical semantics, the linguistic study of word meanin
  * we’ll return to and expand on this list in Chapter 18 and Chapter 10.  

#### Lemmas and Senses Let’s start by looking at how one word (we’ll choose

* how mouse might be defined in a dictionary (simplified from the online dictionary
```
mouse (N)
1. any of numerous small rodents...
2. a hand-operated device that controls a cursor...
```

* lemma, also called the citation form. The form mouse would also be the lemma
  * inflected forms like mice. Similarly sing is the lemma for sing, sang, sung.
  * In many languages the infinitive form is used as the lemma for the verb, so
    * Spanish dormir “to sleep” is the lemma for duermes “you sleep”. The
  * wordforms.
* each lemma can have multiple meanings; a word sense
  * Chapter 18 will discuss the problem of polysemy, and introduce WSD, the task

#### Synonymy One important component of word meaning is the relationship be-

* eg couch/sofa vomit/throw up filbert/hazelnut car/automobile
propositional meaning
principle of contrast
similarity

* A more formal definition of synonymy (between words rather than senses) is
  * if they are substitutable for one another in any sentence without changing
    the truth conditions of the sentence, the situations in which the sentence
* the two words have the same propositional meaning.
* no two words are absolutely identical in meaning. One of the fundamental
  * principle of contrast (Girard 1718, Bréal 1897, Clark 1987), states that
    a difference in linguistic form is always associated with some difference in
    meaning
  * For example, the word H 2 O is used in scientific contexts and would be
  * In practice, the word synonym is therefore used to describe a relationship
    of approximate or rough synonymy.

#### Word Similarity While

* words don’t have many synonyms, most words do have lots of similar words
* Cat is not a synonym of dog, but cats and dogs are certainly similar words. In
* shift from talking about relations between word senses (like synonymy) to
  relations between words (like similarity). Dealing with words
  * avoids having to commit to a particular representation of word senses, which
* in larger semantic tasks. Knowing
  * how similar the meaning of two phrases or sentences are, a very important
  * question answering, paraphrasing, and summarization
  * getting values for word similarity is to ask humans to judge how similar one
  * datasets have resulted from such experiments. For example the
    * SimLex-999 dataset (Hill+ 2015) gives values on a scale from 0 to 10, like

#### Word Relatedness

* related in ways other than similarity. One such class of connections is called
* word relatedness (Budanitsky and Hirst, 2006), also traditionally
  called word association in psychology.  
* eg coffee and cup
  * not similar to cup; they share practically no features (coffee is a plant)
  * associated by co-participating in an everyday event (the event of drinking)
* Similarly scalpel and surgeon [szike és sebész] are not similar but are
* semantic fields
  * One common kind of relatedness between words is if they belong to the same ~
  * A semantic field is a set of words which cover a particular semantic domain
  * structured relations with each other. For example, words might be related by
  * eg the semantic field of hospitals (surgeon, scalpel, nurse, anes- thetic)
  * related to topic models, like Latent Dirichlet Allocation, LDA, which apply
    unsupervised learning on large sets of texts to induce sets of associated
    words from text
    * for discovering topical structure in documents.
* In Chapter 18 we’ll introduce more relations between senses like
  hypernymy or IS-A, antonymy (opposites) and meronymy (part-whole relations).

#### Semantic Frames and Roles Closely related to semantic fields is the idea of

* A semantic frame is a set of words that denote perspectives or participants in
  a particular type of event
* eg A commercial transaction is a kind of event in which
  one entity trades money to another entity in return for some good or service,
  after which the good changes hands or perhaps the service is performed. This
  * encoded lexically by using verbs like buy (the event from the perspective of the buyer)
     sell (from the perspective of the seller)
     pay (focusing on the monetary aspect)
     or nouns like buyer
* Frames have semantic roles (like buyer, seller, goods, money), and words in a
* makes it possible for a system to know paraphrases
  eg _Sam bought the book from Ling_ could be paraph _Ling sold the book to Sam_
  * Sam has the role of the buyer in the frame and Ling the seller. Being able
  * important for question answering, and can help in machine translation

#### Connotation Finally, words have affective meanings or connotations. The word

* _connotation_ has different meanings in different fields, but here
  we use it to mean the aspects of a word’s meaning that are
  related to a writer or reader’s emotions, sentiment, opinions, or evaluations.
* positive conno- tations (happy) while others have negative connotations (sad).
* Even words whose meanings are similar in other ways can vary in connotation;
  * eg fake, knockoff, forgery, on the one hand, and
       copy, replica, reproduction on the other, or
       innocent (positive connotation) vs naive (negative connotation)
* sentiment, as we saw in Chapter 4, and
* word sentiment plays a role in important tasks like
  sentiment analysis, stance detection, and
  applications of NLP to politics and consumer reviews
* words vary along three important dimensions of affective meaning (Osgood+ 1957)
  * valence: the pleasantness of the stimulus
  * arousal: the intensity of emotion provoked by the stimulus
  * dominance: the degree of control exerted by the stimulus
* Each word is thus represented by three numbers, corresponding to its value on
* Osgood+ (1957) noticed that in using these 3 numbers to represent the meaning
  the model was representing each word as a point in a three-dimensional space,

## 6.2 Vector Semantics 5
