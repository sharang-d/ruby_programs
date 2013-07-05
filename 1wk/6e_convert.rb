=begin
doctest: convert -40
>> convert(-40)
=> -40
doctest: convert(98)
>> convert( 98).round(2)
=> 36.67
=end
def convert(deg_f)
  ((deg_f.to_f-32)*5)/9
end

if __FILE__ == $PROGRAM_NAME 
  temp_in_f  = 32
  temp_in_c = convert(temp_in_f)
  print "#{temp_in_f} Fahrenheit = %.2f"  %temp_in_c, " Celsius\n	"
end
