Spatial Reasoning in Large Vision-Language Models 
  via Egocentric-to-Allocentric Transformation 
Yoonji Kim, Jieun Kim, Sung-Bae Cho
Findings EMNLP 2026

Multi-view spatial reasoning in large vision-language models involves 
inferring view-specific spatial relations and 
integrating them into a consistent scene-centered representation. However,
* hE view-dependent relations tied to individual camera frames, which 
  limits their ability to form viewpoint-invariant spatial representations.
* cognitive models of spatial perspective-taking, 
* we propose SCoRE (Spatial Consistency Reasoning), a method that formulates
  multi-view spatial reasoning as egocentric-to-allocentric transformation
  * first trains the model to 
    infer egocentric object relations from single-view observations. It 
  * then applies reinforcement learning to encourage the model to 
    estimate viewpoint orientation, 
    transform egocentric relations into a shared scene-centered reference frame,
    and predict allocentric object relations. 
* To enforce viewpoint-invariant reasoning, 
  we optimize the model with a multi-view consistency reward that 
  * reward aligns predictions from different views in the common allocentric
    space. 
* Experiments show that 
  SCoRE improves spatial reasoning performance by 
  +3.69%p on multi-view benchmarks and +4.72%p on general spatial reasoning
  over prior state-of-the-art methods, demonstrating the effectiveness
