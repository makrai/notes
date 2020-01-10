Ádám Varga, Balázs Tarján, Zolltán Tboler, György Szaszák, Tibor Fegyó, Csaba
Bordás, and Péter Mihajlik
Automatic Close Captioning for Live Hungarian Television Broadcast Speech: 
 * A Fast and Resource-Efficient Approach

decoder!

#1 Introduction

when more speakers talk simultaneously
 * may occur up to one third of the total time
Section 2 reviews the international results 
Section 3 describes the experimental setup
Section 4 presents and discusses the results of the experiments. 
 * Firstly, the direct transcription task of BC data is tested 
   * with two different decoders and
   * three acoustic models (ACMs)
 * re-speakers, 
   * where broadcast audio is re-spoken by a qualified person 
   * eliminating some of its imperfections, like 
     * noise, hesitation, simultaneous speech, etc. 
   * Experiments on re-spoken BC data are also discussed.

#2 Related Work

BN
 * The research group having the most results in Hungarian BN recognition 
   * [7], [8], [9] Tarján, Mihajlik, ...
   * used 10 to 50 hours of manual transcriptions of 
     * broadcast speech and texts from the web to train their system 
   * 21-27% WER on various test sets. 
   * Their best results were achieved with subword based LMs. In contrast
 * [4] 
 *   ! 4. Roy et al.: 
   * Some Issues affecting the Transcription of Hungarian Broadcast Audio.
   * In Interspeech 2013, pp. 3102–3106 (2013)
   * investigated unsupervised training methods on a Hungarian task and
   * 24% WER. 
     * However, the test set having been a mix of BC and BN speech makes it
     * hard to compare with former results. 
 * The lowest WER (17%) for Hungarian BN was shown in [10], 
 * 10. Tóth, L and Grósz, T
   * A Comparison of Deep Neural Network Training Methods 
     * for Large Vocabulary Speech Recognition. 
   * In: Text, Speech, and Dialogue, vol.  8082, pp. 36–43 (2013)
   * a web corpus based LM was combined with a deep neural network (DNN) based
   * ACM.
BC
 * The only study we found about transcription of Hungarian BC is 
   * [8],
     * Tarján, B., Mihajlik, P., Balog, A., Fegyó T.: 
     * Evaluation of lexical models for Hungarian Broadcast speech
     * transcription and spoken term detection. 
     * In: 2nd IEEE International Conference on Cognitive Infocommunications (2011)
   * where a Gaussian mixture model (GMM) based ACM trained on 50 hours of
   * broadcast speech was combined with a web corpus based LM.
   * Unfortunately, the reported WER was very high (about 50%). 
 * The international results in the BC domain lie between 20% and 30% 
   * for other languages 
     * [6], English, French, and German.
     * [11], French.
     * [2]. en?
   * These systems, however, used much more acoustic training
