x = 10
y = 20
x, y = y, x
puts x
puts y


=begin
  Output:
  20
  10

  Explanation:
  Values of x and y get interchanged.
  Being able to make x, y = y, x work is a feature of Ruby for better/easier/convenient assignment

  eg:
  a = 1 
  b = 2
  c = 3
  a, b, c = b, c, a
  puts a, b, c

  Will output:
  2
  3
  1
=end


