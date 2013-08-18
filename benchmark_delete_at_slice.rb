require 'benchmark'

array_size = 1000
iterations = 10000

Benchmark.bmbm do |x|
  x.report('slice!') { iterations.times { (1..array_size).to_a.slice!(20)}}
  x.report('delete_at') { iterations.times { (1..array_size).to_a.delete_at(20)} }
end
