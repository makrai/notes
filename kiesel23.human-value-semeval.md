SemEval-2023 Task 4: ValueEval: Identification of Human Values Behind Arguments
Johannes Kiesel, Milad Alshomary, Nailia Mirzakhmedova, Maximilian Heinrich,
  Nicolas Handke, Henning Wachsmuth, Benno Stein
SemEval 2023 Toronto, Canada

# Abstract

* Argumentation is ubiquitous in natural language communication, from politics
  * human values, such as self-directed thought or tolerance, often implicit
  * values are key to understanding the semantics of arguments
* 39 teams submitted runs to ValueEval’23. Using
  * a multi-sourced dataset of over 9K arguments, the systems achieved
    F1-scores up to 0.87 (nature) and over 0.70 for three more of 20 universal
    value categories. However, many challenges remain, as evidenced by the
  * low peak F1-score of 0.39 for stimulation, hedonism, face, and humility

# 1 Intro

* (human) values (Searle, 2003)
  * fig 1: Some values tend to conflict, others tend to align (see Figure 1)
  * political parties that promote respective highly revered values
* studied both in the
  * social sciences (Schwartz, 1994) and in
  * formal argumentation (Bench-Capon, 2003) for decades. According to the
* Schwartz: a “value is a
  * belief
  * pertaining to desirable end states or modes of conduct, that
  * transcends specific situations,
  * guides selection or evaluation of behavior, people, and events, and
  * is ordered by importance relative to other values
* NLP can assist in argument categorization, evaluation, and generation
* social science: models of
  * audience-specific argument strength (Bench-Capon, 2021), and it can support
  * morals (Feldman, 2021; Alshomary+ 2022) and
  * frames (Entman, 1993; Ajjour+ 2019)
* the ValueEval’23 shared task at SemEval as part of the Touché series.1
  Simply put, the task is to classify whether a given argument resorts to a
  * we extended our previous dataset (Kiesel+ 2022) to more than 9K arguments
  * submissions from 39 teams (Section 5), which
    * we benchmarked and analyzed on our dataset (Section 6)
    * beating our BERT baseline by a large margin on all dataset parts for all
      20 value categories

# 2 Related work

* human values: researched extensively
* Rokeach (1973) first defined values as certain end states or modes of
  conduct that humans desire. Accordingly, they introduced
  * a prioritization over these values based on cultural, social, and personal
  * a survey of 36 values distinguishing between end states and behavior. For
* cross-cultural analysis, Schwartz+ (2012) derived 48 value questions from
  universal individual and societal needs, including concepts such as obeying
  all the laws and being humble
* Cheng and Fleischmann (2010) consolidated 12 taxonomies into a
  “meta-inventory” with 16 values, revealing significant overlap. Another
* linked open data scheme ValueNet by Giorgis+ (2022), though the authors do
  not compare the taxonomies as such
* taxonomies are several studies in the social sciences: see
  * Scharfbillig+ (2021): a recent overview and practical insights
    (directed at policy makers)
* the strength of an argument subject to the audience’s preferences
  * value-based argumentation schemes (van der Weide+ 2009),
  * defeasible logic programming (Teze+ 2019), and the
  * value-based argumentation framework of Bench-Capon (2003)
* NLP
  * interactive systems, Ammanabrolu+ (2022) aim to tune interactive chat-based
    agents towards morally acceptable behavior
  * operationalization of values is limited to valence (good or bad) and target
    (self or other), the model can not explain in abstract terms
  * Liu+ (2023) is based on human edits that change text to morally acceptable
    (“value-aligned”) behavior
* ValueNet (Qiu+ 2022)
  * 21K one-sentence descriptions of social scenarios
    (taken from SOCIAL-CHEM-101 of Forbes+ (2020))
    annotated for the 10 value categories of an earlier version of Schwartz
  * difference to our dataset are the
    more ordinary situations in ValueNet (eg whether to say “I miss mom”)
  * ValueNet’s scenario descriptions could be seen as conclusion and its
    “utility” annotation (-1 to +1) as stance
  * the link between value category and description—the premise in our
    data—remains implicit in ValueNet. The implicit premise is a key
  * our annotations specifically target the premise,
    as it is the locus of ethical reasoning

# 3 Task Description

> Given a textual argument and a human value,
> classify whether the argument resorts to that value or not

* we employ a set of 20 value categories from our previous work (Kiesel+ 2022)
  * multi-label classification setup and
  * metric
    * evaluate approaches using macro F1 ie weigh each category the same,
    * provided the teams with per value category F1 -scores, precision, & rec
