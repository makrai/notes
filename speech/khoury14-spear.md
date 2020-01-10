Elie Khoury, Laurent El Shafey, Sébastien Marcel
Spear: an open source toolbox for speaker recognition based on bob
2011

http://pypi.python.org/pypi/bob.spear

#Abstract

* Spear, an
  * open source and extensible toolbox for state-of-the-art speaker recognition
  * built on top of Bob, a free signal processing and machine learning lib
  * implements a set of complete speaker recognition toolchains, including
    * all the processing stages from the
      * front-end feature extractor to the
      * final steps of decision and evaluation
    * Several state-of-the-art modeling techniques are included, such as
      * Gaussian mixture models,
      * inter-session variability,
      * joint factor analysis and
      * total variability (i-vectors)
  * can be easily evaluated on well-known databases such as
    * NIST SRE and
    * MOBIO
      * As a proof of concept, an experimental comparison of different
      * modeling techniques is conducted on the MOBIO database

#1. Introduction

* new paradigms such as
  * session variability modeling [1, 2] and
  * total variability (i-vectors) modeling [3]. Furthermore, it benefited from
  * improvements in channel compensation [4, 5, 6] and
  * noise reduction [7, 8] techniques. In addition,
* such techniques have successfully been used for
  * other speakerbased tasks (e.g. speaker diarization [9]) and
  * other biometric modalities (e.g. face recognition [10])
* typical speaker recognition toolchain consists of
  * speech activity detection,
  * feature extraction and normalization,
  * background modeling,
  * target speaker enrollment,
  * matching (score computation),
  * score normalization and
  * decision
* database is usually split into
  * three subsets: background training, development (DEV) and evaluation (EVAL)
  * Both DEV and EVAL subsets are further split into enrollment (DEV.Enroll
  * and EVAL.Enroll) and test (DEV.Test and EVAL.Test)
* to the best of our knowledge, the first
  * open source and extensible toolbox that provides complete toolchains for
  * stateof-the-art speaker recognition,
    * from the front-end feature extractor
    * to the final steps of decision and evaluation

#2. Prior work

* front-end level, feature extraction
  * HTK (Hidden Markov Model Toolkit) and
  * SPro (speech signal processing toolkit)
* voice activity detection
  * [15] T. Kinnunen and P. Rajan,
  * A practical, self-adaptive voice activity detector
    * for speaker verification with noisy telephone and microphone data,”
  * in IEEE ICASSP, 2013
* modeling and classification, researchers often use the
  * GMM implementation of HTK or Matlab, the
  * JFA Matlab implementation from Brno University of Technology 4 or the
  * support vector machine (SVM) implementation in LIBSVM 5 
* score calibration and fusion, decision and evaluation,
  * BOSARIS 6 or
  * Focal 7 toolkits are mainly used
* Therefore, to build their systems, researchers are often constrained to
  * several programming and scripting languages,
  * different types and versions of operating systems, as well as
  * various file formats
* open source toolboxes where several speaker recognition modules are connected
  * Munich automatic speaker verification framework (MASV) [16]
    * depends on HTK and Matlab that have license restrictions
    * outdated (last update dates back to 2004), and thus does
      * not include ... JFA and i-vectors
* the closest competitor to Spear is probably ALIZE [17, 18] ... Unlike Spear
    * not contain an integrated feature extraction module,
      * but is able to read features extracted with both HTK and SPro. In
      * addition, it does not benefit from
    * no userfriendly and Matlab-like scripting languages such as Python,
    * no file format for storing and managing data
      * (only “raw” and “txt” formats supported)
      * (e.g. no model or score files)

#3. Spear toolbox

* use of Bob
  * efficient C++ implementations of a large set of machine learning and
  * signal processing algorithms
  * Python environment
  * relies on the open and portable HDF5 library and file format
    * for which many tools are already available for visualization and
    * analysis purposes. The entire code is
  * well documented and nightly tested against several platforms
* takes advantages of the experience acquired from facereclib 10 [14],
  * an open source face recognition toolbox that aims to
  * compare a variety of state-of-the-art algorithms
  * on several facial image databases
  * local workstation (single or multiple processes) or on a grid computing
#3.1. Preprocessing
#3.2. Feature extraction
#3.3. Modeling, enrollment, and score computation
#3.4. Score Fusion
#3.5. Decision and Evaluation
#3.6. Databases

#4. Experiments

#5. Conclusions

* contributions are encouraged and will be integrated
