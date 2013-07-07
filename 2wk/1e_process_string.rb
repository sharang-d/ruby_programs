s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
str_array = s.each_line
#str_array.count.times { |i| puts "Line #{i+1}: #{str_array[i]}" }
str_array.each.with_index(1) { |s,i| puts "Line #{i}: #{s}"}
