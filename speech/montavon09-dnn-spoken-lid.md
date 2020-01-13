Grégoire Montavon
2009
Deep learning for spoken language identification

# Abstract
  * small speech samples, extracted features

# 2 Design and implementation

* datasets:
  * VoxForge 
    * multilingual speech samples available on the VoxForge [9] website.
    * 5 seconds speech samples associated with different metadata 
    * samples are recorded by users with their own microphones
    * 25420 English samples, 4021 French samples and 2963 German samples.  
  * RadioStream 
    * samples ripped from several web radios. 
    * virtually infinite number of samples, excellent quality
    * some samples are music sequences or interviews in foreign languages.  
* spectrogram of 39 × 600 pixels is constructed where
  * the y-axis represents 39 mel-frequencies between 0 and 5 kHz and 
  * the x-axis represents 600 observed times spaced by 8.33 milliseconds. 
  * Each frequency of the spectrogram is captured using a Hann window.
* The classifier 
  * time-delay neural network (TDNN) with two-dimensional convolutional layers
    * a simple summation on the outputs of the convolutional layers. The
      architecture is implemented with the Torch5 [7]
    * TDNN is motivated by good results obtained for speech recognition 
    * convolutional layers ... is motivated by good results [in vision]
