Xinxiong Chen and Lei Xu and Zhiyuan Liu and Maosong Sun and Huanbo Luan
Joint Learning of Character and Word Embeddings
2015

IDEA
    minden szóhoz egy kompizicionalizást kifejező szám?

Abstract

Chinese, a word is usually composed of several characters
characterenhanced word embedding model (CWE).
character ambiguity and non-compositional words, we propose multiple-
prototype character embeddings

1 Introduction

Distributed word representation, also known as word em-
bedding, was first proposed in [Rumelhart et al., 1986].
tasks
    language modeling [Bengio et al., 2003; Mnih and Hinton, 2008],
  ! word sense disambiguation [Chen et al., 2014],
  ! semantic composition [Zhao et al., 2015],
  ? entity recognition and disambiguation
        [Turian et al., 2010; Collobert et al., 2011],
    syntactic parsing [Socher et al., 2011; 2013] and
  ! knowledge extraction [Lin et al., 2015].
difficulties
    (1) Compared with words, Chinese characters are
    much more ambiguous.
    (2) Not all Chinese words are semantically compo-
    sitional, such as transliterated words.
rise to these challenges
    (1) several ... methods for multiple-prototype character embeddings:
        position-based, cluster-based and nonparametric method.
    (2) non-compositional words: wordlist in advance
expansibility in two aspects.
    it can be easily integrated in various word embedding methods,
    to various languages in which words contain rich internal information

2 Our Model

3 Experiments and Analysis

4 Related Work

Some work tries to reveal morphological compositionality.
    [Alexandrescu and Kirchhoff, 2006] proposed a factored neu- ral language
    model where each word is viewed as a vector of factors.
    [Lazaridou et al., 2013] explored the application of compositional
    distributional semantic models, originally de- signed to learn phrase
    meanings, for derivational morpholo- gy.
    [Luong et al., 2013] proposed a recursive neural network (RNN) to model
    morphological structure of words.
    [Botha and Blunsom, 2014] proposed a scalable method for inte- grating
    compositional morphological representations into a log-bilinear language
    model.
    These models are mostly so- phisticated and task-specific,

5 Conclusion and Future Work

