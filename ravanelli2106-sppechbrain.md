SpeechBrain: A General-Purpose Speech Toolkit
M Ravanelli, T Parcollet, P Plantinga, A Rouhe, S Cornell, L Lugosch,
  C Subakan, N Dawalatabad, A Heba, J Zhong, J Chou, S Yeh, S Fu, C Liao,
  E Rastorgueva, F Grondin, W Aris, H Na, Y Gao, R De Mori, Y Bengio
arXiv:2106.04624 [eess.AS]

* SpeechBrain is an open-source and all-in-one speech toolkit. It is 
* designed to facilitate the research and development of neural speech proc
* simple, flexible, user-friendly, and well-documented.
* This paper describes the core architecture designed to support several tasks
  of common interest, allowing users to naturally conceive, compare and share
  novel speech processing pipelines. SpeechBrain achieves 
* competitive or SOTA performance in a wide range of speech benchmarks. It
* training recipes, pretrained models, and inference scripts
  for popular speech datasets, as well as 
* tutorials which allow anyone with basic Python proficiency to familiarize

# 1 Intro

* Open-source toolkits for speech processing technology [1–5]. 
  * Kaldi [5] is an established speech recognition framework, which is
    implemented in C++ with recipes built on top of Bash, Perl, and Python
    * efficient, hE its use of C++ can make prototyping of new deep lear diffic
  * more flexible speech recognition frameworks have quickly appeared
    <~ general-purpose deep learning libraries like TensorFlow [6] and PyTorch
    * eg DeepSpeech [8], RETURNN [9], PyTorch-Kaldi [10], Espresso [11],
      Lingvo [12], Fairseq [13], ESPnet [14], and NeMo [15].
* task-specific libraries have also been released. 
  * Examples are 
    * Asteroid [16] for speech separation, 
    * pyannote [17] and sidekit [18] for speaker diarization, and
    * s3prl [19] for self-supervised speech representations. While excelling at
  * hE different coding styles, standards, and programming languages, making it
    challenging and time-consuming to migrate from one codebase to another.
    * their combination in complex speech processing pipelines poses a
      challenge for interoperability, as connecting different frameworks might
      be unnatural and their codebases can interact in unpredictable ways.
* a single, flexible, multi-task toolkit can significantly speed up the
  development of speech technologies. Due to growing interest in 
  * end-to-end spoken dialog systems (e.g., virtual assistants), implementing
    composite pipelines within an integrated toolkit offers many advantages. A
  * transfer learning and joint training techniques across different tasks
    [20–23] and enables the creation of
  * fully differentiable graphs where multiple technologies are trained jointly
* we have developed SpeechBrain3 , an all-in-one PyTorch-based toolkit
  designed to facilitate the development, portability, and ease of use of
  speech processing technologies.
  * a holistic system capable of performing multiple tasks at once, for
    eg recognize speech, understanding its content, language, emotions, and
    speakers. Our toolkit is not only 
  * intended for speech researchers + the broader machine learning community,
    enabling users to easily integrate their models into different speech
    pipelines and compare them with state-of-the-art (SotA) baselines.
* contributions in this paper are:
  * The presentation of SpeechBrain, with an
    emphasis on how we designed it to support multiple tasks without
    * simplicity, modularity, or flexibility.
  * The implementation and experimental validation of both
    recent and long-established speech processing models with
    SotA or competitive performance on a variety of tasks (cf. Table 1).  More
    * potential to significantly accelerate speech research and innovation in

# 6 Limitations [of the paper and SpeechBrain] and Future Work

* SpeechBrain supports many other 
  * tasks, including spoken language understand- ing, keyword spotting,
    multi-microphone signal processing, and language modeling. The toolkit also
  * NN: complex [97] and quaternion neural networks [98]. Please refer to A.3
    for further details. It 
* SpeechBrain does not currently support 
  * text-to-speech, which will be added shortly (pending pull-requests under
    review). In the future, we plan to support 
  * decoding with Finite State Transducers (FSTs) [99] and are considering to
    adopt the FST implementation of the ongoing k2 project [100] once stable.
  * real-time speech processing, which was not the main focus of the first
  * additional languages and recipes to open-source datasets not yet available
    (eg TED-LIUM [101])
