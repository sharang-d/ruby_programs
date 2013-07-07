puts expand = defined?( expand ) ? expand : true

=begin
  let's break this down
  ..
  expand = if defined?(expand)
             expand
           else
             true
           end
  puts expand
  ..

  defined? is an operator 
  which IN THIS case would have returned a non-nil value('local-variable' mostly) had expand been defined before in the code.
  Since it is not, the if block will evaluate to true.
  but now there's a rule with reference to defined? that says: 
  "Assignment to a local variable will, however, have the result of initializing the variable to nil by virtue of the assignment expression itself"
  (From ruby-doc)
  Hence the output which is nil.



  Sources:
  * http://www.ruby-doc.org/docs/ProgrammingRuby/tut_expressions.html#definedandorandnot
  * http://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-defined-3F
=end


