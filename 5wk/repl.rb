class Repl
  def initialize(object_to_bind_to)
   object_to_bind_to.send(:binding)
    
  end
  def run
    loop do
      begin
        print '>> '
        read = gets.strip
        break if read.casecmp('exit') == 0
        puts "=> #{eval(read) || 'nil'}" 
      rescue Exception => exception_backtrace
        puts exception_backtrace
      end
    end
  end
end

a = self.send(:binding)
my_repl = Repl.new(a)
my_repl.run
