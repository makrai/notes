L'antenne du Ventoux Multimodal Self-Supervised Learning for SER
Jarod Duret; Yannick Estève; Mickael Rouvier
Odyssey 2024

# Abstract

* We concentrated our efforts on the categorical classification (eight categs)
* an ensemble of models, each trained independently and then
  fused at the score level using a Support Vector Machine (SVM) classifier
  * The models were trained using various strategies, including Self-Supervised
    Learning (SSL) fine-tuning
  * modalities: speech alone, text alone, and a combined speech and text
* This joint training methodology aims to enhance the system's ability
* F1-macro of 0.35% on the development set
