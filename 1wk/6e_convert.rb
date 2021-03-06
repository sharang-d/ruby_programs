# doctest: convert -40
# >> convert(-40)
# => -40
# doctest: convert 98
# >> convert( 98).round(2)
# => 36.67
# doctest: convert 98.6
# >> convert 98.6
# => 37.0

def convert(deg_f)
  (deg_f.to_f - 32) * 5 / 9
end

if __FILE__ == $PROGRAM_NAME
  temp_in_f  = 98
  temp_in_c = convert(temp_in_f)
  puts "#{temp_in_f} Fahrenheit = %<celsius>.2f Celsius." %  {:celsius =>  temp_in_c}
end
