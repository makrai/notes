Beyond black & white: 
  Leveraging annotator disagreement via soft-label multi-task learning
Fornaciari, T., Uma, A., Paun, S., Plank, B., Hovy, D., & Poesio, M
NAACL 2021

* we use soft labels (i.e., probability distributions over the annotator labels)
as an auxiliary task in a multi-task neural network
* We measure the divergence between the predictions and the target soft
  labels with 
  several loss-functions and 
  evaluate the models on various NLP tasks. We find that the soft-label
* discuss: reduces the penalty for errors on ambiguous entities and thereby
  mitigates overfitting. It significantly improves performance across tasks
  beyond the standard approach and prior work

# 1 Intro

* instances can be intrinsically ambiguous (Poesio and Artstein, 2005; Zeman,
  2010; Plank+ 2014; Pavlick and Kwiatkowski, 2019), 
  or so challenging to evaluate that 
  considerable disagreement between different annotators is unavoidable. In
* wonder whether the ambiguity is indeed harmful to the models 
  or whether it carries valuable information about the relative difficulty of
  each instance (Aroyo and Welty, 2015). Several authors followed that
* ways to incorporate the information about the level of annotator agreement
  in their models (Sheng+ 2008; Plank+ 2014, 2016; Jamison and Gurevych, 2015;
  Rodrigues and Pereira, 2018; Lalor+ 2017)
* Deep Learning models compute the error as the divergence between the
  predicted label distribution and a one-hot encoded gold distribution (i.e.,
  nothing but the gold label has any probability mass). However, for complex
  * not plausible and can lead to overfitting. Instead, we can use 
  * a more nuanced notion of truth by comparing against soft labels: we
    * the probability distributions over the labels given by the annotators,
      rather than using one-hot encodings with a single correct label. To
* divergence measure between probability distributions, we can use well-known
  * Kullback-Leibler divergence (Kullback and Leibler, 1951), the
  * Jensen-Shannon divergence (Lin, 1991), and the Cross-Entropy, which is
    also used to quantify the error with one-hot encoded labels. 
  * we propose a standard and an inverse version of the 
    KL-divergence and CrossEntropy
