Kennedy R, Clifford S, Burleigh T, Waggoner P, Jewell R, & Winter N
The shape of and solutions to the MTurk quality crisis. Political
Science Research and Methods, 2020 8(4), 614-629. doi:10.1017/psrm.2020.6

# Abstract

* Amazon's Mechanical Turk is widely used for data collection; however,
* data quality may be declining due to the use of
  * virtual private servers to fraudulently gain access to studies.
  * we know little about the scale and consequence of this fraud, and tools for
* We first analyze 38 studies and show that this
  * fraud is not new, but has increased recently. We then show that these
  * fraudulent respondents provide particularly low-quality data and can weaken
    treatment effects. Finally, we provide
* two solutions
  * an easy-to-use application for identifying fraud in the existing datasets
  * a method for blocking fraudulent respondents in Qualtrics surveys.

# 1 Intro

* The advent of crowdsourcing platforms, such as Amazon's Mechanical Turk
  * quickly collect data at a substantially lower cost
    than professional survey providers. The samples are
  * not representative of any particular population, but they tend to be 9
    far more diverse than most common convenience samples and tend to
  * replicate a variety of experimental and observational results (Berinsky+
    2012; Weinberg+ 2014; Clifford+ 2015; Mullinix+ 2015).Footnote 1 Though met
  * yield high-quality data when respondents are screened on reputation (Peer+
    2014). In fact, MTurk samples generally provide
  * higher quality data than student samples, community samples, and even some
    high-quality national samples (Hauser and Schwarz, 2015; Mullinix+ 2015;
    Thomas and Clifford, 2017; Anson, 2018).  For these reasons, the use
    of MTurk for survey research has grown dramatically across a variety of
  * disciplines, including psychology (Paolacci and Chandler, 2014; Zhou and Fishbach, 2016)
    * economics (Horton+ Horton, Rand and Zeckhauser2011)
    * public administration (Stritch+ 2017)
    * and sociology (Shank, 2016). One survey found that more than 1200 studies
      were published in 2015 using the service (Bohannon, 2016), and another
    * more than 40 percent of studies published in two top psychology journals
      had at least one experiment that used MTurk (Zhou and Fishbach, 2016).
* threat to MTurk data quality emerged in the summer of 2018. Several
  * suddenly finding high rates of poor quality responses.
  * traced back to international respondents who mask their location using
    virtual private servers (VPS; also sometimes referred to as virtual private
    networks or proxies) in order to take surveys designed for US participants
  * substantially lower-quality responses, including nonsensical answers to
  * tactics to deceive the survey research system suggest they are less
  * still little idea about the scale and duration of the problem
    or why it has spiked recently, nor have these studies provided solutions
* we outline the scale of the quality crisis—its sources and its impact—and
  assess new methods and tools for ameliorating it
  * audit of our past studies on MTurk
  * Analyzing 38 surveys conducted over the past five years and encompassing
  * VPS and non-US respondents have spiked in recent months, but that this
    * likely traces back to substantially earlier, potentially placing
      thousands of studies at risk
  * we detail the impacts of these VPS and non-US respondents on survey quality
    using two original studies (n = 2010) with extensive quality checks
  * little evidence that bots are completing surveys in any notable number
  * VPS users provide substantially worse quality data than other respondents,
    in terms of responses to explicit quality checks, answers to open-ended
    questions, and responsiveness to experimental treatments
  * we introduce a set of tools to identify and prevent fraudulent responses
  * To remove fraudulent respondents retrospectively, we provide new packages
  * We also introduce an easy-to-implement protocol for Qualtrics that prevents
    VPS users and international respondents from taking a survey
  * this screening procedure is effective and causes minimal disruption
