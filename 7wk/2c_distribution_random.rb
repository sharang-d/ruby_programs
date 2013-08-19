h = Hash.new(0)
100_000.times do
  number = (rand - rand) * 10.0
  #one_decimal_place = (number.abs == number ? number.floor : number.ceil) / 10.0
  one_decimal_place = number.round / 10.0
  h[one_decimal_place] += 1
end

freq = {}
h.sort.each { |k,v| freq[k] = v }
puts "\n  Number #{' ' * 30}Relative Frequency#{' ' * 30}Actual Frequency"
puts '-' * 103 
divisor = freq.values.max / 80.0
freq.each do |k,v|
  rel_freq = v / divisor
  stars = "#{'*' * rel_freq}#{' ' * (80 - rel_freq.floor)}"
  puts "%7s: #{stars} %10s" %[k,v]
end
