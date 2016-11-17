def my_benchmark(num_of_times)
  start_time = Time.now

  # Ask about no side effects
  num_of_times.times do
    yield
  end

  run_time = Time.now - start_time
end