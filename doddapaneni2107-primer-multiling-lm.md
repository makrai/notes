A Primer on Pretrained Multilingual Language Models
Sumanth Doddapaneni, Gowtham Ramesh, Anoop Kunchukuttan, P Kumar, MM Khapra
arXiv:2107.00676 [cs.CL]

* Multilingual Language Models (MLLMs) such as mBERT, XLM, XLM-R, \textit{etc.}
* success in zero shot transfer learning, there has emerged 
* a large body of work in 
  * building bigger MLLMs covering a large number of languages 
  * creating exhaustive benchmarks covering a wider variety of tasks and langs
  * analysing their performance on monolingual, zero shot crosslingual, & biling
  * understanding the universal language patterns (if any) learnt by MLLMs and 
  * augmenting the (often) limited capacity of MLLMs to improve their
    performance on seen or even unseen languages. In this survey, we review the

# 1 Intro

* multilingual language models (MLLMs) such as 
  * mBERT (Devlin+ 2019), XLM (Conneau and Lample, 2019), XLM-R (Conneau+ 2020a) 
  * low resource languages may benefit from high resource languages 
    * due to shared vocabulary, genetic relatedness (Nguyen and Chiang, 2017)
      or contact relatedness (Goyal+ 2020).  
* MLLMs differ in the 
  * architecture (e.g., number of layers, parameters, etc), 
  * objective functions used for training (e.g., monolingual masked language
    modeling objective, translation language modeling objective, etc), 
  * data used for pretraining (Wikipedia, CommonCrawl, etc) and the 
  * number of languages involved (ranging from 12 to 100).
* tradeoff in the performance compared to a monolingual model? More
  * for a given language is a-language-specific BERT better than a MLLM? For
  * capacity dilution (i.e., the entire capacity of the model is dedicated to a
    single language), whereas the advantage of the latter is that there is
  * additional pretraining data from multiple (related) languages. In this
  * existing studies 
    (Conneau+ 2020a; Wu and Dredze, 2020; Agerri+ 2020; Virtanen+ 2019;
    Rönnqvist+ 2019; Ro+ 2020; de Vargas Feijó and Moreira, 2020; 
    Virtanen+ 2019; Wang+ 2020a; Wu and Dredze, 2020) which show that 
  * depends on model capacity, amount of pretraining data, 
    fine-tuning mechanism and amount of task-specific training data.  
* zero shot crosslingual transfer (K+ 2020) from a resource rich language to a
  * benchmarks, e.g. XGLUE (Liang+20), XTREME (Hu+20), XTREME-R (Ruder+21) have
  * a wide variety of tasks such as classification, structure prediction,
    Question Answering, and crosslingual retrieval. Using these benchmarks
  * studies (Pires+ 2019; Wu and Dredze, 2019; K+ 2020; Artetxe+ 2020a; 
    K+ 2020; Dufter and Schütze, 2020; Liu+ 2020a; Lauscher+ 2020; Liu+ 2020c;
    Conneau and Lample, 2019; Wang+ 2019; Liu+ 2019a; Cao+ 2020; Wang+ 2020d;
    Zhao+ 2020; Wang+ 2020b; Chi+ 2020b) have studied the crosslingual
  * transfer depends on the amount of shared vocabulary, explicit alignment of
    representations across languages, size of pretraining corpora, etc. We 
* bilingual tasks.  For example
  * could the shared representations learnt by MLLMs improve MT between two
    resource rich languages?  We survey 
  * several works (Conneau and Lample, 2019; Kakwani+ 2020; Huang+ 2019;
    Conneau+ 2020a; Eisenschlos+ 2019; Zampieri+ 2020; Libovický+ 2020; Jalili
    Sabet+ 2020; Chen+ 2020; Zenkel+ 2020; Dou and Neubig, 2021; Imamura and
    Sumita, 2019; Ma+ 2020; Zhu+ 2020; Liu+ 2020b; Xue+ 2021) which use MLLMs
  * tasks such as unsupervised machine translation, 
    crosslingual word alignment, crosslingual QA, etc. We summarise the main
  * summ: MLLMs are useful for bilingual tasks, particularly in low resource
* universal patterns. However, our survey of the studies in this space
  * no consensus yet. While representations learnt by MLLMs share
  * commonalities identified by different correlation analyses, 
  * hE, these commonalities are 
    * dominantly within languages of the same family, and 
    * only in certain parts of the network (primarily middle layers).  Also,
  * tasks benefit?
    * probing tasks such as POS tagging are able to benefit from commonalities
    * harder tasks such as evaluating MT quality remain beyond the scope as
  * not yet represent inter-lingua.  
* extend it to new languages which weren’t a part of the initial pretraining.
  * extending MLLMs to unseen languages, and 
  * improving the capacity (and hence performance) of MLLMs for seen languages
  * techniques range 
    * fine-tuning the MLLM for a few epochs on the target language to using
    * language and task specific adapters to augment the capacity of MLLMs
