CulturaX: A Cleaned, Enormous, and Multilingual Dataset for LLMs in 167 Langs
Thuat Nguyen, Chien Van Nguyen, Viet Dac Lai, Hieu Man, Nghia Trung Ngo,
  Franck Dernoncourt, Ryan A. Rossi, Thien Huu Nguyen
arXiv:2309.09400 [cs.CL]

* LLMs, especially the recent SOTA models, they are often not fully disclosed
* Creating training data for high-performing LLMs involves extensive cleaning
  and deduplication to ensure the necessary level of quality
* The lack of transparency for training data has thus hampered research on
  * attributing and addressing hallucination and bias issues in LLMs, hindering
  * replication efforts and further advancements in the community. These
* multilingual learning scenarios, where the available multilingual text
  datasets are often inadequately collected and cleaned
  * no open-source and readily usable dataset to effectively train LLMs in
* we present CulturaX, a substantial multilingual dataset with
  * 6.3 trillion tokens in 167 languages, tailored for LLM development. Our
* meticulous cleaning and deduplication through a rigorous pipeline 
  * language identification, URL-based filtering, metric-based cleaning,
    document refinement, and data deduplication
  * fully released to the public in HuggingFace to facilitate research and

# 1 Intro

* emergent abilities (Brown+ 2020; Wei+ 2022)
  J Wei, Y Tay, R Bommasani, C Raffel, B Zoph, S Borgeaud, D Yogatama,
    M Bosma, D Zhou, D Metzler, E Huai hsin Chi, T Hashimoto, O Vinyals,
    P Liang, J Dean, W Fedus
  Emergent abilities of large language models.  
  2022 Transactions on Machine Learning Research
* transformer architecture (Vaswani+ 2017), three major variants of LLMs have
  * encoder-only models to encode input texts into representation vectors, eg
    BERT (Devlin+ 2019) and RoBERTa (Liu+ 2019); the 
  * decoder-only models to generate texts, eg GPT (Radford+ 2019; Brown+ 2020);
  * encoder-decoder models to perform sequence-to-sequence generation,
    eg BART (Lewis+ 2020) and T5 (Raffel+ 2020)
* scaling laws (Hernandez+ 2022)
  * model: BERT had a mere few hundred million parameters (Devlin+ 2019),
    recent GPT-based models have been expanded to encompass 100 Bs 
    (Shoeybi+ 2019; Scao+ 2022; Lieber+ 2021; Chowdhery+ 2022)
  * training datasets for LLMs have grown exponentially, evolving from a modest
    * 13GB of text data from Wikipedia and books used for BERT (Devlin+ 2019;
      Liu+ 2019) to consume 
    * terabytes of data for the latest models, such as Falcon (Penedo+ 2023),
      MPT (MosaicML, 2023), LLaMa (Touvron+ 2023), PolyLM (Wei+ 2023) and
      ChatGPT1 
* obtainable either/or through 
  * commercial APIs, as illustrated by ChatGPT and GPT4, or via 
  * open-source initiatives, exemplified by Falcon and LLaMa
* training datasets that underpin the SOTA models have mostly remained closely
  guarded secrets, even in the case of open-source LLMs such as BLOOM, LLaMa,
  MPT, and Falcon. For example, 
  * Falcon (Penedo+ 2023) and BLOOM (Scao+ 2022) only provide a glimpse 
  * MPT’s, LLaMa’s and PolyLM’s datasets (Touvron+ 2023; Wei+ 2023) remain
    inaccessible to the public. On one hand, the lack of transparency has
  * consequence
    * impeds indepth analysis and comprehension of LLMs, hindering crucial
    research into attributing and addressing fundamental issues stemming from
    the training data, such as hallucinations, biases, and toxic content
    (Tamkin+ 2021; Weidinger+ 2021; Kenton+ 2021; Bommasani+ 2021). On the
  * restricts the development of LLMs to a select few stakeholders 
    * constraining the democratization and benefits of the technology and
      exacerbating its biases within broader society
* high-quality training corpora are often crafted through the application of
  extensive data cleaning and deduplication processes, aimed at eliminating
  noisy and redundant content from vast text collections (Allamanis, 2018;
  Penedo+ 2023). To this end, there have been recent efforts from the community
  * open-source datasets for LLMs, such as RedPajama with 1.21T tokens
    (Computer, 2023), SlimPajama2 with 627B tokens, and AI2 Dolma3 with 3T
    tokens. However, 
* LLMs when applied to non-English languages, particularly those with limited
  linguistic resources (Bang+ 2023; Lai+ 2023)
  
