Measuring Massive Multitask Language Understanding
D Hendrycks, C Burns, S Basart, Andy Zou, M Mazeika, Dawn Song, J Steinhardt 
ICLR 2021; the test and code is available at this https URL

* We propose a new test to measure a text model's multitask accuracy. The test
  * 57 tasks including elementary mathematics, US history, computer science,
    law, and more
  * models must possess extensive world knowledge and problem solving
  * the breadth and depth of a model's academic and professional understanding
  * can be used to analyze models across many tasks and to identify shortcomings 
* most recent models have near random-chance accuracy, 
  * the very largest GPT-3 model improves over random chance by ~ 20 % point 
  * on every one of the 57 tasks, the best models still need substantial
    improvements before they can reach expert-level accuracy
  * Models frequently do not know when they are wrong. Worse, they still have
  * near-random accuracy on some socially important subjects eg morality & law
