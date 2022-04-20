Jose M. Tribolet and Ronald E. Crochiere
Frequency Domain Coding of Speech
1979

# Abstract

* The basic concept of [Frequency domain techniques] is to divide the speech
  into frequency components by a filter bank (sub-band coding), or by a
  suitable transform (transform coding), and then encode them using adaptive
  PCM
* design factors
  1. the type of the filter bank or transform,
  2. the choice of bit allocation and noise shaping properties involved in bit
     allocation, and
  3. the control of the step-size of the encoders
* [In this paper,] concepts of short-time analysis/synthesis are first discussed
* how practical realizations of sub-band and transform coding are interpreted
  within this framework
* Principles of spectral estimation and models of speech production and
  perception
  * how the “side information” can be most efficiently represented and
* Recent developments and examples of the ‘Vocoder-driven” adaptive transform
* coder for low bit-rate applications

# I. Introduction

* wavefomz coders and vocoders
* In frequency domain coders the speech signal is divided into a set of
  frequency components which are separately encoded
  * different frequency bands can be preferentially encoded according to
    perceptual criteria for each band, and
  * quantizing noise can be contained withm bands and prevented from creating
    harmonic distortions outside of the band
* Two basic types of frequency domain coders:
  * sub-band coders
    * the speech spectrum is partitioned into a set of, typically, 4-8
      contiguous sub-bands by means of a filter bank analysis
  * transform coders
    * a block by block transform analysis is used to
      decompose the signal into, typically, 64-512 frequency components
  * Both
    * short-time spectral analysis

# II Short-time spectral analysis and synthesis framework

* The basic concept in frequency domain coding is to divide the speech spectrum
  into frequency bands or components using either a filter bank or a block
  transform analysis. After encoding and decoding, these frequency components
  are used to resynthesize a replica of the input waveform by either filter
  bank summation or inverse transform means

# A. The Short-Time Fourier Transform

* ,,,
* the short-time Fourier transform ... can be interpreted in a
  * filter bank analysis sense or in a 
  * block Fourier transform sense

# III sub-band coding

* and they relate to the short-time analysis/synthesis model

# IV: “vocoder-driven’’ adaptive transform coding

# V other coding techniques
