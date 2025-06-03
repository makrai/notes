Separation of Emotional and Reconstruction Embeddings on Ladder Network
  to Improve SER in Noisy Conditions. 
Seong-Gyun Leem, Daniel Fulford, Jukka-Pekka Onnela, David Gard, Carlos Busso
Proc.  Interspeech 2021, 2871-2875, doi: 10.21437/Interspeech.2021-1438

# Abstract

* When speech emotion recognition (SER) is applied in an actual application,
  the system should be able to cope with noisy audio acquired in a ,
  * Most studies on noise-robust SER either/or
    * require a parallel dataset with emotion labels, which is impractical to
    * use speech with artificially added noise !~ practical conditions. This
* we: ladder network formulation, which 
  * can effectively compensate the environmental differences between a clean
    speech corpus and real-life recordings. This study proposes a 
  * decoupled ladder network, which increases the robustness of the SER system
    against the influences of non-stationary background noise 
    by decoupling the last hidden layer embedding into emotion and
    reconstruction embeddings.
  * allows the emotion embedding to focus exclusively on building a
    discriminative representation, without worrying about the reconstruction
* We introduce a noisy version of the MSP-Podcast database, which contains
  * audio segments collected with a smartphone that simultaneously records
    sentences from the corpus and non-stationary noise at different
    signal-to-noise ratios (SNRs). We test the effectiveness of our proposed
  * the decoupled ladder network can increase the performance of the regular
    ladder network when dealing with noisy recordings.
* future work
  * stronger constraints on the DLN that can further reduce the dependencies
    between the emotional and reconstruction embeddings, which we expect to
  * multi-task learning (MTL) framework, which has showed better performance
    than singletask learning for dense network [34], and ladder network [25].
