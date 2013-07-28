class Shape
  attr_accessor(:rotate_point, :audio_file_path)
  def  initialize(sn, rp, ap)
    @rotate_point = rp
    @shape_name = sn
    @audio_file_path = ap 
  end
  def play_audio
    puts "Playing file #{@audio_file_path}"
  end

  def rotate
    puts "Rotating #{@shape_name} around point #{@rotate_point}.."
  end

  def on_click
    rotate
    play_audio
  end
end

class Square < Shape
  def initialize
    @rotate_point = [0,0] # can be calculated and changed later
    @shape_name = self.class.to_s
    @audio_file_path = 'path_to_square.aif'
  end
end

class Circle < Shape
  def initialize
    @rotate_point = [0, 0]
    @shape_name = self.class.to_s
    @audio_file_path = 'path_to_circle.aif'
  end
end

class Triangle < Shape
  def initialize
    @rotate_point = [0, 0]
    @shape_name = self.class.to_s
    @audio_file_path = 'path_to_circle.aif'
  end
end

class Amoeba < Shape
  def initialize
    @rotate_point = [100, 10]
    @shape_name = self.class.to_s
    @audio_file_path = 'path_to_amoeba.aif'
  end
end

[Square.new, Circle.new ,Triangle.new, Amoeba.new].each {|obj| obj.on_click}
