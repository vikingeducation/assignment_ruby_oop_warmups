def my_benchmark(num) {}
  start = Time.now
  num.times do
    yield
  end
  puts (Time.now - start)
end

my_benchmark(10000) { "hi" }
