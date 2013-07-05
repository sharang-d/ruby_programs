y = false
z = true
x = y or z
#  Processed as (x=y) or z. Thus x = y(false)  
puts x
# puts false
(x = y) or z
# Processed as (x = y) or z as parentheses are provided. Thus x = y(false)
puts x
# puts false
x = (y or z)
# Processed just like what the statement says because of the parentheses. x =(false or true ) which makes x = true
puts x
# puts true

=begin
Output:
false
false
true
=end


