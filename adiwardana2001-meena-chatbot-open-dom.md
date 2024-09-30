Towards a Human-like Open-Domain Chatbot
Daniel Adiwardana, Minh-Thang Luong, David R. So, Jamie Hall, Noah Fiedel, Romal
Thoppilan, Zi Yang, Apoorv Kulshreshtha, Gaurav Nemade, Yifeng Lu, Quoc V. Le
arXiv:2001.09977 [cs.CL]

Conversations with Meena, and with various other chatbots, are available at
https://github.com/google-research/google-research/tree/master/meena/

# Abstract

* Meena, a multi-turn open-domain chatbot trained end-to-end
* train data mined and filtered from public domain social media conversations
* simply trained to minimize perplexity of the next token
* new human evaluation metric called Sensibleness and Specificity Average (SSA),
  * captures key elements of a human-like multi-turn conversation
  * simple and easy for crowd workers to understand
* strong correlation between perplexity and SSA
  * Meena scores high on SSA (72% on multi-turn evaluation)
  * human-level SSA of 86% is potentially within reach
    if we can better optimize perplexity
* Additionally with a filtering mechanism and tuned decoding scores 79% SSA, 23%

# 1 Introduction

* open-domain chatbots such as MILABOT (Serban+ 2017), XiaoIce (Zhou+ 2018),
  Gunrock (Chen+ 2018), Mitsuku (Worswick, 2018), and Cleverbot (by Rollo
  Carpenter) display human-like attributes
  * hE complex frameworks
    eg dialog managers with knowledge-based, retrieval-based, or rule-based sys
* end-to-end neural network approaches
  (Shang+ 2015; Vinyals and Le, 2015; Sordoni+ 2015; Serban+ 2016; Zhang+ 2019),
* weaknesses that prevent them from being generally useful: often
  * responses do not make sense, or are vague and generic
* we present Meena, a generative chatbot model that was trained end-to-end
  * seq2seq model (Sutskever+ 2014; Bahdanau+ 2015) with the
    Evolved Transformer (So+ 2019) as the main architecture
* trained on multi-turn conversations where the
  * input sequence is all turns of the context (up to 7) and the output sequence
    is the response. Our best model has 2.6B parameters
  * vocabulary of 8K BPE subwords (Sennrich+ 2016)
* some end-to-end chatbots respond “I don’t know” to many inputs (Li+ 2016a);
* We compare Meena, humans, and other opendomain chatbots using the SSA metric
  with two types of human evaluation: static and interactive
  * static evaluation, we curated a dataset with 1,477 multi-turn conversations
  * interactive evaluation, humans could chat about anything they wanted
* SSA metric shows strong correlation with Meena’s perplexity
* recent research found a poor correlation between human evaluation scores and
  automatic metrics such as BLEU (Liu+ 2016; Lowe+ 2017)
* Our best end-to-end learned model has an average of 72% SSA
  * the full version of Meena scores 79% by incorporating a filtering mechanism
    and tuned decoding (Section 5). This is still below the 86% SSA
  * humans have very high sensibleness, but significantly lower specificity, as
    detailed in Section 4.2
* weaknesses of our methodology
* contributions are:
  * a simple human evaluation metric for multi-turn opendomain chatbots that
    captures basic, but important, attributes of human conversation;
  * perplexity is an automatic metric that correlates with human judgment, in
    contrast to recent findings on other automatic metrics mentioned above;
  * end-to-end neural model with sufficiently low perplexity can surpass the
    sensibleness and specificity of existing chatbots that rely on complex,
    handcrafted frameworks developed over many years

# 2 Evaluating chatbots

# 3 Meena chatbot

# 4 Results

# 5 Further Advancing SSA

# 6 Related Work

# 7 Discussion
