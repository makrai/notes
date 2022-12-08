Predicting trends in the quality of SOTA neural networks
  without access to training or testing data
Charles H. Martin, Tongsu (Serena) Peng, & Michael W. Mahoney
Nature Communications volume 12, Article number: 4122 (2021)

https://github.com/CalculatedContent/ww-trends-2020

# Abstract

* neural network models (pre)trained by someone else
  * no access to training data or test data
  * one may not know details about the model, eg the specifics of the training
    data, the loss function, the hyperparameter values, how regularized
* say something about the expected performance or quality of the models
* we: a detailed meta-anal of hundreds of publicly available pretrained models
  * norm-based capacity control metrics as well as power law based metrics
    from the recently-developed Theory of Heavy-Tailed Self Regularization
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
  * not take into account the time for hyperparameter ﬁddling
    * often large human and CPU/GPU time
  * not correlate with robustness, fairness or interpretability
  * when the model user is not the model developer
    * no access to the training data or the testing data
    * use it as-is, or to ﬁne-tune and/or compress it and then use it
* need for a practical theory to guide that practice
  * ML as an industrial proc will become compartmentalized in order to scale:
    some/other groups gather data/develop models/use the models
* no obvious way to deﬁne an ideal test metric
  * for many large scale, practical applications
  * For example, models that generate fake text or conversational chatbots
    * cluster user proﬁles, which are widely used in areas such as marketing
* determining whether one has enough data for a given model
* Methods that are developed and evaluated on any well-deﬁned publicly
  available corpus of data, no matter how large, diverse or interesting, are
  clearly not going to be well-suited to address problems such as this
* examine the weight matrices of pretrained models, properties eg
  * norms of weight matrices and/or
    * have been used in traditional statistical learning theory
      to bound capacity and construct regularizers
  * parameters of Power Law (PL) ﬁts of the eigenvalues of weight matrices
    * based on statistical mechanics approaches to deep neural networks (DNNs)
* we want to compare ~
  * different models across common architecture series
  * models between different architectures themselves
* we consider hundreds of publicly available models,
  mostly from computer vision (CV) and natural language processing (NLP)
  * there are eg hundreds of pretrained models in CV (≥500) and NLP (≈100)
    (When we began this work in 2018, there were fewer than tens)
  * in a year or two there will be an order of magnitude or more models
* main results
  * norm-based metrics do a reasonably good job at predicting quality trends in
    well-trained CV/NLP models
  * norm-based metrics may give spurious results when applied to poorly trained
    models (eg models trained without enough data, etc.)
    * eg they may exhibit what we call Scale Collapse for these models
  * PL-based metrics can do much better at predicting quality trends in
    pretrained CV/NLP models
    * a weighted PL exponent
      (weighted by the log of the spectral norm of the corresponding layer) is
      quantitatively better at discriminating among a series of well-trained
      versus very-well-trained models within a given architecture series
    * the (unweighted) average PL exponent is qualitatively better at
      discriminating well-trained versus poorly-trained models
  * PL-based metrics can also be used to
    * characterize ﬁne-scale model properties, including what we call
      layer-wise Correlation Flow, in well-trained and poorly-trained models;
    * evaluate model enhancements (eg distillation, ﬁne-tuning, etc.)
  * a theoretically principled empirical evaluation
    * by far the largest, most detailed, and most comprehensive to date
    * the theory we apply was developed previously 1–3
    * such a meta-analysis is quite rare in ML,
      (ML emphasis is on develing better training protocols)

# Results 2

## Overall approach

* objective/optimization function (parameterized by W l s and b l s) for a DNN
  with L layers, and weight matrices W l and bias vectors b l, as the
  minimization of a general loss function L over the training data instances
  and labels, {x i ; y i } \in D
  * For a typical supervised classiﬁcation problem, the goal of training is to
    construct (or learn) W l and b l that capture correlations in the data, in
    the sense of solving
    argmin ∑ L(E DNN (x i ); y i )
    where the loss function L(; ) can take on a myriad of forms 4
