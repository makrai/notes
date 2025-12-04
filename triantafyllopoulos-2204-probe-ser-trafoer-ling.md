Probing Speech Emotion Recognition Transformers for Linguistic Knowledge
Andreas Triantafyllopoulos, Johannes Wagner, Hagen Wierstorf,
  Maximilian Schmitt, U Reichel, F Eyben, F Burkhardt, BW Schuller
INTERSPEECH 2022

* transformers: Large, pre-trained neural networks consisting of self-attention
* SOTA results on several speech emotion recognition (SER) datasets
* pre-trained in self-supervised manner with the goal of speech recognition
* ie transformers understand linguistic information
* we: the extent in which this information is exploited during SER fine-tuning
* we synthesise prosodically neutral speech utterances while varying the senti
  * Using a reproducible methodology based on open-source tools,
* Valence predictions of the transformer model are
  * very reactive to positive/negative sentiment content and negations
  * not to intensifiers or reducers
  * none of those linguistic features impact arousal or dominance

# Conclusion

* We presented a three-stage probing methodology for quantifying the dependence
* we analyse the behaviour of a recent SOTA model
* the success for the valence dimension can be partially attributed to
  linguistic knowledge encoded in the self-attention layers
* we uncover a potentially spurious correlation between valence and negations
  * could hamper performance in real-world applications
* Future work
  * expanding the set of probing features
  * emotional voice conversion [33] to control the emotional expressivity of
    synthesised samples as another parameter [34]
    * K Zhou, B Sisman, R Liu, and H Li,
      “Emotional voice conversion: Theory, databases and ESD,”
      Speech Communication, vol. 137, pp. 1–18, 2022
