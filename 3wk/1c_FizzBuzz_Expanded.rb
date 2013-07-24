def divisibility
  numbers = (1..20790).to_a
  numbers.each_with_index do |number,index|
    result = ''
    hash = {3 => 'Fizz', 5 => 'Buzz', 7 => 'Dazz', 11 => 'Kezz'}
    block_given? && hash = hash.merge(yield) 
    # overwrites above specified defaults if duplicate keys are specified in the hash inside the block
    hash.each {|divisor, text| number % divisor == 0 && result << text}
    result == '' || numbers[index] = result
  end
  numbers
end

p divisibility {{3 => 'Three',2 => 'Two', 9 => 'Nine'}}
# pass a hash into the block with key = divisor and value = text to be displayed if divisible

