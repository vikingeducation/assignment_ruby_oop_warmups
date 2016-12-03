def my_benchmark(number_of_times, &block)
  start_time = Time.now
  number_of_times.times {|i| yield }
  Time.now - start_time
end

puts my_benchmark(999) { 314010932 - 1 }