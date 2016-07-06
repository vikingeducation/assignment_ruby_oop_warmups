def my_benchmark(num_of_times)
  start_time = Time.now
  num_of_times.times { yield }
  Time.now - start_time
end
