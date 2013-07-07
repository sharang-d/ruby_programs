def conditional_print(condition, print_if, print_else)
  (condition && print_if or print_else)
end

puts conditional_print(5 > 3, "yeah", "boo")
puts conditional_print(5 < 3, "yeah", "boo")
puts conditional_print(5 == 5, "yes", "no")
