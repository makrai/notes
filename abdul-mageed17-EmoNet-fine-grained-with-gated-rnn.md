EmoNet: Fine-Grained Emotion Detection with Gated Recurrent Neural Networks
Muhammad Abdul-Mageed, Lyle Ungar
ACL 2017

# Abstract

* detection of emotion from natural language 
  * applications ranging from emotional chatbots to
    better understanding individuals and their lives.
  * hE absence of large labeled datasets
* we build
  * a very large dataset for fine-grained emotions and develop
  * deep learning models on it. We achieve a new SOTA on
    24 fine-grained types of emotions (with an average accuracy of 87.58%). We
  * extend the task to model Robert Plutick’s 8 primary emotion dimensions,
    acquiring a superior accuracy of 95.68%.
     
# 1 Intro

* distant supervision (Mintz+ 2009, eg the use of hashtags as a surrogate)
  * we harness cues in Twitter data in the form of emotion hashtags
  * for emotion detection (Tanaka+ 2005; Mohammad, 2012;
    Purver and Battersby, 2012; Wang+ 2012; Pak and Paroubek, 2010; Yang+ 2007)
  * sentiment analysis (Read, 2005; Go+ 2009) and
  * sarcasm detection (González-Ibánez+ 2011)
  * In these works, authors successfully use emoticons and/or hashtags as marks
    * after performing varying degrees of data quality assurance
  * We take a similar approach, using a larger collection of tweets,
    richer emotion definitions, and stronger filtering for tweet quality
* contributions: 
  1. a large-scale, high quality dataset of tweets labeled with emotions. Key
    * methods to ensure data quality, 
    * Grounded in psychological theory of emotions
  1. we validate the data collection method using human annotations, 
  1. we develop powerful deep learning models using a gated recurrent network
     * new SOTA on 24 fine-grained types of emotions, and 
  1. we extend the task to model Plutick’s 8 primary emotion dimensions.

# 2 Related literature 

* distant supervision with Twitter data
  * Our work is similar to (Mohammad, 2012; Mohammad and Kiritchenko, 2015,
    Wang+ 2012), and Volkova and Bachrach, 2016) who use distant supervision to
  * Mohammad (2012): domain adaptation method to train a classifier on their
    * on the SemEval-2007 (Strapparava and Mihalcea, 2007) dataset.  As the
  * Wang+ (2012) randomly sample a set of 400 tweets from their data and
    human-label as relevant/irrelevant, as a way to verify the distant
    * since they are provided by the tweets’ writers, the emotion hashtags are
      more natural and reliable than the emotion labels traditionally assigned
      by annotators to data by a few annotators
    * since in the lab-condition method annotators need to infer the writers
      emotions from text, which may not be accurate.
  * Volkova and Bachrach, 2016) follow the same distant supervision approach
    * correlations of users’ emotional tone and the perceived demographics of
      these users’ social networks exploiting the emotion hashtag-labeled data
* fine-grained
  * EmoTweet (Yan+ 2016; Yan and Turtle 2016a,b) develop a dataset of 15,553
    tweets labeled with 28 emotion types and so target a fine-grained range as
    * human annotators under lab conditions to assign any emotion they feel is
      expressed in the data, allowing them to assign more than one emotion to a
      given tweet. A set of 28 chosen emotions was then decided upon and
      further annotations were performed using Amazon Mechanical Turk (AMT).
    * agreement of 0.50 Krippendorff’s alpha (α) between the lab/expert
      annotators, and an (α) of 0.28 between experts and AMT workers. EmoTweet-
      * not high and
    * the set of assigned labels do not adhere to a specific theory of emotion.

## 2.2 Mood

* analyze and/or model mood in social media data
  * De Choudhury+ (2012) identify more than 200 moods frequent on Twitter as
    extracted from psychological literature and filtered by AMT workers. They
    then collect tweets which have one of the moods in their mood lexicon in
    the form of a hashtag. To verify the quality of the mood data, the authors
    run AMT studies where they ask workers whether a tweet displayed the
    respective mood hashtag or not and find that
    * in 83% of the cases hashtagged moods at the end of posts did capture
      users’ moods, whereas for posts with mood hashtags anywhere in the tweet,
      only 58% of the cases capture the mood of users. Although they did not
      build models for mood detection, the annotation studies (De Choudhury+
      2012) perform further support our specific use of hashtags to label
      emotions
  * Mishne and De Rijke (2006) collect user-labeled mood from blog post text on
    LiveJournal and exploit them for predicting the intensity of moods over a
    time span rather than at the post level
  * Nguyen (2010) builds models to infer patterns of moods in a large
    collection of LiveJournal posts
  * Some of the moods in these LiveJournal studies (eg hungry, cold), would not
    fit any psychological theory (De Choudhury+ 2011) 

# 3 Data collection 

## 3.1 Collection of a Large-Scale Dataset

* we developed a list of hashtags representing each of the 24 emotions proposed
  by Plutchik, (1980, 1985, 1994)
  * Plutchik (2001) organizes emotions in a three-dimensional circumplex, fig 1
    * analogous to the colors on a color wheel.  The cone’s
    * vertical dimension represents intensity, and the 3 circle represent
      degrees of similarity
    * eight sectors: eight primary emotion dimensions
      arranged as four pairs of opposites
    * primary emotion dyads = mixtures of two of the primary emotions). For
* we exclude the dyads in the exploded model from our treatment
  * For simplicity, we refer to the circles as
  * plutchik-1: with the emotions
    {admiration, amazement, ecstasy, grief, loathing, rage, terror, vigilance}
  * plutchik-2: with the emotions
    {joy, trust, fear, surprise, sadness, disgust, anger, anticipation}, and
  * plutchik-3: with the emotions {acceptance, annoyance, apprehension,
    boredom, distraction, interest, pensiveness, serenity}
* For each emotion type, we prepared a seed set of hashtags
  * We used Google synonyms and other online dictionaries and thesauri (eg
    www.thesaurus.com) to expand the initial seed set of each emotion. We
    acquire a total of 665 emotion hashtags across the 24 emotion types. For
    example, for the joy emotion, a subset of the seeds in our expanded set is
    {“happy”, “happiness”, “joy”, “joyful”, “joyfully”, “delighted”, “feel-
    ingsunny”, “blithe”, “beatific”, “exhilarated”, “blissful”, “walkingonair”,
    “jubilant”}. We then used the expanded set to extract tweets with hash-
    tags from the set from a number of massive-scale in-house Twitter datasets.
    We also used Twitter API to crawl Twitter with hashtags from the expanded
    set.  Using this method, we were able to acquire a dataset of about 1/4
    billion tweets covering an extended time span from July 2009 till January
    2017.

# 4 The annotation study we performed to validate our distant supervision meth

# 5 Our methods 

# 6 Results 

# 7 Comparisons to Other Systems

* We compare our results on the 8 basic emotions to the literature, tab 6
  * our system is 4.53% (acc) higher than the best (Volkova and Bachrach, 2016)
  * we have an order of magnitude more training data.  As shown in
* Table 7, we also apply (Volkova and Bachrach, 2016)’s pre-trained model on
  our test set of the 6 emotions they predict (which belong to plutchik-2), and
  acquire an overall accuracy of 26.95%, which is significantly lower than
  our accuracy.

# 8 Conclusion
