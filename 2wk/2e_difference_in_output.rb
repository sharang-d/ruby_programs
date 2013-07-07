def mtdarry
  10.times do |num|
    puts num
  end
end
mtdarry
=begin
 Simply calls the method which prints:
 0
 1
 2
 3
 4
 5
 6
 7
 8
 9
=end

puts "\n\n\n"

def mtdarry2
  10.times do |num|
    puts num
  end
end
puts mtdarry2
=begin
 calls the method AND prints the return value to the console as well(because of the puts)
 The return value from the method is 10.
 Thus the output:
 0
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
=end
