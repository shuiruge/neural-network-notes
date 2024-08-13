<TeXmacs|2.1>

<style|book>

<\body>
  <doc-data|<doc-title|Evolution of Neural Network>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>From
    Perceptron to Feed-Forward Neural Network>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    1.1<space|2spc>Perceptron Is an Abstracted Mathematical Model of Neural
    Network <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2>

    <with|par-left|1tab|1.1.1<space|2spc>Biology of Neuron
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <with|par-left|1tab|1.1.2<space|2spc>Mathematical Abstraction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>>

    1.2<space|2spc>Perceptron Has Not Sufficient Capacity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>

    1.3<space|2spc>Simulation Is a Kind of Data-Fitting
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>

    1.4<space|2spc>With Hidden Layers, Model Can Fit Any Dataset
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    <with|par-left|1tab|1.4.1<space|2spc>Activation Function
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <with|par-left|1tab|1.4.2<space|2spc>Hidden Layer
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Gradient
    Based Optimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11><vspace|0.5fn>

    2.1<space|2spc>The Objective Is the Expected Distance Between Prediction
    and Truth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>

    2.2<space|2spc>Going Along Gradient Direction May Not Be Optimal (TODO)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>

    2.3<space|2spc>Validation Helps Avoid the Instability of Optimization
    (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>

    2.4<space|2spc>Moment Helps Avoid Stochastic Disturbance (TODO)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>

    2.5<space|2spc>A Little History about Optimizer (TODO)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>

    2.6<space|2spc>Gradient Is Computed by Vector-Jacobian Product
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>

    <with|par-left|1tab|2.6.1<space|2spc>From Feed-Forward Neural Network to
    General Composition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|2.6.2<space|2spc>Vector-Jacobian Product
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <with|par-left|1tab|2.6.3<space|2spc>Forward Propagation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    <with|par-left|1tab|2.6.4<space|2spc>Backward Propagation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>When
    Neural Network Becomes Deep> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23><vspace|0.5fn>

    3.1<space|2spc>Enlarging Model Is Efficient for Increasing Its
    Representability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>

    3.2<space|2spc>Increasing Depth Is More Efficient for Enlarging Model
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>

    <with|par-left|1tab|3.2.1<space|2spc>Simple Baseline Model
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1tab|3.2.2<space|2spc>Increasing Depth
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1tab|3.2.3<space|2spc>Increasing Width
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1tab|3.2.4<space|2spc>Summary: Increasing Depth v.s.
    Increasing Width <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    3.3<space|2spc>Increasing Depth Makes It Hard to Control the Gradients
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>

    3.4<space|2spc>Techniques Are Combined for Controlling the Gradients
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31>

    <with|par-left|1tab|3.4.1<space|2spc>Residual Structure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    <with|par-left|1tab|3.4.2<space|2spc>Regularization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    <with|par-left|1tab|3.4.3<space|2spc>Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <with|par-left|1tab|3.4.4<space|2spc>Summary: Gradients Are Bounded by
    the Techniques Altogether <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>>

    3.5<space|2spc>A Little History about Depth
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>

    <with|par-left|1tab|3.5.1<space|2spc>Regularization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>>

    <with|par-left|1tab|3.5.2<space|2spc>Recurrent Neural Network
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>>

    <with|par-left|1tab|3.5.3<space|2spc>Long Short-Term Memory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <with|par-left|1tab|3.5.4<space|2spc>Highway
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>>

    <with|par-left|1tab|3.5.5<space|2spc>Batch Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>>

    <with|par-left|1tab|3.5.6<space|2spc>Layer Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|1tab|3.5.7<space|2spc>Residual Neural Network
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Natural
    Language Processing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44><vspace|0.5fn>

    4.1<space|2spc>Vector Representation of Words
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>

    <with|par-left|1tab|4.1.1<space|2spc>Knowing a Word by the Company It
    Keeps <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>>

    <with|par-left|1tab|4.1.2<space|2spc>Context-Dependent/Independent Vector
    Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    <with|par-left|1tab|4.1.3<space|2spc>Example: Bidirectional Encoder
    Representations from Transformers <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-48>>

    <with|par-left|1tab|4.1.4<space|2spc>Application: Named-Entity
    Recognition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-49>>

    4.2<space|2spc>Representation of Sentences
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>

    4.3<space|2spc>Machine Translation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-51>

    4.4<space|2spc>Language Modeling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>

    4.5<space|2spc>Drafts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>

    <with|par-left|1tab|4.5.1<space|2spc><with|font-family|tt|language|verbatim|Word2vec>
    Is a Simple Model that Implements the Firth's Idea
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>>

    <with|par-left|1tab|4.5.2<space|2spc><with|font-family|tt|language|verbatim|Word2vec>
    in Practice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>>

    <with|par-left|1tab|4.5.3<space|2spc>Lost and Found
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    4.6<space|2spc>The Second Example: People in a Park
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>
  </table-of-contents>

  <include|perceptron.tm>

  <include|optimization.tm>

  <include|depth.tm>

  <include|nlp.tm>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|7|perceptron.tm>>
    <associate|auto-10|<tuple|1.4.2|10|perceptron.tm>>
    <associate|auto-11|<tuple|2|11|optimization.tm>>
    <associate|auto-12|<tuple|2.1|11|optimization.tm>>
    <associate|auto-13|<tuple|2.2|11|optimization.tm>>
    <associate|auto-14|<tuple|2.1|11|optimization.tm>>
    <associate|auto-15|<tuple|2.3|12|optimization.tm>>
    <associate|auto-16|<tuple|2.4|12|optimization.tm>>
    <associate|auto-17|<tuple|2.5|12|optimization.tm>>
    <associate|auto-18|<tuple|2.6|12|optimization.tm>>
    <associate|auto-19|<tuple|2.6.1|12|optimization.tm>>
    <associate|auto-2|<tuple|1.1|7|perceptron.tm>>
    <associate|auto-20|<tuple|2.6.2|13|optimization.tm>>
    <associate|auto-21|<tuple|2.6.3|13|optimization.tm>>
    <associate|auto-22|<tuple|2.6.4|13|optimization.tm>>
    <associate|auto-23|<tuple|3|15|depth.tm>>
    <associate|auto-24|<tuple|3.1|15|depth.tm>>
    <associate|auto-25|<tuple|3.2|15|depth.tm>>
    <associate|auto-26|<tuple|3.3|16|depth.tm>>
    <associate|auto-27|<tuple|3.4|16|depth.tm>>
    <associate|auto-28|<tuple|3.4.1|16|depth.tm>>
    <associate|auto-29|<tuple|3.4.2|16|depth.tm>>
    <associate|auto-3|<tuple|1.1.1|7|perceptron.tm>>
    <associate|auto-30|<tuple|3.4.3|17|depth.tm>>
    <associate|auto-31|<tuple|3.4.4|17|depth.tm>>
    <associate|auto-32|<tuple|3.5|17|depth.tm>>
    <associate|auto-33|<tuple|3.6|18|depth.tm>>
    <associate|auto-34|<tuple|3.6.1|18|depth.tm>>
    <associate|auto-35|<tuple|3.6.2|19|depth.tm>>
    <associate|auto-36|<tuple|3.6.3|19|depth.tm>>
    <associate|auto-37|<tuple|3.6.4|19|depth.tm>>
    <associate|auto-38|<tuple|3.7|20|depth.tm>>
    <associate|auto-39|<tuple|3.7.1|20|depth.tm>>
    <associate|auto-4|<tuple|1.1|8|perceptron.tm>>
    <associate|auto-40|<tuple|3.7.2|20|depth.tm>>
    <associate|auto-41|<tuple|3.7.3|20|depth.tm>>
    <associate|auto-42|<tuple|3.7.4|20|depth.tm>>
    <associate|auto-43|<tuple|3.7.5|21|depth.tm>>
    <associate|auto-44|<tuple|3.7.6|21|depth.tm>>
    <associate|auto-45|<tuple|3.7.7|21|depth.tm>>
    <associate|auto-46|<tuple|4|23|nlp.tm>>
    <associate|auto-47|<tuple|4.1|23|nlp.tm>>
    <associate|auto-48|<tuple|4.1.1|23|nlp.tm>>
    <associate|auto-49|<tuple|4.1.2|23|nlp.tm>>
    <associate|auto-5|<tuple|1.1.2|8|perceptron.tm>>
    <associate|auto-50|<tuple|4.1.3|24|nlp.tm>>
    <associate|auto-51|<tuple|4.1.4|25|nlp.tm>>
    <associate|auto-52|<tuple|4.2|25|nlp.tm>>
    <associate|auto-53|<tuple|4.3|25|nlp.tm>>
    <associate|auto-54|<tuple|4.4|25|nlp.tm>>
    <associate|auto-55|<tuple|4.5|25|nlp.tm>>
    <associate|auto-56|<tuple|4.5.1|25|nlp.tm>>
    <associate|auto-57|<tuple|4.5.2|26|nlp.tm>>
    <associate|auto-58|<tuple|4.5.3|26|nlp.tm>>
    <associate|auto-59|<tuple|4.6|26|nlp.tm>>
    <associate|auto-6|<tuple|1.2|9|perceptron.tm>>
    <associate|auto-7|<tuple|1.3|9|perceptron.tm>>
    <associate|auto-8|<tuple|1.4|9|perceptron.tm>>
    <associate|auto-9|<tuple|1.4.1|9|perceptron.tm>>
    <associate|equation:batch normalization|<tuple|3.3|21|depth.tm>>
    <associate|equation:general model 0|<tuple|4.1|23|nlp.tm>>
    <associate|equation:gradient chain-rule|<tuple|3.2|17|depth.tm>>
    <associate|equation:loss function|<tuple|2.1|11|optimization.tm>>
    <associate|equation:vector representation|<tuple|4.2|24|nlp.tm>>
    <associate|equation:word2vec|<tuple|4.5|25|nlp.tm>>
    <associate|figure: gradient direction is not
    optimal|<tuple|2.1|11|optimization.tm>>
    <associate|footnote-1.1|<tuple|1.1|7|perceptron.tm>>
    <associate|footnote-1.2|<tuple|1.2|9|perceptron.tm>>
    <associate|footnote-1.3|<tuple|1.3|9|perceptron.tm>>
    <associate|footnote-1.4|<tuple|1.4|9|perceptron.tm>>
    <associate|footnote-1.5|<tuple|1.5|9|perceptron.tm>>
    <associate|footnote-1.6|<tuple|1.6|9|perceptron.tm>>
    <associate|footnote-1.7|<tuple|1.7|10|perceptron.tm>>
    <associate|footnote-1.8|<tuple|1.8|10|perceptron.tm>>
    <associate|footnote-2.1|<tuple|2.1|12|optimization.tm>>
    <associate|footnote-3.1|<tuple|3.1|18|depth.tm>>
    <associate|footnote-3.2|<tuple|3.2|19|depth.tm>>
    <associate|footnote-3.3|<tuple|3.3|20|depth.tm>>
    <associate|footnote-3.4|<tuple|3.4|21|depth.tm>>
    <associate|footnote-3.5|<tuple|3.5|21|depth.tm>>
    <associate|footnote-4.1|<tuple|4.1|23|nlp.tm>>
    <associate|footnote-4.2|<tuple|4.2|24|nlp.tm>>
    <associate|footnote-4.3|<tuple|4.3|24|nlp.tm>>
    <associate|footnote-4.4|<tuple|4.4|25|nlp.tm>>
    <associate|footnote-4.5|<tuple|4.5|25|nlp.tm>>
    <associate|footnr-1.1|<tuple|1.1|7|perceptron.tm>>
    <associate|footnr-1.2|<tuple|1.2|9|perceptron.tm>>
    <associate|footnr-1.3|<tuple|1.3|9|perceptron.tm>>
    <associate|footnr-1.4|<tuple|1.4|9|perceptron.tm>>
    <associate|footnr-1.5|<tuple|1.5|9|perceptron.tm>>
    <associate|footnr-1.6|<tuple|1.6|9|perceptron.tm>>
    <associate|footnr-1.7|<tuple|1.7|10|perceptron.tm>>
    <associate|footnr-1.8|<tuple|1.8|10|perceptron.tm>>
    <associate|footnr-2.1|<tuple|2.1|12|optimization.tm>>
    <associate|footnr-3.1|<tuple|3.1|18|depth.tm>>
    <associate|footnr-3.2|<tuple|3.2|19|depth.tm>>
    <associate|footnr-3.3|<tuple|3.3|20|depth.tm>>
    <associate|footnr-3.4|<tuple|3.4|21|depth.tm>>
    <associate|footnr-3.5|<tuple|3.5|21|depth.tm>>
    <associate|footnr-4.1|<tuple|4.1|23|nlp.tm>>
    <associate|footnr-4.2|<tuple|4.2|24|nlp.tm>>
    <associate|footnr-4.3|<tuple|4.3|24|nlp.tm>>
    <associate|footnr-4.4|<tuple|4.4|25|nlp.tm>>
    <associate|footnr-4.5|<tuple|4.5|25|nlp.tm>>
    <associate|part:depth.tm|<tuple|2.6.4|15>>
    <associate|part:nlp.tm|<tuple|3.7.7|23>>
    <associate|part:optimization.tm|<tuple|1.8|11>>
    <associate|part:perceptron.tm|<tuple|?|7>>
    <associate|perceptron|<tuple|1.1|8|perceptron.tm>>
    <associate|section: Simple Baseline Model|<tuple|3.4.1|16|depth.tm>>
    <associate|section: Simulation Is a Kind of
    Data-Fitting|<tuple|1.3|9|perceptron.tm>>
    <associate|section: With Hidden Layers, Model Can Fit Any
    Dataset|<tuple|1.4|9|perceptron.tm>>
    <associate|section: loss function|<tuple|2.1|11|optimization.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.1>|>
        <locus|<id|%37ACF38-5DBD328--6D4DEDDE>|<link|hyperlink|<id|%37ACF38-5DBD328--6D4DEDDE>|<url|https://en.wikipedia.org/wiki/Neuron#/media/File:Chemical_synapse_schema_cropped.jpg>>|This
        figure> illustrates the shape of a neuron, and how impulses propagate
        from one neuron to another.
      </surround>|<pageref|auto-4>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2.1>|>
        The black dash curves represents the contour map of a function
        <with|mode|<quote|math>|f:\<bbb-R\><rsup|2>\<rightarrow\>\<bbb-R\>>.
        The red star is the top or <with|mode|<quote|math>|argmin f>. The
        green star is where you are. The green lines represent the negative
        direction of gradient based on the contour map and its decomposition
        along horizontal and vertical directions.
      </surround>|<pageref|auto-14>>
    </associate>
    <\associate|parts>
      <tuple|perceptron.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|optimization.tm|chapter-nr|1|section-nr|4|subsection-nr|2>

      <tuple|depth.tm|chapter-nr|2|section-nr|6|subsection-nr|4>

      <tuple|nlp.tm|chapter-nr|3|section-nr|7|subsection-nr|7>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>From
      Perceptron to Feed-Forward Neural Network>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      1.1<space|2spc>Perceptron Is an Abstracted Mathematical Model of Neural
      Network <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <with|par-left|<quote|1tab>|1.1.1<space|2spc>Biology of Neuron
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.1.2<space|2spc>Mathematical Abstraction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      1.2<space|2spc>Perceptron Has Not Sufficient Capacity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      1.3<space|2spc>Simulation Is a Kind of Data-Fitting
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      1.4<space|2spc>With Hidden Layers, Model Can Fit Any Dataset
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <with|par-left|<quote|1tab>|1.4.1<space|2spc>Activation Function
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|1tab>|1.4.2<space|2spc>Hidden Layer
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Gradient
      Based Optimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.5fn>

      2.1<space|2spc>The Objective Is the Expected Distance Between
      Prediction and Truth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      2.2<space|2spc>Going Along Gradient Direction May Not Be Optimal (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      2.3<space|2spc>Validation Helps Avoid the Instability of Optimization
      (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      2.4<space|2spc>Moment Helps Avoid Stochastic Disturbance (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      2.5<space|2spc>A Little History about Optimizer (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      2.6<space|2spc>Gradient Is Computed by Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      <with|par-left|<quote|1tab>|2.6.1<space|2spc>From Feed-Forward Neural
      Network to General Composition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|2.6.2<space|2spc>Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|2.6.3<space|2spc>Forward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|1tab>|2.6.4<space|2spc>Backward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>When
      Neural Network Becomes Deep> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23><vspace|0.5fn>

      3.1<space|2spc>(TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      3.2<space|2spc>Draft <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      3.3<space|2spc>Enlarging Model Is Efficient for Increasing Its
      Representability (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      3.4<space|2spc>Increasing Depth Is More Efficient for Enlarging Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      <with|par-left|<quote|1tab>|3.4.1<space|2spc>Simple Baseline Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|3.4.2<space|2spc>Increasing Depth
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      <with|par-left|<quote|1tab>|3.4.3<space|2spc>Increasing Width
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|1tab>|3.4.4<space|2spc>Summary: Increasing Depth
      v.s. Increasing Width <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>

      3.5<space|2spc>Increasing Depth Makes It Hard to Control the Gradients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>

      3.6<space|2spc>Techniques Are Combined for Controlling the Gradients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>

      <with|par-left|<quote|1tab>|3.6.1<space|2spc>Residual Structure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|1tab>|3.6.2<space|2spc>Regularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|1tab>|3.6.3<space|2spc>Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|1tab>|3.6.4<space|2spc>Summary: Gradients Are
      Bounded by the Techniques Altogether
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      3.7<space|2spc>A Little History about Depth
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      <with|par-left|<quote|1tab>|3.7.1<space|2spc>Regularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|1tab>|3.7.2<space|2spc>Recurrent Neural Network
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      <with|par-left|<quote|1tab>|3.7.3<space|2spc>Long Short-Term Memory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|1tab>|3.7.4<space|2spc>Highway
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1tab>|3.7.5<space|2spc>Batch Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      <with|par-left|<quote|1tab>|3.7.6<space|2spc>Layer Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      <with|par-left|<quote|1tab>|3.7.7<space|2spc>Residual Neural Network
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Natural
      Language Processing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46><vspace|0.5fn>

      4.1<space|2spc>Representation of Words
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>

      <with|par-left|<quote|1tab>|4.1.1<space|2spc>Knowing a Word by the
      Company It Keeps <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>>

      <with|par-left|<quote|1tab>|4.1.2<space|2spc>Context-Dependent/Independent
      Vector Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>>

      <with|par-left|<quote|1tab>|4.1.3<space|2spc>Example: Bidirectional
      Encoder Representations from Transformers
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>>

      <with|par-left|<quote|1tab>|4.1.4<space|2spc>Application: Named-Entity
      Recognition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>>

      4.2<space|2spc>Representation of Sentences
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>

      4.3<space|2spc>Machine Translation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>

      4.4<space|2spc>Language Modeling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>

      4.5<space|2spc>Drafts <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>

      <with|par-left|<quote|1tab>|4.5.1<space|2spc><with|font-family|<quote|tt>|language|<quote|verbatim>|Word2vec>
      Is a Simple Model that Implements the Firth's Idea
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1tab>|4.5.2<space|2spc><with|font-family|<quote|tt>|language|<quote|verbatim>|Word2vec>
      in Practice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|1tab>|4.5.3<space|2spc>Lost and Found
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>

      4.6<space|2spc>The Second Example: People in a Park
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>
    </associate>
  </collection>
</auxiliary>