* energy (or optimization) landscape function
  E DNN = f (x i ; W 1, ..., W L ; b 1, ..., b L ) (2)
  * For a trained model, the form of the function E DNN does not explicitly
    depend on the data (but it does explicitly depend on the weights and biass)
  * maps data instance vectors (x i values) to predictions (y i labels)
    * one can analyze the form of E DNN without any training or test data
* Test accuracies have been reported online for publicly available pretrained
  pyTorch models 5
  * These models have been trained and evaluated on labeled data {x i ; y i }
    \in D, using standard techniques
  * We do not have access to this data, and
    we have not trained any of the models ourselves
  * Our methodological approach is thus similar to a statistical meta-analysis,
    common in biomedical research, but uncommon in ML
  * Computations were performed with the publicly available WeightWatcher tool
    (version 0.2.7) 6.  To be fully reproducible, we only examine publicly
    available, pretrained models, and we provide all Jupyter and Google Colab
* Our approach involves analyzing individual DNN weight matrices, for fully
  connected and/or convolutional layers (depending on the architecture)
  * Each DNN layer contains one or more layer 2D N l × M l weight matrices W l,
    or pre-activation maps, W i,l, eg extracted from 2D Convolutional layers,
    where N > M. (We may drop the i and/or i, l subscripts below.)
  * The best performing quality metrics depend on the norms and/or spectral
    properties of each weight matrix, W, and/or, equivalently, it’s empirical
    correlation matrix, X = W T W
* metrics
  * Frobenius Norm: ||W|| 2 F = ||X|| F = ∑ λ i (3)
  * Spectral Norm:  ||W|| 2 \inf = ||X|| \inf = λ max (4)
  * Weighted Alpha: `α^ = α log λ_max` (5)
  * α-Norm (or α-Shatten Norm):
             ||W|| 2α 2α = ||X|| α α = ∑_{i=1..M}λ_i^α
* To perform diagnostics on potentially problematic DNNs, we will
  decompose α ^ into its two components, α and λ max
  * λ i is the i th eigenvalue of the X, λ max is the maximum eigenvalue, and
    α is the ﬁtted PL exponent
  * These eigenvalues are squares of the singular values σ i of W, λ i = σ 2 i
* All four metrics can be computed easily from DNN weight matrices
* The ﬁrst two metrics are well-known in ML
* The last two metrics deserve special mention, as they
  * depend on an empirical parameter α that is the PL exponent that arises in
    the recently developed Heavy Tailed Self Regularization (HT-SR) Theory 1–3
* In the HT-SR Theory, one analyzes the eigenvalue spectrum, ie the
  Empirical Spectral Density (ESD), of the associated correlation matrices 1–3
  * characterize the amount and form of correlation, and therefore implicit
    self-regularization, present in the DNN’s weight matrices
  * For each layer weight matrix W, of size N × M, construct the associated
    M × M (uncentered) correlation matrix X
    (Dropping the L and l, i indices)
  X = 1/N W^T W
  * the eigenvalue spectrum of X: λ i such that Xv i = λ i v i, then
  * the ESD of eigenvalues, ρ(λ), is just a histogram of the eigenvalues,
  * characterize the correlations in a weight matrix by examining its ESD,
  * ESD can be well-ﬁt to a truncated PL distribution, given as ρ(λ) ~ λ^{-α},
    * valid (at least) within a bounded range of eigenvalues λ ∈ [λ min, λ max]
* The original work on HT-SR Theory considered a small number of NNs,
  including AlexNet and InceptionV3. It showed that
  * for nearly every W, the (bulk and tail) of the ESDs can be ﬁt to a
    truncated PL, and that
  * PL exponents α nearly all lie within the range α ∈ (1.5, 5) (footnotes 1–3)
* the mechanism responsible for these properties,
  statistical physics offers several possibilities 8,9, eg
  self-organized criticality 10,11 or
  multiplicative noise in the stochastic optimization (training) algorithms
  * related techniques have been used to analyze
    correlations and information propogation in actual spiking neurons 14,15
  * Our meta-analysis does not require knowledge of mechanisms; and it is
  * not even clear that one mechanism is responsible for every case
