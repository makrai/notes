# https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277

* sampling runs into a problem: if we have 50K possible choices, even if the
  bottom 25K tokens are each extremely unlikely, in aggregate they might have
  for example 30% of the probability mass. This means with each sample, we have
  a 1 in 3 chance of completely derailing our “train of thought"
* To combat sampling from the tail, the most popular methods are
  temperature and top k sampling

## Temperature sampling is inspired by statistical thermodynamics, where

* high temperature means low energy states are more likely encountered
* logits play the role of energy
* temperature sampling by dividing logits by the temperature before softmax
* Lower temperatures make the model increasingly confident in its top choices,
  while temperatures greater than 1 decrease confidence
  * 0 temperature is equivalent to argmax/max likelihood, while
  * infinite temperature corresponds to a uniform sampling

## Top k sampling

* But in some/other cases, there really are/n't many words we could sample from
  reasonably (broad/narrow distribution below)
* To address this problem, the authors propose top p sampling, aka nucleus samp,
  * e.g. top_p = .9
  * In the narrow distribution, we may already exceed top_p = .9 with just “hot”
    and “warm” in our sample distribution

## Why doesn’t maximum likelihood sampling work?

* In the training process, there’s never a chance to see compounding errors
* The model is trained to predict the next token based on a gold context
* If it gets one token wrong by generating a bad distribution, the next token
  uses the “correct” human generated context independent of the last prediction
* During generation it is forced to complete its own automatically-generated
  context, a setting it has not considered during training

# Beyond the paper: choosing p and k automatically

* use top_k and top_p to maximize the probability of choosing the actual next
  word we’ve held out. When searching for the optimal k and p values, it’s
* for a given sample
  * For k, we find the sorted index where the “golden” token occurred
  * For p, we find the CDF of the golden token
* Across many examples, we can compute a histogram of optimal p and k values and
  compute summary statistics on them. I tested on a random section of Wikipedia
* If the model were being evaluated on its training set, it would be optimal to
  choose top_k = 1. But since the model is slightly out of domain, the most

# Future work: Fixing training

* changing the training objective to better match the generation task
  * discriminator to punish the model when it generates whole sequences that
    don’t look human? It’s not straightforward how to apply a GAN architecture
  * Adversarial Text Generation without Reinforcement Learning and an RL-based
    idea, but it seems these have not yet become mainstream
  * apply these ideas to the big transformers that have swept SOTA in the last
    few months
