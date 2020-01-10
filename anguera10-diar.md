Speaker Diarization: A Review of Recent Research
Xavier Anguera, Simon Bozonnet, Nicholas Evans, Corinne Fredouille, Gerald Friedland, Oriol Vinyals
2010

#Abstract

* task of determining “who spoke when?” in an audio or video recording 
  * unknown amount of speech and also an 
  * unknown number of speakers.
* different problems, such as having access to 
  * multiple microphones and multimodal information or overlapping speech.
* we review the current state-of-the-art, focusing on research developed since
  2006 that relates predominantly to speaker diarization for conference
  meetings. Finally, we present an analysis of speaker diarization performance
  as reported through the NIST Rich Transcription evaluations on meeting data
* organized as
  * Section II presents a brief history of speaker diarization research and the
    transition to the conference meeting domain.  We describe the main
    differences between broadcast news and conference meetings and present a
    high-level overview of current approaches to speaker diarization. 
  * Section III we present a more detailed description of the main algorithms
    that are common to many speaker diarization systems, in- cluding those
    recently introduced to make use of information coming from multiple
    microphones, namely delay-and-sum beamforming. 
  * Section IV presents some of the most recent work in the field including
    efforts to handle multimodal information and overlapping speech. We also
    discuss the use ofFIRST DRAFT SUBMITTED TO IEEE TASLP: 19 AUGUST 2010
    features based on inter-channel delay and prosodics and also attempts to
    combine speaker diarization systems. 
  * Section V, we present an overview of the current status in speaker
    diarization research. We describe the NIST RT evaluations, the different
    datasets and the performance achieved by state- of-the-art systems. We also
    identify the remaining problems and highlight potential solutions in the
    context of current work.

#Speaker diarization

##B. Main Approaches

* Most of present state-of-the-art speaker diarization systems fit into one of
  two categories: the bottom-up and the top-down [number of clusters]
* Both bottom-up and top-down approaches are generally based on Hidden Markov
  Models (HMMs) where each state is a Gaussian Mixture Model (GMM)
* we briefly outline the 
  * standard bottom- up and top-down approaches as well as
  * two recently proposed alternatives: 
    * one based on information theory; and a 
    * second one based on a non parametric Bayesian approach
    * these new approaches have not been reported previously in the context of
      official NIST RT evaluations they have shown strong potential on NIST RT
      evaluation datasets and are thus included here. Additionally, some other
      works propose 
  * sequential single-pass segmentation and clustering approaches [5]–[7],
    * fall short of the state-of-the-art.