* HT-SR Theory predicts that
  smaller values of α should correspond to models with better correlation over
  multiple size scales and thus to better models
* “size scale”
  * well-deﬁned in physical systems (the usual application)
  * less well-deﬁned in CV and NLP applications
  * Informally, it would correspond to
    * pixel groups that are at a greater distance in some metric, or between
    * sentence parts that are at a greater distance in text
  * smaller exponents α correspond to more implicit self-regularization and
    better generalization, and
  * we expect a linear correlation between α^ and model quality 1–3
* norm-based metrics for more mxs
  * we use the average of the log norm, to the appropriate power
  * Informally, this amounts to
    assuming that the layer weight matrices are statistically independent,
    => we can estimate the model complexity C, or test accuracy, with a
    standard Product Norm (which resembles a data dependent VC complexity),
             C ~ ||W 1|| \times ||W 2|| \times ... \times ||W L||
* log complexity,
  * log C ~ log ||W 1|| + log ||W 2|| + ... + log ||W L|| = ∑ log ||W l||  (9)
  * takes the form of an average Log Norm
  * For the Frobenius Norm metric and Spectral Norm metric, we can use Eq. (9)
    directly (since, when taking log|| W l|| 2 F, the 2 comes down and out)
* The Weighted Alpha metric is an average of α l over all layers l ∈ {1, …, l},
  weighted by the size, or scale, or each matrix,
  `α ^ = ∑ α l log λ max;l \approx <log|| X|| α α >`
  * correlate well with trends in reported test accuracies of pretrained DNNs,
    albeit on a much smaller and more limited set of models than we consider
* we introduce and evaluate the α-Shatten Norm metric,
  * ∑ log|| X l|| αl αl  = ∑ α l log ||X l|| α l:
  * α l varies from layer to layer, and so in Eq. (11) it cannot be taken out
    * For small α, the Weighted Alpha metric approximates the Log α-Shatten
* the Weighted Alpha and α-Shatten norm metrics often behave like an improved,
  weighted average Log Spectral Norm
* the average value of α, `α = 1/L ∑ α l = <α>`
  * worse for predicting trends in SOTA model series, eg as depth changes
  * nL can be used to perform model diagnostics,
    to identify problems that cannot be detected by examining training/test
    accuracies, and
    to discriminate poorly trained models from well-trained models
* determine α for a given layer by ﬁtting the ESD of that layer’s weight matrix
  to a truncated PL, using the commonly accepted Maximum Likelihood method
  * This method works very well for exponents between α ∈ (2, 4)
  * adequate, although imprecise, for smaller and especially larger α 18
  * Operationally, α is determined by using the WeightWatcher tool 6 to
    ﬁt the histogram of eigenvalues, ρ(λ), to a truncated PL,
    ρ(λ) ~ λ α ; λ \in [λ min ; λ max] (13)
    where λ max is the largest eigenvalue of X = W T W, and where
    λ min is selected automatically to yield the best PL ﬁt
    (best in the sense of minimizing the K-S distance)
* Each of these quantities is deﬁned for a given layer W matrix. See Fig. 1
* To avoid confusion, let us clarify the relationship between α and α^
  * We ﬁt the ESD of the correlation matrix X to a truncated PL,
    paramed by 2 values: the PL exponent α, and the maximum eigenvalue λ max
  * The PL exponent α measures the amount of correlation in a layer weight mx W
    * valid for λ ≤ λ max, and it is scale-invariant, ie it does
      not depend on the normalization of W or X
  * The λ max is a measure of the size, or scale, of W
  * Multiplying each α by the corresponding log λ max
    weighs “bigger” layers more, and
    averaging this product leads to a balanced, Weighted Alpha metric α ^
    for the entire DNN
  * We will see that for
    * well-trained CV and NLP models, α ^ performs quite well and as expected,
    * CV and NLP models that are potentially problematic or less well-trained,
      metrics that depend on the scale of the problem can perform anomalously
      * separating α^ into its two components, α and λ max, and
        examining the distributions of each, can be helpful

