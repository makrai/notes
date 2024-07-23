SemEval-2019 Task 3: EmoContext Contextual Emotion Detection in Text
Ankush Chatterjee, Kedhar Nath Narahari, Meghana Joshi, Puneet Agrawal
SemEval 2019 Minneapolis, Minnesota, USA

# Abstract

* the SemEval-2019 Task 3 - EmoContext: Contextual Emotion Detection in Text
* contextual emo
  * Lack of facial expressions and voice modulations make detecting emotions in
  * eg “Why don’t you ever text me!” can either be sad or angry
  * the context of dialogue can prove helpful in detection of the emotion. In
* dataset
  * given a textual dialogue ie an utterance along with two previous turns of
    context, the goal was to infer the underlying emotion of the utterance by
  * choosing from four emotion classes - Happy, Sad, Angry and Others. To
  * textual dialogues from user interaction with a conversational agent
  * annotated for emotion classes after several data processing steps. A
  * training data set of 30160 dialogues, and two evaluation data sets, Test1
    and Test2, containing 2755 and 5509 dialogues respectively were released to
* 311 teams made submissions to this task. The final leader-board was evaluated
  * the highest ranked submission achieved 79.59 micro-averaged F1 score
* analysis of systems submitted to the task indicate that
  * Bi-directional LSTM was the most common choice of neural architecture used,
  * most of the systems had the best performance for the Sad emotion class, and
    * worst for the Happy emotion class
