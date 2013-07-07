def conditional(condition, true_value = 'yeah', false_value = 'boo')
   condition && true_value or false_value 
end

puts conditional(5 > 3)
puts conditional(5 < 3)
puts conditional(5 == 5, "yes", "no")