## Comparison of CV models, the VGG, ResNet, and DenseNet series of models

## Comparison of NLP Models 8

* Within the past few years, nearly 100 open source, pretrained NLP DNNs
  * based on the revolutionary Transformer architecture
  * variants of BERT, Transformer-XML, GPT, etc
  * Transformer architectures consist of blocks of so-called Attention layers,
    containing two large, Feed Forward (Linear) weight matrices 28
  * Attention matrices are signiﬁcantly larger. In contrast to smaller
    pre-Activation maps arising in Cond2D layers,
  * In general, they have larger PL exponents α
    * Based on HT-SR Theory (in particular, the interpretation of values of α ~
      2 as modeling systems with good correlations over many size scales 8,21),
      this suggests that these models
      * fail to capture successfully many of the info corr in the data
        (relative to their size) and thus
      * substantially under-trained
  * compared to CV models, modern NLP models have larger weight matrices and
    display different spectral properties
* While norm-based metrics perform reasonably well on well-trained NLP models,
  they often behave anomalously on poorly trained models. For such models,
  * weight matrices may display rank collapse, decreased Frobenius mass, or
    unusually small Spectral norms
  * This may be misinterpreted as “smaller is better”
  * Instead, it should probably be interpreted as being due to a similar
    mechanism to how distillation can “damage” otherwise good models
* PL-based metrics, including the Log α-Norm metric and the Weighted Alpha
  * more consistent behavior, even on less well-trained models
  * To help identify when architectures need repair and when more and/or better
    data are needed, one can use these metrics, as well as
    the decomposition of the Weighted Alpha metric (α log λ max) into its
    PL component (α) and its norm component (log λ max ), for each layer
* early variants of GPT and BERT, have weight matrices with
  unusually large PL exponents (eg α >> 6). This indicates these matrices may
  be under-correlated (ie over-parameterized, relative to the amount of data)
  * In this regime, the truncated PL ﬁt itself may not be very reliable because
    the Maximum Likelihood estimator it uses is unreliable in this 8 range
  * In this case, the speciﬁc α values returned by the truncated PL ﬁts are
    less reliable, but having large versus small α is reliable
  * If the ESD is visually examined, one can usually describe these W as in the
    BULK-DECAY or BULK+SPIKES phase from HT-ST Theory 1,2
  * 1,2 has conjectured that very well-trained DNNs would not have many outlier
    α >> 6. Consistent with this,
* more recent improved versions of GPT (shown below) and BERT (not shown)
  conﬁrm this
* The OpenAI GPT and GPT2 series of models
  * provide the opportunity to analyze two effects:
    * increasing the sizes of both the data set and the architectures
      simultaneously; and
    * training the same model with low-quality data versus high-quality data
  * can generate fake text that appears to the human to be real
  * media attention because of the potential for their misuse
  * => the original GPT model released by OpenAI was trained on deﬁcient data,
    rendering the model interesting but not fully functional
  * much improved model, GPT2-small, which has
    * same architecture and number of layers as GPT, but which has been
    * trained on a larger and better data set, making it
    * remarkably good at generating (near) human-quality fake text
  * Subsequent models in the GPT2 were larger and trained to more data
  * By comparing GPT2-small to GPT2-medium to GPT2-large to GPT2-xl, we can
    * examine the effect of increasing data set and model size simultaneously,
    * analyze well-trained versus very-well-trained models
  * By comparing the poorly trained GPT to the well-trained GPT2-small, we can
    identify empirical indicators for when
    a model has been poorly trained and thus may perform poorly when deployed
  * The GPT models we analyze are deployed with the HuggingFace PyTorch library
