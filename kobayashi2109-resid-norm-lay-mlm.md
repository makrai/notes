Incorporating Residual and Normalization Layers into Analysis of Masked Language Models
Goro Kobayashi, Tatsuki Kuribayashi, Sho Yokoi, Kentaro Inui
EMNLP 2021 main conference arXiv:2109.07152 [cs.CL]

https://github.com/gorokoba560/norm-analysis-of-transformer

# Abstract

* interpret the Transformer-based models, their
  * attention patterns have been extensively analyzed. However, the Transformer
* we extended the scope of the analysis of Transfo to the whole attention block
  * ie, multi-head attention, residual connection, and layer normalization. Our
* shows that the token-to-token interaction performed via attention has less
  impact on the intermediate representations than previously assumed. These
  * new intuitive explanations of existing reports; for example, discarding the
    learned attention patterns tends not to adversely affect the performance
    The codes of our experiments are publicly available

# 1 Intro

* fig 1: the contextual information contributed less to the computation of the
  output representations than previously expected

* Transformers have become a major subject of research from the viewpoints of
  * engineering (Rogers+ 2020) and
  * scientific studies (Merkx and Frank, 2021; Manning+ 2020)
* In particular, the multi-head attention, a core component of Transformers,
  (Clark+ 2019; Kovaleva+ 2019; Reif+ 2019; Lin+ 2019; Mareček and Rosa, 2019;
  Htut+ 2019; Raganato and Tiedemann, 2018; Tang+ 2018)
* these analyses suggest that the multi-head attention contributes to capturing
  linguistic information such as semantic and syntactic relations, some reports
* discarding learned attention patterns retains or even improves their perform
  * NLP (Michel+ 2019; Kovaleva+ 2019), neuroscience (Toneva and Wehbe, 2019)
  * ie the other components contribute to their progressive performance
* we broaden the scope of the analysis from the multi-head attention to the
  whole attention block, ie, the multi-head attention, residual connection, and
  layer normalization. Our analysis of the Transformer-based
  * the newly incorporated components have a larger impact than expected in
    previous studies (Abnar and Zuidema, 2020; Kobayashi+ 2020) (Figure 1)
  * More concretely, we introduce an exact decomposition of the operations in
    the whole attention block
    exploiting the norm-based analysis (Kobayashi+ 2020).  Our analysis
  * quantifies the impact of the two contrasting effects of the attention block
    * “mixing” the input representations via attention and
    * “preserving” the original input mainly via residual connection (Sec 3)
  * the preserving effect is more dominant in each attention block than
    previously estimated (Abnar and Zuidema, 2020; Kobayashi+ 2020). The
  * reveal the detailed mechanism of each component in the attention block
    * The residual connections pass through much larger vectors
      than the vectors produced by the multi-head attention
    * The layer normalization also reduces the effect of the oper via attention
* Our finding of the relatively small impact of the multi-head attention
  provides new intuitive interpretations for some existing reports, for
  * eg discarding the learned attention patterns did not adversely affect their
    performance
  * BERT (Devlin+ 2019) highlights low-frequency (informative) words in
    encoding texts, which is consistent with the existing methods for
    effectively computing text representations (Luhn, 1958; Arora+ 2017)

* 3rd contribution: We detailed the functioning of BERT:
  * BERT tends to mix a relatively large amount of contextual information into
    [MASK] in the middle and later layers; and
  * the contribution of contextual information in the attention block is
    related to word frequency
