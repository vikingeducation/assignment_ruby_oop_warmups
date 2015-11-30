=begin
  - Write a method, my_benchmark (DONE)
  - that takes a parameter (number_of_times) (DONE)
  - and a block
  - and returns how long that block took to run that block, that many times.
  - Remember, you can get the current time using Time.now
  - and you can subtract one time from another to get a duration in seconds.
=end

def my_benchmark(number_of_times)
  starting_time = Time.now
  (number_of_times).times { yield }
  Time.now - starting_time
end

puts my_benchmark(1000) {9999 ** 9999}