* We examine the performance of the four quality metrics
  (Log Frobenius norm, Log Spectral norm, Weighted Alpha, and Log α-Norm) for
  the OpenAI GPT and GPT2 pretrained models. See Table 2 for a summ of results
  * Comparing trends between GPT2-medium to GPT2-large to GPT2-xl, observe that
    (with one minor exception involving the log Frobenius norm metric)
    all four metrics decrease as one goes from medium to large to xl
  * ie the larger models indeed look better than the smaller models, as expectd
  * GPT2-small violates this general trend, but only very slightly
    * could be due to
      * under-optimization of the GPT2-small model, or since
      * it is the smallest of the GPT2 series, and the metrics we present are
        most relevant for models at scale
    * Aside from this minor discrepancy, overall for these well-trained models,
      all these metrics now behave as expected, ie there is
      no Scale Collapse and norms are decreasing with increasing accuracy
* Comparing trends between GPT and GPT2-small reveals a different story
  * all four metrics increase when going from GPT to GPT2-small
    * ie larger metrics for the higher-quality model
      (higher quality since GPT2-small was trained to better data) and
      smaller for the lower-quality model, when the number of layers is ﬁxed
  * This is unexpected
  * we can perform model diagnostics, by separating α ^ into its two components
    * α and λ max, and examining the distributions of each
    * => we see additional examples of Scale Collapse and
      additional evidence for Correlation Flow
* We next examine the Spectral norm in GPT versus GPT2-small. In Fig. 6a,
  * the poorly-trained GPT model has a smaller mean/median Spectral norm as
    well as, spuriously, many much smaller Spectral norms
  * violates the conventional wisdom that smaller Spectral norms are better
  * Because there are so many anomalously small Spectral norms, the
    GPT model appears to be exhibiting a kind of Scale Collapse,
    like that observed (in Fig. 5) for the distilled CV models
  * This demonstrates that, while the Spectral (or Frobenius) norm
    may correlate well with predicted test error,
    at least among reasonably well-trained models,
    it is not a good indicator of the overall model quality in general
    * Naïvely using it as an empirical quality metric may give spurious results
      when applied to poorly trained or otherwise deﬁcient models
* Figure 7a shows the Spectral norm as a function of depth (layer id)
  * two phenomena
  * the large value of Spectral norm (in Fig. 6a)
    corresponds to the ﬁrst embedding layer(s)
    * These layers have a different effective normalization => different scale
    * See Supplementary Note 2 for details
    * We do not include them in our computed average metrics in Table 2
  * for GPT, there seems to be two types of layers with
    very different Spectral norms
    (an effect which is seen, but to a much weaker extent, for GPT2-small)
    * attention models have two types of layers, small and large
      * and the Spectral norm (in particular, other norms do too) displays
        unusually small values for some of these layers for GPT
    * This Scale Collapse for the poorly trained GPT is
      similar to what we observed for the distilled ResNet20 model in Fig. 5b
    * suggest that scale-dependent norm metrics should not be directly applied
      to distinguish well-trained versus poorly trained models
* distribution of α values in GPT versus GPT2-small
  * Figure 6b shows the histogram (empirical density), for all layers
  * The older deﬁcient GPT has numerous unusually large α exponents
    * ie not well-described by a PL ﬁt
    * as expected: a poorly trained model will lack good (ie small α) PL
      behavior in many/most layers
  * nL the newer improved GPT2-small model has, on average, smaller α values
    than the older GPT, with all α ≤ 6 and with smaller mean/median α
    * far fewer unusually large outlying α values than GPT
  * From this (and other results not shown), we see that α from Eq. (12),
    provides a good quality metric for comparing the poorly trained GPT versus
    the well-trained GPT2-small
  * contrasted with the behavior displayed by scale-dependent metrics
    such as the Frobenius norm (not shown) and the Spectral norm
  * This also reveals why α ^ performs unusually in Table 2
  * The PL exponent α behaves as expected, and thus
    the scale-invariant α metric lets us identify potentl poorly trained models
  * It is the Scale Collapse that causes problems for α ^
    (recall that the scale enters into α ^ via the weights log λ max)
