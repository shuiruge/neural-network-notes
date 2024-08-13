<TeXmacs|2.1>

<style|book>

<\body>
  <chapter|Natural Language Processing>

  <section|Representation of Words>

  <subsection|Knowing a Word by the Company It Keeps>

  The theme of natural language processing is teaching machine to understand
  human languages. Human languages are consist of sentences, which in turn
  are consist of words. So, the basic task is teaching machine to understand
  the meaning of a word.

  First of all, we have to figure out how to explicitly represent the meaning
  of a word. In <with|font-shape|italic|Philosophical Investigations>,
  published in 1953, the Austrian philosopher Ludwig Wittgenstein claimed:
  \POne cannot guess how a word functions. One has to look at its use, and
  learn from that.\Q Later in 1957, the English linguist John Rupert Firth
  developed this idea, suggested in his little book
  <with|font-shape|italic|Studies in Linguistic Analysis> (section 4): \PYou
  shall know a word by the company it keeps\Q. He then illustrated that the
  meaning of \Pass\Q is indicated by the collocations like \Pyou silly ass\Q,
  \Pwhat an ass he is\Q, and \Pdon't be such an ass\Q. Words in collocation
  support each other, apprehend each other.

  <subsection|Context-Dependent/Independent Vector Representation>

  Machine cannot understand a string (a word) unless it is properly encoded.
  The code shall preserve the meaning of the word. In this section, we seek
  for the general approach to encode a word by <math|n>-dimensional vector
  based on the Firth's idea: you shall know a word by the company it keeps.

  As a preparation, we shall collect a corpus which consists of contexts. A
  context is a list of words in human languages. It can be a sentence, a
  paragraph, or a document. Generally, it is a sequence of words
  <math|<around*|(|w<rsub|1>,w<rsub|2>,\<ldots\>,w<rsub|T>|)>>, where the
  <math|T> varies with each context. In addition, we shall prepare a
  vocabulary <math|\<cal-V\>>, which is an (ordered) list of
  words.<\footnote>
    In practice, we build the vocabulary <math|\<cal-V\>> by word-counting.
    That is, we iterate over the corpus and count the frequency of each word.
    Then sort the words by their frequency in descending. For limiting the
    size of vocabulary, we simply omit the words with extremely low
    frequencies. Whenever these words are encountered, they are replaced by
    the \Pword\Q <verbatim|\<less\>OOV\<gtr\>> in vocabulary, short for
    out-of-vocabulary.
  </footnote>

  For example, consider the sentence (context): <samp|the quick brown fox
  jumps over the lazy dog.> The word <samp|fox> keeps a company consisting of
  the rest of the words: <samp|the>, <samp|quick>, <samp|brown>,
  <samp|jumps>, <samp|over>, <samp|the>, <samp|lazy>, and <samp|dog>. Notice
  that the word <samp|the> appears twice in different positions. A vocabulary
  can be <math|\<cal-V\>\<assign\><around*|(|<text|<samp|the>>,<text|<samp|quick>>,<text|<samp|brown>>,<text|<samp|fox>>,<text|<samp|jumps>>,<text|<samp|over>>,<text|<samp|lazy>>,<text|<samp|dog>>,\<ldots\>|)>>,
  but <samp|the> is unique in <math|\<cal-V\>>.

  Now, about Firth's idea: given a context, the company that a word keeps are
  the other words in the same context; and out of its company, the word can
  be predicted (machine knows the meaning of a word if the word can be
  correctly predicted). So, the Firth's idea that you shall know a word by
  the company it keeps can be restated as predicting the word in a context by
  the other words in the same context.

  Generally, given a context <math|<around*|(|w<rsub|1>,w<rsub|2>,\<ldots\>,w<rsub|T>|)>>,
  a word <math|w<rsub|t>> keeps company <math|<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>>.
  We are to build a model for the conditional probability

  <\equation>
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;t|)>,<label|equation:general
    model 0>
  </equation>

  for each word <math|w> in vocabulary <math|\<cal-V\>>, such that, at least
  statistically, <math|w<rsub|t>> has the maximal probability. The parameter
  <math|t> indicates the position of word <math|w> in context. \ For example,
  for predicting <samp|fox> out of its company, we shall compute
  <math|p<around*|(|w\|<text|<samp|the>>,<text|<samp|quick>>,<text|<samp|brown>>,<text|<samp|jumps>>,<text|<samp|over>>,<text|<samp|the>>,<text|<samp|lazy>>,<text|<samp|dog>>;4|)>>
  for each word <math|w> in <math|<around*|(|<text|<samp|the>>,<text|<samp|quick>>,<text|<samp|brown>>,<text|<samp|fox>>,<text|<samp|jumps>>,<text|<samp|over>>,<text|<samp|lazy>>,<text|<samp|dog>>,\<ldots\>|)>>,
  and expect the probability of <samp|fox> to be maximum.

  Since the ultimate goal is to find a vector representation for each word in
  vocabulary, the conditional probability (<reference|equation:general model
  0>) shall be computed out of the vector representation of the word
  <math|w<rsub|t>>, the meaning of <math|w<rsub|t>> that a machine can
  understand. The vector representation of <math|w<rsub|t>>, which is
  context-dependent, can be generally expressed by

  <\equation>
    v<rsub|w<rsub|t>>\<assign\>f<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;t,\<theta\>|)>,<label|equation:vector
    representation>
  </equation>

  where <math|f<around*|(|\<ldots\>;t,\<theta\>|)>:\<cal-V\><rsup|T-1>\<rightarrow\>\<bbb-R\><rsup|n>>
  represents a general model parameterized by <math|\<theta\>>, such as a
  neural network. Regardless of the explicit form of <math|f>, the point is
  that the vector representation <math|v<rsub|w<rsub|t>>> shall depend on the
  company that <math|w<rsub|t>> keeps in the context.

  In machine learning, categorical probability is represented by the output
  of softmax function. Recall that softmax function is defined by
  <math|softmax<rsub|\<alpha\>><around*|(|x|)>\<assign\>exp<around*|(|x<rsub|\<alpha\>>|)>/<big|sum><rsub|\<beta\>>exp<around*|(|x<rsub|\<beta\>>|)>>.
  Since softmax is positive definite and <math|<big|sum><rsub|\<alpha\>>softmax<rsub|\<alpha\>><around*|(|x|)>=1>,
  its output is usually interpreted as categorical probability, in which the
  <math|\<alpha\>>-index represents the probability of the word in the
  <math|\<alpha\>> position of vocabulary, <math|\<cal-V\><rsub|\<alpha\>>>.
  In the previous example, the component <math|softmax<rsub|2>> represents
  the probability of <math|\<cal-V\><rsub|2>>, which is the word
  <samp|quick>. For simplicity, we also use the word for its position in
  vocabulary, thus <math|\<cal-V\><rsub|<text|<samp|quick>>>\<assign\>\<cal-V\><rsub|2>=<text|<samp|quick>>>.
  The input of softmax function thus shall be a
  <math|<around*|\||\<cal-V\>|\|>>-dimensional vector; and we shall transform
  the <math|n>-dimensional vector <math|v<rsub|w<rsub|t>>> to be
  <math|<around*|\||\<cal-V\>|\|>>-dimensional. The simplest way to do so is
  linear transformation <math|U v<rsub|w<rsub|t>>>, where <math|U> is a
  trainable <math|<around*|\||\<cal-V\>|\|>\<times\>n> matrix. Thus,

  <\equation*>
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;t|)>=softmax<rsub|w><around*|(|U
    v<rsub|w<rsub|t>>|)>.
  </equation*>

  For <math|w<rsub|t>> can be correctly predicted out of its context, we have
  to maximize this probability. Thus, the loss function shall be<\footnote>
    In practice, when computing the term <math|<big|sum><rsub|x\<in\>\<cal-V\>>exp<around*|(|u<rsub|x>\<cdot\>v<rsub|w<rsub|t>>|)>>,
    instead of running over the vocabulary <math|\<cal-V\>>, it is preferred
    to sample limited number of words from <math|\<cal-V\>> and compute the
    summation on the samples.
  </footnote>

  <\equation>
    L<around*|(|\<theta\>,U|)>\<assign\>-\<bbb-E\><rsub|<around*|(|w<rsub|1>,\<ldots\>,w<rsub|T>|)>\<sim\>corpus,t\<sim\><around*|(|1,\<ldots\>,T|)>><around*|[|ln
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;t|)>|]>,
  </equation>

  where we have applied the whole process to all the contexts in the corpus
  and all the words in each context. The whole model has two parts of
  trainable parameters, the <math|\<theta\>> used for computing the
  context-dependent vector representation <math|v<rsub|w<rsub|t>>>, and the
  matrix <math|U> for computing probability. This is how to know a word by
  the company it keeps for a machine.

  The matrix <math|U> has an intrinsic interpretation. If we denote each
  row-vector of the matrix <math|U> by <math|u<rsub|w>>, where the <math|w>
  indicates the position of the word <math|w> in vocabulary. Thus, in the
  previous example, we have <math|<around*|(|u<rsub|<text|<samp|quick>>>|)><rsub|\<alpha\>>\<assign\>U<rsub|2
  \ \<alpha\>>> for <math|\<alpha\>=1,\<ldots\>,n>. This results in

  <\equation>
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;t|)>=<frac|exp<around*|(|u<rsub|w>\<cdot\>v<rsub|w<rsub|t>>|)>|<big|sum><rsub|x\<in\>\<cal-V\>>exp<around*|(|u<rsub|x>\<cdot\>v<rsub|w<rsub|t>>|)>>,
  </equation>

  where, for each <math|w\<in\>\<cal-V\>>,
  <math|u<rsub|w>\<in\>\<bbb-R\><rsup|n>> is a trainable parameter. The
  <math|u<rsub|w>>, for each word <math|w> in vocabulary, can be viewed as a
  context-independent (or \Pabsolute\Q) vector representation of <math|w>.
  Indeed, a word <math|w> has different context-dependent vectors
  <math|v<rsub|w>>s in contexts, but the <math|u<rsub|w>> is the
  context-independent vector that is closest, at least statistically, to
  these <math|v<rsub|w>>s.

  As a summary, we have built a general model for teaching machine to
  understand the meaning of words, by representing each word by two
  <math|n>-dimensional real vectors. One is context-dependent (the
  <math|v<rsub|w>> vector); and the other is context-independent or absolute
  (the <math|u<rsub|w>> vector). All that left is determining the explicit
  form of <math|f<around*|(|\<ldots\>;t,\<theta\>|)>> in equation
  (<reference|equation:vector representation>). Different researchers propose
  different forms of <math|f<around*|(|\<ldots\>;t,\<theta\>|)>>, with
  different complexities, resulting in different performances.

  <subsection|Example: Bidirectional Encoder Representations from
  Transformers>

  <\footnote>
    <with|font-shape|italic|BERT: Pre-training of Deep Bidirectional
    Transformers for Language Understanding>, by Jacob Devlin and others,
    2018. The paper can be found in <hlink|arXiv|https://arxiv.org/abs/1810.04805>.
  </footnote>

  <subsection|Application: Named-Entity Recognition>

  By the vector representation of a word, computer can understand the meaning
  of the word. Then, it can recognize named-entities in a sentence.
  Named-entity is a word for a specific entity, such as person, city, or
  time. For example, consider the sentence: <samp|Jim bought 300 shares of
  Acme Corp. in 2006.> We can recognize <samp|Jim> as a person, <samp|Acme
  Corp.> as an organization, and <samp|2006> as time.

  Named-entity recognition (NER for short) is an important topic of natural
  language processing. But since words in a sentence have been represented by
  vectors, NER becomes a simple classification task. Precisely, suppose we
  have a set of named-entity classes, like <verbatim|person>,
  <verbatim|orgnization>, <verbatim|time>, etc. We also have a specific
  class, labeled by <verbatim|\<less\>O\<gtr\>>, for words that are not
  named-entity, such as <samp|is>, <samp|walk>, and <samp|good>. So, the task
  is classify the word into any of these classes.

  <section|Representation of Sentences>

  <section|Machine Translation>

  <section|Language Modeling>

  <section|Drafts>

  <subsection|<verbatim|Word2vec> Is a Simple Model that Implements the
  Firth's Idea>

  In 2013, Tomas Mikolov and others proposed a simple model that encodes the
  words into <math|n>-dimensional real vectors.<\footnote>
    The original paper can be found in <hlink|arXiv|https://arxiv.org/abs/1301.3781>.
  </footnote> The underlying idea is that of Firth: words that company a word
  give the meaning of the word. There are two questions: what does company
  mean explicitly, and how these words give the meaning of a word. The
  answers are:

  <\itemize>
    <item>the words surround a word in a sentence company the word; and

    <item>from these words, the central word can be predicted.
  </itemize>

  For example, consider the sentence: <samp|the quick brown fox jumps over
  the lazy dog.> If we take into account four neighbors, then the word
  <samp|fox> will have neighbors <samp|quick>, <samp|brown>, <samp|jumps>,
  and <samp|over>. These four words company the central <samp|fox>.

  Then, to predict <samp|fox> out of its four neighbors, the authors employed
  a simple probabilistic model. First, they assumed that the probability is
  \Pseparable\Q, as

  <\equation*>
    p<around*|(|fox\|quick,brown,jumps,over|)>=p<around*|(|fox\|quick|)>
    p<around*|(|fox\|brown|)> p<around*|(|fox\|jumps|)>
    p<around*|(|fox\|over|)>.
  </equation*>

  This indicates that the positional relationship is omitted. For modeling
  each conditional probability, they assigned two <math|n>-dimensional real
  vectors for each word in a given vocabulary. For example, let vocabulary
  <math|\<cal-V\>=<around*|(|the,quick,brown,fox,jumps,over,lazy,dog,\<ldots\>|)>>
  in which each word is represented by two vectors
  <math|u,v\<in\>\<bbb-R\><rsup|n>>. They then built a simple model for
  predicting <samp|fox> out of <samp|quick>, <samp|brown>, etc, as

  <\equation>
    p<around*|(|w\|w<rprime|'>|)>=<frac|exp<around*|(|u<rsub|w>\<cdot\>v<rsub|w<rprime|'>>|)>|<big|sum><rsub|x\<in\>\<cal-V\>>exp<around*|(|u<rsub|x>\<cdot\>v<rsub|w<rprime|'>>|)>>.<label|equation:word2vec>
  </equation>

  For example, <math|w> and <math|w<rprime|'>> denote <samp|fox> and
  <samp|quick> respectively. The vector <math|u> represents for the center
  word, which is to be predicted, and the vector <math|v> for one of the
  neighbors. In this model, the vectors <math|u> and <math|v> for each word
  in vocabulary <math|\<cal-V\>> are trainable parameters. They are adjusted
  so as to maximize the probabilities like
  <math|p<around*|(|fox\|quick,brown,jumps,over|)>>. In this way, <samp|fox>
  is \Pknown\Q, or predicted, by the words <samp|quick>, <samp|brown>,
  <samp|jumps>, and <samp|over> that company it. This model is called
  word-to-vector, or <samp|word2vec> for short. Either <math|u<rsub|w>> or
  <math|v<rsub|w>> is employed as the vector representation of a word
  <math|w>.<\footnote>
    In the paper, the authors employed the vector <math|v> as representation.
  </footnote>

  What does the equation (<reference|equation:word2vec>) really mean? Recall
  that softmax function is defined by <math|softmax<rsub|\<alpha\>><around*|(|x|)>\<assign\>exp<around*|(|x<rsub|\<alpha\>>|)>/<big|sum><rsub|\<beta\>>exp<around*|(|x<rsub|\<beta\>>|)>>.
  Since softmax is positive definite and <math|<big|sum><rsub|\<alpha\>>softmax<rsub|\<alpha\>><around*|(|x|)>=1>,
  its output is usually interpreted as categorical probability. So, if we
  collect the <math|u> vectors for all the words in the vocabulary and
  concatenate them together as a <math|<around*|\||\<cal-V\>|\|>\<times\>n>
  matrix <math|U>, then equation (<reference|equation:word2vec>) can be
  re-written as

  <\equation*>
    p<around*|(|w\|w<rprime|'>|)>=softmax<rsub|w><around*|(|U
    v<rsub|w<rprime|'>>|)>,
  </equation*>

  where the <math|U v<rsub|w<rprime|'>>> is a matrix-vector multiplication,
  and the <math|softmax<rsub|w>> is the <math|w>-component of the categorical
  probability. Noticing that <math|\<cal-V\>> is a list, the
  <math|w>-component represents the position of the word <math|w> in
  <math|\<cal-V\>>. Thus, <math|softmax<rsub|w>> is the probability of
  encountering the word <math|w> (given its neighbor <math|w<rprime|'>>).
  <math|>Now the model is found to be a linear transformation of the vector
  <math|v<rsub|w<rprime|'>>> with an additional softmax/probabilistic output.
  Can you find a simpler model for the same task?

  <subsection|<verbatim|Word2vec> in Practice>

  \ After building vocabulary, we iterate over the corpus again to fetch each
  word <math|w> and its neighbors <math|<around*|{|w<rsub|1>,\<ldots\>,w<rsub|N>|}>>
  where <math|N> is a hyper-parameter. We assign an <math|n>-dimensional real
  vector <math|u<rsub|w>> to the word <math|w> and <math|v<rsub|w<rsub|i>>>
  for each neighbor <math|w<rsub|i>>. Thus, the loss function for this datum
  can be written as

  <\equation*>
    l<around*|(|u,v<rsub|w<rsub|1>>,\<ldots\>,v<rsub|w<rsub|N>>|)>\<assign\>-ln
    <around*|(|<big|prod><rsub|i=1><rsup|N><frac|exp<around*|(|u<rsub|w>\<cdot\>v<rsub|w<rsub|i>>|)>|<big|sum><rsub|x\<in\>\<cal-V\>>exp<around*|(|u<rsub|x>\<cdot\>v<rsub|w<rsub|i>>|)>>|)>.
  </equation*>

  As usually, the total loss function will be

  <\equation*>
    L<around*|(|u,v|)>\<assign\>\<bbb-E\><rsub|<around*|(|w,<around*|{|w<rsub|1>,\<ldots\>,w<rsub|N>|}>|)>\<sim\>copus><around*|[|l<around*|(|u,v<rsub|w<rsub|1>>,\<ldots\>,v<rsub|w<rsub|N>>|)>|]>.
  </equation*>

  The authors of <verbatim|word2vec> argued that, when the vocabulary size
  becomes large, the term <math|<big|sum><rsub|x\<in\>\<cal-V\>>exp<around*|(|x\<cdot\>v<rsub|w<rsub|i>>|)>>
  in loss function will become very compute intensive.\ 

  <subsection|Lost and Found>

  There are, however, many drawbacks of <verbatim|word2vec>. The first is the
  omission of positional information. In many situations, this will not be a
  problem. For example, if we exchange the positions of <samp|fox> and
  <samp|quick>, it becomes: <samp|the fox brown quick jumps over the lazy
  dog.> Because of the flexion of words, a reader can understand it without
  any difficulty. Another problem is much more serious: words can be
  polysemy. As an example, <samp|ass> has the meanings of fool, hip, and
  being sexy, but it has at most two vectors of representation.

  Even though <verbatim|word2vec> is not a faithful modeling of the Firth's
  idea, many interesting results are revealed. First of all, the words with
  similar meanings are similar in their vector representations, characterized
  by the <hlink|cosine similarity|https://en.wikipedia.org/wiki/Cosine_similarity#Definition>
  between the vectors. A more interesting result is the relative relation
  between words, like <math|v<rsub|king>-v<rsub|man>\<approx\>v<rsub|qu\<mathe\>en>-v<rsub|woman>>,
  or <math|v<rsub|big>-v<rsub|biggest>\<approx\>v<rsub|small>-v<rsub|smallest>>.

  <section|The Second Example: People in a Park>

  Now, for vector representation of words, the main problem turns to be
  determining the explicitly form of the model
  <math|f<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;\<theta\>|)>>
  in equation (<reference|equation:general model 1>).

  Recall that, in <verbatim|word2vec>, the positional information of the
  words in context is omitted. But, in fact, position can also be encoded.
  So, we can regard <math|w<rsub|t>> as a pair
  <math|<around*|(|w<rsub|t>,t|)>> where the second variable labels the
  position of the word <math|w<rsub|t>> in the context
  <math|<around*|(|w<rsub|1>,\<ldots\>,w<rsub|T>|)>>.

  We first assign each <math|w<rsub|t>> and <math|t> <math|n>-dimensional
  real vectors respectively, and then add them together, resulting in one
  <math|n>-dimensional real vector for the pair
  <math|<around*|(|w<rsub|t>,t|)>>, denoted by <math|x<rsub|t>>. Then, these
  vectors, each for a word, are mutually mixed. Explicitly, it computes the
  \Pproximity\Q from <math|x<rsub|t<rprime|'>>> to <math|x<rsub|t>> for each
  <math|t,t<rprime|'>=1,\<ldots\>,T> with <math|t\<neq\>t<rprime|'>>,
  determined by

  <\equation*>
    W<rsub|t t<rprime|'>>\<assign\><frac|exp<around*|(|x<rsub|t>\<cdot\><around*|(|K<rsup|T>
    K|)>\<cdot\>x<rsub|t<rprime|'>>|)>|<big|sum><rsub|<rsub|t<rprime|''>=1>><rsup|T>exp<around*|(|x<rsub|t<rprime|''>>\<cdot\><around*|(|K<rsup|T>
    K|)>\<cdot\>x<rsub|t<rprime|'>>|)>>,
  </equation*>

  and <math|w<rsub|t t>=0>, where <math|K> is an <math|m\<times\>n> matrix
  with <math|m> arbitrary. Then, compute the weighted output

  <\equation*>
    z<rsub|t>\<assign\><big|sum><rsub|t<rprime|'>=1><rsup|T>W<rsub|t
    t<rprime|'>> x<rsub|t<rprime|'>>.
  </equation*>

  The greater the <math|W<rsub|t t<rprime|'>>> is, the more contribution from
  <math|x<rsub|t<rprime|'>>> to <math|z<rsub|t>>.

  Next, let <math|FFN<rsub|\<theta\>>> a feed-forward neural network
  parameterized by <math|\<theta\>>, the output is
  <math|v<rsub|w<rsub|t>>\<assign\>FFN<rsub|\<theta\>><around*|(|z<rsub|t>|)>>.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.5|3>>
    <associate|auto-11|<tuple|1.5.1|3>>
    <associate|auto-12|<tuple|1.5.2|4>>
    <associate|auto-13|<tuple|1.5.3|4>>
    <associate|auto-14|<tuple|1.6|4>>
    <associate|auto-15|<tuple|5|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1.1|1>>
    <associate|auto-4|<tuple|1.1.2|1>>
    <associate|auto-5|<tuple|1.1.3|2>>
    <associate|auto-6|<tuple|1.1.4|3>>
    <associate|auto-7|<tuple|1.2|3>>
    <associate|auto-8|<tuple|1.3|3>>
    <associate|auto-9|<tuple|1.4|3>>
    <associate|equation:general model 0|<tuple|1.1|1>>
    <associate|equation:vector representation|<tuple|1.2|2>>
    <associate|equation:word2vec|<tuple|1.5|3>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-1.1|<tuple|1.1|1>>
    <associate|footnote-1.2|<tuple|1.2|2>>
    <associate|footnote-1.3|<tuple|1.3|2>>
    <associate|footnote-1.4|<tuple|1.4|3>>
    <associate|footnote-1.5|<tuple|1.5|3>>
    <associate|footnote-2|<tuple|2|?>>
    <associate|footnr-0|<tuple|1.3|?>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-1.1|<tuple|1.1|1>>
    <associate|footnr-1.2|<tuple|1.2|2>>
    <associate|footnr-1.3|<tuple|1.3|2>>
    <associate|footnr-1.4|<tuple|1.4|3>>
    <associate|footnr-1.5|<tuple|1.5|3>>
    <associate|footnr-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Natural
      Language Processing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Vector Representation of Words
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <with|par-left|<quote|1tab>|1.1.1<space|2spc>Knowing a Word by the
      Company It Keeps <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.1.2<space|2spc>Context-Dependent/Independent
      Vector Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.1.3<space|2spc>Example: Bidirectional
      Encoder Representations from Transformers
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|1.1.4<space|2spc>Application: Named-Entity
      Recognition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      1.2<space|2spc>Representation of Sentences
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      1.3<space|2spc>Machine Translation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      1.4<space|2spc>Language Modeling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      1.5<space|2spc>Drafts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|1.5.1<space|2spc><with|font-family|<quote|tt>|language|<quote|verbatim>|Word2vec>
      Is a Simple Model that Implements the Firth's Idea
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|1.5.2<space|2spc><with|font-family|<quote|tt>|language|<quote|verbatim>|Word2vec>
      in Practice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|1.5.3<space|2spc>Lost and Found
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      1.6<space|2spc>The Second Example: People in a Park
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>
    </associate>
  </collection>
</auxiliary>