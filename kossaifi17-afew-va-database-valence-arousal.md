Afew-VA database for valence and arousal estimation in-the-wild
J. Kossaifi, G. Tzimiropoulos, S. Todorovic, and M. Pantic,
Jean Kossaifi, Georgios Tzimiropoulos, Sinisa Todorovic, Maja Pantic,
Image and Vision Computing, vol. 65, pp. 23 – 36, 2017

# Abstract

* valence and arousal are more accurate in describing a broad range of
  spontaneous, everyday emotions than the more traditional models of discrete
  stereotypical emotion categories (e.g. happiness, surprise)
  * he, most prior work considered only laboratory settings and acted data. It
* We propose a new dataset of highly accurate per-frame annotations of
  valence and arousal for 600 challenging video clips extracted from feature
  films (also used in part for the AFEW dataset). For each video clip, we
  further provide per-frame annotations of 68 facial landmarks. We
* we evaluate a number of common baseline and SOTA methods on both
  a commonly used laboratory recording dataset (Semaine database) and the newly
  proposed recording set (AFEW-VA). Our results show that 
  * geometric features perform well independently of the settings.  However, as
  * methods that perform well on constrained data do not necessarily generalise
    to uncontrolled data and vice-versa.

# 1 Intro

* Facial Expression Recognition to detect Facial Action Units [1–3] or,
  directly, a discrete set of basic or non-basic emotions. 
  * hE, recently, psychologists and researchers in computer vision often focus
    on continuous dimensional affect analysis such as the analysis of valence
    and arousal [4,5].
* valence and arousal in-the-wild” refers to 
  1. Intensity of valence – how negative or positive the experience is, and
  2. Intensity of arousal – how calming or exciting the experience is, as shown
     in the target recordings of spontaneous facial behaviour acquired in
     unconstrained (uncontrolled) conditions.
* challenges
  * subtle, minimal facial deformations which are difficult to track, and
  * frequent out-of-plane head movements whose effects are difficult to remove.
  * similar intensity levels of valence (and arousal) may share a number of
    common changes in motion and morphology of facial features. These
    * a fine-grained approach which would be capable of 
      identifying the most relevant facial parts and their subtle movements to
  * fairly limited amount of relevant data. In particular, widely used datasets
    * laboratory, controlled settings, with a 
    * limited range of face poses and occlusion. Since SOTA methods
    * unclear whether these methods perform well in in-the-wild videos 
  * reactions elicited by a rather limited number of tasks, or in a restrictive
    setting
    * unclear whether the methods tested on such data could perform well on
      data recorder in unconstrained conditions. In general, we observe that
  * goal: robustness mechanisms for addressing uncertainty and noise of
    real-world settings.
* we present AFEW-VA – of highly accurate per-frame annotations of valence
  and arousal for 600 challenging, real-world video clips extracted from
  feature films (also used in part for the AFEW database [7,8]). Added to these
  * per-frame annotations of 68 facial landmarks. The dataset has been made
  * publicly available.1
* contributions of the paper are:
  * a novel annotation scheme that addresses the problems 
    * delays between the annotation and the video, laps in concentration,
      inaccuracy of the annotations due to the sensitivity of the joystick or
      slider and inability to annotate remotely or online.
  * baseline results on the newly introduced database and
    * we compare the performance of various features.
  * baseline and SOTA methods for performance on both
    a standard controlled database (Semaine [9]) and the new database (AFEW-VA)
    * methods performing well in controlled environments do not necessarily
      perform as well in unconstrained conditions
    * descriptive power of geometric features demonstrated
