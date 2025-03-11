<TeXmacs|2.1.4>

<style|book>

<\body>
  <chapter|When Neural Network Becomes Deep>

  <section|Enlarging Model Increases Performance>

  In this section, we investigate how the model performance benefit from
  increasing the number of adaptive parameters. We are to show that this
  almost always results in an increment of performance.

  Consider a model <math|f<around*|(|x;\<theta\>|)>> with <math|m> parameters
  (or components of parameter). In the infinite-dimensional parameter space
  (section <reference|section: Simulation Is a Kind of Data-Fitting>), it is
  written as <math|f<around*|(|x;<around*|(|\<theta\><rsup|1>,\<ldots\>,\<theta\><rsup|m>,0,\<ldots\>|)>|)>>.
  For convienence, we omit the innermost parentheses, so it is
  <math|f<around*|(|x;\<theta\><rsup|1>,\<ldots\>,\<theta\><rsup|m>,0,\<ldots\>|)>>.
  Given a dataset <math|D=<around*|{|<around*|(|x<rsub|i>,y<rsub|i>|)>\|i=1,\<ldots\>,N|}>>,
  suppose that we have trained the model, resulting in the best-fit model
  <math|f<around*|(|x;\<theta\><rsub|\<star\>><rsup|1>,\<ldots\>,\<theta\><rsub|\<star\>><rsup|m>,0,\<ldots\>|)>>.
  After training, we add <math|n> parameters with <math|n\<ll\>m>. For
  convienence, we re-denote the later <math|n> parameters as
  <math|\<varphi\>>, thus the model changes from

  <\equation*>
    f<around*|(|x;\<theta\><rsub|\<star\>>|)>=f<around*|(|x;\<theta\><rsub|\<star\>><rsup|1>,\<ldots\>,\<theta\><rsub|\<star\>><rsup|m>,0,\<ldots\>|)>
  </equation*>

  to

  <\equation*>
    f<around*|(|x;\<theta\><rsub|\<star\>>,\<varphi\>|)>=f<around*|(|x;\<theta\><rsub|\<star\>><rsup|1>,\<ldots\>,\<theta\><rsub|\<star\>><rsup|m>,\<theta\><rsup|m+1>,\<ldots\>,\<theta\><rsup|m+n>,0,\<ldots\>|)>.
  </equation*>

  Practically, we can assume that all the best-fit parameters are
  small.<\footnote>
    This is generally true, for several reasons. One is that small parameters
    increases robustness in generalization. Another may trace to the
    initialization strategy and optimization algorithm. Temporally, we will
    not discuss these aspects, but simply assume the fact.
  </footnote> Together with <math|n\<ll\>m>, it implies that, while continue
  the training, we can freeze <math|\<theta\>> to
  <math|\<theta\><rsub|\<star\>>> and only optimize <math|\<varphi\>>, since
  the feedback from <math|\<varphi\>> to <math|\<theta\>> can be negligible.
  So, the loss function becomes

  <\equation*>
    L<around*|(|\<varphi\>|)>=\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|d<around*|(|f<around*|(|x;\<theta\><rsub|\<star\>>,\<varphi\>|)>,y|)>|]>.
  </equation*>

  Minimizing <math|L<around*|(|\<varphi\>|)>> results in the best-fit
  <math|\<varphi\><rsub|\<star\>>>.

  \;

  As an example, consider <math|d<around*|(|x,y|)>=<around*|(|x-y|)><rsup|2>/2>.
  We Taylor expand <math|f> by <math|\<varphi\>> at <math|\<varphi\>=0> as

  <\equation*>
    f<around*|(|x;\<theta\><rsub|\<star\>>,\<varphi\>|)>=f<around*|(|x;\<theta\><rsub|\<star\>>|)>+<big|sum><rsub|\<alpha\>=1><rsup|n>\<varphi\><rsup|\<alpha\>><frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|x;\<theta\><rsub|\<star\>>|)>+\<omicron\><around*|(|\<varphi\>|)>.
  </equation*>

  Thus,

  <\equation*>
    L<around*|(|\<varphi\>|)>=<frac|1|2>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|<around*|(|f<around*|(|x;\<theta\><rsub|\<star\>>,\<varphi\>|)>-y|)><rsup|2>|]>=L<around*|(|\<varphi\>|)>=<frac|1|2>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|<around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>\<varphi\><rsup|\<alpha\>><frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|x;\<theta\><rsub|\<star\>>|)>-\<delta\>y+\<omicron\><around*|(|\<varphi\>|)>|)><rsup|2>|]>,
  </equation*>

  where <math|\<delta\>y\<assign\>y-f<around*|(|x;\<theta\><rsub|\<star\>>|)>>,
  the residue left by <math|f<around*|(|x;\<theta\><rsub|\<star\>>|)>>. Since
  <math|\<varphi\>> is small, we can omit the
  <math|\<omicron\><around*|(|\<varphi\>|)>>, resulting in a linear model
  that fits the residue.<\footnote>
    The same situation as <verbatim|xgboost>. For detail, see <em|XGBoost: A
    Scalable Tree Boosting System> by Tianqi Chen and Carlos Guestrin, 2016.
    arXiv: <hlink|1603.02754|https://arxiv.org/abs/1603.02754>
  </footnote> It can be solved analytically. We have

  <\equation*>
    <frac|\<partial\>L|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|\<varphi\>|)>=<big|sum><rsub|\<beta\>=1><rsup|n>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|<frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<beta\>>><around*|(|x;\<theta\><rsub|\<star\>>|)><frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|x;\<theta\><rsub|\<star\>>|)>|]>\<varphi\><rsup|\<beta\>>-\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|\<delta\>y<frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|x;\<theta\><rsub|\<star\>>|)>|]>.
  </equation*>

  As long as

  <\equation*>
    \<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|<frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<beta\>>><around*|(|x;\<theta\><rsub|\<star\>>|)><frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|x;\<theta\><rsub|\<star\>>|)>|]>
  </equation*>

  is not degenerate, <math|<around*|(|\<partial\>L/\<partial\>\<varphi\><rsup|\<alpha\>>|)><around*|(|\<varphi\><rsub|\<star\>>|)>=0>
  gives

  <\equation*>
    \<varphi\><rsub|\<star\>><rsup|\<beta\>>=<big|sum><rsub|\<alpha\>=1><rsup|n>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|\<delta\>y<frac|\<partial\>f|\<partial\>\<varphi\><rsup|\<alpha\>>><around*|(|x;\<theta\><rsub|\<star\>>|)>|]><around*|{|\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|<frac|\<partial\>f|\<partial\>\<varphi\>><around*|(|x;\<theta\><rsub|\<star\>>|)><frac|\<partial\>f|\<partial\>\<varphi\>><around*|(|x;\<theta\><rsub|\<star\>>|)>|]><rsup|-1>|}><rsup|\<alpha\>\<beta\>>.
  </equation*>

  So, enlarging the model (introducing in the <math|\<varphi\>>) will always
  increase the performance except for a very specific situation where

  <\equation*>
    \<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>D><around*|[|\<delta\>y<frac|\<partial\>f|\<partial\>\<varphi\>><around*|(|x;\<theta\><rsub|\<star\>>|)>|]>=0.
  </equation*>

  In this situation <math|\<varphi\><rsub|\<star\>>=0>, indicating that
  introducing <math|\<varphi\>> does not increase the performance, even
  though it does not decrease the performance also.

  \;

  <section|(TODO)>

  Introducing new parameters to a model may increase its representability,
  but not always so. Consider the feed-forward neural network with single
  hidden layer (see, section <reference|section: With Hidden Layers, Model
  Can Fit Any Dataset>),

  <\equation*>
    f<rsup|\<alpha\>><around*|(|x;\<theta\>|)>\<assign\>U<rsup|\<alpha\>><rsub|\<beta\>>
    \<sigma\><around*|(|W<rsup|\<beta\>><rsub|\<gamma\>>
    x<rsup|\<gamma\>>+b<rsup|\<beta\>>|)>+c<rsup|\<alpha\>>,
  </equation*>

  where <math|\<theta\>\<assign\><around*|(|U,W,b,c|)>>,
  <math|x\<in\>\<bbb-R\><rsup|n>>, <math|W\<in\>\<bbb-R\><rsup|m\<times\>n>>.
  and <math|\<sigma\>> denotes the activation function. Now, introduce a new
  parameter <math|V\<in\>\<bbb-R\><rsup|m\<times\>n>> in such a way that

  <\equation*>
    f<rsup|\<alpha\>><around*|(|x;\<theta\>|)>\<rightarrow\>f<rsub|ext><rsup|\<alpha\>><around*|(|x;\<theta\><rsub|ext>|)>\<assign\>U<rsup|\<alpha\>><rsub|\<beta\>>
    \<sigma\><around*|(|<around*|(|<with|color|blue|V<rsup|\<beta\>><rsub|\<gamma\>>>+W<rsup|\<beta\>><rsub|\<gamma\>>|)>
    x<rsup|\<gamma\>>+b<rsup|\<beta\>>|)>+c<rsup|\<alpha\>>,
  </equation*>

  where <math|\<theta\><rsub|ext>\<assign\><around*|(|U,V,W,b,c|)>>. It is
  apparently that the new parameter may not help increase the
  representability. In fact, we can combine <math|V+W> as a whole,
  <math|<wide|W|~>\<assign\>V+W>. Thus, <math|f<rsub|ext>> goes back to
  <math|U<rsup|\<alpha\>><rsub|\<beta\>> \<sigma\><around*|(|<wide|W|~><rsup|\<beta\>><rsub|\<gamma\>>
  x<rsup|\<gamma\>>+b<rsup|\<beta\>>|)>+c<rsup|\<alpha\>>>, which is the same
  as <math|f>. So, introducing new parameters in a \Pwrong\Q way will not
  increase the representability of the model.

  This example is still too complicated to investigated. Let us simply it
  further. Consider a model

  <\equation*>
    g<around*|(|x;\<theta\>|)>\<assign\>a \<sigma\><around*|(|b x|)>,
  </equation*>

  where <math|\<theta\>\<assign\><around*|(|a,b|)>> and
  <math|x,a,b\<in\>\<bbb-R\>>. You can recognize that this model <math|g> is
  the extremely simplified version of the model <math|f>. The same, introduce
  a \Pwrong\Q parameter <math|c\<in\>\<bbb-R\>> such that

  <\equation*>
    g<rsub|ext><around*|(|x;\<theta\><rsub|ext>|)>\<assign\>a
    \<sigma\><around*|(|<around*|(|b+<with|color|blue|c>|)> x|)>,
  </equation*>

  where <math|\<theta\><rsub|ext>\<assign\><around*|(|a,b,c|)>> is the
  extended collection of parameters; and defining
  <math|<wide|b|~>\<assign\>b+c> makes <math|g<rsub|ext>> go back to
  <math|g>. The key is that, after defining <math|<wide|b|~>>,
  <math|g<rsub|ext>> has the same <with|font-shape|italic|form> as <math|g>.
  This definition can be seem as a coordinates transform on the parameter
  space <math|<around*|(|a,b,c|)>\<rightarrow\><around*|(|a,<wide|b|~>,c|)>>
  after which some coordinate (the <math|c>) is absent. Notice that this
  coordinates transform is only for <math|\<theta\><rsub|ext>>, thus is
  independent of <math|x>. Contrarily, if we introduce the parameter <math|c>
  in such a way that

  <\equation*>
    g<rprime|'><rsub|ext><around*|(|x;\<theta\><rsub|ext>|)>\<assign\>a
    \<sigma\><around*|(|b x+c|)>,
  </equation*>

  then (recall that <math|\<sigma\>> is a non-linear function) we cannot find
  an <math|x>-independent coordinate transform of <math|\<theta\><rsub|ext>>
  by which some coordinate becomes absent.

  <section|Draft>

  As discussed in section <reference|section: loss function>, given a dataset
  <math|D>, the performance of data-fitting is characterized by a loss
  function <math|L<rsub|D><around*|(|\<theta\>|)>> where <math|\<theta\>> is
  the collection of model parameters. These parameters are like the knobs on
  an instrument. By tuning these knobs, the value displayed on the instrument
  screen varies. But, unlike the knobs, not all the parameters are
  independent. As an example, consider a loss function
  <math|L<rsub|D><around*|(|\<theta\><rsub|1>,\<theta\><rsub|2>|)>=g<around*|(|\<theta\><rsub|1>+\<theta\><rsub|2>|)>>
  on <math|2>-dimensional parameter space, where
  <math|g:\<bbb-R\>\<rightarrow\>\<bbb-R\>>. It seems that <math|L<rsub|D>>
  has two knobs, but letting the coordinates transform as
  <math|\<theta\>\<rightarrow\><wide|\<theta\>|~>> where
  <math|<wide|\<theta\>|~><rsub|1>\<assign\><around*|(|\<theta\><rsub|1>+\<theta\><rsub|2>|)>/2>
  and <math|<wide|\<theta\>|~><rsub|2>\<assign\><around*|(|\<theta\><rsub|1>-\<theta\><rsub|2>|)>/2>,
  which is apparently bijective, we have <math|<wide|L|~><rsub|D><around*|(|<wide|\<theta\>|~><rsub|1>,<wide|\<theta\>|~><rsub|2>|)>\<assign\>L<rsub|D><around*|(|\<theta\><rsub|1><around*|(|<wide|\<theta\>|~><rsub|1>,<wide|\<theta\>|~><rsub|2>|)>,\<theta\><rsub|2><around*|(|<wide|\<theta\>|~><rsub|1>,<wide|\<theta\>|~><rsub|2>|)>|)>=g<around*|(|2<wide|\<theta\>|~><rsub|1>|)>>.
  Tuning <math|<wide|\<theta\>|~><rsub|2>> does not change the loss function;
  it is a useless knob. Precisely, there may exist a global coordinate
  transformation <math|\<theta\>\<rightarrow\><wide|\<theta\>|~>> on the
  parameter space such that some component
  <math|<wide|\<theta\>|~><rsub|\<alpha\>>> is absent in the transformed loss
  function <math|<wide|L|~><rsub|D><around*|(|<wide|\<theta\>|~>|)>\<assign\>L<rsub|D><around*|(|\<theta\><around*|(|<wide|\<theta\>|~>|)>|)>>.
  That is,

  <\equation*>
    <big|sum><rsub|\<beta\>><frac|\<partial\>L<rsub|D>|\<partial\>\<theta\><rsub|\<beta\>>><around*|(|\<theta\>|)>
    <frac|\<partial\>\<theta\><rsub|\<beta\>>|\<partial\><wide|\<theta\>|~><rsub|\<alpha\>>><around*|(|<wide|\<theta\>|~><around*|(|\<theta\>|)>|)>=0
  </equation*>

  holds for all <math|\<theta\>>. This indicates that not all parameters are
  equally effective for decreasing the loss function. Parameters like this
  are called <with|font-series|bold|degenerate>.

  <section|Enlarging Model Is Efficient for Increasing Its Representability
  (TODO)>

  As long as the model is not degenerate, all its \Pknobs\Q are effective for
  tuning. We may expect that the more parameters it has, the better
  performance it will be. So, for increasing the representability of a model
  (neural network), so as to fit more and more data with sufficient
  flexibility, we can enlarge it by increasing the number of the trainable
  parameters. Even though there are many other ways of increasing
  representability, such as changing the model architecture, simply
  increasing the number of trainable parameters will be the most cheap, safe,
  and efficient.

  <section|Increasing Depth Is More Efficient for Enlarging Model>

  <subsection|Simple Baseline Model><label|section: Simple Baseline Model>

  There are mainly two ways to increasing the number of trainable parameters:
  increasing width or increasing depth. By increasing width, we enlarge the
  dimension of hidden layers. And by increasing depth, we add more hidden
  layers to the model. The problem is, which way of enlarging model is more
  computational efficient, having less complexity.

  We are to exam this problem by considering a sufficiently simple neural
  network with one-dimensional input, one-dimension output, one hidden layer,
  and without biases. Suppose we have a baseline neural network
  <math|y=f<around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rsup|\<alpha\>>|)>> with <math|z<rsup|\<alpha\>>=f<around*|(|W<rsup|\<alpha\>>
  x|)>>, where <math|n\<gg\>1>. There are <math|n> <math|U>s and <math|W>s
  respectively, thus <math|2n> parameters. What is the computational
  complexity? We have to go through the processes that computes <math|y> from
  <math|x> and derivatives <math|\<partial\>y/\<partial\>U>,
  <math|\<partial\>y/\<partial\>W>.

  For computing <math|z>, we have to do <math|n> multiplications for
  <math|W<rsup|\<alpha\>>x>, and <math|n> activations by <math|f>. For
  computing <math|y> from <math|z>, we make <math|n> multiplications for
  <math|U<rsub|\<alpha\>>z<rsup|\<alpha\>>>, and one activation by <math|f>.
  For computing <math|\<partial\>y/\<partial\>U>, we have

  <\equation*>
    <frac|\<partial\>y|\<partial\>U<rsup|\<alpha\>>>=f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
    z<rsup|\<alpha\>>|)> z<rsup|\<alpha\>>.
  </equation*>

  Notice that the term <math|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rsup|\<alpha\>>> and <math|z> has been computed previously. There is no
  need to compute a quantity more than once; we shall cache them when
  computing <math|y> from <math|x>. This occupies memory for <math|1+n> float
  numbers. Now, to compute <math|\<partial\>y/\<partial\>U>, we simply need
  one activation by <math|f<rprime|'>> and <math|n> multiplications. Finally,
  for computing <math|\<partial\>y/\<partial\>W>, we have

  <\equation*>
    <frac|\<partial\>y|\<partial\>W<rsub|\<alpha\>>>=<frac|\<partial\>y|\<partial\>z<rsup|\<alpha\>>><frac|\<partial\>z<rsup|\<alpha\>>|\<partial\>W<rsub|\<alpha\>>>=f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
    z<rsup|\<alpha\>>|)> U<rsub|\<alpha\>>\<times\>f<rprime|'><around*|(|W<rsup|\<alpha\>>
    x|)> x.
  </equation*>

  Again, <math|W<rsup|\<alpha\>> x> has been computed previously, thus shall
  be cached, occupying memory for <math|n> float numbers. In addition, we
  need <math|n> activations by <math|f<rprime|'>> for
  <math|f<rprime|'><around*|(|W<rsup|\<alpha\>> x|)>>, one multiplication for
  <math|f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rsup|\<alpha\>>|)>> times <math|x>, <math|n> multiplications for
  <math|U<rsub|\<alpha\>>\<times\>f<rprime|'><around*|(|W<rsup|\<alpha\>>
  x|)>>, and <math|n> multiplications for the final result. Totally, we have
  to cache about <math|2n> float numbers, which is the spatial complexity;
  and about <math|n> activations by <math|f>, <math|n> activations by
  <math|f<rprime|'>>, and <math|5n> multiplications, which is the temporal
  complexity.

  <subsection|Increasing Depth>

  If we add a new hidden layer (without bias) between <math|y> and <math|z>,
  say <math|z<rprime|'>>, with dimension <math|n>, then
  <math|y=f<around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rprime|'><rsup|\<alpha\>>|)>>, <math|z<rprime|'><rsup|\<alpha\>>=f<around*|(|<big|sum><rsub|\<beta\>=1><rsup|n>V<rsup|\<alpha\>><rsub|\<beta\>>z<rsup|\<beta\>>|)>>,
  and <math|z<rsup|\<alpha\>>=f<around*|(|W<rsup|\<alpha\>> x|)>>. there will
  be <math|n<rsup|2>> additional parameters (the weight <math|V>), thus
  <math|2n+n<rsup|2>> parameters in total.

  What is the complexity? Again, we have to go through the processes that
  computes <math|y> from <math|x> and derivatives
  <math|\<partial\>y/\<partial\>U>, <math|\<partial\>y/\<partial\>V>,
  <math|\<partial\>y/\<partial\>W>.

  For compute <math|y> from <math|x>, we have known the computation from
  <math|x> to <math|z> and from <math|z<rprime|'>> to <math|y>, which need
  about <math|n> activations by <math|f> and <math|2n> multiplications in
  total. All left to do is figuring out the process that computes
  <math|z<rprime|'>> from <math|z>. This needs <math|n> activations by
  <math|f> and <math|n<rsup|2>> multiplications. Computing
  <math|\<partial\>y/\<partial\>U> is the same as before, which caches about
  <math|n> float numbers and needs <math|n> multiplications. For
  <math|\<partial\>y/\<partial\>V>, we have

  <\equation*>
    <frac|\<partial\>y|\<partial\>V<rsup|\<beta\>><rsub|\<alpha\>>>=<frac|\<partial\>y|\<partial\>z<rprime|'><rsup|\<beta\>>><frac|\<partial\>z<rprime|'><rsup|\<beta\>>|\<partial\>V<rsup|\<beta\>><rsub|\<alpha\>>>=f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
    z<rprime|'><rsup|\<alpha\>>|)> U<rsub|\<beta\>>\<times\>f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>V<rsup|\<beta\>><rsub|\<alpha\>>z<rsup|\<alpha\>>|)>
    z<rsup|\<alpha\>>.
  </equation*>

  Again, the terms <math|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rprime|'><rsup|\<alpha\>>>, <math|<big|sum><rsub|\<alpha\>=1><rsup|n>V<rsup|\<beta\>><rsub|\<alpha\>>z<rsup|\<alpha\>>>,
  and <math|z<rsup|\<alpha\>>> has been computed, we shall cache them for
  reusing. This occupies a memory of <math|1+2n> float numbers. Thus, we just
  need to compute <math|n> activations by <math|f<rprime|'>> for
  <math|f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>V<rsup|\<beta\>><rsub|\<alpha\>>z<rsup|\<alpha\>>|)>>,
  <math|n> multiplications for <math|f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rprime|'><rsup|\<alpha\>>|)> z<rsup|\<alpha\>>>, <math|n> multiplications
  for <math|U<rsub|\<beta\>>\<times\>f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>V<rsup|\<beta\>><rsub|\<alpha\>>z<rsup|\<alpha\>>|)>>,
  and <math|n<rsup|2>> multiplications for the final result. For
  <math|\<partial\>y/\<partial\>W>, we have

  <\equation*>
    <frac|\<partial\>y|\<partial\>W<rsub|\<alpha\>>>=<big|sum><rsub|\<beta\>=1><rsup|n><frac|\<partial\>y|\<partial\>z<rprime|'><rsup|\<beta\>>><frac|\<partial\>z<rprime|'><rsup|\<beta\>>|\<partial\>z<rsup|\<alpha\>>><frac|\<partial\>z<rsup|\<alpha\>>|\<partial\>W<rsub|\<alpha\>>>=<big|sum><rsub|\<beta\>=1><rsup|n>f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
    z<rprime|'><rsup|\<alpha\>>|)> U<rsub|\<beta\>>\<times\>f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>V<rsup|\<beta\>><rsub|\<alpha\>>z<rsup|\<alpha\>>|)>
    V<rsup|\<beta\>><rsub|\<alpha\>>\<times\>f<rprime|'><around*|(|W<rsup|\<alpha\>>x|)>
    x.
  </equation*>

  We shall read <math|W<rsup|\<alpha\>>x> from cache, which occupies a memory
  of <math|n> float numbers. In addition, we need to compute <math|n>
  activations by <math|f<rprime|'>>, one multiplication for
  <math|f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>U<rsub|\<alpha\>>
  z<rprime|'><rsup|\<alpha\>>|)> x>, <math|n> multiplications for
  <math|U<rsub|\<beta\>>\<times\>f<rprime|'><around*|(|<big|sum><rsub|\<alpha\>=1><rsup|n>V<rsup|\<beta\>><rsub|\<alpha\>>z<rsup|\<alpha\>>|)>>,
  and <math|2n<rsup|2>> multiplications for the final result. Totally, we
  have to cache about <math|4n> float numbers, which is the spatial
  complexity; and about <math|2n> activations by <math|f>, <math|2n>
  activations by <math|f<rprime|'>>, and <math|4n<rsup|2>> multiplications,
  which is the temporal complexity.

  <subsection|Increasing Width>

  If we are to increase the width of the baseline neural network so as to
  obtain the same number of parameters of that which adds a new hidden layer,
  we shall extend the <math|z> to <math|m>-dimension, such that
  <math|2m=2n+n<rsup|2>>. Thus, based on the computation in section
  <reference|section: Simple Baseline Model>, we have to cache about
  <math|2m\<approx\>n<rsup|2>> float numbers, which is the spatial
  complexity; and about <math|m\<approx\>0.5 n<rsup|2>> activations by
  <math|f>, <math|m\<approx\>0.5 n<rsup|2>> activations by
  <math|f<rprime|'>>, and <math|5m\<approx\>2.5 n<rsup|2>> multiplications,
  which is the temporal complexity.

  <subsection|Summary: Increasing Depth v.s. Increasing Width>

  Now, we find that, for obtaining the same number of trainable parameters
  after enlarging, increasing depth is much more efficient in memory than
  increasing width. And increasing width is almost as the same efficiency as
  increasing depth in computing time. Recall that this result is obtained
  when <math|n\<gg\>1>. In this situation, increasing depth is much more
  efficient in computation than increasing width.

  <section|Increasing Depth Makes It Hard to Control the Gradients>

  Even though increasing depth is more efficient for enlarging the model
  capacity, it increases the difficulty of training. To declare this problem,
  consider a feed-forward neural network with <math|L> layers. It can be
  expressed as

  <\equation>
    z<rsub|l><rsup|\<alpha\>>=f<rsub|l><around*|(|<big|sum><rsub|\<beta\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>
    z<rsub|l-1><rsup|\<beta\>>+b<rsub|l><rsup|\<alpha\>>|)>,
  </equation>

  where <math|l=1,\<ldots\>,L> represents the number of layer,
  <math|z<rsub|0>> is model input, and <math|z<rsub|L>> is model output. The
  <math|W<rsub|l>> and <math|b<rsub|l>> are the trainable parameters of the
  perceptron at layer <math|l>, and <math|f<rsub|l>> its activation function.
  For training by gradient descent methods, we have to compute the
  derivative, such as:

  <\equation>
    <frac|\<partial\>z<rsub|L>|\<partial\>W<rsub|1>><around*|(|z<rsub|0>|)>=<frac|\<partial\>z<rsub|L>|\<partial\>z<rsub|L-1>><around*|(|z<rsub|L-1>|)>\<cdummy\><frac|\<partial\>z<rsub|L-1>|\<partial\>z<rsub|L-2>><around*|(|z<rsub|L-2>|)>\<cdummy\>\<cdots\>\<cdummy\><frac|\<partial\>z<rsub|2>|\<partial\>z<rsub|1>><around*|(|z<rsub|1>|)>\<cdummy\><frac|\<partial\>z<rsub|1>|\<partial\>W<rsub|1>><around*|(|z<rsub|0>|)>,<label|equation:gradient
    chain-rule>
  </equation>

  where for simplicity we employed matrix multiplication format, in which
  each partial derivative is an Jacobian matrix.

  For stabilizing the training, we hope that
  <math|<around*|\<\|\|\>|\<partial\>z<rsub|L>/\<partial\>W<rsub|1>|\<\|\|\>>\<sim\>1>
  during the whole training process before approaching the best
  fit.<\footnote>
    By saying <math|<around*|\||x|\|>\<sim\>1> for some <math|x>, we mean
    that its absolute value will not be extremely large or tiny, such as
    <math|10<rsup|10>> or <math|10<rsup|-10>>.
  </footnote> But, when the model becomes depth, it cannot be guaranteed.
  Indeed, we have the rough estimation

  <\equation*>
    <around*|\<\|\|\>|<frac|\<partial\>z<rsub|L>|\<partial\>W<rsub|1>><around*|(|z<rsub|0>|)>|\<\|\|\>>\<sim\><around*|\<\|\|\>|<frac|\<partial\>z<rsub|L>|\<partial\>z<rsub|L-1>><around*|(|z<rsub|L-1>|)>|\<\|\|\>>
    <around*|\<\|\|\>|<frac|\<partial\>z<rsub|L-1>|\<partial\>z<rsub|L-2>><around*|(|z<rsub|L-2>|)>|\<\|\|\>>
    \<cdots\> <around*|\<\|\|\>|<frac|\<partial\>z<rsub|2>|\<partial\>z<rsub|1>><around*|(|z<rsub|1>|)>|\<\|\|\>>
    <around*|\<\|\|\>|<frac|\<partial\>z<rsub|1>|\<partial\>W<rsub|1>><around*|(|z<rsub|0>|)>|\<\|\|\>>,
  </equation*>

  from which we can see that, when <math|L\<gg\>1>, we have to carefully tune
  the <math|\<partial\>z<rsub|l>/\<partial\>z<rsub|l-1>> for all
  <math|l=2,\<ldots\>,L> to balance the long sequence of products on the
  right hand side, so as to make <math|<around*|\<\|\|\>|\<partial\>z<rsub|L>/\<partial\>W<rsub|1>|\<\|\|\>>\<sim\>1>.
  This, however, cannot be done since the training process is quite
  complicated and unpredictable, let alone fine-tuning the
  <math|\<partial\>z<rsub|l>/\<partial\>z<rsub|l-1>>s. As a result, when the
  model becomes quite deep, the training process will be extremely unstable:
  the gradients of parameters jump back and forth over a wide range.

  <section|Techniques Are Combined for Controlling the
  Gradients><label|section: Techniques Are Combined for Controlling the
  Gradients>

  <subsection|Residual Structure><label|section: Residual Structure>

  As the chain-rule (<reference|equation:gradient chain-rule>) indicated, the
  problem of bounding the gradients by parameters, such as
  <math|\<partial\>z<rsub|L>/\<partial\>W<rsub|1>>, can be converted to bound
  the <math|<around*|\<\|\|\>|\<partial\>z<rsub|l+m>/\<partial\>z<rsub|l>|\<\|\|\>>>
  for each <math|1\<leqslant\>l\<less\>l+m\<leqslant\>L>, hoping for
  <math|<around*|\<\|\|\>|\<partial\>z<rsub|l+m>/\<partial\>z<rsub|l>|\<\|\|\>>\<sim\>1>.

  The trick is doing perturbation. Explicitly, instead of using perceptron to
  represent the function that computes <math|z<rsub|l>> out of
  <math|z<rsub|l-1>> as before, we use it for the difference between
  <math|z<rsub|l>> and <math|z<rsub|l-1>>. That is, we re-define the
  <math|z<rsub|l><around*|(|z<rsub|l-1>|)>> from

  <\equation*>
    z<rsub|l><rsup|\<alpha\>>=f<rsub|l><around*|(|<big|sum><rsub|\<beta\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>
    z<rsub|l-1><rsup|\<beta\>>+b<rsub|l><rsup|\<alpha\>>|)>
  </equation*>

  to

  <\equation*>
    z<rsub|l><rsup|\<alpha\>>=z<rsub|l-1><rsup|\<alpha\>>+f<rsub|l><around*|(|<big|sum><rsub|\<beta\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>
    z<rsub|l-1><rsup|\<beta\>>+b<rsub|l><rsup|\<alpha\>>|)>
  </equation*>

  for all <math|l=1,\<ldots\>,L>. The term

  <\equation*>
    r<rsup|\<alpha\>><rsub|l-1><around*|(|z<rsub|l-1>|)>\<assign\>f<rsub|l><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
    z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|)>
  </equation*>

  is called <with|font-shape|italic|residual>. We then have

  <\equation*>
    <frac|\<partial\>z<rsub|l><rsup|\<alpha\>>|\<partial\>z<rsub|l-1><rsup|\<beta\>>>=\<delta\><rsup|\<alpha\>><rsub|\<beta\>>+<frac|\<partial\>r<rsup|\<alpha\>><rsub|l-1>|\<partial\>z<rsup|\<beta\>><rsub|l-1>><around*|(|z<rsub|l-1>|)>.
  </equation*>

  As long as the <math|<around*|\<\|\|\>|\<partial\>r/\<partial\>z|\<\|\|\>>>
  is small enough (perturbative), we will have
  <math|<around*|\<\|\|\>|\<partial\>z<rsub|l+1>/\<partial\>z<rsub|l>|\<\|\|\>>\<sim\>1>.

  Now, we apply this to calculate <math|\<partial\>z<rsub|l+m>/\<partial\>z<rsub|l>>.
  First, we try the simplest case where <math|m=2>:

  <\align>
    <tformat|<table|<row|<cell|<frac|\<partial\>z<rsup|\<alpha\>><rsub|l+2>|\<partial\>z<rsup|\<beta\>><rsub|l>><around*|(|z<rsub|l>|)>=>|<cell|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l+1>><frac|\<partial\>z<rsup|\<alpha\>><rsub|l+2>|\<partial\>z<rsup|\<gamma\>><rsub|l+1>><around*|(|z<rsub|l+1>|)><frac|\<partial\>z<rsup|\<gamma\>><rsub|l+1>|\<partial\>z<rsup|\<beta\>><rsub|l>><around*|(|z<rsub|l>|)>>>|<row|<cell|=>|<cell|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l+1>><around*|(|\<delta\><rsup|\<alpha\>><rsub|\<gamma\>>+<frac|\<partial\>r<rsup|\<alpha\>><rsub|l+1>|\<partial\>z<rsup|\<gamma\>><rsub|l+1>><around*|(|z<rsub|l+1>|)>|)>
    <around*|(|\<delta\><rsup|\<gamma\>><rsub|\<beta\>>+<frac|\<partial\>r<rsup|\<gamma\>><rsub|l>|\<partial\>z<rsup|\<beta\>><rsub|l>><around*|(|z<rsub|l>|)>|)>>>|<row|<cell|=>|<cell|\<delta\><rsup|\<alpha\>><rsub|\<beta\>>+<frac|\<partial\>r<rsup|\<alpha\>><rsub|l>|\<partial\>z<rsup|\<beta\>><rsub|l>><around*|(|z<rsub|l>|)>+<frac|\<partial\>r<rsup|\<alpha\>><rsub|l+1>|\<partial\>z<rsup|\<beta\>><rsub|l+1>><around*|(|z<rsub|l+1>|)>+o<around*|(|<around*|\<\|\|\>|<frac|\<partial\>r|\<partial\>z>|\<\|\|\>>|)>.>>>>
  </align>

  By repeating this process, we will find

  <\equation*>
    <frac|\<partial\>z<rsup|\<alpha\>><rsub|l+m>|\<partial\>z<rsup|\<beta\>><rsub|l>><around*|(|z<rsub|l>|)>=\<delta\><rsup|\<alpha\>><rsub|\<beta\>>+<frac|\<partial\>r<rsup|\<alpha\>><rsub|l>|\<partial\>z<rsup|\<beta\>><rsub|l>><around*|(|z<rsub|l>|)>+\<cdots\>+<frac|\<partial\>r<rsup|\<alpha\>><rsub|l+m-1>|\<partial\>z<rsup|\<beta\>><rsub|l+m-1>><around*|(|z<rsub|l+m-1>|)>+o<around*|(|<around*|\<\|\|\>|<frac|\<partial\>r|\<partial\>z>|\<\|\|\>>|)>.
  </equation*>

  Now, if we can further bound the <math|<around*|\<\|\|\>|\<partial\>r/\<partial\>z|\<\|\|\>>>,
  then problem is solved. Recall that <math|r<rsup|\<alpha\>><rsub|l-1><around*|(|z<rsub|l-1>|)>\<assign\>f<rsub|l><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
  z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|)>>, thus

  <\equation*>
    <frac|\<partial\>r<rsup|\<alpha\>><rsub|l-1>|\<partial\>z<rsub|l-1><rsup|\<beta\>>><around*|(|z<rsub|l-1>|)>=<around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>\<times\>f<rsub|l><rprime|'><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
    z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|)>.
  </equation*>

  The problem now is converted to bound <math|<around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>>
  and <math|f<rsub|l><rprime|'><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
  z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|)>>.

  <subsection|Regularization>

  Regularization techniques, including <math|L<rsub|2>>-regularization and
  <verbatim|AdamW> optimizer (that is, <verbatim|Adam> optimizer with weight
  decay), help bound the <math|<around*|\<\|\|\>|W<rsub|l>|\<\|\|\>>> and
  <math|<around*|\<\|\|\>|b<rsub|l>|\<\|\|\>>>. Explicitly, we add a penalty
  term to loss (which is to be minimized by training) as

  <\equation*>
    \<lambda\> <big|sum><rsub|l=1><rsup|L><around*|(|<around*|\<\|\|\>|W<rsub|l>|\<\|\|\>><rsub|2>+<around*|\<\|\|\>|b<rsub|l>|\<\|\|\>><rsub|2>|)>,
  </equation*>

  where <math|\<lambda\>> is a hyper-parameter that weights the penalty, and
  <math|<around*|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|2>> represents the
  <math|L<rsub|2>>-norm. As the result of regularization,
  <math|<around*|\<\|\|\>|W<rsub|l>|\<\|\|\>>> and
  <math|<around*|\<\|\|\>|b<rsub|l>|\<\|\|\>>> are bounded to be small.

  <subsection|Normalization><label|section: Normalization>

  Normalization techniques, such as batch normalization and layer
  normalization, serve for bounding the second term. Explicitly, it passes
  <math|N<around*|(|z<rsub|l-1>|)>> instead of <math|z<rsub|l-1>> to the
  perceptron at layer <math|l>, where <math|N<around*|(|z|)>> is defined as

  <\equation*>
    N<around*|(|z|)>\<assign\><frac|z-\<bbb-E\><around*|[|z|]>|<sqrt|Var<around*|[|z|]>>>.
  </equation*>

  For batch normalization, The expectation <math|\<bbb-E\><around*|[|z|]>>
  and variance <math|Var<around*|[|z|]>> are counted by data-batch (we put
  multiple data into the model in parallel, called
  <with|font-shape|italic|batch>, thus <math|z> is a batch). For layer
  normalization, they are counted by neurons (that is, by the index of
  <math|z<rsup|\<alpha\>>>). Anyway, normalization techniques shift and
  rescale <math|z<rsub|l-1>> so that <math|<around*|\<\|\|\>|z<rsub|l-1>|\<\|\|\>>\<sim\>1>.

  <subsection|Summary: Gradients Are Bounded by the Techniques Altogether>

  Since <math|<around*|\<\|\|\>|W<rsub|l>|\<\|\|\>>> and
  <math|<around*|\<\|\|\>|b<rsub|l>|\<\|\|\>>> have been bounded to be small
  and <math|<around*|\<\|\|\>|z<rsub|l-1>|\<\|\|\>>> is bounded to unit, the
  term <math|<around*|\||<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
  z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|\|>> is properly
  bounded for each <math|\<alpha\>>. Assuming that <math|f<rprime|'>> is not
  singular, which is held for all commonly used activation functions, then
  <math|<around*|\||f<rsub|l><rprime|'><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
  z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|)>|\|>\<lesssim\>1>
  for each <math|\<alpha\>>. Thus, for each <math|\<alpha\>> and
  <math|\<beta\>>,

  <\equation*>
    <around*|\||<frac|\<partial\>r<rsup|\<alpha\>><rsub|l-1>|\<partial\>z<rsub|l-1><rsup|\<beta\>>><around*|(|z<rsub|l-1>|)>|\|>=<around*|\||<around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>|\|>\<times\><around*|\||f<rsub|l><rprime|'><around*|(|<big|sum><rsub|\<gamma\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<gamma\>>
    z<rsup|\<gamma\>><rsub|l-1>+b<rsub|l><rsup|\<alpha\>>|)>|\|>
  </equation*>

  is bounded to be small. Recall that <math|<around*|\<\|\|\>|\<partial\>r<rsub|l-1>/\<partial\>z<rsub|l-1>|\<\|\|\>>\<ll\>1>
  implies <math|<around*|\<\|\|\>|\<partial\>z<rsub|l+m>/\<partial\>z<rsub|l>|\<\|\|\>>\<sim\>1>.
  The gradients <math|<around*|\<\|\|\>|\<partial\>z<rsub|L>/\<partial\>W<rsub|1>|\<\|\|\>>>,
  and all other gradients by parameters, are thus bounded.<\footnote>
    We examined this theoretical analysis by numerical experiments on the
    fashion-MNIST dataset (using <name|TensorFlow>). The result surprisingly
    supports our analysis. For details, see the Jupyter notebook
    <verbatim|depth-fashion-mnist.ipynb>.
  </footnote>

  <section|A Little History about Depth>

  <subsection|Regularization>

  Regularization has a long history (comparing with the history of modern
  neural network). <math|L<rsub|2>>-regularization was first suggested by a
  Soviet Russian mathematician Andrey Tikhonov in 1943, which is also called
  \Pridge regression\Q. Besides <math|L<rsub|2>>-regularization, commonly
  used regularization techniques are <math|L<rsub|1>>-regularization,
  proposed by Fadil Santosa and William Symes in 1986.

  The general <math|L<rsub|n>> regularization is adding a penalty term
  <math|\<lambda\> <around*|\<\|\|\>|\<theta\>|\<\|\|\>><rsub|n>> to loss
  function, where <math|\<theta\>> represents the model parameters and
  <math|<around*|\<\|\|\>|\<cdummy\>|\<\|\|\>><rsub|n>> the <math|n>-norm.
  The hyper-parameter <math|\<lambda\>> is in
  <math|<around*|(|0,+\<infty\>|)>>. To obtain a proper value of
  hyper-parameter, researchers have to search in an infinite range, which is
  difficult. So, in 2014, another kind of regularization method called
  dropout was proposed by <with|font-shape|italic|Nitish Srivastava> and
  others. Dropout also has a hyper-parameter, the dropout probability
  <math|p>. But <math|p> is in <math|<around*|(|0,1|)>>, a finite range.
  Searching for a proper hyper-parameter becomes much easier.

  Regularization via optimizer was first proposed by Ilya Loshchilov and
  Frank Hutter in 2017. They added weight decay to the <verbatim|Adam>
  optimizer for regularizing the model parameters during training.

  Regularization techniques were invented, not for dealing with depth, but
  for avoiding over-fitting.

  <subsection|Recurrent Neural Network>

  Interestingly, the problem that it is hard to control the gradients of deep
  feed-forward neural network was first encountered in 1991, not in a very
  deep architecture, but a shallow one. It was the recurrent neural network,
  which has an intrinsic property that is equivalent to depth.

  Explicitly, recurrent neural network was invented for manipulating
  sequential data such as text (a sequence of words). A sequential datum is
  described by <math|<around*|(|x<rsub|1>,\<ldots\>,x<rsub|T>|)>> with each
  <math|x<rsub|t>\<in\>\<bbb-R\><rsup|n>>. For manipulating it, recurrent
  neural network was designed as

  <\equation*>
    z<rsub|t><rsup|\<alpha\>>=f<around*|(|W<rsub|\<beta\>><rsup|\<alpha\>>
    z<rsup|\<beta\>><rsub|t-1>+U<rsup|\<alpha\>><rsub|\<beta\>>
    x<rsub|t><rsup|\<alpha\>>+b|)>,
  </equation*>

  where <math|z<rsub|t>> with <math|t=1,\<ldots\>,T> and <math|z<rsub|0>=0>
  is recognized as the (sequential) output of a hidden layer, parameterized
  by <math|W>, <math|U>, and <math|b>. So, <math|z<rsub|0>> and
  <math|x<rsub|1>> are used to compute <math|z<rsub|1>>; then
  <math|z<rsub|1>> and <math|x<rsub|2>> are used to compute <math|z<rsub|2>>;
  <text-dots>; finally <math|z<rsub|T-1>> and <math|x<rsub|T>> are used to
  compute <math|z<rsub|T>>. Usually, <math|z<rsub|T>> is then passed to an
  output layer, usually a perceptron, to make a prediction, such as the
  emotion that the input text contains. So, this model consists of a hidden
  layer and an output layer, thus is very shallow.

  But, it is intrinsically very deep, since <math|z<rsub|t>> depends on
  <math|z<rsub|t-1>>, thus on <math|z<rsub|t-2>>, thus on <math|z<rsub|t-3>>,
  etc. It is like the feed-forward neural network. When <math|T\<gg\>1>, it
  becomes very deep.

  <\subsection>
    Long Short-Term Memory
  </subsection>

  To solve the problem of recurrent neural network caused by it \Pdepth\Q, in
  1997, a complex structure called <with|font-shape|italic|long short-term
  memory> (LSTM for short) was proposed by Sepp Hochreiter and Jürgen
  Schmidhuber. Even though not solved, but the severity of uncontrollable
  gradients can be effectively reduced.

  The basic idea underlying long short-term memory is dynamically omitting
  some intermediate <math|z<rsub|t>> for computing <math|z<rsub|T>>. By
  saying \Pdynamically\Q, we mean that the model determines which
  <math|z<rsub|t>> is to be omitted based on the current input. In this way,
  <math|z<rsub|T>> does not depend on some <math|z<rsub|t>>. In other words,
  the \Pdepth\Q is reduced.

  <subsection|Highway>

  Inspired by long short-term memory, in the May of 2015, Rupesh Kumar
  Srivastava, Klaus Greff, and Jürgen Schmidhuber suggested a similar method
  for feed-forward neural network that dynamically omits some hidden
  layers.<\footnote>
    To be precisely, the hidden layer is not completely omitted, but gated.
    For details, see <hlink|<with|font-shape|italic|Highway Networks>|Highway
    Networks>.
  </footnote> The effective depth is thus reduced. Again, the model is
  trained to determine which hidden layers are to be omitted based on the
  current input.

  <subsection|Batch Normalization>

  Another technique that contributes to controlling gradients is
  normalization. But, it was initially motivated by another problem called
  <hlink|<with|font-shape|italic|internal covariate
  shift>|https://en.wikipedia.org/wiki/Batch_normalization#Internal_covariate_shift>.
  During the training process, the trainable parameters and model input are
  dynamically changing. The mean value of hidden layer output may shift away
  from zero. This change, however, is hard to control, especially when the
  model becomes deep. In this situation, the shift of the hidden layer output
  will accumulate layer by layer, thus become larger and large, making the
  model unstable.

  To solve this problem, in the February of 2015, Sergey Ioffe and Christian
  Szegedy proposed a simple method that regularizes the hidden layer output,
  called <with|font-shape|italic|batch normalization>. With a batch of input
  <math|x>, we get a batch of <math|z<rsub|l>>, the hidden layer output at
  layer <math|l>. For each component <math|\<alpha\>>, we normalize
  <math|z<rsub|l><rsup|\<alpha\>>> to be

  <\equation>
    <wide|z|^><rsub|l><rsup|\<alpha\>>\<assign\><frac|z<rsub|l><rsup|\<alpha\>>-\<bbb-E\><rsub|z<rsub|l>\<sim\>\<cal-B\>><around*|[|z<rsub|l><rsup|\<alpha\>>|]>|<sqrt|Var<rsub|z<rsub|l>\<sim\>\<cal-B\>><around*|[|z<rsub|l><rsup|\<alpha\>>|]>>><label|equation:batch
    normalization>
  </equation>

  where the expectation and variance are taken on batch (denoted by
  <math|\<cal-B\>>). Then use the <math|<wide|z|^><rsub|l><rsup|\<alpha\>>>
  as the input of layer <math|l+1>.<\footnote>
    In fact, this is not the whole story. The authors introduced two
    additional trainable parameters <math|\<gamma\>> and <math|\<beta\>>,
    initialized to <math|1> and <math|0> respectively, such that

    <\equation*>
      <wide|z|^><rsub|l><rsup|\<alpha\>>\<assign\>\<gamma\>
      <frac|z<rsub|l><rsup|\<alpha\>>-\<bbb-E\><around*|[|z<rsub|l><rsup|\<alpha\>>|]>|<sqrt|Var<around*|[|z<rsub|l><rsup|\<alpha\>>|]>>>+\<beta\>.
    </equation*>

    This, however, does not affect the basic idea of normalization. For
    details, see the <hlink|original paper|https://arxiv.org/abs/1502.03167>.
  </footnote>

  <subsection|Layer Normalization>

  Later on, in the July of 2016, Jimmy Lei Ba and others proposed another
  normalization technique called <with|font-shape|italic|layer
  normalization>. In this method, the expectation and variance are computed
  on the neurons on the same layer. Explicitly, they modified the expectation
  <math|\<bbb-E\><rsub|z<rsub|l>\<sim\>\<cal-B\>><around*|[|z<rsub|l><rsup|\<alpha\>>|]>>
  to be <math|\<bbb-E\><rsub|\<alpha\>><around*|[|z<rsub|l>|]>>, which is the
  expectation taken on the index <math|\<alpha\>>. The same for variance. In
  this way, the normalization can be established even when data are not
  grouped into batches.<\footnote>
    The normalization layer was initially designed for recurrent neural
    network, where batch normalization cannot be properly used. For details,
    see the <hlink|original paper|https://arxiv.org/abs/1607.06450>.
  </footnote>

  <subsection|Residual Neural Network>

  Parallel to the normalization technique, the highway method was continually
  improved. In the December of 2015, Kaiming He and others simplified the
  original highway structure. They dropped the gate, which was used for
  determining which hidden layers are to be omitted. Before passing the
  output of hidden layer <math|l> to the successive hidden layer as input,
  the input of hidden layer <math|l> is added to its output, and the addition
  as a whole is passed to the successive hidden layer. Explicitly, using the
  language of feed-forward neural network, it is

  <\equation*>
    z<rsub|l><rsup|\<alpha\>>=z<rsup|\<alpha\>><rsub|l-1>+f<rsub|l><around*|(|<big|sum><rsub|\<beta\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>
    z<rsub|l-1><rsup|\<beta\>>+b<rsub|l><rsup|\<alpha\>>|)>.
  </equation*>

  In addition, they employed batch normalization for the input of each layer.
  Thus, the whole story becomes

  <\equation*>
    z<rsub|l><rsup|\<alpha\>>=z<rsup|\<alpha\>><rsub|l-1>+f<rsub|l><around*|(|<big|sum><rsub|\<beta\>=1><rsup|n<rsub|l>><around*|(|W<rsub|l>|)><rsup|\<alpha\>><rsub|\<beta\>>
    <wide|z|^><rsub|l-1><rsup|\<beta\>>+b<rsub|l><rsup|\<alpha\>>|)>,
  </equation*>

  where <math|<wide|z|^><rsub|l-1>> is given by equation
  (<reference|equation:batch normalization>). With this
  <with|font-shape|italic|residual structure>, a model can have hundreds of
  hidden layers. While building the model, they also employed batch
  normalization.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|1.5.4|4>>
    <associate|auto-11|<tuple|1.6|4>>
    <associate|auto-12|<tuple|1.7|5>>
    <associate|auto-13|<tuple|1.7.1|5>>
    <associate|auto-14|<tuple|1.7.2|6>>
    <associate|auto-15|<tuple|1.7.3|6>>
    <associate|auto-16|<tuple|1.7.4|6>>
    <associate|auto-17|<tuple|1.8|7>>
    <associate|auto-18|<tuple|1.8.1|7>>
    <associate|auto-19|<tuple|1.8.2|7>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-20|<tuple|1.8.3|7>>
    <associate|auto-21|<tuple|1.8.4|7>>
    <associate|auto-22|<tuple|1.8.5|8>>
    <associate|auto-23|<tuple|1.8.6|8>>
    <associate|auto-24|<tuple|1.8.7|8>>
    <associate|auto-3|<tuple|1.2|2>>
    <associate|auto-4|<tuple|1.3|2>>
    <associate|auto-5|<tuple|1.4|3>>
    <associate|auto-6|<tuple|1.5|3>>
    <associate|auto-7|<tuple|1.5.1|3>>
    <associate|auto-8|<tuple|1.5.2|3>>
    <associate|auto-9|<tuple|1.5.3|4>>
    <associate|equation:batch normalization|<tuple|1.3|8>>
    <associate|equation:gradient chain-rule|<tuple|1.2|4>>
    <associate|footnote-1.1|<tuple|1.1|1>>
    <associate|footnote-1.2|<tuple|1.2|1>>
    <associate|footnote-1.3|<tuple|1.3|5>>
    <associate|footnote-1.4|<tuple|1.4|6>>
    <associate|footnote-1.5|<tuple|1.5|7>>
    <associate|footnote-1.6|<tuple|1.6|8>>
    <associate|footnote-1.7|<tuple|1.7|8>>
    <associate|footnr-1.1|<tuple|1.1|1>>
    <associate|footnr-1.2|<tuple|1.2|1>>
    <associate|footnr-1.3|<tuple|1.3|5>>
    <associate|footnr-1.4|<tuple|1.4|6>>
    <associate|footnr-1.5|<tuple|1.5|7>>
    <associate|footnr-1.6|<tuple|1.6|8>>
    <associate|footnr-1.7|<tuple|1.7|8>>
    <associate|section: Normalization|<tuple|1.7.3|6>>
    <associate|section: Residual Structure|<tuple|1.7.1|5>>
    <associate|section: Simple Baseline Model|<tuple|1.5.1|3>>
    <associate|section: Techniques Are Combined for Controlling the
    Gradients|<tuple|1.7|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>When
      Neural Network Becomes Deep> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Enlarging Model Increases Performance (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.2<space|2spc>(TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      1.3<space|2spc>Draft <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      1.4<space|2spc>Enlarging Model Is Efficient for Increasing Its
      Representability (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      1.5<space|2spc>Increasing Depth Is More Efficient for Enlarging Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      <with|par-left|<quote|1tab>|1.5.1<space|2spc>Simple Baseline Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|1.5.2<space|2spc>Increasing Depth
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|1.5.3<space|2spc>Increasing Width
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.5.4<space|2spc>Summary: Increasing Depth
      v.s. Increasing Width <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      1.6<space|2spc>Increasing Depth Makes It Hard to Control the Gradients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      1.7<space|2spc>Techniques Are Combined for Controlling the Gradients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      <with|par-left|<quote|1tab>|1.7.1<space|2spc>Residual Structure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|1.7.2<space|2spc>Regularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|1.7.3<space|2spc>Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|1.7.4<space|2spc>Summary: Gradients Are
      Bounded by the Techniques Altogether
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      1.8<space|2spc>A Little History about Depth
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      <with|par-left|<quote|1tab>|1.8.1<space|2spc>Regularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|1.8.2<space|2spc>Recurrent Neural Network
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|1.8.3<space|2spc>Long Short-Term Memory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|1.8.4<space|2spc>Highway
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|1tab>|1.8.5<space|2spc>Batch Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|1tab>|1.8.6<space|2spc>Layer Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|1.8.7<space|2spc>Residual Neural Network
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>
    </associate>
  </collection>
</auxiliary>