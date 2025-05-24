<TeXmacs|2.1.4>

<style|book>

<\body>
  Given a loss function <math|f:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\>>,
  optimization problem is searching for its minimum
  <math|x<rsub|1>\<in\>\<bbb-R\><rsup|n>> starting from an initial value
  <math|x<rsub|0>\<in\>\<bbb-R\><rsup|n>>. The minimum should be global (the
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
  direction and the size. This makes the discussion complicated. To simplify
  the problem, we consider the path as continuous, namely as a function
  <math|\<gamma\>:<around*|[|0,1|]>\<rightarrow\>\<bbb-R\><rsup|n>> such that
  <math|\<gamma\><around*|(|0|)>=x<rsub|0>> and
  <math|\<gamma\><around*|(|1|)>=x<rsub|1>>. Now, the problem is simplified
  by 50% because only the direction (namely
  <math|<wide|\<gamma\>|\<dot\>><around*|(|t|)>>) is to be determined. The
  original iterative process is the Euler iteration that approximates this
  continuous path. In addition, along the path, the loss function shall keep
  decreasing before arriving at the minimum <math|x<rsub|1>>, hence

  <\equation*>
    <frac|\<mathd\>|\<mathd\>t>f<around*|(|\<gamma\><around*|(|t|)>|)>=\<partial\><rsub|\<alpha\>>f<around*|(|\<gamma\><around*|(|t|)>|)><wide|\<gamma\>|\<dot\>><rsup|\<alpha\>><around*|(|t|)>\<less\>0
  </equation*>

  for any <math|t\<in\><around*|[|0,1|)>>.

  We denote the set of all such descending paths from <math|x<rsub|0>> to
  <math|x<rsub|1>> as <math|\<cal-D\><around*|(|x<rsub|0>,x<rsub|1>|)>>.
  Then, among these descending paths, the optimal path is the one that has
  the minimal length. The length of a path on an Eulidean space is defined by

  <\equation*>
    l<around*|(|\<gamma\>|)>\<assign\><big|int><rsub|x<rsub|0>><rsup|x<rsub|\<star\>>><sqrt|\<delta\><rsub|\<alpha\>\<beta\>>\<mathd\>\<gamma\><rsup|\<alpha\>><around*|(|t|)>\<mathd\>\<gamma\><rsup|\<beta\>><around*|(|t|)>>=<big|int><rsub|0><rsup|1>\<mathd\>t
    <sqrt|\<delta\><rsub|\<alpha\>\<beta\>><wide|\<gamma\>|\<dot\>><rsup|\<alpha\>><around*|(|t|)><wide|\<gamma\>|\<dot\>><rsup|\<beta\>><around*|(|t|)>>=<big|int><rsub|0><rsup|1>\<mathd\>t<around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>><around*|(|t|)>|\<\|\|\>><rsub|2>.
  </equation*>

  So, the optimal path <math|\<gamma\><rsub|\<star\>>> is given by,

  <\equation*>
    \<gamma\><rsub|\<star\>>\<assign\>argmin<rsub|\<gamma\>\<in\>\<cal-D\><around*|(|x<rsub|0>,x<rsub|1>|)>>
    l<around*|(|\<gamma\>|)>.
  </equation*>

  Interestingly, the gradient of the optimal path
  <math|<wide|\<gamma\>|\<dot\>><rsub|\<star\>><rsup|\<alpha\>><around*|(|t|)>>,
  which is the optimal direction, is <em|not> consistent with the negative
  gradient of loss function <math|-<around*|(|\<partial\>f/\<partial\>\<gamma\><rsup|\<alpha\>>|)><around*|(|\<gamma\><rsub|\<star\>><around*|(|t|)>|)>>.
  An example is <math|f<around*|(|x,y|)>\<assign\>x<rsup|2>+100y<rsup|2>> on
  <math|\<bbb-R\><rsup|2>>. The gradient of the optimal path directs to the
  origin, while the negative gradient of loss function generally does not.

  \;

  The set <math|\<cal-D\><around*|(|x<rsub|0>,x<rsub|1>|)>> is too large to
  be investigated. We first consider a subset where
  <math|><math|<wide|\<gamma\>|\<dot\>><rsup|\<alpha\>><around*|(|t|)>> has
  the same sign as <math|-\<partial\><rsub|\<alpha\>>f<around*|(|\<gamma\><around*|(|t|)>|)>>
  for any <math|\<alpha\>\<in\><around*|{|1,\<ldots\>,n|}>>. Then
  <math|<around*|(|\<mathd\>/\<mathd\>t|)>f<around*|(|\<gamma\><around*|(|t|)>|)>\<less\>0>
  is guaranteed before <math|t=1>, and <math|\<partial\>f<around*|(|\<gamma\><around*|(|1|)>|)>=0>
  at miminum implies <math|lim<rsub|t\<rightarrow\>1><around*|(|\<mathd\>/\<mathd\>t|)>f<around*|(|\<gamma\><around*|(|t|)>|)>=0>.
  Since only direction borthers, we denote <math|n<around*|(|t|)>> the
  direction of <math|<wide|\<gamma\>|\<dot\>><around*|(|t|)>>, as
  <math|n<around*|(|t|)>\<assign\><wide|\<gamma\>|\<dot\>><around*|(|t|)>/<around*|\<\|\|\>|<wide|\<gamma\>|\<dot\>>|\<\|\|\>><rsub|2>>.
  Then the direction of gradient and that of optimal path are represented by
  <math|n<rsub|g>> and <math|n<rsub|\<star\>>> respectively. We consider the
  distribution of the inner product

  <\equation*>
    <around*|\<langle\>|n<around*|(|t|)>,n<rsub|\<star\>><around*|(|t|)>|\<rangle\>>
  </equation*>

  <\equation*>
    \;
  </equation*>
</body>

<\initial>
  <\collection>
    <associate|bg-color|#c7edcc>
    <associate|page-medium|paper>
  </collection>
</initial>