* hE lack of universally accepted performance metrics to evaluate the
  divergence between probability distributions. (
  * Most metrics lack an upper bound, making it difficult to assess prediction
* Usually, annotations are incorporated into the models without soft labels
  (Plank+ 2014; Rodrigues and Pereira, 2018). 
* Where soft labels are used, they are variously filtered according to their
  distance from the correct labels and then used to weight the training
  instances rather than as prediction targets. These models still predict only
  true labels (Jamison and Gurevych, 2015)
* we use MultiTask Learning (MTL) to predict a probability distribution over
  * main task of predicting standard gold labels and the 
  * novel auxiliary task of predicting the soft label distributions. Due to
* it is difficult to interpret soft-label performance 
  ~> we do not directly predicted prob distris
* the MTL framework allows us to indirectly evaluate its effect on the main
  task. Exploiting the standard metrics for gold labels, we can also compare
  the effect of different loss functions for the soft label task. In
* Jamison and Gurevych (2015), filtering and weighting the training instances
  according to soft labels did not lead to consistent performance
  improvements. In contrast, we find that the information carried by MTL soft
* on several NLP tasks

# 2 MTL with three loss functions

* The KLdivergence is a natural choice to measure the difference between
  the prediction distribution Q and the distribution of soft labels P 
  * standard KL-divergence is: D_KL (P‖Q) = \sum Pi log2 Pi/Qi
    * encourages a wide Q, because if the model overestimates the regions of
      small mass from P it will be heavily penalised. The 
    * inverse KL-divergence is: D_KL (Q‖P)
      * This measures the divergence from P to Q and encourages a narrow Q
        distribution because the model will try to allocate mass to Q in all
        the places where P has mass; otherwise, it will get a strong penalty
* we use the auxiliary task to reduce overfitting on the main task, 
  ~> we expect equation 2 to be more effective 
  because it encourages the model to learn a distribution that
  pays attention to the classes where the annotations possibly agree
* A third option is to directly apply Cross-Entropy
  * derived from KL-divergence, the entropy of P added to the KL-divergence: ␒
    H(P ‖Q) = H(P ) + P (i) log2 Pi/Qi
  * regular KL-divergence and CrossEntropy tend to lead to the same
    performance
  * For completeness, we report the results of CrossEntropy as well
* overall loss of the main and of the auxiliary task: sum
  * no normalization method to the two losses, as unnecessary. We use
  * LogSoftmax activation function for the main task, which is a standard
    choice for one-hot encoded labels, and 
  * auxiliary
    * standard Softmax for the auxiliary task. Against the distributions of
      gold (one-hot encoded) and soft labels, both summing up to one, the
      errors are on the same scale
    * We also derive the soft labels using the Softmax function, which
      prevents the probability of the single labels from falling to zero

# 3 Methods

* evaluation on two NLP tasks: POS tagging and morphological stemming. We use
  * data sets (sufficiently large to train a neural model)
    * POS: Plank+ (2014) and 
    * morphological: Jamison and Gurevych (2015)
  * both one-hot (gold) and probabilistic (soft) labels (i.e., distributions
    over labels annotations) are available.  The code for all models in this

## 4.1

* The MTL models significantly outperform the STL ones, and in most cases,
  the previous state-of-the-art as well. We evaluate STL and MTL’s
  * significance via bootstrap sampling, 
    following Berg-Kirkpatrick+ (2012); Søgaard+ (2014)
    
## 4.2 Silver standard and soft labels

* Since we did not create the corpora that we use in our experiments, 
  we do not know the details of the gold labels’ creation process. However, 
* nL we verified that the gold labels do not correspond to the classes
  resulting from the majority voting of the annotations used for the soft
* ~> the MTL models exploit an additional source of information that is not
* ? is the extra info the reason for the MTL’s success 
* We ran a set of experiments where the main task was trained on the majority
  voting (silver) labels from the annotations, rather than on the gold labels
  * test still performed on the gold labels. In these conditions, 
  * both tasks rely on the same source of (imperfect) information, so MTL has
* tab 2: overall performance drops compared to the results of Table 1, Table 2
* the MTL models still maintain a significant advantage over the STL ones. As

# 5 Error analysis

* To gain further insights about their contributions, we inspect the soft
  labels’ probability distributions, comparing the predictions of STL and MTL
  models

* for the POS and the stemming tasks, and for each kind of loss function in
  the MTL models. In particular, we consider 
* four-conditions of the predictions: 
  1. where both STL and MTL gave the correct answer, 
  2. where both gave the wrong answer, 
  3. where STL was correct and MTL incorrect, and 
  4. where MTL was correct and STL incorrect (see confusion matrix in Table 3)
* For each of these categories, we compute the relative kurtosis of the soft
  labels. We choose this measure as it 
  * kurtosis describes how uniform the probability distribution is: whether
    the annotators agree on a single class, or whether they disperse their
    votes among different classes
* results
  * Not surprisingly, we find 
    the highest average kurtosis where both STL and MTL models give the
    correct prediction. Both kinds of models find it easier to predict the
    instances that are also unambiguous for the annotators. 
  * The opposite holds as well: 
    the instances where both MTL and STL models are wrong show the
    lowest mean kurtosis
* More interesting is the outcome where 
  MTL models are correct and STL wrong, and vice-versa
  * the average kurtosis lies between the two previous extremes. Also, we
  * a consistent trend across data sets and MTL loss-functions: 
  * the instances where only the MTL models are correct show
    a slightly higher kurtosis than
    those instances where only the STL models give the right answer
  * To measure the significance of this trend, we apply the Mann-Whitney
    rank test (Mann and Whitney, 1947). We use a non-parametric test because
    the kurtoses’ distribution is not normal. We find 
  * two significant results: 
    * Cross-Entropy as MTL loss-function in the POS data set, tab 3
    * with the KL inverse on the Stemming data set. We report the POS results
  * suggests that, when dealing with ambiguous cases, the soft labels tend to
    provide a qualified hint. It is training the models to predict the classes
    that seem to be the most probable for the annotators

# 6 Rel work

## annotation disagreement. One line focuses on the 

* aggregation of multiple annotations before model training. Seminal
  * Dawid and Skene (1979), who proposed an ExpectationMaximization (EM)
    based aggregation model. 
    * This model has since influenced a large body of work on annotation
      aggregation, and modeling annotator competence 
      (Carpenter+ 2009; Hovy+ 2013; Raykar+ 2010; Paun+ 2018; Ruiz+ 2019).
    * In our experiments on POS-tagging, we evaluated the possibility of
      testing Dawid-Skene labels rather than Majority Voting, finding that the
      performance of the two against the gold standard was mostly the same.
  * evaluate the annotators’ expertise 
    (Dawid and Skene, 1979; Raykar+ 2010; Hovy+ 2013; Ruiz+ 2019)
  * just penalize disagreement (Pan+ 2019).
* filtering out presumably low quality data to train on the remaining data
  (Beigman Klebanov and Beigman, 2014; Jamison and Gurevych, 2015). the
  * filtering strategies require an effective filtering threshold, which is
    non-trivial; relying only on high-agreement cases also results in worse
    performance (Jamison and Gurevych, 2015). Some
  * treat disagreement as a corruption of a theoretical gold standard
    (Goldberger and Ben-Reuven, 2016; Han+ 2018b,a) 
  * the robustness of machine learning models is affected by the data
    annotation quality, reducing noisy labels generally improves the models’
    performance
  * The closest to our work are the studies of Cohn and Specia (2013) and
    Rodrigues and Pereira (2018), who both use MTL. In contrast to our
    * each of their tasks represents an annotator
      * We instead propose to learn from both the gold labels and the
        distribution over multiple annotators, which we treat as soft label
        distributions in a single auxiliary task.
      * our approach requires fewer output nodes, which reduces the number of
  * the only study that directly uses soft labels is the one by Lalor+ (2017).
    * soft labels are available only for a subset of the data
    * they use them to fine-tune STL networks. Despite this methodological
    * their findings support that soft labels carry signal rather than noise.

## Regularization methods for neural networks. Among them, 

* label smoothing (Pereyra+ 2017) penalizes the cases of over-confident
  network predictions. Both label smoothing and soft labels reduce overfitting
  regulating the loss size.
  * relies on the gold labels’ distribution, 
  * not accounting for the instances’ inherent ambiguity, while 
  * soft labels selectively train the models to reduce the confidence when
    dealing with unclear cases, not affecting the prediction of clear cases.
* annotator biases (Shah+ 2020; Sap+ 2019; Hovy and Yang, 2021), and our

# 7 Conclusion

We propose a new method for leveraging instance ambiguity, as expressed by the
probability distribution over label annotations. We set up 
MTL models to predict this label distribution as an auxiliary task in addition
to the standard classification task. This setup allows us to 
incorporate uncertainty about the instances’ class membership into the model.
Across two NLP tasks, three data sets, and three loss functions, we always
find that our method significantly improves over the STL performance.
While the performance difference between the loss functions is not
significant, we find that the inverse version of KL gives the best results in
all the experimental conditions but one. This finding supports our idea of
emphasizing the coders’ disagreement during training. We conjecture that
predicting the soft labels acts as a regularizer, reducing overfitting. That
effect is especially likely for ambiguous instances, where annotators’ label
distributions differ especially strongly from one-hot encoded gold labels.
We would like to thank the various reviewers who suggested valuable edits.
