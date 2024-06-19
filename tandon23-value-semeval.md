LRL_NC at SemEval-2023 Task 4: The Touche23-George-boole Approach for Multi-Label Classification of Human-Values behind Arguments
Kushagri Tandon, Niladri Chatterjee
SemEval-2023 Toronto, Canada

# Abstract

* ValueEval aims at assigning a subset of possible human value categories
  underlying a given argument
* Values behind arguments are often determinants to evaluate
  the relevance and importance of decisions in ethical sense, thereby making
* we propose two systems for the same.
  * Both systems use RoBERTa to encode sentences in each document. 
  * System1 makes use of features obtained from training models for two
    auxiliary tasks, whereas 
  * System2 combines RoBERTa with topic modeling to get sentence reprs
  * These features are used by a classification head to generate predictions.
* result
  * System1 secured the rank 22 in the official task ranking, achieving the
    macro F1-score 0.46 on the main dataset
  * System2 was not a part of official evaluation.  Subsequent experiments
    achieved highest (among the proposed systems) macro F1-scores of 0.48
    (System2), 0.31 (ablation on System1) and 0.33 (ablation on System1) on the
    main dataset, the Nahj al-Balagha dataset, and the New York Times dataset.

# 2 Background The data made available by the organisers comprises of 

* a main dataset and three supplementary datasets, namely, Zhihu, Nahj
  al-Balagha and The New York Times dataset. The 
  * main dataset consists of Train/ Validation/Test counts as 5393/ 1896/ 1576.
  * 9324 arguments on statements which include 
    * religious texts (Nahj al-Balagha) 279 test
    * political discussions (Group Discussion Ideas)
    * free-text arguments (IBM-ArgQRank-30kArgs)
    * newspaper articles (The New York Times) 80 test
    * community discussions (Zhihu) 100 validation
    * democratic discourse (Conference on the Future of Europe). The
* An instance of the dataset can be interpreted as, Arguing in favor
  of/against a `<Conclusion>` by saying `<Premise>` eg tab 1

# 6 Results 

* Ablation studies on System1 were conducted as follows. The results
  * Ablation 1.1: System1 without Model_Level1
  * Ablation 1.2: System1 without Model_Stance
  * Ablation 1.3: System1 without Model_Level1 and Model_Stance
* In each of three test sets the submitted systems either outperform or perform
  at par with the organizer’s BERT and 1-Baseline
  * Among the proposed systems, System2 performs the best on the Main test set
  * Ablation 1.2 performs best in case of Nahj al-Balagha test set
  * New York Times test set, the Ablation 1.1 performs almost at par with the
    best participant model on the official task leaderboard (macro-F1 score)
    * This can be attributed to the use of the supplementary Zhihu subset for
      validation, improving the robustness of the system
* It is observed that use of topic modeling improves the performance of the
* main dataset, the F1score is highest for eleven labels, for System2. Sim-
* Nahj al-Balagha dataset, for five labels, the the F1-score is 
  * highest for Ablation 1.2.  For this dataset, 
  * System2 performs at par with the BERT baseline. On the 
* New York Times dataset, for five labels, the F1-score is highest for Abl 1.1
