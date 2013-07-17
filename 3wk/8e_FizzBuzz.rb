numbers = (1..100).to_a
numbers.each_with_index do |number,index|
  result = ''
  number % 3 == 0 && result.concat('Fizz')
  number % 5 == 0 && result.concat('Buzz')
  result == '' || numbers[index] = result
end

p numbers
