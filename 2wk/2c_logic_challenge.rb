def conditional(condition, true_value = 'true', false_value = 'false')
  condition && true_value or false_value 
end

puts conditional(5 > 3, "yeah", "boo")
puts conditional(5 < 3, "yeah", "boo")
puts conditional(5 == 5)
