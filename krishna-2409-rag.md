Fact, Fetch, and Reason: A Unified Evaluation of Retrieval-Augmented Generation
Satyapriya Krishna, Kalpesh Krishna, Anhad Mohananey, Steven Schwarcz,
  Adam Stambler, Shyam Upadhyay, Manaal Faruqui
arXiv:2409.12941 [cs.CL]

# Abstract

* using LLMs to enhance retrieval-augmented generation (RAG) capabilities.
  * requirements: understand user queries, retrieve relevant information, and
    synthesize coherent and accurate responses. Given the increasing real-world
* comprehensive evaluation becomes crucial. To this end, 
* we propose FRAMES (Factuality, Retrieval, And reasoning MEasurement Set)
  * tests LLMs' ability to provide factual responses, assess retrieval
    capabilities, and evaluate the reasoning required to generate answers
  * previous work has provided datasets and benchmarks to eval these in isolat
  * FRAMES offers a unified framework that provides a clearer picture 
  * challenging multi-hop questions that 
    require the integration of information from multiple sources.  We present
* baseline results demonstrating that even SOTA LLMs struggle with this task,
  * 0.40 accuracy with no retrieval. The accuracy is significantly improved
    .66 accuracy with our proposed multi-step retrieval pipeline