* Figure 7b plots α versus the depth (layer id) for each model
  * The deﬁcient GPT model displays two trends in α,
    one stable with α ~ 4, and
    one increasing with layer id, with α reaching as high as 12
  * the well-trained GPT2-small model shows consistent and stable patterns,
    again with
    one stable α ~ 3.5 (and below the GPT trend), and
    the other only slightly trending up, with α ≤ 6
  * ie the behavior of α across layers differs signiﬁcantly
    * the better GPT2-small looking more like the better ResNet-1K from Fig 4b
  * suggest that smaller more stable values of α across depth is beneﬁcial,
    ie that the Correlation Flow is also a useful concept for NLP models
* across series of increasingly improving GPT2 models
  (well-trained versus very-well-trained models),
  by examining both the PL exponent α as well as the Log Norm metrics
* Figure 8 shows the histograms over the layer weight matrices
  for ﬁtted PL exponent α and the Log Alpha Norm metric
  * In general, and as expected, as we move from GPT2-medium to GPT2-xl,
    histograms for both α exponents and the Log Norm metrics downshift
* From Fig. 8a, we see that `α^_`, the average α value, decreases with
  increasing model size
  (3.82 for GPT2-medium, 3.97 for GPT2-large, and 3.81 for GPT2-xl),
  although the differences are less noticeable
  between the differing well-trained versus very-well-trained GTP2 models
  than between the poorly trained versus well-trained GPT and GPT2-small models
  * Also, from Fig. 8b, we see that, unlike GPT, the
    layer Log Alpha Norms behave more as expected for GPT2 layers, with the
    larger models consistently having smaller norms
    (9.96 for GPT2-medium, 7.982 for GPT2-large, and 7.49 for GPT2-xl)
  * Similarly, the Log Spectral Norm also decreases on average with the larger
    models (2.58 for GPT2-medium, 1.99 for GPT2-large, and 1.92 for GPT2-xl)
  * As expected, the norm metrics can indeed distinguish
    among well-trained versus very-well-trained models
  * While the means and peaks of the α distributions are getting smaller,
    towards 2.0, as expected, Fig. 8a also shows that
    the tails of the α distributions shift right, with
    larger GPT2 models having more unusually large α values. This is unexpected
  * suggests that these larger GPT2 models are still
    under-optimized/over-parameterized
    (relative to the data on which they were trained) and that
    they have capacity to support datasets even larger than the recent XL 1.5B
  * not contradict recent theoretical work on the
    beneﬁts of over-parameterization (Belkin+ 2019)
    * eg since in practice these extremely large models are not fully optimized
    * Subsequent reﬁnements to these models, and other models such as BERT,
      indicate that this is likely the case

## Comparing hundreds of (publicly available) models

# Discussion 11

* layer-wise observations we described in Fig. 4 can be understood in terms of
  architectural differences between VGG, ResNet, and DenseNet
  * VGG resembles the traditional convolutional architectures, such as LeNet5,
    and consists of several [Conv2D-Maxpool-ReLu] blocks, followed by 3 large
    Fully Connected (FC) layers
  * ResNet greatly improved on VGG by replacing the large FC layers, shrinking
    the Conv2D blocks, and introducing residual connections
    * greater accuracy with far fewer parameters, and
    * ResNet models of up to 1000 layers have been trained 32
* The efﬁciency and effectiveness of ResNet seems to be reﬂected in the smaller
  and more stable α ~ 2.0, across nearly all layers,
  indicating that the inner layers are very well correlated and
  more strongly optimized
* This contrasts with the DenseNet models, which contains
  many connections between every layer. These results
  (large α, meaning that even a PL model is probably a poor ﬁt)
  suggest that DenseNet has too many connections, diluting high quality
  interactions across layers, and leaving many layers very poorly optimized
  * form hypotheses as to the inner workings of DNN models,
    => understand why DNNs work, as well as how to design better DNN models
  * Correlation Flow and Scale Collapse are two such examples
