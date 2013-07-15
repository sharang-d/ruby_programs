def add_elements(array)
  sum = 0
  array.each { |i| sum += i }
  sum
end

collection = [1, 2, 3, 4, 5] 
puts add_elements(collection)
