require 'time'
require 'pry'

def my_benchmark number_of_times
  begin_time = Time.now
  number_of_times.times { yield }
  end_time = Time.now
  binding.pry
  (begin_time - end_time) / number_of_times
end

puts my_benchmark(100) {rand(100)}
