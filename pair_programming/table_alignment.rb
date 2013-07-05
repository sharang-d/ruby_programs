def multiplication_table (number, heading = false, decorate = false)
  col_width = (number * number).to_s.length
  if number == 0 || number == 1
    ## added special case for 0x0, 1x1
    @decoration_width = 3
  else
    @decoration_width = number.to_s.length +  ((number - 1) * col_width) + number + 1
  end
  @table = ''
  if heading
    @table << ' ' * ((@decoration_width / 2) - heading.length / 2) if @decoration_width > heading.length
    @table << heading + "\n"
  end
  decorate(decorate)
  table(number)
  decorate(decorate)
  @table
end
  def decorate(boolean)
   @table << '=' * @decoration_width + "\n"  if boolean
  end
  def table(num)
    if num == 0 || num == 1
      ## added special case for 0x0, 1x1
      @table << " #{num} \n"
    else
      for i in 1..num
        @table << " %#{num.to_s.length}d " %i     
        (i+i).step(i * num, i) { |i| @table << "%#{@col_width}d " %i }
        @table << "\n"
      end
    end
  end
  table1 = multiplication_table 5, 'abcd', true
  table2 = multiplication_table 10, 'Multiplication tables upto 10', true
  table3 = multiplication_table 1, 'one', true
  table4 = multiplication_table 0, 'zero', true
  puts table1
  puts
  puts table2
  puts
  puts table3
  puts
  puts table4
