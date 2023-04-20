Time-Aware Language Models as Temporal Knowledge Bases
B Dhingra, JR Cole, JM Eisenschlos, D Gillick, J Eisenstein, WW Cohen
TACL 2022; 10 257-273 arXiv:2106.15110 [cs.CL]

* Many facts come with an expiration date, from the name of the President
  to the basketball team Lebron James plays for
  * language models (LMs) are trained on snapshots of data collected at a
  * limit especially in the closed-book setting where the model should memorize
* We introduce a
  * diagnostic dataset aimed at probing LMs for
    factual knowledge that changes over time and highlight problems with
    * LMs at either end of the spectrum -- those trained on
      specific slices of temporal data/wide range of temporal data.
  * a simple technique for jointly modeling text with its timestamp.  This
  * improves
    * memorization of seen facts from the training time period, as well as
    * calibration on predictions about unseen facts from future time periods.
  * models trained with temporal context can be efficiently "refreshed"
    as new data arrives, without the need for retraining from scratch 
