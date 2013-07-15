=begin
doctest: s = '1=2'
>> split_string('1=2')
=> ['1','2']
doctest: s = '=2'
>> split_string('=2')
=> ['','2']
doctest: s = '1='
>> split_string('1=')
=> ['1','']
doctest: s = '12'
>> split_string('12')
=> nil
doctest: s = '='
>> split_string('=')
=> ['','']
=end

def split_string(s)
  if s.include?('=') 
    position = s.index('=')
    s1 = s2 = ''
    position == 0 || s1 = s[0..(position - 1)]
    s2 = s[(position + 1)..s.size]
    [s1, s2]
  else
    nil
  end
end

if __FILE__ == $PROGRAM_NAME
  s1, s2 = split_string('key=value')
  puts "s1 = #{s1}\ns2 = #{s2}"
end
