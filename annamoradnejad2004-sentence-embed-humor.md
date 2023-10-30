ColBERT: Using BERT Sentence Embedding in Parallel Neural Networks
  for Computational Humor
Issa Annamoradnejad, Gohar Zoghi
arXiv:2004.12765 [cs.CL]

https://github.com/Moradnejad/ColBERT-Using-BERT-Sentence-Embedding-for-Humor-Detection

* we detect and rate humor in short texts
  based on a popular linguistic theory of humor
* sentence embeddings are fed to separate lines of hidden layers
  (one line for each sentence) to extract latent features
  * At last, the parallel lines are concatenated to determine the congruity and
    other relationships between the sentences and predict the target value
* a novel dataset for humor detection consisting of 200,000 formal short texts
* we participated in a live ML competition on rating humor in Spanish tweets
  * F1 scores of 0.982 and 0.869 in the humor detection experiments which
    outperform general and SOTA models
  * two contrasting settings confirm the strength and robustness of the model
* two important factors in achieving high accuracy in the current task
  * usage of sentence embeddings and
  * utilizing the linguistic structure of humor in designing the proposed model

# IV. Proposed method

* From a technical viewpoint, we are proposing a supervised binary classifier
  that takes a string as input and determines if the given text is humorous

## A. Humor Structure

* works in linguistics of humor classify jokes into various categories based on
  their structure or content. Many believed that humor arises from the sudden
  transformation of an expectation into nothing [23].

* main theories on the structure of a joke involves two or three stages of
  storytelling that concludes with a punchline [24], [25]
  * Punchline is the last part of a joke that destroys the perceiver’s previous
    expectations and bring humor for its incongruity.

* Raskin [26] presented Semantic Script Theory of Humor (SSTH), 
  * a detailed formal semantic theory of humor. The SSTH has the necessary
  * text has to have two distinct related scripts that are opposite in nature,
    such as real/unreal, possible/impossible.  For example, let us review a
