def my_benchmark(num)
  start = Time.now
  num.times do
    yield
  end
  Time.now - start
end
