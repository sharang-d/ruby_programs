require_relative '2e_dtr_converter'
class DTRConvertor
  def convert(dollar_amount)
    dollar_amount * 61.65 # As of 18-Aug-2013
  end
end
m = DTRConvertor.new
puts m.convert(100.0)
