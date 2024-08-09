<TeXmacs|2.1>

<style|<tuple|generic|literate>>

<\body>
  <chapter|Implementation of Neural Network>

  <section|Computing Derivatives by Vector-Jacobian-Product (TODO)>

  Let <math|f:\<bbb-R\><rsup|m>\<rightarrow\>\<bbb-R\><rsup|n>>, the
  derivative of <math|f> at a given point <math|x\<in\>\<bbb-R\><rsup|n>> is
  a <math|m\<times\>n> matrix, involving <math|m\<times\>n> float numbers.
  When both <math|m> and <math|n> are great,\ 

  <section|Implementation of Activation Functions (TODO)>

  \;

  <\cpp-chunk|actfn.h|false|true>
    #include \<less\>stddef.h\<gtr\> \ // size_t
  </cpp-chunk>

  <\cpp-chunk|actfn.c|false|true>
    #include \<less\>math.h\<gtr\>

    #include "actfn.h"
  </cpp-chunk>

  <\cpp-chunk|actfn.h|true|true>
    void linear(float* y, float* x, size_t dim);

    void linear_deriv(float* dy, float* y, float* x, size_t dim);
  </cpp-chunk>

  <\cpp-chunk|actfn.c|true|true>
    void linear(float* y, float* x, size_t dim) {

    \ \ for (int i = 0; i \<less\> dim; i++) {

    \ \ \ \ y[i] = x[i];

    \ \ }

    }

    \;

    void linear_deriv(float* dy, float* y, float* x, size_t dim) {

    \ \ for (int i = 0; i \<less\> dim; i++) {

    \ \ \ \ dy[i] = 1;

    \ \ }

    }
  </cpp-chunk>

  <\cpp-chunk|actfn.h|true|true>
    void sigmoid(float* y, float* x, size_t dim);

    void sigmoid_deriv(float* dy, float* y, float* x, size_t dim);
  </cpp-chunk>

  <\cpp-chunk|actfn.c|true|true>
    void sigmoid(float* y, float* x, size_t dim) {

    \ \ for (int i = 0; i \<less\> dim; i++) {

    \ \ \ \ y[i] = 1 / (1 + exp(-x[i]));

    \ \ }

    }

    \;

    void sigmoid_deriv(float* dy, float* y, size_t dim) {

    \ \ for (int i = 0; i \<less\> dim; i++) {

    \ \ \ \ dy[i] = y[i] * (1 - y[i]);

    \ \ }

    }
  </cpp-chunk>

  <\cpp-chunk|actfn.h|true|true>
    void relu(float* y, float* x, size_t dim);

    void relu_deriv(float* dy, float* y, float* x, size_t dim);
  </cpp-chunk>

  <\cpp-chunk|actfn.c|true|true>
    void relu(float* y, float* x, size_t dim) {

    \ \ for (int i = 0; i \<less\> dim; i++) {

    \ \ \ \ if (x[i] \<less\> 0) {

    \ \ \ \ \ \ y[i] = 0;

    \ \ \ \ } else {

    \ \ \ \ \ \ y[i] = x[i];

    \ \ \ \ }

    \ \ }

    }

    \;

    void relu_deriv(float* dy, fooat* y, float* x, size_t dim) {

    \ \ for (int i = 0; i \<less\> dim; i++) {

    \ \ \ \ if (x[i] \<less\> 0) {

    \ \ \ \ \ \ dy[i] = 0;

    \ \ \ \ } else {

    \ \ \ \ \ \ dy[i] = 1;

    \ \ \ \ }

    \ \ }

    }
  </cpp-chunk>

  <\cpp-chunk|actfn.h|true|false>
    typedef enum {

    \ \ LINEAR,

    \ \ SIGMOID,

    \ \ RELU

    } actfn_t;

    \;

    void (*get_actfn(actfn_t)) (float*, float*, float*, size_t);

    void (*get_actfn_deriv(actfn_t)) (float*, float*, float*, float*,
    size_t);
  </cpp-chunk>

  <\cpp-chunk|actfn.c|true|false>
    void (*get_actfn(actfn_t actfn)) (float*, float*, float*, size_t) {

    \ \ switch (actfn) {

    \ \ \ case 0:

    \ \ \ \ \ return linear;

    \ \ \ case 1;

    \ \ \ \ \ return sigmoid;

    \ \ \ case 2;

    \ \ \ \ \ return relu;

    \ \ \ }

    \ \ \ return NULL;

    }

    \;

    void (*get_actfn_deriv(actfn_t actfn)) (float*, float*, float*, float*,
    size_t) {

    \ \ switch (actfn) {

    \ \ \ case 0:

    \ \ \ \ \ return linear_deriv;

    \ \ \ case 1;

    \ \ \ \ \ return sigmoid_deriv;

    \ \ \ case 2;

    \ \ \ \ \ return relu_deriv;

    \ \ \ }

    \ \ \ return NULL;

    }
  </cpp-chunk>

  <section|Implementation of Perceptron (TODO)>

  Recall that a perceptron has the form <math|y<rsup|\<alpha\>>=f<around*|(|<big|sum><rsub|\<beta\>=1><rsup|n>W<rsup|\<alpha\>><rsub|\<beta\>>
  x<rsup|\<beta\>>+b<rsup|\<alpha\>>|)>>. We implement this function, as well
  as <math|\<partial\>y/\<partial\>x>, <math|\<partial\>y/\<partial\>W>, and
  <math|\<partial\>y/\<partial\>b>.

  <\cpp-chunk|perceptron.h|false|true>
    #include \<less\>stddef.h\<gtr\> \ // size_t

    #include "actfn.h"

    \;

    typedef struct {

    \ \ // hyper-parameters

    \ \ size_t input_dim;

    \ \ size_t output_dim;

    \ \ actfn_t actfn;

    \ \ // parameters

    \ \ float* weight;

    \ \ float* bias;

    \ \ // caches for computing derivatives

    \ \ float* act;

    \ \ float* output;

    } Perceptron;
  </cpp-chunk>

  <\cpp-chunk|perceptron.h|true|false>
    Perceptron* create_perceptron(size_t input_dim, size_t output_dim,
    actfn_t actfn);

    int destroy_perceptron(Perceptron*);
  </cpp-chunk>

  <section|Implementation of Normalization (TODO)>

  <section|Implementation of Residual Block (TODO)>

  <section|Implementation of Feed-Forward Neural Network (TODO)>

  <\cpp-chunk|test.c|false|false>
    //#include "actfn.h"

    #include "perceptron.h"

    \;

    int main() {

    \ \ return 0;

    }
  </cpp-chunk>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-2|<tuple|1|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-3|<tuple|2|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-4|<tuple|3|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-5|<tuple|4|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-6|<tuple|5|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|auto-7|<tuple|6|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk--1|<tuple||?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-.c-1|<tuple|.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-.h-1|<tuple|.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-a.c-1|<tuple|a.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-a.h-1|<tuple|a.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ac.c-1|<tuple|ac.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ac.h-1|<tuple|ac.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-act.c-1|<tuple|act.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-act.h-1|<tuple|act.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actf.c-1|<tuple|actf.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actf.h-1|<tuple|actf.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.c-1|<tuple|actfn.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.c-2|<tuple|actfn.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.c-3|<tuple|actfn.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.c-4|<tuple|actfn.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.c-5|<tuple|actfn.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.h-1|<tuple|actfn.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.h-2|<tuple|actfn.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.h-3|<tuple|actfn.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.h-4|<tuple|actfn.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfn.h-5|<tuple|actfn.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfu.c-1|<tuple|actfu.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfu.h-1|<tuple|actfu.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfun.c-1|<tuple|actfun.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfun.c-2|<tuple|actfun.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfun.c-3|<tuple|actfun.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfun.h-1|<tuple|actfun.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfun.h-2|<tuple|actfun.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfun.h-3|<tuple|actfun.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfuns.c-1|<tuple|actfuns.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-actfuns.h-1|<tuple|actfuns.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-acti.c-1|<tuple|acti.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-acti.h-1|<tuple|acti.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activ.c-1|<tuple|activ.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activ.h-1|<tuple|activ.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activa.c-1|<tuple|activa.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activa.h-1|<tuple|activa.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activat.h-1|<tuple|activat.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activati.c-1|<tuple|activati.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activati.h-1|<tuple|activati.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activatio.c-1|<tuple|activatio.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activatio.h-1|<tuple|activatio.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation.c-1|<tuple|activation.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation.h-1|<tuple|activation.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_.c-1|<tuple|activation_.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_f.c-1|<tuple|activation_f.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_fu.c-1|<tuple|activation_fu.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_fun.c-1|<tuple|activation_fun.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_func.c-1|<tuple|activation_func.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_funct.c-1|<tuple|activation_funct.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_functi.c-1|<tuple|activation_functi.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_functio.c-1|<tuple|activation_functio.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_function.c-1|<tuple|activation_function.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-activation_functions.c-1|<tuple|activation_functions.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ceptron.c-1|<tuple|ceptron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ceptron.h-1|<tuple|ceptron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-eptron.c-1|<tuple|eptron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-eptron.h-1|<tuple|eptron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-erceptron.c-1|<tuple|erceptron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-erceptron.h-1|<tuple|erceptron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-n.c-1|<tuple|n.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-n.h-1|<tuple|n.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-on.c-1|<tuple|on.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-on.h-1|<tuple|on.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-p-1|<tuple|p|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-pe-1|<tuple|pe|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-per-1|<tuple|per|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perc-1|<tuple|perc|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perce-1|<tuple|perce|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-percep-1|<tuple|percep|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-percept-1|<tuple|percept|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptr-1|<tuple|perceptr|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptro-1|<tuple|perceptro|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptron-1|<tuple|perceptron|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptron.-1|<tuple|perceptron.|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptron.c-1|<tuple|perceptron.c|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptron.h-1|<tuple|perceptron.h|1|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-perceptron.h-2|<tuple|perceptron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ptron.c-1|<tuple|ptron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ptron.h-1|<tuple|ptron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-rceptron.c-1|<tuple|rceptron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-rceptron.h-1|<tuple|rceptron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ron.c-1|<tuple|ron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-ron.h-1|<tuple|ron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-t-1|<tuple|t|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-te-1|<tuple|te|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-tes-1|<tuple|tes|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-test-1|<tuple|test|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-test.-1|<tuple|test.|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-test.c-1|<tuple|test.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-test.h-1|<tuple|test.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-test_perceptron.c-1|<tuple|test_perceptron.c|2|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-tron.c-1|<tuple|tron.c|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
    <associate|chunk-tron.h-1|<tuple|tron.h|?|../../.TeXmacs/texts/scratch/no_name_3.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Implementation
      of Feed-Forward Neural Network> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Computing Derivatives by
      Vector-Jacobian-Product <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Implementation of Perceptron
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>
    </associate>
  </collection>
</auxiliary>