* Statistical mechanics has long had inﬂuence on DNN theory and practice 33–35
  * Our best-performing PL-based metrics are based on statistical mechanics via
    HT-SR Theory 1–3,34,36
    * The way in which we (and HT-SR Theory) use statistical mechanics theory
      is quite different than the way it is more commonly formulated 33,35
    * Going beyond idealized models, we use statistical mechanics
      in a broader sense, drawing upon
      techniques from quantitative ﬁnance, random matrix theory, and the
      statistical mechanics of heavy tailed and strongly correlated systems 34
  * using norm-based metrics to bound generalization error 37–39
    * theoretical work aims to prove generalization bounds
    * applied work then uses these norms to construct regularizers
  * Proving generalization bounds and developing new regularizers is
    very different than our focus on validating pretrained models
* understanding DNNs with the information bottleneck principle 24,25
  * Our work also has intriguing similarities and differences with ^
  * posits that DNNs can be quantiﬁed by the
    mutual information between their layers and the input and output variables
  * we not require access to any data, while information measures used in the
    information bottleneck approach do require this
  * nL, several results from HT-SR Theory, on which our metrics are based,
    have parallels in the information bottleneck approach
  * eg the quick transition from a RANDOM-LIKE phase to BULK+SPIKES phase,
    followed by slow transition to a HEAVY-TAILED phase, as noted previously 1,
    is reminiscent of the dynamics on the Information Plane 25
* our work, is the ﬁrst to perform a detailed analysis of the weight matrices
  * starting in 2018 with the WeightWatcher tool 6
  * two concurrent works 40,41
    * [40] G. Eilertsen, D. Jönsson, T. Ropinski, J. Unger, and A. Ynnerman.
      Classifying the classifier: dissecting the weight space of neural
      arXiv:2002.05688, 2020.
      [41] T  Unterthiner, D Keysers, S Gelly, O Bousquet, and I  Tolstikhin
      Predicting neural network accuracy from weights
      arXiv:2002.11448, 2020.
  * Both of these papers validate our basic result that
    one can gain substantial insight into model quality by examining weight
    matrices without access to any training or testing data
    * hE both consider smaller models from a much narrower range of applics
  * Previous results in HT-SR Theory suggest that insights from these smaller
    models may not extend to the SOTA CV and NLP models we consider
* Prior to our work, it was not even obvious that norm-based metrics would
  perform well to predict trends in quality across models
  (as they are usually used within a given model or parameterized model class,
  eg to bound generalization error or to construct regularizers)
  * PL-based metrics perform better than norm-based metrics
    * not surprising—at least to those familiar with the statistical mechanics
      of heavy tailed and strongly correlated systems 8,21–23 —since
      our use of PL exponents is designed to capture the idea that
      well-trained models capture
      information correlations over many size scales in the data
  * Our approach provides ﬁne-scale insight (rationalizing the ﬂow of
    correlations or the collapse of size scale) throughout a network
    * Both Correlation Flow and Scale Collapse are important for improved
      diagnostics on pretrained models as well as for improved training methods
* what a practical theory of DNNs should look like
  * two types of theories:
  * non-empirical or analogical theories, often from general principles,
    * a very simple toy model that can be analyzed rigorously, and one then
      claims that the model is relevant to the system of interest
    * drawback: very strong assumptions can limit the practical applicability
    * Nearly all of the work on DNN theory focuses on this type of theory
  * semi-empirical theories, in which there exists
    * a rigorous asymptotic theory, which comes with parameters, for the system
      of interest, and one then adjusts or ﬁts those parameters to the ﬁnite
      non-asymptotic data, to make predictions about practical problems
    * Our approach focuses on this type of theory
    * should be of interest more generally for developing a practical DNN theo

# Methods 12 [1 col]

## Special consideration for NLP models

* in NLP models (and other models with large initial embeddings),
  the embedding layers frequently lack the implicit 1/sqrt N normalization
* eg in GPT, for most layers, the maximum eigenvalue λ max O(10  100), but
  in the ﬁrst embedding layer, the maximum eigenvalue is of order N (the
  number of words in the embedding), or λ max O(10 5 )
* For GPT and GPT2, we treat all layers as-is (although one may want to
  normalize the ﬁrst 2 layers X by 1/N, or to treat them as outliers)

# Data availability [1 sentence]

# Code availability [1 sentence]
