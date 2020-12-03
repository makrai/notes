Yann LeCun, Yoshua Bengio, & Geoffrey Hinton
Deep learning
2015 nature

# Abstract

# [Intro]

* For decades, feature extraction
  * required careful engineering and considerable domain expertise 
* Representation learning
* Deep-learning methods are 
  * representation-learning methods with 
  * multiple levels of representation, obtained by 
    * composing simple but non-linear modules that
    * each transform the representation into slightly more abstract level
  * very complex functions can be learned
  * higher layers of representation 
    * amplify aspects of the input that are important for discrimination and
    * suppress irrelevant variations. 
  * image, for example
    * an array of pixel values
    * the presence or absence of edges at particular orientations and locations 
    * motifs by spotting particular arrangements of edges
    * parts of familiar objects, and
    * objects as combinations of these parts.
  * features are learned using a general-purpose learning procedure.
* achievements
  * image recognition 1–4 and 
  * speech recognition 5–7 , 
    * 5.   
      * Mikolov, T., Deoras, A., Povey, D., Burget, L. & Cernocky, J.
      * Strategies for training large scale neural network language models. 
      * In Proc. Automatic Speech Recognition and Understanding 196–201 (2011).
    * 6.   
      * Hinton, G.+ 
      * Deep neural networks for acoustic modeling in speech recognition. 
      * IEEE Signal Processing Magazine 29, 82–97 (2012).  
      * This joint paper from the major speech recognition laboratories,
        summarizing the breakthrough achieved with deep learning on the task
        of phonetic classification for automatic speech recognition, was the
        first major industrial application of deep learning.  
    * 7.   
      * Sainath, T., Mohamed, A.-R., Kingsbury, B. & Ramabhadran, B.  
        Deep convolutional neural networks for LVCSR. 
        In Proc. Acoustics, Speech and Signal Processing 8614–8618 (2013).
  * sci
    * predicting the activity of potential drug molecules 8 , 
    * analysing particle accelerator data 9,10 , 
    * reconstructing brain circuits 11, and 
    * predicting the effects of mutations in non-coding DNA 
      * on gene expression and disease 12,13
  * natural language understanding (Collobert+ 2011)., particularly 
    * topic classification,
    * sentiment analysis, 
    * question answering 15 and 
    * language translation
      16.  Jean, S., Cho, K., Memisevic, R. & Bengio, Y. 
        On using very large target vocabulary for neural machine translation. 
        In Proc. ACL-IJCNLP http://arxiv.org/abs/1412.2007 (2015).
      17.  Sutskever, I. Vinyals, O. & Le. Q. V. 
        Sequence to sequence learning with neural networks. 
        NIPS (2014).  
      * state-of-the-art machine translation results with the 
        * architecture introduced in Cho+ (2014), with a 
          * recurrent network
          * read a sentence in one language, 
          * produce a semantic representation of its meaning, and 
          * generate a translation in another language.

# Supervised learning

# Backpropagation to train multilayer architectures

# Convolutional neural networks

# Image understanding with deep convolutional networks

# Distributed representations and language processing

# Recurrent neural networks

# The future of deep learning

* Unsupervised learning
* vision
  * Human vision is an active process that sequentially samples the optic
    * array in an intelligent, task-specific way using 
    * a small, high-resolution fovea with a 
    * large, low-resolution surround
  * Systems combining deep learning and reinforcement learning
  * future
    * traine end-to-end and combine ConvNets with RNNs that use
    * reinforcement learning to decide where to look.
  * present
    * in their infancy, but they already
    * outperform passive vision systems 99 at classification tasks and
    * produce impressive results in learning to play  video games 100 .
* Natural language understanding 
  * learn strategies for selectively attending to one part at a time
* artificial intelligence 
  * will combine representation learning with complex reasoning.
    * replace rule-based manipulation of symbolic expressions 
      * by operations on large vectors
