def my_benchmark(number)
  start_time = Time.now
  number.times do
    yield
  end
  Time.now - start_time
end
