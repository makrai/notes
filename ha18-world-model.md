David Ha, Jürgen Schmidhuber
World Models
2018

# 1 Intro

* schmidhuberezés
  * reinforcement learning (RL)
    (Kaelbling et al., 1996; Sutton & Barto, 1998; Wiering & van Otterlo, 2012)
    * artificial agent also benefits from having ... a good predictive model of
      the future (Werbos, 1987; Silver, 2017)
  * recurrent neural network (RNN) (Schmidhuber, 1990a;b; 1991a)
  * backpropagation algorithm (Linnainmaa, 1970; Kelley, 1960; Werbos, 1982)
* world + controller. We ... train
  * a large neural network to learn a model of the agent’s world in an
    unsupervised manner, and then train
  * the smaller controller model to learn to perform a task using this world
    model. A small controller lets the training algorithm focus on the credit
    assignment problem on a small search space, while not sacrificing capacity
    and expressiveness via the larger world model
