loop do
  begin
    print '>> '
    read = gets.strip
    break if read.casecmp('exit') == 0
    puts "=> #{eval(read) || 'nil'}" 
  rescue Exception => eeeeeeeeeeeeeeeeeeee
    puts eeeeeeeeeeeeeeeeeeee
  end
end
