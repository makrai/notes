The Limitations of Stylometry for Detecting Machine-Generated Fake News
Tal Schuster, Roei Schuster, Darsh J. Shah, Regina Barzilay
Computational Linguistics (2020) 46 (2): 499–510

# Abstract

*  Whereas humans speak differently when trying to deceive, LMs generate
   stylistically consistent text, regardless of underlying motive. Thus, though
 * We create two benchmarks demonstrating the stylistic similarity between
   malicious and legitimate uses of LMs,
   utilized in auto-completion and editing-assistance settings.1 Our findings

# 1 Intro

* stylometry—the extraction of stylistic features from written text—showed
* Two of stylometry’s common applications are:
  * Detecting the provenance of text (i.e., identifying the author) in order to
    (Tweedie, Singh, and Holmes 1996; Brennan, Afroz, and Greenstadt 2012;
    Afroz+ 2014; Caliskan-Islam+ 2015; Neal+ 2017; Sari+ 2017)
    * the classifier identifies language features that correlate with a specific
      person or group
  * Detecting misinformation in text
    * due to
      * deception (Enos+ 2007; Mihalcea and Strapparava 2009; Ott+ 2011;
        Feng, Banerjee, and Choi 2012; Afroz, Brennan, and Greenstadt 2012),
      * fake news (Rashkin+ 2017; Pérez-Rosas+ 2018), or
      * other false or illegal content (Choshen+ 2019). In the former,
    * relies on idiosyncrasies of lies, namely, style and language
      characteristics that are unique to text that is false or misleading
* LMs could be used to mass-produce malicious text (Vosoughi, Roy, and Aral
  2018; Radford+ 2019), that (1) impersonates a human author’s text and/or (2)
  is fallacious and misleading. Indeed, stylometry-based approaches have shown
* promising stylometry results for defending against human-impersonating
  language models (LMs) (Bakhtin+ 2019; Zellers+ 2019). However, as applications
* as text auto-completion (Wolf+ 2019; House 2019) and
  automatic question answering become widely used,
  labeling text as generated by an LM might not indicate anything about trustwor
* We build the first benchmark for detection of LM-produced fake news that
  * as people try to diverge as little as possible from the truth when lying
    (Mazar, Amir, and Ariely 2008), we focus on automatic false modifications or
    additions to otherwise truthful news stories
  * we produce text by prompting an LM to extend news articles with relevant
    * malicious/responsible user, who only accepts the LM’s suggestion if the
      claim is factually false/correct
    * The produced sentences are short and concise statements,
      similarly to fake news and false claims as represented in human-generated
      data sets (Wang 2017; Augenstein+ 2019)
* In another data set, we modify existing news articles to include false info by
  inverting article statements. In this case, the
  * LM is used to automatically identify the most plausible edit locations. This
  * similar to (mis-)using an autocorrect tool that suggests local modifications
* We find that with the SOTA stylometry-based classifier, even
  a single auto-generated sentence within a wall of human-written text is
  detectable with high accuracy, yet the truthfulness of a single sentence
  remains largely undecidable
  * even a relatively weak LM can be used to produce statement inversions that
    the SOTA stylometry-based model cannot detect. Thus, stylometry fails to
  * unlike humans who expose stylistic cues when writing false content
    (Ott+ 2011; Frank, Menasco, and O’Sullivan 2008; Matsumoto+ 2011), LMs
