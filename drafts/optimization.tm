<TeXmacs|2.1.4>

<style|book>

<\body>
  <section|A Better Optimizer Avoids Worse Directions>

  Given a loss function <math|f:\<bbb-R\><rsup|d>\<rightarrow\>\<bbb-R\>>,
  optimization problem is searching for its minimum
  <math|x<rsub|1>\<in\>\<bbb-R\><rsup|d>> starting from an initial value
  <math|x<rsub|0>\<in\>\<bbb-R\><rsup|d>>. The minimum should be global (the
  unique value on which <math|f> gains its smallest value). But in practice,
  we cannot reach the global minimum, and a local minimum is valid if it has
  been sufficiently small. So, let the <math|x<rsub|1>> be either the global
  minimum or a local minimum that is good enough.

  The optimization process is finding a path from the initial value
  <math|x<rsub|0>> to the target minimum <math|x<rsub|1>> such that the
  length of the path is as short as possible. In practice, the path is
  constructed iteratively, starting from <math|x<rsub|0>>, we determine the
  direction to walk a step, and the size of the step. At each step, the loss
  function is guaranteed to decreasing.

  There are two aspects to be determined in each iterative step, namely the
  direction and the size. It makes our problem complicated. To simplify, we
  consider the path as continuous, namely as a function
  <math|\<gamma\>:<around*|[|0,1|]>\<rightarrow\>\<bbb-R\><rsup|d>> such that
  <math|\<gamma\><around*|(|0|)>=x<rsub|0>> and
  <math|\<gamma\><around*|(|1|)>=x<rsub|1>>. Now, we are to show that its
  direction

  <\equation*>
    n<around*|(|t|)>\<assign\><frac|<wide|\<gamma\>|\<dot\>><around*|(|t|)>|<around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>><around*|(|t|)>|\<\|\|\>><rsub|2>>
  </equation*>

  has been sufficient for describing the optimization process. During an
  infinitesimal period <math|\<mathd\>t>, the length of the segment on
  <math|\<gamma\>> is given by

  <\equation*>
    \<mathd\>l=<sqrt|<big|sum><rsub|\<alpha\>>\<mathd\>\<gamma\><rsup|\<alpha\>><around*|(|t|)><rsup|2>>=\<mathd\>t
    <sqrt|<big|sum><rsub|\<alpha\>><wide|\<gamma\>|\<dot\>><rsup|\<alpha\>><around*|(|t|)><rsup|2>>=\<mathd\>t
    <around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>><around*|(|t|)>|\<\|\|\>><rsub|2>.
  </equation*>

  Since <math|<around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>><around*|(|t|)>|\<\|\|\>><rsub|2>\<geqslant\>0>,
  <math|l> increases monotonically with <math|t>, as

  <\equation*>
    l<around*|(|t|)>\<assign\><big|int><rsub|0><rsup|t>\<mathd\>t<rprime|'>
    <around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>><around*|(|t<rprime|'>|)>|\<\|\|\>><rsub|2>.
  </equation*>

  It indicates that we can use <math|l> as the parameter for <math|n> instead
  of <math|t>, thus <math|n<around*|(|l|)>
  \<mathd\>l=<wide|\<gamma\>|\<dot\>><around*|(|t|)> \<mathd\>t> (from now
  on, we omit the <math|t>-dependence in <math|l<around*|(|t|)>> without
  declaration). Then, we have

  <\equation*>
    x<rsub|1>-x<rsub|0>=<big|int><rsub|0><rsup|1>\<mathd\>t
    <wide|\<gamma\>|\<dot\>><around*|(|t|)>=<big|int><rsub|0><rsup|\<lambda\><around*|(|n|)>>\<mathd\>l
    n<around*|(|l|)>.
  </equation*>

  Intuitively, it indicates that we walk along the direction
  <math|n<around*|(|l|)>> with an infinitesimal step size <math|\<mathd\>l>,
  until we arrive at <math|x<rsub|1>>, at which
  <math|l=\<lambda\><around*|(|n|)>>. The total number of steps is what we
  have cost, which is proportional to <math|\<lambda\><around*|(|n|)>>. In
  addition, at each (infinitesimal) step, we have to ensure that the loss
  function is descending. That is, we have to make

  <\equation*>
    <frac|\<mathd\>|\<mathd\>t>f<around*|(|\<gamma\><around*|(|t|)>|)>=<big|sum><rsub|\<alpha\>=1><rsup|d>\<partial\><rsub|\<alpha\>>f<around*|(|\<gamma\><around*|(|t|)>|)><wide|\<gamma\>|\<dot\>><rsup|\<alpha\>><around*|(|t|)>=<around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>><around*|(|t|)>|\<\|\|\>><rsub|2><big|sum><rsub|\<alpha\>=1><rsup|d>\<partial\><rsub|\<alpha\>>f<around*|(|\<gamma\><around*|(|t|)>|)>
    n<rsup|\<alpha\>><around*|(|l<around*|(|t|)>|)>\<less\>0
  </equation*>

  for any <math|t\<in\><around*|[|0,1|)>>. The set of all directions that
  satisfy this condition, however, is too large. We restrict ourselves to its
  subset where <math|n<rsup|\<alpha\>><around*|(|l<around*|(|t|)>|)>> has the
  same sign as <math|-\<partial\><rsub|\<alpha\>>f<around*|(|\<gamma\><around*|(|t|)>|)>>
  for any <math|\<alpha\>\<in\><around*|{|1,\<ldots\>,d|}>> and any
  <math|t\<in\><around*|[|0,1|)>>. This is the situation of many modern
  optimization algorithms, including those employed for optimizing deep
  neural networks. We denote this subset by <math|D<rsub|-g>>. So, the
  optimization problem is seeking for the direction <math|n> in
  <math|D<rsub|-g>> such that <math|\<lambda\><around*|(|n|)>> is minimal.
  Explicitly, the optimal direction <math|n<rsub|\<star\>>> is given by

  <\equation*>
    n<rsub|\<star\>>=argmin<rsub|n\<in\>D<rsub|-g>>\<lambda\><around*|(|n|)>.
  </equation*>

  Interestingly, the optimal direction <math|n<rsub|\<star\>>> is <em|not>
  consistent with the direction of negative loss gradient, denoted by
  <math|n<rsub|-g>>. As an example, consider
  <math|f<around*|(|x,y|)>\<assign\>x<rsup|2>+100y<rsup|2>> on
  <math|\<bbb-R\><rsup|2>>. The <math|n<rsub|\<star\>>> directs to the
  origin, while <math|n<rsub|-g>> generally does not.

  Now, sitting at <math|x<rsub|0>>, we are to determine a direction to walk
  an infinitesimal step. It is like hiking in mountains in a foggy day. The
  view field is restricted to the area near the body, and any distant scene
  is hidden in the mist. The same for our task, all we can know about the
  loss function is local around <math|x<rsub|0>>. It implies that we have no
  prior about the optimal direction <math|n<rsub|\<star\>><around*|(|0|)>>
  except for the restriction that <math|n<rsub|\<star\>><around*|(|0|)>> has
  the same sign as <math|n<rsub|-g><around*|(|0|)>>. It further indicates
  that, based on the Bayesian principle, all directions that have the same
  sign as <math|n<rsub|-g><around*|(|0|)>> are equally possible to be the
  optimal one.

  However, sitting at <math|x<rsub|0>>, we have no prior knowledge about the
  optimal direction <math|n<rsub|\<star\>><around*|(|0|)>> except that
  <math|n<rsub|\<star\>><around*|(|0|)>> has the same sign as
  <math|n<rsub|-g><around*|(|0|)>>, which can be evaluated by computing the
  gradient of loss function at <math|x<rsub|0>>.\ 

  \;

  The issue is that, only <math|n<rsub|g><around*|(|0|)>> can be obtained
  from <math|f>, as <math|-\<partial\>f<around*|(|x<rsub|0>|)>/<around*|\<\|\|\>|\<partial\>f<around*|(|x<rsub|0>|)>|\<\|\|\>><rsub|2>>.
  The optimial direction <math|n<rsub|\<star\>><around*|(|0|)>> is unknown.
  In addition,\ 

  While optimizing a deep neural network, for which the dimension <math|n> is
  tremendous, we can get no more information than the first order gradient of
  loss, such as the Hessian matrix. We consider the distribution of the inner
  product <math|<around*|\<langle\>|n<rsub|g><around*|(|t|)>,n<rsub|\<star\>><around*|(|t|)>|\<rangle\>>>.
  The prior\ 

  <section|Bifurcation during Optimization in High Dimension>

  Imagine that you are walking down a mountain. There is a situation that you
  walk along a ridge. A small perturbation will drop you down from either
  side of the ridge. Finally, you will arrive at the valley on one side
  because of a small perturbation on the ridge (such as a random flatus).
  This is how bifurcation happens. Precisely, given a loss function
  <math|f:\<bbb-R\><rsup|d>\<rightarrow\>\<bbb-R\>>, a <strong|bifurcation>
  happens at <math|x> if there exists a direction <math|v> (lateral direction
  of the ridge) such that <math|v<rsup|\<alpha\>>\<partial\><rsub|\<alpha\>>f<around*|(|x|)>=0>
  and <math|v<rsup|\<alpha\>>v<rsup|\<beta\>>\<partial\><rsub|\<alpha\>>\<partial\><rsub|\<beta\>>f<around*|(|x|)>\<less\>0>
  (so it is a ridge instead of a gorge).

  The conditions of bifurcation is not easy to be satisfied when <math|d> is
  small. But, as <math|d> tends to be large, bifurcation will appear
  frequently, since it is easy to find a component
  <math|\<partial\><rsub|\<alpha\>>f<around*|(|x|)>\<approx\>0>, at the same
  time <math|\<partial\><rsup|2><rsub|\<alpha\>>f<around*|(|x|)>> could be
  negative (randomly, it has about 50% possibility to be negative).
</body>

<\initial>
  <\collection>
    <associate|bg-color|#c7edcc>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>