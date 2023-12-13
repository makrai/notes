EmoAtlas: An emotional profiling tool merging psychological lexicons, artificial intelligence and network science
Alfonso Semeraro, Salvatore Vilella, Saif Mohammad, Giancarlo Ruffo, Massimo Stella
2023/1/16

# Description

* a cutting-edge synergy of interpretable artificial intelligence (AI) and
  psychologically-validated lexicons. Our framework supports 
* out-of-the-box emotion detection of 8 categorical emotions and 
  * syntactic network building in 18 languages. In the task of detecting
* in social media posts and news media articles, in Italian or in English,
  * performances analogous, or even superior (eg, 70.2% precision for detecting
    joy in tweets), to SOTA natural language processing techniques like BERT,
    RoBERTa, distillBERT and ALBERT (eg, 67.9% precision for detecting joy in
    tweets)
* EmoAtlas is 12 times faster than BERT
* In a psychometric task like reproducing human creativity ratings for 1,071
  short stories, EmoAtlas and BERT obtain equivalent predictive power (ρ≈
  0.495, p< 10-4). 
* Combining BERT's semantic features with EmoAtlas' emotional/syntactic
  networks of words, the cross-validated resulting AIs get substantially better
  at estimating creativity rates of stories (ρ≈ 0.628, p< 10-4). This indicates
  an interplay between the creativity of narratives and the semantic,
  emotional, and syntactic divergence of their words, pointing out how EmoAtlas
  and BERT-like models could be used in synergy in psychometrics. By outputting
* interpretable emotional profiles and syntactic networks, EmoAtlas can
  quantify how emotions are channelled through specific associations in texts,
  eg, how did customers frame their ideas and emotions towards "beds" in hotel
  reviews? We release EmoAtlas as a standalone computational tool and discuss
  its impact in modelling texts as data, promisingly filling current research
  gaps in AI and cognitive science.

# 1 Intro

* "emotional profile" of the a text
  * eg strong levels of fear and anger, together with lower levels of disgust.
* data-informed psychological models map emotions to numerical, vectorial spac
  * emotions can be considered as a superposition of more interpretable dims .
    * circumplex model of affect19 represents one of the most widely used
      * extracted from neurocognitive and behavioural data22 : (i) valence,
        ie how pleasant concepts are perceived, and (ii) arousal, ie how
* Disgust and anger both possess a negative sentiment/valence but the disgust
  inhibits reactions whereas the anger creates more alertness and arousal
* EmoAtlas is a lexicon-only library performing syntactic parsing and
  word-level emotional profiling of texts
  * syntactic/semantic relationships between words in texts. This structure
  * associative knowledge embedded by authors in their narratives, ie how
  * exploiting a zero-shot, advanced language model (cf.46 ) that can parse
    syntactically large volumes of text without human intervention. Through the
    extensive emotional lexicon developed by Mohammad and Turney10 , 
  * EmoAtlas counts how many words eliciting emotions were linked in text to
    specific targets, thus enabling word-level emotional profiling of texts.
  * AI performs syntactic parsing and network construction, 
  * the lexicon comes from a psycho mega-study validated by 1000s of particips
* exper
  * We test EmoAtlas against different state-of-art NLP approaches in
  * emotional profiling of news media and social posts in Italian and English.

# Related literature: EmoAtlas as a cognitive approach to information processing

* emotions can capture a wider range of perceptions, like 
  arousal/inhibition or engagement/avoidance 
* some sentiment methods were extended to emotion detection
  but within a similar pipeline.

# Transformers and emotional profiling of texts

# EmoAtlas and quantitative evaluations of psychological constructs 15

# Discussion 16

* lexicon-only method enhanced by syntactic-parsing AI like EmoAtlas can rival
  with transformers pre-tuned on other emotional datasets). EmoAtlas is up to
  * EmoAtlas supports emotions like trust, anticipation and disgust 
    that are rarely supported by transformers
* EmoAtlas can outshine BERT and BERT-like colleagues in terms of precision and
  recall on either longer texts, be it Italian Facebook posts or Youtube
  comments40 , or shorter texts, like English tweets68 and English news
  headlines12 , as quantitatively measured here. This interplay of valid
* application of EmoAtlas in the psychometric task of measuring and
  understanding human creativity ratings in short texts
  * EmoAtlas performs equivalently to the more sophisticated BERT in predicting
    creativity ratings when using only 3 network measures and 5 emotional
    z-scores
  * Combining the two models leads to even better performance, suggesting that

# Limit 17

* Recent works 16, 41, 60, 83 have shown that 
* transformer networks can do way better than lexicon-only approaches in
  presence of slang or context-dependent words (changing their meaning)
  * eg "goldfish" is slang for a forgetful person but might have been