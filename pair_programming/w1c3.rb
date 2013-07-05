def multiplication_table (number, heading = false, decorate = false)
  column_width(number)
  heading(heading)
  decorate(decorate)
  table(number)
  decorate(decorate)
end

private
def column_width(number)
  @col_width = (number * number).to_s.length
  if number == 0 || number == 1
    @decoration_width = 3
  else
    @decoration_width = number.to_s.length +  ((number - 1) * @col_width) + number + 1
  end
end

def decorate(boolean)
  @table << '=' * @decoration_width + "\n" if boolean  
end

def table(num)
  if num == 0 || num == 1
    @table << " #{num} \n"
  else
    for i in 1..num
      @table << " %#{num.to_s.length}d " %i     
      (i+i).step(i * num, i) { |i| @table << "%#{@col_width}d " %i }
      @table << "\n"
    end
  end 
end

def heading(heading)
  @table = ''
  if heading
    @table << ' ' * ((@decoration_width / 2) - heading.length / 2) if @decoration_width > heading.length
    @table << heading + "\n"
  end
end

if __FILE__ == $PROGRAM_NAME
  [ [5, 'abc', true],
    [10, 'Multiplication tables upto 10', true],
    [1, 'one', true],
    [0, 'zero', true]
  ].each do |parameters|
    puts multiplication_table(*parameters)
  end
end


