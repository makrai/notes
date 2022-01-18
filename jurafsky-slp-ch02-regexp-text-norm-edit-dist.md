in Speech and Language Processing. Daniel Jurafsky & James H. Martin.
Draft of December 29, 2021.

# 2 Regular Expressions, Text Normalization, Edit Distance

> I am unhappy.
> DO YOU THINK COMING HERE WILL HELP YOU NOT TO BE UNHAPPY
> I need some help, that much seems certain.
> WHAT WOULD IT MEAN TO YOU IF YOU GOT SOME HELP
> Perhaps I could learn to get along with my mother.
> TELL ME MORE ABOUT YOUR FAMILY
> My mother takes care of me.
> WHO ELSE IN YOU FAMILY TAKES CARE OF YOU
> My father.
> YOUR FATHER
> You are like my father in some ways.
  Weizenbaum (1966)

* The dialogue above is from ELIZA, an early NLP system that could carry on a
  * imitating the responses of a Rogerian psychotherapist (Weizenbaum, 1966).
  * uses pattern matching to recognize phrases like “I need X” and translate
    them into suitable outputs like “What would it mean to you if you got X?”.
    * ELIZA doesn’t actually need to know anything to mimic a Rogerian psychothe
    * this is one of the few dialogue genres where listeners can act as if they
      know nothing of the world
  * many people who interacted with ELIZA came to believe that it really
    understood them and their problems,
    many continued to believe in ELIZA’s abilities even after the program’s
    operation was explained to them (Weizenbaum, 1976), and even today such
    chatbots are a fun diversion.
  * modern conversational agents are much more than a diversion; they can
    answer questions, book flights, or find restaurants, will see in Chapter 24
  * simple pattern-based methods that powered ELIZA play a crucial role in NLP
* regular expression. Regular expressions can be used to specify strings we
* set of tasks collectively called text normalization,
  in which regular expressions play an important part. Normalizing text means
  * tokenizing words from running text, the task of tokenization. English words
    * New York and rock ’n’ roll are sometimes treated as large words despite
    * sometimes we’ll need to separate I’m into the two words I and am
    * For processing tweets or texts we’ll need to tokenize
      emoticons like :) or hashtags like #nlproc
    * Some languages, like Japanese, don’t have spaces between words, so word
  * lemmatization, the task of determining that two words have the same root,
    * essential for processing morphologically complex languages like Arabic.
    * Stemming refers to a simpler version of lemmatization in which we
      mainly just strip suffixes from the end of the word. Text normalization
  * sentence segmentation: breaking up a text into individual sentences, using
* compare words and other strings. We’ll introduce a metric called
  * edit distance that measures how similar two strings are
    based on the number of edits (insertions, deletions, substitutions) it takes
  * applications throughout language processing, from
    spelling correction to speech recognition to coreference resolution.

### 2.4.3 Byte-Pair Encoding for Tokenization

* use our data to automatically tell us what the tokens should be.
  * especially useful in dealing with unknown words, an important problem in
* modern tokenizers often automatically induce sets of tokens that include
  tokens smaller than words, called subwords.
  * Subwords can be arbitrary substrings, or they can be meaning-bearing units
  * most tokens are words, but some tokens are frequently occurring morphemes
    or other subwords like -er.
* Most tokenization schemes have two parts: a token learner, & a token segmenter
  * learner takes a raw training corpus (sometimes roughly preseparated into
    words, for example by whitespace) and induces a vocabulary, a set of tokens. The
  * segmenter takes a raw test sentence and segments it into the tokens in the
    vocabulary
* Three algorithms are widely used
  * byte-pair encoding (Sennrich+ 2016),
  * unigram language modeling (Kudo, 2018), and
  * WordPiece (Schuster and Nakajima, 2012)
  * SentencePiece library 
    * implementations of the first two of the three (Kudo and Richardson, 2018)
* In this section we introduce the simplest of the three, the byte-pair encoding
  or BPE algorithm (Sennrich+ 2016); see Fig. 2.13
  * token learner begins with a vocabulary that is just the set of all
    individual characters. It then examines the training corpus, chooses the two
    symbols that are most frequently adjacent (say ‘A’, ‘B’), adds a new merged
    symbol ‘AB’ to the vocabulary, and replaces every adjacent ’A’ ’B’ in the
    corpus with the new ‘AB’. It continues to count and merge, creating new
    longer and longer character strings,
    until k merges have been done creating k novel tokens; k is thus a parameter
    * The resulting vocabulary consists of the original set of characters plus k
      new symbols.
    * usually run inside words (not merging across word boundaries), so the
      * special end-of-word symbol , and its counts. Let’s see its operation on
  * token parser is used to tokenize a test sentence. The token parser just runs
    * applies the replacements greedily, in the order we learned them.
      (Thus the frequencies in the test data don’t play a role, just the
      frequencies in the training data)
* in real algorithms BPE is run with many thousands of merges on a very large
  * most words will be represented as full symbols, and
    only the very rare words (and unknown words) will have to be represented by
    their parts.
