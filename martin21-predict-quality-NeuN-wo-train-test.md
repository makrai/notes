Predicting trends in the quality of SOTA neural networks
  without access to training or testing data
Charles H. Martin, Tongsu (Serena) Peng & Michael W. Mahoney
Nature Communications volume 12, Article number: 4122 (2021)

# Abstract

* neural network models trained by someone else. For such pretrained models,
  * no access to training data or test data. Moreover,
  * one may not know details about the model, e.g., the specifics of the
    training data, the loss function, the hyperparameter values, how reguled
* say anything about the expected performance or quality of the models
* we: a detailed meta-anal of hundreds of publicly available pretrained models
  * norm-based capacity control metrics as well as power law based metrics from
    the recently-developed Theory of Heavy-Tailed Self Regularization
* norm based metrics
  * correlate well with reported test accuracies for well-trained models, but
  * often cannot distinguish well-trained versus poorly trained models
* power law based metrics can do much better
  * quantitatively better at discriminating among series of well-trained models
    with a given architecture
  * qualitatively better at discriminating well-trained versus poorly trained
* These methods can be used to identify when a pretrained neural network has
  problems that cannot be detected simply by examining training/test accuracies

# [Intro] A common problem in machine learning (ML) is to evaluate the quality

* training/testing curves give very limited insight into the overall properties
  * not take into account the (often large human and CPU/GPU) time for
    hyperparameter ﬁddling; they typically do 
  * not correlate with robustness or fairness or interpretability; and so on. A
  * when the model user is not the model developer.  Then, one may not have
    * no access to the training data or the testing data.  Instead, one may
    * use it as-is, or to ﬁne-tune and/or compress it and then use it.
* need for a practical theory to guide that practice
  * Moreover, ML as an industrial process will become compartmentalized in
    order to scale: some groups will gather data/develop models/use the models
* no obvious way to deﬁne an ideal test metric
  * for many large scale, practical applications
  * For example, models that generate fake text or conversational chatbots may
    * cluster user proﬁles, which are widely used in areas such as marketing
* determining whether one has enough data for a given model. Indeed, high
* Methods that are developed and evaluated on any well-deﬁned publicly
  available corpus of data, no matter how large or diverse or interesting, are
  clearly not going to be well-suited to address problems such as this. It is
* examine the weight matrices of pretrained models, e.g., properties such as
  * norms of weight matrices and/or
    * have been used in traditional statistical learning theory to bound
      capacity and construct regularizers
  * parameters of Power Law (PL) ﬁts of the eigenvalues of weight matrices.
    * based on statistical mechanics approaches to deep neural networks (DNNs).
* we want to examine different models across common architecture series, and we
  want to compare models between different architectures 2 themselves. In both
* we consider a large suite of hundreds of publicly available models, mostly
  from computer vision (CV) and natural language processing (NLP). By now,
  there are many such SOTA models that are publicly available,
  e.g., hundreds of pretrained models in CV (≥500) and NLP (≈100). (When we
  began this work in 2018, there were fewer than tens of such models; then in
  * in a year or two there will be an order of magnitude or more models.) For
* main results. 
  * norm-based metrics do a reasonably good job at predicting quality trends in
    welltrained CV/NLP models. 
  * norm-based metrics may give spurious results when applied to poorly trained
    models (e.g., models trained without enough data, etc.). 
    * e.g. they may exhibit what we call Scale Collapse for these models. 
  * PLbased metrics can do much better at predicting quality trends in
    pretrained CV/NLP models.  In particular,
    * a weighted PL exponent (weighted by the log of the spectral norm of the
      corresponding layer) is quantitatively better at discriminating among a
      series of well-trained versus very-well-trained models within a given
      architecture series; and
    * the (unweighted) average PL exponent is qualitatively better at
      discriminating well-trained versus poorly-trained models. 
  * PL-based metrics can also be used to
    * characterize ﬁne-scale model properties, including what we call
      layer-wise Correlation Flow, in well-trained and poorly-trained models;
    * evaluate model enhancements (e.g., distillation, ﬁne-tuning, etc.). Our
  * a theoretically principled empirical evaluation—by far the largest, most
    detailed, and most comprehensive to date—and the theory we apply was
    developed previously 1–3
    * such a meta-analysis is common in certain areas, but it is
      quite rare in ML, where the emphasis is on develing better train protocs
