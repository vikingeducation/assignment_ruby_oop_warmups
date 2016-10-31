def my_benchmark(num_of_times)
  start_time = Time.now

  num_of_times.times do
    yield
  end

  run_time = start_time - Time.now
end

my_benchmark(10000) { puts "hi" }