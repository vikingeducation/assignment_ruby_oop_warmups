def my_benchmark(iterations)
  start = Time.now
  iterations.times { yield }
  stop = Time.now - start
end

p my_benchmark(10000) { puts "hi" }