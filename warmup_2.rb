def my_benchmark(number_of_times)
  start_time = Time.now 
  number_of_times.times { yield }
  end_time = Time.now 
  end_time - start_time
end