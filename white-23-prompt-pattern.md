A Prompt Pattern Catalog to Enhance Prompt Engineering with ChatGPT
Jules White, Quchen Fu, Sam Hays, Michael Sandborn, Carlos Olea, Henry Gilbert,
  Ashraf Elnashar, Jesse Spencer-Smith, and Douglas C. Schmidt
arxiv 2302.11382

# Abstract

* Prompts are instructions given to an LLM to 
  enforce rules, automate processes, and ensure specific qualities (and
      quantities) of generated output
  * also a form of programming that can customize the outputs and interactions
* Prompt patterns are a knowledge transfer method analogous to software patterns
* contributions for applying LLMs to automate software development 
  1. a framework for documenting patterns for structuring prompts to solve a
     range of problems so that they can be adapted to different domains. Second,
  2. a catalog of patterns that have been applied successfully to improve the
  3. we explain how prompts can be built from multiple patterns and 
    * prompt patterns that benefit from combination with other prompt patterns

# I. Introduction

* Conversational large language models (LLMs) [1], such as ChatGPT [2], have
  * tasks ranging from answering questions on medical licensing exams [3] to
* This paper focuses on enhancing the application of LLMs in several domains,
  * helping developers code effectively and efficiently with unfamiliar APIs or
  * allowing students to acquire new coding skills and techniques.
  * where humans and AI tools work together as trustworthy collaborators to more
  * eg Github’s Co-Pilot [5]–[7] and 
  * included in integrated development environments (IDEs), such as IntelliJ [8]
    and Visual Studio Code, thereby 
    * allowing teams to access these tools directly from their prefed IDE
* a prompt sets the context for the conversation and
  tells the LLM what information is important and 
  what the desired output form and content should be.
  * eg certain coding style or programming paradigm. Likewise, it could 
  * specify that an LLM should flag certain keywords or phrases in a gened doc
  * provide additional information related to those keywords. By introducing
* eg “From now on, I would like you to ask me questions to deploy a Python
  application to AWS.  When you have enough information to deploy the
  application, create a Python script to automate the deployment.”
* having an LLM generate and give a quiz associated with a softw eng concept,
  or even simulate a Linux terminal window. Moreover, 
* prompts have the potential for self-adaptation, suggesting other prompts to
* Prompt patterns are essential to effective prompt engineering. A key
  * to document successful approaches for systematically engineering different
    output and interaction goals when working with conversational LLMs. We focus
  * domain-independent prompt patterns and 
  * we introduce a catalog of essential prompt patterns to solve 
  * for problems ranging from production of visualizations and code artifacts to
    automation of output steps that help fact check outputs.

# II prompt patterns (compared to well-known software patterns [10])

* knowledge transfer has been studied extensively: software patterns [10], [11] 
  * eg design, architectural, and analysis. This paper applies a variant of a

## A. Overview of Software Patterns

* A pattern form also includes guidance on how to implement the pattern, as well
  * trade-offs and considerations to take into account when implementing a
  * example applications of the pattern are often provided to further showcase
* typically documented in a stylized form to facilitate their use and
  * A name and classification. Each pattern has a name that identifies the
    * classification eg creational, structural, or behavioral.
  * The intent concisely conveys the purpose 
  * The motivation documents the underlying problem and its importance of the
  * The structure and participants. The structure describes the different
    * participants (such as classes and objects) and how they collaborate to
  * Example code concretely maps the pattern to some underlying program langs
  * Consequences summarize the pros and cons of applying the pattern 

## B. Overview of Prompt Patterns

* the analogous sections for the prompt pattern form used in this paper is
  summarized below:
* A name and classification. The prompt pattern name uniquely identifies the
  * indicates the problem that is being addressed. 
  * Tab I: For the classification, we have developed a series of initial
    categories of pattern types, which are summarized in Table I and 
  * include Output Customization, Error Identification, Prompt Improvement,
    Interaction, and Context Control.
* The intent and context describes the problem the prompt pattern solves and the
  should ideally be independent of any domain, though domain-specific patterns
