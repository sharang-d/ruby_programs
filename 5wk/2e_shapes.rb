class Shape
  attr_accessor :options

  def  initialize( options = {} )
    shape_name = self.class.to_s
    defaults = { name: shape_name, rotate_point: [0, 0], audio_file: shape_name.downcase, extension: 'aif' }
    @options = defaults.merge(options)
  end

  def play_audio
    puts "Playing file #{@options[:audio_file]}.#{@options[:extension]}"
  end

  def rotate
    puts "Rotating #{@options[:name]} around point #{@options[:rotate_point]}.."
  end

  def on_click
    rotate
    play_audio
  end
end

class Square < Shape
end

class Circle < Shape
end

class Triangle < Shape
end

class Amoeba < Shape
  def initialize
    super( audio_file: 'path_to_amoeba', extension: 'hif', rotate_point: [100, 10])
  end
end

[Square.new, Circle.new ,Triangle.new, Amoeba.new].each {|obj| obj.on_click}
