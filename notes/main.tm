<TeXmacs|2.1.4>

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

    1.2<space|2spc>Perceptron Should Be Used as Inter-layer
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>

    1.3<space|2spc>Simulation Is a Kind of Data-Fitting
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Gradient
    Based Optimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8><vspace|0.5fn>

    2.1<space|2spc>The Objective Is the Expected Distance Between Prediction
    and Truth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>

    2.2<space|2spc>Moving Average Helps Avoid Stochastic Disturbance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>

    <with|par-left|1tab|2.2.1<space|2spc>Stochastic Disturbance in Loss
    Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|2.2.2<space|2spc>Gradient Descent Method
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|2.2.3<space|2spc>Moving Average of Gradient
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|2.2.4<space|2spc>Finetune Decay Factor and Learning
    Rate <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|2.2.5<space|2spc>History and Remark
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|2.2.6<space|2spc>Implementation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    2.3<space|2spc>Gradient Direction May Not Be Optimal (TODO)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>

    <with|par-left|1tab|2.3.1<space|2spc>Estimation of Gradients at Different
    Layer <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    <with|par-left|1tab|2.3.2<space|2spc>Large Difference of Gradients May
    Slow Down Optimization <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|2.3.3<space|2spc>Rescale by Standard Derivation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <with|par-left|1tab|2.3.4<space|2spc>Implementation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    2.4<space|2spc>Using the Sign of Gradient (TODO)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>

    <with|par-left|1tab|2.4.1<space|2spc>History and Remark
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|2.4.2<space|2spc>Implementation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>>

    2.5<space|2spc>Gradient Is Computed by Vector-Jacobian Product *
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>

    <with|par-left|1tab|2.5.1<space|2spc>From Feed-Forward Neural Network to
    General Composition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|1tab|2.5.2<space|2spc>Vector-Jacobian Product
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|1tab|2.5.3<space|2spc>Forward Propagation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>>

    <with|par-left|1tab|2.5.4<space|2spc>Backward Propagation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>>

    2.6<space|2spc>TODO <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>

    <with|par-left|1tab|2.6.1<space|2spc>Initialization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31>>

    <with|par-left|1tab|2.6.2<space|2spc>Normalized Vector-Jacobian Product
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    <with|par-left|1tab|2.6.3<space|2spc>Criticality
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    <with|par-left|1tab|2.6.4<space|2spc>RNN: Boundary between Order and
    Chaos <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>When
    Neural Network Becomes Deep> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35><vspace|0.5fn>

    3.1<space|2spc>Enlarging Model Increases Performance
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>

    3.2<space|2spc>(TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>

    3.3<space|2spc>Draft <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>

    3.4<space|2spc>Enlarging Model Is Efficient for Increasing Its
    Representability (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>

    3.5<space|2spc>Increasing Depth Is More Efficient for Enlarging Model
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>

    <with|par-left|1tab|3.5.1<space|2spc>Simple Baseline Model
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>>

    <with|par-left|1tab|3.5.2<space|2spc>Increasing Depth
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|1tab|3.5.3<space|2spc>Increasing Width
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>>

    <with|par-left|1tab|3.5.4<space|2spc>Summary: Increasing Depth v.s.
    Increasing Width <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44>>

    3.6<space|2spc>Increasing Depth Makes It Hard to Control the Gradients
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>

    3.7<space|2spc>Techniques Are Combined for Controlling the Gradients
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>

    <with|par-left|1tab|3.7.1<space|2spc>Residual Structure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    <with|par-left|1tab|3.7.2<space|2spc>Regularization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-48>>

    <with|par-left|1tab|3.7.3<space|2spc>Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-49>>

    <with|par-left|1tab|3.7.4<space|2spc>Summary: Gradients Are Bounded by
    the Techniques Altogether <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>>

    3.8<space|2spc>A Little History about Depth
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-51>

    <with|par-left|1tab|3.8.1<space|2spc>Regularization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>>

    <with|par-left|1tab|3.8.2<space|2spc>Recurrent Neural Network
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>>

    <with|par-left|1tab|3.8.3<space|2spc>Long Short-Term Memory
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-54>>

    <with|par-left|1tab|3.8.4<space|2spc>Highway
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>>

    <with|par-left|1tab|3.8.5<space|2spc>Batch Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    <with|par-left|1tab|3.8.6<space|2spc>Layer Normalization
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>>

    <with|par-left|1tab|3.8.7<space|2spc>Residual Neural Network
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-58>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Natural
    Language Processing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59><vspace|0.5fn>

    4.1<space|2spc>Representation of Words
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-60>

    <with|par-left|1tab|4.1.1<space|2spc>Knowing a Word by the Company It
    Keeps <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61>>

    <with|par-left|1tab|4.1.2<space|2spc>Context-Dependent/Independent Vector
    Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-62>>

    <with|par-left|1tab|4.1.3<space|2spc>Example: Bidirectional Encoder
    Representations from Transformers (BERT)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-63>>

    <with|par-left|1tab|4.1.4<space|2spc>Application: Named-Entity
    Recognition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-64>>

    4.2<space|2spc>Representation of Sentences
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-65>

    <with|par-left|1tab|4.2.1<space|2spc>From Words to Sentences: Firth's
    Idea Continued <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-66>>

    <with|par-left|1tab|4.2.2<space|2spc>Human Languages Are Recursive
    (Maybe) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-67>>

    <with|par-left|1tab|4.2.3<space|2spc>Application: Textual Similarity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-68>>

    <with|par-left|1tab|4.2.4<space|2spc>Application: Machine Translation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-69>>

    4.3<space|2spc>Language Modeling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-70>
  </table-of-contents>

  <include|perceptron.tm>

  <include|optimization.tm>

  <include|depth.tm>

  <include|nlp.tm>
</body>

<\initial>
  <\collection>
    <associate|bg-color|#c7edcc>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Perceptron Should Be Used as
    Interlayer|<tuple|1.2|9|perceptron.tm>>
    <associate|auto-1|<tuple|1|7|perceptron.tm>>
    <associate|auto-10|<tuple|2.2|11|optimization.tm>>
    <associate|auto-11|<tuple|2.2.1|11|optimization.tm>>
    <associate|auto-12|<tuple|2.2.2|12|optimization.tm>>
    <associate|auto-13|<tuple|2.2.3|12|optimization.tm>>
    <associate|auto-14|<tuple|2.2.4|12|optimization.tm>>
    <associate|auto-15|<tuple|2.2.5|13|optimization.tm>>
    <associate|auto-16|<tuple|2.2.6|13|optimization.tm>>
    <associate|auto-17|<tuple|2.3|13|optimization.tm>>
    <associate|auto-18|<tuple|2.3.1|13|optimization.tm>>
    <associate|auto-19|<tuple|2.3.2|14|optimization.tm>>
    <associate|auto-2|<tuple|1.1|7|perceptron.tm>>
    <associate|auto-20|<tuple|2.3.3|14|optimization.tm>>
    <associate|auto-21|<tuple|2.3.4|15|optimization.tm>>
    <associate|auto-22|<tuple|2.4|15|optimization.tm>>
    <associate|auto-23|<tuple|2.4.1|15|optimization.tm>>
    <associate|auto-24|<tuple|2.4.2|15|optimization.tm>>
    <associate|auto-25|<tuple|2.5|16|optimization.tm>>
    <associate|auto-26|<tuple|2.5.1|16|optimization.tm>>
    <associate|auto-27|<tuple|2.5.2|16|optimization.tm>>
    <associate|auto-28|<tuple|2.5.3|17|optimization.tm>>
    <associate|auto-29|<tuple|2.5.4|17|optimization.tm>>
    <associate|auto-3|<tuple|1.1.1|7|perceptron.tm>>
    <associate|auto-30|<tuple|2.6|17|optimization.tm>>
    <associate|auto-31|<tuple|2.6.1|17|optimization.tm>>
    <associate|auto-32|<tuple|2.6.2|18|optimization.tm>>
    <associate|auto-33|<tuple|2.6.3|19|optimization.tm>>
    <associate|auto-34|<tuple|2.6.4|19|optimization.tm>>
    <associate|auto-35|<tuple|3|21|depth.tm>>
    <associate|auto-36|<tuple|3.1|21|depth.tm>>
    <associate|auto-37|<tuple|3.2|22|depth.tm>>
    <associate|auto-38|<tuple|3.3|23|depth.tm>>
    <associate|auto-39|<tuple|3.4|23|depth.tm>>
    <associate|auto-4|<tuple|1.1|8|perceptron.tm>>
    <associate|auto-40|<tuple|3.5|23|depth.tm>>
    <associate|auto-41|<tuple|3.5.1|23|depth.tm>>
    <associate|auto-42|<tuple|3.5.2|24|depth.tm>>
    <associate|auto-43|<tuple|3.5.3|24|depth.tm>>
    <associate|auto-44|<tuple|3.5.4|24|depth.tm>>
    <associate|auto-45|<tuple|3.6|25|depth.tm>>
    <associate|auto-46|<tuple|3.7|25|depth.tm>>
    <associate|auto-47|<tuple|3.7.1|25|depth.tm>>
    <associate|auto-48|<tuple|3.7.2|26|depth.tm>>
    <associate|auto-49|<tuple|3.7.3|26|depth.tm>>
    <associate|auto-5|<tuple|1.1.2|8|perceptron.tm>>
    <associate|auto-50|<tuple|3.7.4|26|depth.tm>>
    <associate|auto-51|<tuple|3.8|27|depth.tm>>
    <associate|auto-52|<tuple|3.8.1|27|depth.tm>>
    <associate|auto-53|<tuple|3.8.2|27|depth.tm>>
    <associate|auto-54|<tuple|3.8.3|27|depth.tm>>
    <associate|auto-55|<tuple|3.8.4|28|depth.tm>>
    <associate|auto-56|<tuple|3.8.5|28|depth.tm>>
    <associate|auto-57|<tuple|3.8.6|28|depth.tm>>
    <associate|auto-58|<tuple|3.8.7|28|depth.tm>>
    <associate|auto-59|<tuple|4|29|nlp.tm>>
    <associate|auto-6|<tuple|1.2|9|perceptron.tm>>
    <associate|auto-60|<tuple|4.1|29|nlp.tm>>
    <associate|auto-61|<tuple|4.1.1|29|nlp.tm>>
    <associate|auto-62|<tuple|4.1.2|29|nlp.tm>>
    <associate|auto-63|<tuple|4.1.3|30|nlp.tm>>
    <associate|auto-64|<tuple|4.1.4|31|nlp.tm>>
    <associate|auto-65|<tuple|4.2|32|nlp.tm>>
    <associate|auto-66|<tuple|4.2.1|32|nlp.tm>>
    <associate|auto-67|<tuple|4.2.2|32|nlp.tm>>
    <associate|auto-68|<tuple|4.2.3|32|nlp.tm>>
    <associate|auto-69|<tuple|4.2.4|32|nlp.tm>>
    <associate|auto-7|<tuple|1.3|9|perceptron.tm>>
    <associate|auto-70|<tuple|4.3|32|nlp.tm>>
    <associate|auto-8|<tuple|2|11|optimization.tm>>
    <associate|auto-9|<tuple|2.1|11|optimization.tm>>
    <associate|equation:batch normalization|<tuple|3.3|28|depth.tm>>
    <associate|equation:capacity of data-fitting|<tuple|1.3|10|perceptron.tm>>
    <associate|equation:firth idea|<tuple|4.1|29|nlp.tm>>
    <associate|equation:gradient chain-rule|<tuple|3.2|25|depth.tm>>
    <associate|equation:gradient descent method|<tuple|2.2|12|optimization.tm>>
    <associate|equation:loss function|<tuple|2.1|11|optimization.tm>>
    <associate|equation:moving average|<tuple|2.3|12|optimization.tm>>
    <associate|equation:moving average 2|<tuple|2.4|12|optimization.tm>>
    <associate|equation:perceptron|<tuple|1.1|8|perceptron.tm>>
    <associate|equation:perceptrons|<tuple|1.2|9|perceptron.tm>>
    <associate|equation:rescale by standard
    derivation|<tuple|2.5|15|optimization.tm>>
    <associate|equation:vector representation|<tuple|4.2|30|nlp.tm>>
    <associate|footnote-1.1|<tuple|1.1|7|perceptron.tm>>
    <associate|footnote-1.2|<tuple|1.2|9|perceptron.tm>>
    <associate|footnote-1.3|<tuple|1.3|9|perceptron.tm>>
    <associate|footnote-1.4|<tuple|1.4|9|perceptron.tm>>
    <associate|footnote-1.5|<tuple|1.5|9|perceptron.tm>>
    <associate|footnote-1.6|<tuple|1.6|9|perceptron.tm>>
    <associate|footnote-1.7|<tuple|1.7|9|perceptron.tm>>
    <associate|footnote-1.8|<tuple|1.8|9|perceptron.tm>>
    <associate|footnote-2.1|<tuple|2.1|11|optimization.tm>>
    <associate|footnote-2.2|<tuple|2.2|13|optimization.tm>>
    <associate|footnote-2.3|<tuple|2.3|14|optimization.tm>>
    <associate|footnote-2.4|<tuple|2.4|16|optimization.tm>>
    <associate|footnote-2.5|<tuple|2.5|18|optimization.tm>>
    <associate|footnote-3.1|<tuple|3.1|21|depth.tm>>
    <associate|footnote-3.2|<tuple|3.2|21|depth.tm>>
    <associate|footnote-3.3|<tuple|3.3|25|depth.tm>>
    <associate|footnote-3.4|<tuple|3.4|27|depth.tm>>
    <associate|footnote-3.5|<tuple|3.5|28|depth.tm>>
    <associate|footnote-3.6|<tuple|3.6|28|depth.tm>>
    <associate|footnote-3.7|<tuple|3.7|28|depth.tm>>
    <associate|footnote-4.1|<tuple|4.1|29|nlp.tm>>
    <associate|footnote-4.2|<tuple|4.2|30|nlp.tm>>
    <associate|footnote-4.3|<tuple|4.3|31|nlp.tm>>
    <associate|footnote-4.4|<tuple|4.4|31|nlp.tm>>
    <associate|footnote-4.5|<tuple|4.5|32|nlp.tm>>
    <associate|footnr-1.1|<tuple|1.1|7|perceptron.tm>>
    <associate|footnr-1.2|<tuple|1.2|9|perceptron.tm>>
    <associate|footnr-1.3|<tuple|1.3|9|perceptron.tm>>
    <associate|footnr-1.4|<tuple|1.4|9|perceptron.tm>>
    <associate|footnr-1.5|<tuple|1.5|9|perceptron.tm>>
    <associate|footnr-1.6|<tuple|1.6|9|perceptron.tm>>
    <associate|footnr-1.7|<tuple|1.7|9|perceptron.tm>>
    <associate|footnr-1.8|<tuple|1.8|9|perceptron.tm>>
    <associate|footnr-2.1|<tuple|2.1|11|optimization.tm>>
    <associate|footnr-2.2|<tuple|2.2|13|optimization.tm>>
    <associate|footnr-2.3|<tuple|2.3|14|optimization.tm>>
    <associate|footnr-2.4|<tuple|2.4|16|optimization.tm>>
    <associate|footnr-2.5|<tuple|2.5|18|optimization.tm>>
    <associate|footnr-3.1|<tuple|3.1|21|depth.tm>>
    <associate|footnr-3.2|<tuple|3.2|21|depth.tm>>
    <associate|footnr-3.3|<tuple|3.3|25|depth.tm>>
    <associate|footnr-3.4|<tuple|3.4|27|depth.tm>>
    <associate|footnr-3.5|<tuple|3.5|28|depth.tm>>
    <associate|footnr-3.6|<tuple|3.6|28|depth.tm>>
    <associate|footnr-3.7|<tuple|3.7|28|depth.tm>>
    <associate|footnr-4.1|<tuple|4.1|29|nlp.tm>>
    <associate|footnr-4.2|<tuple|4.2|30|nlp.tm>>
    <associate|footnr-4.3|<tuple|4.3|31|nlp.tm>>
    <associate|footnr-4.4|<tuple|4.4|31|nlp.tm>>
    <associate|footnr-4.5|<tuple|4.5|32|nlp.tm>>
    <associate|part:depth.tm|<tuple|2.6.4|21>>
    <associate|part:nlp.tm|<tuple|3.8.7|29>>
    <associate|part:optimization.tm|<tuple|1.3|11>>
    <associate|part:perceptron.tm|<tuple|?|7>>
    <associate|section: Normalization|<tuple|3.7.3|26|depth.tm>>
    <associate|section: Perceptron Cannot Simulate
    XOR|<tuple|1.1|9|perceptron.tm>>
    <associate|section: Residual Structure|<tuple|3.7.1|25|depth.tm>>
    <associate|section: Simple Baseline Model|<tuple|3.5.1|23|depth.tm>>
    <associate|section: Simulation Is a Kind of
    Data-Fitting|<tuple|1.3|9|perceptron.tm>>
    <associate|section: Techniques Are Combined for Controlling the
    Gradients|<tuple|3.7|25|depth.tm>>
    <associate|section: loss function|<tuple|2.1|11|optimization.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1.1>|>
        <locus|<id|%32295BD8-35855198--6D4DEDDE>|<link|hyperlink|<id|%32295BD8-35855198--6D4DEDDE>|<url|https://en.wikipedia.org/wiki/Neuron#/media/File:Chemical_synapse_schema_cropped.jpg>>|This
        figure> illustrates the shape of a neuron, and how impulses propagate
        from one neuron to another.
      </surround>|<pageref|auto-4>>
    </associate>
    <\associate|parts>
      <tuple|perceptron.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|optimization.tm|chapter-nr|1|section-nr|3|subsection-nr|0>

      <tuple|depth.tm|chapter-nr|2|section-nr|6|subsection-nr|4>

      <tuple|nlp.tm|chapter-nr|3|section-nr|8|subsection-nr|7>
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

      1.2<space|2spc>Perceptron Should Be Used as Inter-layer
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      1.3<space|2spc>Simulation Is a Kind of Data-Fitting
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Gradient
      Based Optimization> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      2.1<space|2spc>The Objective Is the Expected Distance Between
      Prediction and Truth <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      2.2<space|2spc>Moving Average Helps Avoid Stochastic Disturbance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|2.2.1<space|2spc>Stochastic Disturbance in
      Loss Function <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|2.2.2<space|2spc>Gradient Descent Method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|2.2.3<space|2spc>Moving Average of Gradient
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|2.2.4<space|2spc>Finetune Decay Factor and
      Learning Rate <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|2.2.5<space|2spc>History and Remark
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|2.2.6<space|2spc>Implementation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      2.3<space|2spc>Gradient Direction May Not Be Optimal (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      <with|par-left|<quote|1tab>|2.3.1<space|2spc>Estimation of Gradients at
      Different Layer <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|2.3.2<space|2spc>Large Difference of
      Gradients May Slow Down Optimization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|2.3.3<space|2spc>Rescale by Standard
      Derivation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|2.3.4<space|2spc>Implementation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      2.4<space|2spc>Using the Sign of Gradient (TODO)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      <with|par-left|<quote|1tab>|2.4.1<space|2spc>History and Remark
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|2.4.2<space|2spc>Implementation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      2.5<space|2spc>Gradient Is Computed by Vector-Jacobian Product *
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      <with|par-left|<quote|1tab>|2.5.1<space|2spc>From Feed-Forward Neural
      Network to General Composition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|1tab>|2.5.2<space|2spc>Vector-Jacobian Product
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|1tab>|2.5.3<space|2spc>Forward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|2.5.4<space|2spc>Backward Propagation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      2.6<space|2spc>TODO <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      <with|par-left|<quote|1tab>|2.6.1<space|2spc>Initialization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>

      <with|par-left|<quote|1tab>|2.6.2<space|2spc>Normalized Vector-Jacobian
      Product <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1tab>|2.6.3<space|2spc>Criticality
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|1tab>|2.6.4<space|2spc>RNN: Boundary between
      Order and Chaos <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>When
      Neural Network Becomes Deep> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35><vspace|0.5fn>

      3.1<space|2spc>Enlarging Model Increases Performance
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>

      3.2<space|2spc>(TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>

      3.3<space|2spc>Draft <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      3.4<space|2spc>Enlarging Model Is Efficient for Increasing Its
      Representability (TODO) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>

      3.5<space|2spc>Increasing Depth Is More Efficient for Enlarging Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>

      <with|par-left|<quote|1tab>|3.5.1<space|2spc>Simple Baseline Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|1tab>|3.5.2<space|2spc>Increasing Depth
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1tab>|3.5.3<space|2spc>Increasing Width
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      <with|par-left|<quote|1tab>|3.5.4<space|2spc>Summary: Increasing Depth
      v.s. Increasing Width <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      3.6<space|2spc>Increasing Depth Makes It Hard to Control the Gradients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      3.7<space|2spc>Techniques Are Combined for Controlling the Gradients
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>

      <with|par-left|<quote|1tab>|3.7.1<space|2spc>Residual Structure
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>>

      <with|par-left|<quote|1tab>|3.7.2<space|2spc>Regularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>>

      <with|par-left|<quote|1tab>|3.7.3<space|2spc>Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>>

      <with|par-left|<quote|1tab>|3.7.4<space|2spc>Summary: Gradients Are
      Bounded by the Techniques Altogether
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>>

      3.8<space|2spc>A Little History about Depth
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>

      <with|par-left|<quote|1tab>|3.8.1<space|2spc>Regularization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>>

      <with|par-left|<quote|1tab>|3.8.2<space|2spc>Recurrent Neural Network
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      <with|par-left|<quote|1tab>|3.8.3<space|2spc>Long Short-Term Memory
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>>

      <with|par-left|<quote|1tab>|3.8.4<space|2spc>Highway
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>>

      <with|par-left|<quote|1tab>|3.8.5<space|2spc>Batch Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1tab>|3.8.6<space|2spc>Layer Normalization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|1tab>|3.8.7<space|2spc>Residual Neural Network
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Natural
      Language Processing> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59><vspace|0.5fn>

      4.1<space|2spc>Representation of Words
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60>

      <with|par-left|<quote|1tab>|4.1.1<space|2spc>Knowing a Word by the
      Company It Keeps <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>>

      <with|par-left|<quote|1tab>|4.1.2<space|2spc>Context-Dependent/Independent
      Vector Representation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62>>

      <with|par-left|<quote|1tab>|4.1.3<space|2spc>Example: Bidirectional
      Encoder Representations from Transformers (BERT)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63>>

      <with|par-left|<quote|1tab>|4.1.4<space|2spc>Application: Named-Entity
      Recognition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-64>>

      4.2<space|2spc>Representation of Sentences
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-65>

      <with|par-left|<quote|1tab>|4.2.1<space|2spc>From Words to Sentences:
      Firth's Idea Continued <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-66>>

      <with|par-left|<quote|1tab>|4.2.2<space|2spc>Human Languages Are
      Recursive (Maybe) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-67>>

      <with|par-left|<quote|1tab>|4.2.3<space|2spc>Application: Textual
      Similarity <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-68>>

      <with|par-left|<quote|1tab>|4.2.4<space|2spc>Application: Machine
      Translation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-69>>

      4.3<space|2spc>Language Modeling <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-70>
    </associate>
  </collection>
</auxiliary>