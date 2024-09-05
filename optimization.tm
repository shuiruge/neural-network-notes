<TeXmacs|2.1>

<style|<tuple|book|python|literate>>

<\body>
  <chapter|Gradient Based Optimization>

  <section|The Objective Is the Expected Distance Between Prediction and
  Truth><label|section: loss function>

  As discussed in section <reference|section: Simulation Is a Kind of
  Data-Fitting>, the performance of simulation or, generally, data-fitting
  can be numerically characterized. Recall in that section, a dataset
  <math|D\<assign\><around*|{|<around*|(|x<rsub|i>,y<rsub|i>|)>\|i=1,\<ldots\>,N|}>>
  is given, as well as a parameterized function (called a model)
  <math|f<around*|(|x;\<theta\>|)>> with <math|x> the input and
  <math|\<theta\>> the collection of parameters. For each <math|x<rsub|i>> in
  the dataset, we have <math|<wide|y|^><rsub|i>\<assign\>f<around*|(|x<rsub|i>;\<theta\>|)>>
  which can be explained as the prediction of the model when its parameter is
  <math|\<theta\>>. If the model has good performance, we should expect that
  its prediction <math|<wide|y|^><rsub|i>> is very close to the truth or
  target <math|y<rsub|i>>. This can be characterized by a \Pdistance\Q
  <math|d<around*|(|\<cdummy\>,\<cdummy\>|)>> for which
  <math|d<around*|(|x,y|)>\<geqslant\>0> and <math|d<around*|(|x,y|)>=0> if
  and only if <math|x=y>. That is, <math|d<around*|(|y<rsub|i>,<wide|y|^><rsub|i>|)>>
  shall be small enough. This is the demand for one datum,
  <math|<around*|(|x<rsub|i>,y<rsub|i>|)>>. Since each datum is equally
  weighted (we suppose so), we shall characterize the total performance by
  <math|<big|sum><rsub|<around*|(|x<rsub|i>,y<rsub|i>|)>\<in\>D>d<around*|(|y<rsub|i>,f<around*|(|x<rsub|i>;\<theta\>|)>|)>>
  which should be small enough.

  But, when the size of dataset <math|D> is extremely large, computing
  <math|<big|sum><rsub|<around*|(|x<rsub|i>,y<rsub|i>|)>\<in\>D>d<around*|(|y<rsub|i>,f<around*|(|x<rsub|i>;\<theta\>|)>|)>>
  will become difficult. In practice, we sample sufficient many data from
  <math|D>, and compute the expectation of
  <math|d<around*|(|y,f<around*|(|x;\<theta\>|)>|)>> on these samples
  instead. These sampled data are called <with|font-series|bold|mini-batch>.
  (The whole dataset <math|D> is thus named by
  <with|font-series|bold|full-batch>.) Thus, a proper quantity that
  characterizes performance is

  <\equation>
    L<rsub|D><around*|(|\<theta\>|)>\<assign\>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|d<around*|(|y,f<around*|(|x;\<theta\>|)>|)>|]>,<label|equation:loss
    function>
  </equation>

  where <math|\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D>> represents the
  expectation with <math|<around*|(|x,y|)>> uniformly sampled from <math|D>.

  <math|L<rsub|D>> is called a <with|font-shape|italic|loss function>, since
  the best model parameter <math|\<theta\><rsub|\<star\>>> is that which
  minimizes the expected distance <math|L<rsub|D>>. Thus,<\footnote>
    This is not the whole story. In fact,
    <math|\<theta\><rsub|\<star\>>=argmin L<rsub|D>> is not what we want.
    Generally, the performance is examined not on the training dataset
    <math|D>, but on another similar dataset <math|T>, called test dataset.
    While the loss function <math|L<rsub|D><around*|(|\<theta\>|)>> decreases
    in the training process, the loss function on test dataset,
    <math|L<rsub|T><around*|(|\<theta\>|)>> may start to increase at some
    point <math|\<theta\><rsub|ES>> (ES for \Pearly-stopping\Q). That is,

    <\equation*>
      \<nabla\>L<rsub|D><around*|(|\<theta\><rsub|ES>|)>\<cdot\>\<nabla\>L<rsub|T><around*|(|\<theta\><rsub|ES>|)>=0.
    </equation*>

    We must stop training and use <math|\<theta\><rsub|ES>> as the best-fit
    parameters. In this book, we try to keep things simple. Thus, we omit
    this complicate thing, only thinking about decreasing the loss function
    <math|L<rsub|D>>.
  </footnote>

  <\equation*>
    \<theta\><rsub|\<star\>>=argmin L<rsub|D>.
  </equation*>

  The important thing is that, in the usual situation of neural network, the
  function <math|L<rsub|D>> is a smooth function of <math|\<theta\>>, and
  that <math|\<theta\>> is on a finite-dimensional Euclidean space. This
  means, we can use gradient descent method to find the minimum of
  <math|L<rsub|D>> without any constraint.

  <section|Moving Average Helps Avoid Stochastic Disturbance>

  <subsection|Stochastic Disturbance in Loss Function>

  Since the loss function is computed on mini-batch instead of the whole
  dataset <math|D>, there must be stochastic disturbance. Let <math|B> a
  random subset of <math|D>, a mini-batch. By central limit theorem, the mean
  value of <math|d<around*|(|y,f<around*|(|x;\<theta\>|)>|)>> over <math|B>
  approximately obeys a normal distribution. The expectation of this
  distribution is the mean value of <math|d<around*|(|y,f<around*|(|x;\<theta\>|)>|)>>
  over <math|D>, the loss function on full-batch. And the variance is
  proportional to <math|1/<around*|\||B|\|>>, where <math|<around*|\||B|\|>>
  denotes the number of elements in <math|B>. So, we can re-write the loss
  function <math|L<rsub|D>> as

  <\equation*>
    L<rsub|D><around*|(|\<theta\>|)>=<wide|L|^><rsub|D><around*|(|\<theta\>|)>+\<delta\>L<rsub|D><around*|(|\<theta\>|)>,
  </equation*>

  where <math|<wide|L|^><rsub|D>> represents the mean value over the
  full-batch <math|D>, and <math|\<delta\>L<rsub|D><around*|(|\<theta\>|)>>
  is the random disturbance, which approximately obeys a normal distribution
  with zero mean. For the same reason (central limit theorem), the gradient
  <math|\<nabla\>\<delta\>L<rsub|D><around*|(|\<theta\>|)>> also
  approximately obeys a normal distribution with zero mean and variance
  proportional to <math|1/<around*|\||B|\|>>.

  <subsection|Gradient Descent Method>

  For minimizing a function <math|h:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\>>,
  standard gradient descent method computes the gradient of <math|h>, and
  iterates along the gradient direction so as to decrease <math|h> at each
  iteration. Explicity, let <math|t=0,1,\<ldots\>> denotes the step of
  iteration, thus the variable at step <math|t+1> is given by

  <\equation>
    x<rsub|t+1>=x<rsub|t>-\<eta\> \<nabla\>h<around*|(|x<rsub|t>|)>,<label|equation:gradient
    descent method>
  </equation>

  where the step-size <math|\<eta\>> is fixed. As long as
  <math|0\<less\>\<eta\>\<ll\>1>, we have
  <math|h<around*|(|x<rsub|t+1>|)>\<leqslant\>h<around*|(|x<rsub|t>|)>>, thus
  always decreasing.

  Problems arise when applying gradient descent method directly to minimize
  <math|L<rsub|D>> because of the random disturbance
  <math|\<delta\>L<rsub|D>>. What we really want to minimize is the
  deterministic <math|<wide|L|^><rsub|D>>, the loss function on the
  full-batch, but what we can obtain is the <math|L<rsub|D>> instead of
  <math|<wide|L|^><rsub|D>>. We hope that, iterated by the gradient descent
  method <reference|equation:gradient descent method>, the trajectory
  <math|<around*|(|\<theta\><rsub|0>,\<theta\><rsub|1>,\<ldots\>|)>>
  generated by <math|\<nabla\>L<rsub|D>> (what we can compute) and the
  <math|<around*|(|<wide|\<theta\>|^><rsub|0>,<wide|\<theta\>|^><rsub|1>,\<ldots\>|)>>
  by <math|\<nabla\><wide|L|^><rsub|D>> (what we expect to compute but
  cannot) share the same limit <math|\<theta\><rsub|\<star\>>>, the real
  best-fit value. Only when <math|\<nabla\>L<rsub|D><around*|(|\<theta\>|)>>
  is sufficiently close to <math|\<nabla\><wide|L|^><rsub|D><around*|(|\<theta\>|)>>
  can this be done, which indicates that we have to reduce the randomness
  from <math|\<nabla\>\<delta\>L<rsub|D>>.

  <subsection|Moving Average of Gradient>

  An efficient method for reducing randomness is averaging. Let
  <math|<around*|{|X<rsub|i>\|i=1,\<ldots\>,n|}>> a set of i.i.d. random
  variables, each having variance <math|Var<around*|[|X|]>>. By central limit
  theorem, the variance of the averaged, <math|<around*|(|1/n|)>
  <big|sum><rsub|i>X<rsub|i>>, is decreased by a factor <math|1/n>, thus
  <math|Var<around*|[|X|]>/n>. The same, we cache the most recent <math|n>
  gradients <math|<around*|{|\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t-n+1>|)>,\<ldots\>,\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t>|)>|}>>
  while iterating the <math|\<theta\>> (in the same way as the
  <math|x<rsub|t>> in previous) at step <math|t>. Then, average over the
  cache to get the gradient used for iteration,
  <math|<around*|(|1/n|)><big|sum><rsub|i=t><rsup|t-n+1>\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|i>|)>>.
  In this way, the variance of randomness caused by
  <math|\<nabla\>\<delta\>L<rsub|D>> is decreased by a factor <math|1/n>. By
  adjusting the value of <math|n>, the randomenss can be limited
  sufficiently.

  This \Pbare\Q average calls for caching the most recent gradients. It is
  very memory intensive when the dimension of <math|\<theta\>> goes high. A
  smarter one is <with|font-series|bold|moving average>: given
  <math|\<gamma\>\<in\><around*|[|0,1|]>>, the moving average of
  <math|\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t>|)>>, denoted by
  <math|g<rsub|t>>, is computed by iteration

  <\equation*>
    g<rsub|t>=\<gamma\> g<rsub|t-1>+<around*|(|1-\<gamma\>|)>
    \<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t>|)>,
  </equation*>

  with initialization <math|g<rsub|0>=0>. The <math|\<gamma\>>, called
  <with|font-series|bold|decay factor> or <with|font-series|bold|forgetting
  factor>, determines how many old information of gradient,
  <math|g<rsub|t-1>>, is to be \Pforgotten\Q, and how many new information of
  gradient, <math|\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t>|)>>, is to
  be \Pmemorized\Q. The <math|g<rsub|t>> can be seen as a weighted average of
  <math|<around*|{|\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|0>|)>,\<ldots\>,\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t>|)>|}>>,
  where the recent gradients have greater weights and the remote have less.
  Then, we iterate the <math|\<theta\><rsub|t>> by <math|g<rsub|t>> instead
  of <math|\<nabla\>L<rsub|D><around*|(|\<theta\><rsub|t>|)>>, as

  <\equation*>
    \<theta\><rsub|t+1>=\<theta\><rsub|t>-\<eta\> g<rsub|t>.
  </equation*>

  <subsection|History and Remark>

  Moving average of gradient was first applied to gradient descent in
  1986.<\footnote>
    <with|font-shape|italic|Learning representations by back-propagating
    errors>, by David E. Rumelhart, Geoffrey E. Hinton, and Ronald J.
    Williams, 1986.
  </footnote> Later, the efficiency of moving average was explained as
  avoiding getting stucked by local minima. They compared moving average of
  gradient to the momentum in physics: the \Pheavy ball\Q rushes out of a
  local minimum with large \Pmomentum\Q. But, in a space with extremely high
  dimension, it is rare to encounter a local minimum, but saddle points
  instead. So, this explanation cannot be true. The underlying insight is
  that it is easy for the eigenvalues of random symmetric matrix (Hessian
  matrix can be seen as one) to be all positive when it is two dimensional,
  but being exponentially harder when the dimension increases. In fact, the
  eigenvalue of a random symmtric matrix obeys the <hlink|Wigner semicircle
  distribution|https://en.wikipedia.org/wiki/Wigner_semicircle_distribution>,
  when the dimension goes to infinity. This distribution is parity symmetric.

  <section|Different Learning-Rate for Different Layer (TODO)>

  For simplicity, consider a feed-forward neural network with a single hidden
  layer. The <math|M>-dimensional model output is

  <\equation*>
    y<rsup|\<alpha\>>\<assign\>f<rsup|\<alpha\>><around*|(|x;\<theta\>|)>=<big|sum><rsub|\<beta\>=1><rsup|H>U<rsup|\<alpha\>><rsub|\<beta\>>
    z<rsup|\<beta\>>+c<rsup|\<alpha\>>
  </equation*>

  with the <math|H>-dimensional output of hidden layer

  <\equation*>
    z<rsup|\<beta\>>\<assign\>\<sigma\><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|N>W<rsup|\<beta\>><rsub|\<gamma\>>
    x<rsup|\<gamma\>>+b<rsup|\<beta\>>|)>,
  </equation*>

  where <math|x\<in\>\<bbb-R\><rsup|N>> is model input,
  <math|\<theta\>\<assign\><around*|(|U,W,b,c|)>> is the collection of model
  parameters, and <math|\<sigma\>> is the activation function. Thus, we have
  gradient

  <\equation*>
    <frac|\<partial\>L<rsub|D>|\<partial\>U<rsup|\<alpha\>><rsub|\<beta\>>>=<frac|\<partial\>L<rsub|D>|\<partial\>y<rsup|\<alpha\>>><frac|\<partial\>y<rsup|\<alpha\>>|\<partial\>U<rsup|\<alpha\>><rsub|\<beta\>>>,
  </equation*>

  and

  <\equation*>
    <frac|\<partial\>L<rsub|D>|\<partial\>W<rsup|\<alpha\>><rsub|\<beta\>>>=<big|sum><rsub|\<gamma\>=1><rsup|M><frac|\<partial\>L<rsub|D>|\<partial\>y<rsup|\<gamma\>>><frac|\<partial\>y<rsup|\<gamma\>>|\<partial\>z<rsup|\<alpha\>>><frac|\<partial\>z<rsup|\<alpha\>>|\<partial\>W<rsup|\<alpha\>><rsub|\<beta\>>>.
  </equation*>

  \;

  Now, we try to estimate the relation of orders between
  <math|<around*|\<\|\|\>|\<partial\>L<rsub|D>/\<partial\>U|\<\|\|\>>> and
  <math|<around*|\<\|\|\>|\<partial\>L<rsub|D>/\<partial\>W|\<\|\|\>>>.
  Generally, the output of each layer is properly normalized, which is
  ensured by initialization and normalization (we will discuss normalization
  in section <reference|section: Normalization>). Thus,
  <math|\<partial\>y<rsup|\<alpha\>>/\<partial\>U<rsup|\<alpha\>><rsub|\<beta\>>=z<rsup|\<beta\>>>
  and <math|\<partial\>z<rsup|\<alpha\>>/\<partial\>W<rsup|\<alpha\>><rsub|\<beta\>>=\<sigma\><rprime|'><around*|(|<big|sum><rsub|\<gamma\>>W<rsup|\<alpha\>><rsub|\<gamma\>>
  x<rsup|\<gamma\>>+b<rsup|\<alpha\>>|)> x<rsup|\<beta\>>> share the same
  order which is <math|<with|font|cal|O><around*|(|1|)>>. (For example, when
  <math|\<sigma\>> represents ReLU activation function,
  <math|\<sigma\><rprime|'><around*|(|\<cdummy\>|)>\<in\><around*|{|0,1|}>>
  is roughly estimated as <math|1/2>, thus
  <math|\<partial\>z<rsup|\<alpha\>>/\<partial\>W<rsup|\<alpha\>><rsub|\<beta\>>=\<sigma\><rprime|'><around*|(|\<cdots\>|)>
  x<rsup|\<beta\>>=<with|font|cal|O><around*|(|1|)>>.) So, we have a rough
  estimation<math|>

  <\align>
    <tformat|<table|<row|<cell|<around*|\<\|\|\>|<frac|\<partial\>L<rsub|D>|\<partial\>U>|\<\|\|\>>\<sim\>>|<cell|<around*|\<\|\|\>|<frac|\<partial\>L<rsub|D>|\<partial\>y>|\<\|\|\>>;>>|<row|<cell|<around*|\<\|\|\>|<frac|\<partial\>L<rsub|D>|\<partial\>W>|\<\|\|\>>\<sim\>>|<cell|<sqrt|M>
    <around*|\<\|\|\>|<frac|\<partial\>L<rsub|D>|\<partial\>y>|\<\|\|\>>
    <around*|\<\|\|\>|<frac|\<partial\>y|\<partial\>z>|\<\|\|\>>>>|<row|<cell|=>|<cell|<sqrt|M>
    <around*|\<\|\|\>|<frac|\<partial\>L<rsub|D>|\<partial\>y>|\<\|\|\>>
    <around*|\<\|\|\>|U|\<\|\|\>>,>>>>
  </align>

  where, in the last line, we used the relation
  <math|\<partial\>y/\<partial\>z=U>. The <math|<sqrt|M>> factor is estimated
  by central limit theorem where we roughly regard
  <math|\<partial\>L<rsub|D>/\<partial\>W> and <math|U> as i.i.d. random
  variables. Generally, <math|U> is initialized with scale
  <math|<sqrt|6/<around*|(|M+H|)>>>.<\footnote>
    This is the Glorot initialization. We will not discuss the initialization
    techniques, but refer the reader to the paper by Xavier Glorot and Yoshua
    Bengio: <hlink|<with|font-shape|italic|Understanding the difficulty of
    training deep feedforward neural networks>|https://proceedings.mlr.press/v9/glorot10a.html>.
  </footnote> Thus, <math|<sqrt|M> <around*|\<\|\|\>|U|\<\|\|\>>\<sim\><sqrt|6
  M/<around*|(|M+H|)>>=<sqrt|6/<around*|(|1+H/M|)>>>. When <math|H\<gg\>M>,
  indicating that the hidden dimension is much larger than the output
  dimension, which is usually the situation we encounter, we have
  <math|<sqrt|M> <around*|\<\|\|\>|U|\<\|\|\>>\<ll\>1>, leading to
  <math|<around*|\<\|\|\>|\<partial\>L<rsub|D>/\<partial\>U|\<\|\|\>>\<gg\><around*|\<\|\|\>|\<partial\>L<rsub|D>/\<partial\>W|\<\|\|\>>>.

  <section|Using the Sign of Gradient (TODO)>

  The idea of using the sign of gradient is proposed by Martin Riedmiller and
  Heinrich Braun in 1992. In their <verbatim|Rprop> (short for resilient
  backpropagation) algorithm, TODO. But, <verbatim|Rprop> algorithm cannot
  deal with mini-batch which indicates stochastic gradient. TODO

  Later in 2012, James Martens and Ilya Sutskever generalized the
  <verbatim|Rprop> algorithm to stochastic gradient and made it much simpler.
  The new algorithm is called <verbatim|RMSprop>. As it is named, it employs
  root mean square (RMS for short) for computing the sign of gradient, which
  helps stabilize the stochastic gradient. TODO The <math|s<rsup|\<alpha\>>>
  decreases slowly when <math|<around*|\||g<rsup|\<alpha\>>|\|>> decreases,
  but increases quickly when <math|<around*|\||g<rsup|\<alpha\>>|\|>>
  increases.

  Finally, in 2014, by adding moving average to the gradient, RMSprop
  algorithm is further improved, now called Adam algorithm.

  <section|Draft>

  \;

  <math|v<rsub|0><rsup|\<alpha\>>,s<rsup|\<alpha\>><rsub|0>=0>;

  <math|v<rsup|\<alpha\>><rsub|t+1>=<around*|(|1-\<gamma\>|)>
  v<rsub|t>+\<gamma\> g<rsub|t+1>>;

  <math|s<rsup|\<alpha\>><rsub|t+1>=<around*|(|1-\<beta\>|)>
  s<rsup|\<alpha\>><rsub|t>+\<beta\> <around*|(|g<rsup|\<alpha\>><rsub|t+1>|)><rsup|2>>;

  <math|<wide|g|^><rsub|t+1><rsup|\<alpha\>>\<assign\>v<rsub|t+1><rsup|\<alpha\>>/<around*|(|<sqrt|s<rsub|t+1><rsup|\<alpha\>>>+\<epsilon\>|)>>.

  The underlying idea is using <math|sign<around*|(|g<rsup|\<alpha\>><rsub|t>|)>>
  instead of <math|g<rsup|\<alpha\>><rsub|t>> itself. But, if using
  <math|<around*|\||g|\|>> instead of <math|<sqrt|g<rsup|2>>> for computing
  the averaged sign of gradient component, that is
  <math|s<rsup|\<alpha\>><rsub|t+1>=<around*|(|1-\<beta\>|)>
  s<rsub|t><rsup|\<alpha\>>+\<beta\> <around*|\||g<rsub|t+1><rsup|\<alpha\>>|\|>>
  and <math|<wide|g|^><rsup|\<alpha\>><rsub|t+1>=v<rsup|\<alpha\>><rsub|t+1>/<around*|(|s<rsup|\<alpha\>><rsub|t+1>+\<epsilon\>|)>>,
  we cannot obtain the beautiful result any more.

  Exponential moving average: a constant signal will take approximately
  <math|3/\<gamma\>> stages to reach 95% of the actual value.

  <math|g<rsub|\<alpha\>><around*|(|\<theta\>|)>=<frac|\<partial\>f|\<partial\>\<theta\><rsup|\<alpha\>>><around*|(|\<theta\>|)>=g<rsub|\<alpha\>><around*|(|\<theta\><rsub|s>|)>+H<rsub|\<alpha\>\<beta\>><around*|(|\<theta\><rsub|s>|)><around*|(|\<theta\>-\<theta\><rsub|s>|)><rsup|\<beta\>>\<approx\>H<rsub|\<alpha\>\<beta\>><around*|(|\<theta\><rsub|s>|)><around*|(|\<theta\>-\<theta\><rsub|s>|)><rsup|\<beta\>>>.
  Thus, <math|<around*|(|H<rsup|-1>|)><rsup|\<alpha\>\<gamma\>>
  g<rsub|\<alpha\>><around*|(|\<theta\>|)>\<approx\><around*|(|\<theta\>-\<theta\><rsub|s>|)><rsup|\<gamma\>>>.

  If <math|H<rsup|2>> is approximatly diagonal when dimension is sufficiently
  large (since <math|<around*|(|H<rsup|2>|)><rsub|\<alpha\>\<beta\>>=<around*|(|H<rsup|t>
  H|)><rsub|\<alpha\>\<beta\>>=H<rsub|\<cdummy\>
  \<alpha\>>\<cdot\>H<rsub|\<cdummy\> \<beta\>>> which is inner product of
  two random vectors), then

  <\equation*>
    g<rsub|\<alpha\>>=
  </equation*>

  <section|Gradient Is Computed by Vector-Jacobian Product *><\footnote>
    You can skip this section if you are not care about how computer
    calculates derivative.
  </footnote>

  <subsection|From Feed-Forward Neural Network to General Composition>

  Recall in section <reference|section: With Hidden Layers, Model Can Fit Any
  Dataset>, we have shown that a feed-forward neural network is a composition
  of multiple perceptrons. For example, for a two-layer feed-forward neural
  network, we have

  <\equation*>
    z<rsup|\<alpha\>>=h<around*|(|<big|sum><rsub|\<beta\>=1><rsup|n>U<rsup|\<alpha\>><rsub|\<beta\>>
    x<rsup|\<beta\>>+c<rsup|\<alpha\>>|)>
  </equation*>

  and

  <\equation*>
    y<rsup|\<alpha\>>=g<around*|(|<big|sum><rsub|\<beta\>=1><rsup|m>W<rsup|\<alpha\>><rsub|\<beta\>>
    z<rsup|\<beta\>>+b<rsup|\<alpha\>>|)>.
  </equation*>

  If we use an <math|f> to denote the model, say
  <math|f<around*|(|x;\<theta\>|)>>, then <math|\<theta\>> represents for the
  collection <math|<around*|(|U,c,W,b|)>>, and

  <\equation*>
    f<around*|(|x;U,c,W,b|)>=g<around*|(|<big|sum><rsub|\<beta\>=1><rsup|m>W<rsup|\<alpha\>><rsub|\<beta\>>
    h<around*|(|<big|sum><rsub|\<beta\>=1><rsup|n>U<rsup|\<alpha\>><rsub|\<beta\>>
    x<rsup|\<beta\>>+c<rsup|\<alpha\>>|)>+b<rsup|\<alpha\>>|)>,
  </equation*>

  which is a composition of two parameterized functions. In fact, almost all
  existing neural networks, from computer vision to natural language process,
  are compositions of simple parameterized functions, like <math|f>. So, we
  shall consider general composition like

  <\equation*>
    f<rsub|\<theta\>>\<assign\>g<rsub|\<theta\><rsub|n>>\<circ\>\<cdots\>\<circ\>g<rsub|\<theta\><rsub|2>>\<circ\>g<rsub|\<theta\><rsub|1>>,
  </equation*>

  where, for simplicity, we have placed parameters onto the subscripts, thus
  <math|g<rsub|\<theta\>><around*|(|x|)>\<assign\>g<around*|(|x;\<theta\>|)>>
  and <math|f<rsub|\<theta\>><around*|(|x|)>\<assign\>f<around*|(|x;\<theta\><rsub|1>,\<ldots\>,\<theta\><rsub|n>|)>>.

  <subsection|Vector-Jacobian Product>

  Computer calculates the derivative such as
  <math|\<partial\>L<rsub|D>/\<partial\>\<theta\><rsub|i>> by
  <with|font-shape|italic|vector-Jacobian product> (VJP for short). For
  declare what vector-Jacobian-product is, let us consider a simple example.
  We are to define the vector-Jacobian product of sigmoid function, which is
  defined by <math|y<rsup|\<alpha\>>=1/<around*|(|1+exp<around*|(|-x<rsup|\<alpha\>>|)>|)>>.
  By chain-rule, we have

  <\equation*>
    <frac|\<partial\>y<rsup|\<alpha\>>|\<partial\>x<rsup|\<beta\>>>=y<rsup|\<alpha\>>
    <around*|(|1-y<rsup|\<alpha\>>|)> \<delta\><rsup|\<alpha\>><rsub|\<beta\>>
  </equation*>

  And for any vector <math|v<rsup|\<beta\>>>, we have

  <\equation*>
    <big|sum><rsub|\<beta\>>v<rsup|\<beta\>>
    <frac|\<partial\>y<rsup|\<alpha\>>|\<partial\>x<rsup|\<beta\>>>=v<rsup|\<alpha\>>
    y<rsup|\<alpha\>> <around*|(|1-y<rsup|\<alpha\>>|)>.
  </equation*>

  The vector-Jacobian product of sigmoid function has pseudo-code as

  <\code>
    def sigmoid_vjp(x: Vector):

    \ \ \ \ y: Vector = 1 / (1 + exp(-x))

    \ \ \ \ 

    \ \ \ \ def grad(dy: Vector) -\<gtr\> Vector:

    \ \ \ \ \ \ \ \ return dy * y * (1 - y)

    \ \ \ \ 

    \ \ \ \ return y, grad
  </code>

  It returns the output of sigmoid function, as well as a function
  <verbatim|grad>. It can be recognized that <verbatim|grad(dy)> encodes the
  <math|<big|sum><rsub|\<beta\>>v<rsup|\<beta\>>
  \<partial\>y<rsup|\<alpha\>>/\<partial\>x<rsup|\<beta\>>>, where <math|v>
  is represented by the <verbatim|dy>. So, a vector-Jacobian product of a
  function <math|f> returns two parts, one is the output value of the
  function <math|f<around*|(|x|)>>, the other is a function that computes
  <math|<big|sum><rsub|\<beta\>>v<rsup|\<beta\>>
  <around*|(|\<partial\>f<rsup|\<alpha\>>/\<partial\>x<rsup|\<beta\>>|)><around*|(|x|)>>.
  If <math|f> has multiple variables, then vector-Jacobian product shall
  return a function <math|<big|sum><rsub|\<beta\>>v<rsup|\<beta\>>
  <around*|(|\<partial\>f<rsup|\<alpha\>>/\<partial\>x<rsub|i><rsup|\<beta\>>|)><around*|(|x<rsub|1>,\<ldots\>,x<rsub|n>|)>>
  for each variable <math|x<rsub|i>>.

  Using matrix format is convenient. Thus re-write

  <\equation*>
    <big|sum><rsub|\<beta\>>v<rsup|\<beta\>>
    <frac|\<partial\>f<rsup|\<alpha\>>|\<partial\>x<rsup|\<beta\>>><around*|(|x|)>\<rightarrow\>v\<cdummy\><frac|\<partial\>f|\<partial\>x><around*|(|x|)>.
  </equation*>

  <subsection|Forward Propagation>

  Recall that <math|f<rsub|\<theta\>>\<assign\>g<rsub|\<theta\><rsub|n>>\<circ\>\<cdots\>\<circ\>g<rsub|\<theta\><rsub|2>>\<circ\>g<rsub|\<theta\><rsub|1>>>.
  Thus, for computing the value of <math|f<rsub|\<theta\>><around*|(|x|)>>
  for a datum <math|<around*|(|x,y|)>\<in\>D>, we shall first compute
  <math|g<rsub|\<theta\><rsub|1>><around*|(|x|)>>. But, if we have defined
  the vector-Jacobian product of <math|g<rsub|\<theta\><rsub|1>>>, we will
  get <math|z<rsub|1>\<assign\>g<rsub|\<theta\><rsub|1>><around*|(|x|)>>, as
  well as functions <math|\<mathd\>g<rsub|\<theta\><rsub|1>><around*|(|v|)>\<assign\>v\<cdummy\><around*|(|\<partial\>z<rsub|1>/\<partial\>x|)>>
  and <math|\<mathd\><rprime|'>g<rsub|\<theta\><rsub|1>><around*|(|w|)>\<assign\>w\<cdummy\><around*|(|\<partial\>z<rsub|1>/\<partial\>\<theta\><rsub|1>|)>>.
  The same for <math|g<rsub|\<theta\><rsub|i>>>, we get
  <math|z<rsub|i>\<assign\>g<rsub|\<theta\><rsub|i>><around*|(|z<rsub|i-1>|)>>
  as well as <math|\<mathd\>g<rsub|\<theta\><rsub|i>><around*|(|v|)>\<assign\>v\<cdummy\><around*|(|\<partial\>z<rsub|i>/\<partial\>z<rsub|i-1>|)>>
  and <math|\<mathd\><rprime|'>g<rsub|\<theta\><rsub|i>><around*|(|w|)>\<assign\>w\<cdummy\><around*|(|\<partial\>z<rsub|i>/\<partial\>\<theta\><rsub|i>|)>>.
  And the model prediction <math|<wide|y|^>\<assign\>g<rsub|\<theta\><rsub|n>><around*|(|z<rsub|n-1>|)>>
  as well as <math|\<mathd\>g<rsub|\<theta\><rsub|n>><around*|(|v|)>\<assign\>v\<cdummy\><around*|(|\<partial\><wide|y|^>/\<partial\>z<rsub|n-1>|)>>
  and <math|\<mathd\><rprime|'>g<rsub|\<theta\><rsub|n>><around*|(|w|)>\<assign\>w\<cdummy\><around*|(|\<partial\><wide|y|^>/\<partial\>\<theta\><rsub|n>|)>>.
  Finally, if we have also defined the vector-Jacobian product of the
  distance <math|d>, then we will get <math|l=d<around*|(|<wide|y|^>,y|)>>
  where <math|y> is the truth, as well as
  <math|\<mathd\>l<around*|(|v|)>\<assign\>v\<cdummy\><around*|(|\<partial\>l/\<partial\><wide|y|^>|)>>
  and <math|\<mathd\><rprime|'>l<around*|(|v|)>\<assign\>v\<cdummy\><around*|(|\<partial\>l/\<partial\>y|)>>.
  The <math|l> is the loss for this datum <math|<around*|(|x,y|)>>. This
  process, computing vector-Jacobian products from input to output, is called
  <with|font-shape|italic|forward propagation>.

  These values and functions are then cached, waiting for the next process,
  called backward propagation.

  <subsection|Backward Propagation>

  Backward propagation is for computing the derivatives
  <math|\<partial\>l/\<partial\>\<theta\><rsub|n-i><rsup|\<alpha\>>> for each
  <math|i=0,\<ldots\>,n-1>. By chain-rule

  <\equation*>
    <frac|\<partial\>l|\<partial\>\<theta\><rsub|i><rsup|\<alpha\>>>=<big|sum><rsub|\<beta\>><frac|\<partial\>l|\<partial\><wide|y|^><rsup|\<beta\>>>
    <big|sum><rsub|\<gamma\>><frac|\<partial\><wide|y|^><rsup|\<beta\>>|\<partial\>z<rsub|n-1><rsup|\<delta\>>>
    <big|sum><rsub|\<delta\>><frac|\<partial\>z<rsub|n-1><rsup|\<gamma\>>|\<partial\>z<rsub|n-2><rsup|\<delta\>>>
    \<cdots\> <big|sum><rsub|\<varphi\>><frac|\<partial\>z<rsub|n-i+1><rsup|\<varepsilon\>>|\<partial\>z<rsub|n-i><rsup|\<varphi\>>>
    <frac|\<partial\>z<rsub|n-i><rsup|\<varphi\>>|\<partial\>\<theta\><rsub|n-i><rsup|\<alpha\>>>,
  </equation*>

  or in matrix format

  <\equation*>
    <frac|\<partial\>l|\<partial\>\<theta\><rsub|i>>=<frac|\<partial\>l|\<partial\><wide|y|^>>\<cdot\><frac|\<partial\><wide|y|^>|\<partial\>z<rsub|n-1>>\<cdot\><frac|\<partial\>z<rsub|n-1>|\<partial\>z<rsub|n-2>>\<cdot\>\<cdots\>\<cdot\><frac|\<partial\>z<rsub|n-i+1>|\<partial\>z<rsub|n-i>>\<cdummy\><frac|\<partial\>z<rsub|n-i>|\<partial\>\<theta\><rsub|n-i>>,
  </equation*>

  where, on the right hand side, the first term is a vector, while the others
  are all Jacobian matrices.

  We recognize that this is a chain of vector-Jacobian products. First, the
  first two terms, <math|<around*|(|\<partial\>l/\<partial\><wide|y|^>|)>\<cdot\><around*|(|\<partial\><wide|y|^>/\<partial\>z<rsub|n-1>|)>>,
  are in fact the <math|\<epsilon\><rsub|n>\<assign\>\<mathd\>g<rsub|\<theta\><rsub|n>><around*|(|\<partial\>l/\<partial\><wide|y|^>|)>>,
  which is a vector. Thus, the first three terms are
  <math|\<epsilon\><rsub|n-1>\<assign\>\<mathd\>g<rsub|\<theta\><rsub|n-1>><around*|(|\<epsilon\><rsub|n>|)>>,
  which is another vector. Repeating this process, we find that

  <\align>
    <tformat|<table|<row|<cell|\<epsilon\><rsub|n>\<assign\>>|<cell|\<mathd\>g<rsub|\<theta\><rsub|n>><around*|(|\<partial\>l/\<partial\><wide|y|^>|)>;>>|<row|<cell|\<epsilon\><rsub|n-1>\<assign\>>|<cell|\<mathd\>g<rsub|\<theta\><rsub|n-1>><around*|(|\<epsilon\><rsub|n>|)>;>>|<row|<cell|\<epsilon\><rsub|n-2>\<assign\>>|<cell|\<mathd\>g<rsub|\<theta\><rsub|n-2>><around*|(|\<epsilon\><rsub|n-1>|)>;>>|<row|<cell|\<ldots\>>|<cell|\<ldots\>>>|<row|<cell|\<epsilon\><rsub|n-i+1>\<assign\>>|<cell|\<mathd\>g<rsub|\<theta\><rsub|n-i+1>><around*|(|\<epsilon\><rsub|n-i+2>|)>;>>|<row|<cell|<frac|\<partial\>l|\<partial\>\<theta\><rsub|n-i>>=>|<cell|\<mathd\><rprime|'>g<rsub|n-i><around*|(|\<epsilon\><rsub|n-i-1>|)>.>>>>
  </align>

  So, by computing the value of the function obtained from vector-Jacobian
  product along the backward direction, from output toward input, we get the
  <math|\<partial\>l/\<partial\>\<theta\><rsub|n-i>>. This is called
  <with|font-shape|italic|backward propagation>. Notice that the
  <math|\<epsilon\><rsub|i>> is in fact the derivative
  <math|\<partial\>l/\<partial\>z<rsub|i-1>>.

  After backward propagation, the cached values and functions can be freed.

  As a summary, the whole process is: first computing and caching
  vector-Jacobian products forwardly, and then applying the functions given
  by vector-Jacobian products to derivatives backwardly.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.5|4>>
    <associate|auto-11|<tuple|1.6|4>>
    <associate|auto-12|<tuple|1.6.1|?>>
    <associate|auto-13|<tuple|1.6.2|?>>
    <associate|auto-14|<tuple|1.6.3|?>>
    <associate|auto-15|<tuple|1.6.4|?>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.2.1|2>>
    <associate|auto-5|<tuple|1.2.2|2>>
    <associate|auto-6|<tuple|1.2.3|3>>
    <associate|auto-7|<tuple|1.2.4|3>>
    <associate|auto-8|<tuple|1.3|3>>
    <associate|auto-9|<tuple|1.4|3>>
    <associate|equation:gradient descent method|<tuple|1.2|?>>
    <associate|equation:loss function|<tuple|1.1|1>>
    <associate|footnote-1|<tuple|1|?>>
    <associate|footnote-1.1|<tuple|1.1|2>>
    <associate|footnote-1.2|<tuple|1.2|3>>
    <associate|footnote-1.3|<tuple|1.3|?>>
    <associate|footnote-1.4|<tuple|1.4|?>>
    <associate|footnote-1.5|<tuple|1.5|?>>
    <associate|footnote-2|<tuple|2|?>>
    <associate|footnr-0|<tuple|1.1|?>>
    <associate|footnr-1|<tuple|1|?>>
    <associate|footnr-1.1|<tuple|1.1|2>>
    <associate|footnr-1.2|<tuple|1.2|3>>
    <associate|footnr-1.3|<tuple|1.3|?>>
    <associate|footnr-1.4|<tuple|1.4|?>>
    <associate|footnr-1.5|<tuple|1.5|?>>
    <associate|footnr-2|<tuple|2|?>>
    <associate|section: loss function|<tuple|1.1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gradient
      Based Optimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>The Objective Is the Expected Distance Between
      Prediction and Truth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.2<space|2spc>Different Learning-Rate for Different Layer
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      1.3<space|2spc>Validation Helps Avoid the Instability of Optimization
      (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      1.4<space|2spc>Moment Helps Avoid Stochastic Disturbance (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      1.5<space|2spc>A Little History about Optimizer (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      1.6<space|2spc>Gradient Is Computed by Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      <with|par-left|<quote|1tab>|1.6.1<space|2spc>From Feed-Forward Neural
      Network to General Composition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.6.2<space|2spc>Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.6.3<space|2spc>Forward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|1.6.4<space|2spc>Backward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>
    </associate>
  </collection>
</auxiliary>