CraftAssist Instruction Parsing: Semantic Parsing for a Voxel-World Assistant 
Kavya Srinet, Yacine Jernite, Jonathan Gray, Arthur Szlam
ACL 2020

The code, dataset and annotation tools described in the paper open-sourced
https://github.com/facebookresearch/craftassist/tree/master/acl2020_submission

# Abstract

* a semantic parsing dataset focused on instruction-driven communication with
  an agent in the game Minecraft. The dataset consists of
  * 7K human utterances and their corresponding parses. Given proper world
    state, the parses can be interpreted and executed in game
  * We report the performance of baseline models, and analyze their successes
    and failures.

# 1 Intro

* Semantic parsing as a component for NLU in
  * human-robot interaction systems (Lauria+ 2001; Bos & Oka, 2007; Tellex+
    2011; Matuszek+ 2013; Thomason+ 2019) and for
  * virtual assistants (Campagna+ 2017; Kollar+ 2018; Campagna+ 2019). We
  * deep learning methods in this space, as recently researchers have shown
    * more generally (Dong and Lapata, 2016; Jia and Liang, 2016; Zhong+ 2017)
    * hE In the space of human-robot (or human-assistant) interaction, the
      publicly available semantic parsing datasets are small. Furthermore, it
    * difficult to reproduce the end-to-end results (from utterance to action
      in the environment) because of the wide variety of robot setups &
      proprietary nature of personal assistants
* we introduce a new semantic parsing dataset for human-bot interactions. Our
  “robot” or “assistant” is embodied in the sandbox construction game Minecraft
  2 , a popular multiplayer openworld voxel-based crafting game. We
  + the associated platform for executing the logical forms in game.
* Minecraft has several benefits for studying task oriented NLU
  * Compared to physical robots, Minecraft allows less technical overhead
    * eg difficulties with hardware and large scale data collection. On the
  * has all the basic in-game capabilities of a player, including movement and
    placing or removing voxels. Thus Minecraft preserves many of the NLU
  * discussions of navigation and spatial object reference.
  * large scale human interaction because of its large player base, in the 10Ms
  * task space is complex. While there are many atomic objects in the game,
    * complex structures made up of collections of voxels such as a house/hill
    * The assistant cannot apprehend them without a perceptual system, creating
      Our contributions in the paper are as follows:
  * Grammar: We develop a grammar over a set of primitives that comprise a
    mid-level interface to Minecraft for machine learning agents.  
  * Data: We collect 7K crowd-sourced annotations of commands generated
    independent of our grammar. In addition to the natural language commands
    and the associated logical forms, we release the tools used to collect
    these, which allow crowd-workers to efficiently and accurately annotate
    parses.  
  * Models: We show the results of several neural semantic parsing models
    trained on our data.  
  * Execution: we also make available the code to execute logical forms in the
    game, allowing the reproduction of end-to-end results. This also
    * opens the door to using the data for reinforcement and imitation learning
    * We also provide access to an interactive bot using these parsing models
* Figure 1: The basic structure of the ACTION SEQUENCE branch of the
  assistant’s grammar
  * gold octagon is an internal node whose children are ordered,
  * blue rectangles are regular internal nodes, and
  * green rectangles are categorical leaf nodes
  * Not all combinations of children of ACTION are possible
    * full list of possible productions (and the productions for PUT MEMORY and
      GET MEMORY) in the Appendix C
* Conclusion:
  * BERT pre-trained models do better than models trained from scratch, but
    there is much space for improvement
    * Consistent with recent works

# 4 Related Work

* datasets of natural language paired with logical forms to evaluate semantic
  parsing approaches (Price, 1990; Tang and Mooney, 2001; Cai and Yates, 2013;
  Wang+ 2015; Zhong+ 2017)
  * ours is an order of magnitude larger than those in (Price, 1990; Tang &)
  * similar in scale to the datasets in (Wang+ 2015), but
  * smaller than (Zhong+ 2017)
  * In addition to mapping natural language to logical forms, our dataset
    connects both of these to a dynamic environment. 
* Lauria+ 2001; Bos & Oka, 2007; Tellex+ 2011; Matuszek+ 2013; Thomason+ 2019:
  semantic parsing used for interpreting natural language commands for robots.
  * we: the “robot” is embodied in the Minecraft game instead of in the
    physical world
