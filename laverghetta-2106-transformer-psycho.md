Can Transformer Language Models Predict Psychometric Properties?
Antonio Laverghetta Jr., Animesh Nighojkar, Jamshidbek Mirzakhalov, John Licato
`*`SEM 2021 arXiv:2106.06849 [cs.CL]

github.com/Advancing-Machine-Human-Reasoning-Lab/transformer-psychometrics

# Abstract

* can LMs be of use in predicting the psychometric properties of test items
  * We gather responses from numerous human participants and LMs (transformer
    and non-transformer-based) on a broad diagnostic test of linguistic
* transformer-based LMs predict psychometric properties consistently well in
  certain categories but consistently poorly in others

# 1 Introduction

* remarkable performance on benchmark tasks designed to assess “commonsense”
  (Wang+ 2018, 2019)
* encode and retrieve a surprising amount of structural knowledge
  (Goldberg, 2019; Hu+ 2020; Cui+ 2020; Petroni+ 2019; Davison+ 2019),
  * despite initial worries that all connectionist language models in general
    would suffer the same limitations as previous generations
    (Sun, 1992, 1995; McClelland, 1995; Klahr, 1999; McLaughlin, 2009)
* Psychometrics is concerned with psychological measurement
  * latent attributes like reasoning skills, attitudes, and personality traits
  * tools to measure such properties
  * called for bridging the gap between psychometrics and AI
    (Bringsjord and Schimanski, 2003; Bringsjord, 2011;
    Bringsjord and Licato, 2012; Dowe and Hernández-Orallo, 2012;
    Hernández-Orallo+ 2016; Wilcox+ 2020), the amount of work attempting to do
* we identified a subset of items from the GLUE broad coverage diagnostic (Wang+
  2018), and collected human responses on these items in order to assess simple
  * novel user validation procedure to do so.  We then
  * assess the performance of 240 LMs on these diagnostic items

# 2 Related work

* TLMs tend to outperform other LMs in recent work modeling human reading times,
  eye-tracking data, and other psychological and psycholinguistic phenomena
  (Merkx and Frank, 2021; Schrimpf+ 2020b,a; Hao+ 2020; Bhatia and Richie, 2020;
  Laverghetta Jr. and Licato, 2021; Laverghetta Jr.+ 2021)
* work explicitly bridging psychometrics with AI is less common
  * Xue (2019) augmented the DINA (De La Torre, 2009) and DINO (Templin and
    Henson, 2006) cognitive diagnostic models (Sessoms and Henson, 2018) with a
    feedforward neural network that used a semi-supervised learning objective
    * The architecture achieved superior results to multiple baselines
  * Ahmad+ (2020) created a deep learning architecture for extracting
    psychometric dimensions related to healthcare, specifically numeracy,
    literacy, trust, anxiety, and drug experiences. Their architecture did
    * not use transformers, and relied instead on a sophisticated combination
      of convolutional and recurrent layers in order to
    * extract representations of emotions, demographics, and synt patterns,
  * Eisape+ (2020) examined the correlation between human and LM next-word pred
    and proposed a procedure for achieving more human-like cloze probabilities
  * item response theory (IRT, Reckase, 2009) have been particularly popular
    * Lalor+ (2018) used IRT models to study the impact of question difficulty
      on the performance of deep models on several NLP tasks.  In a follow-up
    * Lalor and Yu (2020) used IRT models to estimate the competence of
      LSTM (Hochreiter and Schmidhuber, 1997) and BERT models during training.
      * create a dynamic curriculum learning (Bengio+ 2009) algorithm, which
      * superior performance to the same models trained using a static
        scheduler for several tasks
    * Sedoc and Ungar (2020) used IRT to efficiently assess chat-bots
    * Martı́nez-Plumed+ (2019) used IRT to analyze the performance of ML
      classifiers in a supervised learning task. IRT has also been used
    * to evaluate machine translation systems (Otani+ 2016) and speech
      synthesizers (Oliveira+ 2020), and also
    * in computer vision (RichardWebster+ 2018)
  * Most similar to our current work is Lalor+ (2019), who showed that
    * deep models could achieve a strong correlation with IRT parameters fitted
      using human data on several NLP datasets
    * hE, they compared the human responses to LSTMs and neural semantic
      encoders (Munkhdalai and Yu, 2017), and did not consider TLMs
    * only the SNLI dataset, which is less challenging than the GLUE diagnostic
      * not group questions based on linguistic competencies
* Besides the GLUE diagnostic, other taxonomies have been proposed, such as
  TaxiNLI (Joshi+ 2020b). Although TaxiNLI
  * includes some types of reasoning which have no clear analogue in GLUE,
  * many of their categories are quite similar. 4 Since the TaxiNLI questions
  * also taken from the MNLI dataset, we were concerned they would be too easy
  * we leave TaxiNLI for future work

# 6 Discuss

* TLMs failed to achieve a strong correlation on morphological negation
  * might be explained by two facts:
    * there is little relative variance in the human responses in this
      sub-category, and the average accuracy of human participants was above
      90%, as opposed to LM accuracy of 55%
    * This sub-category also tests for reasoning over negation, which prior
      studies found that transformers struggle with (Rogers+ 2021). This ability
  * need to construct more fine-grained evaluation benchmarks (Wang+ 2018;
    Joshi+ 2020b), and we believe our work complements these efforts nicely
* The number of human participants in our study was somewhat small compared to
  * IRT models can require thousands of responses to get good estimates of the
    latent parameters (Min and Aryadoust, 2021). As stated earlier, practical
    limitations on
  population size is a common problem in psychometrics research, one which our
  * Future work will need to repeat our experiments with much largerpopulation
    sizes, and also take measures to ensure sufficient diversity in the study
    population (e.g., age, income, education level, English fluency, etc.)
* other measures we examined did not appear to align well. For example,
  * item-total correlations using human data did not appear to correlate with
    any LM data better than with the random baseline
  * Likewise, our LMs failed to predict average inter-item correlations between
    either random subsets of items or our diagnostic sub-categories. More work
* fairness is somewhat more controversial than other psychometric properties, in
  * multiple interpretations of what constitutes test bias (Warne+ 2014)
