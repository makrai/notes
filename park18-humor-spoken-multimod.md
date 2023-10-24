Laughbot: Detecting Humor in Spoken Language with Language and Audio Cues
Kate Park, Annie Hu, Natalie Muenster
Future of Information and Communication Conference (FICC) 2018 5-6 April

# Abstract

* We propose detecting and responding to humor in spoken dialogue by extracting
  language and audio cues and subsequently feeding these features into a
  combined recurrent neural network (RNN) and logistic regression model
* we build a corpus from the Switchboard phone conversations
  * punchlines and unfunny lines where punchlines precede laughter tokens
* combined RNN and logistic regression model 
  * uses both acoustic and language cues to predict whether a conversational
    agent should respond to an utterance with laughter
* F1-score of 63.2 and accuracy of 73.9
  * outperforms 
    * our logistic language model (F1-score 56.6) and
      * RNN acoustic model (59.4) as well as 
    * the final RNN model of D Bertero, 2016 (52.9)
