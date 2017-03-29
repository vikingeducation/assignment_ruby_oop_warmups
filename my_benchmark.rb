def my_benchmark(number_of_times)
  time_before = Time.now
  number_of_times.times { yield }
  time_after = Time.now
  return time_after - time_before
end
