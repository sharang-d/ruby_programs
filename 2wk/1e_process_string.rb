s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
s.each_line.with_index(1) { |s, i| puts "Line #{i}: #{s}" }
