# C Fixing OpenHuEval for Qwen3-like Models

* OpenHuEval: The prompts and configurations contain minor mistakes and
  * reasoning models, such as Qwen3, are not always evaluated correctly. 
  * Some of these problems are rooted in the OpenCompass framework itself. The
  * omission of the OpenHuEval example scripts assumed to be present by the
    documentation. This was remedied by the authors after we brought it to their
  * the OpenHuEval tasks handled the reasoning output of models inconsistently.
    * eg HuMatchingFIB, detected the presence of the reasoning tokens and
      removed them before evaluation; some, such as HuSimpleQA, did not. In many
    * the presence of reasoning traces resulted in a parsing error or the model
      running out of the allotted context. By default, 
    * we wanted to disable reasoning in these benchmarks as 
      small reasoning models are prone to getting stuck in thinking loops when
      running them with temperature 0, which is needed for reproducibility. 
    * This behavior is also outlined in the Qwen3 documentation.
    * we decided to fix these issues locally, with as little change as possible
      in the OpenCompass codebase: 
    * we modified the chat template to respect the `enable_thinking` tokenizer
      argument in the model configuration and 
      disabled reasoning for the affected tasks. We made sure to 
    * leave the benchmark’s datasets unchanged. The only 
    * exception was the HuWildBench task, which posed additional challenges that
      had to be addressed.
1. Remove artifacts present in the Hungarian prompts only. The HuWildBench
  * a user prompt that is segmented into three logical units. An 
    instruction, a question and a description. These are 
  * not delimited explicitly in the English or Chinese prompts , however 
  * the Hungarian prompt contains the following phrases as separators 
    attached to the end of the previous field directly without even a
    whitespace: “a kérdés az: ”, “a leírás: ”, “a válasz: ”
  * these unclear separators put directly as part of the last word erode the
    * erode especially smaller ones. Thus we modify the prompts to keep the
  * we add two empty lines between the last character of the previous unit and
    the separator. 
  * We also improve the capitalization and fluency of these phrases while
    removing the answer start indicator as we will use the chat prompt template
    to denote assistant turns.
2. Use the proper prompt template. 
  * The Qwen3 and Racka models use a chat prompt template with 
    system, user and assistant message frames and are trained to follow
    instructions in this format. Thus, 
  * we attempted to apply the default chat template of these models in
    OpenCompass which setting was not respected.
  * We opted to modify the implementation to include chat templates in
    HuWildBench. As Qwen3 and derivative models also need a 
  * system prompt we add a modification of the 
    * industry default “You are a helpful assistant.” adding the language
    * we: “You are a helpful Hungarian assistant.”.  For the non-instruct
      Qwen3-4B-Base and PULI-LlumiX-Llama3.1 (the latter we tested with the
      standard Llama-3.1 chat template which yielded slightly wores results)
      models we add the answer trigger prompt as “\n\nA válasz: ” and
      do not use any special prompt template.
3. Increasing model generation control. As mentioned above, 
  * we make sure that the tokenizer settings are respected to avoid generating
    reasoning traces. We also enforce 
  * repetition penalty and frequency penalty
    using the definitions of vLLM Kwon+ (2023), which are 
    both set to 0.3 in the case of all Qwen and Racka models to avoid repetitive
4. Fixing judge model errors. HuWildBench is one of the tasks where 
  * the original implementation fails to remove (often English) reasoning traces
    from the judge model prompt. We reimplement this behavior correctly to align
    with the original intent present in the benchmark configuration. We also
  * the judge model rarely follows the JSON schema defined in its prompts.
  * In some cases this results in 
    the OpenCompass implementation missing the judge score. We use a simple
  * regex pattern to find the last “score:” in the ill-formed judge outputs and
    extract the first integer that follows it as a score. This method is able to
    correctly handle 99.91% of the failed judge prompts. 
    When no “score:” segment is present in the judge output 
    use a default score of 1. 
  * We enforce the usage of the single model scoring prompt to make sure
    OpenCompass does not automatically switch to the pairwise evaluation
    where a parent/base model is present.
* HuWildBench was the only subset where these errors fully prevented the
  original implementation from working, we believe that 
  * hE future work should revisit the prompts and implementation of OpenHuEval
    to ensure language quality and compatibility with chat and reasoning
