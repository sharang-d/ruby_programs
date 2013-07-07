def prompt(prompt_string)
  print prompt_string
  return gets.chomp # I can't think of any scenario where we would want the CR
end

puts "Addition of two numbers"
a = prompt("Enter number a: ").to_f
b = prompt("Enter number b: ").to_f
puts "#{a} + #{b} = #{a+b}"
