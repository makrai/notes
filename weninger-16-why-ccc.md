Discriminatively Trained Recurrent Neural Networks
  for Continuous Dimensional Emotion Recognition from Audio
Felix Weninger, Fabien Ringeval, Erik Marchi, Björn Schuller
IJCAI-16

# Abstract

* Continuous dimensional emotion recognition from audio is 
  a sequential regression problem, where the goal is to 
  maximize correlation between sequences of regression outputs and
  continuous-valued emotion contours, _while 
  minimizing the average deviation_. (emph by Makrai)
* deep neural networks trained on simple acoustic features achieve good
  performance on this task. Yet, 
* hE the usual squared error objective functions for neural network training
  do not fully take into account the above-named goal. Hence, in this paper 
* we introduce a "technique" for the discriminative training of neural networks
  * concordance correlation coefficient as cost function, which 
    * unites both correlation and mean squared error in a single differentiable
* Results on the MediaEval 2013 and AV+EC 2015 Challenge data sets show that the
  proposed method can significantly improve the evaluation criteria compared
  to standard mean squared error training, both in the music and speech
  domains.

# 3 

CCC = 2 Cov(x,y) / (Var(x)+ Var(y)+ (Mean(x)Mean(y))^2)

## 5.3 Results

* Table 2 shows the results on the MediaEval 2013 test set (music).
* Table 3 we report the metrics on the RECOLA database (speech). Here, we
  * a significant improvement in the CC, CCC and E{CCC} metrics by using the
    ⌃CCC objective function, particularly on the test set, where SSE training
