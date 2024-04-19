Designing a Uniform Meaning Representation for Natural Language
JELVan Gysel, M Vigus, J Chun, K Lai, S Moeller, J Yao, T O’Gorman, A Cowell,
  W Croft, C Huang, J Hajič, JH Martin, S Oepen, M Palmer, J Pustejovsky,
  R Vallejos, N Xue
KI Künstliche Intelligenz (2021) 35:343–360

# 2 Four desiderata that guide the design of UMR. In Sect.  

## Scalability/learnability. Meaning representations are expected to be

* needs to be 
  * intuitive so that it does not put too many constraints on the pool of
    annotators who are capable of performing the annotation. The meaning
  * a formal object such as a tree or a graph that is easy to manipulate algo

## Supporting similarity-based lexical inference. Natural languages are known

* the same meaning can be expressed through different morphosyntactic constrs
  * should be repred in the same way
  * abstract away from the morphosyntactic variations, 
* ambiguous
  * disambiguate the senses of a word or phrase, and 
  * resolve references of referring expressions
    such as proper nouns and pronouns.

## Supporting logical inference. Supporting logical inference has been 

* the primary goal for classical meaning representations, which aim to be
  easily translatable to logical form—typically first-order logic. Logical
  systems allow new statements to be inferred from known facts, and linguistic
* quantification, negation, tense and aspect, and modality have traditionally
* First-order logic formalisms in grounded semantic parsing
  * parse natural language queries into first-order logic-based meaning reprs
  * can be executed against knowledge bases [16, 17, 35, 46, 49, 64, 81]. It is
* canonicalize referring exprs ~> they can be grounded to external knowl bases

## Cross-linguistic plausibility and portability: uniform across languages
* morphosyntax 
  (e.g. constituent order, degree of inflectional synthesis of the verb),
* grammaticalization of different ways of dividing up conceptual space [75],
* different morphosemantic mappings between concepts and words.

# 3 overview of Abstract Meaning Representation that serves as the starting

# 4 UMR sentence-level extensions to AMR in 

# 5 documentlevel extensions in 

# 6 cross-linguistic diversity in linguistic distinctions and in mapping words
to UMR concepts in 

# 7 minority languages that face cultural and technological challenges and
lack of foundational resources. Although annotated full UMRs are not yet
available as 

* we actively develop tools to support UMR annotation, we present 

# 8 experiments that show they can be annotated reliably. In 

# 9 how UMR is related to existing meaning representations, and in

* how they address each aspect of our four desiderata. We 

# 10 conclude in 10.