* fig 1: the employed value taxonomy, which is
  * largely based on that of Schwartz (1994) and
  * described in full detail by Kiesel+ (2022). For ValueEval’23,
  * we use the 20 value categories (level 2) in a multi-label classification
    * as this level is the one usually used in social science analyses (eg by
      Scharfbillig+ (2021)), whereas
    * level 1 is mostly used for data collection (ie when surveying people)

# 4 Data

* ValueEval’23 employs the Touché23-ValueEval dataset, which consists of
* 9324 arguments collected from 6 diverse sources, namely
  religious texts, political discussions, free-text arguments, newspaper
  editorials, and online democracy platforms
* Each argument consists of three parts: two short texts— premise and
  conclusion—, and a stance attribute that indicates whether the premise
  supports the conlusion (“in favor of”) or its anti-thesis (“against”)
* Each argument was annotated by 3 crowdworkers for 54 values, which were then
mapped to 20 value categories (cf. Table 4). Mirzakhmedova+ (2023) describe
the collection and annotation in detail. The dataset is publicly available
online and has over 1900 downloads as of April 2023
* two parts (cf. Table 2): the
  * main dataset (8865 arguments; 95%) and the
  * supplementary dataset (459 arguments; 5%)
* main: train/valid/test
  * To avoid train-test leakage from argument similarity, we ensured that
    all arguments with the same conclusions (but different premises) were in
    the same set. The ground truth for the test dataset has been kept secret
    until the camera ready deadline for ValueEval’23 participant papers
* supplementary dataset simulates an out-of-domain application. This domain
  difference is reflected in several aspects of the datasets. As Figure 2
  * the majority of arguments in the main dataset have >1 value categories
  * supplementary dataset, the
    * Zhihu split shows a similar pattern (with 81% of arguments having >1)
    * NYT and NaB
      * fewer labels are assigned to the arguments of the New York Times (41%)
        and the Nahj al-Balagha split (33%)
    * a few arguments have no value assigned (ie, no ethical judgement): 2% for
      Nahj al-Balagha and 15% for the New York Times. As Figure 3 shows, also
  * fig 3: the distribution of value categories is very similar within the main
    dataset, but quite different to the distributions for the supplementary

## 4.1 Main dataset

* 8865 arguments from the following three sources, with approximately the
  same ratio of arguments pre source in the train, validation, and test splits

### IBM-ArgQ-Rank-30kArgs (Gretz+ 2020)

* We collected 7368 arguments from this dataset by , a collection of
* free-text arguments on 71 controversial topics that are common in the US
* collected using the US-based crowdsourcing platform Figure Eight and
* labeled for argumentation quality
* We sampled arguments by topic, starting with that of highest quality. We used
  the topics as conclusions and the “arguments” as premises.

### Conference on the Future of Europe

* We collected 1098 arguments for 431 unique conclusions from this
* an online participatory democracy platform that involves citizens, experts,
  and EU institutions in a dialogue focused on the future direction and
  legitimacy of Europe
* We sampled from an existing dataset (Barriere+ 2022) proposals and
  corresponding comments which were originally written in English and for which
  the users marked their comments as supporting or contesting. We manually
  extracted the conclusions from the proposals and one or more premises from
  their comments

### Group Discussion Ideas

* We collected 399 arguments from the Group Discussion Ideas web page.6 The
* GD aggregates pros and cons on various topics covered in Indian news to help
  users participate in a group discussion or debate in English
* We crawled the web-page and manually extracted one or more conclusion-premise
  pairs from each topic discussion, and manually labeled the stance for each
  pair where it was not stated explicitly

## 4.2 Supplementary dataset
In addition to the main dataset, we collected a sup-
plementary dataset of 459 arguments of different
written forms and ethical reasoning. This dataset
is intended as an out-of-domain challenge for sub-
mitted approaches. The arguments from the latter
two sources were provided by other researchers in
response to our call for data on NLP mailing lists:

### Zhihu

* We collected 100 arguments from the recommendation and hotlist section of
* a Chinese question-answering website
* We translated the answers to English using automated translation and
* manually extracted and rephrased premises and conclusions from these

### Nahj al-Balagha We collected 279 arguments from the Nahj al-Balagha,

* an Islamic religious text
* Conclusions and premises were deduced manually from a Farsi translation of
  the Arabic text, with
  * similar conclusions being unified, and
  * conclusions and premises translated to English
* These arguments were provided by the language.ml lab

### The New York Times We collected 80 arguments from 12 news articles of The

* published between July 2020 and May 2021 and
* from those that contain at least one of these keywords: coronavirus
  (2019-ncov), vaccination and immunization, and epidemics
