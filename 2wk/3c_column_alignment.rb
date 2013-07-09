def add_line_number_prefixes(s)
  str_array = s.lines
  max_width = str_array.count.to_s.length
  str_array.map.with_index(1) { |s, i|  "Line %#{max_width}d: #{s}" % i }.join
end

s = ''
for i in 1..100_000
  s << i.to_s << "\n"
end
print add_line_number_prefixes(s)
