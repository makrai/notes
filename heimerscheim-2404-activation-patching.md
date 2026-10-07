How to use and interpret activation patching
  A tutorial on activation patching. 13 pages, 2 figures
Stefan Heimersheim, Neel Nanda
arXiv:2404.15255 [cs.LG]

# Abstract

* Activation patching is a popular mechanistic interpretability technique, but has
* hE many subtleties: how it is applied and how one may interpret the results.
* We provide a summary of advice and best practices, based on our experience
  * overview of the different ways to apply activation patching and a discussion
    on how to interpret the results.
* We focus on what evidence patching experiments provide about circuits, and on
  the choice of metric and associated pitfalls.

# 1 Introduction

## 1.1 What is activation patching?

* Activation patching (
  * aka Interchange Intervention, Causal Tracing, Resample Ablation, or 
    Causal Mediation Analysis) is 
  * the technique of replacing internal activations of a neural net. It is also
  * aka Causal Tracing, Resample Ablation, Interchange Intervention or more
    generally as Causal Mediation Analysis.
  * Variants (Vig+ 2020; Geiger+ 2021a; Geiger, Richardson, and Potts,
    2020; Soulos+ 2019; Finlayson+ 2021; Geiger+ 2021b; Meng+ 2022; Wang+ 2022;
    Chan+ 2022; Hase+ 2023; Hanna, Liu, and Variengien, 2023; Conmy+ 2023; Todd+
    2023; Hendel, Geva, and Globerson, 2023; Feng and Steinhardt, 2023;
    Lieberum+ 2023; Cunningham+ 2023; Stolfo, Belinkov, and Sachan, 2023;
    Goldowsky-Dill+ 2023; McDougall+ 2023; Geva+ 2023; Huang+ 2023; Merullo,
    Eickhoff, and Pavlick, 2023; Tigges+ 2023). Here 
  * we focus on the technique where 
    we overwrite some activations during a model run 
    with cached activations from a previous run (on a different input), and
    observe how this affects the model’s output.

# 1.2 How is this related to ablation?

## 1.3 An example

* eg which model internals are responsible for factual recall in ROME (Meng+ 22)
  * How does the model complete the prompt “The Colosseum is in” with the answer
  * the model activations contain many bits of information: This is an English
    sentence; The landmark in question is the Colosseum; This is a factual
    statement about a location.
  * choose which bit to change and control for the others. Patching with
    activations from 
  * “Il Colosseo è dentro” locates where the model stores the language of the
  * “The Louvre is in” locates which part of the model deals with the landmark
  * “The Colosseum is in the city of” and “The Colosseum is in the country of”
    locates the part of the model that determines which attributes of an entity
    are recalled.
* procedure typically looks like this:
  1. Choose two similar prompts that differ in some key fact or otherwise elicit
  2. Choose which model activations to patch E.g. MLP outputs
  3. Run the model with the first prompt—the source prompt—and save its internal
     activations E.g. “The Louvre is in” (source)
  4. Run the model with the second prompt—the destination prompt—but overwrite
     the selected internal activations with the previously saved ones (patching)
  5. See how the model output has changed
    * The outputs of this patched run are typically somewhere between 
  6. Repeat for all activations of interest E.g. sweep to test all MLP layers

## 1.4 What is this document about

* We: useful practical advice for activation patching, and common pitfalls
* For a general introduction to 
  mechanistic interpretability in general, and activation patching in particular
  * ARENA 1 chapter 1 (in particular activation patching in chapter 1.3) as well
  * the corresponding glossary entries on Neel Nanda’s website 2 

# 2 What kind of patching experiments provide which evidence? (Section 2)

# 3 How should you interpret activation patching results? (Section 3)

# 4 What metrics you can use, what are common pitfalls? (Section 4)
