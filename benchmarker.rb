# Write a method, my_benchmark, that takes a parameter number_of_times and a block
# and returns how long that block took to run that block, that many times. Remember,
# you can get the current time using Time.now, and you can subtract one time from
# another to get a duration in seconds.


def my_benchmark(number_of_times)
  start_time = Time.now
    number_of_times.times { yield }
  end_time = Time.now
  p end_time - start_time
end

my_benchmark(10) { puts "hi" }
