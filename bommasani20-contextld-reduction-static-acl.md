Interpreting Pretrained Contextualized Representations 
  via Reductions to Static Embeddings
Rishi Bommasani, Kelly Davis, Claire Cardie
ACL 2020

# Abstract

* interpretability methods for static embeddings — while
  * more diverse and mature than those available for their dynamic counterparts
* we
  * introduce simple and fully general methods for converting from
    contextualized representations to static lookup-table embeddings
  * convert 5 popular pretrained models and 9 sets of pretrained weights
  * significantly improves representational quality under intrinsic evaluation
* social biases encoded in pretrained representations
  * Complementary to analyzing representational quality
  * with respect to gender, race/ethnicity, and religion
  * bias is encoded disparately across pretrained models and internal layers
    even for models with the same training data
    * dramatic inconsistencies between social bias estimators

# 1 Intro

* parallel and complementary innovations of embedding methods
alongside neural network methods for
  * in part have come from integrating additional information
    * syntax (Levy and Goldberg, 2014a; Li+ 2017),
    * morphology (Cotterell and Schütze, 2015),
    * subwords (Bojanowski+ 2017),
    * subcharacters (Stratos, 2017; Yu+ 2017) and, most recently,
    * context (Peters+ 2018; Devlin+ 2019): tremendous representational power,
* interpretability research:
  * Liu+ (2019a); Tenney+ (2019a) study what is learned across the layers of
  * Tenney+ (2019b); Ethayarajh (2019) consider what is learned from context,
  * Clark+ (2019); Michel+ (2019) look at specific attention heads,
  * Hewitt and Manning (2019); Ettinger (2020) address linguistic understanding
    such as syntax and negation, and
  * Wallace+ (2019); Tan and Celis (2019) address ethical concerns such as
    security (adversarial robustness) and social bias. In fact, the neologism
* we trying to re-purpose methods developed for analyzing static word embeddings
  * proposing a simple strategy for converting from contextualized to static 
  * method is fully general and
    * assumes only that the contextualized model maps word seqs to vector seqs
  * apply our method to 9 popular pretrained contextualized representations
  * examine the representational quality of these embeddings under intrinsic
* produces several insights regarding layer-wise lexical semantic understanding
  and representational variation in contextualized representations
* our analyses suggest constructive improvements to potentially improve
  downstream practices in using contextualized models.  Simultaneously, we find
* a lightweight mechanism for generating static embeddings that
  track with advances in contextualized representations. Since
* static embeddings have significant advantages with respect to
  * speed, computational resources, and ease of use, these results have
    * important implications for
    * resource-constrained settings (Shen+ 2019),
    * environmental concerns (Strubell+ 2019), and the broader accessibility of
  * more developed methods for embedding analysis, especially social bias. In
    * We employ methods for quantifying gender, racial/ethnic, and religious b
      (Bolukbasi+ 2016; Garg+ 2018; Manzini+ 2019)
    * proxy for understanding latent biases in the original pretrained contextal
* biases in different models and across different layers are quite disparate;
  * important consequences on model and layer selection for downstream use
  * in two sets of pretrained weights learned on the same training data,
    bias patterns still remain fairly distinct
  * existing bias estimators are dramatically inconsistent with each other
