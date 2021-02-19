# 1 Introcudtion

* Our work is based on a SOTA model proposed by (Courtland+ 2020),
  which uses pretrained contextualized language models (Devlin+ 2018).

# 2 Related Work

* most efficient systems usually exploit both prosodic and lexical features with
  (Szaszák and Tündik, 2019; Garg+ 2018; Żelasko+ 2018). Up until
* before BERT-like models, lexical features were primarily processed by 
  * recurrent neural networks (Vandeghinste+ 2018; Tündik+ 2017; Kim, 2019;
    Tilk and Alumäe, 2016; Salloum+ 2017), while more recent approaches 
* use a transformer (Chen+ 2020; Nguyen+ 2019; Cai and Wang, 2019). The current
* SOTA method by Courtland+ (2020) is a pretrained BERT, which aggregates
  multiple predictions for the same token, resulting in higher accuracy and
  significant parallelism.

# 4 Results

* uncased model is better than its cased variant for this task. This was an
* our best performing model was an uncased variation of BERT that achieved on
  par performance with the current SOTA model (Courtland+ 2020), having a
* Hubert performs significantly better (82.2 macro F 1 -score) than the best
  multilangual model with an absolute and relative difference of 12.2 and 14.84%