* premises, conclusions, and stances were
  manually extracted by 3 annots/text and curated by two linguist experts
* provided by Lea Kawaletz & Zeljko Bekcic of the Heinrich Heine-Uni Düsseldorf

# 5 Submissions 5

* submissions from 39 teams, of which 37 provided information about their
  approaches—including the 29 teams who submitted a paper to SemEval
  * The task used TIRA9 (Fröbe+ 2023) for evaluation
* The following is
  2. a cross-sectional overview of the approaches by the 37 teams, after an
  1. overview of the top-ranked approach. For details on single approaches,
* Each team was, per test set, allowed
  * one submission before December 16th (“early bird”) and
  * four additional submissions on January 27th. Teams were allowed
  * more submissions after the deadline for analyses, but
  * ground truth labels are released only after the camera-ready paper
* teams had to choose a code name from Wikipedia’s list of ethicists10 on
  registration. Five teams preferred to stay anonymous and 26 other teams kept
  their code name as their team name

## Top-ranked Approaches

### Team Adam Smith uses an ensemble of 12 transformer-based models: DeBERTa
and RoBERTa, both trained for either loss minimization or F1-score maximization
on three different folds each.11 The RoBERTa models were pretrained on the full
IBM-ArgQ-Rank30KArgs dataset (Gretz+ 2020), which is the source for most
arguments in the main set (cf. Table 2). For ensembling, they averaged the
predictions of the single models and used a single decision threshold that they
optimized on a hold-out set.  They also tried a stacked meta-classifier based
on logistic regression, which performs better on the Nahj al-Balagha but not on
the main test set

### Team John Arthur fine-tuned a DeBERTa model (microsoft/deberta-v2-xxlarge)

* They represented each input as a concatenation of stance, premise, and
  conclusion, separated by special tokens. They also found that using
* separate token symbols for stance (“Favour” and “Against”) slightly boosted
  classification results. They trained their model to minimize
* binary cross-entropy loss.  The outputs were passed through a
  * sigmoid function to make a binary prediction for each of the value categs
* A single decision threshold (0.2) was used for all categories
* having more data in the training set benefits the model’s performance. Just
  adding as many as 100 arguments (they used the Zhihu validation set as an
  addition to the training set) lifted the F1 results from 0.53 to 0.55

### Team PAI (Theodor Zwinger) used a combination of transformer models. The

* data combined
  * training data, consisting of premise, conclusion, and stance, were
  * combined in several ways in order to create four different input datasets
  * eg in one dataset, sample labels were merged to conqueer imbalance
* Each trained transformer has classifiers for all labels. The final results
  were ensembled by weight voting based on the F1 score in the validation set
  of each value category. Several loss functions were considered, where a
  class-balanced loss combined with a negative tolerant regularization proved
  to be the best approach. Also, different classification thresholds were
  tried but without performance improvement

## Employed Models

* Transformer-based models were the most dominant techniques (35/37; Table 3)
  * All submissions that used transformers finetuned them on data except team
  StFX-NLP (Jesus of Nazareth), who integrated BERT’s embeddings as features
  into their approach. Only
  * four approaches considered reformulating the task as a non-classification
  * while 31 approaches performed direct classification on the provided labels
* two teams relied on classical machine learning models such as
  * decision trees and SVMs (team Friedrich Nietzsche) or
  * logistic regression (team Joseph Fletcher).  Among the 35 transformer-based

## Non-classification Approaches

* Four teams formulated the task as natural language inference:
  * Søren Kierkegaard, Rudolf Christoph Eucken, Jesus of Nazareth, & Quintilian
  * Søren Kierkegaard constructed samples from the premise and the
    corresponding value category with entailment or contradictory labels
    inferred from whether the premise has the value category. Then, they
    fine-tuned a RoBERTa model that was already pre-trained on the natural
    language inference task (Bowman+ 2015)
* as question-answering: Team Hitachi (R. M. Hare) used BART and T5 as backbone
  * a yes/no question for each value category given a (premise, stance,
    conclusion) triple
  * They also experimented with formulating the task as zero-shot QA with
    chain-of-thought prompting (Kojima+ 2022) using GPT-3 (text-davinci-003)

## Employed Data

* all 37 used the premise as an input, 25 used the conclusion, and 24 used the
  stance . For example, team
* eg Tübingen (Stanley Grenz) found that utilizing the stance as part of the
  output to predict instead of being in the input led to better effectiveness
