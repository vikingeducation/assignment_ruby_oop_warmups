def my_benchmark(number_of_times, &block)
  start_time = Time.now
  
  number_of_times.times do 
    yield
  end

  finish_time = Time.now

  finish_time - start_time

end

p my_benchmark(100) {"hello world"}