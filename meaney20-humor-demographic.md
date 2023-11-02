Crossing the Line: Where do Demographic Variables Fit into Humor Detection?
JA Meaney
ACL 2020 Student Research Workshop

# Abstract

* Recent humor classification shared tasks have struggled with two issues:
  * highly constrained genre of humor or 
  * the data is so indiscriminate that
    the inter-annotator agreement on its humor content is drastically low
* typically average over all annotators’ judgments,
  in spite of that humor is a highly subjective phenomenon
* We argue that demographic factors influence whether a text is humorous
  * propose the addition of 
    * demographic information about the humor annotators in order to bin
    * an ‘offensive’ label to distinguish between different generations
* could lead to better performance on eg content moderation

# Introduction

* computational humor (CH) is flourishing, and
  * since 2017, the proliferation of shared humor detection tasks in NLP has
  * not always informed by the long and interdisciplinary history of humor
    research (Taylor and Attardo, 2016, Davies, 2008)
  => excellent evaluation results, but which may not 
    * transfer to other humor datasets,
    * improve downstream tasks like content moderation, or
    * contribute to our understanding of humor.
* A central issue is the conception of humor classification tasks as
  humor-or-not, similar to image classification’s view of an image as
  dog-or-not.
  + score prediction, with little recognition that gold
  * standard labels for these constructs simply do not exist.  

## 1.1 Proposal

* To the extent that humor is multi-faceted, and subject to multiple interpret
* incremental improvements to shared tasks can be made by
  * Acknowledging that texts may not be perceived as humorous by all readers,
    and allowing for a different interpretation, eg offensive.
  * Collecting demographic information about the annotators of humor datasets
    to learn more about which sectors of society find a text humorous versus
    offensive.

## 1.2 Why Offensive as an Alternative Label?

* Cultural shifts in many parts of the world have seen a decline in racist and
  sexist jokes, and the growth of humor that acknowledges marginalized people.
* Lockyer and Pickering (2005) argue that this is not just a recent phenomenon,
  but that all pluralist societies navigate the space between humor and
  offensiveness, between ‘free speech and cultural respect’
* offensive language is still plentiful on the internet (Davidson+, 2017,
  Nobata+, 2016)
  * can reinforce racial stereotypes, or have a damaging impact on communities.
* many shared tasks source their data online, either by scraping Twitter,
  Reddit, or crowdsourcing, we believe it is worth capturing the impact of
  these texts on users.

## 1.3 Why Demographic Factors?

* gender and age differences in the appreciation of jokes (Omwake 1937)
  * where young men gave higher ratings to ’shady’ (eg sexual) jokes than their
    female, and older counterparts did (Omwake, 1937).
  * in the Netherlands, Kuipers (2017) found significant differences in humor
    preferences along the lines of gender, age, and in particular, social class
    or education level. An interesting finding was that 
    * the older generation rated their younger counterparts’ humor as
      offensive. This contradicts the popular opinion that the millennial
      generation is perpetually offended (Fisher, 2019).
  * a US study found that males tended to give higher ratings to female-hostile
    jokes, and females did the same with male-hostile jokes. Both genders found
    female-hostile jokes more offensive overall (Abel and Flick, 2012).
* no current work from CH on demographic differences in humor perception 
  * can be incorporated into shared tasks with some simple adjustments.

# 4 Contribution to Computational Humor

* Our dataset will be the first to model the reception of a wide variety of
  humor genres from Twitter, presented to users of different demographics. It
  * the first CH dataset to take into account the ratings of non-binary
    annotators
* In line with Hossain (2019), we aim to use clustering methods on the humor
  and/or offensive texts to 
  determine themes that evoke these classes for different groups. We also aim
  * explore whether theories of humor, such as surprisal, superiority and
    incongruity are equally appreciated among different groups
