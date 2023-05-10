Mental health monitoring with multimodal sensing and machine learning: A survey
E Garcia-Ceja, M Riegler, T Nordgreen, P Jakobsen, KJ  Oedegaard, J Tørresen
Pervasive and Mobile Computing Volume 51, December 2018, Pages 1-26

# Abstract

* Personal and ubiquitous sensing technologies such as smartphones
* Machine learning methods have been applied to continuous sensor data to
  predict user contextual information such as
  location, mood, physical activity, etc
* growing interest in ubiquitous sensing technologies for mental health care
  * automatic continuous monitoring of different mental conditions such as
    depression, anxiety, stress, and so on
* we survey recent research works in mental health monitoring systems (MHMS)
  using sensor data and machine learning
  * focused on mental disorders/conditions such as:
    depression, anxiety, bipolar disorder, stress, etc
  * classification taxonomy to guide the review of related works and present
    the overall phases of MHMS
  * research challenges in the field and future opportunities are also

# 1 Intro

* Traditional monitoring methods rely on
  * retrospective reports which are subject to recall bias (Shiffman+ [8])
  * Ecological Momentary Assessment (EMA) which allows
    repeated sampling of thoughts, feelings and behaviors
    as close in time to the experience as possible in real-life situations [8]
    * outperform paper and pencil reports in the assessment of some mental [9]
* smartphones and wearable devices make them potential platforms for EMA
  measurements, monitoring mental illness, treatment, self-management and
  interventions, thus, reducing costs and expanding the coverage of services
  * have potential in providing mental health interventions [10–12]
  * Wearable devices like smartphones, smart watches and fitness bands, have
    a vast variety of embedded sensors
  * communication devices (WiFi, Bluetooth, etc), inertial sensors
    (accelerometer, gyroscope, etc), physiological sensors (heart rate,
    dermal activity, etc) and ambient sensors (ambient pressure, temperature,
    etc) to name a few
* multimodal sensing applications in the healthcare domain [13]
  * combining the data from subsets of those sensors, it is possible to infer
    contextual information such as physical activity [14], location [15], mood
    [16] and social relationships [17]; among others
  * Multimodal sensing settings have shown to produce better results in some
    applications, compared to single sensor modalities [18,19]
    * take into account the individual characteristics of each person
  * machine learning becomes important
* mental states can manifest through physiological and behavioral changes
  * eg hypoactive electrodermal response is a feature of depression
  * monitoring electrodermal activity may be useful to differentiate phases of
    mood disorders
  * Chang+ [21]: bipolar mania is assoced with cardiac autonomic dysregulation
  * behavioral changes, Berle+ [22] found that
    motor activity recorded with actigraphs was significantly reduced in both
    schizophrenic and depressed patients compared to controls
* we survey novel research works about mental health monitoring systems (MHMS)
  that make use of sensors and mainly machine learning
  * We focused on research works about mental disorders/conditions such as:
    depression, anxiety disorders, bipolar disorder, stress, epilepsy, etc The
  * survey relevant work that illustrates the current use of technology
    (multimodal sensing and machine learning) for automatic and adaptive MHM
* The main contributions of this work are
  * an overview of the SOTA of research in context of MHMS,
  * a classification taxonomy for MHMS research works,
  * an overview of sensors and the work flow of sensor based monitoring systems
  * a list of research challenges and opportunities in the field

The paper is structured as following:

# 2 Related work

* (surveys, review works) about MHMS and wearable devices for automatic monitor

# 3 our proposed classification taxonomy of MHMS, covering

* Table 2: the most representative works classified according to this taxonomy
  * disorder and duration
    * for anxiety and stress the studies are often short-term and
    * for bipolar disorder they are long-term
    * because the transition between states in some disorders (eg bipolar) takes
      more time, thus, long-term studies are needed to capture the state
      transitions
  * fewer works related to forecasting than to association and detection
  * Support Vector Machines (SVM) and tree based classifiers seem to be among
    the most used models for detection which makes sense since they are
    * well researched, easy to understand and included in many ML frameworks

## Study type can be association, detection and forecasting

## Study duration can be either short-term or long-term

* eg
  * social anxiety disorder, several transitions between a non-anxious and an
    anxious state can occur within the same day
  * bipolar disorder can take several days
* some studies collect sensor data for a couple of days while
  others require several months
* we will consider long-term studies those that last seven or more days
  * short
    * eg studies of Miranda+ [39]: 45 min
    * Slater+ [37]: three public talks
  * long-term studies
    * eg bipolar disorder are the ones from Faurholt-Jepsen+ [40] and Grünerbl+
    * both studies lasted 12 weeks and used smartphone sensors such as the
      microphone, screen state, cell tower ids, sms, etc
    * aim
      * Faurholt-Jepsen: correlations between bipolar states and sensor values
      * Grünerbl utilized machine learning to recognize bipolar states and
        * recognition accuracy of 76%. Table 2 provides more examples

## Sensing types can be wearable, external and software/social media

### 3.3.3. Software and social media sensing

* eg smartphones application usage data
  * eg the time an application was first opened, the duration in the foreground
    (when the user is using it), etc can be obtained by software
* Ferdous+ [104] used smartphone application usage data to
  predict stress levels by grouping applications into four categories:
  social, utility, entertainment and browser
  * time and frequency spent by each user on each category per day and used a
    Support Vector Machine to get the final predictions with an accuracy of 75%
* phone calls and Short Message Service (SMS) logs
  * can be collected through software APIs
  * Faurholt-Jepsen+ [40] analyzed phone call logs of bipolar disorder patients
    * the more severe the depressive symptoms, fewer outgoing calls/day, and
      less answered incoming calls/day
  * LiKamWa+ [105] used SMS, phone calls, emails, applications usage, web
    visits, etc, to infer mood states with smartphones achieving accura ~ 93%
  * user behavior captured by social media can reveal depression markers
    [57,106]
  * Reece and Danforth [57] analyzed uploaded images to Instagram and found
    * photos posted by depressed users were bluer, grayer, and darker
  * Analysis of social media content has also been used to detect stress [107]

### 3.3.4. Discussion

* each research study has used different combinations of sensors
* Fig. 2 shows a heatmap of pair-wise sensor co-occurrences from 28 works that
* eg heart rate (hr) measurements are often used in combination with
  Electrodermal Activity (EDA) measurements
  * movement sensors (accelerometers, gyroscopes) are likely to be combined
    with other types of sensors
  * App, social media and EEG were used in isolation (from the sampled works)
* These insights show some opportunities for future research work, for example,
  combining social media with physiological sensors

# 4 the general steps of sensor based monitoring systems

* from the prerequisites/experiment design to deployment
* key aspects and considerations for the data collection process, data
  analysis, and machine learning model training and evaluation

# 5 research challenges and future opportunities in MHMS

# 6 limitations of this work

# 7 conclusion
