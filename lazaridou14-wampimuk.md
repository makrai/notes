Angeliki Lazaridou and Elia Bruni and Marco Baroni
2014
Is this a wampimuk?
  Cross-modal mapping between distributional semantics and the visual world

# Abstract

Following up on recent work on establishing a mapping between
    vector-based semantic embeddings of words and 
    the visual representations of the corresponding objects
zero-shot learning
fast mapping, a challenging and more cognitively plausible variant of
the zero-shot task, in which the learner is exposed to new objects and the
corresponding words in very limited linguistic contexts

# 1 Introduction

* Computational models of meaning that 
    rely on corpus-extracted context vectors ... 
    capturing some crucial aspects of how humans acquire and use language
        (Landauer and Dumais, 1997; Lenci, 2008).
grounding problem
reference
    visual information is being provided to an agent about the current
    state of the world, and the agent’s task is to determine the truth of
    a statement similar to There is a dog in the room
enrich context vectors with visual information 
    (Bruni et al., 2014; Feng and Lapata, 2010; Leong and Mihalcea, 2011;
    Regneri et al., 2013; Silberer et al., 2013)
In this paper
    the same image analysis techniques
    the reference problem
    not aim at enriching word representations:
    mapping objects, as depicted in images, 
        to the context vectors representing the corresponding words
        through a hidden layer that can be interpreted as 
            a cross-modal semantic space.
zero-shot learning task (Palatucci et al., 2009)
    in the machine learning community 
        (Frome et al., 2013; Socher et al., 2013)
    competitive with respect to the recently proposed alternatives, while
    being overall simpler
    interesting from an engineering point of view. However, from a cognitive
    angle, ... unrealistic
we
    linguistic context vector representing the word has been created from as
    little as 1 sentence containing it
    complement recent work (Frome et al., 2013) 
        Frome-ról nagyrészt hallgat, mint büdös disznó a zabban
    and show that zero-shot learning scales to a large and noisy dataset

# 2 Related Work

Socher et al. (2013) 
    outlier detector
    10 concepts are considered, compared to our experiments with hundreds
    or thousands of concepts
Frome et al. (2013) focus on zero-shot learning
    feed low-level features to a deep neural network trained on a supervised
    object recognition task
traditional distributional vectors bearing other desirable properties,
such as high interpretability of dimensions

# 3 Zero-shot learning and fast mapping

“We found a cute, hairy wampimuk sleeping behind the tree.” 
new concepts are assumed to be encounted in a limited linguistic context

## 4.4 Cross-modal Mapping

We implement 4 alternative learning algorithms for inducing the
cross-modal projection function fproj_{v→w}
    Linear Regression
        similar to the one introduced by Mikolov et al. (2013a) for estimating
        a translation matrix
    Canonical Correlation Analysis (CCA)
        have been successfully used in the past for annotation of regions
        (Socher and Fei-Fei, 2010) and complete images (Hardoon et al., 2006;
        Hodosh et al., 2013).
        linear relationship
        good approximation to human concept similarity judgments (Silberer and
        Lapata, 2012).
    SVD
        is also a way to infer values of unseen dimensions in partially
        incomplete matrices
    Neural Network
        with one hidden layer
        non-linear activation functions. We experimented with sigmoid,
        hyperbolic tangent and linear; hyperbolic tangent yielded the
        highest performance
        cosine as similarity function
            it has been shown to outperform Euclidean distance (Bullinaria and
            Levy, 2007
            Parameters were estimated with standard backpropagation and L-BFGS

# 5 Results

For the zero-shot task we report the [top k accuracy] with the union of
seen and unseen concepts. 
For fast mapping, we report the mean rank of the correct concept among
fast mapping candidates

## 5.1 Zero-shot Learning in CIFAR-100

    all concepts but one as seen concepts
    nn: 20 hidden units
    SVD: 300 dimensions 
    NN > lin > cca, svd > chance
    5.1.1 Concept Categorization
    In order to gain qualitative insights: interpretability of the hidden
    layer
    which visual concepts result in the highest hidden unit activation
    hidden layer acts as a cross-modal concept categorization/organization
    system

## 5.2 Zero-shot Learning in ESP

    tuning the number of hidden units of NN
    train on 70%, test on 30%
    To the best of our knowledge, this is the first time this task has been
    performed on a dataset as noisy as ESP

## 5.3 Fast Mapping in ESP

    context n: n sentences, n = 1, 5, 10, 20, full
    visual -> word    
        more plausible task than vice versa
        once the learner observes a new object, she can easily construct a
        full visual representation for it
        qualitative analysis

# 6 Conclusion

we plan to experiment in the future with more sophisticated neural
network architectures inspired by recent work in machine translation (Jianfeng Gao
et al., 2013) and multimodal deep learning (Srivastava and Salakhut-
dinov, 2012).
