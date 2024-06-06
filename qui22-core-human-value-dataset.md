    VALUE NET: A New Dataset for Human Value Driven Dialogue System
    Liang Qiu, Yizhou Zhao, Jinchao Li, Pan Lu, Baolin Peng, Jianfeng Gao,
      Song-Chun Zhu
    AAAI 2022 Conference on Artificial Intelligence (AAAI-22)

https://liang-qiu.github.io/ValueNet/

# Abstract

* socially intelligent agent involves speaking guided by its value like a human
  * hE value-driven chatbots are still understudied in dialogue systems.
  * Most existing datasets focus on
    commonsense reasoning or social norm modeling. In this work
* we present 
  * a new large-scale human value dataset called ValueNet, which
    * human attitudes on 21,374 text scenarios.
    * ten dimensions that conform to the basic human value theory in
      intercultural research. We further develop 
  * a Transformer-based value regression model on ValueNet
    to learn the utility distribution.
* Comprehensive empirical results show that the learned value model could
  benefit a wide range of dialogue tasks. For example, 
  * eg by teaching a generative agent with reinforcement learning and the
    rewards from the value model, our method attains
    SOTA performance on the Persona-Chat personalized dialog generation dataset
  * With values as additional features, existing
    emotion recognition models enable capturing rich human emotions in context,
    * further improves the empathetic response generation performance in the
      Empathetic Dialogues dataset.
* ValueNet is the first largescale text dataset for human value modeling, and
  we are the first one trying to incorporate a value model into emotionally
  intelligent dialogue systems
