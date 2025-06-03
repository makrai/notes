No Language Left Behind: Scaling Human-Centered Machine Translation
NLLB Team, Marta R. Costa-jussà, James Cross, Onur Çelebi, Maha Elbayad,,,
arXiv:2207.04672 [cs.CL]

* break the 200 language barrier while ensuring safe, high quality results, all
* we
  * exploratory interviews with native speakers. Then, we created
  * datasets and models aimed at narrowing the performance gap between low and
  * model based on Sparsely Gated Mixture of Experts that is trained on data
  * novel and effective data mining techniques tailored for low-resource
  * multiple architectural and training improvements to counteract overfitting
    while training on thousands of tasks.  Critically,
* we evaluated the performance of over 40,000 different translation directions
  using a human-translated benchmark, Flores-200, and combined
  * human evaluation with a novel toxicity benchmark covering all languages in
  * improvement of 44% BLEU relative to the previous SOTA, laying important

## 2.1

* low-resource languages could be deemed low-resource for a variety of reasons,
  * underresearched, digitized, or taught (Cieri+, 2016; Magueresse+, 2020),
  * we define low-resource as languages which had less than 1 million sentences
    of publicly available example translations at the time of the study
* The interviews captured a broad array of attitudes and understandings,
  including the usage and application of lowresource languages, perceived
  value of translation technology, and how translation systems ought to be
  developed.

Overall, our recruitment effort led us to 44 native speakers of low-resource
languages from diverse backgrounds, with ages ranging from 23 to 58. Covering a
total of 36 languages, the distribution is as follows: 5 languages are spoken
predominantly in North America, 8 in South America, 4 in Europe, 12 in Africa,
and 7 in Asia. Although our sample has breadth in terms of race, education, and
location, the majority of our participants are immigrants living in the U.S.
and Europe, and about a third of them (n = 17) identify as tech workers.

All interviews were conducted remotely via video conferencing software. On
average, the interviews lasted 1.5 hours. Two-third of the interviews were
recorded and transcribed. For unrecorded interviews, two researchers took
extensive notes throughout. Bringing all 44 interviews together, responses were
then systematically coded to allow major themes and ideas to emerge.

We acknowledge that sampling low-resource language speakers from diasporic
contexts comes with its limitations. For one, as immigrants, their perspectives
may not consummately capture the sentiments of their communities back home.
* in technologically underdeveloped nations, where many low-resource language
  communities reside, people tend to view technology more optimistically and
  aspirationally than those who live in places with higher levels of
  technological development (Kapania+, 2022; Kozyreva+, 2021; Sambasivan,
  2021; Sambasivan+, 2021). Thus, being exposed to
  * critical technological discourses (especially in recent times) could in
    fact make many of our interviewees more cognizant of the risks behind tech
  * immigration scholars remind us that global movement today is a transnationl
    * those in receiving societies maintain cultural ties with those who remain
      in sending societies via a variety of communicative and media platforms
      (Baldassar+, 2016; Levitt and Jaworsky, 2007; Levitt and Lamba-Nieves,
      2011).  Because we found strong evidence of such processes in our
* we trust that our participants are in a unique position to speak
  both critically and knowledgeably about the sociological underpinnings of
  their languages.

Over-sampling tech workers may introduce another form of selection bias. More
specifically, research suggests that tech workers, given their insider
status, are likely to espouse techno-optimism — a positive outlook with respect
to technological development (McLennan, 2016). While such an effect cannot be
downplayed, tech workers’ personal affinity with technological practices could
in fact imbue in them a critical reflexivity we were eager to tap into. As
projected, while many participants speculated on the benefits of our research,
they were equally keen on underscoring the potential risks such an intervention
might impose on their very own language communities. These nuanced perspectives
were vital in shaping our research processes and procedures.

#### 2.1.1.1

* having MT means people who do not speak the low-rsrc language could read and
  understand Wikipedia articles about that culture, which further motivates

## 7.4 Conclusion

* spBLEU, a modification to BLEU that uses a sentencepiece model to ensure
  tokenization of any text in any language, and
* chrF ++ that operates primarily on character-level.
* human eval: new and more clearly defined scoring metric (XSTS)
  * and the use of a calibration set that not only/but also allows us to
    * adjust raw scores from evaluators working on the same language pair but
    * obtain consistent scores across language pairs.  Moreover, we are
* harmful content generated from our translation models
  * our novel methods to detect toxicity, ie translated content containing
  * extended to all 200 languages of the NLLB effort due to a toxic term list
  * we built classifiers to detect and mitigate toxicity in our translations.

# 8 Bringing it All Together
## 8.1 Preparing the Data
## 8.2 Preparing the Model
## 8.3 Results on Flores-200
## 8.4 Out-of-domain Generalization: Performance on non-Flores-200 Domains
## 8.5 Analysis of NLLB-200
## 8.6 Making Large Models More Accessible through Distillation
## 8.7 Effect Including Languages with Multiple Scripts & Related Languoids 120
## 8.8 Environmental Impact of NLLB 127
