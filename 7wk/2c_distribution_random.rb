h = Hash.new(0)
100_000.times do
  number = (rand - rand) * 10.0
  #one_decimal_place = (number.abs == number ? number.floor : number.ceil) / 10.0
  one_decimal_place = number.round / 10.0
  h[one_decimal_place] += 1
end

puts "\n  Number #{' ' * 30}Relative Frequency#{' ' * 30}Actual Frequency\n#{'-' * 103}" 
divisor = h.values.max / 80.0
h.sort.each do |k,v|
  rel_freq = v / divisor
  stars = "#{'*' * rel_freq}#{' ' * (80 - rel_freq.floor)}"
  puts "%7s: #{stars} %10s" %[k,v]
end
