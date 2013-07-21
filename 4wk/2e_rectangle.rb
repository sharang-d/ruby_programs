class Rectangle
  attr_reader(:perimeter, :area)
  def initialize(width = 0, height = 0)
    @perimeter = 2 * (width + height)
    @area =  width * height
  end 
end

r = Rectangle.new(23.45, 34.67)
puts "Area is = #{r.area}"
puts "Perimeter is = #{r.perimeter}"
