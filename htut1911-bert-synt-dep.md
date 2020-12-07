Do Attention Heads in BERT Track Syntactic Dependencies?
Phu Mon Htut, Jason Phang, Shikha Bordia, Samuel R. Bowman
arXiv:1911.12246 [cs.CL]

# Abstract

* We investigate the extent to which individual attention heads 
  in pretrained transformer language models, such as BERT and RoBERTa,
  implicitly capture syntactic dependency relations. We employ 
* two methods---the maximum attention weight ; the maximum spanning tree---to
* for some UD relation types, there exist heads that can recover the dependency
  type significantly better than baselines on parsed English text,
* BERT fine-tuned on two datasets---the 
  * syntax-oriented CoLA and the semantics-oriented MNLI---to investigate
    whether fine-tuning affects the patterns of their self-attention, but we do
    not observe substantial differences in the overall dependency relations
* suggest no generalist head that performs holistic parsing significantly better
  than a trivial baseline, and that analyzing attention weights directly may not
