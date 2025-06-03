Know What You Don’t Know: Unanswerable Questions for SQuAD
Pranav Rajpurkar, Robin Jia, Percy Liang
ACL 2018

# Abstract

* Extractive reading comprehension systems can often locate the correct answer
  * hE unreliable guesses on questions for which the correct answer is not stat
  * Existing datasets either focus exclusively on answerable questions, or use
    automatically generated unanswerable questions that are easy to identify.
* we present SQuADRUn, a new dataset that
  * combines the existing Stanford Question Answering Dataset (SQuAD) with over
    50,000 unanswerable questions written adversarially by crowdworkers to look
  * systems must not only answer questions when possible, but also determine
    when no answer is supported by the paragraph and abstain from answering.
  * challenging for existing models
    * a strong neural system that gets 86% F1 on SQuAD achieves only 66% F1
