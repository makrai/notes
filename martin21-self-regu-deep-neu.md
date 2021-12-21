Implicit Self-Regularization in Deep Neural Networks:
  Evidence from Random Matrix Theory and Implications for Learning
Charles H. Martin, Michael W. Mahoney
Jou ML Research 22(165):1−73, 2021

# Abstract

* we apply Random Matrix Theory (RMT) to analyze the weight matrices of DNNs,
  * which network
    * production quality, pre-trained models such as AlexNet and Inception, and
    * smaller models trained from scratch, e.g. LeNet5 and a miniature-AlexNet
* Empirical and theoretical results clearly indicate that the
  DNN training process itself implicitly implements a form of Self-Regu,
  implicitly sculpting a more regularized energy or penalty landscape. In
  * the empirical spectral density (ESD) of DNN layer matrices displays
    signatures of traditionally-regularized statistical models, even in the
    * without exogenously specifying traditional forms of explicit regu
      e.g. Dropout or Weight Norm constraints
* we identify 5+1 Phases of Training,
  * Building on relatively recent results in RMT,
    most notably its extension to Universality classes of Heavy-Tailed mxs
  * phases corresponding to increasing amounts of Implicit Self-Regularization
  * during the training process as well as in the final learned DNNs
  * For smaller and/or older DNNs, this Implicit Self-Regularization is like
    traditional Tikhonov regularization, in that
    there is a “size scale” separating signal from noise
  * For SOTA DNNs, however, we identify a novel form of Heavy-Tailed
    Self-Regularization,
    similar to the self-organization seen in the statistical physics of
    disordered systems (such as classical models of actual neural activity)
    * results from correlations arising at all size scales, which for DNNs
      arises implicitly due to the training process itself.  This implicit
    * can depend strongly on the many knobs of the training process. In
    * we can cause a small model to exhibit all 5+1 phases of training simply
      by changing the batch size
