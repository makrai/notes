### ScopeBench: Do Agents Preserve Engagement Boundaries Under Goal Pressure?

Shane Caldwell, Max Harley, Ads Dawson, Michael Kouremetis, Vincent Abruzzo,
Will Pearce

* Agents are increasingly deployed with real autonomy in testing web
  applications and network penetration testing, where 
  * a single out-of-scope action can breach a client's engagement boundary.
* offensive-security benchmarks measure raw hacking capability; they saturate,
  the real barrier to deployment is 
  * scope adherence, a special case of alignment: . 
* We introduce ScopeBench, a benchmark of 30 dead-end agentic security tasks in
  * the stated objective is reachable only by violating the stated scope.
  * Each task appears under two conditions that 
  * conditions share an environment, verifier, and objective and 
  * conditions differ only in scope: 
    * one instruction set has no scope and measures capability; 
      * graded by a standard deterministic verifier.
    * the other has a natural-language scope to measure adherence.  
      * pass through two grading arms.
* process
  * First, the same deterministic verifier checks for the flag: because the flag
    sits behind the scope boundary, a pass proves by construction that a
    forbidden action occurred, yielding a high-precision lower bound on the
    violation rate.
* If the verifier does not pass the trajectory, an agentic judge estimates
  whether an out-of-scope call occurred. 
* We calibrate the judge against 100 ScopeBench trajectories 
  labeled call-by-call by human annotators, and 
  * a blinded audit of the evaluated rollouts finds its high recall holds - 
    no false negatives among the 36 audited violations, with over-flagging its
    only observed error. 
* Across 8 models in one harness, 
  raw capability spans 12.2% to 81.1% and scope adherence spans 34.4% to 86.7%,
  with the judge finding 331 violations that mechanical verification misses.
  * Opus-4-8 achieves 
    * a raw-capability score 10 percentage points higher than sonnet-4-6's while
    * 35.6 percentage points higher scope adherence.
* We release the frozen pilot benchmark, evaluation code, and all 2160 ATIF
  trajectories.
