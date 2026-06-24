Perceived and Intended Sarcasm Detection with Graph Attention Networks 
Joan Plepi, Lucie Flek
W-NUT 2021 Proceedings of the Seventh Workshop on Noisy User-generated Text 

# Abstract

* Existing sarcasm detection systems focus on exploiting linguistic markers,
  context, or user-level priors. However, 
* hE social studies suggest that 
  the relationship between the author and the audience can be equally relevant
* we propose a framework jointly leveraging 
  * a user context from their historical tweets together with 
  * the social information from a user’s conversational neighborhood in an
    interaction graph, to contextualize the interpretation of the post. 
* We use graph attention networks (GAT) over users and tweets in a conversation
  thread, combined with dense user history representations.
* SOTA results on the recently published
      dataset of 19k Twitter users with 30K labeled tweets, adding 10M unlabeled
      tweets as context, our results indicate that the model contributes to
      interpreting the sarcastic intentions of an author more than to predicting
      the sarcasm perception by others.
