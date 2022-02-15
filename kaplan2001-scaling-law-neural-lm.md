Scaling Laws for Neural Language Models
Jared Kaplan, Sam McCandlish, Tom Henighan, Tom B. Brown, Benjamin Chess, Rewon Child, Scott Gray, Alec Radford, Jeffrey Wu, Dario Amodei
arXiv:2001.08361 [cs.LG]

* We study empirical scaling laws for LM performance on the cross-entropy loss.
* The loss scales as a power-law
  with model size, dataset size, and the amount of compute used for training,
  * some trends spanning more than seven orders of magnitude.
* eg network width or depth have minimal effects within a wide range. 
* Simple equations govern
  the dependence of overfitting on model/dataset size and
  the dependence of training speed on model size
  * allow us to determine the optimal allocation of a fixed compute budget.
* Larger models are significantly more sample-efficient
  => optimally compute-efficient training involves
  training very large models on a relatively modest amount of data and
  stopping significantly before convergence. 
