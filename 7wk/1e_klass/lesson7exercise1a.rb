require_relative 'lesson7exercise1'
obj = Klass.new("hello")
puts obj.say_hello

File.open('test','w') { |f| Marshal.dump(obj, f) }
puts "Object is marshalled.\n\nRestoring data from the marshalled object now."
File.open('test') { |f| @object = Marshal.load(f) }
puts @object.say_hello
