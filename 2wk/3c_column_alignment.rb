def add_line_number_prefixes(s)
  result = ''
  str_array = s.lines
  max_width = str_array.count.to_s.length
  str_array.each.with_index(1) { |s, i|  result << "Line %#{max_width}d: #{s}" %i }
  result
end

s = ''
for i in 1..100_000
  s << i.to_s << "\n"
end
puts add_line_number_prefixes(s)
