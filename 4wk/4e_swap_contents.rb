require 'fileutils'
require 'tempfile'

def swap a, b
  a, b = File.absolute_path(a), File.absolute_path(b)
  temp = Tempfile.new(File.basename(a))
  temp.close
  temp = temp.path
  FileUtils.mv(b, temp)
  FileUtils.mv(a, b)
  FileUtils.mv(temp, a)
end

a, b = ARGV
swap a, b
