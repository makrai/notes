A generalizable speech emotion recog model reveals depression and remission
Lasse Hansen, Yan-Ping Zhang, Detler Wolf, K Sechidis, N Ladegaard, R Fusaroli
Acta Psychiatrica Scandinavica https://doi.org/10.1111/acps.13388

# Abstract

* automated voice analyses for affective disorders suffer from small sample
  * ? generalizability on external data
  * we: transfer learning
    * train machine learning models on easily accessible non-clinical datasets
    * test them on novel clinical data in a different language
* Methods
  * A Mixture of Experts machine learning model was trained to infer happy/sad
    * using three publicly available emotional speech corpora
      in German and US English
  * test on Danish speaking patient
    * healthy controls (N = 42), patients with
    * first-episode major depressive disorder (MDD, N = 40), and the
    * subset of the same patients who entered remission (N = 25) based on
    * evaluated on raw, de-noised, and speaker-diarized data
* Results
  * separation between healthy controls and depressed patients at the 1st
    visit, obtaining an AUC of 0.71
  * remission was indistinguishable from that of the control group
  * predictions were stable throughout the interview
  * 20–30 s of speech might be enough to accurately screen a patient
  * Background noise (but not speaker diarization) heavily impacted
* Limitations: No data from non-remitters
