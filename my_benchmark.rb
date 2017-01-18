#runs a block num_times and then returns the elapsed running time

def my_benchmark(num_times)
  start_time = Time.now
  num_times.times {yield}
  Time.now - start_time
end

p my_benchmark(10000) { puts "hi" }
