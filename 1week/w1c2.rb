# encoding: ISO-8859-1
STDOUT.sync = true

def perform_conversion(val, unit_from, unit_to)
  val = val.to_f
  celsius_to_any(any_to_celsius(val,unit_from),unit_to)
end

private
def show_usage(flag)
  puts "\nNumeric value required. Valid examples of temperature are: 0, 1.2, -0.002, 1.5e+5, -0.45e-7" if flag == 0
  puts "\nSingle character input required. Acceptable (case insensitve) inputs are: a, b, c, d, e, f, g, h" if flag == 1
  puts "Exiting Program."
  exit 1
end

def is_not_a_number?(value)
  false if Float(value) rescue true
end

def display_temperature_scales(temperature_scales)
  temperature_scales.each { |k, v| puts "#{k}: #{v}" }
end

def celsius_to_any(value, unit)
  case unit
  when "°Celsius"
    value
  when "°Fahrenheit"
    ((value * 9) / 5) + 32
  when "Kelvin"
    value + 273.15
  when "°Rankine"
    ((value + 273.15) * 9) / 5
  when "°Delisle"
    ((100 - value) * 3) /2
  when "°Réaumur"
    (value * 4) / 5
  when "°Rømer"
    ((value * 21)/40) + 7.5
  when "°Newton"
    (value * 33) / 100
  else
    nil
  end 
end

def any_to_celsius(value, unit)
  case unit
  when "°Celsius"
    value
  when "°Fahrenheit"
    ((value - 32) * 5) / 9
  when "Kelvin"
    value - 273.15
  when "°Rankine"
    ((value - 491.67) * 5) / 9
  when "°Delisle"
    100 - ((value * 2) / 3)
  when "°Réaumur"
    (value * 5) / 4
  when "°Rømer"
    ((value - 7.5) * 40)/21
  when "°Newton"
    (value * 100) / 33
  else
    nil
  end
end


temperature_scales = {"a" => "°Celsius", "b" => "°Fahrenheit", "c" => "Kelvin", "d" => "°Rankine", "e" => "°Delisle", "f" => "°Réaumur", "g" => "°Rømer", "h" => "°Newton"}
chance = 1

print "Enter temperature without unit(temperature scale)
[Examples: 10, -982.32, 0.01, 1.2346e-5, etc.]: "
while chance <= 3 do
  print " Try again: "if chance > 1
  user_value = gets.chomp
  if user_value == nil || is_not_a_number?(user_value)
    print "That's not a number!"
  else
    break
  end
  chance += 1
end
chance == 4 ? show_usage(0) : chance = 1

puts "\nWhat is the unit of the temperature that you just entered?"
display_temperature_scales(temperature_scales)
print "Enter a for °Celsius, b for °Fahrenheit, etc.
Your choice: "
while chance <= 3 do
  print " Try again: " if chance > 1
  unless user_unit_from = temperature_scales[gets.chomp.strip.downcase]
    print "Invalid Selection!"
  else
    break
  end
  chance += 1
end
chance == 4 ? show_usage(1) : chance = 1

puts "\nWhat is the unit of the temperature that you want to convert the entered temperature to?"
display_temperature_scales(temperature_scales)
print "Enter a for °Celsius, b for °Fahrenheit, etc.
Your choice: "
while chance <=3 do
  print " Try again: " if chance > 1
  unless user_unit_to = temperature_scales[gets.chomp.strip.downcase]
    print "Invalid Selection!"
  else
    break
  end
  chance += 1
end
show_usage(1) if chance == 4 

result_value = perform_conversion(user_value, user_unit_from, user_unit_to) 
unless result_value
  puts "\nInvalid input"
else
  printf("\n%g %s = %g %s\n", user_value.to_f, user_unit_from, result_value, user_unit_to)
end
