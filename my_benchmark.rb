def my_benchmark(number_of_times)
  start_time = Time.now
  number_of_times.times do
    yield
  end
  finish_time = Time.now.to_f
  finish_time - start_time.to_f
end


my_benchmark(10000) { puts "hi" }