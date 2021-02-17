Jimmy Lin and Chris Dyer
(2010)
Data-Intensive Text Processing with MapReduce

* Introduction
  * next-generation DNA sequencing technology: transformative [103].
  * big ideas
    * Scale “out”, not “up”: a large number of [small] servers
    * Hide system-level details from the application developer. why writing code is difficult
    * Seamless scalability. linear or not
* MapReduce Basics
  * quantum or biological computing \dots are far from being sufficiently mature to solve real world problems.
  * Functional Programming Roots
    * for operations that are commutative and associative, significant efficiencies can be gained in the fold operation through local aggregation and appropriate reordering.
    * Viewed from a slightly different angle,
      * In the first stage, a user-specified computation is applied over all input records in a dataset.
  * Mappers and Reducers
    * Key-value pairs
    * map: $(k1 , v1 ) \rightarrow [(k2 , v2 )]$
    * reduce: $(k2 , [v2 ]) \rightarrow [(k3 , v3 )]$
    * differences between the Hadoop implementation of MapReduce and Google’s implementation
    * for Hadoop programmin, we would recommend Tom White’s book [154].
    * Speculative execution
    * skew in the distribution of values associated with intermediate keys
  * Partitioners and Combiners
    * Partitioners are responsible for dividing up the intermediate key space and assigning intermediate key-value pairs to reducers.
    * Combiners \dots allow for local aggregation before the shuffle and sort phase.
  * The distributed file system
    * Google File System (GFS) [57], HDFS (Hadoop Distributed File System)
* MapReduce algorithm design
  * Local aggregation
    * reductions in the amount of intermediate data
    * Combiners and in-mapper combining
      * “in-mapper combining”: accumulate partial term counts in the associative array across multiple documents,
      * memory limitation
  * Pairs and Stripes
    * example: building word co-occurrence matrices from large corpora
    * lexical semantics based on distributional profiles of words, dating back to Firth [55] % TODO read
    * and Harris [69] in the 1950s and 1960s.
    * in the case where the matrix is too big to fit in memory
  * Computing relative frequencies
    * Section 3.3 shows how co-occurrence counts can be converted into relative frequen- cies using a pattern known as “order inversion”.
    * custom partitioner
    * serialization, “order inversion”. It is so named because through proper co- ordination, we can access the result of a computation in the reducer before processing the data needed for that computation.
  * Secondary sorting
    * by value
    * “value-to-key conversion” design pattern.
    * distributed sorting is a task that the MapReduce runtime excels at since it lies at the heart of the programming model.
  * Relational Joins
    * Map-Side Join az utolsó bekezdést nem értem
    * memory-backed joins based on random access probes
* Inverted Indexing for Text Retrieval
  * engine—query latencies longer than a few hundred mil- liseconds will try a user’s patience.
  * features such as
    * term matches,
    * term proximity,
    * attributes of the terms in the document (e.g., bold, appears in title, etc.), as well as the
    * hyperlink structure of the documents (e.g., PageRank [117], which we’ll discuss in Chapter 5, or related metrics such as HITS [84] and SALSA [88]).
  * The web search problem decomposes into
    * gathering web content (crawling),
      * even for rapidly changing sites, it is usually
      * tolerable to have a delay of a few minutes until content is searchable. Furthermore, since
      * the amount of content that changes rapidly is relatively small, running smaller-scale in-
      * dex updates at greater frequencies is usually an adequate solution.
    * construction of the inverted index (indexing) and
    * ranking documents given a query (retrieval).
    * WEB CRAWLING
      * we start by populating a queue with a “seed” list of pages.
      * not overload web servers.
      * prioritize the order
      * coordination
      * learn update patterns
      * duplicate
      * multilingual.
    * INVERTED INDEXES
      * postings lists, one associated with each term
      * each posting consists of a
        * document id and a
        * payload—information about occurrences of the term in the document.
          * term frequency
          * positions for phrase queries and proximity
          * features
          * NER
          * anchor text information (text associated with hyperlinks from other pages to the page in question)
      * oreder of postings, semantics of ids
      * Partial document scores are stored in structures called accumulators.
      * optimization
      * strategies for query evaluation (both approximate and exact) that reduce the number of postings a retrieval engine must examine.
      * hold the entire vocabulary (i.e., dictionary of all the terms) in memory, especially with techniques such as front-coding [156].
    * INVERTED INDEXING: BASELINE IMPLEMENTATION
    * INVERTED INDEXING: REVISED IMPLEMENTATION
    * bottleneck: an in-memory sorting of all postings for a given term
    * almost all retrieval models take into account document length when computing query– document scores,
    * INDEX COMPRESSION
      * encode differences between document ids
      * time–space tradeoff. the two factors are properly balanced if decoding speed can keep up with disk bandwidth
      * variable-length integer coding (varInt), byte-aligned
      * A variant of the varInt scheme described by Jeff Dean
      * Simple-9,
      * BIT-ALIGNED CODES
      * POSTINGS COMPRESSION
      * depends on the distribution of d-gaps.
      * problem: The df of a term, however, is not known until all the postings have been processed
    * WHAT ABOUT RETRIEVAL?
      * breaking up the index, two main partitioning strategies: document partitioning and term partitioning.
      * query broker,
      * document partitioning is a better strategy
      * Along one dimension, it is desirable to partition by document quality
      * partition documents by content
      * document server takes as
        * input a query and a document id, and
        * computes an appropriate result entry, typically comprising the title and URL of the page, a snippet of the source document showing the user’s query terms in context, and additional metadata
        * caching, of
          * individual postings (assuming that the index is not already in memory) and even
          * results of entire queries
    * SUMMARY AND ADDITIONAL READINGS
* Graph Algorithms
  * Google recently published a short description of a system called Pregel [98], based on Valiant’s Bulk Synchronous Parallel model [148], for large-scale graph algorithms
  * encoding undirected graphs with adjacency list: order the nodes...
  * PARALLEL BREADTH-FIRST SEARCH
  * Dijkstra’s
    * priority queue of vertices with priorities equal to their distance values
    * MapReduce does not provide a mechanism for exchanging global data.
    * real-world problems: the saying “six degrees of separation”
  * parallel
  * comparison
  * Graph algorithms in MapReduce are generally iterative,
  * PAGERANK
    * two other popula rapproaches to inferring the quality of a web page based on hyperlink structure, not covered here, are SALSA [88] and HITS [84] (also known as “hubs and authorities”). % TODO
    * α is sometimes called the “teleportation” factor; alternatively, (1 − α) is referred to as the “damping” factor.
    * The proper treatment of PageRank mass “lost” at the dangling nodes is to redistribute it across all nodes in the graph evenly
  * ISSUES WITH GRAPH PROCESSING
    * communication can only occur from a node to the nodes it links to,
    * partition large graphs and use combiners
    * partitioning heuristics based on reordering
    * addition of logprobalities
  * Schatz [132] tackled the problem of DNA sequence alignment and assembly with graph algorithms in MapReduce.
* EM Algorithms for Text Processing