* Boye+ 2006: semantic parsing for spoken dialogue with an embodied character
  in a 3-D world with pattern matching and rewriting phases. In our work, the
  * we: user along with the assistant is embodied in game and instructs using
    language
    * We go from language to logical forms end-to-end with no pattern match to
      mark that a sentence is a command to perform necessary
* Semantic parsing in a voxel-world 
  * Wang+ (2017) describe a method for building up a programming language from
    a small core via interactions with players
* We demonstrate the results of several neural parsing models on our dataset.
  * a re-implementation of Dong and Lapata, (2016) adapted to our grammar, and
    a straightforward fine-tuned BERT model (Devlin+ 2018). There have been
* neural architectures for semantic parsing, for example (Jia and Liang, 2016;
  Zhong+ 2017; Wang+ 2018; Hwang+ 2019); in particular 
  * Hwang+ (2019) use a BERT based model. In those papers, as in this one, the
    models are trained with full supervision of the mapping from natural
    language to logical forms, without considering the results of executing the
    logical form (in this case, the effect on the environment of executing the
    actions denoted by the logical form).  There has been progress towards
* “weakly supervised” semantic parsing (Artzi and Zettlemoyer, 2013; Liang+
  2016; Guu+ 2017) 
  * the logical forms are hidden variables, and
    the only supervision given is the result of executing the logical form.
* approaches without even passing through (discrete) logical forms at all
  (Riedel+ 2016; Neelakantan+ 2016). We hope that the dataset introduced
  here, which has supervision at the level of the logical forms, but whose
  underlying grammar and environment can be used to generate essentially
  infinite weakly supervised or execution rewards, will also be useful for
  studying these models.
* Minecraft, especially via the MALMO project (Johnson+ 2016) has been used as
  a base environment for several machine learning papers
  * reinforcement learning (RL) (Shu+ 2017; Udagawa+ 2016; Alaniz, 2018; Oh+
      2016; Tessler+ 2017)
      * the agent is trained to complete tasks by issuing low level actions (as
        opposed to our higher level primitives) and receiving a reward on
        success. Others have collected
    * large-scale datasets for RL and imitation learning (Guss+ 2019a,b) Some of
      * Oh+ (2017) consider simplified, templated language as a method for
        composably specifying tasks, but
        training an RL agent to execute the scripted primitives in our grammar is
        already nontrivial, and so
        the task space and language in those works is more constrained than ours
    * our work may be useful to researchers interested in RL (or imitation):
      using our grammar and executing in game can supply (hard) tasks and
      descriptions, and demonstrations
  * Kitaev and Klein, (2017; Yi+ (2018): Minecraft for visual QA with logical
    forms
    * Our work extends these to interactions with the environment.  Finally,
* Allison+ (2018) is a more focused study on how a human might interact with a
  Minecraft agent
  * our collection of free generations (see 3.1.1) includes
    annotated examples from similar studies of players interacting with
    a player pretending to be a bot.

# 6 Experiments

## Error Anal

* the model still struggles with span predictions:
  out of 363 errors, 125 only make mistakes on spans (and 199 get the tree
  structure right 4700but make mistakes on leaves). Figure 6 shows the nodes
  which are most commonly mistaken, with the number of false positive and false
  negatives out of these 363 mistakes
  * Unsurprisingly, the most commonly confused span leaf is “has tag”, which we
    use as a miscellaneous marker.
  * the other span mistakes are evenly spread over all other leaves
* The next most common source of mistakes comes from the model struggling
  * between identifying
  whether a provided location corresponds to the target of the action or to the
  reference object, and to
    * indicates a lack of compositionality in the input representation: the
      model correctly identifies that a location is mentioned, but fails to
      identify its context
  * identify instructions which imply a repetition
    * Repeat conditions on the other hand challenge the model
      due to the wide variety of possible stop condition: future work

# 7 Conclusion

* a grammar over a mid-level interface for a Minecraft assistant. We then
* a dataset of natural language utterances with associated logical forms over
  this grammar that can be executed in-game
* we showed the results of using this new dataset to train several neural
  models for parsing natural language instructions