* The motivation provides the rationale for the problem and explains why 
  * Specific circumstances where the improvements are expected are documented.
* The structure and key ideas. The structure describes 
  * the fundamental contextual information,
    as a series of key ideas, that the prompt pattern provides to the LLM.
  * These ideas are similar to “participants” in a software pattern. 
  * The contextual information may be communicated through varying wording (just
    as a software pattern can have variations in how it is realized in code),
    but should have fundamental pieces of information that form a core element
* Example implementation demonstrates how the prompt pattern is worded
* Consequences summarize the pros and cons of applying the pattern and may
  * how to adapt the prompt to different contexts.

## D. A Way Forward: Fundamental Contextual Statements

* We propose the concept of fundamental contextual statements, which are
  * written descriptions of the important ideas to communicate in a prompt to an
* The key ideas to communicate are presented to the user as
  a series of simple, but fundamental, statements.
* intuitive to users. In particular, we expect users will understand how to
  * the underlying ideas of the prompt can be expressed by the user in alternate
    symbology or wording that has been introduced to the LLM using patterns,
    such as the Meta Language Creation pattern presented in Section III-B.
* in the same way that software patterns can be implemented in different
  programming languages and platforms. For the purposes of 
* this paper, however, all prompts were tested with ChatGPT [12] using the
  * examples were documented through 
    exploring the corpus of community-posted prompts on the Internet and
    independent prompt creation from our use of ChatGPT 

# III 16 prompt patterns that have been applied to solve common problems 

* in the domain of conversational LLM interaction and output generation for
  automating software development tasks; 

* Tab I
  * Input Semantics
    * Meta Language Creation
  * Output Customization
    * Output Automater
    * Persona
    * Visualization Generator
    * Recipe
    * Template
  * Error Identification
    * Fact Check List
    * Reflection
  * Prompt Improvement
    * Question Refinement
    * Improvement
    * Alternative Approaches
    * Cognitive Verifier
    * Refusal Breaker
  * Interaction
    * Flipped Interaction
    * Game Play
    * Infinite Generation 
  * Context Control
    * Context Manager

## B. The Meta Language Creation Pattern
## C. The Output Automater Pattern
## D. The Flipped Interaction Pattern
## E. The Persona Pattern
## F. The Question Refinement Pattern
## G. The Alternative Approaches Pattern
## H. The Cognitive Verifier Pattern
## I. The Fact Check List Pattern
## J. The Template Pattern
## K. The Infinite Generation Pattern
## L. The Visualization Generator Pattern
## M. The Game Play Pattern
## N. The Reflection Pattern
## O. The Refusal Breaker Pattern
## P. The Context Manager Pattern
## Q. The Recipe Pattern

# IV related work

* A key advantage of patterns is their composability, allowing developers to
  build pattern sequences and pattern languages that can be used to address
  * Patterns in other domains: contract design for decentral ledgers [17, 18]
* The importance of good prompt design with LLMs is well understood [19]–[28].
  * the effect of prompt words on AI generative models.  For example, 
    * Liu+ [29] image generation and different characteristics of images.
  * using LLMs to generate visualizations [30]. 
  * Han+ [31] researched strategies for designing prompts for classification
  * boolean prompt design for literature queries [32]. Yet other work has
  * prompts for software and fixing bugs [33].
* The quality of the answers produced by LLMs, particuarly ChatGPT, has been
  * ChatGPT took the medical licensing exam with surprisingly good results [3]
  * The use of ChatGPT in Law School has also been explored [34]. Other papers
  * mathematical reasoning abilities [35].  As more domains are explored, 
  * we expect that domain-specific pattern catalogs will be developed
    to share domain-specific problem solving prompt structures

# V concluding remarks and lessons learned.

* As LLM capabilities change, some patterns may no longer be necessary, be
  obviated by different styles of interaction or conversation/session management
  approaches, or require enhancement to function correctly. Continued work will
* most of the patterns have been discussed in the context of software devel,
  these same patterns are applicable in arbitrary domains:
  * infinite generation of stories for entertainment; educational games;
    explorations of topics
