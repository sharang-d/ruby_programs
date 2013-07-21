class Rectangle
  def initialize(width, height)
    @width = width
    @height = height
    @area = width * height 
    @perimeter = 2 * (width * height)
  end
  def area
    @area
  end
  def perimeter
    @perimeter
  end
end

r = Rectangle.new(23.45, 34.67)
puts "Area is = #{r.area}"
puts "Perimeter is = #{r.perimeter}"
