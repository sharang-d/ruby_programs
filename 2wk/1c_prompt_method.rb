STDOUT.sync = true
=begin
# 1
# Enter 1 for all input prompts
doctest: check data_type = false
>> prompt("Default check: ")
=> "1\n"
doctest: check data_type = 'string'
>> prompt("String check: ", 'string')
=> "1"
doctest: check data_type = 'number'
>> prompt("Number check: ", 'number')
>> 1.0
doctest: check data_type = 'character'
>> prompt("Character check: ", 'character')
=> "1"
doctest: check data_type = 'symbol'
>> prompt("Symbol check: ", 'symbol')
=> :"1"
=end

def prompt(prompt_string, data_type = false, new_line = false)
  print "#{prompt_string}#{"\n" if new_line}"
  input = gets
  if data_type
    data_type.downcase!
    input = case data_type
            when 'string'
              input.chomp
            when 'number'
              input.to_f
            when 'character'
              input.chr
            when 'symbol'
              input.chomp.to_sym
            end
  end
  input
end

if __FILE__ == $PROGRAM_NAME
  p prompt("Default check: ")
  p prompt("String check: ", 'string', true)
  p prompt("Number check: ", 'number')
  p prompt("Character check: ", 'character')
  p prompt("Symbol check: ", 'symbol')
end

=begin
# usage
a = prompt('Enter a string:', 'string', true)
b = prompt('Enter another string:', 'string', true)
puts "\nConcatenation: #{a.concat(b)}"
=end
