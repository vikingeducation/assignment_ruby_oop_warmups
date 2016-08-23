def my_benchmark(number_of_times)
  start = Time.now
  number_of_times.times {yield}
  elapsed = Time.now - start
end