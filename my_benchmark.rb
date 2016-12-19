# Write a method, my_benchmark, that takes a parameter number_of_times and a block and returns how long that block took to run that block, that many times. Remember, you can get the current time using Time.now, and you can subtract one time from another to get a duration in seconds.

def my_benchmark(counter, op_block={})
  start = Time.now

  counter.times { op_block }

  duration = Time.now - start
end

p my_benchmark(100000000) { puts "hi" }
