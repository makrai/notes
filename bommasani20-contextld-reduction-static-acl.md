Interpreting Pretrained Contextualized Representations via Reductions to Static Embeddings 
Rishi Bommasani, Kelly Davis, Claire Cardie
ACL 2020

# Abstract

* In some settings, contextualized representations (e.g. ELMo, BERT) rendered
  their static embedding predecessors (e.g. Word2Vec, GloVe) obsolete. As a
* older interpretability methods for static embeddings — while 
  * more diverse and mature than those available for their dynamic counterparts
* we 
  * introduce simple and fully general methods for converting from
    contextualized representations to static lookup-table embeddings which we
  * apply to 5 popular pretrained models and 9 sets of pretrained weights.  Our
  * significantly improves representational quality under intrinsic evaluation.
* social biases encoded in pretrained representations 
  * Complementary to analyzing representational quality, we consider 
  * with respect to gender, race/ethnicity, and religion and find that 
  * bias is encoded disparately across pretrained models and internal layers
    even for models with the same training data. Concerningly, we find 
    dramatic inconsistencies between social bias estimators for word embeddings
