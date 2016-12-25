def my_benchmark(number_of_times)
  t0 = Time.now
  number_of_times.times { yield }
  t1 = Time.now
  t1 - t0
end

puts my_benchmark(10000) { puts "hi"}