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
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>,<label|equation:firth
    idea>
  </equation>

  for each word <math|w> in vocabulary <math|\<cal-V\>>, such that, at least
  statistically, <math|w<rsub|t>> has the maximal probability. The word
  <verbatim|\<less\>?\<gtr\>>, which is a specific element in vocabulary
  <math|\<cal-V\>>, is a placeholder used for indicating the position of word
  <math|w> in context sequence. For example, for predicting <samp|fox> out of
  its company, we shall compute <math|p<around*|(|w\|<text|<samp|the>>,<text|<samp|quick>>,<text|<samp|brown>>,<text|<verbatim|\<less\>?\<gtr\>>>,<text|<samp|jumps>>,<text|<samp|over>>,<text|<samp|the>>,<text|<samp|lazy>>,<text|<samp|dog>>|)>>
  for each word <math|w> in <math|<around*|(|<text|<samp|the>>,<text|<samp|quick>>,<text|<samp|brown>>,<text|<samp|fox>>,<text|<samp|jumps>>,<text|<samp|over>>,<text|<samp|lazy>>,<text|<samp|dog>>,\<ldots\>|)>>,
  and expect the probability of <samp|fox> to be maximum.

  Since the ultimate goal is to find a vector representation for each word in
  vocabulary, the conditional probability (<reference|equation:firth idea>)
  shall be computed out of the vector representation of the word
  <math|w<rsub|t>>, the meaning of <math|w<rsub|t>> that a machine can
  understand. The vector representation of <math|w<rsub|t>>, which is
  context-dependent, can be generally expressed by

  <\equation>
    v<rsub|w<rsub|t>>\<assign\>f<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;\<theta\>|)>,<label|equation:vector
    representation>
  </equation>

  where <math|f<around*|(|\<ldots\>;\<theta\>|)>:\<cal-V\><rsup|T>\<rightarrow\>\<bbb-R\><rsup|n>>
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
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>=softmax<rsub|w><around*|(|U
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
    p<around*|(|w<rsub|t>\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>|]>,
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
    p<around*|(|w\|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>=<frac|exp<around*|(|u<rsub|w>\<cdot\>v<rsub|w<rsub|t>>|)>|<big|sum><rsub|x\<in\>\<cal-V\>>exp<around*|(|u<rsub|x>\<cdot\>v<rsub|w<rsub|t>>|)>>,
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
  form of <math|f<around*|(|\<ldots\>;\<theta\>|)>> in equation
  (<reference|equation:vector representation>). Different researchers propose
  different forms of <math|f<around*|(|\<ldots\>;\<theta\>|)>>, with
  different complexities, resulting in different performances.

  <subsection|Example: Bidirectional Encoder Representations from
  Transformers (BERT)>

  \;

  In 2018, Jacob Devlin and others built a model for the vector
  representation, equation (<reference|equation:vector
  representation>).<\footnote>
    <hlink|<with|font-shape|italic|BERT: Pre-training of Deep Bidirectional
    Transformers for Language Understanding>|https://arxiv.org/abs/1810.04805>
    by Jacob Devlin and others, 2018.
  </footnote> Given a context <math|<around*|(|w<rsub|1>,w<rsub|2>,\<ldots\>,w<rsub|T>|)>>,
  a word <math|w<rsub|t>> keeps company <math|<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>>,
  to model the parameterized function <math|f<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>;\<theta\>|)>>,
  they considered a neural network which is a stack of multiple
  self-attention layers and feed-forward layers.

  The first layer in the neural network is called
  <with|font-series|bold|embedding>. In this layer, each word
  <math|w<rsub|t>> and its position <math|t> are assigned with two
  <math|n>-dimensional real vectors respectively. Then add the two vectors
  together, resulting in one <math|n>-dimensional real vector for the pair
  <math|<around*|(|w<rsub|t>,t|)>>, denoted by <math|x<rsub|t>>. So, the
  input <math|<around*|(|w<rsub|1>,\<ldots\>,w<rsub|t-1>,<text|<verbatim|\<less\>?\<gtr\>>>,w<rsub|t+1>,\<ldots\>,w<rsub|T>|)>>
  is \Pembedded\Q as <math|<around*|(|x<rsub|1>,\<ldots\>,x<rsub|T>|)>\<in\>\<bbb-R\><rsup|n\<times\>T>>.

  Upon the embedding layer, it is stacked by self-attention layers and
  feed-forward layers in turn. <with|font-series|bold|Self-attention> layer
  mixes the information of the \Pembedded words\Q mutually. It accepts the
  sequence <math|<around*|(|x<rsub|1>,\<ldots\>,x<rsub|T>|)>> as input. The
  portion of information propagating from position <math|t<rprime|'>> to
  <math|t> for each <math|t,t<rprime|'>=1,\<ldots\>,T> is determined by a
  real valued function <math|q<around*|(|x<rsub|t>,x<rsub|t<rprime|'>>;\<varphi\>|)>>,
  parameterized by <math|\<varphi\>>. The information of <math|x<rsub|t>> is
  mixed by others via

  <\equation*>
    <wide|x|\<bar\>><rsub|t>\<assign\><frac|<big|sum><rsub|t<rprime|'>=1><rsup|T>exp<around*|(|q<around*|(|x<rsub|t>,x<rsub|t<rprime|'>>;\<varphi\>|)>|)>
    x<rsub|t<rprime|'>>|<big|sum><rsub|t<rprime|''>=1><rsup|T>exp<around*|(|q<around*|(|x<rsub|t>,x<rsub|t<rprime|''>>;\<varphi\>|)>|)>>.
  </equation*>

  If we regard <math|q<around*|(|x<rsub|t>,x<rsub|t<rprime|'>>;\<varphi\>|)>>
  as the logits of a categorical probability
  <math|Q<around*|(|t<rprime|'>|)>>, that is
  <math|Q<around*|(|t<rprime|'>|)>\<assign\>softmax<rsub|t<rprime|'>><around*|(|q<around*|(|x<rsub|t>,x<rsub|\<cdummy\>>;\<varphi\>|)>|)>>,
  then <math|<wide|x|\<bar\>><rsub|t>> can be realized as the expectation

  <\equation*>
    <wide|x|\<bar\>><rsub|t>=\<bbb-E\><rsub|t<rprime|'>\<sim\>Q><around*|[|x<rsub|t<rprime|'>>|]>,
  </equation*>

  and <math|Q<around*|(|t<rprime|'>|)>> becomes the portion of information
  propagating from <math|t<rprime|'>> to <math|t>. This is why we use the
  bar-notation, which is usually assigned for mean or expectation. The output
  of self-attention layer is thus the \Pmixed embedded words\Q
  <math|<around*|(|<wide|x|\<bar\>><rsub|1>,\<ldots\>,<wide|x|\<bar\>><rsub|T>|)>\<in\>\<bbb-R\><rsup|n\<times\>T>>.
  Next, the <with|font-series|bold|feed-forward> layer update each
  <math|<wide|x|\<bar\>><rsub|t>> individually. The feed-forward layer, as it
  is named, is a shallow feed-forward neural network
  <math|g<around*|(|x;\<psi\>|)>>, parameterized by <math|\<psi\>>. The
  output is thus the sequence <math|<around*|(|g<around*|(|<wide|x|\<bar\>><rsub|1>;\<varphi\>|)>,\<ldots\>,g<around*|(|<wide|x|\<bar\>><rsub|T>;\<varphi\>|)>|)>>.
  This sequence is in turn sent to the next self-attention layer, then next
  feed-forward layer. Repeating this process multiple times, the final output
  will be the output of <math|f<around*|(|\<ldots\>;\<theta\>|)>>, the
  context-dependent vector representation of words. The <math|\<theta\>>
  comes to be the collection of parameters in all layers, including
  embedding, self-attention layers, and feed-forward layers. <\footnote>
    This is a sketch of how BERT works. The
    <math|q<around*|(|x<rsub|t>,x<rsub|t<rprime|'>>;\<varphi\>|)>> is
    implemented by

    <\equation*>
      q<around*|(|x<rsub|t>,x<rsub|t<rprime|'>>;\<varphi\>|)>\<assign\><around*|(|W<rsub|K>
      x<rsub|t>|)><rsup|T>\<cdot\><around*|(|W<rsub|Q>
      x<rsub|t<rprime|'>>|)>,
    </equation*>

    where <math|W<rsub|K>> and <math|W<rsub|Q>> are both <math|n\<times\>n>
    matrices, and <math|\<varphi\>\<assign\><around*|(|W<rsub|K>,W<rsub|Q>|)>>.
    In practice, before sending to feed-forward layer, the
    <math|<wide|x|\<bar\>><rsub|t>> is linearly transformed as
    <math|W<rsub|V> <wide|x|\<bar\>><rsub|t>> where <math|W<rsub|V>> is a
    <math|n\<times\>n> matrix. Residual structure and normalization
    (discussed in section <reference|section: Techniques Are Combined for
    Controlling the Gradients>) are employed for controlling gradients. They
    also employ techniques \Pmulti-head attention\Q for enriching the
    information propagation and \Pword-piece\Q for avoiding the
    out-of-vocabulary problem. As an example for illustrating how vector
    representation of words is made in practice, we simply omit these
    details, referring the reader to their original paper.
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
  named-entity, such as <samp|is>, <samp|walk>, and <samp|good>. The task
  turns to be classifying the word into any of these classes. This can be
  done by sending the context-dependent vector representation to a
  feed-forward neural network appended by a softmax function.

  <section|Representation of Sentences (TODO)>

  <subsection|From Words to Sentences: Firth's Idea Continued>

  <\footnote>
    <hlink|<with|font-shape|italic|Universal Sentence
    Encoder>|https://arxiv.org/abs/1803.11175> by Daniel Cer and others,
    2018. A better explanation of universal sentence encoder can be found
    <hlink|here|https://amitness.com/posts/universal-sentence-encoder>.
  </footnote>

  <subsection|Human Languages Are Recursive (Maybe)>

  <subsection|Application: Textual Similarity>

  <subsection|Application: Machine Translation>

  <section|Language Modeling>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.2.3|4>>
    <associate|auto-11|<tuple|1.2.4|4>>
    <associate|auto-12|<tuple|1.3|4>>
    <associate|auto-13|<tuple|1.4.1|4>>
    <associate|auto-14|<tuple|1.4.2|5>>
    <associate|auto-15|<tuple|1.4.3|5>>
    <associate|auto-16|<tuple|1.5|5>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.1.1|1>>
    <associate|auto-4|<tuple|1.1.2|1>>
    <associate|auto-5|<tuple|1.1.3|3>>
    <associate|auto-6|<tuple|1.1.4|3>>
    <associate|auto-7|<tuple|1.2|3>>
    <associate|auto-8|<tuple|1.2.1|3>>
    <associate|auto-9|<tuple|1.2.2|4>>
    <associate|equation:firth idea|<tuple|1.1|2>>
    <associate|equation:vector representation|<tuple|1.2|2>>
    <associate|equation:word2vec|<tuple|1.5|4>>
    <associate|footnote-1.1|<tuple|1.1|1>>
    <associate|footnote-1.2|<tuple|1.2|2>>
    <associate|footnote-1.3|<tuple|1.3|3>>
    <associate|footnote-1.4|<tuple|1.4|3>>
    <associate|footnote-1.5|<tuple|1.5|4>>
    <associate|footnote-1.6|<tuple|1.6|4>>
    <associate|footnote-1.7|<tuple|1.7|?>>
    <associate|footnr-1.1|<tuple|1.1|1>>
    <associate|footnr-1.2|<tuple|1.2|2>>
    <associate|footnr-1.3|<tuple|1.3|3>>
    <associate|footnr-1.4|<tuple|1.4|3>>
    <associate|footnr-1.5|<tuple|1.5|4>>
    <associate|footnr-1.6|<tuple|1.6|4>>
    <associate|footnr-1.7|<tuple|1.7|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Natural
      Language Processing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Representation of Words
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

      <with|par-left|<quote|1tab>|1.2.1<space|2spc>From Words to Sentences:
      Firth's Idea Continued <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.2.2<space|2spc>Human Languages Are
      Recursive (Maybe) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.2.3<space|2spc>Application: Machine
      Translation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      1.3<space|2spc>Language Modeling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      1.4<space|2spc>Drafts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      <with|par-left|<quote|1tab>|1.4.1<space|2spc><with|font-family|<quote|tt>|language|<quote|verbatim>|Word2vec>
      Is a Simple Model that Implements the Firth's Idea
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|1.4.2<space|2spc><with|font-family|<quote|tt>|language|<quote|verbatim>|Word2vec>
      in Practice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|1.4.3<space|2spc>Lost and Found
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      1.5<space|2spc>The Second Example: People in a Park
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>
    </associate>
  </collection>
</auxiliary>