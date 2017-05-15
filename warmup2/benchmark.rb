# Write a method, my_benchmark, that takes a parameter number_of_times and a block
# and returns how long that block took to run that block, that many times. Remember,
# you can get the current time using Time.now, and you can subtract one time from
# another to get a duration in seconds.

def my_benchmark(iterations)
  start_time = Time.now
  (1..iterations).each do
    yield
  end
  Time.now - start_time
end



puts my_benchmark(10000) { puts "hi" }
#=> 0.056918