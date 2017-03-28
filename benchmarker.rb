def my_benchmark(number_of_times)
  #takes a number of times to run a block
  #returns how long it took to run that block that many times
  start_time = Time.now
  number_of_times.times do
    yield
  end
  end_time = Time.now
  total_time = (end_time - start_time) * 60
  print total_time
end

my_benchmark(100) {puts "Hello there"}
