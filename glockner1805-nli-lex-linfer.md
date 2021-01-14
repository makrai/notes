Breaking NLI Systems with Sentences that Require Simple Lexical Inferences
Max Glockner, Vered Shwartz, Yoav Goldberg
arXiv:1805.02266 [cs.CL]

* simpler than the SNLI test set, containing 
  sentences that differ by at most one word from sentences in the training set.
* performance on the new test set is substantially worse across systems trained
  on SNLI, demonstrating that these systems are limited in their generalization
  ability, failing to capture many simple inferences. 

# Intro

* Following the release of the large-scale SNLI dataset (Bowman+ 2015), many
  end-to-end neural models have been developed for the task, achieving high
  accuracy on the test set. As opposed to 
  * previous-generation methods, which relied heavily on lexical resources,
  * neural models only make use of pre-trained word embeddings. The few efforts
  * incorporate external lexical knowledge resulted in negligible performance
    gain (Chen+ 2018). This raises the 
* question whether 
  * neural methods are inherently stronger, 
    obviating the need of external lexical knowledge; 
  * large-scale training data allows for implicit learning of lexical knowledge;
  * the NLI datasets are simpler than early RTE datasets, requiring less knowl
