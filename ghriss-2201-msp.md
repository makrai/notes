Sentiment-Aware Automatic Speech Recognition pre-training for enhanced SER
Ayoub Ghriss, Bo Yang, Viktor Rozgic, Elizabeth Shriberg, Chao Wang
ICASSP 2022 arXiv:2201.11826 [cs.CL]

* We propose a novel multi-task pre-training method for SER. We
  * pre-training simultaneously on Automatic Speech Recognition (ASR) and
    sentiment classification tasks
* We generate targets for the sentiment classification using text-to-sentiment
  model trained on publicly available data
* Finally, we fine-tune the acoustic ASR on emotion annotated speech data
* eval on the MSP-Podcast dataset, where we achieved a CCC of 0.41 for valence
* Merci: activation ccc 0.706, valence ccc 0.412, dominance ccc 0.639