* multilingual datasets have been developed and made available, providing text
  * quality and scale fall short of meeting the requirements for training
    high-performing LLMs. Specifically, the multilingual text dataset sourced
  * Wikipedia: high quality, is regarded as relatively small when it comes to
    training LLMs (Conneau+ 2020). The 
  * OSCAR datasets (Ortiz Suárez+ 2019; Ortiz Suárez+ 2020; Abadji+ 2021,
    2022)4 extract text data from CommonCrawl (CC) for more than 160 languages
    * lack document-level deduplication (ie, removing similar documents)
    * impairing the performance of generative LLMs (Lee+ 2022). Similarly, the
  * mC4 (Xue+ 2021), CCAligned (Conneau+ 2020), WikiMatrix (Schwenk+ 2021), and
    ParaCrawl (Bañón+ 2020) datasets altogether support over 100 languages but
    * less accurate language identification, introducing noise (Kreutzer+ 2022)
    * not deduplicated at fuzzy and document levels, eg via MinHash (Broder,
      1997). Additionally, 
  * the CC100 dataset (Wenzek+ 2020; Conneau+ 2020), 
    * employed in training the multilingual XLM-RoBERTa model across 100 langs,
    * only considers the snapshots of CC in 2018, constraining its size and the
      availability of up-todate information to train high-performing LLMs
* we: a novel multilingual dataset, called CulturaX, for training LLMs in 167
  * merges the latest iteration of mC4 (version 3.1.0) with all available OSCAR
    corpora up to the current year, encompassing distributions 20.19, 21.09,
    22.01, and 23.01
  * 27 TB of text data with 6.3 trillion tokens and offering 
    the most up-to-date data for LLM development. 
  * More than half of our dataset is dedicated to non-English languages to
    significantly boost the data size and enhance the feasibility of training
    models in multilingual scenarios
  * extensively cleaned and deduplicated at the document level to produce the
    * a comprehensive pipeline designed to eliminate low-quality data. This
    * removing noisy text, non-linguistic content, toxic data, incorrect
      language identification, and more
* data cleaning pipeline employs 
  * a variant of the Interquartile Range (IQR) method (Dekking+ 2007) to select
    appropriate thresholds for various dataset metrics (eg stopword ratios,
    data perplexity, and language identification scores), which can be used to
    filter noisy outliers for the dataset
    * we leverage the percentiles of the distributions computed over large
      samples of data to effectively guide the threshold selection process for
      each filtering metric and language. Finally, we perform 
  * extensive deduplication for the data of the languages within our datasets
    based on the near deduplication method MinHashLSH (Broder, 1997; Leskovec+
    2020) and URLs, leading to high-quality data to train multilingual LLMs
* fully available to the public to promote further research and development for
  multilingual learning. To our knowledge, CulturaX is 
  * the largest open-source multilingual dataset to date that is deeply cleaned
    and deduplicated for LLM and NLP applications

# 4 Related work

* avoid noisy and irrelevant content, eg low-quality machine-generated text and
  adult content (Trinh and Le, 2018; Kreutzer+ 2022; Raffel+ 2020). As such,
  * a typical data processing pipeline to generate high-quality datasets can
    involve multiple steps, as demonstrated by 
  * FastText (Joulin+ 2016), CC-Net (Wenzek+ 2020), the BigScience ROOTS corpus
    for the BLOOM models (Laurençon+ 2022; Scao+ 2022), the 
  * RefinedWeb dataset for the Falcon model (Penedo+ 2023; Almazrouei+ 2023),
  * the dataset to train the LLaMa models (Touvron+ 2023). The first 
* step
  * language identification appropriately (Joulin+ 2016)
  * various dataset-specific rules and heuristics to filter undesirable content
    according to the ratios of special characters, short lines, bad words,
    among others (Grave+ 2018; Laurençon+ 2022)
  * filtered via lightweight models, eg via the KenLM language models
    (Heafield, 2011), to avoid noisy documents (Wenzek+ 2020)
  * deduplication should be performed to remove similar or repeated information
    (Laurençon+ 2022; Penedo+ 2023). An important step in this regard involves
    * fuzzy deduplication at document level, eg via MinHash (Broder, 1997), to
      eliminate similar documents, thus mitigating memorization and improving
      the generalization for resulting LLMs (Lee+ 2022)
* multilingual opensource datasets with text data in multiple languages, such
  as mC4 (Xue+ 2021), OSCAR (Ortiz Suárez+ 2019), CC100 (Wenzek+ 2020; Conneau+
  2020), and the BigScience ROOT corpus (Laurençon+ 2022), their 
  * quality and scale do not meet the requirements particularly for generative
  * eg both mC4 and OSCAR lack fuzzy dedu-plication at the document level
  * mC4 also suffers from its poorer language identification (it uses cld3)
  * BigScience ROOTS only provides a small sample data for 46 languages while
  * CC100 does not have information beyond 2018. Our dataset CulturaX thus
