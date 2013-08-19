h = Hash.new(0)
100_000.times do
  number = (rand - rand) * 10.0
  one_decimal_place = (number.abs == number ? number.floor : number.ceil) / 10.0
  h[one_decimal_place] += 1
end

freq = {}
h.sort.each { |k,v| freq[k] = v }
puts "\n  Number #{' ' * 16}Relative Frequency#{' ' * 16}Actual Frequency"
puts '-' * 75 
divisor = freq.values.max / 50.0
freq.each do |k,v|
  rel_freq = v / divisor
  stars = "#{'*' * rel_freq}#{' ' * (50 - rel_freq.floor)}"
  puts "%7s: #{stars} %10s" %[k,v]
end
