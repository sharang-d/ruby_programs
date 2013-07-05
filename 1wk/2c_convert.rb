# encoding: ISO-8859-1
STDOUT.sync = true
# encoding: ISO-8859-1
STDOUT.sync = true
def is_not_a_number?(value)
  false if Float(value) rescue true
end
def display_temperature_scales(temperature_scales)
  temperature_scales.each { |k, v| puts "#{k}: #{v}" }
end
def celsius_to_any(value, unit)
  case unit
  when "Â°Celsius"
    value
  when "Â°Fahrenheit"
    ((value * 9) / 5) + 32
  when "Kelvin"
    value + 273.15
  when "Â°Rankine"
    ((value + 273.15) * 9) / 5
  when "Â°Delisle"
    ((100 - value) * 3) /2
  when "Â°RÃ©aumur"
    (value * 4) / 5
  when "Â°RÃ¸mer"
    ((value * 21)/40) + 7.5
  when "Â°Newton"
    (value * 33) / 100
  else
    nil
  end 
end
def any_to_celsius(value, unit)
  case unit
  when "Â°Celsius"
    value
  when "Â°Fahrenheit"
    ((value - 32) * 5) / 9
  when "Kelvin"
    value - 273.15
  when "Â°Rankine"
    ((value - 491.67) * 5) / 9
  when "Â°Delisle"
    100 - ((value * 2) / 3)
  when "Â°RÃ©aumur"
    (value * 5) / 4
  when "Â°RÃ¸mer"
    ((value - 7.5) * 40)/21
  when "Â°Newton"
    (value * 100) / 33
  else
    nil
  end
end
def perform_conversion(val, unit_from, unit_to)
  val = val.to_f
  celsius_to_any(any_to_celsius(val,unit_from),unit_to)
end
temperature_scales = {"a" => "Â°Celsius", "b" => "Â°Fahrenheit", "c" => "Kelvin", "d" => "Â°Rankine", "e" => "Â°Delisle", "f" => "Â°RÃ©aumur", "g" => "Â°RÃ¸mer", "h" => "Â°Newton"}
print "Enter temperature without unit(temperature scale)
[Examples: 10, -982.32, 0.01, 1.2346e-5, etc.]: "
user_value = gets.chomp
if user_value == nil || is_not_a_number?(user_value)
  puts "That's not a number!"
  exit
end
puts "\nWhat is the unit of the temperature that you just entered?"
display_temperature_scales(temperature_scales)
print "Enter a for Â°Celsius, b for Â°Fahrenheit, etc.
Your choice: "
unless user_unit_from = temperature_scales[gets.chomp.strip.downcase]
  puts "Invalid Selection!"
  exit
end
puts "\nWhat is the unit of the temperature that you want to convert the entered temperature to?"
display_temperature_scales(temperature_scales)
print "Enter a for Â°Celsius, b for Â°Fahrenheit, etc.
Your choice: "
unless user_unit_to = temperature_scales[gets.chomp.strip.downcase]
  puts "Invalid Selection!"
  exit
end
result_value = perform_conversion(user_value, user_unit_from, user_unit_to)
unless result_value
  puts "\nInvalid input"
else
  printf("\n%g %s = %g %s\n", user_value.to_f, user_unit_from, result_value, user_unit_to)
enddef is_not_a_number?(value)
  false if Float(value) rescue true
end
