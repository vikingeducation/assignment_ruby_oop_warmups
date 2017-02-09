def my_benchmark(number_of_times)
  time_start = Time.now
  number_of_times.times do
    yield
  end
  time_end = Time.now
  time_end - time_start
end

