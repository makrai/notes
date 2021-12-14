Predicting trends in the quality of state-of-the-art neural networks
  without access to training or testing data 
Charles H. Martin, Tongsu (Serena) Peng & Michael W. Mahoney 
Nature Communications volume 12, Article number: 4122 (2021)

# Abstract

* neural network models trained by someone else. For such pretrained models,
  one may not have access to training data or test data. Moreover, one may not
  know details about the model, e.g., the specifics of the training data, the
  loss function, the hyperparameter values, etc. Given one or many pretrained
* say anything about the expected performance or quality of the models. Here,
* we: a detailed meta-anal of hundreds of publicly available pretrained models.
  * norm-based capacity control metrics as well as power law based metrics from
    the recently-developed Theory of Heavy-Tailed Self Regularization. We find
* norm based metrics
  * correlate well with reported test accuracies for well-trained models, but
  * often cannot distinguish well-trained versus poorly trained models. We also
* power law based metrics can do much better
  * quantitatively better at discriminating among series of well-trained models
    with a given architecture
  * qualitatively better at discriminating well-trained versus poorly trained
* These methods can be used to identify when a pretrained neural network has
  problems that cannot be detected simply by examining training/test accuracies
