<TeXmacs|2.1.4>

<style|generic>

<\body>
  Suppose that <math|y<rsup|\<alpha\>>=U<rsup|\<alpha\>\<beta\>>h<rsub|\<beta\>>+a<rsup|\<alpha\>>>
  and <math|h<rsub|\<alpha\>>=\<sigma\><around*|(|W<rsub|\<alpha\>\<beta\>>x<rsup|\<beta\>>+b<rsub|\<alpha\>>|)>>.
  Given <math|<around*|(|x,\<alpha\>|)>>, the loss is

  <\equation*>
    L=<frac|exp<around*|(|y<rsup|\<alpha\>>|)>|<big|sum><rsub|\<beta\>>exp<around*|(|y<rsup|\<beta\>>|)>>.
  </equation*>

  It is easy to prove that the Hessian matrix of <math|L> on the paramters is
  positive definite (hint: <math|L> can be seen as a probability). Thus, we
  have

  <\equation*>
    <frac|\<partial\>L|\<partial\>a<rsup|\<alpha\>>>=<frac|\<partial\>L|\<partial\>y<rsup|\<alpha\>>>\<Rightarrow\><frac|\<partial\><rsup|2>L|\<partial\>a<rsup|\<alpha\>>\<partial\>a<rsup|\<alpha\><rprime|'>>>=<frac|\<partial\><rsup|2>L|\<partial\>y<rsup|\<alpha\>>\<partial\>y<rsup|\<alpha\><rprime|'>>>.
  </equation*>

  <\equation*>
    <frac|\<partial\>L|\<partial\>U<rsub|\<alpha\>\<beta\>>>=<frac|\<partial\>L|\<partial\>y<rsup|\<alpha\>>>h<rsub|\<beta\>>\<Rightarrow\><frac|\<partial\><rsup|2>L|\<partial\>U<rsub|\<alpha\>\<beta\>>\<partial\>U<rsub|\<alpha\><rprime|'>\<beta\><rprime|'>>>=<frac|\<partial\><rsup|2>L|\<partial\>y<rsup|\<alpha\>>\<partial\>y<rsup|\<alpha\><rprime|'>>>h<rsub|\<beta\>>h<rsub|\<beta\><rprime|'>>.
  </equation*>

  <\equation*>
    <frac|\<partial\>L|\<partial\>b<rsub|\<alpha\>>>=<frac|\<partial\>L|\<partial\>y<rsup|\<beta\>>>U<rsup|\<beta\>\<alpha\>>\<sigma\><rprime|'><rsub|\<alpha\>>\<Rightarrow\><frac|\<partial\><rsup|2>L|\<partial\>b<rsub|\<alpha\>>\<partial\>b<rsub|\<alpha\><rprime|'>>>=<frac|\<partial\><rsup|2>L|\<partial\>y<rsup|\<beta\>>\<partial\>y<rsup|\<beta\><rprime|'>>><around*|(|U<rsup|\<beta\>\<alpha\>>\<sigma\><rprime|'><rsub|\<alpha\>>|)><around*|(|U<rsup|\<beta\>\<alpha\><rprime|'>>\<sigma\><rprime|'><rsub|\<alpha\><rprime|'>>|)>+<frac|\<partial\>L|\<partial\>y<rsup|\<beta\>>>U<rsup|\<beta\>\<alpha\>>\<sigma\><rprime|''><rsub|\<alpha\>>\<delta\><rsup|\<alpha\>\<alpha\><rprime|'>>
  </equation*>

  <\equation*>
    <frac|\<partial\>L|\<partial\>W<rsub|\<alpha\>\<beta\>>>=<frac|\<partial\>L|\<partial\>y<rsup|\<gamma\>>>U<rsup|\<gamma\>\<alpha\>>\<sigma\><rprime|'><rsub|\<alpha\>>x<rsup|\<beta\>>\<Rightarrow\><frac|\<partial\><rsup|2>L|\<partial\>U<rsub|\<alpha\>\<beta\>>U<rsub|\<alpha\><rprime|'>\<beta\><rprime|'>>>=<frac|\<partial\><rsup|2>L|\<partial\>y<rsup|\<gamma\>>\<partial\>y<rsup|\<gamma\><rprime|'>>><around*|(|U<rsup|\<gamma\>\<alpha\>>\<sigma\><rprime|'><rsub|\<alpha\>>x<rsup|\<beta\>>|)><around*|(|U<rsup|\<gamma\><rprime|'>\<alpha\><rprime|'>>\<sigma\><rprime|'><rsub|\<alpha\><rprime|'>>x<rsup|\<beta\><rprime|'>>|)>+<frac|\<partial\>L|\<partial\>y<rsup|\<gamma\>>>U<rsup|\<gamma\>\<alpha\>>\<sigma\><rprime|''><rsub|\<alpha\>>x<rsup|\<beta\>>x<rsup|\<beta\><rprime|'>>\<delta\><rsup|\<alpha\>\<alpha\><rprime|'>>.
  </equation*>

  If <math|\<sigma\><rprime|''>> vanishes (such as <verbatim|relu>), then
  these are all positive quadric forms (because the Hessian matrix of
  <math|L> is positive definite). But, for the \Pcross terms\Q, we have, for
  example,

  <\equation*>
    <frac|\<partial\><rsup|2>L|\<partial\>a<rsup|\<alpha\>>\<partial\>b<rsub|\<beta\>>>=<frac|\<partial\><rsup|2>L|\<partial\>y<rsup|\<alpha\>>\<partial\>y<rsup|\<gamma\>>>U<rsup|\<gamma\>\<beta\>>\<sigma\><rprime|'><rsub|\<beta\>>.
  </equation*>

  This is not a quadric form and it is not guraranteed to be positive.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>