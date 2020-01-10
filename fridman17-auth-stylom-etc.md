Lex Fridman, Steven Weber, Rachel Greenstadt, Moshe Kam
Active Authentication on Mobile Devices
  via Stylometry, Application Usage, Web Browsing, and GPS Location
ieee 17

#Abstract

* Active authentication is the problem of continuously verifying the identity
* dataset is novel in the context of active authentication
  * due to its size, duration, number of modalities, and absence of
    restrictions on tracked activity. The geographical colocation of the
* We consider four biometric modalities:
  * text entered via soft keyboard,
  * applications used,
  * websites visited, and
  * physical location of the device as determined from GPS ... or WiFi
*  We
  * implement ... a classifier for each modality +
    a parallel binary decision fusion architecture
  * quantify the contribution of each modality to the overall performance

#I. INTRODUCTION

* people are using their phones to access and store sensitive data. The same
  * 2013 Pew Internet Project study of 2076 people [1], 91% of American adults
  * 81% of cellphone owners use their mobile device for texting
  * 52% use it for email
  * 49% use it for maps (enabling location services)
  * and 29% use it for
  * inaccurate estimation of risk as discussed in [2]. In particular, several
  * a large percentage of smartphone owners do not lock their phone: 57%
* continuous authentication has been explored extensively on desktop computers,
  based either on ... a fusion of multiple modalities like
  * keyboard dynamics, mouse movement, web browsing, and stylometry
    (Fridman+ 13)
* authentication on mobile devices, where the
  * variety of available sensor data is much greater than on the desktop, but
  * so is the variety of behavioral profiles, device form factors, and
    environments in which the device is used.  Active authentication is the
* modalities were
  * TEXT , APP , WEB , and LOCATION , respectively
  * chosen, in part, due to their relatively low power consumption. In the
* We consider the trade-off between intruder detection time and detection error
  as measured by false accept rate (FAR) and false reject rate (FRR). The
* The remainder of the paper is structured as follows. In
  * II related work
    on multimodal biometric systems, active authentication on mobile devices,
    and each of the four behavioral biometrics considered in this paper.  In
  * III, we discuss the 200 subject dataset that we collected and analyzed.  In
  * IV four ... classifiers, and the decision fusion architecture. In
  * V  performance of each individual classifier, ... the fusion system, and
    the contribution of each individual classifier to the fused decisions

#II. Related work

##A. Multimodal Biometric Systems

* Our approach in this paper is to apply the Chair-Varshney optimal fusion rule
  (Chair and Varshney 1986)

##C. Stylometry, Web Browsing, Application Usage, Location

* Stylometry is the study of linguistic style. It
  * extensively applied to the problems of authorship attribution,
    identification, and verification
    * See (Brocardo, Traore, and Woungang, 2013) for a thorough summary
  * large sets of features (see Table II in (Abbasi and Chen 2008) in
    * combination with SVMs that have proven to be
      * effective ... even in cases when the number of features exceeds the
        number of samples (McDonald+ 12)
    * often more than 500 words are required
      * Fridman+ (2014) Multi-modal decision fusion for continuous auth
  * studied extensively in the context of active authentication
  * we ... implement the n-gram analysis approach presented in (Brocardo+ 13)
    that has been shown to work sufficiently well on short blocks of texts

#IV. Classification and decision fusion

##1) Text

* The tracking application captured the keys that were touched on the
  keyboard and not the autocorrected result
  * messages had a lot of misspellings and words that were erased in the final
  * In the case of SMS, we also were able to record the submitted result

#V. RESULTS

##B. Performance: Individual Classifiers

* the text modality converges to ... one of the worse performers of the four
  modalities
