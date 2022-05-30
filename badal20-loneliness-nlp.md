Prediction of Loneliness in Older Adults Using Natural Language Processing:
  Exploring Sex Differences in Speech
2020
VD Badal, SA Graham, CA Depp, K Shinkawa, Y Yamada, LA Palinkas, H Kim,
  DV Jeste, EE Lee

# Introduction

* While loneliness and social isolation may be interrelated,
  * loneliness is a distinct construct − some people feel “lonely in a crowd”
  * interviews
    * qualitative (eg, open-ended or semi-structured interviews) and
    * quantitative (eg, based on the Uni of California Loneliness Scale)
* nuanced features are not easily assessed by the human eye
  * such as word choice, expressed emotions, and sentence structure
* NLP eg parts-of-speech tagging, named entity recognition and parsing
  * NLU is a subset of NLP which is more aligned with comprehension
    * tasks such as reasoning, translation, summarization, question-answering,
      sentiment and emotion analysis
* using NLP tools for psychiatric applications include predicting/diagnosing
  * psychiatric readmission, 21
    * 21. Rumshisky A, Ghassemi M, Naumann T,+
      Predicting early ~ with NLP of narrative discharge summaries
      Transl Psychiatry 2016; 6, e921- e921
  * suicidality 22,23 or
    * 22. Cook BL, Progovac AM, Chen P,+
      Novel use of NLP to predict suicidal ideation and psychiatric symptoms in
      a text-based mental health intervention in Madrid
      Comput Math Methods Med 2016; 2016;doi:10.1155/ 2016/8708434
    * 23. Fernandes AC, Dutta R, Velupillai S,+
      Identifying suicide ideation and suicidal attempts in a psychiatric
      clinical research database using NLP
      Sci Rep 2018; 8:1–10
  * mental health crises 24 ;
    * 24. Kolliakou A, Bakolis I, Chandran D,+
      Mental health-related conversations on social media and crisis episodes: a
      time-series regression analysis
      Sci Rep 2020; 10:1342
  * mental illnesses 25 ; and predicting
    * 25. Tran T, Kavuluru R:
      Predicting mental conditions based on “history of present illness” in
      psychiatric notes with deep neural networks
      J Biomed Inform 2017; 75:S138–S148
  * depression. 26
    * 26. Perlis R, Iosifescu D, Castro V,+
      Using electronic medical records to enable large-scale studies in
      psychiatry: treatment resistant depression as a model
      Psychol Med 2012; 42:41–50
* NLP tools including
  * rule-based systems (systems that use explicitly stated If/Then/Else rules),
  * artificial neural networks (ANN, models inspired by neurons)
  * deep neural networks (multilayer ANN)
* dimensions of sentiment and the embedded emotions
  * use has been limited in psychiatry
* we conducted semi-structured qualitative interviews about loneliness
  * quantitative loneliness assessments
    with residents of a continuing care senior housing community
    * interviews were analyzed using NLP to identify differences in transcribed
      speech patterns in lonely versus non-lonely individuals (based on
      qualitative and quantitative assessments)
    * proof-of-concept study
    * we explored how NLP analytic methods could assess whether individuals
      reported feeling lonely in response to a direct question about loneliness
      (eg, “Do you feel")
  * how responses of lonely individuals differed in length, sentiment, and
    emotion from non-lonely individuals (using qualitative and quantitative)
    * sex differences in the response features

# RESEARCH DESIGN AND METHODS

## Analytic Procedures

* we analyzed the sentiment and emotional content of the responses to the
  loneliness question (Q1) using IBM Watson NLU iv program 33 depicted in Fig 1
