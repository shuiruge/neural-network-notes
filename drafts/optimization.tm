<TeXmacs|2.1.4>

<style|book>

<\body>
  Given a loss function <math|f:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\>>,
  and two points <math|x<rsub|0>,x<rsub|1>\<in\>\<bbb-R\><rsup|n>> with
  <math|f<around*|(|x<rsub|0>|)>\<gtr\>f<around*|(|x<rsub|1>|)>>, we can
  consider a path from <math|x<rsub|0>> to <math|x<rsub|1>>, defined by a
  function <math|\<gamma\>:<around*|[|0,1|]>\<rightarrow\>\<bbb-R\><rsup|n>>
  such that <math|\<gamma\><around*|(|0|)>=x<rsub|0>> and
  <math|\<gamma\><around*|(|1|)>=x<rsub|1>>. But what we really care about is
  the path that is constantly descending. Precisely, a descending path is a
  path such that

  <\equation*>
    <frac|\<mathd\>|\<mathd\>t>f<around*|(|\<gamma\><around*|(|t|)>|)>=<frac|\<partial\>f|\<partial\>\<gamma\><rsup|\<alpha\>>><around*|(|\<gamma\><around*|(|t|)>|)><frac|\<mathd\>\<gamma\><rsup|\<alpha\>>|\<mathd\>t><around*|(|t|)>\<less\>0
  </equation*>

  for any <math|t\<in\><around*|[|0,1|]>>. Denote the set of all descending
  paths from <math|x<rsub|0>> to <math|x<rsub|1>> as
  <math|\<cal-D\><around*|(|x<rsub|0>,x<rsub|1>|)>>.

  Then, among these descending paths, what we really interest in is the
  optimal one, the path that has the minimal length. The length of a path on
  an Eulidean space is defined by

  <\equation*>
    l<around*|(|\<gamma\>|)>\<assign\><big|int><rsub|x<rsub|0>><rsup|x<rsub|\<star\>>><sqrt|\<delta\><rsub|\<alpha\>\<beta\>>\<mathd\>\<gamma\><rsup|\<alpha\>><around*|(|t|)>\<mathd\>\<gamma\><rsup|\<beta\>><around*|(|t|)>>=<big|int><rsub|0><rsup|1>\<mathd\>t
    <sqrt|\<delta\><rsub|\<alpha\>\<beta\>><frac|\<mathd\>\<gamma\><rsup|\<alpha\>>|\<mathd\>t><around*|(|t|)><frac|\<mathd\>\<gamma\><rsup|\<beta\>>|\<mathd\>t><around*|(|t|)>>.
  </equation*>

  So, the optimal path <math|\<gamma\><rsub|\<star\>>> that has the minimal
  length is given by,

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
  origin, while the negative gradient of loss function does not.

  \;
</body>

<\initial>
  <\collection>
    <associate|bg-color|#c7edcc>
    <associate|page-medium|paper>
  </collection>
</initial>