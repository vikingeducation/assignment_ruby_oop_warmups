def my_benchmark(num_times)
  time = Time.now
  num_times.times do
    yield
  end
  Time.now - time
end

puts my_benchmark(1000) { puts "Hi!" }