class Dog
  def initialize name
    @name = name
  end
  def bark
    'woof! woof!'
  end
  def eat
    'chomp chomp slurp slurp'
  end
  def chase_cat
    'vrooom!'
  end
  def teach_trick(method_name, &block) 
    block_given? && define_singleton_method(method_name, &block)
  end
  def method_missing(m, *args, &block)  
    "#{@name} doesn't know how to #{m}!"
  end
  attr_reader :name
end

d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.dance
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.poo
puts

d2 = Dog.new('Fido')
puts d2.dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
puts d2.laugh
puts d.laugh
puts

d3 = Dog.new('Stimpy')
puts d3.dance
puts d3.laugh
