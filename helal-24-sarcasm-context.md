A contextual-based approach for sarcasm detection
Nivin A Helal, Ahmed Hassan, Nagwa L Badr, & Yasmine M Afify
Scientific Reports volume 14, Article number: 15415 (2024)

# Abstract

* we experimented summarizing the context into a concise short sentence
  * This reduced training time by 35.5%
* exper on the News headlines dataset against the Reddit dataset, which resulted
  in 49% F1 score without context data
  * nL, with the inclusion of context data, the F1 score surged to 75%
* motivation: sentiment analysis and better decision-making

# 3 Proposed approach

## 3.3 Preprocessing module (Fig 3)

* conversion of contextual conversations into summarized forms to generalize
  * a model known as `MEETING_SUMMARY` (Neelamohan) constructed with Bart-large,
