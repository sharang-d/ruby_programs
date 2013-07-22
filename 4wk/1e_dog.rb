class Dog
  attr_reader :name
  def initialize name = 'Anonymous'
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
end

d = Dog.new('Danny')
puts "The dog's name is #{d.name}"
puts d.bark
puts d.eat
puts d.chase_cat
