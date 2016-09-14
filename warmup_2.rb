# Benchmarker
# my_benchmark(number_of_times) { puts 'hello world' }
# return time the block took to run x number of times
#

def my_benchmark(number, &block)
  start_time = Time.now
  number.times do
    block.call
  end
  duration = Time.now - start_time
  puts "Benchmark results: #{duration} seconds"
end

my_benchmark(100) { puts "Hello world" }
