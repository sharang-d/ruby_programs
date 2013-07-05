=begin
doctest: call my_string()
>> my_string()
=> 'Hello World'
doctest: value of variable my_string
>> my_string
=> 'Hello Ruby World'
=end

def my_string
  'Hello World'
end
my_string = 'Hello Ruby World'
puts variable my_string if __FILE__ == $PROGRAM_NAME
