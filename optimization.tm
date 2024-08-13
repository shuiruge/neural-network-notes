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
  target <math|y<rsub|i>>. This can be characterized by a
  <hlink|distance|https://en.wikipedia.org/wiki/Metric_space#Definition>
  <math|d<around*|(|\<cdummy\>,\<cdummy\>|)>>. That is,
  <math|d<around*|(|<wide|y|^><rsub|i>,y<rsub|i>|)>> shall be small enough.
  This is the demand for one datum, <math|<around*|(|x<rsub|i>,y<rsub|i>|)>>.
  Since each datum is equally weighted (we suppose so), we shall characterize
  the total performance by <math|<big|sum><rsub|<around*|(|x<rsub|i>,y<rsub|i>|)>\<in\>D>d<around*|(|f<around*|(|x<rsub|i>;\<theta\>|)>,y<rsub|i>|)>>
  which should be small enough.

  But, when the size of dataset <math|D> is extremely large, computing
  <math|<big|sum><rsub|<around*|(|x<rsub|i>,y<rsub|i>|)>\<in\>D>d<around*|(|f<around*|(|x<rsub|i>;\<theta\>|)>,y<rsub|i>|)>>
  will become difficult. In practice, we sample sufficient many data from
  <math|D>, and compute the expectation of
  <math|d<around*|(|f<around*|(|x;\<theta\>|)>,y|)>> on these samples
  instead. Thus, a proper quantity that characterizes performance is

  <\equation>
    L<rsub|D><around*|(|\<theta\>|)>\<assign\>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|d<around*|(|f<around*|(|x;\<theta\>|)>,y|)>|]>,<label|equation:loss
    function>
  </equation>

  where <math|\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D>> represents the
  expectation with <math|<around*|(|x,y|)>> uniformly sampled from <math|D>.

  <math|L<rsub|D>> is called a <with|font-shape|italic|loss function>, since
  the best model parameter <math|\<theta\><rsub|\<star\>>> is that which
  minimizes the expected distance <math|L<rsub|D>>. Thus

  <\equation*>
    \<theta\><rsub|\<star\>>=argmin L<rsub|D><around*|(|\<theta\>|)>.
  </equation*>

  The important thing is that, in the usual situation of neural network, the
  function <math|L<rsub|D>> is a smooth function of <math|\<theta\>>, and
  that <math|\<theta\>> is on a finite-dimensional Euclidean space. This
  means, we can use gradient based methods to find the minimum of
  <math|L<rsub|D>> without any constraint.

  <section|Going Along Gradient Direction May Not Be Optimal (TODO)>

  <\big-figure|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|10|10|center>|gr-grid|<tuple|cartesian|<point|0|0>|1>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-point-style|star|gr-color|dark
  green|gr-point-size|5ln|gr-dash-style|11100|gr-auto-crop|true|<graphics||<with|magnify|0.85|color|<pattern|/nix/store/wg1k8l9fryi4aas6qsmn63m7pivi5ny2-texmacs-2.1.2/share/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|dash-style|1111010|<cspline|<point|5.1|-0.45>|<point|-5.1|-0.45>|<point|0.0|0.4>>>|<with|magnify|1.1726234593406|color|<pattern|/nix/store/wg1k8l9fryi4aas6qsmn63m7pivi5ny2-texmacs-2.1.2/share/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|dash-style|1111010|<cspline|<point|7.03574075604366|-0.557541153113536>|<point|-7.03574075604366|-0.557541153113536>|<point|0.0|0.615082306227072>>>|<with|magnify|0.258543620749278|color|<pattern|/nix/store/wg1k8l9fryi4aas6qsmn63m7pivi5ny2-texmacs-2.1.2/share/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|dash-style|1111010|line-width|2ln|<cspline|<point|1.55126172449567|-0.252847873583093>|<point|-1.55126172449567|-0.252847873583093>|<point|0.0|0.00569574716618582>>>|<with|magnify|0.509594336979169|color|<pattern|/nix/store/wg1k8l9fryi4aas6qsmn63m7pivi5ny2-texmacs-2.1.2/share/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|dash-style|1111010|line-width|2ln|<cspline|<point|3.05756602187502|-0.336531445659723>|<point|-3.05756602187502|-0.336531445659723>|<point|0.0|0.173062891319446>>>|<with|color|red|point-size|5ln|fill-color|red|point-style|star|<point|0|-0.2>>|<with|color|dark
  green|arrow-end|\|\<gtr\>|dash-style|11100|<line|<point|-6|-0.7>|<point|-6.0|2.0>>>|<with|color|dark
  green|arrow-end|\|\<gtr\>|line-width|2ln|<line|<point|-6|-0.7>|<point|-5.6|2.0>>>|<with|color|dark
  green|arrow-end|\|\<gtr\>|dash-style|11100|<line|<point|-6|-0.7>|<point|-5.6|-0.673234555704961>>>|<with|color|dark
  green|point-size|5ln|fill-color|dark green|point-style|star|<point|-6|-0.7>>|<with|color|dark
  green|dash-style|11100|<line|<point|-6|2>|<point|-5.6|2.0>>>|<with|color|dark
  green|dash-style|11100|<line|<point|-5.6|-0.689409>|<point|-5.6|2.0>>>>>>
    <label|figure: gradient direction is not optimal>The black dash curves
    represents the contour map of a function
    <math|f:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-R\>>. The red star is the
    top or <math|argmin f>. The green star is where you are. The green lines
    represent the negative direction of gradient based on the contour map and
    its decomposition along horizontal and vertical directions.
  </big-figure>

  The critical problem of gradient based optimization is how to reach the
  optimum with the minimum number of iteration steps. But, going along the
  negative direction of the gradient of loss function may not be optimal.
  Figure <reference|figure: gradient direction is not optimal> shows a
  typical example where the negative direction of gradient (the solid green
  arrow) does not point to the optimum (the red star), but a direction which
  is almost irrelevant to the optimum.

  To deal with this situation, we have to increase the horizontal component
  of the green vector, and decrease the vertical one.

  \;

  <math|<around*|(|g<rsub|t-n>,g<rsub|t-n+1>,\<ldots\>,g<rsub|t>|)>>.
  <math|s<rsup|\<alpha\>><rsub|t>\<assign\><around*|(|g<rsup|\<alpha\>><rsub|t-n>|)><rsup|2>+\<cdots\>+<around*|(|g<rsub|t><rsup|\<alpha\>>|)><rsup|2>>.
  <math|<wide|g|^><rsup|\<alpha\>>\<assign\>g<rsup|\<alpha\>>/<sqrt|s<rsup|\<alpha\>>+\<epsilon\>>>.

  <math|s<rsup|\<alpha\>><rsub|t+1>\<rightarrow\><around*|(|1-\<gamma\>|)>
  s<rsup|\<alpha\>><rsub|t>+\<gamma\> <around*|(|g<rsup|\<alpha\>><rsub|t+1>|)><rsup|2>>.

  <section|Validation Helps Avoid the Instability of Optimization (TODO)>

  <section|Moment Helps Avoid Stochastic Disturbance (TODO)>

  <math|<wide|g|^><rsup|\<alpha\>><rsub|t+1>=<around*|(|1-\<gamma\>|)>
  <wide|g|^><rsub|t>+\<gamma\> g<rsub|t+1>>.

  <math|v<rsup|\<alpha\>><rsub|t+1>=<around*|(|1-\<gamma\><rsub|1>|)>
  v<rsup|\<alpha\>><rsub|t>+\<gamma\> g<rsub|t+1>>.

  <math|s<rsup|\<alpha\>><rsub|t+1>\<rightarrow\><around*|(|1-\<gamma\>|)>
  s<rsup|\<alpha\>><rsub|t>+\<gamma\> <around*|(|g<rsup|\<alpha\>><rsub|t+1>|)><rsup|2>>

  <math|<wide|g|^><rsub|t+1><rsup|\<alpha\>>\<assign\>v<rsub|t+1><rsup|\<alpha\>>/<sqrt|s<rsub|t+1><rsup|\<alpha\>>+\<epsilon\>>>

  <section|A Little History about Optimizer (TODO)>

  <section|Gradient Is Computed by Vector-Jacobian Product><\footnote>
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
    <associate|auto-10|<tuple|1.6.2|3>>
    <associate|auto-11|<tuple|1.6.3|3>>
    <associate|auto-12|<tuple|1.6.4|3>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.1|1>>
    <associate|auto-5|<tuple|1.3|2>>
    <associate|auto-6|<tuple|1.4|2>>
    <associate|auto-7|<tuple|1.5|2>>
    <associate|auto-8|<tuple|1.6|2>>
    <associate|auto-9|<tuple|1.6.1|2>>
    <associate|equation:loss function|<tuple|1.1|1>>
    <associate|figure: gradient direction is not optimal|<tuple|1.1|1>>
    <associate|footnote-1.1|<tuple|1.1|2>>
    <associate|footnr-1.1|<tuple|1.1|2>>
    <associate|section: loss function|<tuple|1.1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.1>|>
        The black dash curves represents the contour map of a function
        <with|mode|<quote|math>|f:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-R\>>.
        The red star is the top or <with|mode|<quote|math>|argmin f>. The
        green star is where you are. The green lines represent the negative
        direction of gradient based on the contour map and its decomposition
        along horizontal and vertical directions.
      </surround>|<pageref|auto-4>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Gradient
      Based Optimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>The Objective Is the Expected Distance Between
      Prediction and Truth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.2<space|2spc>Going Along Gradient Direction May Not Be Optimal (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      1.3<space|2spc>Validation Helps Avoid the Instability of Optimization
      (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      1.4<space|2spc>Moment Helps Avoid Stochastic Disturbance (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      1.5<space|2spc>A Little History about Optimizer (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      1.6<space|2spc>Gradient Is Computed by Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <with|par-left|<quote|1tab>|1.6.1<space|2spc>From Feed-Forward Neural
      Network to General Composition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.6.2<space|2spc>Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|1.6.3<space|2spc>Forward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|1.6.4<space|2spc>Backward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>
    </associate>
  </collection>
</auxiliary>