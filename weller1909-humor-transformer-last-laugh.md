Humor Detection: A Transformer Gets the Last Laugh
Orion Weller, Kevin Seppi
EMNLP 2019 arXiv:1909.00252 [cs.CL]

  We have made our code and datasets open source for others to use

# Abstract

* new task: assessing whether or not a joke is humorous
* model learns to identify humorous jokes based on ratings gleaned from Reddit
  * almost 16,000 labeled instances
* we then employ a Transformer architecture for its advantages in learning
* results are comparable to human performance
* This architecture can predict the level of humor for a specific audience to a
  higher degree than a general audience consensus
* on existing humor identification datasets for short jokes and puns
  * this method outperforms all previous work done on these tasks, with an
  * F-measure of 93.1% for the Puns dataset; 98.6% on the Short Jokes dataset

# Data

* We gathered jokes from a variety of sources, each covering a different type
  of humor. These datasets include jokes of
  * multiple sentences (the Short Jokes dataset), jokes with only
  * one sentence (the Puns dataset), and more
  * mixed jokes (the Reddit dataset)

## 3.1 Reddit

* gathered using Reddit’s public API, collecting the most recent jokes
  * Every time the scraper ran, it also updated the upvote score of the
  * every hour through the months of March and April 2019
  * data was already split into body and punchline sections from Reddit, we
  => separate datasets containing: just body, just punchline, both
* Some sample jokes are shown in Table 1, above
  * The distribution of joke scores varies wildly, ranging from 0 to 136,354
    upvotes
  * there is a major jump between the 0-200 upvote range and the 200 range and
    * only 6% of jokes scoring between 200-20,000
  * We used this natural divide as the cutoff to decide what qualified as a
    funny joke, giving us 13884 notfunny jokes and 2025 funny jokes

## 3.2 Short Jokes, found on Kaggle, contains 231,657 short jokes

* scraped from various joke websites with lengths ranging from 10 to 200 chars
* non-jokes: Chen and Soo (2018) combined this dataset with the WMT162 English
  news crawl
  * their exact combined dataset is not publicly available
  * we used the same method and news crawl source to create a similar dataset
    * sentences from the WMT162 news crawl that had the same distribution of
      words and characters as the jokes in the Short Jokes dataset on Kaggle3 

## 3.3 Pun of the Day scraped by Yang+ (2015) and contains

* 16001 puns and 16002 not-punny sentences
* they gave us use of this dataset
* constructed from the Pun of the Day website while the
* negative samples were gathered from news websites

# 6 Discussion

* The model has used the context of the words to determine, with high
  probability, what an average Reddit r/Jokes viewer will find humorous
* stark difference between the preferences of the general population and those
  of the Reddit users (Table 2).  We would hypothesize that our model is learn-
  ing the specific type of humor enjoyed by those who use the Reddit r/Jokes
  forum. This would suggest that humor can be learned for a specific subset of
  the population
* The model’s high accuracy and F1 scores on the Short Jokes and Pun of the Day
  dataset show the effectiveness of the model for transfer learning
  * not terribly surprising: If the model can figure out which jokes are funny,
    it seems to be an easier task to tell when something isn’t a joke at all
* defining the absolute truth value for a joke’s humor is a challenging, if not
  impossible task
  * nL, these results indicate that, at least for a subset of the population,
    we can find and identify jokes that will be most humorous to them
