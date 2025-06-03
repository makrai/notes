Soft-Label Dataset Distillation and Text Dataset Distillation
Ilia Sucholutsky, Matthias Schonlau
arXiv:1910.02551 [cs.LG]

https://github.com/ilia10000/dataset-distillation

* Dataset distillation is a method for reducing dataset sizes by 
  * learning a small number of synthetic samples containing all the
    information of a large dataset. This has several 
  * benefits like speeding up model training, reducing energy consumption, and
    reducing required storage space. Currently, 
  * each synthetic sample is assigned a single _hard_ label, and also, dataset
  * can currently only be used with image data.
* We propose to simultaneously distill both images and their labels, thus
  * assigning each synthetic sample a _soft_ label (a distribution of labels).
  * increases accuracy by 2-4% over the original algorithm for several image
    classification tasks. Using soft labels also 
  * enables distilled datasets to consist of fewer samples than there are
    classes as each sample can encode information for multiple classes. For
  * eg training a LeNet model with 10 distilled images (one per class) results
    in over 96% accuracy on MNIST, and almost 92% accuracy when trained on
    just 5 distilled images.
  * distill sequential datasets including texts. We demonstrate that 
  * text distillation outperforms other methods across multiple datasets. For
  * almost their original accuracy on the IMDB sentiment analysis task using
    just 20 distilled sentences.

## 2.1

* ‘Soft’ labels were recently proposed as an effective way of distilling
  networks
