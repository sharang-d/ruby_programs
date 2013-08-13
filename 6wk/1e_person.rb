class Person
  def initialize(name = 'Anonymous', bal = 0)
    @name = name
    @balance = bal
  end
  attr_reader :balance
end

p = Person.new('Number one', 100)
puts p.balance
