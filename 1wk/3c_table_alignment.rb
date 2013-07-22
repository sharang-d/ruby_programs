def multiplication_table (num, heading = false, decorate = false)
  col_width = (num * num).to_s.length
  if num == 0  
    decoration_width = 3 
  else
    decoration_width = (num * col_width) + num + 1
  end
  @str = ''
  heading(heading, decoration_width)
  decorate(decorate, decoration_width)
  num == 0 ? @str << " #{num} \n" : numeric_table(num, col_width)
  decorate(decorate, decoration_width)
  @str
end

private
def numeric_table(num, col_width)
  for i in 1..num
    @str << ' '
    i.step(i * num, i) { |i| @str << "%#{col_width}d " % i }
    @str << "\n"
  end
end

def heading(heading, decoration_width)
  @str << ' ' * ((decoration_width / 2) - heading.length / 2) if decoration_width > heading.length
  @str << heading + "\n"
end

def decorate(decorate, decoration_width)
  @str << '=' * decoration_width + "\n" if decorate
end

tables = [
  [5, 'abc', true],
  [ 10, 'Multiplication tables upto 10', true],
  [1, 'one', true], 
  [0, 'zero', true]
]
tables.each do |parameters|
  puts multiplication_table(*parameters)
end
