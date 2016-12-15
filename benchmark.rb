def my_benchmark(number_of_times)
  start = Time.now
  number_of_times.times {yield}
  stop = Time.now
  return (stop - start)
end

puts my_benchmark(10000) { puts "hi" }