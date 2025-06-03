Dual-path Convolutional Image-Text Embeddings with Instance Loss
Zhedong Zheng, Liang Zheng, Michael Garrett, Yi Yang, Mingliang Xu,
  Yi-Dong Shen 
2020 ACM Transactions on Multimedia Computing, Communications, and Applications

# Abstract

* Matching images and sentences demands a fine understanding of both modalities.
* we discriminatively embed the image and text to a shared visual-textual space.
* most existing works apply the ranking loss to pull the positive image/text
  pairs close and push the negative pairs apart from each other.
  * hE directly deploying the ranking loss on heterogeneous features (ie, text
    and image features) is less effective, because it is hard to find
    appropriate triplets at the beginning. So the naive way of using the ranking
    loss may compromise the network from learning inter-modal relationship. To
  * we propose the instance loss, which explicitly considers the intra-modal
    data distribution. It is based on an unsupervised assumption that each
    image/text group can be viewed as a class. So the network can learn the fine
    granularity from every image/text group. The experiment shows that the
    instance loss offers better weight initialization for the ranking loss, so
    that more discriminative embeddings can be learned.
* minor contribution: we construct an end-to-end dual-path convolutional network
  to learn the image and text representations. End-to-end learning allows the
  system to directly learn from the data and fully utilize the supervision. On
  two generic retrieval datasets (Flickr30k and MSCOCO), experiments demonstrate
  that our method yields competitive accuracy compared to SOTA methods.
  Moreover, in language-based person retrieval, we improve the SOTA by a large
  margin. The code has been made publicly available.
