h = Hash.new(0)
100_000.times do
  r1 = rand(-1.0..1.0)
  r2 = rand(-1.0..1.0)
  number = (r1 - r2) * 10.0
  one_decimal_place = (number.abs == number ? number.floor : number.ceil) / 10.0
  h[one_decimal_place] += 1
end

h.sort.each { |k,v| puts "Number of occurrences of #{k}: #{v}" }
