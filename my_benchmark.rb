def my_benchmark(number_of_times) 
  start_time = Time.now
  number_of_times.times do 
    yield
  end
  puts Time.now - start_time
end

my_benchmark(10000) { puts "hi" }