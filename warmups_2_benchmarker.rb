def my_benchmark(number_of_times)
  puts start = Time.now
  number_of_times.times { yield }
  puts finish = Time.now
  duration = finish - start
end