* Four teams augmented the data with our definitions of the value categories (4
  approaches): team
  * Prodicus created extra instances by concatenating human values and their
    descriptions as input and the corresponding value category as a label; team
  * Noam Chomsky used the similarity between premises and the corresponding
    human values as extra features. Team
  * Hitachi also employed value category descriptions and formulated the task
    as a question-answering problem, as described above
  * Epicurus augments their data by adding definitional statements formulated
    based on several human value surveys, such as
    eg the world value survey (Haerpfer+ 2020), and Rokeach (1973)

## Special Training
* pre-trained on other corpora:
  * list
    * Besides team Adam Smith, as described above, three more teams
    * team Niccolo Machiavelli finetuned DeBERTaV3, and team
    * Hitachi fine-tuned RoBERTa on ValueNet (Qiu+ 2022), while team
    * MaChAmp (Robert S. Hartman) fine-tuned on data from the other SemEval’23
      tasks (“intermediate training”). However, for
  * hE like most SemEval tasks, the intermediate training did not improve effec
* contrastive learning: Mao Zedong and T. M. Scanlon). Team
* SUTNLP (David Gauthier) employed adversarial training

## Label Semantics

* Five submissions (Mao Zedong, SUTNLP, Hitachi, Prodicus, Epicurus) em-
* learning label semantics from data or using the definitions of human values
* Mao-Zedong utilized
  * a label-guided attention mechanism to learn label-specific representations
  * contrastive loss function to pull instances with similar labels together
* SUTNLP learns a semantic representation of labels by encoding them jointly
  with their corresponding premises and then employs
  adversarial training to enhance the generalization of their model
  * further capture label correlations by constructing a graph over labels
    using a Graph Convolutional Network (Zhang+ 2019), where
    * nodes (hidden label representations) are connected if there is at least
      one argument in the training data that contains these labels

# 6 Results 8

* We evaluated the submitted approaches on the Touchè23-ValueEval dataset,
  both the main and supplementary parts (Section 6.1)
  * Though we allowed teams to submit predictions only for a subset of the 20
    value categories, only one team did so, and not on their best run. We use
* two baselines from our previous work (Kiesel+ 2022):
  * BERT Fine-tuned multi-label bert-base-uncased, batch = 8 & lr 2−5 (20 epch)
  * 1-Baseline Classifies each argument as resorting to all categories: always
    achieves a recall of 1

## 6.1

* peculiarities,
  * only few runs are at the top for stimulation, hedonism, face, conformity:
    interpersonal and humility. Since stimulation and hedonism are next to
  * the anomaly of the `universalism: objectivity` category, for which the
    1-baseline performed considerably better that the BERT baseline and many
    submitted runs
    * This is the only category that was added—based on a comparison with other
      value taxonomies (Kiesel+ 2022)—to the 19 categories of the Schwartz
      taxonomy
    * Schwartz+ (2012) refrained from including such a category as they found
      truth-seeking to be correlated with several other categories on all sides
      of the wheel
    * This observation might also be connected to the anomaly we observe

## 6.2 meta-classification study: straightforward approach-combinations

* Unlike in a previous shared task of ours (Kiesel+ 2019), the voting scheme
  does not (main test dataset, Figure 5 a,b) or only marginally (supple-
  mentary test datasets, Figure 5 c–f) improve over the best single run (Tab 3)

## 6.3 disseminate the results

* Table 3 cites all submitted papers and links to the source code and Docker
* we worked together with the top-ranked team, Adam Smith, to provide an
  online demo and executable of their best-performing approach.12

# 7 Conclusion 10

* main dataset of 8865 arguments, as well as the supplementary dataset of 459
* we provide a systematic overview of the 29 papers submitted by the
  * ad-hoc meta classification
* Through the use of TIRA (Fröbe+ 2023) we can directly evaluate the approaches
  of the 8 teams who used Docker submission on new datasets for human values
  detection, provided they are formatted like the datasets presented here
* 23 teams set up an open source repository for making their code available to
* F1-scores above 0.56 on the main test set and up to 0.87 for individual
  categories. However, many challenges remain, as evidenced by the low peak
  F1-score of 0.39 for stimulation, hedonism, face, and humility
* transformer models could be used to great effect, and in particular
  * ensembling approaches showed to be quite effective
* The results between the main and supplementary datasets were quite different
  as anticipated due to their dissimilarity, yet
  * nL teams managed to beat the baselines on the supplementary datasets by a
    wide margin despite the total lack of in-domain training data. Moreover,
  * several teams reported that using our supplementary validation set as an
    addition to the training set boosted results, suggesting that a larger
    dataset of this kind will probably assist in improving the performance of
    future models even further. Thus, there is still room for improvement on
    this task, and whether progress will come from novel models or creative
    applications of existing techniques remains to be seen
