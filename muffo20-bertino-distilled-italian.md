BERTino: An Italian DistilBERT model.
M Muffo 
CLiC-it, 2020 ceur-ws.org

https://github.com/indigo-ai/BERTino

# Abstract

* usability is limited by the high number of parameters which constitute them
  * high computational and memory demands. In this work 
* we present BERTino, a DistilBERT model which proposes to be the first
  * evaluation on the Italian ISDT, Italian ParTUT, Italian WikiNER and
    multiclass classification tasks, obtaining 
  * F1 scores comparable to those obtained by a BERT BASE with a remarkable

# 1 Intro

* approaches to reduce the size of the BERT network, such as DistilBERT (Sanh+
  2019), MobileBERT (Sun+ 2020) or pruning (Gordon+ 2020; McCarley+ 2019)
* Virtanen+ (2019), de Vries+ (2019) and Martin+ (2020) demonstrate that
  monolingual BERT models outperform the same multilingual BERT architecture
* We evaluate BERTino 
  * two Part Of Speech tagging tasks, Italian ISDT (Bosco+ 2000) and Italian
    ParTUT (Sanguinetti and Bosco, 2015), on the 
  * Italian WikiNER (Nothman+ 2012) Named Entity Recognition task and on a
  * multi-class sentence classification.  
* Comparing the scores to its teacher model and GilBERTo, 
  BERTino obtains performances comparable to the other two architectures while

# 2 related works with a focus on DistilBERT

# 3 corpus and the pre-train

# 4 results

* multi-class sentence classification task. In particular, intent detection, a
  * in context of Dialogue Systems, creating a 
  * novel italian dataset which is freely available at our repository 3 . The
  * 2786 real-world questions (2228 for training and 558 for testing) submitted
    to a digital conversational agent.  The total number of classes in the
    dataset is 139.
* for the multi-class classification task we fine-tuned our model for 14 epochs
  on the training set with a batch size of 32 and a learning rate of 5 × 10 −5 .
* To compare the results, we fine-tuned the teacher model and a GilBERTo model 4
  on the same tasks with the same hyper-parameters. Tables 1, 2, 3 and 4 collect
* BERTino taking almost half of the time to perform both fine-tuning and eval
  
# 5 Conclusions
